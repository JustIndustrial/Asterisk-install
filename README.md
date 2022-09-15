![Asterisk-ASCII-logo-in-Output2](https://user-images.githubusercontent.com/113357336/190448226-5ed73031-bc03-4cdf-bd94-e4094afb019d.jpg)


# Asterisk-install

Simple install script for Asterisk 18


---
-The script was tested on Ubuntu Server 20.04 

-It will download and install Asterisk 18, including all dependencies

-Modify and copy the files necessary for running Asterisk as a service

-Add user and group: asterisk

---


## Usage

The superuser can download this script using:

```terminal
git clone https://github.com/JustinDustrial/Asterisk-install.git
```


The Asterisk-install folder contains two scripts and the config files required for a simple PBX setup.

Running ``` ./install ``` will start the installation process.

Once the installation has completed Asterisk will be running as a service at startup using the username: asterisk

The user then can modify  ``` /etc/asterisk/pjsip.conf ``` and ``` /etc/asterisk/extensions.conf ``` in order to setup their PJSIP PBX. 

The included sample PBX config contains a dialplan with three extensions, incoming/outgoing calls, voicemail and a multi-language IVR.

The ``` ./config ``` script requires three arguments in order to substitute the username, password and public IP within the config files.

For example:

```terminal
./config 1234567_test MyNewPassword 123.123.123.123
```

The script then substitutes the arguments, does backup of original config files and copies the new ones to ``` /etc/asterisk ```.

Some further modification of ``` pjsip.conf extensions.conf voipms.conf voicemail.conf ``` may be required if using a different Trunk and/or extensions.

The .gsm soundfiles required by the IVR can be copied into the ``` /var/lib/asterisk/sounds/en ``` directory. 
