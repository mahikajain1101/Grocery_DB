# DATA AND APPLICATIONS

## Video LINK:

### https://iiitaphyd-my.sharepoint.com/:v:/g/personal/ashna_dua_students_iiit_ac_in/EcWXyHXIzqVHtBrMT8DBpH8B0gDbFFwpU4KCYI7y0z5igA?e=BF8UWx

## How to run the given database and queries interface:

### We can run the database by the following commands:

#### To install pymysql python library to connect to the sql database:

```
    python3 -m pip install PyMySQL
```

#### Download the above files as a zip file in your local system.
#### In the interface.py file, change the password to the local systems password for sql.
### Run the sql file in the local system as:
```
    mysql -u root -p < database.sql
```
#### This command loads the database into your mysql server.

### Run the interface.py file :
```
    python3 interface.py
```

#### This command opens up the interface and follow the instructions specified carefully.

</br>

## Changes made in our database:

### 1. Supplier ID has been removed as a foreign key from the entity Product
### 2. Each supplier supplies one store
### 3. Company is removed as a attribute in Product as awell as Supplier entity.
### 4. Time of Supply is also scraped as an attribute from relation <b>SUPPLIER</b>
</br>

## The functional queries being implemented in our database are:

## Updating Queries (the sql relations in the database are modified)
### 1. Add a new Product: 
#### inserts as new Product into the relation <b>PRODUCT</b> taking in input from the user. Since addition of a new product will affect relation <b>INVENTORY</b> (as inventory stores the details of all the products in a given store.). We have also lodged a query which also adds the new product into the inventory.
<br>

### 2. Delete all the Expired Items from the Inventory: 
#### Creating a query which deletes all the products in relation <b> INVENTORY </b> which have been expired. 
<br>

### 3. Update the Salaries of the employees: 
#### We shall increment the salary of the employees as per the given directions. The query takes in input from the user about the percentage increment as well as the employee position and store.
<br>

## Selection Queries (The output is displayed on the terminal)
### 4. Returns best performing store and season: 
#### The best performing store in terms of maximum profit generated is listed. As the store performs differently in different seasons and therefore the store as well as the season of maximum profit is listed.
<br>

### 5. Returns YES if the given product is available in a given store, else NO: 
#### The relation <b>INVENTORY</b> keeps track of the products that are available in a given store. If the customer required product is present in a given store, then YES is outputted if not NO.
<br>

### 6. Lists the details of all the supervisors in a given store: 
#### All the supervisors of a given store are listed in order along with all their details. The data is taken from the relation <b>EMPLOYEE</b>.
<br>

### 7. Returns the count of mode of payments:
#### Since in a store multiple transactions occur in different modes, we keep track of the number of trasactions madce in different modes.
<br>

### 8. Returns the contact of the supplier as and when the number of available items of certain products in the inventory are 0: 
#### As and when the product's inventory is completed the query outputs out the contact of the supplier, to contact for supplying the product.

<br>

