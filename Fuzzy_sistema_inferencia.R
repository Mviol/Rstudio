rm(list=ls())
library (FuzzyR)
install.packages("trimf")
#Variável Lingusticas

sistema1 <- newfis("tipper")

sistema1<- addvar(sistema1, "input", "Fluxo de Caixa", c(0,11))
sistema1<- addvar(sistema1, "input", "Debito Dinamico", c(0,11))
sistema1<- addvar(sistema1, "output", "Autofinanciamento", c(-3,3))

#variável FLUXO_CAIXA:

sistema1<- addmf(sistema1, "input", 1, "Pobre", "trapmf",c(0,0,5))
sistema1<- addmf(sistema1, "input", 1, "Medio", "trapmf", c(2,5,7,10))
sistema1<- addmf(sistema1, "input", 1, "Bom", "trapmf", c(7,10,11,11))

#Variavel debito dinamico
sistema1<- addmf(sistema1, "input", 2, "bom", "trapmf", c(0,0,2,5))
sistema1<- addmf(sistema1, "input", 2, "Medio", "trapmf",c(2,5,7,10))
sistema1<- addmf(sistema1, "input", 2, "pobre", "trapmf", c(7,10,11,11))

#variável autofinanciamento
  
sistema1<- addmf(sistema1, "output", 1, "Pobre-", "trimf", c(-4,-3,-2))
sistema1<- addmf(sistema1, "output", 1, "pobre", "trimf",c(-3,-2,-1))
sistema1<- addmf(sistema1, "output", 1, "medio-", "trimf", c(-2,-1,0))
sistema1<- addmf(sistema1, "output", 1, "medio", "trimf", c(-1,0,1))
sistema1<- addmf(sistema1, "output", 1, "medio+", "trimf",c(0,1,2))
sistema1<- addmf(sistema1, "output", 1, "Bom", "trimf", c(1,2,3))
sistema1<- addmf(sistema1, "output", 1, "Bom+", "trimf", c(2,3,4))

plotmf(sistema1, "input", 1)
plotmf(sistema1, "input", 2)
plotmf(sistema1, "output", 1)

#lista de regras

rulelist <- rbind(c (1,3,1,1,1),
                 c (1,2,2,1,1),
                 c (1,3,3,1,1),
                 c (3,2,1,1,1),
                 c (2,3,2,1,1),
                 c (2,3,4,1,1),
                 c (3,3,4,1,1),
                 c (3,2,6,1,1),
                 c (3,2,7,1,1))
                  
#Grafico da superifie de regras

sistema1 <- addrule(sistema1,rulelist)  

par(mfrow=c(1,1))
gensurf(sistema1)
showGUI(sistema1)                  
