# HelpMeWin

HelpMeWin is an open source repository with web automation programs for purchasing products from various websites.

Programmers can input there info to purchase on their own

All programs are in their first stage, meaning that there are some bugs and sometimes one needs to do some self tinkering.

Please feel free to submit any improvements to the programs or any other sites that you have built!

More sites with different languages will be added shortly

# Tips

- sleep commands may need to be adjusted to reflect your personal internet speed
- for sites with captchas the program will pause to allow you to manually complete
- all commands for completing purhcases are commented out by default
- Add personal info into the keys object

### Clone the repository

```shell
git clone git@github.com:davidgreenspan15/HelpMeWin.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize program

```shell
ruby <filename>
```
