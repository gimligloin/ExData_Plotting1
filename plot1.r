library(dplyr)
library(ggplot2)
susetwd = "D:/temp/exdata_data_household_power_consumption"
household <- read.table("D:/temp/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings = '?')
#code date as.date
household$asDate <- as.Date(household$Date, format="%d/%m/%Y")
subhouse <-filter (household, household$asDate>=as.Date('2007-02-01')&household$asDate<=as.Date('2007-02-02'))
#plot
qplot(x=Global_active_power, data=subhouse, binwidth=.41, )  +ggtitle("Global Active Power") +xlab('Global Active Power (kilowatts)') + ylab('Frequency')
dev.copy(png, "plot1.png")
dev.off()