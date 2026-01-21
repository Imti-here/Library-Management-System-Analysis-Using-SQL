-- SQL Library system management project

-- Creating branch table

create table branch(
branch_id varchar(255) primary key,
manager_id varchar(255),
branch_address varchar(255),
contact_no varchar(255)
);

-- Creating employees table

create table employees(
emp_id varchar(255) primary key,
emp_name varchar(255),
position varchar(255),
salary int,
branch_id varchar(255) -- FK
);

-- Creating books table

create table books(
isbn varchar(255) primary key,
book_title varchar(255),
category varchar(255),
rental_price float,
status varchar(255),
author varchar(255),
publisher varchar(255)
);

-- Creating members table

create table members(
member_id varchar(255) primary key,
member_name varchar(255),
member_address varchar(255),
reg_date date
);

-- Creating issued_status table

create table issued_status(
issued_id varchar(255) primary key,
issued_member_id varchar(255), -- FK
issued_book_name varchar(255),
issued_date date,
issued_book_isbn varchar(255), -- FK
issued_emp_id varchar(255) -- FK
);

-- Creating return_status table

create table return_status(
return_id varchar(255) primary key,
issued_id varchar(255),
return_book_name varchar(255),
return_date date,
return_book_isbn varchar(255)
);

-- Adding foreign keys

alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);

-- Insert values into the tables

-- Project tasks:

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn, book_title, category, rental_price, status, author, publisher) 
values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address

update members
set member_address = '125 main st'
where member_id = 'C101';

-- Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.
-- NOTE: Since the issued_id = 'IS104' is still referenced in the return_status table, we can not update or delete it. So, we will try any other issued_id that is not present in the return_status table

delete from issued_status
where issued_id = 'IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

select*from issued_status
where issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

select issued_member_id, count(issued_book_name) as issued_books
from issued_status
group by issued_member_id
having count(issued_book_name)>1;

-- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

create table book_counts
select a.isbn, a.book_title, count(b.issued_book_isbn) as issued_count from books as a
join
issued_status as b
on b.issued_book_isbn = a.isbn
group by a.isbn;

-- Task 7. Retrieve All Books in a Specific Category:

select*from books
where category = 'Classic';

-- Task 8: Find Total Rental Income by Category:

select a.category, sum(a.rental_price) as total_rental_income, count(*) as number_of_books
from books as a
join
issued_status as b
on b.issued_book_isbn = a.isbn
group by 1;

-- Task 9: List Members Who Registered in the Last 180 Days:

select*from members
where reg_date >= current_date() - interval(180)day;

-- Task 10: List Employees with Their Branch Manager's Name and their branch details:

select a.emp_id, a.emp_name, a.position, a.salary, a.branch_id, b.manager_id, c.emp_name as manager_name, b.branch_address, b.contact_no
from employees as a
join branch as b
on a.branch_id = b.branch_id

join employees as c 
on b.manager_id = c.emp_id
order by emp_id;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold (suppose 7USD):

create table book_prices_greater_than_seven
select*from books
where rental_price > 7;

-- Task 12: Retrieve the List of Books Not Yet Returned:

select a.issued_id, a.issued_member_id, a.issued_book_name, a.issued_date, a.issued_book_isbn, a.issued_emp_id from issued_status as a
left join
return_status as b
on a.issued_id = b.issued_id
where b.return_id is null;