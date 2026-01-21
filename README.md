# Library Management System Analysis Using SQL

## Project Overview
This project demonstrates a Library Management System built using SQL. The main objective was to design a relational database and perform data analysis operations such as book issuance tracking, revenue calculation, member activity analysis, and employee-branch relationships.

This project was created to practice real-world SQL concepts including table relationships, constraints, joins, aggregation, and reporting queries.
Dataset credit goes to the original creator. This project was used for learning and practice purposes.

---

## Database Schema

The project consists of the following tables:

- branch — Stores library branch information  
- employees — Stores employee and manager details  
- books — Contains book inventory information  
- members — Stores registered library members  
- issued_status — Tracks book issue transactions  
- return_status — Tracks returned books  

Foreign key relationships were used to maintain data integrity between tables.

---

## Tools & Technologies Used

- Microsoft Excel (Initial Data Inspection and Cleaning)
- MySQL (Relational Database)
- MySQL Workbench (SQL IDE and Database Management Tool)
- SQL

### SQL Concepts Practiced

- Table creation & normalization  
- Primary & Foreign Keys  
- INSERT, UPDATE, DELETE operations  
- JOINs (INNER JOIN, LEFT JOIN)  
- GROUP BY & HAVING  
- Aggregate functions (COUNT, SUM)  
- CTAS (Create Table As Select)  
- Date filtering  
- Subquery-style reporting logic  

---

## Business Problems Solved

This project answers the following business questions:

1. Add new books to the library system  
2. Update member information  
3. Track books issued by employees  
4. Identify members who borrow frequently  
5. Generate book issue summary reports  
6. Filter books by category  
7. Calculate rental income by category  
8. Track recently registered members  
9. Display employee and manager hierarchy  
10. Identify books that are currently not returned  

---

## Key Queries & Insights

### Frequent Borrowers
Identified members who issued more than one book using GROUP BY and HAVING clause.

### Revenue Analysis
Calculated total rental income grouped by book category.

### Inventory Monitoring
Detected books that have been issued but not yet returned using LEFT JOIN and NULL filtering.

### Operational Reporting
Created summary tables using CTAS for reporting and analysis purposes.

---

## Project Structure
/Data/ → Contains all project CSV datasets  
/Library management system queries.sql → SQL queries 
README.md → Project documentation
