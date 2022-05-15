#! /bin/bash

function sync_code()
{
    remote=$1
    loc=$2
    dir=$3
    extra_flags=$4

    if [ ! -d "$loc" ]; then
        mkdir -p "$loc"
    fi

    src=$remote
    dst=$loc

    if [ $dir == "to-remote" ];
    then
        src=$loc
        dst=$remote
    fi

    echo
    echo "$dir:   $src >>>> $dst"

    if [ "$prompt" == "true" ];
    then
        read -p "continue? (y/n)" answer
        if [ "$answer" != "y" ];
        then
            exit
        fi
    fi

    flags="-azP -m --cvs-exclude -f'+ core' 
        -f'- out' -f'- tuning*/' -f'- .repo' -f'- chromatix' 
        -f'- mi_tuning_proj' 
        -f'- test/' 
        -f'+ */' 
        -f'+ *.cpp' -f'+ *.h' -f'+ *.txt'
        "
    flags+="$extra_flags"
    flags+=" -f'- *' "

    #set -x
    eval rsync $flags -e ssh $src $dst
}



for arg in "$@"
do
    case $arg in
        from)
            if [ "$dir" != "" ];
            then
                echo "to or from remote ??"
                exit
            fi
            dir="from-remote"
            ;;
        to)
            if [ "$dir" != "" ];
            then
                echo "to or from remote ??"
                exit
            fi
            dir="to-remote"
            ;;
        chi)
            chi=true
            ;;
        chi-lite)
            chi=true
            chi_lite=true
            ;;
        chi-full)
            chi=true
            chi_full=true
            ;;
        camx)
            camx=true
            ;;
        camx-*)
            camx_other=true
            ;;
        mivi)
            mivi=true
            ;;
        all)
            all=true
            ;;
        *)
            echo unknown argument: $arg
            exit
            ;;
    esac

done

host="mi@kzhang9u:~/ssd/l1/"

if [ "$chi" == "true" ] || [ "$all" == "true" ];
then
    target="vendor/qcom/proprietary/chi-cdk/"

    if [ "$chi_lite" == "true" ]; then
        flag="-f'- topology*'"
    fi
    if [ "$chi_full" == "true" ]; then
        flag="-f'+ *.xml'"
    fi

    sync_code $host$target $target $dir "$flag"
fi

if [ "$camx" == "true" ] || [ "$all" == "true" ];
then
    target="vendor/qcom/proprietary/camx/"
    #flag="-f'+ *.xml' -f'+ *.txt'"

    sync_code $host$target $target $dir "$flag"
fi

if [ "$camx_other" == "true" ] || [ "$all" == "true" ];
then
    target="vendor/qcom/proprietary/camx-api/"
    sync_code $host$target $target $dir "$flag"

    target="vendor/qcom/proprietary/camx-common/"
    sync_code $host$target $target $dir "$flag"
fi

if [ "$mivi" == "true" ] || [ "$all" == "true" ];
then
    target="vendor/xiaomi/proprietary/mivifwk/"
    flag="-f'+ *.json'"
    sync_code $host$target $target $dir "$flag"
fi
