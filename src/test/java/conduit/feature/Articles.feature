Feature: Articles

  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'
    * def email = karate.properties['email']
    * def password = karate.properties['password']
    * def uuid = java.util.UUID.randomUUID()
    * def title = "Karate DSL Udemy Course " + uuid
    * def description = "Karate DSL Udemy Course " + uuid
    * def body = "Karate DSL Udemy Course " + uuid

  Scenario: Create a new article
    Given path 'users/login'
    And request {"user":{"email": "#(email)","password":"#(password)"}}
    When method Post
    Then status 200
    * def token = response.user.token

    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article":{"tagList":[],"title":"#(title)","description":"#(description)","body":"#(body)"}}
    When method Post
    Then status 200
    And match response.article.title == title
