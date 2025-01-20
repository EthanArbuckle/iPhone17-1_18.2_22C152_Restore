@interface NFHostCardEmulationDeviceHandle
- (BOOL)sendAPDU:(id)a3;
- (id)readAPDU;
- (id)readApduAndReturnError:(id *)a3;
- (void)readAPDUWithCompletion:(id)a3;
- (void)restartDiscovery;
@end

@implementation NFHostCardEmulationDeviceHandle

- (id)readAPDU
{
  return [(NFHostCardEmulationDeviceHandle *)self readApduAndReturnError:0];
}

- (id)readApduAndReturnError:(id *)a3
{
  v3 = (void *)sub_1001965F4(self->_driver);
  if (v3 && v3[1]) {
    id v4 = [objc_alloc((Class)NSData) initWithBytes:*v3 length:v3[1]];
  }
  else {
    id v4 = 0;
  }
  NFDataRelease();

  return v4;
}

- (void)readAPDUWithCompletion:(id)a3
{
  id v4 = a3;
  driver = self->_driver;
  devHandle = self->_devHandle;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100149C88;
  v8[3] = &unk_100304DE8;
  id v9 = v4;
  id v7 = v4;
  sub_1001969EC(driver, (uint64_t)devHandle, v8);
}

- (BOOL)sendAPDU:(id)a3
{
  driver = self->_driver;
  id v6 = a3;
  [v6 bytes];
  [v6 length];

  char v7 = sub_1001972F4(driver);
  if ((v7 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Failed to initiate send of data", v13, ClassName, Name, 53);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v20 = v16;
      __int16 v21 = 2082;
      v22 = object_getClassName(self);
      __int16 v23 = 2082;
      v24 = sel_getName(a2);
      __int16 v25 = 1024;
      int v26 = 53;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initiate send of data", buf, 0x22u);
    }
  }
  return v7;
}

- (void)restartDiscovery
{
}

- (void).cxx_destruct
{
}

@end