##Reading the entire CSV file into R

dataFile <- "household_power_consumption.txt"
data_household_power_consumption <- read.table(dataFile, header=TRUE, sep=';', na.strings='?', nrows=2075259, check.names=FALSE,stringsAsFactors=FALSE)

##Subsetting the data for 2007-02-01 and 2007-02-02

subSet <- data_household_power_consumption[data_household_power_consumption$Date %in% c("1/2/2007", "2/2/2007") ,]
globalActivePower <- as.numeric(subSet$Global_active_power)
datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Creating the Plot2 and saving it as a PNG file of size 480x480


png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()



