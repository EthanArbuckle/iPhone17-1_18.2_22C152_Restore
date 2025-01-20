@interface NNCompanionSyncServiceManager
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)shouldResumeSync;
- (NNChangeSerializer)serializer;
- (NNCompanionSyncServiceManager)initWithResultsFileURL:(id)a3 pendingSyncFileURL:(id)a4 lastSyncFileURL:(id)a5 syncResultsFileURL:(id)a6;
- (NNCompanionSyncServiceManagerDelegate)delegate;
- (NNCompanionSyncSessionManager)sessionManager;
- (NNSyncableResult)syncableResult;
- (NSURL)lastSyncFileURL;
- (NSURL)pendingSyncFileURL;
- (NSURL)resultsFileURL;
- (NSURL)syncResultsFileURL;
- (OS_dispatch_queue)syncQueue;
- (id)companionSyncSessionManagerWantsHeadlineData:(id)a3;
- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5;
- (void)companionSyncSessionManager:(id)a3 didSyncHeadlineData:(id)a4;
- (void)companionSyncSessionManagerWantsHeadlineUpdate:(id)a3;
- (void)enqueueHeadlineSyncWithData:(id)a3;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSessionManager:(id)a3;
@end

@implementation NNCompanionSyncServiceManager

- (NNCompanionSyncServiceManager)initWithResultsFileURL:(id)a3 pendingSyncFileURL:(id)a4 lastSyncFileURL:(id)a5 syncResultsFileURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)NNCompanionSyncServiceManager;
  v14 = [(NNCompanionSyncServiceManager *)&v31 init];
  if (v14)
  {
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.nanonews.syncQueue", v15);
    syncQueue = v14->_syncQueue;
    v14->_syncQueue = (OS_dispatch_queue *)v16;

    v18 = (NSURL *)[v10 copy];
    resultsFileURL = v14->_resultsFileURL;
    v14->_resultsFileURL = v18;

    v20 = (NSURL *)[v13 copy];
    syncResultsFileURL = v14->_syncResultsFileURL;
    v14->_syncResultsFileURL = v20;

    v22 = (NSURL *)[v11 copy];
    pendingSyncFileURL = v14->_pendingSyncFileURL;
    v14->_pendingSyncFileURL = v22;

    v24 = (NSURL *)[v12 copy];
    lastSyncFileURL = v14->_lastSyncFileURL;
    v14->_lastSyncFileURL = v24;

    v26 = objc_alloc_init(NNChangeSerializer);
    serializer = v14->_serializer;
    v14->_serializer = v26;

    v28 = objc_alloc_init(NNCompanionSyncSessionManager);
    sessionManager = v14->_sessionManager;
    v14->_sessionManager = v28;

    [(NNCompanionSyncSessionManager *)v14->_sessionManager setDelegate:v14];
  }

  return v14;
}

- (NNSyncableResult)syncableResult
{
  v2 = [(NNCompanionSyncServiceManager *)self resultsFileURL];
  v3 = [v2 path];

  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = +[NSData dataWithContentsOfFile:v3];
    if (v6)
    {
      id v11 = 0;
      v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v11];
      id v8 = v11;
      if (!v7)
      {
        v9 = NNSetupCompanionSyncLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000095A0((uint64_t)v6, (uint64_t)v8, v9);
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v7 conformsToProtocol:&OBJC_PROTOCOL___NNSyncableResult] & 1) == 0)
      {

        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (NNSyncableResult *)v7;
}

- (BOOL)shouldResumeSync
{
  v3 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Checking if should resume sync…", (uint8_t *)&v18, 2u);
  }

  v4 = [(NNCompanionSyncServiceManager *)self pendingSyncFileURL];
  unsigned int v5 = +[NSFileManager defaultManager];
  v6 = [v4 path];
  unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = [(NNCompanionSyncServiceManager *)self syncResultsFileURL];
    v9 = +[NSFileManager defaultManager];
    id v10 = [v8 path];
    unsigned __int8 v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      id v12 = +[NSData dataWithContentsOfURL:v4];
      id v13 = +[NSData dataWithContentsOfURL:v8];
      unsigned int v14 = [v12 isEqual:v13];
      v15 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v18 = 134217984;
        uint64_t v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Resume sync - Data equal = %ld", (uint8_t *)&v18, 0xCu);
      }

      char v16 = v14 ^ 1;
    }
    else
    {
      id v12 = NNSetupCompanionSyncLog();
      char v16 = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "WILL resume sync - No sync'd data..", (uint8_t *)&v18, 2u);
      }
    }
  }
  else
  {
    id v8 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will NOT resume sync - No data to sync.", (uint8_t *)&v18, 2u);
    }
    char v16 = 0;
  }

  return v16;
}

- (void)enqueueHeadlineSyncWithData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NNCompanionSyncServiceManager *)self syncQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003AE4;
  v7[3] = &unk_100010498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)companionSyncSessionManagerWantsHeadlineData:(id)a3
{
  v3 = [(NNCompanionSyncServiceManager *)self pendingSyncFileURL];
  id v4 = [v3 path];

  unsigned int v5 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Looking for data at %@!", (uint8_t *)&v12, 0xCu);
  }

  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 fileExistsAtPath:v4];

  id v8 = NNSetupCompanionSyncLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Data found at %@!", (uint8_t *)&v12, 0xCu);
    }

    id v10 = [objc_alloc((Class)NSData) initWithContentsOfFile:v4];
  }
  else
  {
    if (v9)
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No data to sync at %@!", (uint8_t *)&v12, 0xCu);
    }

    id v10 = 0;
  }

  return v10;
}

- (void)companionSyncSessionManager:(id)a3 didSyncHeadlineData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v9 = [(NNCompanionSyncServiceManager *)self lastSyncFileURL];
  id v10 = [v9 path];
  unsigned __int8 v11 = [v7 writeToFile:v10 atomically:1];

  if ((v11 & 1) == 0)
  {
    int v12 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [(NNCompanionSyncServiceManager *)self lastSyncFileURL];
      unsigned int v14 = [v13 path];
      int v15 = 138412546;
      char v16 = v14;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ERROR writing file %@ with data %@.", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)companionSyncSessionManagerWantsHeadlineUpdate:(id)a3
{
  id v4 = [(NNCompanionSyncServiceManager *)self delegate];
  [v4 companionSyncServiceManagerRequestsHeadlineUpdate:self];
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = [v6 service];
  unsigned int v9 = [v8 isMasterStore];

  id v10 = [v7 service];
  unsigned int v11 = [v10 isMasterStore];

  if (v9) {
    id v12 = v6;
  }
  else {
    id v12 = v7;
  }
  if (v9 != v11) {
    id v13 = v12;
  }
  else {
    id v13 = v6;
  }
  id v14 = v13;

  return v14;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = [(NNCompanionSyncServiceManager *)self sessionManager];
  [v6 setDelegate:v7];

  id v8 = [(NNCompanionSyncServiceManager *)self syncQueue];
  [v6 setTargetQueue:v8];

  unsigned int v9 = [(NNCompanionSyncServiceManager *)self serializer];
  [v6 setSerializer:v9];

  id v10 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned int v11 = [v6 delegate];
    id v12 = [v6 targetQueue];
    id v13 = [v6 serializer];
    int v15 = 138412802;
    char v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "STARTING sync session with delegate %@, queue %@, serializer %@.", (uint8_t *)&v15, 0x20u);
  }
  return 1;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Ended sync session.", v10, 2u);
  }

  unsigned int v8 = [v6 state];
  if (v8 == 9)
  {
    unsigned int v9 = [(NNCompanionSyncServiceManager *)self delegate];
    [v9 companionSyncServiceManagerDidFinshSync:self];
  }
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = NNSetupCompanionSyncLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      unsigned int v11 = [v8 UUIDString];
      *(_DWORD *)buf = 138412290;
      __int16 v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Restarting CompanionSync with pairingID: %@", buf, 0xCu);
    }
    id v12 = [(NNCompanionSyncServiceManager *)self syncQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000440C;
    v13[3] = &unk_100010498;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v12, v13);

    unsigned int v9 = v14;
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Device is no longer paired.", buf, 2u);
  }
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (NSURL)syncResultsFileURL
{
  return self->_syncResultsFileURL;
}

- (NSURL)resultsFileURL
{
  return self->_resultsFileURL;
}

- (NNCompanionSyncServiceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNCompanionSyncServiceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)pendingSyncFileURL
{
  return self->_pendingSyncFileURL;
}

- (NSURL)lastSyncFileURL
{
  return self->_lastSyncFileURL;
}

- (NNCompanionSyncSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (NNChangeSerializer)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_lastSyncFileURL, 0);
  objc_storeStrong((id *)&self->_pendingSyncFileURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resultsFileURL, 0);
  objc_storeStrong((id *)&self->_syncResultsFileURL, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end