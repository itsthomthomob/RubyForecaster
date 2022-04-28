require 'rmagick'
require 'gruff'

class ForecastingTool
    userInput = ""

    def initialize
        puts "Hello, welcome to Simple Ruby Forecaster."
        puts "Please input 6 sales numbers separated by a comma and space. Example: "
        puts "10, 20, 30, 40, 50"
        userInput = gets
        takeInput userInput
    end

    def takeInput(curSales)
        puts ""
        puts "Your Input: \n #{curSales}"
        puts "What kind of forecast do you want to use?"
        puts "Choose between: "
        puts "Naive, MovingAvg, WeightedMovingAvg, or ExponentialSmoothing"
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
                puts "Perhaps you made a typo. Please choose again."
                return
        end
        createGraph curSales, type
    end

    def createGraph(mySales, chosenType)
        puts "Creating a #{chosenType} forecast with #{mySales}"

        # Current input
        input = mySales.split(", ")
        newSales = [array, 7]

        case chosenType
        when "Naive\n"
            input.each { |x| newSales[x] }
        end


        # Create graph
        g = Gruff::Line.new
        g.title = 'New Sales'
        g.labels = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5' }
        g.data :Current_Sales, input.map(&:to_f)
        g.data :New_Sales, input.map(&:to_f)
        g.write('CurrentSales.png')
        puts "Check your new image."
    end
end

ForecastingTool.new