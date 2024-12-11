CuiData <- read.csv("question-5-data/Cui_etal2014.csv")

nrow(CuiData)
ncol(CuiData)

log_VirionVol <- log(CuiData$Virion.volume..nm.nm.nm.)
log_GenomeLen <- log(CuiData$Genome.length..kb)


LinModel <- lm(log_VirionVol ~ log_GenomeLen)
summary(LinModel)
exp(7.0748) #alpha


ggplot(data = CuiData, aes(log_GenomeLen, log_VirionVol)) +
  geom_point() +  
  geom_smooth(method = "lm", se = TRUE, colour = "blue")+
  labs(x = "log[Genome length(kb)]", y = "log[Virion volume(nm3)]") +
  theme_bw() + 
  theme(
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  ) 


