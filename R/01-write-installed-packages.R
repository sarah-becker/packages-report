## deja vu from earlier!
library(tidyverse)
library(dplyr)
library(here)
library(fs)
## create a data frame of your installed packages
## hint: installed.packages() is the function you need
packages <- installed.packages() %>% as.tibble()

View(packages)
nrow(packages)

## optional: select just some of the variables, such as
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built

## write this data frame to data/installed-packages.csv
## hint: readr::write_csv() or write.table()
## idea: try using here::here() to create the file path
write.csv(packages, file = "data/installed-packages.csv")

#here::here("data", "installed-packages.csv") #not working yet

## YES overwrite the file that is there now (or delete it first)
## that's a old result from me (Jenny)
## it an example of what yours should look like and where it should go
