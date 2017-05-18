# EternalRocks

Network worm that emerged in first half of May 2017, spreading through Shadowbrokers SMB exploits. Uses the following exploits: ETERNALBLUE, ETERNALCHAMPION, ETERNALROMANCE and ETERNALSYNERGY, along with related programs: DOUBLEPULSAR, ARCHITOUCH and SMBTOUCH. First stage malware `UpdateInstaller.exe` downloads [taskscheduler.2.5.23.nupkg](http://api.nuget.org/packages/taskscheduler.2.5.23.nupkg) and [sharpziplib.0.86.0.nupkg](http://api.nuget.org/packages/sharpziplib.0.86.0.nupkg) from Internet, while dropping `svchost.exe` (e.g. [sample](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/589af04a85dc66ec6b94123142a17cf194decd61f5d79e76183db026010e0d31)) and `taskhost.exe` (e.g. [sample](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/aedd0c47daa35f291e670e3feadaed11d9b8fe12c05982f16c909a57bf39ca35)). Component `svchost.exe` is used for downloading, unpacking and running Tor from `archive.torproject.org` along with C&C (`ubgdgno5eswkhmpy.onion`) communication requesting further instructions (e.g. installation of new component). Second stage malware (bigger than first stage) `taskhost.exe` (e.g. [sample](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/cf8533849ee5e82023ad7adbdbd6543cb6db596c53048b1a0c00b3643a72db30)) is being downloaded after a predefined period (e.g. 24h) from `https://ubgdgno5eswkhmpy.onion/updates/download?id=PC` and run. It drops the (contained) [shadowbrokers.zip](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/70ec0e2b6f9ff88b54618a5f7fbd55b383cf62f8e7c3795c25e2f613bfddf45d) and unpacks directories `payloads/`, `configs/` and `bins/`. After that, starts a random scan of opened 445 ports on Internet, while running contained exploits (inside directory `bins/`) and pushing the first stage malware through payloads (inside directory `payloads/`).

## Host Based indicators

### Paths

`c:\Program Files\Microsoft Updates`

`c:\Program Files\Microsoft Updates\TaskScheduler.zip`

`c:\Program Files\Microsoft Updates\Microsoft.Win32.TaskScheduler.dll`

`c:\Program Files\Microsoft Updates\SharpZLib.zip`

`c:\Program Files\Microsoft Updates\CSharpCode.SharpZipLib.dll`

### Mutexes

`{8F6F00C4-B901-45fd-08CF-72FDEFF}`

`Global\20b70e57-1c2e-4de9-99e5-69f369006912`

## Samples

### First stage

[e049d8f69ddee0c2d360c27b98fa9e61b7202bb0d3884dd3ca63f8aa288422dc](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/e049d8f69ddee0c2d360c27b98fa9e61b7202bb0d3884dd3ca63f8aa288422dc)  `# UpdateInstaller.exe (variant)`
[64442cceb7d618e70c62d461cfaafdb8e653b8d98ac4765a6b3d8fd1ea3bce15](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/64442cceb7d618e70c62d461cfaafdb8e653b8d98ac4765a6b3d8fd1ea3bce15)  `# UpdateInstaller.exe (variant)`
[94189147ba9749fd0f184fe94b345b7385348361480360a59f12adf477f61c97](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/94189147ba9749fd0f184fe94b345b7385348361480360a59f12adf477f61c97)  `# UpdateInstaller.exe (variant)`
[9bd32162e0a50f8661fd19e3b26ff65868ab5ea636916bd54c244b0148bd9c1b](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/9bd32162e0a50f8661fd19e3b26ff65868ab5ea636916bd54c244b0148bd9c1b)  `# UpdateInstaller.exe (variant)`
[a7c387b4929f51e38706d8b0f8641e032253b07bc2869a450dfa3df5663d7392](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/a7c387b4929f51e38706d8b0f8641e032253b07bc2869a450dfa3df5663d7392)  `# UpdateInstaller.exe (variant)`
[ad8965e531424cb34120bf0c1b4b98d4ab769bed534d9a36583364e9572332fa](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/ad8965e531424cb34120bf0c1b4b98d4ab769bed534d9a36583364e9572332fa)  `# UpdateInstaller.exe (variant)`


### Second stage

[cf8533849ee5e82023ad7adbdbd6543cb6db596c53048b1a0c00b3643a72db30](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/cf8533849ee5e82023ad7adbdbd6543cb6db596c53048b1a0c00b3643a72db30)  `# taskhost.exe (variant)`
[a77c61e86bc69fdc909560bb7a0fa1dd61ee6c86afceb9ea17462a97e7114ab0](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/a77c61e86bc69fdc909560bb7a0fa1dd61ee6c86afceb9ea17462a97e7114ab0)  `# taskhost.exe (variant)`
[70ec0e2b6f9ff88b54618a5f7fbd55b383cf62f8e7c3795c25e2f613bfddf45d](https://raw.githubusercontent.com/stamparm/EternalRocks/master/samples/70ec0e2b6f9ff88b54618a5f7fbd55b383cf62f8e7c3795c25e2f613bfddf45d)  `# shadowbrokers.zip`

## Network indicators

### C&C servers

`ubgdgno5eswkhmpy.onion`

## Appendix A

### Network traffic capture (PCAP)

[exploitation.pcap](https://raw.githubusercontent.com/stamparm/EternalRocks/master/misc/exploitation.pcap)
