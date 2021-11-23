setwd("C:/R")
list.files()
library("plyr") 
library("dplyr")                                                

library("readr")  
df <- list.files(path = "/R",    
                 pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read_csv) %>%                                           
  bind_rows                                                      

head(df) 

df = subset(df, select = -c(1) )
View(df)
df2 = df[-c(84),]

missing_a_lot <- as.data.frame(df2[,8], drop=false)

df3 = subset(df2, select = -c(8) )
View(df3)

model <- glm(vore ~ . ,  # Model: Species as a function of other variables
             family = binomial(link = 'logit'), 
             data = df3)  
summary(model)


ggplot(data=complet) +
  +  aes (x=brainwt, y=sleep_total)+
  geom_point( aes(color = vore, shape=vore))
ggplot(complet) +
  aes(x = brain_wt, y = sleep_total) +                 # define space
  geom_point( aes(color = vore, shape = vore) ) +    # add points
  geom_smooth(method =lm) +                                # add trend line  

