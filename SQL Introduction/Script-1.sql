SELECT * FROM Products p;

SELECT * FROM Categories c;

SELECT * FROM Suppliers s;

/* Create a report that shows the category name and description from the categories */

- ORDER BY ---- sort our result

- ASC - ascending
- DESC - descending

SELECT * FROM Categories c;

SELECT CategoryName, Description FROM Categories c
ORDER BY CategoryName DESC;

SELECT * FROM Categories c
ORDER BY CategoryID DESC,
		 CategoryName ASC;

/* filtering Data */

1. Select DISTINCT 

SELECT * FROM orders o;

SELECT DISTINCT shipcountry
FROM Orders o;

2. WHERE

/* Create a report showing order date, ship date, customer ID, Frieght of all orders placed on 21 May 1996.
 */

SELECT * FROM Orders o;

SELECT OrderDate, ShipDate, CustomerID, Freight
FROM Orders o
WHERE OrderDate = '1996-05-21';

- WHERE Column = 100;
- WHERE Column = '';
- WHERE Column IN (1,2,3);
- WHERE Column LIKE 'Ant';

SELECT DISTINCT shipcountry
FROM Orders o
WHERE ShipCountry LIKE '%s%';

/* Create a report that shows the city, company name, contact name of customers from cities starting with A or B. */

SELECT * FROM Customers c;

SELECT City, CompanyName, ContactName
FROM Customers c
WHERE City LIKE 'A%' OR City Like 'B%';

/* Create a report that shows the city, company name, contact name of customers from cities that has Letter L in the name sorted by contact name. */

/* Create a report that shows the last name, first name, city of employers in the cities other than "Seattle. */

SELECT City, CompanyName, ContactName
FROM Customers c
WHERE ContactName LIKE '%L%'
ORDER BY ContactName;

SELECT * FROM Employees e;

SELECT LastName, FirstName, City
FROM Employees e
WHERE City != 'Seattle';

SELECT LastName, FirstName, City
FROM Employees e
WHERE City NOT LIKE 'Seattle';

3. LIMIT

/* Create a report that shows the top 10 Order ID, Order Date, Shipped Date, Customer ID, Freight from Orders, Sorted by Freight in descending order */

SELECT * FROM Orders o
LIMIT 10 OFFSET 10;

SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Orders o
ORDER BY Freight DESC
LIMIT 10;

4. BETWEEN

/* Create a report that shows the first name, last name, birth date of employees born in 1950s. */

SELECT * FROM Employees e;

SELECT FirstName, LastName, BirthDate 
FROM Employees e
WHERE BirthDate BETWEEN '1950-01-01' AND '1959-12-31';

SELECT FirstName, LastName, BirthDate 
FROM Employees e
WHERE BirthDate >= '1950-01-01' AND BirthDate < '1960-01-01';

5. IN 

SELECT * FROM Products p;

SELECT * FROM Products p
WHERE SupplierID IN (1,2);

SELECT * FROM Products p
WHERE SupplierID NOT IN (1,2);

6. LIKE or GLOB

SELECT * FROM Suppliers s;

SELECT * FROM Suppliers s
WHERE Country LIKE "USA";

SELECT * FROM Suppliers s
WHERE Country GLOB "USA";

/* Create a report that shows the contact name, company name, contact title and phone number from the customers table sorted by phone. */

/* Create a report showing product name, unit price, quantity per unit of products that are out of stock. */

/* Create a report showing employee id, order id, customer id, required date, shipped date from all orders shipped later than the required date. */

SELECT * FROM Customers c;

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers c
ORDER BY Phone;

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers c
WHERE Phone IS NOT NULL
ORDER BY Phone;

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers c
WHERE Phone IS NULL
ORDER BY Phone;

SELECT * FROM Products p;

SELECT ProductName, UnitPrice, QuantityPerUnit
FROM Products p
WHERE UnitsInStock = 0;

SELECT * FROM Orders o;

SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM Orders o
WHERE ShippedDate > RequiredDate;

SELECT * FROM categories c;

SELECT * FROM Products p;

- LEFT JOIN

SELECT a , b 
FROM A 
LEFT JOIN B ON A.f = B.f
WHERE search_condition;

SELECT c.CategoryID, c.CategoryName, p.ProductID, p.ProductName, p.Unitprice, p.QuantityPerUnit
FROM Categories c
LEFT JOIN Products p
ON c.CategoryID = p.CategoryID;
WHERE c.categoryName = 'Beverages';

- RIGHT JOIN

SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID, Products.ProductName, Products.UnitPrice , Products.QuantityPerUnit 
FROM Categories 
RIGHT JOIN Products  
ON Categories.CategoryID = Products.CategoryID 
WHERE Categories.CategoryName  = 'Beverages';

- INNER JOIN 

SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID, Products.ProductName, Products.UnitPrice , Products.QuantityPerUnit 
FROM Categories 
JOIN Products  
ON Categories.CategoryID = Products.CategoryID 
WHERE Categories.CategoryName  = 'Beverages';

/* Create a report that shows the company name and product name from all product in the seafood category */

SELECT * FROM Products p;
SELECT * FROM Suppliers s;
SELECT * FROM Categories c;

SELECT s.CompanyName, p.ProductName
FROM Categories c
JOIN Products p 
ON c.CategoryID = p.CategoryID
JOIN Suppliers s 
ON s.SupplierID = p.SupplierID
WHERE CategoryName = 'Seafood';

SELECT s.CompanyName, p.ProductName
FROM Categories c
FULL OUTER JOIN Products p 
ON c.CategoryID = p.CategoryID
JOIN Suppliers s 
ON s.SupplierID = p.SupplierID
WHERE CategoryName = 'Seafood';

/* Create  a report that shows the EmployeeId, the LastName and FirstName as Employee, and the Lastname and Firstname of who they report 
 * to as manager from empolyees table sorted empoyee ID.
 * 
 */

SELECT * FROM Employees e;

SELECT LastName || ' ' || FirstName AS Employee
FROM Employees e;

SELECT e.EmployeeID, e.LastName || ' ' || e.FirstName AS Employee
FROM Employees e;

SELECT e.EmployeeID, e.LastName  || ' ' || e.FirstName AS Employees, m.LastName || ' ' || m.FirstName AS Manager
FROM Employees e 
LEFT JOIN Employees m 
ON m.EmployeeID = e.ReportsTo 
ORDER BY e.EmployeeID;

SELECT Employees.EmployeeID, Employees.LastName  || ' ' || Employees.FirstName AS Employees, Supervisor.LastName || ' ' || Supervisor.FirstName AS Manager
FROM Employees  
LEFT JOIN Employees AS Supervisor 
ON Supervisor.EmployeeID = Employees.ReportsTo 
ORDER BY Employees.EmployeeID;

SELECT Employees.EmployeeID, Employees.LastName  || ' ' || Employees.FirstName AS Employees, Supervisor.LastName || ' ' || Supervisor.FirstName AS Manager
FROM Employees  
LEFT JOIN Employees AS Supervisor;

SELECT * FROM Orders o;
SELECT * FROM "Order Details" od;

SELECT o.OrderID, od.ProductID, od.Unitprice, Od.Quantity
FROM Orders o
CROSS JOIN "Order Details" od;

/* Grouping Data */

- GROUP BY

MIN, MAX, COUNT or AVG

SELECT * FROM Orders;

SELECT OrderID, COUNT(OrderID) AS Number_Order, ShipCountry 
FROM Orders o
GROUP BY ShipCountry;

/* create a report showing orderid, total number of order id as number of orders from order details table group by order id and sorted BY 
number of orders in descending order. */

SELECT * FROM "Order Details" od;

SELECT OrderID, COUNT(OrderId) AS NumberOfOrders
FROM "Order Details" od
GROUP BY OrderID 
ORDER BY NumberOfOrders DESC;

- HAVING

SELECT OrderID, COUNT(OrderID) AS Number_Order, ShipCountry 
FROM Orders o
GROUP BY ShipCountry
HAVING ShipCountry LIKE 'C%';

/* Create a report that outputs the companyname and the totalnumber of orders by customer renamed as number of orders 
since December 31, 1994. Show number of orders greater than 10. */

SELECT * FROM Orders o;

SELECT * FROM Customers c;

SELECT c.CompanyName, COUNT(c.CustomerID) AS NumberofOrders
FROM Customers c
JOIN Orders o 
ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= '1994-12-31'
GROUP BY c.CompanyName
HAVING NumberofOrders > 10;

/* Create a report that shows CustomerID, Sum of Freight from all Orders table with Sum of Freight greater than $200. */

SELECT * FROM Orders o;

SELECT c.CustomerID,SUM(o.Freight) AS "Total Freight"
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING SUM(O.Freight) > 200;

SELECT CustomerID,SUM(Freight) AS "TotalFreight"
FROM Orders o
GROUP BY CustomerID
HAVING TotalFreight > 200;

AVG, SUM, MIN, MAX, COUNT

SELECT * FROM Products p;

SELECT ProductID, ProductName, COUNT(SupplierID) AS Numberofsupply
FROM Products p
GROUP BY ProductName
ORDER BY Numberofsupply DESC;

SELECT * FROM "Order Details" od;

SELECT OrderID, ROUND(AVG(UnitPrice),2) AS AverageUnitPrice
FROM "Order Details" od
GROUP BY OrderID
HAVING AverageUnitPrice BETWEEN 15 AND 20;

/* create a report that shows average,  minimum, and maximum uniprice of all products as
averageprice, minimumprice, maximumprice respectively. */

SELECT
    AVG(UnitPrice) AS "Average Price",
    MIN(unitPrice) AS "Minimum Price",
    MAX(unitPrice) AS "Maximum Price"
FROM
    Products p;

- SET Operators

- UNION
- EXCEPT
- INTERSECT

SELECT * FROM Suppliers s;

SELECT * FROM Customers c;

SELECT ContactName, CompanyName, 'Customer' AS Type
FROM Customers c
UNION
SELECT ContactName, CompanyName, 'Suppliers'
FROM Suppliers s
ORDER BY CompanyName ASC;

- EXCEPT

SELECT * FROM Products p;

SELECT * FROM Suppliers s;

SELECT SupplierID
FROM Suppliers s 
EXCEPT
SELECT SupplierID 
FROM Products p;

SELECT * FROM Customers c;

SELECT * FROM Suppliers s;

SELECT CompanyName
FROM Customers c 
EXCEPT
SELECT CompanyName
FROM Suppliers s;

SELECT CompanyName
FROM Suppliers s2  
EXCEPT
SELECT CompanyName
FROM Customers c;

- INTERSECT

SELECT * FROM Shippers s;

SELECT * FROM Territories t;

SELECT * FROM Categories c;

SELECT * FROM Employees e;

SELECT * FROM Products p;

SELECT CompanyName 
FROM Customers c
INTERSECT
SELECT CompanyName 
FROM Suppliers s;

- SubQuery

/* A subquery is a select statement nested in another statement. */

SELECT * FROM Products p;

SELECT * FROM Categories c;

SELECT ProductID, ProductName, CategoryID
FROM Products p 
WHERE CategoryID = (SELECT CategoryName 
FROM Categories c
WHERE CategoryName = 'Beverages');

SELECT CategoryName 
FROM Categories c
WHERE CategoryName = 'Beverages';

SELECT * FROM Orders o;

SELECT * FROM "Order Details" od;

SELECT * FROM "Order Details" od  
WHERE UnitPrice IN (SELECT OrderID)

SELECT EmployeeID, LastName, FirstName
FROM Employees e;

SELECT * FROM "Order Details" od;

SELECT * FROM "Order Details" od 
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM "Order Details" od2);

SELECT AVG(UnitPrice) FROM "Order Details" od2;

- EXISTS

CASE

IF ELSE THEN

CASE Case_expression
	WHEN when_expression1 THEN result1
	WHEN when_expression2 THEN result2	
	
	...
	ELSE result_else
END

SELECT * FROM Customers c;

SELECT * FROM Orders o;

SELECT OrderID, CustomerID, EmployeeID,
CASE ShipRegion
WHEN 'Western Europe'
THEN 'W E'
WHEN 'South America'
THEN 'S A'
ELSE 'Others'
END ShippingCode
FROM Orders o;

SELECT * FROM Products p;

SELECT ProductID, ProductName, SupplierID,
CASE 
	WHEN UnitPrice < 10 THEN 'Low'
	WHEN UnitPrice > 10 AND UnitPrice < 20 THEN 'Average'
	ELSE 'High'
	END PriceCategory
FROM Products p
ORDER BY SupplierID ASC;

- VIEW

/* Create a view named Product Details that showa the Product ID, Company Name, Product Name, Category Name, Description,
Quantity Per Unit, Unit Price, Unit Stock, Units On Order, Reorder Level, Discontinued from the Supplier, Products and Categories Table. */

SELECT * FROM Suppliers s;

SELECT * FROM Products p;

SELECT * FROM Categories c;

CREATE VIEW ProductDetails AS
SELECT p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.Description, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, 
p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
FROM Suppliers s 
JOIN Products p 
ON s.SupplierID = p.SupplierID 
JOIN Categories c 
ON c.CategoryID = p.CategoryID;

DROP VIEW ProductDetails;

SELECT * FROM ProductDetails pd;

/* Create a copy of the shipper table as shippers_duplicate, then insert a copy of shippers data into new table */

CREATE TABLE Shippers_Duplicate AS
SELECT * FROM Shippers WHERE 1=0;

DROP TABLE Shippers_Duplicate;

INSERT INTO Shippers_Duplicate
SELECT * FROM Shippers;

SELECT * FROM Shippers_Duplicate;

SELECT * FROM Orders o;

CREATE TABLE Order_Duplicate AS
SELECT * FROM Orders o  WHERE 1=0;

DROP TABLE Order_Duplicate;

INSERT INTO Order_Duplicate
SELECT * FROM Orders;

SELECT * FROM Order_Duplicate;

SELECT * FROM Orders o;

CREATE INDEX country_index ON Orders(ShipCountry);

DROP INDEX country_index;

/* Create a report that shows the category name and description from the categories table sorted by the category name */
/* Create a report that shows the contact name, company name, contact title and phone number from the customers table sorted by phone */
/* Create a report that shows the company name, fax, phone, country, homepage from the suppliers table sorted by the country in descending order than by company name in ascending order */
/* Create a report showing all the contact name, address, city of all customers not from germany, mexico and spain */
/* Create a view named customers info that shows the customer id, company name, contact name, contact title, address, city, country
phone, order date, required date, shipped date from customers and orders table */

SELECT * FROM Categories c;

SELECT CategoryName, Description
FROM Categories c 
ORDER BY CategoryName;

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers c 
ORDER BY Phone;

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers c 
WHERE Phone NOT NULL
ORDER BY Phone;

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Customers c 
WHERE Phone != 'NULL'
ORDER BY Phone;

SELECT * FROM Suppliers s;

SELECT CompanyName, Fax, Phone, Country, Homepage
FROM Suppliers s  
ORDER BY Country DESC, CompanyName;

SELECT CompanyName, Fax, Phone, Country, Homepage
FROM Suppliers s  
ORDER BY 4 DESC, 1;

SELECT * FROM Customers c;

SELECT ContactName, Address, City
FROM Customers c 
WHERE Country NOT IN ('Germany', 'Mexico', 'Spain');

CREATE VIEW Customerinfo AS
SELECT c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country,
c.Phone, o.OrderDate, o.RequiredDate, o.Shippeddate
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID;

SELECT * FROM Customerinfo;

DROP VIEW Customerinfo;














