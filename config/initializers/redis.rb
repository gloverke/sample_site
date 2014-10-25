if ENV["REDISCLOUD_URL"]
    $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
else
    $redis = Redis.new host: ENV["REDIS_HOST"], port: ENV["REDIS_PORT"]
end


heartbeat_thread = Thread.new do
  while true
    $redis.publish("heartbeat","ACK")
    sleep 10.seconds
  end
end

at_exit do
  heartbeat_thread.kill
  $redis.quit
end
