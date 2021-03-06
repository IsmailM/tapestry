class UserLog < ActiveRecord::Base
  stampable
  acts_as_paranoid_versioned :version_column => :lock_version

  belongs_to :user
  belongs_to :enrollment_step
  belongs_to :controlling_user, :class_name => 'User'

  validates_presence_of :user_id

  attr_accessible :user, :comment, :user_comment, :enrollment_step, :origin, :controlling_user, :info

  serialize :info, OpenStruct

  after_initialize :set_default_info

  def news_feed_date
    if self.info && self.info.news_feed_date
      self.info.news_feed_date
    else
      self.created_at
    end
  end

  private

  def set_default_info
    self.info ||= OpenStruct.new
  end
 end
