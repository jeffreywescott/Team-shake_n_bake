FactoryGirl.define do
  factory :user do |f|
    f.sequence(:username) { |n| "Bananas#{n}" }
    f.sequence(:email) { |n| "Ipee#{n}@yellowsnow.com" }
    f.password "robot"
    f.password_confirmation { |u| u.password }
  end

  factory :question do |f|
  	user
  	f.title "a question title here"
  	f.body "lot's of stuff goes here"
  end
end