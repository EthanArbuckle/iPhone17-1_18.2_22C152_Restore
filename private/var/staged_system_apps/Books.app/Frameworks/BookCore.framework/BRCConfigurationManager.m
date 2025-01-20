@interface BRCConfigurationManager
+ (BRCConfigurationManager)sharedInstance;
+ (id)getInstance;
- (BOOL)alwaysNotifyOnSubscribe;
- (BOOL)cacheLoaded;
- (BOOL)configurationLoaded;
- (BOOL)monitoringEnabled;
- (BOOL)refreshOnRegister;
- (BOOL)waitForCachedConfigurationLoaded:(double)a3;
- (BRCConfigurationManager)init;
- (JSValue)monitorCallback;
- (NSCondition)cacheLoadedCondition;
- (NSMutableArray)jsSubscribers;
- (NSMutableDictionary)data;
- (NSString)userID;
- (OS_dispatch_queue)updateQueue;
- (OS_dispatch_queue)workerQueue;
- (RCConfigurationManager)remoteConfigurationManager;
- (id)_cacheURLFromNamespace:(id)a3;
- (id)_namespaceNamed:(id)a3;
- (id)_readFromCacheForNamespace:(id)a3;
- (id)_valueForKey:(id)a3 fromNamespaceData:(id)a4 source:(unint64_t)a5;
- (id)allLogicalValuesFromNamespace:(id)a3 allowsOnlyDefaultSource:(BOOL)a4;
- (id)jsBridge;
- (id)namespaceInfo;
- (id)rawValueForKey:(id)a3 fromNamespace:(id)a4;
- (id)subscribeToKeys:(id)a3 inNamespace:(id)a4 callback:(id)a5;
- (id)valueForKey:(id)a3 fromNamespace:(id)a4;
- (id)valueForKey:(id)a3 fromNamespace:(id)a4 source:(unint64_t)a5;
- (void)_clearSubscribers;
- (void)_executeMonitorWithMessage:(id)a3 data:(id)a4;
- (void)_saveToCacheNamespaceData:(id)a3 withNamespace:(id)a4;
- (void)_updateNamespace:(id)a3 systemDefaults:(id)a4 configuration:(id)a5 treatmentIDs:(id)a6 segmentIDs:(id)a7 segmentSetIDs:(id)a8 reason:(int64_t)a9;
- (void)addObserver:(id)a3;
- (void)clearNamespace:(id)a3;
- (void)dealloc;
- (void)disableMonitoring;
- (void)dump:(id)a3;
- (void)enableMonitoring:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshNamespace:(id)a3;
- (void)registerNamespace:(id)a3 withDefaults:(id)a4 forBundleID:(id)a5;
- (void)removeObserver:(id)a3;
- (void)resetForJavascript;
- (void)setAlwaysNotifyOnSubscribe:(BOOL)a3;
- (void)setCacheLoaded:(BOOL)a3;
- (void)setCacheLoadedCondition:(id)a3;
- (void)setData:(id)a3;
- (void)setJsBridge:(id)a3;
- (void)setJsSubscribers:(id)a3;
- (void)setMonitorCallback:(id)a3;
- (void)setRefreshOnRegister:(BOOL)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setUserID:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4 forNamespace:(id)a5;
- (void)setValue:(id)a3 forKey:(id)a4 inNamespace:(id)a5 source:(unint64_t)a6;
- (void)setWorkerQueue:(id)a3;
- (void)subscribe:(id)a3 toKeys:(id)a4 inNamespace:(id)a5 callback:(id)a6;
- (void)unsubscribe:(id)a3;
@end

@implementation BRCConfigurationManager

+ (BRCConfigurationManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13374C;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_3492D0 != -1) {
    dispatch_once(&qword_3492D0, block);
  }
  v2 = (void *)qword_3492D8;

  return (BRCConfigurationManager *)v2;
}

- (BRCConfigurationManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)BRCConfigurationManager;
  v2 = [(BRCConfigurationManager *)&v25 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSHashTable hashTableWithWeakObjects];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    data = v3->_data;
    v3->_data = v6;

    uint64_t v8 = dispatch_get_global_queue(25, 0);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.booksremoteconfig", v10);
    updateQueue = v3->_updateQueue;
    v3->_updateQueue = (OS_dispatch_queue *)v11;

    *(_WORD *)&v3->_refreshOnRegister = 1;
    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    jsSubscribers = v3->_jsSubscribers;
    v3->_jsSubscribers = v13;

    v15 = +[UIApplication applicationConfigurationDirectory];
    v16 = +[NSURL fileURLWithPath:v15];

    v17 = (RCConfigurationManager *)[objc_alloc((Class)RCConfigurationManager) initWithContentDirectoryURL:v16];
    remoteConfigurationManager = v3->_remoteConfigurationManager;
    v3->_remoteConfigurationManager = v17;

    v3->_configurationLoaded = 0;
    v3->_cacheLoaded = 0;
    v19 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    cacheLoadedCondition = v3->_cacheLoadedCondition;
    v3->_cacheLoadedCondition = v19;

    id v21 = objc_alloc((Class)NSUserDefaults);
    v22 = (NSUserDefaults *)[v21 initWithSuiteName:BUBooksGroupContainerIdentifier];
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = v22;

    [(NSUserDefaults *)v3->_userDefaults addObserver:v3 forKeyPath:@"BRCIgnoreCache" options:1 context:off_342070];
    [(NSUserDefaults *)v3->_userDefaults addObserver:v3 forKeyPath:@"BRCDisableABTesting" options:1 context:off_342070];
    [(NSUserDefaults *)v3->_userDefaults addObserver:v3 forKeyPath:@"BRCOverrideSegmentIDs" options:1 context:off_342070];
    [(NSUserDefaults *)v3->_userDefaults addObserver:v3 forKeyPath:@"BRCAdditionalSegmentIDs" options:1 context:off_342070];
    [(NSUserDefaults *)v3->_userDefaults addObserver:v3 forKeyPath:@"BRCServerEnv" options:1 context:off_342070];
    [(NSUserDefaults *)v3->_userDefaults addObserver:v3 forKeyPath:@"BRCConfigSource" options:1 context:off_342070];
  }
  return v3;
}

- (void)dealloc
{
  [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"BRCIgnoreCache"];
  [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"BRCDisableABTesting"];
  [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"BRCOverrideSegmentIDs"];
  [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"BRCAdditionalSegmentIDs"];
  [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"BRCServerEnv"];
  [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"BRCConfigSource"];
  v3.receiver = self;
  v3.super_class = (Class)BRCConfigurationManager;
  [(BRCConfigurationManager *)&v3 dealloc];
}

- (BOOL)monitoringEnabled
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BRCEnableMonitoring"];
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  v5 = self->_userID;
  v6 = (NSString *)[a3 copy];
  userID = self->_userID;
  self->_userID = v6;

  if ([(NSString *)self->_userID length]
    && ![(NSString *)self->_userID isEqualToString:v5])
  {
    uint64_t v8 = [(BRCConfigurationManager *)self data];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_133BAC;
    v9[3] = &unk_2C9A58;
    v9[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

- (void)addObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)registerNamespace:(id)a3 withDefaults:(id)a4 forBundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = [(BRCConfigurationManager *)self _namespaceNamed:v8];
  [v11 setBundleID:v10];

  v12 = [(BRCConfigurationManager *)self workerQueue];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_133E00;
  v19 = &unk_2C7E88;
  v20 = self;
  id v13 = v8;
  id v21 = v13;
  id v22 = v11;
  id v23 = v9;
  id v14 = v9;
  id v15 = v11;
  dispatch_sync(v12, &v16);

  if ([(BRCConfigurationManager *)self refreshOnRegister]) {
    [(BRCConfigurationManager *)self refreshNamespace:v13];
  }
}

- (id)valueForKey:(id)a3 fromNamespace:(id)a4
{
  return [(BRCConfigurationManager *)self valueForKey:a3 fromNamespace:a4 source:0];
}

- (id)valueForKey:(id)a3 fromNamespace:(id)a4 source:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BRCConfigurationManager *)self data];
  dispatch_queue_t v11 = [v10 objectForKey:v9];

  if (v11)
  {
    v12 = [(BRCConfigurationManager *)self _valueForKey:v8 fromNamespaceData:v11 source:a5];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)subscribe:(id)a3 toKeys:(id)a4 inNamespace:(id)a5 callback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [(BRCConfigurationManager *)self updateQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_134354;
  v19[3] = &unk_2C9A80;
  objc_copyWeak(&v24, &location);
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)refreshNamespace:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCConfigurationManager *)self userID];

  if (v5)
  {
    CFStringRef v14 = @"namespace";
    id v15 = v4;
    v6 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [(BRCConfigurationManager *)self _executeMonitorWithMessage:@"refresh requested" data:v6];

    v7 = [(BRCConfigurationManager *)self data];
    id v8 = [v7 objectForKey:v4];

    id v9 = [(BRCConfigurationManager *)self userID];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_134674;
    v11[3] = &unk_2C9AD0;
    v11[4] = self;
    id v12 = v4;
    id v13 = v8;
    id v10 = v8;
    [v10 settingsWithUserID:v9 completion:v11];
  }
}

- (void)resetForJavascript
{
  objc_initWeak(&location, self);
  objc_super v3 = [(BRCConfigurationManager *)self updateQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_134CE0;
  v4[3] = &unk_2C4F08;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)namespaceInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(BRCConfigurationManager *)self data];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_134E08;
  v7[3] = &unk_2C9A58;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (id)allLogicalValuesFromNamespace:(id)a3 allowsOnlyDefaultSource:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(BRCConfigurationManager *)self data];
  id v8 = [v7 objectForKey:v6];

  id v9 = [v8 systemDefaults];
  id v10 = [v9 copy];

  id v11 = [v8 configuration];
  id v12 = [v11 copy];

  if ([v12 count])
  {
    id v13 = +[NSMutableDictionary dictionaryWithDictionary:v10];
    [v13 addEntriesFromDictionary:v12];
    id v14 = [v13 copy];
  }
  else if (v4)
  {
    id v14 = v10;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)waitForCachedConfigurationLoaded:(double)a3
{
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
  id v6 = [(BRCConfigurationManager *)self cacheLoadedCondition];
  [v6 lock];

  if (![(BRCConfigurationManager *)self cacheLoaded])
  {
    v7 = BRCConfigLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134217984;
      double v22 = a3;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_DEFAULT, "waitForCachedConfigurationLoaded: Waiting for cacheLoaded. timeout: %f", (uint8_t *)&v21, 0xCu);
    }
  }
  if (![(BRCConfigurationManager *)self cacheLoaded])
  {
    do
    {
      id v8 = [(BRCConfigurationManager *)self cacheLoadedCondition];
      unsigned __int8 v9 = [v8 waitUntilDate:v5];
    }
    while (![(BRCConfigurationManager *)self cacheLoaded] && (v9 & 1) != 0);
  }
  BOOL v10 = [(BRCConfigurationManager *)self cacheLoaded];
  if (!v10)
  {
    id v11 = BRCConfigLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1EE52C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v19 = [(BRCConfigurationManager *)self cacheLoadedCondition];
  [v19 unlock];

  return v10;
}

- (void)setValue:(id)a3 forKey:(id)a4 forNamespace:(id)a5
{
  id v16 = a5;
  self->_configurationLoaded = 1;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(BRCConfigurationManager *)self data];
  id v11 = [v10 objectForKeyedSubscript:v16];

  if (!v11)
  {
    id v11 = objc_alloc_init(BRCNamespaceData);
    [(BRCNamespaceData *)v11 setNamespaceIdentifier:v16];
    uint64_t v12 = [(BRCConfigurationManager *)self data];
    [v12 setObject:v11 forKeyedSubscript:v16];
  }
  uint64_t v13 = [(BRCNamespaceData *)v11 configuration];
  id v14 = [v13 mutableCopy];

  [v14 setObject:v9 forKeyedSubscript:v8];
  id v15 = [v14 copy];
  [(BRCNamespaceData *)v11 setConfiguration:v15];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_342070 == a6)
  {
    v7 = [(BRCConfigurationManager *)self data];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1354A0;
    v13[3] = &unk_2C9A58;
    v13[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];

    id v8 = BRCConfigLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"BRCOverrideSegmentIDs"];
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "RemoteConfigInfo: Override SegmentIDs = %@", buf, 0xCu);
    }
    BOOL v10 = BRCConfigLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"BRCAdditionalSegmentIDs"];
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_INFO, "RemoteConfigInfo: Additional SegmentIDs = %@", buf, 0xCu);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BRCConfigurationManager;
    -[BRCConfigurationManager observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_updateNamespace:(id)a3 systemDefaults:(id)a4 configuration:(id)a5 treatmentIDs:(id)a6 segmentIDs:(id)a7 segmentSetIDs:(id)a8 reason:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  objc_initWeak(&location, self);
  int v21 = [(BRCConfigurationManager *)self updateQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1356B8;
  v28[3] = &unk_2C9AF8;
  objc_copyWeak(v36, &location);
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v19;
  id v33 = v20;
  id v34 = v18;
  v35 = self;
  v36[1] = (id)a9;
  id v22 = v18;
  id v23 = v20;
  id v24 = v19;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  dispatch_async(v21, v28);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
}

- (id)_valueForKey:(id)a3 fromNamespaceData:(id)a4 source:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  switch(a5)
  {
    case 2uLL:
LABEL_5:
      uint64_t v13 = [v10 systemDefaults];
LABEL_7:
      id v14 = v13;
      objc_super v12 = [v13 valueForKeyPath:v8];

      goto LABEL_9;
    case 1uLL:
      uint64_t v13 = [v9 configuration];
      goto LABEL_7;
    case 0uLL:
      id v11 = [v9 configuration];
      objc_super v12 = [v11 valueForKeyPath:v8];

      if (v12) {
        goto LABEL_9;
      }
      goto LABEL_5;
  }
  objc_super v12 = 0;
LABEL_9:
  v20[0] = @"namespace";
  id v15 = [v10 namespaceIdentifier];
  v21[0] = v15;
  v21[1] = v8;
  v20[1] = @"key";
  v20[2] = @"value";
  id v16 = v12;
  if (!v12)
  {
    id v16 = +[NSNull null];
  }
  v21[2] = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [(BRCConfigurationManager *)self _executeMonitorWithMessage:@"default queried" data:v17];

  if (!v12) {
  id v18 = [[BRCConfigValue alloc] initWithObject:v12];
  }

  return v18;
}

- (id)_namespaceNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCConfigurationManager *)self data];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = objc_alloc_init(BRCNamespaceData);
    [(BRCNamespaceData *)v6 setNamespaceIdentifier:v4];
    v7 = [(BRCConfigurationManager *)self data];
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (void)_clearSubscribers
{
  objc_initWeak(&location, self);
  id v3 = [(BRCConfigurationManager *)self updateQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_13609C;
  v4[3] = &unk_2C4F08;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_executeMonitorWithMessage:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BRCConfigurationManager *)self monitorCallback];
  if (v8)
  {
    id v9 = (void *)v8;
    BOOL v10 = [(BRCConfigurationManager *)self jsBridge];

    if (v10)
    {
      id v11 = +[NSString stringWithFormat:@"RemoteConfigMonitor: %@, data = %@", v6, v7];
      objc_super v12 = [(BRCConfigurationManager *)self jsBridge];
      uint64_t v13 = [(BRCConfigurationManager *)self monitorCallback];
      id v20 = v11;
      id v14 = +[NSArray arrayWithObjects:&v20 count:1];
      [v12 enqueueValueCall:v13 arguments:v14 file:@"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/RemoteConfig/BRCConfigurationManager.m" line:538];
    }
  }
  if ([(BRCConfigurationManager *)self monitoringEnabled])
  {
    id v15 = BRCConfigLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&def_7D91C, v15, OS_LOG_TYPE_INFO, "RemoteConfigMonitor: %@, data = %@", buf, 0x16u);
    }
  }
}

+ (id)getInstance
{
  return +[BRCConfigurationManager sharedInstance];
}

- (id)rawValueForKey:(id)a3 fromNamespace:(id)a4
{
  id v4 = [(BRCConfigurationManager *)self valueForKey:a3 fromNamespace:a4];
  id v5 = [v4 object];

  return v5;
}

- (id)subscribeToKeys:(id)a3 inNamespace:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSUUID UUID];
  objc_super v12 = [v11 UUIDString];

  objc_initWeak(&location, self);
  uint64_t v13 = [(BRCConfigurationManager *)self updateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13659C;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v27, &location);
  id v14 = v12;
  id v26 = v14;
  dispatch_sync(v13, block);

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1365FC;
  v23[4] = sub_13660C;
  id v15 = v10;
  id v24 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_136614;
  void v20[3] = &unk_2C9B60;
  v20[4] = self;
  id v22 = v23;
  id v16 = v14;
  id v21 = v16;
  [(BRCConfigurationManager *)self subscribe:v16 toKeys:v8 inNamespace:v9 callback:v20];
  id v17 = v21;
  id v18 = v16;

  _Block_object_dispose(v23, 8);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v18;
}

- (void)unsubscribe:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(BRCConfigurationManager *)self updateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_136904;
  block[3] = &unk_2C4070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setValue:(id)a3 forKey:(id)a4 inNamespace:(id)a5 source:(unint64_t)a6
{
  id v10 = a3;
  id v8 = a4;
  if ([(BRCConfigurationManager *)self monitoringEnabled])
  {
    id v9 = +[BCRCDataContainer defaultContainer];
    [v9 setOverrideObject:v10 forKey:v8];
  }
}

- (void)enableMonitoring:(id)a3
{
  id v5 = a3;
  if ([(BRCConfigurationManager *)self monitoringEnabled])
  {
    id v4 = [(BRCConfigurationManager *)self jsBridge];

    if (v4)
    {
      [(BRCConfigurationManager *)self setMonitorCallback:v5];
      [(BRCConfigurationManager *)self _executeMonitorWithMessage:@"monitoring callback set." data:0];
    }
  }
}

- (void)disableMonitoring
{
  [(BRCConfigurationManager *)self _executeMonitorWithMessage:@"monitoring callback cleared." data:0];

  [(BRCConfigurationManager *)self setMonitorCallback:0];
}

- (void)clearNamespace:(id)a3
{
  id v4 = a3;
  if ([(BRCConfigurationManager *)self monitoringEnabled])
  {
    objc_initWeak(&location, self);
    id v5 = [(BRCConfigurationManager *)self updateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_136BB4;
    block[3] = &unk_2C4070;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)dump:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCConfigurationManager *)self data];
  id v8 = [v5 objectForKey:v4];

  if (v8)
  {
    id v6 = [v8 systemDefaults];
    [(BRCConfigurationManager *)self _executeMonitorWithMessage:@"system defaults" data:v6];

    id v7 = [v8 configuration];
    [(BRCConfigurationManager *)self _executeMonitorWithMessage:@"configured defaults" data:v7];
  }
}

- (id)_readFromCacheForNamespace:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCConfigurationManager *)self workerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BRCConfigurationManager *)self _cacheURLFromNamespace:v4];

  id v7 = +[NSData dataWithContentsOfURL:v6];
  if (v7)
  {
    id v12 = 0;
    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v12];
    id v9 = v12;
    if (v9)
    {
      id v10 = BRCConfigLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1EE59C();
      }
    }
  }
  else
  {
    id v9 = 0;
    id v8 = 0;
  }

  return v8;
}

- (void)_saveToCacheNamespaceData:(id)a3 withNamespace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setNamespaceIdentifier:v6];
  id v15 = 0;
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v15];

  id v9 = v15;
  if (!v8)
  {
    id v10 = BRCConfigLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1EE66C();
    }
  }
  id v11 = [(BRCConfigurationManager *)self _cacheURLFromNamespace:v6];
  id v14 = v9;
  [v8 writeToURL:v11 options:1 error:&v14];
  id v12 = v14;

  if (v12)
  {
    uint64_t v13 = BRCConfigLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1EE604();
    }
  }
}

- (id)_cacheURLFromNamespace:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v10];
  id v6 = v10;

  if (v5)
  {
    id v7 = [v5 URLByAppendingPathComponent:v3 isDirectory:0];
  }
  else
  {
    id v8 = BRCConfigLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1EE6D4();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)jsBridge
{
  id WeakRetained = objc_loadWeakRetained(&self->_jsBridge);

  return WeakRetained;
}

- (void)setJsBridge:(id)a3
{
}

- (BOOL)configurationLoaded
{
  return self->_configurationLoaded;
}

- (JSValue)monitorCallback
{
  return (JSValue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMonitorCallback:(id)a3
{
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setData:(id)a3
{
}

- (RCConfigurationManager)remoteConfigurationManager
{
  return (RCConfigurationManager *)objc_getProperty(self, a2, 72, 1);
}

- (OS_dispatch_queue)workerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWorkerQueue:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUpdateQueue:(id)a3
{
}

- (BOOL)refreshOnRegister
{
  return self->_refreshOnRegister;
}

- (void)setRefreshOnRegister:(BOOL)a3
{
  self->_refreshOnRegister = a3;
}

- (BOOL)alwaysNotifyOnSubscribe
{
  return self->_alwaysNotifyOnSubscribe;
}

- (void)setAlwaysNotifyOnSubscribe:(BOOL)a3
{
  self->_alwaysNotifyOnSubscribe = a3;
}

- (NSMutableArray)jsSubscribers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setJsSubscribers:(id)a3
{
}

- (BOOL)cacheLoaded
{
  return self->_cacheLoaded;
}

- (void)setCacheLoaded:(BOOL)a3
{
  self->_cacheLoaded = a3;
}

- (NSCondition)cacheLoadedCondition
{
  return self->_cacheLoadedCondition;
}

- (void)setCacheLoadedCondition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLoadedCondition, 0);
  objc_storeStrong((id *)&self->_jsSubscribers, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_remoteConfigurationManager, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_monitorCallback, 0);
  objc_destroyWeak(&self->_jsBridge);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_userID, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end