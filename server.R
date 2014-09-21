library(shiny)

formatInputs <- function(test, var, hyp, conf, val1, val2){
  if(val1 == '' | val2 == '')
    return("Missing values for group 1 or group 2")
  else
  {
  testString <- as.character(test)
  varString <- if(var==FALSE) 
                  "not equal variance"
                else
                  "equal variance"
  hypString <- as.character(hyp)
  confString <- paste0(as.character(conf),"% confidence interval")
  val1String <- paste0("group 1: ",as.character(val1))
  val2String <- paste0("group 2: ",as.character(val2))
  
  return(paste0(testString,", ",varString, ", ", hypString, ", ", confString,"\n",val1String,"\n",val2String))
 }
}

formatTest <- function(res,pv){
  dg <- res$parameter
  names(dg)<-NULL
  dgStr <- paste0("degrees of freedom: ",round(dg,2),"\n")
  
  t <- res$statistic
  names(t)<-NULL
  tStr <- paste0("t-statistic: ",round(t,2),"\n")
  
  p <- res$p.value
  names(p)<-NULL
  pStr <- paste0("p-value: ",round(p,2),"\n")
  
  conf <- res$conf.int
  names(conf)<-NULL
  confStr <- paste0("confidence intervals: ",round(conf[1],2)," ", round(conf[2],2), "\n")
  
  est <- res$estimate
  names(est)<-NULL
  if(pv)
    estStr <- paste0("estimated difference in means: ", round(est[1],2),"\n")
  else
    estStr <- paste0("estimated mean of group 1: ", round(est[1],2),"\n","estimated mean of group 2: ",round(est[2],2),"\n")
  
#   nullval <- res$null.value
#   names(nullval)<-NULL
#   nullvalStr <- paste0("null value: ",round(nullval,2),"\n")
  
  return(paste0(dgStr,tStr,pStr,confStr,estStr))
}

runTtest <- function(val1,val2,hyp,pairedVal,var,conf){
  if(val1 == '' | val2 == '')
    return("No test conducted")
  
  x <- as.numeric(strsplit(val1,split=",")[[1]])
  y <- as.numeric(strsplit(val2,split=",")[[1]])
  pv <- ifelse(pairedVal=="paired", T, F)
  
  if(pv & length(x)!=length(y))
    return("For a paired test, input of group 1 and group 2 must have the same length")
  
  if(length(x) < 2)
    return("group 1 must contain at least two values")
  
  if(length(y) < 2)
    return("group 2 must contain at least two values")
  
  res <- t.test(x,y, alternative = c(hyp),paired = pv, var.equal = as.logical(var), conf.level=conf/100) 
  return(formatTest(res,pv))
}


  
shinyServer(
  function(input, output) {

    output$inputParameters <- renderText({
      if (input$goButton == 0)
        "No test conducted"
      else{
      input$goButton
      isolate(formatInputs(input$paired,input$variance,input$hypothesis,input$confInterval,input$values1,input$values2))
    }
    })
    
    output$testresult <- renderText({
      if (input$goButton == 0)
        return("No test conducted")
      input$goButton
      isolate(runTtest(input$values1,input$values2,input$hypothesis,input$paired,input$variance,input$confInterval))
    })
    
#     output$debug <- renderText({
#       if (input$goButton == 0)
#         return("ej tryckt")
#       input$goButton
#       isolate(c(input$values1))
#       
#     })
    
    
  }
)

# $out <- renderPrint : render as R output
# runApp(display.mode = 'showcase')