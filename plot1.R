# plot1.R

# read in the column names, skip to the needed date
# and read in the data for the specified time period
df <- read.table("household_power_consumption.txt",
                 skip = 66637, nrow = 2880, sep = ";", 
                 col.names = colnames(read.table(
                     "household_power_consumption.txt",
                     nrow = 1, header = TRUE, sep=";")))

# open a png file
png("plot1.png")

# plot the histogram of Global_active_power in the png file
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# close the graphic device
dev.off()