SELECT TOP (1000) [user_id]
      ,[username]
      ,[email]
      ,[password]
  FROM [Project_on_Blogs].[dbo].[user_table]

  --modifying email where id=5
UPDATE [Project_on_Blogs].[dbo].[user_table]
SET [email] = 'newemail@example.com'
WHERE [user_id] = 5;

--deleting user id
DELETE FROM [Project_on_Blogs].[dbo].[user_table]
WHERE [user_id] = 3;

--changing password
UPDATE [Project_on_Blogs].[dbo].[user_table]
SET [password] = 'newpassword'
WHERE [user_id] = 5;

--retrieve user info
SELECT * FROM [Project_on_Blogs].[dbo].[user_table]
WHERE [user_id] = 1;

