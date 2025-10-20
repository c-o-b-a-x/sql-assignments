/* ============================================================
   SQL Practice Worksheet — Selecting & Filtering Data
   Database: Lahman Baseball Database
   Task 39	Query a database table (Simple SELECT)
   Task 40	Query a database table with a restricted result set (WHERE)
   NOTE: You can set your Limit to 50 rows in the workbench
   ============================================================ */

/* 1. Select all players
   Table: people
   Output Columns: *
   Task: Write a query that displays all columns and rows from the people table.
*/
-- Your query below:
select * from people 



/* 2. Show first and last names only
   Table: people
   Output Columns: nameFirst, nameLast
   Task: Write a query that displays the first and last names of every player.
*/
-- Your query below:
SELECT nameFirst, nameLast FROM people;



/* 3. Find a specific player (Babe Ruth)
   Table: people
   Output Columns: playerID, nameFirst, nameLast
   Task: Write a query that finds the player whose first name is “Babe” 
         and last name is “Ruth.”
*/
-- Your query below:
SELECT playerID, nameFirst, nameLast FROM peopleWHERE nameFirst = 'Babe' AND nameLast = 'Ruth';



/* 4. Batters with more than 30 home runs
   Table: batting
   Output Columns: playerID, yearID, HR
   Task: Display all batting records where the player hit more than 30 home runs.
*/
-- Your query below:
SELECT playerID, yearID, HR FROM batting WHERE HR > 30;



/* 5. Pitchers with an ERA below 2.50
   Table: pitching
   Output Columns: playerID, yearID, ERA
   Task: Show all pitchers who had an earned run average (ERA) less than 2.50.
*/
-- Your query below:
SELECT playerID, yearID, ERA FROM pitching WHERE ERA < 2.50;



/* 6. Teams in the American League (AL)
   Table: teams
   Output Columns: teamID, name, yearID
   Task: List all teams that played in the American League (AL).
*/
-- Your query below:
SELECT teamID, name, yearID FROM teams WHERE lgID = 'AL';



/* 7. Teams not in the National League (NL)
   Table: teams
   Output Columns: teamID, name, lgID
   Task: List all teams that were not part of the National League (NL).
*/
-- Your query below:

SELECT teamID, name, lgID FROM teams WHERE lgID != 'NL';


/* 8. Players who debuted before 1950
   Table: people
   Output Columns: nameFirst, nameLast, debut_date
   Task: Find all players whose debut date was before January 1, 1950.
*/
-- Your query below:

SELECT nameFirst, nameLast, debut FROM people WHERE debut <'1950-01-01';


/* 9. Players with unknown death date
   Table: people
   Output Columns: nameFirst, nameLast, death_date
   Task: List all players whose death date is missing (NULL).
*/
-- Your query below:

SELECT nameFirst, nameLast, deathDate  FROM people WHERE deathDate IS NULL;


/* 10. Power hitters in the National League
   Table: batting
   Output Columns: playerID, yearID, HR, lgID
   Task: Show all players who hit more than 40 home runs and played 
         in the National League (NL).
*/
-- Your query below:
SELECT playerID, yearID, HR, lgID FROM batting WHERE HR > 40  AND lgID = 'NL';
