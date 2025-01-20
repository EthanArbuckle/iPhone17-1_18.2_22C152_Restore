@interface VIOSessionSunsetSunriseMonitor
+ (BOOL)isAvailable;
- (BOOL)isCurrentlyNightTime;
- (BOOL)shouldDisableVIOSession;
- (BOOL)wasNightTimeAtStartOfSession;
- (VIOSessionSunsetSunriseMonitor)initWithStateManager:(id)a3 platformController:(id)a4;
- (void)dealloc;
- (void)reportStateToStateManager;
- (void)setWasNightTimeAtStartOfSession:(BOOL)a3;
@end

@implementation VIOSessionSunsetSunriseMonitor

- (VIOSessionSunsetSunriseMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VIOSessionSunsetSunriseMonitor;
  v4 = [(VIOSessionMonitor *)&v9 initWithStateManager:a3 platformController:a4];
  if (v4)
  {
    v5 = sub_100808450();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 134349314;
      v11 = v4;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);
    }
    v4->_wasNightTimeAtStartOfSession = [(VIOSessionSunsetSunriseMonitor *)v4 isCurrentlyNightTime];
    [(VIOSessionSunsetSunriseMonitor *)v4 reportStateToStateManager];
  }
  return v4;
}

- (void)dealloc
{
  v3 = sub_100808450();
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
  v6.super_class = (Class)VIOSessionSunsetSunriseMonitor;
  [(VIOSessionSunsetSunriseMonitor *)&v6 dealloc];
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldDisableVIOSession
{
  return self->_wasNightTimeAtStartOfSession;
}

- (BOOL)isCurrentlyNightTime
{
  v3 = +[MKLocationManager sharedLocationManager];
  if ([v3 hasLocation])
  {
    GEOConfigGetDouble();
    double v5 = v4;
    objc_super v6 = sub_100808450();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [v3 lastLocation];
      v8 = +[NSDate date];
      int v21 = 134349827;
      v22 = self;
      __int16 v23 = 2113;
      v24 = v7;
      __int16 v25 = 2112;
      v26 = v8;
      __int16 v27 = 2048;
      double v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] LocationManager has a last location: %{private}@; calculating sunset/sunrise times with current dat"
        "e: %@, and offset threshold: %f",
        (uint8_t *)&v21,
        0x2Au);
    }
    uint64_t v9 = +[SunsetSunriseCalculator sharedCalculator];
    v10 = [v3 lastLocation];
    id v11 = [(id)v9 currentStateForLocation:v10 offsetThreshold:v5];

    switch((unint64_t)v11)
    {
      case 0uLL:
        __int16 v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315650;
          v22 = (VIOSessionSunsetSunriseMonitor *)"-[VIOSessionSunsetSunriseMonitor isCurrentlyNightTime]";
          __int16 v23 = 2080;
          v24 = "VIOSessionSunsetSunriseMonitor.m";
          __int16 v25 = 1024;
          LODWORD(v26) = 93;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v21, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          v13 = sub_1005762E4();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = +[NSThread callStackSymbols];
            int v21 = 138412290;
            v22 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);
          }
        }
        v15 = sub_100808450();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        int v21 = 134349056;
        v22 = self;
        v16 = "[%{public}p] Unknown sunset/sunrise state; not disabling VIO session";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        goto LABEL_16;
      case 1uLL:
        v15 = sub_100808450();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        int v21 = 134349056;
        v22 = self;
        v16 = "[%{public}p] Not disabling VIO session because it's currently day time";
        goto LABEL_15;
      case 2uLL:
        v15 = sub_100808450();
        LOBYTE(v9) = 1;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_18;
        }
        int v21 = 134349056;
        v22 = self;
        v20 = "[%{public}p] Disabling VIO session because we're shortly before sunset";
        goto LABEL_28;
      case 3uLL:
        v15 = sub_100808450();
        LOBYTE(v9) = 1;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_18;
        }
        int v21 = 134349056;
        v22 = self;
        v20 = "[%{public}p] Disabling VIO session because we're between sunset and sunrise";
        goto LABEL_28;
      case 4uLL:
        v15 = sub_100808450();
        LOBYTE(v9) = 1;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_18;
        }
        int v21 = 134349056;
        v22 = self;
        v20 = "[%{public}p] Disabling VIO session because we're shortly after sunrise";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v21, 0xCu);
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }
  v15 = sub_100808450();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v21 = 134349056;
    v22 = self;
    v16 = "[%{public}p] LocationManager doesn't have a last location; not disabling VIO session.";
LABEL_15:
    v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v21, 0xCu);
  }
LABEL_17:
  LOBYTE(v9) = 0;
LABEL_18:

LABEL_19:
  return v9 & 1;
}

- (void)reportStateToStateManager
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  double v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      uint64_t v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        v13 = "-[VIOSessionSunsetSunriseMonitor reportStateToStateManager]";
        __int16 v14 = 2080;
        v15 = "VIOSessionSunsetSunriseMonitor.m";
        __int16 v16 = 1024;
        int v17 = 106;
        __int16 v18 = 2080;
        v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        int v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        __int16 v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  unsigned int v6 = [(VIOSessionSunsetSunriseMonitor *)self shouldDisableVIOSession];
  v7 = [(VIOSessionMonitor *)self stateManager];
  v8 = v7;
  if (v6) {
    [v7 recordSessionDisableEvent:3];
  }
  else {
    [v7 resetSessionDisableEvent:3];
  }
}

- (BOOL)wasNightTimeAtStartOfSession
{
  return self->_wasNightTimeAtStartOfSession;
}

- (void)setWasNightTimeAtStartOfSession:(BOOL)a3
{
  self->_wasNightTimeAtStartOfSession = a3;
}

@end