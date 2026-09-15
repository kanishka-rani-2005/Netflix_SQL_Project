-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

Select type,Count(*) from netflix GROUP BY type;


-- 2. Find the most common rating for movies and TV shows


WITH ratingCounts AS(
SELECT type,rating,COUNT(*) AS rating_count
FROM netflix group by type,rating
),ratingRanked AS(
SELECT type,rating,rating_count,RANK() OVER(PARTITION BY type Order BY rating_count DESC) AS "rank"
FROM ratingCounts
)

SELECT type,rating,rating_count from ratingRanked
where "rank"=1


-- 3. List all movies released in a specific year (e.g., 2020)

SELECT * FROM netflix where release_year=2020

-- 4. Find the top 5 countries with the most content on Netflix

WITH cte as(
SELECT UNNEST(STRING_TO_ARRAY(country,',')) as country,
Count(*) as total_content
FROM netflix 
GROUP BY 1
)

SELECT * FROM cte where Country is not null ORDER BY total_content DESC LIMIT 5

-- 5. Identify the longest movie

SELECT title FROM netflix 
WHERE type='Movie'
ORDER BY SPLIT_PART(duration,' ',1)::INT DESC LIMIT 1


-- 6. Find content added in the last 5 years

Select title,date_added
from netflix
where TO_DATE(date_added,'Month DD, YYYY') >=CURRENT_DATE-INTERVAL '5 years';


-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!


SELECT 
	title,director
FROM 
netflix
WHERE 
	director like '%Rajiv Chilaka%'


-- 8. List all TV shows with more than 5 seasons

SELECT *
FROM netflix
WHERE 
	TYPE = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::INT > 5

-- 9. Count the number of content items in each genre

SELECT UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
COUNT(*) AS total_content_items
from netflix
GROUP BY genre

-- 10.Find each year and the average numbers of content release in India on netflix. 
SELECT 
	country,
	release_year,
	COUNT(show_id) as total_release,
	ROUND(
		COUNT(show_id)::numeric/
								(SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100 
		,2
		)
		as avg_release
FROM netflix
WHERE country = 'India' 
GROUP BY country, release_year
ORDER BY avg_release DESC 
LIMIT 5

-- 11. List all movies that are documentaries
SELECT * FROM netflix
WHERE listed_in LIKE '%Documentaries'

-- 12. Find all content without a director
SELECT * FROM netflix
WHERE director IS NULL

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * FROM netflix
WHERE 
	casts LIKE '%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10


-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.


SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

-- 15.
-- Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.

WITH cte as(
SELECT *,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
)

SELECT category,type,COUNT(*) as content_count
FROM cte 
GROUP BY category,type
ORDER BY category,type

