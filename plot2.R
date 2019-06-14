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
plot(ds$DateTime, ds$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# save png
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()