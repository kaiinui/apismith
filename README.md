apismith
========

Proof-of-concept. Not implemented yet.

`api/route.rb`
```ruby
authenticate :users do
  resources :photo, :paging => 20 do
    post :upload
  end
  resources :album
end
```

then routes

- CRUD /users/auth
- List /photos/pages/:page_number
- CRUD /photos/:id
- POST /photos/:id/upload
- List /albums
- CRUD /albums

They will be served by automatically generated controllers (only do List/CRUD)

1. Provides Rack based API
2. Generates JSONSchema

So that you can use many dev-goods provided by rack-json_schema.

`models/photo.rb`

```ruby
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
```

`models/album.rb`

```ruby
class Album
  include Mongoid::Document
  include Mongoid::TimeStamp

  field :title # @readwrite @example ExampleTitle!

  has_many :photos
  belongs_to :user
end
```
