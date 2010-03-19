module PageSelecta
  
  class Page

    attr_reader :mixins, :url
    
    def initialize driver, content, url
      @mixins = []
      @browser = driver
      @document = Nokogiri::HTML(content)
      @url = url
    end
    
    # Pages are valid by default -
    # specific mixins should change this behaviour
    # to require certain elements on the page
    # then you will get an error message saying "Page did not have mixin #{name}"
    #eg.
    # def valid?
    #   has_selector('some_element_selector')
    # end
    def valid?; true; end
    
    def has_selector? selector
      @document.css(selector).length > 0
    end
    
  end
  
end