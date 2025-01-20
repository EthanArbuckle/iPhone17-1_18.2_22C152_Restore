@interface NNCompanionSyncService
+ (id)sharedCompanionSyncService;
- (BOOL)updatingHeadlines;
- (NNCompanionSyncService)init;
- (NNCompanionSyncServiceManager)serviceManager;
- (SYService)service;
- (id)_init;
- (void)_updateHeadlines;
- (void)attemptSyncWithCompletion:(id)a3;
- (void)companionSyncServiceManagerRequestsHeadlineUpdate:(id)a3;
- (void)resumeSync;
- (void)setUpdatingHeadlines:(BOOL)a3;
- (void)updateHeadlines;
@end

@implementation NNCompanionSyncService

+ (id)sharedCompanionSyncService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000532C;
  block[3] = &unk_1000103B8;
  block[4] = a1;
  if (qword_1000175E0 != -1) {
    dispatch_once(&qword_1000175E0, block);
  }
  v2 = (void *)qword_1000175D8;
  return v2;
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)NNCompanionSyncService;
  v2 = [(NNCompanionSyncService *)&v23 init];
  if (v2)
  {
    v3 = +[NSFileManager defaultManager];
    v4 = [v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:0];

    v5 = [v4 URLByAppendingPathComponent:@"news-results-to-sync.plist" isDirectory:0];
    v6 = [v4 URLByAppendingPathComponent:@"news-results-last-successful-sync.plist" isDirectory:0];
    v7 = [v4 URLByAppendingPathComponent:@"news-results-last-successful-sync.plist" isDirectory:0];
    v8 = [[NNCompanionSyncServiceManager alloc] initWithResultsFileURL:v7 pendingSyncFileURL:v5 lastSyncFileURL:v6 syncResultsFileURL:v7];
    [(NNCompanionSyncServiceManager *)v8 setDelegate:v2];
    id v9 = [objc_alloc((Class)SYService) initWithService:@"com.apple.private.alloy.news" priority:0 asMasterStore:1 options:0];
    [v9 setEngineType:2];
    v10 = [(NNCompanionSyncServiceManager *)v8 syncQueue];
    [v9 setDelegate:v8 queue:v10];

    v11 = +[NRPairedDeviceRegistry sharedInstance];
    v12 = [v11 getActivePairedDevice];

    v13 = NNSetupCompanionSyncLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = [v12 pairingID];
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting CompanionSync with device pairingID: %@", buf, 0xCu);
      }
      id v22 = 0;
      unsigned __int8 v16 = [v9 resume:&v22];
      v13 = v22;
      if ((v16 & 1) == 0)
      {
        v17 = NNSetupCompanionSyncLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Couldn't startup CompanionSync: %@", buf, 0xCu);
        }
      }
    }
    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "There is no active paired device at this time, will not start CompanionSync", buf, 2u);
    }

    service = v2->_service;
    v2->_service = (SYService *)v9;
    id v19 = v9;

    serviceManager = v2->_serviceManager;
    v2->_serviceManager = v8;
  }
  return v2;
}

- (NNCompanionSyncService)init
{
  return 0;
}

- (void)attemptSyncWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(NNCompanionSyncService *)self service];
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Someone has asked to start a sync with %@.", buf, 0xCu);
  }
  v7 = [(NNCompanionSyncService *)self serviceManager];
  v8 = [v7 syncQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000057E8;
  v10[3] = &unk_100010408;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)resumeSync
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_10000596C;
  v6[4] = sub_10000597C;
  id v7 = (id)os_transaction_create();
  v3 = [(NNCompanionSyncService *)self serviceManager];
  id v4 = [v3 syncQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005984;
  v5[3] = &unk_1000104C0;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

- (void)updateHeadlines
{
}

- (void)companionSyncServiceManagerRequestsHeadlineUpdate:(id)a3
{
}

- (void)_updateHeadlines
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(NNCompanionSyncService *)v2 updatingHeadlines])
  {
    v3 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Skipping fetch of headlines for gizmo. Fetch in progress…", buf, 2u);
    }

    objc_sync_exit(v2);
  }
  else
  {
    [(NNCompanionSyncService *)v2 setUpdatingHeadlines:1];
    objc_sync_exit(v2);

    *(void *)buf = 0;
    v13 = buf;
    uint64_t v14 = 0x3032000000;
    v15 = sub_10000596C;
    unsigned __int8 v16 = sub_10000597C;
    id v17 = objc_alloc_init((Class)NDNewsDaemonContext);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = sub_10000596C;
    v10[4] = sub_10000597C;
    id v11 = (id)os_transaction_create();
    id v4 = objc_alloc_init((Class)NTPBTodayResultOperationInfo);
    [v4 setSlotsLimit:5.0];
    [v4 setAllowOnlyWatchEligibleSections:1];
    [v4 setPreferCompactSectionName:1];
    [v4 setThumbnailSizePreset:2];
    [v4 setSourceNameImageSizePreset:1];
    id v5 = objc_alloc_init((Class)NTPBSectionSlotCostInfo);
    [v5 setHeadlineSlotCost:1.0];
    [v5 setSectionTitleSlotCost:0.0];
    [v4 setSectionSlotCostInfo:v5];
    v6 = NNURLForNanonewscdContent();
    [v4 setAssetsDirectoryFileURL:v6];

    [v4 setAllowSectionTitles:1];
    id v7 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v18 = 134217984;
      uint64_t v19 = 5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching %lu headlines for gizmo.", v18, 0xCu);
    }

    v8 = (void *)*((void *)v13 + 5);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005DA4;
    v9[3] = &unk_100010510;
    v9[4] = v2;
    v9[5] = v10;
    v9[6] = buf;
    [v8 fetchLatestResultsWithParameters:v4 completion:v9];

    _Block_object_dispose(v10, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (SYService)service
{
  return self->_service;
}

- (NNCompanionSyncServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (BOOL)updatingHeadlines
{
  return self->_updatingHeadlines;
}

- (void)setUpdatingHeadlines:(BOOL)a3
{
  self->_updatingHeadlines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end