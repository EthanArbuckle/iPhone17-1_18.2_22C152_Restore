@interface NDSpringBoardApplication
+ (id)requestDelayQueue;
- (BOOL)backgroundUpdatesEnabled;
- (BOOL)canBeSuspended;
- (BOOL)hasBackgroundTaskCompletion;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4;
- (BOOL)shouldElevateDiscretionaryPriority;
- (BOOL)supportsWakes;
- (BOOL)usesContainerManagerForAVAsset;
- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5;
- (NDSpringBoardApplication)initWithIdentifier:(id)a3;
- (id)containerURL;
- (void)_onqueue_resetRequestDelay;
- (void)addObserver:(id)a3;
- (void)applicationBackgroundUpdatesTurnedOff:(id)a3;
- (void)applicationBackgroundUpdatesTurnedOn:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)applicationWasQuitFromAppSwitcher:(id)a3;
- (void)applicationWasSuspended:(id)a3 pid:(int)a4;
- (void)disableTransitionalDiscretionaryPeriodTimer;
- (void)removeObserver:(id)a3;
- (void)setupDelayTimer;
- (void)setupTransitionalDiscretionaryPeriodTimer;
- (void)startTransitionalDiscretionaryPeriodTimer;
@end

@implementation NDSpringBoardApplication

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NDSpringBoard sharedSpringBoard];
  LOBYTE(self) = [v8 application:self->super._bundleIdentifier isHandlingBackgroundSessionWithIdentifier:v6 withSessionUUID:v7];

  return (char)self;
}

- (void)_onqueue_resetRequestDelay
{
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->super._bundleIdentifier;
    int v6 = 138412290;
    id v7 = bundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting request delay for %@", (uint8_t *)&v6, 0xCu);
  }
  [(NDApplication *)self setCurrentRequestDelay:0.0];
  delayTimer = self->_delayTimer;
  if (delayTimer) {
    dispatch_source_set_timer(delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)applicationEnteredForeground:(id)a3
{
  id v4 = a3;
  v5 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting request delay and clearing pending wake requests for %@ since it came into the foreground", buf, 0xCu);
  }
  int v6 = self;
  objc_sync_enter(v6);
  id v7 = +[NDSpringBoardApplication requestDelayQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C6B0;
  block[3] = &unk_1000B6380;
  block[4] = v6;
  dispatch_async(v7, block);

  v9.receiver = v6;
  v9.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v9 invokeSelectorForAllObservers:"applicationEnteredForeground:"];
  objc_sync_exit(v6);

  v8 = v6;
  objc_sync_enter(v8);
  [(NDSpringBoardApplication *)v8 disableTransitionalDiscretionaryPeriodTimer];
  objc_sync_exit(v8);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(NSMutableArray *)v5->super._observers count])
  {
    int v6 = +[NDSpringBoard sharedSpringBoard];
    [v6 startMonitoringBundleID:v5->super._bundleIdentifier];

    id v7 = +[NDSpringBoard sharedSpringBoard];
    [v7 addObserver:v5 forApplication:v5->super._bundleIdentifier];

    if (![(NDSpringBoardApplication *)v5 isHandlingBackgroundURLSessionWithIdentifier:0 withSessionUUID:0])
    {
      v8 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = v5->super._bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v14 = bundleIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting request delay and clearing pending wake requests for %@ since the first observer is being added", buf, 0xCu);
      }
      v10 = +[NDSpringBoardApplication requestDelayQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000C6F8;
      block[3] = &unk_1000B6380;
      block[4] = v5;
      dispatch_async(v10, block);
    }
  }
  v11.receiver = v5;
  v11.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v11 addObserver:v4];
  objc_sync_exit(v5);
}

- (BOOL)canBeSuspended
{
  return 1;
}

- (id)containerURL
{
  id v2 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:self->super._bundleIdentifier allowPlaceholder:0 error:0];
  v3 = [v2 dataContainerURL];

  return v3;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 0;
}

- (void)disableTransitionalDiscretionaryPeriodTimer
{
  transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
  if (transitionalDiscretionaryStateTimer) {
    dispatch_source_set_timer(transitionalDiscretionaryStateTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }

  [(NDApplication *)self setIsInTransitionalDiscretionaryPeriod:0];
}

+ (id)requestDelayQueue
{
  if (qword_1000CB0E0 != -1) {
    dispatch_once(&qword_1000CB0E0, &stru_1000B5968);
  }
  id v2 = (void *)qword_1000CB0D8;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingApplication, 0);
  objc_storeStrong((id *)&self->_transitionalDiscretionaryStateTimer, 0);
  objc_storeStrong((id *)&self->_extendedNonDiscretionaryGracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_nonDiscretionaryGracePeriodTimer, 0);

  objc_storeStrong((id *)&self->_delayTimer, 0);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v5 invokeSelectorForAllObservers:"applicationNoLongerInForeground:"];
  id v4 = self;
  objc_sync_enter(v4);
  [(NDSpringBoardApplication *)v4 startTransitionalDiscretionaryPeriodTimer];
  objc_sync_exit(v4);
}

- (void)applicationWasSuspended:(id)a3 pid:(int)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v4 invokeSelectorForAllObservers:"applicationWasSuspended:pid:" pid:*(void *)&a4];
}

- (void)applicationBackgroundUpdatesTurnedOn:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v3 invokeSelectorForAllObservers:"backgroundUpdatesEnabledForApplication:"];
}

- (void)applicationBackgroundUpdatesTurnedOff:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v3 invokeSelectorForAllObservers:"backgroundUpdatesDisabledForApplication:"];
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v3 invokeSelectorForAllObservers:"applicationWasQuitFromAppSwitcher:"];
}

- (void)startTransitionalDiscretionaryPeriodTimer
{
  [(NDApplication *)self setIsInTransitionalDiscretionaryPeriod:1];
  [(NDSpringBoardApplication *)self setupTransitionalDiscretionaryPeriodTimer];
  transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
  dispatch_time_t v4 = dispatch_time(0, 64800000000000);

  dispatch_source_set_timer(transitionalDiscretionaryStateTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)setupTransitionalDiscretionaryPeriodTimer
{
  if (!self->_transitionalDiscretionaryStateTimer)
  {
    objc_super v3 = dispatch_get_global_queue(0, 0);
    dispatch_time_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
    self->_transitionalDiscretionaryStateTimer = v4;

    dispatch_source_set_timer((dispatch_source_t)self->_transitionalDiscretionaryStateTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    int v6 = self->_transitionalDiscretionaryStateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004913C;
    handler[3] = &unk_1000B6380;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->_transitionalDiscretionaryStateTimer);
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v10.receiver = v5;
  v10.super_class = (Class)NDSpringBoardApplication;
  [(NDApplication *)&v10 removeObserver:v4];
  if (![(NSMutableArray *)v5->super._observers count])
  {
    int v6 = +[NDSpringBoard sharedSpringBoard];
    [v6 removeObserver:v5 forApplication:v5->super._bundleIdentifier];

    id v7 = +[NDSpringBoard sharedSpringBoard];
    [v7 stopMonitoringBundleID:v5->super._bundleIdentifier];

    transitionalDiscretionaryStateTimer = v5->_transitionalDiscretionaryStateTimer;
    if (transitionalDiscretionaryStateTimer)
    {
      dispatch_source_cancel(transitionalDiscretionaryStateTimer);
      objc_super v9 = v5->_transitionalDiscretionaryStateTimer;
      v5->_transitionalDiscretionaryStateTimer = 0;
    }
  }
  objc_sync_exit(v5);
}

- (BOOL)backgroundUpdatesEnabled
{
  objc_super v3 = +[NDSpringBoard sharedSpringBoard];
  LOBYTE(self) = [v3 applicationBackgroundUpdatesEnabled:self->super._bundleIdentifier];

  return (char)self;
}

- (BOOL)hasBackgroundTaskCompletion
{
  objc_super v3 = +[NDSpringBoard sharedSpringBoard];
  LOBYTE(self) = [v3 applicationHasBackgroundTaskCompletion:self->super._bundleIdentifier];

  return (char)self;
}

- (BOOL)isForeground
{
  objc_super v3 = +[NDSpringBoard sharedSpringBoard];
  LOBYTE(self) = [v3 applicationIsForeground:self->super._bundleIdentifier];

  return (char)self;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = +[NDSpringBoardApplication requestDelayQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049550;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(v9, block);

  objc_super v10 = +[NDSpringBoard sharedSpringBoard];
  LOBYTE(self) = [v10 wakeUpApp:self->super._bundleIdentifier forSession:v7 withSessionUUID:v8];

  return (char)self;
}

- (void)setupDelayTimer
{
  if (!self->_delayTimer)
  {
    objc_super v3 = +[NDSpringBoardApplication requestDelayQueue];
    id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v4;

    int v6 = self->_delayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000497B8;
    handler[3] = &unk_1000B6380;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
  }
}

- (BOOL)supportsWakes
{
  return 1;
}

- (BOOL)usesContainerManagerForAVAsset
{
  return 1;
}

- (NDSpringBoardApplication)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NDSpringBoardApplication;
  objc_super v5 = [(NDApplication *)&v13 initWithIdentifier:v4];
  if (v5)
  {
    id v6 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v5->super._bundleIdentifier error:0];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 containingBundleRecord];
      objc_super v9 = [v8 bundleIdentifier];

      if (v9)
      {
        uint64_t v10 = +[NDApplication springboardApplicationWithBundleIdentifier:v9];
        containingApplication = v5->_containingApplication;
        v5->_containingApplication = (NDSpringBoardApplication *)v10;
      }
    }
  }
  return v5;
}

@end