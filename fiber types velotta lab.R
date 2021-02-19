fiber <- read.csv("Fiber_type_quantification - Sheet1.csv")
info <- read.csv("Peromyscus_histology - Sheet1.csv")[, -c(13:27)] # this code omits columns 13-27
data_full <- merge(fiber, info, by="Mouse_ID")
fiber_avg <- read.csv("Fiber_type_avg - Sheet1.csv")
data_avg <- merge(fiber_avg, info, by="Mouse_ID")
prop_ox <- (fiber$type1_oxidative + fiber$type2_oxidative) / fiber$total

# Make boxplots and explore the effects of multiple independent variables on ox and gly fibers