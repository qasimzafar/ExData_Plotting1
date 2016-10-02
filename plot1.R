powerConsumption <- read.csv("household_power_consumption.txt", header = TRUE,na.strings = "?", sep=";")

a <- powerConsumption[powerConsumption[,"Date"] == "1/2/2007", ]
b <- powerConsumption[powerConsumption[,"Date"] == "2/2/2007", ]
c <- merge.data.frame(a,b, all=TRUE)

png("Plot1.png")
with(c, hist(x=Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)"))
dev.off()