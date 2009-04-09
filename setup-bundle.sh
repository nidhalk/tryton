#!/bin/sh

VERSION=`python -c "import os; execfile(os.path.join('tryton', 'version.py')); print VERSION"`

for i in dist/tryton.app/Contents/Resources/share/pixmaps/tryton/*.svg; do
    rsvg-convert $i -o ${i/svg/png};
done
rm -f dist/tryton.app/Contents/Resources/share/pixmaps/tryton/*.svg

cp CHANGELOG COPYRIGHT LICENSE README TODO dist/
hdiutil create tryton-${VERSION}.dmg -volname "Tryton Client ${VERSION}" -fs HFS+ -srcfolder dist