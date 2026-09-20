
# Load packages -----------------------------------------------------------

## install.packages("skimr") 
## install.packages("tidyverse")
library(tidyverse)
library(skimr)
library(janitor)

# Import data -------------------------------------------------------------
penguins <- read_csv("data/penguins.csv")

# Exploratory data analysis -----------------------------------------------

## Structure of data -------------
str(penguins)

## summary of data
summary(penguins)

## Skim for more robust summary
skim(penguins)

## Initial clean-up
penguins |> 
  count(sex)

penguins |> 
  filter(is.na(sex))

penguins |> 
  filter(!is.na(sex))

penguins |> 
  filter(sex == "male" | sex == "female")

penguins_clean <- penguins |> 
  mutate(
    species = as.factor(species),
    island = as.factor(island),
    sex = as.factor(sex),
    year = as.integer(year)
  ) |> 
  filter(!is.na(sex))
  

## Univariate analysis ----
penguins_clean$species

penguins_clean |> 
  count(species)

table(penguins_clean$species)

### Visualization
ggplot(penguins_clean, aes(species)) +
  geom_bar(fill = "navy") +
  labs(
    x = "Species",
    y = "Count",
    title = "Frequency of Penguins in the Behen Archipelago",
    subtitle = "Adelie is the most common species of Penguin in the Behen Archipelago. Is it?",
    caption = "Data Source: Palmerspenguin package | Graphics by: Staff James"
  ) +
  theme_minimal()

### Grammar of graphics
ggplot(
  data = penguins_clean,
  mapping = aes(x = species)
) +
  geom_bar(
    color = "grey5",
    fill = "white"
  ) +
  labs(
    x = "Species",
    y = "Frequency Count",
    title = "Frequency of Penguins in Behen"
  ) +
  theme_bw(base_size = 12)
  
















