library(tidyverse)
data <- read.csv("Salt assay data.csv")

data <- data %>% 
  mutate(line = str_replace(line, "12", "twelve"))

data <- data %>% 
  mutate(line = str_replace(line, "2", "Control"))

data <- data %>% 
  mutate(line = str_replace(line, "7", "ASEL-AIB"))

data <- data %>% 
  slice(-90)

ggplot(data, aes(x = line, y = preference_index, fill = conditioning))+
  geom_histogram()+
  scale_x_discrete()
