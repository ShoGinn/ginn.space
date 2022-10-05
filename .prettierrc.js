'use strict';

module.exports = {
  bracketSpacing: false,
  singleQuote: true,
  trailingComma: 'all',
  printWidth: 120,
  overrides: [
    {
      files: ['*.html', 'layouts/_default/sitemap.xml'],
      options: {
        parser: 'go-template',
      },
    },
  ],
};
