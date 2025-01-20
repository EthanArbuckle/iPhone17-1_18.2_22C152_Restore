@interface MSDManager
+ (id)sharedInstance;
- (CUCoalescer)coalescer;
- (MSDDefaultsManager)defaultsManager;
- (MSDManager)init;
- (MSDProfilesManager)profilesManager;
- (MSServer)server;
- (MSServerMediator)mediator;
- (OS_dispatch_queue)startupQueue;
- (void)_clearCachedIconImage:(id)a3;
- (void)_initializeBackgroundActivityTask;
- (void)_initializeCoalescerObject;
- (void)_markHomeKitInitialized;
- (void)_performStartup;
- (void)_savePublicDBInfoInDefaults;
- (void)_schedulePublicDBRefreshBackgroundTask;
- (void)_scheduleRefreshTask;
- (void)_setupMultiUser;
- (void)_setupNotifications;
- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5;
- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6;
- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5;
- (void)getDefaultMediaServiceForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4;
- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)getSupportedThirdPartyMediaServices:(id)a3;
- (void)homeManager:(id)a3 didHomeKitSyncComplete:(id)a4;
- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5;
- (void)profilesManager:(id)a3 didAddProfiles:(id)a4;
- (void)profilesManager:(id)a3 didUpdateProfiles:(id)a4;
- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6;
- (void)setCoalescer:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setMediator:(id)a3;
- (void)setProfilesManager:(id)a3;
- (void)setServer:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7;
@end

@implementation MSDManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D60;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_100056780 != -1) {
    dispatch_once(&qword_100056780, block);
  }
  v2 = (void *)qword_100056778;

  return v2;
}

- (MSDManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)MSDManager;
  v2 = [(MSDManager *)&v20 init];
  if (v2)
  {
    v3 = sub_100031A80();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[MSDManager init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    uint64_t v4 = +[MSDDefaultsManager sharedManager];
    defaultsManager = v2->_defaultsManager;
    v2->_defaultsManager = (MSDDefaultsManager *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediasetupd.startupQueue", 0);
    startupQueue = v2->_startupQueue;
    v2->_startupQueue = (OS_dispatch_queue *)v6;

    objc_initWeak((id *)buf, v2);
    v8 = v2->_startupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012FEC;
    block[3] = &unk_10004C9C0;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_async(v8, block);
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediasetup.publicdb-refresh-queue", v9);
    publicDBRefreshQueue = v2->_publicDBRefreshQueue;
    v2->_publicDBRefreshQueue = (OS_dispatch_queue *)v10;

    v2->_homeKitSyncComplete = 0;
    v12 = +[MSDHomeManager sharedManager];
    [v12 addDelegate:v2];

    v13 = (MSServerMediator *)[objc_alloc((Class)MSServerMediator) initWithAccountsDelegate:v2];
    mediator = v2->_mediator;
    v2->_mediator = v13;

    v15 = (MSServer *)[objc_alloc((Class)MSServer) initWithMediator:v2->_mediator];
    server = v2->_server;
    v2->_server = v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)_performStartup
{
  id v3 = +[MSDPushService sharedService];
  uint64_t v4 = (MSDProfilesManager *)objc_opt_new();
  profilesManager = self->_profilesManager;
  self->_profilesManager = v4;

  [(MSDProfilesManager *)self->_profilesManager setDelegate:self];
  [(MSDManager *)self _setupNotifications];

  [(MSDManager *)self _schedulePublicDBRefreshBackgroundTask];
}

- (void)_setupMultiUser
{
  v2 = +[MSDDataController sharedInstance];
  id v3 = [v2 homeManager];
  uint64_t v4 = +[CKContainer MSDCloudKitContainerID];
  v14 = v4;
  v5 = +[NSArray arrayWithObjects:&v14 count:1];
  [v3 registerToAcceptCloudSharesForContainers:v5];

  if (+[MSDeviceInfo deviceCanManageMultiUser])
  {
    dispatch_queue_t v6 = +[MSDDataController sharedInstance];
    v7 = [v6 cloudManager];
    v8 = +[CKContainer MSDCloudKitContainer];
    v9 = [v8 privateCloudDatabase];
    [v7 addSubscriptionForDatabase:v9];

    dispatch_queue_t v10 = +[MSDDataController sharedInstance];
    v11 = [v10 cloudManager];
    v12 = +[CKContainer MSDCloudKitContainer];
    v13 = [v12 sharedCloudDatabase];
    [v11 addSubscriptionForDatabase:v13];
  }
}

- (void)_setupNotifications
{
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing XPC event stream handler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013350;
  handler[3] = &unk_10004D458;
  objc_copyWeak(&v6, buf);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_initializeCoalescerObject
{
  id v3 = objc_alloc_init((Class)CUCoalescer);
  [v3 setDispatchQueue:&_dispatch_main_q];
  [v3 setMinDelay:MSMinDelayInSecForSchedulingCoalescerTask];
  [v3 setMaxDelay:MSMaxDelayInSecsForSchedulingCoalescerTask];
  [v3 setInvalidationHandler:&stru_10004D478];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001377C;
  v8[3] = &unk_10004C9C0;
  objc_copyWeak(&v9, &location);
  [v3 setActionHandler:v8];
  id v4 = sub_100031A80();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initialized CUCoalescer object %{private}@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000137FC;
  v6[3] = &unk_10004D310;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_scheduleRefreshTask
{
  id v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduling task to refresh data with CloudKit", v4, 2u);
  }

  [(MSDManager *)self _initializeBackgroundActivityTask];
}

- (void)_initializeBackgroundActivityTask
{
  id v2 = objc_alloc((Class)NSBackgroundActivityScheduler);
  id v4 = [v2 initWithIdentifier:kBackgroundActivityDataRefreshTaskIdentifier];
  [v4 invalidate];
  id v3 = dispatch_get_global_queue(2, 0);
  dispatch_async(v3, &stru_10004D498);
}

- (void)_savePublicDBInfoInDefaults
{
  id v2 = +[MSDPublicDBManager shared];
  unsigned __int8 v3 = [v2 shouldUseCloudKit];

  if (v3)
  {
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    id v5 = +[MSDPublicDBManager shared];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100013BAC;
    v9[3] = &unk_10004D4E0;
    id v6 = v4;
    dispatch_queue_t v10 = v6;
    [v5 syncDataWithCloudKit:v9];

    dispatch_time_t v7 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
    if (dispatch_group_wait(v6, v7))
    {
      v8 = sub_100031A80();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100018840();
      }
    }
  }
  else
  {
    id v6 = sub_100031A80();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v12 = MSPublicDatabaseRefreshIntervalInSecs / 3600.0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Its been less than %f hours since last Public Database refresh, skipping check", buf, 0xCu);
    }
  }
}

- (void)_markHomeKitInitialized
{
  publicDBRefreshQueue = self->_publicDBRefreshQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013CD0;
  block[3] = &unk_10004CAC0;
  void block[4] = self;
  dispatch_async(publicDBRefreshQueue, block);
}

- (void)_schedulePublicDBRefreshBackgroundTask
{
  unsigned __int8 v3 = sub_100031A80();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduling background task for publicDB refreshes", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = +[BGSystemTaskScheduler sharedScheduler];
  publicDBRefreshQueue = self->_publicDBRefreshQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013E1C;
  v6[3] = &unk_10004D530;
  objc_copyWeak(&v7, buf);
  [v4 registerForTaskWithIdentifier:@"com.apple.mediasetupd.publicDBRefresh" usingQueue:publicDBRefreshQueue launchHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_clearCachedIconImage:(id)a3
{
  id v3 = a3;
  id v4 = [[MSDArtworkManager alloc] initWithServiceID:v3 remoteImageURL:0];

  unsigned int v5 = [(MSDArtworkManager *)v4 removeCachedIconImage];
  id v6 = sub_100031A80();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed cached service icon image", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10001898C();
  }
}

- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_t v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v33 = v7;
    __int16 v34 = 2113;
    id v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User is requesting available services for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    v11 = +[MSDDataController sharedInstance];
    v28[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    double v12 = [v7 UUIDString];
    v29[0] = v12;
    v28[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v13 = [v8 UUIDString];
    v29[1] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100014484;
    v26[3] = &unk_10004D558;
    id v27 = v9;
    [v11 getAvailableServices:v14 completion:v26];

    v15 = v27;
LABEL_10:

    goto LABEL_11;
  }
  v16 = sub_100031A80();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000189C0(v16, v17, v18, v19, v20, v21, v22, v23);
  }

  if (v9)
  {
    uint64_t v24 = MSErrorDomain;
    uint64_t v30 = MSUserInfoErrorStringKey;
    CFStringRef v31 = @"Failed to fetch available services, NIL identifiers provided";
    v15 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v25 = +[NSError errorWithDomain:v24 code:3 userInfo:v15];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v25);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_queue_t v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v28 = v7;
    __int16 v29 = 2113;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User is requesting available services for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    v11 = +[MSDDataController sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000147C8;
    v23[3] = &unk_10004D558;
    id v24 = v9;
    [v11 getCachedAvailableServices:v8 homeID:v7 completion:v23];

    double v12 = v24;
LABEL_10:

    goto LABEL_11;
  }
  v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000189C0(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  if (v9)
  {
    uint64_t v21 = MSErrorDomain;
    uint64_t v25 = MSUserInfoErrorStringKey;
    CFStringRef v26 = @"Failed to fetch available services, NIL identifiers provided";
    double v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v22 = +[NSError errorWithDomain:v21 code:3 userInfo:v12];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v22);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_retainBlock(v10);
  if (v11)
  {
    if (v9 && [v9 count])
    {
      double v12 = [v9 na_map:&stru_10004D598];
      v13 = sub_100031A80();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        id v31 = v8;
        __int16 v32 = 2113;
        id v33 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "User is requesting to add %{private}@ to homes: %{private}@", buf, 0x16u);
      }

      uint64_t v14 = +[MSDTransactionTask createTransactionWithIdentifier:kAddServiceTransactionIdentifier];
      objc_initWeak((id *)buf, self);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100014BD0;
      v24[3] = &unk_10004D610;
      id v28 = v11;
      id v15 = v14;
      id v25 = v15;
      objc_copyWeak(&v29, (id *)buf);
      id v26 = v8;
      id v27 = v9;
      +[MSAuthTokenProvider fetchAuthTokensForMediaService:v26 networkActivity:0 completion:v24];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v16 = sub_100031A80();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100018B80();
      }

      double v12 = +[NSError errorWithDomain:MSErrorDomain code:3 userInfo:0];
      (*((void (**)(id, void, NSObject *))v11 + 2))(v11, 0, v12);
    }
  }
  else
  {
    double v12 = sub_100031A80();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100018B08(v12, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  uint64_t v14 = sub_100031A80();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 serviceID];
    *(_DWORD *)buf = 138478339;
    v48 = v15;
    __int16 v49 = 2113;
    id v50 = v11;
    __int16 v51 = 2113;
    id v52 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "User is requesting to remove %{private}@ for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x20u);
  }
  if (([v10 isServiceRemovable] & 1) == 0)
  {
    uint64_t v21 = [v10 serviceID];
    uint64_t v22 = [v21 UUIDString];
    uint64_t v20 = +[NSString stringWithFormat:@"Removing service %@ is prohibited", v22];

    uint64_t v23 = sub_100031A80();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v13)
    {
      uint64_t v24 = MSErrorDomain;
      uint64_t v45 = MSUserInfoErrorStringKey;
      v46 = v20;
      id v25 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      id v26 = +[NSError errorWithDomain:v24 code:1 userInfo:v25];
      v13[2](v13, 0, v26);
    }
    goto LABEL_15;
  }
  if (v11 && v12)
  {
    uint64_t v16 = +[MSDDataController sharedInstance];
    v41[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v17 = [v11 UUIDString];
    v42[0] = v17;
    v41[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v18 = [v12 UUIDString];
    v42[1] = v18;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000154B8;
    v37[3] = &unk_10004D5C0;
    id v38 = v10;
    v39 = self;
    v40 = v13;
    [v16 removeMediaService:v38 withUserInfo:v19 completion:v37];

    uint64_t v20 = v38;
LABEL_15:

    goto LABEL_16;
  }
  id v27 = sub_100031A80();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_100018DAC(v27, v28, v29, v30, v31, v32, v33, v34);
  }

  if (v13)
  {
    uint64_t v35 = MSErrorDomain;
    uint64_t v43 = MSUserInfoErrorStringKey;
    CFStringRef v44 = @"Failed to remove service, NIL identifiers provided";
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v36 = +[NSError errorWithDomain:v35 code:3 userInfo:v20];
    v13[2](v13, 0, v36);

    goto LABEL_15;
  }
LABEL_16:
}

- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v9 serviceID];
    *(_DWORD *)buf = 138478339;
    v37 = v14;
    __int16 v38 = 2113;
    id v39 = v10;
    __int16 v40 = 2113;
    id v41 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "User is requesting to update default service %{private}@ for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x20u);
  }
  if (v10 && v11)
  {
    id v15 = +[MSDDataController sharedInstance];
    v32[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v16 = [v10 UUIDString];
    v33[0] = v16;
    v32[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v17 = [v11 UUIDString];
    v33[1] = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000158E0;
    v30[3] = &unk_10004CCA0;
    id v31 = v12;
    [v15 updateDefaultMediaService:v9 withUserInfo:v18 completion:v30];

    uint64_t v19 = v31;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v20 = sub_100031A80();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_100018E8C(v20, v21, v22, v23, v24, v25, v26, v27);
  }

  if (v12)
  {
    uint64_t v28 = MSErrorDomain;
    uint64_t v34 = MSUserInfoErrorStringKey;
    CFStringRef v35 = @"Failed to update default service, NIL identifiers provided";
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v29 = +[NSError errorWithDomain:v28 code:3 userInfo:v19];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v29);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v33 = v7;
    __int16 v34 = 2113;
    id v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User is requesting to fetch default service for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x16u);
  }

  if (v7 && v8)
  {
    id v11 = +[MSDDataController sharedInstance];
    v28[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    id v12 = [v7 UUIDString];
    v29[0] = v12;
    v28[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    v13 = [v8 UUIDString];
    v29[1] = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100015C18;
    v26[3] = &unk_10004D638;
    id v27 = v9;
    [v11 getDefaultMediaService:v14 completion:v26];

    id v15 = v27;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v16 = sub_100031A80();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100018F6C(v16, v17, v18, v19, v20, v21, v22, v23);
  }

  if (v9)
  {
    uint64_t v24 = MSErrorDomain;
    uint64_t v30 = MSUserInfoErrorStringKey;
    CFStringRef v31 = @"Failed to fetch default service, NIL identifiers provided";
    id v15 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v25 = +[NSError errorWithDomain:v24 code:3 userInfo:v15];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v25);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void (**)(void, void, void))v15;
  if (!v11)
  {
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v24 = MSErrorDomain;
    uint64_t v52 = MSUserInfoErrorStringKey;
    CFStringRef v53 = @"Nil MediaService object";
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v25 = v24;
    uint64_t v26 = 2;
LABEL_16:
    v37 = +[NSError errorWithDomain:v25 code:v26 userInfo:v23];
    ((void (**)(void, void, void *))v16)[2](v16, 0, v37);

    goto LABEL_17;
  }
  if (!v14)
  {
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v27 = MSErrorDomain;
    uint64_t v50 = MSUserInfoErrorStringKey;
    CFStringRef v51 = @"Nil property values";
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v25 = v27;
    uint64_t v26 = 1;
    goto LABEL_16;
  }
  uint64_t v17 = sub_100031A80();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v11 serviceID];
    *(_DWORD *)buf = 138478339;
    uint64_t v45 = v18;
    __int16 v46 = 2113;
    id v47 = v12;
    __int16 v48 = 2113;
    id v49 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "User is requesting to update property for %{private}@ for HomeID %{private}@ and HomeUserID %{private}@", buf, 0x20u);
  }
  if (v12 && v13)
  {
    uint64_t v19 = +[MSDDataController sharedInstance];
    v40[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v20 = [v12 UUIDString];
    v41[0] = v20;
    v40[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v21 = [v13 UUIDString];
    v41[1] = v21;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100016114;
    v38[3] = &unk_10004CCA0;
    id v39 = v16;
    [v19 updateProperty:v11 propertyInfo:v14 withUserInfo:v22 completion:v38];

    uint64_t v23 = v39;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v28 = sub_100031A80();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_10001904C(v28, v29, v30, v31, v32, v33, v34, v35);
  }

  if (v16)
  {
    uint64_t v36 = MSErrorDomain;
    uint64_t v42 = MSUserInfoErrorStringKey;
    CFStringRef v43 = @"Failed to update property, NIL identifiers provided";
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v25 = v36;
    uint64_t v26 = 3;
    goto LABEL_16;
  }
LABEL_18:
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100031A80();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User is requesting to fetch service info for %{private}@ and serviceID %@", buf, 0x16u);
  }

  if (v7 && [v7 count])
  {
    id v11 = +[MSDDataController sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000163DC;
    v23[3] = &unk_10004D660;
    id v24 = v9;
    [v11 getServiceConfigurationInfo:v7 serviceID:v8 completion:v23];

    id v12 = v24;
LABEL_10:

    goto LABEL_11;
  }
  id v13 = sub_100031A80();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10001912C(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  if (v9)
  {
    uint64_t v21 = MSErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Failed to fetch service config info for Nil homeUserID";
    id v12 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v22 = +[NSError errorWithDomain:v21 code:1 userInfo:v12];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v22);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  if (a3)
  {
    uint64_t v4 = MSErrorDomain;
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    CFStringRef v9 = @"Function called on unsupported platform";
    id v5 = a3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v7 = +[NSError errorWithDomain:v4 code:11 userInfo:v6];
    (*((void (**)(id, void, void *))a3 + 2))(v5, 0, v7);
  }
}

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001664C;
    v7[3] = &unk_10004D688;
    id v8 = v5;
    id v9 = v6;
    +[MSDPublicDBManager getPublicInfoForBundleID:v8 completion:v7];
  }
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  if (a6)
  {
    uint64_t v7 = MSErrorDomain;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Function called on unsupported platform";
    id v8 = a6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:v7 code:11 userInfo:v9];
    (*((void (**)(id, void, void, void *))a6 + 2))(v8, 0, 0, v10);
  }
}

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  if (a6)
  {
    uint64_t v7 = MSErrorDomain;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Function called on unsupported platform";
    id v8 = a6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:v7 code:11 userInfo:v9];
    (*((void (**)(id, void, void *))a6 + 2))(v8, 0, v10);
  }
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    uint64_t v7 = MSErrorDomain;
    if (v5)
    {
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      CFStringRef v13 = @"Function called on unsupported platform";
      id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      uint64_t v9 = v7;
      uint64_t v10 = 11;
    }
    else
    {
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      CFStringRef v15 = @"INIntent cannot be nil";
      id v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      uint64_t v9 = v7;
      uint64_t v10 = 1;
    }
    NSErrorUserInfoKey v11 = +[NSError errorWithDomain:v9 code:v10 userInfo:v8];
    v6[2](v6, 0, v11);
  }
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  if (a5)
  {
    uint64_t v6 = MSErrorDomain;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Function called on unsupported platform";
    id v7 = a5;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = +[NSError errorWithDomain:v6 code:11 userInfo:v8];
    (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v9);
  }
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  if (a5)
  {
    uint64_t v6 = MSErrorDomain;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Function called on unsupported platform";
    id v7 = a5;
    id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = +[NSError errorWithDomain:v6 code:11 userInfo:v8];
    (*((void (**)(id, void *))a5 + 2))(v7, v9);
  }
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100016D38;
    v9[3] = &unk_10004D6B0;
    id v10 = v6;
    [(MSDManager *)self getMediaServiceChoicesForSharedUser:v8 completion:v9];
  }
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    CFStringRef v13 = sub_100031A80();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Switching account info for user - %@ in home - %@, %@", buf, 0x20u);
    }

    if (v9 && v10 && v11)
    {
      NSErrorUserInfoKey v14 = +[MSDDataController sharedInstance];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100017028;
      v18[3] = &unk_10004D6D8;
      id v19 = v9;
      id v20 = v12;
      [v14 switchUserAccountInfo:v19 homeID:v10 homeUserID:v11 completion:v18];

      CFStringRef v15 = v19;
    }
    else
    {
      uint64_t v16 = MSErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"Failed to switch user account info, Nil Attributes provided";
      CFStringRef v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v17 = +[NSError errorWithDomain:v16 code:1 userInfo:v15];
      (*((void (**)(id, void *))v12 + 2))(v12, v17);
    }
  }
}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  if (a3)
  {
    uint64_t v4 = MSErrorDomain;
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    CFStringRef v9 = @"Function called on unsupported platform";
    id v5 = a3;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v7 = +[NSError errorWithDomain:v4 code:11 userInfo:v6];
    (*((void (**)(id, void, void *))a3 + 2))(v5, 0, v7);
  }
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  if (a4)
  {
    uint64_t v5 = MSErrorDomain;
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"Function called on unsupported platform";
    id v6 = a4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    NSErrorUserInfoKey v8 = +[NSError errorWithDomain:v5 code:11 userInfo:v7];
    (*((void (**)(id, void, void *))a4 + 2))(v6, 0, v8);
  }
}

- (void)profilesManager:(id)a3 didAddProfiles:(id)a4
{
  id v35 = a3;
  id v37 = a4;
  uint64_t v5 = sub_100031A80();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MSDManager profilesManager:didAddProfiles:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v37;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s profile: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v60 = sub_1000179DC;
  v61 = sub_1000179EC;
  id v62 = (id)objc_opt_new();
  dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
  id v6 = +[MSDPublicDBManager shared];
  unsigned int v7 = [v6 shouldUseCloudKit];

  if (v7)
  {
    NSErrorUserInfoKey v8 = sub_100031A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v55 = 136315394;
      v56 = "-[MSDManager profilesManager:didAddProfiles:]";
      __int16 v57 = 2048;
      double v58 = MSPublicDatabaseRefreshIntervalInSecs / 3600.0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s its been more than %f hours since last update: Pulling from CK", v55, 0x16u);
    }

    NSErrorUserInfoKey v9 = +[MSDPublicDBManager shared];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000179F4;
    v50[3] = &unk_10004D700;
    uint64_t v52 = buf;
    CFStringRef v10 = v36;
    CFStringRef v51 = v10;
    [v9 syncDataWithCloudKit:v50];

    dispatch_time_t v11 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
    if (dispatch_semaphore_wait(v10, v11))
    {
      id v12 = sub_100031A80();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100019240();
      }
    }
    CFStringRef v13 = v51;
  }
  else
  {
    CFStringRef v13 = +[MSDPublicDBManager getCachedPublicInfo];
    id v14 = [v13 mutableCopy];
    CFStringRef v15 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v14;
  }
  uint64_t v16 = *(void **)(*(void *)&buf[8] + 40);
  if (v16 && [v16 count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v37;
    id v40 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v47;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(const char **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v18 = sub_100031A80();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v55 = 138412290;
            v56 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Attempting to configure system with profileData %@", v55, 0xCu);
          }

          id v19 = +[MSDPublicDBManager shared];
          id v20 = [v19 createPublicDBInfoObjectFromDictionary:v17];

          id v21 = [*(id *)(*(void *)&buf[8] + 40) mutableCopy];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v22 = *(id *)(*(void *)&buf[8] + 40);
          id v23 = [v22 countByEnumeratingWithState:&v42 objects:v53 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v43;
            do
            {
              for (j = 0; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v43 != v24) {
                  objc_enumerationMutation(v22);
                }
                id v26 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
                __int16 v27 = [v26 serviceID];
                id v28 = [v20 serviceID];
                unsigned int v29 = [v27 isEqual:v28];

                if (v29) {
                  [v21 removeObjectIdenticalTo:v26];
                }
              }
              id v23 = [v22 countByEnumeratingWithState:&v42 objects:v53 count:16];
            }
            while (v23);
          }

          id v30 = [v21 mutableCopy];
          uint64_t v31 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v30;

          [*(id *)(*(void *)&buf[8] + 40) na_safeAddObject:v20];
        }
        id v40 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v40);
    }

    uint64_t v32 = sub_100031A80();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(const char **)(*(void *)&buf[8] + 40);
      *(_DWORD *)v55 = 138412290;
      v56 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Updating PublicDB cachedCopy with Data %@", v55, 0xCu);
    }

    uint64_t v34 = +[MSDDefaultsManager sharedManager];
    [v34 setObjectWithCustomClass:*(void *)(*(void *)&buf[8] + 40) forDefault:@"publicDBData"];
  }
  else
  {
    uint64_t v34 = sub_100031A80();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10001920C();
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)profilesManager:(id)a3 didUpdateProfiles:(id)a4
{
  id v5 = a4;
  id v6 = [v5 count];
  unsigned int v7 = sub_100031A80();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v52 = "-[MSDManager profilesManager:didUpdateProfiles:]";
    __int16 v53 = 2112;
    id v54 = v5;
    __int16 v55 = 2048;
    id v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s profile: %@ activeProfilesOnDevice %lu", buf, 0x20u);
  }

  NSErrorUserInfoKey v8 = +[MSDDefaultsManager sharedManager];
  unsigned __int8 v9 = [v8 profilesEverInstalled];

  CFStringRef v10 = sub_100031A80();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Developer profile loaded on device, checking service sanity", buf, 2u);
    }

    id v12 = +[MSDHomeManager sharedManager];
    CFStringRef v10 = [v12 currentHome];

    if (!v10)
    {
      uint64_t v18 = sub_100031A80();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000192DC(v18, v33, v34, v35, v36, v37, v38, v39);
      }
      goto LABEL_23;
    }
    CFStringRef v13 = [v10 currentUser];
    uint64_t v14 = [v13 uniqueIdentifier];
    if (v14)
    {
      CFStringRef v15 = (void *)v14;
      uint64_t v16 = [v10 uniqueIdentifier];

      if (v16)
      {
        uint64_t v17 = +[MSDDefaultsManager sharedManager];
        uint64_t v18 = [v17 objectForKeyInDefaultDomain:@"publicDBData"];

        id v19 = [v18 na_map:&stru_10004D740];
        id v20 = +[MSDDefaultsManager sharedManager];
        id v21 = [v20 objectForKeyInDeveloperDomain:@"publicDBData"];

        id v22 = [v21 na_map:&stru_10004D760];
        id v23 = [v22 mutableCopy];

        uint64_t v24 = [v5 na_map:&stru_10004D7A0];
        [v23 removeObjectsInArray:v24];
        [v23 removeObjectsInArray:v19];
        if ([v23 count])
        {
          id v41 = v24;
          long long v42 = v21;
          long long v43 = v19;
          v49[0] = kCKDatabaseAccessUserInfoHomeIDKey;
          __int16 v25 = [v10 uniqueIdentifier];
          id v26 = [v25 UUIDString];
          v50[0] = v26;
          v49[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
          __int16 v27 = [v10 currentUser];
          id v28 = [v27 uniqueIdentifier];
          unsigned int v29 = [v28 UUIDString];
          v50[1] = v29;
          uint64_t v40 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];

          id v30 = sub_100031A80();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            uint64_t v52 = (const char *)v23;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Remove services with IDS: %{private}@", buf, 0xCu);
          }

          uint64_t v31 = +[MSDDataController sharedInstance];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100018124;
          v44[3] = &unk_10004D7F0;
          id v45 = v5;
          id v21 = v42;
          id v46 = v42;
          id v47 = v23;
          long long v48 = self;
          uint64_t v32 = v40;
          [v31 removeMediaServices:v47 withUserInfo:v40 completion:v44];

          id v19 = v43;
          uint64_t v24 = v41;
        }
        else
        {
          uint64_t v32 = sub_100031A80();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Everything is up to date, nothing to delete", buf, 2u);
          }
        }

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v18 = sub_100031A80();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100019354();
    }
    goto LABEL_23;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Developer profile was not loaded on device, skipping service check", buf, 2u);
  }
LABEL_24:
}

- (void)homeManager:(id)a3 didHomeKitSyncComplete:(id)a4
{
  id v5 = [(MSDManager *)self startupQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018548;
  block[3] = &unk_10004CAC0;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (MSServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (MSServerMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
}

- (MSDDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (CUCoalescer)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (OS_dispatch_queue)startupQueue
{
  return self->_startupQueue;
}

- (void)setStartupQueue:(id)a3
{
}

- (MSDProfilesManager)profilesManager
{
  return self->_profilesManager;
}

- (void)setProfilesManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilesManager, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_publicDBRefreshQueue, 0);
}

@end