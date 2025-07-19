# Aseprite installer for Apple Sillicon

These scripts help you to build Aseprite for MacOs on Apple sillicon. It will also add an icon to the application and set up the file associations so Aseprite appears in Finder's *Open with* menu for images.

Only requires that you have [Homebrew](https://brew.sh/) installed.

## Install process:

### 1) Homebrew
Download and install **Homebrew** (if you have not installed it yet)

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Make sure to follow the instructions at the end of the installation

### 2) Dependencies
Install **cmake** and **ninja**

```
brew install cmake ninja
```

### 3) Scripts
Download the actual installation scripts from this repository

```
git clone https://github.com/wdudokvanheel/aseprite-installer-mac.git
cd aseprite-installer-mac
```

### 4) Build Aseprite

```
./build.sh
```

### 5) Install
**Install** to the /Applications folder, this requires *root* access to modify the /Applications folder
```
sudo ./install.sh
```

### 6) Cleanup
Delete the scripts and the *aseprite_build* folder in your home folder

## Credits

Thanks to all the developers of Aseprite for their awesome software and to [Casnah7](https://github.com/Chasnah7/aseprite-build-script-mac/) for the build script
