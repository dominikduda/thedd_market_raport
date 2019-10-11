source("R/load_packages.R")
source("R/raport_core.R")

files <- list.files(path = "time_series_files/", pattern = "*.csv", full.names = TRUE, recursive = FALSE)
files %>% lapply(generateRaport)
