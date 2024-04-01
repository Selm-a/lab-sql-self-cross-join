use sakila;

#Get all pairs of actors that worked together. 
select * from film_actor;

select * from film_actor f1
join film_actor f2
on f1.film_id = f2.film_id
and f1.actor_id <> f2.actor_id;


SELECT a1.first_name AS actor1_name, a1.last_name AS actor1_last_name,
       a2.first_name AS actor2_name, a2.last_name AS actor2_last_name, fa1.film_id
FROM actor a1
INNER JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
INNER JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
INNER JOIN actor a2 ON a2.actor_id = fa2.actor_id
WHERE a1.actor_id < a2.actor_id;

#Get all pairs of customers that have rented the same film more than 3 times.
#self join sur les tables rental et customer 
select * from rental ;
select * from customer ; 



select c1.first_name as client1, c1.customer_id as customer_id1,
		c2.first_name as client2, c2.customer_id as customer_id2
from customer c1
join rental r1 on r1.customer_id = c1.customer_id
join rental r2 on r1.inventory_id = r2.inventory_id  
join customer c2 on  r2.customer_id = c2.customer_id  
where r1.customer_id <> r2.customer_id
group by customer_id1, customer_id2
having count(*) > 3;


#Get all possible pairs of actors and films.
select * from actor ;
select * from film_actor ;

select actor.first_name, actor.last_name, film.title
from actor 
cross join film 
order by actor.first_name, actor.last_name ;
