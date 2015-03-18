
# This is the server logic for a Shiny web application.

library(shiny)

SEP <- read.csv("data/SEP.csv", stringsAsFactors = FALSE
                #,
                #fileEncoding="latin1"
                )
SEPactx <- read.csv("data/SEPactx.csv", stringsAsFactors = FALSE
                    #,
                    #fileEncoding="latin1"
                    )


Products <- merge(SEP, SEPactx, by = c('Nappi.Code'))


shinyServer(function(input, output) {
 
  
  
  output$text0 <- renderText(
    
    "You have selected:"
  )
  
  output$text1 <- renderText(
    
    input$select
    
  )
  

  dataInput <- reactive({
    
    input$select
    
    })
  
  output$text2 <- renderTable(

    subset(Products, (Active.Ingredients %in% input$select))
    [ ,c(1,3,4,5,6,7,8,21,22,23,9,10,11,12,13,14,16,18,19)],
    include.rownames = FALSE
    
    )
  
  
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste(input$select, '.csv', sep='') 
    },
    content = function(file) {
      write.csv(
        
        subset(Products, (Active.Ingredients %in% input$select))
        [ ,c(1,3,4,5,6,7,8,21,9,10,11,12,13,14,16,18,19)],row.names = FALSE
        
        , file) 
    })
  
})




