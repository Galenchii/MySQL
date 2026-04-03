-- Exercise: Built-in Functions

-- Problem 1: Find Book Titles
SELECT title FROM books
WHERE SUBSTRING(title, 1,3) = 'The'
ORDER BY id ASC;

-- Problem 2: Replace Titles
SELECT REPLACE(title, 'The', '***') AS 'Title' FROM books
WHERE title LIKE 'The %'
ORDER BY id ASC;

-- Problem 3: Sum Cost of All Books
SELECT ROUND(SUM(cost), 2) AS 'Total cost' FROM books;

-- Problem 4: Days Lived DAY,YEAR,MINUTE,SECOND -> the result returned
SELECT CONCAT(first_name, ' ' ,last_name) AS 'Full Name',
TIMESTAMPDIFF(YEAR, born, died) AS 'Days Lived'
FROM authors;

-- Problem 5: Harry Potter Books
SELECT title FROM books
WHERE title like '%Harry Potter and the%'
ORDER BY id;

SELECT * FROM authors;
