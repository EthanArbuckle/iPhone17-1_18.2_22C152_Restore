@interface NDApplication
+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3;
+ (NDApplication)applicationWithIdentifier:(id)a3;
+ (id)chronoKitExtensionWithIdentifier:(id)a3;
+ (id)cloudContainerWithIdentifier:(id)a3;
+ (id)fileProviderWithIdentifer:(id)a3 applicationIdentifier:(id)a4;
+ (id)springboardApplicationWithBundleIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)backgroundUpdatesEnabled;
- (BOOL)canBeSuspended;
- (BOOL)hasBackgroundTaskCompletion;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4;
- (BOOL)isInTransitionalDiscretionaryPeriod;
- (BOOL)maySupportWakesLater;
- (BOOL)shouldElevateDiscretionaryPriority;
- (BOOL)supportsWakes;
- (BOOL)usesContainerManagerForAVAsset;
- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5;
- (NDApplication)initWithIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (double)currentRequestDelay;
- (id)containerURL;
- (void)_onqueue_resetRequestDelay;
- (void)addObserver:(id)a3;
- (void)invokeSelectorForAllObservers:(SEL)a3;
- (void)invokeSelectorForAllObservers:(SEL)a3 pid:(int)a4;
- (void)removeObserver:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCurrentRequestDelay:(double)a3;
- (void)setIsInTransitionalDiscretionaryPeriod:(BOOL)a3;
@end

@implementation NDApplication

- (void)setCurrentRequestDelay:(double)a3
{
  self->_currentRequestDelay = a3;
}

- (void)invokeSelectorForAllObservers:(SEL)a3
{
  v5 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007528;
  v6[3] = &unk_1000B6420;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)addObserver:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_observers addObject:v4];

  objc_sync_exit(obj);
}

+ (id)springboardApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = [(id)qword_1000CB0C0 objectForKeyedSubscript:v3];

  if (!v5)
  {
    v6 = [[NDSpringBoardApplication alloc] initWithIdentifier:v3];
    [(id)qword_1000CB0C0 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_1000CB0C0 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

- (void)setIsInTransitionalDiscretionaryPeriod:(BOOL)a3
{
  self->isInTransitionalDiscretionaryPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (double)currentRequestDelay
{
  return self->_currentRequestDelay;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isInTransitionalDiscretionaryPeriod
{
  return self->isInTransitionalDiscretionaryPeriod;
}

- (void)_onqueue_resetRequestDelay
{
  id v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v5 = 138412290;
    v6 = bundleIdentifier;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Resetting request delay for %@", (uint8_t *)&v5, 0xCu);
  }
  [(NDApplication *)self setCurrentRequestDelay:0.0];
}

- (BOOL)backgroundUpdatesEnabled
{
  return 1;
}

- (void)invokeSelectorForAllObservers:(SEL)a3 pid:(int)a4
{
  v7 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004818C;
  block[3] = &unk_1000B5948;
  block[4] = self;
  block[5] = a3;
  int v9 = a4;
  dispatch_async(v7, block);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableArray *)v4->_observers indexOfObject:v6];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)v4->_observers removeObjectAtIndex:v5];
  }
  objc_sync_exit(v4);
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  return 0;
}

- (BOOL)hasBackgroundTaskCompletion
{
  return 0;
}

- (BOOL)canBeSuspended
{
  return 0;
}

- (BOOL)isForeground
{
  return 0;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 0;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 0;
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v6 = a3;
  v7 = self->_bundleIdentifier;
  v8 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10004852C;
  v16 = &unk_1000B63D0;
  int v9 = v7;
  v17 = v9;
  id v10 = v6;
  id v18 = v10;
  [v8 performWake:&v13 uponNotification:self->_bundleIdentifier sessionIdentifier:v10];

  v11 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  [v11 launchProcessWithIdentifier:v9 sessionIdentifier:v10];

  return 1;
}

- (BOOL)maySupportWakesLater
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (BOOL)supportsWakes
{
  id v3 = +[NDUserEventAgentConnection sharedUserEventAgentConnection];
  LOBYTE(self) = [v3 canLaunchProcessWithIdentifier:self->_bundleIdentifier];

  return (char)self;
}

- (BOOL)usesContainerManagerForAVAsset
{
  return 1;
}

- (id)containerURL
{
  return 0;
}

- (NDApplication)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NDApplication;
  id v6 = [(NDApplication *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = +[NSMutableArray array];
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;

    v7->isInTransitionalDiscretionaryPeriod = 0;
  }

  return v7;
}

+ (id)fileProviderWithIdentifer:(id)a3 applicationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_class();
  objc_sync_enter(v7);
  uint64_t v8 = [(id)qword_1000CB0B8 objectForKeyedSubscript:v5];

  if (!v8)
  {
    int v9 = [[NDFPProvider alloc] initWithIdentifier:v5 applicationIdentifier:v6];
    [(id)qword_1000CB0B8 setObject:v9 forKeyedSubscript:v5];
  }
  id v10 = [(id)qword_1000CB0B8 objectForKeyedSubscript:v5];
  objc_sync_exit(v7);

  return v10;
}

+ (id)cloudContainerWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  id v5 = [(id)qword_1000CB0B8 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [[NDCloudContainer alloc] initWithIdentifier:v3];
    [(id)qword_1000CB0B8 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_1000CB0B8 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

+ (id)chronoKitExtensionWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  id v5 = [(id)qword_1000CB0C8 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [(NDApplication *)[NDChronoKitExtension alloc] initWithIdentifier:v3];
    [(id)qword_1000CB0C8 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_1000CB0C8 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NDSpringBoard sharedSpringBoard];
  unsigned __int8 v5 = [v4 identifierIsForSpringBoardApplication:v3];

  return v5;
}

+ (NDApplication)applicationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  unsigned __int8 v5 = [(id)qword_1000CB0B8 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:v3];
    [(id)qword_1000CB0B8 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_1000CB0B8 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return (NDApplication *)v7;
}

+ (void)initialize
{
  if (qword_1000CB0D0 != -1) {
    dispatch_once(&qword_1000CB0D0, &stru_1000B5920);
  }
}

@end