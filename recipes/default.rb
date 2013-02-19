#
# Cookbook Name:: searchef
# Recipe:: default
#
# Copyright 2013, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

begin
  require 'searchef'
rescue LoadError
  run_context = Chef::RunContext.new(
    Chef::Node.new, {}, Chef::EventDispatch::Dispatcher.new)
  Chef::Resource::ChefGem.new('searchef', run_context).run_action(:install)
  require 'searchef'
end

if Chef::Config[:solo]
  Chef::Log.info("Setting :node_name to '#{node['fqdn']}' for Solo mode")
  Chef::Config[:node_name] = node['fqdn']

  Chef::Log.info("Setting :client_key to nil for Solo mode")
  Chef::Config[:client_key] = nil
end

# mix Searchef helpers (stub_search, node_stub, etc.) into all recipes
class Chef
  class Recipe
    include Searchef::API
  end
end
