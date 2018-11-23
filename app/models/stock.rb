class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      price = looked_up_stock.latest_price
      ticker =  looked_up_stock.symbol
      name = looked_up_stock.company_name
      new(name: name , ticker: ticker, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end

end
