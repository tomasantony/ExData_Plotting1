##Reading the entire CSV file into R

dataFile <- "household_power_consumption.txt"
data_household_power_consumption <- read.table(dataFile, header=TRUE, sep=';', na.strings='?', nrows=2075259, check.names=FALSE,stringsAsFactors=FALSE)

##Subsetting the data for 2007-02-01 and 2007-02-02

subSet <- data_household_power_consumption[data_household_power_consumption$Date %in% c("1/2/2007", "2/2/2007") ,]
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSet$Global_active_power)
globalReactivePower <- as.numeric(subSet$Global_reactive_power)
voltage <- as.numeric(subSet$Voltage)

subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)


##Creating the Plot4 and saving it as a PNG file of size 480x480

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

##Plotting Global Active Power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##Plotting Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Plotting Energy sub metering
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

##Specifying the line colors and legend
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

##Plotting Global Reactive Power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
