SELECT * FROM sys.tables

USE AdventureWorks2019

-- Question 1

SELECT * FROM [Production].[Product]

SELECT Color, StandardCost AS Price FROM [Production].[Product]
WHERE color NOT IN ('Black', 'Silver', 'White') AND ListPrice BETWEEN 75 AND 750
ORDER BY ListPrice DESC;

-- Question 2

SELECT * FROM [HumanResources].[Employee]

SELECT Gender, BirthDate, HireDate FROM [HumanResources].[Employee]
WHERE Gender = 'M' AND YEAR(birthdate) BETWEEN 1962 AND 1970 AND YEAR(HireDate) > 2001
OR Gender = 'F' AND YEAR(birthdate) BETWEEN 1972 AND 1975 AND YEAR(HireDate) BETWEEN 2001 AND 2002;

-- Question 3

SELECT * FROM [Production].[Product]

SELECT Top 10 ProductID, Name, ProductNumber, Color, StandardCost AS Price FROM [Production].[Product]
WHERE ProductNumber LIKE 'BK%'
ORDER BY Price DESC;

-- Question 4

SELECT * FROM [Person].[Person]

SELECT * FROM [Person].[EmailAddress]

SELECT CONCAT(FirstName,' ', LastName) AS FullName, EmailAddress FROM [Person].[Person], [Person].[EmailAddress]
WHERE SUBSTRING(LastName, 1, 4) = SUBSTRING(EmailAddress, 1, 4) AND LEFT(FirstName, 1) = LEFT(LastName, 1)
ORDER BY FullName ASC;

-- Question 5

SELECT * FROM [Production].[ProductSubcategory]

-- Question 6

SELECT * FROM [Production].[Product]


SELECT ProductID,StandardCost AS Price, Color,
CASE
	WHEN StandardCost < 200 THEN 'Low value'
	WHEN StandardCost BETWEEN 201 AND 750 THEN 'Mid value'
	WHEN StandardCost BETWEEN 751 AND 1250 THEN 'Mid to high value'
	ELSE 'Higher value'
END AS PriceSegment
FROM [Production].[Product]
WHERE Color IN ('Black', 'Silver', 'Red');

-- Question 7

SELECT * FROM [HumanResources].[Employee]

SELECT COUNT(DISTINCT JobTitle) AS Number_Of_Job_Titles FROM [HumanResources].[Employee]

-- Question 8

SELECT * FROM [HumanResources].[Employee]

SELECT BusinessEntityID, DATEDIFF(YEAR, BirthDate, HireDate) AS Age_At_Hiring FROM [HumanResources].[Employee]

-- Question 9

SELECT * FROM [HumanResources].[Employee]

SELECT COUNT(*) AS Number_Of_Employees_Due_Award FROM [HumanResources].[Employee]
WHERE DATEDIFF(YEAR, BirthDate, HireDate) >= 20 AND DATEDIFF(YEAR, BirthDate, HireDate) < 25;

-- Question 10

SELECT * FROM [HumanResources].[Employee]

SELECT BusinessEntityID, DATEDIFF(YEAR, BirthDate, HireDate) AS Age,
CASE
	WHEN DATEDIFF(YEAR, BirthDate, HireDate) >= 65 THEN 0
	ELSE 65 - DATEDIFF(YEAR, BirthDate, HireDate)
END AS Years_To_Retirement
FROM [HumanResources].[Employee]

-- Question 11

SELECT * FROM [Production].[Product]

ALTER TABLE [Production].[Product]
ADD NewPrice DECIMAL;

ALTER TABLE [Production].[Product]
DROP COLUMN NewPrice;

-- Question 12

SELECT * FROM [HumanResources].[Employee]

SELECT * FROM [Person].[Person]

SELECT * FROM [Sales].[SalesPerson]

SELECT * FROM [Sales].[CountryRegionCurrency]

SELECT FirstName, LastName, HireDate, SickLeaveHours, SalesQuota, CountryRegionCode 
FROM [HumanResources].[Employee], [Person].[Person], [Sales].[SalesPerson], [Sales].[CountryRegionCurrency]

