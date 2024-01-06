/* Syntax for creating a database */

CREATE DATABASE databasename

/* Creating a Table */

CREATE TABLE [IF NOT EXISTS] [schema_name].tablename (column_1 data_type PRIMARY KEY, column_2 data_type_type NOT NULL, colunn_3 data_type)[WITHOUT ROWID];

/* creating a table named contact
first name
last name
email
phone number
gender
address
marital status
postcode */

/* PRIMARY KEY, UNIQUE, NOT  NULL, CHECK */ 

CREATE TABLE contacts(contact_id INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULl, email TEXT NOT NULL UNIQUE, 
phone_number TEXT NOT NULL UNIQUE, gender TEXT NOT NULL, address TEXT NOT NULL, marital_status TEXT, postcode TEXT NOT NULL);

SELECT column_list FROM table;

SELECT first_name FROM contacts c;

SELECT * FROM contacts c ;

/* INSERT - insert new rows into a table
 
 */

INSERT INTO table (column1, column2, column3,..., columnnn)
VALUES (value1, value2, value3, ..., valuen);

INSERT INTO contacts (contact_id, first_name, last_name, email, phone_number, gender, address, marital_status, postcode)
VALUES (1, 'Samuel', 'Hope', 'samuel@email.com', '+2346766', 'male', 'paul arcadia', 'single', 'DC122'),
		(2, 'Samson', 'Hope', 'samson@email.com', '+2346776', 'male', 'paul arcadia', 'single', 'DC122'),
		(3, 'Blessing', 'Hope', 'blessing@email.com', '+2346866', 'female', 'paul arcadia', 'single', 'DC122'),
		(4, 'Tope', 'Hope', 'Tope@email.com', '+234676690', 'female', 'paul arcadia', 'single', 'DC122');

SELECT * FROM contacts c;

/* Drop is use to remove a table from a database */

DROP TABLE IF EXISTS address;

- DELETE command is use to delete a record from the table.
- DROP command will delete the complete table from the database.
- TRUNCATE command deletes all the rows from the table and keep the column names.

DELETE FROM contacts WHERE contact_id =3;

SELECT * FROM contacts c;

INSERT INTO contacts (contact_id, first_name,last_name,email,phone_number,gender,address,marital_status,postcode)
VALUES(3, "Paul", "Sun", "paul@gmail.com", "+8982", "female", "lakewest", "married", "ADVR");

SELECT * FROM contacts c;

DELETE FROM contacts
WHERE first_name LIKE "%m%"
;

- ALTER TABLE
1. Rename a table
2. Add a column to a table
3. Rename a column

ALTER TABLE contacts
RENAME TO contact;

SELECT * FROM contact;

SELECT contact_id, first_name FROM contact;

ALTER TABLE contact 
ADD COLUMN location text;

SELECT * FROM contact;

UPDATE table
SET column1 = new_value1
	column2 = new_value2
WHERE search_condition;

UPDATE contact
SET location = "usa"
WHERE contact_id = 4;

UPDATE contact
SET last_name = "Paul"
WHERE contact_id = 2;

SELECT * FROM contact;

UPDATE contact 
SET email = LOWER(first_name || "." || last_name || "@learnwithpride.com");

ALTER TABLE contact 
RENAME COLUMN phone_number TO mobile_number;

SELECT * FROM contact;

SELECT 1 + 1;

SELECT 10/5;

SELECT 5 * 2;

SELECT 5 % 2;  /* % - Modulus only return the remainder adter a division has occured */

SELECT 5 - 2;

SELECT * FROM contact;

SELECT Contact_id, first_name, last_name FROM contact;

CREATE TABLE groups(group_id INTEGER PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE new_contacts( contact_id INTEGER PRIMARY KEY, first_name TEXT NOT NULL, last_name TEXT NOT NULL, 
email TEXT NOT NULL UNIQUE, phone TEXT NOT NULL UNIQUE);

CREATE TABLE contact_groups(contact_groups_id INTEGER PRIMARY KEY, contact_id INTEGER, group_id INTEGER,  FOREIGN KEY (contact_id) 
REFERENCES new_contacts(contact_id), FOREIGN KEY (group_id) REFERENCES groups(group_id) );

SELECT * FROM groups;
SELECT * FROM new_contacts nc;
SELECT * FROM contact_groups cg;

INSERT INTO groups (group_id, name)
VAlUES(1, "Sam"),
(2, "Joy"),
(3, "Paul");

UPDATE groups
SET name = "Swimming"
WHERE group_id = 3;

ALTER TABLE groups
RENAME COLUMN name TO activities;

INSERT INTO new_contacts (contact_id, first_name, last_name, email, phone)
VALUES (1, "sam", "paul", "paul@gmail.com", "+234517177"),
(2, "stone", "liam", "liam@gmail.com", "+246518"),
(3, "raul", "rapheal", "raul@gmail", "+2345563");

INSERT INTO contact_groups (contact_groups_id, contact_id , group_id )
VALUES (1, 2, 3),
(2, 2, 3),
(3, 1, 3);

SELECT * FROM groups;
SELECT * FROM new_contacts nc;
SELECT * FROM contact_groups cg;

UPDATE contact_groups
SET contact_id = "3"
WHERE contact_groups_id = 1;


