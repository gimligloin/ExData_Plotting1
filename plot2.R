library(dplyr)
library(ggplot2)
susetwd = "D:/temp/exdata_data_household_power_consumption"
household <- read.table("D:/temp/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings = '?')
#code date as.date
household$DateTime <- as.POSIXct(strptime( paste(household$Date,household$Time), format = "%d/%m/%Y %H:%M:%S", 'GMT'))
household$asDate <- as.Date(household$Date, format="%d/%m/%Y")
subhouse <-filter (household, household$asDate>=as.Date('2007-02-01')&household$asDate<=as.Date('2007-02-02'))
qplot(DateTime, Global_active_power, data=subhouse, geom=c("line"))+ylab("Global active power (kilowatts)")+scale_x_datetime(date_breaks = '1 day', date_labels = "%a")+xlab('')
dev.copy(png, 'plot2.png')
dev.off()
