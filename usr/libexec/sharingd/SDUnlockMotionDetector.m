@interface SDUnlockMotionDetector
- ($1AB5FA073B851C12C2339EC22442E995)baseAcceleration;
- (BOOL)accelerometerMotion;
- (BOOL)activateCalled;
- (BOOL)activityMotion;
- (BOOL)baseAccelerationSet;
- (BOOL)checkedActivityData;
- (BOOL)checkedStepData;
- (BOOL)hasMotion:(id)a3;
- (BOOL)invalidateCalled;
- (BOOL)motionDetected;
- (BOOL)shouldUseAccelerometerMotion;
- (CMMotionActivityManager)activityManager;
- (CMMotionManager)motionManager;
- (CMPedometer)pedometerManager;
- (NSDate)wristOnDate;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_source)motionTimer;
- (OS_os_log)logType;
- (SDUnlockMotionDetector)initWithUnlockType:(int64_t)a3;
- (id)invalidationHandler;
- (id)motionDetectedHandler;
- (int64_t)type;
- (void)activate;
- (void)checkActivityState;
- (void)checkStepState;
- (void)handleActivityDetected:(id)a3;
- (void)handleMotionDetected:(BOOL)a3;
- (void)handleNewAccelerometerData;
- (void)handlePastActivities:(id)a3 withStartDate:(id)a4;
- (void)handlePastActivitiesForPairedUnlock:(id)a3;
- (void)handlePastActivitiesForPhoneAutoUnlock:(id)a3 withStartDate:(id)a4;
- (void)handlePastPedometerData:(id)a3;
- (void)invalidate;
- (void)invalidateMotionTimer;
- (void)restartMotionTimer;
- (void)setAccelerometerMotion:(BOOL)a3;
- (void)setActivateCalled:(BOOL)a3;
- (void)setActivityManager:(id)a3;
- (void)setActivityMotion:(BOOL)a3;
- (void)setBaseAcceleration:(id)a3;
- (void)setBaseAccelerationSet:(BOOL)a3;
- (void)setCheckedActivityData:(BOOL)a3;
- (void)setCheckedStepData:(BOOL)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setInvalidateCalled:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLogType:(id)a3;
- (void)setMotionDetected:(BOOL)a3;
- (void)setMotionDetectedHandler:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)setMotionTimer:(id)a3;
- (void)setPedometerManager:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setWristOnDate:(id)a3;
@end

@implementation SDUnlockMotionDetector

- (SDUnlockMotionDetector)initWithUnlockType:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SDUnlockMotionDetector;
  v4 = [(SDUnlockMotionDetector *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    motionManager = v4->_motionManager;
    v4->_motionManager = (CMMotionManager *)v5;

    [(CMMotionManager *)v4->_motionManager setAccelerometerUpdateInterval:1.0];
    uint64_t v7 = objc_opt_new();
    activityManager = v4->_activityManager;
    v4->_activityManager = (CMMotionActivityManager *)v7;

    uint64_t v9 = objc_opt_new();
    pedometerManager = v4->_pedometerManager;
    v4->_pedometerManager = (CMPedometer *)v9;

    uint64_t v11 = dispatch_get_current_queue();
    handlerQueue = v4->_handlerQueue;
    v4->_handlerQueue = (OS_dispatch_queue *)v11;

    v4->_type = a3;
    if (a3 == 1)
    {
      uint64_t v13 = auto_unlock_log();
      goto LABEL_6;
    }
    if (!a3)
    {
      uint64_t v13 = paired_unlock_log();
LABEL_6:
      logType = v4->_logType;
      v4->_logType = (OS_os_log *)v13;
    }
  }
  return v4;
}

- (void)activate
{
  if (![(SDUnlockMotionDetector *)self activateCalled])
  {
    [(SDUnlockMotionDetector *)self setActivateCalled:1];
    id location = 0;
    objc_initWeak(&location, self);
    if (![(SDUnlockMotionDetector *)self type])
    {
      v3 = [(SDUnlockMotionDetector *)self motionManager];
      v4 = +[NSOperationQueue mainQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100066520;
      v12[3] = &unk_1008CB2D8;
      v12[4] = self;
      objc_copyWeak(&v13, &location);
      [v3 startAccelerometerUpdatesToQueue:v4 withHandler:v12];

      uint64_t v5 = [(SDUnlockMotionDetector *)self activityManager];
      v6 = +[NSOperationQueue mainQueue];
      uint64_t v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      uint64_t v9 = sub_1000665B4;
      v10 = &unk_1008CB300;
      objc_copyWeak(&v11, &location);
      [v5 startActivityUpdatesToQueue:v6 withHandler:&v7];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
    }
    [(SDUnlockMotionDetector *)self checkActivityState];
    if ((id)[(SDUnlockMotionDetector *)self type] == (id)1) {
      [(SDUnlockMotionDetector *)self checkStepState];
    }
    objc_destroyWeak(&location);
  }
}

- (void)invalidate
{
  if (![(SDUnlockMotionDetector *)self invalidateCalled])
  {
    [(SDUnlockMotionDetector *)self setInvalidateCalled:1];
    [(SDUnlockMotionDetector *)self setMotionDetected:0];
    v3 = [(SDUnlockMotionDetector *)self motionManager];
    [v3 stopAccelerometerUpdates];

    [(SDUnlockMotionDetector *)self setMotionManager:0];
    v4 = [(SDUnlockMotionDetector *)self activityManager];
    [v4 stopActivityUpdates];

    [(SDUnlockMotionDetector *)self setActivityManager:0];
    uint64_t v5 = [(SDUnlockMotionDetector *)self invalidationHandler];

    if (v5)
    {
      v6 = [(SDUnlockMotionDetector *)self invalidationHandler];
      v6[2]();
    }
    [(SDUnlockMotionDetector *)self setInvalidationHandler:0];
  }
}

- (void)checkActivityState
{
  v3 = [(SDUnlockMotionDetector *)self wristOnDate];

  if (v3)
  {
    v4 = +[NSDate date];
    if ((id)[(SDUnlockMotionDetector *)self type] == (id)1)
    {
      uint64_t v5 = +[NSUserDefaults standardUserDefaults];
      unsigned int v6 = [v5 integerForKey:@"phoneAutoUnlockWatchMotionActivityWindowSeconds"];
      if (v6) {
        int v7 = v6;
      }
      else {
        int v7 = 1800;
      }
      uint64_t v8 = [(SDUnlockMotionDetector *)self logType];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using phoneAutoUnlockWatchMotionActivityWindowSeconds %d", buf, 8u);
      }
    }
    else
    {
      int v7 = 180;
    }
    uint64_t v9 = +[NSDate dateWithTimeIntervalSinceNow:(double)-v7];
    uint64_t v10 = [(SDUnlockMotionDetector *)self wristOnDate];
    if (v10)
    {
      id v11 = (void *)v10;
      v12 = [(SDUnlockMotionDetector *)self wristOnDate];
      [v4 timeIntervalSinceDate:v12];
      double v14 = v13;

      if (v14 < (double)v7)
      {
        uint64_t v15 = [(SDUnlockMotionDetector *)self wristOnDate];

        uint64_t v9 = (void *)v15;
      }
    }
    objc_super v16 = [(SDUnlockMotionDetector *)self logType];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activity start date %@", buf, 0xCu);
    }

    v17 = [(SDUnlockMotionDetector *)self activityManager];
    v18 = +[NSOperationQueue mainQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000669E4;
    v20[3] = &unk_1008CB328;
    v20[4] = self;
    id v21 = v9;
    id v19 = v9;
    [v17 queryActivityStartingFromDate:v19 toDate:v4 toQueue:v18 withHandler:v20];
  }
  else
  {
    v4 = [(SDUnlockMotionDetector *)self logType];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device off wrist, not checking past activity state", buf, 2u);
    }
  }
}

- (void)checkStepState
{
  v3 = [(SDUnlockMotionDetector *)self wristOnDate];

  if (v3)
  {
    v4 = +[NSDate date];
    uint64_t v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = [v5 integerForKey:@"phoneAutoUnlockWatchStepCountWindowSeconds"];
    if (v6) {
      int v7 = (int)v6;
    }
    else {
      int v7 = 1800;
    }
    uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:(double)-v7];
    uint64_t v9 = [(SDUnlockMotionDetector *)self logType];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((void)v6 << 32) {
        uint64_t v10 = (int)v6;
      }
      else {
        uint64_t v10 = 1800;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using phoneAutoUnlockWatchStepCountWindowSeconds %ld", buf, 0xCu);
    }

    uint64_t v11 = [(SDUnlockMotionDetector *)self wristOnDate];
    if (v11)
    {
      v12 = (void *)v11;
      double v13 = [(SDUnlockMotionDetector *)self wristOnDate];
      [v4 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v15 < 180.0)
      {
        uint64_t v16 = [(SDUnlockMotionDetector *)self wristOnDate];

        uint64_t v8 = (void *)v16;
      }
    }
    v17 = [(SDUnlockMotionDetector *)self logType];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Step start date %@", buf, 0xCu);
    }

    v18 = [(SDUnlockMotionDetector *)self pedometerManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100066DBC;
    v19[3] = &unk_1008CB350;
    v19[4] = self;
    [v18 queryPedometerDataFromDate:v8 toDate:v4 withHandler:v19];
  }
  else
  {
    v4 = [(SDUnlockMotionDetector *)self logType];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device off wrist, not checking past step state", buf, 2u);
    }
  }
}

- (void)handleNewAccelerometerData
{
  v3 = [(SDUnlockMotionDetector *)self motionManager];
  v4 = [v3 accelerometerData];
  [v4 acceleration];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  [(SDUnlockMotionDetector *)self baseAcceleration];
  int v12 = (int)(v6 * -100.0 + v11 * 100.0);
  if (v12 >= 0) {
    int v13 = (int)(v6 * -100.0 + v11 * 100.0);
  }
  else {
    int v13 = -v12;
  }
  [(SDUnlockMotionDetector *)self baseAcceleration];
  int v15 = (int)(v8 * -100.0 + v14 * 100.0);
  if (v15 >= 0) {
    int v16 = (int)(v8 * -100.0 + v14 * 100.0);
  }
  else {
    int v16 = -v15;
  }
  [(SDUnlockMotionDetector *)self baseAcceleration];
  int v18 = (int)(v10 * -100.0 + v17 * 100.0);
  if (v18 < 0) {
    int v18 = -v18;
  }
  unsigned int v19 = v16 + v13 + v18;
  v20 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    [(SDUnlockMotionDetector *)self baseAcceleration];
    v24 = +[NSString stringWithFormat:@"x:%f, y:%f, z:%f", v21, v22, v23];
    v25 = +[NSString stringWithFormat:@"x:%f, y:%f, z:%f", *(void *)&v6, *(void *)&v8, *(void *)&v10];
    *(_DWORD *)buf = 138412802;
    v29 = v24;
    __int16 v30 = 2112;
    v31 = v25;
    __int16 v32 = 1024;
    unsigned int v33 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Accelerometer changed (base: (%@), new: (%@), diff: %d)", buf, 0x1Cu);
  }
  if (v19 >= 0x1F)
  {
    v26 = [(SDUnlockMotionDetector *)self logType];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Accelerometer motion detected with sum change: %d", buf, 8u);
    }

    [(SDUnlockMotionDetector *)self setAccelerometerMotion:1];
    if ([(SDUnlockMotionDetector *)self shouldUseAccelerometerMotion])
    {
      v27 = [(SDUnlockMotionDetector *)self logType];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using accelerometer motion", buf, 2u);
      }

      [(SDUnlockMotionDetector *)self handleMotionDetected:1];
    }
  }
}

- (void)handleActivityDetected:(id)a3
{
  id v4 = a3;
  double v5 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity changed %@", (uint8_t *)&v8, 0xCu);
  }

  if ((uint64_t)[v4 confidence] < 1
    || ([v4 stationary] & 1) != 0
    || ([(SDUnlockMotionDetector *)self motionTimer],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    if ([v4 stationary])
    {
      double v7 = [(SDUnlockMotionDetector *)self motionTimer];

      if (v7) {
        [(SDUnlockMotionDetector *)self invalidateMotionTimer];
      }
    }
  }
  else
  {
    [(SDUnlockMotionDetector *)self restartMotionTimer];
  }
}

- (BOOL)hasMotion:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SDUnlockMotionDetector *)self type];
  uint64_t v6 = (uint64_t)[v4 confidence];
  if (v5 == 1)
  {
    if (v6 >= 1)
    {
      if (([v4 walking] & 1) == 0 && (objc_msgSend(v4, "running") & 1) == 0)
      {
LABEL_12:
        unsigned __int8 v7 = [v4 cycling];
        goto LABEL_13;
      }
      goto LABEL_10;
    }
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_13;
  }
  if (v6 < 1) {
    goto LABEL_11;
  }
  if (([v4 walking] & 1) == 0
    && ([v4 running] & 1) == 0
    && ([v4 automotive] & 1) == 0)
  {
    goto LABEL_12;
  }
LABEL_10:
  unsigned __int8 v7 = 1;
LABEL_13:

  return v7;
}

- (void)handlePastActivities:(id)a3 withStartDate:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((id)[(SDUnlockMotionDetector *)self type] == (id)1)
  {
    [(SDUnlockMotionDetector *)self handlePastActivitiesForPhoneAutoUnlock:v7 withStartDate:v6];
  }
  else if (![(SDUnlockMotionDetector *)self type])
  {
    [(SDUnlockMotionDetector *)self handlePastActivitiesForPairedUnlock:v7];
  }
}

- (void)handlePastActivitiesForPairedUnlock:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Past motion activities %@", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v7)
  {
    id v9 = v7;
    double v10 = 0;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v8 = 138412546;
    long long v26 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        int v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (-[SDUnlockMotionDetector hasMotion:](self, "hasMotion:", v13, v26, (void)v27))
        {
          if (!v10)
          {
            double v10 = [v13 startDate];
          }
          double v14 = [(SDUnlockMotionDetector *)self logType];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = [v13 startDate];
            *(_DWORD *)buf = v26;
            id v32 = v10;
            __int16 v33 = 2112;
            v34 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Comparing motion dates (motion start: %@, current: %@)", buf, 0x16u);
          }
          int v16 = [v13 startDate];
          [v16 timeIntervalSinceDate:v10];
          double v18 = v17;

          if (v18 > 3.0)
          {
            [(SDUnlockMotionDetector *)self setActivityMotion:1];
            unsigned int v19 = [(SDUnlockMotionDetector *)self logType];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Activity motion detected", buf, 2u);
            }

            if (![(SDUnlockMotionDetector *)self shouldUseAccelerometerMotion])
            {
              v20 = [(SDUnlockMotionDetector *)self logType];
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Using activity motion", buf, 2u);
              }

              [(SDUnlockMotionDetector *)self handleMotionDetected:1];
            }
          }
        }
        else
        {

          double v10 = 0;
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v9);
  }
  else
  {
    double v10 = 0;
  }

  uint64_t v21 = +[NSDate date];
  uint64_t v22 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v10;
    __int16 v33 = 2112;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Comparing motion date to now (motion start: %@, now: %@)", buf, 0x16u);
  }

  if (v10)
  {
    [v21 timeIntervalSinceDate:v10];
    if (v23 > 3.0)
    {
      [(SDUnlockMotionDetector *)self setActivityMotion:1];
      v24 = [(SDUnlockMotionDetector *)self logType];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Activity motion detected", buf, 2u);
      }

      if (![(SDUnlockMotionDetector *)self shouldUseAccelerometerMotion])
      {
        v25 = [(SDUnlockMotionDetector *)self logType];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Using activity motion", buf, 2u);
        }

        [(SDUnlockMotionDetector *)self handleMotionDetected:1];
      }
    }
  }
}

- (void)handlePastActivitiesForPhoneAutoUnlock:(id)a3 withStartDate:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  long long v26 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v26 integerForKey:@"phoneAutoUnlockWatchMotionActivityThresholdSeconds"];
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = 90;
  }
  id v9 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activity threshold is %d", buf, 8u);
  }

  if ([v6 count])
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
    int v13 = 0;
    while (1)
    {
      double v14 = v12;
      int v15 = [v6 objectAtIndexedSubscript:v10];
      int v16 = [v15 startDate];
      int v12 = [v16 laterDate:v27];

      unint64_t v17 = v10 + 1;
      if ((unint64_t)[v6 count] <= v10 + 1)
      {
        +[NSDate date];
        uint64_t v11 = v18 = v11;
      }
      else
      {
        double v18 = [v6 objectAtIndexedSubscript:v10 + 1];
        uint64_t v19 = [v18 startDate];

        uint64_t v11 = (void *)v19;
      }

      v20 = [v6 objectAtIndexedSubscript:v10];
      unsigned int v21 = [(SDUnlockMotionDetector *)self hasMotion:v20];

      if (v21)
      {
        [v11 timeIntervalSinceDate:v12];
        int v13 = (int)(v22 + (double)v13);
        double v23 = [(SDUnlockMotionDetector *)self logType];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413059;
          long long v29 = v12;
          __int16 v30 = 2112;
          v31 = v11;
          __int16 v32 = 1025;
          int v33 = v13;
          __int16 v34 = 1024;
          int v35 = v8;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Comparing motion dates (motion start: %@, end: %@, elapsed: %{private}d, need: %d)", buf, 0x22u);
        }
      }
      if (v13 > v8)
      {
        v24 = [(SDUnlockMotionDetector *)self logType];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Activity motion detected", buf, 2u);
        }

        if (![(SDUnlockMotionDetector *)self shouldUseAccelerometerMotion]) {
          break;
        }
      }
      unint64_t v10 = v17;
      if ((unint64_t)[v6 count] <= v17) {
        goto LABEL_22;
      }
    }
    uint64_t v25 = 1;
  }
  else
  {
    int v12 = 0;
    uint64_t v11 = 0;
LABEL_22:
    [(SDUnlockMotionDetector *)self setCheckedActivityData:1];
    uint64_t v25 = 0;
  }
  [(SDUnlockMotionDetector *)self handleMotionDetected:v25];
}

- (void)handlePastPedometerData:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 numberOfSteps];
  signed int v6 = [v5 intValue];

  unsigned int v7 = [v4 numberOfPushes];
  signed int v8 = [v7 intValue];

  if (v8 > v6)
  {
    id v9 = [v4 numberOfPushes];
    signed int v6 = [v9 intValue];
  }
  unint64_t v10 = +[NSUserDefaults standardUserDefaults];
  unsigned int v11 = [v10 integerForKey:@"phoneAutoUnlockWatchStepCountThreshold"];
  if (v11) {
    int v12 = v11;
  }
  else {
    int v12 = 10;
  }
  int v13 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    LODWORD(v18[0]) = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Step activity threshold is %d", (uint8_t *)&v17, 8u);
  }

  double v14 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138477827;
    v18[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "step count: %{private}@", (uint8_t *)&v17, 0xCu);
  }

  int v15 = [(SDUnlockMotionDetector *)self logType];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v6 < v12)
  {
    if (v16)
    {
      int v17 = 67174913;
      LODWORD(v18[0]) = v6;
      WORD2(v18[0]) = 1024;
      *(_DWORD *)((char *)v18 + 6) = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not enough step data. Steps: %{private}d, threshold: %d", (uint8_t *)&v17, 0xEu);
    }

    [(SDUnlockMotionDetector *)self setCheckedStepData:1];
  }
  else
  {
    if (v16)
    {
      int v17 = 67174657;
      LODWORD(v18[0]) = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Step activity detected. Steps: %{private}d", (uint8_t *)&v17, 8u);
    }
  }
  [(SDUnlockMotionDetector *)self handleMotionDetected:v6 >= v12];
}

- (void)handleMotionDetected:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detected motion %@", buf, 0xCu);
  }

  if ((id)[(SDUnlockMotionDetector *)self type] != (id)1 || v3) {
    goto LABEL_17;
  }
  unsigned int v7 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ([(SDUnlockMotionDetector *)self checkedStepData]) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    if ([(SDUnlockMotionDetector *)self checkedActivityData]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v13 = v8;
    __int16 v14 = 2112;
    CFStringRef v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checked step data: %@, checked activity data: %@", buf, 0x16u);
  }

  if ([(SDUnlockMotionDetector *)self checkedActivityData])
  {
    if ([(SDUnlockMotionDetector *)self checkedStepData])
    {
LABEL_17:
      [(SDUnlockMotionDetector *)self setMotionDetected:v3];
      handlerQueue = self->_handlerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100067F20;
      block[3] = &unk_1008CA4B8;
      block[4] = self;
      dispatch_async(handlerQueue, block);
    }
  }
}

- (void)restartMotionTimer
{
  BOOL v3 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting motion timer", buf, 2u);
  }

  id v4 = [(SDUnlockMotionDetector *)self motionTimer];

  if (!v4)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    int64_t v5 = SFMainQueue();
    unint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    int v12 = sub_100068140;
    CFStringRef v13 = &unk_1008CA580;
    __int16 v14 = self;
    objc_copyWeak(&v15, (id *)buf);
    CFStringRef v6 = sub_1001B1B10(0, v5, &v10);
    -[SDUnlockMotionDetector setMotionTimer:](self, "setMotionTimer:", v6, v10, v11, v12, v13, v14);

    unsigned int v7 = [(SDUnlockMotionDetector *)self motionTimer];
    dispatch_resume(v7);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  CFStringRef v8 = [(SDUnlockMotionDetector *)self motionTimer];
  dispatch_time_t v9 = sub_1001B1AF8(1.0);
  sub_1001B1BC4(v8, v9);
}

- (void)invalidateMotionTimer
{
  BOOL v3 = [(SDUnlockMotionDetector *)self logType];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating motion timer", v6, 2u);
  }

  id v4 = [(SDUnlockMotionDetector *)self motionTimer];

  if (v4)
  {
    int64_t v5 = [(SDUnlockMotionDetector *)self motionTimer];
    dispatch_source_cancel(v5);

    [(SDUnlockMotionDetector *)self setMotionTimer:0];
  }
}

- (BOOL)shouldUseAccelerometerMotion
{
  return sub_1000D9060(@"PUUseAccelerometerMotion", 0) != 0;
}

- (BOOL)motionDetected
{
  return self->_motionDetected;
}

- (void)setMotionDetected:(BOOL)a3
{
  self->_motionDetected = a3;
}

- (BOOL)accelerometerMotion
{
  return self->_accelerometerMotion;
}

- (void)setAccelerometerMotion:(BOOL)a3
{
  self->_accelerometerMotion = a3;
}

- (BOOL)activityMotion
{
  return self->_activityMotion;
}

- (void)setActivityMotion:(BOOL)a3
{
  self->_activityMotion = a3;
}

- (id)motionDetectedHandler
{
  return self->_motionDetectedHandler;
}

- (void)setMotionDetectedHandler:(id)a3
{
}

- (NSDate)wristOnDate
{
  return self->_wristOnDate;
}

- (void)setWristOnDate:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (OS_os_log)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
}

- (BOOL)activateCalled
{
  return self->_activateCalled;
}

- (void)setActivateCalled:(BOOL)a3
{
  self->_activateCalled = a3;
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)baseAccelerationSet
{
  return self->_baseAccelerationSet;
}

- (void)setBaseAccelerationSet:(BOOL)a3
{
  self->_baseAccelerationSet = a3;
}

- (OS_dispatch_source)motionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMotionTimer:(id)a3
{
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (CMPedometer)pedometerManager
{
  return self->_pedometerManager;
}

- (void)setPedometerManager:(id)a3
{
}

- (CMMotionActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActivityManager:(id)a3
{
}

- ($1AB5FA073B851C12C2339EC22442E995)baseAcceleration
{
  double x = self->_baseAcceleration.x;
  double y = self->_baseAcceleration.y;
  double z = self->_baseAcceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setBaseAcceleration:(id)a3
{
  self->_baseAcceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (BOOL)checkedActivityData
{
  return self->_checkedActivityData;
}

- (void)setCheckedActivityData:(BOOL)a3
{
  self->_checkedActivityData = a3;
}

- (BOOL)checkedStepData
{
  return self->_checkedStepData;
}

- (void)setCheckedStepData:(BOOL)a3
{
  self->_checkedStepData = a3;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_pedometerManager, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_motionTimer, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_wristOnDate, 0);

  objc_storeStrong(&self->_motionDetectedHandler, 0);
}

@end