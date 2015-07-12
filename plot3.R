##Reading the entire CSV file into R

dataFile <- "household_power_consumption.txt"
data_household_power_consumption <- read.table(dataFile, header=TRUE, sep=';', na.strings='?', nrows=2075259, check.names=FALSE,stringsAsFactors=FALSE)

##Subsetting the data for 2007-02-01 and 2007-02-02

subSet <- data_household_power_consumption[data_household_power_consumption$Date %in% c("1/2/2007", "2/2/2007") ,]
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)

##Creating the Plot3 and saving it as a PNG file of size 480x480

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

##Specifying the line colors and legend

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
