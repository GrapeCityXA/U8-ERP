USE [UFSystem]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GC_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[cMenu_Type] [nvarchar](50) NOT NULL,
	[cMenu_Id] [nvarchar](50) NOT NULL,
	[cMenu_Url] [nvarchar](max) NOT NULL,
	[SSO_Password] [nvarchar](50) NOT NULL,
	[DefaultTargetWindow] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WYN_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[GC_Menu] ADD  CONSTRAINT [DF_GC_Menu_SSO_Password]  DEFAULT ('') FOR [SSO_Password]
GO

ALTER TABLE [dbo].[GC_Menu] ADD  CONSTRAINT [DF_GC_Menu_DefaultTargetWindow]  DEFAULT (N'CurrentWindow') FOR [DefaultTargetWindow]
GO

INSERT INTO [UFSystem].[dbo].[GC_Menu] ([cMenu_Type], [cMenu_Id], [cMenu_Url], [DefaultTargetWindow])
     VALUES ('WYN', 'AT40', 'http://localhost:51980/dashboards/view/3337912c-ffba-468c-bfb3-9a6f5d039cc6?theme=default&lng=zh-CN'
           ,'CurrentWindow')
GO
INSERT INTO [UFSystem].[dbo].[GC_Menu] ([cMenu_Type], [cMenu_Id], [cMenu_Url], [DefaultTargetWindow])
     VALUES ('WYN', 'AB', 'http://localhost:51980/reports/view/aa1a1ec3-0cfe-478a-a482-2e9351f497a0?display=singlepage&theme=default&lng=zh-CN'
           ,'Popup')
GO



CREATE TABLE [dbo].[GC_Menu_Option](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[cMenu_Id] [nvarchar](50) NOT NULL,
	[cUser_Id] [nvarchar](50) NOT NULL,
	[TargetWindow] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GC_Menu_Option] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[GC_Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigKey] [nvarchar](50) NULL,
	[ConfigValue] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL,
 CONSTRAINT [PK_GC_Option] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
insert into GC_Config(ConfigKey,ConfigValue) Values('WynLoginUrl','http://localhost:51980/connect/token')
GO
insert into GC_Config(ConfigKey,ConfigValue) Values('WynDefaultTargetWindow','CurrentWindow')
GO



CREATE TABLE [dbo].[GC_Session](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Workstation] [nvarchar](max) NOT NULL,
	[WynToken] [nvarchar](max) NULL,
 CONSTRAINT [PK_WYN_Session] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



