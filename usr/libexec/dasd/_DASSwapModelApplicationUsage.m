@interface _DASSwapModelApplicationUsage
- (BOOL)prewarmDisabled;
- (NSDate)transitionDate;
- (NSDictionary)currentProbabilities;
- (NSDictionary)nextProbabilities;
- (OS_os_log)log;
- (_DASSwapModelApplicationUsage)init;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)prewarmLaunchAppFromBundleID:(id)a3;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)convertTimelineToApplicationDictionaries:(id)a3;
- (void)prewarmLaunchAppsFromTimeline:(id)a3;
- (void)setCurrentProbabilities:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLog:(id)a3;
- (void)setNextProbabilities:(id)a3;
- (void)setPrewarmDisabled:(BOOL)a3;
- (void)setTransitionDate:(id)a3;
- (void)updateTimeline;
@end

@implementation _DASSwapModelApplicationUsage

- (_DASSwapModelApplicationUsage)init
{
  v13.receiver = self;
  v13.super_class = (Class)_DASSwapModelApplicationUsage;
  v2 = [(_DASSwapModelApplicationUsage *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[_DASPredictionManager sharedKnowledgeStore];
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v3;

    uint64_t v5 = +[_DASDaemonLogger logForCategory:@"swap.appUsageModel"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    v7 = +[_DASTrialManager sharedInstance];
    v8 = [v7 factorWithName:@"APRS_PrewarmDisabled"];
    v9 = +[_DASDaemonLogger defaultCategory];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        unsigned int v11 = [v8 BOOLeanValue];
        *(_DWORD *)buf = 67109120;
        unsigned int v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Prewarm disabled set to %d", buf, 8u);
      }

      v2->_prewarmDisabled = [v8 BOOLeanValue];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load prewarmDisabled", buf, 2u);
      }
    }
  }
  return v2;
}

- (void)convertTimelineToApplicationDictionaries:(id)a3
{
  id v4 = a3;
  if ([v4 isUnavailable])
  {
    [(_DASSwapModelApplicationUsage *)self setCurrentProbabilities:&__NSDictionary0__struct];
    [(_DASSwapModelApplicationUsage *)self setNextProbabilities:&__NSDictionary0__struct];
    uint64_t v5 = +[NSDate distantFuture];
    [(_DASSwapModelApplicationUsage *)self setTransitionDate:v5];
  }
  else
  {
    v6 = [v4 transitionDates];
    v7 = [v6 firstObject];
    [(_DASSwapModelApplicationUsage *)self setTransitionDate:v7];

    v8 = +[NSMutableSet set];
    v9 = [v4 startDate];
    v43 = [v4 valueAtDate:v9];

    v42 = [v4 valueAtDate:self->_transitionDate];
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_1000FE22C((uint64_t)v43, log);
    }
    v37 = self;
    id v38 = v4;
    unsigned int v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000FE1B4((uint64_t)v42, v11);
    }
    v12 = [v43 allKeys];
    [v8 addObjectsFromArray:v12];

    objc_super v13 = [v42 allKeys];
    [v8 addObjectsFromArray:v13];

    v41 = +[NSMutableDictionary dictionary];
    v40 = +[NSMutableDictionary dictionary];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v8;
    id v14 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v45;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          id v20 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v18 allowPlaceholder:0 error:0];
          v21 = [v20 compatibilityObject];

          v22 = [v21 bundleExecutable];
          if (v22)
          {
            v23 = [v43 objectForKeyedSubscript:v18];
            [v23 doubleValue];
            if (v24 <= 0.1) {
              v25 = &off_100187300;
            }
            else {
              v25 = (_UNKNOWN **)v23;
            }
            [v41 setObject:v25 forKeyedSubscript:v22];
            v26 = [v42 objectForKeyedSubscript:v18];

            [v26 doubleValue];
            if (v27 <= 0.1) {
              v28 = &off_100187300;
            }
            else {
              v28 = (_UNKNOWN **)v26;
            }
            [v40 setObject:v28 forKeyedSubscript:v22];
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v15);
    }

    id v29 = [v41 copy];
    [(_DASSwapModelApplicationUsage *)v37 setCurrentProbabilities:v29];

    id v30 = [v40 copy];
    [(_DASSwapModelApplicationUsage *)v37 setNextProbabilities:v30];

    v31 = v37->_log;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = [(_DASSwapModelApplicationUsage *)v37 currentProbabilities];
      *(_DWORD *)buf = 138412290;
      v49 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Current Probabilities: %@", buf, 0xCu);
    }
    v34 = v37->_log;
    id v4 = v38;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = v34;
      v36 = [(_DASSwapModelApplicationUsage *)v37 nextProbabilities];
      *(_DWORD *)buf = 138412290;
      v49 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Next Probabilities: %@", buf, 0xCu);
    }
  }
}

- (id)prewarmLaunchAppFromBundleID:(id)a3
{
  id v4 = a3;
  if (+[_APRSPrewarmRecommendation appPreventsPrewarm:v4])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "DASPREWARM Refusing to prewarm %@ because it not allowed by developer", buf, 0xCu);
    }
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
  else
  {
    id v7 = objc_alloc_init((Class)RBSLaunchContext);
    v8 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:v4];
    [v7 setIdentity:v8];

    [v7 setExplanation:@"DAS Prewarm launch"];
    v9 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.dasd" name:@"DYLDLaunch"];
    v33 = v9;
    BOOL v10 = +[NSArray arrayWithObjects:&v33 count:1];
    [v7 setAttributes:v10];

    [v7 _setAdditionalEnvironment:&off_100187B90];
    id v11 = [objc_alloc((Class)RBSLaunchRequest) initWithContext:v7];
    id v27 = 0;
    id v28 = 0;
    id v26 = 0;
    unsigned __int8 v12 = [v11 execute:&v28 assertion:&v27 error:&v26];
    id v13 = v28;
    id v14 = v27;
    id v15 = v26;
    uint64_t v16 = self->_log;
    BOOL v17 = os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Prewarm app success: %@", buf, 0xCu);
      }
      if (v14)
      {
        v21 = _NSConcreteStackBlock;
        uint64_t v22 = 3221225472;
        v23 = sub_1000A9E0C;
        double v24 = &unk_1001765D8;
        id v25 = v13;
        [v25 monitorForDeath:&v21];
        uint64_t v18 = +[_APRSPrewarmInterface sharedInstance];
        [v18 appendPrewarmAssertion:v4 withAssertion:v14];
      }
      v19 = +[_APRSMetricRecorder sharedInstance];
      [v19 startLoggingForApp:v4 pid:[v13 pid] forEvent:0];
    }
    else if (v17)
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v4;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Encountered error launching %@: %@", buf, 0x16u);
    }
    id v6 = v15;
  }

  return v6;
}

- (void)prewarmLaunchAppsFromTimeline:(id)a3
{
  id v4 = a3;
  if (([v4 isUnavailable] & 1) == 0)
  {
    uint64_t v5 = +[_APRSPrewarmRecommendation evaluateRecommendationsFromTimeline:v4];
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "DASDPREWARM prewarm choice list: %@", buf, 0xCu);
    }
    unint64_t v8 = 0;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      if (v8 >= (unint64_t)objc_msgSend(v5, "count", v17)) {
        break;
      }
      v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = v9;
        id v11 = [v5 objectAtIndexedSubscript:v8];
        *(_DWORD *)buf = v17;
        v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Prewarm app attempt: %@", buf, 0xCu);
      }
      unsigned __int8 v12 = [v5 objectAtIndexedSubscript:v8];
      id v13 = [(_DASSwapModelApplicationUsage *)self prewarmLaunchAppFromBundleID:v12];

      if (!v13)
      {
        id v14 = self->_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          uint64_t v16 = [v5 objectAtIndexedSubscript:v8];
          *(_DWORD *)buf = v17;
          v19 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DASDPREWARM Prewarm of %@ succeeded", buf, 0xCu);
        }
      }

      ++v8;
    }
    while (v8 != 3);
  }
}

- (void)updateTimeline
{
  id v4 = +[_DKSystemEventStreams appUsageStream];
  uint64_t v5 = +[_DKPredictionQuery topNPredictionQueryForStream:v4 withPredicate:0 withTopN:50 withMinLikelihood:0.0];

  [v5 setSlotDuration:7200];
  [v5 setMinimumDaysOfHistory:1];
  knowledgeStore = self->_knowledgeStore;
  id v13 = 0;
  long long v7 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v5 error:&v13];
  id v8 = v13;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F2D14((os_log_t)log);
    }
  }
  BOOL v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Updating timeline: %@", buf, 0xCu);
  }
  if (_os_feature_enabled_impl() && !self->_prewarmDisabled)
  {
    unsigned __int8 v12 = self->_log;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "prewarm_app feature flag enabled", buf, 2u);
    }
    [(_DASSwapModelApplicationUsage *)self prewarmLaunchAppsFromTimeline:v7];
  }
  else
  {
    id v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000FE2A4((os_log_t)v11);
    }
  }
  [(_DASSwapModelApplicationUsage *)self convertTimelineToApplicationDictionaries:v7];
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_DASSwapModelApplicationUsage *)self transitionDate];
  [v6 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 <= 0.0) {
    [(_DASSwapModelApplicationUsage *)self currentProbabilities];
  }
  else {
  id v11 = [(_DASSwapModelApplicationUsage *)self nextProbabilities];
  }
  unsigned __int8 v12 = [v11 objectForKeyedSubscript:v7];

  [v12 doubleValue];
  double v14 = v13;

  return v14;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DASSwapModelApplicationUsage *)self transitionDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= 0.0) {
    [(_DASSwapModelApplicationUsage *)self currentProbabilities];
  }
  else {
  id v8 = [(_DASSwapModelApplicationUsage *)self nextProbabilities];
  }

  return v8;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BOOL)prewarmDisabled
{
  return self->_prewarmDisabled;
}

- (void)setPrewarmDisabled:(BOOL)a3
{
  self->_prewarmDisabled = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextProbabilities, 0);
  objc_storeStrong((id *)&self->_transitionDate, 0);
  objc_storeStrong((id *)&self->_currentProbabilities, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end