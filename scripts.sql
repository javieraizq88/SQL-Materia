/* SQL */

/* ESTRUCTURA SELECT
busca inforamcion de la tabla q yo necesito
define si es 1 campo o todos

SELECT * FROM nombre_tabla
SELECT campo FROM nombre_tabla;
SELECT campo1, campo2, campoN FROM nombre_tabla

SELECT * FROM nombre_tabla WHERE  
*/
SELECT * FROM users WHERE username="jizquierdo";


/* ESTRUCTURA INSERT

INSERT INTO nombre_tabla (campo, caampo1, campoN) VALUES (valor, valor1, valorN);

INSERT INTO nombre_tabla (campo, caampo1, campoN) VALUES (valor, valor1, valorN)
 */
INSERT INTO users (username, email, password) VALUES ("jizquierdo", "javieraizquierdo7@gmail.com", 123456);
INSERT INTO users (username, email, password) VALUES ("abc", "abc@gmail.com", 123456);

INSERT INTO users (username, email, password) VALUES
("jizquierdo", "javieraizquierdo7@gmail.com", 123456);
("abc", "abc@gmail.com", 123456);


/* ESTRUCTURA UPDATE
cambia los parametros

UPDATE nombre_tabla SET campo-valor, campoM-valorN;
va a actualizar y cambiar el registro por jizquierdo excepto q tenga una restriccion
*/
UPDATE user SET username="jizquierdo" WHERE id=1;


/* ESTRUCTURA DELETE
Elimina registros de una tabla segun paramaetros

DELETE FROM nombre_tabla;
DELETE FROM nombre_tabla WHERE campo=valor; SOLO ELIMINA 1 REGISTRO Q CORRESPONDA AL CAMPO Y VALOR
*/
DELETE FROM users WHERE username="jizquierdo";
DELETE FROM users WHERE id=1;
DELETE FROM users WHERE email="javieraizquierdo7@gmail.com";

/*##########################################*/

SELECT * FROM users WHERE id=1 OR username="jizquierdo";
SELECT * FROM users WHERE username= "jizquierdo" AND password="123456"; /* los dos tienen q cumplirse para q entregue un registro*/

SELECT * FROM post WHERE title like "%World%"; /*busca los campos q tengan con esa palabra*/
SELECT * FROM post WHERE title like "World%";/*busca los campos q partan con esa palabra */
SELECT * FROM post WHERE title like "%World"; /* busca los campos q terminen con esa palabra */

SELECT * FROM notas WHERE nota like (10, 15, 20);

SELECT * FROM users WHERE username NOT in ("admin"); /*trae los usuarios q no este incluido el administrador */


/*
1
1) Find the title of each film
SELECT title FROM movies;

2) Find the director of each film
SELECT director FROM movies;

3) Find the title and director of each film
SELECT title, director FROM movies;

4) Find the title and year of each film
SELECT title, year FROM movies;

5) Find all the information about each film
SELECT * FROM movies;

2
1) Find the movie with a row id of 6
SELECT * FROM movies WHERE id=6;

2) Find the movies released in the years between 2000 and 2010
SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;

3) Find the movies not released in the years between 2000 and 2010
 SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;

4) Find the first 5 Pixar movies and their release year
SELECT * FROM movies WHERE year <=2003;

3
1) Find all the Toy Story movies
SELECT * FROM movies WHERE title LIKE "%Toy Story%";

2) Find all the movies directed by John Lasseter
SELECT * FROM movies WHERE director LIKE "%John Lasseter%";

3) Find all the movies (and director) not directed by John Lasseter
SELECT * FROM movies WHERE director != "John Lasseter";

4) Find all the WALL-* movies
SELECT * FROM movies WHERE title LIKE "%Wall-%";


4
1) List all directors of Pixar movies (alphabetically), without duplicates 
SELECT DISTINCT director FROM movies ORDER BY director;

2)List the last four Pixar movies released (ordered from most recent to least)
SELECT DISTINCT title FROM movies ORDER BY year DESC LIMIT 4;

3) List the first five Pixar movies sorted alphabetically
SELECT title FROM movies ORDER BY title LIMIT 5;

4) List the next five Pixar movies sorted alphabetically
SELECT title FROM movies ORDER BY title LIMIT 5 OFFSET 5;


5
1) List all the Canadian cities and their populations
SELECT city, population
FROM north_american_cities
WHERE country = "Canada";

2) Order all the cities in the United States by their latitude from north to south
SELECT city
FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;

3) List all the cities west of Chicago, ordered from west to east
SELECT city
FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude;

4) List the two largest cities in Mexico (by population)
SELECT city
FROM north_american_cities
WHERE country = "Mexico"
ORDER BY population DESC
LIMIT 2;

5) List the third and fourth largest cities (by population) in the United States and their population
SELECT city
FROM north_american_cities
WHERE country = "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

6
1) Find the domestic and international sales for each movie
SELECT title, domestic_sales, international_sales
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

2) Show the sales numbers for each movie that did better internationally rather than domestically
SELECT title, domestic_sales, international_sales
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

3) List all the movies by their ratings in descending order
SELECT title, rating
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;


7
1) Find the list of all buildings that have employees
SELECT DISTINCT building FROM employees;

2) Find the list of all buildings and their capacity
SELECT * FROM buildings;

3) List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT building_name, role
FROM buildings
LEFT JOIN employees
    ON building_name = employees.building;


8
1) Find the name and role of all employees who have not been assigned to a building
SELECT name, role FROM employees WHERE building IS NULL;
2) Find the names of the buildings that hold no employees
SELECT DISTINCT building_name
FROM buildings
LEFT JOIN employees
    ON building_name = employees.building
WHERE employees.building IS NULL;


9
1) List all movies and their combined sales in millions of dollars
SELECT DISTINCT
    title,
    (domestic_sales + international_sales) / 1000000 AS sales
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

2) List all movies and their ratings in percent
SELECT DISTINCT
    title,
    (rating * 10) AS rate_percent
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

3) List all movies that were released on even number years
SELECT title FROM movies WHERE year % 2 = 0;
