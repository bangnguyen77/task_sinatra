require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add task list / add task form page that displays for route "/"', {:type => :feature}) do

  it('returns the tasks') do
    visit('/')
    expect(page).to have_content('Enter task description')
  end

  it('displays a task after it is saved') do
    visit('/')
    fill_in('description', :with => "first task")
    click_button('Add')
    expect(page).to have_content("first task")
  end

  it('appends the last saved task to the end of the task list and redisplay the list') do
    visit('/')
    fill_in('description', :with => 'task one')
    click_button('Add')
    fill_in('description', :with => 'task two')
    click_button('Add')
    expect(page).to have_content("task one")
    expect(page).to have_content("task two")
  end

end
