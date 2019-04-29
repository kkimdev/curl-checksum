#!/usr/bin/env bash

# https://stackoverflow.com/a/28466267/7044705
# Initial ":" before a makes getopts not complain illegal options

while getopts :ab:c-: arg; do
  case $arg in
    a )  ARG_A=true ;;
    b )  ARG_B="$OPTARG" ;;
    c )  ARG_C=true ;;
    - )  LONG_OPTARG="${OPTARG#*=}"
         case $OPTARG in
           alpha    )  ARG_A=true ;;
           bravo=?* )  ARG_B="$LONG_OPTARG" ;;
           bravo*   )  echo "No arg for --$OPTARG option" >&2; exit 2 ;;
           charlie  )  ARG_C=true ;;
           alpha* | charlie* )
                       echo "No arg allowed for --$OPTARG option" >&2; exit 2 ;;
           '' )        break ;; # "--" terminates argument processing
           * )         echo "Illegal option --$OPTARG" >&2; exit 2 ;;
         esac ;;
    \? ) ;;
  esac
done

echo ARG_A: $ARG_A ARG_B: $ARG_B ARG_C: $ARG_C

# https://github.com/curl/curl/blob/2e496108534ed20c82cf96f77443e81605f78f92/src/tool_operhlp.c#L130