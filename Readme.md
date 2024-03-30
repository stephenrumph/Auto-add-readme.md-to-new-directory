# Directory Monitoring and README Generation

This process involves a script designed to monitor directories for the creation of new directories. Upon detecting a new directory, it automatically generates a structured `README.md` file within it, filled with template content for further detailing. I made this with the intention to be used in cyber security research to automate a beginning step in the process. 

## Prerequisites

- Linux system with `bash`
- `inotify-tools` package installed
- `Sublime Text` installed and the `subl` command available

## Setup Instructions

### 1. Install `inotify-tools`

`inotify-tools` is required for monitoring filesystem events. Install it using your distribution's package manager. For Debian-based systems (like Ubuntu), use:

```sh
sudo apt-get update
sudo apt-get install inotify-tools
```
## Prepare the Script

Copy the monitoring script provided above into a file, e.g., `create_readme.sh`, on your Linux system.

Modify the `WATCHED_DIR_ONE` and `WATCHED_DIR_TWO` variables in the script to match the paths of your target directories. The example paths are using two directories on the user home desktop folder. You can add more directories if you wish or change the location of the directories to go whereever you like. 

## 3. Make the Script Executable

Change the script's permissions to make it executable:

```sh
chmod +x create_readme.sh
```
## 4. Running the Script

To start monitoring, run the script with `nohup` to ensure it continues running in the background even if the terminal is closed:

```sh
nohup ./create_readme.sh > /dev/null 2>&1 &
```
## 5. Setting up a Cron Job (Optional)

For the script to start automatically on system boot, add it to your crontab:

1. Open your crontab for editing:

```sh
crontab -e
```
2. Add the following line, adjusting the path to where your `create_readme.sh` script is located:

```cron
@reboot nohup /path/to/your/create_readme.sh > /dev/null 2>&1 &
```

## Create a directory and navigate to file. 
1. From within one of the monitored folders create a new directory. If you have installed sublime text you will automatically see the new file. 
```sh
mkdir testfolder
cd testfolder
```
