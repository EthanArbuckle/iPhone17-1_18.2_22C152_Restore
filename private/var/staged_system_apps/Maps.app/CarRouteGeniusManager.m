@interface CarRouteGeniusManager
+ (id)sharedDebugPanelChrome;
- (BOOL)isActive;
- (BOOL)isPreciseLocationEnabled;
- (CarRouteGeniusManager)init;
- (CarRouteGeniusVehicleBatteryMonitor)vehicleMonitor;
- (NSHashTable)activeChromes;
- (NSTimer)predictingRetryTimer;
- (unint64_t)retryCount;
- (void)_startPredictingRetryTimer;
- (void)_stopPredictingRetryTimer;
- (void)activateIfPossibleForChrome:(id)a3;
- (void)deactivateForAllChromes;
- (void)deactivateForChrome:(id)a3;
- (void)dealloc;
- (void)didUpdateRouteGenius:(id)a3;
- (void)locationApprovalDidChange:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveChromes:(id)a3;
- (void)setPreciseLocationEnabled:(BOOL)a3;
- (void)setPredictingRetryTimer:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setVehicleMonitor:(id)a3;
- (void)startPredictingDestinationIfNeeded;
- (void)stopPredictingDestinationIfNeeded;
- (void)vehicleBatteryChangedSignificantly;
@end

@implementation CarRouteGeniusManager

- (CarRouteGeniusManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)CarRouteGeniusManager;
  v2 = [(CarRouteGeniusManager *)&v12 init];
  if (v2)
  {
    v3 = +[NSHashTable weakObjectsHashTable];
    [(CarRouteGeniusManager *)v2 setActiveChromes:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"locationApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

    v5 = +[MKLocationManager sharedLocationManager];
    -[CarRouteGeniusManager setPreciseLocationEnabled:](v2, "setPreciseLocationEnabled:", [v5 isAuthorizedForPreciseLocation]);

    if (IsEVRoutingSupported())
    {
      v6 = [CarRouteGeniusVehicleBatteryMonitor alloc];
      v7 = +[CarRouteGeniusService sharedService];
      v8 = +[VGVirtualGarageService sharedService];
      v9 = [(CarRouteGeniusVehicleBatteryMonitor *)v6 initWithRouteGeniusService:v7 virtualGarageService:v8 callbackQueue:&_dispatch_main_q];
      [(CarRouteGeniusManager *)v2 setVehicleMonitor:v9];

      v10 = [(CarRouteGeniusManager *)v2 vehicleMonitor];
      [v10 setDelegate:v2];
    }
  }
  return v2;
}

- (void)dealloc
{
  if (self->_active)
  {
    v3 = sub_100577E34();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "dealloc of CarRGManager: stopping RG service", buf, 2u);
    }

    v4 = +[CarRouteGeniusService sharedService];
    [v4 stop];
  }
  v5.receiver = self;
  v5.super_class = (Class)CarRouteGeniusManager;
  [(CarRouteGeniusManager *)&v5 dealloc];
}

- (void)activateIfPossibleForChrome:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v40 = sub_1005762E4();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v44 = "-[CarRouteGeniusManager activateIfPossibleForChrome:]";
        __int16 v45 = 2080;
        v46 = "CarRouteGeniusManager.m";
        __int16 v47 = 1024;
        int v48 = 72;
        __int16 v49 = 2080;
        v50 = "dispatch_get_main_queue()";
        __int16 v51 = 2080;
        v52 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v53 = 2080;
        v54 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v41 = sub_1005762E4();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v44 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  id v8 = v4;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___CarSceneTyping]) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  id v11 = [v10 sceneType];
  BOOL v12 = (unint64_t)v11 >= 4;
  unint64_t v13 = (unint64_t)v11 - 4;
  if (!v12)
  {
    v16 = +[GEOCountryConfiguration sharedConfiguration];
    unsigned __int8 v17 = [v16 currentCountrySupportsRouteGenius];

    if (v17)
    {
      v18 = +[MNNavigationService sharedService];
      id v19 = [v18 state];

      if (!v8 || (unint64_t)v19 >= 2)
      {
        v14 = sub_100577E34();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
          goto LABEL_40;
        }
        v25 = +[MNNavigationService sharedService];
        v31 = (const char *)[v25 state];
        *(_DWORD *)buf = 134217984;
        v44 = v31;
        v32 = "activateIfPossibleForChrome: not activating RGManager because MNNavigationService is in state=%lu";
        v33 = v14;
        uint32_t v34 = 12;
        goto LABEL_38;
      }
      v20 = +[CarDisplayController sharedInstance];
      v14 = [v20 platformController];

      v21 = [v14 sessionStack];
      if ([v21 count])
      {
        v22 = [v14 sessionStack];
        v23 = [v22 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v25 = sub_100577E34();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            id v26 = [v14 sessionStack];
            v27 = v26;
            if (v26)
            {
              if ([v26 count])
              {
                v28 = [v27 componentsJoinedByString:@", "];
                v29 = +[NSString stringWithFormat:@"<%p> [%@]", v27, v28];
              }
              else
              {
                v29 = +[NSString stringWithFormat:@"<%p> (empty)", v27];
              }
            }
            else
            {
              v29 = @"<nil>";
            }

            *(_DWORD *)buf = 138412290;
            v44 = (const char *)v29;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: not activating RGManager because the current platform sessionStack is not empty. sessionStack: %@", buf, 0xCu);
          }
          goto LABEL_39;
        }
      }
      else
      {
      }
      v35 = sub_100577E34();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v44 = (const char *)v36;
        __int16 v45 = 2048;
        v46 = (const char *)v8;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: adding new active chrome: <%@: %p>", buf, 0x16u);
      }

      v37 = [(CarRouteGeniusManager *)self activeChromes];
      [v37 addObject:v8];

      if ([(CarRouteGeniusManager *)self isPreciseLocationEnabled])
      {
        v38 = [(CarRouteGeniusManager *)self activeChromes];
        id v39 = [v38 count];

        if (v39) {
          [(CarRouteGeniusManager *)self setActive:1];
        }
        goto LABEL_40;
      }
      v25 = sub_100577E34();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v32 = "activateIfPossibleForChrome: precise location is not enabled. Will not activate RG manager.";
        v33 = v25;
        uint32_t v34 = 2;
LABEL_38:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, v32, buf, v34);
      }
    }
    else
    {
      v14 = sub_100577E34();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_40;
      }
      v25 = +[GEOCountryConfiguration sharedConfiguration];
      v30 = [v25 countryCode];
      *(_DWORD *)buf = 138412290;
      v44 = v30;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: not activating RGManager because we're in a country (%@) that does not support RG.", buf, 0xCu);
    }
LABEL_39:

    goto LABEL_40;
  }
  v14 = sub_100015DB4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v13 > 3) {
      CFStringRef v15 = @".Unknown";
    }
    else {
      CFStringRef v15 = off_101315238[v13];
    }
    *(_DWORD *)buf = 134218242;
    v44 = (const char *)v8;
    __int16 v45 = 2112;
    v46 = (const char *)v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: not activating RGManager for chrome: %p because it is not a supported sceneType: %@", buf, 0x16u);
  }
LABEL_40:
}

- (void)deactivateForChrome:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v23 = "-[CarRouteGeniusManager deactivateForChrome:]";
        __int16 v24 = 2080;
        v25 = "CarRouteGeniusManager.m";
        __int16 v26 = 1024;
        int v27 = 111;
        __int16 v28 = 2080;
        v29 = "dispatch_get_main_queue()";
        __int16 v30 = 2080;
        v31 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v32 = 2080;
        v33 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        CFStringRef v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_100A4D384;
  id v19 = &unk_1012E5D58;
  id v8 = v4;
  id v20 = v8;
  v21 = self;
  id v9 = &_dispatch_main_q;
  id v10 = v17;
  id v11 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v12 = dispatch_queue_get_label(0);
  if (v11 == v12 || v11 && v12 && !strcmp(v11, v12))
  {
    v18((uint64_t)v10);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (void)deactivateForAllChromes
{
  id v3 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v11 = sub_100A4D5A4;
  BOOL v12 = &unk_1012E5D08;
  unint64_t v13 = self;
  id v4 = &_dispatch_main_q;
  objc_super v5 = v10;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v7 = dispatch_queue_get_label(0);
  if (label == v7 || (label ? (BOOL v8 = v7 == 0) : (BOOL v8 = 1), !v8 && !strcmp(label, v7)))
  {
    v11((uint64_t)v5);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = sub_100577E34();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_active) {
        v6 = @"YES";
      }
      else {
        v6 = @"NO";
      }
      BOOL v7 = v6;
      if (v3) {
        BOOL v8 = @"YES";
      }
      else {
        BOOL v8 = @"NO";
      }
      id v9 = v8;
      int v13 = 138412546;
      v14 = v7;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "setting route genius active:%@=>%@", (uint8_t *)&v13, 0x16u);
    }
    self->_active = v3;
    id v10 = [(CarRouteGeniusManager *)self vehicleMonitor];
    [v10 setActive:v3];

    [(CarRouteGeniusManager *)self setRetryCount:0];
    id v11 = +[CarRouteGeniusService sharedService];
    BOOL v12 = v11;
    if (v3)
    {
      [v11 registerObserver:self];

      [(CarRouteGeniusManager *)self startPredictingDestinationIfNeeded];
    }
    else
    {
      [v11 unregisterObserver:self];

      [(CarRouteGeniusManager *)self stopPredictingDestinationIfNeeded];
    }
  }
}

- (void)setPreciseLocationEnabled:(BOOL)a3
{
  if (self->_preciseLocationEnabled != a3)
  {
    self->_preciseLocationEnabled = a3;
    id v4 = sub_100577E34();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_preciseLocationEnabled) {
        objc_super v5 = @"YES";
      }
      else {
        objc_super v5 = @"NO";
      }
      v6 = v5;
      BOOL v7 = [(CarRouteGeniusManager *)self activeChromes];
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2048;
      id v12 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarRouteGeniusManager: precise location was set to %@. activeChromes.count: %ld.", (uint8_t *)&v9, 0x16u);
    }
    if (self->_preciseLocationEnabled)
    {
      BOOL v8 = [(CarRouteGeniusManager *)self activeChromes];
      -[CarRouteGeniusManager setActive:](self, "setActive:", [v8 count] != 0);
    }
    else
    {
      [(CarRouteGeniusManager *)self setActive:0];
    }
  }
}

- (void)_startPredictingRetryTimer
{
  BOOL v3 = +[MNNavigationService sharedService];
  id v4 = [v3 state];

  if (v4 == (id)1)
  {
    objc_super v5 = sub_100577E34();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = +[MNNavigationService sharedService];
      *(_DWORD *)buf = 134217984;
      id v22 = [v6 state];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Predicting retry timer not needed state=%lu", buf, 0xCu);
    }
    [(CarRouteGeniusManager *)self _stopPredictingRetryTimer];
  }
  else
  {
    BOOL v7 = [(CarRouteGeniusManager *)self predictingRetryTimer];

    BOOL v8 = sub_100577E34();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        unint64_t v10 = [(CarRouteGeniusManager *)self retryCount];
        unsigned int v11 = [(CarRouteGeniusManager *)self isActive];
        id v12 = @"NO";
        if (v11) {
          id v12 = @"YES";
        }
        int v13 = v12;
        *(_DWORD *)buf = 134218242;
        id v22 = (id)v10;
        __int16 v23 = 2112;
        __int16 v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Predicting retry timer already running retryCount=%lu routeGeniusActive=%@", buf, 0x16u);
      }
    }
    else
    {
      if (v9)
      {
        unint64_t v14 = [(CarRouteGeniusManager *)self retryCount];
        unsigned int v15 = [(CarRouteGeniusManager *)self isActive];
        v16 = @"NO";
        if (v15) {
          v16 = @"YES";
        }
        unsigned __int8 v17 = v16;
        *(_DWORD *)buf = 134218242;
        id v22 = (id)v14;
        __int16 v23 = 2112;
        __int16 v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Predicting retry timer being started retryCount=%lu routeGeniusActive=%@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100A4DBE4;
      v19[3] = &unk_1012E73C8;
      objc_copyWeak(&v20, (id *)buf);
      v18 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v19 block:2.0];
      [(CarRouteGeniusManager *)self setPredictingRetryTimer:v18];

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_stopPredictingRetryTimer
{
  BOOL v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping predicting retry timer", v5, 2u);
  }

  id v4 = [(CarRouteGeniusManager *)self predictingRetryTimer];
  [v4 invalidate];

  [(CarRouteGeniusManager *)self setPredictingRetryTimer:0];
  [(CarRouteGeniusManager *)self setRetryCount:0];
}

- (void)startPredictingDestinationIfNeeded
{
  BOOL v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(CarRouteGeniusManager *)self isActive];
    objc_super v5 = @"NO";
    if (v4) {
      objc_super v5 = @"YES";
    }
    v6 = v5;
    int v8 = 138412290;
    BOOL v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "startPredictingDestinationIfNeeded routeGeniusActive=%@", (uint8_t *)&v8, 0xCu);
  }
  if ([(CarRouteGeniusManager *)self isActive])
  {
    BOOL v7 = +[CarRouteGeniusService sharedService];
    [v7 start];
  }
}

- (void)stopPredictingDestinationIfNeeded
{
  BOOL v3 = sub_100577E34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = [(CarRouteGeniusManager *)self isActive];
    objc_super v5 = @"NO";
    if (v4) {
      objc_super v5 = @"YES";
    }
    v6 = v5;
    int v14 = 138412290;
    unsigned int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stopPredictingDestinationIfNeeded routeGeniusActive=%@", (uint8_t *)&v14, 0xCu);
  }
  if (![(CarRouteGeniusManager *)self isActive])
  {
    [(CarRouteGeniusManager *)self _stopPredictingRetryTimer];
    BOOL v7 = +[CarRouteGeniusService sharedService];
    [v7 stop];

    int v8 = +[CarDisplayController sharedInstance];
    BOOL v9 = [v8 platformController];
    unint64_t v10 = [v9 currentSession];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v12 = +[CarDisplayController sharedInstance];
      int v13 = [v12 platformController];
      [v13 clearIfCurrentSessionIsKindOfClass:objc_opt_class()];
    }
  }
}

+ (id)sharedDebugPanelChrome
{
  if (qword_1016105B0 != -1) {
    dispatch_once(&qword_1016105B0, &stru_101315218);
  }
  v2 = (void *)qword_1016105A8;

  return v2;
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100577E34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didUpdateRouteGenius:entry: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
  {
    [(CarRouteGeniusManager *)self _stopPredictingRetryTimer];
  }
  else if ([(CarRouteGeniusManager *)self isActive])
  {
    [(CarRouteGeniusManager *)self _startPredictingRetryTimer];
  }
}

- (void)vehicleBatteryChangedSignificantly
{
  v2 = sub_100577E34();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "vehicleBatteryChangedSignificantly -> will force a reroute", v4, 2u);
  }

  BOOL v3 = +[CarRouteGeniusService sharedService];
  [v3 forceReroute];
}

- (void)locationApprovalDidChange:(id)a3
{
  id v4 = +[MKLocationManager sharedLocationManager];
  -[CarRouteGeniusManager setPreciseLocationEnabled:](self, "setPreciseLocationEnabled:", [v4 isAuthorizedForPreciseLocation]);
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isPreciseLocationEnabled
{
  return self->_preciseLocationEnabled;
}

- (NSTimer)predictingRetryTimer
{
  return self->_predictingRetryTimer;
}

- (void)setPredictingRetryTimer:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSHashTable)activeChromes
{
  return self->_activeChromes;
}

- (void)setActiveChromes:(id)a3
{
}

- (CarRouteGeniusVehicleBatteryMonitor)vehicleMonitor
{
  return self->_vehicleMonitor;
}

- (void)setVehicleMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleMonitor, 0);
  objc_storeStrong((id *)&self->_activeChromes, 0);

  objc_storeStrong((id *)&self->_predictingRetryTimer, 0);
}

@end