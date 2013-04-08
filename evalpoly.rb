require 'rubygems'
require 'treetop'



class PolynomialParser
    Treetop.load 'polyparser.treetop'
    def initialize
        @parser = EvalPolyParser.new
    end
    
    def parse (input)
        result = @parser.parse(input)
        raise "could not parse" if result.nil?
        result.resolve(ARGV[1])
    end
end

evaluator = PolynomialParser.new
evaluator.parse(ARGV[0])