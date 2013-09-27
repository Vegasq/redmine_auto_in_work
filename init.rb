require 'redmine'

Rails.application.config.to_prepare do
  require_dependency 'issue'
  unless Issue.included_modules.include? RedmineAutoInWork::IssuePatch
    Issue.send(:include, RedmineAutoInWork::IssuePatch)
  end
end

Redmine::Plugin.register :redmine_auto_in_work do
  name 'Redmine Auto In Work'
  author 'Nikolay Yakovlev'
  description 'Automatically sets InWork when done more then 0'
  version '0.0.1'
  url ''
  author_url ''
end
