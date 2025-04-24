#!/bin/bash

alias r="source $BASH_SOURCE"

recolor() {
  declare inp=$1
  : ${inp:? required}
  local name=${inp%.*}

  red2green ${inp}
  blue2red ${name}-rg.png
  yellow2blue ${name}-rg-br.png
  mv ${name}-rg-br-yb.png ${name}-final.png
  rm ${name}-rg.png ${name}-rg-br.png

#   blue2green ${inp}
#   yellow2blue ${name}-bg.png
#   mv ${name}-bg-yb.png ${name}-final.png
#   rm ${name}-bg.png
}

red2green() {
  declare inp=$1

  : ${inp:? required}
  local name=${inp%.*}
  echo == conv ${name}.png to ${name}-rg.png
  convert ${inp} \
    -fuzz 40% \
    -fill '#077003' \
    -opaque '#ff0000' \
    ${name}-rg.png
}

blue2red() {
  declare inp=$1

  : ${inp:? required}
  local name=${inp%.*}
  echo == conv ${name}.png to ${name}-br.png
  convert ${inp} \
    -fuzz 40% \
    -fill '#a0002b' \
    -opaque '#0000ff' \
    ${name}-br.png
}


blue2green() {
  declare inp=$1

  : ${inp:? required}
  local name=${inp%.*}
  echo == conv ${name}.png to ${name}-bg.png
  convert ${inp} \
    -fuzz 40% \
    -fill '#077003' \
    -opaque '#0000ff' \
    ${name}-bg.png
}

yellow2blue() {
  declare inp=$1

  : ${inp:? required}
  local name=${inp%.*}
  echo == conv ${name}.png to ${name}-yb.png
  convert ${inp} \
    -fuzz 40% \
    -fill '#105ca1' \
    -opaque '#ffff00' \
    ${name}-yb.png

}