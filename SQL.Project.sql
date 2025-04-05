create database abc;
use abc;

create table Box 
(mobile int(11) not null, address varchar(50) not null, date timestamp default current_timestamp);

insert into Box (mobile, address) values (951039378, "Baroda");

select mobile from Box;
select * from Box;

update Box 
set Date = "2024-11-28"
where address = "Ahmedabad";

insert into Box (mobile, address) values (653657346, "Ahmedabad");

alter table Box
add column Id int(5);


update Box 
set Id= 1
where address = "Baroda";

truncate Box;

drop table Box;




-- foreign key / primary key --

create table t1
(id int primary key, name varchar(50),address varchar(50));

insert into t1 values (1, 'Rajvi', 'Baroda'),
(2, 'Drashya', 'Ahmedabad'),
(3, 'Palak', 'Surat');

select * from t1;

create table t2
(id int, car_name varchar(50), price int ,foreign key (id) references t1 (id) );

insert into t2 values (1, 'Swift', 800000),
(2, 'Lexus', 5000000 ),
(3, 'Alto', 500000);

drop table t2;

select * from t2;
-- jois --
select t1.id, t1.name, t2.car_name, t2.price from t1 inner join t2 on t1.id = t2.id;

insert into t1 values (4, 'samarth', 'Rajkot' );

select t1.id, t1.name, t2.car_name, t2.price from t1 right join t2 on t1.id = t2.id
union
select t1.id, t1.name, t2.car_name, t2.price from t1 left join t2 on t1.id = t2.id;


-- trigger -- 

create table employees (
         id int auto_increment primary key, 
         name varchar(100),
         position varchar(100),
         salary decimal(10, 2),
         last_updated timestamp 
         );

delimiter //

create trigger before_employees_insert 
before insert on employees
for each row
begin
set new.last_updated = now(); 

end //
delimiter ;

insert into employees  (name, position, salary) 
values 
('Rajvi', 'Marketing manager', 800000),('Aniket', 'Freelancer', 500000);

select * from employees;

update employees 
set salary = 3000000
where id = 1;


update employees 
set salary = 4000
where id = 1;


DELIMITER //

CREATE TRIGGER before_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        SET NEW.last_updated = NOW();
    END IF;
END //

DELIMITER ;

drop trigger after_salary_update;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

create database ct;
create table clothes 
(Brand varchar(30), Category varchar(30), Color varchar(30), Size varchar(30), Material varchar(30), price int not null);

use ct;
select * from clothes;

select * FROM clothes where Brand = "New Balance" and Size = "M";

select * from clothes where Material = "Cotton";

select * from clothes where Material = "Cotton" and price >=80;

select count(*) from clothes where Material = "Cotton" and price >=80;

select * from clothes where Brand in  ("New Balance" , "Adidas")  and Category = "Dress" and Color = "White" and Material = "Nylon"and price >= 100;

select count(*) from clothes   where Brand = "New Balance";

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT COUNT(*) AS total_count
FROM clothes
WHERE Brand = "New Balance"
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/output.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';


select Brand, count(*)  FROM clothes group by Brand;

select Brand, count(*) AS brand_count
from clothes
group by Brand
order by brand_count desc
limit 1;

select Brand, count(*) AS brand_count
from clothesclothes
where Category = "Dress"
group by Brand
order by brand_count desc
limit 2;