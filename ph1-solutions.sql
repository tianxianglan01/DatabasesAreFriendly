/* SQL "Sakila" database query exercises - phase 1 */

-- Your solutions...

USE sakila;

-- 1
SELECT * FROM actor WHERE first_name = 'Scarlett';

-- 2
SELECT * FROM actor WHERE last_name = 'Johansson';

-- 3
SELECT count(distinct last_name) FROM actor;

-- 4
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name HAVING count(last_name) = 1;

-- 5
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name HAVING count(last_name) > 1;

-- 6
SELECT first_name, last_name, count(*) as 'Count of Movies' FROM actor JOIN film_actor fa on actor.actor_id = fa.actor_id
GROUP BY first_name, last_name ORDER BY count(*) desc LIMIT 1;

-- 7
SELECT title, i.inventory_id, store_id, return_date FROM film JOIN inventory i on film.film_id = i.film_id
JOIN rental r on i.inventory_id = r.inventory_id
WHERE film.title = 'Academy Dinosaur' AND i.store_id = 1;

SELECT i.inventory_id
FROM film f JOIN inventory i ON f.film_id = i.film_id JOIN rental r on i.inventory_id = r.inventory_id
WHERE f.title = 'Academy Dinosaur' AND i.store_id = 1
and NOT EXISTS(select * FROM rental r WHERE r.rental_id = i.inventory_id AND r.rental_date is null);

-- 8

-- Marty Smith id is 1
-- academy dinosaur, film id is 1
-- Mike Hillyer employee id is 1
-- Store id is 1

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES('2021-08-01', 1, 1, 1);

-- 9
UPDATE rental
SET return_date = interval(SELECT rental_duration FROM film WHERE film_id = 1) day + (SELECT rental_date FROM film
    WHERE rental_id = 16050)
WHERE rental_id = 16050;


SELECT rental_date, rental_date + interval(SELECT rental_duration FROM film WHERE film_id = 1) day as due_date
FROM rental WHERE rental_id = 16050;

SELECT rental_date FROM rental WHERE rental_id = 16050;

SELECT rental_duration FROM film WHERE film_id = 1;



-- 10
SELECT AVG(length) FROM film;

-- 11
SELECT c.name, AVG(f.length)
FROM film f JOIN film_category fc ON f.film_id = fc.film_id JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 12
select * from film natural join inventory;
-- a natural join is dependent on the fact that columns in both tables have the same names and i do believe the
-- column values from the 'joining' table must have values that correspond to each other

-- columns with the same names must also be of the same datatype

-- so a natural join from film with inventory would join on film.film_id and inventory.film_id

-- both data types are smallint unsigned

-- last_update and film_id are 2 columns in film and inventory. Natural join only works when the column values match up
-- with one another. film_id in both columns match up, but not last_update





