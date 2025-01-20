@interface VIOSessionPowerStateMonitor
+ (BOOL)isAvailable;
- (BOOL)isLowPowerModeEnabled;
- (VIOSessionPowerStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)reportStateToStateManager;
@end

@implementation VIOSessionPowerStateMonitor

- (VIOSessionPowerStateMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VIOSessionPowerStateMonitor;
  v4 = [(VIOSessionMonitor *)&v10 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_1007E659C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v12 = v4;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v4 selector:"powerStateDidChangeNotification:" name:NSProcessInfoPowerStateDidChangeNotification object:0];

    [(VIOSessionPowerStateMonitor *)v4 reportStateToStateManager];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_1007E659C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    objc_super v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)VIOSessionPowerStateMonitor;
  [(VIOSessionPowerStateMonitor *)&v6 dealloc];
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)isLowPowerModeEnabled
{
  v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void)reportStateToStateManager
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1007E67D4;
  v2[3] = &unk_1012E6708;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

@end