module ProMotion
  class CustomSectionTableScreen < TableViewController
    include ProMotion::ScreenModule
    include ProMotion::Table

    def tableView(table_view, viewForHeaderInSection: index)
      # raise "section_view must be defined #{section_at_index(index)}" unless section_at_index(index) && section_at_index(index)[:section_view]
      return nil unless section_at_index(index) && section_at_index(index)[:section_view]
      if section_at_index(index) && section_at_index(index)[:section_view]
        klass = section_at_index(index)[:section_view]
        view = klass.alloc.initWithFrame(CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.blueColor
        view
      else
        nil
      end
    end

    def tableView(table_view, heightForHeaderInSection: index)
      if section_at_index(index) && section_at_index(index)[:section_view]
      return tableView.sectionHeaderHeight
      else
        return 0.0
      end
    end
  end
end
