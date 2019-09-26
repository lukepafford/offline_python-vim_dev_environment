# offline_python-vim_dev_environment
Shell script for creating an archive that contains Python and Vim files.

Working in a disconnected environment can make tracking dependencies hard.
I created this script which is highly tailored to fit my needs for creating a
single archive of dependencies that I can copy.

The script will download/copy the following:

* Download python packages specified in the `requirements.txt` file.
* Copy your `~/.vim` directory to `.vim` .
* Copy explicit "rc" files specified in the `rcFiles` variable in
* `create-dev-archive.sh`.

The archive will be created inside `build/dev-environment.tar.gz`.
