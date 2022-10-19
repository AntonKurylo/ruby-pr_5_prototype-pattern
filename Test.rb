class Klass
  attr_accessor :str, :time
end

s1 = Klass.new
s1.str = "Hello"
# Метод clone - створює поверхневу копію obj – копіюються змінні екземпляра obj, але не об'єкти, на які вони посилаються.
s2 = s1.clone
s2.str[1, 4] = "i"

puts s1.inspect
puts s2.inspect
