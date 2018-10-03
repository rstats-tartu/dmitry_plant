#change working directory
setwd("C:/Users/dmitry/Desktop/Documents/project_HT1 mutant phenotyping/____Experiments/exp 1 Aug 2018/Data from from Mirko")

#Load libraries
require(readxl)
require(dplyr)
require(tidyr)
require(ggplot2)
require(lubridate)

#import data
fc_org = read_xlsx("Fc_Plant.xlsx") %>% separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
ir_org = read_xlsx("Ir_Plant.xlsx") %>% separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
drgb_org = read_xlsx("Rgb_Morpho_Plant.xlsx") %>% separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
sc_org = read_xlsx("ScalesMeasure.xlsx") %>% separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")
irb_org= read_xlsx("Ir_Plant_before.xlsx") %>% separate(plant_name, c("co2", "temp", "water", "light"), sep = "_")

#genotype selection
fc <- fc_org[which(fc_org$genotype=="Col-0" |fc_org$genotype=="MES5"|fc_org$genotype=="MES7"),]
ir <- ir_org[which(ir_org$genotype=="Col-0" |ir_org$genotype=="MES5"|ir_org$genotype=="MES7"),]
drgb <- drgb_org[which(drgb_org$genotype=="Col-0" |drgb_org$genotype=="MES5"|drgb_org$genotype=="MES7"),]
sc <- sc_org[which(sc_org$genotype=="Col-0" |sc_org$genotype=="MES5"|sc_org$genotype=="MES7"),]
irb <- irb_org[which(irb_org$genotype=="Col-0" |irb_org$genotype=="MES5"|irb_org$genotype=="MES7"),]


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
sc = select(sc, -date, - time)


cols <- c("Col-0" = "#111111", "MES5" = "#777777", "MES7" = "#999999")

#plots

drgb %>%
  ggplot(aes(day, AREA_MM, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, PERIMETER_MM, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, AREA_MM, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, COMPACTNESS, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, ROUNDNESS, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, ROUNDNESS2, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, ISOTROPY, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, ECCENTRICITY, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, RMS, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)

drgb %>%
  ggplot(aes(day, SOL, color = genotype))+
  stat_summary(fun.y = mean, geom = "line")+
  stat_summary(fun.data = mean_se, geom = "pointrange")+
  facet_grid(water ~ light)+
  theme_bw()+
  scale_colour_manual(values = cols)
