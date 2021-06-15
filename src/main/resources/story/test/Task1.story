Description: Task1;

Scenario: Sign Up New User
When I execute steps while counter is not equal to '3' with increment '1' starting from '0':
|step|
|Given I am on the main application page|
|When I click on element located `By.xpath(//a[text()='Регистрация'])`|
|Then the text 'Зарегистрировать аккаунт' exists|
|When I enter `<email>@gmail.com` in field located `By.xpath(//*[@id="email"])`|
|When I click on element located `By.xpath(//*[@id="signup-submit"])`|
|When I wait until state of element located `By.xpath(//*[@id="displayName"])` is visible|
|When I enter `<firstname> ` in field located `By.xpath(//*[@id="displayName"])`|
|When I enter `<lastname>` in field located `By.xpath(//*[@id="displayName"])`|
|When I enter `<pass>` in field located `By.xpath(//*[@id="password"])`|
|When I click on element located `By.xpath(//span[text()='Зарегистрироваться'])`|
|When I wait until element located `By.xpath(//*[@id="content"]/div/div/header/img)` appears|
|When I save response header 'token' value to STORY variable 'tokenHeader'|
Examples:
|email|firstname|lastname|pass|
|#{generate(regexify '[abcdefghigk]{10}')}|#{generate(Name.firstName)}|#{generate(Name.lastName)}|12345678|


Scenario: Use API for Trello Board creation
Given request body: {
defaultLists: true
idOrganization: "60bd09d4e68f891c57c0b1d5"
name: "Working desktop"
prefs_background_url: "https://images.unsplash.com/photo-1622564184875-534328710abc?ixid=Mnw3MDY2fDB8MXxjb2xsZWN0aW9ufDF8MzE3MDk5fHx8fHwyfHwxNjIyOTk3Mzgy&ixlib=rb-1.2.1&w=2560&h=2048&q=90"
prefs_permissionLevel: "org"
prefs_selfJoin: true
token: "${tokenHeader}"
}
When I issue a HTTP POST request for a resource with the URL 'https://trello.com/1/boards'
Then the response code is equal to '200'