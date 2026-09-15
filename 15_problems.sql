-- Netflix Data Analysis using SQL
-- Solutions of 15 business problems
-- 1. Count the number of Movies vs TV Shows

SELECT 
	type,
	COUNT(*)
FROM netflix
GROUP BY type



-- 2. Find the most common rating for movies and TV shows


with ratingCnts as(
select type,rating,count(*) as rating_count
from netflix
group by type,rating
),
rankedRatings as(
select *,RANK() OVER(PARTITION BY type ORDER BY rating_count DESC) as rank
from ratingCnts
)

SELECT 
    type,
    rating AS most_frequent_rating,
	rating_count
FROM RankedRatings
WHERE rank = 1;

-- 3. List all movies released in a specific year (e.g., 2020)


SELECT title,release_year FROM netflix where release_year=2020;

-- 4. Find the top 5 countries with the most content on Netflix


SELECT total_content,country 
FROM
(
	SELECT 
		UNNEST(STRING_TO_ARRAY(country, ',')) as country,
		COUNT(*) as total_content
	FROM netflix
	GROUP BY 1
)as t1
WHERE country IS NOT NULL
ORDER BY total_content DESC
LIMIT 5



-- 5. Identify the longest movie

select title,duration from netflix where duration is not null and type='Movie' ORDER BY SPLIT_PART(duration,' ',1)::INT DESC ;

-- 6. Find content added in the last 5 years

select title,date_added from netflix 
where TO_DATE(date_added,'Month DD,YYYY')>=CURRENT_DATE - INTERVAL '5 years';


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select title,director from netflix where director='Rajiv Chilaka' ;


-- 8. List all TV shows with more than 5 seasons

select * from netflix where type='TV Show' and SPLIT_PART(duration,' ',1)::INT>5;

-- 9. Count the number of content items in each genre
--UNNEST = turn array elements into rows
--STRING_TO_ARRAY = convert a string into an array

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	COUNT(*) as total_content
FROM netflix
GROUP BY genre;

-- 10. Find each year and the average numbers of content release by India on netflix. 
-- return top 5 year with highest avg content release !



-- 11. List all movies that are documentaries

select title,listed_in from netflix 
where listed_in LIKE '%Documentaries%'


-- 12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL



-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT *
FROM netflix
WHERE "cast" LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.


select 
UNNEST(STRING_TO_ARRAY("cast",',')) as actor,
COUNT(*) as total_movies

FROM netflix 
where country='India'
GROUP BY actor
ORDER BY total_movies DESC
LIMIT 10


/*
Question 15:
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/



