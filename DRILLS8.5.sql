--Question 1 How many records are in the vehicles table?
SELECT COUNT(*)
FROM vehicles ;
--count = 33442

--Question 2. Write a query that returns all the records in the vehicles table.
SELECT *
FROM vehicles;

--Question 3. Write a query that returns the id, make, and model fields for all the records for 2010 vehicles.
SELECT id, make, model
FROM vehicles
WHERE year = 2010;

--Question 4. Write a query that returns the count of vehicles from 2010. Also provide the answer.
SELECT COUNT(*)
FROM vehicles
WHERE year = 2010;
-- Vechicle count = 1109

--Question 5. Write a query that returns the count of vehicles in the vehicles table between the years 2010 and 2015, inclusive. 
SELECT COUNT (*)
FROM vehicles
WHERE year BETWEEN 2010 AND 2015;
--Count= 5995

--Question 6.Write a query that returns the count of vehicles from the years 1990, 2000, and 2010. 
SELECT COUNT (*)
FROM vehicles 
WHERE year = 1990 OR year = 2000 OR year = 2010;
--count= 3026
--I should have used IN(1990,2000,2010)

--Question 7. Write a query that returns the count of all records between 1987 and 2005, exclusive of the years 1990 and 2000.
SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 1987 AND 1989 OR year BETWEEN 1991 AND 1999 OR year BETWEEN 2001 AND 2005;
--COUNT=17235
--SHould have used BETWEEN and NOT IN

--Question 8. query that returns the year, make, model, and a field called average_mpg that calculates the average highway/city fuel consumption.
SELECT year, make, model, (cty+hwy)/2  AS average_mpg
FROM vehicles;

-- Question 9. query that returns the year, make, model, and a text field displaying “X highway; Y city.”
SELECT year, make, model, hwy||' highway; '|| cty||' city;' AS mpg_highway_city
FROM vehicles;
-- should have used concat(hwy, ' highway; ', cty, ' city;')

--Question 10. query that returns the id, make, model, and year for all records that have NULL for either the cyl or displ fields
SELECT  id, make, model, year
FROM vehicles
WHERE cyl IS NULL OR displ IS NULL;

--Question 11. 

SELECT *
FROM vehicles
WHERE year >= 2000 AND fuel = 'Diesel' AND drive = 'Rear-Wheel Drive'
ORDER BY year DESC, hwy DESC;
--ORDER BY year DESC, hwy DESC; 
--Rear-Wheel Drive
--Diesel

--Question 12. query that counts the number of vehicles that are either Fords or Chevrolets and either compact cars or 2-seaters
SELECT COUNT (*)
FROM vehicles
WHERE make IN('Ford','Chevrolet') AND class IN( 'Compact Cars','Two Seaters');
--Original incorect answer count=4625
--After correcting the code 612

--Question 13. query that returns the records for 10 vehicles with the highest highway fuel mileage.
SELECT*
FROM vehicles
ORDER BY hwy DESC
LIMIT 10;

--Question 14query that returns all the records of vehicles since 
--the year 2000 whose model name starts with a capital X.
--Sort the list A through Z by make. What happens when you use a lowercase “x” instead?
SELECT*
FROM vehicles
WHERE year>=2000 AND model LIKE 'X%'
ORDER BY make;
-- Incorect because operator was incrorect does 
-- not return any records with lowercase x 
--correct answer returns scions for lower x

--Question 15. query that returns the count of records where 
--the “cyl” field is NULL. Provide the query as well as the answer.
SELECT COUNT (*)
FROM vehicles
WHERE cyl IS NULL;
--countreturned is 58

--QUESTION 16.query that returns the count of all records before the year 2000 
--that got more than 20 mpg hwy and had greater than 3 liters displacement (“displ” field). 
--Provide the query as well as the answer.
SELECT COUNT(*)
FROM vehicles
WHERE year<2000 AND hwy>20 AND displ > 3;
--ANswer = 1964

--Question 17.
SELECT *
FROM vehicles
WHERE model LIKE '__X%';





