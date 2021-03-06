module Gattica
  class Account
    include Convertible

    attr_reader :id, :updated, :title, :account_id, :account_name,
                :profile_id, :web_property_id, :goals

    def initialize(json)
      @id = json['id']
      @updated = DateTime.parse(json['updated'])
      @account_id = json['accountId']

      @title = json['name']
      @profile_id = json['id']
      @web_property_id = json['webPropertyId']
      @goals = []
    end

    def find_account_id(json)
      json['id']
    end

    def find_account_name(json)
      json['name']
    end

    def find_profile_id(json)
      json['profileId']
    end

    def set_account_name(account_feed_entry)
      if @account_id == find_account_id(account_feed_entry)
        @account_name = find_account_name(account_feed_entry)
      end
    end

    def set_goals(goals_feed_entry)
      if @profile_id == find_profile_id(goals_feed_entry)
        @goals.push({
          :active => goals_feed_entry['active'],
          :name => goals_feed_entry['name'],
          :value => goals_feed_entry['value'].to_f
        })
      end
    end    
  end
end