# Data importations
## Tidyverse packages
## - ggplot2, dplyr, readr, tidyr, purrr, lubridate, stringr, hms

# install.packages("tidyverse")
library(readr)
library(readxl)
library(janitor)
library(googlesheets4)

## Flat files

birds_tbl <- read_csv(file = "data/birds.csv")

read_tsv(file = "data/falcon.tsv")

read_csv(file = "data/nutrient_omission_trial/cwd.csv")

read_tsv("adult_test_data.tsv")

read_csv("https://raw.githubusercontent.com/eustudyassist/data-for-r4r/refs/heads/main/flatfiles/birds.csv")
read_csv("https://raw.githubusercontent.com/eustudyassist/data-for-r4r/refs/heads/main/flatfiles/moths.csv")


read_csv("cwd.csv")
read_csv("data/nutrient_omission_trial/acai_fr_forckan_2022.csv")
adult_name <- read_delim("data/adult/adult_names.txt")
head(adult_name)

## Spreadsheet files
read_xlsx("data/spreadsheet/ant.xlsx")
read_excel("data/spreadsheet/Ch2_Timber.xlsx")

read_excel(
  "data/spreadsheet/Ch2_Timber.xlsx",
  sheet = "Table_2_1a",
  skip = 4,
  range = "A6:B11"
) |> janitor::clean_names()


read_delim("data/chirps.txt", col_names = c("cps", "temp"))
read_delim("data/chirps.txt", col_names = FALSE)



# Googlesheets ------------------------------------------------------------
gs4_auth(email = "eustudyassist@gmail.com")
read_sheet(
  "https://docs.google.com/spreadsheets/d/1eOk8vOgrrDCEqRa1WWCaUQQIgEuNXs9qAcIwVwo0Nxs/edit?gid=486643408#gid=486643408",
  skip = 7
)

read_sheet(
  "1eOk8vOgrrDCEqRa1WWCaUQQIgEuNXs9qAcIwVwo0Nxs",
  skip = 7
)























