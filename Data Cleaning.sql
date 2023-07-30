										-- Data Cleaning---


					--Counting the total number of rows --

	SELECT COUNT(*) AS total_rows,
       SUM(CASE WHEN club IS NULL THEN 1 ELSE 0 END) AS missing_club,
       SUM(CASE WHEN overall IS NULL THEN 1 ELSE 0 END) AS missing_overall
		FROM dbo.Year2020;


				--Updating all rows where the 'club' column is NULL and set the 'club' to 'Unknown Club'.


		UPDATE dbo.Year2020
		SET club = 'Unknown Club'
		WHERE club IS NULL;

	Select club 
	from dbo.Year2020 
	where club = null


						--Changing the data type of the 'age' column in to an integer.

		ALTER TABLE dbo.Year2020
		ALTER COLUMN age INT;


									--Calculating a New Column--


		SELECT long_name, overall,
			CASE
			WHEN overall >= 90 THEN 'Top Player'
			WHEN overall >= 80 THEN 'Good Player'
           ELSE 'Average Player'
            END AS player_category
		FROM dbo.Year2020;


		select  a.[club], b.[league_name]
		from [dbo].[Year2020] a
		join [dbo].[teams_and_leagues$] b on  a.[club] = b.[league_name]  

