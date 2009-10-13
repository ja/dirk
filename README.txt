Dirk
    by James Andrews
    http://jamesandre.ws

== DESCRIPTION:

Dirk allows you to create models in your application which are based on files in the file system. It essentially uses the file system as a kind of hierarchical database. This has the advantage of not requiring a database for deployment and also allowing content to be delivered using version control software or simply by copying simple files arond.

* It is suited to small applications, particularly ones that serve up images or other files, e.g. gallery sites.

* It is not suited for high volumes of data or data that is being changed repeatedly.

== FEATURES/PROBLEMS:

* Will recursively traverse all non-system files
* Relies on built in methods for image processing
* Currently doesn't support for reading utf-8 attributes in files
* Support for caching of query attributes/results

== SYNOPSIS:

  @news = Dirk.new("news")

== REQUIREMENTS:

* FIXME (list of requirements)

== INSTALL:

* sudo gem install dirk
* mkdir YOUR-APP-ROOT/public/data

== LICENSE:

Copyright (c) 2009 James Andrews

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
