@interface NDChronoKitExtension
+ (id)requestDelayQueue;
- (BOOL)backgroundUpdatesEnabled;
- (BOOL)canBeSuspended;
- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4;
- (BOOL)shouldElevateDiscretionaryPriority;
- (BOOL)supportsWakes;
- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5;
- (id)containerURL;
- (void)_onqueue_resetRequestDelay;
- (void)addObserver:(id)a3;
- (void)extensionWasRemovedFromScreen:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setupDelayTimer;
@end

@implementation NDChronoKitExtension

- (void).cxx_destruct
{
}

- (void)extensionWasRemovedFromScreen:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NDChronoKitExtension;
  [(NDApplication *)&v3 invokeSelectorForAllObservers:"applicationWasQuitFromAppSwitcher:"];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)NDChronoKitExtension;
  [(NDApplication *)&v8 removeObserver:v4];
  if (![(NSMutableArray *)v5->super._observers count])
  {
    v6 = +[NDChronoKitLauncher sharedLauncher];
    [v6 removeObserver:v5 forExtension:v5->super._bundleIdentifier];

    v7 = +[NDChronoKitLauncher sharedLauncher];
    [v7 stopMonitoringBundleID:v5->super._bundleIdentifier];
  }
  objc_sync_exit(v5);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(NSMutableArray *)v5->super._observers count])
  {
    v6 = +[NDChronoKitLauncher sharedLauncher];
    [v6 startMonitoringBundleID:v5->super._bundleIdentifier];

    v7 = +[NDChronoKitLauncher sharedLauncher];
    [v7 addObserver:v5 forExtension:v5->super._bundleIdentifier];

    if (![(NDChronoKitExtension *)v5 isHandlingBackgroundURLSessionWithIdentifier:0 withSessionUUID:0])
    {
      objc_super v8 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = v5->super._bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v14 = bundleIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting request delay and clearing pending wake requests for %@ since the first observer is being added", buf, 0xCu);
      }
      v10 = +[NDChronoKitExtension requestDelayQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004A4AC;
      block[3] = &unk_1000B6380;
      block[4] = v5;
      dispatch_async(v10, block);
    }
  }
  v11.receiver = v5;
  v11.super_class = (Class)NDChronoKitExtension;
  [(NDApplication *)&v11 addObserver:v4];
  objc_sync_exit(v5);
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = +[NDChronoKitLauncher sharedLauncher];
  LOBYTE(self) = [v8 extension:self->super._bundleIdentifier isHandlingBackgroundSessionWithIdentifier:v6 withSessionUUID:v7];

  return (char)self;
}

- (BOOL)backgroundUpdatesEnabled
{
  return 1;
}

- (BOOL)canBeSuspended
{
  return 1;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 1;
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[NDChronoKitExtension requestDelayQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A678;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(v10, block);

  objc_super v11 = +[NDChronoKitLauncher sharedLauncher];
  LOBYTE(a5) = [v11 wakeUpExtension:self->super._bundleIdentifier forSession:v8 withSessionUUID:v9 wakeRequirement:a5];

  return a5;
}

- (BOOL)supportsWakes
{
  return 1;
}

- (id)containerURL
{
  id v2 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:self->super._bundleIdentifier error:0];
  objc_super v3 = [v2 dataContainerURL];

  return v3;
}

- (void)_onqueue_resetRequestDelay
{
  v4.receiver = self;
  v4.super_class = (Class)NDChronoKitExtension;
  [(NDApplication *)&v4 _onqueue_resetRequestDelay];
  delayTimer = self->_delayTimer;
  if (delayTimer) {
    dispatch_source_set_timer(delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)setupDelayTimer
{
  if (!self->_delayTimer)
  {
    objc_super v3 = +[NDChronoKitExtension requestDelayQueue];
    objc_super v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v4;

    id v6 = self->_delayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004A9BC;
    handler[3] = &unk_1000B6380;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
  }
}

+ (id)requestDelayQueue
{
  if (qword_1000CB0F0 != -1) {
    dispatch_once(&qword_1000CB0F0, &stru_1000B5988);
  }
  id v2 = (void *)qword_1000CB0E8;

  return v2;
}

@end