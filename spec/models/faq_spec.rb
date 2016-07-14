require 'rails_helper'

RSpec.describe Faq, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_presence_of(:answer) }
  end

  it "has valida fatory" do
    expect(build(:faq)).to be_valid
  end
end
