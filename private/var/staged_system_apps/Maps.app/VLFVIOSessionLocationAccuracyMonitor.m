@interface VLFVIOSessionLocationAccuracyMonitor
+ (BOOL)isAvailable;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldDisableVIOSession;
- (NSString)description;
- (VLFVIOSessionLocationAccuracyMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation VLFVIOSessionLocationAccuracyMonitor

- (VLFVIOSessionLocationAccuracyMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)VLFVIOSessionLocationAccuracyMonitor;
  v4 = [(VIOSessionMonitor *)&v17 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_1009509D0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v19 = v4;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v8 = [(VIOSessionMonitor *)v4 configuration];
    unsigned int v9 = [v8 isVLF];

    if (!v9)
    {
      [(VIOSessionMonitor *)v4 setEnabled:0];
      v13 = sub_1009509D0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 134349314;
        v19 = v4;
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] %@ will not run because the session is not configured for VLF", buf, 0x16u);
      }
      goto LABEL_9;
    }
    v10 = [(VIOSessionMonitor *)v4 session];
    [v10 _addObserver:v4];

    v11 = [(VIOSessionMonitor *)v4 session];
    id v12 = [v11 state];

    if (v12 == (id)1)
    {
      v13 = +[MKLocationManager sharedLocationManager];
      [v13 startLocationUpdateWithObserver:v4];
LABEL_9:
    }
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_1009509D0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);
  }
  v6 = [(VIOSessionMonitor *)self session];
  [v6 _removeObserver:self];

  v7 = +[MKLocationManager sharedLocationManager];
  [v7 stopLocationUpdateWithObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)VLFVIOSessionLocationAccuracyMonitor;
  [(VLFVIOSessionLocationAccuracyMonitor *)&v8 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  GEOConfigGetDouble();
  v6 = +[NSString stringWithFormat:@"<%@ %p accuracyThreshold: %f>", v4, self, v5];

  return (NSString *)v6;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldDisableVIOSession
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v3 = dispatch_queue_get_label(0);
  if (label != v3)
  {
    BOOL v4 = !label || v3 == 0;
    if (v4 || strcmp(label, v3))
    {
      id v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136316418;
        v16 = "-[VLFVIOSessionLocationAccuracyMonitor shouldDisableVIOSession]";
        __int16 v17 = 2080;
        v18 = "VLFVIOSessionLocationAccuracyMonitor.m";
        __int16 v19 = 1024;
        int v20 = 73;
        __int16 v21 = 2080;
        v22 = "dispatch_get_main_queue()";
        __int16 v23 = 2080;
        v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v25 = 2080;
        v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v13 = sub_1005762E4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = +[NSThread callStackSymbols];
          int v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  uint64_t v5 = +[MKLocationManager sharedLocationManager];
  v6 = [v5 lastLocation];
  [v6 horizontalAccuracy];
  double v8 = v7;
  GEOConfigGetDouble();
  BOOL v10 = v8 >= v9;

  return v10;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316418;
        __int16 v21 = (VLFVIOSessionLocationAccuracyMonitor *)"-[VLFVIOSessionLocationAccuracyMonitor locationManagerUpdatedLocation:]";
        __int16 v22 = 2080;
        __int16 v23 = "VLFVIOSessionLocationAccuracyMonitor.m";
        __int16 v24 = 1024;
        *(_DWORD *)__int16 v25 = 82;
        *(_WORD *)&v25[4] = 2080;
        *(void *)&v25[6] = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          __int16 v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
  double v8 = [v4 lastLocation];
  if (!v8)
  {
    v16 = sub_1009509D0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 134349056;
      __int16 v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}p] Location was nil; ignoring update",
        (uint8_t *)&v20,
        0xCu);
    }
    goto LABEL_14;
  }
  GEOConfigGetDouble();
  double v10 = v9;
  [v8 horizontalAccuracy];
  if (v11 >= v10)
  {
    id v12 = sub_1009509D0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      [v8 horizontalAccuracy];
      int v20 = 134349569;
      __int16 v21 = self;
      __int16 v22 = 2049;
      __int16 v23 = v13;
      __int16 v24 = 2049;
      *(double *)__int16 v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Location horizontal accuracy (%{private}f) went above the threshold (%{private}f); disabling VIO session",
        (uint8_t *)&v20,
        0x20u);
    }

    v14 = [(VIOSessionMonitor *)self stateManager];
    [v14 recordSessionDisableEvent:6];

    int v15 = [(VIOSessionMonitor *)self session];
    [v15 _removeObserver:self];

    v16 = +[MKLocationManager sharedLocationManager];
    [v16 stopLocationUpdateWithObserver:self];
LABEL_14:
  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100951204;
  block[3] = &unk_1012F0708;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

@end