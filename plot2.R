temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = temp, method = "curl")
plotdata <- read.csv(unz(temp, "household_power_consumption.txt"),header = F, skip=66637, nrows=2880, sep = ";" )
unlink(temp)
plotdata$datetime <- with(plotdata, as.POSIXct(paste(V1, V2), format = "%d/%m/%Y %H:%M:%S"))
png(file = "plot2.png")
with(plotdata, plot(V3 ~ datetime, type = 'l', ylab="Global Active Power(kilowatts)", xlab=""))
dev.off()