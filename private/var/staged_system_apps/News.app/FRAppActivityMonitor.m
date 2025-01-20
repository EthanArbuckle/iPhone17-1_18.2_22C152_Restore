@interface FRAppActivityMonitor
+ (id)recordedExposureDateForObserver:(id)a3;
+ (void)recordExposureEventForObserver:(id)a3;
+ (void)saveViewAppearanceDateForObserver:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasBeenNotifiedOfApplicationLaunch;
- (BOOL)isActive;
- (BOOL)isWindowForeground;
- (FCCloudContext)cloudContext;
- (FRAnalyticsController)analyticsController;
- (FRAnalyticsReferral)appSessionStartReferral;
- (FRAppActivityMonitor)initWithAnalyticsController:(id)a3 appActivityMonitor:(id)a4 cloudContext:(id)a5 window:(id)a6;
- (FRAppActivityObserving)appSessionCloseObserver;
- (FRURLAnalyticsReferralFactory)analyticsReferralFactory;
- (NSHashTable)observers;
- (unint64_t)activationCount;
- (void)_checkForNeedToResetIdentifier;
- (void)_closeAppSessionForReason:(int64_t)a3 startNewSession:(BOOL)a4 resetUserID:(BOOL)a5 forSceneID:(id)a6;
- (void)activityObservingApplicationDidBecomeActiveWithURL:(id)a3 sourceApplication:(id)a4 sceneID:(id)a5;
- (void)activityObservingApplicationDidEnterBackgroundWithSceneID:(id)a3;
- (void)activityObservingApplicationDidFinishLaunching;
- (void)activityObservingApplicationWillEnterForeground;
- (void)activityObservingApplicationWillResignActiveWithSceneID:(id)a3;
- (void)activityObservingApplicationWindowDidBecomeBackground;
- (void)activityObservingApplicationWindowDidBecomeForeground;
- (void)addAppSessionCloseObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)applicationWillFinishLaunching;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)dealloc;
- (void)readingHistoryDidClear:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAnalyticsController:(id)a3;
- (void)setAnalyticsReferralFactory:(id)a3;
- (void)setAppSessionCloseObserver:(id)a3;
- (void)setAppSessionStartReferral:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setHasBeenNotifiedOfApplicationLaunch:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setWindowIsForeground:(BOOL)a3;
@end

@implementation FRAppActivityMonitor

- (void)activityObservingApplicationWillEnterForeground
{
  if (![(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075DC0();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(FRAppActivityMonitor *)self observers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWillEnterForeground];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_checkForNeedToResetIdentifier
{
  v3 = +[UIApplication sharedApplication];
  id v4 = [v3 key_window];
  id v5 = [v4 windowScene];
  id v6 = [v5 session];
  id v9 = [v6 persistentIdentifier];

  uint64_t v7 = +[NSUserDefaults standardUserDefaults];
  LODWORD(v5) = [v7 BOOLForKey:@"reset_identifier"];

  if (v5)
  {
    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setBool:0 forKey:@"reset_identifier"];

    [(FRAppActivityMonitor *)self _closeAppSessionForReason:4 startNewSession:1 resetUserID:1 forSceneID:v9];
  }
}

- (void)activityObservingApplicationDidBecomeActiveWithURL:(id)a3 sourceApplication:(id)a4 sceneID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075C50();
  }
  [(FRAppActivityMonitor *)self setIsActive:1];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000F9F8;
  v32[3] = &unk_1000C7990;
  v32[4] = self;
  long long v11 = objc_retainBlock(v32);
  if (v8)
  {
    long long v12 = [(FRAppActivityMonitor *)self analyticsReferralFactory];
    long long v13 = [v12 analyticsReferralForURL:v8 sourceApplication:v9];
    [(FRAppActivityMonitor *)self setAppSessionStartReferral:v13];
  }
  v27 = v9;
  [(FRAppActivityMonitor *)self _checkForNeedToResetIdentifier];
  v14 = [(FRAppActivityMonitor *)self analyticsController];
  v15 = [(FRAppActivityMonitor *)self appSessionStartReferral];
  [v14 startSessionIfNeededWithReferral:v15 sceneID:v10];

  [(FRAppActivityMonitor *)self setAppSessionStartReferral:0];
  v16 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
    [v18 activityObservingApplicationDidBecomeActive];
  }
  v19 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
  ((void (*)(void *, void *))v11[2])(v11, v19);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v20 = [(FRAppActivityMonitor *)self observers];
  id v21 = [v20 copy];

  id v22 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v25);
        if (objc_opt_respondsToSelector()) {
          [v26 activityObservingApplicationDidBecomeActive];
        }
        ((void (*)(void *, void *))v11[2])(v11, v26);
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }
}

- (FRAppActivityObserving)appSessionCloseObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appSessionCloseObserver);

  return (FRAppActivityObserving *)WeakRetained;
}

- (FRAppActivityMonitor)initWithAnalyticsController:(id)a3 appActivityMonitor:(id)a4 cloudContext:(id)a5 window:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)FRAppActivityMonitor;
  v15 = [(FRAppActivityMonitor *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_analyticsController, a3);
    [v12 addObserver:v16];
    objc_storeStrong((id *)&v16->_cloudContext, a5);
    uint64_t v17 = +[NSHashTable hashTableWithOptions:517];
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v16 selector:"applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v16 selector:"applicationWillTerminate:" name:UIApplicationWillTerminateNotification object:0];

    id v21 = [(FRAppActivityMonitor *)v16 cloudContext];
    id v22 = [v21 readingHistory];
    [v22 addObserver:v16];

    id v23 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:0 action:0];
    [v23 setMinimumPressDuration:0.001];
    [v23 setDelegate:v16];
    [v14 addGestureRecognizer:v23];
  }
  return v16;
}

- (void)activityObservingApplicationDidFinishLaunching
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(FRAppActivityMonitor *)self observers];
  id v3 = [v2 copy];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 activityObservingApplicationDidFinishLaunching];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  +[NSThread isMainThread];
  if (![(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075E78();
  }
  [(FRAppActivityMonitor *)self setWindowIsForeground:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(FRAppActivityMonitor *)self observers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWindowDidBecomeForeground];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setWindowIsForeground:(BOOL)a3
{
  self->windowIsForeground = a3;
}

- (BOOL)hasBeenNotifiedOfApplicationLaunch
{
  return self->_hasBeenNotifiedOfApplicationLaunch;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  if (v4)
  {
    id v5 = [(FRAppActivityMonitor *)self observers];
    unsigned int v6 = [v5 containsObject:v4];

    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000758A4((uint64_t)v4);
    }
    uint64_t v7 = [(FRAppActivityMonitor *)self observers];
    [v7 addObject:v4];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000757E0();
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void)setHasBeenNotifiedOfApplicationLaunch:(BOOL)a3
{
  self->_hasBeenNotifiedOfApplicationLaunch = a3;
}

- (void)setAppSessionStartReferral:(id)a3
{
}

- (void)setAnalyticsReferralFactory:(id)a3
{
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)applicationWillFinishLaunching
{
  if ([(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075AE0();
  }
  [(FRAppActivityMonitor *)self setHasBeenNotifiedOfApplicationLaunch:1];
}

- (FRAnalyticsReferral)appSessionStartReferral
{
  return self->_appSessionStartReferral;
}

- (FRAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  if (v4)
  {
    id v5 = [(FRAppActivityMonitor *)self appSessionCloseObserver];

    if (v5 == v4)
    {
      [(FRAppActivityMonitor *)self setAppSessionCloseObserver:0];
    }
    else
    {
      unsigned int v6 = [(FRAppActivityMonitor *)self observers];
      unsigned int v7 = [v6 containsObject:v4];

      if (v7)
      {
        id v8 = [(FRAppActivityMonitor *)self observers];
        [v8 removeObject:v4];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075964();
  }
}

- (void)addAppSessionCloseObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(FRAppActivityMonitor *)self appSessionCloseObserver];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100075A28();
    }
  }
  else
  {
    [(FRAppActivityMonitor *)self setAppSessionCloseObserver:v4];
  }
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(FRAppActivityMonitor *)self cloudContext];
  id v5 = [v4 readingHistory];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)FRAppActivityMonitor;
  [(FRAppActivityMonitor *)&v6 dealloc];
}

+ (void)saveViewAppearanceDateForObserver:(id)a3
{
  id object = a3;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_getAssociatedObject(object, "FRViewAppearanceDate");
    if (!v3)
    {
      if (objc_opt_respondsToSelector()) {
        [object startRecordingExposure];
      }
      id v4 = +[NSDate date];
      objc_setAssociatedObject(object, "FRViewAppearanceDate", v4, (void *)0x301);
    }
  }

  _objc_release_x2();
}

+ (void)recordExposureEventForObserver:(id)a3
{
  id object = a3;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_getAssociatedObject(object, "FRViewAppearanceDate");
    if (v3)
    {
      [object recordExposureEventWithStartDate:v3];
      objc_setAssociatedObject(object, "FRViewAppearanceDate", 0, (void *)0x301);
    }
  }
}

+ (id)recordedExposureDateForObserver:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_getAssociatedObject(v3, "FRViewAppearanceDate"), (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = +[NSDate date];
  }

  return v4;
}

- (void)applicationWillResignActive:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(FRAppActivityMonitor *)self observers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWillResignActive];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)applicationWillTerminate:(id)a3
{
  if (![(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075B98();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(FRAppActivityMonitor *)self observers];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 activityObservingApplicationWillTerminate];
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 key_window];
  id v6 = [v5 windowScene];
  id v7 = [v6 session];
  id v8 = [v7 persistentIdentifier];

  [(FRAppActivityMonitor *)self _closeAppSessionForReason:1 startNewSession:1 resetUserID:1 forSceneID:v8];
}

- (void)_closeAppSessionForReason:(int64_t)a3 startNewSession:(BOOL)a4 resetUserID:(BOOL)a5 forSceneID:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  +[NSThread isMainThread];
  id v11 = [(FRAppActivityMonitor *)self analyticsController];
  [v11 endSessionForReason:a3 byStartingNewSession:v7 resetUserID:v6 forSceneID:v10];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(FRAppActivityMonitor *)self observers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingUserDidPerformAction];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return 0;
}

- (void)activityObservingApplicationWillResignActiveWithSceneID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(FRAppActivityMonitor *)self observers];
  id v6 = [v5 copy];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 activityObservingApplicationWillResignActive];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  long long v12 = [(FRAppActivityMonitor *)self analyticsController];
  [v12 resignSessionForSceneID:v4];
}

- (void)activityObservingApplicationDidEnterBackgroundWithSceneID:(id)a3
{
  id v4 = a3;
  if (![(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075D08();
  }
  if ([(FRAppActivityMonitor *)self isActive])
  {
    id v19 = v4;
    [(FRAppActivityMonitor *)self setIsActive:0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003E884;
    v24[3] = &unk_1000C7990;
    v24[4] = self;
    id v5 = objc_retainBlock(v24);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = [(FRAppActivityMonitor *)self observers];
    id v7 = [v6 copy];

    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        long long v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
          if (objc_opt_respondsToSelector()) {
            [v12 activityObservingApplicationDidEnterBackground];
          }
          ((void (*)(void *, void *))v5[2])(v5, v12);
          long long v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
    if (v13)
    {
      long long v14 = (void *)v13;
      long long v15 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
        [v17 activityObservingApplicationDidEnterBackground];
      }
    }
    v18 = [(FRAppActivityMonitor *)self appSessionCloseObserver];
    ((void (*)(void *, void *))v5[2])(v5, v18);

    id v4 = v19;
    [(FRAppActivityMonitor *)self _closeAppSessionForReason:2 startNewSession:0 resetUserID:0 forSceneID:v19];
  }
}

- (void)activityObservingApplicationWindowDidBecomeBackground
{
  +[NSThread isMainThread];
  if (![(FRAppActivityMonitor *)self hasBeenNotifiedOfApplicationLaunch]
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100075F30();
  }
  [(FRAppActivityMonitor *)self setWindowIsForeground:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(FRAppActivityMonitor *)self observers];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 activityObservingApplicationWindowDidBecomeBackground];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)isWindowForeground
{
  return self->windowIsForeground;
}

- (void)setAppSessionCloseObserver:(id)a3
{
}

- (unint64_t)activationCount
{
  return self->_activationCount;
}

- (void)setAnalyticsController:(id)a3
{
}

- (FRURLAnalyticsReferralFactory)analyticsReferralFactory
{
  return self->_analyticsReferralFactory;
}

- (void)setCloudContext:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_analyticsReferralFactory, 0);
  objc_storeStrong((id *)&self->_appSessionStartReferral, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);

  objc_destroyWeak((id *)&self->_appSessionCloseObserver);
}

@end