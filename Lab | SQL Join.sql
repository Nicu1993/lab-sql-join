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
SELECT staff_id, CONCAT(first_name, ' ', last_name) AS staff_name, SUM(amount) AS total_amount
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
WHERE payment_date >= '2005-08-01' AND payment_date <= '2005-08-31'
GROUP BY staff_id, staff_name;

-- 4. List all films and the number of actors who are listed for each film.
SELECT s.first_name, s.last_name, a.address, SUM(p.amount) AS total_amount
FROM staff s
JOIN address a ON s.address_id = a.address_id
JOIN payment p ON s.staff_id = p.staff_id
WHERE p.payment_date >= '2005-08-01' AND p.payment_date <= '2005-08-31'
GROUP BY s.staff_id, s.first_name, s.last_name, a.address;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(p.amount) AS total_amount_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY c.last_name;