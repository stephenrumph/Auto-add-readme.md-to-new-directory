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

Modify the `WATCHED_DIR_THM` and `WATCHED_DIR_HTB` variables in the script to match the paths of your target directories.

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
Add the following line, adjusting the path to where your `create_readme.sh` script is located:

```cron
@reboot nohup /path/to/your/create_readme.sh > /dev/null 2>&1 &
```