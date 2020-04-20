##COURSE PROJECT 1 - EXPLORATORY DATA ANALYSIS
## DANIEL ARBOLEDA
## PLOT 4

unzip("exdata_data_household_power_consumption.zip")
elpwcons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       stringsAsFactors = FALSE, dec = ".", na.strings = "?",
                       check.names = FALSE, comment.char = "", quote = '\"')
elpwcons$Date <- as.Date(elpwcons$Date, format = "%d/%m/%Y")
elpwcons$DT <- paste(elpwcons$Date, elpwcons$Time)
elpwcons$DT <- strptime(elpwcons$DT, format = "%Y-%m-%d %H:%M:%S")
#head(elpwcons)
#str(elpwcons$DT)
elpwcons2 <- subset(elpwcons, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
plot(elpwcons2$DT, elpwcons2$Global_active_power, ylab = "Global Active Power", 
     xlab = "", type = "line")
plot(elpwcons2$DT, elpwcons2$Voltage, ylab = "Voltage", xlab = "datetime", type = "line")
plot(elpwcons2$DT, elpwcons2$Sub_metering_1, ylab = "Energy sub metering", xlab = "",
     col = "black", type = "line")
lines(elpwcons2$DT, elpwcons2$Sub_metering_2, col = "red")
lines(elpwcons2$DT, elpwcons2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(3,3), col = c("black", "red", "blue"), bty = "n", cex = 0.9)
plot(elpwcons2$DT, elpwcons2$Global_reactive_power, ylab = "Global_reactive_power",
    xlab = "datetime", type = "line")
dev.off()