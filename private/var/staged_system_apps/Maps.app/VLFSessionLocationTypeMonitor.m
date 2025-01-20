@interface VLFSessionLocationTypeMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (NSSet)allowedLocationTypes;
- (NSString)debugDescription;
- (VLFLocationManager)locationManager;
- (VLFSessionLocationTypeMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (void)_buildAllowedLocationTypes;
- (void)_updateStateWithLocation:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didUpdateLocation:(id)a4;
- (void)setAllowedLocationTypes:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation VLFSessionLocationTypeMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationTypeMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionLocationTypeMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (VLFSessionLocationTypeMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[VLFSessionLocationTypeMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionLocationTypeMonitor.m";
      __int16 v24 = 1024;
      int v25 = 55;
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
      v21 = "-[VLFSessionLocationTypeMonitor initWithObserver:locationManager:]";
      __int16 v22 = 2080;
      v23 = "VLFSessionLocationTypeMonitor.m";
      __int16 v24 = 1024;
      int v25 = 56;
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
  v19.super_class = (Class)VLFSessionLocationTypeMonitor;
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

    [(VLFSessionLocationTypeMonitor *)v9 _buildAllowedLocationTypes];
    v11 = [*p_locationManager lastLocation];
    [(VLFSessionLocationTypeMonitor *)v9 _updateStateWithLocation:v11];
  }
  return v9;
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
        *(_DWORD *)buf = 136316418;
        *(void *)v32 = "-[VLFSessionLocationTypeMonitor _updateStateWithLocation:]";
        *(_WORD *)&v32[8] = 2080;
        *(void *)&v32[10] = "VLFSessionLocationTypeMonitor.m";
        *(_WORD *)&v32[18] = 1024;
        *(_DWORD *)&v32[20] = 93;
        __int16 v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        __int16 v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v29 = sub_1005762E4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)v32 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v8 = sub_100067A50();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v9)
    {
      id v10 = [v4 type];
      if v10 < 0xF && ((0x5FFFu >> (char)v10))
      {
        v11 = *(&off_1012F99D0 + (int)v10);
      }
      else
      {
        v11 = +[NSString stringWithFormat:@"%d", v10];
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Got location with type: %@", buf, 0xCu);
    }
    v12 = [(VLFSessionLocationTypeMonitor *)self allowedLocationTypes];
    v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 type]);
    unsigned int v14 = [v12 containsObject:v13];

    int64_t v15 = [(VLFSessionMonitor *)self state];
    if (v14)
    {
      if (v15 != 2)
      {
        v16 = sub_100067A50();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          unsigned int v17 = [v4 type];
          id v18 = [v4 type];
          if v18 < 0xF && ((0x5FFFu >> (char)v18))
          {
            objc_super v19 = *(&off_1012F99D0 + (int)v18);
          }
          else
          {
            objc_super v19 = +[NSString stringWithFormat:@"%d", v18];
          }
          v27 = [(VLFSessionLocationTypeMonitor *)self allowedLocationTypes];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v32 = v17;
          *(_WORD *)&v32[4] = 2112;
          *(void *)&v32[6] = v19;
          *(_WORD *)&v32[14] = 2112;
          *(void *)&v32[16] = v27;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Location type (%d:%@) is in the allowed set (%@); updating state",
            buf,
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
        v20 = sub_100067A50();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          unsigned int v21 = [v4 type];
          id v22 = [v4 type];
          if v22 < 0xF && ((0x5FFFu >> (char)v22))
          {
            v23 = *(&off_1012F99D0 + (int)v22);
          }
          else
          {
            v23 = +[NSString stringWithFormat:@"%d", v22];
          }
          __int16 v24 = [(VLFSessionLocationTypeMonitor *)self allowedLocationTypes];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v32 = v21;
          *(_WORD *)&v32[4] = 2112;
          *(void *)&v32[6] = v23;
          *(_WORD *)&v32[14] = 2112;
          *(void *)&v32[16] = v24;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Location type (%d:%@) is NOT in the allowed set (%@); updating state",
            buf,
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
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring", buf, 2u);
    }
  }
}

- (void)_buildAllowedLocationTypes
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      unsigned int v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316418;
        id v18 = "-[VLFSessionLocationTypeMonitor _buildAllowedLocationTypes]";
        __int16 v19 = 2080;
        v20 = "VLFSessionLocationTypeMonitor.m";
        __int16 v21 = 1024;
        int v22 = 119;
        __int16 v23 = 2080;
        __int16 v24 = "dispatch_get_main_queue()";
        __int16 v25 = 2080;
        uint64_t v26 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v27 = 2080;
        v28 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v17,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int64_t v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = +[NSThread callStackSymbols];
          int v17 = 138412290;
          id v18 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
        }
      }
    }
  }
  id v6 = sub_100067A50();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Generating allowed location types", (uint8_t *)&v17, 2u);
  }

  BOOL v7 = +[NSMutableSet set];
  if (GEOConfigGetBOOL())
  {
    v8 = sub_100067A50();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "GPS is allowed", (uint8_t *)&v17, 2u);
    }

    [v7 addObject:&off_1013A8B60];
  }
  if (GEOConfigGetBOOL())
  {
    BOOL v9 = sub_100067A50();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "WiFi is allowed", (uint8_t *)&v17, 2u);
    }

    [v7 addObject:&off_1013A8B78];
  }
  if (GEOConfigGetBOOL())
  {
    id v10 = sub_100067A50();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "WiFi2 is allowed", (uint8_t *)&v17, 2u);
    }

    [v7 addObject:&off_1013A8B90];
  }
  if (GEOConfigGetBOOL())
  {
    v11 = sub_100067A50();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Pipeline is allowed", (uint8_t *)&v17, 2u);
    }

    [v7 addObject:&off_1013A8BA8];
  }
  v12 = sub_100067A50();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = (const char *)v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Generated allowed location types: %@", (uint8_t *)&v17, 0xCu);
  }

  id v13 = [v7 copy];
  [(VLFSessionLocationTypeMonitor *)self setAllowedLocationTypes:v13];
}

- (void)setAllowedLocationTypes:(id)a3
{
}

- (void)dealloc
{
  [(VLFLocationManager *)self->_locationManager removeObserver:self];
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionLocationTypeMonitor;
  [(VLFSessionLocationTypeMonitor *)&v3 dealloc];
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (NSString)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v3);
  if ([(id)objc_opt_class() isEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  __int16 v25 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    BOOL v5 = @"YES";
  }
  else {
    BOOL v5 = @"NO";
  }
  __int16 v24 = v5;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  __int16 v23 = v6;
  int64_t v7 = [(VLFSessionMonitor *)self state];
  CFStringRef v8 = @"Hide";
  if (v7 == 1) {
    CFStringRef v8 = @"EnablePuck";
  }
  if (v7 == 2) {
    CFStringRef v8 = @"EnablePuckAndBanner";
  }
  CFStringRef v21 = v8;
  int v22 = [(VLFSessionLocationTypeMonitor *)self locationManager];
  BOOL v9 = [v22 lastLocation];
  id v10 = [v9 type];
  if v10 < 0xF && ((0x5FFFu >> (char)v10))
  {
    v11 = *(&off_1012F99D0 + (int)v10);
  }
  else
  {
    v11 = +[NSString stringWithFormat:@"%d", v10];
  }
  if (GEOConfigGetBOOL()) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  id v13 = v12;
  if (GEOConfigGetBOOL()) {
    unsigned int v14 = @"YES";
  }
  else {
    unsigned int v14 = @"NO";
  }
  int64_t v15 = v14;
  if (GEOConfigGetBOOL()) {
    v16 = @"YES";
  }
  else {
    v16 = @"NO";
  }
  int v17 = v16;
  if (GEOConfigGetBOOL()) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  __int16 v19 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, currentLocationType: %@, allowed: GPS: %@, WiFi: %@, WiFi2: %@, Pipeline: %@>", v26, v25, v24, v23, v21, v11, v13, v15, v17, v18];

  return (NSString *)v19;
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
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        int64_t v15 = "-[VLFSessionLocationTypeMonitor locationManager:didUpdateLocation:]";
        __int16 v16 = 2080;
        int v17 = "VLFSessionLocationTypeMonitor.m";
        __int16 v18 = 1024;
        int v19 = 181;
        __int16 v20 = 2080;
        CFStringRef v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        __int16 v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        __int16 v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          int64_t v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  [(VLFSessionLocationTypeMonitor *)self _updateStateWithLocation:v7];
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
      __int16 v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136316418;
        __int16 v22 = "-[VLFSessionLocationTypeMonitor valueChangedForGEOConfigKey:]";
        __int16 v23 = 2080;
        __int16 v24 = "VLFSessionLocationTypeMonitor.m";
        __int16 v25 = 1024;
        int v26 = 190;
        __int16 v27 = 2080;
        v28 = "dispatch_get_main_queue()";
        __int16 v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v21,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v19 = sub_1005762E4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          __int16 v20 = +[NSThread callStackSymbols];
          int v21 = 138412290;
          __int16 v22 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
  }
  BOOL v9 = var0 == MapsConfig_VLFSessionLocationTypeAllowGPS && var1 == off_1015EFBB8;
  if (v9
    || (var0 == MapsConfig_VLFSessionLocationTypeAllowWiFi ? (BOOL v10 = var1 == off_1015EFBC8) : (BOOL v10 = 0),
        v10
     || (var0 == MapsConfig_VLFSessionLocationTypeAllowWiFi2 ? (BOOL v11 = var1 == off_1015EFBD8) : (BOOL v11 = 0),
         v11
      || (var0 == MapsConfig_VLFSessionLocationTypeAllowPipeline ? (BOOL v12 = var1 == off_1015EFBE8) : (BOOL v12 = 0), v12))))
  {
    __int16 v16 = sub_100067A50();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Allowed location type geo defaults changed; updating allowed set and current state",
        (uint8_t *)&v21,
        2u);
    }

    [(VLFSessionLocationTypeMonitor *)self _buildAllowedLocationTypes];
    int v14 = [(VLFSessionLocationTypeMonitor *)self locationManager];
    int v17 = [v14 lastLocation];
    [(VLFSessionLocationTypeMonitor *)self _updateStateWithLocation:v17];

    goto LABEL_31;
  }
  id v13 = sub_1005762E4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315650;
    __int16 v22 = "-[VLFSessionLocationTypeMonitor valueChangedForGEOConfigKey:]";
    __int16 v23 = 2080;
    __int16 v24 = "VLFSessionLocationTypeMonitor.m";
    __int16 v25 = 1024;
    int v26 = 201;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v21, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    int v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int64_t v15 = +[NSThread callStackSymbols];
      int v21 = 138412290;
      __int16 v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
    }
LABEL_31:
  }
}

- (VLFLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NSSet)allowedLocationTypes
{
  return self->_allowedLocationTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedLocationTypes, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end