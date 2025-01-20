@interface PedestrianARSessionCoarseLocationMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (BOOL)isDelayingStateChange;
- (BOOL)isInBackground;
- (GCDTimer)authorizedDelayTimer;
- (MKLocationManager)locationManager;
- (PedestrianARSessionCoarseLocationMonitor)initWithObserver:(id)a3 locationManager:(id)a4;
- (id)debugDescription;
- (void)_startAuthorizationDelayTimer;
- (void)applicationDidBecomeActiveNotification:(id)a3;
- (void)applicationWillResignActiveNotification:(id)a3;
- (void)dealloc;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)setAuthorizedDelayTimer:(id)a3;
- (void)setIsDelayingStateChange:(BOOL)a3;
- (void)setIsInBackground:(BOOL)a3;
- (void)setLocationManager:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionCoarseLocationMonitor

- (void)updateState
{
  v3 = [(PedestrianARSessionCoarseLocationMonitor *)self locationManager];
  id v4 = [v3 isAuthorizedForPreciseLocation];

  v5 = sub_100009408();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134349056;
      v9 = self;
      v7 = "[%{public}p] Precise location authorization has been allowed; changing state";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v6)
  {
    int v8 = 134349056;
    v9 = self;
    v7 = "[%{public}p] Precise location authorization has been denied; changing state";
    goto LABEL_6;
  }

  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v4];
}

- (PedestrianARSessionCoarseLocationMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARSessionCoarseLocationMonitor initWithObserver:locationManager:]";
      __int16 v20 = 2080;
      v21 = "PedestrianARSessionCoarseLocationMonitor.m";
      __int16 v22 = 1024;
      int v23 = 36;
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
  v17.super_class = (Class)PedestrianARSessionCoarseLocationMonitor;
  int v8 = [(PedestrianARSessionMonitor *)&v17 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_100009408();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v19 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_locationManager, a4);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v8 selector:"locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v8 selector:"applicationWillResignActiveNotification:" name:UIApplicationWillResignActiveNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v8 selector:"applicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];

    [(PedestrianARSessionCoarseLocationMonitor *)v8 updateState];
  }

  return v8;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionCoarseLocationMonitorEnabled;
  v3 = off_1015EFEE8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_100009408();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionCoarseLocationMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (void)_startAuthorizationDelayTimer
{
  GEOConfigGetDouble();
  double v4 = v3;
  v5 = sub_100009408();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v11 = self;
    __int16 v12 = 2048;
    double v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Starting authorization delay timer for %f seconds before changing state", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v6 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007499C8;
  v8[3] = &unk_1012E7638;
  objc_copyWeak(&v9, (id *)buf);
  id v7 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v8 block:v4];
  [(PedestrianARSessionCoarseLocationMonitor *)self setAuthorizedDelayTimer:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (id)debugDescription
{
  double v3 = [(id)objc_opt_class() friendlyName];
  double v4 = [(PedestrianARSessionCoarseLocationMonitor *)self locationManager];
  unsigned int v5 = [v4 isAuthorizedForPreciseLocation];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  id v7 = +[NSString stringWithFormat:@"%@\nauthorized for precise location: %@\n", v3, v6];

  return v7;
}

+ (id)friendlyName
{
  return @"Coarse Location Monitor";
}

- (void)applicationWillResignActiveNotification:(id)a3
{
  double v4 = sub_100009408();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134349056;
    CFStringRef v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Detected app background", (uint8_t *)&v5, 0xCu);
  }

  [(PedestrianARSessionCoarseLocationMonitor *)self setIsInBackground:1];
}

- (void)applicationDidBecomeActiveNotification:(id)a3
{
  double v4 = sub_100009408();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134349056;
    CFStringRef v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Detected app foreground", (uint8_t *)&v5, 0xCu);
  }

  [(PedestrianARSessionCoarseLocationMonitor *)self setIsInBackground:0];
  if ([(PedestrianARSessionCoarseLocationMonitor *)self isDelayingStateChange])
  {
    [(PedestrianARSessionCoarseLocationMonitor *)self setIsDelayingStateChange:0];
    [(PedestrianARSessionCoarseLocationMonitor *)self _startAuthorizationDelayTimer];
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  [(PedestrianARSessionCoarseLocationMonitor *)self setAuthorizedDelayTimer:0];
  [(PedestrianARSessionCoarseLocationMonitor *)self setIsDelayingStateChange:0];
  if ([(PedestrianARSessionMonitor *)self shouldShowPedestrianAR]
    || ([(PedestrianARSessionCoarseLocationMonitor *)self locationManager],
        double v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isAuthorizedForPreciseLocation],
        v4,
        !v5))
  {
    id v9 = sub_100009408();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134349056;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Authorization changed; updating state",
        (uint8_t *)&v10,
        0xCu);
    }

    [(PedestrianARSessionCoarseLocationMonitor *)self updateState];
  }
  else
  {
    unsigned __int8 v6 = [(PedestrianARSessionCoarseLocationMonitor *)self isInBackground];
    id v7 = sub_100009408();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        int v10 = 134349056;
        v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Detected change from not authorized to authorized but we're in the background, waiting to re-foreground", (uint8_t *)&v10, 0xCu);
      }

      [(PedestrianARSessionCoarseLocationMonitor *)self setIsDelayingStateChange:1];
    }
    else
    {
      if (v8)
      {
        int v10 = 134349056;
        v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Detected change from not authorized to authorized while foregrounded", (uint8_t *)&v10, 0xCu);
      }

      [(PedestrianARSessionCoarseLocationMonitor *)self _startAuthorizationDelayTimer];
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