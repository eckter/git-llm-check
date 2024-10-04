#! /bin/sh

ROOT="$(dirname "$(readlink -fm "$0")")"
git show origin/HEAD..HEAD -U10 | llm -s "`cat "$ROOT/prompt"`"
