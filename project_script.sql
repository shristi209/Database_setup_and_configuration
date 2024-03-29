USE [Project_on_Blogs]
GO
/****** Object:  Table [dbo].[blog]    Script Date: 3/1/2024 2:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[blog_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_table]    Script Date: 3/1/2024 2:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_table](
	[blog_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_category_table] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment_table]    Script Date: 3/1/2024 2:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment_table](
	[comment_id] [int] NOT NULL,
	[blog_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[content] [text] NOT NULL,
 CONSTRAINT [PK_comment_table] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_table]    Script Date: 3/1/2024 2:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_table](
	[user_id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user_table] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[blog] ([blog_id], [user_id], [title], [description]) VALUES (8, 2, N'SQL', N'Its Structured Query language')
INSERT [dbo].[blog] ([blog_id], [user_id], [title], [description]) VALUES (9, 1, N'DBMS', N'DBMS is database management system')
GO
INSERT [dbo].[category_table] ([blog_id], [name]) VALUES (8, N'RDBMS')
INSERT [dbo].[category_table] ([blog_id], [name]) VALUES (9, N'Education')
GO
INSERT [dbo].[comment_table] ([comment_id], [blog_id], [user_id], [content]) VALUES (6, 8, 2, N'Loved it')
INSERT [dbo].[comment_table] ([comment_id], [blog_id], [user_id], [content]) VALUES (7, 9, 1, N'Such a insightful content')
GO
INSERT [dbo].[user_table] ([user_id], [username], [email], [password]) VALUES (1, N'Ram', N'ram@gmail.com', N'ramram')
INSERT [dbo].[user_table] ([user_id], [username], [email], [password]) VALUES (2, N'Sita', N'sita@gmail.com', N'sitasita')
INSERT [dbo].[user_table] ([user_id], [username], [email], [password]) VALUES (4, N'Pari', N'pari@gmail.com', N'paripari')
GO
ALTER TABLE [dbo].[blog]  WITH NOCHECK ADD  CONSTRAINT [FK_blog_category_table] FOREIGN KEY([blog_id])
REFERENCES [dbo].[category_table] ([blog_id])
GO
ALTER TABLE [dbo].[blog] NOCHECK CONSTRAINT [FK_blog_category_table]
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD  CONSTRAINT [FK_blog_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_table] ([user_id])
GO
ALTER TABLE [dbo].[blog] CHECK CONSTRAINT [FK_blog_user_table]
GO
ALTER TABLE [dbo].[comment_table]  WITH CHECK ADD  CONSTRAINT [FK_comment_table_blog] FOREIGN KEY([blog_id])
REFERENCES [dbo].[blog] ([blog_id])
GO
ALTER TABLE [dbo].[comment_table] CHECK CONSTRAINT [FK_comment_table_blog]
GO
ALTER TABLE [dbo].[comment_table]  WITH CHECK ADD  CONSTRAINT [FK_comment_table_user_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_table] ([user_id])
GO
ALTER TABLE [dbo].[comment_table] CHECK CONSTRAINT [FK_comment_table_user_table]
GO
