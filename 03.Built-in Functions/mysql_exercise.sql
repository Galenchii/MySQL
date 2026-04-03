-- Exercise: Built-in Functions
use soft_uni;
-- Problem 1: Find Names of All Employees by First Name
SELECT first_name,last_name FROM employees
WHERE SUBSTRING(first_name,1,2) = 'Sa'
ORDER BY employee_id;

-- Problem 1: Find Names of All Employees by First Name
SELECT first_name,last_name FROM employees
WHERE first_name like 'Sa%'
ORDER BY employee_id;

-- Problem 2: Find Names of All Employees by Last Name
SELECT first_name,last_name FROM employees
WHERE LOWER(last_name) like '%ei%'
ORDER BY employee_id;

-- Problem 3: Find First Names of All Employees
SELECT first_name FROM employees
WHERE department_id IN (3,10) 
AND YEAR(hire_date) BETWEEN 1995 and 2005
ORDER BY employee_id ASC;

-- Problem 4: Find All Employees Except Engineers
SELECT first_name, last_name FROM employees
WHERE job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

-- Problem 5: Find Towns with Name Length
 SELECT `name` FROM towns
 WHERE char_length(name) = 5 OR char_length(name) = 6
 ORDER BY name ASC;
 
 
-- Problem 6: Find Towns Starting With
 SELECT town_id, `name` FROM towns
 WHERE upper(`name`) LIKE 'M%' 
 OR upper(`name`) LIKE 'K%' 
 OR upper(`name`) LIKE 'B%' 
 OR upper(`name`) LIKE 'E%'
 ORDER BY `name` ASC;
 
 -- Problem 7: Find Towns Not Starting With
  SELECT town_id, `name` FROM towns
 WHERE upper(`name`) NOT LIKE 'R%' 
 AND upper(`name`) NOT LIKE 'B%' 
 AND upper(`name`) NOT LIKE 'D%' 
 ORDER BY `name` ASC;
 
  -- Problem 8: Create View Employees Hired After 2000 Year
  CREATE VIEW v_employees_hired_after_2000 AS
  SELECT first_name, last_name FROM employees
  WHERE YEAR(hire_date) > 2000;
  
  SELECT * FROM v_employees_hired_after_2000;
  
  -- Problem 9: Length of Last Name
  SELECT first_name, last_name FROM employees
  WHERE length(last_name) = 5; 
  
use geography;
  -- Part II – Queries for Geography Database
  -- Problem 10: Countries Holding 'A' 3 or More Times
  
SELECT country_name, iso_code FROM countries
WHERE LOWER(country_name) like '%a%a%a%'
ORDER BY iso_code;
  
-- 11. Mix of Peak and River Names
SELECT p.peak_name, r.river_name, 
LOWER(CONCAT(p.peak_name, SUBSTRING(r.river_name, 2, LENGTH(r.river_name)))) AS obtained_mix
FROM peaks p
JOIN rivers r ON LOWER(SUBSTRING(p.peak_name, LENGTH(p.peak_name)) = LOWER(SUBSTRING(r.river_name, 1, 1)))
ORDER BY obtained_mix ASC;

-- Part III – Queries for Diablo Database --

-- 12. Games from 2011 and 2012 Year
SELECT `name`, DATE_FORMAT(`start`, '%Y-%m-%d') AS `start` FROM games
WHERE YEAR(`start`) IN (2011, 2012)
ORDER BY `start` ASC, `name` ASC
LIMIT 50;


-- 13. User Email Providers
SELECT user_name, SUBSTRING_INDEX(email, '@', -1) AS email_provider FROM users
ORDER BY email_provider ASC, user_name ASC;

-- 14. Get Users with IP Address Like Pattern
SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name ASC;

-- 15. Show All Games with Duration and Part of the Day
SELECT `name`,
CASE 
    WHEN HOUR(`start`) >= 0 AND HOUR(`start`) < 12 THEN 'Morning'
    WHEN HOUR(`start`) >= 12 AND HOUR(`start`) < 18 THEN 'Afternoon'
    WHEN HOUR(`start`) >= 18 AND HOUR(`start`) < 24 THEN 'Evening'
END AS 'Part of the Day',
CASE 
    WHEN duration <= 3 THEN 'Extra Short'
    WHEN duration > 3 AND duration <= 6 THEN 'Short'
    WHEN duration > 6 AND duration <= 10 THEN 'Long'
    WHEN duration > 10 OR duration IS NULL THEN 'Extra Long'
END AS 'Duration'
FROM games;
