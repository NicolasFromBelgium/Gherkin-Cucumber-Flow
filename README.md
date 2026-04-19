# Gherkin-Cucumber-Flow

**A clean, simple and complete BDD example using Gherkin + Cucumber.js**

This repository is a learning template that shows how to quickly set up **Behavior-Driven Development (BDD)** with Gherkin and Cucumber.js on Linux.

### What is Gherkin?
Gherkin is a plain-text language with a simple grammar that lets you write **human-readable acceptance tests** using keywords like `Feature`, `Scenario`, `Given`, `When`, `Then`.

### What is Cucumber?
Cucumber is the tool that reads Gherkin files and executes them as automated tests.  
Here we use **Cucumber.js** (the official JavaScript implementation) — lightweight, no Java required.

### Project Structure
Gherkin-Cucumber-Flow/
├── features/
│   ├── addition.feature
│   └── step_definitions/
│       └── addition_steps.js
├── .gitignore
├── package.json
├── package-lock.json
└── README.md
### Quick Start – Step by step

```bash
# 1. Clone the repository
git clone git@github.com:NicolasFromBelgium/Gherkin-Cucumber-Flow.git && cd Gherkin-Cucumber-Flow

# 2. Check Node.js (should already be installed)
node --version && npm --version

# 3. Initialize the Node.js project
npm init -y                                          # (creates package.json)

# 4. Install Cucumber.js
npm install --save-dev @cucumber/cucumber            # (adds the test runner)

# 5. Create the project folders
mkdir -p features/step_definitions                   # (organizes features and steps)

# 6. Create .gitignore
cat > .gitignore << 'EOT'
node_modules/
*.log
.DS_Store
coverage/
EOT
F# 7. Update test script
npm pkg set scripts.test="cucumber-js"               # (so you can run "npm test")

# 8. Create the Gherkin feature file (English)
cat > features/addition.feature << 'EOF'
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
EOF

# 9. Create the step definitions
cat > features/step_definitions/addition_steps.js << 'EOF'
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
EOF

# 10. Run the tests
npm test                                             # (executes all scenarios)
You should see 5 scenarios (5 passed).


Made with ❤️ for learning BDD
Any questions? Just open an issue or contact me!
