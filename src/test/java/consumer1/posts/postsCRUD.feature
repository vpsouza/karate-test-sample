Feature: Post CRUD Test

Background:
* url demoBaseUrl

Scenario: Create a new Post, check if it's created as expected, update it's title and then delete the post

Given path '/posts'
And request {title: "Testing with Karate Knocks", author: "Vinicius Piedade de Souza" }
When method post
Then status 201
And match response contains { id: '#number', title: "Testing with Karate Knocks", author: "Vinicius Piedade de Souza"}
And def createdPost = response

Given path '/posts', createdPost.id
When method get
Then status 200
And response contains createdPost

Given path '/posts', createdPost.id
And def putPayload = ( createdPost )
And set putPayload.title = "New way to do Integration Tests with Karate"
When method put
Then status 200
And response contains { title : "New way to do Integration Tests with Karate" }

Given path '/posts', createdPost.id
When method delete
Then status 200