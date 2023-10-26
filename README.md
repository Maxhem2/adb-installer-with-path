# Automated ADB Tools Installer for Windows

This script automates the installation of ADB (Android Debug Bridge) tools on a Windows system and adds ADB to the system PATH. It also checks for administrator privileges and ensures that any existing ADB server is stopped before the installation process begins.

## Prerequisites

Before running the script, make sure you have the following:

- [Curl](https://curl.se/windows/) installed and added to your system PATH. (Normally always pre installed)
- Administrative privileges on your Windows system.

## How to Use

1. Download the script (`install_adb.bat`) from this repository.

2. Right-click the script and select "Run as Administrator" to ensure the installation process completes successfully.

3. The script will download the latest ADB tools from Google's official repository, extract them, and add ADB to your system PATH.

4. Once the installation is complete, you can open a command prompt and use ADB commands.

## Disclaimer

This script is provided as-is and may require updates or modifications based on changes to the ADB tools or Windows environment. Use it at your own risk.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- This script was created for convenience and automation of ADB tools installation on Windows systems.

## Contributing

Contributions and suggestions are welcome. If you encounter any issues or have ideas for improvements, please create a GitHub issue or a pull request.

---

**Note:** This script was last tested in [10.2023]. Be sure to check for the latest version of ADB tools and any script updates.
