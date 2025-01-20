@interface VLFSessionLocationOutdoorMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)_satisfiesConsecutiveProbabilitiesForOutdoor:(BOOL)a3;
- (MapsRingBuffer)historicalLocations;
- (NSString)debugDescription;
- (VLFLocationManager)locationManager;
- (VLFSessionLocationOutdoorMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (double)confidenceThreshold;
- (unint64_t)consecutiveIndoorCount;
- (unint64_t)consecutiveOutdoorCount;
- (void)_flipState;
- (void)_updateStateWithLocation:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocation:(id)a4;
- (void)setHistoricalLocations:(id)a3;
- (void)setLocationManager:(id)a3;
@end

@implementation VLFSessionLocationOutdoorMonitor

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (VLFSessionLocationOutdoorMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFSessionLocationOutdoorMonitor initWithObserver:locationManager:]";
      __int16 v27 = 2080;
      v28 = "VLFSessionLocationOutdoorMonitor.m";
      __int16 v29 = 1024;
      int v30 = 49;
      __int16 v31 = 2080;
      v32 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFSessionLocationOutdoorMonitor initWithObserver:locationManager:]";
      __int16 v27 = 2080;
      v28 = "VLFSessionLocationOutdoorMonitor.m";
      __int16 v29 = 1024;
      int v30 = 50;
      __int16 v31 = 2080;
      v32 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)VLFSessionLocationOutdoorMonitor;
  v8 = [(VLFSessionMonitor *)&v24 initWithObserver:v6];
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    [*p_locationManager addObserver:v9];
    v11 = [MapsRingBuffer alloc];
    id v12 = [(VLFSessionLocationOutdoorMonitor *)v9 consecutiveOutdoorCount];
    if (v12 <= (id)[(VLFSessionLocationOutdoorMonitor *)v9 consecutiveIndoorCount]) {
      id v13 = [(VLFSessionLocationOutdoorMonitor *)v9 consecutiveIndoorCount];
    }
    else {
      id v13 = [(VLFSessionLocationOutdoorMonitor *)v9 consecutiveOutdoorCount];
    }
    v14 = [(MapsRingBuffer *)v11 initWithLength:v13];
    historicalLocations = v9->_historicalLocations;
    v9->_historicalLocations = v14;

    v16 = [*p_locationManager lastLocation];
    [(VLFSessionLocationOutdoorMonitor *)v9 _updateStateWithLocation:v16];
  }
  return v9;
}

- (void)dealloc
{
  [(VLFLocationManager *)self->_locationManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionLocationOutdoorMonitor;
  [(VLFSessionLocationOutdoorMonitor *)&v3 dealloc];
}

- (double)confidenceThreshold
{
  GEOConfigGetDouble();
  return result;
}

- (unint64_t)consecutiveOutdoorCount
{
  return GEOConfigGetUInteger();
}

- (unint64_t)consecutiveIndoorCount
{
  return GEOConfigGetUInteger();
}

- (BOOL)_satisfiesConsecutiveProbabilitiesForOutdoor:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    unint64_t v5 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveOutdoorCount];
  }
  else {
    unint64_t v5 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveIndoorCount];
  }
  unint64_t v6 = v5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(VLFSessionLocationOutdoorMonitor *)self historicalLocations];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v3)
        {
          [v13 probabilityPositionContextStateOutdoor];
          double v15 = v14;
        }
        else
        {
          [v13 probabilityPositionContextStateIndoor];
          double v15 = v16;
          if (fabs(v16 + 1.0) <= 2.22044605e-16)
          {
            v17 = sub_10098A88C();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v21[0] = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Got a -1 probability while checking indoor; counting it as 1.0",
                (uint8_t *)v21,
                2u);
            }

            double v15 = 1.0;
          }
        }
        [(VLFSessionLocationOutdoorMonitor *)self confidenceThreshold];
        if (v15 >= v18) {
          ++v10;
        }
        else {
          unint64_t v10 = 0;
        }
        if (v10 >= v6)
        {
          BOOL v19 = 1;
          goto LABEL_23;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

- (void)_flipState
{
  BOOL v3 = sub_10098A88C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int64_t v4 = [(VLFSessionMonitor *)self state];
    CFStringRef v5 = @"Hide";
    if (v4 == 1) {
      CFStringRef v5 = @"EnablePuck";
    }
    if (v4 == 2) {
      CFStringRef v5 = @"EnablePuckAndBanner";
    }
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Flipping current state: %@", (uint8_t *)&v6, 0xCu);
  }

  [(VLFSessionMonitor *)self setState:2 * ([(VLFSessionMonitor *)self state] == 0)];
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  int v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v24 = 136316418;
        long long v25 = "-[VLFSessionLocationOutdoorMonitor _updateStateWithLocation:]";
        __int16 v26 = 2080;
        __int16 v27 = "VLFSessionLocationOutdoorMonitor.m";
        __int16 v28 = 1024;
        int v29 = 131;
        __int16 v30 = 2080;
        __int16 v31 = "dispatch_get_main_queue()";
        __int16 v32 = 2080;
        v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v34 = 2080;
        v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v24,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        long long v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          long long v23 = +[NSThread callStackSymbols];
          int v24 = 138412290;
          long long v25 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);
        }
      }
    }
  }
  if (!v4)
  {
    id v13 = sub_10098A88C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      double v14 = "Got nil location; ignoring";
      double v15 = v13;
      uint32_t v16 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v24, v16);
    }
LABEL_17:

    goto LABEL_18;
  }
  id v8 = [(VLFSessionLocationOutdoorMonitor *)self historicalLocations];
  [v8 push:v4];

  id v9 = [(VLFSessionLocationOutdoorMonitor *)self historicalLocations];
  unint64_t v10 = (const char *)[v9 count];

  unint64_t v11 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveOutdoorCount];
  if (v11 >= [(VLFSessionLocationOutdoorMonitor *)self consecutiveIndoorCount]) {
    unint64_t v12 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveIndoorCount];
  }
  else {
    unint64_t v12 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveOutdoorCount];
  }
  v17 = (const char *)v12;
  if ((unint64_t)v10 < v12)
  {
    id v13 = sub_10098A88C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 134218240;
      long long v25 = v10;
      __int16 v26 = 2048;
      __int16 v27 = v17;
      double v14 = "Still waiting for more location updates; got %lu/%lu";
      double v15 = v13;
      uint32_t v16 = 22;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  int64_t v18 = [(VLFSessionMonitor *)self state];
  if ([(VLFSessionLocationOutdoorMonitor *)self _satisfiesConsecutiveProbabilitiesForOutdoor:v18 == 0])
  {
    BOOL v19 = sub_10098A88C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      CFStringRef v20 = @"indoor";
      if (!v18) {
        CFStringRef v20 = @"outdoor";
      }
      int v24 = 138412290;
      long long v25 = (const char *)v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Current location history satisfies requirements for %@; flipping state",
        (uint8_t *)&v24,
        0xCu);
    }

    [(VLFSessionLocationOutdoorMonitor *)self _flipState];
  }
LABEL_18:
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationOutdoorMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationOutdoorMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (NSString)debugDescription
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  long long v23 = NSStringFromClass(v3);
  if ([(id)objc_opt_class() isEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  CFStringRef v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    int v6 = @"YES";
  }
  else {
    int v6 = @"NO";
  }
  BOOL v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  id v9 = v8;
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
  [(VLFSessionLocationOutdoorMonitor *)self confidenceThreshold];
  uint64_t v14 = v13;
  unint64_t v15 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveOutdoorCount];
  unint64_t v16 = [(VLFSessionLocationOutdoorMonitor *)self consecutiveIndoorCount];
  v17 = [(VLFSessionLocationOutdoorMonitor *)self historicalLocations];
  int64_t v18 = sub_100099700(v17, &stru_101312518);
  BOOL v19 = [v18 reverseObjectEnumerator];
  CFStringRef v20 = [v19 allObjects];
  v21 = +[NSString stringWithFormat:@"<%@\nisEnabled: %@,\naffectsPuckVisibility: %@,\naffectsBannerVisibility: %@,\ncurrentState: %@,\nthreshold: %f,\noutdoor consecutive: %lu,\nindoor consecutive: %lu,\nlocations: %@>", v23, v5, v7, v9, v12, v14, v15, v16, v20];

  return (NSString *)v21;
}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      CFStringRef v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        unint64_t v15 = "-[VLFSessionLocationOutdoorMonitor locationManager:didUpdateLocation:]";
        __int16 v16 = 2080;
        v17 = "VLFSessionLocationOutdoorMonitor.m";
        __int16 v18 = 1024;
        int v19 = 187;
        __int16 v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        long long v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        long long v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        CFStringRef v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          unint64_t v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  [(VLFSessionLocationOutdoorMonitor *)self _updateStateWithLocation:v7];
}

- (VLFLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (MapsRingBuffer)historicalLocations
{
  return self->_historicalLocations;
}

- (void)setHistoricalLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalLocations, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end