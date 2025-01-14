#!/bin/bash

# All package scripts to not polute
# package.json file with long scripts

cmd=$1
args=${@:2}

function dev() {
  echo "🚀 Starting dev server...";
  npx rollup -c --watch;
};

function build() {
  clean;
  echo "📦 Building package...";
  npx rollup -c;
};

function prepare() {
  echo "👋 Installing git hooks...";
  npx simple-git-hooks >> /dev/null;
  build;
};

function test() {
  echo "🧪 Running tests...";
  npx vitest --dir ./src --run;
};

function lint() {
  echo "🧹 Linting...";
  npx eslint ./src --ext ts,tsx;
};

function clean() {
  echo "🧹 Cleaning up...";
  rm -rf dist;
};

function hello() {
  echo "👋 Hello!" $args;
};

eval $cmd $args
