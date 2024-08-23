create database Marketco;
use Marketco;
create table company (companyid int primary key, company_name varchar(45), street varchar(45),
 city varchar(45), state varchar(2), zip varchar(10));

create table contact (contactid int primary key, companyid int, first_name varchar(45), last_name varchar(45), street varchar(45),
 city varchar(45), state varchar(2), zip varchar(10), ismain boolean, email  varchar(45), phone varchar(12), 
 foreign key (companyid) references company(companyid));
 
 create table contact_employee (contact_employee_id int primary key, contactid int, employeeid int, contact_date date,
 description varchar(100),
 foreign key (contactid) references contact(contactid) ,foreign key (employeeid) references employee (employeeid));
 
 drop table contact_employee;
 
 create table employee(employeeid int primary key, first_name varchar(45), last_name varchar (45), salary decimal(10,2), hire_date date, 
 job_title varchar(25), email varchar(45), phone varchar(12));
 
 insert into company (companyid, company_name, street, city, state, zip) values (101, 'Urban Outfitters,inc.',
 'Manjalpur', 'Vadodara', 'GJ', 390011), 
 (102, 'Rural mnc', 'Alkapuri', 'Pune', 'MH', 675849),
 (103, 'Infosys', 'Sevasi', 'Gurugram', 'DL', 564738);
 
 insert into company (companyid, company_name, street, city, state, zip) values (104, 'TCS', 'Makarpura', 'Chennai', 'TN', 457264);
 
 insert into contact (contactid, companyid, first_name, last_name, street, city, state, zip, ismain, email, phone) values
(01,101,'Leyley','Bland','Manjalpur', 'Vadodara', 'GJ', 390011, 0, '123@gmail.com', 2314569874),
(02,102,'Dianne', 'connor', 'Alkapuri', 'Pune', 'MH', 675849, 1, '456@gmail.com', 2453657546),
(03,103,'Jack', 'Lee', 'Sevasi', 'Gurugram', 'DL', 564738, 1, '789@gmail.com', 2893567415),
(04,104, 'Toll', 'Brothers', 'Makarpura', 'Chennai', 'TN', 457264, 0, '452@gmail.com', 4562561245);

insert into contact_employee(contact_employee_id, contactid, employeeid, contact_date, description) values
(501,01,701,'2001-12-01', 'Average'),
(502,02,702,'2002-02-04', 'Excellent'),
(503,03,703,'2004-04-17', 'Good'),
(504,04,704,'2005-12-23', 'Bad');

insert into Employee(employeeid, first_name, last_name, salary, hire_date, job_title, email, phone) values
(701, 'Leyley','Bland', 25000, '2022-12-13', 'SQl Developer', '123@gmail.com', 2314569874),
(702, 'Dianne', 'connor', 30000, '2021-06-05', 'java Developer', '456@gmail.com', 2453657546),
(703, 'Jack', 'Lee', 27000, '2023-04-15', 'PHP Developer', '789@gmaiol.com', 2893567415),
(704, 'Toll', 'Brothers', 20000, '2023-07-19', 'C Developer', '452@gmail.com', 4562561245);

update employee set phone = 2155558800 where first_name = 'Leyley' and last_name = 'Bland';

select * from employee;

update company set company_name = 'Urban Outfitters' where company_name = 'Urban Outfitters,inc.';

select * from company;


delete from contact_employee where employeeid between 702 and 703;

select * from contact_employee;

