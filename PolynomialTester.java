public class PolynomialTester {
    
    public static void main (String [] args) {
        evaluateTests();
    }
    
    public static void evaluateTests() {
        try {
            assert( PolynomialEvaluator.evaluate("2x", 10) == 20.0);
            assert( PolynomialEvaluator.evaluate("2x^3+7x+5", 2) == 35.0);
            assert( PolynomialEvaluator.evaluate("3x^8-x+x^2", 1) == 3.0);
            assert( PolynomialEvaluator.evaluate("3 x - x ^ 3  +2", 0) == 2.0);
            assert( PolynomialEvaluator.evaluate("-9x ^ 5 - 0 + 4x^100", 2) == 
                (-9 * Math.pow(2, 5)) - 0  + (4 * Math.pow(2, 100)));
            assert( PolynomialEvaluator.evaluate("-3x^1 + 8 x ^ 0", 4) == -4.0);
            assert( PolynomialEvaluator.evaluate("2x", -1) == -2);
            assert( PolynomialEvaluator.evaluate("2x - 3x", -1) == 1);
            assert( PolynomialEvaluator.evaluate("1", 15) == 1);
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }
}