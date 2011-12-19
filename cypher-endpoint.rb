require 'sinatra'
require 'rest-client'
require 'json'

rest = RestClient::Resource.new(ENV['NEO4J_URL'])

post '/raw-cypher' do
    data = request.body.read;
    begin
      data = JSON.parse(data)
    rescue
    end 
    data = {:query => data } unless data.kind_of?(Hash)
    rest["/db/data/ext/CypherPlugin/graphdb/execute_query"].post data.to_json, 
                 {:accept=>"application/json",:content_type=>"application/json"}
end
