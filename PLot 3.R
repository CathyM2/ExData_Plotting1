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

SubsetDF<- SubsetDF %>%
  select(datetime, Sub_metering_1, Sub_metering_3,Sub_metering_2) %>%
  gather(key = "Sub_Metering", value = "value", -datetime)

Plot3<-ggplot(SubsetDF, aes( x = datetime ))+
  geom_line(aes(y=value,col=Sub_Metering))+
 # scale_color_manual(values=c(Sub_metering_1 = 'red', Sub_metering_2='blue', Sub_metering_3='green'), 
  #                   labels = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))+
              ylab('Energy Sub_Metering')+
              xlab('Date')+
              scale_x_datetime(labels = date_format("%A"), date_breaks = '1 day')
            
plot(Plot3)        
png("Plot3.png",width = 480,height = 480)
plot(Plot3)
            
            
            # Close device
            dev.off()
            