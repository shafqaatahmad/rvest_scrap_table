##Using the Rvest package in R extract the contents in the table from the link 
##http://stats.espncricinfo.com/ci/content/records/283920.html
library(rvest)
library(dplyr)

mywebpage<-read_html("http://stats.espncricinfo.com/ci/content/records/283920.html")

mytable<-html_nodes(mywebpage,xpath= '//*[@id="ciHomeContentlhs"]/div[3]/div/table[1]')

mydf<-as.data.frame(html_table(mytable))

mydf%>%group_by(Winner)%>%summarise(Frequency=n())