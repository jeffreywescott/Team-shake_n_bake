require 'spec_helper'

describe 'voting on an answer' do
  
  context 'on a question page with answers', js: true do

    before(:each) do
      @question = create(:question)
      @question.answers << build(:answer, user: @question.user, question: @question)
      login_as(@question.user)
      visit question_path(@question)
    end

    it 'can upvote on an answer' do
      within(".answer_box") do
        click_button "up"
      end

      within(".answer_box .badge") do
        page.should have_content("1")
      end
    end

    it 'can downvote on an answer' do
      within(".answer_box") do
        click_button "dwn"
      end

      within(".answer_box .badge") do
        page.should have_content("-1")
      end
    end
  end
end
