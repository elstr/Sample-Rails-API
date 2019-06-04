# Para ejecutar estas pruebas hay que utilizar factory bot y rails generator
# 1) rails g factory_bot:model user email:stirng name:string auth_token:string
# 2) rails g factory_bot:model post title:string content:string published:boolean user:references
# 3) validar en test/factories los datos de prueba generados
# 4) utilizar faker para poder usar datos de prueba falsos pero con el formato necesario
# para probar las pruebas de post/get utilizar en la terminal RAILS_ENV=test rails c
# podemos usar post = FactoryBot.build(:post) y ver cómo crea un post
# validar si post.valid? y preguntar por post.errors

require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /post" do
    before { get "/post" }
    it "should return a list of posts" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe "with data in the DB" do
    before { get "/post" }
    # Declaro una variable posts a la que se le asigna todo lo del bloque {}
    # let es rspec / create_list es factory bot
    let(:posts) { create_list(:post, 10, published: true) }
    it "should return all the published posts" do
      payload = JSON.parse(response.body)
      puts response.body
      expect(payload.size).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /post/{id}" do
    let(:post) { create(:post, published: true) }
    before { get "/post/#{post.id}" }

    it "should return a post" do
      payload = JSON.parse(response.body)
      expect(payload.size).to_not be_nil
      expect(payload["id"]).to eq(post.id)
      expect(response).to have_http_status(200)
    end
  end
end
