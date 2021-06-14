import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        
        var profit = 0
        var maxPrice = 0
        if prices.isEmpty {
            return profit
        }
        for i in 0..<prices.count {
            maxPrice = 0
            for j in i + 1..<prices.count {
                
                if (prices[j] - prices[i] > maxPrice) {
                    
                    maxPrice = prices[j] - prices[i]
                }
            }
            profit += maxPrice
        }
        return profit
    }
}
