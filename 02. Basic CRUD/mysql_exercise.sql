-- Exercise: Basic CRUD --
use soft_uni;

-- Problem 1: Find All Information About Departments
SELECT * FROM departments 
ORDER BY department_id;

-- Problem 2: Find all Department Names
SELECT name FROM departments
ORDER BY department_id; 

-- Problem 3: Find salary of Each Employee
SELECT first_name,last_name, salary FROM employees
ORDER BY employee_id;

-- Problem 4: Full Name of Each Employee
SELECT first_name,middle_name,last_name FROM employees
ORDER BY employee_id;

-- Problem 5: Find email address of Each Employee
SELECT CONCAT(first_name, '.' , last_name , '@softuni.bg') 
AS full_email_address
FROM employees; 

-- Problem 6: Find All Different Employee's Salaries
SELECT DISTINCT salary FROM employees;

-- Problem 7: Find all Information About Employees
SELECT * FROM employees 
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;


-- Problem 8: Find Names of All Employees by salary in Range
SELECT first_name,last_name,job_title FROM employees 
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

-- Problem 9: Find Names of All Employees
SELECT CONCAT_WS(' ', first_name, middle_name, last_name) AS 'Full name' 
FROM employees 
WHERE salary IN(25000,14000,12500,23600)
ORDER BY employee_id;

-- Problem 10: Find All Employees Without Manager
SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

-- Problem 11: Find All Employees with salary More Than 50000
SELECT first_name, last_name, salary FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

-- Problem 12: Find 5 Best Paid Employees
SELECT first_name, last_name FROM employees
ORDER BY salary desc
LIMIT 5;

-- Problem 13: Find All Employees Except Marketing
SELECT first_name, last_name FROM employees
WHERE department_id != 4;

-- Problem 14: Sort Employees Table
SELECT * FROM employees
ORDER BY salary DESC, first_name, last_name DESC, middle_name;

-- Problem 15: Create View Employees with Salaries
CREATE VIEW v_employees_salaries AS
SELECT first_name, last_name, salary FROM employees; 

-- Problem 16:Create View Employees with Job Titles
CREATE VIEW v_employees_job_titles AS
SELECT 
	CONCAT(
		first_name, ' ',
        CASE WHEN middle_name IS NULL THEN '' ELSE CONCAT(middle_name, ' ') END,
        last_name) AS full_name , job_title
FROM employees;     

-- Problem 17: Distinct job titles
SELECT DISTINCT job_title FROM employees
ORDER BY job_title ASC;   


-- Problem 18: Find First 10 Started Projects
SELECT * FROM projects
ORDER BY start_date, end_date;

-- Problem 19: Last 7 Hired Employees
SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date DESC
LIMIT 7;

-- Problem 20: Increase Salaries Engineering - 1, Tool Design 2, Marketing - 4, Information Services - 11
UPDATE employees
SET salary = salary * 1.12
WHERE department_id IN (1,2,3,11); 

use geography;
-- Part II – Queries for Geography Database --

-- 21: All Mountain Peaks
SELECT peak_name FROM peaks
ORDER BY peak_name ASC;

-- 22: Biggest Countries by Population
SELECT country_name, population FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC, country_name ASC;

-- 23: Countries and Currency (Euro / Not Euro)
SELECT country_name, country_code,
CASE 
  WHEN currency_code= 'EUR' THEN 'Euro' ELSE 'Not Euro' END as currency_info
FROM countries
ORDER BY country_name;

-- Part III – Queries for Diablo Database

-- Problem 24: All Diablo Character
SELECT `name` FROM characters 
ORDER BY name ASC;
