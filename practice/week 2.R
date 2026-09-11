library(tidyverse)
library(tidycensus)

#I'm going to load some data now!
pa_income <- get_acs(
  geography = "county",
  variables = "B19013_001",
  state = "PA",
  year = 2023,
  survey = "acs5"
)

dim(pa_income)
glimpse(pa_income)

head(pa_income)
pa_income$GEOID
as.numeric("01001")
#The leading zero has been dropped?! oh no...
filter(pa_income,estimate>60000)
#56 rows, I predicted it would be fewer than 67

# counties where the margin of error is bigger than 3000
filter(pa_income, moe>3000)
filter(pa_income, estimate<50000)
select(pa_income, NAME, estimate, moe)

