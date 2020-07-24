library(tidyverse)
library(ggplot2)
library(lubridate)

data <- read_csv("fatal-police-shootings-data.csv")
data <- data %>% 
    select(-id)
str(data)

data %>% 
    group_by(month_year=floor_date(date, "month")) %>% 
    tally() %>% 
    ggplot(aes(x = month_year, y = n)) +
    geom_line()
