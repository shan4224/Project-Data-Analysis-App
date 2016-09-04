
library(shiny)
library(ggplot2)
library(GGally)
library(rpart)
library(rpart.plot)


shinyServer(function(input, output) {
    
    data <- reactive({
        inFile <- input$file1
        req(inFile)
        data <- read.csv(inFile$datapath, header=input$header, sep=input$sep,  quote=input$quote)
        data
    })
    
    testdata <- reactive({
        inFile <- input$file2
        req(inFile)
        testdata <- read.csv(inFile$datapath, header=input$header, sep=input$sep,  quote=input$quote)
        testdata
    })
    
    
    model <- reactive({
        req(input$text %in% names(data()))
        depVar <- input$text
        mod <- as.formula(paste0(depVar, " ~ ."))
        modrpart <- rpart(mod, data = data() )
        modrpart
    })
    
    modelc <- reactive({
        req(input$text %in% names(data()))
        depVar <- input$text
        mod <- as.formula(paste0(depVar, " ~ ."))
        modrpart <- rpart(mod, data = data(),method="class" )
        modrpart
    })
    output$contents <- renderTable({
        
        inFile <- input$file1
        if (is.null(inFile))
            return(NULL)
        
        data1 <- read.csv(inFile$datapath, header=input$header, sep=input$sep, 
                 quote=input$quote)
        summary(data1)
        
    })
    
    output$plot1 <- renderPlot({
        ggpairs(data= data())
    })
    
    output$plot2 <- renderPlot({
        ggcorr(data= data())
    })
    
    output$inputValue1 <- renderPrint({
        input$text
    })
    
    output$text1 <- renderPrint({
        model()
    })
    
    output$plot3 <- renderPlot({
        prp(model())
    })
    

        
    output$contents2 <- renderText({
        
        req(input$text %in% names(testdata()))
        test <- class(testdata()[[input$text]])
        
        if (test == "factor") {
            return(predict(modelc(), newdata = testdata(), type = "class"))
        }
        if (test == "numeric") {
            return(predict(model(), newdata = testdata()) )
        }
    })
    

    })
    






















