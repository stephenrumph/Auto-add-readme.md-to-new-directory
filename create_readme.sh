#!/bin/bash

WATCHED_DIR_ONE="/home/<your home folder name>/Desktop/<name of folder one>" # Path to the first directory
WATCHED_DIR_TWO="/home/<your home folder name>/Desktop/<name of folder two>" # Path to the second directory

# Function to handle the creation of a new directory
handle_new_dir() {
    NEW_DIR="$1"
    README_PATH="${NEW_DIR}/README.md"
    FOLDER_NAME=$(basename "${NEW_DIR}")
    CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

    # Preparing the content
    CONTENT="Folder Name: ${FOLDER_NAME}\n"
    CONTENT+="Creation Date: ${CURRENT_DATE}\n\n"
    CONTENT+="## Target Network Info\n[Input the IP address and any relevant network info into this field]\n"
    CONTENT+="## Objective/Summary\n[Description of the folder/project purpose]\n"
    CONTENT+="## Scan Output Results\n[Output of the network scan]\n"
    CONTENT+="## Files/Directories Description\n[Details about the contents]\n"
    CONTENT+="## Dependencies\n[List of dependencies necessary for the project]\n"
    CONTENT+="## Setup/Installation Instructions\n[Steps to get started]\n"
    CONTENT+="## Usage\n[How to use the software or data]\n"
    CONTENT+="## Contact\n[Your contact information or the project maintainer]\n"
    CONTENT+="## User System Information\n- Hostname: $(hostname)\n- System: $(uname -a)\n"
    CONTENT+="## User Network Information\n- IP Address: $(hostname -I)\n"
    CONTENT+="## To-Do\n- [ ] Action item 1\n- [ ] Action item 2\n"
    CONTENT+="## Notes\n[Additional notes]\n"
    CONTENT+="## Known Issues\n[Issues or problems encountered]\n"

    # Writing the content to README.md
    echo -e "$CONTENT" > "${README_PATH}"
    
    # Open README.md with Sublime Text remove and add the terminal shorhand for your own text editor
    subl "${README_PATH}" &> /dev/null
}

# Monitor the first directory in the background
inotifywait -m -e create --format '%w%f' "${WATCHED_DIR_ONE}" | while read NEW_DIR; do
    if [ -d "${NEW_DIR}" ]; then # Check if it's a directory
        handle_new_dir "${NEW_DIR}"
    fi
done &

# Monitor the second directory in the background
inotifywait -m -e create --format '%w%f' "${WATCHED_DIR_TWO}" | while read NEW_DIR; do
    if [ -d "${NEW_DIR}" ]; then # Check if it's a directory
        handle_new_dir "${NEW_DIR}"
    fi
done &

# Add more directory handlers below 