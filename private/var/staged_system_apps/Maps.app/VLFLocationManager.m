@interface VLFLocationManager
+ (VLFLocationManager)sharedLocationManager;
- (CLLocation)lastLocation;
- (CLLocationManager)locationManager;
- (GCDTimer)stopLocationUpdatesTimer;
- (GEOObserverHashTable)observers;
- (VLFLocationManager)init;
- (void)_stopLocationUpdatesFromTimer;
- (void)addObserver:(id)a3;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStopLocationUpdatesTimer:(id)a3;
@end

@implementation VLFLocationManager

- (CLLocation)lastLocation
{
  p_lastLocationLock = &self->_lastLocationLock;
  os_unfair_lock_lock(&self->_lastLocationLock);
  v4 = self->_lastLocation;
  os_unfair_lock_unlock(p_lastLocationLock);

  return v4;
}

- (VLFLocationManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VLFLocationManager;
  v2 = [(VLFLocationManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_observingLock._os_unfair_lock_opaque = 0;
    v4 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) _initWithDelegate:v2 onQueue:&_dispatch_main_q];
    locationManager = v3->_locationManager;
    v3->_locationManager = v4;

    [(CLLocationManager *)v3->_locationManager _setFusionInfoEnabled:1];
    [(CLLocationManager *)v3->_locationManager setDesiredAccuracy:kCLLocationAccuracyLeech];
    v6 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___VLFLocationManagerDelegate queue:&_dispatch_main_q];
    observers = v3->_observers;
    v3->_observers = v6;
  }
  return v3;
}

+ (VLFLocationManager)sharedLocationManager
{
  if (qword_101610320 != -1) {
    dispatch_once(&qword_101610320, &stru_101313298);
  }
  v2 = (void *)qword_101610318;

  return (VLFLocationManager *)v2;
}

- (void)addObserver:(id)a3
{
  v4 = (char *)a3;
  if (v4)
  {
    v5 = sub_1009BF148();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      int v20 = 138412546;
      v21 = v7;
      __int16 v22 = 2048;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Adding observer: <%@: %p>", (uint8_t *)&v20, 0x16u);
    }
    os_unfair_lock_lock(&self->_observingLock);
    v8 = [(VLFLocationManager *)self observers];
    unsigned int v9 = [v8 hasObservers];

    v10 = [(VLFLocationManager *)self observers];
    [v10 registerObserver:v4];

    v11 = [(VLFLocationManager *)self observers];
    unsigned int v12 = [v11 hasObservers];

    v13 = [(VLFLocationManager *)self stopLocationUpdatesTimer];

    [(VLFLocationManager *)self setStopLocationUpdatesTimer:0];
    if (v9 != v12)
    {
      v14 = sub_1009BF148();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v15)
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got the first observer but the location disable timer never fired; keeping location updates going",
            (uint8_t *)&v20,
            2u);
        }
      }
      else
      {
        if (v15)
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got the first observer; start updating location",
            (uint8_t *)&v20,
            2u);
        }

        v14 = [(VLFLocationManager *)self locationManager];
        [v14 startUpdatingLocation];
      }
    }
    os_unfair_lock_unlock(&self->_observingLock);
  }
  else
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315906;
      v21 = "-[VLFLocationManager addObserver:]";
      __int16 v22 = 2080;
      v23 = "VLFLocationManager.m";
      __int16 v24 = 1024;
      int v25 = 91;
      __int16 v26 = 2080;
      v27 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v20, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = +[NSThread callStackSymbols];
        int v20 = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
      }
    }
    v19 = sub_1009BF148();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Observer should not be nil", (uint8_t *)&v20, 2u);
    }
  }
}

- (void)removeObserver:(id)a3
{
  v4 = (char *)a3;
  if (v4)
  {
    v5 = sub_1009BF148();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v7;
      __int16 v24 = 2048;
      int v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Removing observer: <%@: %p>", buf, 0x16u);
    }
    os_unfair_lock_lock(&self->_observingLock);
    v8 = [(VLFLocationManager *)self observers];
    unsigned int v9 = [v8 hasObservers];

    v10 = [(VLFLocationManager *)self observers];
    [v10 unregisterObserver:v4];

    v11 = [(VLFLocationManager *)self observers];
    unsigned int v12 = [v11 hasObservers];

    if (v9 != v12)
    {
      v13 = sub_1009BF148();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Removed the last observer; starting the location update disable timer",
          buf,
          2u);
      }

      objc_initWeak((id *)buf, self);
      id v14 = &_dispatch_main_q;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1009BF560;
      v20[3] = &unk_1012E7638;
      objc_copyWeak(&v21, (id *)buf);
      BOOL v15 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v20 block:5.0];
      [(VLFLocationManager *)self setStopLocationUpdatesTimer:v15];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
    os_unfair_lock_unlock(&self->_observingLock);
  }
  else
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "-[VLFLocationManager removeObserver:]";
      __int16 v24 = 2080;
      int v25 = "VLFLocationManager.m";
      __int16 v26 = 1024;
      int v27 = 122;
      __int16 v28 = 2080;
      v29 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v19 = sub_1009BF148();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Observer should not be nil", buf, 2u);
    }
  }
}

- (void)_stopLocationUpdatesFromTimer
{
  p_observingLock = &self->_observingLock;
  os_unfair_lock_lock(&self->_observingLock);
  v4 = [(VLFLocationManager *)self stopLocationUpdatesTimer];

  if (v4)
  {
    [(VLFLocationManager *)self setStopLocationUpdatesTimer:0];
    v5 = [(VLFLocationManager *)self locationManager];
    [v5 stopUpdatingLocation];
  }

  os_unfair_lock_unlock(p_observingLock);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      __int16 v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        v35 = "-[VLFLocationManager locationManager:didUpdateLocations:]";
        __int16 v36 = 2080;
        v37 = "VLFLocationManager.m";
        __int16 v38 = 1024;
        int v39 = 164;
        __int16 v40 = 2080;
        v41 = "dispatch_get_main_queue()";
        __int16 v42 = 2080;
        v43 = v23;
        __int16 v44 = 2080;
        v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v25 = sub_1005762E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v35 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ([v7 count])
  {
    id v27 = v7;
    id v28 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v17 = sub_1009BF148();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v18 = [v16 isCoordinateFused];
            *(_DWORD *)buf = 138478083;
            v19 = @"NO";
            if (v18) {
              v19 = @"YES";
            }
            v35 = (const char *)v16;
            __int16 v36 = 2113;
            v37 = (const char *)v19;
            int v20 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Got a location update: %{private}@; fused: %{private}@",
              buf,
              0x16u);
          }
          os_unfair_lock_lock(&self->_lastLocationLock);
          objc_storeStrong((id *)&self->_lastLocation, v16);
          os_unfair_lock_unlock(&self->_lastLocationLock);
          id v21 = [(VLFLocationManager *)self observers];
          [v21 locationManager:self didUpdateLocation:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    id v7 = v27;
    id v6 = v28;
  }
}

- (void)setLastLocation:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (GCDTimer)stopLocationUpdatesTimer
{
  return self->_stopLocationUpdatesTimer;
}

- (void)setStopLocationUpdatesTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopLocationUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_lastLocation, 0);
}

@end