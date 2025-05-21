create database Assignment;
use assignment;

#Creating table countries
show tables;
drop table if exists countries;
insert into  countries values('china',1382,'beijing'),
						     ('india',1326,'delhi');
insert into countries values ('united states',324,'washington D.C.'),
                             ('indonesia',260,'jakarta'),
                             ('brazil',209,'brasilia'),
                             ('pakistan',193,'islamabad'),
                             ('nigeria',187,'abuja'),
                             ('bangladesh',163,'dhaka'),
                             ('russia',143,'moscow'),
                             ('mexico',128,'mexico city'),
                             ('japan',126,'tokyo'),
                             ('philippines',102,'manila'),
                             ('ethiopia',101,'addis ababa'),
                             ('vietnam',94,'hanoi'),
                             ('egypt',93,'cairo'),
                             ('germany',81,'berlin'),
                             ('iran',80,'tehran'),
                             ('turkey',79,'ankara'),
                             ('congo',79,'kinshasa'),
                             ('france',64,'paris'),
                             ('united kingdom',65,'london'),
                             ('italy',60,'rome'),
                             ('south africa',55,'pretoria'),
                             ('myanmar',54,'naypyidaw');
                             
# changing delhi to new delhi 
update countries set capital ='new delhi'
               where capital ='delhi';		
               
# creating the following tables using auto increment wherever applicable 
create table product (product_id int primary key auto_increment,
                      product_name varchar(30) not null unique,
                      supplier_id int not null,
                      foreign key (supplier_id) references suppliers(supplier_id))
                      auto_increment = 101;
create table suppliers (supplier_id int primary key auto_increment,
                        supplier_name varchar(30) not null,
                        location varchar(30) not null);
create table stock     (id int primary key auto_increment,
                        product_id int,
                        balance_stock int,
                        foreign key(product_id) references product(product_id))
                        auto_increment = 201;
                        
truncate table stock;
set foreign_key_checks=1;
truncate table product;
truncate table suppliers;
drop table product;
drop table suppliers;
drop table stock;
                        
insert into suppliers values (1,'Rohit' , 'Mumbai'),
							 (2,'Rohan' , 'Pune'),
							 (3,'Raman' , 'Hisar'),
							 (4,'Anuj', 'Gurugram'),
							 (5,'Himanshi','Goa');                             

insert into product (product_name, supplier_id) values ('laptop',1),
													   ('Mobile',2),
                                                       ('LCD',3),
                                                       ('fan',4),
                                                       ('AC',5);                        

insert into stock (product_id,balance_stock) values (101,1507),
                                                    (102,1670),
									                (103,1390),
									                (104,1700),
													(105,1800);

alter table suppliers modify supplier_name varchar(30) unique not null;

alter table emp add column deptno int;
update emp set deptno = 
case  
when emp_no%2=0 then 20
when emp_no%3=0 then 30
when emp_no%4=0 then 40
when emp_no%5=0 then 50
else 10
end;

alter table emp modify emp_no int unique;

create view  emp_sal as
select  emp_no, first_name, last_name,salary
from emp order by salary desc;			
											#--set2--#
select fname,lname,deptno,salary from employee where (deptno=10 and salary>3000);                                            
select fname,lname,deptno,salary from employee where salary >3000 order by deptno limit 1;  

select count(marks) as first_count from students where marks between 50 and 80;
select count(marks) as distinction from students where marks between 81 and 100;  
select count(grade) as distinction from students where grade = 'distinction';
select count(grade) as first_class from students where grade = 'first class';
select count(grade) as second_class from students where grade = 'second class';
select count(grade) as failed from students where grade = 'fail';       

select distinct(id) from station where id%2=0 order by id;   
select distinct(city),state from station where id%2=0 order by city;
select count(city)-count(distinct(city)) as 'n-n1' from station;        

select distinct* from station where left(city,1) = 'a' or
                                    left(city,1) = 'e' or
                                    left(city,1) = 'i' or
                                    left(city,1) = 'o' or
                                    left(city,1) = 'u';                  

select distinct* from station where city like 'a%a' or
                                    city like 'e%e' or
                                    city like 'i%i' or
                                    city like 'o%o' or
                                    city like 'u%u';

select distinct* from station where left(city,1) != 'a' or
                                    left(city,1) != 'e' or
                                    left(city,1) != 'i' or
                                    left(city,1) != 'o' or
                                    left(city,1) != 'u'; 
                                    
select distinct * from station where left(city,1) not in ('a','e','i','o','u')
						         or right(city,1) not in ('a','e','i','o','u'); 

select deptno,sum(salary)as total_salary from employee group by deptno order by deptno;
select name,population from city where population >100000; 
select district, sum(population) as total_population from city where district='california';
select  countrycode as country,district,avg(population) from city group by district,countrycode;                                 
select ordernumber,status,o.customernumber,customername,comments from orders o join customers c on (o.customerNumber=c.customerNumber) where status='disputed'; 
select first_name,salary,hire_date from emp where salary>2000 and datediff(curdate(),hire_date)<60*30 order by hire_date desc;   

select * from emp_sal;                             

-- ---------------------------------------SET 3--------------------------------------------
SHOW TABLES;
SELECT * FROM PAYMENTS;
SELECT CUSTOMERNUMBER,CUSTOMERNAME,PUR_STATUS(CUSTOMERNUMBER) FROM CUSTOMERS;
SELECT * FROM MOVIES;
SELECT * FROM RENTALS;
SELECT * FROM 
(SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RANKED_SALARY,SALARY,FIRST_NAME FROM EMP) T2 WHERE RANKED_SALARY =3;

SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RANKED_SALARY,SALARY,FIRST_NAME FROM EMP