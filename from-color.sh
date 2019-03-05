COLOR_DIR="src/_colors.css"

extract(){
    PREFIX="$1"
    CSS_PROP="$2"
    SELECTOR="$3"
    cat "$COLOR_DIR" | grep -- '--' | cut -d ':' -f1 \
    | tr -d '\t ' \
    | sed "s/.*/.$PREFIX&$3 { $CSS_PROP: var(&); }/g" \
    | sed 's/--//1'
}

TEXT_DIR="src/_text-colors.css"
BG_DIR="src/_bg-colors.css"
BORDER_DIR="src/_border-colors.css"

extract "" "color" "" > $TEXT_DIR
extract "hover-" "color" ":hover" >> $TEXT_DIR
extract "active-" "color" ":active" >> $TEXT_DIR

extract "bg-" "background-color" "" > $BG_DIR
extract "bg-hover-" "background-color" ":hover" >> $BG_DIR
extract "bg-active-" "background-color" ":active" >> $BG_DIR

extract "b--" "border-color" "" > $BORDER_DIR
extract "b----hover" "border-color" ":hover" >> $BORDER_DIR
extract "b----active" "border-color" ":active" >> $BORDER_DIR
