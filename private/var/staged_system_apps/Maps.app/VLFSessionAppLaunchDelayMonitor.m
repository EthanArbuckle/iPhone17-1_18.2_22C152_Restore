@interface VLFSessionAppLaunchDelayMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)isInBackground;
- (GCDTimer)timeoutTimer;
- (VLFSessionAppLaunchDelayMonitor)initWithObserver:(id)a3;
- (id)debugDescription;
- (void)_startTimer;
- (void)applicationDidBecomeActiveNotification:(id)a3;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)setIsInBackground:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation VLFSessionAppLaunchDelayMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionAppLaunchDelayMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionAppLaunchDelayMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (VLFSessionAppLaunchDelayMonitor)initWithObserver:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VLFSessionAppLaunchDelayMonitor;
  unsigned __int8 v3 = [(VLFSessionMonitor *)&v8 initWithObserver:a3];
  v4 = v3;
  if (v3)
  {
    [(VLFSessionAppLaunchDelayMonitor *)v3 _startTimer];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"applicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  return v4;
}

- (void)_startTimer
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v19 = "-[VLFSessionAppLaunchDelayMonitor _startTimer]";
        __int16 v20 = 2080;
        v21 = "VLFSessionAppLaunchDelayMonitor.m";
        __int16 v22 = 1024;
        int v23 = 56;
        __int16 v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v6 = [(VLFSessionAppLaunchDelayMonitor *)self timeoutTimer];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    GEOConfigGetDouble();
    double v10 = v9;
    v11 = sub_100109C58();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v19 = *(const char **)&v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Delaying VLF with timeout: %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1007464B8;
    v16[3] = &unk_1012E7638;
    objc_copyWeak(&v17, (id *)buf);
    v12 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v16 block:v10];
    [(VLFSessionAppLaunchDelayMonitor *)self setTimeoutTimer:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_super v8 = sub_100109C58();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Already delaying VLF; ignoring", buf, 2u);
    }
  }
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  if ([(id)objc_opt_class() isEnabled]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  BOOL v5 = v4;
  if ([(id)objc_opt_class() affectsPuckVisibility]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  BOOL v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    objc_super v8 = @"YES";
  }
  else {
    objc_super v8 = @"NO";
  }
  double v9 = v8;
  int64_t v10 = [(VLFSessionMonitor *)self state];
  CFStringRef v11 = @"Hide";
  if (v10 == 1) {
    CFStringRef v11 = @"EnablePuck";
  }
  if (v10 == 2) {
    CFStringRef v12 = @"EnablePuckAndBanner";
  }
  else {
    CFStringRef v12 = v11;
  }
  GEOConfigGetDouble();
  v14 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, timeout: %f>", v3, v5, v7, v9, v12, v13];

  return v14;
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        uint64_t v13 = "-[VLFSessionAppLaunchDelayMonitor applicationDidEnterBackgroundNotification:]";
        __int16 v14 = 2080;
        v15 = "VLFSessionAppLaunchDelayMonitor.m";
        __int16 v16 = 1024;
        int v17 = 115;
        __int16 v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int64_t v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          uint64_t v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  objc_super v8 = sub_100109C58();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "App backgrounded; updating state",
      (uint8_t *)&v12,
      2u);
  }

  [(VLFSessionAppLaunchDelayMonitor *)self setIsInBackground:1];
  [(VLFSessionAppLaunchDelayMonitor *)self setTimeoutTimer:0];
  [(VLFSessionMonitor *)self setState:0];
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      double v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        uint64_t v13 = "-[VLFSessionAppLaunchDelayMonitor applicationDidBecomeActiveNotification:]";
        __int16 v14 = 2080;
        v15 = "VLFSessionAppLaunchDelayMonitor.m";
        __int16 v16 = 1024;
        int v17 = 126;
        __int16 v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int64_t v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          uint64_t v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  objc_super v8 = sub_100109C58();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "App foregrounded; starting timer",
      (uint8_t *)&v12,
      2u);
  }

  [(VLFSessionAppLaunchDelayMonitor *)self setIsInBackground:0];
  [(VLFSessionAppLaunchDelayMonitor *)self _startTimer];
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)setIsInBackground:(BOOL)a3
{
  self->_isInBackground = a3;
}

- (void).cxx_destruct
{
}

@end