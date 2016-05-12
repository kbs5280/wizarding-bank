require 'minitest/autorun'
require 'minitest/pride'
require './lib/person.rb'

class PersonTest < Minitest::Test

  def test_person_can_have_name
    person = Person.new('Minerva')
    assert_equal 'Minerva has been created with 0 galleons in cash.', person.create
  end

  def test_person_can_have_cash_level
    person = Person.new('Luna', 500)
    assert_equal 'Luna has been created with 500 galleons in cash.', person.create
  end

end
