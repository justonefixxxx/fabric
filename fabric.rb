class Fabric

  def self.new (*args, &block)
    @cls_attr = args
    Class.new do
      def initialize (cls_attr)
        cls_attr.each do |a|
          class_eval ("@#{a} = #{a}")
        end
      end

      cls_attr.each do |attr|
        self.class_eval do
          (attr_accessor attr.to_sym)
          block.call attr if block_given?
        end
      end

    end

  end
end