# Copyright: 2016 Masatake YAMATO
# License: GPL-2

CTAGS=$1

. ../utils.sh

{
    echo '# BUILTIN'
    ${CTAGS} --quiet --options=NONE -o - --extras=p --pseudo-tags='*' \
		 --fields='-{typeref}{file}' \
	     input.sh

    echo '# REGEX'
    ${CTAGS} --quiet --options=NONE -o - --extras=p --pseudo-tags='*' \
	     --langdef=foo --langmap=foo:+.foo \
		 --_fielddef-foo='field,field example' \
		 --fields='-{typeref}{file}' \
		 --fields-foo='{field}' \
	     --regex-foo='/abc/\1/k,kind,kinds/' input.foo
} | grep -v VERSION
