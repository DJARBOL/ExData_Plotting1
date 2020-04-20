##COURSE PROJECT 1 - EXPLORATORY DATA ANALYSIS
## DANIEL ARBOLEDA
## PLOT 1

unzip("exdata_data_household_power_consumption.zip")
elpwcons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       stringsAsFactors = FALSE, dec = ".", na.strings = "?",
                       check.names = FALSE, comment.char = "", quote = '\"')
elpwcons$Date <- as.Date(elpwcons$Date, format = "%d/%m/%Y")
elpwcons2 <- subset(elpwcons, Date >= "2007-02-01" & Date <= "2007-02-02")
#elpwcons2$Global_active_power <- as.numeric(elpwcons2$Global_active_power) NOT NEEDED
png("plot1.png", height = 480, width = 480)
hist(elpwcons2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
#IN CASE AXES GO WRONG USE THE FOLLOWING:
#option , axes = FALSE
#xticks <- seq(0, 6, 2)
#yticks <- seq(0, 1200, 200)
#axis(1, at = xticks, labels = xticks) ; axis(2, at = yticks, labels = yticks)

