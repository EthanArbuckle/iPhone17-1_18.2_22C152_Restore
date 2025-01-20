@interface _DASPolicyDataCollection
+ (id)sharedInstance;
- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5;
- (BOOL)shouldReportBlockingReasonsForActivity:(id)a3;
- (NSDate)lastEval;
- (NSMutableDictionary)priorityToIntensiveBlockingPolicies;
- (NSMutableDictionary)taskToBlockingPolicies;
- (NSUserDefaults)policyDataCollectionDefaults;
- (OS_dispatch_source)policyDataCollectionTimer;
- (_DASPolicyDataCollection)init;
- (id)dictForCAWithBitmap:(unint64_t)a3 policyName:(id)a4 priority:(id)a5;
- (unint64_t)timeInMinutesSinceLastEvaluation;
- (void)evaluateAndReportBlockingReasonsForAllCriteria;
- (void)noteEvaluationTime;
- (void)reportBlockingReason:(unint64_t)a3 forActivity:(id)a4;
- (void)reportPolicyBlockingReasonsForIntensiveTasksToPPS;
- (void)reportPolicyBlockingReasonsForSpecificTasksToPPS;
- (void)scheduleTelemetry;
- (void)setCriteriaForActivity:(id)a3 withCriteriaIndex:(int64_t)a4;
- (void)setLastEval:(id)a3;
- (void)setPolicyDataCollectionDefaults:(id)a3;
- (void)setPolicyDataCollectionTimer:(id)a3;
- (void)setPriorityToIntensiveBlockingPolicies:(id)a3;
- (void)setTaskToBlockingPolicies:(id)a3;
@end

@implementation _DASPolicyDataCollection

+ (id)sharedInstance
{
  if (qword_1001C3B10 != -1) {
    dispatch_once(&qword_1001C3B10, &stru_100175798);
  }
  v2 = (void *)qword_1001C3B08;

  return v2;
}

- (_DASPolicyDataCollection)init
{
  v27.receiver = self;
  v27.super_class = (Class)_DASPolicyDataCollection;
  v2 = [(_DASPolicyDataCollection *)&v27 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler.policydatacollection"];
    policyDataCollectionDefaults = v2->_policyDataCollectionDefaults;
    v2->_policyDataCollectionDefaults = v3;

    uint64_t v5 = [(NSUserDefaults *)v2->_policyDataCollectionDefaults objectForKey:@"LastEvaluationDate"];
    lastEval = v2->_lastEval;
    v2->_lastEval = (NSDate *)v5;

    uint64_t v7 = objc_opt_new();
    priorityToIntensiveBlockingPolicies = v2->_priorityToIntensiveBlockingPolicies;
    v2->_priorityToIntensiveBlockingPolicies = (NSMutableDictionary *)v7;

    v9 = v2->_priorityToIntensiveBlockingPolicies;
    v10 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
    [(NSMutableDictionary *)v9 setObject:&off_100186AF0 forKeyedSubscript:v10];

    v11 = v2->_priorityToIntensiveBlockingPolicies;
    v12 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
    [(NSMutableDictionary *)v11 setObject:&off_100186AF0 forKeyedSubscript:v12];

    uint64_t v13 = +[NSSet setWithArray:&off_100187A20];
    v14 = (void *)qword_1001C3B18;
    qword_1001C3B18 = v13;

    uint64_t v15 = objc_opt_new();
    taskToBlockingPolicies = v2->_taskToBlockingPolicies;
    v2->_taskToBlockingPolicies = (NSMutableDictionary *)v15;

    v17 = +[NSDate date];
    v18 = v17;
    if (!v2->_lastEval || (objc_msgSend(v17, "timeIntervalSinceDate:"), v19 > 1800.0))
    {
      uint64_t v20 = +[NSDate dateWithTimeInterval:v18 sinceDate:-900.0];
      v21 = v2->_lastEval;
      v2->_lastEval = (NSDate *)v20;
    }
    v22 = +[_DASDaemon sharedInstance];
    v23 = [v22 evaluationQueue];
    dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
    policyDataCollectionTimer = v2->_policyDataCollectionTimer;
    v2->_policyDataCollectionTimer = (OS_dispatch_source *)v24;
  }
  return v2;
}

- (void)scheduleTelemetry
{
  policyDataCollectionTimer = self->_policyDataCollectionTimer;
  dispatch_time_t v4 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(policyDataCollectionTimer, v4, 0xD18C2E2800uLL, 0x3B9ACA00uLL);
  uint64_t v5 = self->_policyDataCollectionTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100022C34;
  handler[3] = &unk_1001754F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate((dispatch_object_t)self->_policyDataCollectionTimer);
}

- (void)evaluateAndReportBlockingReasonsForAllCriteria
{
  v2 = +[_DASPolicyManager allPoliciesForPlatform];
  v3 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
  v122[0] = v3;
  dispatch_time_t v4 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
  v122[1] = v4;
  v56 = +[NSArray arrayWithObjects:v122 count:2];

  uint64_t v5 = objc_opt_new();
  v6 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
  [v5 setObject:&off_100186AF0 forKey:v6];

  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
  v61 = v5;
  [v5 setObject:&off_100186AF0 forKey:v7];

  v53 = objc_opt_new();
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obj = v2;
  id v57 = [obj countByEnumeratingWithState:&v114 objects:v121 count:16];
  if (!v57)
  {
    uint64_t v65 = 0;
    goto LABEL_36;
  }
  uint64_t v65 = 0;
  uint64_t v55 = *(void *)v115;
  do
  {
    for (id i = 0; i != v57; id i = v30 + 1)
    {
      if (*(void *)v115 != v55) {
        objc_enumerationMutation(obj);
      }
      v59 = (char *)i;
      v9 = *(void **)(*((void *)&v114 + 1) + 8 * i);
      v10 = objc_opt_new();
      v11 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v11);
      [v58 stringByReplacingOccurrencesOfString:@"_DAS" withString:&stru_100179948];
      v62 = v64 = v10;
      [v10 setObject:forKeyedSubscript:];
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v12 = v56;
      v69 = (char *)[v12 countByEnumeratingWithState:&v110 objects:v120 count:16];
      if (!v69)
      {

LABEL_31:
        v31 = v58;
        v30 = v59;
        goto LABEL_32;
      }
      char v60 = 0;
      char v63 = 0;
      uint64_t v66 = 0;
      uint64_t v67 = *(void *)v111;
      v68 = v12;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v111 != v67) {
            objc_enumerationMutation(v12);
          }
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          v71 = v13;
          v16 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v13);
          do
          {
            id v18 = [v16 unsignedLongValue];
            uint64_t v19 = _DASActivityDurationShort;
            uint64_t v20 = +[NSDate now];
            v21 = +[NSDate now];
            v22 = +[_DASActivity activityWithName:@"com.apple.dasd.PolicyDataCollectionActivity" priority:v18 duration:v19 startingAfter:v20 startingBefore:v21];

            [(_DASPolicyDataCollection *)self setCriteriaForActivity:v22 withCriteriaIndex:v15];
            if ([v9 appliesToActivity:v22])
            {
              v23 = +[_DASDaemon sharedInstance];
              dispatch_source_t v24 = [v23 context];
              v25 = [v9 responseForActivity:v22 withState:v24];

              if ([v25 policyDecision] == (id)33 || objc_msgSend(v25, "policyDecision") == (id)100)
              {
                if (!v15)
                {

                  uint64_t v14 = 0x1FFFLL;
                  goto LABEL_22;
                }
                v14 |= (1 << v15);
              }
            }
            ++v15;
          }
          while (v15 != 13);
          if (!v14) {
            goto LABEL_25;
          }
LABEL_22:
          v26 = +[NSNumber numberWithUnsignedLongLong:v14];
          [v64 setObject:v26 forKey:v16];

          uint64_t v27 = v14 & 0x11B7;
          if ((v14 & 0x11B7) != 0)
          {
            v66 |= v27;
            v28 = [v61 objectForKeyedSubscript:v16];
            v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v28 unsignedLongValue] | v27);
            [v61 setObject:v29 forKeyedSubscript:v16];

            v65 |= v27;
            v102 = _NSConcreteStackBlock;
            uint64_t v103 = 3221225472;
            v104 = sub_10002367C;
            v105 = &unk_1001757C0;
            v106 = self;
            uint64_t v109 = v14 & 0x11B7;
            id v107 = v62;
            v108 = v16;
            AnalyticsSendEventLazy();

            char v60 = 1;
          }
          char v63 = 1;
LABEL_25:
          id v12 = v68;
          uint64_t v13 = v71 + 1;
        }
        while (v71 + 1 != v69);
        v69 = (char *)[v68 countByEnumeratingWithState:&v110 objects:v120 count:16];
      }
      while (v69);

      if ((v63 & 1) == 0) {
        goto LABEL_31;
      }
      [v53 addObject:v64];
      v31 = v58;
      v30 = v59;
      if (v60)
      {
        v95 = _NSConcreteStackBlock;
        uint64_t v96 = 3221225472;
        v97 = sub_10002368C;
        v98 = &unk_1001757E8;
        v99 = self;
        uint64_t v101 = v66;
        id v100 = v62;
        AnalyticsSendEventLazy();
      }
LABEL_32:
    }
    id v57 = [obj countByEnumeratingWithState:&v114 objects:v121 count:16];
  }
  while (v57);
LABEL_36:

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v32 = v56;
  id v33 = [v32 countByEnumeratingWithState:&v91 objects:v119 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v92;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v92 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v91 + 1) + 8 * (void)j);
        v38 = [v61 objectForKeyedSubscript:v37];
        id v39 = [v38 unsignedLongValue];

        if (v39)
        {
          v84 = _NSConcreteStackBlock;
          uint64_t v85 = 3221225472;
          v86 = sub_1000236A0;
          v87 = &unk_1001757E8;
          uint64_t v89 = v37;
          id v90 = v39;
          v88 = self;
          AnalyticsSendEventLazy();
        }
      }
      id v34 = [v32 countByEnumeratingWithState:&v91 objects:v119 count:16];
    }
    while (v34);
  }

  if (v65)
  {
    v78 = _NSConcreteStackBlock;
    uint64_t v79 = 3221225472;
    v80 = sub_1000236B4;
    v81 = &unk_100175810;
    v82 = self;
    uint64_t v83 = v65;
    AnalyticsSendEventLazy();
  }
  v70 = v32;
  v40 = +[_DASDaemonLogger logForCategory:@"powerlog"];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    sub_1000F3630((uint64_t)v53, v40);
  }

  +[NSDictionary dictionaryWithObject:v53 forKey:@"Evaluations"];
  PLLogRegisteredEvent();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v72 = v53;
  id v41 = [v72 countByEnumeratingWithState:&v74 objects:v118 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v75;
    do
    {
      for (k = 0; k != v42; k = (char *)k + 1)
      {
        if (*(void *)v75 != v43) {
          objc_enumerationMutation(v72);
        }
        v45 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
        v46 = +[NSMutableDictionary dictionary];
        v47 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
        v48 = [v45 objectForKeyedSubscript:v47];
        [v46 setObject:v48 forKeyedSubscript:@"Maintenance"];

        v49 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
        v50 = [v45 objectForKeyedSubscript:v49];
        [v46 setObject:v50 forKeyedSubscript:@"Utility"];

        v51 = [v45 objectForKeyedSubscript:@"Policy"];
        [v46 setObject:v51 forKeyedSubscript:@"Policy"];

        v52 = +[_DASPPSDataManager sharedInstance];
        [v52 sendDataToPPS:v46 subsystem:@"BackgroundProcessing" category:@"DASPoliciesBlockingCriteria"];
      }
      id v42 = [v72 countByEnumeratingWithState:&v74 objects:v118 count:16];
    }
    while (v42);
  }

  [(_DASPolicyDataCollection *)self noteEvaluationTime];
}

- (id)dictForCAWithBitmap:(unint64_t)a3 policyName:(id)a4 priority:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = v10;
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"PolicyName"];
  }
  if (v9)
  {
    id v12 = +[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", [v9 unsignedIntValue]);
    [v11 setObject:v12 forKeyedSubscript:@"Priority"];
  }
  if (a3)
  {
    uint64_t v13 = +[NSNumber numberWithInt:a3 & 1];
    [v11 setObject:v13 forKeyedSubscript:@"NoCriteria"];

    uint64_t v14 = +[NSNumber numberWithInt:(a3 >> 1) & 1];
    [v11 setObject:v14 forKeyedSubscript:@"RequiresPlugin"];

    uint64_t v15 = +[NSNumber numberWithInt:(a3 >> 2) & 1];
    [v11 setObject:v15 forKeyedSubscript:@"RequiresNetwork"];

    v16 = +[NSNumber numberWithInt:(a3 >> 4) & 1];
    [v11 setObject:v16 forKeyedSubscript:@"RequiresDeviceInactivity"];

    v17 = +[NSNumber numberWithInt:(a3 >> 5) & 1];
    [v11 setObject:v17 forKeyedSubscript:@"RequiresSignificantUserInactivity"];

    id v18 = +[NSNumber numberWithInt:(a3 >> 7) & 1];
    [v11 setObject:v18 forKeyedSubscript:@"IsIntensive"];

    uint64_t v19 = +[NSNumber numberWithInt:(a3 >> 8) & 1];
    [v11 setObject:v19 forKeyedSubscript:@"RequiresFileProtectionComplete"];

    uint64_t v20 = +[NSNumber numberWithInt:(a3 >> 12) & 1];
    [v11 setObject:v20 forKeyedSubscript:@"RequiresWidgetBudget"];
  }
  v21 = +[_DASTrialManager sharedInstanceForNamespace:@"COREOS_DAS"];
  v22 = [v21 experimentID];

  if (v22)
  {
    v23 = [v21 experimentID];
    [v11 setObject:v23 forKeyedSubscript:@"trialExperimentId"];

    dispatch_source_t v24 = [v21 treatmentID];
    [v11 setObject:v24 forKeyedSubscript:@"trialTreatmentId"];

    v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v21 deploymentID]);
    v26 = [v25 stringValue];
    [v11 setObject:v26 forKeyedSubscript:@"trialDeploymentId"];
  }
  uint64_t v27 = +[NSNumber numberWithUnsignedInteger:[(_DASPolicyDataCollection *)self timeInMinutesSinceLastEvaluation]];
  [v11 setObject:v27 forKeyedSubscript:@"DurationMinutes"];

  return v11;
}

- (void)setCriteriaForActivity:(id)a3 withCriteriaIndex:(int64_t)a4
{
  id v5 = a3;
  id v8 = v5;
  switch(a4)
  {
    case 1:
      [v5 setRequiresPlugin:1];
      goto LABEL_15;
    case 2:
      [v5 setRequiresNetwork:1];
      goto LABEL_15;
    case 3:
      [v5 setRequiresInexpensiveNetworking:1];
      goto LABEL_15;
    case 4:
      [v5 setRequiresDeviceInactivity:1];
      goto LABEL_15;
    case 5:
      [v5 setRequiresSignificantUserInactivity:1];
      goto LABEL_15;
    case 6:
      [v5 setTriggersRestart:1];
      goto LABEL_15;
    case 7:
      [v5 setCpuIntensive:1];
      [v8 setMemoryIntensive:1];
      [v8 setDiskIntensive:1];
      [v8 setAneIntensive:1];
      [v8 setGpuIntensive:1];
      goto LABEL_15;
    case 8:
      uint64_t v6 = +[_DASFileProtection complete];
      goto LABEL_11;
    case 9:
      uint64_t v6 = +[_DASFileProtection completeUnlessOpen];
LABEL_11:
      uint64_t v7 = (void *)v6;
      [v8 setFileProtection:v6];

      goto LABEL_15;
    case 10:
      [v5 setBudgeted:1];
      goto LABEL_15;
    case 11:
      [v5 setDataBudgeted:1];
      goto LABEL_15;
    case 12:
      [v5 setRemoteDevice:@"test"];
      [v8 setWidgetID:@"widgetID"];
LABEL_15:
      id v5 = v8;
      break;
    default:
      break;
  }
}

- (unint64_t)timeInMinutesSinceLastEvaluation
{
  v3 = +[NSDate date];
  dispatch_time_t v4 = v3;
  if (!self->_lastEval || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > 1800.0))
  {
    uint64_t v6 = +[NSDate dateWithTimeInterval:v4 sinceDate:-900.0];
    lastEval = self->_lastEval;
    self->_lastEval = v6;
  }
  [v4 timeIntervalSinceDate:self->_lastEval];
  unint64_t v9 = (unint64_t)((double)(unint64_t)v8 / 60.0);

  return v9;
}

- (void)noteEvaluationTime
{
  v3 = +[NSDate date];
  lastEval = self->_lastEval;
  self->_lastEval = v3;

  policyDataCollectionDefaults = self->_policyDataCollectionDefaults;
  uint64_t v6 = self->_lastEval;

  [(NSUserDefaults *)policyDataCollectionDefaults setObject:v6 forKey:@"LastEvaluationDate"];
}

- (BOOL)shouldReportBlockingReasonsForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 isIntensive])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    double v5 = [v3 fastPass];
    if (v5)
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      uint64_t v6 = (void *)qword_1001C3B18;
      uint64_t v7 = [v3 name];
      unsigned __int8 v4 = [v6 containsObject:v7];
    }
  }

  return v4;
}

- (void)reportBlockingReason:(unint64_t)a3 forActivity:(id)a4
{
  id v27 = a4;
  if ([v27 isIntensive])
  {
    priorityToIntensiveBlockingPolicies = self->_priorityToIntensiveBlockingPolicies;
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 schedulingPriority]);
    double v8 = [(NSMutableDictionary *)priorityToIntensiveBlockingPolicies objectForKeyedSubscript:v7];
    unint64_t v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v8 unsignedLongLongValue] | a3);
    id v10 = self->_priorityToIntensiveBlockingPolicies;
    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 schedulingPriority]);
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
  }
  id v12 = [v27 fastPass];
  if (v12)
  {

    uint64_t v13 = v27;
  }
  else
  {
    uint64_t v14 = (void *)qword_1001C3B18;
    uint64_t v15 = [v27 name];
    LODWORD(v14) = [v14 containsObject:v15];

    uint64_t v13 = v27;
    if (!v14) {
      goto LABEL_9;
    }
  }
  taskToBlockingPolicies = self->_taskToBlockingPolicies;
  v17 = [v13 name];
  id v18 = [(NSMutableDictionary *)taskToBlockingPolicies objectForKey:v17];

  if (!v18)
  {
    uint64_t v19 = self->_taskToBlockingPolicies;
    uint64_t v20 = [v27 name];
    [(NSMutableDictionary *)v19 setObject:&off_100186AF0 forKeyedSubscript:v20];
  }
  v21 = self->_taskToBlockingPolicies;
  v22 = [v27 name];
  v23 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];
  dispatch_source_t v24 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v23 unsignedLongLongValue] | a3);
  v25 = self->_taskToBlockingPolicies;
  v26 = [v27 name];
  [(NSMutableDictionary *)v25 setObject:v24 forKeyedSubscript:v26];

  uint64_t v13 = v27;
LABEL_9:
}

- (void)reportPolicyBlockingReasonsForIntensiveTasksToPPS
{
  id v3 = objc_opt_new();
  unsigned __int8 v4 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityMaintenance];
  v30[0] = v4;
  double v5 = +[NSNumber numberWithUnsignedInteger:_DASSchedulingPriorityUtility];
  v30[1] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v30 count:2];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (id i = 0; i != v9; id i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_priorityToIntensiveBlockingPolicies objectForKeyedSubscript:v12];
        uint64_t v14 = +[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", [v12 unsignedIntValue]);
        [v3 setObject:v13 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  [(_DASPolicyDataCollection *)self sendDataToPPS:v3 subsystem:@"BackgroundProcessing" category:@"IntensiveTasksBlockingPolicies"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_priorityToIntensiveBlockingPolicies, "setObject:forKeyedSubscript:", &off_100186AF0, *(void *)(*((void *)&v20 + 1) + 8 * (void)j), (void)v20);
      }
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)reportPolicyBlockingReasonsForSpecificTasksToPPS
{
  id v3 = [(NSMutableDictionary *)self->_taskToBlockingPolicies allKeys];
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v11 = v3;
    id obj = v3;
    id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
          id v9 = objc_opt_new();
          [v9 setObject:v8 forKeyedSubscript:@"TaskName"];
          uint64_t v10 = [(NSMutableDictionary *)self->_taskToBlockingPolicies objectForKeyedSubscript:v8];
          [v9 setObject:v10 forKeyedSubscript:@"BlockingPolicies"];

          [(_DASPolicyDataCollection *)self sendDataToPPS:v9 subsystem:@"BackgroundProcessing" category:@"TaskBlockingPolicies"];
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    [(NSMutableDictionary *)self->_taskToBlockingPolicies removeAllObjects];
    id v3 = v11;
  }
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[_DASPPSDataManager sharedInstance];
  unsigned __int8 v11 = [v10 sendDataToPPS:v9 subsystem:v8 category:v7];

  return v11;
}

- (OS_dispatch_source)policyDataCollectionTimer
{
  return self->_policyDataCollectionTimer;
}

- (void)setPolicyDataCollectionTimer:(id)a3
{
}

- (NSUserDefaults)policyDataCollectionDefaults
{
  return self->_policyDataCollectionDefaults;
}

- (void)setPolicyDataCollectionDefaults:(id)a3
{
}

- (NSDate)lastEval
{
  return self->_lastEval;
}

- (void)setLastEval:(id)a3
{
}

- (NSMutableDictionary)priorityToIntensiveBlockingPolicies
{
  return self->_priorityToIntensiveBlockingPolicies;
}

- (void)setPriorityToIntensiveBlockingPolicies:(id)a3
{
}

- (NSMutableDictionary)taskToBlockingPolicies
{
  return self->_taskToBlockingPolicies;
}

- (void)setTaskToBlockingPolicies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToBlockingPolicies, 0);
  objc_storeStrong((id *)&self->_priorityToIntensiveBlockingPolicies, 0);
  objc_storeStrong((id *)&self->_lastEval, 0);
  objc_storeStrong((id *)&self->_policyDataCollectionDefaults, 0);

  objc_storeStrong((id *)&self->_policyDataCollectionTimer, 0);
}

@end