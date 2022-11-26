# Dash Docset for Bridgetown

## Download

No releases yet, there's still too much room for improvements. However, you can download the `bt.docset` artefact of the [latest successful workflow run](https://github.com/svoop/bridgetown-docset/actions).

## Development

Install [Ruby](https://www.ruby-lang.org) and [Dashing](https://github.com/technosophos/dashing#readme), then...

```bash
# Set tag
TAG=$(cat tag.txt)

# Checkout tag
git clone https://github.com/bridgetownrb/bridgetown.git source
cd source
git checkout tags/$TAG -b branch-$TAG

# Relax Ruby version
echo "ruby-3.0" >bridgetown-website/.ruby-version

# Direnv
echo "use ruby" >bridgetown-website/.envrc

# Build website
cd bridgetown-website
bundle install
yarn install
bridgetown deploy

# Transform content
cd output
find . -name index.html -exec rm {} +
../../../transform.rb

# Build docset
cp ../../../dashing.json ../../../icon.png .
dashing build bridgetown

# Install docset
open bt.docset
```

## Action

The workflow reads the tag to build the docset for from `tag.txt`.
