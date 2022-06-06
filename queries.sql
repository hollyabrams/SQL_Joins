-- write your queries here

--Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
joins_exercise=# SELECT * FROM owners o
joins_exercise-# FULL OUTER JOIN vehicles v
joins_exercise-# ON o.id = v.owner_id;

--Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order.

joins_exercise=# SELECT first_name, last_name,
joins_exercise-# COUNT(owner_id) FROM owners o
joins_exercise-# JOIN vehicles v on o.id=v.owner_id
joins_exercise-# GROUP BY (first_name, last_name)
joins_exercise-# ORDER BY first_name;
 first_name | last_name | count 
------------+-----------+-------
 Alex       | Miller    |     1
 Bob        | Hope      |     2
 Jane       | Smith     |     2
 Melody     | Jones     |     2
 Sarah      | Palmer    |     3
 Shana      | Smith     |     4
(6 rows)

--Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000. 

joins_exercise=# SELECT 
joins_exercise-#   first_name, last_name, 
joins_exercise-#   ROUND(AVG(price)) as average_price, 
joins_exercise-#   COUNT(owner_id) 
joins_exercise-# FROM owners o 
joins_exercise-# JOIN vehicles v on o.id=v.owner_id 
joins_exercise-# GROUP BY 
joins_exercise-#   (first_name, last_name) 
joins_exercise-# HAVING 
joins_exercise-#   COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
joins_exercise-# ORDER BY first_name DESC;
 first_name | last_name | average_price | count 
------------+-----------+---------------+-------
 Shana      | Smith     |         19875 |     4
 Sarah      | Palmer    |         16333 |     3
 Jane       | Smith     |         15000 |     2
(3 rows)