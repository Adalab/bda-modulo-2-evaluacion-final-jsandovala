-- bda-modulo-2-evaluacion-final-jsandovala
-- Base de Datos: sakila
USE sakila;
-- Explorando sakila:
SELECT * 
FROM film
LIMIT 10;
SELECT * 
FROM film_actor
LIMIT 10;
SELECT * 
FROM actor
LIMIT 10;
-- ejercicios
-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados:
SELECT DISTINCT title
FROM film
LIMIT 10;
-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13":
SELECT title
FROM film
WHERE rating = "PG-13"
LIMIT 10;
-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción:
SELECT title, description
FROM film
WHERE description LIKE "%amazing%"
LIMIT 10;
-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos:
SELECT title, length
FROM film
WHERE length > 120
LIMIT 10;
-- 5. Recupera los nombres de todos los actores:
SELECT first_name
FROM actor
LIMIT 10;
-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido:
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%Gibson%"
LIMIT 10;
-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20:
SELECT actor_id, first_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20
LIMIT 10;
-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación:
SELECT title, rating
FROM film
WHERE rating NOT IN ("R", "PG-13")
LIMIT 10;
/* 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación 
junto con el recuento:*/
SELECT rating, COUNT(*) AS total_movies
FROM film
GROUP BY rating
LIMIT 10;
/* 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y
apellido junto con la cantidad de películas alquiladas:*/
SELECT cu.customer_id, cu.first_name, cu.last_name, COUNT(rental_id) AS total_rented_movies
FROM customer AS cu
INNER JOIN rental AS re ON cu.customer_id = re.customer_id
GROUP BY cu.customer_id, cu.first_name, cu.last_name
ORDER BY total_rented_movies
LIMIT 10;
/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el
recuento de alquileres:*/

/* 12.  Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
clasificación junto con el promedio de duración:*/ 
SELECT rating, AVG(length) AS avg_length_movies
FROM film
GROUP BY rating 
LIMIT 10;
-- 13.  Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love":
/*film_id une film(de aqui traigo el title) con film_actor 
actor_id une actor(de aqui traigo first_name y last_name) con film_id */ 
SELECT title, a.first_name, a.last_name
FROM film AS f
INNER JOIN film_actor AS fa ON f.film_id = fa.film_id
INNER JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE f.title = "Indian Love"
LIMIT 10;

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción:
SELECT title, description
FROM film
WHERE description LIKE "%dog%" OR title LIKE "%cat%"
LIMIT 10;

-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor:
SELECT actor_id
FROM film_actor
WHERE film_id IS NULL
LIMIT 10;

