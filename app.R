library(shiny)

ui <- fluidPage(
    titlePanel("Let's Do Arithmetic!"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "number1",
                         label = "Number 1",
                         value = 0),
            numericInput(inputId = "number2",
                         label = "Number 2",
                         value = 0),
            actionButton(inputId = "click",
                         label = "add :)")
        ),
        mainPanel(
            h2("The sum of the two numbers is:"),
            textOutput("sum")
        )
    )
)

server <- function(input, output) {
    x1 <- eventReactive(input$click, {
      as.numeric(input$number1)
    })
    x2 <- eventReactive(input$click, {
      as.numeric(input$number2)
    })
    output$sum <- renderText({
        
        x1() + x2()
    })
}

shinyApp(ui = ui, server = server)


