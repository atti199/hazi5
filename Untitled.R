library(gapminder)
library(tidyverse)
library(ggplot2)
# git add .
# git commit -m "init"
# git push

# 1. feladat --------------------------------------------------------------


gapminder <- gapminder
gap_years  <- gapminder %>% 
  group_by (year) %>% 
  nest ()

evek <- unique(gapminder$year)
files <- str_c("gapminder", evek)
map2(gap_years[[2]], files, write_csv)

gap_years$korrelacio <- cor(log(gap_years[[2]]$gdpPercap), gap_years[[2]]$lifeExp)

for (i in 1:12) {
  gap_years[["korrelacio"]][i] <-cor(log(gap_years[[2]][[i]]["gdpPercap"]), gap_years[[2]][[i]]["lifeExp"])
}


# 2.feladat ---------------------------------------------------------------


