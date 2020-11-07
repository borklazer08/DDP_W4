#import datasets built in R
library(datasets)
#import ggpubr 
library(ggpubr)
#import SHINY which makes this all possible
library(shiny)

#mt_cars_variable contains the imported dataset which goes by the name mtcars
mt_cars_variable <- mtcars
#now we set transmission type to factor
mt_cars_variable$am <- factor(mt_cars_variable$am, labels = c("Automatic", "Manual"))
#what are we doing here, just to suffer ??
shinyServer(function(input, output) {
  #this does something
  yet_another_variable_in_this_forsaken_world <- reactive({
    paste("mpg ~", input$variable)
  })
  #yet_another_variable_in_this_forsaken_world point takes mpg from dataset
  is_this_some_kind_of_object <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  #anotherday_another_fit takes mt_cars_variable
  anotherday_another_fit <- reactive({
    lm(as.formula(is_this_some_kind_of_object()), data=mt_cars_variable)
  })
  #should be render trhe text ??? 
  output$caption <- renderText({
    yet_another_variable_in_this_forsaken_world()
  })
  #lets make a box plot babbbyyyyy
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(yet_another_variable_in_this_forsaken_world()), 
            data = mt_cars_variable,
            outline = input$outliers)
  })
  #how about rendereing print
  output$anotherday_another_fit <- renderPrint({
    summary(anotherday_another_fit())
  })
  #now lets render the ever living s out of this plot
  output$mpgPlot <- renderPlot({
    with(mt_cars_variable, {
      plot(as.formula(is_this_some_kind_of_object()))
      abline(anotherday_another_fit(), col=2)
    })
  })
  #adding some more comments 'cause why not
})