library(GGally)
library(network)
library(sna)
library(igraph)
net = rgraph(10, mode = "graph", tprob = 0.5)
net
net = network(net, directed = F)
net
network.vertex.names(net) = letters[1:10]
ggnet2(net)
ggnet2(net, node.size = 6, node.color = "black", edge.size = 1, edge.color = "grey")

net2 <- rgraph(7, mode = "graph", tprob = 0.75)
net2 <- network(net2, directed = F)
network.vertex.names(net2) <- letters[1:7]
ggnet2(net2, node.size = 3, node.color = "white", edge.size = .5, edge.color = "red", label = T, label.color = "black")



data <- read.table(file.choose(), header = T, sep = ",")
edges <- data.frame(from = c("Raul", "Booker", "Lauri", "Leonie", "Lauri", "Raphael", "Deloris",
                             "Milo", "Ernestina", "Eboni", "Deloris", "Fallon", "Shemika", "Alecia",
                             "Milo", "Aiko", "Aiko", "Corina", "Randee", "Alecia", "Booker", "Milo"),
                    to = c("Deloris", "Shemika", "Aiko", "Milo", "Milo", "Booker", "Fallon",
                           "Mikaela", "Corina", "Raul", "Petronila", "Ernestina", "Delfina", "Leonie",
                           "Leonie", "Sherlyn", "Tiffaney", "Eboni", "Raphael", "Randee", "Raul", "Booker"))
y <- graph.data.frame(edges, directed = T, vertices = data)
y
colors <- ifelse(data$Sex == "Male", "skyblue", "pink")
par(mar = c(0, 0, 0, 0)); plot(y, vertex.color = colors,
                               vertex.label.color = "black",
                               vertex.label.cex = .6,
                               edge.color = "grey", vertex.size = data$Age,
                               edge.size = 1, edge.arrow.size = .3)
legend("topright", title = "Sex", legend = c("Male", "Female"), col = c("skyblue", "pink"), lty = 1, cex = .7)

