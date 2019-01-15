SELECT *
FROM survey
LIMIT 10;

SELECT question, COUNT(DISTINCT user_id) AS 'completed question'
FROM survey
GROUP BY question;

SELECT *
FROM quiz
LIMIT 5;
 
SELECT *
FROM home_try_on
LIMIT 5;
 
SELECT *
FROM purchase
LIMIT 5;

SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
   ON p.user_id = q.user_id
LIMIT 10;

WITH funnels AS (SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
   ON p.user_id = q.user_id)
SELECT COUNT(*) AS 'num_quiz',
   SUM(is_home_try_on) AS 'num_home_try_on',
   SUM(is_purchase) AS 'num_purchase'
FROM funnels;

WITH funnels AS (SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
   ON p.user_id = q.user_id)
SELECT COUNT(*) AS 'num_quiz',
    SUM(is_home_try_on) AS 'num_home_try_on',
    SUM(is_purchase) AS 'num_purchase',
    100.0 * SUM(is_home_try_on) / COUNT(*) AS 'Funnel 1 to 2',
    100.0 * SUM(is_purchase) / SUM(is_home_try_on) AS 'Funnel 2 to 3'
FROM funnels;

WITH funnels AS (SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
   ON p.user_id = q.user_id)
SELECT COUNT(is_home_try_on), number_of_pairs
FROM funnels
GROUP BY 2;

WITH funnels AS (SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
   ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
   ON p.user_id = q.user_id)
SELECT SUM(is_purchase), number_of_pairs
FROM funnels
Group by 2;

SELECT COUNT (user_id), style
FROM quiz
GROUP BY style
ORDER BY 1 DESC;

SELECT COUNT (user_id), fit
FROM quiz
GROUP BY fit
ORDER BY 1 DESC;

SELECT COUNT (user_id), shape
FROM quiz
GROUP BY shape
ORDER BY 1 DESC;

SELECT COUNT (user_id), color
FROM quiz
GROUP BY color
ORDER BY 1 DESC;

SELECT COUNT(user_id), model_name
FROM purchase
GROUP BY 2
ORDER BY 1 DESC;

SELECT COUNT(user_id), color
FROM purchase
GROUP BY 2
ORDER BY 1 DESC;

SELECT COUNT(user_id), price
FROM purchase
GROUP BY 2
ORDER BY 1 DESC;
