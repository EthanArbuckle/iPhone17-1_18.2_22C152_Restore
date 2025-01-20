@interface VLFSessionHistoricalLocationAccuracyMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (MKLocationManager)locationManager;
- (MapsRingBuffer)historicalLocationAccuracies;
- (NSString)debugDescription;
- (VLFSessionHistoricalLocationAccuracyMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (void)_updateStateWithLocation:(id)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setHistoricalLocationAccuracies:(id)a3;
- (void)setLocationManager:(id)a3;
@end

@implementation VLFSessionHistoricalLocationAccuracyMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionHistoricalLocationAccuracyMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionHistoricalLocationAccuracyMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (VLFSessionHistoricalLocationAccuracyMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionHistoricalLocationAccuracyMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionHistoricalLocationAccuracyMonitor.m";
      __int16 v24 = 1024;
      int v25 = 37;
      __int16 v26 = 2080;
      v27 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionHistoricalLocationAccuracyMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionHistoricalLocationAccuracyMonitor.m";
      __int16 v24 = 1024;
      int v25 = 38;
      __int16 v26 = 2080;
      v27 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)VLFSessionHistoricalLocationAccuracyMonitor;
  v8 = [(VLFSessionMonitor *)&v19 initWithObserver:v6];
  if (v8)
  {
    v9 = [[MapsRingBuffer alloc] initWithLength:GEOConfigGetUInteger()];
    historicalLocationAccuracies = v8->_historicalLocationAccuracies;
    v8->_historicalLocationAccuracies = v9;

    objc_storeStrong((id *)&v8->_locationManager, a4);
    [(MKLocationManager *)v8->_locationManager listenForLocationUpdates:v8];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v8 selector:"applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v8;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  [(MKLocationManager *)self->_locationManager stopListeningForLocationUpdates:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionHistoricalLocationAccuracyMonitor;
  [(VLFSessionHistoricalLocationAccuracyMonitor *)&v3 dealloc];
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4 = a3;
  v5 = sub_10055D158();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v6)
  {
    [v4 horizontalAccuracy];
    *(_DWORD *)buf = 134283521;
    double v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Got location with horizontal accuracy: %{private}f", buf, 0xCu);
  }

  v8 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  [v4 horizontalAccuracy];
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v8 push:v9];

  v10 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  id v11 = [v10 count];
  v12 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  id v13 = [v12 length];

  if (v11 < v13)
  {
    v5 = sub_10055D158();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v14 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
      double v15 = COERCE_DOUBLE([v14 count]);
      v16 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
      double v17 = COERCE_DOUBLE([v16 length]);
      *(_DWORD *)buf = 134218240;
      double v35 = v15;
      __int16 v36 = 2048;
      double v37 = v17;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Still waiting for more location updates; got %lu/%lu",
        buf,
        0x16u);
    }
LABEL_23:

    goto LABEL_24;
  }
  GEOConfigGetDouble();
  double v19 = v18;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  id v20 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v5);
        }
        __int16 v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v24 doubleValue];
        if (v25 < v19)
        {
          v27 = sub_10055D158();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            [v24 doubleValue];
            *(_DWORD *)buf = 134283777;
            double v35 = v28;
            __int16 v36 = 2049;
            double v37 = v19;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Found a historical location with less than the minimum required horizontal accuracy (%{private}f)|(%{private}f)", buf, 0x16u);
          }

          [(VLFSessionMonitor *)self setState:0];
          goto LABEL_23;
        }
      }
      id v21 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  __int16 v26 = sub_10055D158();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283521;
    double v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "All historical locations satisfy the minimum required horizontal accuracy (%{private}f)", buf, 0xCu);
  }

  [(VLFSessionMonitor *)self setState:2];
LABEL_24:
}

- (NSString)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v21 = NSStringFromClass(v3);
  if ([(id)objc_opt_class() isEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  double v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  int64_t v10 = [(VLFSessionMonitor *)self state];
  CFStringRef v11 = @"Hide";
  if (v10 == 1) {
    CFStringRef v11 = @"EnablePuck";
  }
  if (v10 == 2) {
    CFStringRef v12 = @"EnablePuckAndBanner";
  }
  else {
    CFStringRef v12 = v11;
  }
  id v13 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  id v14 = [v13 count];
  double v15 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  id v16 = [v15 length];
  double v17 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  double v18 = [v17 debugDescription];
  double v19 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, historicalLocationAccuraciesCount: %lu, historicalLocationAccuraciesRequired: %lu, historicalLocationAccuracies: %@>", v21, v5, v7, v9, v12, v14, v16, v18];

  return (NSString *)v19;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        id v13 = "-[VLFSessionHistoricalLocationAccuracyMonitor locationManagerUpdatedLocation:]";
        __int16 v14 = 2080;
        double v15 = "VLFSessionHistoricalLocationAccuracyMonitor.m";
        __int16 v16 = 1024;
        int v17 = 126;
        __int16 v18 = 2080;
        double v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        id v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int64_t v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          id v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  v8 = [v4 lastLocation];
  [(VLFSessionHistoricalLocationAccuracyMonitor *)self _updateStateWithLocation:v8];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = sub_10055D158();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "App backgrounded; clearing historical locations",
      v6,
      2u);
  }

  v5 = [(VLFSessionHistoricalLocationAccuracyMonitor *)self historicalLocationAccuracies];
  [v5 removeAllObjects];

  [(VLFSessionMonitor *)self setState:0];
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (MapsRingBuffer)historicalLocationAccuracies
{
  return self->_historicalLocationAccuracies;
}

- (void)setHistoricalLocationAccuracies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalLocationAccuracies, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end