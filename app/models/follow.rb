class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true
  has_many :users
  belongs_to :user

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  def block!
    self.update_attribute(:blocked, true)
  end
  
  

end
