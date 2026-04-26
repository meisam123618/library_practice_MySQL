use library_practice;
/*----------------------------------------------Creating table members--------------------------------------------------*/
create table members
(
member_id smallint unsigned auto_increment primary key,
fname varchar(20),
lname varchar(20),
gender enum ('M','F'),
birth_date date,
email varchar(100),
city varchar(40),
join_date timestamp,
is_active boolean
);
/*----------------------------------------------Creating table books----------------------------------------------------*/
create table books
(
book_id smallint unsigned auto_increment primary key,
title varchar(100) not null,
author varchar(80),
gender enum('Novel','Science','History','Computer','Other'),
publish_year year,
price float(5,2),
created_at timestamp default current_timestamp
);
/*--------------------------------------------Creating table loan-------------------------------------------------------*/
create table loan
(
loan_id smallint unsigned auto_increment primary key,
member_id smallint unsigned,
book_id smallint unsigned,
loan_date date not null,
due_date date not null,
return_date date,
status enum('Open','Retuened','Late'),
constraint fk_loan_member_id foreign key (member_id) references members(member_id),
constraint fk_loan_book_id foreign key (book_id) references books(book_id)
);
/*--------------------------------------inserting some samples to  table members----------------------------------------*/
insert into members 
(member_id, fname, lname, gender, birth_date, email, city, join_date, is_active)
values (null, 'Sara', 'Ahmadi', 'F', '1998-04-10', 'sara@example.com', 'Pavia', now(), true);

insert into members 
(member_id, fname, lname, gender, birth_date, email, city, join_date, is_active)
values (null, 'Ali', 'Rezaei', 'M', '1995-11-21', 'ali@example.com', 'Milan', now(), true);

insert into members 
(member_id, fname, lname, gender, birth_date, email, city, join_date, is_active)
values (null, 'Mina', 'Karimi', 'F', '2000-01-05', 'mina@example.com', 'Tehran', now(), true);
/*--------------------------------------fixing dictation problem in column name-----------------------------------------*/
alter table books rename column gender to genre;
/*---------------------------------------inserting some samples to  table books-----------------------------------------*/
insert into books
(book_id, title, author, genre, publish_year, price, created_at) 
values(null , 'Learning SQL','Alan Beaulieu', 'Science', '2020', '39.90', now());

insert into books
(book_id, title, author, genre, publish_year, price, created_at) 
values(null , 'Clean Code','Robert Martin', 'Science', '2008', '45.50', now());

insert into books
(book_id, title, author, genre, publish_year, price, created_at) 
values(null , 'A Brief History of Time','Stephen Hawking', 'Science', '1988', '30.00', now());

insert into books
(book_id, title, author, genre, publish_year, price, created_at) 
values(null , 'The Name of the Rose','Umberto Eco', 'Novel', '1980', '22.75', now());
/*--------------------------------------insertin some samples to table loan---------------------------------------------*/
insert into loan
(loan_id, member_id, book_id, loan_date, due_date, return_date, status)
values(null, '1', '1', '2026-04-01', '2026-04-15', null, 'open');

alter table loan modify status enum('Open','Returned','Late');

insert into loan
(loan_id, member_id, book_id, loan_date, due_date, return_date, status)
values(null, '1', '2', '2026-04-05', '2026-04-20', '2026-04-12', 'returned');

insert into loan
(loan_id, member_id, book_id, loan_date, due_date, return_date, status)
values(null, '2', '3', '2026-04-10', '2026-04-24', null, 'open');
/*-----------------------------------showing table members contents-----------------------------------------------------*/
select fname, lname, city from members;
/*-----------------------------------showing active members from table members------------------------------------------*/
select fname, lname,is_active from members where is_active='1';
/*------------------------------------showing scientific books from table books-----------------------------------------*/
select book_id, title, genre from books where genre='science';
/*------------------------------------showing and ordering table books by brice descending------------------------------*/
select * from books order by price;
/*-------------------------------------showing and ordering table books by publish year descending----------------------*/
select * from books order by publish_year desc;
/*-------------------------------------showing open status loans from table loan----------------------------------------*/
select * from loan where status='open';
/*-------------------------------------changing some details from table members-----------------------------------------*/
update members set city='Rome' where member_id='2' and city='milan';
/*-------------------------------------changing some details from table loan--------------------------------------------*/
update loan set status='Returned' where loan_id='3' and status='Open';
/*-------------------------------------changing some details from table books-------------------------------------------*/
update books set price='35.90' where book_id='1' and price='39.90';
/*------------------------------------inserting and deleting a test record to table books-------------------------------*/
insert into members
(member_id, fname, lname, gender, birth_date, email, city, join_date, is_active)
values(null, 'test','test', 'M', '1999-03-12', 'test@test.com', 'Pavia', '2026-12-12', true);

delete from members where member_id='4';
/*-----------------------------------trying to get primary key unique error---------------------------------------------*/
/*
insert into books
(book_id, title, author, genre, publish_year, price, created_at)
values ('2', 'getting error', 'getting error', 'getting error', 'getiing error', '22.22', now())
*/
/*-----------------------------------trying to get foreign key error----------------------------------------------------*/
/*
insert into loan
(loan_id, member_id, book_id, loan_date, due_date, status)
values (null, '999', '2', '2026-03-23', '2026-12-30', 'open');
*/
/*-----------------------------------trying to get ENUM error-----------------------------------------------------------*/
/*
insert into members
(member_id, fname, lname, gender, birth_date, email, city, join_date, is_active)
values(null, 'test', 'testie', 'X', '2026-12-12', 'test@testie.com', 'tehran', '2026-12-01', true);
*/
/*------------------------------------trying to get invalid date format error-------------------------------------------*/
/*
insert into members
(member_id, fname, lname, gender, birth_date, email, city, join_date, is_active)
values(null, 'test','testie', 'M', 'APR-04-2024', 'test@test.com','Pavia', now(), true);
*/
/*-------------------------------------showing tables and describing them----------------------------------------------*/
show tables;
desc members;
desc books;
desc loan;