# Make boxplots and explore the effects of multiple independent variables on ox and gly fibers
# The codes below are with fixed Peromyscus Histology Sheet

info2 <- read.csv("/Users/nicolechoi/Documents//Peromyscus_histology - Sheet1 (1).csv")[, -c(13:27)]
fiber <- read.csv("Fiber_type_quantification - Sheet1.csv") 
data_full <- merge(fiber, info2, by="Mouse_ID")
# fiber_avg <- read.csv("Fiber_type_avg - Sheet1.csv") 
fiber_avg1 <- read.csv("Fiber_type_avg_no_outliers.csv") 
data_avg <- merge(fiber_avg1, info2, by="Mouse_ID")
data_avg <- na.omit(data_avg)

boxplot(avg_ox ~ Strain, data = data_avg)
# Average oxidative cells in PO strain is highest (has outlier). MUS strain has lowest average. 
boxplot(avg_gly ~ Strain, data = data_avg)
# Average glycolytic cells in PO strain is lowest (has outlier). MUS strain has highest average. AZ has outlier.
boxplot(avg_ox ~ Sex, data = data_avg)
# Average oxidative cells in males are larger. Many outliers in females. 
boxplot(avg_gly ~ Sex, data = data_avg)
# Average glycolytic cells in males are smaller. Many outliers in females. One outlier in males. 
boxplot(avg_ox ~ Habitat, data = data_avg)
# Average oxidative cells in Highland are greater (not big difference). One outlier. Two outliers in lowland. 
boxplot(avg_gly ~ Habitat, data = data_avg)
# Average glycolytic cells in lowland slightly higher. Two outliers. One outlier in highland. 
hist(data_avg$avg_ox)
# Largest frequency in 0.5-0.6 region
hist(data_avg$avg_gly)
# Largest frequency in 0.4-0.5 region
hist(data_avg$stdev_ox)
# Largest in 0.15-0.2 region. Average amount of variability in data, how far score lies from mean. 
hist(data_avg$stdev_glyc)
# Identical standard deviation to oxidative. 
boxplot(avg_ox ~ Species, data = data_avg)
# Species not stated for some. M.musculus has smallest average. 
boxplot(avg_gly ~ Species, data = data_avg)
# M.musculus has highest average. Species that had highest in oxidative is lowest. 
# Family and DOB are very skewed, no coorelation.  
boxplot(avg_ox ~ Treatment..meters.*Strain, data = data_avg)
boxplot(avg_gly ~Treatment..meters.*Strain, data = data_avg)

# low <- subset(data_avg, Treatment..meters.=="1000")
# mid <- subset(data_avg, Treatment..meters.=="3000")
# high <- subset(data_avg, Treatment..meters.=="4500")
# 
# boxplot(avg_ox ~ Treatment..meters.*Strain, data = low)
# boxplot(avg_ox ~ Treatment..meters.*Strain, data = mid)
# boxplot(avg_ox ~ Treatment..meters.*Strain, data = high)
# boxplot(avg_gly ~ Treatment..meters.*Strain, data = low)
# boxplot(avg_gly ~ Treatment..meters.*Strain, data = mid)
# boxplot(avg_gly ~ Treatment..meters.*Strain, data = high)

data_avg1 <- data_avg[-c(74:91), ]
low <- subset(data_avg1, Treatment..meters.=="1000")
mid <- subset(data_avg1, Treatment..meters.=="3000")
high <- subset(data_avg1, Treatment..meters.=="4500")

boxplot(avg_ox ~ Treatment..meters.*Strain, data = low)
boxplot(avg_ox ~ Treatment..meters.*Strain, data = mid)
boxplot(avg_ox ~ Treatment..meters.*Strain, data = high)
boxplot(avg_gly ~ Treatment..meters.*Strain, data = low)
boxplot(avg_gly ~ Treatment..meters.*Strain, data = mid)
boxplot(avg_gly ~ Treatment..meters.*Strain, data = high)



