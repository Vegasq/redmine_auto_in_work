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
