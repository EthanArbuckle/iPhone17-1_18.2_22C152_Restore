@interface VLFSessionOfflineMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (VLFSessionOfflineMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)updateState;
@end

@implementation VLFSessionOfflineMonitor

- (VLFSessionOfflineMonitor)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VLFSessionOfflineMonitor;
  v3 = [(VLFSessionMonitor *)&v6 initWithObserver:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_usingOfflineDidChange:" name:@"UsingOfflineMapsStateChangedNotification" object:0];

    [(VLFSessionOfflineMonitor *)v3 updateState];
  }
  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionOfflineMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionOfflineMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (void)updateState
{
  unsigned __int8 v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  if (qword_10160F938 != -1) {
    dispatch_once(&qword_10160F938, &stru_1012F8CE0);
  }
  v5 = (id)qword_10160F930;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Using offline mode; updating state", buf, 2u);
    }
    uint64_t v7 = 0;
  }
  else if (v6)
  {
    *(_WORD *)v8 = 0;
    uint64_t v7 = 2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Not using offline mode; updating state", v8, 2u);
  }
  else
  {
    uint64_t v7 = 2;
  }

  [(VLFSessionMonitor *)self setState:v7];
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
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
  v10 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v11 = [v10 isUsingOfflineMaps];
  int64_t v12 = [(VLFSessionMonitor *)self state];
  CFStringRef v13 = @"Hide";
  if (v12 == 1) {
    CFStringRef v13 = @"EnablePuck";
  }
  if (v12 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  CFStringRef v14 = @"not offline";
  if (v11) {
    CFStringRef v14 = @"offline";
  }
  v15 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %@, currentState: %@>", v3, v5, v7, v9, v14, v13];

  return v15;
}

@end