@interface PedestrianARSessionOfflineMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (PedestrianARSessionOfflineMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)updateState;
@end

@implementation PedestrianARSessionOfflineMonitor

- (PedestrianARSessionOfflineMonitor)initWithObserver:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PedestrianARSessionOfflineMonitor;
  v3 = [(PedestrianARSessionMonitor *)&v7 initWithObserver:a3];
  if (v3)
  {
    v4 = sub_10000E748();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"_usingOfflineDidChange:" name:@"UsingOfflineMapsStateChangedNotification" object:0];

    [(PedestrianARSessionOfflineMonitor *)v3 updateState];
  }
  return v3;
}

- (void)updateState
{
  v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  v5 = sub_10000E748();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      objc_super v7 = "[%{public}p] Using offline mode; updating state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6)
  {
    int v8 = 134349056;
    v9 = self;
    objc_super v7 = "[%{public}p] Not using offline mode; updating state";
    goto LABEL_6;
  }

  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v4 ^ 1];
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionOfflineMonitorEnabled;
  v3 = off_1015F0BA8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_10000E748();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    BOOL v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionOfflineMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (id)debugDescription
{
  uint64_t v2 = [(id)objc_opt_class() friendlyName];
  v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];
  CFStringRef v5 = @"NO";
  if (v4) {
    CFStringRef v5 = @"YES";
  }
  BOOL v6 = +[NSString stringWithFormat:@"%@\nusing offline: %@\n", v2, v5];

  return v6;
}

+ (id)friendlyName
{
  return @"Offline Maps Monitor";
}

@end