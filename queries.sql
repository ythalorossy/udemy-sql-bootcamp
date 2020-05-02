with 
cus as (
	SELECT customer_id, store_id, 
		first_name, last_name, 
		email, address_id, 
		activebool, create_date, 
		last_update, active
	FROM public.customer
),
pay_top as (
	SELECT customer_id FROM payment
	ORDER BY payment_date ASC
	LIMIT 10
)
SELECT c.first_name, c.email 
FROM cus c INNER JOIN pay_top p 
	ON c.customer_id = p.customer_id
;

	
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10
;

SELECT title, "length" FROM film
ORDER BY length ASC, title
LIMIT 10
;

SELECT count(*) FROM film
WHERE length <= 50
;

SELECT count(*) FROM payment
WHERE amount > 5.00
;

SELECT count(*) FROM actor
WHERE first_name LIKE 'P%'
;

SELECT DISTINCT(district) 
FROM address
;

SELECT count(*) 
FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND 15
;

SELECT count(*) 
FROM film
WHERE title LIKE '%Truman%'
;

SELECT staff_id, COUNT(*) 
FROM payment
GROUP BY staff_id
;

SELECT rating, ROUND(AVG(replacement_cost),2) 
FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5
;

SELECT customer_id, COUNT(amount) 
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
;

SELECT customer_id, SUM(amount) 
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100
;

-- Assessement Test 1
SELECT customer_id, SUM(amount) 
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110
;

SELECT COUNT(*) FROM film
WHERE title ILIKE 'j%';

SELECT customer_id, CONCAT_WS(' ', first_name, last_name) as fullname FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1
;

SELECT district, first_name, email
FROM address INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California'
-- LIMIT 1
;

SELECT title, first_name, last_name
FROM actor 
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id 
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' 
AND last_name = 'Wahlberg'
-- LIMIT 1
;

WITH 
monday_thursday as (
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1
---
UNION
---
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 4
)
SELECT * FROM monday_thursday
WHERE count > 2500
;



SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH')) 
FROM payment
;

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1
UNION
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 4
;

select * from payment;
select * from PAYment;
SELECT * from PAYMENT;



