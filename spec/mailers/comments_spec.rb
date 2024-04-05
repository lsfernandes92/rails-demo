require "rails_helper"

RSpec.describe CommentsMailer, type: :mailer do
  describe "submitted" do
    let(:mail) { CommentsMailer.submitted }

    it "renders the headers" do
      expect(mail.subject).to eq("Submitted")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
