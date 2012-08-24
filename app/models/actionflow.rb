require 'net/http'

class Actionflow
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  extend  ActiveModel::Translation
  
  attr_accessor :name, :actions, :dependencies, :status

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
      if key == "actions"
        tmpActions = []
        value.each do |action|
          tmpActions << Action.new(action)
        end
        send("actions=", tmpActions)
      end
    end
  end
  
  def persisted?
    false
  end
  
  def self.all
    str = Net::HTTP.get(URI("http://20.20.20.54:8080/api/actionflows.json"))
    obj = ActiveSupport::JSON.decode(str)
    actionflows = obj['actionflows']
    actionflows
  end
  
  def self.find(id)
    obj = self.all
    obj.each { |actionflow|
      if actionflow["id"] == id
        return actionflow
      end
    }
  end
  
end