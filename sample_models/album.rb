class Album
  include Mongoid::Document
  include Mongoid::TimeStamp

  field :title # @readwrite @example ExampleTitle!

  has_many :photos
  belongs_to :user
end