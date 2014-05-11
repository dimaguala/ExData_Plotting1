# plot3.R

df <- read.table("household_power_consumption.txt",
                 skip = 66637, nrow = 2880, sep = ";", 
                 col.names = colnames(read.table(
                     "household_power_consumption.txt",
                     nrow = 1, header = TRUE, sep=";")))

png("plot3.png")
Sys.setlocale("LC_TIME", "C")
w <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

# plot the Sub_metering_1 across the week days
plot(w, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# add Sub_metering_2 in red
lines(w, df$Sub_metering_2, type = "l", col = "red")

# add Sub_metering_3 in blue
lines(w, df$Sub_metering_3, type = "l", col = "blue")

# add a legend in the topright
legend("topright", lty = c(1, 1), col = c("black", "red", "blue"), legend = names(df[7:9]))
dev.off()