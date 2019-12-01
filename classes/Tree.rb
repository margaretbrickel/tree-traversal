require './classes/Queue.rb'

class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def depth_first_search(val)
    puts @payload
    return self if @payload == val

    @children.each do |child|
      return child.depth_first_search(val)
    end
  end

  def breadth_first_search(val)
    queue = Queue.new

    puts @payload
    return self if @payload == val
    queue.enqueue(@children)
    handle_queue(queue, val)
  end

  private

  def handle_queue(queue, val)
    new_queue = Queue.new
    while collection = queue.dequeue
      collection.each do |tree|
        
        puts tree.payload
        return tree if tree.payload == val
        new_queue.enqueue(tree.children)
      end
    end

    handle_queue(new_queue, val) if (new_queue.has_items?)
  end
end