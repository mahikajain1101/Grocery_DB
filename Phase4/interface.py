import subprocess as sp
import pymysql
import pymysql.cursors
from datetime import datetime

# supply time removed
# company removed from supplier and product


def DeleteItem():
    """
    Function to implement option 1
    """

    try:
        # Takes emplyee details as input
        row = {}
        print("To delete the items from the inventory that got expired : ")
        query = "select * from PRODUCT where expiryDate <= (SELECT CURDATE())";

        cur.execute(query)
        print('\n')
        print('Tuples removed:-')

        print('\n')
        rows = cur.fetchall()
        for row in rows:
            for col in row:
                print(col, end=' ')
            break
        print()
        for row in rows:
            for col in row:
                print(row[col], end=' ')
            print()
        print('\n')
        
        query2 = "delete from INVENTORY as i where i.ProductID in (select ProductID from PRODUCT where ExpiryDate <= (SELECT CURDATE()))"
        cur.execute(query2)
        print(query2)

        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def UpdateSalaryBonus():
    try:
        row = {}
        print("Providing the employees with a salary increase: ")
        row["salary_hike"] = int(input("Percentage increase in salary: "))
        row["JobType"] = input("Mention the JobType of the employee: ")
        row["StoreID"] = int(input("ID of the store whose employee gets a salary increment: "))

        query = "UPDATE EMPLOYEE SET SALARY = SALARY + (SALARY*%d/100) WHERE JobType = '%s' AND StoreID = %d" %(
            row["salary_hike"], row["JobType"], row["StoreID"])
        cur.execute(query)
        print(query)

        con.commit()
        print("Salary of the given employee is incremented")
        print("Updated database with the incremented salaries")
    
    except Exception as e:
        con.rollback()
        print("Failed to update the database")
        print(">>>>>>>>>>>>>", e)

    return 


def StoreProfitLoss():
    """
    Function to implement option 3
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Finding store that gets maximum profit and in which season: ")

        query = "SELECT StoreID,Season,(Income - Expenditure) AS PROFIT from FINANCE ORDER BY PROFIT DESC LIMIT 1"
        cur.execute(query)
        print(query)
        print('\n')
        rows = cur.fetchall()
        for row in rows:
            for col in row:
                print(col, end=' ')
            break
        print()
        for row in rows:
            for col in row:
                print(row[col], end=' ')
        print('\n')
        
        con.commit()
        print("The store is returned that has the maximum profit")

    except Exception as e:
        con.rollback()
        print("Failed to retriece from the database")
        print(">>>>>>>>>>>>>", e)

    return
    print("Not implemented")


def ProductAvailability():
    """
    Function to implement option 3
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Checks for the availability of the products in a given store: ")

        row["StoreName"] = input("Enter the Store Name where you want to check the product availability: ")
        row["Name"] = input("Enter the Product Name to check its availability: ")

        query ="select (case when exists (select * from INVENTORY where storeID = (select storeID from STORE where StoreName = '%s') and ProductID = (select ProductID from PRODUCT where Name = '%s')) then 'YES' else 'NO' end) as availability from INVENTORY ORDER BY availability LIMIT 1" % (row["StoreName"],row["Name"])
        
        cur.execute(query)
        print(query)
        print('\n')
        rows = cur.fetchall()
        for row in rows:
            for col in row:
                print(col, end=' ')
            break
        print()
        for row in rows:
            for col in row:
                print(row[col], end=' ')
        print('\n')
        
        con.commit()
        print("The store is returned that has the maximum profit")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from the database")
        print(">>>>>>>>>>>>>", e)

    return
    print("Not implemented")



def SupervisorDatails():
    """
    Function to implement option 3
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Printing the details of all the supervisors in a store: ")

        row["StoreID"] = int(input("Enter the StoreID: "))
       
        query="select s.FirstName, s.LastName, s.StoreID, s.DateOfJoining, s.Salary, s.JobType, s.EmployeeID from EMPLOYEE e, EMPLOYEE s where e.SupervisorID = s.EmployeeID and e.StoreID = %d" % (row["StoreID"])
        cur.execute(query)
        print(query)

        print('\n')
        rows = cur.fetchall()
        for row in rows:
            for col in row:
                print(col, end=' ')
            break
        print()
        for row in rows:
            for col in row:
                print(row[col], end=' ')
        print('\n')
        
        con.commit()
        print("The supervisor details are printed")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from the database")
        print(">>>>>>>>>>>>>", e)

    return
    print("Not implemented")



def PaymentDatails():
    """
    Function to implement option 3
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Printing different payment details: ")
       
        query="select PaymentDetails, count(PaymentDetails) as Count from TRANSACTION group by PaymentDetails;"
        cur.execute(query)
        print(query)

        print('\n')
        rows = cur.fetchall()
        for row in rows:
            for col in row:
                print(col, end=' ')
            break
        print()
        for row in rows:
            for col in row:
                print(row[col], end=' ')
            print()
        print('\n')
        
        con.commit()
        print("The payment details are printed")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from the database")
        print(">>>>>>>>>>>>>", e)

    return
    print("Not implemented")

def AddAProduct():
    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new product's details: ")
        # name = (input("Name (Fname Minit Lname): ")).split(' ')
        # row["Fname"] = name[0]
        # row["Minit"] = name[1]
        # row["Lname"] = name[2]
        row["ProductID"] = int(input("ProductID: "))
        row["Name"] = input("Product Name: ")
        row["ManufacturingDate"] = input("Manufacturing Date in the form of yyyy:mm:dd : ")
        row["FreshTime"] = int(input("Average Time it remains fresh in weeks: "))
        row["ExpiryDate"] = input("ExpiryDate in yyyy:mm:dd : ")
        row["SellingPrice"] = int(input("Selling Price in Rupees: "))
        row["CostPrice"] = int(input("Cost Price in Rupees: "))

        row["StoreID"] = int(input("StoreID the product is stored in: "))
        row["NoofAvailableItems"] = int(input("No of Available Items: "))

        query = "INSERT INTO PRODUCT VALUES(%d,'%s','%s',%d,'%s',%d,%d)" % (
            row["ProductID"], row["Name"], row["ManufacturingDate"], row["FreshTime"], row["ExpiryDate"], row["SellingPrice"], row["CostPrice"])
        query2 = "INSERT INTO INVENTORY(ProductID, StoreID, NoOfAvailableItems) VALUES(%d,%d,%d)" % (
            row["ProductID"], row["StoreID"], row["NoofAvailableItems"])

        cur.execute(query)
        print(query)
        con.commit()

        print('\n')

        cur.execute(query2)
        print(query2)
        con.commit()

        print('\n')

        print("The product is inserted in the inventory")
        print("Inserted Into Database")


    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def SupplierDetails():
    """
    Function to implement option 3
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Printing supplier details if the store in need of an unavailable product: ")
       
        query="Select s.PhoneNo,s.Address from SUPPLIER as s JOIN INVENTORY as i ON i.StoreID = s.StoreID WHERE i.NoofAvailableItems = 0"
        cur.execute(query)
        print(query)

        print('\n')
        rows = cur.fetchall()
        for row in rows:
            for col in row:
                print(col, end=' ')
            break
        print()
        for row in rows:
            for col in row:
                print(row[col], end=' ')
            print()
        print('\n')
        
        con.commit()
        print("The supplier details are printed")

    except Exception as e:
        con.rollback()
        print("Failed to retrieve from the database")
        print(">>>>>>>>>>>>>", e)

    return

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        AddAProduct()
    elif(ch == 2):
        DeleteItem()
    elif(ch == 3):
        UpdateSalaryBonus()
    elif(ch == 4):
        StoreProfitLoss()
    elif(ch == 5):
        ProductAvailability()
    elif(ch == 6):
        SupervisorDatails()
    elif(ch == 7):
        PaymentDatails()
    elif(ch == 8):
        SupplierDetails()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)

    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con = pymysql.connect(host='localhost',
                            #   port=30306,
                              user="root",
                              password="Poorvi@12",
                              db='GROCERY_STORE',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1 -> Add a new Product: ")  # Hire an Employee
                print("2. Option 2 -> Delete all the Expired Items from the Inventory: ")  # Fire an Employee
                print("3. Option 3 -> Update the Salaries of the employees: ")  # Promote Employee
                print("4. Option 4 -> Returns best performing store and season: ")  # Employee Statistics
                print("5. Option 5 -> Returns YES if the given product is available in a given store, else NO: ") 
                print("6. Option 6 -> Lists the details of all the supervisors in a given store: ") 
                print("7. Option 7 -> Returns the count of mode of payments: ") 
                print("8. Option 8 -> Returns the contact of the supplier as and when the number of available items of certain products in the inventory are 0: ")
                print("9. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 9:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")