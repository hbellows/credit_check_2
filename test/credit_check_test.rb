require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test

  def test_it_converts_card_number_to_an_array_of_integers
    # skip
    credit_check = CreditCheck.new
    card_number = 5541808923795240

    result = [0, 4, 2, 5, 9, 7, 3, 2, 9, 8, 0, 8, 1, 4, 5, 5]

    assert_equal result, credit_check.convert_card_number(card_number)
  end

  def test_it_can_double_every_other_number
    # skip
    credit_check = CreditCheck.new

    converted = [0, 4, 2, 5, 9, 7, 3, 2, 9, 8, 0, 8, 1, 4, 5, 5]

    result = [0, 8, 2, 10, 9, 14, 3, 4, 9, 16, 0, 16, 1, 8, 5, 10]

    assert_equal result, credit_check.double_odd_index(converted)
  end

  def test_it_can_sum_double_digit_numbers
    # skip
    credit_check = CreditCheck.new

    doubled = [0, 8, 2, 10, 9, 14, 3, 4, 9, 16, 0, 16, 1, 8, 5, 10]

    result = [0, 8, 2, 1, 9, 5, 3, 4, 9, 7, 0, 7, 1, 8, 5, 1]

    assert_equal result, credit_check.sum_double_digit_numbers(doubled)
  end

  def test_it_can_sum_all_digits
    # skip
    credit_check = CreditCheck.new

    summed_digits = [0, 8, 2, 1, 9, 5, 3, 4, 9, 7, 0, 7, 1, 8, 5, 1]

    assert_equal 70, credit_check.sum_all_digits(summed_digits)
  end

  def test_it_can_validate_a_card_number
    # skip
    credit_check = CreditCheck.new

    totaled_digits = 70

    assert_equal true, credit_check.validate_number(totaled_digits)
  end

  def test_it_can_calculate_check_sum_digit
    # skip
    card_number = 6011797668867828
    credit_check = CreditCheck.new

    assert_equal 8, credit_check.calculate_check_sum_digit(card_number)

    card_number = 342804633855673
    credit_check = CreditCheck.new

    assert_equal 3, credit_check.calculate_check_sum_digit(card_number)
  end

  def test_it_can_determine_validity_of_a_card_number
    # skip
    card_number = 5541808923795240
    credit_check = CreditCheck.new

    assert_equal true, credit_check.valid_number?(card_number)

    card_number = 6011797668868728
    credit_check = CreditCheck.new

    assert_equal false, credit_check.valid_number?(card_number)
  end

  def test_it_can_send_the_correct_validation_message
    # skip
    card_number = 5541808923795240
    credit_check = CreditCheck.new

    result = "The number 5541808923795240 is valid."

    assert_equal result, credit_check.validation_output(card_number)

    card_number = 6011797668868728
    credit_check = CreditCheck.new

    result = "The number 6011797668868728 is invalid."

    assert_equal result, credit_check.validation_output(card_number)
  end
end
