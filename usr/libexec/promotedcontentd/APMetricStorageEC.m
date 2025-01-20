@interface APMetricStorageEC
+ (NSString)closedStoragePathPrefix;
+ (NSString)openStoragePathPrefix;
+ (id)destinationsStoragePath;
- (APECMetricSampler)sampler;
- (APJourneySettings)journeySettings;
- (APMetricNotificationRegister)notificationRegistrar;
- (APMetricServerDelivering)serverDelivery;
- (APMetricStorageEC)init;
- (APUnfairLock)serverDeliveryLock;
- (BOOL)eventCollectionDisabled;
- (BOOL)hasBacklogForChannel:(id)a3;
- (NSLock)storageLock;
- (NSMutableDictionary)currentBatches;
- (NSSet)channels;
- (OS_dispatch_queue)metricsQueue;
- (id)_closeBatchesForChannels:(id)a3 shelved:(BOOL)a4 groupBatches:(BOOL)a5;
- (id)_closedPathForChannel:(id)a3;
- (id)_openBatchForChannel:(id)a3;
- (id)_readChannels;
- (id)_shelvedPathForChannel:(id)a3;
- (id)closeBatchesForChannels:(id)a3;
- (id)closeShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4;
- (id)preparedMetricDataForDestination:(id)a3 purpose:(int64_t)a4 containsSignature:(BOOL)a5;
- (void)_cleanupLeftovers;
- (void)_closeBatchForChannel:(id)a3;
- (void)_notifyListenersOfMetric:(id)a3;
- (void)_processMetric:(id)a3;
- (void)_withdrawShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4 signingAuthority:(id)a5;
- (void)_writeChannels;
- (void)addActiveChannel:(id)a3;
- (void)closeActiveBatches;
- (void)dealloc;
- (void)finishEventsRotationWithSigningAuthority:(id)a3;
- (void)receivedMetric:(id)a3;
- (void)rotateIDAccount;
- (void)setChannels:(id)a3;
- (void)setCurrentBatches:(id)a3;
- (void)setEventCollectionDisabled:(BOOL)a3;
- (void)setNotificationRegistrar:(id)a3;
- (void)setSampler:(id)a3;
- (void)setServerDelivery:(id)a3;
- (void)setup;
- (void)startEventsRotation;
@end

@implementation APMetricStorageEC

+ (NSString)closedStoragePathPrefix
{
  return (NSString *)@"c";
}

+ (NSString)openStoragePathPrefix
{
  return (NSString *)@"o";
}

+ (id)destinationsStoragePath
{
  return @"d";
}

- (APMetricStorageEC)init
{
  v24.receiver = self;
  v24.super_class = (Class)APMetricStorageEC;
  v2 = [(APMetricStorageEC *)&v24 init];
  v3 = v2;
  if (qword_100289B58 != -1)
  {
    dispatch_once(&qword_100289B58, &stru_1002363E0);
    if (!v3) {
      return v3;
    }
    goto LABEL_3;
  }
  if (v2)
  {
LABEL_3:
    v4 = +[MetricsModuleClasses notificationRegistrarClass];
    v5 = +[MetricsModuleClasses serverDeliveryClass];
    v6 = +[APIDAccountProvider privateUserAccount];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ap.metrics", 0);
    metricsQueue = v3->_metricsQueue;
    v3->_metricsQueue = (OS_dispatch_queue *)v7;

    v9 = (APMetricNotificationRegister *)objc_alloc_init(v4);
    notificationRegistrar = v3->_notificationRegistrar;
    v3->_notificationRegistrar = v9;

    v11 = (APMetricServerDelivering *)objc_alloc_init(v5);
    serverDelivery = v3->_serverDelivery;
    v3->_serverDelivery = v11;

    v13 = (NSLock *)objc_alloc_init((Class)NSLock);
    storageLock = v3->_storageLock;
    v3->_storageLock = v13;

    v15 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
    currentBatches = v3->_currentBatches;
    v3->_currentBatches = v15;

    uint64_t v17 = [(APMetricStorageEC *)v3 _readChannels];
    channels = v3->_channels;
    v3->_channels = (NSSet *)v17;

    v19 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    serverDeliveryLock = v3->_serverDeliveryLock;
    v3->_serverDeliveryLock = v19;

    v21 = objc_alloc_init(APECMetricSampler);
    sampler = v3->_sampler;
    v3->_sampler = v21;

    v3->_eventCollectionDisabled = [v6 isChild];
  }
  return v3;
}

- (void)dealloc
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138477827;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Metric storage (%{private}@) was dealloced!", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)APMetricStorageEC;
  [(APMetricStorageEC *)&v4 dealloc];
}

- (void)setup
{
  [(APMetricStorageEC *)self _cleanupLeftovers];
  v3 = [(id)objc_opt_class() openStoragePathPrefix];
  objc_super v4 = [(id)objc_opt_class() closedStoragePathPrefix];
  +[APMetricStorage_private moveExistingOpenFilesToClosed:v3 closedPrefix:v4];

  id v5 = [(APMetricStorageEC *)self journeySettings];
}

- (APJourneySettings)journeySettings
{
  journeySettings = self->_journeySettings;
  if (!journeySettings)
  {
    objc_super v4 = +[APJourneySettings settings];
    id v5 = self->_journeySettings;
    self->_journeySettings = v4;

    journeySettings = self->_journeySettings;
  }

  return journeySettings;
}

- (id)_readChannels
{
  id v2 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  v3 = [(id)objc_opt_class() destinationsStoragePath];
  id v25 = 0;
  unsigned int v4 = [v2 fileExistsAtPath:v3 error:&v25];
  id v5 = v25;
  id v6 = v5;
  if (!v4)
  {
    v13 = 0;
    goto LABEL_23;
  }
  id v24 = v5;
  dispatch_queue_t v7 = [v2 objectStoredAtPath:v3 error:&v24];
  id v8 = v24;

  if (v8)
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740227;
      v27 = v3;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error reading destinations from path: %{sensitive}@ Error: %{public}@", buf, 0x16u);
    }
  }
  v10 = [v7 anyObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v23 = v8;
    [v2 removeObjectAtPath:v3 error:&v23];
    id v6 = v23;

    if (v6)
    {
      v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740227;
        v27 = v3;
        __int16 v28 = 2114;
        id v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error removing old destinations from path: %{sensitive}@ Error: %{public}@", buf, 0x16u);
      }
    }
    v13 = 0;
    goto LABEL_22;
  }
  v14 = [v7 anyObject];
  v15 = self;
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    uint64_t v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Upgrading channels", buf, 2u);
    }

    id v18 = [v7 compactMapObjectsUsingBlock:&stru_100236420];
  }
  else
  {
    v19 = [v7 anyObject];
    v20 = self;
    char v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) == 0)
    {
      v13 = 0;
      goto LABEL_21;
    }
    id v18 = v7;
  }
  v13 = v18;
LABEL_21:
  id v6 = v8;
LABEL_22:

LABEL_23:

  return v13;
}

- (void)_writeChannels
{
  id v2 = [(APMetricStorageEC *)self channels];
  if (v2)
  {
    id v3 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
    unsigned int v4 = [(id)objc_opt_class() destinationsStoragePath];
    id v10 = 0;
    unsigned int v5 = [v3 storeObject:v2 atPath:v4 error:&v10];
    id v6 = v10;
    dispatch_queue_t v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8)
    {
      v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740227;
        v12 = v4;
        __int16 v13 = 2114;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error writing destinations to path: %{sensitive}@ Error: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)addActiveChannel:(id)a3
{
  id v11 = a3;
  unsigned int v4 = [(APMetricStorageEC *)self channels];
  if ([v4 containsObject:v11])
  {
    unsigned int v5 = v4;
  }
  else
  {
    id v6 = self;
    objc_sync_enter(v6);
    dispatch_queue_t v7 = [(APMetricStorageEC *)v6 channels];
    BOOL v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = +[NSSet set];
    }
    unsigned int v5 = v9;

    id v10 = [v5 setByAddingObject:v11];
    [(APMetricStorageEC *)v6 setChannels:v10];
    [(APMetricStorageEC *)v6 _writeChannels];

    objc_sync_exit(v6);
  }
}

- (BOOL)hasBacklogForChannel:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  id v6 = [(APMetricStorageEC *)self _closedPathForChannel:v4];

  uint64_t v10 = 0;
  dispatch_queue_t v7 = [v5 contentsOfDirectoryAtPath:v6 error:&v10];
  BOOL v8 = (unint64_t)[v7 count] > 0xA;

  return v8;
}

- (id)_closedPathForChannel:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() closedStoragePathPrefix];
  id v5 = [v3 destination];
  id v6 = [v5 value];
  dispatch_queue_t v7 = [v4 stringByAppendingPathComponent:v6];

  id v8 = [v3 purpose];
  id v9 = +[NSNumber numberWithInteger:v8];
  uint64_t v10 = [v9 stringValue];
  id v11 = [v7 stringByAppendingPathComponent:v10];

  return v11;
}

- (id)_shelvedPathForChannel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 destination];
  id v5 = [v4 value];
  id v6 = [@"s" stringByAppendingPathComponent:v5];

  id v7 = [v3 purpose];
  id v8 = +[NSNumber numberWithInteger:v7];
  id v9 = [v8 stringValue];
  uint64_t v10 = [v6 stringByAppendingPathComponent:v9];

  return v10;
}

- (void)closeActiveBatches
{
  [(NSLock *)self->_storageLock lock];
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting close active batches", buf, 2u);
  }

  id v4 = [(APMetricStorageEC *)self activeChannels];
  id v5 = [v4 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = APLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "close active batch for %{private}@", buf, 0xCu);
        }

        [(APMetricStorageEC *)self _closeBatchForChannel:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }

  __int16 v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Exiting close active batches", buf, 2u);
  }

  [(NSLock *)self->_storageLock unlock];
}

- (id)closeBatchesForChannels:(id)a3
{
  return [(APMetricStorageEC *)self _closeBatchesForChannels:a3 shelved:0 groupBatches:1];
}

- (id)closeShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = a3;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];

  id v8 = -[APMetricStorageEC _closeBatchesForChannels:shelved:groupBatches:](self, "_closeBatchesForChannels:shelved:groupBatches:", v7, 1, v4, v10);

  return v8;
}

- (id)_closeBatchesForChannels:(id)a3 shelved:(BOOL)a4 groupBatches:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v32 = a4;
  id v7 = a3;
  v34 = self;
  [(NSLock *)self->_storageLock lock];
  if (v5) {
    uint64_t v8 = 10;
  }
  else {
    uint64_t v8 = 1;
  }
  v41 = +[NSMutableArray arrayWithCapacity:v8];
  id v33 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  id v31 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v44;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v44 != v30) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
      v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v48 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting close batches for channel %{private}@", buf, 0xCu);
      }

      if (v32) {
        [(APMetricStorageEC *)v34 _shelvedPathForChannel:v10];
      }
      else {
      __int16 v13 = [(APMetricStorageEC *)v34 _closedPathForChannel:v10];
      }
      id v42 = 0;
      long long v14 = [v33 contentsOfDirectoryAtPath:v13 error:&v42];
      id v15 = v42;
      long long v16 = (char *)[v14 count];
      if (v8 >= (unint64_t)v16) {
        long long v17 = v16;
      }
      else {
        long long v17 = (char *)v8;
      }
      if (v17)
      {
        id v36 = v15;
        v37 = v14;
        v38 = v10;
        v39 = v11;
        uint64_t v40 = v9;
        v35 = [v14 sortedArrayUsingSelector:"compare:"];
        id v18 = [v35 subarrayWithRange:0, v17];
        uint64_t v19 = +[MetricsModuleClasses batchClass];
        for (i = 0; i != v17; ++i)
        {
          char v21 = [v18 objectAtIndex:i];
          v22 = [v13 stringByAppendingPathComponent:v21];
          id v23 = [[v19 alloc] initWithPath:v22];
          id v24 = APLogForCategory();
          id v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v48 = v21;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Closed batch %{private}@", buf, 0xCu);
            }

            [v41 addObject:v23];
            --v8;
          }
          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v48 = v21;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Couldn't create closed batch: %{private}@", buf, 0xCu);
            }
          }
        }

        uint64_t v11 = v39;
        uint64_t v9 = v40;
        long long v14 = v37;
        id v10 = v38;
        id v15 = v36;
      }
      v26 = APLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v48 = v10;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Ending close batches for channel %{private}@", buf, 0xCu);
      }

      if (v8 < 1) {
        break;
      }
      if ((id)++v9 == v31)
      {
        id v31 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v31) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  [(NSLock *)v34->_storageLock unlock];
  id v27 = [v41 copy];

  return v27;
}

- (id)_openBatchForChannel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(APMetricStorageEC *)self currentBatches];
  id v6 = [v5 objectForKey:v4];
  if (!v6)
  {
    id v7 = objc_alloc(+[MetricsModuleClasses batchClass]);
    uint64_t v8 = [v4 destination];
    uint64_t v9 = [v8 protectedDestination];
    id v6 = [v7 initWithDestination:v9 purpose:[v4 purpose]];

    if (v6)
    {
      [v5 setObject:v6 forKey:v4];
    }
    else
    {
      id v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138477827;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Couldn't create open batch: %{private}@", (uint8_t *)&v14, 0xCu);
      }

      id v6 = 0;
    }
  }
  uint64_t v11 = APLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v6 identifier];
    int v14 = 138477827;
    id v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "using open batch %{private}@", (uint8_t *)&v14, 0xCu);
  }

  return v6;
}

- (void)_closeBatchForChannel:(id)a3
{
  id v7 = a3;
  id v4 = [(APMetricStorageEC *)self currentBatches];
  BOOL v5 = [v4 objectForKey:v7];
  id v6 = v5;
  if (v5)
  {
    [v5 close];
    [v4 removeObjectForKey:v7];
  }
}

- (void)_processMetric:(id)a3
{
  id v4 = (__CFString *)a3;
  BOOL v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138478083;
    v47 = v7;
    __int16 v48 = 2114;
    CFStringRef v49 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{private}@] Processing metric: %{public}@", buf, 0x16u);
  }
  uint64_t v8 = [(__CFString *)v4 metricRoute];
  if (!objc_msgSend(v8, "metricIsDiagnosticsAndUsage:", -[__CFString metric](v4, "metric")))
  {
    uint64_t v9 = +[APECPurposeConfig purposeConfig:[(__CFString *)v4 purpose]];
    int v14 = [v9 collectionType];
    id v15 = [v14 integerValue];

    if (v15 == (id)7401
      && (+[NSProcessInfo isDNUEnabled] & 1) == 0)
    {
      id v23 = APLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        unsigned int v26 = +[NSProcessInfo isDNUEnabled];
        CFStringRef v27 = @"NO";
        *(_DWORD *)buf = 138478339;
        v47 = v25;
        __int16 v48 = 2114;
        if (v26) {
          CFStringRef v27 = @"YES";
        }
        CFStringRef v49 = v27;
        __int16 v50 = 2114;
        CFStringRef v51 = @"YES";
        __int16 v28 = "[%{private}@] Metric will not be processed: DNUEnabled (%{public}@), isDNUCollection (%{public}@)";
        id v29 = v23;
        uint32_t v30 = 32;
        goto LABEL_31;
      }
LABEL_32:

      goto LABEL_33;
    }
    long long v16 = [(APMetricStorageEC *)self sampler];
    unsigned __int8 v17 = [v16 sampleEvent:-[__CFString purpose](v4, "purpose")];

    id v18 = +[NSProcessInfo processInfo];
    unsigned __int8 v19 = [v18 isRunningTests];

    if (v19)
    {
LABEL_22:
      id v23 = [v8 channel];
      if (v23)
      {
        id v31 = [(APMetricStorageEC *)self _openBatchForChannel:v23];
        [v31 receivedMetric:v4];
        [(APMetricStorageEC *)self addActiveChannel:v23];
        id v32 = [(__CFString *)v4 options];
        unsigned int v33 = [v31 shouldRotate];
        char v34 = v33;
        if ((unint64_t)v32 > 0xFFFFFFFF7FFFFFFFLL || v33)
        {
          BOOL v35 = (unint64_t)v32 > 0xFFFFFFFF7FFFFFFFLL;
          [(APMetricStorageEC *)self _closeBatchForChannel:v23];
          id v36 = [(APMetricStorageEC *)self metricsQueue];
          [(APMetricStorageEC *)self serverDelivery];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100113070;
          block[3] = &unk_100236448;
          BOOL v44 = v35;
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          long long v43 = v23;
          char v45 = v34;
          id v37 = v42;
          dispatch_async(v36, block);
        }
      }
      else
      {
        id v31 = APLogForCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          *(_DWORD *)buf = 138478083;
          v47 = v39;
          __int16 v48 = 2114;
          CFStringRef v49 = v4;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: Metric has no channel: %{public}@", buf, 0x16u);
        }
      }

      goto LABEL_32;
    }
    if (+[APSystemInternal isAppleInternalInstall])
    {
      id v20 = objc_alloc((Class)NSUserDefaults);
      id v21 = [v20 initWithSuiteName:APDefaultsBundleID];
      id v22 = [v21 integerForKey:@"ec.noSampleOverride"];
      if (v22 == (id)1)
      {

        goto LABEL_29;
      }
      if (!v22)
      {

        goto LABEL_22;
      }
    }
    if (v17) {
      goto LABEL_22;
    }
LABEL_29:
    id v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138478083;
      v47 = v25;
      __int16 v48 = 2114;
      CFStringRef v49 = @"NO";
      __int16 v28 = "[%{private}@] Metric will not be processed: sampled (%{public}@)";
      id v29 = v23;
      uint32_t v30 = 22;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  uint64_t v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = APDiagnosticsSubmissionAllowed();
    CFStringRef v13 = @"NO";
    *(_DWORD *)buf = 138478339;
    v47 = v11;
    __int16 v48 = 2114;
    if (v12) {
      CFStringRef v13 = @"YES";
    }
    CFStringRef v49 = v13;
    __int16 v50 = 2114;
    CFStringRef v51 = @"YES";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{private}@] Metric will not be processed: DiagnosticSubmissionAllowed (%{public}@), isDNUMetric (%{public}@)", buf, 0x20u);
  }
LABEL_33:
}

- (void)_notifyListenersOfMetric:(id)a3
{
  id v4 = a3;
  BOOL v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 ecServerDictionaryRepresentation];
    int v11 = 138478083;
    int v12 = v7;
    __int16 v13 = 2114;
    int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{private}@] Received metric: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [(APMetricStorageEC *)self notificationRegistrar];
  id v10 = [v4 copyWithZone:0];
  [v9 receivedMetric:v10];
}

- (void)receivedMetric:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[APMetricOffsetSettings settings];
  id v6 = [v5 lastActivity];
  id v7 = +[NSDate date];
  uint64_t v8 = v7;
  if (!v6 || ([v7 timeIntervalSinceDate:v6], v9 > 14400.0)) {
    [v5 resetRouteOffsets];
  }
  [v4 purpose];
  if (!isInternalPurpose())
  {
    if (!self->_eventCollectionDisabled)
    {
      [(APMetricStorageEC *)self _notifyListenersOfMetric:v4];
      [(NSLock *)self->_storageLock lock];
      [(APMetricStorageEC *)self _processMetric:v4];
      [(NSLock *)self->_storageLock unlock];
      goto LABEL_10;
    }
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = (objc_class *)objc_opt_class();
      int v12 = NSStringFromClass(v11);
      int v16 = 138478083;
      unsigned __int8 v17 = v12;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{private}@] Event collection disabled. Not processing metric %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  [(APMetricStorageEC *)self _notifyListenersOfMetric:v4];
LABEL_10:
  if (isExternalPurpose() && !self->_eventCollectionDisabled)
  {
    if (!v6 || ([v8 timeIntervalSinceDate:v6], v13 > 60.0))
    {
      int v14 = +[NSDate date];
      [v5 setLastActivity:v14];
    }
    id v15 = [(APMetricStorageEC *)self serverDelivery];
    [v15 startDeliveryTimer];
  }
}

- (void)startEventsRotation
{
  id v3 = [(APMetricStorageEC *)self serverDeliveryLock];
  [v3 lock];

  id v4 = [(APMetricStorageEC *)self serverDelivery];
  [v4 pause];
}

- (void)finishEventsRotationWithSigningAuthority:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[APEventChannel unused];
  [(APMetricStorageEC *)self _closeBatchForChannel:v5];

  id v6 = +[APEventChannel unused];
  id v7 = [v6 protectedEventChannel];
  +[APMetricStorage_private shelveClosedForChannel:v7];

  uint64_t v8 = [(APMetricStorageEC *)self serverDelivery];
  [v8 resume];

  double v9 = [(APMetricStorageEC *)self serverDeliveryLock];
  [v9 unlock];

  id v10 = +[APEventChannel unused];
  [(APMetricStorageEC *)self _withdrawShelvedBatchesForChannel:v10 groupBatches:1 signingAuthority:v4];
}

- (void)_withdrawShelvedBatchesForChannel:(id)a3 groupBatches:(BOOL)a4 signingAuthority:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  int v11 = [(APMetricStorageEC *)self serverDelivery];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10011367C;
  v15[3] = &unk_100236470;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [v11 withdrawShelvedBatchesForChannel:v13 groupBatches:v6 withSaveObjectBlock:v15];
}

- (void)_cleanupLeftovers
{
  id v3 = +[APEventChannel unused];
  id v4 = [v3 protectedEventChannel];
  +[APMetricStorage_private shelveClosedForChannel:v4];

  id v5 = +[APEventChannel unused];
  [(APMetricStorageEC *)self _withdrawShelvedBatchesForChannel:v5 groupBatches:0 signingAuthority:0];
}

- (id)preparedMetricDataForDestination:(id)a3 purpose:(int64_t)a4 containsSignature:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  id v9 = [v7 protectedDestination];
  id v10 = +[APMetricStorage_private preparedDataPathForDestination:v9 purpose:a4 containsSignature:v5];

  int v11 = [v8 contentsOfDirectoryAtPath:v10 error:0];
  id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [[v10 stringByAppendingPathComponent:*(void *)(*((void *)&v21 + 1) + 8 * i)]
        [v12 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  id v19 = [v12 copy];

  return v19;
}

- (void)rotateIDAccount
{
  id v3 = +[APIDAccountProvider privateUserAccount];
  -[APMetricStorageEC setEventCollectionDisabled:](self, "setEventCollectionDisabled:", [v3 isChild]);
}

- (void)setServerDelivery:(id)a3
{
}

- (void)setNotificationRegistrar:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (APMetricNotificationRegister)notificationRegistrar
{
  return self->_notificationRegistrar;
}

- (APMetricServerDelivering)serverDelivery
{
  return self->_serverDelivery;
}

- (NSLock)storageLock
{
  return self->_storageLock;
}

- (NSMutableDictionary)currentBatches
{
  return self->_currentBatches;
}

- (void)setCurrentBatches:(id)a3
{
}

- (NSSet)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (APUnfairLock)serverDeliveryLock
{
  return self->_serverDeliveryLock;
}

- (APECMetricSampler)sampler
{
  return self->_sampler;
}

- (void)setSampler:(id)a3
{
}

- (BOOL)eventCollectionDisabled
{
  return self->_eventCollectionDisabled;
}

- (void)setEventCollectionDisabled:(BOOL)a3
{
  self->_eventCollectionDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_serverDeliveryLock, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_journeySettings, 0);
  objc_storeStrong((id *)&self->_currentBatches, 0);
  objc_storeStrong((id *)&self->_storageLock, 0);
  objc_storeStrong((id *)&self->_serverDelivery, 0);
  objc_storeStrong((id *)&self->_notificationRegistrar, 0);

  objc_storeStrong((id *)&self->_metricsQueue, 0);
}

@end