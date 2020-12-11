class Show < ActiveRecord::Base

  has_many :characters
  belongs_to :network

  def actors_list
    characters = Character.all.where("show_id = #{self.id}")[0]
    actors = Actor.all.where("id = #{characters.actor_id}")
    actors.map {|actor| actor.full_name}
  end
  
end