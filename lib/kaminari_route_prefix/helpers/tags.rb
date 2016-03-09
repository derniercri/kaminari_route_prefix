require 'kaminari/helpers/tags'

module KaminariRoutePrefix
  module TagExtensions
    def initialize_route_set(template, options = {})
      @route_set = @options.delete(:route_set)
    end

    def page_url_for_route_set(page)
      @route_set.url_for @params.merge(@param_name => (page <= 1 ? nil : page), only_path: true)
    end
  end
end

Kaminari::Helpers::Tag.prepend KaminariRoutePrefix::TagExtensions

class Kaminari::Helpers::Tag
  alias original_initialize initialize
  alias original_page_url_for page_url_for

  def initialize(*args)
    original_initialize(*args)
    initialize_route_set(*args)
  end

  def page_url_for(page)
    if @route_set
      page_url_for_route_set(page)
    else
      original_page_url_for(page)
    end
  end
end
