req_data<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
cpy_dt<-req_data
cpy_dt$Date<-as.Date(cpy_dt$Date,format="%d/%m/%Y")
extracted_data<-cpy_dt[cpy_dt$Date >= "2007-02-01" & cpy_dt$Date <= "2007-02-02",]
extracted_data$date_time<-paste(extracted_data$Date,extracted_data$Time)
extracted_data$date_time<-strptime(extracted_data$date_time,"%Y-%m-%d %H:%M:%S")
png(filename="D:/Academics/Data science lecture videos/Exploratory data analysis/Project 1/plot2.png",width=480,height=480)
plot(extracted_data$date_time,extracted_data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
dev.off()
