xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Articles"
    xml.description "Articles from blogger"
    xml.link "/articles"

for post in @articles
  xml.item do
    xml.title post.title
    xml.description post.body
    xml.pubDate post.created_at.to_s(:rfc822)
    xml.link "/articles/#{post.id}"
    xml.guid "/articles/#{post.id}"
    xml.icon "/favicon.ico"
   end
end
end
end
