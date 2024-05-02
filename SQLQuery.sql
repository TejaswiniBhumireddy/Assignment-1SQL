
--Create the database named "TechShop"
USE TECHSHOP

-- TASK 1

--Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema.

CREATE TABLE CUSTOMERS(
CUSTOMER_ID INT identity(1,1)PRIMARY KEY, 
FIRST_NAME VARCHAR(20) NOT NULL ,
LAST_NAME VARCHAR(20),
EMAIL VARCHAR NOT NULL,
PHONE_NUMBER NUMERIC NOT NULL constraint CK_MyTable_PhoneNumber check (PHONE_NUMBER like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') ,
ADDRESS VARCHAR(20) NOT NULL
)

SELECT *FROM CUSTOMERS 

CREATE TABLE PRODUCTS(
PRODUCT_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
PRODUCT_NAME VARCHAR(30) NOT NULL,
DESCRIPTION VARCHAR(200),
PRICE INT)

SELECT * FROM PRODUCTS

CREATE TABLE ORDERS(
ORDER_ID INT IDENTITY(1,1) PRIMARY KEY,
CUSTOMER_ID INT FOREIGN KEY REFERENCES CUSTOMERS(CUSTOMER_ID) ON DELETE CASCADE,
ORDER_DATE DATETIME NOT NULL,
TOTAL_AMOUNT INT NOT NULL)


SELECT * FROM ORDERS

CREATE TABLE ORDER_DETAILS(
ORDER_DETAIL_ID INT IDENTITY(100,1) PRIMARY KEY,
ORDER_ID INT FOREIGN KEY REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE,
PRODUCT_ID INT FOREIGN KEY REFERENCES PRODUCTS(PRODUCT_ID) ON DELETE CASCADE,
QUANTITY INT)

CREATE TABLE INVENTORY(
INVENTORY_ID INT IDENTITY(1,1) PRIMARY KEY,
PRODUCT_ID INT FOREIGN KEY REFERENCES PRODUCTS(PRODUCT_ID),
QUANTITY_IN_STOCK VARCHAR NOT NULL,
LAST_STOCK_UPDATE VARCHAR NOT NULL)

ALTER TABLE CUSTOMERS
DROP COLUMN EMAIL

ALTER TABLE CUSTOMERS
ADD EMAIL VARCHAR(25) NOT NULL

--Insert at least 10 sample records into each of the following tables.
--a. Customers
--b. Products
--c. Orders
--d. OrderDetails 

INSERT INTO CUSTOMERS VALUES('TEJASWINI','BHUMIREDDY','1234567891','ANANTAPUR','BHUMI@GMAIL.COM'),('JYOTHI','BHUMI','8346483482','KURNOOL','JYOTHIKA@GMAIL.COM')
INSERT INTO CUSTOMERS VALUES('MANOJ','REDDY','1546546891','BANGLORE','MANU@GMAIL.COM'),('MITHUN','CHAKRAVARTHY','6598321475','BELLARY','MITHUN@GMAIL.COM')
INSERT INTO customers
VALUES ('John', 'Smith', '1234567890', '123 Main St, City', 'john.smith@email.com'),
    ('Emily', 'Johnson', '9876543210', '456 Oak Ave, Town', 'emily.johnson@email.com'),
    ('Michael', 'Williams', '5551234567', '789 Elm St, Village', 'michael@email.com'),
    ('Sarah', 'Brown', '5559876543', '567 Maple Ln, County', 'sarah.brown@email.com'),
    ('David', 'Jones', '2223334444', '890 Pine St, Suburb', 'david.jones@email.com'),
    ('Jessica', 'Davis', '1112223333', '246 Cedar Rd, Town', 'jessica.davis@email.com'),
    ('Kevin', 'Miller', '4445556666', '135 Birch Ave, City', 'kevin.miller@email.com'),
    ('Amanda', 'Wilson', '7778889999', '789 Oak St, Village', 'amanda.wilson@email.com');
SELECT * FROM CUSTOMERS

INSERT INTO PRODUCTS (PRODUCT_NAME, DESCRIPTION, PRICE)
VALUES 
    ('Laptop', 'High-performance laptop with SSD storage', 1200),
    ('Smartphone', 'Latest model with high-resolution camera', 800),
    ('Headphones', 'Noise-canceling headphones with Bluetooth', 150),
    ('Tablet', '10-inch tablet with 4G connectivity', 400),
    ('Smartwatch', 'Fitness tracker with heart rate monitor', 200),
    ('Speaker', 'Portable Bluetooth speaker with long battery life', 100),
    ('Camera', 'Mirrorless camera with 4K video recording', 1500),
    ('Gaming Console', 'Next-gen gaming console with powerful GPU', 500),
    ('Printer', 'Wireless all-in-one printer for home office', 250),
    ('Router', 'High-speed Wi-Fi router with multiple antennas', 120);

	SELECT * FROM products

-- Insert sample data into ORDERS table
INSERT INTO ORDERS (CUSTOMER_ID, ORDER_DATE, TOTAL_AMOUNT)
VALUES 
    (17, '2024-04-25 08:00:00', 200),
    (17, '2024-04-24 10:30:00', 350),
    (18, '2024-04-23 15:45:00', 500),
    (19, '2024-04-22 12:15:00', 800),
    (20, '2024-04-21 11:20:00', 300),
    (21, '2024-04-20 09:00:00', 600),
    (22, '2024-04-19 14:00:00', 450),
    (23, '2024-04-18 16:30:00', 700),
    (24, '2024-04-17 13:45:00', 250),
    (24, '2024-04-16 10:00:00', 900);

SELECT * FROM ORDERS

-- Insert sample data into ORDER_DETAILS table
INSERT INTO ORDER_DETAILS (ORDER_ID, PRODUCT_ID, QUANTITY)
VALUES 
    (11,1, 2),   
    (9, 3, 1),   
    (2, 2, 1),   
    (6, 4, 3),   
    (3, 5, 1),   
    (10, 6, 2),  
    (4, 7, 1),   
    (5, 8, 1),   
    (8, 9, 1),   
    (7, 10, 2);  

SELECT * FROM ORDER_DETAILS

ALTER TABLE INVENTORY
ALTER COLUMN QUANTITY_IN_STOCK VARCHAR(10) NOT NULL;

-- Insert sample data into INVENTORY table
-- Modify the INVENTORY table to increase the size of the QUANTITY_IN_STOCK column
ALTER TABLE INVENTORY
ALTER COLUMN QUANTITY_IN_STOCK VARCHAR(10) NOT NULL;

ALTER TABLE INVENTORY
ALTER COLUMN LAST_STOCK_UPDATE VARCHAR(10) NOT NULL;


-- Insert sample data into INVENTORY table
INSERT INTO INVENTORY (PRODUCT_ID, QUANTITY_IN_STOCK, LAST_STOCK_UPDATE)
VALUES 
    (1, '10', '2024-04-25'),  -- Assuming Product ID: 1, Quantity: 10, Last Update: 2024-04-25
    (2, '15', '2024-04-25'),  -- Assuming Product ID: 2, Quantity: 15, Last Update: 2024-04-25
    (3, '20', '2024-04-25'),  -- Assuming Product ID: 3, Quantity: 20, Last Update: 2024-04-25
    (4, '12', '2024-04-25'),  -- Assuming Product ID: 4, Quantity: 12, Last Update: 2024-04-25
    (5, '8', '2024-04-25'),   -- Assuming Product ID: 5, Quantity: 8, Last Update: 2024-04-25
    (6, '25', '2024-04-25'),  -- Assuming Product ID: 6, Quantity: 25, Last Update: 2024-04-25
    (7, '18', '2024-04-25'),  -- Assuming Product ID: 7, Quantity: 18, Last Update: 2024-04-25
    (8, '30', '2024-04-25'),  -- Assuming Product ID: 8, Quantity: 30, Last Update: 2024-04-25
    (9, '22', '2024-04-25'),  -- Assuming Product ID: 9, Quantity: 22, Last Update: 2024-04-25
    (10, '17', '2024-04-25'); -- Assuming Product ID: 10, Quantity: 17, Last Update: 2024-04-25

SELECT * FROM INVENTORY

-- TASK 2

-- Write an SQL query to retrieve the names and emails of all customers. 
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME,EMAIL FROM CUSTOMERS;

-- Write an SQL query to list all orders with their order dates and corresponding customer names
SELECT O.ORDER_ID,O.ORDER_DATE,C.FIRST_NAME+' '+C.LAST_NAME AS FULL_NAME FROM ORDERS O JOIN CUSTOMERS C ON O.CUSTOMER_ID=C.CUSTOMER_ID;

--Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address
INSERT INTO CUSTOMERS VALUES('Aruna','Kanapuram','8764987536','Hyderabad','aruna@gmail.com')

--Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE PRODUCTS 
SET PRICE=PRICE+PRICE*0.1

--Write an SQL query to delete a specific order and its associated order details from the
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DECLARE @OrderIdToDelete INT
SET @OrderIdToDelete=10
DELETE FROM ORDER_DETAILS WHERE ORDER_ID=@OrderIdToDelete
DELETE FROM ORDERS WHERE ORDER_ID=@OrderIdToDelete

SELECT * FROM ORDERS

--Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO ORDERS VALUES(24,'2024-06-25 04:45:00:000',1200)

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific
--customer in the "Customers" table. Allow users to input the customer ID and new contact information.
DECLARE @CustomerIdUpdate INT
DECLARE @NewEmail VARCHAR(255)
DECLARE @NewAddress VARCHAR(255)

SET @CustomerIdUpdate =7
SET @NewEmail='JYOTHI@GMAIL.COM'
SET @NewAddress='KORMANGLA'

UPDATE CUSTOMERS
SET ADDRESS=@NewAddress,EMAIL=@NewEmail WHERE CUSTOMER_ID = @CustomerIdUpdate;
SELECT * FROM ORDER_DETAILS

--NEEDS TO BE VERIFIED
--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
--table based on the prices and quantities in the "OrderDetails" table.
UPDATE ORDERS 
SET TOTAL_AMOUNT= (SELECT SUM(O.QUANTITY*P.PRICE),0 FROM ORDER_DETAILS O INNER JOIN PRODUCTS P ON O.PRODUCT_ID=P.PRODUCT_ID
WHERE O.ORDER_ID=ORDERS.ORDER_ID 
GROUP BY O.ORDER_ID)

--9. Write an SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DECLARE @CustomerIdToDelete INT
SET @CustomerIdToDelete = 17
DELETE FROM ORDERS WHERE CUSTOMER_ID=@CustomerIdToDelete 
DELETE FROM ORDER_DETAILS WHERE ORDER_ID IN(SELECT ORDER_ID FROM ORDERS WHERE CUSTOMER_ID=@CustomerIdToDelete )
SELECT * FROM ORDER_DETAILS

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
--including product name, category, price, and any other relevant details.
INSERT INTO PRODUCTS VALUES('Mouse','Smooth for operating on screen',1000)
SELECT * FROM orders

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.
alter table orders add  order_status  varchar(30)
update orders set order_status='pending' where customer_id=24
update orders set order_status='confirmed' where customer_id between 18 and 20
update orders set order_status='received' where customer_id between 21 and 23
select * from orders

DECLARE @OrderIdToUpdate int
SET @OrderIdToUpdate = 6
DECLARE @NewStatus VARCHAR(30)
SET @NewStatus= 'shipped'

UPDATE ORDERS SET ORDER_STATUS=@NewStatus WHERE ORDER_ID=@OrderIdToUpdate

--12. Write an SQL query to calculate and update the number of orders placed by each customer
--in the "Customers" table based on the data in the "Orders" table.
SELECT C.CUSTOMER_ID,COUNT(C.CUSTOMER_ID) AS NUM_OF_ORDERS FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID 
GROUP BY C.CUSTOMER_ID

ALTER TABLE CUSTOMERS ADD ORDER_COUNT INT
UPDATE CUSTOMERS SET ORDER_COUNT=(SELECT COUNT(CUSTOMER_ID) FROM ORDERS WHERE CUSTOMERS.CUSTOMER_ID=ORDERS.CUSTOMER_ID)

SELECT * FROM CUSTOMERS

--TASK-3
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order.
SELECT C.CUSTOMER_ID, C.FIRST_NAME+' '+C.LAST_NAME,O.ORDER_ID,O.ORDER_STATUS,O.TOTAL_AMOUNT FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID=O.ORDER_ID

 --Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.
SELECT P.PRODUCT_ID,P.PRODUCT_NAME,SUM(OD.QUANTITY*O.TOTAL_AMOUNT) AS TOTAL_REVENUE FROM PRODUCTS P JOIN ORDER_DETAILS OD ON P.PRODUCT_ID=OD.PRODUCT_ID 
JOIN ORDERS O ON OD.ORDER_ID=O.ORDER_ID GROUP BY P.PRODUCT_ID,P.PRODUCT_NAME
SELECT * FROM ORDER_DETAILS

--3. Write an SQL query to list all customers who have made at least one purchase. Include their
--names and contact information.

SELECT 
    C.FIRST_NAME,
    C.LAST_NAME,
    C.EMAIL,
    C.PHONE_NUMBER,
    C.ADDRESS
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, C.EMAIL, C.PHONE_NUMBER, C.ADDRESS;

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered.
SELECT P.PRODUCT_ID,P.PRODUCT_NAME,OD.QUANTITY FROM PRODUCTS P JOIN ORDER_DETAILS OD ON P.PRODUCT_ID=OD.PRODUCT_ID ORDER BY QUANTITY DESC

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
SELECT PRODUCT_ID,PRODUCT_NAME FROM PRODUCTS

--6.Write an SQL query to calculate the average order value for each customer. Include the
--customer's name and their average order value.
SELECT C.CUSTOMER_ID,CONCAT(C.FIRST_NAME,' ',C.LAST_NAME) AS CUSTOMER_NAME, AVG(O.TOTAL_AMOUNT) AS AVERAGE_AMT FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID 
GROUP BY C.CUSTOMER_ID,CONCAT(C.FIRST_NAME, ' ', C.LAST_NAME)

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID,
--customer information, and the total revenue.
SELECT
    O.ORDER_ID,
    CONCAT(C.FIRST_NAME, ' ', C.LAST_NAME) AS CUSTOMER_NAME,
    C.EMAIL AS CUSTOMER_EMAIL,
    C.PHONE_NUMBER AS CUSTOMER_PHONE_NUMBER,
    C.ADDRESS AS CUSTOMER_ADDRESS,
    MAX(OD.QUANTITY * O.TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM
    ORDERS O
JOIN
    CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
JOIN
    ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
GROUP BY
    O.ORDER_ID, C.FIRST_NAME, C.LAST_NAME, C.EMAIL, C.PHONE_NUMBER, C.ADDRESS
ORDER BY
    TOTAL_REVENUE DESC

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT P.PRODUCT_ID,P.PRODUCT_NAME, COUNT(OD.PRODUCT_ID) AS ORDER_COUNT
FROM PRODUCTS P
JOIN ORDER_DETAILS OD ON P.PRODUCT_ID = OD.PRODUCT_ID
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME;

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
--Allow users to input the product name as a parameter.
declare @ElectronicGadget varchar(100)
set @ElectronicGadget = 'laptop'

SELECT DISTINCT C.CUSTOMER_ID,CONCAT(C.FIRST_NAME, ' ', C.LAST_NAME) AS CUSTOMER_NAME,C.EMAIL AS CUSTOMER_EMAIL,
 C.PHONE_NUMBER AS CUSTOMER_PHONE_NUMBER,C.ADDRESS AS CUSTOMER_ADDRESS FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
JOIN PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
WHERE  P.PRODUCT_NAME = @ElectronicGadget


--10. Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.
DECLARE @StartDate DATETIME = '2024-01-01'; 
DECLARE @EndDate DATETIME = '2024-12-31';   

SELECT SUM(OD.QUANTITY * O.TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM ORDERS O
JOIN ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
WHERE O.ORDER_DATE >= @StartDate AND O.ORDER_DATE <= @EndDate;

	
--Task 4. Subquery and its type:

--1. Write an SQL query to find out which customers have not placed any orders.
select c.customer_id,concat(c.first_name,' ',c.last_name) as  customer_name from customers c left join orders o 
on c.customer_id =o.order_id where o.order_id is null

--2. Write an SQL query to find the total number of products available for sale. 
select count(quantity_in_stock) as sales_products from inventory

--3. Write an SQL query to calculate the total revenue generated by TechShop. 
select sum(total_amount) as Total_Revenue from ORDERS

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
CREATE TABLE CATEGORIES(
CATEGORY_ID INT IDENTITY(1,1),
CATEGORY_NAME VARCHAR(100) NOT NULL)

select * from categories
insert into categories values('phone'),('laptop'),('wifi-providers'),('output devices')
alter table products add category varchar(100)
update products set category='phone' where product_name in ('Smartphone','headphones','tablet','camera')
update products set category='laptop' where product_name in ('laptop','mouse','gaming console')
update products set category='wifi providers' where product_name in ('router')
update products set category='output devices' where product_name in ('printer','speaker')
update products set category='watch' where product_name='smartwatch'

alter table products drop column id
select * from PRODUCTS

delete from products where category_id=3

select * from PRODUCTS

alter table categories
add constraint  pk primary key(category_id)
ALTER TABLE products
ADD category_id INT REFERENCES categories(category_id);

DECLARE @CategoryName VARCHAR(100) = 'phone'
SELECT AVG(OD.QUANTITY) AS AVERAGE_QUANTITY_ORDERED
FROM ORDER_DETAILS OD
JOIN PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID
WHERE C.CATEGORY_NAME = @CategoryName;

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.
DECLARE @CUSTOMER_NEW_ID  INT
SET @CUSTOMER_NEW_ID=18
SELECT SUM(OD.QUANTITY * O.TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM ORDERS O
JOIN ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
WHERE O.CUSTOMER_ID = @CUSTOMER_NEW_ID
SELECT * FROM CUSTOMERS
--6. Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.
SELECT FIRST_NAME + ' ' + LAST_NAME AS CUSTOMER_NAME,ORDER_COUNT AS NUM_ORDERS
FROM CUSTOMERS
WHERE ORDER_COUNT = (SELECT MAX(ORDER_COUNT) FROM CUSTOMERS)

--7. Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.

SELECT C.CATEGORY_NAME AS MOST_POPULAR_CATEGORY,SUM(OD.QUANTITY) AS TOTAL_QUANTITY_ORDERED
FROM CATEGORIES C
JOIN PRODUCTS P ON C.CATEGORY_ID = P.CATEGORY_ID
JOIN ORDER_DETAILS OD ON P.PRODUCT_ID = OD.PRODUCT_ID
GROUP BY C.CATEGORY_NAME
ORDER BY TOTAL_QUANTITY_ORDERED DESC

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
--on electronic gadgets. List their name and total spending.
SELECT C.FIRST_NAME + ' ' + C.LAST_NAME AS CUSTOMER_NAME,SUM(OD.QUANTITY * P.PRICE) AS TOTAL_SPENDING
FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN ORDER_DETAILS OD ON O.ORDER_ID = OD.ORDER_ID
JOIN PRODUCTS P ON OD.PRODUCT_ID = P.PRODUCT_ID
JOIN CATEGORIES CAT ON P.CATEGORY_ID = CAT.CATEGORY_ID
WHERE CAT.CATEGORY_NAME = 'phone'
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME
ORDER BY TOTAL_SPENDING DESC


--9. Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.

SELECT AVG(TOTAL_REVENUE) AS AVERAGE_ORDER_VALUE
FROM (SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE,COUNT(*) AS NUM_ORDERS FROM ORDERS) AS RevenueOrders;

-- Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.

select first_name+' '+last_name,order_count from customers order by order_count desc