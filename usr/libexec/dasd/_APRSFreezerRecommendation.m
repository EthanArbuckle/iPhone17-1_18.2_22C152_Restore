@interface _APRSFreezerRecommendation
+ (id)histogramEventStream;
+ (id)sharedInstance;
- (BOOL)process:(id)a3 inSet:(id)a4;
- (NSArray)freezerDemotionRecommendations;
- (NSArray)freezerRecommendations;
- (NSDate)lastSnapshotTime;
- (NSDate)transitionDate;
- (NSDictionary)currentProbabilities;
- (NSDictionary)historicalKillHistogram;
- (NSDictionary)nextProbabilities;
- (NSMutableDictionary)todaysKillHistogram;
- (NSMutableSet)zerosSet;
- (NSUserDefaults)killDefaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_APRSFreezerRecommendation)init;
- (_APRSPLLogger)pLLogger;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4;
- (id)_queue_computeScores;
- (id)aggregatorScoresForAllApplicationsAtDate:(id)a3;
- (id)appActivationTimeScores:(id)a3;
- (id)appsFromProactiveSuggestions;
- (id)appsRecentlyForegrounded;
- (id)frequentlyUserKilledApps;
- (id)killScoresForAllApplicationsAtDate:(id)a3;
- (id)predictedAppsAtDate:(id)a3;
- (id)predictionScoresForAllApplicationsAtDate:(id)a3;
- (id)queryForHistogramWithIdentifier:(id)a3;
- (id)scoresForAppPredictionType:(int64_t)a3;
- (void)_queue_loadHistograms;
- (void)_queue_updateHistograms;
- (void)convertTimelineToApplicationDictionaries:(id)a3;
- (void)evaluateFreezerRecommendations;
- (void)incorporateLatestJetsamStatistics;
- (void)registerDailyModelUpdateTask;
- (void)setCurrentProbabilities:(id)a3;
- (void)setFreezerRecommendations:(id)a3;
- (void)setHistoricalKillHistogram:(id)a3;
- (void)setKillDefaults:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLastSnapshotTime:(id)a3;
- (void)setLog:(id)a3;
- (void)setNextProbabilities:(id)a3;
- (void)setPLLogger:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTodaysKillHistogram:(id)a3;
- (void)setTransitionDate:(id)a3;
- (void)setZerosSet:(id)a3;
- (void)updateModel;
- (void)updateScores;
- (void)updateTimeline;
@end

@implementation _APRSFreezerRecommendation

- (_APRSFreezerRecommendation)init
{
  v24.receiver = self;
  v24.super_class = (Class)_APRSFreezerRecommendation;
  v2 = [(_APRSFreezerRecommendation *)&v24 init];
  if (v2)
  {
    uint64_t v3 = +[_DASPredictionManager sharedKnowledgeStore];
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v3;

    os_log_t v5 = os_log_create("com.apple.aprs", "appResume.FreezerRecommendations");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    uint64_t v7 = +[NSMutableArray array];
    freezerRecommendations = v2->_freezerRecommendations;
    v2->_freezerRecommendations = (NSArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    freezerDemotionRecommendations = v2->_freezerDemotionRecommendations;
    v2->_freezerDemotionRecommendations = (NSArray *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.dasd.appResume.FreezerRecommendations", v12);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.appResume.freezerRecommendations"];
    killDefaults = v2->_killDefaults;
    v2->_killDefaults = v15;

    uint64_t v17 = +[_APRSPLLogger sharedInstance];
    pLLogger = v2->_pLLogger;
    v2->_pLLogger = (_APRSPLLogger *)v17;

    v19 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000752D0;
    block[3] = &unk_1001754F8;
    v20 = v2;
    v23 = v20;
    dispatch_async(v19, block);
    [(_APRSFreezerRecommendation *)v20 registerDailyModelUpdateTask];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001C4138 != -1) {
    dispatch_once(&qword_1001C4138, &stru_100176AA8);
  }
  v2 = (void *)qword_1001C4130;

  return v2;
}

- (void)evaluateFreezerRecommendations
{
  [(_APRSFreezerRecommendation *)self updateTimeline];
  [(_APRSFreezerRecommendation *)self updateScores];
  uint64_t v3 = +[NSDate date];
  v4 = [(_APRSFreezerRecommendation *)self aggregatorScoresForAllApplicationsAtDate:v3];

  if ([v4 count])
  {
    os_log_t v5 = [v4 keysSortedByValueUsingComparator:&stru_100176AC8];
    v6 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v12 = +[NSMutableDictionary dictionary];
          [v12 setObject:v11 forKeyedSubscript:@"app"];
          dispatch_queue_t v13 = [v4 objectForKeyedSubscript:v11];
          [v12 setObject:v13 forKeyedSubscript:@"score"];

          [(NSArray *)v6 addObject:v12];
        }
        id v8 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }

    freezerRecommendations = self->_freezerRecommendations;
    self->_freezerRecommendations = v6;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "No change in Freezer recommendations", buf, 2u);
    }
  }
}

- (id)appsFromProactiveSuggestions
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if (dlopen_preflight((const char *)[@"/System/Library/PrivateFrameworks/AppPredictionClient.framework/AppPredictionClient" UTF8String]))
  {
    v4 = [(_APRSFreezerRecommendation *)self scoresForAppPredictionType:15];
    os_log_t v5 = [(_APRSFreezerRecommendation *)self scoresForAppPredictionType:16];
    [v3 addEntriesFromDictionary:v4];
    [v3 addEntriesFromDictionary:v5];
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Proactive scores %@", (uint8_t *)&v10, 0xCu);
    }
    id v7 = v3;
  }
  else
  {
    id v8 = self->_log;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_1000F3014((os_log_t)v8);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)scoresForAppPredictionType:(int64_t)a3
{
  id v30 = +[NSMutableDictionary dictionary];
  v32 = +[NSMutableDictionary dictionary];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v4 = (void *)qword_1001C4150;
  uint64_t v40 = qword_1001C4150;
  if (!qword_1001C4150)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v43 = sub_100078C88;
    v44 = &unk_100175628;
    v45 = &v37;
    sub_100078C88((uint64_t)&buf);
    v4 = (void *)v38[3];
  }
  os_log_t v5 = v4;
  _Block_object_dispose(&v37, 8);
  id v29 = [v5 alloc];
  v28 = [v29 cachedSuggestionsForClientModelType:a3];
  [v28 suggestions];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v10 = [v9 executableSpecification];
        uint64_t v11 = [v10 executableObject];

        if (v11)
        {
          v12 = [v9 scoreSpecification];
          dispatch_queue_t v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 suggestedConfidenceCategory]);
          v14 = [v11 description];
          [v32 setObject:v13 forKeyedSubscript:v14];

          id v16 = objc_alloc((Class)LSApplicationRecord);
          long long v17 = [v11 description];
          id v18 = [v16 initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
          long long v19 = [v18 compatibilityObject];

          long long v20 = [v19 bundleExecutable];
          if (v20)
          {
            v21 = [v9 scoreSpecification];
            v22 = (char *)[v21 suggestedConfidenceCategory];

            double v23 = 0.0;
            if ((unint64_t)(v22 - 2) <= 2) {
              double v23 = dbl_100126D60[(void)(v22 - 2)];
            }
            objc_super v24 = +[NSNumber numberWithDouble:v23];
            [v30 setObject:v24 forKeyedSubscript:v20];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v6);
  }

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Proactive HomeScreen scores %@", (uint8_t *)&buf, 0xCu);
  }

  return v30;
}

- (void)convertTimelineToApplicationDictionaries:(id)a3
{
  id v4 = a3;
  if ([v4 isUnavailable])
  {
    [(_APRSFreezerRecommendation *)self setCurrentProbabilities:&__NSDictionary0__struct];
    [(_APRSFreezerRecommendation *)self setNextProbabilities:&__NSDictionary0__struct];
    os_log_t v5 = +[NSDate distantFuture];
    [(_APRSFreezerRecommendation *)self setTransitionDate:v5];
  }
  else
  {
    id v6 = [v4 transitionDates];
    uint64_t v7 = [v6 firstObject];
    [(_APRSFreezerRecommendation *)self setTransitionDate:v7];

    id v8 = +[NSMutableSet set];
    uint64_t v9 = [v4 startDate];
    v41 = [v4 valueAtDate:v9];

    uint64_t v40 = [v4 valueAtDate:self->_transitionDate];
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F806C();
    }
    long long v35 = self;
    id v36 = v4;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000F8004();
    }
    int v10 = [v41 allKeys];
    [v8 addObjectsFromArray:v10];

    uint64_t v11 = [v40 allKeys];
    [v8 addObjectsFromArray:v11];

    uint64_t v39 = +[NSMutableDictionary dictionary];
    v38 = +[NSMutableDictionary dictionary];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          id v18 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v16 allowPlaceholder:0 error:0];
          long long v19 = [v18 compatibilityObject];

          long long v20 = [v19 bundleExecutable];
          if (v20)
          {
            v21 = [v41 objectForKeyedSubscript:v16];
            [v21 doubleValue];
            if (v22 <= 0.1) {
              double v23 = &off_100186FA0;
            }
            else {
              double v23 = (_UNKNOWN **)v21;
            }
            [v39 setObject:v23 forKeyedSubscript:v20];
            objc_super v24 = [v40 objectForKeyedSubscript:v16];

            [v24 doubleValue];
            if (v25 <= 0.1) {
              v26 = &off_100186FA0;
            }
            else {
              v26 = (_UNKNOWN **)v24;
            }
            [v38 setObject:v26 forKeyedSubscript:v20];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v13);
    }

    id v27 = [v39 copy];
    [(_APRSFreezerRecommendation *)v35 setCurrentProbabilities:v27];

    id v28 = [v38 copy];
    [(_APRSFreezerRecommendation *)v35 setNextProbabilities:v28];

    log = v35->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = log;
      v31 = [(_APRSFreezerRecommendation *)v35 currentProbabilities];
      *(_DWORD *)long long buf = 138412290;
      v47 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Current Probabilities: %@", buf, 0xCu);
    }
    v32 = v35->_log;
    id v4 = v36;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      long long v33 = v32;
      long long v34 = [(_APRSFreezerRecommendation *)v35 nextProbabilities];
      *(_DWORD *)long long buf = 138412290;
      v47 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Next Probabilities: %@", buf, 0xCu);
    }
  }
}

- (void)updateTimeline
{
  id v4 = +[_DKSystemEventStreams appUsageStream];
  os_log_t v5 = +[_DKPredictionQuery topNPredictionQueryForStream:v4 withPredicate:0 withTopN:50 withMinLikelihood:0.0];

  [v5 setSlotDuration:7200];
  [v5 setMinimumDaysOfHistory:1];
  knowledgeStore = self->_knowledgeStore;
  id v11 = 0;
  uint64_t v7 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v5 error:&v11];
  id v8 = v11;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F2D14((os_log_t)log);
    }
  }
  int v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Updating timeline: %@", buf, 0xCu);
  }
  [(_APRSFreezerRecommendation *)self convertTimelineToApplicationDictionaries:v7];
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_APRSFreezerRecommendation *)self transitionDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 <= 0.0) {
    [(_APRSFreezerRecommendation *)self currentProbabilities];
  }
  else {
  id v11 = [(_APRSFreezerRecommendation *)self nextProbabilities];
  }
  id v12 = [v11 objectForKeyedSubscript:v7];

  [v12 doubleValue];
  double v14 = v13;

  return v14;
}

- (id)predictionScoresForAllApplicationsAtDate:(id)a3
{
  id v4 = a3;
  os_log_t v5 = [(_APRSFreezerRecommendation *)self transitionDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= 0.0) {
    [(_APRSFreezerRecommendation *)self currentProbabilities];
  }
  else {
  id v8 = [(_APRSFreezerRecommendation *)self nextProbabilities];
  }

  return v8;
}

- (id)predictedAppsAtDate:(id)a3
{
  id v4 = [(_APRSFreezerRecommendation *)self predictionScoresForAllApplicationsAtDate:a3];
  id v5 = [v4 mutableCopy];

  double v6 = [(_APRSFreezerRecommendation *)self appsFromProactiveSuggestions];
  id v7 = [v6 mutableCopy];

  id v8 = v7;
  if (![v7 count])
  {
    id v25 = v5;
LABEL_13:
    id v12 = v25;
    goto LABEL_14;
  }
  if (![v5 count])
  {
    id v25 = v7;
    goto LABEL_13;
  }
  double v9 = +[NSMutableSet set];
  double v10 = [v5 allKeys];
  [v9 addObjectsFromArray:v10];

  id v11 = [v5 allKeys];
  [v9 addObjectsFromArray:v11];

  id v12 = +[NSMutableDictionary dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v27 = v9;
  id obj = [v9 allObjects];
  id v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        [v5 objectForKeyedSubscript:v17];
        v19 = id v18 = v5;
        [v19 doubleValue];
        double v21 = v20;
        double v22 = [v8 objectForKeyedSubscript:v17];
        [v22 doubleValue];
        objc_super v24 = +[NSNumber numberWithDouble:v23 * 0.5 + v21 * 0.5];
        [v12 setObject:v24 forKeyedSubscript:v17];

        id v5 = v18;
      }
      id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

LABEL_14:

  return v12;
}

- (id)aggregatorScoresForAllApplicationsAtDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v7 = +[NSMutableSet set];
  id v8 = +[NSMutableArray array];
  double v9 = [(_APRSFreezerRecommendation *)self predictedAppsAtDate:v4];
  id v10 = [v9 count];
  v70 = v8;
  [v8 addObject:v9];
  id v11 = [v9 allKeys];
  [v7 addObjectsFromArray:v11];

  v71 = self;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v81 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Prediction scores %@", buf, 0xCu);
  }
  id v13 = [(_APRSFreezerRecommendation *)self killScoresForAllApplicationsAtDate:v4];
  id v14 = [v13 mutableCopy];

  if ([v14 count])
  {
    [v70 addObject:v14];
    uint64_t v15 = [v14 allKeys];
    [v7 addObjectsFromArray:v15];

    uint64_t v16 = 3;
  }
  else
  {
    uint64_t v16 = 2;
  }
  uint64_t v74 = v16;
  uint64_t v17 = self->_log;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v81 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Kill scores %@", buf, 0xCu);
  }
  id v18 = [(_APRSFreezerRecommendation *)self appActivationTimeScores:v4];
  id v19 = [v18 mutableCopy];

  if ([v19 count])
  {
    [v70 addObject:v19];
    double v20 = [v19 allKeys];
    [v7 addObjectsFromArray:v20];
  }
  else
  {
    --v74;
  }
  double v21 = v71->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v81 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Activation Time scores %@", buf, 0xCu);
  }
  v69 = v19;
  if (v74 == 1)
  {
    double v22 = v70;
    id v23 = [v70 firstObject];
    int v24 = 0;
    id v25 = 0;
  }
  else if (v10 || (unint64_t)[v7 count] >= 0xA)
  {
    id v63 = v14;
    v64 = v9;
    v66 = v6;
    v67 = v5;
    id v68 = v4;
    v26 = [(_APRSFreezerRecommendation *)v71 frequentlyUserKilledApps];
    v73 = +[NSMutableDictionary dictionary];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v65 = v7;
    id v27 = v7;
    id v28 = v71;
    id v29 = v27;
    id v30 = [v27 countByEnumeratingWithState:&v75 objects:v79 count:16];
    long long v31 = v70;
    if (v30)
    {
      id v32 = v30;
      uint64_t v33 = *(void *)v76;
      id v72 = v29;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v76 != v33) {
            objc_enumerationMutation(v29);
          }
          long long v35 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          if ([v26 containsObject:v35])
          {
            id v36 = v28->_log;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              id v81 = v35;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "App %@ has a high user kill ratio. Skipping Freezer", buf, 0xCu);
            }
          }
          else if (([v35 isEqual:@"Camera"] & 1) == 0)
          {
            if (v74 == 2)
            {
              uint64_t v37 = [v31 firstObject];
              v38 = [v37 objectForKeyedSubscript:v35];
              [v38 doubleValue];
              double v40 = v39;
              v41 = [v31 lastObject];
              long long v42 = [v41 objectForKeyedSubscript:v35];
              [v42 doubleValue];
              long long v44 = +[NSNumber numberWithDouble:v43 * 0.75 + v40 * 0.25];
              [v73 setObject:v44 forKeyedSubscript:v35];

              id v29 = v72;
              id v28 = v71;

              long long v31 = v70;
            }
            else
            {
              long long v45 = [v31 firstObject];
              v46 = [v45 objectForKeyedSubscript:v35];

              double v47 = 0.0;
              double v48 = 0.0;
              if (v46)
              {
                v49 = [v45 objectForKeyedSubscript:v35];
                [v49 doubleValue];
                double v48 = v50;
              }
              v51 = [v31 objectAtIndex:2];

              v52 = [v51 objectForKeyedSubscript:v35];

              if (v52)
              {
                v53 = [v51 objectForKeyedSubscript:v35];
                [v53 doubleValue];
                double v47 = v54;
              }
              v55 = [v31 lastObject];

              v56 = [v55 objectForKeyedSubscript:v35];

              if (v56
                && ([v55 objectForKeyedSubscript:v35],
                    v57 = objc_claimAutoreleasedReturnValue(),
                    [v57 doubleValue],
                    double v59 = v58,
                    v57,
                    v59 != -1.0))
              {
                double v60 = v47 * 0.25 + v48 * 0.25 + v59 * 0.5;
              }
              else
              {
                double v60 = v47 * 0.75 + v48 * 0.25;
              }
              v61 = +[NSNumber numberWithDouble:v60];
              [v73 setObject:v61 forKeyedSubscript:v35];

              id v29 = v72;
            }
          }
        }
        id v32 = [v29 countByEnumeratingWithState:&v75 objects:v79 count:16];
      }
      while (v32);
    }

    id v23 = v73;
    [v73 setObject:&off_100186FB8 forKeyedSubscript:@"MobileSafari"];
    id v25 = [v73 copy];

    int v24 = 1;
    id v5 = v67;
    id v4 = v68;
    double v22 = v31;
    id v7 = v65;
    double v6 = v66;
    id v14 = v63;
    double v9 = v64;
  }
  else
  {
    int v24 = 0;
    id v25 = 0;
    id v23 = &__NSDictionary0__struct;
    double v22 = v70;
  }

  if (v24) {
    id v23 = v25;
  }

  return v23;
}

- (id)appActivationTimeScores:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = +[_APRSBiomeEventAnalyzer sharedInstance];
  double v6 = [v5 meanDeltaTimeBetweenColdLaunchAndResume];

  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F80D4();
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100076CEC;
  v9[3] = &unk_100175498;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

+ (id)histogramEventStream
{
  return +[_DKEventStream eventStreamWithName:@"com.apple.dasd.jetsams"];
}

- (id)queryForHistogramWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[_DKEventStream eventStreamWithName:@"com.apple.dasd.jetsams"];
  id v5 = +[_DKHistogramQuery histogramQueryForPersistedHistogramsForStream:v4 withCustomIdentifier:v3];

  return v5;
}

- (void)_queue_loadHistograms
{
  id v3 = [(NSUserDefaults *)self->_killDefaults dictionaryForKey:@"histograms"];
  id v4 = [v3 objectForKeyedSubscript:@"current"];
  id v5 = [v3 objectForKeyedSubscript:@"historical"];
  double v6 = [v3 objectForKeyedSubscript:@"zeros"];
  uint64_t v7 = [v3 objectForKeyedSubscript:@"snapshotTS"];
  id v8 = (void *)v7;
  if (!v4) {
    id v4 = &__NSDictionary0__struct;
  }
  if (!v5) {
    id v5 = &__NSDictionary0__struct;
  }
  if (!v6) {
    double v6 = &__NSArray0__struct;
  }
  if (!v7)
  {
    id v8 = +[NSDate distantPast];
  }
  double v9 = (NSMutableDictionary *)[v4 mutableCopy];
  todaysKillHistogram = self->_todaysKillHistogram;
  self->_todaysKillHistogram = v9;

  p_historicalKillHistogram = &self->_historicalKillHistogram;
  objc_storeStrong((id *)&self->_historicalKillHistogram, v5);
  id v12 = +[NSMutableSet setWithArray:v6];
  zerosSet = self->_zerosSet;
  self->_zerosSet = v12;

  objc_storeStrong((id *)&self->_lastSnapshotTime, v8);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    lastSnapshotTime = self->_lastSnapshotTime;
    *(_DWORD *)long long buf = 138412290;
    double v22 = lastSnapshotTime;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Last snapshot: %@", buf, 0xCu);
  }
  uint64_t v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = self->_todaysKillHistogram;
    *(_DWORD *)long long buf = 138412290;
    double v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loaded current histogram: %@", buf, 0xCu);
  }
  id v18 = self->_log;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = *p_historicalKillHistogram;
    *(_DWORD *)long long buf = 138412290;
    double v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Loaded historical histogram: %@", buf, 0xCu);
  }
}

- (void)_queue_updateHistograms
{
  v8[0] = @"current";
  v8[1] = @"historical";
  historicalKillHistogram = self->_historicalKillHistogram;
  v9[0] = self->_todaysKillHistogram;
  v9[1] = historicalKillHistogram;
  v8[2] = @"zeros";
  id v5 = [(NSMutableSet *)self->_zerosSet allObjects];
  v8[3] = @"snapshotTS";
  lastSnapshotTime = self->_lastSnapshotTime;
  v9[2] = v5;
  v9[3] = lastSnapshotTime;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  [(NSUserDefaults *)self->_killDefaults setObject:v7 forKey:@"histograms"];
}

- (id)_queue_computeScores
{
  id v3 = +[NSMutableDictionary dictionary];
  historicalKillHistogram = self->_historicalKillHistogram;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100077388;
  v17[3] = &unk_100176AF0;
  v17[4] = self;
  id v5 = v3;
  id v18 = v5;
  [(NSDictionary *)historicalKillHistogram enumerateKeysAndObjectsUsingBlock:v17];
  todaysKillHistogram = self->_todaysKillHistogram;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100077464;
  v15[3] = &unk_100175498;
  id v7 = v5;
  id v16 = v7;
  [(NSMutableDictionary *)todaysKillHistogram enumerateKeysAndObjectsUsingBlock:v15];
  zerosSet = self->_zerosSet;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000774EC;
  v13[3] = &unk_100176B18;
  id v9 = v7;
  id v14 = v9;
  [(NSMutableSet *)zerosSet enumerateObjectsUsingBlock:v13];
  id v10 = v14;
  id v11 = v9;

  return v11;
}

- (void)updateModel
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000775D4;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)registerDailyModelUpdateTask
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007788C;
  v12[3] = &unk_100175600;
  v12[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.aprs.FreezerModelUpdate" usingQueue:0 launchHandler:v12];

  id v4 = +[BGSystemTaskScheduler sharedScheduler];
  id v5 = [v4 taskRequestForIdentifier:@"com.apple.aprs.FreezerModelUpdate"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.aprs.FreezerModelUpdate"];
    [v6 setPriority:1];
    [v6 setInterval:86400.0];
    [v6 setRequiresExternalPower:0];
    id v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v11 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      id v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (double)secondsFrom:(unint64_t)a3 until:(unint64_t)a4
{
  if (qword_1001C4148 != -1) {
    dispatch_once(&qword_1001C4148, &stru_100176B38);
  }
  return (double)((uint64_t)((a3 - a4) * dword_1001C4140) / *(unsigned int *)algn_1001C4144) / 1000000000.0;
}

- (id)appsRecentlyForegrounded
{
  long long v44 = (void *)os_transaction_create();
  v2 = +[NSDate date];
  id v3 = objc_alloc((Class)NSDateInterval);
  id v4 = [v2 dateByAddingTimeInterval:-604800.0];
  double v43 = v2;
  id v5 = [v3 initWithStartDate:v4 endDate:v2];

  id v6 = +[_DKSystemEventStreams appUsageStream];
  long long v42 = v5;
  uint64_t v7 = +[_DKHistogramQuery histogramQueryForStream:v6 interval:v5];

  unsigned __int8 v8 = +[_DASPredictionManager sharedKnowledgeStore];
  v41 = (void *)v7;
  id v9 = [v8 executeQuery:v7 error:0];

  id v10 = +[NSMutableSet set];
  double v39 = v9;
  id v11 = [v9 countDictionary];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100077DDC;
  v53[3] = &unk_100176B60;
  id v12 = v10;
  id v54 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v53];

  id v13 = +[_CDClientContext userContext];
  id v14 = +[_CDContextQueries keyPathForAppUsageDataDictionaries];
  v38 = v13;
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        double v22 = +[_CDContextQueries appUsageBundleID];
        id v23 = [v21 objectForKeyedSubscript:v22];
        [v12 addObject:v23];
      }
      id v18 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v18);
  }

  int v24 = +[NSMutableSet set];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v25 = v12;
  id v26 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v46;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
        id v32 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v30 allowPlaceholder:0 error:0];
        uint64_t v33 = [v32 compatibilityObject];

        long long v34 = [v33 bundleExecutable];
        if (v34) {
          [v24 addObject:v34];
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v27);
  }

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Processes recently launched: %@", buf, 0xCu);
  }
  id v36 = [v24 copy];

  return v36;
}

- (BOOL)process:(id)a3 inSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] > 0x1F)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hasPrefix:", v5, (void)v14))
          {

            unsigned __int8 v7 = 1;
            goto LABEL_13;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v7 = 0;
  }
  else
  {
    unsigned __int8 v7 = [v6 containsObject:v5];
  }
LABEL_13:

  return v7;
}

- (void)incorporateLatestJetsamStatistics
{
  id v3 = [(_APRSFreezerRecommendation *)self appsRecentlyForegrounded];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100077FD0;
  v6[3] = &unk_100175570;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(queue, v6);
}

- (id)killScoresForAllApplicationsAtDate:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  queue = self->_queue;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100078674;
  id v13 = &unk_100175570;
  long long v14 = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(queue, &v10);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Updating Kill Count: %@", buf, 0xCu);
  }
  id v8 = [v6 copy:v10, v11, v12, v13, v14];

  return v8;
}

- (id)frequentlyUserKilledApps
{
  id v26 = +[NSMutableArray array];
  v2 = +[_APRSBiomeEventAnalyzer sharedInstance];
  id v3 = [v2 allAppKillsInfo];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v10 = [v3 objectForKeyedSubscript:v9];
        [v10 meanSpringBoardKills];
        double v12 = v11;
        [v10 meanJetsamKills];
        double v14 = v12 + v13;
        [v10 meanRunningBoardKills];
        double v16 = v14 + v15;
        [v10 meanOtherKills];
        unint64_t v18 = (unint64_t)(v16 + v17);
        if (v18)
        {
          [v10 meanSpringBoardKills];
          if (v19 / (double)v18 > 0.85)
          {
            id v21 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
            double v22 = [v21 compatibilityObject];

            uint64_t v23 = [v22 bundleExecutable];
            if (v23)
            {
              int v24 = (void *)v23;
              [v26 addObject:v23];
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  return v26;
}

- (void)updateScores
{
}

- (NSArray)freezerRecommendations
{
  return self->_freezerRecommendations;
}

- (void)setFreezerRecommendations:(id)a3
{
}

- (NSArray)freezerDemotionRecommendations
{
  return self->_freezerDemotionRecommendations;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (NSDictionary)currentProbabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentProbabilities:(id)a3
{
}

- (NSDate)transitionDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransitionDate:(id)a3
{
}

- (NSDictionary)nextProbabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNextProbabilities:(id)a3
{
}

- (NSMutableDictionary)todaysKillHistogram
{
  return self->_todaysKillHistogram;
}

- (void)setTodaysKillHistogram:(id)a3
{
}

- (NSDictionary)historicalKillHistogram
{
  return self->_historicalKillHistogram;
}

- (void)setHistoricalKillHistogram:(id)a3
{
}

- (NSMutableSet)zerosSet
{
  return self->_zerosSet;
}

- (void)setZerosSet:(id)a3
{
}

- (_APRSPLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)lastSnapshotTime
{
  return self->_lastSnapshotTime;
}

- (void)setLastSnapshotTime:(id)a3
{
}

- (NSUserDefaults)killDefaults
{
  return self->_killDefaults;
}

- (void)setKillDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_killDefaults, 0);
  objc_storeStrong((id *)&self->_lastSnapshotTime, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pLLogger, 0);
  objc_storeStrong((id *)&self->_zerosSet, 0);
  objc_storeStrong((id *)&self->_historicalKillHistogram, 0);
  objc_storeStrong((id *)&self->_todaysKillHistogram, 0);
  objc_storeStrong((id *)&self->_nextProbabilities, 0);
  objc_storeStrong((id *)&self->_transitionDate, 0);
  objc_storeStrong((id *)&self->_currentProbabilities, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_freezerDemotionRecommendations, 0);

  objc_storeStrong((id *)&self->_freezerRecommendations, 0);
}

@end