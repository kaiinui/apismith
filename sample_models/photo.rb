class Photo
  include Mongoid::Document
  include Mongoid::TimeStamp

  field :image_url # @readwrite @example https://s3-ap-northeast-1.amazonaws.com/example/example.jpg @format url

  def post_upload(image) # POST /photo/:id/upload automatically calls this method
    do_something # self is already the result of Photo.find(id)

    save # => then the evaluated value will be shown in response. If it returns false values, it serves code 500.
  end

  belongs_to :album
  belongs_to :user
end