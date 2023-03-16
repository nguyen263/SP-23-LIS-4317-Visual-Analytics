library(DAAG)
data(greatLakes)
data <- greatLakes
colnames(data)
library(stringr)
colnames(data) <- str_to_title(colnames(data))
colnames(data) <- paste("Lake", colnames(data))
colnames(data)[4] <- "Lake St. Clair"
colnames(data)[2] <- "Lake Michigan-Huron"
data <- data.frame(Year = c(1918:2009), data)
library(reshape2)
melted <- melt(data, id = "Year")
head(melted)
rownames(melted)[which(melted$variable == "Lake.Ontario",)]
melted2 <- melted[-c(185:276),]
melted3 <- melted[c(185:276),]
library(ggplot2)
a <- ggplot(melted2, aes(Year, value, color = variable)) + geom_line() + ylab("Average Depth (m)") + geom_smooth(method = "lm", size = .5, linetype = "dashed") + annotate("text", x = 2000, y = 177.5, label = "dashed line = lm")
b <- ggplot(melted3, aes(Year, value, color = variable)) + geom_line() + ylab("Average Depth (m)") + scale_color_manual(values = "purple") + geom_smooth(method = "lm", size = .5, linetype = "dashed")
library(patchwork)
a + theme(legend.position = "bottom", legend.key.size = unit(.7, 'cm')) +
  guides(color = guide_legend(nrow = 2, byrow = T)) +
  b + theme(legend.position = "bottom", legend.key.size = unit(.7, 'cm')) +
  plot_annotation("Average Depth of Lakes", theme = theme(plot.title = element_text(hjust = 0.5)))
