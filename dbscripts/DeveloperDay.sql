/****** Object:  Table [dbo].[Diet]    Script Date: 2014-08-05 14:50:59 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DailyDemand] [float] NOT NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PrimaryKey_4679cd35-be41-477f-9da2-7b9619667f14] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2014-08-05 14:51:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Volume] [int] NULL,
	[ExpirationDate] [date] NULL,
	[EnergyValue] [int] NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[ProductCategoryID] [int] NULL,
 CONSTRAINT [PrimaryKey_94b1322a-e824-43c6-a8ca-3b9ad6d5ed01] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 2014-08-05 14:51:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentCategoryID] [int] NULL,
 CONSTRAINT [PrimaryKey_5d3607ee-bb8c-446f-9656-b1533a98c816] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Route]    Script Date: 2014-08-05 14:51:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Capacity] [float] NULL,
	[Region] [nvarchar](50) NULL,
	[StartCoordinates] [float] NULL,
	[EndCoordinates] [float] NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PrimaryKey_68ba05d6-c0ee-462d-a09b-e2dd70efc15d] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[User]    Script Date: 2014-08-05 14:51:01 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FridgeCapacity] [int] NULL,
	[TrunkCapacity] [int] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RouteID] [int] NULL,
	[VendorRouteID] [int] NULL,
	[DietID] [int] NULL,
 CONSTRAINT [PrimaryKey_d0d379c2-985f-4ecc-b8df-8d1ef90271f4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
ALTER TABLE [dbo].[Diet]  WITH CHECK ADD  CONSTRAINT [FK_Diet_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Diet] CHECK CONSTRAINT [FK_Diet_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_ParentCategory] FOREIGN KEY([ParentCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_ParentCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Diet] FOREIGN KEY([DietID])
REFERENCES [dbo].[Diet] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Diet]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Route] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Route] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Route]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_VendorRoute] FOREIGN KEY([VendorRouteID])
REFERENCES [dbo].[Route] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_VendorRoute]
GO
