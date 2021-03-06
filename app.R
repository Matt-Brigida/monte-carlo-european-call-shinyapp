library(shiny)

ui <- bootstrapPage(
    sliderInput(inputId = "reps", label = "Number of Monte Carlo Runs", min = 50, max = 500, step = 1, value = 1),
    ## add radioButton input for antithetic sampling?
    plotOutput("distPlot")
)

server <- function(input, output){

    output$distPlot <- renderPlot({ 
        S <- 50
        K <- 45
        r <- 0.01
        vol <- 0.2
        T <- 0.5
        call <- 0
        for (i in 1:input$reps){
            z <- rnorm(1000000)
            call[i] <- exp(-r*T)*mean(ifelse(S*exp((r-.5*vol^2)*T+vol*sqrt(T)*z)>K, S*exp((r-.5*vol^2)*T+vol*sqrt(T)*z)-K, 0))
        }
### possibly change output from a density -- something which also shows the variability of the estimate.
        plot(density(call), main = "Monte Carlo Value of a European Call", sub = "Call Option Value")
    })


}

shinyApp(ui = ui, server = server)
