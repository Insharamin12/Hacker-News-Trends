--hacker_news table!--
SELECT title, score
FROM hacker_news
ORDER BY score DESC

--total score of all the stories--
SELECT SUM(score)
FROM hacker_news;

--individual users who have gotten combined scores of more than 200, and their combined scores.--
SELECT user, SUM(score) 
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

--to get the percentage of the user's score'--
SELECT (517 + 309 + 304 + 282) / 6366.0;

-- Hacker News Moderating
SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

-- Which sites feed Hacker News?

SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY 1;

-- What's the best time to post a story?

SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
