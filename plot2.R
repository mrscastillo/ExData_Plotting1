#read txt
path <- "C:/Users/mrsca/OneDrive - Deadlock Solutions, SRL/Entrenamientos/Coursera/Exploratory Data Analysis/Data/household_power_consumption.txt"
household <- read.csv(path, sep=";",header = TRUE )

library(lubridate)

householdfeb<- household[dmy(household$Date)>= dmy("01-02-2007") & dmy(household$Date)<= dmy("02-02-2007"), ] 
householdfeb<- householdfeb[!is.na(householdfeb$Date), ] 
rm(household) 


par(mar = c(5, 4, 4, 2), oma = c(0,0,0,0)) 

plot(as.numeric(householdfeb$Global_active_power)~dmy(householdfeb$Date), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()

