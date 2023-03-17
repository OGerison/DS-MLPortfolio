USE PortfolioProjectDB

SELECT * FROM fifa21

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'fifa21'

-- 1. Dropping Unnecessary Columns
ALTER TABLE fifa21
DROP Column photoUrl, playerUrl, Name, Positions

-- 2. Alter Hits column values
-- Find values that are different in the Hits Column
SELECT Hits FROM fifa21
WHERE Hits Like '%K'

UPDATE fifa21
SET Hits = 
    CASE 
        WHEN Hits LIKE '%K' THEN CAST(SUBSTRING(Hits, 1, LEN(Hits)-1) AS DECIMAL(10,2)) * 1000
        ELSE CAST(Hits AS DECIMAL(10,0))
    END

-- Remove the decimal points in the Hits Column
UPDATE fifa21
SET Hits = ROUND(Hits, 0)

SELECT Hits FROM fifa21

-- 3. Split Contract Column

ALTER TABLE fifa21
ADD ContractStart VARCHAR(50);
UPDATE fifa21
SET ContractStart = Contract;

UPDATE fifa21
SET ContractStart = LEFT(ContractStart, 4) 
SELECT ContractStart from fifa21

-----------------------

ALTER TABLE fifa21
ADD ContractEnd VARCHAR(50);
UPDATE fifa21
SET ContractEnd = Contract;

UPDATE fifa21
SET ContractEnd = RIGHT(ContractEnd, 4) 
SELECT ContractEnd from fifa21

--4. Change currency values by removing m,k and euro symbol

UPDATE fifa21
SET Wage = CAST(REPLACE(REPLACE(Wage, '€', ''), 'K', '') AS INT) * 1000
SELECT Wage FROM fifa21

UPDATE fifa21
SET Value = CAST(REPLACE(REPLACE(Value, '€', ''), 'M', '') AS DECIMAL(10,0)) * 1000000
WHERE Value LIKE '€%M'
SELECT Value FROM fifa21

UPDATE fifa21
SET Release_Clause = CAST(REPLACE(REPLACE(Release_Clause, '€', ''), 'M', '') AS DECIMAL(10,0)) * 1000000
WHERE Release_Clause LIKE '€%M'
SELECT Release_Clause FROM fifa21

--5. Removing cm,kg

UPDATE fifa21
SET Height = 
    CASE 
        WHEN Height LIKE '%''%"' THEN 
            TRY_CONVERT(DECIMAL(10,2), SUBSTRING(Height, 1, CHARINDEX('''', Height)-1))*30.48 + 
            TRY_CONVERT(DECIMAL(10,2), SUBSTRING(Height, CHARINDEX('''', Height)+1, LEN(Height)-CHARINDEX('''', Height)-1))*2.54 
        WHEN Height LIKE '%"' THEN TRY_CONVERT(DECIMAL(10,2), SUBSTRING(Height, 1, LEN(Height) - 2)) * 2.54 
        ELSE TRY_CONVERT(DECIMAL(10,2), SUBSTRING(Height, 1, LEN(Height) - 2)) 
    END;

UPDATE fifa21
SET Height = ROUND(Height, 0)

SELECT Height from fifa21

UPDATE fifa21
SET Weight = 
    CASE 
        WHEN Weight LIKE '%lbs' THEN 
            TRY_CONVERT(DECIMAL(10,2), SUBSTRING(Weight, 1, CHARINDEX('lbs', Weight)-1))*0.45359237
        ELSE 
            CASE 
                WHEN Weight LIKE '%kg' THEN 
                    TRY_CONVERT(DECIMAL(10,2), SUBSTRING(Weight, 1, CHARINDEX('kg', Weight)-1))
                ELSE 
                    TRY_CONVERT(DECIMAL(10,2), Weight)
            END
    END;

UPDATE fifa21
SET Weight = ROUND(weight, 0)

SELECT Weight from fifa21 

--6. Remove stars from w_f,sm,ir

UPDATE fifa21
SET W_F = LEFT(W_F, 1)
SELECT W_F from fifa21

UPDATE fifa21
SET SM = LEFT(SM, 1) 
SELECT SM from fifa21

UPDATE fifa21
SET IR = LEFT(IR, 1) 
SELECT IR from fifa21

-- 7. Update the Age Column to reflect 2023 Age

UPDATE fifa21
SET Age = Age - 2

EXEC sp_rename 'fifa21.Age', 'CurrentAge', 'COLUMN';

SELECT * FROM fifa21