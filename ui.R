#LOADING SHINY LIBRARY
library(shiny)
#creating an instance of a shiny object
shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("observe relationtionship between different objects in the dataset"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("cylinders in its engine" = "cyl",
                                          "the displaces amount" = "disp",
                                          "equivalent to these many horses" = "hp",
                                          "Rear-axle proportion" = "drat",
                                          "Weight in pounds by 1000" = "wt",
                                          "time to cover quater mile" = "qsec",
                                          "v//s" = "vs",
                                          "Transmission" = "am",
                                          "Gears in the car" = "gear",
                                          "carburetors in the front of the car" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "given are the outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("Caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("ANALYSING the dataset:",
                      
                      h3("this is for final assignment of ddl week 4"),
                      helpText("now we try to answer which kind of transmission can give higer mileage, whether it should be automatic or manual."),
                      h3("Imperitive of the matter :"),
                      p("Dataset has eleven parameters and 32 rows of data."),
                      
                      a("https://class.coursera.org/regmods-008")
             ),
             tabPanel("digging into the details of the data",
                      h2("given are some road tests"),
                      hr(),
                      h3("descriptive analysis"),
                      helpText("thiws is to find out whether developments in the industry have possibly made cars more cost effective"),
                      h3("Format"),
                      p("Dataset has eleven parameters and 32 rows of data"),
                      
                      p("  [, 1]   mpg         miles per 3.7854 litres "),
                      p("  [, 2]	 cyl	 cylinders in the engine"),
                      p("  [, 3]	 disp	 Displacement "),
                      p("  [, 4]	 hp	 equivalent number of horses"),
                      p("  [, 5]	 drat	ratio of back axle"),
                      p("  [, 6]	 wt	 Weight in pounds by 1000"),
                      p("  [, 7]	 qsec	 quater mile time"),
                      p("  [, 8]	 vs	 V//S"),
                      p("  [, 9]	 am	 type of transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of speeds"),
                      p("  [,11]	 carb	 Number of carburetors in the front of the car"),
                      
                      h3("Sources for the data are:"),
                      
                      p("Matt Le Blanc from Top Gear. Biometrics, 37, 391-411.")
             ),
             tabPanel("Github:",
                      a("link could not be generated"),
                      hr(),
                      h4("This is my shiny application "),
                      h4("Repository: Shiny app")
             )
  )
)

#Analysis done using concept of regression in mtcars dataset which is inbuilt in R progarmming language