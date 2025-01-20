@interface OSIMotionMonitor
- (BOOL)currentlyInCar;
- (CMMotionActivityManager)activityManager;
- (NSOperationQueue)queue;
- (OSIMotionMonitor)init;
- (OS_os_log)log;
- (double)percentStationaryOverDuration:(double)a3;
- (double)percentageStationaryWithActivity:(id)a3 untilDate:(id)a4;
- (int)notifyToken;
- (void)dealloc;
- (void)setActivityManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation OSIMotionMonitor

- (OSIMotionMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)OSIMotionMonitor;
  v2 = [(OSIMotionMonitor *)&v14 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "signal.motion");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v5;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_queue setQualityOfService:17];
    v7 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    activityManager = v2->_activityManager;
    v2->_activityManager = v7;

    objc_initWeak(&location, v2);
    v9 = dispatch_get_global_queue(-32768, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F2FC;
    v11[3] = &unk_100064B70;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.inactivity.recentmotion", &v2->_notifyToken, v9, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (double)percentageStationaryWithActivity:(id)a3 untilDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42 = self;
  v8 = [(OSIMotionMonitor *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100041C30((uint64_t)v6, v8);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v10)
  {
    id v11 = v10;
    v40 = v7;
    id v12 = 0;
    char v13 = 0;
    unsigned __int8 v14 = 0;
    uint64_t v15 = *(void *)v44;
    double v16 = 0.0;
    double v17 = 0.0;
    id v41 = v9;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        v19 = v12;
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v9);
        }
        v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v20 stationary]) {
          BOOL v21 = [v20 confidence] != 0;
        }
        else {
          BOOL v21 = 0;
        }
        if (!((v12 == 0) | v13 & 1))
        {
          v22 = [v20 startDate];
          [v22 timeIntervalSinceDate:v19];
          double v17 = v17 + v23;

          if ((v14 & 1) == 0)
          {
            v24 = [v20 startDate];
            [v24 timeIntervalSinceDate:v19];
            double v16 = v16 + v25;
          }
        }
        id v12 = [v20 startDate];

        if ([v20 confidence] && !objc_msgSend(v20, "unknown"))
        {
          log = v42->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v31 = log;
            unsigned int v32 = [v20 stationary];
            v33 = [v20 startDate];
            *(_DWORD *)buf = 138412802;
            double v48 = *(double *)&v20;
            __int16 v49 = 1024;
            *(_DWORD *)v50 = v32;
            *(_WORD *)&v50[4] = 2112;
            *(void *)&v50[6] = v33;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "  Using event %@ (%u from %@)", buf, 0x1Cu);

            id v9 = v41;
          }
          unsigned __int8 v14 = [v20 stationary];
          char v13 = 0;
        }
        else
        {
          v26 = v42->_log;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v28 = v26;
            unsigned int v29 = [v20 unknown];
            v30 = [v20 startDate];
            *(_DWORD *)buf = 138412802;
            double v48 = *(double *)&v20;
            __int16 v49 = 1024;
            *(_DWORD *)v50 = v29;
            id v9 = v41;
            *(_WORD *)&v50[4] = 2112;
            *(void *)&v50[6] = v30;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "  Skipping event %@ (%u from %@)", buf, 0x1Cu);
          }
          char v13 = 1;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v11);

    if (v12) {
      char v34 = v13;
    }
    else {
      char v34 = 1;
    }
    if (v34)
    {
      id v7 = v40;
    }
    else
    {
      id v7 = v40;
      [v40 timeIntervalSinceDate:v12];
      double v17 = v17 + v35;
      if ((v14 & 1) == 0)
      {
        [v40 timeIntervalSinceDate:v12];
        double v16 = v16 + v36;
      }
    }
  }
  else
  {

    id v12 = 0;
    double v16 = 0.0;
    BOOL v21 = 1;
    double v17 = 0.0;
  }
  v37 = [(OSIMotionMonitor *)v42 log];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    double v48 = v17 - v16;
    __int16 v49 = 2048;
    *(double *)v50 = v16;
    *(_WORD *)&v50[8] = 1024;
    *(_DWORD *)&v50[10] = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, " Stationary duration: %.0f, Non-stationary duration: %.0f, Last state confident stationary: %u", buf, 0x1Cu);
  }

  double v38 = 0.0;
  if (v21)
  {
    double v38 = 1.0;
    if (v17 > 0.0) {
      double v38 = 1.0 - v16 / v17;
    }
  }

  return v38;
}

- (double)percentStationaryOverDuration:(double)a3
{
  double v5 = 1.0;
  if (+[CMMotionActivityManager isActivityAvailable])
  {
    id v6 = +[NSDate now];
    id v7 = [v6 dateByAddingTimeInterval:-a3];
    v8 = +[OSIntelligenceUtilities lastLockDate];
    if (v8)
    {
      uint64_t v9 = [v7 laterDate:v8];

      id v7 = (void *)v9;
    }
    id v10 = +[OSIntelligenceUtilities lastPluggedInDate];
    if (v10)
    {
      uint64_t v11 = [v7 laterDate:v10];

      id v7 = (void *)v11;
    }
    uint64_t v28 = 0;
    unsigned int v29 = (double *)&v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0x3FF0000000000000;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    activityManager = self->_activityManager;
    queue = self->_queue;
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10000FAA4;
    double v23 = &unk_100064B98;
    v27 = &v28;
    v24 = self;
    id v15 = v6;
    id v25 = v15;
    double v16 = v12;
    v26 = v16;
    [(CMMotionActivityManager *)activityManager queryActivityStartingFromDate:v7 toDate:v15 toQueue:queue withHandler:&v20];
    dispatch_time_t v17 = dispatch_walltime(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      v18 = [(OSIMotionMonitor *)self log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100041CA8(v18);
      }
    }
    else
    {
      double v5 = v29[3];
    }

    _Block_object_dispose(&v28, 8);
  }
  return v5;
}

- (BOOL)currentlyInCar
{
  v2 = +[_CDClientContext userContext];
  os_log_t v3 = +[_CDContextQueries keyPathForCarConnectedStatus];
  v4 = +[_CDContextQueries keyPathForNavigationStatus];
  double v5 = +[_CDContextQueries keyPathForCarConnectedStatus];
  id v6 = [v2 objectForKeyedSubscript:v3];
  if ([v6 BOOLValue])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    v8 = [v2 objectForKeyedSubscript:v4];
    if ([v8 BOOLValue])
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      uint64_t v9 = [v2 objectForKeyedSubscript:v5];
      unsigned __int8 v7 = [v9 BOOLValue];
    }
  }

  return v7;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)OSIMotionMonitor;
  [(OSIMotionMonitor *)&v3 dealloc];
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end