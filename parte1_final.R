### REBECA VEGA ESCAMILLA ###

#Cada archivo tiene como nombre un identificador numérico que se puede consultaren el
#archivo treeoflife.species.tsv para identificar a la especie correspondiente.
#Selecciona tres redes pequeñas, alrededor de 200 proteínas, y elabora un programa en R que:

library(BoolNet)
library(igraph)

#(a) Lea las redes en R y determine la distribución de conectividades.

red1 <- read.table("treeoflife.interactomes/treeoflife.interactomes/2110.txt", header = FALSE)

red1 <- graph_from_data_frame(red1)
red1

red2<- read.table("treeoflife.interactomes/treeoflife.interactomes/4513.txt", header = FALSE)
red2<-graph_from_data_frame(red2)
red2

red3<- read.table("treeoflife.interactomes/treeoflife.interactomes/30608.txt", header = FALSE)
red3<-graph_from_data_frame(red3)
red3

#Primero cargo mis archivos que elegí y los convierto en un objeto de igraph 
#para así poder hacer la red, lo corro y todo bien.

degree.distribution(red1)
degree.distribution(red2)
degree.distribution(red3)

#Asi se determina la distribución de conectividades

hist ( degree.distribution(red1), 
       main = "Distribución de conectividades red1", xlab = "Degree distribution",
       ylab = "frecuency", col ="green")
# aquí nomás quería ver cómo se veía

#(b) Calcule el promedio de conectividades de cada red.

mean(degree(red1)) #anidamos en la función promedio el degree de la red
mean(degree(red2))
mean(degree(red3))

#(c) Calcule la densidad de cada red.

edge_density(red1)
edge_density(red2)
edge_density(red3)

# elegí esa funcion porque se supone que la densidad es la relacion entre
#las conexiones y las posibles conexiones

#(d) Escribe una función que muestre el n ́umero de componentes de la red cuando
#se desconectan los 10 nodos m ́as conectados. La función de igraph components()
#puede ser  útil.

component_distribution()
#(e) Calcule la robustez de las redes quitando los 10 proteínas ḿas conectada
s.
red1sn <- sort(degree(red1), decreasing = T)[1:10]
red1sn

### YA NO HAY TIEMPO PERO USARIA SUBSET

#(f) Selecciona las 10 proteínas m ́as importantes y determina su función usando
#gene ontology (debido al tamaño de la muestra podría no salirte nada significativo 
#en ese caso pon ese resultado)

### AQUI IGUAL USARIA SUBSET, QUEDA LA LISTA 