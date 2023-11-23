## app.R ##
library(shinydashboard)
library(maps)
library(dplyr)
library(raster)
library(ggpubr)
library(ggplot2)
library(viridis)
library(ggrepel)
library(reshape)
library(stargazer)
library(hrbrthemes)
library(wesanderson)
library(magrittr)
library(plotly)
library(ggthemes)
library(viridis)
library(RColorBrewer)
library(data.table)
library(summarytools)
library(parameters)
library(DT)
library(readr)
library(readxl)
library(plotly)
library(rsconnect)
rsconnect::deployApp('https://realestateprices.shinyapps.io/Real_Estate_Prices/')



#####
real_estate <- read_csv("project.csv")
real_estate$Date<- as.Date(real_estate$Date, format = "%d.%m.%y")


dollar <- read_excel("dollar.xlsx")
dollar$Month<- as.Date(dollar$Month, format = "%d.%m.%y")
rate <- read_excel("Rate.xlsx")

rate$Date<- as.Date(rate$Date, format = "%d.%m.%y")
dollar$Monthly <- as.numeric(dollar$Monthly)

average_usd <- read_csv("average_$.csv")
average_usd$Date<- as.Date(average_usd$Date, format = "%m/%d/%Y")
average_usd

#####


sidebar <- dashboardSidebar(
  width = 300,
    sidebarMenu(
        menuItem("About the Project", tabName = "about"),
        menuItem("USD/AMD", tabName = "P1"),
        menuItem("USD/AMD by Year", tabName = "P2"),
        menuItem("Rate and USD/AMD relationship", tabName = "P3"),
        menuItem("Real Estate Prices in Yerevan", tabName = "P4"),
        menuItem("Real Estate Prices by District", tabName = "P5"),
        menuItem("USD/AMD and Real Estate Relationship", tabName = "P6"),
        menuItem("Interest Rates and Real Estate Relationship", tabName = "P7")
    )
)

body <- dashboardBody(
    tabItems(
      tabItem(tabName = 'about',
              imageOutput('image'),
              textOutput("About1"),
              textOutput("About2"),
              textOutput("About3"),
              textOutput("About4"),
              textOutput("About5"),
              textOutput("About6"),
              textOutput("About7"),
              textOutput("About8"),
              textOutput("About9"),
              textOutput("About10"),
              textOutput("About11"),
              textOutput("About12"),
              textOutput("About13"),
              textOutput("About14"),
              textOutput("About15"),
              textOutput("Authors"),
              tags$head(tags$style("#About1{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-top: -390px;
                                 margin-left: 10px;
                                 }")),
              tags$head(tags$style("#About2{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-left: 10px;
                                 }")),
              tags$head(tags$style("#About3{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-left: 10px;
                                 }")),
              tags$head(tags$style("#About4{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-left: 10px;
                                 }")),
              tags$head(tags$style("#About5{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-left: 10px;
                                 }")),
              tags$head(tags$style("#About6{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-left: 10px;
                                 height: 50px;
                                 }")),
              tags$head(tags$style("#About7{color: black;
                                 font-size: 13.5px;
                                 font-style: oblique;
                                 margin-left: 10px;
                                 }")),
              tags$head(tags$style("#Authors{color: blue;
                                 font-size: 20px;
                                 font-style: bold;
                                 margin-top: 550px;
                                 margin-left: 10px;
                                 }"))
      ),
        tabItem(tabName = "P1",
                fluidPage(
                    plotlyOutput("line1")) 
        ),
        
        tabItem(tabName = "P2",
                fluidRow(
                  box(title = "Plot1", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotlyOutput("plot1", height = 250)),
                  box(title = "Plot2", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotlyOutput("plot2", height = 250)),
                  box(title = "Plot3", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotlyOutput("plot3", height = 250)),
                  box(title = "Plot4", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotlyOutput("plot4", height = 250)),
                  
                  
                  
                )
        ),
        
        tabItem(tabName = "P3",
                fluidRow(
                  box(title = "Plot5", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotlyOutput("plot5", height = 250)),
                  box(title = "Plot6", solidHeader = TRUE,
                      collapsible = TRUE,
                      plotlyOutput("plot6", height = 250)) 
        )),
        
        tabItem(tabName = "P4",
                fluidPage(
                    plotlyOutput("line3")) 
        ),
        tabItem(tabName = "P5",
                fluidRow(
                    box(title = "Plot1.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot1.", height = 250)),
                    box(title = "Plot2.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot2.", height = 250)),
                    box(title = "Plot3.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot3.", height = 250)),
                    box(title = "Plot4.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot4.", height = 250)),
                    box(title = "Plot5.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot5.", height = 250)),
                    box(title = "Plot6.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot6.", height = 250)),
                    box(title = "Plot7.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot7.", height = 250)),
                    box(title = "Plot8.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot8.", height = 250)),
                    box(title = "Plot9.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot9.", height = 250)),
                    box(title = "Plot10.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot10.", height = 250)),
                    box(title = "Plot11.", solidHeader = TRUE,
                        collapsible = TRUE,
                        plotlyOutput("plot11.", height = 250)),
                    
                    
                    
                )
        ),
        tabItem(tabName = "P6",
              fluidPage(
                plotOutput("line2")) 
        ),
      tabItem(tabName = "P7",
              fluidPage(
                plotOutput("line10")) 
      )
        
        
    )
)




ui <- dashboardPage(
    header = dashboardHeader(),
    sidebar = sidebar,
    body = body
)

server <- function(input, output, session) {
  
  output$About1 <- renderText({
    
    "USD to AMD relationship is an important attribute in Armenian market. Many products change their price due to the USD fluctuation.  " 
  })
  
  output$About2 = renderText({
    "Not only in Armenia, but also almost in all over the world it changes a lot of things. "
  })
  
  output$About3 = renderText({
    " We know that USD to AMD can fluctuate because of outer and inner factors. " 
  })
  
  output$About4 = renderText({
    "We have experienced some global problems such as COVID-19 and Russia-Ukrainian war."
  })
  
  output$About5 = renderText({
    " These factors not only influenced Armenian economy but also it left its footprints on global economy. "
  })
  
  output$About6 = renderText({
    "We also have encountered some factors like the 44-day war which also had some influence on USD/AMD relationship and the housing prices of all Armenia. "
  })
  
  output$About7 = renderText({
    "Considering the above mentioned problems we have created some relationships between USD/AMD fluctuation and housing prices in further sections. "
  })
  
  output$Authors = renderText({
    "By Erik Shekunts, Zhora Stepanyan, Sergey Tovmasyan"
  })
  
  output$image = renderImage(
    list(
      src = "dollar_house.jpg",
      contentType = "image/jpg",
      width = "100%", height = "750px"
    )
  )
  
  
  
  
  
  
  
  
  
    output$line1 <- renderPlotly({
        ggplot(data=dollar, aes(x=Month, y=Monthly, group=1)) +
                   geom_line(linetype = "dashed", color = "blue", size = 1)+
                   geom_point(color='red')+theme_economist() + theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.5))+ylab("USD/AMD")+
                   scale_y_continuous(breaks = c(400, 450, 500,550))+xlab("Year") + ggtitle("USD AMD Relationship by Year")
        
    })
    output$plot1 <- renderPlotly({
      ggplot(data=dollar, aes(x=Month, y=Monthly, group=1)) +
        geom_line(linetype = "dashed", color = "black", size = 1)+
        geom_point(color='blue')+theme_classic()+
        scale_x_date(date_breaks = "1 year", date_labels = "%m.%y", limits =as.Date(c("01/01/2019", "01/12/2019"), format = '%d/%m/%Y'))+
        theme(axis.text.x = element_blank())+ylab("USD/AMD")+ scale_y_continuous(breaks = c(400, 450, 500))+xlab("Year 2019") + ggtitle("USD/AMD in 2019")
      
      
    })
    
    output$plot2 <- renderPlotly({
      ggplot(data=dollar, aes(x=Month, y=Monthly, group=1)) +
        geom_line(linetype = "dashed", color = "black", size = 1)+
        geom_point(color='blue')+theme_classic()+
        scale_x_date(date_breaks = "1 year", date_labels = "%m.%y", limits =as.Date(c("01/01/2020", "01/12/2020"), format = '%d/%m/%Y'))+
        theme(axis.text.x = element_blank())+ylab("USD/AMD")+ scale_y_continuous(breaks = c(400, 450, 500))+xlab("Year 2020") + ggtitle("USD/AMD in 2020")
    })
    
    output$plot3 <- renderPlotly({
      ggplot(data=dollar, aes(x=Month, y=Monthly, group=1)) +
        geom_line(linetype = "dashed", color = "black", size = 1)+
        geom_point(color='blue')+theme_classic()+
        scale_x_date(date_breaks = "1 year", date_labels = "%m.%y", limits =as.Date(c("01/01/2021", "01/12/2021"), format = '%d/%m/%Y'))+
        theme(axis.text.x = element_blank())+ylab("USD/AMD")+ scale_y_continuous(breaks = c(450,500,550))+xlab("Year 2021") + ggtitle("USD/AMD in 2021")
    })
    
    output$plot4 <- renderPlotly({
      ggplot(data=dollar, aes(x=Month, y=Monthly, group=1)) +
        geom_line(linetype = "dashed", color = "black", size = 1)+
        geom_point(color='blue')+theme_classic()+
        scale_x_date(date_breaks = "1 year", date_labels = "%m.%y", limits =as.Date(c("01/01/2022", "01/12/2022"), format = '%d/%m/%Y'))+
        theme(axis.text.x = element_blank())+ylab("USD/AMD")+ scale_y_continuous(breaks = c(400, 450, 500))+xlab("Year 2022") + ggtitle("USD/AMD in 2022")
      
    })
    
    output$plot5 <- renderPlotly({
      ggplot(data=dollar, aes(x=Month, y=Monthly, group=1)) +
        geom_line(linetype = "dashed", color = "blue", size = 1)+
        geom_point(color='red')+theme_economist() + theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.5))+ylab("USD/AMD")+
        scale_y_continuous(breaks = c(400, 450, 500,550))+xlab("Year") + ggtitle("USD/AMD from 2019 to 2022")
      
      
    })
    
    output$plot6 <- renderPlotly({
      ggplot(data=rate, aes(x=Date, y=Rate, group=1)) +
        geom_line(color = "purple", size = 1)+
        geom_point(color='black')+theme_classic2() + theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.5))+ylab("Rate") + ggtitle("Interest Rate from 2019 to 2022")
      
      
    })
    
    output$line3 <- renderPlotly({
      ggplot(real_estate) + geom_line(aes(Date,Kentron, color = "Kentron")) + 
        geom_line(aes(Date,Arabkir,color = "Arabkir")) + geom_line(aes(Date,`Qanaqer-Zeytun`, color = "Qanaqer Zeytun")) + 
        geom_line(aes(Date,`Nor-Norq`, color = "Nor Norq")) + geom_line(aes(Date,Avan, color = "Avan"))  + 
        geom_line(aes(Date,Erebuni,color = "Erebuni")) + geom_line(aes(Date,Shengavit,color = "Shengavit")) + 
        geom_line(aes(Date,Davtashen, color = "Davtashen"))  + geom_line(aes(Date,Ajapnyak,color = "Ajapnyak")) + 
        geom_line(aes(Date,`Malatia-sebastia`,color = "Malatia Sebastia")) + geom_line(aes(Date,Nubarashen,color = "Nubarashen")) + 
        labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Yerevan") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray")) +
        ylim(c(225000,750000)) + scale_color_manual(name='Districts', breaks=c('Kentron', 'Arabkir', 'Qanaqer Zeytun', 'Nor Norq', 'Avan', 'Erebuni', 'Shengavit', 'Davtashen', 'Ajapnyak', 'Malatia Sebastia', 'Nubarashen'), values=c('Kentron'='pink', 'Arabkir'='blue', 'Qanaqer Zeytun'='purple','Nor Norq'='yellow','Avan'='green','Erebuni'='gray','Shengavit'='dark gray','Davtashen'='black','Ajapnyak'='orange','Malatia Sebastia'='red','Nubarashen'='darkblue'))
      
    }) 
    
    output$plot1. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Kentron)) + 
        labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Kentron") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
        
    })
    
    output$plot2. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Arabkir)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Arabkir") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot3. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,`Qanaqer-Zeytun`)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Qanaqer Zeytun") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot4. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,`Nor-Norq`)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Nor Norq") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
        
    })
    
    output$plot5. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Avan)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Avan") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot6. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Erebuni)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Erebuni") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot7. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Shengavit)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Shengavit") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot8. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Davtashen)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Davtashen") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot9. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Ajapnyak)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Ajapnyak") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot10. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,`Malatia-sebastia`)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Malatia Sebastia") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$plot11. <- renderPlotly({
      ggplot(real_estate) + geom_col(aes(Date,Nubarashen)) + labs(y = "Price Per 1sqm", x = "Date", title = "Real Estate Prices of Nubarashen") + 
        scale_x_date(date_breaks = "3 month", date_labels = "%m.%y", limits = as.Date(c("01/01/2019", "01/09/2022"), format = '%d/%m/%Y')) + 
        theme(axis.title.x = element_text(face = "bold"),axis.title.y = element_text(face = "bold"),axis.text.x = element_text( angle = 45), legend.title = element_text(face = "bold"), legend.position = "top",legend.background = element_rect(fill = "White"), plot.title = element_text(face = "bold", size = 15, hjust = 0.5), plot.background = element_rect(fill = "darkgray"))
    })
    
    output$line2 <- renderPlot({
      ggplot() +
        geom_line(data = average_usd, aes(x = Date, y = Average,color='Real Estate Prices')) +
        geom_line(data = dollar, aes(x = Month, y = Monthly*2,color='USD/AMD')) + 
        scale_y_continuous(name = "USD", sec.axis = sec_axis(~./2,name="AMD"))+scale_x_date(date_breaks = "1 year", date_labels = "%m.%y", limits =as.Date(c("01/01/2019", "01/12/2022"), format = '%d/%m/%Y'))+
        scale_color_manual(name='Category',
                           breaks=c( 'Real Estate Prices','USD/AMD'),
                           values=c('Real Estate Prices'='purple','USD/AMD'='black'))+ggtitle("Real Estate Prices and USD/AMD correlation")+
        xlab("Date")+theme_clean()
      
    })
    output$line10 <- renderPlot({
      ggplot() +
        geom_line(data = average, aes(x = V1, y = V2,color='Real Estate Prices')) +
        geom_line(data = rate, aes(x = Date, y = Rate*5000000,color='Rate')) + 
        scale_y_continuous(name = "AMD", sec.axis = sec_axis(~./9000000, name = "Percentage"))+scale_x_date(date_breaks = "1 year", date_labels = "%m.%y", limits =as.Date(c("01/01/2019", "01/12/2022"), format = '%d/%m/%Y'))+
        scale_color_manual(name='Category',
                           breaks=c( 'Real Estate Prices','Rate'),
                           values=c('Real Estate Prices'='red','Rate'='blue'))+ggtitle("Real Estate Prices and Rate correlation")+
        xlab("Date")+theme_clean()
      
    })


}

shinyApp(ui, server)