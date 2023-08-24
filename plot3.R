#read txt
path <- "C:/Users/mrsca/OneDrive - Deadlock Solutions, SRL/Entrenamientos/Coursera/Exploratory Data Analysis/Data/household_power_consumption.txt"
household <- read.csv(path, sep=";",header = TRUE )

library(lubridate)

householdfeb<- household[dmy(household$Date)>= dmy("01-02-2007") & dmy(household$Date)<= dmy("02-02-2007"), ] 
householdfeb<- householdfeb[!is.na(householdfeb$Date), ] 
rm(household) 

plot(as.numeric(householdfeb$Global_active_power)~dmy(householdfeb$Date), type = "n", xlab = "", ylab = "Energy Sub metering")
par(mar = c(5, 4, 4, 2), oma = c(0,0,0,0)) 


points(as.numeric(householdfeb$Sub_metering_1)~dmy(householdfeb$Date), col="black", type = "l")
points(as.numeric(householdfeb$Sub_metering_2)~dmy(householdfeb$Date), col="red", type = "l")
points(as.numeric(householdfeb$Sub_metering_3)~dmy(householdfeb$Date), col="blue", type = "l")

legend("topright", col=c("black", "blue","red"), lty=1,legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")) #pch, col, and legend

dev.copy(png, file = "plot3.png")

dev.off()

