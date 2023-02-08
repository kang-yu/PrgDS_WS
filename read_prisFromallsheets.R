read_preis <- function(path){
  library(readxl)
  dataH <- read_xlsx(path,
                     sheet = "Sheet2", 
                     rang= cell_cols("H"))
  begRow <- grep("Preis", dataH$...1)
  dataH2 <- dataH[begRow:nrow(dataH),]
  endRow <- which(is.na(dataH2$...1))
  dataH3 <- dataH2[1:endRow-1, ]
  return(dataH3)
}


allsheets <- list.files("Data_FinnKott/", full.names = T)
read_preis(allsheets[1])

allData <- NULL
for (i in 1:5){
  da <- read_preis(allsheets[i])
  allData <- rbind(allData, da)
}

