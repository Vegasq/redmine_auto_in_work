module RedmineAutoInWork
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)

      base.class_eval do
        before_save :update_status
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def update_status
      st4 = IssueStatus.find(5)
      st5 = IssueStatus.find(6)
      if self.status != st4 and self.status != st5
        # self.done_ratio = 100 if self.status.is_closed?
        if self.done_ratio > 0 and self.done_ratio < 100
          self.status = IssueStatus.find(2)
        end
        if self.done_ratio == 100
          self.status = IssueStatus.find(3)
        end
      end
    end
  end
end
