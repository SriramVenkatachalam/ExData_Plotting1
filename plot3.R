req_data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
cpy_dt<-req_data
cpy_dt$Date<-as.Date(cpy_dt$Date,format="%d/%m/%Y")
extracted_data<-cpy_dt[cpy_dt$Date >= "2007-02-01" & cpy_dt$Date <= "2007-02-02",]
extracted_data$date_time<-paste(extracted_data$Date,extracted_data$Time)
extracted_data$date_time<-strptime(extracted_data$date_time,"%Y-%m-%d %H:%M:%S")
sapply(c(extracted_data$Sub_metering_1,extracted_data$Sub_metering_2,extracted_data$Sub_metering_3),as.numeric)
lapply(extracted_data,class)
png(filename="D:/Academics/Data science lecture videos/Exploratory data analysis/Project 1/plot3.png",width=480,height=480)
with(extracted_data,plot(date_time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",ylim=range(Sub_metering_1,Sub_metering_2,Sub_metering_3)))
with(extracted_data,lines(date_time,Sub_metering_2,col="red",type="l"))
with(extracted_data,lines(date_time,Sub_metering_3,col="blue",type="l"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()