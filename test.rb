require "net/http"
require "time"

Thread.abort_on_exception = true
Thread.new do
  begin
    while(true)
      sleep 0.5
      pid = File.read("nginx/nginx.pid").strip.to_i
      puts "\n#{Time.now.iso8601} Reloading nginx (#{pid})"
      Process.kill("HUP", pid)
    end
  rescue => e
    puts e.inspect
    puts e.backtrace.join("\n")
    exit 1
  end
end

Net::HTTP.start("127.0.0.1", 8080) do |http|
  i = 0
  while(true)
    i += 1

    begin
      response = http.get("/")

      if(response.code == "200")
        print "."
        print "\n" if(i % 80 == 0)
      else
        puts "\nERROR: #{response.code}"
        puts response.body
      end
    rescue => e
      puts "\nERROR: #{e.class} - #{e}"
    end
  end
end
