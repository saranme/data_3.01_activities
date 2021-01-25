-- ACTIVITITES
/*
3.01 Activity 1
Keep working on the bank database.

1. Get the number of clients by district, returning district name.
2. Are there districts with no clients? Move all clients from Strakonice 
to a new district with district_id = 100. Check again. 
Hint: In case you have some doubts, you can check here how to use the update statement.
3. How would you spot clients with wrong or missing district_id?
4. Return clients to Strakonice.
*/
Use bank;
-- 1
SELECT d.A1 district_id, d.A2 district_name, COUNT(c.client_id) n_clients
FROM district d
LEFT JOIN client c
ON d.A1 = c.district_id
GROUP BY 1,2
ORDER BY n_clients DESC;

-- 2

UPDATE client
SET district_id = 100
WHERE district_id = 20;

UPDATE district
SET A1 = 100
WHERE A1 = 20;

UPDATE client
SET district_id = 20
WHERE district_id = 100;

-- 4
UPDATE client
SET district_id = 20
WHERE district_id = 100;

UPDATE district
SET A1 = 20
WHERE A1 = 100;

/* 3.01 Activity 2
Keep working on the bank database. 
Identify relationship degrees in our database.
*/
/*
3.01 Activity 4
1. Make a list of all the clients together with region and district,
ordered by region and district.

2. Count how many clients do we have per region and district.
	2.1 How many clients do we have per 10000 inhabitants?
*/

-- 1
SELECT c.client_id, d.A3 region, d.A2 district, d.A1 district_id
FROM client c
LEFT JOIN district d
ON c.district_id = d.A1
ORDER BY 2,3,4;

-- 2
SELECT COUNT(c.client_id) n_clients, d.A3 region, d.A2 district, d.A1 district_id
FROM client c
LEFT JOIN district d
ON c.district_id = d.A1
GROUP BY 2,4,3
ORDER BY 1 DESC;

-- 	2.1 How many clients do we have per 10.000 inhabitants?
SELECT (COUNT(c.client_id)/d.A4)*10000 n_clients_per_10000_hab, d.A4 inhabitants_per_10000_hab, d.A3 region, d.A2 district, d.A1 district_id
FROM client c
LEFT JOIN district d
ON c.district_id = d.A1
GROUP BY d.A4, 3,4,5
ORDER BY 1 DESC;

