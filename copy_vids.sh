find "/media/valentin/Cam Card/MP_ROOT" -type f | while read f; do
    d=$(date -r "$f" +%Y-%m-%d)
    mkdir -p "/media/valentin/97AE-D58E/videos $d"
    cp -p "$f" "/media/valentin/97AE-D58E/videos $d"
    echo Successfully copied $f
done
