library(shiny)

ui <- bootstrapPage(
		    sliderInput(inputId = "num", label = "Amount of Random Numbers", min = 1000, max = 10000000, step = 10000, value = 100000)
    )
    
server <- function(input, output){

output$distPlot <- renderPlot({ 


})


}

shinyApp(ui = ui, server = server)
