##COURSE PROJECT 1 - EXPLORATORY DATA ANALYSIS
## DANIEL ARBOLEDA
## PLOT 2

unzip("exdata_data_household_power_consumption.zip")
elpwcons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       stringsAsFactors = FALSE, dec = ".", na.strings = "?",
                       check.names = FALSE, comment.char = "", quote = '\"')
elpwcons$Date <- as.Date(elpwcons$Date, format = "%d/%m/%Y")
elpwcons$DT <- paste(elpwcons$Date, elpwcons$Time)
elpwcons$DT <- strptime(elpwcons$DT, format = "%Y-%m-%d %H:%M:%S")
#str(elpwcons$DT)
elpwcons2 <- subset(elpwcons, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot2.png", height = 480, width = 480)
plot(elpwcons2$DT, elpwcons2$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "line")
dev.off()