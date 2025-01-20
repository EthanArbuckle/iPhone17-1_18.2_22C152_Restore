@interface MIDiskImageManager
+ (id)sharedInstance;
- (BOOL)URLIsOnKnownImageMount:(id)a3;
- (BOOL)_isKnownPath:(id)a3;
- (BOOL)_removeMountPath:(id)a3;
- (BOOL)bundleIDIsOnKnownImageMount:(id)a3;
- (MIDiskImageManager)init;
- (NSMutableDictionary)mountInfo;
- (NSSet)diskImageAppBundleIDs;
- (NSSet)diskMountPaths;
- (NSString)pendingMountPath;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)lsRegisterQueue;
- (OS_dispatch_queue)mountInfoAccessQueue;
- (id)_mountInfoForPath:(id)a3;
- (id)_onQueue_scanApps:(id)a3 returnMapInfo:(id *)a4;
- (id)diskImageAppInfoForBundleID:(id)a3;
- (void)_addMountPath:(id)a3 withInfo:(id)a4;
- (void)_clearPendingMountPath;
- (void)_initializeMountInfoFromStorage;
- (void)_onQueue_configureMountInfoForPaths:(id)a3;
- (void)_onQueue_registerDiscoveredAppEntries:(id)a3 onMountPoint:(id)a4 completion:(id)a5;
- (void)_onQueue_saveMountPaths;
- (void)_setPendingMountPath:(id)a3;
- (void)registerContentsAtMountPoint:(id)a3 completion:(id)a4;
- (void)reregisterContentsAtMountPoint:(id)a3;
- (void)resetMountPaths;
- (void)setMountInfo:(id)a3;
- (void)setPendingMountPath:(id)a3;
- (void)unregisterContentsAtMountPoint:(id)a3 completion:(id)a4;
@end

@implementation MIDiskImageManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000118A4;
  block[3] = &unk_10008CC28;
  block[4] = a1;
  if (qword_1000A5FA8 != -1) {
    dispatch_once(&qword_1000A5FA8, block);
  }
  v2 = (void *)qword_1000A5FA0;

  return v2;
}

- (void)_initializeMountInfoFromStorage
{
  v3 = sub_100011B34();
  id v15 = 0;
  v4 = +[NSDictionary dictionaryWithContentsOfURL:v3 error:&v15];
  id v5 = v15;
  v6 = v5;
  if (v4)
  {
    v7 = [v4 objectForKeyedSubscript:@"DiskImageMountPaths"];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      objc_opt_class();
      if (sub_100014D8C(v9))
      {
        v12 = [(MIDiskImageManager *)self mountInfoAccessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100011BAC;
        block[3] = &unk_10008CF38;
        block[4] = self;
        id v9 = v9;
        id v14 = v9;
        dispatch_sync(v12, block);

LABEL_19:
        goto LABEL_20;
      }
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_19;
    }
LABEL_18:
    MOLogWrite();
    goto LABEL_19;
  }
  v10 = [v5 domain];
  if ([v10 isEqualToString:NSCocoaErrorDomain])
  {
    id v11 = [v6 code];

    if (v11 == (id)260) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v9 = [v3 path];
    goto LABEL_18;
  }
LABEL_20:
  if (!self->_mountInfo) {
    [(MIDiskImageManager *)self resetMountPaths];
  }
}

- (MIDiskImageManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)MIDiskImageManager;
  v2 = [(MIDiskImageManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileInstallation.MIDiskImageManager.internal", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MobileInstallation.DiskImageManager.lsregister", v6);
    lsRegisterQueue = v2->_lsRegisterQueue;
    v2->_lsRegisterQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MobileInstallation.MIDiskImageManager.mountInfo", v9);
    mountInfoAccessQueue = v2->_mountInfoAccessQueue;
    v2->_mountInfoAccessQueue = (OS_dispatch_queue *)v10;

    [(MIDiskImageManager *)v2 _initializeMountInfoFromStorage];
  }
  return v2;
}

- (void)resetMountPaths
{
  v3 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011D30;
  block[3] = &unk_10008CC50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onQueue_saveMountPaths
{
  v3 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(MIDiskImageManager *)self mountInfo];
  id v5 = [v4 allKeys];

  v6 = sub_100011B34();
  if ([v5 count])
  {
    CFStringRef v15 = @"DiskImageMountPaths";
    v16 = v5;
    dispatch_queue_t v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v13 = 0;
    unsigned __int8 v8 = [v7 MI_writeToURL:v6 format:200 options:268435457 error:&v13];
    id v9 = v13;
    if ((v8 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      v12 = [v6 path];
      MOLogWrite();
    }
  }
  else
  {
    dispatch_queue_t v10 = +[MIFileManager defaultManager];
    id v14 = 0;
    unsigned __int8 v11 = [v10 removeItemAtURL:v6 error:&v14];
    id v9 = v14;

    if ((v11 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
      MOLogWrite();
    }
  }
}

- (id)_mountInfoForPath:(id)a3
{
  v3 = +[NSURL fileURLWithPath:a3 isDirectory:1];
  dispatch_queue_t v4 = +[MIDaemonConfiguration sharedInstance];
  id v5 = [v4 _bundleIDMapForAppsInDirectory:v3];

  return v5;
}

- (void)_onQueue_configureMountInfoForPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [[v12 stringByAppendingPathComponent:@"Applications"] stringByAppendingPathComponent:v15];
        id v14 = [(MIDiskImageManager *)self _mountInfoForPath:v13];
        [v6 setObject:v14 forKeyedSubscript:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(MIDiskImageManager *)self setMountInfo:v6];
}

- (BOOL)_isKnownPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012418;
  block[3] = &unk_10008CF60;
  block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_addMountPath:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012554;
  block[3] = &unk_10008CF88;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (BOOL)_removeMountPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000126B4;
  block[3] = &unk_10008CF60;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_setPendingMountPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000127F0;
  v7[3] = &unk_10008CF38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_clearPendingMountPath
{
  v3 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012884;
  block[3] = &unk_10008CC50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)URLIsOnKnownImageMount:(id)a3
{
  id v4 = a3;
  id v5 = +[MIFileManager defaultManager];
  id v6 = [v5 realPathForURL:v4 allowNonExistentPathComponents:0 isDirectory:1 error:0];

  if (v6)
  {
    id v7 = [v6 path];
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v8 = [(MIDiskImageManager *)self mountInfoAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000129FC;
    block[3] = &unk_10008CF60;
    block[4] = self;
    id v13 = v7;
    char v14 = &v15;
    id v9 = v7;
    dispatch_sync(v8, block);

    BOOL v10 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSSet)diskMountPaths
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = sub_100012C78;
  uint64_t v11 = sub_100012C88;
  id v12 = 0;
  v3 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012C90;
  v6[3] = &unk_10008CFB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (id)diskImageAppInfoForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100012C78;
  long long v16 = sub_100012C88;
  id v17 = 0;
  id v5 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012E64;
  block[3] = &unk_10008CF60;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)bundleIDIsOnKnownImageMount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001308C;
  block[3] = &unk_10008CF60;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (NSSet)diskImageAppBundleIDs
{
  v3 = objc_opt_new();
  id v4 = [(MIDiskImageManager *)self mountInfoAccessQueue];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100013274;
  uint64_t v11 = &unk_10008CF38;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = [v5 copy:v8, v9, v10, v11, v12];

  return (NSSet *)v6;
}

- (id)_onQueue_scanApps:(id)a3 returnMapInfo:(id *)a4
{
  id v6 = a3;
  id v7 = [(MIDiskImageManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  id v10 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v11 = [v10 standardInfoMapInfoPlistKeys];

  uint64_t v12 = +[MIFileManager defaultManager];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100013558;
  v21[3] = &unk_10008D050;
  id v13 = v8;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  id v15 = v9;
  id v24 = v15;
  long long v16 = [v12 enumerateURLsForItemsInDirectoryAtURL:v6 ignoreSymlinks:1 withBlock:v21];

  if (v16 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
  {
    v19 = [v6 path];
    v20 = v16;
    MOLogWrite();
  }
  if (a4) {
    *a4 = [v15 copy];
  }
  id v17 = [v13 copy:v19, v20];

  return v17;
}

- (void)_onQueue_registerDiscoveredAppEntries:(id)a3 onMountPoint:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MIDiskImageManager *)self lsRegisterQueue];
  id v15 = v8;
  long long v16 = v9;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  MIRunTransactionalTask();
}

- (void)registerContentsAtMountPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MIDiskImageManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013E6C;
  block[3] = &unk_10008D0C8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)reregisterContentsAtMountPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(MIDiskImageManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000141B4;
  v7[3] = &unk_10008CF38;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)unregisterContentsAtMountPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MIDiskImageManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000144A8;
  block[3] = &unk_10008D0C8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (OS_dispatch_queue)lsRegisterQueue
{
  return self->_lsRegisterQueue;
}

- (OS_dispatch_queue)mountInfoAccessQueue
{
  return self->_mountInfoAccessQueue;
}

- (NSMutableDictionary)mountInfo
{
  return self->_mountInfo;
}

- (void)setMountInfo:(id)a3
{
}

- (NSString)pendingMountPath
{
  return self->_pendingMountPath;
}

- (void)setPendingMountPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMountPath, 0);
  objc_storeStrong((id *)&self->_mountInfo, 0);
  objc_storeStrong((id *)&self->_mountInfoAccessQueue, 0);
  objc_storeStrong((id *)&self->_lsRegisterQueue, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end