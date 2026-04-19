const { Given, When, Then } = require('@cucumber/cucumber');

let number1, number2, result;

Given('I have the numbers {int} and {int}', function (n1, n2) {
  number1 = n1;
  number2 = n2;
});

When('I add them', function () {
  result = number1 + number2;
});

Then('the result should be {int}', function (expected) {
  if (result !== expected) {
    throw new Error(`❌ Expected ${expected} but got ${result}`);
  }
  console.log(`✅ Correct result: ${result}`);
});
