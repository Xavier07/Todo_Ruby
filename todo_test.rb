require 'minitest/autorun'
require 'minitest/pride'
require 'awesome_print'
require File.join(File.dirname(__FILE__), 'todo.rb')
 
describe Item do
 
  before do
    @item = Item.new('New todo item @home')
  end
 
  it 'assigns a text value for the todo' do
    @item.text.must_equal 'New todo item'
  end
 
  it 'assigns a context from the todo value' do
    @item.context.must_equal '@home'
  end
 
end
 
describe Todo do
 
  before do
    @todo = Todo.new
    @todo.clear!
    @todo.add 'Take the dog for a walk'
    @todo.add 'Pay lease bill @work'
    @todo.add 'Buy Duck Typing from RubyRags @home'
    @todo.add 'Buy Ruby Nerd from RubyRags @home'
  end
 
  it "finds the file path of the todo list" do
    @todo.file.must_equal File.expand_path('.todos')
  end
 
  it "adds the todo to the stack" do
    @todo.items.size.must_equal 4
  end
 
  it "creates a hash of attributes from the todo items" do
    @todo.to_hash.must_equal({
        :@next => ["Take the dog for a walk"],
        :@work => ["Pay lease bill"],
        :@home => ["Buy Duck Typing from RubyRags", "Buy Ruby Nerd from RubyRags"]
      })
  end
 
  it 'deletes a todo' do
    @todo.delete(2).text.must_equal "Pay lease bill"
    @todo.items.size.must_equal 3
  end
 
  it 'completes a todo' do
    @todo.done(2).context.must_equal "@done"
  end
 
end