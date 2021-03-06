class CreditCheck

  def validation_output(card_number)
    if valid_number?(card_number)
       "The number #{card_number} is valid."
    else
       "The number #{card_number} is invalid."
    end
  end

  def valid_number?(card_number)
    converted = convert_card_number(card_number)
    doubled = double_odd_index(converted)
    summed_digits = sum_double_digit_numbers(doubled)
    totaled_digits = sum_all_digits(summed_digits)
    validate_number(totaled_digits)
  end

  def calculate_check_sum_digit(card_number)
    converted = convert_card_number(card_number)
    doubled = double_odd_index(converted)
    summed_digits = sum_double_digit_numbers(doubled)
    check_sum_digit(summed_digits)
  end

  def convert_card_number(card_number)
    card_number.digits
  end

  def double_odd_index(converted)
    doubled = []
    converted.each.with_index do |digit, index|
      if index.odd?
        doubled << digit * 2
      else
        doubled << digit
      end
    end
    doubled
  end

  def sum_double_digit_numbers(doubled)
    summed_digits = []
    doubled.each do |number|
      if number > 9
        summed_digits << number - 9
      else
        summed_digits << number
      end
    end
    summed_digits
  end

  def check_sum_digit(summed_digits)
    summed_digits.shift
    total = summed_digits.sum
    remainder = total % 10
    if remainder == 0
      0
    else
      10 - remainder
    end
  end

  def sum_all_digits(summed_digits)
    summed_digits.sum
  end

  def validate_number(totaled_digits)
    if totaled_digits % 10 == 0
      true
    else
      false
    end
  end
end
