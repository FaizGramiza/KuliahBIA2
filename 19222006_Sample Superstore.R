# Create two 2x3 matrices
# Terdapat kodingan baru
# Yaitu perhitungan rata-rata

str(sample_superstore_1_)
summary(sample_superstore_1_)

sample_superstore1to11<- sample_superstore_1_[1:11,]
sample_superstore1to11

sample_superstoreSELECTED <- sample_superstore_1_[,c("Customer Name", "Segment", "City", "Product ID", "Category", "Sales", "Quantity", "Discount", "Profit")]
View(sample_superstoreSELECTED)

subset(sample_superstoreSELECTED, Sales>500)

# Adding a new column "Revenue" with the specified calculation
sample_superstoreSELECTED$Revenue <- sample_superstoreSELECTED$Sales * sample_superstoreSELECTED$Quantity * (1 - sample_superstoreSELECTED$Discount)

# View the updated dataframe
View(sample_superstoreSELECTED)


# Ensure the "Revenue" column is added in sample_superstoreSELECTED
sample_superstoreSELECTED <- sample_superstore_1_[, c("State", "Customer Name", "Segment", "City", "Product ID", "Category", "Sales", "Quantity", "Discount", "Profit")]
sample_superstoreSELECTED$Revenue <- sample_superstoreSELECTED$Sales * sample_superstoreSELECTED$Quantity * (1 - sample_superstoreSELECTED$Discount)

# Create the summary table using aggregate functions in base R
Total_Sales <- aggregate(Sales ~ State, data = sample_superstoreSELECTED, sum)
AverageSalesPerTransaction <- aggregate(Sales ~ State, data = sample_superstoreSELECTED, mean)
Total_Profit <- aggregate(Profit ~ State, data = sample_superstoreSELECTED, sum)
AVGProfitPerTransaction <- aggregate(Profit ~ State, data = sample_superstoreSELECTED, mean)

# Merge all the summary data into one dataframe
summary_table <- merge(Total_Sales, AverageSalesPerTransaction, by = "State")
summary_table <- merge(summary_table, Total_Profit, by = "State")
summary_table <- merge(summary_table, AVGProfitPerTransaction, by = "State")

# Rename the columns for clarity
colnames(summary_table) <- c("State", "Total Sales", "AverageSalesPerTransaction", "Total Profit", "AVGProfitPerTransaction")

# View the summary table
View(summary_table)
