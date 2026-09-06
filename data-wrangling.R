# Load Packages -----------------------------------------------------------
library(readxl)
library(tidyverse)
library(janitor)
library(babynames)

fish_tbl <- read_excel("data/ASFIS_sp_2023.xlsx")

fish_tbl <- fish_tbl |> 
  clean_names()

head(fish_tbl)

tail(fish_tbl)

# Data Wrangling ----------------------------------------------------------


# Arrange -----------------------------------------------------------------
fish_tbl |> 
  arrange(alpha3_code)

fish_tbl |> 
  arrange(alpha3_code, english_name)

babynames |> 
  head()

babynames |> 
  tail()

babynames |> 
  arrange(sex, name)

babynames |> 
  arrange(sex, desc(name))
  
babynames |> 
  arrange(desc(sex))


babynames |> 
  arrange(desc(year))

babynames |> 
  arrange(desc(prop))

babynames |> 
  arrange(desc(n))

# Select ------------------------------------------------------------------
fish_tbl
view(fish_tbl)

## Selecting with column name
fish_tbl |> 
  select(english_name)

## Selecting multiple columns with their names

fish_tbl |> 
  select(english_name, scientific_name)

fish_tbl |> 
  select(scientific_name, english_name)

fish_tbl |> 
  select(author, isscaap_group, alpha3_code)

fish_tbl |> 
  select(alpha3_code) |> 
  arrange(alpha3_code) |> 
  print(n = 100)

fish_tbl |> 
  select(english_name:russian_name)


fish_tbl |> 
  names()

names(fish_tbl)

## Selecting with numbers

fish_tbl |> 
  select(5, 6, 7, 8, 9, 10)

fish_tbl |> 
  select(c(5, 6, 7, 8, 9, 10))

fish_tbl |> 
  select(5:10)

## Selecting with select helper functions
fish_tbl |> 
  select(contains("_name"))

fish_tbl |> 
  select(contains("code"))

fish_tbl |> 
  select(where(is.double))

fish_tbl |> 
  select(starts_with("fish"))

fish_tbl |> 
  select(1:3, contains("name"))

fish_tbl |> 
  select(last_col())

# Mutate ------------------------------------------------------------------
babynames |> 
  mutate(
    percentage = prop * 100
  )

redpine <- read_csv("data/redpine.csv")
redpine |> 
  head()

redpine |> 
  mutate(
    volume = pi * (DBH/2) * HT,
    dbh_mm = DBH * 100
  )

students_data <- tibble(
  math_test = c(40, 30, 20, 40, 23, 24, 15),
  math_exam = c(50, 47, 56, 33, 45, 50, 60),
  science_test = c(33, 27, 32, 33, 40, 39, 35),
  science_exam = c(37, 42, 43, 52, 45, 47, 49)
)

student_data <- students_data |> 
  mutate(
    math_total = math_test + math_exam,
    science_total = science_test + science_exam,
    total = (math_total + science_total)/2
  )

set.seed(123)

student_data <- student_data |> 
  mutate(
    name = sample(babynames$name, 7),
    .before = math_test
  )


student_data |> 
  arrange(desc(total))

# Filter ------------------------------------------------------------------
babynames |> 
  filter(year == 2006)

babynames |> 
  filter(name == "Genevieve")

babynames |> 
  filter(name == "Stella")

babynames |> 
  filter(name == "James")

babynames |> 
  filter(name == "Precious")

babynames |> 
  filter(name == "Lydia")

# Filtering group

babynames |> 
  filter(name %in% c("Genevieve", "Stella", "James", "Precious")) 

babynames |> 
  filter(year > 1999)

## Filtering specific range

babynames |> 
  filter(year >= 2006 & year <= 2010) 

babynames |> 
  filter(between(year, 2006, 2010))


## Exercise
# - Filter Everybody with the name Genevieve within the year 1890 and 1990 then 
# return data in descending order according to prop

babynames |> 
  filter(name == "Genevieve", between(year, 1890, 1990)) |> 
  arrange(desc(prop))

# - Select all variables with name within their name, and select alpha3_code,
# filter out fishes with english name having cat in it

fish_tbl |> 
  select(contains("_name"))


fish_tbl |> 
  select(alpha3_code:russian_name)

fish_tbl |> 
  select(contains("_name"), alpha3_code) |>
  select(english_name) |> 
  filter(str_detect(english_name, "Catfish")) # reg-expression

fish_tbl |> 
  select(english_name) |> 
  filter(english_name == "Catfish nei")


# Group By ----------------------------------------------------------------
babynames |> 
  group_by(year) |> 
  count()

babynames |> 
  group_by(name) |> 
  count() |> 
  arrange(desc(n))

# Summarize ---------------------------------------------------------------
babynames |> 
  summarize(
    total_prop = sum(prop)
  )


sum(babynames$prop)

babynames |> 
  group_by(name) |> 
  summarize(
    total_count = sum(n)
  ) |> 
  arrange(desc(total_count))

redpine |> 
  count(PlotNum)

redpine |> 
  filter(CoverType != "Red pine") |> 
  group_by(CoverType) |> 
  summarize(
    mean_height = mean(HT)
  )

redpine |> 
  filter(CoverType != "Red pine") |> 
  summarize(
    .by = CoverType,
    mean_height = mean(HT)
  )