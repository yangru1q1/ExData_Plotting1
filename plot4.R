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
par(mfrow = c(2, 2))
with(ds,{
  # top left
  plot(DateTime, Global_active_power, 
       type = "l",
       xlab = "",
       ylab = "Global Active Power")
  
  # top right
  plot(DateTime, Voltage, 
       type = "l",
       xlab = "datetime")
  
  # bottom left
  plot(DateTime, Sub_metering_1,
       type = 'l',
       xlab = '',
       ylab = "Energy sub metering")
  points(DateTime, Sub_metering_2,
         type = "l",
         col = "red")
  points(DateTime, Sub_metering_3,
         type = 'l',
         col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lwd = c(1,1,1),
         bty = "n",
         xjust = 1,
         cex = 0.7)
  
  # bottom right 
  plot(DateTime, Global_reactive_power,
       type = 'l',
       xlab = "datetime")
})

# save png
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()