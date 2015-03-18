

SEP <- read.csv(file.path("C:/Users/Ryan/Google Drive/inScisive/SA Medicine Price Tracker/SEP.csv"), stringsAsFactors = FALSE)
SEPactx <- read.csv(file.path("C:/Users/Ryan/Google Drive/inScisive/SA Medicine Price Tracker/SEPactx.csv"), stringsAsFactors = FALSE)

Products <- merge(SEP, SEPactx, by = c('Nappi.Code'))

test <- subset(Products, Active.Ingredients == input$text)

test <- test[ ,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)]

write.csv(test, file = "test.csv",row.names=FALSE)
