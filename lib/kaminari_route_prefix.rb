require 'kaminari_route_prefix/version'

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  # do nothing
end

require 'kaminari'
require 'kaminari/version'

module KaminariRoutePrefix
  require 'kaminari_route_prefix/engine' if defined? Rails
  
  require 'kaminari_route_prefix/helpers/tags'

  if Kaminari::VERSION < '2.0'
    require 'kaminari_route_prefix/helpers/action_view_extension'
  end
end
