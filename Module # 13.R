library(datasets)
library(stringr)
library(animation)
library(ggplot2)
data <- Orange
colnames(data) <- str_to_title(colnames(data))
saveGIF({
  for (i in 1:35)
    {
    ani.options(interval = .2)
    g <- data[1:i,]
    print(ggplot(g, aes(Age, Circumference, group = factor(Tree), color = Tree)) +
            geom_line() + geom_point() + labs(title = "Growth of Orange Trees", x = "Days Old", y = "Circumference (in mm)"))
    }
})