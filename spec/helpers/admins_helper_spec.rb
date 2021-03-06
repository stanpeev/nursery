require 'rails_helper'

RSpec.describe AdminsHelper, type: :helper do
  describe "#get_title" do
    it "returns question as title for faq" do
      faq = create(:faq)
      expect(get_title(faq)).to eq faq.question
    end

    it "returns generated text as title for event" do
      closure = create(:event)
      expect(get_title(closure)).to eq event_text(closure)
    end

    it "returns name as title for newsletter" do
      newsletter = create(:newsletter)
      expect(get_title(newsletter)).to eq newsletter.name
    end

    it "returns parent's full name as title for parent" do
      parent = create(:parent)
      expect(get_title(parent)).to eq parent_full_name(parent)
    end

    it "returns admin username as title for admin" do
      admin = create(:admin)
      expect(get_title(admin)).to eq admin.username
    end
  end

  describe "#event_text" do
    it "returns dates as text" do
      closure = create(:event)
      expect(event_text(closure)).to eq "From #{closure.start_date.strftime("%e %B")} to #{closure.end_date.strftime("%e %B %Y")}"
    end
    it "returns text for single date" do
      single_day_closure = Event.create!(start_date: Date.today, end_date: Date.today, description: "Single day")
      expect(event_text(single_day_closure)).to eq "Day off on #{single_day_closure.start_date.strftime("%e %B")}"
    end
  end

  describe "#parent_full_name" do
    it "returns parent full name" do
      parent = create(:parent)
      expect(parent_full_name(parent)).to eq "#{parent.title} #{parent.first_name} #{parent.last_name}"
    end
  end
end
