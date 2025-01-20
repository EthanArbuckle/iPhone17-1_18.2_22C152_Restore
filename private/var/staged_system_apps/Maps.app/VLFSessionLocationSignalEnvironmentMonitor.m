@interface VLFSessionLocationSignalEnvironmentMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (NSSet)allowedLocationSignalEnvironments;
- (NSString)debugDescription;
- (VLFLocationManager)locationManager;
- (VLFSessionLocationSignalEnvironmentMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (void)_buildAllowedLocationSignalEnvironments;
- (void)_updateStateWithLocation:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocation:(id)a4;
- (void)setAllowedLocationSignalEnvironments:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation VLFSessionLocationSignalEnvironmentMonitor

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (VLFSessionLocationSignalEnvironmentMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionLocationSignalEnvironmentMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionLocationSignalEnvironmentMonitor.m";
      __int16 v24 = 1024;
      int v25 = 46;
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
      v21 = "-[VLFSessionLocationSignalEnvironmentMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionLocationSignalEnvironmentMonitor.m";
      __int16 v24 = 1024;
      int v25 = 47;
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
  v19.super_class = (Class)VLFSessionLocationSignalEnvironmentMonitor;
  v8 = [(VLFSessionMonitor *)&v19 initWithObserver:v6];
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    [*p_locationManager addObserver:v9];
    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();

    _GEOConfigAddDelegateListenerForKey();
    [(VLFSessionLocationSignalEnvironmentMonitor *)v9 _buildAllowedLocationSignalEnvironments];
    v11 = [*p_locationManager lastLocation];
    [(VLFSessionLocationSignalEnvironmentMonitor *)v9 _updateStateWithLocation:v11];
  }
  return v9;
}

- (void)dealloc
{
  [(VLFLocationManager *)self->_locationManager removeObserver:self];
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionLocationSignalEnvironmentMonitor;
  [(VLFSessionLocationSignalEnvironmentMonitor *)&v3 dealloc];
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v28 = sub_1005762E4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v31 = 136316418;
        *(void *)v32 = "-[VLFSessionLocationSignalEnvironmentMonitor _updateStateWithLocation:]";
        *(_WORD *)&v32[8] = 2080;
        *(void *)&v32[10] = "VLFSessionLocationSignalEnvironmentMonitor.m";
        *(_WORD *)&v32[18] = 1024;
        *(_DWORD *)&v32[20] = 85;
        __int16 v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        __int16 v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v31,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v29 = sub_1005762E4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = +[NSThread callStackSymbols];
          int v31 = 138412290;
          *(void *)v32 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v31, 0xCu);
        }
      }
    }
  }
  v8 = sub_1003F8DC0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v9)
    {
      unsigned int v10 = [v4 signalEnvironmentType] - 1;
      if (v10 > 5) {
        CFStringRef v11 = @"Unavailable";
      }
      else {
        CFStringRef v11 = off_1012E90B8[v10];
      }
      int v31 = 138412290;
      *(void *)v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Got location with signal environment: %@", (uint8_t *)&v31, 0xCu);
    }

    v12 = [(VLFSessionLocationSignalEnvironmentMonitor *)self allowedLocationSignalEnvironments];
    v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 signalEnvironmentType]);
    unsigned int v14 = [v12 containsObject:v13];

    int64_t v15 = [(VLFSessionMonitor *)self state];
    if (v14)
    {
      if (v15 != 2)
      {
        v16 = sub_1003F8DC0();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          unsigned int v17 = [v4 signalEnvironmentType];
          unsigned int v18 = [v4 signalEnvironmentType] - 1;
          if (v18 > 5) {
            CFStringRef v19 = @"Unavailable";
          }
          else {
            CFStringRef v19 = off_1012E90B8[v18];
          }
          v27 = [(VLFSessionLocationSignalEnvironmentMonitor *)self allowedLocationSignalEnvironments];
          int v31 = 67109634;
          *(_DWORD *)v32 = v17;
          *(_WORD *)&v32[4] = 2112;
          *(void *)&v32[6] = v19;
          *(_WORD *)&v32[14] = 2112;
          *(void *)&v32[16] = v27;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Location signal environment (%d:%@) is in the allowed set (%@); updating state",
            (uint8_t *)&v31,
            0x1Cu);
        }
      }
      int v25 = self;
      uint64_t v26 = 2;
    }
    else
    {
      if (v15)
      {
        v20 = sub_1003F8DC0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          unsigned int v21 = [v4 signalEnvironmentType];
          unsigned int v22 = [v4 signalEnvironmentType] - 1;
          if (v22 > 5) {
            CFStringRef v23 = @"Unavailable";
          }
          else {
            CFStringRef v23 = off_1012E90B8[v22];
          }
          __int16 v24 = [(VLFSessionLocationSignalEnvironmentMonitor *)self allowedLocationSignalEnvironments];
          int v31 = 67109634;
          *(_DWORD *)v32 = v21;
          *(_WORD *)&v32[4] = 2112;
          *(void *)&v32[6] = v23;
          *(_WORD *)&v32[14] = 2112;
          *(void *)&v32[16] = v24;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Location signal environment (%d:%@) is NOT in the allowed set (%@); updating state",
            (uint8_t *)&v31,
            0x1Cu);
        }
      }
      int v25 = self;
      uint64_t v26 = 0;
    }
    [(VLFSessionMonitor *)v25 setState:v26];
  }
  else
  {
    if (v9)
    {
      LOWORD(v31) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring",
        (uint8_t *)&v31,
        2u);
    }
  }
}

- (void)_buildAllowedLocationSignalEnvironments
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      int64_t v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        CFStringRef v19 = "-[VLFSessionLocationSignalEnvironmentMonitor _buildAllowedLocationSignalEnvironments]";
        __int16 v20 = 2080;
        unsigned int v21 = "VLFSessionLocationSignalEnvironmentMonitor.m";
        __int16 v22 = 1024;
        int v23 = 111;
        __int16 v24 = 2080;
        int v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          unsigned int v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          CFStringRef v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  id v6 = sub_1003F8DC0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Generating allowed location signal environments", (uint8_t *)&v18, 2u);
  }

  BOOL v7 = +[NSMutableSet set];
  if (GEOConfigGetBOOL())
  {
    v8 = sub_1003F8DC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Rural is allowed", (uint8_t *)&v18, 2u);
    }

    [v7 addObject:&off_1013A6E98];
  }
  if (GEOConfigGetBOOL())
  {
    BOOL v9 = sub_1003F8DC0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Urban is allowed", (uint8_t *)&v18, 2u);
    }

    [v7 addObject:&off_1013A6EB0];
  }
  if (GEOConfigGetBOOL())
  {
    unsigned int v10 = sub_1003F8DC0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Dense Urban is allowed", (uint8_t *)&v18, 2u);
    }

    [v7 addObject:&off_1013A6EC8];
  }
  if (GEOConfigGetBOOL())
  {
    CFStringRef v11 = sub_1003F8DC0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Dense Urban Canyon is allowed", (uint8_t *)&v18, 2u);
    }

    [v7 addObject:&off_1013A6EE0];
  }
  if (GEOConfigGetBOOL())
  {
    v12 = sub_1003F8DC0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Foliage is allowed", (uint8_t *)&v18, 2u);
    }

    [v7 addObject:&off_1013A6EF8];
  }
  v13 = sub_1003F8DC0();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    CFStringRef v19 = (const char *)v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Generated allowed location signal environments: %@", (uint8_t *)&v18, 0xCu);
  }

  id v14 = [v7 copy];
  [(VLFSessionLocationSignalEnvironmentMonitor *)self setAllowedLocationSignalEnvironments:v14];
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationSignalEnvironmentMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationSignalEnvironmentMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (NSString)debugDescription
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  __int16 v28 = NSStringFromClass(v3);
  if ([(id)objc_opt_class() isEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v27 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    BOOL v5 = @"YES";
  }
  else {
    BOOL v5 = @"NO";
  }
  __int16 v26 = v5;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  int v25 = v6;
  int64_t v7 = [(VLFSessionMonitor *)self state];
  CFStringRef v8 = @"Hide";
  if (v7 == 1) {
    CFStringRef v8 = @"EnablePuck";
  }
  if (v7 == 2) {
    CFStringRef v8 = @"EnablePuckAndBanner";
  }
  CFStringRef v23 = v8;
  __int16 v24 = [(VLFSessionLocationSignalEnvironmentMonitor *)self locationManager];
  BOOL v9 = [v24 lastLocation];
  unsigned int v10 = [v9 signalEnvironmentType] - 1;
  if (v10 > 5) {
    CFStringRef v11 = @"Unavailable";
  }
  else {
    CFStringRef v11 = off_1012E90B8[v10];
  }
  if (GEOConfigGetBOOL()) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = v12;
  if (GEOConfigGetBOOL()) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  int64_t v15 = v14;
  if (GEOConfigGetBOOL()) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  unsigned int v17 = v16;
  if (GEOConfigGetBOOL()) {
    int v18 = @"YES";
  }
  else {
    int v18 = @"NO";
  }
  CFStringRef v19 = v18;
  if (GEOConfigGetBOOL()) {
    CFStringRef v20 = @"YES";
  }
  else {
    CFStringRef v20 = @"NO";
  }
  unsigned int v21 = +[NSString stringWithFormat:@"<%@\nisEnabled: %@,\naffectsPuckVisibility: %@,\naffectsBannerVisibility: %@,\ncurrentState: %@,\ncurrentEnvironmentSignal: %@,\nRural: %@,\nUrban: %@,\nDenseUrban: %@,\nDenseUrbanCanyon: %@,\nFoliage: %@>", v28, v27, v26, v25, v23, v11, v13, v15, v17, v19, v20];

  return (NSString *)v21;
}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      CFStringRef v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        int64_t v15 = "-[VLFSessionLocationSignalEnvironmentMonitor locationManager:didUpdateLocation:]";
        __int16 v16 = 2080;
        unsigned int v17 = "VLFSessionLocationSignalEnvironmentMonitor.m";
        __int16 v18 = 1024;
        int v19 = 179;
        __int16 v20 = 2080;
        unsigned int v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        CFStringRef v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        int v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          int64_t v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  [(VLFSessionLocationSignalEnvironmentMonitor *)self _updateStateWithLocation:v7];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  var1 = a3.var1;
  unsigned int var0 = a3.var0;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    BOOL v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      int v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136316418;
        CFStringRef v23 = "-[VLFSessionLocationSignalEnvironmentMonitor valueChangedForGEOConfigKey:]";
        __int16 v24 = 2080;
        int v25 = "VLFSessionLocationSignalEnvironmentMonitor.m";
        __int16 v26 = 1024;
        int v27 = 188;
        __int16 v28 = 2080;
        v29 = "dispatch_get_main_queue()";
        __int16 v30 = 2080;
        int v31 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v32 = 2080;
        __int16 v33 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v22,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          unsigned int v21 = +[NSThread callStackSymbols];
          int v22 = 138412290;
          CFStringRef v23 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
  BOOL v9 = var0 == MapsConfig_VLFSessionLocationSignalEnvironmentAllowRural && var1 == off_1015EFE48;
  if (v9
    || (var0 == MapsConfig_VLFSessionLocationSignalEnvironmentAllowUrban
      ? (BOOL v10 = var1 == off_1015EFE58)
      : (BOOL v10 = 0),
        v10
     || (var0 == MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrban
       ? (BOOL v11 = var1 == off_1015EFE68)
       : (BOOL v11 = 0),
         v11
      || (var0 == MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrbanCanyon
        ? (BOOL v12 = var1 == off_1015EFE78)
        : (BOOL v12 = 0),
          v12
       || (var0 == MapsConfig_VLFSessionLocationSignalEnvironmentAllowFoliage
         ? (BOOL v13 = var1 == off_1015EFE88)
         : (BOOL v13 = 0),
           v13)))))
  {
    unsigned int v17 = sub_1003F8DC0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Allowed location signal environments geo defaults changed; updating allowed set and current state",
        (uint8_t *)&v22,
        2u);
    }

    [(VLFSessionLocationSignalEnvironmentMonitor *)self _buildAllowedLocationSignalEnvironments];
    int64_t v15 = [(VLFSessionLocationSignalEnvironmentMonitor *)self locationManager];
    __int16 v18 = [v15 lastLocation];
    [(VLFSessionLocationSignalEnvironmentMonitor *)self _updateStateWithLocation:v18];

    goto LABEL_35;
  }
  int v14 = sub_1005762E4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136315650;
    CFStringRef v23 = "-[VLFSessionLocationSignalEnvironmentMonitor valueChangedForGEOConfigKey:]";
    __int16 v24 = 2080;
    int v25 = "VLFSessionLocationSignalEnvironmentMonitor.m";
    __int16 v26 = 1024;
    int v27 = 200;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v22, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    int64_t v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = +[NSThread callStackSymbols];
      int v22 = 138412290;
      CFStringRef v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);
    }
LABEL_35:
  }
}

- (VLFLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NSSet)allowedLocationSignalEnvironments
{
  return self->_allowedLocationSignalEnvironments;
}

- (void)setAllowedLocationSignalEnvironments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedLocationSignalEnvironments, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end