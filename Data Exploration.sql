						--Exploring Fifa 20 Data-- 
------------------------------------------------------------------------------------------------						
						
						--Basic Data Of Players in FIFA 20--


SELECT * FROM 
dbo.Year2020

SELECT * FROM 
dbo.teams_and_leagues$

						-- No & Name of the Countries Playing--


Select Nationality
from dbo.Year2020 
order by overall desc


						--Filtering rows based on a condition--

SELECT * 
FROM dbo.Year2020 
WHERE age >= 25;


						--Sorting the players in descending order based on their overall rating.--

SELECT * 
FROM dbo.Year2020 
ORDER BY overall DESC;


				--counting the number of players from each Country in the "players" table.--


select nationality, 
COUNT(*) as num_players 
From dbo.Year2020 
group by nationality 
order by nationality ASC


					----Counting the Maximum number of player from each country --


SELECT nationality, COUNT(*) as num_players
FROM dbo.Year2020
GROUP BY nationality
ORDER BY num_players DESC;



					-- long name of players and their respective clubs--


SELECT p.long_name, t.club
FROM dbo.Year2020 p
JOIN	dbo.Year2020 t ON p.club = t.long_name;


-- Updating the "overall" rating of players who are 22 years old or younger by adding 5 to their current rating--

update dbo.Year2020
set overall = overall+5
where age = 22


--calculate a score for each player based on their overall and potential ratings--

SELECT long_name, 
(overall * 10 + potential * 5) 
as score FROM dbo.Year2020;

			-- player names, their preferred foot, Players with a left foot are categorized as "LW/LF/LM/LWB/LB," 
			--those with a right foot are categorized as "RW/RF/RM/RWB/RB," and others are labeled as "Unknown."


SELECT long_name, preferred_foot,
    CASE
        WHEN preferred_foot = 'Left' THEN 'LW/LF/LM/LWB/LB'
        WHEN preferred_foot = 'Right' THEN 'RW/RF/RM/RWB/RB'
        ELSE 'Unknown'
    END AS positions
FROM dbo.Year2020

					--combination of data from both tables--


SELECT p.long_name, t.league_name
FROM dbo.Year2020 p
INNER JOIN [dbo].[teams_and_leagues$] t ON p.club = t.league_name;






