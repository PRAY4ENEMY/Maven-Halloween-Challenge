# Maven-Halloween-Challenge

## Minimizing Tricks, Maximizing Treats 

With inflation being the scariest thing this spooky season, households are looking to maximize the popularity of their house on Halloween while cutting cost where ever possible.  Based on this data analysis, we can control internet survey results for price to find the candies that provide the most value for the price.

### Controlling for Price 

In order accuratly control for price, we need to convert the percentile rank of the price of each candy into a term that can equally adjust the head-to-head performance, as measured in win percentage, for a better comparison.  

We can derive an adjustment value that equally weights the win percentage by subtracting the price percentile by the average percentile (~.50). This function give us each candies distance from the average price as expressed by a number inbetween -1 and +1. 

**adjustment value: percentile price - median(percentile price) **

After deriving the adjustment value, we can create a new metric that tells us how much utility each candy provides for the relative price. 

**adjusted score = (win%) * (1 - adjustment value)**

Controlling for price in this manner changes the analysis significantly. For example, while the candy "twix" is very popular, it is also rather expensive compared to others in the data set. after controlling to price, "twix" scores in the middle of the pack. 

### Finding the Optimal Allocation between Fruit and Chocolate Candies. 

Another consideration is the allocation between fruit and chocolate candies. Assuming that trick-o-treaters have a defined preference between the two, we can take the relative popularity of each candy type to ensure we can fulfill the preferences of each person. 

Fruit candies account for 39% of scores and chocolates account for 61% of scores. 

### Final Recommendations 

This is the optimal allocation of candy when we take into account price and preferences between fruit in candy. 

Reeces Minis = 31%
Hersheys kisses = 29%
Starbursts = 21%
skittles = 19%

I personally like kit-kats more than hershey's kisses and the pie chart graphic reflects this. 
