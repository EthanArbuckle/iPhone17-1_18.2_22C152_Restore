@interface _APRSPrewarmRecommendation
+ (BOOL)appHasContinuousBackgroundModeWithRecord:(id)a3;
+ (BOOL)appPrefersUnoptimizedLaunchesWithRecord:(id)a3;
+ (BOOL)appPreventsPrewarm:(id)a3;
+ (BOOL)isPrewarmAllowed;
+ (BOOL)isPrewarmAllowedForApp:(id)a3;
+ (id)appActivationTimeScores:(id)a3;
+ (id)candidatesFromTimeline:(id)a3;
+ (id)evaluateRecommendationsFromTimeline:(id)a3;
+ (id)scoresToConfidenceLevels:(id)a3;
+ (id)sharedInstance;
- (BOOL)classCUnlocked;
- (NSArray)recommendations;
- (OS_os_log)log;
- (_APRSPrewarmRecommendation)init;
- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)appPredictionTimeline;
- (unint64_t)prewarmCount;
- (void)evaluateRecommendations;
- (void)registerForTrial;
- (void)setClassCUnlocked:(BOOL)a3;
- (void)setDataProtectionStateMonitor:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLog:(id)a3;
- (void)setPrewarmCount:(unint64_t)a3;
- (void)setRecommendations:(id)a3;
- (void)updateTrialParameters;
@end

@implementation _APRSPrewarmRecommendation

- (_APRSPrewarmRecommendation)init
{
  v19.receiver = self;
  v19.super_class = (Class)_APRSPrewarmRecommendation;
  v2 = [(_APRSPrewarmRecommendation *)&v19 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[_DASPredictionManager sharedKnowledgeStore];
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v5;

    uint64_t v7 = +[NSMutableArray array];
    recommendations = v2->_recommendations;
    v2->_recommendations = (NSArray *)v7;

    [(_APRSPrewarmRecommendation *)v2 registerForTrial];
    [(_APRSPrewarmRecommendation *)v2 updateTrialParameters];
    v9 = objc_alloc_init(_DASDataProtectionStateMonitor);
    dataProtectionStateMonitor = v2->_dataProtectionStateMonitor;
    v2->_dataProtectionStateMonitor = v9;

    objc_initWeak(&location, v2);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100014A74;
    v16[3] = &unk_100175430;
    objc_copyWeak(&v17, &location);
    [(_DASDataProtectionStateMonitor *)v2->_dataProtectionStateMonitor setChangeHandler:v16];
    v11 = v2->_dataProtectionStateMonitor;
    v12 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
    LODWORD(v11) = [(_DASDataProtectionStateMonitor *)v11 isDataAvailableFor:v12];

    if (v11)
    {
      v2->_classCUnlocked = 1;
    }
    else
    {
      v13 = v2->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Class C not yet available.", v15, 2u);
      }
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001C3A98 != -1) {
    dispatch_once(&qword_1001C3A98, &stru_100175470);
  }
  v2 = (void *)qword_1001C3A90;

  return v2;
}

+ (BOOL)appPreventsPrewarm:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = 1;
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  if (([a1 appHasContinuousBackgroundModeWithRecord:v6] & 1) == 0) {
    unsigned __int8 v5 = [a1 appPrefersUnoptimizedLaunchesWithRecord:v6];
  }

  return v5;
}

+ (BOOL)appHasContinuousBackgroundModeWithRecord:(id)a3
{
  os_log_t v3 = [a3 UIBackgroundModes];
  unsigned __int8 v4 = [v3 containsObject:@"continuous"];

  return v4;
}

+ (BOOL)appPrefersUnoptimizedLaunchesWithRecord:(id)a3
{
  os_log_t v3 = [a3 infoDictionary];
  unsigned __int8 v4 = [v3 objectForKey:@"SBPrefersUnoptimizedLaunch" ofClass:objc_opt_class()];

  BOOL v5 = v4 && ([v4 BOOLValue] & 1) != 0;
  return v5;
}

- (void)evaluateRecommendations
{
  id v5 = [(_APRSPrewarmRecommendation *)self appPredictionTimeline];
  os_log_t v3 = +[_APRSPrewarmRecommendation evaluateRecommendationsFromTimeline:v5];
  recommendations = self->_recommendations;
  self->_recommendations = v3;
}

+ (BOOL)isPrewarmAllowedForApp:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.purplebuddy"] & 1) != 0
    || ([v3 containsString:@"UIService"] & 1) != 0
    || ([v3 containsString:@".widget"] & 1) != 0
    || ([v3 containsString:@"com.apple.Reality"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.MTLReplayer"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.Health"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.camera"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ContinuityCaptureShieldUI"] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    unsigned int v4 = [(id)objc_opt_class() appPreventsPrewarm:v3] ^ 1;
  }

  return v4;
}

+ (BOOL)isPrewarmAllowed
{
  v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  if (v3 & 1) != 0 || (DMIsMigrationNeeded()) {
    return 0;
  }
  id v5 = [(id)objc_opt_class() sharedInstance];
  unsigned __int8 v6 = [v5 classCUnlocked];

  return v6;
}

+ (id)candidatesFromTimeline:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)os_transaction_create();
  id v5 = +[NSMutableDictionary dictionary];
  unsigned __int8 v6 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
  if ([v3 isUnavailable])
  {
    id v7 = 0;
  }
  else
  {
    v8 = [v3 startDate];
    v9 = [v3 valueAtDate:v8];

    [v5 addEntriesFromDictionary:v9];
    id v10 = [v5 count];
    v11 = +[_APRSPrewarmRecommendation sharedInstance];
    id v12 = [v11 prewarmCount];

    if (v10 < v12)
    {
      v13 = [v3 transitionDates];
      v14 = [v13 firstObject];

      if (v14)
      {
        v15 = [v3 valueAtDate:v14];
        [v5 addEntriesFromDictionary:v15];
      }
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000F2C3C((uint64_t)v5, v6, v16, v17, v18, v19, v20, v21);
    }
    id v7 = v5;
  }

  return v7;
}

+ (id)appActivationTimeScores:(id)a3
{
  id v3 = +[NSMutableDictionary dictionary];
  unsigned int v4 = +[_APRSBiomeEventAnalyzer sharedInstance];
  id v5 = [v4 meanDeltaTimeBetweenColdLaunchAndResume];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000151C0;
  v8[3] = &unk_100175498;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

+ (id)scoresToConfidenceLevels:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015328;
  v6[3] = &unk_100175498;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

+ (id)evaluateRecommendationsFromTimeline:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
  if ([(id)objc_opt_class() isPrewarmAllowed])
  {
    id v5 = +[NSMutableArray array];
    id v6 = +[_APRSPrewarmRecommendation candidatesFromTimeline:v3];
    id v7 = [v6 mutableCopy];

    if ([v7 count])
    {
      v8 = +[_APRSPrewarmRecommendation scoresToConfidenceLevels:v7];
      id v9 = [v8 mutableCopy];

      id v10 = +[_APRSPrewarmRecommendation appActivationTimeScores:0];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000F2C3C((uint64_t)v9, v4, v11, v12, v13, v14, v15, v16);
      }
      id v37 = v3;
      uint64_t v17 = [v9 allKeys];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1000157AC;
      v42[3] = &unk_1001754C0;
      id v36 = v9;
      id v43 = v36;
      id v35 = v10;
      id v44 = v35;
      uint64_t v18 = [v17 sortedArrayUsingComparator:v42];

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000F2CA8((uint64_t)v18, v4, v19, v20, v21, v22, v23, v24);
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v25 = v18;
      id v26 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v39;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v31 = +[_APRSRecommendationEngine sharedInstance];
            unsigned int v32 = [v31 isAppRunning:v30];

            if (v32)
            {
              if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v30;
                _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BundleID %@ is already running. Skipping from Prewarm", buf, 0xCu);
              }
            }
            else if (+[_APRSPrewarmRecommendation isPrewarmAllowedForApp:v30])
            {
              [v5 addObject:v30];
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v27);
      }

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DASDPREWARM prewarm choice list: %@", buf, 0xCu);
      }
      id v33 = v5;

      id v7 = v36;
      id v3 = v37;
    }
    else
    {
      id v33 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Prewarm not yet allowed.", buf, 2u);
    }
    id v33 = &__NSArray0__struct;
  }

  return v33;
}

- (id)appPredictionTimeline
{
  id v4 = +[_DKSystemEventStreams appUsageStream];
  id v5 = +[_DKPredictionQuery topNPredictionQueryForStream:v4 withPredicate:0 withTopN:50 withMinLikelihood:0.0];

  [v5 setSlotDuration:7200];
  [v5 setMinimumDaysOfHistory:1];
  knowledgeStore = self->_knowledgeStore;
  id v12 = 0;
  id v7 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v5 error:&v12];
  id v8 = v12;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F2D14((os_log_t)log);
    }
  }
  id v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Timeline %@", buf, 0xCu);
  }

  return v7;
}

- (void)registerForTrial
{
  id v3 = +[_DASTrialManager sharedInstance];
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = +[_DASTrialManager sharedInstance];
  id v4 = [v3 factorWithName:@"APRS_PrewarmCount"];
  id v5 = +[_DASDaemonLogger defaultCategory];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134217984;
      id v9 = [v4 longValue];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trial: Prewarm count set to %lld", (uint8_t *)&v8, 0xCu);
    }

    unint64_t v7 = (unint64_t)[v4 longValue];
  }
  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load prewarmCount", (uint8_t *)&v8, 2u);
    }

    unint64_t v7 = 3;
  }
  self->_prewarmCount = v7;
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
}

- (unint64_t)prewarmCount
{
  return self->_prewarmCount;
}

- (void)setPrewarmCount:(unint64_t)a3
{
  self->_prewarmCount = a3;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor
{
  return self->_dataProtectionStateMonitor;
}

- (void)setDataProtectionStateMonitor:(id)a3
{
}

- (BOOL)classCUnlocked
{
  return self->_classCUnlocked;
}

- (void)setClassCUnlocked:(BOOL)a3
{
  self->_classCUnlocked = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dataProtectionStateMonitor, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);

  objc_storeStrong((id *)&self->_recommendations, 0);
}

@end