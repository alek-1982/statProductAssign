Shiny Car Application
===
author: wang
date: Sun Jun 21 23:40:29 2015
transition: rotate
transition-speed: fast
type: prompt
font-family:"Times New Roman"                

Features of the Shiny Car Application
===
transition: concave
    
                
### Selection Boxes     
- One selection input boxes are available.            
- Selection box allows choice of Displacement,
    Horse Power,Weight.
- A second box allows for selection of nummber. 
- 3 checkbox allows control of the plot display:
    Name, line , formula


===

Shiny Car Application Outputs
### Output Plots            
- Shows plot of linear regression of the miles per gallon and Displacement
- Shows plot of linear regression of the miles per gallon and Horse Power
- Shows plot of linear regression of the miles per gallon and Weight
- Shows Names, line , formula in each plot.  
      


      
===
### Example of relations every pair variables.   
![plot of chunk unnamed-chunk-1](Presentation_for_Shiny-figure/unnamed-chunk-1-1.png) 
Inside the hood
===   
### The regression call 

```r
fit <- lm(mtcars$mpg ~ mtcars$wt)
plot(mpg ~ wt,data = mtcars, ylab="Miles per Gallon",xlab=mtcars$wt)
abline(fit,col = "red",lwd=2)
```

![plot of chunk unnamed-chunk-2](Presentation_for_Shiny-figure/unnamed-chunk-2-1.png) 

Why use the Shiny Car Application ?
===============================================
### When buying a car

- If you are buying a new car or a used car...
  - you can get a idea of how gas-costly it will be.
  
### When using a car
- You may check regualy the car's gas effiency to its ideal state.








