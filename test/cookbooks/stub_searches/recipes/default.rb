#
# Cookbook Name:: stub_searches
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

# include Searchef helps into this recipe
self.extend(Searchef::API)

def assert(test, msg = nil)
  msg ||= "An unnamed assertion"
  if test
    Chef::Log.info("[Searchef] PASSED: #{msg}")
  else
    Chef::Application.fatal!("[Searchef] Failed: #{msg}")
  end
end

##
# Returns 2 nodes
#
stub_search(:node, "roles:web_server").to_return([
  node_stub("web1.example.com"),
  node_stub("web2.example.com")
])

nodes = search(:node, "roles:web_server")

assert(nodes.size == 2, "Search returns 2 nodes")

##
# Returns no nodes
#
stub_search(:node, "recipes:not_much").to_return([])

nodes = search(:node, "recipes:not_much")

assert(nodes.is_a?(Array), "Result is an Array")
assert(nodes.empty?, "Result is an emtpy Array")
