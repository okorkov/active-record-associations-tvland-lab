class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    fullname = "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    char = Character.all.where("actor_id = #{self.id}")[0]
    show = Show.all.where("id = #{char.show_id}")[0]
    "#{char.name} - #{show.name}"
  end

end