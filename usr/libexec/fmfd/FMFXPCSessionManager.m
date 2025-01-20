@interface FMFXPCSessionManager
+ (id)sharedInstance;
- (BOOL)_isApplicationForClientSessionInForeground:(id)a3;
- (FMFXPCSessionManager)init;
- (NSMapTable)internalClientSessions;
- (NSSet)clientSessions;
- (NSTimer)refreshTimer;
- (OS_dispatch_queue)queue;
- (id)_internalClientSessionPIDsString;
- (id)handlesToLocate;
- (void)_modelDataDidLoad;
- (void)addClientSession:(id)a3;
- (void)dealloc;
- (void)invalidateMaxCallbackTimer;
- (void)networkReachabilityUpdated:(id)a3;
- (void)refreshLocations;
- (void)refreshLocationsForSession:(id)a3;
- (void)removeClientSession:(id)a3;
- (void)resetRefreshTimer;
- (void)scheduleRefreshBefore:(double)a3;
- (void)setInternalClientSessions:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRefreshTimer:(id)a3;
- (void)startListeningForModelChangeNotifications;
- (void)startListeningForNotifications;
- (void)stopListeningForModelLoadNotifications;
- (void)stopListeningForNotifications;
- (void)stopTimer;
- (void)updateTrackingTimestampForHandle:(id)a3 timestamp:(id)a4;
@end

@implementation FMFXPCSessionManager

+ (id)sharedInstance
{
  if (qword_1000BB838 != -1) {
    dispatch_once(&qword_1000BB838, &stru_1000A2B98);
  }
  v2 = (void *)qword_1000BB830;

  return v2;
}

- (void)addClientSession:(id)a3
{
  id v4 = a3;
  v5 = [(FMFXPCSessionManager *)self queue];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1000058F8;
  v15 = &unk_1000A1468;
  v16 = self;
  id v6 = v4;
  id v17 = v6;
  dispatch_sync(v5, &v12);

  if (v6)
  {
    v7 = +[FMFDataManager sharedInstance];
    v8 = +[NSSet setWithObject:v6];
    [v7 updateSessionCaches:0 forSessions:v8 pushAllData:1];
  }
  v9 = +[FMFCommandManager sharedInstance];
  unsigned int v10 = [v9 hasModelInitialized];

  if (v10)
  {
    v11 = [v6 clientProxy];
    [v11 modelDidLoad];
  }
}

- (void)removeClientSession:(id)a3
{
  id v4 = a3;
  v5 = [(FMFXPCSessionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005A58;
  v7[3] = &unk_1000A1468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_internalClientSessionPIDsString
{
  v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = [(FMFXPCSessionManager *)self internalClientSessions];
  v5 = [v4 keyEnumerator];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = NSFileManager_ptr;
    uint64_t v9 = *(void *)v30;
    CFStringRef v10 = @"%ld";
    CFStringRef v11 = @",";
    CFStringRef v12 = &stru_1000A3938;
    v27 = v3;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v15 = [v14 connection];
        if ([v15 processIdentifier])
        {
          signed int v16 = [v15 processIdentifier];
        }
        else
        {
          [v14 clientPid];
          id v17 = v7;
          uint64_t v18 = v9;
          CFStringRef v19 = v12;
          CFStringRef v20 = v11;
          CFStringRef v21 = v10;
          v23 = v22 = v8;
          signed int v16 = [v23 intValue];

          id v8 = v22;
          CFStringRef v10 = v21;
          CFStringRef v11 = v20;
          CFStringRef v12 = v19;
          uint64_t v9 = v18;
          id v7 = v17;
          v3 = v27;
        }
        v24 = [v8[25] stringWithFormat:v10, v16];
        if ([v3 length]) {
          CFStringRef v25 = v11;
        }
        else {
          CFStringRef v25 = v12;
        }
        [v3 appendFormat:@"%@%@", v25, v24];
      }
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  return v3;
}

- (NSMapTable)internalClientSessions
{
  return self->_internalClientSessions;
}

- (FMFXPCSessionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMFXPCSessionManager;
  v2 = [(FMFXPCSessionManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSMapTable weakToStrongObjectsMapTable];
    [(FMFXPCSessionManager *)v2 setInternalClientSessions:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.fmfd.xpcsessionmanager", 0);
    [(FMFXPCSessionManager *)v2 setQueue:v4];

    [(FMFXPCSessionManager *)v2 startListeningForNotifications];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(FMFXPCSessionManager *)self stopListeningForNotifications];
  v4.receiver = self;
  v4.super_class = (Class)FMFXPCSessionManager;
  [(FMFXPCSessionManager *)&v4 dealloc];
}

- (void)invalidateMaxCallbackTimer
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received notification FMFAccountWasRemovedNotification, invalidating timer", v4, 2u);
  }

  [(FMFXPCSessionManager *)self stopTimer];
}

- (NSSet)clientSessions
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  objc_super v4 = [(FMFXPCSessionManager *)self queue];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  CFStringRef v10 = sub_10003D058;
  CFStringRef v11 = &unk_1000A1468;
  CFStringRef v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = [v5 copy:v8, v9, v10, v11, v12];

  return (NSSet *)v6;
}

- (void)updateTrackingTimestampForHandle:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMFXPCSessionManager *)self clientSessions];
  id v9 = [v8 copy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v23;
    *(void *)&long long v12 = 138412546;
    long long v21 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v10);
        }
        signed int v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v17 = [v16 handles:v21, v22];
        id v18 = [v17 copy];

        CFStringRef v19 = [v18 member:v6];
        if (v19)
        {
          CFStringRef v20 = sub_100005560();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v27 = v19;
            __int16 v28 = 2112;
            long long v29 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "updating tracking timestamp for handle: %@ in session: %@", buf, 0x16u);
          }

          [v19 setTrackingTimestamp:v7];
        }
      }
      id v13 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }
}

- (void)resetRefreshTimer
{
}

- (void)refreshLocationsForSession:(id)a3
{
  id v4 = a3;
  [(FMFXPCSessionManager *)self resetRefreshTimer];
  id v5 = [v4 handles];
  id v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v12 = v5;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Quickly refreshing handles: %@, for session: %@", buf, 0x16u);
  }

  id v7 = +[FMFCommandManager sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D4BC;
  v9[3] = &unk_1000A1708;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchLocationForHandles:v8 forSession:v4 callerId:0 priority:1 completionBlock:v9];
}

- (void)scheduleRefreshBefore:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D63C;
  v3[3] = &unk_1000A15C0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)stopTimer
{
  id v3 = [(FMFXPCSessionManager *)self refreshTimer];

  if (v3)
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stopping refresh timer...", v6, 2u);
    }

    id v5 = [(FMFXPCSessionManager *)self refreshTimer];
    [v5 invalidate];

    [(FMFXPCSessionManager *)self setRefreshTimer:0];
  }
}

- (id)handlesToLocate
{
  id v3 = [(FMFXPCSessionManager *)self clientSessions];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138412802;
    long long v17 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (-[FMFXPCSessionManager _isApplicationForClientSessionInForeground:](self, "_isApplicationForClientSessionInForeground:", v11, v17, (void)v18))
        {
          long long v12 = [v11 handles];
          [v4 unionSet:v12];
        }
        else
        {
          long long v12 = sub_100005560();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v13 = [v11 clientPid];
            id v14 = [v11 clientBundleId];
            v15 = [v11 handles];
            *(_DWORD *)buf = v17;
            long long v23 = v13;
            __int16 v24 = 2112;
            long long v25 = v14;
            __int16 v26 = 2112;
            v27 = v15;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not refreshing session as app pid %@ bundleID: %@ is not in the foreground for handles: %@", buf, 0x20u);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)refreshLocations
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Refreshing location.", buf, 2u);
  }

  [(FMFXPCSessionManager *)self stopTimer];
  id v4 = +[FMFCommandManager sharedInstance];
  unsigned __int8 v5 = [v4 hasModelInitialized];

  if (v5)
  {
    id v6 = [(FMFXPCSessionManager *)self clientSessions];
    long long v7 = [(FMFXPCSessionManager *)self handlesToLocate];
    id v8 = +[FMFNetworkObserver sharedInstance];
    unsigned int v9 = [v8 isNetworkReachable];

    id v10 = [v7 count];
    id v11 = sub_100005560();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 && v9)
    {
      if (v12)
      {
        id v13 = [v6 count];
        *(_DWORD *)buf = 134218242;
        id v34 = v13;
        __int16 v35 = 2112;
        v36 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Refreshing due to tracking handles for %lu sessions: %@", buf, 0x16u);
      }

      id v14 = +[FMFCommandManager sharedInstance];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10003DE60;
      v29[3] = &unk_1000A2BC0;
      long long v30 = v6;
      long long v31 = self;
      [v14 getLocationForHandles:v7 forSession:0 callerId:0 priority:0 completionBlock:v29];

      id v11 = v30;
    }
    else
    {
      if (v9)
      {
        if (!v12) {
          goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        signed int v16 = "No handles to refresh.";
      }
      else
      {
        if (!v12) {
          goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        signed int v16 = "Not refreshing due to no network.";
      }
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
LABEL_17:

    id v17 = objc_alloc_init((Class)NSMutableSet);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v15 = v6;
    id v18 = [v15 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v15);
          }
          long long v22 = [*(id *)(*((void *)&v25 + 1) + 8 * i) handles:v25];
          [v17 unionSet:v22];
        }
        id v19 = [v15 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v19);
    }

    if ([v17 count])
    {
      if ([v7 count])
      {
        [(FMFXPCSessionManager *)self scheduleRefreshBefore:2147483650.0];
LABEL_33:

        goto LABEL_34;
      }
      long long v23 = sub_100005560();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v24 = "Not rescheduling refresh due no application with valid session is active";
        goto LABEL_31;
      }
    }
    else
    {
      long long v23 = sub_100005560();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v24 = "Not rescheduling refresh due to no handles in all sessions.";
LABEL_31:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      }
    }

    goto LABEL_33;
  }
  v15 = sub_100005560();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Model not initialized, not scheduling refresh", buf, 2u);
  }
LABEL_34:
}

- (BOOL)_isApplicationForClientSessionInForeground:(id)a3
{
  id v3 = [a3 clientPid];
  id v4 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  unsigned __int8 v5 = [v4 applicationInfoForPID:[v3 intValue]];
  [v4 invalidate];
  id v6 = [v5 objectForKeyedSubscript:BKSApplicationStateAppIsFrontmostKey];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (void)_modelDataDidLoad
{
  id v3 = +[FMFCommandManager sharedInstance];
  unsigned int v4 = [v3 hasModelInitialized];

  if (v4)
  {
    unsigned __int8 v5 = [(FMFXPCSessionManager *)self clientSessions];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        unsigned int v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) clientProxy];
          [v10 modelDidLoad];

          unsigned int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)startListeningForNotifications
{
}

- (void)stopListeningForNotifications
{
}

- (void)startListeningForModelChangeNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_modelDataDidLoad" name:off_1000BAFE0 object:0];
}

- (void)stopListeningForModelLoadNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:off_1000BAFE0 object:0];
}

- (void)networkReachabilityUpdated:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  unsigned __int8 v5 = [v4 objectForKeyedSubscript:@"status"];
  id v6 = [v5 BOOLValue];

  id v7 = [(FMFXPCSessionManager *)self clientSessions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) clientProxy];
        [v12 networkReachabilityUpdated:v6];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setInternalClientSessions:(id)a3
{
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);

  objc_storeStrong((id *)&self->_internalClientSessions, 0);
}

@end