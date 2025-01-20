@interface PedestrianARSessionNetworkReachabilityMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (GEONetworkObserver)networkObserver;
- (PedestrianARSessionNetworkReachabilityMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)setNetworkObserver:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionNetworkReachabilityMonitor

- (void)updateState
{
  v3 = [(PedestrianARSessionNetworkReachabilityMonitor *)self networkObserver];
  id v4 = [v3 isNetworkReachable];

  v5 = sub_10000DE88();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      v7 = "[%{public}p] Detected that network is reachable; updating state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6)
  {
    int v8 = 134349056;
    v9 = self;
    v7 = "[%{public}p] Detected that network is not reachable; updating state";
    goto LABEL_6;
  }

  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v4];
}

- (PedestrianARSessionNetworkReachabilityMonitor)initWithObserver:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionNetworkReachabilityMonitor;
  v3 = [(PedestrianARSessionMonitor *)&v8 initWithObserver:a3];
  if (v3)
  {
    id v4 = sub_10000DE88();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    uint64_t v5 = +[GEONetworkObserver sharedNetworkObserver];
    networkObserver = v3->_networkObserver;
    v3->_networkObserver = (GEONetworkObserver *)v5;

    [(GEONetworkObserver *)v3->_networkObserver addNetworkReachableObserver:v3 selector:"networkReachabilityChangedNotification:"];
    [(PedestrianARSessionNetworkReachabilityMonitor *)v3 updateState];
  }
  return v3;
}

- (GEONetworkObserver)networkObserver
{
  return self->_networkObserver;
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionNetworkReachabilityMonitorEnabled;
  v3 = off_1015EFF08;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_10000DE88();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    BOOL v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Dealloc", buf, 0xCu);
  }

  [(GEONetworkObserver *)self->_networkObserver removeNetworkReachableObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionNetworkReachabilityMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (id)debugDescription
{
  v3 = [(id)objc_opt_class() friendlyName];
  objc_super v4 = [(PedestrianARSessionNetworkReachabilityMonitor *)self networkObserver];
  unsigned int v5 = [v4 isNetworkReachable];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  v7 = +[NSString stringWithFormat:@"%@\nnetwork reachable: %@\n", v3, v6];

  return v7;
}

+ (id)friendlyName
{
  return @"Network Reachability Monitor";
}

- (void)setNetworkObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end