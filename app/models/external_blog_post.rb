class ExternalBlogPost < ActiveRecord::Base
  validates_uniqueness_of :post_url, :scope => :feed_url

  def news_feed_date
    self.posted_at
  end
  def news_feed_title
    self.title
  end
  def news_feed_raw_summary
    self.description.gsub('src="http://stats.wordpress.com',
                          'src="https://stats.wordpress.com')
  end
  def news_feed_link_to
    self.post_url
  end
end
