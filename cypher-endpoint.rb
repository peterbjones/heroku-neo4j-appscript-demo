require 'sinatra'
require 'rest-client'
require 'json'

rest = RestClient::Resource.new(ENV['NEO4J_URL'])

post '/raw-cypher' do
    data = {:query=>request.body.read }
    rest["/db/data/ext/CypherPlugin/graphdb/execute_query"].post data.to_json, 
                 {:accept=>"application/json",:content_type=>"application/json"}
end
