<?php
////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
$server = 'localhost:3306';
$username = 'root';
$password = '';
$databasename = "testdrive_db";

mysql_connect($server, $username, $password) or die('Error connecting to MySQL');
mysql_select_db($databasename);
$result=mysql_query("SELECT firstname,lastname from employees");
$num=mysql_numrows($result);

$i=0;
while ($i < $num) {
	$firstname=mysql_result($result,$i,"firstname");
	$lastname=mysql_result($result,$i,"lastname");
	echo "$firstname $lastname<br>";
	$i++;
}

mysql_close();

?>