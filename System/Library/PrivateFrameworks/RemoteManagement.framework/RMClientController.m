@interface RMClientController
+ (BOOL)_shouldRegisterForCloudConfigAvailableNotification;
+ (RMClientController)sharedController;
+ (void)start;
+ (void)startListeningForNotifications;
- (BOOL)_canProcessClientStateChanges:(id)a3;
- (BOOL)_didUnenrollClientWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_hasMDMv1ManagementForManagingProfileIdentifier:(id)a3;
- (NSManagedObjectContext)context;
- (NSMutableDictionary)clientByManagementSourceIdentifier;
- (NSMutableSet)processingClientStateChanges;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)dispatchQueue;
- (RMClientController)initWithPersistentContainer:(id)a3 context:(id)a4;
- (RMDeviceLockStateListener)lockStateListener;
- (id)_bootstrapURIForAccount:(id)a3;
- (id)_clientWithIdentifier:(id)a3;
- (id)_genericCredentialForAccount:(id)a3 fromStore:(id)a4;
- (id)_makeClientWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 persistentContainer:(id)a5;
- (void)_checkCloudConfig;
- (void)_checkCloudConfigAsync:(id)a3;
- (void)_checkForMandatoryDeviceEnrollmentWithCompletionHandler:(id)a3;
- (void)_completedClientStateChanges:(id)a3;
- (void)_didEnrollClient:(id)a3 conduitType:(int64_t)a4 managementSourceObjectID:(id)a5 account:(id)a6 accountStore:(id)a7 completionHandler:(id)a8;
- (void)_didFailToEnrollClientForManagementObjectID:(id)a3;
- (void)_enrollAccount:(id)a3 fromStore:(id)a4 completionHandler:(id)a5;
- (void)_receivedMDMv1UnenrollNotification;
- (void)_registerForCloudConfigAvailableNotificationIfNeeded;
- (void)_removeInvalidManagementChannels:(id)a3;
- (void)_start;
- (void)_startListeningForNotifications;
- (void)_syncMDMv1ManagementSourcesWithUnenroll:(BOOL)a3;
- (void)_unenrollAndReenrollIfDEP:(id)a3;
- (void)_validateManagementSources;
- (void)applyNowWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)clientNeedsToReenrollWithManagementSourceIdentifier:(id)a3;
- (void)clientNeedsToUnenrollWithManagementSourceIdentifier:(id)a3;
- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3;
- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4;
- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7;
- (void)lockStateDidChange:(BOOL)a3;
- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4;
- (void)managementChannelsChanged;
- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)reenrollWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setProcessingClientStateChanges:(id)a3;
- (void)syncAllManagementSourcesWithCompletionHandler:(id)a3;
- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5;
- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation RMClientController

+ (RMClientController)sharedController
{
  if (qword_1000DB040 != -1) {
    dispatch_once(&qword_1000DB040, &stru_1000C5140);
  }
  v2 = (void *)qword_1000DB038;

  return (RMClientController *)v2;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014230;
  block[3] = &unk_1000C5160;
  block[4] = a1;
  if (qword_1000DB048 != -1) {
    dispatch_once(&qword_1000DB048, block);
  }
}

+ (void)startListeningForNotifications
{
  id v2 = [a1 sharedController];
  [v2 _startListeningForNotifications];
}

- (RMClientController)initWithPersistentContainer:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RMClientController;
  v9 = [(RMClientController *)&v22 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    processingClientStateChanges = v9->_processingClientStateChanges;
    v9->_processingClientStateChanges = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_persistentContainer, a3);
    v12 = +[RMDeviceLockStateListener newListenerWithDelegate:v9];
    lockStateListener = v9->_lockStateListener;
    v9->_lockStateListener = v12;

    objc_storeStrong((id *)&v9->_context, a4);
    uint64_t v14 = objc_opt_new();
    clientByManagementSourceIdentifier = v9->_clientByManagementSourceIdentifier;
    v9->_clientByManagementSourceIdentifier = (NSMutableDictionary *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.RemoteManagement.RMClientController", v16);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v17;

    v19 = (RMSharedLock *)+[RMSharedLock newSharedLockWithDescription:@"RMClientController-cloudConfigLock"];
    cloudConfigLock = v9->_cloudConfigLock;
    v9->_cloudConfigLock = v19;
  }
  return v9;
}

- (void)_start
{
  v3 = _os_activity_create((void *)&_mh_execute_header, "ClientController: starting", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = +[RMLog clientController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001C3AC();
  }

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v5 = objc_opt_new();
  [(RMClientController *)self context];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014688;
  v21[3] = &unk_1000C5188;
  v24 = &v25;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v6;
  id v7 = v5;
  id v23 = v7;
  [v6 performBlockAndWait:v21];
  dispatch_group_t v8 = dispatch_group_create();
  v9 = self->_clientByManagementSourceIdentifier;
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000149D4;
  dispatch_queue_t v17 = &unk_1000C51D8;
  v18 = self;
  uint64_t v10 = v9;
  v19 = v10;
  v11 = v8;
  v20 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:&v14];
  v12 = dispatch_get_global_queue(9, 0);
  dispatch_group_notify(v11, v12, &stru_1000C51F8);

  [(RMClientController *)self _validateManagementSources];
  [(RMClientController *)self _syncMDMv1ManagementSourcesWithUnenroll:0];
  if (v26[3])
  {
    v13 = [(RMClientController *)self lockStateListener];
    [v13 startListening];
  }
  _Block_object_dispose(&v25, 8);
  os_activity_scope_leave(&state);
}

- (void)_validateManagementSources
{
  v3 = _os_activity_create((void *)&_mh_execute_header, "ClientController: validating management sources", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = +[RMLog clientController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001C4B0();
  }

  v5 = (void *)os_transaction_create();
  id v6 = +[RMLog clientController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Validating sources...", buf, 2u);
  }

  id v7 = [(RMClientController *)self context];
  dispatch_group_t v8 = objc_opt_new();
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100014D60;
  uint64_t v14 = &unk_1000C5100;
  id v9 = v7;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  [v9 performBlockAndWait:&v11];
  if (objc_msgSend(v10, "count", v11, v12, v13, v14)) {
    [(RMClientController *)self _removeInvalidManagementChannels:v10];
  }

  os_activity_scope_leave(&state);
}

- (void)_removeInvalidManagementChannels:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSConditionLock), "initWithCondition:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138543362;
    long long v14 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v10);
        uint64_t v12 = +[RMLog clientController];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          uint64_t v23 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Removing invalid management channel %{public}@", buf, 0xCu);
        }

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000152A0;
        v16[3] = &unk_1000C5220;
        v16[4] = v11;
        id v17 = v5;
        [(RMClientController *)self unenrollWithIdentifier:v11 completionHandler:v16];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  if (([v5 tryLockWhenCondition:0] & 1) == 0)
  {
    v13 = +[RMLog clientController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Waiting for invalid enrollments to unenroll...", buf, 2u);
    }

    [v5 lockWhenCondition:0];
  }
  [v5 unlock];
}

- (void)_startListeningForNotifications
{
}

- (void)_registerForCloudConfigAvailableNotificationIfNeeded
{
  if (([(id)objc_opt_class() _shouldRegisterForCloudConfigAvailableNotification] & 1) == 0)
  {
    id v2 = +[RMLog clientController];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_10001C5B4(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

+ (BOOL)_shouldRegisterForCloudConfigAvailableNotification
{
  return 0;
}

- (void)_checkCloudConfigAsync:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(RMClientController *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015474;
  v6[3] = &unk_1000C5248;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_checkCloudConfig
{
  uint64_t v3 = _os_activity_create((void *)&_mh_execute_header, "ClientController: checking cloud config", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = +[RMLog clientController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001C62C();
  }

  uint64_t v5 = (void *)os_transaction_create();
  [(RMSharedLock *)self->_cloudConfigLock lock];
  uint64_t v6 = +[RMLog clientController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking cloud config...", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015638;
  v8[3] = &unk_1000C5270;
  v8[4] = self;
  id v7 = v5;
  id v9 = v7;
  [(RMClientController *)self _checkForMandatoryDeviceEnrollmentWithCompletionHandler:v8];

  os_activity_scope_leave(&state);
}

- (void)_checkForMandatoryDeviceEnrollmentWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = +[RMCloudConfigController cloudConfigEnrollmentURL];
  if (v5)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_100015980;
    id v16 = sub_100015990;
    id v17 = 0;
    uint64_t v6 = [(RMClientController *)self context];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015998;
    v11[3] = &unk_1000C5298;
    v11[4] = &v12;
    [v6 performBlockAndWait:v11];
    if (v13[5])
    {
      if (objc_msgSend(v5, "isEqual:"))
      {
        id v7 = +[RMLog clientController];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_10001C660();
        }
      }
      else
      {
        id v7 = +[RMLog clientController];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_10001C694();
        }
      }

      v4[2](v4, 0);
    }
    else
    {
      uint64_t v8 = +[RMLog clientController];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        long long v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Forcing mandatory enrollment of device channel: %{public}@", buf, 0xCu);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100015A80;
      v9[3] = &unk_1000C52C0;
      id v10 = v4;
      [(RMClientController *)self enrollDeviceChannelWithURI:v5 completionHandler:v9];
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (id)_makeClientWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 persistentContainer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [RMClient alloc];
  uint64_t v12 = objc_opt_new();
  v13 = [(RMClient *)v11 initWithManagementSourceObjectID:v10 managementSourceIdentifier:v9 statusQuerier:v12 persistentContainer:v8];

  [(RMClient *)v13 setDelegate:self];

  return v13;
}

- (void)_unenrollAndReenrollIfDEP:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RMClientController *)self context];
  id v6 = v4;
  id v7 = v5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 1;
  location[0] = _NSConcreteStackBlock;
  location[1] = (id)3221225472;
  location[2] = sub_10001C1E4;
  location[3] = &unk_1000C4E08;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  id v21 = v9;
  id v22 = &v23;
  [v9 performBlockAndWait:location];
  id v10 = (void *)v24[3];

  _Block_object_dispose(&v23, 8);
  objc_initWeak(location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100015D5C;
  id v16 = &unk_1000C5350;
  id v11 = v8;
  id v17 = v11;
  objc_copyWeak(v18, location);
  v18[1] = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v13);
  uint64_t v12 = +[RMLog clientController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10001C764();
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(location);
}

- (void)_receivedMDMv1UnenrollNotification
{
}

- (void)_syncMDMv1ManagementSourcesWithUnenroll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = _os_activity_create((void *)&_mh_execute_header, "ClientController: checking MDMv1 management sources", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog clientController];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = +[NSNumber numberWithBool:v3];
    sub_10001C904(v7, v29, v6);
  }

  id v8 = (void *)os_transaction_create();
  id v9 = +[RMLog clientController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Syncing MDMv1 sources...", buf, 2u);
  }

  id v10 = [(RMClientController *)self context];
  id v11 = objc_opt_new();
  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100016408;
  v16[3] = &unk_1000C5378;
  id v12 = v10;
  BOOL v21 = v3;
  id v17 = v12;
  long long v18 = self;
  id v13 = v11;
  id v19 = v13;
  id v20 = buf;
  [v12 performBlockAndWait:v16];
  if ([v13 count])
  {
    uint64_t v14 = +[RMLog clientController];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v13 count];
      *(_DWORD *)uint64_t v27 = 134217984;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Removing %lu MDMv1 management sources", v27, 0xCu);
    }

    [(RMClientController *)self _removeInvalidManagementChannels:v13];
  }
  if (!v23[24]
    && +[RMMDMv1Liaison isEnrollmentInMDMv1Restricted])
  {
    +[RMMDMv1Liaison remoteManagementDidUnenroll];
  }

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)_hasMDMv1ManagementForManagingProfileIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[RMManagedDevice currentManagedDevice];
  uint64_t v5 = [v4 mdmProfileIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v3];
  return (char)v4;
}

- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "ClientController: enrolling management source", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = +[RMLog clientController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001CB74();
  }

  if (+[RMMDMv1Liaison isEnrolledInMDMv1])
  {
    id v10 = +[RMLog clientController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001C9D4();
    }

    id v11 = +[RMErrorUtilities createAlreadyEnrolledInMDMv1Error];
    v7[2](v7, 0, v11);
  }
  else
  {
    id v12 = [v6 scheme];
    if ([v12 caseInsensitiveCompare:@"https"])
    {
      if ([v12 caseInsensitiveCompare:@"file"])
      {
        uint64_t v13 = 4 * ([v12 caseInsensitiveCompare:@"mdm"] == 0);
      }
      else if (+[RMFeatureFlags isFileConduitEnabled])
      {
        uint64_t v13 = 3;
      }
      else
      {
        uint64_t v13 = 1;
      }
    }
    else if (+[RMFeatureFlags isHTTPConduitEnabled])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 1;
    }

    if ((v13 & 3) != 0)
    {
      if (v13 == 1)
      {
        uint64_t v14 = +[RMLog clientController];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_10001CAA4();
        }

        id v11 = +[NSError errorWithDomain:RMErrorDomain code:4 userInfo:0];
        v7[2](v7, 0, v11);
      }
      else
      {
        id v16 = +[RMManagedDevice currentManagedDevice];
        unsigned int v17 = [v16 isSupervised];

        if (v17) {
          uint64_t v18 = 3;
        }
        else {
          uint64_t v18 = 1;
        }
        uint64_t v27 = [v6 absoluteString];
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x3032000000;
        v57 = sub_100015980;
        v58 = sub_100015990;
        id v59 = 0;
        uint64_t v48 = 0;
        v49 = &v48;
        uint64_t v50 = 0x3032000000;
        v51 = sub_100015980;
        v52 = sub_100015990;
        id v53 = 0;
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x3032000000;
        v45 = sub_100015980;
        v46 = sub_100015990;
        id v47 = 0;
        uint64_t v26 = self;
        [(RMClientController *)self context];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100016DF0;
        v33[3] = &unk_1000C53A0;
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        id v34 = v19;
        id v35 = v6;
        v37 = &v54;
        uint64_t v40 = v18;
        uint64_t v41 = v13;
        id v11 = v27;
        id v36 = v11;
        v38 = &v48;
        v39 = &v42;
        [v19 performBlockAndWait:v33];
        if (v55[5])
        {
          id v20 = +[RMLog clientController];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10001CB0C();
          }

          v7[2](v7, 0, (id)v55[5]);
        }
        else
        {
          uint64_t v21 = v49[5];
          uint64_t v22 = v43[5];
          uint64_t v23 = [(RMClientController *)v26 persistentContainer];
          uint64_t v24 = [(RMClientController *)v26 _makeClientWithManagementSourceObjectID:v21 managementSourceIdentifier:v22 persistentContainer:v23];

          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100017164;
          v28[3] = &unk_1000C53C8;
          v28[4] = v26;
          v31 = &v48;
          v30 = v7;
          id v25 = v24;
          id v29 = v25;
          uint64_t v32 = v13;
          [v25 enrollWithCompletionHandler:v28];
        }
        _Block_object_dispose(&v42, 8);

        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v54, 8);
      }
    }
    else
    {
      id v15 = +[RMLog clientController];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10001CA3C();
      }

      id v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:262 userInfo:0];
      v7[2](v7, 0, v11);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_100015980;
  uint64_t v23 = sub_100015990;
  id v24 = 0;
  id v8 = [(RMClientController *)self context];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100017420;
  v15[3] = &unk_1000C4E08;
  id v9 = v6;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  uint64_t v18 = &v19;
  [v10 performBlockAndWait:v15];
  if (v20[5])
  {
    v7[2](v7, 0);
  }
  else
  {
    id v11 = +[ACAccountStore rm_defaultStore];
    id v12 = [v11 accountWithIdentifier:v9];
    if (v12)
    {
      [(RMClientController *)self _enrollAccount:v12 fromStore:v11 completionHandler:v7];
    }
    else
    {
      uint64_t v13 = +[RMLog clientController];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10001CD14();
      }

      uint64_t v14 = +[RMErrorUtilities createAccountMissingErrorWithIdentifier:v9];
      ((void (*)(void (**)(id, void), void, void *))v7[2])(v7, 0, v14);
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  id v16 = _os_activity_create((void *)&_mh_execute_header, "ClientController: enrolling management source DDM", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  id v17 = +[RMLog clientController];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10001CE8C((uint64_t)v12, a3, v17);
  }

  if (!+[RMMDMv1Liaison isEnrolledInMDMv1])
  {
    uint64_t v21 = +[RMLog clientController];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10001CE4C();
    }

    uint64_t v22 = +[RMErrorUtilities createBootstrapURINotFound];
    v15[2](v15, 0, v22);
    goto LABEL_19;
  }
  id v18 = [v12 scheme];
  if (![v18 caseInsensitiveCompare:@"https"])
  {
    +[RMFeatureFlags isHTTPConduitEnabled];
    goto LABEL_16;
  }
  if (![v18 caseInsensitiveCompare:@"file"])
  {
    +[RMFeatureFlags isFileConduitEnabled];
    goto LABEL_16;
  }
  if ([v18 caseInsensitiveCompare:@"mdm"])
  {
LABEL_16:

    uint64_t v23 = +[RMLog clientController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10001CDE4();
    }

    uint64_t v22 = +[NSError errorWithDomain:NSCocoaErrorDomain code:262 userInfo:0];
    v15[2](v15, 0, v22);
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = sub_100015980;
  v60 = sub_100015990;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = sub_100015980;
  uint64_t v54 = sub_100015990;
  id v55 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = sub_100015980;
  uint64_t v48 = sub_100015990;
  id v49 = 0;
  [(RMClientController *)self context];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100017AC8;
  v34[3] = &unk_1000C53F0;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v35 = v19;
  id v36 = v12;
  v39 = &v56;
  int64_t v42 = a3;
  uint64_t v43 = 4;
  id v37 = v13;
  id v38 = v14;
  uint64_t v40 = &v50;
  uint64_t v41 = &v44;
  [v19 performBlockAndWait:v34];
  if (v57[5])
  {
    id v20 = +[RMLog clientController];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10001CB0C();
    }

    v15[2](v15, 0, (void *)v57[5]);
  }
  else
  {
    uint64_t v24 = v51[5];
    uint64_t v25 = v45[5];
    uint64_t v26 = [(RMClientController *)self persistentContainer];
    uint64_t v27 = [(RMClientController *)self _makeClientWithManagementSourceObjectID:v24 managementSourceIdentifier:v25 persistentContainer:v26];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100017E28;
    v29[3] = &unk_1000C53C8;
    v29[4] = self;
    uint64_t v32 = &v50;
    v31 = v15;
    id v28 = v27;
    id v30 = v28;
    uint64_t v33 = 4;
    [v28 enrollWithCompletionHandler:v29];
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

LABEL_20:
  os_activity_scope_leave(&state);
}

- (void)reenrollWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "ClientController: re-enrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = +[RMLog clientController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001CF6C();
  }

  id v10 = [(RMClientController *)self _clientWithIdentifier:v6];
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100018094;
    v13[3] = &unk_1000C4F90;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v10 reenrollWithCompletionHandler:v13];
  }
  else
  {
    id v11 = +[RMLog clientController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001CF04();
    }

    id v12 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v6];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
  os_activity_scope_leave(&state);
}

- (void)_enrollAccount:(id)a3 fromStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ClientController: enrolling management source", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = [(RMClientController *)self _bootstrapURIForAccount:v8];
  if (v12)
  {
    id v13 = +[RMLog clientController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10001D1DC();
    }

    if (+[RMMDMv1Liaison isEnrolledInMDMv1])
    {
      id v14 = +[RMLog clientController];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10001D03C();
      }

      id v15 = +[RMErrorUtilities createAlreadyEnrolledInMDMv1Error];
      v10[2](v10, 0, v15);
    }
    else
    {
      id v16 = [v12 scheme];
      if ([v16 caseInsensitiveCompare:@"https"])
      {
        if ([v16 caseInsensitiveCompare:@"file"])
        {
          uint64_t v17 = 4 * ([v16 caseInsensitiveCompare:@"mdm"] == 0);
        }
        else if (+[RMFeatureFlags isFileConduitEnabled])
        {
          uint64_t v17 = 3;
        }
        else
        {
          uint64_t v17 = 1;
        }
      }
      else if (+[RMFeatureFlags isHTTPConduitEnabled])
      {
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v17 = 1;
      }

      if ((v17 & 3) != 0)
      {
        if (v17 == 1)
        {
          id v18 = +[RMLog clientController];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_10001D10C();
          }

          id v15 = +[NSError errorWithDomain:RMErrorDomain code:4 userInfo:0];
          v10[2](v10, 0, v15);
        }
        else
        {
          id v20 = [(RMClientController *)self _genericCredentialForAccount:v8 fromStore:v9];
          uint64_t v57 = 0;
          uint64_t v58 = &v57;
          uint64_t v59 = 0x3032000000;
          v60 = sub_100015980;
          id v61 = sub_100015990;
          id v62 = 0;
          uint64_t v51 = 0;
          uint64_t v52 = &v51;
          uint64_t v53 = 0x3032000000;
          uint64_t v54 = sub_100015980;
          id v55 = sub_100015990;
          id v56 = 0;
          uint64_t v45 = 0;
          uint64_t v46 = &v45;
          uint64_t v47 = 0x3032000000;
          uint64_t v48 = sub_100015980;
          id v49 = sub_100015990;
          id v50 = 0;
          [(RMClientController *)self context];
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10001880C;
          v36[3] = &unk_1000C5418;
          id v37 = (id)objc_claimAutoreleasedReturnValue();
          id v38 = v12;
          uint64_t v44 = v17;
          id v15 = v20;
          id v39 = v15;
          id v27 = v8;
          id v28 = v37;
          id v40 = v27;
          uint64_t v41 = &v57;
          int64_t v42 = &v51;
          uint64_t v43 = &v45;
          [v37 performBlockAndWait:v36];
          if (v58[5])
          {
            uint64_t v21 = +[RMLog clientController];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_10001D174();
            }

            v10[2](v10, 0, (id)v58[5]);
          }
          else
          {
            uint64_t v26 = v52[5];
            uint64_t v22 = v46[5];
            uint64_t v23 = [(RMClientController *)self persistentContainer];
            uint64_t v24 = [(RMClientController *)self _makeClientWithManagementSourceObjectID:v26 managementSourceIdentifier:v22 persistentContainer:v23];

            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100018A44;
            v29[3] = &unk_1000C5440;
            v29[4] = self;
            id v34 = &v51;
            uint64_t v33 = v10;
            id v25 = v24;
            id v30 = v25;
            uint64_t v35 = v17;
            id v31 = v27;
            id v32 = v9;
            [v25 enrollWithCompletionHandler:v29];
          }
          _Block_object_dispose(&v45, 8);

          _Block_object_dispose(&v51, 8);
          _Block_object_dispose(&v57, 8);
        }
      }
      else
      {
        id v19 = +[RMLog clientController];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10001D0A4();
        }

        id v15 = +[NSError errorWithDomain:NSCocoaErrorDomain code:262 userInfo:0];
        v10[2](v10, 0, v15);
      }
    }
  }
  else
  {
    id v15 = +[RMErrorUtilities createBootstrapURINotFound];
    v10[2](v10, 0, v15);
  }

  os_activity_scope_leave(&state);
}

- (id)_bootstrapURIForAccount:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "rm_isAccountSchemeTest") & 1) != 0
    || (objc_msgSend(v3, "rm_isAccountSchemeBearer") & 1) != 0
    || (objc_msgSend(v3, "rm_isAccountSchemeMAID") & 1) != 0
    || objc_msgSend(v3, "dmc_isAccountSchemeSharediPad"))
  {
    id v4 = objc_msgSend(v3, "rm_enrollmentURL");
    uint64_t v5 = +[NSURL URLWithString:v4];

    if (v5) {
      goto LABEL_9;
    }
    id v6 = +[RMLog clientController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001D244(v3, v6);
    }
  }
  else
  {
    id v6 = +[RMLog clientController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001D2D8(v3);
    }
  }

  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (id)_genericCredentialForAccount:(id)a3 fromStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 identifier];
  if (objc_msgSend(v5, "rm_isAccountSchemeTest"))
  {
    id v8 = objc_opt_new();
    id v9 = [v5 username];
    [v8 setObject:v9 forKeyedSubscript:RMAuthenticationSchemeTestFieldUsername];

    id v10 = objc_opt_new();
    id v11 = [v10 UUIDString];
    [v8 setObject:v11 forKeyedSubscript:RMAuthenticationSchemeTestFieldToken];

    id v12 = objc_alloc((Class)RMGenericAuthenticationCredential);
    id v13 = &RMAuthenticationSchemeTest;
LABEL_5:
    id v15 = [v12 initWithAuthenticationScheme:*v13 properties:v8];
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v5, "rm_isAccountSchemeBearer"))
  {
    id v8 = objc_opt_new();
    id v14 = objc_msgSend(v5, "rm_bearerToken");
    [v8 setObject:v14 forKeyedSubscript:RMAuthenticationSchemeBearerFieldAccessToken];

    id v12 = objc_alloc((Class)RMGenericAuthenticationCredential);
    id v13 = &RMAuthenticationSchemeBearer;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "rm_isAccountSchemeMAID"))
  {
    id v8 = objc_opt_new();
    uint64_t v17 = [v5 username];
    [v8 setObject:v17 forKeyedSubscript:RMAuthenticationSchemeMAIDFieldUsername];

    id v18 = objc_msgSend(v5, "rm_DSID");
    [v8 setObject:v18 forKeyedSubscript:RMAuthenticationSchemeMAIDFieldDSID];

    id v19 = objc_msgSend(v5, "rm_altDSID");
    [v8 setObject:v19 forKeyedSubscript:RMAuthenticationSchemeMAIDFieldAltDSID];

    id v20 = objc_msgSend(v5, "rm_altDSID");
    uint64_t v21 = objc_msgSend(v6, "aida_accountForAltDSID:", v20);

    uint64_t v22 = objc_msgSend(v21, "aida_tokenForService:", @"com.apple.gs.mdm.auth");
    [v8 setObject:v22 forKeyedSubscript:RMAuthenticationSchemeMAIDFieldShortLivedToken];
    id v23 = objc_alloc((Class)RMGenericAuthenticationCredential);
    id v15 = [v23 initWithAuthenticationScheme:RMAuthenticationSchemeMAID properties:v8];

    goto LABEL_6;
  }
  uint64_t v24 = +[RMLog clientController];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10001D38C(v5);
  }

  id v15 = 0;
LABEL_7:

  return v15;
}

- (void)_didFailToEnrollClientForManagementObjectID:(id)a3
{
  id v4 = a3;
  [(RMClientController *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018F88;
  v7[3] = &unk_1000C5100;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlockAndWait:v7];
}

- (void)_didEnrollClient:(id)a3 conduitType:(int64_t)a4 managementSourceObjectID:(id)a5 account:(id)a6 accountStore:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_100015980;
  uint64_t v57 = sub_100015990;
  id v58 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = sub_100015980;
  uint64_t v51 = sub_100015990;
  id v52 = 0;
  [(RMClientController *)self context];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000194F0;
  v42[3] = &unk_1000C5468;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = v19;
  id v20 = v15;
  id v44 = v20;
  uint64_t v45 = &v47;
  uint64_t v46 = &v53;
  [v19 performBlockAndWait:v42];
  if (v16 && v17)
  {
    objc_msgSend(v16, "rm_setEnrollmentToken:", v54[5]);
    objc_msgSend(v16, "rm_setManagementSourceIdentifier:", v48[5]);
    uint64_t v21 = +[RMLog clientController];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Saving account...", buf, 2u);
    }

    *(void *)buf = 0;
    id v37 = buf;
    uint64_t v38 = 0x3032000000;
    id v39 = sub_100015980;
    id v40 = sub_100015990;
    id v41 = 0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000195A4;
    v35[3] = &unk_1000C5490;
    v35[4] = buf;
    [v17 saveAccount:v16 withCompletionHandler:v35];
    uint64_t v22 = +[RMLog clientController];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Accounts finished saving.", v34, 2u);
    }

    _Block_object_dispose(buf, 8);
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100019610;
  v31[3] = &unk_1000C5100;
  id v23 = v19;
  id v32 = v23;
  id v24 = v20;
  id v33 = v24;
  [v23 performBlockAndWait:v31];
  if (a4 != 4) {
    +[RMMDMv1Liaison remoteManagementDidEnroll];
  }
  id v25 = [(RMClientController *)self lockStateListener];
  [v25 startListening];

  uint64_t v26 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v26);
  [(NSMutableDictionary *)v26 setObject:v14 forKeyedSubscript:v48[5]];
  objc_sync_exit(v26);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000196BC;
  v28[3] = &unk_1000C54B8;
  id v27 = v18;
  id v29 = v27;
  id v30 = &v47;
  [v14 startWithCompletionHandler:v28];

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "ClientController: unenrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = +[RMLog clientController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001D560();
  }

  id v10 = [(RMClientController *)self _clientWithIdentifier:v6];
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000198B4;
    v13[3] = &unk_1000C54E0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v10 unenrollWithCompletionHandler:v13];
  }
  else
  {
    id v11 = +[RMLog clientController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001D4F8();
    }

    id v12 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v6];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
  os_activity_scope_leave(&state);
}

- (BOOL)_didUnenrollClientWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7 removeObjectForKey:v6];
  objc_sync_exit(v7);

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_100015980;
  id v32 = sub_100015990;
  id v33 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v8 = [(RMClientController *)self context];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_100019BD4;
  id v19 = &unk_1000C5468;
  id v9 = v6;
  id v20 = v9;
  id v10 = v8;
  id v21 = v10;
  uint64_t v22 = &v28;
  id v23 = &v24;
  [v10 performBlockAndWait:&v16];
  if (a4)
  {
    id v11 = (void *)v29[5];
    if (v11) {
      *a4 = v11;
    }
  }
  uint64_t v12 = v29[5];
  if (!v12)
  {
    +[RMConfigurationStatusArchiver removeAllStatusForStoreIdentifier:error:](RMConfigurationStatusArchiver, "removeAllStatusForStoreIdentifier:error:", v9, 0, v16, v17, v18, v19, v20);
    id v13 = +[RMExternalStatusPublisher sharedPublisher];
    [v13 listenToNotificationsForAllKeyPaths];

    if (!*((unsigned char *)v25 + 24))
    {
      +[RMMDMv1Liaison remoteManagementDidUnenroll];
      id v14 = [(RMClientController *)self lockStateListener];
      [v14 stopListening];
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v12 == 0;
}

- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(RMClientController *)self context];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019F5C;
  v6[3] = &unk_1000C5298;
  void v6[4] = &v7;
  [v5 performBlockAndWait:v6];
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);

  _Block_object_dispose(&v7, 8);
}

- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100015980;
  uint64_t v26 = sub_100015990;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100015980;
  id v20 = sub_100015990;
  id v21 = 0;
  id v8 = [(RMClientController *)self context];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A204;
  v11[3] = &unk_1000C5468;
  id v9 = v6;
  id v12 = v9;
  id v10 = v8;
  id v13 = v10;
  id v14 = &v16;
  id v15 = &v22;
  [v10 performBlockAndWait:v11];
  v7[2](v7, v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100015980;
  uint64_t v26 = sub_100015990;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100015980;
  id v20 = sub_100015990;
  id v21 = 0;
  id v8 = [(RMClientController *)self context];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A4C4;
  v11[3] = &unk_1000C5468;
  id v9 = v6;
  id v12 = v9;
  id v10 = v8;
  id v13 = v10;
  id v14 = &v16;
  id v15 = &v22;
  [v10 performBlockAndWait:v11];
  v7[2](v7, v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)managementChannelsChanged
{
  [(RMClientController *)self context];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100015980;
  uint64_t v24 = sub_100015990;
  id v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001A8A0;
  v16[3] = &unk_1000C4E08;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = self;
  id v19 = &v20;
  id v11 = v17;
  [v17 performBlockAndWait:v16];
  if (v21[5])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = [(RMClientController *)self clientByManagementSourceIdentifier];
    id v4 = [v3 allKeys];

    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (([(id)v21[5] containsObject:v8] & 1) == 0)
          {
            id v9 = +[RMLog clientController];
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v27 = v8;
              _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Removing stale RMClient for: %{public}@", buf, 0xCu);
            }

            id v10 = [(RMClientController *)self clientByManagementSourceIdentifier];
            [v10 removeObjectForKey:v8];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v12 objects:v28 count:16];
      }
      while (v5);
    }
  }
  _Block_object_dispose(&v20, 8);
}

- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "ClientController: syncing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v8, &v14);
  id v9 = +[RMLog clientController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001D838();
  }

  id v10 = [(RMClientController *)self _clientWithIdentifier:v6];
  id v11 = v10;
  if (v10)
  {
    [v10 syncWithCompletionHandler:v7];
  }
  else
  {
    long long v12 = +[RMLog clientController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001D7D0();
    }

    long long v13 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v6];
    v7[2](v7, v13);
  }
  os_activity_scope_leave(&v14);
}

- (void)syncAllManagementSourcesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v6);
  id v7 = [(NSMutableDictionary *)v6 copy];
  objc_sync_exit(v6);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001ACB0;
  v13[3] = &unk_1000C5508;
  dispatch_group_t v14 = v5;
  uint64_t v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];
  id v9 = [(RMClientController *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001AE70;
  v11[3] = &unk_1000C5530;
  id v12 = v4;
  id v10 = v4;
  dispatch_group_notify(v8, v9, v11);
}

- (void)applyNowWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = _os_activity_create((void *)&_mh_execute_header, "ClientController: apply now", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v8, &v14);
  id v9 = +[RMLog clientController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10001D970();
  }

  id v10 = [(RMClientController *)self _clientWithIdentifier:v6];
  id v11 = v10;
  if (v10)
  {
    [v10 applyNowWithCompletionHandler:v7];
  }
  else
  {
    id v12 = +[RMLog clientController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10001D908();
    }

    long long v13 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v6];
    v7[2](v7, v13);
  }
  os_activity_scope_leave(&v14);
}

- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ClientController: updating via push message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v11, &v17);
  id v12 = +[RMLog clientController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10001DA40();
  }

  long long v13 = [(RMClientController *)self _clientWithIdentifier:v8];
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 updateWithPushMessage:v9 completionHandler:v10];
  }
  else
  {
    long long v15 = +[RMLog clientController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10001D9D8();
    }

    uint64_t v16 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v8];
    v10[2](v10, v16);
  }
  os_activity_scope_leave(&v17);
}

- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ClientController: updating via sync tokens", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v11, &v17);
  id v12 = +[RMLog clientController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10001DAA8();
  }

  long long v13 = [(RMClientController *)self _clientWithIdentifier:v8];
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 updateWithTokensResponse:v9 completionHandler:v10];
  }
  else
  {
    long long v15 = +[RMLog clientController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10001D9D8();
    }

    uint64_t v16 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v8];
    v10[2](v10, v16);
  }
  os_activity_scope_leave(&v17);
}

- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ClientController: sending arbitrary status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v11, &v17);
  id v12 = +[RMLog clientController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10001DB78();
  }

  long long v13 = [(RMClientController *)self _clientWithIdentifier:v9];
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 sendStatusData:v8 completionHandler:v10];
  }
  else
  {
    long long v15 = +[RMLog clientController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10001DB10();
    }

    uint64_t v16 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v9];
    v10[2](v10, v16);
  }
  os_activity_scope_leave(&v17);
}

- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ClientController: query for status subscriptions", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v11, &v23);
  id v12 = +[RMLog clientController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v8 allObjects];
    uint64_t v18 = [v17 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v19 = [v18 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543618;
    id v25 = v19;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Querying for status subscriptions with identifiers %{public}@ from %{public}@...", buf, 0x16u);
  }
  long long v13 = [(RMClientController *)self _clientWithIdentifier:v9];
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    long long v15 = [v13 queryForStatusSubscriptionsWithIdentifiers:v8];
    v10[2](v10, v15, 0);
  }
  else
  {
    uint64_t v16 = +[RMLog clientController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v8 allObjects];
      id v21 = [v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      uint64_t v22 = [v21 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543618;
      id v25 = v22;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not query for status subscriptions with identifiers %{public}@, could not find client for identifier: %{public}@", buf, 0x16u);
    }
    long long v15 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v9];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v15);
  }

  os_activity_scope_leave(&v23);
}

- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create((void *)&_mh_execute_header, "ClientController: sending specific status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v11, &v23);
  id v12 = +[RMLog clientController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v8 allObjects];
    uint64_t v18 = [v17 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v19 = [v18 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543618;
    id v25 = v19;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Querying for status subscriptions with identifiers %{public}@ then sending to %{public}@...", buf, 0x16u);
  }
  long long v13 = [(RMClientController *)self _clientWithIdentifier:v9];
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 sendStatusForSubscriptionsWithIdentifiers:v8 completionHandler:v10];
  }
  else
  {
    long long v15 = +[RMLog clientController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v8 allObjects];
      id v21 = [v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      uint64_t v22 = [v21 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543618;
      id v25 = v22;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not query for status subscriptions with identifiers %{public}@, could not find client for identifier: %{public}@", buf, 0x16u);
    }
    uint64_t v16 = +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:v9];
    v10[2](v10, v16);
  }
  os_activity_scope_leave(&v23);
}

- (id)_clientWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_clientByManagementSourceIdentifier objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)clientNeedsToReenrollWithManagementSourceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = +[RMLog clientController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001DCB0();
  }

  if ([(RMClientController *)self _canProcessClientStateChanges:v4])
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BCD8;
    block[3] = &unk_1000C5580;
    id v9 = v4;
    objc_copyWeak(&v10, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v6 = +[RMLog clientController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10001DBE0();
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = +[RMLog clientController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10001DC48();
    }
  }
}

- (void)clientNeedsToUnenrollWithManagementSourceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = +[RMLog clientController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001DDE8();
  }

  if ([(RMClientController *)self _canProcessClientStateChanges:v4])
  {
    [(RMClientController *)self _unenrollAndReenrollIfDEP:v4];
  }
  else
  {
    id v6 = +[RMLog clientController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10001DD80();
    }
  }
}

- (BOOL)_canProcessClientStateChanges:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = [(RMClientController *)self processingClientStateChanges];
  objc_sync_enter(v5);
  id v6 = [(RMClientController *)self processingClientStateChanges];
  unsigned int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = +[RMLog clientController];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10001DD80();
    }
  }
  else
  {
    id v8 = [(RMClientController *)self processingClientStateChanges];
    [v8 addObject:v4];
  }

  objc_sync_exit(v5);
  return v7 ^ 1;
}

- (void)_completedClientStateChanges:(id)a3
{
  id v6 = a3;
  id v4 = [(RMClientController *)self processingClientStateChanges];
  objc_sync_enter(v4);
  dispatch_group_t v5 = [(RMClientController *)self processingClientStateChanges];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)lockStateDidChange:(BOOL)a3
{
  if (!a3) {
    +[RMConfigurationPublisher reprocessActiveConfigurations];
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (RMDeviceLockStateListener)lockStateListener
{
  return self->_lockStateListener;
}

- (NSMutableSet)processingClientStateChanges
{
  return self->_processingClientStateChanges;
}

- (void)setProcessingClientStateChanges:(id)a3
{
}

- (NSMutableDictionary)clientByManagementSourceIdentifier
{
  return self->_clientByManagementSourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientByManagementSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_processingClientStateChanges, 0);
  objc_storeStrong((id *)&self->_lockStateListener, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_cloudConfigLock, 0);
}

@end