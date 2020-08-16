#plot 1
datafile<-"./household_power_consumption.txt"
powerdata<-read.table(datafile,header = TRUE,sep=";", stringsAsFactors = FALSE,d
                      ec = ".")
head(powerdata,1)
subsetdata<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]
GloActPower<-as.numeric(subsetdata$Global_active_power)
png("plot1.png")
hist(GloActPower,col = "red",main = "Global Active Power",xlab = "Global Active 
     Power (kilowatts)")
dev.off()
#plot 2
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GloActPower<-as.numeric(subsetdata$Global_active_power)
png("plot2.png")
plot(datetime,GloActPower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
#plot 3
submetering1<-as.numeric(subsetdata$Sub_metering_1)
submetering2<-as.numeric(subsetdata$Sub_metering_2)
submetering3<-as.numeric(subsetdata$Sub_metering_3)
png("plot3.png")
plot(datetime,submetering1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,submetering2,type = "l",col="red")
lines(datetime,submetering3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col = c("black","red","blue"))
dev.off()
#plot 4
volt<-as.numeric(subsetdata$Voltage)
GloReacPower<-as.numeric(subsetdata$Global_reactive_power)
png("plot4.png")
par(mfrow=c(2,2))
plot(datetime,GloActPower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
plot(datetime,volt,type = "l",xlab = "datetime",ylab = "Voltage")
plot(datetime,submetering1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,submetering2,type = "l",col="red")
lines(datetime,submetering3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col = c("black","red","blue"))
plot(datetime,GloReacPower,type="l",xlab = "datetime",ylab = "Global_Reactive_power")
dev.off()