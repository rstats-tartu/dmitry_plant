
# Load libraries
require(readxl)
require(dplyr)
require(tidyr)
require(ggplot2)
require(lubridate)

# Import data
fc <- read_xlsx("data/Fc_Plant.xlsx") %>% 
  separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
ir <- read_xlsx("data/Ir_Plant.xlsx") %>% 
  separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
drgb <- read_xlsx("data/Rgb_Morpho_Plant.xlsx") %>% 
  separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
sc <- read_xlsx("data/ScalesMeasure.xlsx") %>% 
  separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
irb <- read_xlsx("data/Ir_Plant_before.xlsx") %>% 
  separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")

fc$date = as.character(fc$date)
ir$date = as.character(ir$date)
irb$date = as.character(irb$date)
drgb$date = as.character(drgb$date)
sc$date = as.character(sc$date)

fc = separate(fc, date, c("day", "hours"), sep = " ") %>% select(-hours, -time)
fc$day = ymd(fc$day)

ir = separate(ir, date, c("day", "hours"), sep = " ") %>% select(-hours, -time)
ir$day = ymd(ir$day)

irb = separate(irb, date, c("day", "hours"), sep = " ") %>% select(-hours, -time)
irb$day = ymd(irb$day)

drgb = separate(drgb, date, c("day", "hours"), sep = " ") %>% select(-hours, -time)
drgb$day = ymd(drgb$day)

sc$date = ymd(sc$date)
sc$day = sc$date
sc = select(sc, -date, -time)

# Plots

fc %>%
  filter(day > "2018-08-04") %>%
  ggplot(aes(day, QY_max, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

fc %>%
  filter(day > "2018-08-04") %>%
  ggplot(aes(day, QY_Lss, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

fc %>%
  filter(day > "2018-08-04") %>%
  ggplot(aes(day, NPQ_Lss, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

fc %>%
  filter(day > "2018-08-04") %>%
  ggplot(aes(day, Rfd_Lss, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

ir %>%
  filter(day != "2018-08-06") %>%
  ggplot(aes(day, `Temp-avg`, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

irb %>%
  filter(day != "2018-08-06") %>%
  ggplot(aes(day, `Temp-avg`, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

drgb %>%
  ggplot(aes(day, AREA_MM, color = genotype)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_se, geom = "pointrange") +
  facet_grid(water ~ light)

sc %>%
  filter(genotype != "empty") %>%
  ggplot(aes(day, weight, color = plant_id)) +
  geom_line() +
  facet_grid(water ~ light) +
  guides(color = FALSE)


