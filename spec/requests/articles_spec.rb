require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before do
    @article = Article.create(title: "title", body: "body")
  end

  describe "GET /articles/:id" do
    context "with existing article" do

      before { get "/articles/#{@article.id}" } 

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end

    context "with non-existing article" do

      before { get "/articles/xxx" }
      
      it "handles non-exisitng article" do
        expect(response.status).to_not eq 404
        flash_message = "The Article you are looking for could not be found."
        expect(flash[:alert]).to eq flash_message
      end
    end

  end

end
