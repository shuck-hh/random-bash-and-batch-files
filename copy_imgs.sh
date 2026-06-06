find "/media/valentin/Cam Card/DCIM" -type f | while read f; do
    d=$(date -r "$f" +%Y-%m-%d)
    mkdir -p "/media/valentin/97AE-D58E/$d"
    cp -p "$f" "/media/valentin/97AE-D58E/$d"
    echo Successfully copied $f
done
