@interface VLFSessionLocationHorizontalAccuracyMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (MKLocationManager)locationManager;
- (NSString)debugDescription;
- (VLFSessionLocationHorizontalAccuracyMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (void)_updateStateWithLocation:(id)a3;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setLocationManager:(id)a3;
@end

@implementation VLFSessionLocationHorizontalAccuracyMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationHorizontalAccuracyMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationHorizontalAccuracyMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (VLFSessionLocationHorizontalAccuracyMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionLocationHorizontalAccuracyMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionLocationHorizontalAccuracyMonitor.m";
      __int16 v24 = 1024;
      int v25 = 35;
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
      v21 = "-[VLFSessionLocationHorizontalAccuracyMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionLocationHorizontalAccuracyMonitor.m";
      __int16 v24 = 1024;
      int v25 = 36;
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
  v19.super_class = (Class)VLFSessionLocationHorizontalAccuracyMonitor;
  v8 = [(VLFSessionMonitor *)&v19 initWithObserver:v6];
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    [*p_locationManager listenForLocationUpdates:v9];
    v11 = [*p_locationManager lastLocation];
    [(VLFSessionLocationHorizontalAccuracyMonitor *)v9 _updateStateWithLocation:v11];
  }
  return v9;
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4 = a3;
  v5 = sub_1000414A8();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      [v4 horizontalAccuracy];
      int v23 = 134283521;
      uint64_t v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Got location with horizontal accuracy: %{private}f", (uint8_t *)&v23, 0xCu);
    }

    [v4 horizontalAccuracy];
    double v9 = v8;
    +[VLLocalizer maximumHorizontalAccuracyThreshold];
    double v11 = v10;
    int64_t v12 = [(VLFSessionMonitor *)self state];
    if (v9 <= v11)
    {
      if (v12 != 2)
      {
        objc_super v19 = sub_1000414A8();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          [v4 horizontalAccuracy];
          uint64_t v21 = v20;
          +[VLLocalizer maximumHorizontalAccuracyThreshold];
          int v23 = 134283777;
          uint64_t v24 = v21;
          __int16 v25 = 2049;
          uint64_t v26 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Horizontal accuracy (%{private}f) is lower than the maximum threshold (%{private}f); updating state",
            (uint8_t *)&v23,
            0x16u);
        }
      }
      v17 = self;
      uint64_t v18 = 2;
    }
    else
    {
      if (v12)
      {
        v13 = sub_1000414A8();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          [v4 horizontalAccuracy];
          uint64_t v15 = v14;
          +[VLLocalizer maximumHorizontalAccuracyThreshold];
          int v23 = 134283777;
          uint64_t v24 = v15;
          __int16 v25 = 2049;
          uint64_t v26 = v16;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Horizontal accuracy (%{private}f) is higher than the maximum threshold (%{private}f); updating state",
            (uint8_t *)&v23,
            0x16u);
        }
      }
      v17 = self;
      uint64_t v18 = 0;
    }
    [(VLFSessionMonitor *)v17 setState:v18];
  }
  else
  {
    if (v6)
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring",
        (uint8_t *)&v23,
        2u);
    }
  }
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  [(MKLocationManager *)self->_locationManager stopListeningForLocationUpdates:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionLocationHorizontalAccuracyMonitor;
  [(VLFSessionLocationHorizontalAccuracyMonitor *)&v3 dealloc];
}

- (NSString)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([(id)objc_opt_class() isEnabled]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  BOOL v6 = v5;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  double v8 = v7;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    double v9 = @"YES";
  }
  else {
    double v9 = @"NO";
  }
  double v10 = v9;
  int64_t v11 = [(VLFSessionMonitor *)self state];
  CFStringRef v12 = @"Hide";
  if (v11 == 1) {
    CFStringRef v12 = @"EnablePuck";
  }
  if (v11 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  else {
    CFStringRef v13 = v12;
  }
  uint64_t v14 = [(VLFSessionLocationHorizontalAccuracyMonitor *)self locationManager];
  uint64_t v15 = [v14 lastLocation];
  [v15 horizontalAccuracy];
  uint64_t v17 = v16;
  +[VLLocalizer maximumHorizontalAccuracyThreshold];
  objc_super v19 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, currentHorizontalAccuracy: %f, threshold: %f>", v4, v6, v8, v10, v13, v17, v18];

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
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        CFStringRef v13 = "-[VLFSessionLocationHorizontalAccuracyMonitor locationManagerUpdatedLocation:]";
        __int16 v14 = 2080;
        uint64_t v15 = "VLFSessionLocationHorizontalAccuracyMonitor.m";
        __int16 v16 = 1024;
        int v17 = 116;
        __int16 v18 = 2080;
        objc_super v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        uint64_t v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        double v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int64_t v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          CFStringRef v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  double v8 = [v4 lastLocation];
  [(VLFSessionLocationHorizontalAccuracyMonitor *)self _updateStateWithLocation:v8];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end