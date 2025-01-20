@interface _DASActivityRateLimitManager
+ (id)sharedLimiter;
- (BOOL)executeActivity:(id)a3;
- (BOOL)isActivityRateLimited:(id)a3 atSubmission:(BOOL)a4;
- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4;
- (BOOL)limitsApplyToActivity:(id)a3;
- (BOOL)rateManagementApplyToActivity:(id)a3;
- (NSMutableDictionary)rateLimitConfigurations;
- (NSMutableDictionary)submittedConfigurations;
- (NSString)limitationName;
- (NSUserDefaults)defaults;
- (OS_dispatch_source)cleanupTimer;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASActivityRateLimitManager)init;
- (id)evaluateActivityAtSubmission:(id)a3;
- (id)evaluateRateLimitedActivity:(id)a3;
- (id)evaluationResultsAtExecution:(id)a3;
- (id)loadSubmittedRateLimitConfiguration;
- (id)shouldLimitActivity:(id)a3 withEvaluationResults:(id)a4 atDate:(id)a5;
- (id)unprotectedEvaluateRateLimitedActivity:(id)a3 forIdentifier:(id)a4;
- (os_unfair_lock_s)submittedConfigurationLock;
- (void)cleanupTimerHandler;
- (void)completeActivity:(id)a3;
- (void)initializeRateLimitWithActivity:(id)a3 withIdentifier:(id)a4;
- (void)logSubmittedActivity:(id)a3 asRateLimited:(BOOL)a4;
- (void)recalculateStartDates;
- (void)replaceExistingRateLimitsForConfiguration:(id)a3;
- (void)saveSubmittedRateLimitConfiguration;
- (void)setCleanupTimer:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLimitationName:(id)a3;
- (void)setLog:(id)a3;
- (void)setRateLimitConfigurations:(id)a3;
- (void)setSubmittedConfigurationLock:(os_unfair_lock_s)a3;
- (void)setSubmittedConfigurations:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitRateLimitConfiguration:(id)a3;
@end

@implementation _DASActivityRateLimitManager

- (id)shouldLimitActivity:(id)a3 withEvaluationResults:(id)a4 atDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(_DASActivityRateLimitManager *)self limitsApplyToActivity:a3]
    && ([v8 maxedRateLimits],
        v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 count],
        v10,
        v11))
  {
    v12 = [v8 nextEvaluationDate];
    [v12 timeIntervalSinceDate:v9];
    double v14 = v13;

    v15 = [v8 maxedRateLimits];
    v16 = [v15 lastObject];

    uint64_t v17 = kDASProcessRateLimitationName;
    v18 = [v16 description];
    v19 = +[_DASLimiterResponse limitResponseWithDecision:5 withLimiter:v17 validityDuration:v18 rationale:v14];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)logSubmittedActivity:(id)a3 asRateLimited:(BOOL)a4
{
  id v4 = a3;
  v5 = [v4 widgetID];

  if (!v5)
  {
    id v6 = v4;
    AnalyticsSendEventLazy();
  }
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v4 = a3;
  if (![(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v4]
    || ([v4 widgetID], v5 = objc_claimAutoreleasedReturnValue(), v5, v5)
    || ([v4 rateLimitConfigurationName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 containsString:_DASPECRateLimitConfigurationName],
        v6,
        (v7 & 1) != 0))
  {
    char v8 = 0;
  }
  else
  {
    v10 = [v4 identifier];
    unsigned __int8 v11 = [v10 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];

    char v8 = v11 ^ 1;
  }

  return v8;
}

- (id)evaluateActivityAtSubmission:(id)a3
{
  id v4 = a3;
  if ([(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v4])
  {
    v5 = +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:v4];
    if (v5)
    {
      id v6 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      objc_sync_enter(v6);
      unsigned __int8 v7 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      char v8 = [v7 objectForKeyedSubscript:v5];

      if (v8)
      {
        id v9 = [(_DASActivityRateLimitManager *)self unprotectedEvaluateRateLimitedActivity:v4 forIdentifier:v5];
        v10 = [v9 maxedRateLimits];
        BOOL v11 = [v10 count] != 0;

        [(_DASActivityRateLimitManager *)self logSubmittedActivity:v4 asRateLimited:v11];
      }
      else
      {
        [(_DASActivityRateLimitManager *)self initializeRateLimitWithActivity:v4 withIdentifier:v5];
        [(_DASActivityRateLimitManager *)self logSubmittedActivity:v4 asRateLimited:0];
        id v9 = 0;
      }
      objc_sync_exit(v6);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000F2EAC();
      }
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSMutableDictionary)rateLimitConfigurations
{
  return self->_rateLimitConfigurations;
}

- (BOOL)isActivityRateLimited:(id)a3 atSubmission:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v6])
  {
    unsigned __int8 v7 = +[NSDate now];
    if (v4) {
      [(_DASActivityRateLimitManager *)self evaluateActivityAtSubmission:v6];
    }
    else {
    id v9 = [(_DASActivityRateLimitManager *)self evaluationResultsAtExecution:v6];
    }
    uint64_t v10 = [(_DASActivityRateLimitManager *)self shouldLimitActivity:v6 withEvaluationResults:v9 atDate:v7];
    BOOL v11 = (void *)v10;
    if (v10)
    {
      uint64_t v18 = v10;
      v12 = +[NSArray arrayWithObjects:&v18 count:1];
      unsigned int v13 = +[_DASLimiterResponse queryActivityDecision:5 fromResponses:v12];

      if (v13)
      {
        uint64_t v17 = v11;
        double v14 = +[NSArray arrayWithObjects:&v17 count:1];
        [(_DASActivityRateLimitManager *)self limitedActivity:v6 withLimitsResponses:v14];
      }
    }
    v15 = [v9 maxedRateLimits];
    BOOL v8 = [v15 count] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)initializeRateLimitWithActivity:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 rateLimitConfigurationName];
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  if (v8)
  {
    uint64_t v10 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
    BOOL v11 = [v10 objectForKeyedSubscript:v8];

    if (v11)
    {
      v12 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
      unsigned int v13 = [v12 objectForKeyedSubscript:v8];

LABEL_12:
      os_unfair_lock_unlock(&self->_submittedConfigurationLock);
      v20 = +[_DASActivityRateLimitConfiguration_Internal rateLimitConfiguration:v13 withIdentifier:v7];
      v21 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      [v21 setObject:v20 forKeyedSubscript:v7];

      goto LABEL_13;
    }
  }
  double v14 = [v6 identifier];
  unsigned int v15 = [v14 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];

  if (v15)
  {
    uint64_t v16 = +[_DASRateLimiterUtilities assetsRateLimitConfiguration];
LABEL_11:
    unsigned int v13 = (void *)v16;
    goto LABEL_12;
  }
  uint64_t v17 = [v6 limitationResponse];
  unsigned int v18 = +[_DASLimiterResponse queryActivityDecision:2 fromResponses:v17];

  if (!v18)
  {
    uint64_t v16 = +[_DASRateLimiterUtilities defaultRateLimiterConfiguration];
    goto LABEL_11;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not rate limiting activity %@, already rate limited at submission", (uint8_t *)&v22, 0xCu);
  }
  os_unfair_lock_unlock(p_submittedConfigurationLock);
LABEL_13:
}

- (BOOL)rateManagementApplyToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 > _DASSchedulingPriorityDefault) {
    goto LABEL_4;
  }
  v5 = [v3 name];

  if (!v5) {
    goto LABEL_4;
  }
  id v6 = +[_DASPlistParser sharedInstance];
  unsigned __int8 v7 = [v6 containsOverrideForActivity:v3 withLimitation:kDASProcessRateLimitationName];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v10 = [v3 groupName];
  if ([v10 containsString:@"com.apple.ckdiscretionaryd"])
  {
    BOOL v11 = [v3 relatedApplications];
    if ([v11 containsObject:@"com.apple.mediaanalysisd-service"])
    {

      BOOL v8 = 0;
LABEL_9:

      goto LABEL_5;
    }
    v12 = [v3 relatedApplications];
    unsigned __int8 v13 = [v12 containsObject:@"com.apple.mediaanalysisd"];

    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  double v14 = [v3 groupName];
  if ([v14 containsString:@"com.apple.ckdiscretionaryd"])
  {
    unsigned int v15 = [v3 relatedApplications];
    unsigned __int8 v16 = [v15 containsObject:@"com.apple.mobileslideshow"];

    if (v16) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  uint64_t v17 = [v3 userInfo];
  unsigned int v18 = [v17 objectForKeyedSubscript:_DASNonRateLimitedLaunchKey];
  unsigned __int8 v19 = [v18 BOOLValue];

  if ((v19 & 1) == 0)
  {
    v20 = [v3 userInfo];
    v21 = [v20 objectForKeyedSubscript:_DASOverrideRateLimitingKey];
    unsigned __int8 v22 = [v21 BOOLValue];

    if ((v22 & 1) == 0)
    {
      if (![v3 requestsApplicationLaunch]
        || ([v3 launchReason],
            id v23 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v24 = [v23 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification],
            v23,
            (v24 & 1) == 0))
      {
        uint64_t v25 = [v3 rateLimitConfigurationName];
        if (v25)
        {
          v26 = (void *)v25;
          v27 = [v3 rateLimitConfigurationName];
          v28 = (void *)_DASDefaultConfigurationName;

          if (v27 != v28)
          {
            BOOL v8 = 1;
            goto LABEL_5;
          }
        }
        uint64_t v10 = [v3 identifier];
        [v10 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];
        BOOL v8 = 1;
        goto LABEL_9;
      }
    }
  }
LABEL_4:
  BOOL v8 = 0;
LABEL_5:

  return v8;
}

- (void)submitActivity:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:")) {
    [(_DASActivityRateLimitManager *)self isActivityRateLimited:v4 atSubmission:1];
  }
}

- (_DASActivityRateLimitManager)init
{
  v36.receiver = self;
  v36.super_class = (Class)_DASActivityRateLimitManager;
  v2 = [(_DASActivityRateLimitManager *)&v36 init];
  id v3 = v2;
  if (v2)
  {
    v2->_submittedConfigurationLock._os_unfair_lock_opaque = 0;
    id v4 = +[NSMutableDictionary dictionary];
    [(_DASActivityRateLimitManager *)v3 setRateLimitConfigurations:v4];

    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    objc_storeStrong((id *)&v3->_defaults, v5);
    id v6 = +[_DASRateLimiterUtilities getCurrentBootSessionUUID];
    unsigned __int8 v7 = [v5 stringForKey:@"previousBootUUID"];
    BOOL v8 = [(_DASActivityRateLimitManager *)v3 loadSubmittedRateLimitConfiguration];
    id v9 = v8;
    if (v8 && [v8 count]) {
      unsigned int v10 = [v6 isEqualToString:v7];
    }
    else {
      unsigned int v10 = 0;
    }
    uint64_t v11 = +[_CDClientContext userContext];
    context = v3->_context;
    v3->_context = (_CDContext *)v11;

    os_log_t v13 = os_log_create("com.apple.duetactivityscheduler", "processRateLimiter");
    log = v3->_log;
    v3->_log = (OS_os_log *)v13;

    os_unfair_lock_lock(&v3->_submittedConfigurationLock);
    if (v10)
    {
      id v15 = [v9 mutableCopy];
    }
    else
    {
      id v15 = +[NSMutableDictionary dictionary];
    }
    unsigned __int8 v16 = v15;
    [(_DASActivityRateLimitManager *)v3 setSubmittedConfigurations:v15];

    uint64_t v17 = [(_DASActivityRateLimitManager *)v3 submittedConfigurations];
    uint64_t v18 = _DASCKRateLimitConfigurationName;
    unsigned __int8 v19 = [v17 objectForKeyedSubscript:_DASCKRateLimitConfigurationName];

    if (!v19)
    {
      v20 = +[_DASRateLimiterUtilities ckRateLimitConfiguration];
      v21 = [(_DASActivityRateLimitManager *)v3 submittedConfigurations];
      [v21 setObject:v20 forKeyedSubscript:v18];
    }
    unsigned __int8 v22 = [(_DASActivityRateLimitManager *)v3 submittedConfigurations];
    uint64_t v23 = _DASPECRateLimitConfigurationName;
    unsigned __int8 v24 = [v22 objectForKeyedSubscript:_DASPECRateLimitConfigurationName];

    if (!v24)
    {
      uint64_t v25 = +[_DASRateLimiterUtilities pecRateLimitConfiguration];
      v26 = [(_DASActivityRateLimitManager *)v3 submittedConfigurations];
      [v26 setObject:v25 forKeyedSubscript:v23];
    }
    os_unfair_lock_unlock(&v3->_submittedConfigurationLock);
    [(_DASActivityRateLimitManager *)v3 saveSubmittedRateLimitConfiguration];
    v27 = dispatch_get_global_queue(-32768, 0);
    dispatch_source_t v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v27);
    cleanupTimer = v3->_cleanupTimer;
    v3->_cleanupTimer = (OS_dispatch_source *)v28;

    v30 = v3->_cleanupTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100018870;
    handler[3] = &unk_1001754F8;
    v35 = v3;
    dispatch_source_set_event_handler(v30, handler);
    v31 = v3->_cleanupTimer;
    dispatch_time_t v32 = dispatch_walltime(0, 14400000000000);
    dispatch_source_set_timer(v31, v32, 0xD18C2E28000uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)v3->_cleanupTimer);
    [(NSUserDefaults *)v3->_defaults setObject:v6 forKey:@"previousBootUUID"];
  }
  return v3;
}

+ (id)sharedLimiter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018918;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3AA0 != -1) {
    dispatch_once(&qword_1001C3AA0, block);
  }
  v2 = (void *)qword_1001C3AA8;

  return v2;
}

- (void)cleanupTimerHandler
{
  id obj = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  objc_sync_enter(obj);
  id v3 = +[NSDate now];
  id v4 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  id v5 = [v4 copy];

  id v6 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v7 objectForKeyedSubscript:v11];
        if ([v12 isInactiveAtDate:v3])
        {
          os_log_t v13 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
          [v13 removeObjectForKey:v11];

          [v6 addObject:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  double v14 = [(_DASActivityRateLimitManager *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
    *(_DWORD *)buf = 138412546;
    unsigned __int8 v22 = v6;
    __int16 v23 = 2112;
    unsigned __int8 v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Removed rate limits %@. Now: %@", buf, 0x16u);
  }
  objc_sync_exit(obj);
}

- (BOOL)executeActivity:(id)a3
{
  id v4 = a3;
  if ([(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v4]) {
    unsigned int v5 = ![(_DASActivityRateLimitManager *)self isActivityRateLimited:v4 atSubmission:0];
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)completeActivity:(id)a3
{
  id v4 = a3;
  if ([(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v4])
  {
    unsigned int v5 = +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:v4];
    if (v5)
    {
      id v6 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      objc_sync_enter(v6);
      id v7 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      id v8 = [v7 objectForKeyedSubscript:v5];

      if (v8)
      {
        [v8 removePendingActivity:v4];
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_1000F2D58();
      }

      objc_sync_exit(v6);
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "No group name for %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)recalculateStartDates
{
  unsigned int v18 = +[_DASRateLimiterUtilities consideredInLPMWithState:self->_context];
  id obj = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  objc_sync_enter(obj);
  id v3 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  id v4 = [v3 allValues];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v4;
  id v19 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v16);
        }
        unsigned int v5 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v6 = [v5 evaluationResultsWithLPMState:v18, obj];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v7 = [v5 pendingActivities];
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v22;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
              v12 = [v6 nextEvaluationDate];
              +[_DASRateLimiterUtilities adjustStartAfterDate:v12 forActivity:v11];

              os_log_t v13 = self->_log;
              if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
              {
                double v14 = [v6 nextEvaluationDate];
                *(_DWORD *)buf = 138412546;
                uint64_t v30 = v11;
                __int16 v31 = 2112;
                dispatch_time_t v32 = v14;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "Adjust activity %@ startAfter date to be %@", buf, 0x16u);
              }
            }
            id v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
          }
          while (v8);
        }
      }
      id v19 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v19);
  }

  objc_sync_exit(obj);
}

- (void)replaceExistingRateLimitsForConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  id v6 = [v5 copy];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v50;
    *(void *)&long long v9 = 138412546;
    long long v36 = v9;
    v12 = &OBJC_IVAR____DASDataProtectionMaster__notifyEnabled;
    id v38 = v7;
    id v39 = v4;
    uint64_t v37 = *(void *)v50;
    do
    {
      os_log_t v13 = 0;
      id v40 = v10;
      do
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v7);
        }
        double v14 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * (void)v13), v36];
        id v15 = v14;
        if (v14)
        {
          id v16 = [v14 configurationName];
          [v4 name];
          uint64_t v17 = v43 = v15;
          unsigned int v18 = [v16 isEqualToString:v17];

          id v15 = v43;
          if (v18)
          {
            log = self->_log;
            if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v36;
              v54 = v43;
              __int16 v55 = 2112;
              id v56 = v4;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Replacing configuration %@ with %@", buf, 0x16u);
            }
            long long v20 = [v4 rateLimits];

            v42 = v13;
            if (v20)
            {
              [v43 replaceRateLimitConfiguration:v4];
              id v21 = [v12 + 926 consideredInLPMWithState:self->_context];
              if (v21)
              {
                long long v22 = self->_log;
                if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Rate Limits are subjected to LPM Windows", buf, 2u);
                }
              }
              v41 = [v43 evaluationResultsWithLPMState:v21];
              long long v23 = [v41 nextEvaluationDate];
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              id obj = [v43 pendingActivities];
              id v24 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v46;
                do
                {
                  for (i = 0; i != v25; i = (char *)i + 1)
                  {
                    if (*(void *)v46 != v26) {
                      objc_enumerationMutation(obj);
                    }
                    long long v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    v29 = self->_log;
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v30 = v29;
                      [v28 description];
                      __int16 v31 = self;
                      v33 = dispatch_time_t v32 = v12;
                      v34 = [v43 configurationName];
                      *(_DWORD *)buf = 138412802;
                      v54 = v33;
                      __int16 v55 = 2112;
                      id v56 = v23;
                      __int16 v57 = 2112;
                      v58 = v34;
                      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Modified rate limit! Adjusted activity %@ start date to %@ configuration %@", buf, 0x20u);

                      v12 = v32;
                      self = v31;
                    }
                    [v12 + 926 adjustStartAfterDate:v23 forActivity:v28];
                  }
                  id v25 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
                }
                while (v25);
              }

              id v7 = v38;
              id v4 = v39;
              uint64_t v11 = v37;
              id v10 = v40;
              v35 = v41;
              id v15 = v43;
            }
            else
            {
              v35 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
              long long v23 = [v43 configurationName];
              [v35 removeObjectForKey:v23];
            }

            os_log_t v13 = v42;
          }
        }

        os_log_t v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      id v10 = [v7 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v10);
  }
}

- (void)saveSubmittedRateLimitConfiguration
{
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  uint64_t v4 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
  if (v4
    && (unsigned int v5 = (void *)v4,
        [(_DASActivityRateLimitManager *)self submittedConfigurations],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    id v8 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
    long long v9 = +[NSDictionary dictionaryWithDictionary:v8];

    id v13 = 0;
    id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v13];
    id v11 = v13;
    if (v10)
    {
      [(NSUserDefaults *)self->_defaults setObject:v10 forKey:@"rateLimitConfigurations"];
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F2DDC();
    }
    os_unfair_lock_unlock(p_submittedConfigurationLock);
  }
  else
  {
    id v12 = [(_DASActivityRateLimitManager *)self loadSubmittedRateLimitConfiguration];
    if (v12) {
      [(NSUserDefaults *)self->_defaults removeObjectForKey:@"rateLimitConfigurations"];
    }
    os_unfair_lock_unlock(p_submittedConfigurationLock);
  }
}

- (id)loadSubmittedRateLimitConfiguration
{
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  uint64_t v4 = [(NSUserDefaults *)self->_defaults objectForKey:@"rateLimitConfigurations"];
  if (v4)
  {
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    unsigned int v5 = +[NSArray arrayWithObjects:v11 count:3];
    id v6 = +[NSSet setWithArray:v5];

    id v10 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v4 error:&v10];
    id v8 = v10;
    if (!v7 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F2E44();
    }
    os_unfair_lock_unlock(p_submittedConfigurationLock);
  }
  else
  {
    os_unfair_lock_unlock(p_submittedConfigurationLock);
    id v7 = 0;
  }

  return v7;
}

- (void)submitRateLimitConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  objc_sync_enter(v5);
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  id v7 = [(_DASActivityRateLimitManager *)self submittedConfigurations];

  if (!v7)
  {
    id v8 = +[NSMutableDictionary dictionary];
    [(_DASActivityRateLimitManager *)self setSubmittedConfigurations:v8];
  }
  long long v9 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
  id v10 = [v4 name];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11
    && ([v4 rateLimits], id v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    double v14 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
    id v15 = [v4 name];
    [v14 removeObjectForKey:v15];
  }
  else
  {
    if ([v11 isEqual:v4])
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Submitted rate limit %@ already exists", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_13;
    }
    double v14 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
    id v15 = [v4 name];
    [v14 setObject:v4 forKeyedSubscript:v15];
  }

  os_unfair_lock_unlock(&self->_submittedConfigurationLock);
  [(_DASActivityRateLimitManager *)self saveSubmittedRateLimitConfiguration];
  [(_DASActivityRateLimitManager *)self replaceExistingRateLimitsForConfiguration:v4];
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  id v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [(_DASActivityRateLimitManager *)self submittedConfigurations];
    unsigned int v18 = [v17 allKeys];
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    long long v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Submitted rate limit %@. Submitted rate limits %@", (uint8_t *)&v19, 0x16u);
  }
LABEL_13:
  os_unfair_lock_unlock(p_submittedConfigurationLock);

  objc_sync_exit(v5);
}

- (id)evaluationResultsAtExecution:(id)a3
{
  id v4 = a3;
  if ([(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v4])
  {
    unsigned int v5 = +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:v4];
    if (v5)
    {
      id v6 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      objc_sync_enter(v6);
      id v7 = [(_DASActivityRateLimitManager *)self unprotectedEvaluateRateLimitedActivity:v4 forIdentifier:v5];
      id v8 = [v7 maxedRateLimits];
      id v9 = [v8 count];

      if (v9)
      {
        id v10 = v7;
      }
      else
      {
        id v11 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
        id v12 = [v11 objectForKeyedSubscript:v5];

        id v13 = +[NSDate now];
        [v12 executeActivity:v4 atDate:v13];

        id v10 = 0;
      }

      objc_sync_exit(v6);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)evaluateRateLimitedActivity:(id)a3
{
  id v4 = a3;
  if ([(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v4])
  {
    unsigned int v5 = +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:v4];
    if (v5)
    {
      id v6 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
      objc_sync_enter(v6);
      id v7 = [(_DASActivityRateLimitManager *)self unprotectedEvaluateRateLimitedActivity:v4 forIdentifier:v5];
      objc_sync_exit(v6);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)unprotectedEvaluateRateLimitedActivity:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(_DASActivityRateLimitManager *)self rateManagementApplyToActivity:v6])
  {
    id v12 = 0;
    goto LABEL_15;
  }
  id v8 = [(_DASActivityRateLimitManager *)self rateLimitConfigurations];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9) {
    [(_DASActivityRateLimitManager *)self initializeRateLimitWithActivity:v6 withIdentifier:v7];
  }
  BOOL v10 = +[_DASRateLimiterUtilities consideredInLPMWithState:self->_context];
  if (v10)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Rate Limits are subjected to LPM Windows", (uint8_t *)&v25, 2u);
    }
  }
  id v12 = [v9 evaluationResultsWithLPMState:v10];
  id v13 = [v12 maxedRateLimits];
  id v14 = [v13 count];

  if (v14)
  {
    [v9 addPendingActivity:v6];
    id v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      uint64_t v17 = [v6 startAfter];
      unsigned int v18 = [v12 nextEvaluationDate];
      int v19 = [v12 maxedRateLimits];
      id v20 = +[NSNumber numberWithBool:v10];
      int v25 = 138413570;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v18;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2114;
      id v32 = v7;
      __int16 v33 = 2112;
      v34 = v19;
      __int16 v35 = 2112;
      long long v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Adjusting original start date %@ to start date %@ for activity '%{public}@' with identifier %{public}@ and rate limit %@ while device LPM state is %@", (uint8_t *)&v25, 0x3Eu);
    }
    __int16 v21 = [v12 nextEvaluationDate];
    +[_DASRateLimiterUtilities adjustStartAfterDate:v21 forActivity:v6];
  }
  else
  {
    long long v22 = self->_log;
    if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    __int16 v21 = v22;
    id v24 = +[NSNumber numberWithBool:v10];
    int v25 = 138543874;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "'%{public}@' is timewise eligible for rate limit configuration %@ while device LPM state is %@", (uint8_t *)&v25, 0x20u);
  }
LABEL_14:

LABEL_15:

  return v12;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_DASActivityRateLimitManager *)self limitsApplyToActivity:v6]
    && +[_DASLimiterResponse queryActivityDecision:5 fromResponses:v7])
  {
    +[_DASLimiterResponse updateActivity:v6 withLimitResponse:v7];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setRateLimitConfigurations:(id)a3
{
}

- (NSMutableDictionary)submittedConfigurations
{
  return self->_submittedConfigurations;
}

- (void)setSubmittedConfigurations:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (os_unfair_lock_s)submittedConfigurationLock
{
  return self->_submittedConfigurationLock;
}

- (void)setSubmittedConfigurationLock:(os_unfair_lock_s)a3
{
  self->_submittedConfigurationLock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
}

- (OS_dispatch_source)cleanupTimer
{
  return self->_cleanupTimer;
}

- (void)setCleanupTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_limitationName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_submittedConfigurations, 0);

  objc_storeStrong((id *)&self->_rateLimitConfigurations, 0);
}

@end