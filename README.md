neko on nginx
=============

this is an example that sets up an example server that runs a web app
written in [haxe](http://haxe.org) and compiled to
[neko](http://nekovm.org) served by [nginx](http://nginx.org) via
[fastcgi](http://fastcgi.com) with processes spawned by
[supervisord](http://supervisord.org) hosted on
[openshift](http://openshift.redhat.com).

1. create an [openshift](http://openshift.redhat.com) account.

2. install the openshift client tools (rhc).

3. create a new domain

    rhc domain create [namespace] --rhlogin [login]

4. create a new application.  it will automatically clone into a subdirectory.

    rhc app create [appname] --type diy-0.1 --rhlogin [login]
    cd [appname]

5. add this as an upstream repository

    git remote add upstream -m master git://github.com/ianxm/openshift-neko-nginx
    git pull -s recursive -X theirs upstream master

6. push to the cloud
   
    git push

7. wait a while.  on the first push it'll install and configure all of
   the tools it needs.  many of them are compiled from source and take
   some time.  it'll also link the neko bytecode (hello.n) into a
   standalone executable (index.fcgi)

8. when it's done, test your new site hosted on the cloud.  you can
   request a static page with http://[appname]-[namespace].rhcloud.com
   to check if the server is up.  you can check that neko is running
   with http://[appname]-[namespace].rhcloud.com/hello?var=val.
