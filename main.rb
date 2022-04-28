require 'rmagick'
require 'gruff'

class ForecastingTool
    userInput = ""

    def initialize
        puts "Hello, welcome to Simple Ruby Forecaster."
        puts "Please input 6 sales numbers separated by a comma and space. Example: "
        puts "10, 20, 30, 40, 50, 60"
        userInput = gets
        newArr = userInput.split(", ")
        if newArr.length() != 6
            puts "Length is not 6. Please try again."
            return ForecastingTool.new
        end
        takeInput userInput
    end

    def takeInput(curSales)
        puts ""
        puts "Your Input: \n #{curSales}"
        puts "What kind of forecast do you want to use?"
        puts "Choose between: "
        puts "Naive"
        puts "Please type the forecast type exactly as shown."
        type = gets
        puts ""
        case type
            when "Naive\n"
                puts "You chose Naive."
            when "MovingAvg\n"
                puts "You chose MovingAvg."
            when "WeightedMovingAvg\n"
                puts "You chose WeightedMovingAvg."
            when "ExponentialSmoothing\n"
                puts "You chose ExponentialSmoothing."
            else 
                puts "Perhaps you made a typo. Please try again."
                return takeInput curSales
        end
        createGraph curSales, type
    end

    def createGraph(mySales, chosenType)
        puts "Creating a #{chosenType} forecast with #{mySales}"

        # Current input
        input = [mySales[0], mySales[1], mySales[2], mySales[3], mySales[4], mySales[5], 0]
        newSales = Array.new(7)

        case chosenType
        when "Naive\n"
            #newSales[0] = input[1]
            newSales[1] = input[0]
            newSales[2] = input[1]
            newSales[3] = input[2]
            newSales[4] = input[3]
            newSales[5] = input[4]
            newSales[6] = input[5]
        end

        # Create graph
        g = Gruff::Line.new
        g.title = 'Naive Forecast'
        g.labels = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6' }
        g.data :Current_Sales, input.map(&:to_f)
        g.data :New_Sales, newSales.map(&:to_f)
        g.write('NaiveForecast.png')
        puts "Printed NaiveForecast.png. Check your new image."
    end
end

ForecastingTool.new