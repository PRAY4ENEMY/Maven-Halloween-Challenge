# Halloween Challenge 

##For the Maven Halloween Challenge, you’ll need to take a data-driven approach for becoming 
##the most popular trick-or-treating house on the block.

##Using online votes ranking 85 types of candy, your task is to find the 3 treats you'll give
##out on Halloween to guarantee that trick-or-treaters of all tastes find something they'll 
##love and present the data to back up your decision.

##HOW TO WIN

##We'll be crowning 3 separate winners:

##    A general "Challenge Winner" for the best entry
##    A "First-time Entrant" winner
##    A "Fan Favorite" winner (based on project likes in Maven Showcase)

## data 

data <- read.csv("C:/Users/PRAY4ENEMY/Desktop/Halloween+Candy+Rankings/candy-data.csv")

## convert to win percentage to percentile rank. 
## adjust percentile ranking of wins given percentile price 
## adjustment value: percentile price - median(percentile price) 
#### calculates distance from median 
## adjusted score = (win%) * (1 - adjustment value)

data$adj.wins <- (data$winpercent)*(1-(data$pricepercent - median(data$pricepercent)))

data <- data[order(data$adj.wins, decreasing = TRUE),]


## Subset data by fruit or chocolate and look at summary stats 

#### Fruit vs chocolate seems to be most relevant distinction given based on the dummy variables given 

fruit <- subset.data.frame(data, fruity == 1)
choco <- subset.data.frame(data, fruity == 0)

## finding the optimal allocation of candy to fulfill people's fruit vs. chocolate preference 

sum(fruit$winpercent)/sum(data$winpercent)
sum(choco$winpercent)/sum(data$winpercent)

##### 40% fruit to 60% chocolate

# simplify data for fruit (top 5 rated); including allergy information. 

top_fruit <- head(fruit[order(fruit$adj.wins, decreasing = TRUE),], n=5)

top_fruit <- data.frame(name = c(top_fruit$competitorname),
                        win.percent = c(top_fruit$winpercent),
                        prices = c(top_fruit$pricepercent),
                        sugars = c(top_fruit$sugarpercent),
                        adj.wins = c(top_fruit$adj.wins),
                        peanits = c(top_fruit$peanutyalmondy))


top_choco <- head(choco[order(choco$adj.wins, decreasing = TRUE),], n=5)

top_choco <- data.frame(name = c(top_choco$competitorname),
                        win.percent = c(top_choco$winpercent),
                        prices = c(top_choco$pricepercent),
                        sugars = c(top_choco$sugarpercent),
                        adj.wins = c(top_choco$adj.wins),
                        peanits = c(top_choco$peanutyalmondy))

print(top_choco$name)
print(top_fruit$name)

##### optimal allocation to maximize price and consumer preference 
# This allocation gives us ~30% candies with allergy concerns. This should be avoid any concerns about allergens. 

aaa = ((sum(choco$winpercent)/sum(data$winpercent)) * (top_choco[1,2] / (top_choco[1,2] + top_choco[3,2])))
baa = ((sum(choco$winpercent)/sum(data$winpercent)) * (top_choco[3,2] / (top_choco[1,2] + top_choco[3,2])))
caa = ((sum(fruit$winpercent)/sum(data$winpercent)) * (top_fruit[1,2] / (top_fruit[1,2] + top_fruit[2,2])))
daa = ((sum(fruit$winpercent)/sum(data$winpercent)) * (top_fruit[2,2] / (top_fruit[1,2] + top_fruit[2,2])))

ally <- data.frame(candy = c("Reese's Miniatures","Kit Kat","Starburst","Sour Patch Kids"), allocation = c(aaa,baa,caa,daa))

pie(ally$allocation,
    main = "Optimal Candy Allocation - Based on Price to Performance",
    labels = c(paste(ally$candy,(round(ally$allocation,3)*100),"%")),
    border = "white",
    col = c("chocolate","brown","pink","green"))





