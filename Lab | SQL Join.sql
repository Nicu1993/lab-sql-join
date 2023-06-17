use sakila;

-- 1. List the number of films per category.
SELECT c.name AS category, COUNT(*) AS film_count
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.
select p.staff_id, sum(p.amount) as total_amount
from payment p
left join staff s on p.staff_id = s.staff_id
where year(p.payment_date)=2005 and month(p.payment_date)=8
group by p.staff_id;

-- 4. List all films and the number of actors who are listed for each film.
select f.title, count(fa.actor_id) from film f
left join film_actor fa on f.film_id = fa.film_id
group by f.title;


-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_amount_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY c.last_name;