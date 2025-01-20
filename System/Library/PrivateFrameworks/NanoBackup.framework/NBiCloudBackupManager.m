@interface NBiCloudBackupManager
+ (BOOL)isDataProtectionError:(id)a3;
- (BOOL)_shouldCreateDaily:(id)a3;
- (BOOL)_shouldCreateMonthly:(id)a3;
- (BOOL)_shouldCreateWeekly:(id)a3;
- (NBBackup)inFlightBackupMetaData;
- (NBiCloudBackupManager)init;
- (NBiCloudBackupManager)manager;
- (NPSManager)npsManager;
- (NSCloudKitMirroringDelegateOptions)mirroringOptions;
- (NSPersistentContainer)persistentContainer;
- (NSString)serialNumber;
- (NSXPCConnection)ntkXpcConnection;
- (OS_dispatch_queue)icloudQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_queue)testQueue;
- (id)_NBBackupFromNBBackupiCloudModel:(id)a3;
- (id)_getGestaltNumber:(__CFString *)a3;
- (id)_getGestaltString:(__CFString *)a3;
- (id)connection;
- (id)dateFromPast:(unint64_t)a3 months:(unint64_t)a4 days:(unint64_t)a5 hours:(unint64_t)a6 seconds:(unint64_t)a7;
- (id)finishMetaDataCompletion;
- (id)sortBackupsByDate:(id)a3;
- (id)tempDirString;
- (void)_configureStoreDescriptions;
- (void)_determineBackupToCreateFromBackupList:(id)a3 withCompletion:(id)a4;
- (void)_initCoreData;
- (void)_prune:(id)a3;
- (void)_pruneBackups:(id)a3 backupsToKeep:(unint64_t)a4 withPruneAction:(id)a5;
- (void)_pruneDailyBackups:(id)a3 withPruneAction:(id)a4;
- (void)_pruneMonthlyBackups:(id)a3 withPruneAction:(id)a4;
- (void)_pruneWeeklyBackups:(id)a3 withPruneAction:(id)a4;
- (void)_pruneYearlyBackups:(id)a3 withPruneAction:(id)a4;
- (void)_seperateBackupListsByType:(id)a3 withCompletion:(id)a4;
- (void)backupForID:(id)a3 completion:(id)a4;
- (void)backupList:(id)a3;
- (void)backupPayloadForID:(id)a3 completion:(id)a4;
- (void)createBackupsAndPrune;
- (void)createBackupsAndPruneAtDate:(id)a3 withPayload:(id)a4 completion:(id)a5;
- (void)createInitialBackup:(id)a3;
- (void)createManualBackup:(id)a3;
- (void)dealloc;
- (void)deleteAllBackupsWithCompletion:(id)a3;
- (void)getBackupsWithCompletion:(id)a3;
- (void)getFaceSanpshotWithCompletionHandler:(id)a3;
- (void)injectBackups:(int)a3 completion:(id)a4;
- (void)removeBackupWithID:(id)a3 withCompletion:(id)a4;
- (void)removeBackups:(id)a3;
- (void)requestExportWithCompletion:(id)a3;
- (void)requestImport;
- (void)requestImportWithCompletion:(id)a3;
- (void)setFinishMetaDataCompletion:(id)a3;
- (void)setInFlightBackupMetaData:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setManager:(id)a3;
- (void)setNtkXpcConnection:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation NBiCloudBackupManager

- (NBiCloudBackupManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)NBiCloudBackupManager;
  v2 = [(NBiCloudBackupManager *)&v16 init];
  uint64_t v3 = [(NBiCloudBackupManager *)v2 _getGestaltString:@"SerialNumber"];
  serialNumber = v2->_serialNumber;
  v2->_serialNumber = (NSString *)v3;

  NBLoggingDaemonObjectInit();
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanobackup.iCloud", 0);
  icloudQueue = v2->_icloudQueue;
  v2->_icloudQueue = (OS_dispatch_queue *)v5;

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.nanobackup.ntkQueue", 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v7;

  int out_token = 0;
  if (MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1)
  {
    [(NBiCloudBackupManager *)v2 _initCoreData];
  }
  else
  {
    v9 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Can't init coredata, not past first unlock", buf, 2u);
    }
    v10 = dispatch_get_global_queue(25, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100014408;
    handler[3] = &unk_10002D098;
    v13 = v2;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v10, handler);
  }
  return v2;
}

- (void)dealloc
{
  [(NBiCloudBackupManager *)self setPersistentContainer:0];
  v3.receiver = self;
  v3.super_class = (Class)NBiCloudBackupManager;
  [(NBiCloudBackupManager *)&v3 dealloc];
}

- (void)createBackupsAndPrune
{
}

- (void)createBackupsAndPruneAtDate:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "create in create - DLog", buf, 2u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100014608;
  v15[3] = &unk_10002D138;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(NBiCloudBackupManager *)self getBackupsWithCompletion:v15];
}

- (void)backupPayloadForID:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014DC4;
  v6[3] = &unk_10002D160;
  dispatch_queue_t v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(NBiCloudBackupManager *)v7 backupForID:a3 completion:v6];
}

- (void)_prune:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000150E8;
  v3[3] = &unk_10002D1B0;
  v3[4] = self;
  [(NBiCloudBackupManager *)self _seperateBackupListsByType:a3 withCompletion:v3];
}

- (id)_getGestaltString:(__CFString *)a3
{
  objc_super v3 = (void *)MGCopyAnswer();

  return v3;
}

- (id)_getGestaltNumber:(__CFString *)a3
{
  objc_super v3 = (void *)MGCopyAnswer();

  return v3;
}

- (id)tempDirString
{
  v2 = NSTemporaryDirectory();
  uint64_t v3 = +[NSUUID UUID];
  v4 = [(id)v3 UUIDString];
  id v5 = [v2 stringByAppendingPathComponent:v4];

  v6 = +[NSFileManager defaultManager];
  LOBYTE(v3) = [v6 fileExistsAtPath:v5];

  if ((v3 & 1) != 0
    || (+[NSFileManager defaultManager],
        dispatch_queue_t v7 = objc_claimAutoreleasedReturnValue(),
        id v12 = 0,
        [v7 createDirectoryAtPath:v5 withIntermediateDirectories:0 attributes:0 error:&v12],
        id v8 = v12,
        v7,
        !v8))
  {
    id v10 = v5;
  }
  else
  {
    id v9 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error creating temp directory: %@", buf, 0xCu);
    }

    id v10 = 0;
  }

  return v10;
}

- (void)getFaceSanpshotWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id v7 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "replyBlock(getFaceSanpshotWithCompletionHandler): (%p)", buf, 0xCu);
  }
  if (!v4) {
    +[NSException raise:NSInvalidArgumentException format:@"nil replyBlock"];
  }
  objc_initWeak(&location, self);
  id v8 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = objc_loadWeakRetained(&location);
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "weakSelf: %@", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000157A0;
  block[3] = &unk_10002D228;
  objc_copyWeak(&v15, &location);
  id v14 = v4;
  id v12 = v4;
  dispatch_async((dispatch_queue_t)internalQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)connection
{
  ntkXpcConnection = self->_ntkXpcConnection;
  if (!ntkXpcConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.nanotimekit.facesnapshotserver" options:4096];
    id v5 = self->_ntkXpcConnection;
    self->_ntkXpcConnection = v4;

    if (qword_100034FE8 != -1) {
      dispatch_once(&qword_100034FE8, &stru_10002D248);
    }
    [(NSXPCConnection *)self->_ntkXpcConnection setRemoteObjectInterface:qword_100034FF0];
    objc_initWeak(&location, self);
    [(NSXPCConnection *)self->_ntkXpcConnection setInterruptionHandler:&stru_10002D268];
    v6 = self->_ntkXpcConnection;
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_100016030;
    v11 = &unk_10002CAD8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v6 setInvalidationHandler:&v8];
    [(NSXPCConnection *)self->_ntkXpcConnection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    ntkXpcConnection = self->_ntkXpcConnection;
  }

  return ntkXpcConnection;
}

- (void)backupList:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000161B4;
  v4[3] = &unk_10002C820;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NBiCloudBackupManager *)v5 getBackupsWithCompletion:v4];
}

- (void)deleteAllBackupsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000163C0;
  v4[3] = &unk_10002D290;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NBiCloudBackupManager *)v5 getBackupsWithCompletion:v4];
}

- (id)_NBBackupFromNBBackupiCloudModel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 backupMetaData];
  id v16 = 0;
  id v5 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v4 error:&v16];
  id v6 = v16;
  if (v6)
  {
    id v7 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_NBBackupFromNBBackupiCloudModel failed with error: %@ - %@", buf, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    [v5 finishDecoding];
    id v9 = objc_alloc((Class)NSUUID);
    id v10 = [v3 backupID];
    id v11 = [v9 initWithUUIDString:v10];
    [v8 setUuid:v11];

    id v12 = [v3 payload];
    id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 length]);
    [v8 setSizeInBytes:v13];

    id v14 = [v3 dateCreated];
    [v8 setLastModificationDate:v14];
  }

  return v8;
}

- (void)_pruneDailyBackups:(id)a3 withPruneAction:(id)a4
{
}

- (void)_pruneWeeklyBackups:(id)a3 withPruneAction:(id)a4
{
}

- (void)_pruneMonthlyBackups:(id)a3 withPruneAction:(id)a4
{
}

- (void)_pruneYearlyBackups:(id)a3 withPruneAction:(id)a4
{
}

- (void)_pruneBackups:(id)a3 backupsToKeep:(unint64_t)a4 withPruneAction:(id)a5
{
  id v13 = a3;
  id v7 = (void (**)(id, void *))a5;
  if ((unint64_t)[v13 count] > a4)
  {
    id v8 = [v13 sortedArrayUsingComparator:&stru_10002D2D0];
    if ([v8 count] != (id)a4)
    {
      uint64_t v9 = 0;
      unsigned int v10 = 1;
      do
      {
        id v11 = [v8 objectAtIndexedSubscript:v9];
        v7[2](v7, v11);

        uint64_t v9 = v10;
      }
      while ((char *)[v8 count] - a4 > (char *)v10++);
    }
  }
}

- (void)_determineBackupToCreateFromBackupList:(id)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016848;
  v6[3] = &unk_10002D2F8;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(NBiCloudBackupManager *)v7 _seperateBackupListsByType:a3 withCompletion:v6];
}

- (id)sortBackupsByDate:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_10002D318];
}

- (BOOL)_shouldCreateMonthly:(id)a3
{
  id v4 = a3;
  id v5 = [(NBiCloudBackupManager *)self sortBackupsByDate:v4];
  id v6 = [v5 lastObject];

  id v7 = [v4 count];
  if (v7)
  {
    id v8 = [v6 dateCreated];
    id v9 = objc_alloc_init((Class)NSDateComponents);
    [v9 setMonth:1];
    unsigned int v10 = +[NSCalendar currentCalendar];
    id v11 = [v10 dateByAddingComponents:v9 toDate:v8 options:0];
    id v12 = +[NSDate date];
    id v13 = [v11 compare:v12];

    BOOL v14 = (unint64_t)v13 + 1 < 2;
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)_shouldCreateWeekly:(id)a3
{
  id v3 = [(NBiCloudBackupManager *)self sortBackupsByDate:a3];
  id v4 = [v3 lastObject];

  id v5 = [v4 dateCreated];
  id v6 = objc_alloc_init((Class)NSDateComponents);
  [v6 setDay:7];
  id v7 = +[NSCalendar currentCalendar];
  id v8 = [v7 dateByAddingComponents:v6 toDate:v5 options:0];
  id v9 = +[NSDate date];
  id v10 = [v8 compare:v9];

  return (unint64_t)v10 + 1 < 2;
}

- (BOOL)_shouldCreateDaily:(id)a3
{
  id v3 = [(NBiCloudBackupManager *)self sortBackupsByDate:a3];
  id v4 = [v3 lastObject];

  id v5 = [v4 dateCreated];
  id v6 = objc_alloc_init((Class)NSDateComponents);
  [v6 setDay:1];
  id v7 = +[NSCalendar currentCalendar];
  id v8 = [v7 dateByAddingComponents:v6 toDate:v5 options:0];
  id v9 = +[NSDate date];
  id v10 = [v8 compare:v9];

  return (unint64_t)v10 + 1 < 2;
}

- (void)_seperateBackupListsByType:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  __int16 v19 = (void (**)(id, void *, void *, void *, void *, void *))a4;
  id v6 = objc_opt_new();
  v22 = objc_opt_new();
  v21 = objc_opt_new();
  id v20 = objc_opt_new();
  id v7 = objc_opt_new();
  id v8 = (void *)MGCopyAnswer();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "serialNumber", v19);
        unsigned int v16 = [v15 isEqualToString:v8];

        id v17 = v7;
        if (v16)
        {
          uint64_t v18 = (int)[v14 backupType] - 1;
          id v17 = v6;
          switch(v18)
          {
            case 0:
              goto LABEL_11;
            case 1:
              id v17 = v22;
              goto LABEL_11;
            case 2:
              id v17 = v21;
              goto LABEL_11;
            case 3:
              id v17 = v20;
              goto LABEL_11;
            default:
              continue;
          }
        }
        else
        {
LABEL_11:
          [v17 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v19[2](v19, v6, v22, v21, v20, v7);
}

- (void)removeBackups:(id)a3
{
  id v4 = a3;
  id v5 = [(NSPersistentContainer *)self->_persistentContainer viewContext];
  id v6 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting records: %@", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v15 = 0;
  unsigned __int8 v12 = [v5 save:&v15];
  id v13 = v15;
  if ((v12 & 1) == 0)
  {
    BOOL v14 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Deleting records failed: %@", buf, 0xCu);
    }
  }
}

- (void)removeBackupWithID:(id)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000171AC;
  v6[3] = &unk_10002D340;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(NBiCloudBackupManager *)v7 backupForID:a3 completion:v6];
}

- (void)createInitialBackup:(id)a3
{
  id v4 = a3;
  id v5 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device paired, creating initial backup", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001756C;
  v7[3] = &unk_10002D290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NBiCloudBackupManager *)self getBackupsWithCompletion:v7];
}

- (void)createManualBackup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000179F8;
  v6[3] = &unk_10002D390;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(NBiCloudBackupManager *)self saveBackup:3 withDate:0 payload:0 withCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)getBackupsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017E2C;
  v4[3] = &unk_10002D3B8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NBiCloudBackupManager *)v5 requestImportWithCompletion:v4];
}

- (void)backupForID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Import for backupForID", buf, 2u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018190;
  v11[3] = &unk_10002D3E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NBiCloudBackupManager *)self requestImportWithCompletion:v11];
}

- (void)requestExportWithCompletion:(id)a3
{
  id v4 = a3;
  icloudQueue = self->_icloudQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000185A4;
  v7[3] = &unk_10002C768;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)icloudQueue, v7);
}

- (void)requestImport
{
}

- (void)requestImportWithCompletion:(id)a3
{
  id v4 = a3;
  icloudQueue = self->_icloudQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000187EC;
  v7[3] = &unk_10002C768;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)icloudQueue, v7);
}

- (void)_initCoreData
{
  id v7 = +[NSBundle bundleWithIdentifier:@"com.apple.NanoBackup"];
  id v3 = [v7 URLForResource:@"Model" withExtension:@"momd"];
  id v4 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v3];
  id v5 = [objc_alloc((Class)NSPersistentContainer) initWithName:@"NanoBackup" managedObjectModel:v4];
  [(NBiCloudBackupManager *)self setPersistentContainer:v5];

  [(NBiCloudBackupManager *)self _configureStoreDescriptions];
  id v6 = [(NBiCloudBackupManager *)self persistentContainer];
  [v6 loadPersistentStoresWithCompletionHandler:&stru_10002D460];
}

+ (BOOL)isDataProtectionError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 code];
  id v5 = [v3 domain];
  if ([v5 isEqualToString:NSSQLiteErrorDomain])
  {
    id v6 = +[NSNumber numberWithInteger:v4];
  }
  else
  {
    id v7 = [v3 userInfo];
    id v6 = [v7 objectForKeyedSubscript:NSSQLiteErrorDomain];
  }
  if ([v5 isEqualToString:NSPOSIXErrorDomain])
  {
    id v8 = +[NSNumber numberWithInteger:v4];
  }
  else
  {
    id v9 = [v3 userInfo];
    id v8 = [v9 objectForKeyedSubscript:NSPOSIXErrorDomain];
  }
  BOOL v10 = [v6 intValue] == 23 || objc_msgSend(v8, "intValue") == 1;

  return v10;
}

- (void)_configureStoreDescriptions
{
  id v3 = +[NSFileManager defaultManager];
  id v14 = 0;
  id v4 = [v3 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v14];
  id v5 = v14;
  id v6 = [v4 URLByAppendingPathComponent:@"NanoBackup" isDirectory:1];

  id v7 = [v6 URLByAppendingPathComponent:@"NanoBackupModel" isDirectory:0];
  id v8 = [v7 URLByAppendingPathExtension:@"sqlite"];

  id v9 = [objc_alloc((Class)NSPersistentStoreDescription) initWithURL:v8];
  BOOL v10 = (NSCloudKitMirroringDelegateOptions *)objc_alloc_init((Class)NSCloudKitMirroringDelegateOptions);
  mirroringOptions = self->_mirroringOptions;
  self->_mirroringOptions = v10;

  [(NSCloudKitMirroringDelegateOptions *)self->_mirroringOptions setContainerIdentifier:@"com.apple.watch.setup"];
  [(NSCloudKitMirroringDelegateOptions *)self->_mirroringOptions setUseDeviceToDeviceEncryption:1];
  id v12 = [objc_alloc((Class)NSCloudKitMirroringDelegate) initWithOptions:self->_mirroringOptions];
  [v9 setOption:v12 forMirroringKey:NSPersistentStoreMirroringDelegateOptionKey];
  [v9 setOption:&__NSDictionary0__struct forKey:NSPersistentHistoryTrackingKey];
  id v15 = v9;
  id v13 = +[NSArray arrayWithObjects:&v15 count:1];
  [(NSPersistentContainer *)self->_persistentContainer setPersistentStoreDescriptions:v13];
}

- (id)dateFromPast:(unint64_t)a3 months:(unint64_t)a4 days:(unint64_t)a5 hours:(unint64_t)a6 seconds:(unint64_t)a7
{
  id v12 = +[NSDate date];
  id v13 = objc_alloc_init((Class)NSDateComponents);
  id v14 = v13;
  if (a3) {
    [v13 setYear:-(uint64_t)a3];
  }
  if (a4) {
    [v14 setMonth:-(uint64_t)a4];
  }
  if (a5) {
    [v14 setDay:-(uint64_t)a5];
  }
  if (a6) {
    [v14 setHour:-(uint64_t)a6];
  }
  if (a7) {
    [v14 setSecond:-(uint64_t)a7];
  }
  id v15 = +[NSCalendar currentCalendar];
  long long v16 = [v15 dateByAddingComponents:v14 toDate:v12 options:0];

  return v16;
}

- (void)injectBackups:(int)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  id v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  testQueue = self->_testQueue;
  if (!testQueue)
  {
    BOOL v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.backuptestqueue", v8);
    id v11 = self->_testQueue;
    self->_testQueue = v10;

    testQueue = self->_testQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018FD8;
  block[3] = &unk_10002D488;
  int v15 = a3;
  void block[4] = self;
  id v14 = v6;
  id v12 = v6;
  dispatch_async((dispatch_queue_t)testQueue, block);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NBiCloudBackupManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSCloudKitMirroringDelegateOptions)mirroringOptions
{
  return self->_mirroringOptions;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (OS_dispatch_queue)testQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)icloudQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NBBackup)inFlightBackupMetaData
{
  return self->_inFlightBackupMetaData;
}

- (void)setInFlightBackupMetaData:(id)a3
{
}

- (id)finishMetaDataCompletion
{
  return self->_finishMetaDataCompletion;
}

- (void)setFinishMetaDataCompletion:(id)a3
{
}

- (NSXPCConnection)ntkXpcConnection
{
  return self->_ntkXpcConnection;
}

- (void)setNtkXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ntkXpcConnection, 0);
  objc_storeStrong(&self->_finishMetaDataCompletion, 0);
  objc_storeStrong((id *)&self->_inFlightBackupMetaData, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_icloudQueue, 0);
  objc_storeStrong((id *)&self->_testQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_mirroringOptions, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end