library(gapminder)
library(tidyverse)
library(ggplot2)

gapminder <- gapminder
gap_years  <- gapminder %>% 
  group_by (year) %>% 
  nest ()

evek <- unique(gapminder$year)
files <- str_c("gapminder", evek)
map2(gap_years[[2]], files, write_csv)

cor(log(gapminder$gdpPercap), gapminder$lifeExp)
