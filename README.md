# Online-book-store-.-sql
#  Online Book Store Management System (SQL Project)

##  Project Overview
This project is an SQL-based Online Book Store Management System designed to manage books, customers, and orders efficiently. It demonstrates real-world database design and data analysis using structured queries.

##  Objectives
- Design a relational database for an online bookstore
- Manage book inventory and customer data
- Track and analyze orders and sales
- Generate meaningful business insights using SQL

##  Tools & Technologies
- SQL
- PostgreSQL

##  Database Schema

### Books Table
- book_id (Primary Key)
- title
- author
- genre
- published_year
- price
- stock

###  Customers Table
- customer_id (Primary Key)
- name
- email
- phone
- city
- country

###  Orders Table
- orders_id (Primary Key)
- customer_id (Foreign Key)
- book_id (Foreign Key)
- order_date
- quantity
- total_amount

##  Key Features
- Creation of relational tables with constraints
- Data retrieval using SELECT queries
- Filtering using WHERE clause
- Sorting using ORDER BY
- Aggregate functions (SUM, AVG, COUNT)
- Use of JOINs (INNER JOIN, LEFT JOIN, FULL OUTER JOIN)
- GROUP BY and HAVING for analysis

##  Key SQL Queries & Insights

### 🔹 1. Genre-based Book Retrieval
Retrieve all books under a specific genre.

### 🔹 2. Sales & Revenue Analysis
- Total revenue generated from all orders
- Most frequently ordered book
- Top 3 most expensive books in a category

### 🔹 3. Customer Analysis
- Customers who placed multiple orders
- Top spending customer
- Customers based on location

### 🔹 4. Inventory Management
- Total stock available
- Book with lowest stock
- Remaining stock after fulfilling orders

### 🔹 5. Advanced Joins
- INNER JOIN for matching records
- LEFT JOIN for all books with orders
- FULL OUTER JOIN to include all customers and orders

##  Key Insights
- Identified top-performing customers based on spending
- Analyzed sales trends and revenue generation
- Evaluated stock availability and inventory status
- Extracted meaningful patterns using SQL joins and aggregations

##  Future Enhancements
- Add payment and shipping details
- Implement stored procedures and triggers
- Integrate with a frontend application
- Build interactive dashboards using Power BI

##  Screenshots
(Add your SQL output screenshots here)

##  Project Structure
- `books.sql` → Table creation and queries
- `customer.sql` → Customer data queries
- `orders.sql` → Order management queries
- `analysis.sql` → Advanced SQL queries

## 📬 Contact
Feel free to connect with me for feedback, suggestions, or collaboration opportunities.
