fa-dev-box
==========

FrontAccounting Development box using Vagrant (or not)

GOAL
========

The purpose of this project is to provide a *plug and play* box allowing to install and run FrontAccounting  with virtually no configuration. Just download the box and type `make`, the point your favorite webbrowser to `http:localhost:8080` and that's it.
*fa-box-dev* use Vagrant to run a linux virtual box, installing and configuring everything which is need to run FA.
As the database is run in a virtual box, it doesn't interfere with your local mysql installation or between different fa boxes, meaning you can use the same database configuration and credentials for different boxes, but each box will use it's own  database.
Also, the virtual box uses the same files as the initial ones, so you can develop as normally (and ignore the virtual box), but every change to a file will be reflected in real time to the virtual box.
In fact, you won't really see the virtual box. You can develop on your computer as normally, the virtual box is only there to launch the HTTP server (and the database).
Finaly, *fa-box-dev* also splits the tradional FA distribution into the real or _static_ source code from the private or  dynamic part (data, configuration). This make testing different version with the same database, or testing the same version with different datbases much easier. You can setup different configuration , clone them , share them etc ...


BENEFITS
========
*fa-box-dev* as been mainly designed for development purpose, allowing different versions of FA to be hosted on the same computer without having to go through the hasles of creating a new database for each version.
*fa-box-dev* also allows sql bootstrap which will pre-populate the sql database.

Finaly, *fa-dev-box* doesn't need to be used in a Virtual box but having this separation between source code and private data is still really handy.

SUBMODULES
==========
*fa-box-dev* is a git meta-project, using submodules (see `git submodule`) to separate the FA source code from private data.
One of the benefit of using submodules is it keep the `fa` subdirectory separate from the *fa-box_dev* so you can develop inside it as normal and pull and push to your favorite git repository. It also prevent you to pushing my mistake private data to a public repo. As long as your *fa-box-private* is private, even if you push your version of *fa-box-dev* using private data on a public repo, nobody would be able to access those private data as they are not part of *fa-box-dev* but only leaves inside your private repository.

DISCLAIMER
==========
This project is a work in progress, so be indulgent  and any help to make it better will be welcome.




