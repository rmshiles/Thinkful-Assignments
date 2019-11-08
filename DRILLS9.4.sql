--1.query that returns a list of all the unique values in the 'country' field
SELECT DISTINCT(country)
FROM ksprojects;

--2.How many unique values are there for the main_category field? 

SELECT COUNT(DISTINCT (main_category))
FROM ksprojects;
--answer 15
--What about for the category field?
SELECT COUNT(DISTINCT (category))
FROM ksprojects;
--answer 158

--3.Get a list of all the unique combinations of 
--main_category and category fields,
--sorted A to Z by main_category.
SELECT DISTINCT main_category, category 
FROM ksprojects
ORDER BY main_category;

--4.How many unique categories are in each main_category?
SELECT main_category, COUNT(DISTINCT category)AS category_count
FROM ksprojects
GROUP BY main_category
ORDER BY main_category;

--5.query that returns the average number of backers per main_category,
-- rounded to the nearest whole number and sorted from high to low.
SELECT main_category, ROUND(AVG(backers),0) AS avg_backers
FROM ksprojects
GROUP BY main_category
ORDER BY avg_backers DESC;

--6.query that shows, for each category, 
--how many campaigns were successful and the average difference per project
--between dollars pledged and the goal.
-- SELECT*
--FROM ksprojects
--LIMIT 10;
--state= text= sucess or fail 
SELECT category, COUNT(state)AS number_of_sucsess, AVG(usd_pledged-goal)
FROM ksprojects
GROUP BY category;


--7.query that shows, for each main category, 
--how many projects had zero backers for that category
--and the largest goal amount for that category 
--(also for projects with zero backers).

SELECT main_category,COUNT(backers), MAX(goal) 
FROM ksprojects
WHERE backers = 0
GROUP BY main_category;


--8.for each category, find the average USD per backer, 
--and return only those results for which the average USD per backer 
--is < $50, sorted high to low.

SELECT category, AVG(backers/NULLIF(usd_pledged,0))AS avg_usd_perbacker
FROM ksprojects
GROUP BY category
HAVING AVG(backers/NULLIF(usd_pledged,0)) < 50
ORDER BY avg_usd_perbacker DESC;

--9. Write a query that shows, for each main_category,
--how many successful projects had between 5 and 10 backers.
SELECT main_category, backers, state
FROM ksprojects
WHERE state = 'successful' AND backers BETWEEN 5 AND 10
ORDER BY main_category;

--10.Get a total of the amount ‘pledged’ 
--for each type of currency grouped by its respective currency.
--Sort by ‘pledged’ from high to low.
SELECT  currency, SUM(pledged)AS sum_pledged
FROM ksprojects
GROUP BY currency
ORDER BY sum_pledged DESC;

--11.Excluding Games and Technology records in the main_category field,
--return the total of all backers for successful projects by main_category
--where the total was more than 100,000. Sort by main_category from A to Z.
SELECT main_category,  SUM(backers)AS sum_of_backers
FROM ksprojects
WHERE state = 'successful' AND main_category NOT IN('Games','Technology')
GROUP BY main_category, state
HAVING SUM(backers) > 100000
ORDER BY main_category ;
