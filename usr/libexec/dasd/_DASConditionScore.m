@interface _DASConditionScore
+ (BOOL)isPremiumClient:(id)a3;
+ (double)getScoreForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4 activityScore:(double)a5;
+ (double)preOptimalRelaxationFactor:(unint64_t)a3;
+ (double)relaxationFactorForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4;
+ (double)scoreForActivity:(id)a3 withState:(id)a4 response:(int64_t *)a5;
+ (double)thresholdScoreForActivity:(id)a3;
+ (id)getBucketForDate:(id)a3 withBucketDuration:(int)a4;
+ (id)getMetricsTimer;
+ (id)getPriorityToBlockingPolicies;
+ (id)getResponseStringForPolicy:(id)a3 response:(id)a4 appliesToActivity:(BOOL)a5 weightForActivity:(double)a6;
+ (id)lastDenialResponses:(id)a3;
+ (int64_t)getTimeSlotForActivity:(id)a3;
+ (void)computeOptimalScoreAndDateForActivity:(id)a3;
+ (void)initialize;
+ (void)reportBlockingAnalyticsAndReset;
+ (void)setActivityShouldBypassPredictions:(id)a3;
- (NSDate)date;
@end

@implementation _DASConditionScore

+ (void)setActivityShouldBypassPredictions:(id)a3
{
  id v9 = a3;
  id v3 = [v9 schedulingPriority];
  if ((unint64_t)v3 >= _DASSchedulingPriorityUserInitiated
    || +[_DASPhotosPolicy isiCPLActivity:v9])
  {
    BOOL v4 = 1;
    v5 = v9;
  }
  else
  {
    v6 = [v9 launchReason];
    unsigned __int8 v7 = [v6 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification];

    v5 = v9;
    if (v7)
    {
      BOOL v4 = 1;
    }
    else
    {
      v8 = [v9 fastPass];

      v5 = v9;
      BOOL v4 = v8 != 0;
    }
  }
  [v5 setBypassesPredictions:v4];
}

+ (BOOL)isPremiumClient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated
    || +[_DASPhotosPolicy isiCPLActivity:v3]
    || ([v3 requiresSignificantUserInactivity] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v7 = [v3 fastPass];
    if (v7)
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      v8 = [v3 name];
      unsigned __int8 v5 = [v8 containsString:@"apple.backupd."];
    }
  }

  return v5;
}

+ (void)computeOptimalScoreAndDateForActivity:(id)a3
{
  id v3 = a3;
  id v4 = (void *)os_transaction_create();
  if (qword_1001C40E8 != -1) {
    dispatch_once(&qword_1001C40E8, &stru_1001769D0);
  }
  if ([v3 bypassesPredictions])
  {
    v6 = +[_DASDaemonLogger logForCategory:@"scoring"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000F77C8((uint64_t)v3, v6);
    }

    unsigned __int8 v7 = [v3 startAfter];
    [v3 setPredictedOptimalStartDate:v7];

    [v3 setPredictedOptimalScore:0.01];
    goto LABEL_60;
  }
  v8 = [v3 startAfter];
  id v9 = +[NSDate date];
  [v8 timeIntervalSinceDate:v9];
  if (v10 > 75600.0)
  {
    v11 = [v3 startAfter];
    [v3 setPredictedOptimalStartDate:v11];

    [v3 setPredictedOptimalScore:0.01];
    v12 = +[_DASDaemonLogger logForCategory:@"scoring"];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ start beyond the 21 hour interval", buf, 0xCu);
    }
    goto LABEL_59;
  }
  v64 = v8;
  v61 = v4;
  v62 = v9;
  v60 = v5;
  v13 = +[_DASPolicyManager allPoliciesForPlatform];
  v14 = +[_DASPolicyManager allPoliciesForPlatform];
  v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v12 = v13;
  id v16 = [v12 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v71;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(v12);
        }
        v22 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if ([v22 appliesToActivity:v3])
        {
          if ([v22 conformsToProtocol:&OBJC_PROTOCOL____DASActivityPolicyPredicting])
          {
            [v15 addObject:v22];
          }
          else
          {
            [v22 weightForActivity:v3];
            double v24 = v23;
            if (objc_opt_respondsToSelector())
            {
              [v22 baselineScoreForActivity:v3];
              double v20 = v20 + v24 * v25;
            }
            else
            {
              double v20 = v20 + v24;
            }
            double v19 = v19 + v24;
          }
        }
      }
      id v17 = [v12 countByEnumeratingWithState:&v70 objects:v83 count:16];
    }
    while (v17);
  }
  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
  }

  id v9 = v62;
  [v64 timeIntervalSinceDate:v62];
  if (v26 <= 0.0) {
    v27 = v62;
  }
  else {
    v27 = v64;
  }
  v8 = v27;

  if (![v15 count])
  {
    [v3 setPredictedOptimalStartDate:v8];
    double v33 = v20 / v19;
    if (v19 < 0.001) {
      double v33 = 0.01;
    }
    [v3 setPredictedOptimalScore:v33];
    v34 = +[_DASDaemonLogger logForCategory:@"scoring"];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      [v3 predictedOptimalScore];
      double v36 = v35;
      v37 = [(id)qword_1001C40F0 stringFromDate:v8];
      *(_DWORD *)buf = 138412802;
      id v75 = v3;
      __int16 v76 = 2048;
      double v77 = v36;
      __int16 v78 = 2112;
      v79 = v37;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "WARNING NO POLICIES APPLY TO Activity %@: Optimal Score %.4f at %@", buf, 0x20u);
    }
    goto LABEL_58;
  }
  v28 = [v3 startBefore];
  [v28 timeIntervalSinceDate:v8];
  double v30 = v29;

  double v31 = fmax(fmin(v30, 86400.0), 0.0);
  double v32 = 900.0;
  if (v31 <= 900.0)
  {
    double v32 = 300.0;
  }
  else if (v31 > 14400.0)
  {
    if ([v3 requestsApplicationLaunch]) {
      double v32 = 900.0;
    }
    else {
      double v32 = 1800.0;
    }
  }
  v38 = v8;
  double v39 = 0.01;
  v63 = v38;
  double v59 = v31;
  while (1)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v41 = v15;
    id v42 = [v41 countByEnumeratingWithState:&v66 objects:v82 count:16];
    if (!v42)
    {

      goto LABEL_54;
    }
    id v43 = v42;
    v65 = v40;
    uint64_t v44 = *(void *)v67;
    double v45 = 0.0;
    double v46 = 0.0;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v67 != v44) {
          objc_enumerationMutation(v41);
        }
        v48 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
        [v48 weightForActivity:v3];
        double v51 = v50;
        [v48 predictedScoreForActivity:v3 atDate:v38];
        double v45 = v45 + v51 * v52;
        double v46 = v46 + v51;
      }
      id v43 = [v41 countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v43);

    if (v46 == 0.0)
    {
      v40 = v65;
      goto LABEL_54;
    }
    double v53 = (v20 + v45) / (v19 + v46);
    v40 = v65;
    if (v39 < v53) {
      break;
    }
LABEL_54:
    v8 = [v38 dateByAddingTimeInterval:v32];

    double v31 = v31 - v32;
    v38 = v8;
    if (v31 < 0.0) {
      goto LABEL_55;
    }
  }
  v8 = v38;

  if (v53 <= 0.9)
  {
    double v39 = v53;
    v63 = v8;
    goto LABEL_54;
  }
  double v39 = v53;
  v63 = v8;
LABEL_55:
  [v3 setPredictedOptimalScore:v39];
  [v3 setPredictedOptimalStartDate:v63];
  v54 = [v3 startAfter];
  v55 = +[NSDate dateWithTimeInterval:v54 sinceDate:v59];

  v56 = +[_DASDaemonLogger logForCategory:@"scoring"];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = [(id)qword_1001C40F0 stringFromDate:v63];
    v58 = [(id)qword_1001C40F0 stringFromDate:v55];
    *(_DWORD *)buf = 138413058;
    id v75 = v3;
    __int16 v76 = 2048;
    double v77 = v39;
    __int16 v78 = 2112;
    v79 = v57;
    __int16 v80 = 2112;
    v81 = v58;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@: Optimal Score %.4f at %@ (Valid Until: %@)", buf, 0x2Au);
  }
  id v9 = v62;
  v34 = v63;
LABEL_58:

  unsigned __int8 v5 = v60;
  id v4 = v61;
LABEL_59:

LABEL_60:
}

+ (void)initialize
{
  id v3 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
  v22[0] = v3;
  v23[0] = @"maintenanceBlocked";
  id v4 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
  v22[1] = v4;
  v23[1] = @"utilityBlocked";
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v6 = (void *)qword_1001C40C8;
  qword_1001C40C8 = v5;

  uint64_t v7 = objc_opt_new();
  v8 = (void *)qword_1001C40D0;
  qword_1001C40D0 = v7;

  id v9 = objc_opt_new();
  double v10 = (void *)qword_1001C40D0;
  v11 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
  [v10 setObject:v9 forKeyedSubscript:v11];

  v12 = objc_opt_new();
  v13 = (void *)qword_1001C40D0;
  v14 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
  [v13 setObject:v12 forKeyedSubscript:v14];

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.das.conditionscore.metricsqueue", 0);
  id v16 = (void *)qword_1001C40D8;
  qword_1001C40D8 = (uint64_t)v15;

  dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1001C40D8);
  uint64_t v18 = (void *)qword_1001C40E0;
  qword_1001C40E0 = (uint64_t)v17;

  dispatch_set_qos_class_fallback();
  double v19 = qword_1001C40E0;
  dispatch_time_t v20 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(v19, v20, 0xD18C2E2800uLL, 0x3B9ACA00uLL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100070478;
  v21[3] = &unk_1001753E0;
  v21[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_1001C40E0, v21);
  dispatch_activate((dispatch_object_t)qword_1001C40E0);
}

+ (void)reportBlockingAnalyticsAndReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1001C40D8);
  dispatch_source_t v17 = +[_DASPolicyManager allPoliciesForPlatform];
  id v3 = +[NSDate date];
  id v4 = [a1 getBucketForDate:v3 withBucketDuration:10800];

  uint64_t v5 = +[_DASTrialManager sharedInstanceForNamespace:@"COREOS_DAS"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)qword_1001C40D0;
  id v18 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v6;
        uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * v6);
        v8 = [(id)qword_1001C40C8 objectForKeyedSubscript:v7];
        id v9 = [(id)qword_1001C40D0 objectForKeyedSubscript:v7];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = v17;
        v11 = (char *)[v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              id v20 = v4;
              id v21 = v8;
              id v22 = v9;
              id v23 = v5;
              AnalyticsSendEventLazy();
            }
            v12 = (char *)[v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v12);
        }

        [v9 removeAllObjects];
        uint64_t v6 = v19 + 1;
      }
      while ((id)(v19 + 1) != v18);
      id v18 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v18);
  }
}

+ (id)getBucketForDate:(id)a3 withBucketDuration:(int)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSCalendar currentCalendar];
  uint64_t v7 = [v6 components:28 fromDate:v5];
  v8 = [v6 dateFromComponents:v7];
  [v5 timeIntervalSinceDate:v8];
  double v10 = v9;

  v11 = +[NSNumber numberWithDouble:floor(v10 / (double)a4)];

  return v11;
}

+ (id)getPriorityToBlockingPolicies
{
  return (id)qword_1001C40D0;
}

+ (id)getMetricsTimer
{
  return (id)qword_1001C40E0;
}

+ (double)scoreForActivity:(id)a3 withState:(id)a4 response:(int64_t *)a5
{
  id v6 = a3;
  id v64 = a4;
  double v59 = (void *)os_transaction_create();
  uint64_t v7 = +[_DASPolicyManager allPoliciesForPlatform];
  id v8 = v6;
  objc_sync_enter(v8);
  double v9 = v8;
  double v10 = [v8 policyResponseMetadata];
  v62 = [v10 objectForKeyedSubscript:];

  [v9 setPolicyResponseMetadata:0];
  [v9 setLastDenialValue:0];
  v11 = [v9 policyResponseMetadata];
  [v11 removeAllObjects];

  objc_sync_exit(v9);
  v63 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v69 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v7;
  id v68 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v78;
    int64_t v67 = 0;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (i = 0; i != v68; i = (char *)i + 1)
      {
        if (*(void *)v78 != v66) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v15 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        unsigned __int8 v17 = [v15 appliesToActivity:v9];
        [v15 weightForActivity:v9];
        double v19 = v18;
        if (v17)
        {
          id v21 = [v15 responseForActivity:v9 withState:v64];
          if ([v21 policyDecision] == (id)33 || objc_msgSend(v21, "policyDecision") == (id)100)
          {
            id v22 = qword_1001C40D8;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000712F4;
            block[3] = &unk_100175570;
            id v75 = v9;
            __int16 v76 = v15;
            dispatch_async(v22, block);
          }
          id v23 = [v21 policyDecision];
          int64_t v24 = v67;
          if (v67 <= (uint64_t)v23) {
            int64_t v24 = (int64_t)v23;
          }
          int64_t v67 = v24;
          long long v25 = [v15 policyName];
          long long v26 = +[_DASConditionScore getResponseStringForPolicy:v25 response:v21 appliesToActivity:1 weightForActivity:v19];

          if ([v21 policyDecision])
          {
            long long v27 = v69;
          }
          else
          {
            [v21 score];
            double v13 = v13 + v19 * v28;
            double v12 = v12 + v19;
            long long v27 = v63;
          }
          [v27 addObject:v26];
          [v21 score];
          if (v29 <= 0.0)
          {
            id v30 = v9;
            objc_sync_enter(v30);
            long long v31 = [v15 policyName];
            [v30 setLastDenialValue:((unint64_t)[v30 lastDenialValue] | +[_DASPolicyManager bitmaskForPolicy:](_DASPolicyManager, "bitmaskForPolicy:", v31));

            objc_sync_exit(v30);
          }
          id v32 = v9;
          objc_sync_enter(v32);
          id v33 = objc_alloc((Class)_DASInternalPolicyEvaluationMetadata);
          [v21 score];
          double v35 = v34;
          double v36 = [v21 rationale];
          id v37 = [v33 initWithScore:[v36 responseOptions] reason:[v21 policyDecision] decision:v35];
          v38 = [v32 policyResponseMetadata];
          double v39 = [v15 policyName];
          [v38 setObject:v37 forKeyedSubscript:v39];

          objc_sync_exit(v32);
        }
        else
        {
          id v21 = [v15 policyName];
          long long v26 = +[_DASConditionScore getResponseStringForPolicy:v21 response:0 appliesToActivity:0 weightForActivity:v19];
          [v69 addObject:v26];
        }
      }
      id v68 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
    }
    while (v68);
  }
  else
  {
    int64_t v67 = 0;
    double v12 = 0.0;
    double v13 = 0.0;
  }

  v40 = +[NSDate date];
  [v9 setLastScored:v40];

  if (a5) {
    *a5 = v67;
  }
  double v41 = 0.0;
  if (v67 != 100 && v67 != 33)
  {
    if (v67 || v12 == 0.0) {
      double v41 = 1.0;
    }
    else {
      double v41 = v13 / v12;
    }
  }
  id v42 = v9;
  objc_sync_enter(v42);
  id v43 = [v42 policyResponseMetadata];
  [v43 setObject:v62 forKeyedSubscript:@"scoreWhenRun"];

  objc_sync_exit(v42);
  if (v67)
  {
    id v44 = [v69 componentsJoinedByString:&stru_100179948];
    id v45 = [v44 UTF8String];

    double v46 = +[_DASDaemonLogger logForCategory:@"scoring"];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = +[_DASPolicyResponse abbreviatedDecision:v67];
      *(_DWORD *)buf = 138543874;
      id v82 = v42;
      __int16 v83 = 2082;
      id v84 = v45;
      __int16 v85 = 2114;
      double v86 = *(double *)&v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@:[\n%{public}s ], Decision: %{public}@}", buf, 0x20u);
    }
    goto LABEL_48;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v48 = v63;
  id v49 = [v48 countByEnumeratingWithState:&v70 objects:v93 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v71;
    do
    {
      for (j = 0; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(v48);
        }
        [v69 addObject:*(void *)(*((void *)&v70 + 1) + 8 * (void)j)];
      }
      id v49 = [v48 countByEnumeratingWithState:&v70 objects:v93 count:16];
    }
    while (v49);
  }

  id v52 = [v69 componentsJoinedByString:&stru_100179948];
  id v53 = [v52 UTF8String];

  if (v12 == 0.0)
  {
    double v55 = 0.0;
  }
  else
  {
    float v54 = v13 / v12;
    double v55 = v54;
    if (v54 != 0.0)
    {
      double v46 = +[_DASDaemonLogger logForCategory:@"scoring"];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v56 = +[_DASPolicyResponse abbreviatedDecision:0];
        *(_DWORD *)buf = 138544130;
        id v82 = v42;
        __int16 v83 = 2082;
        id v84 = v53;
        __int16 v85 = 2114;
        double v86 = *(double *)&v56;
        __int16 v87 = 2048;
        double v88 = v55;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@:[\n%{public}s ], Decision: %{public}@ Score: %f}", buf, 0x2Au);
      }
      goto LABEL_48;
    }
  }
  double v46 = +[_DASDaemonLogger logForCategory:@"scoring"];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v57 = +[_DASPolicyResponse abbreviatedDecision:0];
    *(_DWORD *)buf = 138544642;
    id v82 = v42;
    __int16 v83 = 2082;
    id v84 = v53;
    __int16 v85 = 2048;
    double v86 = v13;
    __int16 v87 = 2048;
    double v88 = v12;
    __int16 v89 = 2114;
    v90 = v57;
    __int16 v91 = 2048;
    double v92 = v55;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}@:[\n%{public}s ], sumScores:%lf denominator:%f Decision: %{public}@ Score: %f}", buf, 0x3Eu);
  }
LABEL_48:

  [v42 setLastComputedScore:v41];

  return v41;
}

+ (double)thresholdScoreForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 bypassesPredictions])
  {
    double v4 = 0.01;
  }
  else
  {
    int64_t v5 = +[_DASConditionScore getTimeSlotForActivity:v3];
    id v6 = [v3 schedulingPriority];
    [v3 predictedOptimalScore];
    +[_DASConditionScore getScoreForTimeSlot:activityPriority:activityScore:](_DASConditionScore, "getScoreForTimeSlot:activityPriority:activityScore:", v5, v6);
    double v4 = v7;
  }

  return v4;
}

+ (int64_t)getTimeSlotForActivity:(id)a3
{
  id v3 = a3;
  double v4 = [v3 predictedOptimalStartDate];
  int64_t v5 = [v3 startBefore];

  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  id v8 = +[NSDate date];
  [v8 timeIntervalSinceDate:v4];
  double v10 = v9;

  if (v7 >= 0.01) {
    uint64_t v11 = (uint64_t)(v10 / (v7 / 10.0) + 1.0);
  }
  else {
    uint64_t v11 = 10;
  }
  unint64_t v12 = v11 & ~(v11 >> 63);
  if (v12 >= 0xA) {
    int64_t v13 = 10;
  }
  else {
    int64_t v13 = v12;
  }

  return v13;
}

+ (double)getScoreForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4 activityScore:(double)a5
{
  +[_DASConditionScore relaxationFactorForTimeSlot:a3 activityPriority:a4];
  return v6 * a5;
}

+ (double)relaxationFactorForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4
{
  +[_DASConditionScore preOptimalRelaxationFactor:a4];
  double v7 = v6;
  if (a3)
  {
    if (_DASSchedulingPriorityUserInitiated <= a4)
    {
      double v8 = 100.0;
      double v9 = 1.0;
    }
    else if (_DASSchedulingPriorityUtility == a4)
    {
      double v8 = 110.0;
      double v9 = 1.35;
    }
    else if (_DASSchedulingPriorityDefault == a4)
    {
      double v8 = 105.0;
      double v9 = 1.2;
    }
    else if (_DASSchedulingPriorityBackground == a4)
    {
      double v9 = 1.5;
      double v8 = 120.0;
    }
    else
    {
      double v9 = 1.0;
      if (_DASSchedulingPriorityMaintenance == a4) {
        double v9 = 1.7;
      }
      double v8 = 100.0;
      if (_DASSchedulingPriorityMaintenance == a4) {
        double v8 = 130.0;
      }
    }
    return v7 * (1.0 - pow((double)(10 * a3) / v8, v9));
  }
  return v7;
}

+ (double)preOptimalRelaxationFactor:(unint64_t)a3
{
  double result = 0.75;
  if (_DASSchedulingPriorityUserInitiated > a3)
  {
    if (_DASSchedulingPriorityUtility == a3)
    {
      return 0.925;
    }
    else if (_DASSchedulingPriorityDefault == a3)
    {
      return 0.9;
    }
    else if (_DASSchedulingPriorityBackground == a3)
    {
      return 0.95;
    }
    else
    {
      double result = 0.975;
      if (_DASSchedulingPriorityMaintenance != a3) {
        return 0.75;
      }
    }
  }
  return result;
}

+ (id)lastDenialResponses:(id)a3
{
  id v3 = a3;
  if ([v3 lastDenialValue])
  {
    double v4 = +[NSMutableArray array];
    unint64_t v5 = (unint64_t)[v3 lastDenialValue];
    for (uint64_t i = 0; i != 64; ++i)
    {
      if (v5)
      {
        double v7 = +[_DASPolicyManager policyForBitIndex:i];
        if (v7) {
          [v4 addObject:v7];
        }
      }
      v5 >>= 1;
    }
  }
  else
  {
    double v4 = &__NSArray0__struct;
  }

  return v4;
}

+ (id)getResponseStringForPolicy:(id)a3 response:(id)a4 appliesToActivity:(BOOL)a5 weightForActivity:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v10 && ([v10 policyDecision] || (objc_msgSend(v11, "score"), v12 < 0.9)))
  {
    int64_t v13 = (__CFString *)objc_opt_new();
    [(__CFString *)v13 appendFormat:@"\t{name: %@, ", v9];
    if (a5)
    {
      v14 = [v11 description];
      [(__CFString *)v13 appendFormat:@"policyWeight: %2.3lf, response: %@}\n", *(void *)&a6, v14];
    }
    else
    {
      [(__CFString *)v13 appendString:@"response: N/A}\n"];
    }
  }
  else
  {
    int64_t v13 = &stru_100179948;
  }

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end