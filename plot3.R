# load data set
file <- read.table("./Data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
ds <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")
rm(file)

# set datetime
ds$DateTime <- strptime(paste(ds$Date, ds$Time), 
                        format = "%d/%m/%Y %H:%M:%S")

# plot 
plot(ds$DateTime, ds$Sub_metering_1,
     type = 'l',
     xlab = '',
     ylab = "Energy sub metering")
points(ds$DateTime, ds$Sub_metering_2,
       type = "l",
       col = "red")
points(ds$DateTime, ds$Sub_metering_3,
       type = 'l',
       col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = c(2,2,2))

# save png
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()