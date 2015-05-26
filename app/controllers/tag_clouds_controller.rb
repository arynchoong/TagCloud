class TagCloudsController < ApplicationController
  def index
    #We're changing this!
  end
  
  def tag_cloud
     tags = Tag.asc(:name)
     if tags.length > 0
        tags_by_count = Tag.desc(:count)
        maxOccurs = tags_by_count.first.count
        minOccurs = tags_by_count.last.count

        # Get relative size for each of the tags and store it in a hash
        minFontSize = 5
        maxFontSize = 100
        @tag_cloud_hash = Hash.new(0)
        tags.each do |tag| 
           weight = (tag.count-minOccurs).to_f/(maxOccurs-minOccurs)
           size = minFontSize + ((maxFontSize-minFontSize)*weight).round
           @tag_cloud_hash[tag] = size if size > 7
        end
     end
  end
end
