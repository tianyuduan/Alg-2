class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev = @next
    self.key = nil
    self.val = nil
  end
end

class LinkedList
 include Enumerable

  def initialize
    @head = Node.new
   @tail = Node.new
   @head.next = @tail
   @tail.prev = @head
    ##sets head  of next to tail
    ##sets tail of prev to head
  end

  def [](i)
    self.each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
    #if the first node is empty return nil otherwise return head.first
  end

  def last
    empty? ? nil : @tail.prev

  end

  def empty?
    @head.next == @tail #this is the intialized state
    # return true
    # if the next head equals tail, return empty otherwise false
  end

  def get(key)
    self.each { |linklist| return linklist.val if linklist.key == key }
   nil
  end

  def include?(key)
    self.any? {|linklist| linklist.key == key}
    #searches class for key
  end

  def append(key, val)
    self.each { |linkelist| return linkelist.val = val if linkelist.key == key }

     new_node = Node.new(key, val)

     @tail.prev.next = new_node
     new_node.prev = @tail.prev
     new_node.next = @tail
     @tail.prev = new_node
     new_node

  end

  def update(key, val)

  end

  def remove(key)
    self.each do |linkedlist|
      if linkedlist.key == key
        linkedlist.prev.next = linkedlist.next
        linkedlist.next.prev = linkedlist.prev
        linkedlist.next, linkedlist.prev = nil, nil
        return linkedlist.val
      end
    end

    nil
  end

  def each
    current_node = @head.next
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
