@interface NavdLocationLeecher
+ (id)sharedLeecher;
- (BOOL)coarseModeEnabled;
- (NSArray)leechedLocations;
- (NavdLocationLeecher)init;
- (id)lastLeechedLocation;
- (void)_clearLeachedLocations;
- (void)_handleLeechedLocation:(id)a3;
- (void)_handleShiftedCoordinate:(id)a3 fromClientLocation:(id *)a4;
- (void)_notifyObserversAboutError:(id)a3;
- (void)_notifyObserversAboutLocation:(id)a3;
- (void)_notifyObserversAboutPrecision;
- (void)_pruneLeachedLocations;
- (void)_recordLeechedLocation:(id)a3;
- (void)addObserver:(id)a3;
- (void)locationProvider:(id)a3 didChangeCoarseMode:(BOOL)a4;
- (void)locationProvider:(id)a3 didReceiveError:(id)a4;
- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4;
- (void)pauseLeeching;
- (void)removeObserver:(id)a3;
- (void)resumeLeeching;
- (void)startLeeching;
- (void)stopLeeching;
@end

@implementation NavdLocationLeecher

+ (id)sharedLeecher
{
  if (qword_10160E9D8 != -1) {
    dispatch_once(&qword_10160E9D8, &stru_1012E6798);
  }
  v2 = (void *)qword_10160E9D0;

  return v2;
}

- (NavdLocationLeecher)init
{
  v20.receiver = self;
  v20.super_class = (Class)NavdLocationLeecher;
  v2 = [(NavdLocationLeecher *)&v20 init];
  if (v2)
  {
    v3 = (GEOLocationShifter *)objc_alloc_init((Class)GEOLocationShifter);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("NavdLocationLeecher", v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v2->_observers;
    v2->_observers = v8;

    uint64_t v10 = +[MNHybridLocationProvider navdInstance];
    locationProvider = v2->_locationProvider;
    v2->_locationProvider = (NavdLocationProvider *)v10;

    [(NavdLocationProvider *)v2->_locationProvider setDelegate:v2];
    id v12 = objc_alloc((Class)NSMutableArray);
    v13 = +[GEONavdDefaults sharedInstance];
    v14 = (NSMutableArray *)objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "maximumNumberOfLeechedLocations"));
    leechedLocations = v2->_leechedLocations;
    v2->_leechedLocations = v14;

    uint64_t v16 = +[NSDate distantPast];
    lastRecordDate = v2->_lastRecordDate;
    v2->_lastRecordDate = (NSDate *)v16;

    GEOConfigGetDouble();
    v2->_maxLeechingTimeInterval = v18;
  }
  return v2;
}

- (void)startLeeching
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037B4C4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)pauseLeeching
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037B5D0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)resumeLeeching
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037B6D4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)stopLeeching
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037B7D4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)_pruneLeachedLocations
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  v5 = 0;
  do
  {
    dispatch_queue_t v6 = (char *)[(NSMutableArray *)self->_leechedLocations count];
    if (v4 < (unint64_t)v6)
    {
      v7 = v6;
      v5 = (char *)v4;
      while (1)
      {
        v8 = [(NSMutableArray *)self->_leechedLocations objectAtIndexedSubscript:v5];
        v9 = [v8 timestamp];
        [v9 timeIntervalSinceNow];
        double v11 = -v10;
        double v12 = dbl_100F6EF40[2 * v3];

        if (v12 <= v11) {
          break;
        }
        if (v7 == ++v5)
        {
          v5 = v7;
          break;
        }
      }
    }
    v13 = *(char **)&dbl_100F6EF40[2 * v3 + 1];
    unint64_t v14 = (unint64_t)&v5[-v4];
    if (&v5[-v4] > v13)
    {
      do
      {
        [(NSMutableArray *)self->_leechedLocations removeObjectAtIndex:v4];
        --v14;
      }
      while (v14 > (unint64_t)v13);
      v5 = &v13[v4];
    }
    ++v3;
    unint64_t v4 = (unint64_t)v5;
  }
  while (v3 != 5);
}

- (void)_clearLeachedLocations
{
}

- (void)_recordLeechedLocation:(id)a3
{
  id v5 = a3;
  dispatch_queue_t v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_lastLeechedLocation, a3);
  objc_sync_exit(v6);

  serialQueue = v6->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10037BA40;
  v9[3] = &unk_1012E5D58;
  id v10 = v5;
  double v11 = v6;
  id v8 = v5;
  dispatch_async(serialQueue, v9);
}

- (id)lastLeechedLocation
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(CLLocation *)v2->_lastLeechedLocation copy];
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)leechedLocations
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100103AFC;
  id v10 = sub_100104608;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10037BC44;
  v5[3] = &unk_1012E67C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (BOOL)coarseModeEnabled
{
  return [(NavdLocationProvider *)self->_locationProvider coarseModeEnabled];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10037BD38;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10037BDDC;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)_notifyObserversAboutLocation:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) locationLeecher:self receivedLocation:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversAboutError:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) locationLeecher:self errorLeechingLocation:v4 v10];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversAboutPrecision
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_observers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 locationLeecher:self didChangeCoarseMode:[self coarseModeEnabled]];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_handleLeechedLocation:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  double v6 = v5;
  [v4 coordinate];
  double v8 = v7;
  long long v32 = 0u;
  memset(v33, 0, 28);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  if (v4) {
    [v4 clientLocation];
  }
  objc_initWeak(&location, self);
  locationShifter = self->_locationShifter;
  [v4 horizontalAccuracy];
  double v11 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10037C318;
  v13[3] = &unk_1012E67E8;
  objc_copyWeak(&v14, &location);
  long long v21 = v31;
  long long v22 = v32;
  v23[0] = v33[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v33 + 12);
  long long v17 = v27;
  long long v18 = v28;
  long long v19 = v29;
  long long v20 = v30;
  long long v15 = v25;
  long long v16 = v26;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10037C3B0;
  v12[3] = &unk_1012E6808;
  *(double *)&v12[4] = v6;
  *(double *)&v12[5] = v8;
  -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v13, 0, v12, self->_serialQueue, v6, v8, v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_handleShiftedCoordinate:(id)a3 fromClientLocation:(id *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (vabdd_f64(a3.var0, *(double *)(&a4->var0 + 1)) >= 0.00000000999999994
    || vabdd_f64(a3.var1, *(double *)((char *)&a4->var1.var0 + 4)) >= 0.00000000999999994)
  {
    double v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(&a4->var0 + 1);
      uint64_t v10 = *(void *)((char *)&a4->var1.var0 + 4);
      *(_DWORD *)long long v17 = 134284289;
      *(double *)&v17[4] = var0;
      *(_WORD *)&v17[12] = 2049;
      *(double *)&v17[14] = var1;
      *(_WORD *)&v17[22] = 2049;
      *(void *)&v17[24] = v9;
      LOWORD(v18) = 2049;
      *(void *)((char *)&v18 + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "NavdLocationLeecher notifying observers with shifted location:%{private}f, %{private}f. Original location was: %{private}f, %{private}f.", v17, 0x2Au);
    }
  }
  id v11 = objc_alloc((Class)CLLocation);
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a4->var13;
  long long v22 = *(_OWORD *)&a4->var11;
  $F24F406B2B787EFB06265DBA3D28CBD5 v23 = var13;
  v24[0] = *(_OWORD *)&a4->var14;
  *(_OWORD *)((char *)v24 + 12) = *(_OWORD *)&a4->var16;
  long long v13 = *(_OWORD *)&a4->var5;
  long long v18 = *(_OWORD *)&a4->var3;
  long long v19 = v13;
  long long v14 = *(_OWORD *)&a4->var9;
  long long v20 = *(_OWORD *)&a4->var7;
  long long v21 = v14;
  long long v15 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)long long v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&v17[16] = v15;
  id v16 = [v11 initWithClientLocation:v17];
  [(NavdLocationLeecher *)self _recordLeechedLocation:v16];
  if (!self->_leechingPaused) {
    [(NavdLocationLeecher *)self _notifyObserversAboutLocation:v16];
  }
}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  id v5 = a4;
  if ([(NavdLocationLeecher *)self coarseModeEnabled])
  {
    double v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      double v7 = "Dropping location since coarse mode is enabled";
      double v8 = v6;
      uint32_t v9 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v7, buf, v9);
    }
  }
  else
  {
    [(NSDate *)self->_lastRecordDate timeIntervalSinceNow];
    double v11 = -v10;
    if (self->_maxLeechingTimeInterval <= -v10)
    {
      long long v13 = +[NSDate date];
      lastRecordDate = self->_lastRecordDate;
      self->_lastRecordDate = v13;

      objc_initWeak((id *)buf, self);
      serialQueue = self->_serialQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10037C838;
      v16[3] = &unk_1012E6690;
      objc_copyWeak(&v18, (id *)buf);
      id v17 = v5;
      dispatch_async(serialQueue, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      goto LABEL_10;
    }
    double v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      GEOConfigGetDouble();
      *(_DWORD *)buf = 134218240;
      double v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = v12;
      double v7 = "Dropping location since time elapsed since last leeched location is %f < %f";
      double v8 = v6;
      uint32_t v9 = 22;
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint32_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138478083;
    id v17 = v10;
    __int16 v18 = 2113;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{private}@ failed while leeching with error: %{private}@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10037CA24;
  v13[3] = &unk_1012E6690;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v7;
  id v12 = v7;
  dispatch_async(serialQueue, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)locationProvider:(id)a3 didChangeCoarseMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    double v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    double v10 = (void *)v9;
    CFStringRef v11 = @"disabled";
    if (v4) {
      CFStringRef v11 = @"enabled";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    CFStringRef v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ coarse mode is now %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10037CC10;
  v13[3] = &unk_1012E6830;
  BOOL v15 = v4;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_async(serialQueue, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecordDate, 0);
  objc_storeStrong((id *)&self->_leechedLocations, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lastLeechedLocation, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end