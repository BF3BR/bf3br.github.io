require "jekyll-spark"

module Jekyll
    # Create your component class
    class SectionComponent < ComponentBlock
        def template(context)
            content = @props["content"]
            title = @props["title"]
            author = @props["author"]
            
            if author then
                render = %Q[
                    <div class="post-section">
                        <div class="post-section-title">
                            <h2>
                                #{title}
                            </h2>
                            <div class="author">by #{author}</div>
                        </div>
                        <div class="post-section-content">
                            #{content}
                        </div>
                    </div>
                ]
            else
                render = %Q[
                    <div class="post-section">
                        <div class="post-section-title">
                            <h2>
                                #{title}
                            </h2>
                        </div>
                        <div class="post-section-content">
                            #{content}
                        </div>
                    </div>
                ]
            end
        end
    end
end

# Register your component with Liquid
Liquid::Template.register_tag(
    "Section", # Namespace your component
    Jekyll::SectionComponent, # Pass your newly created component class
)
