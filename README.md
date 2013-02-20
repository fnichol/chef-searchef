# <a name="title"></a> chef-searchef

[![Build Status](https://secure.travis-ci.org/fnichol/chef-searchef.png?branch=master)](http://travis-ci.org/fnichol/chef-searchef)

## <a name="description"></a> Description

Chef cookbook to use [Searchef][searchef], a library to stub Chef searches. Cool, no?

## <a name="usage"></a> Usage

### <a name="usage-with-a-recipe"></a> With A Custom Recipe

coming soon...

For a more detailed example, see this cookbook's [test recipe][test_recipe].

## <a name="requirements"></a> Requirements

### <a name="requirements-chef"></a> Chef

Tested on 10.18.2 but newer and older version should work just
fine. File an [issue][issues] if this isn't the case.

### <a name="requirements-platform"></a> Platform

The following platforms have been tested with this cookbook, meaning that
the recipes and LWRPs run on these platforms without error:

* ubuntu (12.04)

Please [report][issues] any additional platforms so they can be added.

### <a name="requirements-cookbooks"></a> Cookbooks

There are **no** external cookbook dependencies.

## <a name="installation"></a> Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

### <a name="installation-community"></a> From the Opscode Community Site

To install this cookbook from the Opscode Community Site, use the *knife*
command:

    knife cookbook site install seachef

### <a name="installation-berkshelf"></a> Using Berkshelf

[Berkshelf][berkshelf] is a cookbook dependency manager and development
workflow assistant. To install Berkshelf:

    cd chef-repo
    gem install berkshelf
    berks init

To use the Opscode Community Site version:

    echo "cookbook 'searchef'" >> Berksfile
    berks install

Or to reference the Git version:

    repo="fnichol/chef-searchef"
    latest_release=$(curl -s https://api.github.com/repos/$repo/git/refs/tags \
    | ruby -rjson -e '
      j = JSON.parse(STDIN.read);
      puts j.map { |t| t["ref"].split("/").last }.sort.last
    ')
    cat >> Berksfile <<END_OF_BERKSFILE
    cookbook 'searchef',
      :git => 'git://github.com/$repo.git', :branch => '$latest_release'
    END_OF_BERKSFILE
    berks install

### <a name="installation-librarian"></a> Using Librarian-Chef

[Librarian-Chef][librarian] is a bundler for your Chef cookbooks.
To install Librarian-Chef:

    cd chef-repo
    gem install librarian
    librarian-chef init

To use the Opscode Community Site version:

    echo "cookbook 'searchef'" >> Cheffile
    librarian-chef install

Or to reference the Git version:

    repo="fnichol/chef-searchef"
    latest_release=$(curl -s https://api.github.com/repos/$repo/git/refs/tags \
    | ruby -rjson -e '
      j = JSON.parse(STDIN.read);
      puts j.map { |t| t["ref"].split("/").last }.sort.last
    ')
    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'searchef',
      :git => 'git://github.com/$repo.git', :ref => '$latest_release'
    END_OF_CHEFFILE
    librarian-chef install

## <a name="recipes"></a> Recipes

### <a name="recipes-default"></a> default

Use this recipe to set up Searchef.

## <a name="attributes"></a> Attributes

There are **no** attributes defined.

## <a name="lwrps"></a> Resources and Providers

There are **no** resources and providers in this cookbook.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

## <a name="license"></a> License and Author

Author:: [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>) [![endorse](http://api.coderwall.com/fnichol/endorsecount.png)](http://coderwall.com/fnichol)

Copyright 2013, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[berkshelf]:        http://berkshelf.com/
[chef_repo]:        https://github.com/opscode/chef-repo
[librarian]:        https://github.com/applicationsonline/librarian#readme
[searchef]:         https://github.com/fnichol/searchef
[test_recipe]:      https://github.com/fnichol/chef-searchef/blob/master/test/cookbooks/stub_searches/recipes/default.rb

[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/fnichol/chef-searchef
[issues]:       https://github.com/fnichol/chef-searchef/issues
