#UC1
SHOW databases;
CREATE DATABASE payrollservice; #Created database
SHOW databases;
USE payrollservice;
SELECT database();

#UC2
CREATE TABLE employee_payroll
(
id       INT unsigned NOT NULL auto_increment,		#ID is set on auto increment
name     VARCHAR(150) NOT NULL,
salary   DOUBLE NOT NULL,
start    DATE NOT NULL,
PRIMARY KEY (id)  									#Set ID as primary key
);
DESCRIBE employee_payroll;

#UC3
INSERT INTO employee_payroll(name , salary , start) VALUES
( 'Bill',100000.00,'2018-01-03' ),
( 'Terisa',200000.00,'2019-11-13'),
( 'Charlie',300000.00,'2020-05-21');

#UC4
SELECT * FROM employee_payroll;

#UC5
SELECT salary FROM employee_payroll WHERE name ='Bill';              
SELECT * FROM employee_payroll WHERE start BETWEEN CAST('2018-01-01' as date) and date(now());

#UC6
ALTER TABLE employee_payroll ADD Gender CHAR(1) AFTER name;
UPDATE employee_payroll SET Gender = 'F' WHERE id = 2;
UPDATE employee_payroll SET Gender = 'M' WHERE id = 1 or id = 3;

#UC7
SELECT gender,SUM(salary),AVG(salary),MIN(salary),MAX(salary) FROM employee_payroll WHERE gender = 'F';       
SELECT gender,SUM(salary),AVG(salary),MIN(salary),MAX(salary) FROM employee_payroll WHERE gender = 'M';       
SELECT gender,SUM(salary),AVG(salary),MIN(salary),MAX(salary) FROM employee_payroll GROUP BY gender;          
 
select gender,COUNT(*) from employee_payroll group by gender;

#UC8
ALTER TABLE employee_payroll 
ADD COLUMN phone VARCHAR(13) AFTER name,
ADD COLUMN address VARCHAR(250) DEFAULT 'India' AFTER phone,
ADD COLUMN department VARCHAR(150) NOT NULL AFTER address;
SELECT * FROM employee_payroll;

#UC9
ALTER TABLE employee_payroll 
ADD COLUMN basic_pay DOUBLE NOT NULL AFTER gender,
ADD COLUMN deductions DOUBLE NOT NULL AFTER basic_pay,
ADD COLUMN taxable_pay DOUBLE NOT NULL AFTER deductions,
ADD COLUMN tax DOUBLE NOT NULL AFTER taxable_pay,
ADD COLUMN net_pay DOUBLE NOT NULL AFTER tax;

ALTER TABLE employee_payroll DROP COLUMN salary;

SELECT * FROM employee_payroll;

