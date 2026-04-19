Feature: Addition of two numbers

  As a calculator user
  I want to add two numbers
  So that I can quickly verify the result

  Scenario: Addition of two positive numbers
    Given I have the numbers 2 and 3
    When I add them
    Then the result should be 5

  Scenario Outline: Addition with multiple cases
    Given I have the numbers <number1> and <number2>
    When I add them
    Then the result should be <result>

    Examples:
      | number1 | number2 | result |
      | 2       | 3       | 5      |
      | 10      | -5      | 5      |
      | 0       | 0       | 0      |
      | 100     | 200     | 300    |
