/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...

-- 1a
SELECT first_name, last_name FROM actor;
-- 1b
SELECT UPPER(concat(first_name, ' ', last_name)) 'Actor Name' FROM actor;

-- 2a
SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe';
-- 2b
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%gen%';
-- 2c
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;
-- 2d
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3a
ALTER TABLE actor
ADD middle_name varchar(45);
-- 3b
ALTER TABLE actor MODIFY middle_name BLOB;
-- 3c
ALTER TABLE actor DROP middle_name;

-- 4a
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name;
-- 4b
SELECT last_name, count(last_name) FROM actor
GROUP BY last_name
HAVING count(last_name) >1;
-- 4c
SELECT actor_id, last_name FROM actor
WHERE first_name = 'GROUCHO' and last_name = 'WILLIAMS';

UPDATE actor SET first_name = 'HARPO' WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';
-- 4d
UPDATE actor SET first_name =  'MUCHO GROUCHO'
WHERE first_name = 'GROUCHO';

-- 5a
SHOW CREATE TABLE address;

-- 6a
SELECT first_name, last_name, address FROM staff JOIN address ON staff.address_id = address.address_id;

-- 6b
SELECT first_name, last_name, SUM(amount) FROM staff s JOIN payment p on s.staff_id = p.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY first_name, last_name;
#use quotation marks around dates

-- 6c
SELECT title, count(title) FROM film f INNER JOIN film_actor fc ON f.film_id = fc.film_id
GROUP BY  title;

-- 6d
SELECT title, count(title) FROM film f JOIN inventory i ON f.film_id = i.film_id
WHERE title = 'HUNCHBACK IMPOSSIBLE'
GROUP BY title;

-- 6e
SELECT first_name, last_name, SUM(amount) FROM customer c JOIN payment p on c.customer_id = p.customer_id
GROUP BY first_name, last_name
ORDER BY  last_name;

-- 7a
SELECT title FROM film f JOIN language l on f.language_id = l.language_id
WHERE title LIKE 'k%' OR title LIKE 'q%' AND l.name = 'English';

-- 7b
SELECT title, first_name, last_name FROM film f JOIN film_actor fa ON f.film_id = fa.film_id JOIN actor a
ON fa.actor_id = a.actor_id HAVING title = 'Alone Trip';

-- 7c
SELECT first_name, last_name, address,email FROM customer c JOIN address a ON c.address_id = a.address
JOIN city c2 ON a.city_id = c2.city_id JOIN country c3 ON c2.country_id = c3.country_id
WHERE c3.country = 'CANADA';

-- 7d
SELECT title FROM film f JOIN film_category fc on f.film_id = fc.film_id
JOIN category c on fc.category_id = c.category_id WHERE c.name = 'FAMILY';

-- 7e
SELECT title, count(title) FROM film f JOIN inventory i on f.film_id = i.film_id
JOIN rental r on i.inventory_id = r.inventory_id
GROUP BY title ORDER BY count(title) DESC;

-- 7f
SELECT s.store_id, sum(amount) FROM store s JOIN staff sf ON s.manager_staff_id = sf.staff_id
JOIN payment p on sf.staff_id = p.staff_id
GROUP BY store_id;

-- 7g
SELECT store_id, city, country FROM store s JOIN address a on s.address_id = a.address_id
JOIN city c on a.city_id = c.city_id JOIN country c2 on c.country_id = c2.country_id;

-- 7h
SELECT name, sum(amount) from category c JOIN film_category fc on c.category_id = fc.category_id
JOIN inventory i on fc.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN
payment p ON r.rental_id = p.rental_id
GROUP BY name;

-- 8a
CREATE VIEW top_5_genre AS
SELECT name, sum(amount) from category c JOIN film_category fc on c.category_id = fc.category_id
JOIN inventory i on fc.film_id = i.film_id JOIN rental r ON i.inventory_id = r.inventory_id JOIN
payment p ON r.rental_id = p.rental_id
GROUP BY name
ORDER BY sum(amount) DESC
LIMIT 5;

-- 8b
SELECT * FROM top_5_genre;

-- 8c
DROP VIEW top_5_genre;







