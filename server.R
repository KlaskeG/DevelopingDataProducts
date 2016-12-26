library(shiny)
shinyServer(function(input, output) {
    
    model1<-reactive({
        var1<-input$variable1
        lm(paste("mpg ~ ",var1), data = mtcars)
        
        
    })
    model2<-reactive({
        lm(paste("mpg ~ ",input$variable2), data = mtcars)
        
    })
    model3<-reactive({
        lm(paste("mpg ~ ",input$variable3), data = mtcars)
        
    })
    
    output$mod1 <- renderTable({
        summary(model1())$coef
    },rownames=TRUE,colnames=TRUE)
    
    output$mod2 <- renderTable({
        summary(model2())$coef
    },rownames=TRUE,colnames=TRUE)
    
    output$mod3 <- renderTable({
        summary(model3())$coef
    },rownames=TRUE,colnames=TRUE)
    output$R1<-renderTable({
        summary(model1())$r.squared
    },rownames=FALSE,colnames=FALSE)
    output$R2<-renderTable({
        summary(model2())$r.squared
    },rownames=FALSE,colnames=FALSE)
    output$R3<-renderTable({
        summary(model3())$r.squared
    },rownames=FALSE,colnames=FALSE)
})

