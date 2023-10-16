-- SETUP

-- 1
CREATE TABLE movies (
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(120),
    year_released INT,
    director VARCHAR(80)
);

-- 2
CREATE TABLE directors (
	director_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    country VARCHAR(80)
);

-- 3
DROP TABLE movies;

CREATE TABLE movies (
	movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(120),
    year_released INT,
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

-- 4
-- Execute movie-buff-data.sql to insert data into tables


-- ASSIGNMENT

-- 1
SELECT title
FROM movies;

-- 2
SELECT title, year_released
FROM movies
ORDER BY year_released DESC;

-- 3
SELECT * FROM directors
ORDER BY country ASC;

-- 4
SELECT * FROM directors
ORDER BY country ASC, last_name;

-- 5
INSERT INTO directors (first_name, last_name, country)
VALUES ("Rob", "Reiner", "USA");

-- 6
SELECT last_name, director_id
FROM directors
WHERE last_name="Reiner";

-- 7
INSERT INTO movies (title, year_released, director_id)
VALUES ("The Princess Bride", 1987, 11);

-- 8 (and bonus mission 1)
SELECT m.title, m.year_released, d.last_name
FROM movies AS m
INNER JOIN directors AS d ON m.director_id = d.director_id;

-- 9
SELECT movies.title, directors.first_name, directors.last_name
FROM movies
INNER JOIN directors ON movies.director_id = directors.director_id
ORDER BY directors.last_name ASC;

-- 10 (preliminary)
SELECT director_id FROM movies WHERE title="The Incredibles";

-- 10 (final combo)
SELECT first_name, last_name
FROM directors
WHERE director_id = (SELECT director_id FROM movies WHERE title="The Incredibles");

-- 11
SELECT first_name, last_name
FROM directors
INNER JOIN movies ON movies.director_id = directors.director_id
WHERE title = "Roma";

-- 12
DELETE FROM movies
WHERE movie_id = 10;

-- 13
DELETE FROM directors
WHERE director_id = 1; /* can't be done unless related movies are removed first */


-- Bonus mission 2
SELECT title
FROM movies
INNER JOIN directors ON movies.director_id = directors.director_id
WHERE (directors.first_name = "Peter") AND (directors.last_name = "Jackson");


-- Bonus mission 3
ALTER TABLE movies
ADD earnings INT;

UPDATE movies
SET earnings=394436586
WHERE movie_id = 1;

UPDATE movies
SET earnings=631643697
WHERE movie_id = 2;

UPDATE movies
SET earnings=363258859
WHERE movie_id = 4;

UPDATE movies
SET earnings=213977285
WHERE movie_id = 5;

UPDATE movies
SET earnings=1147997407
WHERE movie_id = 11;

SELECT * FROM movies
ORDER BY earnings DESC;

SELECT * FROM movies
WHERE earnings > 500000000;
