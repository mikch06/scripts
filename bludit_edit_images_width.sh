for file in `find ../bl-content/pages/ -name index.txt`;
do
    # backup index.txt
    cp $file $file.bak

    # edit file
    if grep -q width $file
    then
        # if 'width' fix value
        echo yes:$file
        sed -i 's/\width=".*\"/width="400"/' $file
    else
        # if 'no width' insert it
        echo no
        sed -i 's/alt=""/alt="" width="400"/g' $file
    fi

done
