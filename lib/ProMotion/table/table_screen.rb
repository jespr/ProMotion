module ProMotion
  class TableScreen < TableViewController
    include ProMotion::ScreenModule
    include ProMotion::Table

    def tableView(table_view, viewForHeaderInSection: index)
      section = section_at_index(index)

      if section[:title_view]
        klass      = section[:title_view]
        view       = klass.alloc.init
        raise "#{klass} must have a 'title' accessor" unless view.respond_to?(:title)
        view.title = section[:title]
        view
      else
        nil
      end
    end

    def tableView(table_view, heightForHeaderInSection: index)
      section = section_at_index(index)

      if section[:title_view] || (section[:title] && !section[:title].empty?)
        section[:title_view_height] || tableView.sectionHeaderHeight
      else
        0.0
      end
    end
  end
end
