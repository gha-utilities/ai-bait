# AI Bait
[heading__top]:
  #ai-bait
  "&#x2B06; GitHub Action to encourage behavior changes from AI/ML scrapers that disrespect robots.txt"


GitHub Action to encourage behavior changes from AI/ML scrapers that disrespect robots.txt

## [![Byte size of AI Bait][badge__main__ai_bait__source_code]][honeybot__main__source_code] [![Open Issues][badge__issues__ai_bait]][issues__ai_bait] [![Open Pull Requests][badge__pull_requests__ai_bait]][pull_requests__ai_bait] [![Latest commits][badge__commits__ai_bait__main]][commits__ai_bait__main] [![License][badge__license]][branch__current__license]


---


- [:arrow_up: Top of Document][heading__top]
- [:building_construction: Requirements][heading__requirements]
- [:zap: Quick Start][heading__quick_start]
- [&#x1F9F0; Usage][heading__usage]
  - [Example GitHub Pages -- Jekyll][heading__example_github_pages_jekyll]
- [&#x1F5D2; Notes][heading__notes]
- [:chart_with_upwards_trend: Contributing][heading__contributing]
  - [:trident: Forking][heading__forking]
  - [:currency_exchange: Sponsor][heading__sponsor]
- [:card_index: Attribution][heading__attribution]
- [:balance_scale: Licensing][heading__license]


---



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


Access to GitHub Actions if using on GitHub, or manually assigning expected
environment variables prior to running `entrypoint.sh` script.


______


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Include, and modify, the following within your repository's workflow that
published to GitHub Pages

```yaml
      - name: Make something nasty for bots
        uses: gha-utilities/ai-bait@v0.0.3
        with:
          bs: 512
          count: 10000
          destination: _site/assets/ai/bait.zip
```

> :warning: be sure to update your `robots.txt` to disallow all user-agents any
> path that `destination` resolves to!


______


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this repository"


Reference the code of this repository within your own `workflow`...

### Example GitHub Pages -- Jekyll
[heading__example_github_pages_jekyll]: #example-github-pages-jekyll


**`.github/workflows/github-pages.yaml`**

```yaml
on:
  push:
    branches: [ gh-pages ]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v4
        with:
          fetch-depth: 1
          fetch-tags: true
          ref: ${{ github.head_ref }}

      # ↓ Do some site building here ↓
      - name: Setup pages
        uses: actions/configure-pages@v5.0.0
      - name: Build pages
        uses: actions/jekyll-build-pages@v1
      # ↑ Do some site building here ↑

      - name: Make _sweet_ for bots
        uses: gha-utilities/ai-bait@v0.0.3
        with:
          bs: 10g
          count: 10000
          destination: _site/assets/ai/bait.zip

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3.0.1

  deploy:
    runs-on: ubuntu-latest
    needs: build

    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}

    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4.0.5
```


______


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository may not be feature complete and/or fully functional, Pull
Requests that add features or fix bugs are certainly welcomed.

To prevent causing issues with legitimate/authorized web-scrapers, and other
tools, be sure to keep your site's `robots.txt` up to date!  Simplest option is
to tell all robots not to access the file(s) generated by AI Bait;

```
User-agent: *
Disallow: /assets/ai/bait.zip
```

To prevent duplicate deployments caused by default `gh-pages` branch behavior,
be sure to update the repository Settings → Pages → GitHub Pages → Build and
deployment → Source configuration to use "GitHub Actions"

> `https://github.com/<ACCOUNT>/<REPO>/settings/pages`


______


## Contributing
[heading__contributing]:
  #contributing
  "&#x1F4C8; Options for contributing to AI Bait and gha-utilities"


Options for contributing to AI Bait and `gha-utilities`


---


### Forking
[heading__forking]:
  #forking
  "&#x1F531; Tips for forking AI Bait"


Start making a [Fork][honeybot__fork_it] of this repository to an account that
you have write permissions for.


- Add remote for fork URL. The URL syntax is
  _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/gha-utilities/ai-bait

git remote add fork git@github.com:<NAME>/ai-bait.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```Bash
cd ~/git/hub/gha-utilities/ai-bait


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg.
> _`git push -u fork main`_ however, this will also default the `fork` remote
> for pulling from too! Meaning that pulling updates from `origin` must be done
> explicitly, eg. _`git pull origin main`_

- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is
  _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications
> before being accepted, please check the
> [dot-github](https://github.com/gha-utilities/.github) repository for
> detailed contributing guidelines.


---


### Sponsor
  [heading__sponsor]:
  #sponsor
  "&#x1F4B1; Methods for financially supporting gha-utilities that maintains AI Bait"


Thanks for even considering it!


Via Liberapay you may
<sub>[![sponsor__shields_io__liberapay]][sponsor__link__liberapay]</sub> on a
repeating basis.


Regardless of if you're able to financially support projects such as AI Bait
that `gha-utilities` maintains, please consider sharing projects that are
useful with others, because one of the goals of maintaining Open Source
repositories is to provide value to the community.


______


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)
- [GitHub Docs -- Metadata syntax for GitHub Actions `outputs` for composite actions](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions#outputs-for-composite-actions)
- [Stack Overflow -- How does one make a zip-bomb](https://stackoverflow.com/questions/1459673/how-does-one-make-a-zip-bomb)


______


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
GitHub Action to encourage behavior changes from AI/ML scrapers that disrespect robots.txt
Copyright (C) 2024 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"

[badge__license]:
  https://img.shields.io/github/license/gha-utilities/ai-bait

[badge__commits__ai_bait__main]:
  https://img.shields.io/github/last-commit/gha-utilities/ai-bait/main.svg

[commits__ai_bait__main]:
  https://github.com/gha-utilities/ai-bait/commits/main
  "&#x1F4DD; History of changes on this branch"


[honeybot__community]:
  https://github.com/gha-utilities/ai-bait/community
  "&#x1F331; Dedicated to functioning code"


[issues__ai_bait]:
  https://github.com/gha-utilities/ai-bait/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[honeybot__fork_it]:
  https://github.com/gha-utilities/ai-bait/fork
  "&#x1F531; Fork it!"

[pull_requests__ai_bait]:
  https://github.com/gha-utilities/ai-bait/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[honeybot__main__source_code]:
  https://github.com/gha-utilities/ai-bait/
  "&#x2328; Project source!"

[badge__issues__ai_bait]:
  https://img.shields.io/github/issues/gha-utilities/ai-bait.svg

[badge__pull_requests__ai_bait]:
  https://img.shields.io/github/issues-pr/gha-utilities/ai-bait.svg

[badge__main__ai_bait__source_code]:
  https://img.shields.io/github/repo-size/gha-utilities/ai-bait


[rust_home]:
  https://www.rust-lang.org/
  "Home page for Rust language"

[rust_github]:
  https://github.com/rust-lang
  "Source code for Rust on GitHub"

[sponsor__shields_io__liberapay]:
  https://img.shields.io/static/v1?logo=liberapay&label=Sponsor&message=gha-utilities

[sponsor__link__liberapay]:
  https://liberapay.com/gha-utilities
  "&#x1F4B1; Sponsor developments and projects that gha-utilities maintains via Liberapay"

