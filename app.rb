require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/to_do')
require('pry')
require('launchy')

get('/') do
  Task.clear()
  erb(:form)
end

post('/') do
  @task = Task.new(params['description'])
  @task.save()
  erb(:form)
end
