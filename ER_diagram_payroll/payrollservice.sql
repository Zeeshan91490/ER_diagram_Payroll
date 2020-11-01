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

