select * from layoffs
--create another copy from data 
select * into layoffs2 
from layoffs;

select * from layoffs2;

--Find Dublicte and Remove Them

with dublicate as (
select *,
ROW_NUMBER()over(partition by company,location,industry,date,total_laid_off,funds_raised_millions  order by (select null)) row_dublicate
from layoffs2)
Delete  from dublicate
where row_dublicate>1


select * from layoffs2 
where company='Beyond Meat'

select * from layoffs2 
where company='Cazoo'

select * from layoffs2 
--another way
--Find Dublicte and Remove Them

select * into layoffs3
from layoffs;

select * from layoffs3


USE [Alex_Data_Cleaning]
GO

/****** Object:  Table [dbo].[layoffs ]    Script Date: 06/09/2026 08:28:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE layoffs4(
	[company] [nvarchar](50) NULL,
	[location] [nvarchar](50) NULL,
	[industry] [nvarchar](50) NULL,
	[total_laid_off] [nvarchar](50) NULL,
	[percentage_laid_off] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
	[stage] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[funds_raised_millions] [nvarchar](50) NULL,
	[row_num] [nvarchar](50) NULL
) ON [PRIMARY]
GO


select * from layoffs4
insert layoffs4
select *,
ROW_NUMBER()over(partition by company,location,industry,date,total_laid_off,funds_raised_millions  order by (select null)) [row_num]
from layoffs3

select * from layoffs4
where Row_num>1
select * from layoffs4
where company='Hibob'

Delete from layoffs4
where Row_num>1
--Standrize data
select * from layoffs4
--compare between them to know if they need to trim  data
select distinct len(company) ,  len(trim(company))
from layoffs4
--to know if there any mistake
select distinct location 
from layoffs4
order by location

select distinct industry 
from layoffs4
order by industry

select * from layoffs4
where industry like'%Crypto%'
begin tran;
update layoffs4
set industry='Crypto'
where industry like'%Crypto%';
commit tran;
rollback tran;

select distinct  country 
from layoffs4
order by country
select  country 
from layoffs4
where country like'%States%'
order by country

--there is united state and united state. with dot

begin tran;
update layoffs4
set country='United States'
where country like'%States%';
commit tran;
rollback tran;

--the time is varchar and not date

begin tran;
update layoffs4
set date=TRY_CAST(date as date) ;
commit tran;
rollback tran;

alter table layoffs4
alter column date date 

--there are  null values  industry
select distinct  company,industry from layoffs4
select   company,industry 
from layoffs4
where company='Carvana'

select * from layoffs4 a
join layoffs4 b
on a.company=b.company
where a.industry is null

select * from layoffs4 
where industry is null
select * from layoffs4 
where company ='Carvana'

update a
set a.industry=b.industry
from layoffs4 a
join layoffs4 b
on a.company=b.company
where a.industry is null
and b.industry is not null

--delete row_num column 
alter table layoffs4
drop column row_num

select * from layoffs4