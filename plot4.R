library(dplyr)
library(ggplot2)
library(gridExtra)
susetwd = "D:/temp/exdata_data_household_power_consumption"
household <- read.table("D:/temp/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings = '?')
#code date as.date
household$DateTime <- as.POSIXct(strptime( paste(household$Date,household$Time), format = "%d/%m/%Y %H:%M:%S", 'GMT'))
household$asDate <- as.Date(household$Date, format="%d/%m/%Y")
subhouse <-filter (household, household$asDate>=as.Date('2007-02-01')&household$asDate<=as.Date('2007-02-02'))



#make graphs
p1 <-g + geom_line(aes(y=Global_active_power))+
  ylab("Global active power (kilowatts)")+
  scale_x_datetime(date_breaks = '1 day', date_labels = "%a")

p2 <-g + geom_line(aes(y=Voltage))+
  scale_x_datetime(date_breaks = '1 day', date_labels = "%a")

p3<-ggplot(subhouse, aes(DateTime))+
  geom_line(aes(y=Sub_metering_1, color="Sub_metering_1"))+
  geom_line(aes(y=Sub_metering_2, color="Sub_metering_2"))+
  geom_line(aes(y=Sub_metering_3, color="Sub_metering_3"))+
  ylab("Energy sub metering")+scale_x_datetime(date_breaks = '1 day', date_labels = "%a")+xlab('')+
  theme(legend.position = c(0.9,0.85))

p4 <-g + geom_line(aes(y=Global_reactive_power))+
  scale_x_datetime(date_breaks = '1 day', date_labels = "%a")

#combine graphs
grid.arrange(p1,p2,p3,p4, ncol=2, nrow=2)

#print to png
dev.copy(png,"plot4.png")
dev.off()