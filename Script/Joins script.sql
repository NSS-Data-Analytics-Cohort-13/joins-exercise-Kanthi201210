--1. Give the name, release year, and worldwide gross of the lowest grossing movie.
--A: 1991, with average rating of 7.45

--Select DISTINCT s.film_title,
--s.release_year,
--r.worldwide_gross
--FROM specs as s
--INNER JOIN revenue as r
--ON s.movie_id=r.movie_id;

--2. What year has the highest average imdb rating?
--SELECT DISTINCT s.release_year,AVG(r.imdb_rating) AS average_rating
--FROM specs AS s
--INNER JOIN rating AS r
--ON s.movie_id=r.movie_id
--GROUP BY s.release_year
--ORDER BY average_rating DESC;

--3. What is the highest grossing G-rated movie? Which company distributed it?
--A: Toy Story 4, distributed by Walt Disney

--SELECT DISTINCT mpaa_rating,company_name,worldwide_gross,film_title
--FROM distributors
--INNER JOIN specs
--ON specs.domestic_distributor_id=distributors.distributor_id AND specs.mpaa_rating='G' 
--INNER JOIN revenue
--ON specs.movie_id=revenue.movie_id
--ORDER BY worldwide_gross DESC;

--4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
--SELECT DISTINCT distributor_id, company_name, COUNT(movie_id) AS number_of_movies
--FROM specs
--FULL JOIN distributors
--ON specs.domestic_distributor_id=distributors.distributor_id  
--GROUP BY distributor_id, company_name;


--5. Write a query that returns the five distributors with the highest average movie budget.
--A: Walt Disney, Sony, Lionsgate, DreamWorks, Warner Bros

--SELECT DISTINCT avg(film_budget)AS average_budget, company_name
--FROM revenue
--INNER JOIN specs
--ON specs.movie_id=revenue.movie_id 
--INNER JOIN distributors
--ON specs.domestic_distributor_id=distributors.distributor_id
--GROUP By distributors.company_name
--Order By average_budget DESC;


--6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
--A: 2 movies; Dirty Dancing

--SELECT DISTINCT film_title, headquarters,imdb_rating
--FROM distributors 
--INNER JOIN specs 
--ON distributors.distributor_id=specs.domestic_distributor_id AND distributors.headquarters NOT LIKE('%CA')
--INNER JOIN rating
--ON specs.movie_id=rating.movie_id;

--7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

--SELECT imdb_rating as average_rating
--FROM rating
--JOIN specs
--ON rating.movie_id=specs.movie_id 
--CASE
--WHEN length_in_min >= 120 THEN '2_hours_or_longer'
	--WHEN length_in_min < 120 THEN 'Less_than_2_hours'
	--END AS 'film_length'

--SELECT COUNT()length_in_min


