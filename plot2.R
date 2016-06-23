
##Source file
myfile <- file("household_power_consumption.txt")

##Load data
PowerData <-read.table(myfile,header=TRUE, sep=';',na.strings='?')

## Filter data to two dates
PowerData <- PowerData[PowerData$Date=='1/2/2007' | PowerData$Date=='2/2/2007',] 

## Create a datetime column
PowerData$DateTime <- dmy(PowerData$Date) + hms(PowerData$Time)

## Open the file device
png(filename='plot2.png',width=480,height=480,units='px')

## Create Plot
with(PowerData, plot(DateTime, Global_active_power, type="l",main = "Global Active Power", ylab="Global Active Power (kilowatts)")) 

## Close file device

x<-dev.off()