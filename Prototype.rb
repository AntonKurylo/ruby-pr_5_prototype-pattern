require_relative 'ComponentWithBackReference'

class Prototype
  attr_accessor :primitive, :component, :circular_reference

  def initialize
    @primitive = nil
    @component = nil
    @circular_reference = nil
  end

  # @return [Prototype]
  def clone
    other = Prototype.new
    other.primitive = self.primitive
    other.component = deep_copy(self.component)

    # Клонирование объекта, который имеет вложенный объект с обратной ссылкой,
    # требует специального подхода. После завершения клонирования вложенный
    # объект должен указывать на клонированный объект, а не на исходный объект.
    other.circular_reference = deep_copy(self.circular_reference)
    other.circular_reference.prototype = other
    return other
  end

  # Нередко метод deep_copy использует хак «маршалинг», чтобы создать глубокую
  # копию объекта. Однако это медленное и неэффективно, поэтому в реальных
  # приложениях используйте для этой задачи соответствующий пакет.
  #
  # @param [Object] object
  private def deep_copy(object)
    # Marshal.dump позволяет сериализовать объект в поток байтов,
    # который можно сохранить и десериализовать в другом процессе Ruby.
    # Marshal.load для восстановления исходного объекта из потока байтов.
    #
    # Восстановленный объект имеет другой object_id, чем изначальный объект,
    # что означает, что это другой объект, но он содержит те же данные.

    Marshal.load(Marshal.dump(object))
  end
end
