@interface NDSpringBoard
+ (id)sharedSpringBoard;
- (BOOL)application:(id)a3 hasAssertionWithName:(id)a4;
- (BOOL)application:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5;
- (BOOL)applicationBackgroundUpdatesEnabled:(id)a3;
- (BOOL)applicationHasBackgroundTaskCompletion:(id)a3;
- (BOOL)applicationIsForeground:(id)a3;
- (BOOL)identifierIsForSpringBoardApplication:(id)a3;
- (BOOL)isValidAssertion:(id)a3 withName:(id)a4;
- (BOOL)takeAssertionForBundleID:(id)a3 sessionID:(id)a4 sessionUUID:(id)a5 pid:(int)a6;
- (BOOL)wakeUpApp:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5;
- (NDSpringBoard)init;
- (id)assertionNameForSessionUUID:(id)a3;
- (id)getBackgroundSettingsAppList;
- (void)_onqueue_releaseAssertionForBundleID:(id)a3 sessionID:(id)a4;
- (void)addObserver:(id)a3 forApplication:(id)a4;
- (void)dealloc;
- (void)handleBackgroundSettingsChange;
- (void)handleStateUpdate:(id)a3 forProcess:(id)a4;
- (void)monitoredBundleIDsUpdated;
- (void)releaseAssertionForBundleID:(id)a3 sessionID:(id)a4;
- (void)removeObserver:(id)a3 forApplication:(id)a4;
- (void)startMonitoringBundleID:(id)a3;
- (void)stopMonitoringBundleID:(id)a3;
@end

@implementation NDSpringBoard

- (void)startMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005884;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)getBackgroundSettingsAppList
{
  +[NSUserDefaults resetStandardUserDefaults];
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.mt"];

  id v4 = [v3 objectForKey:@"KeepAppsUpToDateAppList"];

  return v4;
}

- (void)addObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005F5C;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (BOOL)application:(id)a3 isHandlingBackgroundSessionWithIdentifier:(id)a4 withSessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NDSpringBoard *)self assertionNameForSessionUUID:v10];
  id v12 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412546;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "looking for background session %@ for bundle id %@", (uint8_t *)&v17, 0x16u);
  }
  if (v9)
  {
    os_unfair_lock_lock(&self->_assertion_lock);
    id v13 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v8];
    v14 = [v13 objectForKeyedSubscript:v9];

    os_unfair_lock_unlock(&self->_assertion_lock);
    if (v14) {
      BOOL v15 = [(NDSpringBoard *)self isValidAssertion:v14 withName:v11];
    }
    else {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = [(NDSpringBoard *)self application:v8 hasAssertionWithName:v11];
  }

  return v15;
}

- (BOOL)application:(id)a3 hasAssertionWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  os_unfair_lock_lock(&self->_assertion_lock);
  id v8 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v6];
  os_unfair_lock_unlock(&self->_assertion_lock);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100061AE4;
  v14[3] = &unk_1000B6110;
  v14[4] = self;
  id v9 = v7;
  id v15 = v9;
  v16 = &v17;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  id v10 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_INFO))
  {
    if (*((unsigned char *)v18 + 24)) {
      v11 = "found";
    }
    else {
      v11 = "could not find";
    }
    *(_DWORD *)buf = 136315650;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s assertion with name %@ for bundle id %@", buf, 0x20u);
  }
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)handleStateUpdate:(id)a3 forProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C74;
  block[3] = &unk_1000B60C0;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

+ (id)sharedSpringBoard
{
  if (qword_1000CB128 != -1) {
    dispatch_once(&qword_1000CB128, &stru_1000B5FE0);
  }
  v2 = (void *)qword_1000CB130;

  return v2;
}

- (BOOL)applicationIsForeground:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10006110C;
  id v15 = sub_10006111C;
  id v16 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000060C8;
  block[3] = &unk_1000B60E8;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(queue, block);
  LOBYTE(queue) = [(id)v12[5] BOOLValue];

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)monitoredBundleIDsUpdated
{
  monitor = self->_monitor;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000052B8;
  v3[3] = &unk_1000B6030;
  v3[4] = self;
  [(RBSProcessMonitor *)monitor updateConfiguration:v3];
}

- (id)assertionNameForSessionUUID:(id)a3
{
  v3 = +[NSString stringWithFormat:@"com.apple.nsurlsessiond.handlesession %@", a3];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIDs, 0);
  objc_storeStrong((id *)&self->_observedBackgroundSettings, 0);
  objc_storeStrong((id *)&self->_appIsForeground, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

- (BOOL)identifierIsForSpringBoardApplication:(id)a3
{
  id v3 = a3;
  id v4 = +[Daemon sharedDaemon];
  unsigned __int8 v5 = [v4 applicationIsInstalled:v3];

  return v5;
}

- (BOOL)wakeUpApp:(id)a3 forSession:(id)a4 withSessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v29 = a5;
  id v10 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2112;
    v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will request wake of app %@ for NDSession <%{public}@> with identifier %@", buf, 0x20u);
  }
  uint64_t v11 = +[NSDictionary dictionaryWithObject:v9, @"UIApplicationLaunchOptionsURLSessionKey", v29 forKey];
  v51[0] = FBSOpenApplicationOptionKeyActivateSuspended;
  v51[1] = FBSOpenApplicationOptionKeyPayloadOptions;
  v52[0] = &__kCFBooleanTrue;
  v52[1] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v48 = sub_10006110C;
  v49 = sub_10006111C;
  id v50 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10006110C;
  v39 = sub_10006111C;
  id v40 = 0;
  v14 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  id v15 = self;
  id v16 = +[FBSOpenApplicationOptions optionsWithDictionary:v12];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100061124;
  v31[3] = &unk_1000B6138;
  v33 = buf;
  v34 = &v35;
  uint64_t v17 = v13;
  v32 = v17;
  [v14 openApplication:v8 withOptions:v16 completion:v31];

  dispatch_time_t v18 = dispatch_time(0, 10000000000);
  intptr_t v19 = dispatch_semaphore_wait(v17, v18);
  uint64_t v20 = v36[5];
  if (v20 || (__int16 v23 = *(void **)(*(void *)&buf[8] + 40)) == 0)
  {
    uint64_t v21 = qword_1000CB148;
    if (!os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)v41 = 138412802;
    id v42 = v8;
    __int16 v43 = 2112;
    uint64_t v44 = v20;
    __int16 v45 = 1024;
    BOOL v46 = v19 != 0;
    id v26 = "Failed to open application %@, error: %@ timeout: %{BOOL}d";
    v27 = v21;
    uint32_t v28 = 28;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, v41, v28);
    goto LABEL_5;
  }
  unsigned __int8 v24 = -[NDSpringBoard takeAssertionForBundleID:sessionID:sessionUUID:pid:](v15, "takeAssertionForBundleID:sessionID:sessionUUID:pid:", v8, v9, v30, [v23 pid]);
  __int16 v25 = qword_1000CB148;
  if ((v24 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)v41 = 138412290;
    id v42 = v8;
    id v26 = "Failed to take process assertion for %@";
    v27 = v25;
    uint32_t v28 = 12;
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v41 = 138412290;
    id v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully woke application %@ and took process assertion", v41, 0xCu);
  }
LABEL_5:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

  return 1;
}

- (BOOL)takeAssertionForBundleID:(id)a3 sessionID:(id)a4 sessionUUID:(id)a5 pid:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v32 = a5;
  v33 = -[NDSpringBoard assertionNameForSessionUUID:](self, "assertionNameForSessionUUID:");
  id v12 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.cfnetwork" name:@"BackgroundDownload"];
  id v13 = objc_alloc((Class)RBSAssertion);
  v14 = +[RBSTarget targetWithPid:v6];
  v41 = v12;
  id v15 = +[NSArray arrayWithObjects:&v41 count:1];
  id v16 = [v13 initWithExplanation:v33 target:v14 attributes:v15];

  id v34 = 0;
  unsigned __int8 v17 = [v16 acquireWithError:&v34];
  id v18 = v34;
  if (v17)
  {
    os_unfair_lock_lock(&self->_assertion_lock);
    intptr_t v19 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v10];
    BOOL v20 = v19 == 0;

    if (v20)
    {
      uint64_t v21 = +[NSMutableDictionary dictionary];
      [(NSMutableDictionary *)self->_assertions setObject:v21 forKeyedSubscript:v10];
    }
    v22 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v10];
    __int16 v23 = [v22 objectForKeyedSubscript:v11];
    BOOL v24 = v23 == 0;

    if (!v24)
    {
      __int16 v25 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v10;
        __int16 v37 = 2112;
        id v38 = v11;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "We already have an assertion for bundleID: %@, sessionID: %@", buf, 0x16u);
      }
      id v26 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v10];
      v27 = [v26 objectForKeyedSubscript:v11];
      [v27 invalidate];
    }
    uint32_t v28 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v10];
    [v28 setObject:v16 forKeyedSubscript:v11];

    os_unfair_lock_unlock(&self->_assertion_lock);
    id v29 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v11;
      __int16 v39 = 2112;
      id v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "took assertion for %@, session %@, uuid %@", buf, 0x20u);
    }
  }
  else
  {
    v30 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Couldn't create process assertion for %@ (%@)", buf, 0x16u);
    }
  }

  return v17;
}

- (void)releaseAssertionForBundleID:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000616B4;
  block[3] = &unk_1000B60C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_onqueue_releaseAssertionForBundleID:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_assertion_lock = &self->_assertion_lock;
  os_unfair_lock_lock(&self->_assertion_lock);
  id v9 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v6];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    id v11 = [(NSMutableDictionary *)self->_assertions objectForKeyedSubscript:v6];
    [v11 removeObjectForKey:v7];

    os_unfair_lock_unlock(p_assertion_lock);
    id v12 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalidating assertion for bundleID: %@. sessionID: %@", (uint8_t *)&v13, 0x16u);
    }
    [v10 invalidate];
  }
  else
  {
    os_unfair_lock_unlock(&self->_assertion_lock);
  }
}

- (BOOL)applicationBackgroundUpdatesEnabled:(id)a3
{
  id v4 = a3;
  if (self->_backgroundUpdatesAllowed)
  {
    unsigned __int8 v5 = [(NSMutableDictionary *)self->_observedBackgroundSettings objectForKeyedSubscript:v4];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)applicationHasBackgroundTaskCompletion:(id)a3
{
  id v3 = a3;
  id v4 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "looking for background task completion for bundle id %@", buf, 0xCu);
  }
  unsigned __int8 v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v3];
  unsigned __int8 v6 = +[RBSProcessHandle handleForPredicate:v5 error:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 currentState];
  id v8 = [v7 assertions];

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) reason] == (id)4)
        {
          LOBYTE(v9) = 1;
          goto LABEL_13;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v9;
}

- (BOOL)isValidAssertion:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "validating assertion %@", (uint8_t *)&v10, 0xCu);
    if (!v6) {
      goto LABEL_6;
    }
  }
  else if (!v6)
  {
    goto LABEL_6;
  }
  id v7 = [v5 explanation];
  if (![v7 isEqualToString:v6])
  {
    unsigned __int8 v8 = 0;
LABEL_7:

    goto LABEL_8;
  }
LABEL_6:
  unsigned __int8 v8 = [v5 isValid];
  if (v6) {
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (void)stopMonitoringBundleID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100061CFC;
  v7[3] = &unk_1000B63D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061EE4;
  block[3] = &unk_1000B60C0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)handleBackgroundSettingsChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006207C;
  block[3] = &unk_1000B6380;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NDSpringBoard;
  [(NDSpringBoard *)&v4 dealloc];
}

- (NDSpringBoard)init
{
  v26.receiver = self;
  v26.super_class = (Class)NDSpringBoard;
  v2 = [(NDSpringBoard *)&v26 init];
  id v3 = v2;
  if (v2)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100062950;
    v24[3] = &unk_1000B6030;
    objc_super v4 = v2;
    __int16 v25 = v4;
    uint64_t v5 = +[RBSProcessMonitor monitorWithConfiguration:v24];
    monitor = v4->_monitor;
    v4->_monitor = (RBSProcessMonitor *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    assertions = v4->_assertions;
    v4->_assertions = (NSMutableDictionary *)v7;

    v4->_assertion_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = +[NSMutableDictionary dictionary];
    observers = v4->_observers;
    v4->_observers = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    appIsForeground = v4->_appIsForeground;
    v4->_appIsForeground = (NSMutableDictionary *)v11;

    id v13 = +[MCProfileConnection sharedConnection];
    v4->_backgroundUpdatesAllowed = [v13 isAutomaticAppUpdatesAllowed];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_100062A64, @"kKeepAppsUpToDateEnabledChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v15 = +[NSMutableDictionary dictionary];
    observedBackgroundSettings = v4->_observedBackgroundSettings;
    v4->_observedBackgroundSettings = (NSMutableDictionary *)v15;

    uint64_t v17 = +[NSMutableSet set];
    monitoredBundleIDs = v4->_monitoredBundleIDs;
    v4->_monitoredBundleIDs = (NSMutableSet *)v17;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.nsnetwork.SpringBoard-queue", v20);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v21;
  }
  return v3;
}

@end