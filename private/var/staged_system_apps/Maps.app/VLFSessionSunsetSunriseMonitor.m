@interface VLFSessionSunsetSunriseMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
+ (double)minimumDistanceThreshold;
+ (double)minimumTimeThreshold;
+ (double)offsetThreshold;
- (MapsSunsetSunriseObserver)sunsetSunriseObserver;
- (NSString)debugDescription;
- (VLFSessionSunsetSunriseMonitor)initWithObserver:(id)a3 locationManager:(id)a4 sunsetSunriseCalculator:(id)a5 platformController:(id)a6 transportTypeSupportProvider:(Class)a7;
- (void)calculateState;
- (void)dealloc;
- (void)setSunsetSunriseObserver:(id)a3;
- (void)sunsetSunriseObserver:(id)a3 didUpdateState:(int64_t)a4;
@end

@implementation VLFSessionSunsetSunriseMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionSunsetSunriseMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionSunsetSunriseMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (void)calculateState
{
  unsigned __int8 v3 = [(VLFSessionSunsetSunriseMonitor *)self sunsetSunriseObserver];
  id v4 = [v3 currentState];

  switch((unint64_t)v4)
  {
    case 0uLL:
      v5 = sub_10000B434();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_DWORD *)v11 = 134349056;
      *(void *)&v11[4] = self;
      v6 = "[%{public}p] Could not determine sunset/sunrise state; ignoring";
      v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    case 1uLL:
      v5 = sub_10000B434();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v11 = 134349056;
        *(void *)&v11[4] = self;
        v6 = "[%{public}p] Detected state is during the day";
        v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, v11, 0xCu);
      }
LABEL_8:
      uint64_t v9 = 2;
      goto LABEL_17;
    case 2uLL:
      v5 = sub_10000B434();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)v11 = 134349056;
      *(void *)&v11[4] = self;
      v10 = "[%{public}p] Detected state is shortly before sunset";
      break;
    case 3uLL:
      v5 = sub_10000B434();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)v11 = 134349056;
      *(void *)&v11[4] = self;
      v10 = "[%{public}p] Detected state is between sunset and sunrise";
      break;
    case 4uLL:
      v5 = sub_10000B434();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      *(_DWORD *)v11 = 134349056;
      *(void *)&v11[4] = self;
      v10 = "[%{public}p] Detected state is shortly after sunrise";
      break;
    default:
      uint64_t v9 = 0;
      goto LABEL_18;
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v10, v11, 0xCu);
LABEL_16:
  uint64_t v9 = 0;
LABEL_17:

LABEL_18:
  -[VLFSessionMonitor setState:](self, "setState:", v9, *(_OWORD *)v11);
}

- (VLFSessionSunsetSunriseMonitor)initWithObserver:(id)a3 locationManager:(id)a4 sunsetSunriseCalculator:(id)a5 platformController:(id)a6 transportTypeSupportProvider:(Class)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "VLFSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 40;
      __int16 v40 = 2080;
      v41 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v14)
  {
    v24 = sub_1005762E4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "VLFSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 41;
      __int16 v40 = 2080;
      v41 = "sunsetSunriseCalculator != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v25 = sub_1005762E4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v15)
  {
    v27 = sub_1005762E4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "VLFSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 42;
      __int16 v40 = 2080;
      v41 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v28 = sub_1005762E4();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!a7)
  {
    v30 = sub_1005762E4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[VLFSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformController"
            ":transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "VLFSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 43;
      __int16 v40 = 2080;
      v41 = "transportTypeSupportProvider != nil";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v31 = sub_1005762E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v35 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)VLFSessionSunsetSunriseMonitor;
  v16 = [(VLFSessionMonitor *)&v33 initWithObserver:v12];
  if (v16)
  {
    v17 = sub_10000B434();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v35 = (const char *)v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v18 = [[MapsSunsetSunriseObserver alloc] initWithLocationManager:v13 sunsetSunriseCalculator:v14 platformController:v15 transportTypeSupportProvider:a7];
    sunsetSunriseObserver = v16->_sunsetSunriseObserver;
    v16->_sunsetSunriseObserver = v18;

    [(id)objc_opt_class() offsetThreshold];
    -[MapsSunsetSunriseObserver setOffsetThreshold:](v16->_sunsetSunriseObserver, "setOffsetThreshold:");
    [(id)objc_opt_class() minimumTimeThreshold];
    -[MapsSunsetSunriseObserver setMinimumTimeThreshold:](v16->_sunsetSunriseObserver, "setMinimumTimeThreshold:");
    [(id)objc_opt_class() minimumDistanceThreshold];
    -[MapsSunsetSunriseObserver setMinimumDistanceThreshold:](v16->_sunsetSunriseObserver, "setMinimumDistanceThreshold:");
    [(MapsSunsetSunriseObserver *)v16->_sunsetSunriseObserver registerObserver:v16];
    [(VLFSessionSunsetSunriseMonitor *)v16 calculateState];
  }

  return v16;
}

- (MapsSunsetSunriseObserver)sunsetSunriseObserver
{
  return self->_sunsetSunriseObserver;
}

+ (double)minimumTimeThreshold
{
  GEOConfigGetDouble();
  return result;
}

+ (double)minimumDistanceThreshold
{
  GEOConfigGetDouble();
  return result;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  unsigned __int8 v3 = sub_10000B434();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MapsSunsetSunriseObserver *)self->_sunsetSunriseObserver unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)VLFSessionSunsetSunriseMonitor;
  [(VLFSessionSunsetSunriseMonitor *)&v4 dealloc];
}

+ (double)offsetThreshold
{
  GEOConfigGetDouble();
  return result;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    objc_super v4 = @"YES";
  }
  else {
    objc_super v4 = @"NO";
  }
  v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    os_log_type_t v8 = @"YES";
  }
  else {
    os_log_type_t v8 = @"NO";
  }
  uint64_t v9 = v8;
  [(id)objc_opt_class() offsetThreshold];
  uint64_t v11 = v10;
  id v12 = [(VLFSessionSunsetSunriseMonitor *)self sunsetSunriseObserver];
  id v13 = (char *)[v12 currentState] - 1;
  if ((unint64_t)v13 > 3) {
    CFStringRef v14 = @"Unknown";
  }
  else {
    CFStringRef v14 = *(&off_10131AB80 + (void)v13);
  }
  int64_t v15 = [(VLFSessionMonitor *)self state];
  CFStringRef v16 = @"Hide";
  if (v15 == 1) {
    CFStringRef v16 = @"EnablePuck";
  }
  if (v15 == 2) {
    CFStringRef v16 = @"EnablePuckAndBanner";
  }
  v17 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, threshold: %f, currentValue: %@, currentState: %@>", v3, v5, v7, v9, v11, v14, v16];

  return (NSString *)v17;
}

- (void)sunsetSunriseObserver:(id)a3 didUpdateState:(int64_t)a4
{
  v6 = sub_10000B434();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 1) > 3) {
      CFStringRef v7 = @"Unknown";
    }
    else {
      CFStringRef v7 = *(&off_10131AB80 + a4 - 1);
    }
    int v8 = 134349314;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new state from the sunset/sunrise observer: %@", (uint8_t *)&v8, 0x16u);
  }

  [(VLFSessionSunsetSunriseMonitor *)self calculateState];
}

- (void)setSunsetSunriseObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end