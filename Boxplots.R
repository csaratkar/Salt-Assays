library(tidyverse)
# library(readr)
# class_data <- read_csv("class_data.csv")

a <- 66.5
b <- 33.5
c <- 73
d <- 27
e <- 78
f <- 22
g <- 61
h <- 39

controlnaive <- data.frame(greenLight = c(b, d, f, h), dark = c(a,c, e, g), line = c("Control", "Control", "Control", "Control"),Conditioning =c("Naive", "Naive", "Naive", "Naive"))

controlcond <- data.frame(greenLight = c(a, c, e, g), dark = c(b, d, f, h), line = c("Control", "Control", "Control", "Control"),Conditioning = c("Conditioned","Conditioned", "Conditioned", "Conditioned"))

ASKnaive <- data.frame(greenLight = c(b, d, f, h), dark = c(a,c, e, g),line = c("ASK", "ASK", "ASK", "ASK"), Conditioning =c("Naive", "Naive", "Naive", "Naive"))

ASKcond <- data.frame(greenLight = c(a, c, e, g), dark = c(b,d,f, h), line = c("ASK", "ASK", "ASK", "ASK"), Conditioning = c("Conditioned","Conditioned", "Conditioned", "Conditioned"))

ASJnaive <- data.frame(greenLight = c(90, 80, 100, 70), dark = c(80, 90, 70, 100), line = c("ASJ", "ASJ", "ASJ", "ASJ"), Conditioning =c("Naive", "Naive", "Naive", "Naive"))

ASJcond <- data.frame(greenLight = c(90, 80, 100, 70), dark = c(80, 90, 70, 100), line = c("ASJ", "ASJ", "ASJ", "ASJ"), Conditioning = c("Conditioned","Conditioned", "Conditioned", "Conditioned"))

ASJASKnaive <- data.frame(greenLight = c(90, 80, 100, 70), dark = c(80, 90, 70, 100),line = c("ASJASK", "ASJASK", "ASJASK", "ASJASK"), Conditioning =c("Naive", "Naive", "Naive", "Naive"))

ASJASKcond <- data.frame(greenLight = c(90, 80, 100, 70), dark = c(80, 90, 70, 100),line = c("ASJASK", "ASJASK", "ASJASK", "ASJASK"),Conditioning = c("Conditioned","Conditioned", "Conditioned","Conditioned"))





x <- rbind(controlnaive,controlcond,ASKnaive,ASKcond, ASJnaive, ASJcond, ASJASKnaive,ASJASKcond)

#x <- class_data

x$light_dark <- x$greenLight - x$dark

x$total_count <- x$greenLight + x$dark

x$pref_index <- x$light_dark/x$total_count
# 
# x$highNa_prop <- x$highNa/x$total_count
# 
# x$lowNa_prop <- x$lowNa/x$total_count

# x$line <- c("UVM 7","UVM 7","UVM 7","UVM 7","UVM 7","UVM 7", "Control","Control","Control","Control","Control","Control")
# 
# x$treatment <- c("Conditioned","Conditioned","Conditioned","Naive","Naive","Naive","Conditioned","Conditioned","Conditioned","Naive","Naive","Naive")

x$type <- paste(x$line, x$Conditioning)

x$type <- factor(x$type, levels = c("Control Naive", "Control Conditioned", "ASK Naive", "ASK Conditioned", "ASJ Naive", "ASJ Conditioned", "ASJASK Naive", "ASJASK Conditioned"))

x$line <- factor(x$line, levels = c("Control", "ASK", "ASJ", "ASJASK"))

x$Conditioning <-  factor(x$Conditioning, levels = c("Naive", "Conditioned"))

colors <- c("Conditioned" = "tomato2",
            "Naive" = "slateblue2")

ggplot(x, aes(x = factor(line), y = pref_index, fill = Conditioning))+
  geom_boxplot() +
  scale_fill_manual(values = colors) +
  labs(x = "Line", y = "Preference Index")  +
  ylim(c(-0.6,0.6))+
  scale_x_discrete(labels = c("Control", "Ablated ASK", "Ablated ASJ", "Ablated ASK + ASJ"))+
  theme_bw()
  

  # geom_dotplot(binaxis='y', stackdir='center', dotsize=.75)
# ggplot(x, aes(x = type, y = lowNa_prop, fill = treatment))+
#   geom_boxplot() +
#   scale_fill_manual(values = colors)
