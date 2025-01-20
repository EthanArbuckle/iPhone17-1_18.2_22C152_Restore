@interface BKTVOutController
- (BKTVOutController)init;
- (BOOL)displayIsConnected:(id)a3;
- (BOOL)supportCloningToDisplay:(id)a3;
- (NSArray)windowServerDisplays;
- (id)windowServerDisplayForDisplayIdentifier:(unsigned int)a3;
- (void)_handleIapServerConnectionDied;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)systemShellDidFinishLaunching:(id)a3;
@end

@implementation BKTVOutController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_blankingContext, 0);
  objc_storeStrong((id *)&self->_queue_cloneMirrorManager, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_handleIapServerConnectionDied
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064FBC;
    block[3] = &unk_1000F8E78;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  id v11 = 0;
  id v12 = 0;
  sub_100065134((uint64_t)self, &v12, &v11, 1);
  id v4 = v12;
  id v5 = v11;
  if ([v4 count]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065480;
    block[3] = &unk_1000F8E08;
    block[4] = self;
    id v9 = v4;
    id v10 = v5;
    dispatch_async(workQueue, block);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_class();
  id v14 = v11;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    if ([v10 isEqualToString:@"currentMode"])
    {
      id v17 = [v16 immutableCopy];
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100065D50;
      block[3] = &unk_1000F7840;
      id v29 = v14;
      id v30 = v12;
      v31 = self;
      id v32 = v17;
      v19 = v17;
      dispatch_async(workQueue, block);

      v20 = v29;
    }
    else
    {
      if (![v10 isEqualToString:@"availableModes"])
      {
        v19 = BKLogDisplay();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v34 = v10;
          __int16 v35 = 2114;
          id v36 = v14;
          __int16 v37 = 2114;
          id v38 = v12;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ changed on %{public}@ -> %{public}@", buf, 0x20u);
        }
        goto LABEL_15;
      }
      id v21 = [v16 immutableCopy];
      uint64_t v22 = 2 * (a6 == @"Wireless");
      BOOL v23 = a6 == @"PurpleTVOut";
      v24 = self->_workQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100065FA8;
      v25[3] = &unk_1000F7868;
      if (v23) {
        uint64_t v22 = 1;
      }
      v25[4] = self;
      id v26 = v21;
      uint64_t v27 = v22;
      v19 = v21;
      dispatch_async(v24, v25);
      v20 = v26;
    }

LABEL_15:
  }
}

- (BOOL)supportCloningToDisplay:(id)a3
{
  id v4 = [a3 name];
  if ([v4 isEqualToString:@"Wireless"])
  {
    BOOL v5 = 1;
  }
  else if ([v4 isEqualToString:@"TVOut"])
  {
    BOOL v5 = !self->_queue_forceTVOutMode;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)displayIsConnected:(id)a3
{
  unsigned int v4 = [a3 displayId];
  if (self)
  {
    unsigned int v5 = v4;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v6 = +[CADisplay displays];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v11 displayId] == v5)
          {
            id v12 = [v11 immutableCopy];
            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_12:
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = [v12 availableModes];
  BOOL v14 = [v13 count] != 0;

  return v14;
}

- (id)windowServerDisplayForDisplayIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = +[CAWindowServer serverIfRunning];
  unsigned int v5 = [v4 displayWithDisplayId:v3];

  return v5;
}

- (NSArray)windowServerDisplays
{
  v2 = +[CAWindowServer serverIfRunning];
  uint64_t v3 = [v2 displays];

  return (NSArray *)v3;
}

- (void)dealloc
{
  if (self)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"com.apple.iapd.videoout.SettingsChanged", 0);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, 0, @"kIAPDServerDiedNotification", 0);
    unsigned int v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:@"BKTetherControllerTetherStateChangedNotification" object:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)BKTVOutController;
  [(BKTVOutController *)&v6 dealloc];
}

- (BKTVOutController)init
{
  v33.receiver = self;
  v33.super_class = (Class)BKTVOutController;
  v2 = [(BKTVOutController *)&v33 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)Serial;

    unsigned int v5 = [[BKDisplayCloneMirroringManager alloc] initWithDisplayProvider:v2];
    queue_cloneMirrorManager = v2->_queue_cloneMirrorManager;
    v2->_queue_cloneMirrorManager = v5;

    id v26 = +[CAWindowServer serverIfRunning];
    id v7 = [v26 displayWithName:@"TVOut"];
    if (v7)
    {
      id v8 = sub_100010DDC();

      if (v7 == v8) {
        v2->_queue_forceTVOutMode = 1;
      }
    }
    v25 = +[CADisplay TVOutDisplay];
    [v25 addObserver:v2 forKeyPath:@"currentMode" options:0 context:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100066990, @"com.apple.iapd.videoout.SettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)sub_100066894, @"kIAPDServerDiedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v11 = +[NSNotificationCenter defaultCenter];
    id v12 = +[BKTetherController sharedInstance];
    [v11 addObserver:v2 selector:"_tetherSettingChanged:" name:@"BKTetherControllerTetherStateChangedNotification" object:v12];

    uint64_t v13 = +[BKSystemShellSentinel sharedInstance];
    uint64_t v14 = [v13 addSystemShellObserver:v2 reason:@"BKTVOutController"];
    systemShellObserving = v2->_systemShellObserving;
    v2->_systemShellObserving = (BSInvalidatable *)v14;

    id v31 = 0;
    id v32 = 0;
    sub_100065134((uint64_t)v2, &v32, &v31, 0);
    id v16 = v32;
    id v17 = v31;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v23 addObserver:v2 forKeyPath:@"availableModes" options:0 context:@"Wireless"];
          [(BKTVOutController *)v2 observeValueForKeyPath:@"availableModes" ofObject:v23 change:0 context:@"Wireless"];
        }
        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v20);
    }

    if (v7 && v17)
    {
      sub_100065A28((uint64_t)v2, 1, v7);
      [v17 addObserver:v2 forKeyPath:@"availableModes" options:0 context:@"PurpleTVOut"];
      [(BKTVOutController *)v2 observeValueForKeyPath:@"availableModes" ofObject:v17 change:0 context:@"PurpleTVOut"];
    }
  }
  return v2;
}

@end