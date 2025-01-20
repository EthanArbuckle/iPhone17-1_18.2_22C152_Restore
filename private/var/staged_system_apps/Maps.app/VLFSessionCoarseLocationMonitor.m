@interface VLFSessionCoarseLocationMonitor
+ (BOOL)affectsBannerVisibility;
+ (BOOL)affectsPuckVisibility;
+ (BOOL)isEnabled;
- (BOOL)isDelayingStateChange;
- (BOOL)isInBackground;
- (GCDTimer)authorizedDelayTimer;
- (MKLocationManager)locationManager;
- (VLFSessionCoarseLocationMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (id)debugDescription;
- (void)_startAuthorizationDelayTimer;
- (void)applicationDidBecomeActiveNotification:(id)a3;
- (void)applicationWillResignActiveNotification:(id)a3;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)setAuthorizedDelayTimer:(id)a3;
- (void)setIsDelayingStateChange:(BOOL)a3;
- (void)setIsInBackground:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)updateStateForCurrentPreciseLocationAuthorizationStatus;
@end

@implementation VLFSessionCoarseLocationMonitor

+ (BOOL)affectsPuckVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionCoarseLocationMonitorAffectsPuckVisibilityKey"];

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"VLFSessionCoarseLocationMonitorAffectsBannerVisibilityKey"];

  return v3;
}

- (void)updateStateForCurrentPreciseLocationAuthorizationStatus
{
  unsigned __int8 v3 = [(VLFSessionCoarseLocationMonitor *)self locationManager];
  unsigned int v4 = [v3 isAuthorizedForPreciseLocation];

  v5 = sub_100109BB0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = 2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Precise location authorization has been allowed; changing state",
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
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Precise location authorization has been denied; changing state",
        v8,
        2u);
    }
    uint64_t v7 = 0;
  }

  [(VLFSessionMonitor *)self setState:v7];
}

- (VLFSessionCoarseLocationMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[VLFSessionCoarseLocationMonitor initWithObserver:locationManager:]";
      __int16 v20 = 2080;
      v21 = "VLFSessionCoarseLocationMonitor.m";
      __int16 v22 = 1024;
      int v23 = 37;
      __int16 v24 = 2080;
      v25 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)VLFSessionCoarseLocationMonitor;
  v8 = [(VLFSessionMonitor *)&v17 initWithObserver:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationManager, a4);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v9 selector:"applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];

    [(VLFSessionCoarseLocationMonitor *)v9 updateStateForCurrentPreciseLocationAuthorizationStatus];
  }

  return v9;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
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
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = v6;
  if ([(id)objc_opt_class() affectsBannerVisibility]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = v8;
  if ([(MKLocationManager *)self->_locationManager isAuthorizedForPreciseLocation])v10 = @"YES"; {
  else
  }
    v10 = @"NO";
  v11 = v10;
  int64_t v12 = [(VLFSessionMonitor *)self state];
  CFStringRef v13 = @"Hide";
  if (v12 == 1) {
    CFStringRef v13 = @"EnablePuck";
  }
  if (v12 == 2) {
    CFStringRef v13 = @"EnablePuckAndBanner";
  }
  v14 = +[NSString stringWithFormat:@"<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentValue: %@, currentState: %@>", v3, v5, v7, v9, v11, v13];

  return v14;
}

- (void)_startAuthorizationDelayTimer
{
  GEOConfigGetDouble();
  double v4 = v3;
  v5 = sub_100109BB0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting authorization delay timer for %f seconds before changing state", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100ADDE84;
  v8[3] = &unk_1012E7638;
  objc_copyWeak(&v9, (id *)buf);
  id v7 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v8 block:v4];
  [(VLFSessionCoarseLocationMonitor *)self setAuthorizedDelayTimer:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)applicationWillResignActiveNotification:(id)a3
{
  double v4 = sub_100109BB0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Detected app background", v5, 2u);
  }

  [(VLFSessionCoarseLocationMonitor *)self setIsInBackground:1];
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  double v4 = sub_100109BB0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Detected app foreground", v5, 2u);
  }

  [(VLFSessionCoarseLocationMonitor *)self setIsInBackground:0];
  if ([(VLFSessionCoarseLocationMonitor *)self isDelayingStateChange])
  {
    [(VLFSessionCoarseLocationMonitor *)self setIsDelayingStateChange:0];
    [(VLFSessionCoarseLocationMonitor *)self _startAuthorizationDelayTimer];
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  [(VLFSessionCoarseLocationMonitor *)self setAuthorizedDelayTimer:0];
  [(VLFSessionCoarseLocationMonitor *)self setIsDelayingStateChange:0];
  if ([(VLFSessionMonitor *)self state]
    || ([(VLFSessionCoarseLocationMonitor *)self locationManager],
        double v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isAuthorizedForPreciseLocation],
        v4,
        !v5))
  {
    id v9 = sub_100109BB0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Authorization changed; updating state", v10, 2u);
    }

    [(VLFSessionCoarseLocationMonitor *)self updateStateForCurrentPreciseLocationAuthorizationStatus];
  }
  else
  {
    unsigned __int8 v6 = [(VLFSessionCoarseLocationMonitor *)self isInBackground];
    id v7 = sub_100109BB0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Detected change from not authorized to authorized but we're in the background, waiting to re-foreground", buf, 2u);
      }

      [(VLFSessionCoarseLocationMonitor *)self setIsDelayingStateChange:1];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)int64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Detected change from not authorized to authorized while foregrounded", v12, 2u);
      }

      [(VLFSessionCoarseLocationMonitor *)self _startAuthorizationDelayTimer];
    }
  }
}

- (void)setLocationManager:(id)a3
{
}

- (GCDTimer)authorizedDelayTimer
{
  return self->_authorizedDelayTimer;
}

- (void)setAuthorizedDelayTimer:(id)a3
{
}

- (BOOL)isInBackground
{
  return self->_isInBackground;
}

- (void)setIsInBackground:(BOOL)a3
{
  self->_isInBackground = a3;
}

- (BOOL)isDelayingStateChange
{
  return self->_isDelayingStateChange;
}

- (void)setIsDelayingStateChange:(BOOL)a3
{
  self->_isDelayingStateChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizedDelayTimer, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end