require_relative 'p04_linked_list'

class LinkedList

def reverse
  # test = LinkedList.new
  current_node = @tail.prev
  until current_node == @head
    yield current_node
    current_node = current_node.prev
  end
end
end

p test = LinkedList.new
