require 'rmagick'
require 'gruff'

class ForecastingTool

    def initialize
        puts "Hello, welcome to Simple Ruby Forecaster."
        puts "Please input 5 sales numbers separated by a comma and space. Example: "
        puts "10, 20, 30, 40, 50"
    end

    def createGraph(curSales)
        g = Gruff::Line.new
        g.title = 'New Sales'
        g.labels = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
                    5 => '5' }
        g.data :Current_Sales, [25, 36, 86, 39, 25, 31]
        g.write('CurrentSales.png')
    end
end

