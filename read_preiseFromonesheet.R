library(readxl)

dataH <- read_xlsx("Data_FinnKott/605517-H-DA-2023-0201-0685579001.xlsx",
                  sheet = "Sheet2", 
                  rang= cell_cols("H"))
dataL <- read_xlsx("Data_FinnKott/605517-H-DA-2023-0201-0685579001.xlsx",
                  sheet = "Sheet2", 
                  rang= cell_cols("L"))
data <- cbind(dataH, dataL)


str(dataH)
begRow <- grep("Preis", dataH$...1)

dataH2 <- dataH[begRow:nrow(dataH),]
endRow <- which(is.na(dataH2$...1))

dataH3 <- dataH2[1:endRow-1, ]


