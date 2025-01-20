@interface externalVolumeUVFSServiceLiveFSServiceDelegate
- (void)LiveMountService:(id)a3 addDisk:(id)a4 fileSystemType:(id)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 addDisk:(id)a4 reply:(id)a5;
- (void)LiveMountService:(id)a3 addVolume:(id)a4 atServer:(id)a5 credentialType:(int64_t)a6 credential:(id)a7 reply:(id)a8;
- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 usingFlags:(unsigned int)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 ejectVolume:(id)a4 named:(id)a5 withFlags:(unsigned int)a6 reply:(id)a7;
- (void)LiveMountService:(id)a3 ejectVolumeCluster:(id)a4 withFlags:(unsigned int)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 sharesAtServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7;
- (void)LiveMountService:(id)a3 unlockVolume:(id)a4 password:(id)a5 saveToKeychain:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation externalVolumeUVFSServiceLiveFSServiceDelegate

- (void)LiveMountService:(id)a3 addDisk:(id)a4 reply:(id)a5
{
  id v6 = a5;
  id v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (void)LiveMountService:(id)a3 addDisk:(id)a4 fileSystemType:(id)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id, void))a6 + 2))(v7, v8, 0);
}

- (void)LiveMountService:(id)a3 addVolume:(id)a4 atServer:(id)a5 credentialType:(int64_t)a6 credential:(id)a7 reply:(id)a8
{
  id v9 = a8;
  id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id))a8 + 2))(v9, v10);
}

- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 usingFlags:(unsigned int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *))a6;
  id v12 = v10;
  v13 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[externalVolumeUVFSServiceLiveFSServiceDelegate LiveMountService:ejectDisk:usingFlags:reply:]";
    __int16 v41 = 2112;
    id v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: start %@", buf, 0x16u);
  }
  if (!deviceBeenServiced)
  {
    v19 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000265EC(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 22;
    goto LABEL_12;
  }
  v14 = [(id)deviceBeenServiced deviceName];
  unsigned int v15 = [v14 isEqualToString:v12];

  if (!v15)
  {
    v29 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100026664(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    NSErrorDomain v27 = NSPOSIXErrorDomain;
    uint64_t v28 = 19;
LABEL_12:
    v18 = +[NSError errorWithDomain:v27 code:v28 userInfo:0];
    v11[2](v11, v18);
    goto LABEL_13;
  }
  [(id)deviceBeenServiced unloadVolumes:v7];
  [(id)deviceBeenServiced close];
  v16 = (void *)deviceBeenServiced;
  deviceBeenServiced = 0;

  v11[2](v11, 0);
  v17 = gIOKitNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C190;
  block[3] = &unk_100038668;
  id v38 = v12;
  dispatch_async(v17, block);
  v18 = v38;
LABEL_13:
}

- (void)LiveMountService:(id)a3 ejectVolume:(id)a4 named:(id)a5 withFlags:(unsigned int)a6 reply:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void))a7;
  id v15 = v12;
  v16 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    id v18 = v15;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "ejectVolume:%@:how:%u", (uint8_t *)&v17, 0x12u);
  }
  if (v8)
  {
    [v15 invalidateAllConnections];
    [v15 unmount:v8];
  }
  v14[2](v14, 0);
}

- (void)LiveMountService:(id)a3 ejectVolumeCluster:(id)a4 withFlags:(unsigned int)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (void)LiveMountService:(id)a3 sharesAtServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7
{
  id v8 = a7;
  id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, void, id))a7 + 2))(v8, 0, v9);
}

- (void)LiveMountService:(id)a3 unlockVolume:(id)a4 password:(id)a5 saveToKeychain:(BOOL)a6 completionHandler:(id)a7
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a7;
  id v10 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000266DC((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
  int v17 = getNSErrorFromLiveFSErrno();
  v9[2](v9, v17);
}

@end