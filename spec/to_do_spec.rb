require('rspec')
require('to_do')

describe(Task) do
before(:each) do
  Task.clear()
end

  describe('#initialize') do

    it('instantiates a task object') do
      task = Task.new("something")
      expect(task.class).to eq(Task)
    end

    it('creates a task object which contains a description') do
      task = Task.new("some text")
      expect(task.description()).to eq("some text")
    end
  end

  describe('#description') do
    it('returns the task description') do
      task = Task.new("learn Ruby")
      expect(task.description()).to eq('learn Ruby')
    end

    it('returns empty string when creating a new task with empty string') do
      task = Task.new("")
      expect(task.description()).to eq("")
    end
  end

  describe('.all') do

    it('is empty at first') do
      expect(Task.all()).to eq([])
    end

    it('returns all saved tasks') do
      task1 = Task.new("first task")
      task2 = Task.new("second task")
      task1.save()
      task2.save()
      expect(Task.all()).to eq([task1, task2])
    end
  end

  describe('#save') do

    it('saves the current task to the Task list') do
      # Task.clear()
      task = Task.new("something")
      task.save()
      expect(Task.all()).to eq([task])
    end

    it('appends the last saved task to the task list on save') do
      task1 = Task.new("one")
      task2 = Task.new("two")
      task1.save()
      task2.save()
      expect(Task.all().last()).to eq(task2)
    end
  end


  describe('.clear') do
    it('returns an empty task list') do
      task1 = Task.new("one")
      task2 = Task.new("two")
      task1.save()
      task2.save()
      Task.clear()
      expect(Task.all()).to eq([])
    end
  end



end
