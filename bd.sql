USE [master]
GO
/****** Object:  Database [GENPsC]    Script Date: 24/01/2021 20:11:50 ******/
CREATE DATABASE [GENPsC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GENPsC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GENPsC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GENPsC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GENPsC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GENPsC] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GENPsC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GENPsC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GENPsC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GENPsC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GENPsC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GENPsC] SET ARITHABORT OFF 
GO
ALTER DATABASE [GENPsC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GENPsC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GENPsC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GENPsC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GENPsC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GENPsC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GENPsC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GENPsC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GENPsC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GENPsC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GENPsC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GENPsC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GENPsC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GENPsC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GENPsC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GENPsC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GENPsC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GENPsC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GENPsC] SET  MULTI_USER 
GO
ALTER DATABASE [GENPsC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GENPsC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GENPsC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GENPsC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GENPsC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GENPsC] SET QUERY_STORE = OFF
GO
USE [GENPsC]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cor] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategoria]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategoria](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[ID_CATEGORIA] [bigint] NOT NULL,
 CONSTRAINT [PK_Subcategoria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Categoria_x_SubCategoria]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Categoria_x_SubCategoria]
AS
SELECT        dbo.Categoria.Nome AS NomeCategoria, dbo.Categoria.Cor AS CorCategoria, dbo.Subcategoria.ID AS ID_SUBCATEGORIA, dbo.Subcategoria.Nome AS NomeSubCategoria, dbo.Subcategoria.ID_CATEGORIA
FROM            dbo.Categoria INNER JOIN
                         dbo.Subcategoria ON dbo.Categoria.ID = dbo.Subcategoria.ID_CATEGORIA
GO
/****** Object:  Table [dbo].[Cancer]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cancer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SNPs]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SNPs](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Localizacao] [varchar](50) NOT NULL,
	[Cor] [varchar](15) NOT NULL,
	[Ordem] [int] NOT NULL,
	[Mecanismo] [varchar](400) NOT NULL,
	[TargetGene] [varchar](400) NOT NULL,
	[ID_CANCER] [bigint] NOT NULL,
 CONSTRAINT [PK_SNP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SNPs_x_Cancer]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_SNPs_x_Cancer]
AS
SELECT        dbo.SNPs.ID AS ID_SNPs, dbo.SNPs.Nome AS NomeSNPs, dbo.SNPs.Localizacao AS LocalizacaoSNPs, dbo.SNPs.Cor AS CorSNPs, dbo.SNPs.Ordem AS OrdemSNPs, dbo.SNPs.Mecanismo AS MecanismoSNPs, 
                         dbo.SNPs.TargetGene AS TargetGeneSNPs, dbo.SNPs.ID_CANCER, dbo.Cancer.Nome AS NomeCancer
FROM            dbo.SNPs INNER JOIN
                         dbo.Cancer ON dbo.SNPs.ID_CANCER = dbo.Cancer.ID
GO
/****** Object:  Table [dbo].[Cancer_x_SNP]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancer_x_SNP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Cancer] [bigint] NOT NULL,
	[ID_SNPS] [bigint] NOT NULL,
 CONSTRAINT [PK_Cancer_x_SNP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cancer_x_Subcategoria]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancer_x_Subcategoria](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_CANCER] [bigint] NOT NULL,
	[ID_SUBCATEGORIA] [bigint] NOT NULL,
 CONSTRAINT [PK_CANCER_x_SUBCATEGORIA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dado]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dado](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_SNP] [bigint] NOT NULL,
	[ID_SUBCATEGORIA] [bigint] NOT NULL,
	[Valor] [bit] NOT NULL,
 CONSTRAINT [PK_Dado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REL_Cancer_x_Subcategoria_x_SNP]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REL_Cancer_x_Subcategoria_x_SNP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_CANCER] [bigint] NOT NULL,
	[ID_SUBCATEGORIA] [bigint] NOT NULL,
	[ID_SNP] [bigint] NOT NULL,
 CONSTRAINT [PK_REL_Cancer_x_Subcategoria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REL_SNP_x_Subcategoria]    Script Date: 24/01/2021 20:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REL_SNP_x_Subcategoria](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_SNP] [bigint] NOT NULL,
	[ID_SUBCATEGORIA] [bigint] NOT NULL,
 CONSTRAINT [PK_REL_SNP_x_Subcategoria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cancer] ON 

INSERT [dbo].[Cancer] ([ID], [Nome]) VALUES (1, N' Ovario epitelial')
SET IDENTITY_INSERT [dbo].[Cancer] OFF
SET IDENTITY_INSERT [dbo].[Cancer_x_SNP] ON 

INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (41, 1, 1)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (42, 1, 2)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (43, 1, 3)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (44, 1, 4)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (45, 1, 6)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (46, 1, 7)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (47, 1, 8)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (48, 1, 9)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (49, 1, 10)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (50, 1, 11)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (51, 1, 12)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (52, 1, 13)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (53, 1, 14)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (54, 1, 15)
INSERT [dbo].[Cancer_x_SNP] ([ID], [ID_Cancer], [ID_SNPS]) VALUES (55, 1, 16)
SET IDENTITY_INSERT [dbo].[Cancer_x_SNP] OFF
SET IDENTITY_INSERT [dbo].[Cancer_x_Subcategoria] ON 

INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (49, 1, 1)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (50, 1, 2)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (51, 1, 3)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (52, 1, 4)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (53, 1, 5)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (54, 1, 6)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (55, 1, 7)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (56, 1, 8)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (57, 1, 9)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (58, 1, 10)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (59, 1, 11)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (60, 1, 12)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (61, 1, 13)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (62, 1, 14)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (63, 1, 15)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (64, 1, 16)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (65, 1, 17)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (66, 1, 18)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (67, 1, 19)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (68, 1, 20)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (69, 1, 21)
INSERT [dbo].[Cancer_x_Subcategoria] ([ID], [ID_CANCER], [ID_SUBCATEGORIA]) VALUES (70, 1, 22)
SET IDENTITY_INSERT [dbo].[Cancer_x_Subcategoria] OFF
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([ID], [Nome], [Cor]) VALUES (1, N'Studies', N'#295218')
INSERT [dbo].[Categoria] ([ID], [Nome], [Cor]) VALUES (2, N'Population Ancestry', N'#311873')
INSERT [dbo].[Categoria] ([ID], [Nome], [Cor]) VALUES (3, N'Tumor Subtypes', N'#000000')
INSERT [dbo].[Categoria] ([ID], [Nome], [Cor]) VALUES (5, N'Fine Mapping', N'#630000')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ON 

INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (4, 1, 1, 1)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (5, 1, 1, 2)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (6, 1, 2, 1)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (7, 1, 2, 2)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (8, 1, 6, 1)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (9, 1, 6, 2)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (10, 1, 6, 3)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (11, 1, 6, 4)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (12, 1, 6, 6)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (13, 1, 6, 7)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (14, 1, 6, 8)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (15, 1, 7, 8)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (16, 1, 8, 8)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (17, 1, 8, 7)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (18, 1, 2, 3)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (19, 1, 4, 4)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (20, 1, 4, 3)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (21, 1, 3, 6)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (22, 1, 4, 7)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (23, 1, 8, 2)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (24, 1, 9, 2)
INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] ([ID], [ID_CANCER], [ID_SUBCATEGORIA], [ID_SNP]) VALUES (25, 1, 10, 3)
SET IDENTITY_INSERT [dbo].[REL_Cancer_x_Subcategoria_x_SNP] OFF
SET IDENTITY_INSERT [dbo].[SNPs] ON 

INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (1, N'rs58722170', N'1p34.3', N'#FFE79C', 1, N'', N'RSPO1, C1orf109, FHL3, DNALI1', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (2, N'rs56318008', N'1p36.12', N'#FFE79C', 1, N'', N'WNT4, CDC42, LINC00339, RAP1GAP', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (3, N'rs2165109', N'2q13', N'#B5D6A5', 2, N'methylation, enhance', N'BCL2L11', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (4, N'rs6755777', N'2q14.1', N'#B5D6A5', 2, N'3''UTR; promoter', N'PAX8', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (6, N'rs6755777', N'2q31.1', N'#B5D6A5', 2, N'enhancer', N'HOXD1, HOXD3, HOXD9', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (7, N'rs7643459', N'2q37.3', N'#B5D6A5', 2, N'', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (8, N'rs112071820', N'3q22.3', N'#A5C6CE', 3, N'methylation', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (9, N'rs7643459', N'3p26.1', N'#A5C6CE', 3, N'', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (10, N'rs62274041', N'3q25.31', N'#A5C6CE', 3, N'', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (11, N'rs9870207', N'3q28', N'#A5C6CE', 3, N'3'' UTR', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (12, N'rs4286604', N'4q13.3', N'#9CC6EF', 4, N'', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (13, N'rs192876988', N'4q21.21', N'#9CC6EF', 4, N'', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (14, N'rs17329882', N'4q26', N'#9CC6EF', 4, N'', N'SYNPO2', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (15, N'rs13113999', N'4q32.3', N'#9CC6EF', 4, N'', N'', 1)
INSERT [dbo].[SNPs] ([ID], [Nome], [Localizacao], [Cor], [Ordem], [Mecanismo], [TargetGene], [ID_CANCER]) VALUES (16, N'rs4691139', N'4q32.3', N'#9CC6EF', 99, N'', N'TRIM60, c4orf39, TMEM192', 1)
SET IDENTITY_INSERT [dbo].[SNPs] OFF
SET IDENTITY_INSERT [dbo].[Subcategoria] ON 

INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (1, N'Other studies', 1)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (2, N'Oncoarray', 1)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (3, N'TWAS', 1)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (4, N'European', 2)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (5, N'Han Chinese', 2)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (6, N'East Asians', 2)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (7, N'Japanese', 2)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (8, N'African', 2)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (9, N'All invasive', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (10, N'HGSOC', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (11, N'LGSOC', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (12, N'All serous', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (13, N'Serous borderline', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (14, N'MOC', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (15, N'ENOC', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (16, N'CCOC', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (17, N'BRCA1 mut+', 3)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (18, N'Fine mapping', 5)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (19, N'candidate fSNP', 5)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (20, N'candidate tGene', 5)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (21, N'SNP-gene link (3C, e/mQTL)', 5)
INSERT [dbo].[Subcategoria] ([ID], [Nome], [ID_CATEGORIA]) VALUES (22, N'In-depth studies', 5)
SET IDENTITY_INSERT [dbo].[Subcategoria] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 245
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subcategoria"
            Begin Extent = 
               Top = 55
               Left = 509
               Bottom = 262
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Categoria_x_SubCategoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Categoria_x_SubCategoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SNPs"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cancer"
            Begin Extent = 
               Top = 40
               Left = 272
               Bottom = 257
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SNPs_x_Cancer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SNPs_x_Cancer'
GO
USE [master]
GO
ALTER DATABASE [GENPsC] SET  READ_WRITE 
GO
