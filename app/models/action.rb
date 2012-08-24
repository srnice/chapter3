class Action
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Serializers::JSON
  include ActiveModel::Serializers::Xml
  
  attr_accessor :actionId, :actionType, :actionProperty
  attr_accessor :actionStatus, :actionCommand, :dependencies
  
  validates_presence_of :actionType
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end
