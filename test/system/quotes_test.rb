require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do 
    @quote = quotes(:first)
  end

  test 'creating a new Quote' do
    # when we visit index page we expect to see quotes tect as title
    visit quotes_path

    assert_selector 'h1', text: 'Quotes'

    # when we click on new quote we expect to see title New quote

    click_on 'New quote'
    attr_selector 'h1', text: 'New quote'

    # when we fill in name input with 'Capybara quote' and we click on "create quote"
    fill_in 'Name', with: 'Capybara quote'
    click_on 'Create quote'

    # we expect to see index page with title "quotes" and see our "capybara quote" added to list
    assert_selector 'h1', text: 'Quotes'
    assert_text 'Capybara quote'
  end

  test 'Showing a quote' do
    visit_quotes_path
    click_link @quote.name

    assert_selector 'h1', text: @quote.name
  end

  test 'updating a quote' do
    visit_quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'edit', match: :first
    assert_selector 'h1', text: 'Edit quote'

    fill_in 'Name', with: 'Updated quote'
    click_on 'Update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated quote'
  end

  test "deleting a quote" do
    visit_quotes_path
    assert_text @quote.name

    click_on "delete", match: :first
    assert_text @quote.name
  end
end
