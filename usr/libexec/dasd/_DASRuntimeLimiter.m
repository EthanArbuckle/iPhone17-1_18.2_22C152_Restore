@interface _DASRuntimeLimiter
+ (BOOL)activityRequiresLeniencyCaps:(id)a3;
+ (BOOL)activityRequiresStrictCaps:(id)a3;
+ (id)sharedLimiter;
- (BOOL)deleteLimitForActivity:(id)a3;
- (BOOL)featureDurationLimitAppliesToActivity:(id)a3;
- (BOOL)featureHasNoRemainingRuntimeForActivity:(id)a3;
- (BOOL)featureHasRunTime:(id)a3;
- (BOOL)hasDynamicOverrides:(id)a3;
- (BOOL)hasStaticOverrides:(id)a3;
- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4;
- (BOOL)limitsApplyToActivity:(id)a3;
- (BOOL)onlyPreemptiveSuspend;
- (BOOL)setLimit:(double)a3 forActivity:(id)a4;
- (NSDictionary)customDurations;
- (NSMutableDictionary)featureRuntimeLimits;
- (NSMutableDictionary)testingOverride;
- (NSString)limitationName;
- (NSString)trialExperimentID;
- (NSString)trialTreatmentID;
- (_DASRuntimeLimiter)init;
- (_DASTrialManager)trialManager;
- (double)defaultRuntime;
- (double)defaultRuntimeForActivity:(id)a3;
- (double)durationWithActivityType:(unint64_t)a3;
- (double)dynamicDurationForActivity:(id)a3;
- (double)leniencyRuntime;
- (double)limitedRuntime;
- (double)maximumRemainingFeatureDurationForActivity:(id)a3;
- (double)maximumRuntimeForActivity:(id)a3;
- (double)remainingDurationForFeature:(id)a3;
- (double)staticDurationForActivity:(id)a3;
- (id)exhaustedRuntimeFeatureCodesAssociatedWithActivity:(id)a3;
- (id)loadCustomDurations;
- (id)shouldLimitActivityAtRuntime:(id)a3 withStartDate:(id)a4 atDate:(id)a5 withContext:(id)a6;
- (os_unfair_lock_s)lock;
- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4;
- (void)loadTrialParameters;
- (void)resetOnlyPreemptiveSuspend;
- (void)setCustomDurations:(id)a3;
- (void)setDefaultRuntime:(double)a3;
- (void)setFeatureRuntimeLimits:(id)a3;
- (void)setLeniencyRuntime:(double)a3;
- (void)setLimitationName:(id)a3;
- (void)setLimitedRuntime:(double)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setOnlyPreemptiveSuspend:(BOOL)a3;
- (void)setTestingOverride:(id)a3;
- (void)setTrialExperimentID:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setTrialTreatmentID:(id)a3;
@end

@implementation _DASRuntimeLimiter

+ (BOOL)activityRequiresLeniencyCaps:(id)a3
{
  id v3 = a3;
  if (([v3 isIntensive] & 1) != 0
    || ([v3 requiresDeviceInactivity] & 1) != 0
    || ([v3 requiresPlugin] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6 = [v3 fastPass];

    BOOL v4 = v6 != 0;
  }

  return v4;
}

- (BOOL)featureHasNoRemainingRuntimeForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 featureCodes];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 featureCodes];
    id v8 = [v7 count];

    if (v8)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v22 = v4;
      id obj = [v4 featureCodes];
      id v9 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v26 = *(void *)v28;
        LOBYTE(v8) = 1;
        v23 = self;
        do
        {
          v11 = 0;
          id v24 = v10;
          do
          {
            if (*(void *)v28 != v26) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v11);
            unsigned __int8 v13 = [(_DASRuntimeLimiter *)self featureHasRunTime:v12];
            v14 = +[_DASDaemonLogger logForCategory:@"featureDurationTracker"];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v15 = [v12 intValue];
              v16 = +[_DASFeatureDurationTracker sharedInstance];
              [v16 durationForFeature:v12];
              uint64_t v18 = v17;
              v19 = +[_DASFeatureDurationTracker sharedInstance];
              [v19 maximumDurationForFeature:v12];
              *(_DWORD *)buf = 67109632;
              unsigned int v32 = v15;
              self = v23;
              __int16 v33 = 2048;
              uint64_t v34 = v18;
              __int16 v35 = 2048;
              uint64_t v36 = v20;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Feature code %d has utilized %f < %f", buf, 0x1Cu);

              id v10 = v24;
            }
            LOBYTE(v8) = (v13 ^ 1) & v8;

            v11 = (char *)v11 + 1;
          }
          while (v10 != v11);
          id v10 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v10);
      }
      else
      {
        LOBYTE(v8) = 1;
      }

      id v4 = v22;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (double)defaultRuntimeForActivity:(id)a3
{
  id v4 = a3;
  double leniencyRuntime = -1.0;
  if ([(_DASRuntimeLimiter *)self limitsApplyToActivity:v4])
  {
    v6 = [v4 identifier];
    v7 = [(NSMutableDictionary *)self->_testingOverride objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = [(NSMutableDictionary *)self->_testingOverride objectForKeyedSubscript:v6];
      [v8 doubleValue];
      double leniencyRuntime = v9;

      id v10 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = +[NSNumber numberWithDouble:leniencyRuntime];
        int v13 = 138543618;
        id v14 = v4;
        __int16 v15 = 2112;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ has testing overrides to %@ seconds", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (+[_DASRuntimeLimiter activityRequiresLeniencyCaps:v4])
    {
      double leniencyRuntime = self->_leniencyRuntime;
    }
    else if (+[_DASRuntimeLimiter activityRequiresStrictCaps:v4])
    {
      double leniencyRuntime = self->_limitedRuntime;
    }
    else
    {
      double leniencyRuntime = self->_defaultRuntime;
    }
  }
  return leniencyRuntime;
}

- (double)maximumRuntimeForActivity:(id)a3
{
  id v4 = a3;
  double v5 = -1.0;
  if ([(_DASRuntimeLimiter *)self limitsApplyToActivity:v4])
  {
    v6 = [v4 identifier];
    v7 = [(NSMutableDictionary *)self->_testingOverride objectForKeyedSubscript:v6];

    if (v7)
    {
      id v8 = [(NSMutableDictionary *)self->_testingOverride objectForKeyedSubscript:v6];
      [v8 doubleValue];
      double v5 = v9;

      id v10 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = +[NSNumber numberWithDouble:v5];
        int v17 = 138543618;
        id v18 = v4;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ has testing overrides to %@ seconds", (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      double v12 = 0.0;
      if (![(_DASRuntimeLimiter *)self hasDynamicOverrides:v4]
        || ([(_DASRuntimeLimiter *)self dynamicDurationForActivity:v4],
            double v12 = v13,
            v13 != -1.0))
      {
        if ([(_DASRuntimeLimiter *)self hasStaticOverrides:v4])
        {
          [(_DASRuntimeLimiter *)self staticDurationForActivity:v4];
          if (v12 < v14) {
            double v12 = v14;
          }
        }
        if (v12 != -1.0)
        {
          [(_DASRuntimeLimiter *)self defaultRuntimeForActivity:v4];
          if (v12 >= v15) {
            double v5 = v12;
          }
          else {
            double v5 = v15;
          }
        }
      }
    }
  }
  return v5;
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 schedulingPriority];
  if ((unint64_t)v5 > _DASSchedulingPriorityDefault) {
    goto LABEL_16;
  }
  if ([v4 userRequestedBackupTask]) {
    goto LABEL_16;
  }
  uint64_t v6 = [v4 groupName];
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [v4 groupName];
    unsigned __int8 v9 = [v8 isEqualToString:@"NSURLSessionBackgroundPoolName"];

    if (v9) {
      goto LABEL_16;
    }
  }
  id v10 = [v4 name];

  if (!v10) {
    goto LABEL_16;
  }
  if (![(_DASRuntimeLimiter *)self hasStaticOverrides:v4]
    || ([(_DASRuntimeLimiter *)self staticDurationForActivity:v4], v11 != -1.0))
  {
    if (![(_DASRuntimeLimiter *)self hasDynamicOverrides:v4]
      || ([(_DASRuntimeLimiter *)self dynamicDurationForActivity:v4], v14 != -1.0))
    {
      BOOL v15 = 1;
      goto LABEL_17;
    }
    double v12 = +[_DASDaemonLogger logForCategory:@"runtimeLimits"];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v17 = 138412290;
    id v18 = v4;
    double v13 = "Unlimited runtime due to dynamic overrides: %@";
    goto LABEL_14;
  }
  double v12 = +[_DASDaemonLogger logForCategory:@"runtimeLimits"];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    double v13 = "Unlimited runtime due to static overrides: %@";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
  }
LABEL_15:

LABEL_16:
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)hasStaticOverrides:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  customDurations = self->_customDurations;
  if (customDurations
    && ([(NSDictionary *)customDurations objectForKeyedSubscript:v5],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v9 = [v4 name];
    if ([v9 containsString:@"com.apple.softwareupdate.autoinstall.startInstall"])
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      id v10 = [v4 name];
      unsigned __int8 v8 = [v10 containsString:@"com.apple.SUOSUScheduler.tonight.install"];
    }
  }

  return v8;
}

- (BOOL)hasDynamicOverrides:(id)a3
{
  id v3 = a3;
  if ([v3 noTransferSizeSpecified])
  {
    id v4 = +[_DASPlistParser sharedInstance];
    unsigned __int8 v5 = [v4 containsOverrideForActivity:v3 withLimitation:kDASDynamicRuntimeLimitationName];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (_DASRuntimeLimiter)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASRuntimeLimiter;
  v2 = [(_DASRuntimeLimiter *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [(_DASRuntimeLimiter *)v2 loadCustomDurations];
    customDurations = v3->_customDurations;
    v3->_customDurations = (NSDictionary *)v4;

    objc_storeStrong((id *)&v3->_limitationName, kDASRuntimeLimitationName);
    uint64_t v6 = +[_DASTrialManager sharedInstanceForNamespace:@"COREOS_DAS"];
    trialManager = v3->_trialManager;
    v3->_trialManager = (_DASTrialManager *)v6;

    [(_DASTrialManager *)v3->_trialManager addDelegate:v3];
    [(_DASRuntimeLimiter *)v3 resetOnlyPreemptiveSuspend];
    [(_DASRuntimeLimiter *)v3 loadTrialParameters];
    if (v3->_defaultRuntime == 0.0) {
      v3->_defaultRuntime = 180.0;
    }
    if (v3->_leniencyRuntime == 0.0) {
      v3->_double leniencyRuntime = 600.0;
    }
    if (v3->_limitedRuntime == 0.0) {
      v3->_limitedRuntime = 60.0;
    }
    testingOverride = v3->_testingOverride;
    v3->_testingOverride = 0;
  }
  return v3;
}

+ (id)sharedLimiter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013110;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3A80 != -1) {
    dispatch_once(&qword_1001C3A80, block);
  }
  v2 = (void *)qword_1001C3A88;

  return v2;
}

+ (BOOL)activityRequiresStrictCaps:(id)a3
{
  id v3 = a3;
  [v3 interval];
  if (v4 == 0.0) {
    unsigned __int8 v5 = [v3 preventDeviceSleep];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (double)durationWithActivityType:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  if (a3 >= 0xB)
  {
    double result = -1.0;
    if (a3 > 0x1D) {
      return result;
    }
    uint64_t v3 = 40;
  }
  else
  {
    uint64_t v3 = 32;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (double)dynamicDurationForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 identifier];
  double v6 = 0.0;
  if (![(_DASRuntimeLimiter *)self hasDynamicOverrides:v4])
  {
LABEL_10:
    double v11 = +[_DASDaemonLogger logForCategory:@"runtimeLimits"];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000F2960();
    }
    goto LABEL_12;
  }
  v7 = +[_DASPlistParser sharedInstance];
  unsigned int v8 = [v7 containsOverrideForActivity:v4 withLimitation:kDASDynamicRuntimeLimitationName];

  double v9 = 0.0;
  if (v8) {
    double v9 = (double)(unint64_t)[v4 duration];
  }
  if ([v4 noTransferSizeSpecified])
  {
    double v6 = v9;
    goto LABEL_10;
  }
  -[_DASRuntimeLimiter durationWithActivityType:](self, "durationWithActivityType:", [v4 transferSizeType]);
  double v6 = -1.0;
  if (v10 != -1.0)
  {
    if (v9 >= v10) {
      double v6 = v9;
    }
    else {
      double v6 = v10;
    }
    goto LABEL_10;
  }
  double v11 = +[_DASDaemonLogger logForCategory:@"runtimeLimits"];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000F29F8();
  }
LABEL_12:

  return v6;
}

- (double)staticDurationForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 identifier];
  double v6 = 0.0;
  if (![(_DASRuntimeLimiter *)self hasStaticOverrides:v4]) {
    goto LABEL_6;
  }
  v7 = [v4 name];
  if ([v7 containsString:@"com.apple.softwareupdate.autoinstall.startInstall"])
  {

    double v8 = -1.0;
    goto LABEL_9;
  }
  double v9 = [v4 name];
  unsigned __int8 v10 = [v9 containsString:@"com.apple.SUOSUScheduler.tonight.install"];

  double v8 = -1.0;
  if ((v10 & 1) == 0)
  {
    double v11 = [(NSDictionary *)self->_customDurations objectForKeyedSubscript:v5];
    [v11 doubleValue];
    double v6 = v12;

    if (v6 > 0.0)
    {
LABEL_6:
      double v13 = +[_DASDaemonLogger logForCategory:@"runtimeLimits"];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000F2A6C();
      }

      double v8 = v6;
    }
  }
LABEL_9:

  return v8;
}

- (id)loadCustomDurations
{
  v2 = +[_DASPlistParser sharedInstance];
  uint64_t v3 = [v2 loadOverrides];

  uint64_t v4 = kDASRuntimeLimitationName;
  id v18 = v3;
  unsigned __int8 v5 = [v3 objectForKeyedSubscript:kDASRuntimeLimitationName];
  double v6 = +[_DASPlistParser sharedInstance];
  v7 = [v6 dictionaryForPlist:1];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    double v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        BOOL v15 = [v7 objectForKeyedSubscript:v14];
        v16 = [v15 objectForKeyedSubscript:v4];

        if (v16)
        {
          if (!v11)
          {
            double v11 = +[NSMutableDictionary dictionary];
          }
          [v11 setObject:v16 forKeyedSubscript:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (BOOL)featureDurationLimitAppliesToActivity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fastPass];
  if (v4)
  {
    unsigned __int8 v5 = [v3 featureCodes];
    if (v5)
    {
      double v6 = [v3 featureCodes];
      BOOL v7 = [v6 count] != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)featureHasRunTime:(id)a3
{
  [(_DASRuntimeLimiter *)self remainingDurationForFeature:a3];
  return v3 > 0.0;
}

- (id)exhaustedRuntimeFeatureCodesAssociatedWithActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 featureCodes];
  if (v5
    && (double v6 = (void *)v5,
        [v4 featureCodes],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    id v9 = +[NSMutableSet set];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = [v4 featureCodes];
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (![(_DASRuntimeLimiter *)self featureHasRunTime:v15]) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    if ([v9 count]) {
      v16 = v9;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (double)remainingDurationForFeature:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASFeatureDurationTracker sharedInstance];
  [v4 maximumDurationForFeature:v3];
  double v6 = v5;

  BOOL v7 = +[_DASFeatureDurationTracker sharedInstance];
  [v7 durationForFeature:v3];
  double v9 = v8;

  double v10 = v6 - v9;
  id v11 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v3;
    __int16 v15 = 2048;
    double v16 = v9;
    __int16 v17 = 2048;
    double v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Feature %@ has consumed %.1fs, remaining run time budget %.1fs", (uint8_t *)&v13, 0x20u);
  }

  return v10;
}

- (double)maximumRemainingFeatureDurationForActivity:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 featureCodes];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_DASRuntimeLimiter *)self remainingDurationForFeature:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10 > v8) {
          double v8 = v10;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)shouldLimitActivityAtRuntime:(id)a3 withStartDate:(id)a4 atDate:(id)a5 withContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v10 suspendRequestDate];

  long long v15 = 0;
  if (v11 && !v14)
  {
    if (![(_DASRuntimeLimiter *)self limitsApplyToActivity:v10]) {
      goto LABEL_10;
    }
    if (+[_DASPhotosPolicy isiCPLActivity:v10]
      && +[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:v13])
    {
      double v16 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v37 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Runtime limit doesn't apply because User initiated Sync Now %{public}@", buf, 0xCu);
      }
      long long v15 = 0;
      goto LABEL_23;
    }
    [(_DASRuntimeLimiter *)self maximumRuntimeForActivity:v10];
    double v18 = v17;
    [v12 timeIntervalSinceDate:v11];
    double v20 = v19;
    if (v18 == -1.0)
    {
LABEL_10:
      long long v15 = 0;
      goto LABEL_24;
    }
    if (v18 == 0.0)
    {
      [(_DASRuntimeLimiter *)self defaultRuntimeForActivity:v10];
      double v18 = v21;
    }
    if (v20 >= v18)
    {
      long long v29 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
      double v30 = v20 / 60.0;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v31 = +[NSNumber numberWithDouble:v30];
        double v32 = v18 / 60.0;
        __int16 v33 = +[NSNumber numberWithDouble:v32];
        *(_DWORD *)buf = 138543874;
        id v37 = v10;
        __int16 v38 = 2114;
        v39 = v31;
        __int16 v40 = 2112;
        v41 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ should suspend, running for %{public}@ mins > max (activity) limit %@", buf, 0x20u);
      }
      else
      {
        double v32 = v18 / 60.0;
      }

      uint64_t v34 = kDASRuntimeLimitationName;
      +[NSString stringWithFormat:@"Exceed Activity Runtime %f mins > %f mins", *(void *)&v30, *(void *)&v32];
    }
    else
    {
      if (![(_DASRuntimeLimiter *)self featureDurationLimitAppliesToActivity:v10])goto LABEL_10; {
      [(_DASRuntimeLimiter *)self maximumRemainingFeatureDurationForActivity:v10];
      }
      if (v20 < v22) {
        goto LABEL_10;
      }
      double v23 = v22;
      id v24 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
      double v25 = v20 / 60.0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = +[NSNumber numberWithDouble:v25];
        double v27 = v23 / 60.0;
        long long v28 = +[NSNumber numberWithDouble:v27];
        *(_DWORD *)buf = 138543874;
        id v37 = v10;
        __int16 v38 = 2114;
        v39 = v26;
        __int16 v40 = 2112;
        v41 = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ should suspend, running for %{public}@ mins (remaining feature runtime limit %@) mins", buf, 0x20u);
      }
      else
      {
        double v27 = v23 / 60.0;
      }

      uint64_t v34 = kDASRuntimeLimitationName;
      +[NSString stringWithFormat:@"Exceed Feature Runtime %f mins > %f mins", *(void *)&v25, *(void *)&v27];
    double v16 = };
    long long v15 = +[_DASLimiterResponse limitResponseWithDecision:3 withLimiter:v34 validityDuration:v16 rationale:600.0];
LABEL_23:
  }
LABEL_24:

  return v15;
}

- (void)loadTrialParameters
{
  id v3 = [(_DASTrialManager *)self->_trialManager factorWithName:@"runtimeDefaultLimit"];
  [v3 doubleValue];
  double v5 = v4;

  self->_uint64_t defaultRuntime = v5;
  id v6 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t defaultRuntime = (uint64_t)self->_defaultRuntime;
    int v18 = 134217984;
    uint64_t v19 = defaultRuntime;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trial: runtimeDefaultLimit %ld", (uint8_t *)&v18, 0xCu);
  }

  double v8 = [(_DASTrialManager *)self->_trialManager factorWithName:@"runtimeLenientLimit"];
  [v8 doubleValue];
  double v10 = v9;

  self->_uint64_t leniencyRuntime = v10;
  id v11 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t leniencyRuntime = (uint64_t)self->_leniencyRuntime;
    int v18 = 134217984;
    uint64_t v19 = leniencyRuntime;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: runtimeLenientLimit %ld", (uint8_t *)&v18, 0xCu);
  }

  id v13 = [(_DASTrialManager *)self->_trialManager factorWithName:@"runtimeLimitedLimit"];
  [v13 doubleValue];
  double v15 = v14;

  self->_uint64_t limitedRuntime = v15;
  double v16 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t limitedRuntime = (uint64_t)self->_limitedRuntime;
    int v18 = 134217984;
    uint64_t v19 = limitedRuntime;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Trial: runtimeLimitedLimit %ld", (uint8_t *)&v18, 0xCu);
  }
}

- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4
{
  if ([a4 isEqualToString:@"COREOS_DAS"])
  {
    [(_DASRuntimeLimiter *)self loadTrialParameters];
  }
}

- (void)resetOnlyPreemptiveSuspend
{
  id v3 = [(_DASTrialManager *)self->_trialManager factorWithName:@"isPreemptiveSuspendOnly"];
  unsigned int v4 = [v3 BOOLeanValue];

  self->_onlyPreemptiveSuspend = v4;
  double v5 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trial: isPreemptiveSuspendOnly %d", (uint8_t *)v6, 8u);
  }
}

- (BOOL)deleteLimitForActivity:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMutableDictionary *)self->_testingOverride objectForKeyedSubscript:v4];

  if (v5)
  {
    [(NSMutableDictionary *)self->_testingOverride removeObjectForKey:v4];
    id v6 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      uint64_t v7 = "Removing override for %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v6 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      uint64_t v7 = "Failed to remove override for %@";
      goto LABEL_6;
    }
  }

  return v5 != 0;
}

- (BOOL)setLimit:(double)a3 forActivity:(id)a4
{
  id v6 = a4;
  if (!self->_testingOverride)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    testingOverride = self->_testingOverride;
    self->_testingOverride = v7;
  }
  int v9 = +[NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_testingOverride setObject:v9 forKeyedSubscript:v6];

  id v10 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSNumber numberWithDouble:a3];
    int v13 = 138412546;
    double v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Set limit %@ seconds for %@", (uint8_t *)&v13, 0x16u);
  }
  return 1;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_DASRuntimeLimiter *)self limitsApplyToActivity:v6])
  {
    double v8 = [v6 startDate];

    if (v8)
    {
      int v9 = [v6 suspendRequestDate];

      if (v9)
      {
        id v10 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000F2BD4();
        }
      }
      else
      {
        id v10 = [v6 identifier];
        if (v10)
        {
          id v12 = [(NSMutableDictionary *)self->_testingOverride objectForKeyedSubscript:v10];

          if (v12)
          {
            id v11 = [(_DASRuntimeLimiter *)self testingOverride];
            int v13 = [v11 objectForKeyedSubscript:v10];

            LODWORD(v11) = [v13 intValue];
            if (!v11) {
              goto LABEL_17;
            }
          }
        }
        if (+[_DASLimiterResponse queryActivityDecision:3 fromResponses:v7])
        {
          +[_DASLimiterResponse updateActivity:v6 withLimitResponse:v7];
          id v11 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_1000F2B6C();
          }

          LOBYTE(v11) = 1;
          goto LABEL_17;
        }
      }
    }
    else
    {
      id v10 = +[_DASDaemonLogger logForCategory:@"runtimeLimiter"];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000F2B04();
      }
    }
    LOBYTE(v11) = 0;
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return (char)v11;
}

- (BOOL)onlyPreemptiveSuspend
{
  return self->_onlyPreemptiveSuspend;
}

- (void)setOnlyPreemptiveSuspend:(BOOL)a3
{
  self->_onlyPreemptiveSuspend = a3;
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (double)defaultRuntime
{
  return self->_defaultRuntime;
}

- (void)setDefaultRuntime:(double)a3
{
  self->_uint64_t defaultRuntime = a3;
}

- (double)leniencyRuntime
{
  return self->_leniencyRuntime;
}

- (void)setLeniencyRuntime:(double)a3
{
  self->_uint64_t leniencyRuntime = a3;
}

- (double)limitedRuntime
{
  return self->_limitedRuntime;
}

- (void)setLimitedRuntime:(double)a3
{
  self->_uint64_t limitedRuntime = a3;
}

- (NSString)trialTreatmentID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTrialTreatmentID:(id)a3
{
}

- (NSString)trialExperimentID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTrialExperimentID:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSDictionary)customDurations
{
  return self->_customDurations;
}

- (void)setCustomDurations:(id)a3
{
}

- (NSMutableDictionary)testingOverride
{
  return self->_testingOverride;
}

- (void)setTestingOverride:(id)a3
{
}

- (NSMutableDictionary)featureRuntimeLimits
{
  return self->_featureRuntimeLimits;
}

- (void)setFeatureRuntimeLimits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureRuntimeLimits, 0);
  objc_storeStrong((id *)&self->_testingOverride, 0);
  objc_storeStrong((id *)&self->_customDurations, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);

  objc_storeStrong((id *)&self->_limitationName, 0);
}

@end