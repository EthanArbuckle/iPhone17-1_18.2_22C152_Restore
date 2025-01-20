@interface _DASApplicationPolicy
+ (id)focalApplicationsWithContext:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isDaemon:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSMutableDictionary)lastApplicationTimelineUpdate;
- (NSMutableDictionary)timelines;
- (NSMutableSet)daemons;
- (NSMutableSet)recentlyUsedApplications;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASApplicationPolicy)init;
- (_DASComplicationManager)complicationManager;
- (_DASPredictor)predictor;
- (_DKPredictionTimeline)topNPrediction;
- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4;
- (double)scoreForActivity:(id)a3 atDate:(id)a4 withRationale:(id)a5;
- (double)scoreForAnyAppActivity:(id)a3 atDate:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setComplicationManager:(id)a3;
- (void)setDaemons:(id)a3;
- (void)setLastApplicationTimelineUpdate:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setRecentlyUsedApplications:(id)a3;
- (void)setTimelines:(id)a3;
- (void)setTopNPrediction:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateAppLaunchedRecently:(id)a3;
- (void)updatePredictionsAtDate:(id)a3;
- (void)updateRecentApplications;
@end

@implementation _DASApplicationPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 launchReason];
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundProcessing])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [v3 launchReason];
    if ([v6 isEqualToString:_DASLaunchReasonHealthResearch])
    {
      BOOL v5 = 0;
    }
    else
    {
      v7 = [v3 launchReason];
      if ([v7 isEqualToString:_DASLaunchReasonHealthKit])
      {
        BOOL v5 = 0;
      }
      else
      {
        v8 = [v3 widgetID];
        if (v8)
        {
          BOOL v5 = 0;
        }
        else if (([v3 supportsAnyApplication] & 1) != 0 {
               || ([v3 requestsApplicationLaunch] & 1) != 0)
        }
        {
          BOOL v5 = 1;
        }
        else
        {
          v9 = [v3 relatedApplications];
          BOOL v5 = [v9 count] != 0;
        }
      }
    }
  }

  return v5;
}

+ (id)focalApplicationsWithContext:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  BOOL v5 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  v6 = [v3 objectForKeyedSubscript:v5];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = +[_CDContextQueries appUsageBundleID];
        v14 = [v12 objectForKeyedSubscript:v13];

        if (v14) {
          [v4 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v4 copy];

  return v15;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.das.apppolicy.appchanged";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186BF8;
  v8[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  id v9 = v4;
  BOOL v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASApplicationPolicy)init
{
  v20.receiver = self;
  v20.super_class = (Class)_DASApplicationPolicy;
  v2 = [(_DASApplicationPolicy *)&v20 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Application Policy";

    uint64_t v5 = +[_DASPredictionManager sharedPredictor];
    predictor = v3->_predictor;
    v3->_predictor = (_DASPredictor *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    timelines = v3->_timelines;
    v3->_timelines = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    lastApplicationTimelineUpdate = v3->_lastApplicationTimelineUpdate;
    v3->_lastApplicationTimelineUpdate = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableSet set];
    daemons = v3->_daemons;
    v3->_daemons = (NSMutableSet *)v11;

    uint64_t v13 = [(_DASApplicationPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    uint64_t v15 = +[NSMutableSet set];
    recentlyUsedApplications = v3->_recentlyUsedApplications;
    v3->_recentlyUsedApplications = (NSMutableSet *)v15;

    [(_DASApplicationPolicy *)v3 updateRecentApplications];
    uint64_t v17 = +[_DASComplicationManager sharedInstance];
    complicationManager = v3->_complicationManager;
    v3->_complicationManager = (_DASComplicationManager *)v17;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044FD0;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3CA0 != -1) {
    dispatch_once(&qword_1001C3CA0, block);
  }
  v2 = (void *)qword_1001C3CA8;

  return v2;
}

- (void)updateRecentApplications
{
  id v3 = +[_DASPredictionManager predictionGenerationQueue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  uint64_t v5 = (void *)qword_1001C3CB0;
  qword_1001C3CB0 = (uint64_t)v4;

  v6 = qword_1001C3CB0;
  dispatch_time_t v7 = dispatch_walltime(0, 0);
  dispatch_source_set_timer(v6, v7, 0x1A3185C5000uLL, 0x29E8D60800uLL);
  dispatch_set_qos_class_fallback();
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100045114;
  handler[3] = &unk_1001754F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001C3CB0, handler);
  dispatch_resume((dispatch_object_t)qword_1001C3CB0);
}

- (void)updateAppLaunchedRecently:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_recentlyUsedApplications;
  objc_sync_enter(v5);
  id v6 = [(NSMutableSet *)self->_recentlyUsedApplications count];
  recentlyUsedApplications = self->_recentlyUsedApplications;
  if ((unint64_t)v6 >= 0x19)
  {
    if ([(NSMutableSet *)recentlyUsedApplications containsObject:v4]) {
      goto LABEL_5;
    }
    id v8 = self->_recentlyUsedApplications;
    uint64_t v9 = [(NSMutableSet *)v8 anyObject];
    [(NSMutableSet *)v8 removeObject:v9];

    recentlyUsedApplications = self->_recentlyUsedApplications;
  }
  [(NSMutableSet *)recentlyUsedApplications addObject:v4];
LABEL_5:
  uint64_t v10 = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_recentlyUsedApplications;
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recent Applications: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_sync_exit(v5);
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (BOOL)isDaemon:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];

  uint64_t v5 = [v4 compatibilityObject];

  return v5 == 0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.das.apppolicy.appchanged"])
  {
    id v6 = [(id)objc_opt_class() focalApplicationsWithContext:v5];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)weightForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requestsApplicationLaunch])
  {
    double v4 = 50.0;
  }
  else
  {
    id v5 = [v3 schedulingPriority];
    if ((unint64_t)v5 >= _DASSchedulingPriorityUtility) {
      double v4 = 25.0;
    }
    else {
      double v4 = 5.0;
    }
  }

  return v4;
}

- (void)updatePredictionsAtDate:(id)a3
{
  id v5 = a3;
  id v6 = (void *)os_transaction_create();
  id v8 = [(_DASPredictor *)self->_predictor launchLikelihoodForTopNApplications:10 withLikelihoodGreaterThan:3600 withTemporalResolution:0.142857143];
  [(_DASApplicationPolicy *)self setTopNPrediction:v8];

  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
  uint64_t v9 = [(_DASApplicationPolicy *)self topNPrediction];
  +[_DASPredictionManager setPrediction:v9 forKey:@"application.topN"];

  uint64_t v10 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5058(self, v10);
  }
}

- (double)scoreForAnyAppActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  v28 = [v27 dateByAddingTimeInterval:450.0];
  BOOL v7 = +[NSDate date];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100045E10;
  v40 = sub_100045E20;
  id v41 = 0;
  id v8 = +[_DASPredictionManager predictionGenerationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045E28;
  block[3] = &unk_100175948;
  block[4] = self;
  id v9 = v7;
  id v34 = v9;
  v35 = &v36;
  dispatch_sync(v8, block);

  uint64_t v10 = [(id)v37[5] valueAtDate:v28];
  uint64_t v11 = [v6 relatedApplications];
  if ([v11 count]) {
    [v6 relatedApplications];
  }
  else {
  int v12 = [v10 allKeys];
  }

  uint64_t v13 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    double v17 = 1.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        objc_super v20 = [v10 objectForKeyedSubscript:v19];
        v21 = v20;
        if (v20)
        {
          [v20 doubleValue];
          double v23 = v22;
          [v13 addObject:v19];
          double v17 = v17 * (1.0 - v23);
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v15);
  }
  else
  {
    double v17 = 1.0;
  }

  if ([v13 count])
  {
    v25 = +[NSArray arrayWithArray:v13];
    [v6 setSchedulerRecommendedApplications:v25];
  }

  _Block_object_dispose(&v36, 8);
  return fmax(sqrt(1.0 - v17), 0.01);
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4 withRationale:(id)a5
{
  id v67 = a3;
  id v60 = a4;
  id v64 = a5;
  id v8 = +[NSDate now];
  id v9 = self;
  objc_sync_enter(v9);
  id obj = +[NSDate date];

  if (!qword_1001C3CC0 || (objc_msgSend(obj, "timeIntervalSinceDate:"), v10 >= 300.0)) {
    dword_1001C3CB8 = arc4random_uniform(0x546u);
  }
  objc_storeStrong((id *)&qword_1001C3CC0, obj);
  objc_sync_exit(v9);

  if ([v67 supportsAnyApplication])
  {
    [(_DASApplicationPolicy *)v9 scoreForAnyAppActivity:v67 atDate:v60];
    double v12 = v11;
    goto LABEL_82;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v13 = [v67 relatedApplications];
  id v14 = [v13 countByEnumeratingWithState:&v86 objects:v102 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v87;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v87 != v15) {
          objc_enumerationMutation(v13);
        }
        if ([(_DASComplicationManager *)v9->_complicationManager isActiveComplication:*(void *)(*((void *)&v86 + 1) + 8 * i)])
        {

          double v12 = 1.0;
          goto LABEL_82;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v86 objects:v102 count:16];
    }
    while (v14);
  }

  LODWORD(v17) = dword_1001C3CB8;
  v61 = [v60 dateByAddingTimeInterval:(double)v17 + 450.0];
  v63 = (void *)os_transaction_create();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v18 = [v67 relatedApplications];
  id v19 = [v18 countByEnumeratingWithState:&v82 objects:v101 count:16];
  if (!v19)
  {
    double v21 = 1.0;
    goto LABEL_49;
  }
  uint64_t v20 = *(void *)v83;
  double v21 = 1.0;
  v62 = v9;
  do
  {
    for (j = 0; j != v19; j = (char *)j + 1)
    {
      if (*(void *)v83 != v20) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void *)(*((void *)&v82 + 1) + 8 * (void)j);
      v24 = v9->_timelines;
      objc_sync_enter(v24);
      if (![(NSMutableSet *)v9->_daemons containsObject:v23])
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v97 = 0x3032000000;
        v98 = sub_100045E10;
        v99 = sub_100045E20;
        id v100 = [(NSMutableDictionary *)v9->_timelines objectForKeyedSubscript:v23];
        long long v29 = [(NSMutableDictionary *)v9->_lastApplicationTimelineUpdate objectForKeyedSubscript:v23];
        if (+[_DASPredictionManager predictionNeedsUpdating:*(void *)(*((void *)&buf + 1) + 40) atDate:obj lastUpdatedAt:v29])
        {
          if ([(_DASApplicationPolicy *)v9 isDaemon:v23])
          {
            long long v30 = +[_DASDaemonLogger logForCategory:@"predictions"];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v92) = 138412290;
              *(void *)((char *)&v92 + 4) = v23;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ is a daemon. Ignoring prediction", (uint8_t *)&v92, 0xCu);
            }

            [(NSMutableSet *)v9->_daemons addObject:v23];
            double v28 = 0.0001;
            double v21 = v21 * 0.9999;
            int v27 = 5;
LABEL_41:

            _Block_object_dispose(&buf, 8);
            goto LABEL_42;
          }
          dispatch_semaphore_t v65 = dispatch_semaphore_create(0);
          *(void *)&long long v92 = 0;
          *((void *)&v92 + 1) = &v92;
          uint64_t v93 = 0x2810000000;
          v94 = "";
          int v95 = 0;
          uint64_t v78 = 0;
          v79 = &v78;
          uint64_t v80 = 0x2020000000;
          char v81 = 0;
          predictor = v9->_predictor;
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_1000469AC;
          v68[3] = &unk_1001760D0;
          id v32 = v63;
          v76 = &v78;
          p_long long buf = &buf;
          id v69 = v32;
          v70 = v9;
          v75 = &v92;
          uint64_t v71 = v23;
          id v72 = obj;
          id v73 = v67;
          v33 = v65;
          v74 = v33;
          [(_DASPredictor *)predictor launchLikelihoodPredictionForApp:v23 withHandler:v68];
          dispatch_time_t v34 = dispatch_time(0, 5000000000);
          if (dispatch_semaphore_wait(v33, v34))
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*((void *)&v92 + 1) + 32));
            *((unsigned char *)v79 + 24) = 1;
            os_unfair_lock_unlock((os_unfair_lock_t)(*((void *)&v92 + 1) + 32));
            +[_DASMetricRecorder recordOccurrenceForKey:@"com.apple.das.timeout.cdapppredictionquery"];
            v35 = +[_DASDaemonLogger logForCategory:@"predictions"];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v90 = 138412290;
              uint64_t v91 = v23;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Timed out querying for prediction: %@", v90, 0xCu);
            }
          }
          id v9 = v62;

          _Block_object_dispose(&v78, 8);
          _Block_object_dispose(&v92, 8);
        }
        uint64_t v36 = *(void **)(*((void *)&buf + 1) + 40);
        if (v36 && ([v36 isUnavailable] & 1) == 0)
        {
          v37 = [*(id *)(*((void *)&buf + 1) + 40) valueAtDate:v61];
          [v37 doubleValue];
          double v28 = v38;

          if (v64)
          {
            v39 = +[NSNumber numberWithDouble:v28];
            v40 = +[NSPredicate predicateWithFormat:@"%@.likelihood == %@", v23, v39];
            [v64 addRationaleWithCondition:v40];
          }
          int v27 = 0;
        }
        else
        {
          int v27 = 0;
          double v28 = 0.0025;
        }
        goto LABEL_41;
      }
      id v25 = [v67 schedulingPriority];
      double v21 = v21 * 0.99;
      if ((unint64_t)v25 > _DASSchedulingPriorityUtility)
      {
        v26 = +[_DASDaemonLogger logForCategory:@"predictions"];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Daemon %@ doing high-priority work!", (uint8_t *)&buf, 0xCu);
        }
      }
      int v27 = 5;
      double v28 = 0.01;
LABEL_42:
      objc_sync_exit(v24);

      double v41 = 1.0 - v28;
      if (v27) {
        double v41 = 1.0;
      }
      double v21 = v21 * v41;
    }
    id v19 = [v18 countByEnumeratingWithState:&v82 objects:v101 count:16];
  }
  while (v19);
LABEL_49:

  unsigned __int8 v42 = [v67 requestsApplicationLaunch];
  double v43 = sqrt(1.0 - v21);
  if ((v42 & (v43 > 0.25)) != 0) {
    double v44 = 1.0;
  }
  else {
    double v44 = v43;
  }
  if (v44 > 2.22044605e-16 && [v67 requestsApplicationLaunch])
  {
    v45 = [v67 relatedApplications];
    v46 = [v45 firstObject];

    v47 = +[_DASDaemon sharedInstance];
    id v48 = [v47 requestCountForApplication:v46];

    if (v48) {
      double v44 = v44 + (double)((unint64_t)v48 - 1) * 0.1;
    }
  }
  if ([v67 beforeApplicationLaunch]) {
    double v49 = 0.0;
  }
  else {
    double v49 = 0.01;
  }
  if ([v67 requestsApplicationLaunch])
  {
    [v60 timeIntervalSinceDate:obj];
    if (v50 < 0.0)
    {
      v51 = v9->_recentlyUsedApplications;
      objc_sync_enter(v51);
      v52 = [v67 relatedApplications];
      v53 = [v52 firstObject];

      double v44 = v44 * 0.65;
      if (v53 && [(NSMutableSet *)v9->_recentlyUsedApplications containsObject:v53]) {
        double v44 = v44 + 0.35;
      }

      objc_sync_exit(v51);
    }
    if (v44 > 0.5) {
      double v44 = 1.0;
    }
    id v54 = [v67 schedulingPriority];
    if ((unint64_t)v54 >= _DASSchedulingPriorityUserInitiated
      || (unsigned int v55 = [v67 requestsNewsstandLaunch], v56 = 0.0, v55))
    {
      double v56 = v49;
    }
    double v57 = 1.0;
    if (v44 <= 1.0) {
      double v57 = v44;
    }
    if (v56 >= v57) {
      double v12 = v56;
    }
    else {
      double v12 = v57;
    }
  }
  else
  {
    double v58 = 1.0;
    if (v44 <= 1.0) {
      double v58 = v44;
    }
    if (v49 >= v58) {
      double v12 = v49;
    }
    else {
      double v12 = v58;
    }
  }

LABEL_82:
  return v12;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 requestsApplicationLaunch]) {
    goto LABEL_8;
  }
  id v8 = [v6 launchReason];
  if ([v8 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
  {
  }
  else
  {
    id v9 = [v6 launchReason];
    unsigned int v10 = [v9 isEqualToString:_DASLaunchReasonBackgroundNewsstand];

    if (!v10) {
      goto LABEL_8;
    }
  }
  char v47 = 0;
  double v11 = +[_DASDaemon sharedInstance];
  double v12 = [v11 barScheduler];
  uint64_t v13 = [v6 relatedApplications];
  id v14 = [v13 firstObject];
  unsigned __int8 v15 = [v12 pushLaunchAllowedForApp:v14 immediately:&v47];

  if (!v47)
  {
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Application Policy"];
      [(_DASPolicyResponseRationale *)v16 addRationaleForCondition:@"pushDisallowed" withRequiredValue:0.0 withCurrentValue:1.0];
      uint64_t v17 = 100;
      goto LABEL_35;
    }
LABEL_8:
    long long v18 = [(id)objc_opt_class() focalApplicationsWithContext:v7];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v19 = [v6 relatedApplications];
    id v20 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v44;
LABEL_10:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        if ([v18 containsObject:*(void *)(*((void *)&v43 + 1) + 8 * v23)]) {
          break;
        }
        if (v21 == (id)++v23)
        {
          id v21 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v21) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }

      if ([v6 requestsApplicationLaunch])
      {
        v24 = [v6 launchReason];
        if ([v24 isEqualToString:_DASLaunchReasonBackgroundFetch])
        {
        }
        else
        {
          unsigned __int8 v26 = [v6 isBackgroundTaskActivity];

          if ((v26 & 1) == 0) {
            goto LABEL_24;
          }
        }
        uint64_t v16 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Application Policy"];
        [(_DASPolicyResponseRationale *)v16 addRationaleForCondition:@"appIsForeground" withRequiredValue:0.0 withCurrentValue:1.0];
        uint64_t v27 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v16 rationale:10800.0];
        goto LABEL_32;
      }
      if (![v6 runOnAppForeground]) {
        goto LABEL_24;
      }
      [0 addRationaleForCondition:@"appIsForeground" withRequiredValue:1.0 withCurrentValue:1.0];
      uint64_t v25 = 67;
    }
    else
    {
LABEL_16:

LABEL_24:
      double v28 = [v6 launchReason];
      if ([v28 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
      {
      }
      else
      {
        long long v29 = [v6 launchReason];
        unsigned int v30 = [v29 isEqualToString:_DASLaunchReasonBackgroundNewsstand];

        if (!v30)
        {
          id v32 = +[_DASFileProtectionPolicy policyInstance];
          unsigned int v33 = [v32 isClassCLocked];

          if (v33)
          {
            uint64_t v16 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Application Policy"];
            [(_DASPolicyResponseRationale *)v16 addRationaleForCondition:@"classCLocked" withRequiredValue:1.0 withCurrentValue:0.0];
            uint64_t v27 = +[_DASPolicyResponse policyResponseWithScore:v16 validityDuration:0.5 rationale:10800.0];
LABEL_32:
            long long v31 = (void *)v27;
            goto LABEL_33;
          }
          v35 = +[NSDate date];
          [(_DASApplicationPolicy *)self scoreForActivity:v6 atDate:v35 withRationale:0];
          double v37 = v36;
          if ([v6 beforeApplicationLaunch]
            && v37 <= 0.05
            && (+[_CDContextQueries keyPathForPluginStatus],
                double v38 = objc_claimAutoreleasedReturnValue(),
                [v7 objectForKeyedSubscript:v38],
                v39 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v40 = [v39 BOOLValue],
                v39,
                v38,
                (v40 & 1) == 0))
          {
            unsigned __int8 v42 = +[NSPredicate predicateWithFormat:@"isPluggedIn == %@ AND likelihood == %lf", &__kCFBooleanFalse, *(void *)&v37];
            [0 addRationaleWithCondition:v42];

            uint64_t v41 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:0 rationale:(double)0x384uLL];
          }
          else
          {
            uint64_t v41 = +[_DASPolicyResponse policyResponseWithScore:0 validityDuration:v37 rationale:(double)0x384uLL];
          }
          long long v31 = (void *)v41;

LABEL_29:
          uint64_t v16 = 0;
LABEL_33:

          goto LABEL_36;
        }
      }
      uint64_t v25 = 0;
    }
    long long v31 = +[_DASPolicyResponse policyResponseWithDecision:v25 validityDuration:0 rationale:10800.0];
    goto LABEL_29;
  }
  uint64_t v16 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Application Policy"];
  [(_DASPolicyResponseRationale *)v16 addRationaleForCondition:@"appIsForeground" withRequiredValue:1.0 withCurrentValue:1.0];
  [(_DASPolicyResponseRationale *)v16 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v16 responseOptions] | 2];
  uint64_t v17 = 200;
LABEL_35:
  long long v31 = +[_DASPolicyResponse policyResponseWithDecision:v17 validityDuration:v16 rationale:10800.0];
LABEL_36:

  return v31;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  [(_DASApplicationPolicy *)self scoreForActivity:a3 atDate:a4 withRationale:0];
  return result;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_DASPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (NSMutableDictionary)timelines
{
  return self->_timelines;
}

- (void)setTimelines:(id)a3
{
}

- (_DKPredictionTimeline)topNPrediction
{
  return self->_topNPrediction;
}

- (void)setTopNPrediction:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (NSMutableDictionary)lastApplicationTimelineUpdate
{
  return self->_lastApplicationTimelineUpdate;
}

- (void)setLastApplicationTimelineUpdate:(id)a3
{
}

- (NSMutableSet)daemons
{
  return self->_daemons;
}

- (void)setDaemons:(id)a3
{
}

- (NSMutableSet)recentlyUsedApplications
{
  return self->_recentlyUsedApplications;
}

- (void)setRecentlyUsedApplications:(id)a3
{
}

- (_DASComplicationManager)complicationManager
{
  return self->_complicationManager;
}

- (void)setComplicationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationManager, 0);
  objc_storeStrong((id *)&self->_recentlyUsedApplications, 0);
  objc_storeStrong((id *)&self->_daemons, 0);
  objc_storeStrong((id *)&self->_lastApplicationTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, 0);
  objc_storeStrong((id *)&self->_topNPrediction, 0);
  objc_storeStrong((id *)&self->_timelines, 0);
  objc_storeStrong((id *)&self->_predictor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end