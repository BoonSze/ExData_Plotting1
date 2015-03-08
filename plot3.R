# Read the file
household <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)))

# Subset out only 2007-02-01 and 2007-02-02
x <- household[grep("^[12]/2/2007", household$Date),]

# Convert the date and time
x <- cbind(x, paste(x$Date, x$Time))
colnames(x)[10] <- "datetime"
x$datetime <- strptime(x$datetime, format="%d/%m/%Y %H:%M:%S")

# Construct the plot
png(filename="plot3.png", width=480, height=480)
with(x, plot(x$datetime, x$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(x, points(x$datetime, x$Sub_metering_2, type="l", col="red"))
with(x, points(x$datetime, x$Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()