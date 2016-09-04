
library(shiny)

tags$head(
    tags$style(
        HTML("#dashboard{margin-left:50px;}")
    )
)

shinyUI(fluidPage( theme= "bootstrap.css",
    
    titlePanel(span(h1(strong(HTML('&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                              '&nbsp','&nbsp','&nbsp'),"DATA ANALYSIS"),align = "center"),style = "color:Silver  ")),
    HTML("<hr ,color='white' >") ,
    
    sidebarLayout(
        sidebarPanel( width=3, 
            img(src="bigorb.png", height = 90, width = 90),
            code("analysis using",
            span(" R", style = "color:blue;font-size: 12pt")),
            br(),
            
            span(Sys.Date(),style = "color:white;font-size: 8pt"),
            br(),
            br(),
            fileInput('file1', 'Upload Train Data (CSV)',
                      accept=c('text/csv', 
                               'text/comma-separated-values,text/plain', 
                               '.csv')),
            tags$hr(),
            checkboxInput('header', 'Header', TRUE),
            radioButtons('sep', 'Separator',
                         c(Comma=',',
                           Semicolon=';',
                           Tab='\t'),
                         ','),
            radioButtons('quote', 'Quote',
                         c(None='',
                           'Double Quote'='"',
                           'Single Quote'="'"),
                         '"'),
            
            textInput("text", label = strong("Dependent Variable"), 
                      value = "Enter Dependent Variable..."),
            
            fileInput('file2', 'Upload Test Data (CSV)',
                      accept=c('text/csv', 
                               'text/comma-separated-values,text/plain', 
                               '.csv')),
            br(),
            img(src="Snap1.jpg", height = 80, width = 80),
            span("App developed by",style = "font-size: 9pt"),
            span("Shan", style = "color:SpringGreen  ;font-size: 9pt"),
            

            
            wellPanel(
                fluidRow( 
                column(4,span("Connect",style = "color:PaleGreen;font-size: 8pt"))),

                fluidRow(column(3,a(img(src="g.png", height = 30, width = 30), href="https://www.linkedin.com/profile/preview?vpa=pub&locale=en_US"),style = "color:PaleTurquoise;font-size: 9pt"),

                column(3,a(img(src="in.png", height = 30, width = 30), href="https://github.com/shan4224"),style = "color:PaleTurquoise;font-size: 9pt"),
                       
                column(3,a(img(src="t.png", height = 30, width = 40), href="https://twitter.com/shan72131745"))
                )
            )

    
            ),
        mainPanel(
            br(),
            span(strong("Descriptive Analysis"),style = "color:BlanchedAlmond"),
            br(),
            p(span("Descriptive statistics is the term given to the analysis of data that helps describe, show or summarize data 
             in a meaningful way such that, patterns might emerge from the data.Descriptive statistics provide a 
             concise summary of data. You can summarize data numerically or graphicallyThe following is a descriptive analysis of data. Please select a csv file in the left side
              panel."),style="color:cyan"),
            span(strong(h4("SUMMARY OF DATA", align = "center")),style = "color:DarkKhaki "),
            p(span("It is the information that gives a quick and simple description of the data. It may include mean, median, mode, minimum value, 
            maximum value, range, standard deviation, etc.Here we get the summary of all the variables in the data.
              For continuous variables 'Mean','Median','Min','Max', 'Quartiles' are displayed.
              For categorical variables frequencies of different categories are displayed"),style="color:cyan"),
            
            tableOutput('contents'),
            HTML("<hr color='blue' >") ,
            
            br(),
            span(strong(h4("PLOTS OF DATA", align = "center")),style = "color:DarkKhaki"),
            p(span("A bivariate plot graphs the relationship between two variables that have been measured on a single sample of subjects. Such a 
                   plot permits you to see at a glance the degree and pattern of relation between the two variables.The following displays bivariate plots among all variables."),style="color:cyan"),
            plotOutput('plot1'),
            HTML('&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                 '&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                 '&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                 '&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp'),
            
            code("Bivariate Plot"),
            br(),
            br(),
            p(span("Correlation is a statistical technique that can show whether and how strongly pairs of variables are related.
             Correlation is broad class of statistical relationships involving dependence, though in common usage it most 
            often refers to the extent to which two variables have a linear relationship with each other.
            Corrplot creates a matrix of plots showing correlations among pairs of variables. The following displays correlation among variables. Correlation ranges from
              -1.0 to 1.0."),style="color:cyan"), HTML('&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp'),
            span("1.0 denotes high correlation. 0.0 denotes no linear correlation. -1.0 denotes high
              inverse correlation.",style = "color:BlanchedAlmond;font-size: 8pt"),
            
            
            plotOutput('plot2'),
            HTML('&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                 '&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                 '&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp',
                 '&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp','&nbsp'),
            code("Correlation Plot"),
            br(),
            HTML("<hr color='blue' >") ,
            span(h3("Model Fitting ",align = "center"),style = "color:DarkKhaki"),
            p(span("Model fitting is a procedure that takes three steps: First you need a function that takes 
            in a set of parameters and returns a predicted data set. Second you need an 'error function' 
            that provides a number representing the difference between your data and the model's prediction for any given set of model parameters.We can fit a model on the data. Please select a Dependendent variable in the text box of
              left side panel. All other variables of data will be independent variables."),style="color:cyan"),
            strong(p("Selected", span("Dependendent",style="color:PaleVioletRed ;font-size: 12pt") ,"Variable is",
                     textOutput('inputValue1'))),
           # textOutput('inputValue1'),
            
            br(),
            span(strong(p("Model Summary")),style = "color:BlanchedAlmond"),
           p(span("The model summary provides some broad information about the specifications used to 
            build the model and the resulting model. It may also state the algorithm used for building 
            the model.",style="color:cyan")),
            textOutput('text1'),

            br(),
            span(strong(p("Plotting the Model Object")),style = "color:BlanchedAlmond"),
            br(),
            
            plotOutput('plot3'),
            
            br(),
            HTML("<hr color='blue' >") ,
            span(h3("Predictive Analysis",align = "center"),style = "color:DarkKhaki"),
            br(),
            span(strong("Prediction On Test Data "),style = "color:BlanchedAlmond"),
            p(span("Predictive analytics is the practice of extracting information from existing data 
             sets in order to determine patterns and predict future outcomes and trends.Please select a Test Data in the input box of left side panel. The model will
              predict the dependent variable values for Test Data set"),style="color:cyan"),
            br(),
            HTML("<hr color='blue' >") ,
            span(strong("Predictive Values"),style = "color:BlanchedAlmond"),
            br(),
            p(span("Following vector is predicted for dependent variable in Test Data."),style="color:cyan"),
            br(),
            textOutput('contents2'),
            br(),
            br()
           
        )
    )
))







