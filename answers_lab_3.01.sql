use sakila;
-- Drop column picture from staff.
select * from staff;

ALTER TABLE staff
DROP COLUMN picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly.

select * from customer
where (first_name = 'tammy') and (last_name = 'sanders');

INSERT INTO staff(first_name,last_name,address_id,email, store_id, active, username) 
VALUES
('Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy');

UPDATE staff
SET email = 'TAMMY.SANDERS@sakilastaff.com'
WHERE staff_id = 3;

select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
/*You can use current date for the rental_date column in the rental table. 
Hint: Check the columns in the table rental and see what information you would need to add there. 
You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
To get that you can use the following query:
	select customer_id from sakila.customer
	where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
Use similar method to get inventory_id, film_id, and staff_id.*/

select * from rental;
-- rental_id rental_date inventory_id customer_id return_date staff_id last_update

select customer_id from sakila.customer
	where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- 130
select film_id from film
	where title = 'Academy Dinosaur';
-- 1
select * from inventory
where film_id = '1';
-- 1 2 3 4
select * from rental
where inventory_id in (1,2,3,4);
-- any copy is available
select * from staff
where first_name = 'Mike';
-- staff_id = 1

-- rental_id rental_date inventory_id customer_id return_date staff_id last_update
INSERT INTO rental(rental_date,inventory_id,customer_id,staff_id) 
VALUES
(now(),1,130,1);

select * from rental
where customer_id = 130;
-- OK
