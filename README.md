# Dash Docset for Bridgetown

## Download

No releases yet, there's still too much room for improvements. However, you can download the `bt.docset` artefact of the [latest successful workflow run](https://github.com/svoop/bridgetown-docset/actions).

## Development

Install [Ruby](https://www.ruby-lang.org), then...

```bash
# Install tools
brew install dashing

# Set tag
TAG=$(cat tag.txt)

# Checkout tag
git clone https://github.com/bridgetownrb/bridgetown.git source
cd source
git checkout tags/$TAG -b branch-$TAG

# Relax Ruby version
echo "ruby-3.3" >bridgetown-website/.ruby-version

# Direnv (if used)
echo "use ruby" >bridgetown-website/.envrc

# Build website
cd bridgetown-website
bundle install
yarn install
bridgetown deploy

# Transform content
cd output
../../../transform.rb

# Build docset
cp ../../../dashing.json ../../../icon.png .
dashing build bridgetown

# Install docset
open bt.docset
```

## Action

The workflow reads the tag to build the docset for from `tag.txt`.
