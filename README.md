T-test shiny app
==========

####This is my first Shiny app, developed as a course project in the Coursera class "Developing data products".

#####The app will conduct a paired or unpaired two-sample t-test.

#####To run this app with R Studio:
* install.packages("shiny")
* library(shiny)
* runGitHub( "FirstShiny", "jnsoft")


#####Instructions:
Begin by choosing what test you want to do.

Select "Unpaired"" for an unapaired test, or "Paired"" for a paired test. If paired is selected, then the input must be the same size for group 1 and group 2.

If "Treat the two variances as equal" is checked, the pooled variance is used to estimate the variance otherwise the Welch (or Satterthwaite) approximation to the degrees of freedom is used.

Select an "Alternative hypothesis" as Two sided (test for difference in mean), Greater (test if mean of group 1 is greater than mean of group 2) or Less (test if mean of group 1 is less than mean of group 2).

Select a confidence interval for the mean.

Enter values for group 1 and group 2

Values are entered as numbers and separated by comma: ,

A valid input string for four values can be: 1,2,3.5,6

Click the button "Run test" to preform the t.test


#####Output:
The section "You entered" will show any choices you made for the test parameters, or display a message if no test has been run yet or if there is a problem with your input.

The section 




