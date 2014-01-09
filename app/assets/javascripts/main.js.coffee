# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	window.MessageHandler = new MessageHandler()
class MessageHandler

	constructor: () ->
		@source = new EventSource('/message')

		@source.addEventListener('message', (e) ->
			$('.price').html(e.data)
		)