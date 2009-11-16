module Treetop
  module Runtime
    
    def run_parsing_rule(name)
      start_index = index
      
      if node_cache[name].has_key?(index)
        cached = node_cache[name][index]
        @index = cached.interval.end if cached
        return cached
      end
      
      result = yield
      
      node_cache[name][start_index] = result
      result
    end
    
  end
end
