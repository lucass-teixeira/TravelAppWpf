USE [master]
GO
/****** Object:  Database [TravelDb]    Script Date: 03/03/2022 19:05:36 ******/
CREATE DATABASE [TravelDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TravelDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TravelDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TravelDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TravelDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TravelDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TravelDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TravelDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TravelDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TravelDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TravelDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TravelDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TravelDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TravelDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TravelDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TravelDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TravelDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TravelDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TravelDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TravelDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TravelDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TravelDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TravelDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TravelDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TravelDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TravelDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TravelDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TravelDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TravelDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TravelDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TravelDb] SET  MULTI_USER 
GO
ALTER DATABASE [TravelDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TravelDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TravelDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TravelDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TravelDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TravelDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TravelDb] SET QUERY_STORE = OFF
GO
USE [TravelDb]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryName] [varchar](50) NOT NULL,
	[CountryCode] [char](3) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavCountries]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavCountries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[CountryCode] [char](3) NOT NULL,
 CONSTRAINT [PK_FavCountries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteCountries]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteCountries](
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_FavoriteCountries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRegion] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[LastPrice] [float] NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Img] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageRegion]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageRegion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRegion] [int] NOT NULL,
	[idImage] [int] NOT NULL,
 CONSTRAINT [PK_ImageRegion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [char](3) NOT NULL,
	[Place] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/03/2022 19:05:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Australia', N'AUS')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Austria', N'AUT')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Belgium', N'BEL')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Brazil', N'BRA')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Canada', N'CAN')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'China', N'CHN')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'England', N'ENG')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Spain', N'ESP')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Germany', N'GER')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Nepal', N'NPl')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'New Zealand', N'NZL')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Portugal', N'POR')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'Sweden', N'SWE')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'United Arab Emirates', N'UAE')
INSERT [dbo].[Country] ([CountryName], [CountryCode]) VALUES (N'United States of America', N'USA')
GO
ALTER TABLE [dbo].[FavCountries]  WITH CHECK ADD  CONSTRAINT [FK_FavCountries_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[FavCountries] CHECK CONSTRAINT [FK_FavCountries_Country]
GO
ALTER TABLE [dbo].[FavCountries]  WITH CHECK ADD  CONSTRAINT [FK_FavCountries_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[FavCountries] CHECK CONSTRAINT [FK_FavCountries_User]
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_Region] FOREIGN KEY([idRegion])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_Region]
GO
ALTER TABLE [dbo].[ImageRegion]  WITH CHECK ADD  CONSTRAINT [FK_ImageRegion_Image] FOREIGN KEY([idImage])
REFERENCES [dbo].[Image] ([id])
GO
ALTER TABLE [dbo].[ImageRegion] CHECK CONSTRAINT [FK_ImageRegion_Image]
GO
ALTER TABLE [dbo].[ImageRegion]  WITH CHECK ADD  CONSTRAINT [FK_ImageRegion_Region] FOREIGN KEY([idRegion])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[ImageRegion] CHECK CONSTRAINT [FK_ImageRegion_Region]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
USE [master]
GO
ALTER DATABASE [TravelDb] SET  READ_WRITE 
GO
