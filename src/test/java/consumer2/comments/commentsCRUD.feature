Feature: Post CRUD Test

Background:
* url demoBaseUrl

Scenario: Create a new post comment, check if it's created as expected, update it's title and then delete the post comment

Given path '/comments'
And request { body: 'This is an awesome post!', postId: 1 }
When method post
Then status 201
And match response contains { id: '#number' , body: 'This is an awesome post!', postId: 1 }
And def createdComment = response

Given path '/comments' , createdComment.id
When method get
Then status 200
And response contains createdComment

Given path '/comments' , createdComment.id
And def putPayload = ( createdComment )
And set putPayload.body = 'Edited my awesome comment!'
When method put
Then status 200
And response contains { body : 'Edited my awesome comment!' }

Given path '/comments' , createdComment.id
When method delete
Then status 200