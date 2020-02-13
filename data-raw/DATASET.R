## code to prepare `DATASET` dataset goes here

# data wrangling goes here (before use_data)

library(tidycensus)
library(janitor)
library(tidyverse)

df <- get_acs("county",
              state = "OH",
              table = "S1810",
              cache_table = TRUE,
              survey = "acs1")

# rename the "NAME" column county
df <- df %>%
  rename(county = NAME)

# remove " County, Ohio" from county column (because it's the same in all cases)
df <- df %>%
  mutate(county = str_remove(county, " County, Ohio"))

# this goes at the end
usethis::use_data("df")
