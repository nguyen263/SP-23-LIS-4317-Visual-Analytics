# Set the working directory
setwd("/Users/loannguyen/Documents/R files/LIS 4317 Visual Analytics")
# Assign imported data to "data"
data <- read.csv("rainfall in india 1901-2015.csv")
# Remove a few columns
data <- data[, -c(1, 4:15, 17:ncol(data))]
# Activate the stringr package
library(stringr)
# Uppercase first letters of column names
colnames(data) <- str_to_title(colnames(data))
# See the names of Indian regions
data$Subdivision
# Use the plyr package to view regions in one observation instead of "data$Subdivision" previously
# because I don't want the names repeated. Hope you understand.
plyr::count(data$Subdivision)
library(dplyr)
# Randomly select the two regions and filter rows containing it
df <- data[data$Subdivision %in% c("SUB HIMALAYAN WEST BENGAL & SIKKIM", "VIDARBHA"),]
df[1:nrow(df), 1] <- str_to_title(c("SUB HIMALAYAN WEST BENGAL & SIKKIM", "VIDARBHA"))
# Reset the row numbers
rownames(df) <- NULL
library(ggplot2)
library(ggthemes)
library(ggExtra)
# Create a line graph using the Tufte theme
p <- ggplot(df, aes(x = Year, Annual, color = Subdivision)) + geom_point() + theme_tufte() + geom_line() +
  labs(title = "Changes in Precipitation over Time in Two Indian Regions, Sub-Himalayan West Bengal & Sikkim and Vidarbha", y = "Total Amount of Rainfall") +
  theme(plot.margin = margin(1, 1, 1, 1)) +
  theme(text = element_text(size = 10, family = "Times New Roman"), plot.title = element_text(hjust = 0.5))
# Add the histogram to the plot
ggMarginal(p, type = "histogram", size = 15, margins = "y", groupFill = T)