infile="household_power_consumption.txt"
outfile="plot3.png"
power<-read.table(infile,sep=";",colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
p<-power[as.Date(power$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(power$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]
p$Date<-as.Date(p$Date,format="%d/%m/%Y")
png(filename=outfile,width = 480, height = 480, units = "px")
Sys.setlocale(category="LC_ALL", locale="English") ## set locale to English to have english day names in plot
plot(with(p,strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S")),c(p$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering",col="black")
lines(with(p,strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S")),c(p$Sub_metering_2),type="l",xlab="",ylab="",col="red")
lines(with(p,strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S")),c(p$Sub_metering_3),type="l",xlab="",ylab="",col="blue")
legend("topright",legend=paste(rep("Sub_metering_",3),1:3,sep=""),col=c("black","red","blue"),lty="solid")
dev.off() 
  