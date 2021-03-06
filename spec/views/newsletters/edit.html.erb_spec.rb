require 'rails_helper'

RSpec.describe "newsletters/edit", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do

      assert_select "input#newsletter_name[name=?]", "newsletter[name]"

      assert_select "input#newsletter_url[name=?]", "newsletter[url]"
    end
  end
end
