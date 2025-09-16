create database test;

create table test.demo (sno int);

insert into test.demo (sno) values (1);

select * from test.demo

CREATE DATABASE group_by;
USE group_by;

CREATE TABLE employee(
e_id INT PRIMARY KEY,
e_name VARCHAR(50) NOT NULL,
job_desc VARCHAR(50),
salary int);

INSERT INTO employee
VALUES
(1,'Joseph','Developer',25000),
(2,'Revathy','HR',30000),
(3,'Nisha','Developer',20000),
(4,'Pramoth','HR',35000),
(5,'Malik','Tester',10000),
(6,'Suresh','Tester',15000),
(7,'Shanthi','Admin',8000),
(8,'Sundar','Admin',10000),
(9,'Pramela','Manager',80000),
(10,'Kesavan','CEO',100000),
(11,'Kedharnath','Manager',75000),
(12,'Ameer','Developer',30000),
(13,'Ashok','Tester',30000),
(14,'Sam','Analyst',25000),
(15,'Joshibha','Analyst',35000),
(16,'Hari','Analyst',45000);


select job_desc, sum(salary) from empolyee where job_desc 

CREATE DATABASE constraint_demo;
USE constraint_demo;

CREATE TABLE employeess(
emp_id INT PRIMARY KEY auto_increment,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
salary INT DEFAULT 25000,
age INT CHECK(age>=23)
) ;


INSERT INTO employeess(name,email,age)
VALUES
('Vijay','vijay@gmail.com',26),
('Dhoni','dhoni@gmail.com',25),
('Kohli','kohli@gmail.com',24),
('Dhanush','dhanush@gmail.com',27),
('Raina','raina@gmail.com',24),
('Ajith','ajith@gmail.com',26),
('Jadeja','jaddu@gmail.com',26),
('Rohit','rohit@gmail.com',25),
('Simbu','simbu@gmail.com',24),
('Dravid','Dravid@gmail.com',42),
('Sachin','sachin@gmail.com',43),
('Ganguly','ganguly@gmail.com',44),

select * from employeess;






CREATE DATABASE joins;
USE joins;

CREATE TABLE customers(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(50) NOT NULL,
city VARCHAR(50)
);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
order_detail VARCHAR(50),
order_amount DECIMAL(6,3),
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES customers(cust_id)
);



INSERT INTO customers
VALUES
(101 , 'Gomathi','T Nagar'),
(102,'Kathir','Velachery'),
(103 , 'Guna','Thiruvanmayur'),
(104,'Anees','Velachery'),
(105 , 'Babu','Adayar'),
(106,'Jawahar','Taramani'),
(107,'Deekshaya','Guindy');

INSERT INTO orders
VALUES
(6001,'Briyani',150.0,101),
(6002,'Idly',75.0,103),
(6003,'Fried Rice',120.0,102),
(6004,'Dhal Chawal',100.0,106),
(6005,'Parotta',100.0,101);



select * from customers;
select * from orders;


select *
from customers c
inner join orders o on c.cust_id = o.cust_id;



select c.cust_name, city
from customers c
inner join orders o on c.cust_id = o.cust_id;


select o.order_detail,c.cust_name
from customers c
left join orders o on c.cust_id = o.cust_id;



SELECT c.cust_name ,o.order_amount
from customers c
right join orders o on c.cust_id = o.cust_id;









CREATE DATABASE sub_query;
USE sub_query;

CREATE TABLE student(
rollNo INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
marks INT,
city VARCHAR(50)
);

INSERT INTO student
VALUES
(101,'Abhishek',78,'Trichi'),
(102,'Ram',93,'Madurai'),
(103,'Muthu',85,'Madurai'),
(104,'Rajeshwari',96,'Chennai'),
(105,'Nirmal',92,'Chennai'),
(106,'Shiny',82,'Chennai'),
(107,'Tamil',98,'Madurai'),
(108,'Muthulakshmi',96,'Trinulveli');




select * from student;


select avg(marks) from student;
select name from student where city in(select  city from  student where name='ram');


select * from student
where marks = (select min(marks) from student);

select  mark,name 
from student; 

delimiter $$
create procedure all_student()
begin
select * from student;
end $$

delimiter  ;


call all_students()


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2) DEFAULT 25000,
    hire_date DATE,
    city VARCHAR(50),
    manager_id INT,
    UNIQUE (name)
);

INSERT INTO Employees VALUES
(1, 'Alice', 'IT', 60000, '2020-01-01', 'Chennai', NULL),
(2, 'Bob', 'HR', NULL, '2021-03-10', 'Delhi', 1),
(3, 'Charlie', 'Finance', 50000, '2022-07-15', 'Mumbai', 1),
(4, 'David', 'IT', 72000, '2023-02-20', 'Chennai', 1),
(5, 'Eve', NULL, NULL, '2022-09-25', NULL, 2),
(6, 'Frank', 'Finance', 80000, '2019-12-30', 'Delhi', NULL);




select * from employees;


select max(salary) as highest_salary from employees; 

select avg(salary),department from employees where department = 'finance'

select * from employees 
where name like 'a%'; 

SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT *
FROM (
    SELECT name, salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 5
) AS top_employees;



select * from student;


select * from student where city = 'chennai'

select * from employees where salary >50000;

select * from employees order by salary desc;

select * from employees order by salary desc limit 2;

select department, count(*) as employees_count
from employees
group by department;

select * from employees;

select avg(salary) as avg_salary
from employees
where department = 'finance';

select max(salary) as max_salary
from employees
where department;

SELECT department, SUM(salary) AS total_salary
FROM Employees
WHERE salary IS NOT NULL
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

select department, count(*) as emp_count
from employees
group by department
having count(*) > 1;
 

select min(salary) as min_salary, max(salary) as max_salary
from employees 
where manager_id is not null;


select * from employees 
where name like 'a%';

select * from employees;


select * from employees
where salary is null ;

select * from employees
where city is not null; 


select name , ifnull(salary,'not assigned') as salary
from employees;

CREATE DATABASE books;

use books;

CREATE TABLE Books (
    book_id INT primary key,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    total_copies INT,
    available_copies INT
);
  

INSERT INTO Books VALUES
(1, 'Harry Potter', 'J.K. Rowling', 'Fantasy', 5, 2),
(2, 'The Alchemist', 'Paulo Coelho', 'Fiction', 3, 1),
(3, 'Atomic Habits', 'James Clear', 'Self-help', 4, 4),
(4,'a brif histroy of time','stephen hawking','science',5,4),
(5,'wings of fire','a.p.j.abdul kalam','biography',3,2);


select * from books;

select * from books where title like '%harry%';

select title from books;

select b.title,a.authorname
from books b
join author a on b.authorid = a.authorid;


-- 1. Customers Table (10 rows)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers (FirstName, LastName, Email, City, Country) VALUES
('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Delhi', 'India'),
('Meera', 'Sharma', 'meera.sharma@example.com', 'Mumbai', 'India'),
('John', 'Smith', 'john.smith@example.com', 'New York', 'USA'),
('Emily', 'Brown', 'emily.brown@example.com', 'London', 'UK'),
('Rahul', 'Patel', 'rahul.patel@example.com', 'Ahmedabad', 'India'),
('Sophia', 'Johnson', 'sophia.j@example.com', 'Toronto', 'Canada'),
('Ali', 'Hassan', 'ali.hassan@example.com', 'Dubai', 'UAE'),
('Wei', 'Chen', 'wei.chen@example.com', 'Beijing', 'China'),
('Maria', 'Lopez', 'maria.lopez@example.com', 'Madrid', 'Spain'),
('David', 'Miller', 'david.miller@example.com', 'Berlin', 'Germany');

-- 2. Products Table (15 rows)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 65000, 50),
('Smartphone', 'Electronics', 30000, 100),
('Headphones', 'Electronics', 2000, 200),
('Keyboard', 'Electronics', 1500, 150),
('Mouse', 'Electronics', 800, 180),
('Smartwatch', 'Electronics', 12000, 75),
('Shoes', 'Fashion', 2500, 120),
('T-Shirt', 'Fashion', 800, 250),
('Jeans', 'Fashion', 2000, 150),
('Jacket', 'Fashion', 3500, 100),
('Refrigerator', 'Appliances', 40000, 40),
('Microwave', 'Appliances', 15000, 60),
('Mixer Grinder', 'Appliances', 5000, 80),
('Table', 'Furniture', 7000, 30),
('Chair', 'Furniture', 3000, 50);

-- 3. Orders Table (15 rows)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(12,2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2025-01-10', 65000, 'Delivered'),
(2, '2025-01-15', 32000, 'Shipped'),
(3, '2025-01-20', 3500, 'Pending'),
(4, '2025-01-22', 2000, 'Delivered'),
(5, '2025-01-25', 800, 'Cancelled'),
(6, '2025-02-01', 15000, 'Delivered'),
(7, '2025-02-03', 2500, 'Shipped'),
(8, '2025-02-05', 7000, 'Pending'),
(9, '2025-02-07', 3000, 'Delivered'),
(10, '2025-02-10', 12000, 'Delivered'),
(1, '2025-02-12', 2000, 'Shipped'),
(3, '2025-02-14', 40000, 'Delivered'),
(5, '2025-02-15', 5000, 'Pending'),
(7, '2025-02-18', 2500, 'Delivered'),
(9, '2025-02-20', 15000, 'Shipped');

-- 4. OrderDetails Table (10 rows)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 65000),
(2, 2, 1, 30000),
(2, 3, 1, 2000),
(3, 10, 1, 3500),
(4, 4, 1, 2000),
(5, 5, 1, 800),
(6, 12, 1, 15000),
(7, 7, 1, 2500),
(8, 14, 1, 7000),
(9, 15, 1, 3000);

-- 1. List all customers from India
SELECT * FROM Customers WHERE Country = 'India';

-- 2. Show all products in the Electronics category
SELECT ProductName, Price FROM Products WHERE Category = 'Electronics';

-- 3. Find all orders with status = 'Delivered'
SELECT OrderID, CustomerID, TotalAmount, OrderDate
FROM Orders
WHERE Status = 'Delivered';

-- 4. Get customer names and their orders
SELECT c.FirstName, c.LastName, o.OrderID, o.TotalAmount, o.Status
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 5. Show order details with product names
SELECT o.OrderID, p.ProductName, od.Quantity, od.Price
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

-- 6. Count how many orders each customer made
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- 7. Find the total revenue generated
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

-- 8. Find the top 3 most expensive products
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3;

