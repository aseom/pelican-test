#!/bin/bash
set -ev

GH_URL="https://${GH_TOKEN}@github.com/aseom/pelican-test.git"
COMMIT_MSG="Publish travis build #${TRAVIS_BUILD_NUMBER}"

if [ "${TRAVIS_BRANCH}" == "master" ]; then
    git config user.name "aseom-travis"
    git config user.email "hm9599@gmail.com"
    git clone -b gh-pages ${GH_URL} publish

    cd publish
    echo "Test!" > dummyfile

    git status
    git add -A .
    git commit -m "${COMMIT_MSG}"
    git push origin gh-pages
fi
