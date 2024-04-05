require "rails_helper"

RSpec.describe CommentsMailer, type: :mailer do
  describe "submitted" do
    before do
      post = Post.create!(title: "Foo title", content: "Foo post content")
      post.comments.create!(content: "Foo comment")
    end
    
    let(:first_post) { Post.first }
    let(:first_comment) { Comment.first }
    let(:mail) { CommentsMailer.submitted(first_comment) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your blog post have a new comment!")
      expect(mail.to).to eq(["blog-owner@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("You got a new comment on \"Foo title\" post!")
    end
  end

end
