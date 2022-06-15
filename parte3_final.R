### REBECA VEGA ESCAMILLA ###

#3. (10)  A partir de la red booleana cargada en BoolNet llamada cellcycle escribe
#un programa en R que;

library(BoolNet)
data("cellcycle")
cellcycle
cc<-cellcycle
plotNetworkWiring(cc)
 # cargo mi red, la hago un objeto y la visualizo
 
#1. Encuentre los atractores

 getAttractors(cc)
 # tenemos dos atractores:1 y 7 estados respectivamente
 
#2. Discuta el significado de los atractores
 # tenemos dos atractores:1 y 7 estados respectivamente, se estan activando y 
 # apagando constantemente lo que sugiere que el ciclo celular se estará dando
 # dependiendo de la situación en la que suceda y que proteínas, factores de 
 # transcripción estén interviniendo
 
#3. Describe  verbalmente al menos un par de reglas, (¡distintas a las que están
#en la ayuda-manual!) 
 
 # Para que CycE se exprese, debe estar E2F y no estar Rb
 # Para que CycB se exprese, no debe estar  Cdc20 ni Cdh1
 # Para que Cdc20 se exprese, debe estar CycB
 
 #4.Selecciona distintos condiciones iniciales y determina a qué atractor se van
