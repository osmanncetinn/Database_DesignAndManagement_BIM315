/** DROP TABLES IF THEY EXIST **/

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='migros_employees')
DROP TABLE migros_employees
go

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='migros_products')
DROP TABLE migros_products
go

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='migros_vendors')
DROP TABLE migros_vendors
go

/****** Object:  Check [ck_employee_birthdate]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_employee_birthdate]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
BEGIN
ALTER TABLE [dbo].[migros_employees] DROP CONSTRAINT [ck_employee_birthdate]

END
GO
/****** Object:  Check [ck_employee_minimum_wage]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_employee_minimum_wage]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
BEGIN
ALTER TABLE [dbo].[migros_employees] DROP CONSTRAINT [ck_employee_minimum_wage]

END
GO
/****** Object:  Check [CK_migros_products_prices_larger_than_or_equal_to_zero]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_migros_products_prices_larger_than_or_equal_to_zero]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
BEGIN
ALTER TABLE [dbo].[migros_products] DROP CONSTRAINT [CK_migros_products_prices_larger_than_or_equal_to_zero]

END
GO
/****** Object:  Default [DF_migros_employee_timesheets_timesheet_hours]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_employee_timesheets_timesheet_hours]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employee_timesheets]'))
Begin
ALTER TABLE [dbo].[migros_employee_timesheets] DROP CONSTRAINT [DF_migros_employee_timesheets_timesheet_hours]

End
GO
/****** Object:  Default [DF__migros__emplo__40F9A68C]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__migros__emplo__40F9A68C]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
Begin
ALTER TABLE [dbo].[migros_employees] DROP CONSTRAINT [DF__migros__emplo__40F9A68C]

End
GO
/****** Object:  Default [DF__migros__emplo__41EDCAC5]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__migros__emplo__41EDCAC5]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
Begin
ALTER TABLE [dbo].[migros_employees] DROP CONSTRAINT [DF__migros__emplo__41EDCAC5]

End
GO
/****** Object:  Default [DF_migros_products_product_retail_price]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_products_product_retail_price]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] DROP CONSTRAINT [DF_migros_products_product_retail_price]

End
GO
/****** Object:  Default [DF_migros_products_product_wholesale_price]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_products_product_wholesale_price]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] DROP CONSTRAINT [DF_migros_products_product_wholesale_price]

End
GO
/****** Object:  Default [DF_migros_product_product_is_active]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_product_product_is_active]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] DROP CONSTRAINT [DF_migros_product_product_is_active]

End
GO
/****** Object:  Default [DF_migros_products_product_add_date]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_products_product_add_date]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] DROP CONSTRAINT [DF_migros_products_product_add_date]

End
GO
/****** Object:  Table [dbo].[migros_products]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[migros_products]') AND type in (N'U'))
DROP TABLE [dbo].[migros_products]
GO
/****** Object:  Table [dbo].[migros_employees]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[migros_employees]') AND type in (N'U'))
DROP TABLE [dbo].[migros_employees]
GO
/****** Object:  Table [dbo].[migros_vendors]    Script Date: 09/15/2007 23:05:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[migros_vendors]') AND type in (N'U'))
DROP TABLE [dbo].[migros_vendors]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[migros_vendors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[migros_vendors](
	[vendor_id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[vendor_phone] [varchar](20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[vendor_website] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
 CONSTRAINT [PK_migros_vendors_1] PRIMARY KEY CLUSTERED 
(
	[vendor_id] ASC
)WITH (IGNORE_DUP_KEY = OFF),
 CONSTRAINT [IX_migros_vendor_name_unique] UNIQUE NONCLUSTERED 
(
	[vendor_name] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
SET IDENTITY_INSERT [dbo].[migros_vendors] ON
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (1, N'Soney', N'555-2939', N'http://www.soney.com')
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (2, N'Mikey', N'555-2870', N'http://mikee.com')
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (3, N'Stanlee', N'555-9920', NULL)
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (5, N'Mikerosoft', N'555-2220', N'http://www.mikerosoft.com')
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (6, N'Fudgeman', N'555-1239', N'http://www.fudgeman.com')
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (7, N'Leaveeyes', N'555-2931', NULL)
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (8, N'Weebock', N'555-0002', N'http://www.weebock.com')
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (9, N'Fudgeoco', N'555-0232', N'http://www.fudgeoco.com')
INSERT [dbo].[migros_vendors] ([vendor_id], [vendor_name], [vendor_phone], [vendor_website]) VALUES (10, N'Blackened-Deckhand', N'555-9922', NULL)
SET IDENTITY_INSERT [dbo].[migros_vendors] OFF
/****** Object:  Table [dbo].[migros_employees]    Script Date: 09/15/2007 23:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[migros_employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[migros_employees](
	[employee_id] [int] NOT NULL,
	[employee_ssn] [char](9) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[employee_lastname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[employee_firstname] [varchar](50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[employee_jobtitle] [varchar](20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[employee_department] [varchar](20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[employee_birthdate] [datetime] NOT NULL,
	[employee_hiredate] [datetime] NOT NULL,
	[employee_termdate] [datetime] NULL,
	[employee_hourlywage] [money] NOT NULL,
	[employee_supervisor_id] [int] NULL,
 CONSTRAINT [pk_employee_id] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (IGNORE_DUP_KEY = OFF),
 CONSTRAINT [u_employee_ssn] UNIQUE NONCLUSTERED 
(
	[employee_ssn] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (1, N'111220001', N'Photo', N'Arial', N'Sales Associate', N'Electronics', CAST(0x0000750900000000 AS DateTime), CAST(0x000094CB00000000 AS DateTime), NULL, 14.5000, 5)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (2, N'111220002', N'Ladd', N'Sal', N'Sales Associate', N'Electronics', CAST(0x0000764B00000000 AS DateTime), CAST(0x0000969D00000000 AS DateTime), NULL, 14.1500, 5)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (3, N'111220003', N'Dawind', N'Dustin', N'Sales Associate', N'Hardware', CAST(0x000067AF00000000 AS DateTime), CAST(0x0000951800000000 AS DateTime), NULL, 12.4500, 6)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (4, N'111220004', N'Shores', N'Sandi', N'Sales Associate', N'Hardware', CAST(0x000080EC00000000 AS DateTime), CAST(0x0000967F00000000 AS DateTime), NULL, 12.3000, 6)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (5, N'111220005', N'Gunnering', N'Isabelle', N'Department Manager', N'Electronics', CAST(0x000069C800000000 AS DateTime), CAST(0x000096B200000000 AS DateTime), NULL, 18.9000, 32)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (6, N'111220006', N'Hvmeehom', N'Lee', N'Department Manager', N'Hardware', CAST(0x000068F800000000 AS DateTime), CAST(0x0000947A00000000 AS DateTime), NULL, 17.4500, 32)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (7, N'111220007', N'Wrench', N'Allan', N'Sales Associate', N'Housewares', CAST(0x00007DEA00000000 AS DateTime), CAST(0x0000960300000000 AS DateTime), NULL, 11.3500, 24)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (8, N'111220008', N'Gator', N'Ally', N'Sales Associate', N'Sporting Goods', CAST(0x0000698100000000 AS DateTime), CAST(0x000096B000000000 AS DateTime), NULL, 11.6000, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (9, N'111220009', N'Frienzergon', N'Alma', N'Sales Associate', N'Housewares', CAST(0x0000737100000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, 11.0000, 24)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (10, N'111220010', N'Choke', N'Artie', N'Sales Associate', N'Hardware', CAST(0x00006D8100000000 AS DateTime), CAST(0x0000962C00000000 AS DateTime), NULL, 11.9500, 6)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (11, N'111220011', N'Alott', N'Bette', N'Sales Associate', N'Sporting Goods', CAST(0x00007DDF00000000 AS DateTime), CAST(0x0000964C00000000 AS DateTime), NULL, 10.8000, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (12, N'111220012', N'Melator', N'Bill', N'Sales Associate', N'Sporting Goods', CAST(0x000081F100000000 AS DateTime), CAST(0x0000958F00000000 AS DateTime), NULL, 10.2500, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (13, N'111220013', N'Enweave', N'Bob', N'Sales Associate', N'Sporting Goods', CAST(0x00007D5000000000 AS DateTime), CAST(0x0000965F00000000 AS DateTime), NULL, 11.8500, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (14, N'111220014', N'Nugget', N'Chris P.', N'Sales Associate', N'Electronics', CAST(0x0000785500000000 AS DateTime), CAST(0x0000953100000000 AS DateTime), NULL, 14.7500, 5)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (15, N'111220015', N'Itupp', N'Chuck', N'Sales Associate', N'Sporting Goods', CAST(0x000081F100000000 AS DateTime), CAST(0x0000960400000000 AS DateTime), NULL, 10.5500, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (16, N'111220016', N'Erin', N'Detyers', N'Sales Associate', N'Hardware', CAST(0x000080CF00000000 AS DateTime), CAST(0x0000964700000000 AS DateTime), NULL, 12.6500, 6)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (17, N'111220017', N'Tan', N'Kurt', N'Sales Associate', N'Clothing', CAST(0x00007A4900000000 AS DateTime), CAST(0x0000955800000000 AS DateTime), NULL, 9.2500, 20)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (18, N'111220018', N'Case', N'Justin', N'Sales Associate ', N'Clothing', CAST(0x0000766100000000 AS DateTime), CAST(0x0000957500000000 AS DateTime), NULL, 8.9000, 20)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (19, N'111220019', N'Belevit', N'Kent', N'Sales Associate', N'Clothing', CAST(0x00007EDB00000000 AS DateTime), CAST(0x000095FB00000000 AS DateTime), NULL, 9.4500, 20)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (20, N'111220020', N'Mi', N'Mary', N'Department Manager', N'Clothing', CAST(0x000073C000000000 AS DateTime), CAST(0x0000946200000000 AS DateTime), NULL, 19.5500, 32)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (21, N'111220021', N'Mumm', N'Maxi', N'Sales Associate', N'Electronics', CAST(0x00007F6C00000000 AS DateTime), CAST(0x0000947D00000000 AS DateTime), NULL, 13.3500, 5)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (22, N'111220022', N'Rophone', N'Mike', N'Sales Associate', N'Housewares', CAST(0x00007DDF00000000 AS DateTime), CAST(0x0000967900000000 AS DateTime), NULL, 11.0000, 24)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (23, N'111220023', N'Tural', N'Nat', N'Sales Associate', N'Sporting Goods', CAST(0x0000810000000000 AS DateTime), CAST(0x0000950C00000000 AS DateTime), NULL, 11.3000, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (24, N'111220024', N'Moni', N'Otto', N'Department Manager', N'Housewares', CAST(0x000076B200000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), NULL, 17.5000, 32)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (25, N'111220025', N'O''Furniture', N'Patty', N'Sales Associate', N'Housewares', CAST(0x00007CCF00000000 AS DateTime), CAST(0x0000972400000000 AS DateTime), NULL, 10.9000, 24)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (26, N'111220026', N'Moss', N'Pete', N'Sales Associate', N'Sporting Goods', CAST(0x00007CDB00000000 AS DateTime), CAST(0x000094E300000000 AS DateTime), NULL, 10.0000, 27)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (27, N'111220027', N'Docktur-Indahaus', N'Sara', N'Department Manager', N'Sporting Goods', CAST(0x0000778500000000 AS DateTime), CAST(0x000094FA00000000 AS DateTime), NULL, 19.2000, 32)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (28, N'111220028', N'Isnomor', N'Sara', N'Sales Associate', N'Clothing', CAST(0x0000807500000000 AS DateTime), CAST(0x0000963C00000000 AS DateTime), NULL, 9.0000, 20)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (29, N'111220029', N'Ofewe', N'Seymour', N'Sales Associate', N'Customer Service', CAST(0x0000799E00000000 AS DateTime), CAST(0x0000965F00000000 AS DateTime), NULL, 13.5000, 31)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (30, N'111220030', N'Shores', N'Sonny', N'Sales Associate', N'Customer Service', CAST(0x0000787000000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, 12.9500, 31)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (31, N'111220031', N'Itupp', N'Tally', N'Department Manager', N'Customer Service', CAST(0x000073F800000000 AS DateTime), CAST(0x000095AD00000000 AS DateTime), NULL, 21.5000, 32)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (32, N'111220032', N'Androll', N'Tuck', N'Store Manager', N'Customer Service', CAST(0x0000771500000000 AS DateTime), CAST(0x000095FC00000000 AS DateTime), NULL, 28.5000, 33)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (33, N'111220033', N'Fudge', N'Michael', N'CEO', N'Customer Service', CAST(0x000063DF00000000 AS DateTime), CAST(0x0000946100000000 AS DateTime), NULL, 68.8500, NULL)
INSERT [dbo].[migros_employees] ([employee_id], [employee_ssn], [employee_lastname], [employee_firstname], [employee_jobtitle], [employee_department], [employee_birthdate], [employee_hiredate], [employee_termdate], [employee_hourlywage], [employee_supervisor_id]) VALUES (34, N'111220034', N'Wokr', N'Willie', N'Sales Associate', N'Clothing', CAST(0x000081BA00000000 AS DateTime), CAST(0x000095D300000000 AS DateTime), NULL, 9.3000, 20)
/****** Object:  Table [dbo].[migros_products]    Script Date: 09/15/2007 23:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[migros_products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[migros_products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_department] [varchar](20) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[product_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[product_retail_price] [money] NOT NULL,
	[product_wholesale_price] [money] NOT NULL,
	[product_is_active] [bit] NOT NULL,
	[product_add_date] [datetime] NOT NULL,
	[product_vendor_id] [int] NOT NULL,
	[product_description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CS_AS NULL,
 CONSTRAINT [PK_migros_products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (IGNORE_DUP_KEY = OFF),
 CONSTRAINT [IX_migros_product_name_unique] UNIQUE NONCLUSTERED 
(
	[product_name] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
END
GO
SET IDENTITY_INSERT [dbo].[migros_products] ON
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (3, N'Hardware', N'Rip Claw Hammer', 19.9500, 12.0000, 1, CAST(0x0000999B0123E443 AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (4, N'Clothing', N'Dri-Fit Tee', 20.0000, 8.0000, 1, CAST(0x000099A9011BEE32 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (5, N'Clothing', N'Running Pants', 35.0000, 12.0000, 1, CAST(0x000099A9011C0455 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (6, N'Clothing', N'Wool Socks', 8.0000, 2.0000, 1, CAST(0x000099A9011C16B3 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (7, N'Clothing', N'Squeaky Sneaks', 65.0000, 20.0000, 1, CAST(0x000099A9011C31D5 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (8, N'Clothing', N'Cool Jeans', 45.0000, 10.0000, 1, CAST(0x000099A9011C4E95 AS DateTime), 7, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (9, N'Clothing', N'Denim Jacket', 60.0000, 15.0000, 1, CAST(0x000099A9011C5D9D AS DateTime), 7, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (10, N'Clothing', N'Leather Jacket', 95.0000, 45.0000, 1, CAST(0x000099A9011C6906 AS DateTime), 7, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (11, N'Clothing', N'Courdory Pants', 24.0000, 12.0000, 1, CAST(0x000099AA01766B70 AS DateTime), 7, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (12, N'Clothing', N'Work Pants', 38.0000, 20.0000, 1, CAST(0x000099AA01768FF7 AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (13, N'Clothing', N'Work Gloves', 8.0000, 4.0000, 1, CAST(0x000099AA0176A673 AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (14, N'Clothing', N'Comfor-fit Tee', 12.0000, 2.0000, 1, CAST(0x000099AA0176CA03 AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (15, N'Clothing', N'Running Shorts', 20.0000, 5.0000, 1, CAST(0x000099AA0176DCD1 AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (16, N'Clothing', N'X-Train Shoes', 75.0000, 25.0000, 1, CAST(0x000099AA0176F46B AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (17, N'Clothing', N'Baseball Cap', 10.0000, 2.0000, 1, CAST(0x000099AA01770F30 AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (18, N'Clothing', N'DVD Player', 45.0000, 30.0000, 1, CAST(0x000099AA017735AD AS DateTime), 1, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (19, N'Electronics', N'HD-DVD Player', 150.0000, 100.0000, 1, CAST(0x000099AA01774D30 AS DateTime), 1, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (20, N'Electronics', N'Blu-Ray DVD Player', 150.0000, 100.0000, 1, CAST(0x000099AA0177625F AS DateTime), 1, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (21, N'Electronics', N'40" LCD HD TV', 1000.0000, 800.0000, 1, CAST(0x000099AA01778427 AS DateTime), 1, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (22, N'Electronics', N'50" LCD HD TV', 1300.0000, 1100.0000, 1, CAST(0x000099AA0177A5CB AS DateTime), 1, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (23, N'Electronics', N'65" LCD HD TV', 1900.0000, 1700.0000, 1, CAST(0x000099AA0177F2E1 AS DateTime), 1, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (24, N'Electronics', N'PC Webcam', 20.0000, 15.0000, 1, CAST(0x000099AA017849BE AS DateTime), 5, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (25, N'Electronics', N'Computer Mouse', 10.0000, 5.0000, 1, CAST(0x000099AA01785B61 AS DateTime), 5, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (26, N'Electronics', N'Ergonomic Keyboard', 22.0000, 16.0000, 1, CAST(0x000099AA01786E25 AS DateTime), 5, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (27, N'Electronics', N'20" LCD Monitor', 300.0000, 200.0000, 1, CAST(0x000099AA01788ED9 AS DateTime), 5, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (28, N'Electronics', N'17" LCD Monitor', 150.0000, 75.0000, 1, CAST(0x000099AA0178A7EA AS DateTime), 5, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (29, N'Hardware', N'18v Drill Driver Set', 90.0000, 45.0000, 1, CAST(0x000099AA0178DE0B AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (30, N'Hardware', N'19.2v Drill Driver Set', 90.0000, 45.0000, 1, CAST(0x000099AA0178EE98 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (31, N'Hardware', N'10" Miter Saw', 200.0000, 140.0000, 1, CAST(0x000099AA017923CE AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (32, N'Hardware', N'Lazer Level', 45.0000, 25.0000, 1, CAST(0x000099AA01793460 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (33, N'Hardware', N'Table Saw', 290.0000, 180.0000, 1, CAST(0x000099AA01794978 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (34, N'Hardware', N'Power Washer', 290.0000, 180.0000, 1, CAST(0x000099AA01795FD4 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (35, N'Hardware', N'Cold Chisel Set', 10.0000, 5.0000, 1, CAST(0x000099AA01799E23 AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (36, N'Hardware', N'Screwdriver Set', 10.0000, 5.0000, 1, CAST(0x000099AA0179ABC3 AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (37, N'Hardware', N'Drill Bit Set', 25.0000, 13.0000, 1, CAST(0x000099AA0179BEBB AS DateTime), 3, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (38, N'Hardware', N'Belt Sander', 250.0000, 180.0000, 1, CAST(0x000099AA0179DAD6 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (39, N'Housewares', N'Crock Pot', 25.0000, 10.0000, 1, CAST(0x000099AA0179F555 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (40, N'Housewares', N'Monsignor Coffee', 20.0000, 10.0000, 1, CAST(0x000099AA017A17E7 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (41, N'Housewares', N'Electric Griddle', 20.0000, 10.0000, 1, CAST(0x000099AA017A31F5 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (42, N'Sporting Goods', N'Tennis Racket', 50.0000, 20.0000, 1, CAST(0x000099AA017A6268 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (43, N'Sporting Goods', N'Tennis Balls', 8.0000, 2.0000, 1, CAST(0x000099AA017A7419 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (44, N'Sporting Goods', N'Basketball', 35.0000, 12.0000, 1, CAST(0x000099AA017A8A99 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (45, N'Sporting Goods', N'12 Pack Golf Balls', 20.0000, 8.0000, 1, CAST(0x000099AA017A9C16 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (46, N'Sporting Goods', N'Pro. Football', 65.0000, 20.0000, 1, CAST(0x000099AA017AB2AA AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (47, N'Sporting Goods', N'Baseball Glove', 75.0000, 25.0000, 1, CAST(0x000099AA017AFA50 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (48, N'Sporting Goods', N'Heart Monitor', 20.0000, 15.0000, 1, CAST(0x000099AA017B195E AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (49, N'Sporting Goods', N'Pedometer', 10.0000, 5.0000, 1, CAST(0x000099AA017B2A81 AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (50, N'Sporting Goods', N'Sport Cycle', 255.0000, 100.0000, 1, CAST(0x000099AA017B5C04 AS DateTime), 8, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (51, N'Sporting Goods', N'Soccer Ball', 45.0000, 15.0000, 1, CAST(0x000099AA017B9C24 AS DateTime), 2, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (52, N'Housewares', N'Steam Iron', 15.0000, 5.0000, 1, CAST(0x000099AA017BAF70 AS DateTime), 10, NULL)
INSERT [dbo].[migros_products] ([product_id], [product_department], [product_name], [product_retail_price], [product_wholesale_price], [product_is_active], [product_add_date], [product_vendor_id], [product_description]) VALUES (53, N'Housewares', N'Blender', 45.0000, 20.0000, 1, CAST(0x000099AA017BD0FC AS DateTime), 10, NULL)
SET IDENTITY_INSERT [dbo].[migros_products] OFF
/****** Object:  Table [dbo].[migros_employee_timesheets]    Script Date: 09/15/2007 23:05:33 ******/
SET ANSI_NULLS ON
GO

/****** Object:  Default [DF__migros__emplo__40F9A68C]    Script Date: 09/15/2007 23:05:33 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__migros__emplo__40F9A68C]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
Begin
ALTER TABLE [dbo].[migros_employees] ADD  CONSTRAINT [DF__migros__emplo__40F9A68C]  DEFAULT (getdate()) FOR [employee_hiredate]

End
GO
/****** Object:  Default [DF__migros__emplo__41EDCAC5]    Script Date: 09/15/2007 23:05:33 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__migros__emplo__41EDCAC5]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
Begin
ALTER TABLE [dbo].[migros_employees] ADD  CONSTRAINT [DF__migros__emplo__41EDCAC5]  DEFAULT ((8)) FOR [employee_hourlywage]

End
GO
/****** Object:  Default [DF_migros_products_product_retail_price]    Script Date: 09/15/2007 23:05:33 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_products_product_retail_price]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] ADD  CONSTRAINT [DF_migros_products_product_retail_price]  DEFAULT ((0)) FOR [product_retail_price]

End
GO
/****** Object:  Default [DF_migros_products_product_wholesale_price]    Script Date: 09/15/2007 23:05:33 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_products_product_wholesale_price]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] ADD  CONSTRAINT [DF_migros_products_product_wholesale_price]  DEFAULT ((0)) FOR [product_wholesale_price]

End
GO
/****** Object:  Default [DF_migros_product_product_is_active]    Script Date: 09/15/2007 23:05:33 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_product_product_is_active]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] ADD  CONSTRAINT [DF_migros_product_product_is_active]  DEFAULT ((1)) FOR [product_is_active]

End
GO
/****** Object:  Default [DF_migros_products_product_add_date]    Script Date: 09/15/2007 23:05:33 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_migros_products_product_add_date]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
Begin
ALTER TABLE [dbo].[migros_products] ADD  CONSTRAINT [DF_migros_products_product_add_date]  DEFAULT (getdate()) FOR [product_add_date]

End
GO
/****** Object:  Check [ck_employee_birthdate]    Script Date: 09/15/2007 23:05:33 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_employee_birthdate]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
ALTER TABLE [dbo].[migros_employees]  WITH CHECK ADD  CONSTRAINT [ck_employee_birthdate] CHECK  ((datediff(year,[employee_birthdate],getdate())>(15)))
GO
/****** Object:  Check [ck_employee_minimum_wage]    Script Date: 09/15/2007 23:05:33 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[ck_employee_minimum_wage]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_employees]'))
ALTER TABLE [dbo].[migros_employees]  WITH CHECK ADD  CONSTRAINT [ck_employee_minimum_wage] CHECK  (([employee_hourlywage]>=(8)))
GO
/****** Object:  Check [CK_migros_products_prices_larger_than_or_equal_to_zero]    Script Date: 09/15/2007 23:05:33 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_migros_products_prices_larger_than_or_equal_to_zero]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
ALTER TABLE [dbo].[migros_products]  WITH CHECK ADD  CONSTRAINT [CK_migros_products_prices_larger_than_or_equal_to_zero] CHECK  (([product_wholesale_price]>=(0) AND [product_retail_price]>=(0)))
GO

/****** Object:  ForeignKey [FK_migros_products_migros_vendors1]    Script Date: 09/15/2007 23:05:33 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_migros_products_migros_vendors1]') AND parent_object_id = OBJECT_ID(N'[dbo].[migros_products]'))
ALTER TABLE [dbo].[migros_products]  WITH CHECK ADD  CONSTRAINT [FK_migros_products_migros_vendors1] FOREIGN KEY([product_vendor_id])
REFERENCES [dbo].[migros_vendors] ([vendor_id])
GO