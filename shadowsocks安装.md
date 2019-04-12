安装pip

```
sudo apt-get install python-pip
```

安装`shadowsocks`

```
sudo pip install shadowsocks
```

配置文件`/etc/shadowsocks/config.json`内容

```
{
  "server": "0.0.0.0",
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "server_port": 8388,
  "password":"liuwei321.0",
  "timeout": 300,
  "method": "aes-256-cfb"
}
```

通过

```
sudo ssserver -c /etc/shadowsocks/config.json -d start
```

启动ssserver时遇到如下问题：

```
INFO: loading config from /etc/shadowsocks.json
2019-03-30 15:16:08 INFO     loading libcrypto from libcrypto.so.1.1
Traceback (most recent call last):
  File "/usr/local/bin/ssserver", line 11, in <module>
    load_entry_point('shadowsocks==2.8.2', 'console_scripts', 'ssserver')()
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/server.py", line 34, in main
    config = shell.get_config(False)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/shell.py", line 262, in get_config
    check_config(config, is_local)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/shell.py", line 124, in check_config
    encrypt.try_cipher(config['password'], config['method'])
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 44, in try_cipher
    Encryptor(key, method)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 83, in __init__
    random_string(self._method_info[1]))
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/encrypt.py", line 109, in get_cipher
    return m[2](method, key, iv, op)
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py", line 76, in __init__
    load_openssl()
  File "/usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py", line 52, in load_openssl
    libcrypto.EVP_CIPHER_CTX_cleanup.argtypes = (c_void_p,)
  File "/usr/lib/python2.7/ctypes/__init__.py", line 379, in __getattr__
    func = self.__getitem__(name)
  File "/usr/lib/python2.7/ctypes/__init__.py", line 384, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))
AttributeError: /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1: undefined symbol: EVP_CIPHER_CTX_cleanup
```

解决方法：

1. 用vim打开文件：vim /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py (该路径请根据自己的系统情况自行修改，如果不知道该文件在哪里的话，可以使用find命令查找文件位置)
2. 跳转到52行（shadowsocks2.8.2版本，其他版本搜索一下cleanup）
3. 进入编辑模式
4. 将第52行libcrypto.EVP_CIPHER_CTX_cleanup.argtypes = (c_void_p,) 
   改为libcrypto.EVP_CIPHER_CTX_reset.argtypes = (c_void_p,)
5. 再次搜索cleanup（全文件共2处，此处位于111行），将libcrypto.EVP_CIPHER_CTX_cleanup(self._ctx) 
   改为libcrypto.EVP_CIPHER_CTX_reset(self._ctx)
6. 保存并退出
7. 启动shadowsocks服务：service shadowsocks start 或 sslocal -c ss配置文件目录
8. 问题解决

