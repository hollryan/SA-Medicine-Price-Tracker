 
# Single Exit Prices App

SEPactx <- read.csv("data/SEPactx.csv", stringsAsFactors = FALSE
                    #, 
                    #fileEncoding="latin1"
                    )

Listactx <- SEPactx[ ,c(2)]
Listactx <- Listactx[order(Listactx)]
Listactx <- unique(Listactx)

shinyUI(fluidPage(
  
  br(),
  
  img(src="inScisive_Logo.jpg", height = 60, width = 220),
  
  titlePanel("SA Medicine Price Tracker"),
  
#   h3 ("Background"),
#   h5 ("Single Exit Price(SEP) refers to legislation mandating that medicine manufacturers may only sell their products at one price to all their customers, regardless of the nature of the customer’s order size and consumption levels. The term means that each and every product and its variants ‘exits’ the factory at one single price for that product or variant. Every drug on the market (and even some drugs not yet available in SA) will have an SEP. A drug’s single exit price is important to health economists and used for models that describe the costs of health care therapy."),
#   

  
fluidRow(
  
  column(3, 
         textInput("username", label = h5("Username"), 
                   value = "Enter username..."))
),

fluidRow(

  column(3, 
         textInput("pass", label = h5("Password"), 
                   value = "Enter password..."))
),

fluidRow(

    column(3,
           selectInput("select", label = h6("Begin typing active ingredient name and make selection"), 
                       choices = list("Active_ingredient" = Listactx), selected = "Aspirin", selectize=FALSE, multiple=TRUE),
            submitButton("Submit"))
  ),
  
   
  br(),
      textOutput("text0"),
  
  
      textOutput("text1"),

br(),

downloadButton('downloadData', 'Download'),
  
  br(),
  
      tableOutput("text2")
  
    
  ))
  

