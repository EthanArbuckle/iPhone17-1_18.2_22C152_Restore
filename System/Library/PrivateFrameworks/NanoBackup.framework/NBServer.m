@interface NBServer
+ (id)legacyContactPreferenceKeys;
+ (id)localUserDefaultsDirectoryForBackupDirectory:(id)a3;
+ (id)remoteBackupDirectoryForBackupDirectory:(id)a3;
+ (id)retrieveGizmoWithPairingID:(id)a3;
+ (unint64_t)recursiveDirectorySize:(id)a3;
- (BOOL)isDevice:(id)a3 mirroringDomain:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NBBackupIndexManager)backupIndexManager;
- (NBBackupiCloud)iCloudBackup;
- (NBExclusionListManager)exclusionListManager;
- (NBRemoteObjectClassC)idsService;
- (NBServer)init;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)vmPressureHandler;
- (id)preferencesSyncBackupDirectoryForPairingDataStore:(id)a3;
- (void)createLocalBackupForPairingID:(id)a3 completionHandler:(id)a4;
- (void)createManualBackupWithCompletion:(id)a3;
- (void)dealloc;
- (void)deleteBackupID:(id)a3 backupType:(unint64_t)a4 completionHandler:(id)a5;
- (void)listBackupsOfType:(unint64_t)a3 timeout:(int64_t)a4 completionHandler:(id)a5;
- (void)migrateBreathePreferences;
- (void)migrateBreathePreferencesFromBackup:(id)a3;
- (void)migrateBreathePreferencesFromDevice:(id)a3;
- (void)migrateFitnessPreferencesFromBackup:(id)a3 device:(id)a4;
- (void)migrateLegacyContactPreferencesFromBackup:(id)a3 device:(id)a4;
- (void)migrateLegacyDigitalTouchPreferencesFromBackup:(id)a3 device:(id)a4;
- (void)restoreFromBackupID:(id)a3 backupType:(unint64_t)a4 forPairingID:(id)a5 completionHandler:(id)a6;
- (void)restoreFromPairingID:(id)a3 forPairingID:(id)a4 completionHandler:(id)a5;
- (void)setBackupIndexManager:(id)a3;
- (void)setBackupsEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setExclusionListManager:(id)a3;
- (void)setICloudBackup:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setVmPressureHandler:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcListener:(id)a3;
@end

@implementation NBServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v16 = v6;
    __int16 v17 = 2048;
    CFStringRef v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "listener: (%p); connection: (%p)", buf, 0x16u);
  }
  v9 = [(__CFString *)v7 valueForEntitlement:@"com.apple.nanobackup"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 BOOLValue])
  {
    if (qword_100034FC8 != -1) {
      dispatch_once(&qword_100034FC8, &stru_10002CAF8);
    }
    [(__CFString *)v7 setExportedInterface:qword_100034FD0];
    [(__CFString *)v7 setExportedObject:self];
    objc_initWeak((id *)buf, v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000076B8;
    v13[3] = &unk_10002CAD8;
    objc_copyWeak(&v14, (id *)buf);
    [(__CFString *)v7 setInvalidationHandler:v13];
    [(__CFString *)v7 setInterruptionHandler:0];
    [(__CFString *)v7 resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
    BOOL v10 = 1;
  }
  else
  {
    v11 = nb_daemon_log;
    BOOL v10 = 0;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      __int16 v17 = 2112;
      CFStringRef v18 = @"com.apple.nanobackup";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connection (%@) refused; Missing entitlement (%@)",
        buf,
        0x16u);
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (void)listBackupsOfType:(unint64_t)a3 timeout:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v9 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = v9;
    id v11 = objc_retainBlock(v8);
    *(_DWORD *)buf = 134217984;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "replyBlock listBackupsOfType: (%p)", buf, 0xCu);
  }
  if (v8)
  {
    v12 = +[NRPairedDeviceRegistry sharedInstance];
    v13 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
    id v14 = [v12 getAllDevicesWithArchivedAltAccountDevicesMatching:v13];
    v15 = [v14 firstObject];

    v16 = [v15 valueForProperty:NRDevicePropertyIsAltAccount];
    unsigned int v17 = [v16 BOOLValue];

    CFStringRef v18 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Tinker device is: %d", buf, 8u);
    }
    workQueue = self->_workQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100001F6C;
    v20[3] = &unk_10002CB90;
    unint64_t v22 = a3;
    int64_t v23 = a4;
    v20[4] = self;
    id v21 = v8;
    dispatch_async((dispatch_queue_t)workQueue, v20);
  }
}

- (NBServer)init
{
  v12.receiver = self;
  v12.super_class = (Class)NBServer;
  v2 = [(NBServer *)&v12 init];
  if (v2)
  {
    NBLoggingDaemonObjectInit();
    v3 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launching; \"NanoBackupDaemon-130\" \"9196\"",
        buf,
        2u);
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanobackupd", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = v2->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007368;
    block[3] = &unk_10002C7F8;
    BOOL v10 = v2;
    dispatch_sync(v7, block);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_vmPressureHandler);
  v3.receiver = self;
  v3.super_class = (Class)NBServer;
  [(NBServer *)&v3 dealloc];
}

+ (id)retrieveGizmoWithPairingID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NRPairedDeviceRegistry sharedInstance];
    dispatch_queue_t v5 = [v4 getAllDevicesWithArchivedDevices];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      uint64_t v10 = NRDevicePropertyPairingID;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "valueForProperty:", v10, (void)v19);
          if ([v3 isEqual:v13])
          {
            id v14 = v12;

            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:

    v15 = (void *)nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      unsigned int v17 = [v3 UUIDString];
      *(_DWORD *)buf = 134218242;
      id v24 = v14;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NanoRegistry returned matching device (%p) for pairingID (%@)", buf, 0x16u);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)preferencesSyncBackupDirectoryForPairingDataStore:(id)a3
{
  return [a3 stringByAppendingPathComponent:kNPSPathComponentsToBackupFolderWithinPairingDataStore];
}

+ (unint64_t)recursiveDirectorySize:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = +[NSFileManager defaultManager];
  id v6 = +[NSURL fileURLWithPath:v4 isDirectory:1];
  NSURLResourceKey v24 = NSURLFileSizeKey;
  id v7 = +[NSArray arrayWithObjects:&v24 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100007BA8;
  v22[3] = &unk_10002CB18;
  v22[4] = a1;
  id v8 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:0 errorHandler:v22];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        if ([v15 getResourceValue:&v17 forKey:NSURLFileSizeKey error:0]) {
          v12 += (unint64_t)[v17 unsignedLongLongValue];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

+ (id)localUserDefaultsDirectoryForBackupDirectory:(id)a3
{
  return [a3 stringByAppendingPathComponent:@"Local"];
}

+ (id)remoteBackupDirectoryForBackupDirectory:(id)a3
{
  return [a3 stringByAppendingPathComponent:@"Remote"];
}

- (void)deleteBackupID:(id)a3 backupType:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = [v7 UUIDString];
    id v12 = objc_retainBlock(v8);
    *(_DWORD *)buf = 138412546;
    NSURLResourceKey v24 = v11;
    __int16 v25 = 2048;
    id v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "deleteBackupID - backupID: (%@); replyBlock: (%p)",
      buf,
      0x16u);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100007F60;
  v21[3] = &unk_10002C988;
  id v13 = v8;
  id v22 = v13;
  id v14 = objc_retainBlock(v21);
  if (v7)
  {
    workQueue = self->_workQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100007F78;
    v18[3] = &unk_10002C870;
    v18[4] = self;
    id v19 = v7;
    long long v20 = v14;
    dispatch_async((dispatch_queue_t)workQueue, v18);
  }
  else
  {
    v16 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      NSURLResourceKey v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalid parameters; backupID: (%@)",
        buf,
        0xCu);
    }
    id v17 = NBError();
    ((void (*)(void *, void *))v14[2])(v14, v17);
  }
}

- (void)setBackupsEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (__CFString *)objc_retainBlock(v6);
    int v17 = 134217984;
    CFStringRef v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "replyBlock setBackupsEnabled: (%p)", (uint8_t *)&v17, 0xCu);
  }
  id v10 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v4) {
      CFStringRef v11 = @"YES";
    }
    int v17 = 138412290;
    CFStringRef v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating backup state to: %@", (uint8_t *)&v17, 0xCu);
  }
  CFStringRef v12 = (const __CFString *)iCloudBackupsEnabled;
  id v13 = +[NSNumber numberWithBool:v4];
  CFPreferencesSetAppValue(v12, v13, NanoBackupDomain);
  iCloudBackup = self->_iCloudBackup;
  if (!iCloudBackup)
  {
    v15 = (NBBackupiCloud *)objc_opt_new();
    v16 = self->_iCloudBackup;
    self->_iCloudBackup = v15;

    iCloudBackup = self->_iCloudBackup;
  }
  [(NBBackupiCloud *)iCloudBackup startSchedulerIfNecessary];
  (*((void (**)(id, void))v6 + 2))(v6, 0);
}

- (void)createManualBackupWithCompletion:(id)a3
{
  id v4 = a3;
  iCloudBackup = self->_iCloudBackup;
  if (!iCloudBackup)
  {
    id v6 = (NBBackupiCloud *)objc_opt_new();
    id v7 = self->_iCloudBackup;
    self->_iCloudBackup = v6;

    iCloudBackup = self->_iCloudBackup;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000084C4;
  v9[3] = &unk_10002C988;
  id v10 = v4;
  id v8 = v4;
  [(NBBackupiCloud *)iCloudBackup createManualBackupWithCompletion:v9];
}

- (void)restoreFromBackupID:(id)a3 backupType:(unint64_t)a4 forPairingID:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  CFStringRef v12 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = [v9 UUIDString];
    v15 = [v10 UUIDString];
    id v16 = objc_retainBlock(v11);
    *(_DWORD *)buf = 138412802;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    __int16 v32 = 2048;
    id v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "backupID: (%@); pairingID: (%@); replyBlock: (%p)",
      buf,
      0x20u);
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100008798;
  v26[3] = &unk_10002C988;
  id v17 = v11;
  id v27 = v17;
  CFStringRef v18 = objc_retainBlock(v26);
  if (v9 && v10)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000087B0;
    block[3] = &unk_10002CC80;
    void block[4] = self;
    id v23 = v9;
    __int16 v25 = v18;
    id v24 = v10;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
  else
  {
    long long v20 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Invalid parameters; backupID: (%@); pairingID: (%@)",
        buf,
        0x16u);
    }
    long long v21 = NBError();
    ((void (*)(void *, void *))v18[2])(v18, v21);
  }
}

- (void)restoreFromPairingID:(id)a3 forPairingID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = v11;
    id v13 = [v8 UUIDString];
    id v14 = [v9 UUIDString];
    id v15 = objc_retainBlock(v10);
    *(_DWORD *)buf = 138412802;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2048;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "existingPairingID: (%@); pairingID: (%@); replyBlock: (%p)",
      buf,
      0x20u);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100009D24;
  v25[3] = &unk_10002C988;
  id v16 = v10;
  id v26 = v16;
  id v17 = objc_retainBlock(v25);
  if (v8 && v9)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009D3C;
    block[3] = &unk_10002CD20;
    void block[4] = self;
    id v22 = v8;
    id v23 = v9;
    id v24 = v17;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
  else
  {
    id v19 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Invalid parameters; existingPairingID: (%@); pairingID: (%@)",
        buf,
        0x16u);
    }
    long long v20 = NBError();
    ((void (*)(void *, void *))v17[2])(v17, v20);
  }
}

- (void)createLocalBackupForPairingID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v6 UUIDString];
    id v11 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138412546;
    id v23 = v10;
    __int16 v24 = 2048;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "pairingID: (%@); replyBlock: (%p)", buf, 0x16u);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000ADF8;
  v20[3] = &unk_10002C988;
  id v12 = v7;
  id v21 = v12;
  id v13 = objc_retainBlock(v20);
  if (v6)
  {
    workQueue = self->_workQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000AE18;
    v17[3] = &unk_10002C870;
    v17[4] = self;
    id v18 = v6;
    id v19 = v12;
    dispatch_async((dispatch_queue_t)workQueue, v17);
  }
  else
  {
    id v15 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Invalid parameters; pairingID: (%@)",
        buf,
        0xCu);
    }
    id v16 = NBError();
    ((void (*)(void *, void *))v13[2])(v13, v16);
  }
}

+ (id)legacyContactPreferenceKeys
{
  if (qword_100034FE0 != -1) {
    dispatch_once(&qword_100034FE0, &stru_10002CDE0);
  }
  v2 = (void *)qword_100034FD8;

  return v2;
}

- (BOOL)isDevice:(id)a3 mirroringDomain:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.bulletinboard.apps" pairedDevice:v6];

  id v8 = [v7 synchronize];
  id v9 = [v7 objectForKey:v5];

  id v10 = [v9 objectForKeyedSubscript:@"BPSNanoBulletinShowsCustomSettings"];
  char v11 = [v10 BOOLValue] ^ 1;

  return v11;
}

- (void)migrateLegacyContactPreferencesFromBackup:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 productName];

  if (v8)
  {
    id v9 = [v6 productName];
    id v10 = [v6 systemVersion];
    NRWatchOSVersion();

    if (NRVersionIsGreaterThanOrEqual()) {
      goto LABEL_24;
    }
LABEL_5:
    NRWatchOSVersionForRemoteDevice();
    int IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
    unsigned int v14 = [(NBServer *)self isDevice:v7 mirroringDomain:@"com.apple.PeoplePicker"];
    id v15 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.PeoplePicker" pairedDevice:v7];
    id v16 = objc_alloc((Class)NPSDomainAccessor);
    id v36 = [v16 initWithDomain:NSPersonNameDefaultNamePreferencesDomain pairedDevice:v7];
    if ((IsGreaterThanOrEqual & 1) != 0 || !v14)
    {
      id v21 = +[NSMutableDictionary dictionary];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v26 = [(id)objc_opt_class() legacyContactPreferenceKeys];
      id v27 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v42;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            id v32 = [v15 objectForKey:v31];
            if (v32)
            {
              [v21 setObject:v32 forKey:v31];
              if (IsGreaterThanOrEqual) {
                [v15 removeObjectForKey:v31];
              }
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v28);
      }

      if (![v21 count])
      {
        id v7 = v35;
        id v25 = v36;
        goto LABEL_23;
      }
      id v7 = v35;
      id v25 = v36;
      if (IsGreaterThanOrEqual) {
        id v33 = [v15 synchronize];
      }
      id v22 = +[NSPersonNameComponentsFormatterPreferences mappedPreferencesForPreferences:v21 from:2 to:0];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10000C954;
      v39[3] = &unk_10002CE08;
      id v23 = &v40;
      id v24 = v36;
      id v40 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v39];
    }
    else
    {
      v45[0] = NSPersonNameDefaultDisplayNameOrderKey;
      id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder]);
      v46[0] = v17;
      v45[1] = NSPersonNameDefaultShortNameEnabledKey;
      id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[NSPersonNameComponentsFormatter _shortNameIsEnabled]);
      v46[1] = v18;
      v45[2] = NSPersonNameDefaultShortNameFormatKey;
      id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[NSPersonNameComponentsFormatter _defaultShortNameFormat]);
      v46[2] = v19;
      v45[3] = NSPersonNameDefaultShouldPreferNicknamesKey;
      long long v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[NSPersonNameComponentsFormatter _shouldPreferNicknames]);
      v46[3] = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];

      id v22 = +[NSPersonNameComponentsFormatterPreferences mappedPreferencesForPreferences:v21 from:0 to:2];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000C960;
      v37[3] = &unk_10002CE08;
      id v23 = &v38;
      id v24 = v15;
      id v38 = v24;
      [v22 enumerateKeysAndObjectsUsingBlock:v37];
      id v25 = v36;
    }
    id v34 = [v24 synchronize];

LABEL_23:
    goto LABEL_24;
  }
  char v11 = [v6 systemBuildVersion];
  unsigned int v12 = [v11 hasPrefix:@"12S"];

  if (v12) {
    goto LABEL_5;
  }
LABEL_24:
}

- (void)migrateLegacyDigitalTouchPreferencesFromBackup:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 productName];

  if (v7)
  {
    id v8 = [v5 productName];
    id v9 = [v5 systemVersion];
    NRWatchOSVersion();

    if (NRVersionIsGreaterThanOrEqual()) {
      goto LABEL_39;
    }
  }
  else
  {
    id v10 = [v5 systemBuildVersion];
    if ([v10 hasPrefix:@"12S"])
    {
    }
    else
    {
      char v11 = [v5 systemBuildVersion];
      unsigned int v12 = [v11 hasPrefix:@"13S"];

      if (!v12) {
        goto LABEL_39;
      }
    }
  }
  NRWatchOSVersionForRemoteDevice();
  if (NRVersionIsGreaterThanOrEqual())
  {
    id v13 = (void *)CFPreferencesCopyAppValue(@"FriendList", @"com.apple.ET");
    unsigned int v14 = (void *)CFPreferencesCopyAppValue(@"ETFriendGroupTitles", @"com.apple.ET");
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(@"DidNormalizeFriendListDestinations", @"com.apple.ET", &keyExistsAndHasValidFormat);
    id v15 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.ET" pairedDevice:v6];
    id v16 = [v15 arrayForKey:@"FriendList"];
    id v17 = [v15 arrayForKey:@"ETFriendGroupTitles"];
    char v28 = 0;
    unsigned int v18 = [v15 BOOLForKey:@"DidNormalizeFriendListDestinations" keyExistsAndHasValidFormat:&v28];
    id v27 = v13;
    BOOL v19 = 0;
    if (![v13 count]) {
      BOOL v19 = [v16 count] != 0;
    }
    id v26 = v14;
    if ([v14 count]) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = [v17 count] != 0;
    }
    if (keyExistsAndHasValidFormat) {
      BOOL v21 = 1;
    }
    else {
      BOOL v21 = v28 == 0;
    }
    int v22 = !v21;
    int v23 = !v21 || v19 || v20;
    if (v19)
    {
      CFPreferencesSetAppValue(@"FriendList", v16, @"com.apple.ET");
      if (!v20)
      {
LABEL_24:
        if (!v22) {
          goto LABEL_25;
        }
        goto LABEL_29;
      }
    }
    else if (!v20)
    {
      goto LABEL_24;
    }
    CFPreferencesSetAppValue(@"ETFriendGroupTitles", v17, @"com.apple.ET");
    if (!v22)
    {
LABEL_25:
      if (!v23) {
        goto LABEL_38;
      }
LABEL_32:
      if (CFPreferencesAppSynchronize(@"com.apple.ET") != 1)
      {
LABEL_38:

        goto LABEL_39;
      }
      if (v19)
      {
        [v15 removeObjectForKey:@"FriendList"];
        if (!v20)
        {
LABEL_35:
          if (!v22)
          {
LABEL_37:
            id v25 = [v15 synchronize];
            goto LABEL_38;
          }
LABEL_36:
          [v15 removeObjectForKey:@"DidNormalizeFriendListDestinations"];
          goto LABEL_37;
        }
      }
      else if (!v20)
      {
        goto LABEL_35;
      }
      [v15 removeObjectForKey:@"ETFriendGroupTitles"];
      if (!v22) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
LABEL_29:
    id v24 = (CFPropertyListRef *)&kCFBooleanTrue;
    if (!v18) {
      id v24 = (CFPropertyListRef *)&kCFBooleanFalse;
    }
    CFPreferencesSetAppValue(@"DidNormalizeFriendListDestinations", *v24, @"com.apple.ET");
    if (!v23) {
      goto LABEL_38;
    }
    goto LABEL_32;
  }
LABEL_39:
}

- (void)migrateFitnessPreferencesFromBackup:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 productName];

  if (v7)
  {
    id v8 = [v5 productName];
    id v9 = [v5 systemVersion];
    NRWatchOSVersion();

    if (NRVersionIsGreaterThanOrEqual()) {
      goto LABEL_31;
    }
  }
  else
  {
    id v10 = [v5 systemBuildVersion];
    if ([v10 hasPrefix:@"12S"])
    {
    }
    else
    {
      char v11 = [v5 systemBuildVersion];
      unsigned int v12 = [v11 hasPrefix:@"13S"];

      if (!v12) {
        goto LABEL_31;
      }
    }
  }
  NRWatchOSVersionForRemoteDevice();
  if (NRVersionIsGreaterThanOrEqual())
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesGetAppBooleanValue(@"EnableHeartRate", @"com.apple.nanolifestyle.privacy", &keyExistsAndHasValidFormat);
    CFPreferencesGetAppBooleanValue(@"EnableFitnessTracking", @"com.apple.nanolifestyle.privacy", &keyExistsAndHasValidFormat);
    id v13 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanolifestyle.privacy" pairedDevice:v6];
    char v24 = 0;
    unsigned int v14 = [v13 BOOLForKey:@"EnableHeartRate" keyExistsAndHasValidFormat:&v24];
    unsigned __int8 v23 = 0;
    unsigned int v15 = [v13 BOOLForKey:@"EnableFitnessTracking" keyExistsAndHasValidFormat:&v23];
    if (keyExistsAndHasValidFormat) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v24 == 0;
    }
    int v17 = !v16;
    int v18 = v23;
    if (v16)
    {
      if (!v23) {
        goto LABEL_30;
      }
    }
    else
    {
      if (v14) {
        BOOL v19 = (CFPropertyListRef *)&kCFBooleanTrue;
      }
      else {
        BOOL v19 = (CFPropertyListRef *)&kCFBooleanFalse;
      }
      CFPreferencesSetAppValue(@"EnableHeartRate", *v19, @"com.apple.nanolifestyle.privacy");
      if (!v18)
      {
        if (CFPreferencesAppSynchronize(@"com.apple.nanolifestyle.privacy") == 1)
        {
          CFStringRef v20 = @"EnableHeartRate";
LABEL_29:
          [v13 removeObjectForKey:v20];
          id v22 = [v13 synchronize];
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    if (v15) {
      BOOL v21 = (CFPropertyListRef *)&kCFBooleanTrue;
    }
    else {
      BOOL v21 = (CFPropertyListRef *)&kCFBooleanFalse;
    }
    CFPreferencesSetAppValue(@"EnableFitnessTracking", *v21, @"com.apple.nanolifestyle.privacy");
    if (CFPreferencesAppSynchronize(@"com.apple.nanolifestyle.privacy") != 1) {
      goto LABEL_30;
    }
    if (v17) {
      [v13 removeObjectForKey:@"EnableHeartRate"];
    }
    CFStringRef v20 = @"EnableFitnessTracking";
    goto LABEL_29;
  }
LABEL_31:
}

- (void)migrateBreathePreferencesFromBackup:(id)a3
{
  id v10 = a3;
  id v4 = [v10 productName];

  if (!v4)
  {
    id v7 = [v10 systemBuildVersion];
    if ([v7 hasPrefix:@"12S"])
    {
    }
    else
    {
      id v8 = [v10 systemBuildVersion];
      unsigned int v9 = [v8 hasPrefix:@"13S"];

      if (!v9) {
        goto LABEL_8;
      }
    }
    goto LABEL_7;
  }
  id v5 = [v10 productName];
  id v6 = [v10 systemVersion];
  NRWatchOSVersion();

  if ((NRVersionIsGreaterThanOrEqual() & 1) == 0) {
LABEL_7:
  }
    [(NBServer *)self migrateBreathePreferences];
LABEL_8:
}

- (void)migrateBreathePreferencesFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"2A51E7B3-1B80-4981-9F09-F725BC3A8065"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  if ((v6 & 1) == 0)
  {
    [(NBServer *)self migrateBreathePreferences];
  }
}

- (void)migrateBreathePreferences
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.bulletinboard.apps"];
  id v3 = [v2 dictionaryForKey:@"com.apple.DeepBreathing"];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = [v2 dictionaryForKey:@"com.apple.Mind"];
  unsigned __int8 v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    [v4 setObject:@"com.apple.Mind" forKeyedSubscript:@"BPSNanoBulletinSectionId"];
    [v2 setObject:v4 forKey:@"com.apple.Mind"];
    [v2 removeObjectForKey:@"com.apple.DeepBreathing"];
    id v8 = [v2 synchronize];
    unsigned int v9 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFBooleanRef v30 = (CFBooleanRef)v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrating Breathe notification settings %@", buf, 0xCu);
    }
  }
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppIntegerValue(@"RemindersPerDay", @"com.apple.DeepBreathing", &keyExistsAndHasValidFormat) <= 0)CFBooleanRef v10 = kCFBooleanFalse; {
  else
  }
    CFBooleanRef v10 = kCFBooleanTrue;
  Boolean v27 = 0;
  CFPreferencesGetAppBooleanValue(@"EnableStartOfDayReminder", @"com.apple.Mind", &v27);
  if (keyExistsAndHasValidFormat && !v27)
  {
    char v11 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFBooleanRef v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Migrating mindfulness start of day reminder %@", buf, 0xCu);
    }
    CFPreferencesSetAppValue(@"EnableStartOfDayReminder", v10, @"com.apple.Mind");
  }
  Boolean v26 = 0;
  CFPreferencesGetAppBooleanValue(@"EnableEndOfDayReminder", @"com.apple.Mind", &v26);
  if (keyExistsAndHasValidFormat && !v26)
  {
    unsigned int v12 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFBooleanRef v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Migrating mindfulness end of day reminder %@", buf, 0xCu);
    }
    CFPreferencesSetAppValue(@"EnableEndOfDayReminder", v10, @"com.apple.Mind");
  }
  Boolean v25 = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableWeeklySummary", @"com.apple.DeepBreathing", &v25);
  Boolean v24 = 0;
  CFPreferencesGetAppBooleanValue(@"EnableWeeklySummary", @"com.apple.Mind", &v24);
  if (v25 && !v24)
  {
    unsigned int v14 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = AppBooleanValue;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Migrating mindfulness weekly summary enabled %{BOOL}d", buf, 8u);
    }
    if (AppBooleanValue) {
      CFBooleanRef v15 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v15 = kCFBooleanFalse;
    }
    CFPreferencesSetAppValue(@"EnableWeeklySummary", v15, @"com.apple.Mind");
  }
  Boolean v23 = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BreathRate", @"com.apple.DeepBreathing", &v23);
  Boolean v22 = 0;
  CFPreferencesGetAppIntegerValue(@"BreathRate", @"com.apple.Mind", &v22);
  if (v23 && !v22)
  {
    int v17 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = AppIntegerValue;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Migrating mindfulness breath rate %d", buf, 8u);
    }
    CFPreferencesSetAppValue(@"BreathRate", +[NSNumber numberWithInteger:AppIntegerValue], @"com.apple.Mind");
  }
  Boolean v21 = 0;
  CFIndex v18 = CFPreferencesGetAppIntegerValue(@"HapticLevel", @"com.apple.DeepBreathing", &v21);
  Boolean v20 = 0;
  CFPreferencesGetAppIntegerValue(@"HapticLevel", @"com.apple.Mind", &v20);
  if (v21 && !v20)
  {
    BOOL v19 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Migrating mindfulness haptic level %d", buf, 8u);
    }
    CFPreferencesSetAppValue(@"HapticLevel", +[NSNumber numberWithInteger:v18], @"com.apple.Mind");
  }
  CFPreferencesAppSynchronize(@"com.apple.Mind");
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_source)vmPressureHandler
{
  return self->_vmPressureHandler;
}

- (void)setVmPressureHandler:(id)a3
{
}

- (NBBackupIndexManager)backupIndexManager
{
  return self->_backupIndexManager;
}

- (void)setBackupIndexManager:(id)a3
{
}

- (NBExclusionListManager)exclusionListManager
{
  return self->_exclusionListManager;
}

- (void)setExclusionListManager:(id)a3
{
}

- (NBRemoteObjectClassC)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (NBBackupiCloud)iCloudBackup
{
  return self->_iCloudBackup;
}

- (void)setICloudBackup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudBackup, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_exclusionListManager, 0);
  objc_storeStrong((id *)&self->_backupIndexManager, 0);
  objc_storeStrong((id *)&self->_vmPressureHandler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end