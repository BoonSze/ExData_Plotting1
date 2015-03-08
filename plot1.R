# Read the file
household <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)))

# Subset out only 2007-02-01 and 2007-02-02
x <- household[grep("^[12]/2/2007", household$Date),]

# Construct the plot
png(filename="plot1.png", width=480, height=480)
hist(x$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()