require_relative 'Prototype'
require_relative 'ComponentWithBackReference'

p1 = Prototype.new
p1.primitive = 245
p1.component = "Hello"
p1.circular_reference = ComponentWithBackReference.new(p1)

p2 = p1.clone

if p1.primitive == p2.primitive
  puts "Primitive field values have been carried over to a clone."
else
  puts "Primitive field values have not been copied."
end

if p1.component.equal?(p2.component)
  puts "Simple component has not been cloned."
else
  puts "Simple component has been cloned."
end

if p1.circular_reference.equal?(p2.circular_reference)
  puts "Component with back reference has not been cloned."
else
  puts "Component with back reference has been cloned."
end

puts "\np1.id = #{p1.object_id}, p2.id = #{p2.object_id}"
puts "p1.primitive = #{p1.primitive}, p2.primitive = #{p2.primitive}"
puts "p1.component = #{p1.component}, p2.component = #{p2.component}\n"
puts "p1.circular_reference = #{p1.circular_reference}, p2.circular_reference = #{p2.circular_reference}"
