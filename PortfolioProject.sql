--CREATE DATABASE PortfolioProject

Select *
From PortfolioProject..CovidDeaths
Where continent is not null
Order by 3,4

Select *
From PortfolioProject..CovidVaccinations
Order by 3,4

----Change Datatype
ALTER TABLE PortfolioProject..CovidDeaths
Alter COLUMN total_cases int
--Change Datatype
ALTER TABLE PortfolioProject..CovidDeaths
Alter COLUMN date date

ALTER TABLE PortfolioProject..CovidDeaths
Alter COLUMN total_deaths int


----Select Data that we are going to use
Select Location, date, total_cases, new_cases, total_deaths, Population
From PortfolioProject..CovidDeaths
Order by 1,2


-- Looking at total_cases vs total_deaths
--Select Location, date, total_cases,total_deaths, (cast(total_deaths as numeric(18,5))/ nullif(total_cases,0))*100 AS DeathPercentage
--From PortfolioProject..CovidDeaths
--where location like '%Hung%'
--Order by 3

----Looking the totalcases vs population
----Show what percentage of population got covid
--Select Location, date, total_cases,population, (cast(total_cases as numeric (18,5))/population)*100 AS Percentpopulationinfected
--From PortfolioProject..CovidDeaths
--where location like '%Hung%'
--Order by 1,2

----Loking at countries with highest effection rate compare to population
--Select Location, Population, Max(total_cases) As Highest_Cases, Max(cast(total_cases as numeric(18,5))/ nullif(population,0))*100 As Percentpopulationinfected
--From PortfolioProject..CovidDeaths
--where continent is not null
--Group by Location, population
--Order by Percentpopulationinfected desc

---- Showing countries with the highest cases
--Select Location,continent, Max(cast(total_Deaths as int)) As Highest_deaths
--From PortfolioProject..CovidDeaths
--where continent > ' '
--Group by Location, continent
--Order by Highest_deaths desc

----Showing Countries with highest Death Count per Population
--Select Location, Population, Max(total_Deaths) As Highest_deaths, Max(cast(total_Deaths as numeric(18,5))/ nullif(population,0))*100 As Percentpopulationdeaths
--From PortfolioProject..CovidDeaths
--where continent > ' '
--Group by Location, population
--Order by Percentpopulationdeaths desc

---- Showing continent with the highest cases
--Select continent, Max(cast(total_Deaths as int)) As Highest_deaths
--From PortfolioProject..CovidDeaths
--where continent > ' '
--Group by Continent
--Order by Highest_deaths desc

---- Showing continents with the highest death per population
--Select Continent, Max(total_Deaths) As Highest_deaths, Max(cast(total_Deaths as numeric(18,5))/ nullif(population,0))*100 As Percentpopulationdeaths
--From PortfolioProject..CovidDeaths
--where continent > ' '
--Group by Continent
--Order by Percentpopulationdeaths desc

----Global nambers
--Select date, Sum(Cast(new_cases as int)) as totalcasesbydays, Sum(Cast(new_deaths as int)) as totaldeathbydays
--From PortfolioProject..CovidDeaths
--Where continent > ' '
--Group by date
--Order by 1

----VACCINATIONS
--Select *
----From PortfolioProject..CovidVaccinations

--Select dea.continent,dea.date, dea.location, vac.new_vaccinations
--From PortfolioProject..CovidDeaths dea
--Join PortfolioProject..Covidvaccinations vac
--	On dea.Location = vac. Location
--	and dea.date=vac.date
--Where dea.continent > ' '
--	and vac.new_vaccinations > 0
--Order by 2


--creating view to store data for later visualization
Create View VaccinationInformationbyday As
Select dea.continent,dea.date, dea.location, vac.new_vaccinations
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..Covidvaccinations vac
	On dea.Location = vac. Location
	and dea.date=vac.date
Where dea.continent > ' '
	and vac.new_vaccinations > 0
