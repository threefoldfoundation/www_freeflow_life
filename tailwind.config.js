/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./templates/**/*.html'],
  safelist: [
    "md:-ml-16",
    "md:-ml-20",
    "md:-ml-24",
    "md:-ml-28",
    {
        pattern: /-ml-(20|24|28)/,
        variants: ['sm', 'md', 'lg', 'first:sm', 'first:md', 'first:lg'],
    },
    {
        pattern: /mr-(20|24|28)/,
        variants: ['sm', 'md', 'lg', 'first:sm', 'first:md', 'first:lg'],
    },
    {
        pattern: /-mr-(20|24|28)/,
        variants: ['sm', 'md', 'lg', 'last:sm', 'last:md', 'last:lg'],
    },
    {
        pattern: /ml-(20|24|28)/,
        variants: ['sm', 'md', 'lg', 'last:sm', 'last:md', 'last:lg'],
    },
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
