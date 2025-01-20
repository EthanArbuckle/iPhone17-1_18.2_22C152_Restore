@interface CSDCallDirectoryManager
+ (CSDCallDirectoryManager)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3;
- (CSDCallDirectoryManager)initWithQueue:(id)a3;
- (CSDDeviceLockStateObserver)deviceLockObserver;
- (CSDSharedConversationServerBag)serverBag;
- (CXCallDirectoryManager)manager;
- (CXCallDirectoryNSExtensionManager)nsExtensionManager;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3;
- (unint64_t)countOfNotificationsReceived;
- (void)beginDailyMaintenanceWithActivity:(id)a3;
- (void)callDirectoryNSExtensionManager:(id)a3 extensionsChanged:(id)a4;
- (void)setCountOfNotificationsReceived:(unint64_t)a3;
- (void)setManager:(id)a3;
@end

@implementation CSDCallDirectoryManager

+ (CSDCallDirectoryManager)sharedInstance
{
  return (CSDCallDirectoryManager *)+[CSDCallDirectoryManager sharedInstanceWithQueue:&_dispatch_main_q];
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000803A0;
  block[3] = &unk_100504EC0;
  id v8 = a3;
  uint64_t v3 = qword_10058C2D8;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10058C2D8, block);
  }
  id v5 = (id)qword_10058C2D0;

  return v5;
}

- (CSDCallDirectoryManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CSDCallDirectoryManager;
  v6 = [(CSDCallDirectoryManager *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = [[CSDDeviceLockStateObserver alloc] initWithQueue:v7->_queue];
    deviceLockObserver = v7->_deviceLockObserver;
    v7->_deviceLockObserver = v8;

    objc_initWeak(&location, v7);
    v10 = v7->_deviceLockObserver;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000805F8;
    v20[3] = &unk_100505698;
    objc_copyWeak(&v21, &location);
    [(CSDDeviceLockStateObserver *)v10 performBlockAfterFirstUnlock:v20];
    v11 = (CXCallDirectoryNSExtensionManager *)objc_alloc_init((Class)CXCallDirectoryNSExtensionManager);
    nsExtensionManager = v7->_nsExtensionManager;
    v7->_nsExtensionManager = v11;

    [(CXCallDirectoryNSExtensionManager *)v7->_nsExtensionManager setDelegate:v7 queue:v7->_queue];
    [(CXCallDirectoryNSExtensionManager *)v7->_nsExtensionManager beginMatchingExtensions];
    v13 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v7->_featureFlags;
    v7->_featureFlags = v13;

    v15 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v7->_serverBag;
    v7->_serverBag = v15;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100080690;
    handler[3] = &unk_1005060D8;
    v19 = v7;
    xpc_activity_register("com.apple.telephonyutilities.callservicesd.calldirectorymaintenance.daily", XPC_ACTIVITY_CHECK_IN, handler);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDirectoryManager *)self featureFlags];
  unsigned int v6 = [v5 liveIDLookupEnabled];

  if (v6)
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetchLiveBlockingInfoForHandle handle=%@", (uint8_t *)&v15, 0xCu);
    }

    id v8 = [(CSDCallDirectoryManager *)self manager];

    unsigned int v9 = 0;
    if (v4 && v8)
    {
      v10 = [(CSDCallDirectoryManager *)self manager];
      v11 = [(CSDCallDirectoryManager *)self serverBag];
      [v11 liveLookupTimeoutSeconds];
      unsigned int v9 = objc_msgSend(v10, "fetchLiveBlockingInfoForHandle:timeout:", v4);
    }
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v9) {
        CFStringRef v13 = @"YES";
      }
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      CFStringRef v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "fetchLiveBlockingInfoForHandle handle=%@ block=%@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDirectoryManager *)self featureFlags];
  unsigned int v6 = [v5 liveIDLookupEnabled];

  if (v6)
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber handle=%@", (uint8_t *)&v14, 0xCu);
    }

    id v8 = [(CSDCallDirectoryManager *)self manager];

    if (v8)
    {
      unsigned int v9 = [(CSDCallDirectoryManager *)self manager];
      v10 = [(CSDCallDirectoryManager *)self serverBag];
      [v10 liveLookupTimeoutSeconds];
      v11 = objc_msgSend(v9, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:timeout:", v4);
    }
    else
    {
      v11 = 0;
    }
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber handle=%@ blockedByExtension=%@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)beginDailyMaintenanceWithActivity:(id)a3
{
  id v4 = (_xpc_activity_s *)a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting activity state to XPC_ACTIVITY_STATE_CONTINUE", buf, 2u);
  }

  if (!xpc_activity_set_state(v4, 4))
  {
    unsigned int v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1003A8DC8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  int v14 = [(CSDCallDirectoryManager *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100080C0C;
  v16[3] = &unk_100504F10;
  v16[4] = self;
  __int16 v17 = v4;
  id v15 = v4;
  dispatch_async(v14, v16);
}

- (void)callDirectoryNSExtensionManager:(id)a3 extensionsChanged:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [(CSDCallDirectoryManager *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(CSDCallDirectoryManager *)self manager];

  if (v7)
  {
    [(CSDCallDirectoryManager *)self setCountOfNotificationsReceived:(char *)[(CSDCallDirectoryManager *)self countOfNotificationsReceived] + 1];
    uint64_t v8 = +[NSString stringWithFormat:@"extensionsChangedForCallDirectoryExtensionManager-%lu", [(CSDCallDirectoryManager *)self countOfNotificationsReceived]];
    uint64_t v9 = +[CSDTransactionManager sharedInstance];
    [v9 beginTransactionIfNecessaryForObject:v8 withReason:@"CXCallDirectoryNSExtensionManagerDelegate"];

    uint64_t v10 = [(CSDCallDirectoryManager *)self manager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008116C;
    v12[3] = &unk_100505418;
    v12[4] = self;
    id v13 = v8;
    uint64_t v11 = v8;
    [v10 synchronizeExtensionsWithCompletionHandler:v12];
  }
  else
  {
    uint64_t v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003A8F08();
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDDeviceLockStateObserver)deviceLockObserver
{
  return self->_deviceLockObserver;
}

- (CXCallDirectoryManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (CXCallDirectoryNSExtensionManager)nsExtensionManager
{
  return self->_nsExtensionManager;
}

- (unint64_t)countOfNotificationsReceived
{
  return self->_countOfNotificationsReceived;
}

- (void)setCountOfNotificationsReceived:(unint64_t)a3
{
  self->_countOfNotificationsReceived = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDSharedConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_nsExtensionManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_deviceLockObserver, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end