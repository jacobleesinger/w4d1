require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s
  begin
  puts RestClient.post(
    url,
    { user: { name: "timmy"} }
  )
  rescue RestClient::Exception "something fucked up"
  end
end

create_user
