@interface VLFVIOSessionAppBackgroundMonitor
+ (BOOL)isAvailable;
- (NSString)description;
- (VLFVIOSessionAppBackgroundMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)applicationWillResignActiveNotification:(id)a3;
- (void)dealloc;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
@end

@implementation VLFVIOSessionAppBackgroundMonitor

- (VLFVIOSessionAppBackgroundMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)VLFVIOSessionAppBackgroundMonitor;
  v4 = [(VIOSessionMonitor *)&v20 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_1005143DC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v22 = v4;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = [(VIOSessionMonitor *)v4 configuration];
    unsigned int v9 = [v8 isVLF];

    if (v9)
    {
      v10 = [(VIOSessionMonitor *)v4 platformController];
      v11 = [v10 currentSession];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v18 = [(VIOSessionMonitor *)v4 platformController];
        [v18 addObserver:v4];

        v13 = +[NSNotificationCenter defaultCenter];
        [v13 addObserver:v4 selector:"applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];
        goto LABEL_12;
      }
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_1005143DC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 134349314;
        v22 = v4;
        __int16 v23 = 2112;
        v24 = v15;
        v16 = "[%{public}p] %@ will not run because we are currently navigating";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v16, buf, 0x16u);
      }
    }
    else
    {
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_1005143DC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v17);
        *(_DWORD *)buf = 134349314;
        v22 = v4;
        __int16 v23 = 2112;
        v24 = v15;
        v16 = "[%{public}p] %@ will not run because the session is not configured for VLF";
        goto LABEL_10;
      }
    }
LABEL_12:
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_1005143DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v8 = self;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)VLFVIOSessionAppBackgroundMonitor;
  [(VLFVIOSessionAppBackgroundMonitor *)&v6 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unsigned int v5 = [(VIOSessionMonitor *)self isEnabled];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  v7 = +[NSString stringWithFormat:@"<%@ %p enabled: %@>", v4, self, v6];

  return (NSString *)v7;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = sub_1005143DC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 134349056;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Navigation started; stop monitoring app background notification",
        (uint8_t *)&v11,
        0xCu);
    }

    __int16 v9 = [(VIOSessionMonitor *)self platformController];
    [v9 removeObserver:self];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];

    [(VIOSessionMonitor *)self setEnabled:0];
  }
}

- (void)applicationWillResignActiveNotification:(id)a3
{
  v4 = sub_1005143DC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] App backgrounded; disabling VIO",
      (uint8_t *)&v7,
      0xCu);
  }

  unsigned int v5 = [(VIOSessionMonitor *)self stateManager];
  [v5 recordSessionDisableEvent:10];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];
}

@end