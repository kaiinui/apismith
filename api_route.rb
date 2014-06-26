authenticate :users do
  models :photo, :paging => 20 do
    post :upload # @description
  end
  models :album
end

# then routes
#   CRUD /users/auth
#   List /photos/pages/:page_number
#   CRUD /photos/:id
#   POST /photos/:id/upload
#   List /albums
#   CRUD /albums
# it will be served by automatically generated controllers (only do List/CRUD)

# 1. Provides Rack based API
# 2. Generates JSONSchema
# then generates Doc
#  => automatically List/Get/Post/Patch/Delete
#  => can test API call in the doc interactively
#  => fetches attributes info from schema.rb or Mongoid fields
# so that you can use many dev-goods provided by rack-json_schema