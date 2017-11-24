Feature: Post CRUD Test

Background:
* url demoBaseUrl

Scenario: Create a new profile, check if it's created as expected, update it's name and then delete the profile

Given path '/profiles'
And request {name: 'vpiedade' }
When method post
Then status 201
And match response contains { id: '#number' , name: 'vpiedade' }
And def createdProfile = response

Given path '/profiles' , createdProfile.id
When method get
Then status 200
And response contains createdProfile

Given path '/profiles' , createdProfile.id
And def putPayload = ( createdProfile )
And set putPayload.name = 'vpiedadedesouza'
When method put
Then status 200
And response contains { name : 'vpiedadedesouza' }

Given path '/profiles' , createdProfile.id
When method delete
Then status 200