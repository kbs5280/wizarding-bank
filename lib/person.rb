require 'pry'

class Person
  attr_reader     :name,
                  :cash_level

  def initialize(name, cash_level = 0)
    @name        = name
    @cash_level  = cash_level
  end

  def create
    "#{@name} has been created with #{cash_level} galleons in cash."
  end

end
