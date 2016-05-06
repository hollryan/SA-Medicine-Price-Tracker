
# This is the server logic for a Shiny web application.

library(shiny)

SEP <- read.csv("data/SEP.csv", stringsAsFactors = FALSE
                ,
                fileEncoding="latin1"
                )


SEPactx <- read.csv("data/SEPactx.csv", stringsAsFactors = FALSE
                    ,
                    fileEncoding="latin1"
                    )

SEPclean_actx_list <- read.csv("data/SEPclean_actx_list.csv", stringsAsFactors = FALSE
                               ,
                               fileEncoding="latin1"
                                )

SEPactx_mapping <- read.csv("data/SEPactx_mapping.csv", stringsAsFactors = FALSE
                            ,
                            fileEncoding="latin1"
                            )

Mappedactx <- merge(SEPactx,SEPactx_mapping, by = "Active.Ingredients")

Products <- merge(SEP, Mappedactx, by = c('Nappi.Code'))


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

    subset(Products, (Active.Ingredients.2 %in% input$select))
    [ ,c(1,3,4,5,6,7,8,21,22,23,9,10,11,12,13,14,16,18,19)],
    include.rownames = FALSE
    
    )
  
  output$list_name <- renderTable(
    
  lists <- data.frame(List.Name=input$list_name, Active.Ingredient=input$select)
#   lists$Active.Ingredient <- output$list_name
  
     
  )

  
  output$downloadData <- downloadHandler(
    filename = function() { 
      paste(input$select, '.csv', sep='') 
    },
    content = function(file) {
      write.csv(
        
        subset(Products, (Active.Ingredients.2 %in% input$select))
        [ ,c(1,3,4,5,6,7,8,21,9,10,11,12,13,14,16,18,19)],row.names = FALSE
        
        , file) 
    })
  
})




