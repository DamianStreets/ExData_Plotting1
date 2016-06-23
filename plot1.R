
##Source file
myfile <- file("household_power_consumption.txt")

##Load data
PowerData <-read.table(myfile,header=TRUE, sep=';',na.strings='?')

## Filter data to two dates
PowerData <- PowerData[PowerData$Date=='1/2/2007' | PowerData$Date=='2/2/2007',] 

## Create a datetime column
PowerData$DateTime <- dmy(PowerData$Date) + hms(PowerData$Time)

## Open the file device
png(filename='plot1.png',width=480,height=480,units='px')

## Create histogram
hist(PowerData$Global_active_power,main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## Close file device

x<-dev.off()