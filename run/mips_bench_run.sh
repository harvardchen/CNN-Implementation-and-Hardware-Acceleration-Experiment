#!/bin/bash
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��z[mips_bench_run.sh �Um��4�����@����
�rm��.}Q��> ʹ�Ӛ&qp��������K�lE�.������gOn�r��p��Z~��i��v�J�z�wXYVN.�*�Ye�%\2�����������h�tz����c�r���?�.��!DO%�>f^~���|�`�\���NǾ��-��I�q[^N�~���%���7��}�'����&.��uɪ
:%�giQ�sx�v$�Z�Xe�?��ޚ�Q��BRB>���Ф��.y�s�6��n���8�������Ѐ��>�hVM�@�M"T;%�ĲZ��}��m��-b]�	�pw׎�jo������oq��ÅY�R��D���Hb5ۉ���3}8�A3Qi�V��@ol�B�������?K%
����7�	�D
� �O�\�~#�^����Z����=L$T\	�AQ�K��>���D�9�U-4�¯Ěe�U�f�ϲVP�<���<S�L/�!i�u����V�MU���,�Ms��<XJ�`�F�8�z0A��sQ�A�i�ʡ��s%�y�X���M�jL����@�L%d��ɭ���J�ۥ{��F�,�-�{/��`�L��}6�|��L�Xտ�.��3a�Z������xUg�����b��q�����t��)�I���M�`�I�"W��f�b�*ũ �5�/���b����]�͏���e'�k��LQ���`��C	�7�Ç '��l�r����E���``�5�
+�O+V���q��_���� ���7ƍgl��X(�n?Op���;��X��:N�%>�k��z�ڬv3��reĚȂҤm���
�Sz������ߓ�5=��  