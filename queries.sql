-- Names of all actors in the movie "Die Another Day".
SELECT CONCAT(first, ' ', last) FROM Actor JOIN MovieActor ON
Actor.id = MovieActor.aid AND MovieActor.mid = 
	 (SELECT id FROM Movie WHERE title = 'Die Another Day');

-- Count of all actors who acted in multiple movies.
SELECT COUNT(*) FROM
       (SELECT aid FROM MovieActor GROUP BY aid HAVING COUNT(aid) > 1)
AS derived_table;

-- Title of movies that sell more than 1,000,000 tickets.
SELECT title FROM Movie WHERE id = ANY
       (SELECT mid FROM Sales WHERE ticketsSold > 1000000);

-- Director(s)' names that direct'(s) the largest number of movies.
SELECT CONCAT(first, ' ', last) FROM Director WHERE id = ANY
       (SELECT did FROM MovieDirector GROUP BY did HAVING COUNT(did) =
       	       (SELECT COUNT(*) AS num FROM MovieDirector GROUP BY did
       	       ORDER BY num DESC LIMIT 1));

-- Count of actors who only acted in one movie.
SELECT COUNT(*) FROM
       (SELECT aid FROM MovieActor GROUP BY aid HAVING COUNT(aid) = 1)
AS derived_table;
