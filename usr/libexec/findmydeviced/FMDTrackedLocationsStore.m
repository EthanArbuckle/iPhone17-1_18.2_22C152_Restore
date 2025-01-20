@interface FMDTrackedLocationsStore
- (FMDLocationTracker)locationTracker;
- (FMDTrackedLocationsStore)initWithLocationTracker:(id)a3;
- (FMDataArchiver)dataArchiver;
- (NSMutableArray)trackedLocations;
- (OS_dispatch_queue)store_ops_queue;
- (PCPersistentTimer)locationPurgeTimer;
- (id)_locationCacheFileName;
- (id)_serialQueue_readTrackedLocationsCache;
- (id)_trackedLocationsCacheFileURL;
- (id)lastLocation;
- (id)locationPurgeTimerXPCTransactionName;
- (void)_serialQueue_addTrackedLocationNow:(id)a3;
- (void)_serialQueue_deleteTrackedLocationsCache;
- (void)_serialQueue_purgeOldTrackedLocationsNow;
- (void)_serialQueue_scheduleLocationPurgeTimer;
- (void)_serialQueue_scheduleLocationPurgeTimer_internal;
- (void)_serialQueue_updateTrackedLocationsCache:(id)a3;
- (void)actOnTrackedLocationsUsingBlock:(id)a3;
- (void)dealloc;
- (void)deleteAllTrackedLocations;
- (void)logLocation:(id)a3;
- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4;
- (void)setDataArchiver:(id)a3;
- (void)setLocationPurgeTimer:(id)a3;
- (void)setLocationTracker:(id)a3;
- (void)setStore_ops_queue:(id)a3;
- (void)setTrackedLocations:(id)a3;
@end

@implementation FMDTrackedLocationsStore

- (void)dealloc
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100240EDC(self);
  }

  v4 = [(FMDTrackedLocationsStore *)self locationPurgeTimer];

  if (v4)
  {
    v5 = [(FMDTrackedLocationsStore *)self locationPurgeTimer];
    [(FMDTrackedLocationsStore *)self setLocationPurgeTimer:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100084D78;
    block[3] = &unk_1002D9378;
    id v11 = v5;
    id v6 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v7 = +[FMXPCTransactionManager sharedInstance];
    v8 = [(FMDTrackedLocationsStore *)self locationPurgeTimerXPCTransactionName];
    [v7 endTransaction:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)FMDTrackedLocationsStore;
  [(FMDTrackedLocationsStore *)&v9 dealloc];
}

- (FMDTrackedLocationsStore)initWithLocationTracker:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMDTrackedLocationsStore;
  v5 = [(FMDTrackedLocationsStore *)&v21 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)FMDataArchiver);
    v7 = [(FMDTrackedLocationsStore *)v5 _trackedLocationsCacheFileURL];
    id v8 = [v6 initWithFileURL:v7];
    [(FMDTrackedLocationsStore *)v5 setDataArchiver:v8];

    objc_super v9 = [(FMDTrackedLocationsStore *)v5 dataArchiver];
    [v9 setDataProtectionClass:4];

    v10 = [(FMDTrackedLocationsStore *)v5 dataArchiver];
    [v10 setBackedUp:0];

    id v11 = [(FMDTrackedLocationsStore *)v5 dataArchiver];
    [v11 setCreateDirectories:1];

    [(FMDTrackedLocationsStore *)v5 setLocationTracker:v4];
    v12 = +[NSMutableArray array];
    [(FMDTrackedLocationsStore *)v5 setTrackedLocations:v12];

    v13 = [(FMDTrackedLocationsStore *)v5 _serialQueue_readTrackedLocationsCache];
    if (v13)
    {
      v14 = [(FMDTrackedLocationsStore *)v5 trackedLocations];
      [v14 addObjectsFromArray:v13];
    }
    v15 = off_10031D4C0;
    v16 = +[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", [v4 locationTrackerType]);
    v17 = +[NSString stringWithFormat:@"%@-%@", v15, v16];

    id v18 = v17;
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 cStringUsingEncoding:4], 0);
    [(FMDTrackedLocationsStore *)v5 setStore_ops_queue:v19];

    [(FMDTrackedLocationsStore *)v5 _serialQueue_scheduleLocationPurgeTimer];
  }

  return v5;
}

- (void)_serialQueue_updateTrackedLocationsCache:(id)a3
{
  id v4 = a3;
  v5 = [(FMDTrackedLocationsStore *)self dataArchiver];
  id v6 = [v5 saveArray:v4];

  if (v6)
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100240F60();
    }
  }
}

- (id)_trackedLocationsCacheFileURL
{
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    v5 = [v4 stringByAppendingPathComponent:@"Preferences"];
    id v6 = +[NSURL fileURLWithPath:v5 isDirectory:1 relativeToURL:0];
  }
  else
  {
    v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100241048();
    }

    id v6 = 0;
  }
  id v8 = [(FMDTrackedLocationsStore *)self _locationCacheFileName];
  objc_super v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:0];

  v10 = sub_100004238();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100240FD4();
  }

  return v9;
}

- (id)_serialQueue_readTrackedLocationsCache
{
  v2 = [(FMDTrackedLocationsStore *)self dataArchiver];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v14 = 0;
  id v6 = [v2 readArrayAndClasses:v5 error:&v14];
  id v7 = v14;

  if (objc_msgSend(v7, "fm_isFileNotFoundError")) {
    goto LABEL_9;
  }
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    objc_super v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100241184();
    }

    v10 = +[FMDEventLoggerGeneral sharedInstance];
    [v10 sendError:v7 forEventName:@"FMDTrackedLocationsStoreFailedReadEventName"];

LABEL_9:
    if (!v6) {
      goto LABEL_15;
    }
  }
  id v11 = sub_100004238();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10024110C(v6);
  }

  v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100241088(v6);
  }

LABEL_15:

  return v6;
}

- (void)_serialQueue_deleteTrackedLocationsCache
{
  uint64_t v3 = [(FMDTrackedLocationsStore *)self _trackedLocationsCacheFileURL];
  uint64_t v4 = +[NSFileManager defaultManager];
  v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1002411F8(self);
    }

    BOOL v8 = +[NSFileManager defaultManager];
    id v11 = 0;
    [v8 removeItemAtURL:v3 error:&v11];
    id v9 = v11;

    if (v9 && (objc_msgSend(v9, "fm_isFileNotFoundError") & 1) == 0)
    {
      v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to delete tracked locations file (%@): %@", buf, 0x16u);
      }
    }
  }
}

- (id)_locationCacheFileName
{
  v2 = [(FMDTrackedLocationsStore *)self locationTracker];
  uint64_t v3 = +[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", [v2 locationTrackerType]);
  uint64_t v4 = +[NSString stringWithFormat:@"%@.%@", v3, off_10031D4B8];

  return v4;
}

- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [[FMDLocation alloc] initWithLocation:v6 eventType:5 positionType:v4];
  [(FMDTrackedLocationsStore *)self logLocation:v7];
  BOOL v8 = [v6 horizontalAccuracy];
  [v8 doubleValue];
  double v10 = v9;
  id v11 = [(FMDTrackedLocationsStore *)self locationTracker];
  [v11 minSLCAccuracyThreshold];
  double v13 = v12;

  if (v10 <= v13)
  {
    __int16 v14 = +[NSMutableDictionary dictionary];
    [v14 fm_safelySetObject:v7 forKey:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
    id v15 = objc_alloc_init(FMDBatteryInfo);
    v16 = [(FMDLocation *)v7 metaDataRecord];
    CFStringRef v26 = @"kFMDTrackedLocationsStoreTrackFMDBatteryInfo";
    v17 = [(FMDBatteryInfo *)v15 dictionaryValue];
    v27 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v16 appendMetaData:v18];

    [v14 fm_safelySetObject:v15 forKey:@"kFMDTrackedLocationsStoreTrackFMDBatteryInfo"];
    objc_initWeak(&location, self);
    dispatch_queue_t v19 = [(FMDTrackedLocationsStore *)self store_ops_queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100085784;
    block[3] = &unk_1002DA298;
    objc_copyWeak(&v24, &location);
    id v22 = v14;
    id v23 = v6;
    id v20 = v14;
    dispatch_async(v19, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)logLocation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[FMDEventLoggerEventLocate alloc] initWithEventName:@"FMDLocatorLocateEvent"];
  [(FMDEventLoggerEventLocate *)v4 setLocation:v3 reason:&stru_1002E7428];

  v5 = +[FMDEventLogger sharedLogger];
  id v6 = +[FMDEventLoggerFacilityOnDiskStats facilityName];
  v9[0] = v6;
  id v7 = +[FMDEventLoggerFacilityOnDisk facilityName];
  v9[1] = v7;
  BOOL v8 = +[NSArray arrayWithObjects:v9 count:2];
  [v5 logEvent:v4 toFacilitiesNamed:v8];
}

- (void)deleteAllTrackedLocations
{
  objc_initWeak(&location, self);
  id v3 = [(FMDTrackedLocationsStore *)self store_ops_queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100085AB4;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)actOnTrackedLocationsUsingBlock:(id)a3
{
  id v20 = a3;
  id v3 = [(FMDTrackedLocationsStore *)self trackedLocations];
  id v4 = [v3 copy];

  id v5 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v9);
        id v11 = +[NSMutableDictionary dictionary];
        double v12 = [v10 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
        double v13 = [v10 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDBatteryInfo"];
        __int16 v14 = [v12 dictionaryValue];
        [v11 addEntriesFromDictionary:v14];

        id v15 = [v13 dictionaryValue];
        [v11 addEntriesFromDictionary:v15];

        [v5 fm_safeAddObject:v11];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  v16 = [(FMDTrackedLocationsStore *)self store_ops_queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100085D8C;
  block[3] = &unk_1002D97B0;
  id v23 = v5;
  id v24 = v20;
  id v17 = v5;
  id v18 = v20;
  dispatch_async(v16, block);
}

- (id)lastLocation
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = sub_100085EBC;
  id v11 = sub_100085ECC;
  id v12 = 0;
  id v3 = [(FMDTrackedLocationsStore *)self store_ops_queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085ED4;
  v6[3] = &unk_1002DA4D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_serialQueue_scheduleLocationPurgeTimer
{
  id v3 = [(FMDTrackedLocationsStore *)self locationPurgeTimer];

  [(FMDTrackedLocationsStore *)self _serialQueue_scheduleLocationPurgeTimer_internal];
  id v4 = [(FMDTrackedLocationsStore *)self locationPurgeTimer];

  if (v4)
  {
    if (v3) {
      return;
    }
    id v6 = +[FMXPCTransactionManager sharedInstance];
    id v5 = [(FMDTrackedLocationsStore *)self locationPurgeTimerXPCTransactionName];
    [v6 beginTransaction:v5];
  }
  else
  {
    if (!v3) {
      return;
    }
    id v6 = +[FMXPCTransactionManager sharedInstance];
    id v5 = [(FMDTrackedLocationsStore *)self locationPurgeTimerXPCTransactionName];
    [v6 endTransaction:v5];
  }
}

- (void)_serialQueue_scheduleLocationPurgeTimer_internal
{
  v2 = sub_100004238();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100241358();
  }

  id v3 = [(FMDTrackedLocationsStore *)self locationPurgeTimer];

  if (v3)
  {
    id v4 = [(FMDTrackedLocationsStore *)self locationPurgeTimer];
    [(FMDTrackedLocationsStore *)self setLocationPurgeTimer:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000864B4;
    block[3] = &unk_1002D9378;
    id v38 = v4;
    id v5 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  id v6 = [(FMDTrackedLocationsStore *)self trackedLocations];
  BOOL v7 = [v6 count] == 0;

  if (v7)
  {
    id v12 = sub_100004238();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10024127C();
    }
  }
  else
  {
    uint64_t v8 = [vala locationTracker];
    [v8 keepAlive];
    double v10 = v9;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = [vala trackedLocations];
    id v12 = 0;
    id v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v34;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v15) objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
          id v17 = [v16 timeStamp];
          id v18 = [v17 dateByAddingTimeInterval:v10];
          dispatch_queue_t v19 = v18;
          if (v12)
          {
            uint64_t v20 = [v18 earlierDate:v12];

            id v12 = v20;
          }
          else
          {
            id v12 = v18;
          }

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v13);
    }

    objc_super v21 = +[NSDate date];
    BOOL v22 = [v12 compare:v21] == (id)-1;

    id v23 = sub_100004238();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v22)
    {
      if (v24) {
        sub_1002412B0();
      }

      objc_initWeak(&location, vala);
      long long v26 = [vala store_ops_queue];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000864BC;
      v30[3] = &unk_1002D93C8;
      objc_copyWeak(&v31, &location);
      dispatch_async(v26, v30);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v24) {
        sub_1002412E4();
      }

      id v25 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v12 serviceIdentifier:@"com.apple.icloud.findmydeviced.trackedLocationsPurgeTimer" target:vala selector:"_serialQueue_purgeOldTrackedLocationsNow" userInfo:0];
      [vala setLocationPurgeTimer:v25];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100086524;
      v29[3] = &unk_1002D9378;
      v29[4] = vala;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v29);
    }
  }
}

- (id)locationPurgeTimerXPCTransactionName
{
  return +[NSString stringWithFormat:@"TrackingLocationPurgeTimer-%lX", self];
}

- (void)_serialQueue_purgeOldTrackedLocationsNow
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10024138C();
  }

  id v4 = [(FMDTrackedLocationsStore *)self locationTracker];
  [v4 keepAlive];
  double v6 = v5;
  id v23 = v4;
  id v22 = [v4 maxLocations];
  id v25 = +[NSMutableArray array];
  BOOL v7 = +[NSDate date];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v24 = self;
  uint64_t v8 = [(FMDTrackedLocationsStore *)self trackedLocations];
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = [v13 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
        id v15 = [v14 timeStamp];
        v16 = [v15 dateByAddingTimeInterval:v6];
        if ([v16 compare:v7] == (id)1)
        {
          [v25 addObject:v13];
        }
        else
        {
          id v17 = sub_100004238();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Purging location with timestamp %@ since it was very old", buf, 0xCu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v10);
  }

  while ((uint64_t)[v25 count] > (uint64_t)v22)
  {
    id v18 = [v25 objectAtIndexedSubscript:0];
    dispatch_queue_t v19 = [v18 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
    uint64_t v20 = [v19 timeStamp];
    objc_super v21 = sub_100004238();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Purging location with timestamp %@ since there were too many locations", buf, 0xCu);
    }

    [v25 removeObjectAtIndex:0];
  }
  [(FMDTrackedLocationsStore *)v24 setTrackedLocations:v25];
  [(FMDTrackedLocationsStore *)v24 _serialQueue_scheduleLocationPurgeTimer];
}

- (void)_serialQueue_addTrackedLocationNow:(id)a3
{
  id v4 = a3;
  double v5 = [(FMDTrackedLocationsStore *)self trackedLocations];
  double v6 = [v5 lastObject];
  BOOL v7 = [v6 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
  id v9 = [v7 location];
  id v10 = [v8 location];

  uint64_t v11 = sub_100004238();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9 == v10)
  {
    if (v12)
    {
      *(_WORD *)objc_super v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New location does not have a better accuracy. Copying the new timestamp to the last location...", v21, 2u);
    }

    uint64_t v14 = [FMDLocation alloc];
    id v15 = [v7 location];
    id v13 = -[FMDLocation initWithLocation:eventType:positionType:](v14, "initWithLocation:eventType:positionType:", v15, [v7 eventType], [v7 positionType]);

    v16 = [(FMDTrackedLocationsStore *)self trackedLocations];
    id v17 = [v16 lastObject];
    id v18 = [v17 mutableCopy];

    [v18 setObject:v13 forKeyedSubscript:@"kFMDTrackedLocationsStoreTrackFMDLocation"];
    dispatch_queue_t v19 = [(FMDTrackedLocationsStore *)self trackedLocations];
    [v19 removeLastObject];

    uint64_t v20 = [(FMDTrackedLocationsStore *)self trackedLocations];
    [v20 addObject:v18];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New location. Recording this location...", buf, 2u);
    }

    id v13 = [(FMDTrackedLocationsStore *)self trackedLocations];
    [(FMDLocation *)v13 addObject:v4];
  }
}

- (FMDLocationTracker)locationTracker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationTracker);

  return (FMDLocationTracker *)WeakRetained;
}

- (void)setLocationTracker:(id)a3
{
}

- (NSMutableArray)trackedLocations
{
  return self->_trackedLocations;
}

- (void)setTrackedLocations:(id)a3
{
}

- (OS_dispatch_queue)store_ops_queue
{
  return self->_store_ops_queue;
}

- (void)setStore_ops_queue:(id)a3
{
}

- (PCPersistentTimer)locationPurgeTimer
{
  return self->_locationPurgeTimer;
}

- (void)setLocationPurgeTimer:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_locationPurgeTimer, 0);
  objc_storeStrong((id *)&self->_store_ops_queue, 0);
  objc_storeStrong((id *)&self->_trackedLocations, 0);

  objc_destroyWeak((id *)&self->_locationTracker);
}

@end