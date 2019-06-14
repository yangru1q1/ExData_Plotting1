# download the dataset
# ignore when have the household_power_consumption.txt under ./Data folder
if(!file.exists("Data")){dir.create("./Data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./Data/household_power_consumption.txt")){
  download.file(url, "./Data/assignment.zip", method = "curl")
  unzip("./Data/assignment.zip", exdir ="./Data")
}


# load the dataset

file <- read.table("./Data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
ds <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")
rm(file)


# plot 1
hist(ds$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# save png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()