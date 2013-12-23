require 'reloader/sse'

class MessageController < ApplicationController
	include ActionController::Live

	def send_message
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Reloader::SSE.new(response.stream)
    begin
      loop do
        sse.write({ :time => Time.now })
        sleep 1
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
    response.stream.close
  end

end
