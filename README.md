# RIP (Ruby Insanity Preventer)

I don't like developing Ruby but I have to since we use it a lot at work. I
created this Vagrantfile and recipes because I was sick of fucking up my
OSX setup to work on some projects.

This Vagrantfile shares whatever you have in your `RIP_SYNC` environment with
the Vagrant VM.

The box comes with PostgreSQL and Redis. The PostgreSQL installation is as
insecure as it can be, there is even a superuser called `vagrant` created. Do
not, ever, deploy this setup to production.

I normally work on my projects in Emacs on my Mac but run tests etc. in the
Vagrant VM. I then cry myself to sleep for writing Ruby for more than 1 hour a
day.

## Setting it up

```
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant up
```

This will take quite a while.

Then `vagrant ssh` and get to work.

# Acknowledgments

Alisdair Sullivan for suggesting using Vagrant for dev stuff. He does it for
[Erlang](https://github.com/talentdeficit/erlang-dev). Unlike him I am able to
build Erlang on my machine.

## License

The MIT License (MIT)

Copyright (c) 2014 Omar Yasin

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
