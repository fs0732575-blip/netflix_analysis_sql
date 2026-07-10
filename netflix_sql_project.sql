CREATE TABLE netflix_titles
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);

select * from netflix_titles;

select
    count(*) 	
from netflix_titles;

-- how too show diffrent typess of  shows 

select distinct type
  from netflix_titles;

 --- count how much types of movies and series are there

 select 
    type,
	count (*) as total_content
	from netflix_titles
	group by type;

---find the most high rating movies and series y ranking it
-- rank is use to rank the data 

select 
     type,rating,
	rank() over(partition by type order by  count(*)desc) as ranking
 
    -- MAX(rating)
	FROM netflix_titles
 GROUP BY 1,2;
 -- order by  1,3 desc;


 -- movie which is releasein 2020

 select from netflix_titles
     where 
	     type = 'movie'
		  and 
		  release_year = 2020


-- FIND MOST FIVE COUNTRY WITH MOST CONTENT ON NETFLIX

SELECT 
  COUNTRY
    COUNT(SHOW_ID) AS TOTAL_CONTENT
	FROM  NETFLIX_TITLE
 GROUP BY 1


 -- list  all movies where all movies are documentary in listed_in

  select * from netflix_titles
    where listed_in 
     ilike '%documentaries%'

-- where all  directors are null 
select * from netflix_titles
where director is null

-- how many flims are salman khan appear in last 15 year

select *
from netflix_titles
 where casts ilike '%salman khan%'
 and 
 release_year >extract(year from current_date) - 15


FIND THE TOP 10 ACTORS WHO HAVE APPEARED IN THE HIGHEST NUMBERS OF MOVIES IN INDIA


SELECT  

 UNNEST(STRING_TO_ARRAY(CASTS, ',')) AS ACTORS,
 COUNT(*) AS TOTAL_CONTENT
  FROM NETFLIX_TITLES
  WHERE COUNTRY ILIKE '%INDIA'
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 10


 CATEGORY YHE CONTENT BASED ON THE PRESENCEOF KEYWORD'KILLS' AND 'VIOLENC' in the descripton firld label 
 content containing these keyword as good  content or  bad c
 

    