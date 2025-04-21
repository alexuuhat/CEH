# ADB Linux Command Cheat Sheet (Pentesting/Debugging)

# ---------- Basic ADB Commands ----------
adb devices                     # List connected devices
adb start-server                # Start ADB server
adb kill-server                 # Stop ADB server
adb shell                       # Open remote shell on device
adb reboot                      # Reboot the device
adb reboot bootloader           # Reboot into bootloader
adb root                        # Restart adbd with root access (if rooted)

# ---------- File Operations ----------
adb push <local> <remote>       # Push file/dir to device
adb pull <remote> <local>       # Pull file/dir from device
adb shell ls <path>             # List files in path
adb shell cp <src> <dest>       # Copy files on device
adb shell mv <src> <dest>       # Move/rename files on device
adb shell rm <file>             # Remove file
adb shell mkdir <dir>           # Make directory

# ---------- Package Management ----------
adb shell pm list packages                  # List all packages
adb shell pm list packages -3               # List user-installed apps
adb shell pm list packages -s               # List system apps
adb install <apk>                           # Install APK
adb uninstall <package>                     # Uninstall package
adb shell pm path <package>                 # Show APK path of app
adb shell dumpsys package <package>         # Dump info about the package

# ---------- App Interaction ----------
adb shell monkey -p <package> -v 1          # Launch app using monkey tool
adb shell am start -n <package>/<activity>  # Start specific activity
adb shell am force-stop <package>           # Force stop the app
adb shell am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -n <package>/<activity>  # Launch main launcher activity

# ---------- Shell Access / System Info ----------
adb shell id                                # Check current user ID
adb shell su                                # Switch to root (if rooted)
adb shell getprop                           # Get system properties
adb shell setprop <key> <value>             # Set system property
adb shell screencap -p /sdcard/screen.png   # Take screenshot
adb pull /sdcard/screen.png                 # Pull screenshot to host

# ---------- Network & Port Forwarding ----------
adb forward <local> <remote>                # Forward local port to device
adb reverse <remote> <local>                # Reverse forward (device to host)
adb shell netstat                           # Show active network connections
adb shell ip addr                           # Show IP addresses

# ---------- Logs & Debugging ----------
adb logcat                                  # View real-time logs
adb logcat -v time                          # View logs with timestamp
adb logcat | grep <tag>                     # Filter logcat output
adb shell dumpsys                           # Dump system services

# ---------- App Data & Reboot ----------
adb shell pm clear <package>                # Clear app data
adb shell rm -rf /data/data/<package>       # Manually remove app data
adb shell reboot recovery                   # Reboot into recovery mode

# ---------- APK Extraction ----------
adb shell pm path <package>                 # Get APK path
adb pull /data/app/<package>/<apkfile.apk>  # Pull APK from device (may need root)
