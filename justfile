release:
  #!/usr/bin/env bash
  set -euxo pipefail

  mkdir -p release

  rsvg-convert icon_transparent.svg -w 256 -h 256 -o release/icon-256px.png
  rsvg-convert icon_transparent.svg -w 128 -h 128 -o release/icon-128px.png
  rsvg-convert icon_transparent.svg -w 64 -h 64 -o release/icon-64px.png
  rsvg-convert icon_transparent.svg -w 32 -h 32 -o release/icon-32px.png
  rsvg-convert icon_transparent.svg -w 24 -h 24 -o release/icon-24px.png
  rsvg-convert icon_transparent.svg -w 16 -h 16 -o release/icon-16px.png

  rsvg-convert icon_transparent.svg -w 256 -h 256 -f svg -o release/icon-256px.svg
  rsvg-convert icon_transparent.svg -w 128 -h 128 -f svg -o release/icon-128px.svg
  rsvg-convert icon_transparent.svg -w 32 -h 32 -f svg -o release/icon-32px.svg

  rsvg-convert vertical_transparent.svg -o release/vertical-logo.png

  pushd release

  magick icon-256px.png icon-128px.png icon-64px.png icon-32px.png icon-24px.png icon-16px.png icon.ico
  fd -e png -x optipng -o5 {}
  svgo -i . -r --multipass

  cp icon-32px.png favicon.png
  cp icon-32px.svg favicon.svg
  ln -s -f vertical-logo.png win-installer-sidebar.png

  popd
