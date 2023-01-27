##### Cathy M 19/12/22 #####

#### Load Libraries
library('dplyr')
library(ggplot2)
#### Read in Data  

df<- read.table('household_power_consumption.txt', sep=';',header = T,na.strings = '?')
df<- subset(df, Date== '1/2/2007' | Date == '2/2/2007')
Plot1<-ggplot(df, aes(x=Global_active_power))+
  geom_histogram(binwidth = 0.5,boundary=0,fill='purple')+
  xlim(c(0,6))+
  theme_bw()+
  xlab('Global Active Power (kilowatts)')+
  ylab('Frequency')+
  ggtitle('Global Active Power')
plot(Plot1)
png("Plot1.png",width = 480,height = 480)
