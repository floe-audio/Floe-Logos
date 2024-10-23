rasterize:
  #!/usr/bin/env bash
  set -euxo pipefail

  mkdir -p rasterized

  rsvg-convert icon_transparent.svg -w 256 -h 256 -o rasterized/icon_transparent_256px.png
  rsvg-convert icon_transparent.svg -w 128 -h 128 -o rasterized/icon_transparent_128px.png
  rsvg-convert icon_transparent.svg -w 64 -h 64 -o rasterized/icon_transparent_64px.png
  rsvg-convert icon_transparent.svg -w 32 -h 32 -o rasterized/icon_transparent_32px.png
  rsvg-convert icon_transparent.svg -w 24 -h 24 -o rasterized/icon_transparent_24px.png
  rsvg-convert icon_transparent.svg -w 16 -h 16 -o rasterized/icon_transparent_16px.png

  rsvg-convert icon_transparent.svg -w 256 -h 256 -f svg -o rasterized/icon_transparent_256px.svg
  rsvg-convert icon_transparent.svg -w 128 -h 128 -f svg -o rasterized/icon_transparent_128px.svg
  rsvg-convert icon_transparent.svg -w 32 -h 32 -f svg -o rasterized/icon_transparent_32px.svg

  rsvg-convert icon_background.svg -w 512 -h 512 -o rasterized/icon_background_512px.png
  rsvg-convert icon_transparent_dark.svg -w 512 -h 512 -o rasterized/icon_transparent_dark_512px.png

  rsvg-convert vertical_transparent.svg -o rasterized/vertical_transparent.png
  rsvg-convert vertical_background.svg -o rasterized/vertical_background.png
  rsvg-convert vertical_transparent_dark.svg -o rasterized/vertical_transparent_dark.png

  rsvg-convert horizontal_transparent.svg -o rasterized/horizontal_transparent.png
  rsvg-convert horizontal_background.svg -o rasterized/horizontal_background.png
  rsvg-convert horizontal_transparent_dark.svg -o rasterized/horizontal_transparent_dark.png
  rsvg-convert horizontal_background.svg -w 150 -o rasterized/win-installer-sidebar.png

  rsvg-convert wordmark_transparent.svg -o rasterized/wordmark_transparent.png
  rsvg-convert wordmark_background.svg -o rasterized/wordmark_background.png
  rsvg-convert wordmark_transparent_dark.svg -o rasterized/wordmark_transparent_dark.png


  pushd rasterized

  magick icon-256px.png icon-128px.png icon-64px.png icon-32px.png icon-24px.png icon-16px.png icon.ico
  fd -e png -x optipng -o5 {}
  svgo -i . -r --multipass

  cp icon-32px.png favicon.png
  cp icon-32px.svg favicon.svg

  popd

optimise-svgs:
  svgo -i . -r --multipass
