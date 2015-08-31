source ./node_executtor.sh

echo "Process runner initialized"


FindConfigFile() {
        echo "Searching config file in $BASE_PATH"
        CONFIG_FILE="$(find $BASE_PATH ! -regex ".*[/]\.git[/]?.*" -name config.sh)"

        echo Founded config file: $CONFIG_FILE
        source $CONFIG_FILE

        Init
        Start
}

RestartApplication() {
        echo "Restarting application"

      
	          FindConfigFile
}
