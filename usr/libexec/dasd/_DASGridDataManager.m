@interface _DASGridDataManager
+ (id)sharedInstance;
- (BOOL)isCarbonImpactHighForState:(id)a3;
- (BOOL)isHighCarbonImpactWindow;
- (NSDate)carbonImpactWindowEndDate;
- (NSDate)carbonImpactWindowFetchTime;
- (NSDate)carbonImpactWindowStartDate;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASGridDataManager)init;
- (_OSChargingPredictor)pluggedInPredictor;
- (double)forecastCacheSeconds;
- (double)pluggedInPredictionInterval;
- (double)predictedPluggedInterval;
- (id)carbonImpactWindowStartForForecast:(id)a3 withStartDate:(id)a4 windowSize:(double)a5;
- (id)forecastForTimeInterval:(double)a3 from:(id)a4;
- (int)debugNotifyToken;
- (void)loadState;
- (void)monitorPluggedInState;
- (void)resetState;
- (void)saveCarbonImpactWindowState;
- (void)setCarbonImpactWindowEndDate:(id)a3;
- (void)setCarbonImpactWindowFetchTime:(id)a3;
- (void)setCarbonImpactWindowStartDate:(id)a3;
- (void)setContext:(id)a3;
- (void)setDebugNotifyToken:(int)a3;
- (void)setDefaults:(id)a3;
- (void)setForecastCacheSeconds:(double)a3;
- (void)setLog:(id)a3;
- (void)setPluggedInPredictionInterval:(double)a3;
- (void)setPluggedInPredictor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setupHighCarbonImpactWindow:(double)a3;
- (void)updatePredictedInterval;
@end

@implementation _DASGridDataManager

- (BOOL)isCarbonImpactHighForState:(id)a3
{
  unsigned int v4 = +[_DASSystemContext isPluggedIn:a3];
  if (v4)
  {
    if (!self->_carbonImpactWindowStartDate
      || ([(NSDate *)self->_carbonImpactWindowFetchTime timeIntervalSinceNow],
          v5 < -self->_forecastCacheSeconds))
    {
      double pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
      if (pluggedInPredictionInterval == -99999.0)
      {
        [(_DASGridDataManager *)self updatePredictedInterval];
        double pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
      }
      [(_DASGridDataManager *)self setupHighCarbonImpactWindow:pluggedInPredictionInterval];
    }
    [(NSDate *)self->_carbonImpactWindowStartDate timeIntervalSinceNow];
    LOBYTE(v4) = v7 < 0.0
              && ([(NSDate *)self->_carbonImpactWindowEndDate timeIntervalSinceNow], v8 > 0.0);
  }
  return v4;
}

- (BOOL)isHighCarbonImpactWindow
{
  return [(_DASGridDataManager *)self isCarbonImpactHighForState:self->_context];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D6E0;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3C40 != -1) {
    dispatch_once(&qword_1001C3C40, block);
  }
  v2 = (void *)qword_1001C3C48;

  return v2;
}

- (_DASGridDataManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)_DASGridDataManager;
  v2 = [(_DASGridDataManager *)&v20 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "GridDataManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    double v5 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    defaults = v2->_defaults;
    v2->_defaults = v5;

    double v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.das.griddatamanager", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v2->_forecastCacheSeconds = 14400.0;
    [(_DASGridDataManager *)v2 loadState];
    uint64_t v10 = +[_CDClientContext userContext];
    context = v2->_context;
    v2->_context = (_CDContext *)v10;

    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v12 = (void *)qword_1001C3C50;
    uint64_t v25 = qword_1001C3C50;
    if (!qword_1001C3C50)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10003ED24;
      v21[3] = &unk_100175628;
      v21[4] = &v22;
      sub_10003ED24((uint64_t)v21);
      v12 = (void *)v23[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v22, 8);
    uint64_t v14 = [v13 predictor];
    pluggedInPredictor = v2->_pluggedInPredictor;
    v2->_pluggedInPredictor = (_OSChargingPredictor *)v14;

    [(_DASGridDataManager *)v2 monitorPluggedInState];
    v2->_debugNotifyToken = -1;
    v16 = dispatch_get_global_queue(-32768, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003D96C;
    v18[3] = &unk_1001759D0;
    v19 = v2;
    notify_register_dispatch("com.apple.dasd.testGridDataManager", &v2->_debugNotifyToken, v16, v18);
  }
  return v2;
}

- (void)monitorPluggedInState
{
  os_log_t v3 = +[_CDContextQueries keyPathForPluginStatus];
  unsigned int v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003DAA0;
  v6[3] = &unk_100175758;
  v6[4] = self;
  double v5 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.das.environmentpolicy.pluggedInState" contextualPredicate:v4 clientIdentifier:@"com.apple.dasd.contextstore-registration" callback:v6];

  [(_CDContext *)self->_context registerCallback:v5];
}

- (void)setupHighCarbonImpactWindow:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DCA4;
  v4[3] = &unk_100175F40;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (id)forecastForTimeInterval:(double)a3 from:(id)a4
{
  double v5 = [a4 forecastMap];
  if ([v5 count])
  {
    v6 = +[NSMutableArray array];
    double v7 = [v5 allKeys];
    id v8 = [v7 mutableCopy];

    id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"self" ascending:1];
    id v17 = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:&v17 count:1];
    [v8 sortUsingDescriptors:v10];

    id v11 = [v8 count];
    if ((unint64_t)v11 >= (a3 / 900.0)) {
      unint64_t v12 = (a3 / 900.0);
    }
    else {
      unint64_t v12 = (unint64_t)v11;
    }
    if (v12)
    {
      for (i = 0; i != (char *)v12; ++i)
      {
        uint64_t v14 = [v8 objectAtIndexedSubscript:i];
        v15 = [v5 objectForKeyedSubscript:v14];

        [v6 addObject:v15];
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)predictedPluggedInterval
{
  pluggedInPredictor = self->_pluggedInPredictor;
  id v18 = 0;
  unsigned int v4 = [(_OSChargingPredictor *)pluggedInPredictor chargePredictionOutputOfScheme:0 withError:&v18];
  id v5 = v18;
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = log;
      id v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      double v20 = *(double *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error querying the predictor through the client %@", buf, 0xCu);
    }
  }
  [v4 confidence];
  double v10 = v9;
  [v4 chargingDuration];
  double v12 = v11;
  id v13 = self->_log;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v20 = v12;
    __int16 v21 = 2048;
    double v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "OSIntelligence predicts Interval:%lf, Confidence:%lf", buf, 0x16u);
  }
  BOOL v14 = v10 < 0.75;
  double v15 = 0.0;
  if (v14) {
    double v16 = 0.0;
  }
  else {
    double v16 = v12;
  }
  if (v16 >= 7200.0)
  {
    double v15 = v16;
    if (v16 > 27000.0) {
      double v15 = 27000.0;
    }
  }

  return v15;
}

- (id)carbonImpactWindowStartForForecast:(id)a3 withStartDate:(id)a4 windowSize:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    id v10 = [v8 mutableCopy];
    [v10 sortUsingComparator:&stru_100175F60];
    double v11 = [v10 objectAtIndexedSubscript:0];
    [v11 doubleValue];
    double v13 = v12;
    BOOL v14 = [v10 lastObject];
    [v14 doubleValue];
    double v16 = vabdd_f64(v13, v15);

    if (v16 >= 100.0)
    {
      unint64_t v25 = (unint64_t)fmax(floor(a5 / 900.0) + -1.0, 0.0);
      if ((unint64_t)[v8 count] >= v25)
      {
        id v45 = v10;
        id v46 = v9;
        v44 = self;
        if (v25)
        {
          uint64_t v26 = 0;
          v27 = 0;
          do
          {
            v28 = [v8 objectAtIndexedSubscript:v26];
            v27 = &v27[(void)[v28 unsignedIntegerValue]];

            ++v26;
          }
          while (v25 != v26);
        }
        else
        {
          v27 = 0;
        }
        if ((unint64_t)[v8 count] <= v25
          || (v29 = (char *)[v8 count], v30 = &v29[-v25], v29 == (char *)v25))
        {
          unint64_t v31 = 0;
        }
        else
        {
          v32 = 0;
          unint64_t v31 = 0;
          v33 = 0;
          do
          {
            v34 = [v8 objectAtIndexedSubscript:&v32[v25]];
            v35 = &v27[(void)[v34 unsignedIntegerValue]];

            BOOL v36 = v35 >= v33;
            if (v35 > v33) {
              v33 = v35;
            }
            if (v36) {
              unint64_t v31 = (unint64_t)v32;
            }
            v37 = [v8 objectAtIndexedSubscript:v32];
            int64_t v38 = v27 - (unsigned char *)[v37 unsignedIntegerValue];

            v39 = [v8 objectAtIndexedSubscript:&v32[v25]];
            v27 = (char *)[v39 unsignedIntegerValue] + v38;

            ++v32;
          }
          while (v30 != v32);
        }
        log = v44->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v41 = log;
          v42 = [v8 objectAtIndexedSubscript:v31];
          *(_DWORD *)buf = 134218242;
          unint64_t v48 = v31;
          __int16 v49 = 2112;
          v50 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "HighCarbonImpact startIndex %lu, startValue %@", buf, 0x16u);
        }
        id v9 = v46;
        uint64_t v24 = +[NSDate dateWithTimeInterval:v46 sinceDate:(double)v31 * 900.0];
        id v10 = v45;
      }
      else
      {
        uint64_t v24 = 0;
      }
    }
    else
    {
      id v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        v19 = [v10 objectAtIndexedSubscript:0];
        [v19 doubleValue];
        unint64_t v21 = v20;
        double v22 = [v10 lastObject];
        [v22 doubleValue];
        *(_DWORD *)buf = 134218240;
        unint64_t v48 = v21;
        __int16 v49 = 2048;
        v50 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not enough variation in forecast values (%lf - %lf). Bailing", buf, 0x16u);
      }
      uint64_t v24 = +[NSDate distantPast];
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)resetState
{
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"pluggedInPredictionInterval"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"carbonImpactStartDateInterval"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"carbonImpactEndDateInterval"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"carbonImpactFetchDateInterval"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"forecastCacheInterval"];
  self->_double pluggedInPredictionInterval = -99999.0;
  carbonImpactWindowStartDate = self->_carbonImpactWindowStartDate;
  self->_carbonImpactWindowStartDate = 0;

  carbonImpactWindowEndDate = self->_carbonImpactWindowEndDate;
  self->_carbonImpactWindowEndDate = 0;

  carbonImpactWindowFetchTime = self->_carbonImpactWindowFetchTime;
  self->_carbonImpactWindowFetchTime = 0;

  self->_forecastCacheSeconds = 14400.0;
}

- (void)loadState
{
  os_log_t v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"pluggedInPredictionInterval"];
  unsigned int v4 = v3;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    double v5 = -99999.0;
  }
  self->_double pluggedInPredictionInterval = v5;
  v6 = [(NSUserDefaults *)self->_defaults objectForKey:@"carbonImpactStartDateInterval"];

  if (v6)
  {
    [v6 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    double v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    carbonImpactWindowStartDate = self->_carbonImpactWindowStartDate;
    self->_carbonImpactWindowStartDate = v7;
  }
  id v9 = [(NSUserDefaults *)self->_defaults objectForKey:@"carbonImpactEndDateInterval"];

  if (v9)
  {
    [v9 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    carbonImpactWindowEndDate = self->_carbonImpactWindowEndDate;
    self->_carbonImpactWindowEndDate = v10;
  }
  double v12 = [(NSUserDefaults *)self->_defaults objectForKey:@"carbonImpactFetchDateInterval"];

  if (v12)
  {
    [v12 doubleValue];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    double v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    carbonImpactWindowFetchTime = self->_carbonImpactWindowFetchTime;
    self->_carbonImpactWindowFetchTime = v13;
  }
  double v15 = [(NSUserDefaults *)self->_defaults objectForKey:@"forecastCacheInterval"];

  if (v15)
  {
    [v15 doubleValue];
    self->_double forecastCacheSeconds = fmax(v16, 14400.0);
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_carbonImpactWindowEndDate;
    double pluggedInPredictionInterval = self->_pluggedInPredictionInterval;
    unint64_t v20 = self->_carbonImpactWindowFetchTime;
    double forecastCacheSeconds = self->_forecastCacheSeconds;
    unint64_t v21 = self->_carbonImpactWindowStartDate;
    int v23 = 134219010;
    double v24 = pluggedInPredictionInterval;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2048;
    double v32 = forecastCacheSeconds;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loaded state: PluggedIn interval %lf, carbonImpactStart %@, carbonImpactEnd %@, FetchDate %@, Forecast Cache internal %f", (uint8_t *)&v23, 0x34u);
  }
}

- (void)updatePredictedInterval
{
  [(_DASGridDataManager *)self predictedPluggedInterval];
  self->_double pluggedInPredictionInterval = v3;
  defaults = self->_defaults;

  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"pluggedInPredictionInterval");
}

- (void)saveCarbonImpactWindowState
{
  [(NSDate *)self->_carbonImpactWindowStartDate timeIntervalSinceReferenceDate];
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", @"carbonImpactStartDateInterval");
  [(NSDate *)self->_carbonImpactWindowEndDate timeIntervalSinceReferenceDate];
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", @"carbonImpactEndDateInterval");
  [(NSDate *)self->_carbonImpactWindowFetchTime timeIntervalSinceReferenceDate];
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", @"carbonImpactFetchDateInterval");
  double forecastCacheSeconds = self->_forecastCacheSeconds;
  defaults = self->_defaults;

  [(NSUserDefaults *)defaults setDouble:@"forecastCacheInterval" forKey:forecastCacheSeconds];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)debugNotifyToken
{
  return self->_debugNotifyToken;
}

- (void)setDebugNotifyToken:(int)a3
{
  self->_debugNotifyToken = a3;
}

- (NSDate)carbonImpactWindowFetchTime
{
  return self->_carbonImpactWindowFetchTime;
}

- (void)setCarbonImpactWindowFetchTime:(id)a3
{
}

- (_OSChargingPredictor)pluggedInPredictor
{
  return self->_pluggedInPredictor;
}

- (void)setPluggedInPredictor:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (double)forecastCacheSeconds
{
  return self->_forecastCacheSeconds;
}

- (void)setForecastCacheSeconds:(double)a3
{
  self->_double forecastCacheSeconds = a3;
}

- (NSDate)carbonImpactWindowStartDate
{
  return self->_carbonImpactWindowStartDate;
}

- (void)setCarbonImpactWindowStartDate:(id)a3
{
}

- (NSDate)carbonImpactWindowEndDate
{
  return self->_carbonImpactWindowEndDate;
}

- (void)setCarbonImpactWindowEndDate:(id)a3
{
}

- (double)pluggedInPredictionInterval
{
  return self->_pluggedInPredictionInterval;
}

- (void)setPluggedInPredictionInterval:(double)a3
{
  self->_double pluggedInPredictionInterval = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_carbonImpactWindowEndDate, 0);
  objc_storeStrong((id *)&self->_carbonImpactWindowStartDate, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_pluggedInPredictor, 0);
  objc_storeStrong((id *)&self->_carbonImpactWindowFetchTime, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end