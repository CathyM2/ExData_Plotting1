##### Cathy M 19/12/22 #####

#### Load Libraries
library('dplyr')
library(ggplot2)
library(tidyr)
#### Read in Data  

df<- read.table('household_power_consumption.txt', sep=';',header = T,na.strings = '?')

df$datetime<- paste(df$Date,df$Time)
df$datetime<- as.POSIXct(df$datetime,format = "%d/%m/%Y %H:%M:%S", tz = "")
SubsetDF<- subset(df, substr(datetime,1,10)%in% c('2007-02-01','2007-02-02'))

Plot2<-ggplot(SubsetDF, aes(y=Global_active_power, x = datetime ))+
  geom_line()+
  xlab('Date')+
  ylab('Global Active Power (kilowatts)')+
  ggtitle('Global Active Power')+
  scale_x_datetime(labels = date_format("%A"), date_breaks = '1 day')
                   
                   
png("Plot2.png",width = 480,height = 480)
plot(Plot2)


# Close device
dev.off()
