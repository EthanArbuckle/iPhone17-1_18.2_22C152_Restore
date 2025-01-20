@interface _APRSPLLogger
+ (id)sharedInstance;
+ (id)topPredictionsFromScores:(id)a3;
- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5;
- (BOOL)getInferredCarryStatus;
- (BOOL)powerLogExists;
- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4;
- (NSDate)lastCAReportedDate;
- (NSDate)lastReportedDate;
- (NSMutableArray)lastPredictions;
- (NSMutableDictionary)predictionAccuracies;
- (NSUserDefaults)defaults;
- (OS_os_log)log;
- (_APRSPLLogger)init;
- (_CDContextualKeyPath)inferredCarryStatusKeyPath;
- (id)appsFromProactiveSuggestions;
- (id)computeAccuraciesWithLastPredictions:(id)a3 andAppsLaunched:(id)a4;
- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4;
- (id)concatenateEventsPrivate:(id)a3;
- (id)generateAccuraciesCAEventDictionary;
- (id)queryAppsLaunchedFromStartDate:(id)a3 toEndDate:(id)a4;
- (int)token;
- (void)initializeCarryStatusLogging;
- (void)logAppResumePredictions:(id)a3 durationCheck:(BOOL)a4;
- (void)logDock:(id)a3 pid:(int)a4 state:(unint64_t)a5;
- (void)logFreezerSkipReasons:(id)a3;
- (void)logPrewarm:(id)a3 pid:(int)a4;
- (void)logUpdatedCarryStatus;
- (void)reportAppResumePredictions;
- (void)setDefaults:(id)a3;
- (void)setInferredCarryStatusKeyPath:(id)a3;
- (void)setLastCAReportedDate:(id)a3;
- (void)setLastPredictions:(id)a3;
- (void)setLastReportedDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPowerLogExists:(BOOL)a3;
- (void)setPredictionAccuracies:(id)a3;
- (void)setToken:(int)a3;
@end

@implementation _APRSPLLogger

- (_APRSPLLogger)init
{
  v31.receiver = self;
  v31.super_class = (Class)_APRSPLLogger;
  v2 = [(_APRSPLLogger *)&v31 init];
  if (!v2)
  {
LABEL_6:
    v24 = v2;
    goto LABEL_10;
  }
  os_log_t v3 = os_log_create("com.apple.aprs", "appResume");
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  BOOL v5 = dlopen_preflight((const char *)[@"/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog" UTF8String]);
  v2->_powerLogExists = v5;
  if (v5)
  {
    v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    defaults = v2->_defaults;
    v2->_defaults = v6;

    [(NSUserDefaults *)v2->_defaults doubleForKey:@"appResumePredictionsReportedDate"];
    uint64_t v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    lastReportedDate = v2->_lastReportedDate;
    v2->_lastReportedDate = (NSDate *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v2->_lastReportedDate;
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last reported date for App predictions to PowerLog is %@", buf, 0xCu);
    }
    uint64_t v12 = +[_CDContextualKeyPath keyPathWithKey:@"/das/inferredCarryStatus"];
    inferredCarryStatusKeyPath = v2->_inferredCarryStatusKeyPath;
    v2->_inferredCarryStatusKeyPath = (_CDContextualKeyPath *)v12;

    [(_APRSPLLogger *)v2 initializeCarryStatusLogging];
    v2->_token = -1;
    v14 = dispatch_get_global_queue(-2, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100038BAC;
    handler[3] = &unk_1001759D0;
    v15 = v2;
    v30 = v15;
    notify_register_dispatch("com.apple.das.logPrewarmDock", &v2->_token, v14, handler);

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    predictionAccuracies = v15->_predictionAccuracies;
    v15->_predictionAccuracies = v16;

    v18 = [(NSUserDefaults *)v2->_defaults objectForKey:@"appResumeProactivePredictionsAccuracy"];
    v19 = +[_DASPredictionAccuracy initFromDictionaryRepresentation:v18];
    [(NSMutableDictionary *)v15->_predictionAccuracies setObject:v19 forKeyedSubscript:@"proactive"];

    v20 = [(NSUserDefaults *)v2->_defaults objectForKey:@"appResumeSwapPredictionsAccuracy"];
    v21 = +[_DASPredictionAccuracy initFromDictionaryRepresentation:v20];
    [(NSMutableDictionary *)v15->_predictionAccuracies setObject:v21 forKeyedSubscript:@"swap"];

    uint64_t v22 = +[NSDate distantPast];
    lastCAReportedDate = v15->_lastCAReportedDate;
    v15->_lastCAReportedDate = (NSDate *)v22;

    goto LABEL_6;
  }
  v25 = v2->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = (NSDate *)[@"/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog" UTF8String];
    *(_DWORD *)buf = 136315138;
    v33 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Powerlog library at %s does not exist", buf, 0xCu);
  }
  v24 = 0;
LABEL_10:

  return v24;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038D38;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3BF8 != -1) {
    dispatch_once(&qword_1001C3BF8, block);
  }
  v2 = (void *)qword_1001C3BF0;

  return v2;
}

+ (id)topPredictionsFromScores:(id)a3
{
  id v3 = a3;
  v4 = [v3 keysSortedByValueUsingComparator:&stru_100175D10];
  BOOL v5 = +[NSMutableDictionary dictionary];
  if ((unint64_t)[v3 count] > 9)
  {
    int v6 = 10;
  }
  else
  {
    int v6 = [v3 count];
    if (v6 < 1) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = 0;
  uint64_t v8 = v6;
  do
  {
    v9 = [v4 objectAtIndexedSubscript:v7];
    v10 = [v3 objectForKeyedSubscript:v9];
    v11 = [v4 objectAtIndexedSubscript:v7];
    [v5 setObject:v10 forKeyedSubscript:v11];

    ++v7;
  }
  while (v8 != v7);
LABEL_7:

  return v5;
}

- (void)logAppResumePredictions:(id)a3 durationCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_powerLogExists)
  {
    if (v4 && ([(NSDate *)self->_lastReportedDate timeIntervalSinceNow], v7 > -1800.0))
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Reported predictions to PowerLog in last 30 mins. Skipping";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      }
    }
    else
    {
      +[NSMutableArray array];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100039224;
      v26[3] = &unk_100175498;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = v10;
      [v6 enumerateKeysAndObjectsUsingBlock:v26];
      v11 = [(_APRSPLLogger *)self appsFromProactiveSuggestions];
      v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_100039300;
      v24 = &unk_100175498;
      uint64_t v12 = (NSMutableArray *)v10;
      v25 = v12;
      [v11 enumerateKeysAndObjectsUsingBlock:&v21];
      CFStringRef v30 = @"appResumePredictions";
      objc_super v31 = v12;
      v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v21, v22, v23, v24);
      v14 = self->_log;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Logging to PowerLog %@", buf, 0xCu);
      }
      PLLogRegisteredEvent();
      v15 = +[NSDate date];
      lastReportedDate = self->_lastReportedDate;
      self->_lastReportedDate = v15;

      defaults = self->_defaults;
      [(NSDate *)self->_lastReportedDate timeIntervalSinceReferenceDate];
      -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"appResumePredictionsReportedDate");
      if (self->_lastPredictions)
      {
        v18 = self->_log;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Updating accuracies", buf, 2u);
        }
        [(_APRSPLLogger *)self reportAppResumePredictions];
      }
      lastPredictions = self->_lastPredictions;
      self->_lastPredictions = v12;
      v20 = v12;
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "PowerLog does not exist";
      goto LABEL_15;
    }
  }
}

- (void)reportAppResumePredictions
{
  lastReportedDate = self->_lastReportedDate;
  BOOL v4 = [(NSDate *)lastReportedDate dateByAddingTimeInterval:1800.0];
  BOOL v5 = [(_APRSPLLogger *)self queryAppsLaunchedFromStartDate:lastReportedDate toEndDate:v4];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Apps Launched in the last prediction window %@", (uint8_t *)&buf, 0xCu);
  }
  double v7 = [(_APRSPLLogger *)self computeAccuraciesWithLastPredictions:self->_lastPredictions andAppsLaunched:v5];
  uint64_t v8 = [(NSMutableDictionary *)self->_predictionAccuracies objectForKeyedSubscript:@"proactive"];
  v9 = [v7 objectForKeyedSubscript:@"proactive"];
  id v10 = [v8 addPredictionAccuracy:v9];
  [(NSMutableDictionary *)self->_predictionAccuracies setObject:v10 forKeyedSubscript:@"proactive"];

  v11 = [(NSMutableDictionary *)self->_predictionAccuracies objectForKeyedSubscript:@"swap"];
  uint64_t v12 = [v7 objectForKeyedSubscript:@"swap"];
  v13 = [v11 addPredictionAccuracy:v12];
  [(NSMutableDictionary *)self->_predictionAccuracies setObject:v13 forKeyedSubscript:@"swap"];

  [(NSDate *)self->_lastCAReportedDate timeIntervalSinceNow];
  if (v14 < -86400.0)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000;
    CFStringRef v30 = sub_1000397E8;
    objc_super v31 = sub_1000397F8;
    id v32 = [(_APRSPLLogger *)self generateAccuraciesCAEventDictionary];
    v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v26 = 138412290;
      uint64_t v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Posting app prediction accuracy CA Event %@", v26, 0xCu);
    }
    AnalyticsSendEventLazy();
    v17 = +[NSDate now];
    lastCAReportedDate = self->_lastCAReportedDate;
    self->_lastCAReportedDate = v17;

    [(NSUserDefaults *)self->_defaults setObject:self->_lastCAReportedDate forKey:@"appResumePredictionsAccuracyCAReportedKey"];
    v19 = objc_alloc_init(_DASPredictionAccuracy);
    [(NSMutableDictionary *)self->_predictionAccuracies setObject:v19 forKeyedSubscript:@"proactive"];

    v20 = objc_alloc_init(_DASPredictionAccuracy);
    [(NSMutableDictionary *)self->_predictionAccuracies setObject:v20 forKeyedSubscript:@"swap"];

    _Block_object_dispose(&buf, 8);
  }
  defaults = self->_defaults;
  p_defaults = &self->_defaults;
  v23 = [(NSUserDefaults *)p_defaults[5] objectForKeyedSubscript:@"proactive"];
  [(NSUserDefaults *)defaults setObject:v23 forKey:@"appResumeProactivePredictionsAccuracy"];

  v24 = *p_defaults;
  v25 = [(NSUserDefaults *)p_defaults[5] objectForKeyedSubscript:@"swap"];
  [(NSUserDefaults *)v24 setObject:v25 forKey:@"appResumeSwapPredictionsAccuracy"];
}

- (id)queryAppsLaunchedFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[BMStreams appLaunch];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Querying for app launch between %@ and %@", buf, 0x16u);
  }
  [v6 timeIntervalSinceReferenceDate];
  double v11 = v10;
  [v7 timeIntervalSinceReferenceDate];
  uint64_t v13 = v12;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = [v8 publisherFromStartTime:v11];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039A64;
  v19[3] = &unk_100175DA0;
  uint64_t v21 = v13;
  id v16 = v14;
  id v20 = v16;
  id v17 = [v15 sinkWithCompletion:&stru_100175D78 receiveInput:v19];

  return v16;
}

- (id)computeAccuraciesWithLastPredictions:(id)a3 andAppsLaunched:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  [v7 sortUsingComparator:&stru_100175DE0];
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_100039E58;
  __int16 v24 = &unk_100175E08;
  id v10 = v8;
  id v25 = v10;
  id v11 = v9;
  id v26 = v11;
  [v7 enumerateObjectsUsingBlock:&v21];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Proactive predictions %@ \n Swap predictions %@", buf, 0x16u);
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v14 = +[_DASPredictionUtilites computeAccuraciesFromSortedPredictions:andObservations:withEqualityOperator:](_DASPredictionUtilites, "computeAccuraciesFromSortedPredictions:andObservations:withEqualityOperator:", v10, v6, &stru_100175E48, v21, v22, v23, v24);
  v15 = +[_DASPredictionUtilites computeAccuraciesFromSortedPredictions:v11 andObservations:v6 withEqualityOperator:&stru_100175E68];

  [v13 setObject:v14 forKeyedSubscript:@"proactive"];
  [v13 setObject:v15 forKeyedSubscript:@"swap"];
  id v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    v18 = [v13 objectForKeyedSubscript:@"proactive"];
    v19 = [v13 objectForKeyedSubscript:@"swap"];
    *(_DWORD *)long long buf = 138412546;
    id v28 = v18;
    __int16 v29 = 2112;
    id v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Proactive predictions accuracy %@ \n Swap predictions accuracy %@", buf, 0x16u);
  }

  return v13;
}

- (id)generateAccuraciesCAEventDictionary
{
  id v3 = [(NSMutableDictionary *)self->_predictionAccuracies objectForKeyedSubscript:@"swap"];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ((int)[v3 totalPredictionIntervals] >= 1)
  {
    BOOL v5 = [v3 accuracyRate];
    id v6 = [v5 objectForKeyedSubscript:@"top1"];
    [v4 setObject:v6 forKeyedSubscript:@"swap_top1"];

    id v7 = [v5 objectForKeyedSubscript:@"top3"];
    [v4 setObject:v7 forKeyedSubscript:@"swap_top3"];

    id v8 = [v5 objectForKeyedSubscript:@"top5"];
    [v4 setObject:v8 forKeyedSubscript:@"swap_top5"];

    id v9 = [v5 objectForKeyedSubscript:@"top10"];
    [v4 setObject:v9 forKeyedSubscript:@"swap_top10"];
  }
  id v10 = [(NSMutableDictionary *)self->_predictionAccuracies objectForKeyedSubscript:@"proactive"];
  if ((int)[v10 totalPredictionIntervals] >= 1)
  {
    id v11 = [v10 accuracyRate];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"top1"];
    [v4 setObject:v12 forKeyedSubscript:@"proactive_top1"];

    id v13 = [v11 objectForKeyedSubscript:@"top3"];
    [v4 setObject:v13 forKeyedSubscript:@"proactive_top3"];

    id v14 = [v11 objectForKeyedSubscript:@"top5"];
    [v4 setObject:v14 forKeyedSubscript:@"proactive_top5"];

    v15 = [v11 objectForKeyedSubscript:@"top10"];
    [v4 setObject:v15 forKeyedSubscript:@"proactive_top10"];
  }

  return v4;
}

- (void)logFreezerSkipReasons:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_powerLogExists)
  {
    CFStringRef v9 = @"Applications";
    id v10 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F484C();
    }
    PLLogRegisteredEvent();
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", v8, 2u);
    }
  }
}

- (void)logPrewarm:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = v6;
  if (self->_powerLogExists)
  {
    v12[0] = @"BundleID";
    v12[1] = @"PID";
    v13[0] = v6;
    id v8 = +[NSNumber numberWithInt:v4];
    v13[1] = v8;
    CFStringRef v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F48B4();
    }
    PLLogRegisteredEvent();
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", v11, 2u);
    }
  }
}

- (void)logDock:(id)a3 pid:(int)a4 state:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  CFStringRef v9 = v8;
  if (self->_powerLogExists)
  {
    v16[0] = v8;
    v15[0] = @"BundleID";
    v15[1] = @"PID";
    id v10 = +[NSNumber numberWithInt:v6];
    v16[1] = v10;
    v15[2] = @"State";
    id v11 = +[NSNumber numberWithUnsignedInteger:a5];
    v16[2] = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F491C();
    }
    PLLogRegisteredEvent();
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "PowerLog does not exist", v14, 2u);
    }
  }
}

- (id)appsFromProactiveSuggestions
{
  id v3 = +[NSMutableDictionary dictionary];
  if (dlopen_preflight((const char *)[@"/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient" UTF8String]))
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    uint64_t v4 = (void *)qword_1001C3C00;
    uint64_t v35 = qword_1001C3C00;
    if (!qword_1001C3C00)
    {
      *(void *)long long buf = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      __int16 v29 = sub_10003B5A8;
      id v30 = &unk_100175628;
      objc_super v31 = &v32;
      sub_10003B5A8((uint64_t)buf);
      uint64_t v4 = (void *)v33[3];
    }
    BOOL v5 = v4;
    _Block_object_dispose(&v32, 8);
    id v22 = [[v5 alloc] initWithConsumerSubType:9];
    uint64_t v6 = [v22 suggestionLayoutFromCache];
    uint64_t v21 = v6;
    if (v6)
    {
      id v7 = [v6 allSuggestionsInLayout:v6];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v24;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v12 = [v11 executableSpecification];
            id v13 = [v12 executableObject];

            if (v13)
            {
              id v14 = [v11 scoreSpecification];
              [v14 rawScore];
              v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              id v16 = [v13 description];
              [v3 setObject:v15 forKeyedSubscript:v16];
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v23 objects:v36 count:16];
        }
        while (v8);
      }
      id v17 = +[_APRSPLLogger topPredictionsFromScores:v3];
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Proactive predictions not cached, returning nil", buf, 2u);
      }
      id v17 = 0;
    }
  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      sub_1000F3014((os_log_t)v18);
    }
    id v17 = 0;
  }

  return v17;
}

- (BOOL)getInferredCarryStatus
{
  id v3 = +[_CDClientContext userContext];
  uint64_t v4 = [v3 objectForKeyedSubscript:self->_inferredCarryStatusKeyPath];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)initializeCarryStatusLogging
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_10003AAF8;
  v13[3] = &unk_100175600;
  v13[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.appResume.inferCarryStatus" usingQueue:0 launchHandler:v13];

  uint64_t v4 = +[BGSystemTaskScheduler sharedScheduler];
  unsigned __int8 v5 = [v4 taskRequestForIdentifier:@"com.apple.appResume.inferCarryStatus"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.appResume.inferCarryStatus"];
    [v6 setPriority:1];
    [v6 setInterval:86400.0];
    [v6 setMinDurationBetweenInstances:85400.0];
    [v6 setRequiresProtectionClass:3];
    [v6 setRequiresExternalPower:0];
    id v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v12 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v12];
    id v9 = v12;

    if ((v8 & 1) == 0)
    {
      id v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F3058((os_log_t)log);
  }
}

- (void)logUpdatedCarryStatus
{
  id v3 = +[_CDClientContext userContext];
  uint64_t v4 = [v3 objectForKeyedSubscript:self->_inferredCarryStatusKeyPath];
  int v5 = [v4 BOOLValue];

  id v6 = +[_DKKnowledgeStore knowledgeStore];
  BOOL v7 = [(_APRSPLLogger *)self updateCarryStatusWithContext:v3 withKnowledgeStore:v6];

  if (v5 == v7)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3114(v5, log);
    }
  }
  else
  {
    unsigned __int8 v8 = +[NSNumber numberWithBool:v7];
    [v3 setObject:v8 forKeyedSubscript:self->_inferredCarryStatusKeyPath];

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = +[NSNumber numberWithBool:v7];
    [v9 setObject:v10 forKeyedSubscript:@"CarryType"];

    PLLogRegisteredEvent();
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F4984();
    }
  }
}

- (BOOL)updateCarryStatusWithContext:(id)a3 withKnowledgeStore:(id)a4
{
  unsigned __int8 v5 = [(_APRSPLLogger *)self deviceHasEnoughPluggedInTimeWithMinimumDays:a3 withContext:a4 withKnowledgeStore:14.0];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F318C(v5, log);
  }
  return v5;
}

- (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withKnowledgeStore:(id)a5
{
  id v7 = a5;
  v37 = (void *)os_transaction_create();
  unsigned __int8 v8 = +[NSDate date];
  uint64_t v9 = +[_DKQuery predicateForEventsWithMinimumDuration:7200.0];
  BOOL v10 = 1;
  uint64_t v35 = +[_DKQuery predicateForEventsWithIntegerValue:1];
  v36 = (void *)v9;
  v46[0] = v9;
  v46[1] = v35;
  id v11 = +[NSArray arrayWithObjects:v46 count:2];
  id v12 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

  id v13 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  v45 = v13;
  id v14 = +[NSArray arrayWithObjects:&v45 count:1];
  id v15 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  v44 = v15;
  id v16 = +[NSArray arrayWithObjects:&v44 count:1];
  id v17 = +[_DKEventQuery eventQueryWithPredicate:v12 eventStreams:v14 offset:0 limit:0 sortDescriptors:v16];

  v18 = [v7 executeQuery:v17 error:0];

  v19 = [(_APRSPLLogger *)self concatenateContinuousEventsOfSameState:v18 sortedAscending:0];

  if (v19)
  {
    id v20 = [v19 lastObject];
    uint64_t v21 = [v20 startDate];
    [v8 timeIntervalSinceDate:v21];
    double v23 = v22;

    if ((unint64_t)[v19 count] >= 8)
    {
      long long v24 = [v19 firstObject];
      long long v25 = [v24 startDate];
      [v8 timeIntervalSinceDate:v25];
      if (v26 <= 604800.0)
      {

        if (v23 >= a3 * 86400.0)
        {
          BOOL v10 = 1;
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    log = self->_log;
    BOOL v10 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = log;
      __int16 v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 count]);
      id v30 = [v19 firstObject];
      objc_super v31 = [v30 startDate];
      uint64_t v32 = [v19 lastObject];
      v33 = [v32 startDate];
      *(_DWORD *)long long buf = 138412802;
      v39 = v29;
      __int16 v40 = 2112;
      v41 = v31;
      __int16 v42 = 2112;
      v43 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Not real carry device: %@ events, Last plugin: %@, First plugin: %@", buf, 0x20u);

      BOOL v10 = 0;
    }
  }
LABEL_9:

  return v10;
}

- (id)concatenateEventsPrivate:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    id v4 = v3;
    goto LABEL_16;
  }
  id v4 = +[NSMutableArray array];
  int v5 = [v3 count];
  int v6 = v5 - 1;
  if (v5 < 2)
  {
    if (v5 != 1) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  __int16 v29 = v4;
  do
  {
    unsigned int v32 = v6;
    uint64_t v7 = (v6 - 1);
    uint64_t v8 = v7 + 1;
    int v30 = v6 - 1;
    while (1)
    {
      uint64_t v9 = [v3 objectAtIndexedSubscript:v8];
      id v10 = [v9 integerValue];
      id v11 = [v3 objectAtIndexedSubscript:v7];
      if (v10 != [v11 integerValue]) {
        break;
      }
      id v12 = [v3 objectAtIndexedSubscript:v8];
      id v13 = [v12 endDate];
      id v14 = [v3 objectAtIndexedSubscript:v7];
      id v15 = [v14 startDate];
      unsigned int v16 = [v13 isEqualToDate:v15];

      if (!v16) {
        goto LABEL_11;
      }
      --v7;
      if ((int)--v8 <= 0)
      {
        LODWORD(v7) = -1;
        goto LABEL_11;
      }
    }

LABEL_11:
    if ((int)v7 >= v30)
    {
      long long v25 = [v3 objectAtIndexedSubscript:v32];
      LODWORD(v7) = v30;
    }
    else
    {
      uint64_t v17 = v32;
      v33 = [v3 objectAtIndexedSubscript:v32];
      uint64_t v28 = [v33 stream];
      objc_super v31 = [v3 objectAtIndexedSubscript:v17];
      v18 = [v31 startDate];
      v19 = [v3 objectAtIndexedSubscript:(int)v7 + 1];
      id v20 = [v19 endDate];
      uint64_t v21 = [v3 objectAtIndexedSubscript:v17];
      double v22 = [v21 value];
      double v23 = [v3 objectAtIndexedSubscript:v17];
      long long v24 = [v23 metadata];
      long long v25 = +[_DKEvent eventWithStream:v28 startDate:v18 endDate:v20 value:v22 metadata:v24];
    }
    id v4 = v29;
    [v29 addObject:v25];

    int v6 = v7;
  }
  while ((int)v7 > 0);
  if (!v7)
  {
LABEL_20:
    uint64_t v27 = [v3 objectAtIndexedSubscript:0];
    [v4 addObject:v27];
  }
LABEL_16:

  return v4;
}

- (id)concatenateContinuousEventsOfSameState:(id)a3 sortedAscending:(BOOL)a4
{
  if (a4)
  {
    int v5 = [a3 reverseObjectEnumerator];
    int v6 = [v5 allObjects];

    uint64_t v7 = [(_APRSPLLogger *)self concatenateEventsPrivate:v6];
  }
  else
  {
    int v6 = [(_APRSPLLogger *)self concatenateEventsPrivate:a3];
    uint64_t v8 = [v6 reverseObjectEnumerator];
    uint64_t v7 = [v8 allObjects];
  }

  return v7;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (_CDContextualKeyPath)inferredCarryStatusKeyPath
{
  return self->_inferredCarryStatusKeyPath;
}

- (void)setInferredCarryStatusKeyPath:(id)a3
{
}

- (NSMutableArray)lastPredictions
{
  return self->_lastPredictions;
}

- (void)setLastPredictions:(id)a3
{
}

- (NSMutableDictionary)predictionAccuracies
{
  return self->_predictionAccuracies;
}

- (void)setPredictionAccuracies:(id)a3
{
}

- (NSDate)lastCAReportedDate
{
  return self->_lastCAReportedDate;
}

- (void)setLastCAReportedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCAReportedDate, 0);
  objc_storeStrong((id *)&self->_predictionAccuracies, 0);
  objc_storeStrong((id *)&self->_lastPredictions, 0);
  objc_storeStrong((id *)&self->_inferredCarryStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastReportedDate, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end