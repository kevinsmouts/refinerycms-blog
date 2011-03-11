Given /^there is a blog post titled "([^"]*)" and tagged "([^"]*)"$/ do |title, tag_name|
  @blog_post = Factory(:post, :title => title, :tag_list => tag_name)
end

When /^I visit the tagged posts page for "([^"]*)"$/ do |tag_name|
  visit tagged_posts_path(tag_name.parameterize)
end

Then /^the blog post should have the tags "([^"]*)"$/ do |tag_list|
  BlogPost.last.tag_list == tag_list.split(', ')
end
