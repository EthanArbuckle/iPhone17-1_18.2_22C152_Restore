@interface VLFSessionNetworkReachabilityMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (GEONetworkObserver)networkObserver;
- (VLFSessionNetworkReachabilityMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)dealloc;
- (void)setNetworkObserver:(id)a3;
- (void)updateState;
@end

@implementation VLFSessionNetworkReachabilityMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionNetworkReachabilityMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (VLFSessionNetworkReachabilityMonitor)initWithObserver:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VLFSessionNetworkReachabilityMonitor;
  unsigned __int8 v3 = [(VLFSessionMonitor *)&v7 initWithObserver:a3];
  if (v3)
  {
    uint64_t v4 = +[GEONetworkObserver sharedNetworkObserver];
    networkObserver = v3->_networkObserver;
    v3->_networkObserver = (GEONetworkObserver *)v4;

    [(GEONetworkObserver *)v3->_networkObserver addNetworkReachableObserver:v3 selector:"networkReachabilityChangedNotification:"];
    [(VLFSessionNetworkReachabilityMonitor *)v3 updateState];
  }
  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionNetworkReachabilityMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (void)updateState
{
  unsigned __int8 v3 = [(VLFSessionNetworkReachabilityMonitor *)self networkObserver];
  unsigned int v4 = [v3 isNetworkReachable];

  if (qword_10160F928 != -1) {
    dispatch_once(&qword_10160F928, &stru_1012F8C40);
  }
  v5 = (id)qword_10160F920;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = 2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected that network is reachable; updating state",
        buf,
        2u);
    }
    else
    {
      uint64_t v7 = 2;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected that network is not reachable; updating state",
        v8,
        2u);
    }
    uint64_t v7 = 0;
  }

  [(VLFSessionMonitor *)self setState:v7];
}

- (GEONetworkObserver)networkObserver
{
  return self->_networkObserver;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void)dealloc
{
  [(GEONetworkObserver *)self->_networkObserver removeNetworkReachableObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionNetworkReachabilityMonitor;
  [(VLFSessionNetworkReachabilityMonitor *)&v3 dealloc];
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    unsigned int v4 = @"YES";
  }
  else {
    unsigned int v4 = @"NO";
  }
  v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  uint64_t v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  v10 = [(VLFSessionNetworkReachabilityMonitor *)self networkObserver];
  unsigned int v11 = [v10 isNetworkReachable];
  int64_t v12 = [(VLFSessionMonitor *)self state];
  CFStringRef v13 = @"Hide";
  if (v12 == 1) {
    CFStringRef v13 = @"EnablePuck";
  }
  if (v12 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  CFStringRef v14 = @"No network";
  if (v11) {
    CFStringRef v14 = @"Has network";
  }
  v15 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %@, currentState: %@>", v3, v5, v7, v9, v14, v13];

  return v15;
}

- (void)setNetworkObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end