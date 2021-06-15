Description: Task3;

Scenario: Sign In scenario with composite steps
Given I am on a page with the URL 'https://10minutemail.info/'
When I save `value` attribute value of element located `By.xpath(//*[@id="fe_text"])` to STORY variable `email10`
When I open URL `https://trello.com/` in new window
When I click on element located `By.xpath(//a[text()='Регистрация'])`
Then the text 'Зарегистрировать аккаунт' exists
When I enter `${email10}` in field located `By.xpath(//*[@id="email"])`
When I click on element located `By.xpath(//*[@id="signup-submit"])`
When I wait until state of element located `By.xpath(//*[@id="displayName"])` is visible
When I fill the registration form 
When I click on element located `By.xpath(//span[text()='Зарегистрироваться'])`
Given I am on a page with the URL 'https://trello.com/'
When I click on element located `By.xpath(//a[text()='Войти'])`
When I fill the login form
When I click on element located `By.xpath(//*[@id="login"])`


Scenario: Create ‘UI controls (any) validation’ scenario
!-- Nested steps are used in Task1 "Sign Up New User" and Task2 "Sign In scenario"