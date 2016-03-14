# Uninstall_bash_tool
This script is meant to uninstall copy_installed software.(这个脚本是用来卸载以拷贝覆盖的方式安装的软件)

# How to use
First of all, you have to make the uins.sh executable by running `#chmod +x uins.sh`.<br>
The usage of this script is as follow:<br>
`#uins.sh \<reference dir\> \<target dir\>` <br><br>

Say you install your software this way:

`cp someDir/* /` <br>

the structure of someDir is:<br>
>someDir
>>bin
>>>
somefile<br>
someOtherFile<br>
...<br>

>>lib<br>
>>>
somefile<br>
someOtherFile<br>
...<br>

>>...<br>

So once the files are installed, to delete those by hand will be painful.That's when this script come in and save the day.<br><br>

So in the command shown above, reference dir will be someDir and the target dir will be / 

