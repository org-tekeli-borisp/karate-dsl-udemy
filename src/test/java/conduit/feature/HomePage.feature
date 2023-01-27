Feature: Test for the home page

  Scenario: Get all tags
    Given url 'https://conduit.productionready.io/api/tags'
    When method Get
    Then status 200

  Scenario: Get 10 articles
    Given param limit = 10
    Given param offset = 0
    Given url 'https://conduit.productionready.io/api/articles'
    When method Get
    Then status 200
