#!/usr/bin/env ruby

{
  '**/*.html' => {
    %r{<nav[> ].*?</nav>}m => '',
    %r{<svg-wrapper[> ].*?</svg-wrapper>}m => '',
    %r{<footer[> ].*?</footer>}m => ''
  },
  '*.html' => {
    '/_bridgetown/static' => '_bridgetown/static'
  },
  'docs/*.html' => {
    '/_bridgetown/static' => '../_bridgetown/static'
  },
  'docs/*/*.html' => {
    '/_bridgetown/static' => '../../_bridgetown/static'
  }
}.each do |glob, transformations|
  transformations.each do |pattern, replace|
    Dir[glob].each do |file|
      File.read(file).then do |html|
        File.write(file, html.gsub(pattern, replace))
      end
    end
  end
end
