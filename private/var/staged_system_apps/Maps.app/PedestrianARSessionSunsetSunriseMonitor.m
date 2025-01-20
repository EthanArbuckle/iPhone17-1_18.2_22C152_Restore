@interface PedestrianARSessionSunsetSunriseMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (double)minimumDistanceThreshold;
+ (double)minimumTimeThreshold;
+ (double)offsetThreshold;
+ (id)friendlyName;
- (MapsSunsetSunriseObserver)sunsetSunriseObserver;
- (NSString)debugDescription;
- (PedestrianARSessionSunsetSunriseMonitor)initWithObserver:(id)a3 locationManager:(id)a4 sunsetSunriseCalculator:(id)a5 platformController:(id)a6 transportTypeSupportProvider:(Class)a7;
- (void)dealloc;
- (void)setSunsetSunriseObserver:(id)a3;
- (void)sunsetSunriseObserver:(id)a3 didUpdateState:(int64_t)a4;
- (void)updateState;
@end

@implementation PedestrianARSessionSunsetSunriseMonitor

- (void)updateState
{
  v3 = [(PedestrianARSessionSunsetSunriseMonitor *)self sunsetSunriseObserver];
  id v4 = [v3 currentState];

  switch((unint64_t)v4)
  {
    case 0uLL:
      v5 = sub_10001157C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v8 = 134349056;
        *(void *)&v8[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%{public}p] Could not determine sunset/sunrise state; ignoring",
          v8,
          0xCu);
      }
      uint64_t v6 = 1;
      goto LABEL_16;
    case 1uLL:
      v5 = sub_10001157C();
      uint64_t v6 = 1;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v8 = 134349056;
        *(void *)&v8[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Detected state is during the day", v8, 0xCu);
      }
      goto LABEL_16;
    case 2uLL:
      v5 = sub_10001157C();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)v8 = 134349056;
      *(void *)&v8[4] = self;
      v7 = "[%{public}p] Detected state is shortly before sunset";
      break;
    case 3uLL:
      v5 = sub_10001157C();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)v8 = 134349056;
      *(void *)&v8[4] = self;
      v7 = "[%{public}p] Detected state is between sunset and sunrise";
      break;
    case 4uLL:
      v5 = sub_10001157C();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)v8 = 134349056;
      *(void *)&v8[4] = self;
      v7 = "[%{public}p] Detected state is shortly after sunrise";
      break;
    default:
      uint64_t v6 = 0;
      goto LABEL_17;
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, v8, 0xCu);
LABEL_15:
  uint64_t v6 = 0;
LABEL_16:

LABEL_17:
  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v6, *(_OWORD *)v8);
}

- (PedestrianARSessionSunsetSunriseMonitor)initWithObserver:(id)a3 locationManager:(id)a4 sunsetSunriseCalculator:(id)a5 platformController:(id)a6 transportTypeSupportProvider:(Class)a7
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
      v35 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "PedestrianARSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 39;
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
      v35 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "PedestrianARSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 40;
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
      v35 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "PedestrianARSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 41;
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
      v35 = "-[PedestrianARSessionSunsetSunriseMonitor initWithObserver:locationManager:sunsetSunriseCalculator:platformC"
            "ontroller:transportTypeSupportProvider:]";
      __int16 v36 = 2080;
      v37 = "PedestrianARSessionSunsetSunriseMonitor.m";
      __int16 v38 = 1024;
      int v39 = 42;
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
  v33.super_class = (Class)PedestrianARSessionSunsetSunriseMonitor;
  v16 = [(PedestrianARSessionMonitor *)&v33 initWithObserver:v12];
  if (v16)
  {
    v17 = sub_10001157C();
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
    [(PedestrianARSessionSunsetSunriseMonitor *)v16 updateState];
  }

  return v16;
}

- (MapsSunsetSunriseObserver)sunsetSunriseObserver
{
  return self->_sunsetSunriseObserver;
}

+ (double)offsetThreshold
{
  GEOConfigGetDouble();
  return result;
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

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionSunsetSunriseMonitorEnabled;
  v3 = off_1015EFF18;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_10001157C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MapsSunsetSunriseObserver *)self->_sunsetSunriseObserver unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionSunsetSunriseMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (NSString)debugDescription
{
  v3 = [(id)objc_opt_class() friendlyName];
  [(id)objc_opt_class() offsetThreshold];
  uint64_t v5 = v4;
  uint64_t v6 = [(PedestrianARSessionSunsetSunriseMonitor *)self sunsetSunriseObserver];
  v7 = (char *)[v6 currentState] - 1;
  if ((unint64_t)v7 > 3) {
    CFStringRef v8 = @"Unknown";
  }
  else {
    CFStringRef v8 = *(&off_101312C78 + (void)v7);
  }
  v9 = [(PedestrianARSessionSunsetSunriseMonitor *)self sunsetSunriseObserver];
  v10 = [v9 _sunset];
  v11 = [(PedestrianARSessionSunsetSunriseMonitor *)self sunsetSunriseObserver];
  id v12 = [v11 _sunrise];
  id v13 = +[NSString stringWithFormat:@"%@\noffset threshold (seconds): %.2f\nsunset/sunrise state: %@\nsunset: %@\nsunrise: %@\n", v3, v5, v8, v10, v12];

  return (NSString *)v13;
}

+ (id)friendlyName
{
  return @"Sunset/Sunrise Monitor";
}

- (void)sunsetSunriseObserver:(id)a3 didUpdateState:(int64_t)a4
{
  uint64_t v6 = sub_10001157C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 1) > 3) {
      CFStringRef v7 = @"Unknown";
    }
    else {
      CFStringRef v7 = *(&off_101312C78 + a4 - 1);
    }
    int v8 = 134349314;
    v9 = self;
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got a new state from the sunset/sunrise observer: %@", (uint8_t *)&v8, 0x16u);
  }

  [(PedestrianARSessionSunsetSunriseMonitor *)self updateState];
}

- (void)setSunsetSunriseObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end