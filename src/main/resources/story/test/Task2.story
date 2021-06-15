Description: Task2;

Scenario: Sign In scenario
Given I am on a page with the URL 'https://10minutemail.info/'
When I save `value` attribute value of element located `By.xpath(//*[@id="fe_text"])` to STORY variable `email10`
When I open URL `https://trello.com/` in new window
When I click on element located `By.xpath(//a[text()='Войти'])`
When I ESTABLISH baseline with `login-page`
When I enter `${email10}` in field located `By.xpath(//*[@id="user"])`
When I enter `12345678` in field located `By.xpath(//*[@id="password"])`
When I ESTABLISH baseline with `login-entered-page`
When I click on element located `By.xpath(//*[@id="login"])`
When I find <= '1' elements by By.xpath(//*[@id="login"]) and for each element do
|step|
|Given I am on the main application page|
|When I click on element located `By.xpath(//a[text()='Регистрация'])`|
|Then the text 'Зарегистрировать аккаунт' exists|
|When I enter `${email10}` in field located `By.xpath(//*[@id="email"])`|
|When I click on element located `By.xpath(//*[@id="signup-submit"])`|
|When I wait until state of element located `By.xpath(//*[@id="displayName"])` is visible|
|When I enter `<firstname> ` in field located `By.xpath(//*[@id="displayName"])`|
|When I enter `<lastname>` in field located `By.xpath(//*[@id="displayName"])`|
|When I enter `12345678` in field located `By.xpath(//*[@id="password"])`|
|When I click on element located `By.xpath(//span[text()='Зарегистрироваться'])`|
|Given I am on a page with the URL 'https://trello.com/'|
|When I click on element located `By.xpath(//a[text()='Войти'])`|
|When I enter `${email10}` in field located `By.xpath(//*[@id="user"])`|
|When I enter `12345678` in field located `By.xpath(//*[@id="password"])`|
|When I click on element located `By.xpath(//*[@id="login"])`|
|When I ESTABLISH baseline with `success-login-page`|
Examples:
|firstname|lastname|
|#{generate(Name.firstName)}|#{generate(Name.lastName)}|

Scenario: Verify user Profile
Given I am on a page with the URL 'https://10minutemail.info/'
When I click on element located `By.xpath(//td[contains(., 'Подтвердите адрес электронной почты для приложения Trello')])`
When I click on element located `By.xpath(//*[@id="tab1"]//a[contains(., 'Подтвердите адрес электронной почты')])`
Then the text 'Перейти к Trello' exists
When I enter `12345678` in field located `By.xpath(//*[@id="password"])`
When I click on element located `By.xpath(//span[text()='Зарегистрироваться'])`
Then the page with the URL 'https://trello.com/create-first-team' is loaded
When I ESTABLISH baseline with `first-team-creating`


Scenario: Navigate to 5 pages and add visual check for each of them
Given I am on a page with the URL 'https://trello.com/create-first-team'
When I COMPARE_AGAINST baseline with `first-team-creating` ignoring:
|ELEMENT|
|By.xpath(//*[@id="moonshotCreateWorkspace"])|
When I click on element located `By.xpath(//button[text()='Продолжить'])`
When I ESTABLISH baseline with `trial-page`
When I open URL `https://trello.com/` in new window
When I COMPARE_AGAINST baseline with `trial-page`
When I click on element located `By.xpath(//button[text()='Пропустить'])`
When I click on element located `By.xpath(//button[text()='Приступим!'])`
When I click on element located `By.xpath(//*[@id="header"]/div[2]/button[4]/div/span)`
When I click on element located `By.xpath(//button/span[text()='Выйти'])`
When I click on element located `By.xpath(//span[text()='Выйти'])`
When I click on element located `By.xpath(//a[text()='Войти'])`
When I COMPARE_AGAINST baseline with `login-page` ignoring:
|ELEMENT|
|By.xpath(By.xpath(//*[@id="user"]))|
When I enter `${email10}` in field located `By.xpath(//*[@id="user"])`
When I enter `12345678` in field located `By.xpath(//*[@id="password"])`
When I COMPARE_AGAINST baseline with `login-entered-page`
When I click on element located `By.xpath(//*[@id="login"])`
When I COMPARE_AGAINST baseline with `success-login-page`