@interface VLFSessionThermalStateMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (VLFSessionThermalStateMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)processInfoThermalStateDidChangeNotification:(id)a3;
- (void)updateState;
@end

@implementation VLFSessionThermalStateMonitor

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionThermalStateMonitorAffectsBannerVisibilityKey"];

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionThermalStateMonitorAffectsPuckVisibilityKey"];

  return v3;
}

- (VLFSessionThermalStateMonitor)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VLFSessionThermalStateMonitor;
  unsigned __int8 v3 = [(VLFSessionMonitor *)&v6 initWithObserver:a3];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"processInfoThermalStateDidChangeNotification:" name:NSProcessInfoThermalStateDidChangeNotification object:0];

    [(VLFSessionThermalStateMonitor *)v3 updateState];
  }
  return v3;
}

- (void)updateState
{
  unsigned __int8 v3 = +[NSProcessInfo processInfo];
  id v4 = [v3 thermalState];

  if ((unint64_t)v4 >= 3)
  {
    if (v4 != (id)3) {
      return;
    }
    v5 = sub_100109B08();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = +[NSProcessInfo processInfo];
      v10 = sub_10010994C((uint64_t)[v9 thermalState]);
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected thermal state is too high (%@); updating state",
        (uint8_t *)&v11,
        0xCu);
    }
    uint64_t v8 = 0;
  }
  else
  {
    v5 = sub_100109B08();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_super v6 = +[NSProcessInfo processInfo];
      v7 = sub_10010994C((uint64_t)[v6 thermalState]);
      int v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Detected thermal state is sufficiently low (%@); updating state",
        (uint8_t *)&v11,
        0xCu);
    }
    uint64_t v8 = 2;
  }

  [(VLFSessionMonitor *)self setState:v8];
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  v9 = v8;
  v10 = +[NSProcessInfo processInfo];
  id v11 = [v10 thermalState];
  int64_t v12 = [(VLFSessionMonitor *)self state];
  CFStringRef v13 = @"Hide";
  if (v12 == 1) {
    CFStringRef v13 = @"EnablePuck";
  }
  if (v12 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  v14 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %ld, currentState: %@>", v3, v5, v7, v9, v11, v13];

  return v14;
}

- (void)processInfoThermalStateDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100894AA4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end