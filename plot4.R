
##Source file
myfile <- file("household_power_consumption.txt")

##Load data
PowerData <-read.table(myfile,header=TRUE, sep=';',na.strings='?')

## Filter data to two dates
PowerData <- PowerData[PowerData$Date=='1/2/2007' | PowerData$Date=='2/2/2007',] 

## Create a datetime column
PowerData$DateTime <- dmy(PowerData$Date) + hms(PowerData$Time)

## Open the file device
png(filename='plot4.png',width=480,height=480,units='px')

## Create 4 graphs
par(mfrow=c(2,2))

## Graph1 (top left)
with(PowerData, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power")) 


## Graph2 (top right)
with(PowerData, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")) 


## Graph3 (bottom left)
with(PowerData, plot(DateTime, Sub_metering_1, type="l",main = "Global Active Power", ylab="Energy sub metering", col="black")) 
with(PowerData, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(PowerData, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend('topright',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty='solid')


## Graph4 (bottom right)
with(PowerData, plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")) 


## Close file device
x<-dev.off()