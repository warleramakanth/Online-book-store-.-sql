--create table books
drop table if exists books;
create table books(
book_id serial primary key,
title varchar (100)not null,
author_ varchar ,
gener varchar,
published_year int ,
price numeric,
stock int
);
--to run
select * from books;

--create table customers
create table customer(
customer_id serial primary key,
name_ varchar (50) not null,
email varchar,
phone bigint,
city varchar,
country varchar);
--to run
select * from customer;

--create table order
create table orders(
orders_id serial primary key,
customer_id int references customer(customer_id),
book_id int references books(book_id),
order_date date,
quantity int ,
total_amount numeric(10,2)); 
select * from orders;

select *from books;

-- 1) Retrieve all books in the "Fiction" genre:

SELECT *
FROM Books 
WHERE GENER = 'fiction' ;

-- 2) Find books published after the year 1950:
SELECT * FROM Books 
WHERE Published_year >= 1950;

select * from books
where published_year >=1920;

-- 3) List all customers from the Canada:
SELECT name_,email
FROM Customer 
WHERE country='Canada';

SELECT *
FROM Customer 
WHERE country='Canada';


-- 4) Show orders placed in November 2023:

SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT  SUM(stock) AS Total_Stock
From Books;


-- 6) Find the details of the most expensive book:
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 20;


-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders 
WHERE quantity>1;



-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders 
WHERE total_amount>20;



-- 9) List all genres available in the Books table:
SELECT DISTINCT genER FROM Books;


-- 10) Find the book with the lowest stock:
SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;


select *
from books b
inner join orders o
on b.book_id = o.orders_id;


-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) As Revenue 
FROM Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT * FROM orders;

SELECT b.Gener, SUM(o.Quantity) AS Total_Books_sold
FROM orders o
JOIN Books b 
ON o.book_id = b.book_id
GROUP BY b.Gener;


-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Gener = 'Fantasy';


--List customers who have placed at least 2 orders:
--(Returns customer's who have placed at least two orders along with their order count).
SELECT  o.customer_id, c.name_,count(o.orders_id)as order_count
FROM orders o
JOIN customer c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name_
HAVING COUNT(Orders_id) >=2;

SELECT * 
FROM orders o
JOIN customer c ON o.customer_id=c.customer_id;


-- 4) Find the most frequently ordered book:
SELECT o.Book_id, b.title, COUNT(o.orders_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE gener ='Fantasy'
ORDER BY price DESC LIMIT 3;


-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.author_, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b
ON o.book_id=b.book_id
GROUP BY b.Author_;

--left join 
select *
from books b
left join customer c
on b. book_id = c. customer_id;



-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customer c ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;


--Find the customer who spent the most on orders:
--(Returns the customer with the higest total purchase amount).
SELECT c.customer_id, c.name_, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customer c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name_
ORDER BY Total_spent Desc LIMIT 1;


--Calculate the stock remaining after fulfilling all orders:
--(Shows each book's stock, total orders and remaining quantity after sales).
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;

--10)inner join with {customer & orders} data in asc.
select *
from customer c
inner join orders o
on c.customer_id = o.customer_id
order by c.customer_id asc , o.customer_id asc;


--full outer join with {customer & orders} data in asc:
--(All customers and orders matched where possible ,sorted in ascending orders).
SELECT *
FROM customer c
full outer join orders o
ON c.customer_id = o.customer_id
order by c.customer_id asc, o.orders_id asc;



