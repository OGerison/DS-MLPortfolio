#Importing required Libraries
import datetime

#Capturing Required Information
print("*" * 110)
print("\t")
store_name = input("Enter your shop Name: ")
store_location = input("Enter your shop Location: ")
store_contact = input("Enter shop Contact: ")
store_cashier = input("Enter Cashier name: ")

#Capturing Today's Date from the Imported Library
now = datetime.datetime.now()
date_time = now.strftime("%Y-%m-%d              %H:%M:%S")
print(date_time)

#Product Name and Price
print("\t")
p1_name, p1_price = "sgm spaghetti sauce", 4.99
p2_name, p2_price = "sgm spaghetti pasta", 1.99
p3_name, p3_price = "mrchn inst lunch", 0.96
p4_name, p4_price = "ee coffee french rst", 5.96
p5_name, p5_price = "sgm evrdy pnt btr", 1.99
p6_name, p6_price = "cub white bread", 1.99
p7_name, p7_price = "par white bread", 4.99
item_sold = 7

# Calculate Sub Total
sub_total = p1_price + p2_price + p3_price + p4_price + p5_price + p6_price + p7_price

# Calculate Food Tax
food_tax = (sub_total * 0.06)

grand_total = sub_total + food_tax

# Message
return_message = "No returns on meat, product and milk products."
appreciation_message = "Thank you for your business !!"
print("*" * 110)
print(f"Welcome To {store_name.title()}")
print(f"Store Location: {store_location}")
print(f"Phone Number: {store_contact}")
print("=" * 110)
print(f"Cashier: {store_cashier}")
print(f"{date_time[0:10]}\t\t\t\t\t\t\t\t{date_time[10:]}")
print("=" * 110)
print("GROCERY")
print('')
print(f"{p1_name.upper()}\t\t\t\t\t\t\t{p1_price}")
print(f"{p2_name.upper()}\t\t\t\t\t\t\t{p2_price}")
print(f"{p3_name.upper()}\t\t\t\t\t\t\t{p3_price}")
print(f"{p4_name.upper()}\t\t\t\t\t\t\t{p4_price}")
print(f"{p5_name.upper()}\t\t\t\t\t\t\t{p5_price}")
print(f"{p6_name.upper()}\t\t\t\t\t\t\t\t{p6_price}")
print(f"{p7_name.upper()}\t\t\t\t\t\t\t\t{p7_price}")
print('')
print("=" * 110)
print(f"Subtotal[$]\t\t\t\t\t\t\t\t{sub_total:.2f}")
print(f"Food Tax(6%)[$]\t\t\t\t\t\t\t\t{food_tax:.2f}")
print(f"GRAND TOTAL[$]\t\t\t\t\t\t\t\t{grand_total:.2f}")
print("=" * 110)
print('')
print(f"TOTAL NUMBER OF ITEM SOLD \t\t\t\t\t\t{item_sold}")
print('')
print('')
# Display Message
print(f"\t{return_message}")
print(f"\t\t{appreciation_message}")
print("*" * 110)