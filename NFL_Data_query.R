install.packages("tidyverse")
install.packages("ggrepel")
install.packages("ggimage")

#needed to install `nflfastR`
install.packages("devtools")
devtools::install_github("mrcaseb/nflfastR")
install.packages('nflfastR')
library(tidyverse)
library(ggrepel)
library(ggimage)
library(nflfastR)

## Sets default scientific notation
options(scipen = 9999)

data <- readRDS(url('https://raw.githubusercontent.com/guga31bb/nflfastR-data/master/data/play_by_play_2019.rds'))

dim(data)

col_names <- colnames(data)
write.csv(col_names,"NFL_Column_Names.csv", row.names = FALSE)
head(data, 10)

data$game_date <- as.Date(data$game_date, format = '%Y-%m-%d')
max(data$game_date)
min(data$game_date)

season_2019 <- data

# define which seasons shall be loaded
seasons <- 2018:2020
pbp <- nflfastR::load_pbp(seasons)
sum(is.na(data$wind))