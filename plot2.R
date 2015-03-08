# Read the file
household <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)))

# Subset out only 2007-02-01 and 2007-02-02
x <- household[grep("^[12]/2/2007", household$Date),]

# Convert the date and time
x <- cbind(x, paste(x$Date, x$Time))
colnames(x)[10] <- "datetime"
x$datetime <- strptime(x$datetime, format="%d/%m/%Y %H:%M:%S")

# Construct the plot
png(filename="plot2.png", width=480, height=480)
with(x, plot(x$datetime, x$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))
dev.off()