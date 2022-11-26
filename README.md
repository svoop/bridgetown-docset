# Dash Docset for Bridgetown

## Development

Install [Ruby](https://www.ruby-lang.org) and [Dashing](https://github.com/technosophos/dashing#readme), then...

```bash
# Set tag
TAG="v1.1.0"

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
bridgetown build

# Build docset
cd output
find docs/ -name index.html -exec rm {} \;
cp ../../../dashing.json ../../../icon.png .
dashing build bridgetown

# Install docset
open bt.docset
```
