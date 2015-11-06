temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = temp, method = "curl")
plotdata <- read.csv(unz(temp, "household_power_consumption.txt"),header = F, skip=66637, nrows=2880, sep = ";" )
unlink(temp)
png(filename = "plot1.png")
with(plotdata, hist(plotdata$V3, main= "Global Active Power", xlab= 'Global Active Power (kilowatts)', col= 'red'))
dev.off()

