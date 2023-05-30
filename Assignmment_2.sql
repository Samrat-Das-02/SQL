create table emp_Samrat
(emp_code varchar(5) primary key, 
emp_name varchar(20),
dept_code varchar(5),
desig_code varchar(5),
sex varchar(1),
address varchar(25),
city varchar(20), 
state varchar(20), 
pin varchar(6),
basic decimal(8,2),
jn_dt date);

create table designation_Samrat
(desig_code varchar(5) primary key,
desig_desc varchar(20));
	
create table department_Samrat
(dept_code varchar(5) primary key,
dept_name varchar(15));

desc emp_samrat;

insert into emp_Samrat values('E1', 'Ram', 'DP1', 'D1','M','Jadavpur','Kolkata','West Bengal','700008','12345.67','17-FEB-2018');
insert into emp_Samrat values('E2', 'Shyam', 'DP1', 'D2','M','7 Lake Road','Mumbai','Maharashtra','700104',null,'1-MAY-2018');
insert into emp_Samrat values('E3', 'Rita', null, 'D1','F','8 Street','Hyderabad','AP','700104',null,'1-FEB-2019');
insert into emp_Samrat values('E4', 'Deb', null, 'D2','M','New Town','Chennai','Tamil Nadu','70104','0','23-NOV-2018');
insert into emp_Samrat values('E5', 'Gita', 'DP3', 'D3','F','High Road','Mumbai','Maharashtra','8301','123891','1-FEB-2017');
insert into emp_Samrat values('E6', 'Jake', 'DP4', 'D3','F','High Road','Mumbai','Maharashtra','8301','12000','3-FEB-2000');
insert into emp_Samrat values('E7', 'Jack', 'DP4', 'D3','F','High Road','Mumbai','Maharashtra','8301','15000','2-FEB-2000');
insert into emp_Samrat values('E8', 'Jill', 'DP5', 'D3','F','High Road','Mumbai','Maharashtra','8301','56000','1-FEB-2000');
update emp_Samrat set dept_code = 'DP2' where emp_name = 'Rita';
update emp_Samrat set dept_code = 'DP2' where emp_name = 'Deb';
update emp_Samrat set basic=70000 where emp_name ='Shyam';
update emp_Samrat set basic=80000 where emp_name ='Rita';
update emp_Samrat set basic=35000 where emp_name ='Deb';

insert into designation_Samrat values('D1', 'Manager');
insert into designation_Samrat values('D2', 'Executive');
insert into designation_Samrat values('D3', 'Officer');
insert into designation_Samrat values('D4', 'Clerk');
insert into designation_Samrat values ('D5','Helper');

insert into department_Samrat values
	('DP1','Personnel');
insert into department_Samrat values('DP2','Production');
insert into department_Samrat values('DP3','Purchase');
insert into department_Samrat values('DP4','Finance');
insert into department_Samrat values('DP5','Research');

select * from emp_Samrat;
select * from designation_Samrat;
select * from department_Samrat;
---2
select dept_code, min(basic) as Minimum_Basic from  emp_Samrat group by dept_code;
select dept_code, max(basic) as Maximum_Basic from  emp_Samrat group by dept_code;
select dept_code, avg(basic) as Average_Basic from  emp_Samrat group by dept_code;
---2
select dept_code ,count(*) as female_employees from emp_samrat where emp_samrat.sex='F' group by dept_code;
---3
select city,dept_code,count(*) from emp_Samrat group by city,dept_code;
---4
select desig_code,dept_code from emp_samrat where jn_dt >= '01-JAN-00' group by desig_code,dept_code;
---5
select dept_code,sum(basic) as total_salary from emp_Samrat where basic >50000 group by dept_code order by total_salary asc;
---6
select emp_name,desig_desc,basic from emp_samrat,designation_samrat where emp_samrat.desig_code=designation_samrat.desig_code;
