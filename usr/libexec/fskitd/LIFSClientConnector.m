@interface LIFSClientConnector
+ (void)forgetLiveFilesVolumeForProvider:(id)a3 volume:(id)a4 withFlags:(unsigned int)a5 handler:(id)a6;
+ (void)getLiveFSClientForProvider:(id)a3 handler:(id)a4;
+ (void)getLiveFilesConnectionForProvider:(id)a3 volume:(id)a4 withHandler:(id)a5;
@end

@implementation LIFSClientConnector

+ (void)getLiveFSClientForProvider:(id)a3 handler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, void *))a4;
  if ([v5 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"])
  {
    CFStringRef v7 = @"machp://com.apple.filesystems.localLiveFiles";
LABEL_5:
    id v8 = +[LiveFSClient newConnectionForService:v7];
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:65 userInfo:0];
    }
    v6[2](v6, v8, v9);

    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"])
  {
    CFStringRef v7 = @"machp://com.apple.filesystems.smbclientd";
    goto LABEL_5;
  }
  v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:65 userInfo:0];
  v10 = livefs_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_100040758();
  }

  v6[2](v6, 0, v9);
LABEL_12:
}

+ (void)getLiveFilesConnectionForProvider:(id)a3 volume:(id)a4 withHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, id, void))a5;
  uint64_t v27 = 0;
  v28[0] = &v27;
  v28[1] = 0x3032000000;
  v28[2] = sub_10002E4C4;
  v28[3] = sub_10002E4D4;
  id v29 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10002E4C4;
  v25 = sub_10002E4D4;
  id v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002E4DC;
  v20[3] = &unk_100059C30;
  v20[4] = &v27;
  v20[5] = &v21;
  +[LIFSClientConnector getLiveFSClientForProvider:v7 handler:v20];
  v11 = (void *)v22[5];
  if (v11
    && (v12 = (id *)(v28[0] + 40),
        id obj = *(id *)(v28[0] + 40),
        [v11 listenerForVolume:v8 error:&obj],
        v13 = objc_claimAutoreleasedReturnValue(),
        objc_storeStrong(v12, obj),
        v13))
  {
    v14 = (void *)v22[5];
    v22[5] = 0;

    id v15 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v13];
    if (!v15)
    {
      uint64_t v16 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:65 userInfo:0];
      v17 = *(void **)(v28[0] + 40);
      *(void *)(v28[0] + 40) = v16;
    }
    v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000407CC((uint64_t)v15, (uint64_t)v28, v18);
    }

    v9[2](v9, v15, *(void *)(v28[0] + 40));
  }
  else
  {
    v9[2](v9, 0, *(void *)(v28[0] + 40));
    id v15 = 0;
    v13 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

+ (void)forgetLiveFilesVolumeForProvider:(id)a3 volume:(id)a4 withFlags:(unsigned int)a5 handler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void))a6;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10002E4C4;
  uint64_t v27 = sub_10002E4D4;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10002E4C4;
  uint64_t v21 = sub_10002E4D4;
  id v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002E77C;
  v16[3] = &unk_100059C30;
  v16[4] = &v23;
  v16[5] = &v17;
  +[LIFSClientConnector getLiveFSClientForProvider:v9 handler:v16];
  v12 = (void *)v18[5];
  if (v12)
  {
    uint64_t v13 = [v12 forgetVolume:v10 withFlags:v7];
    v14 = (void *)v24[5];
    v24[5] = v13;

    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000408D4();
    }
  }
  else
  {
    id v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10004086C();
    }
  }

  v11[2](v11, v24[5]);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

@end