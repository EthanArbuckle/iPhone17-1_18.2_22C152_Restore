@interface _DASDataCollectionSUTask
+ (id)taskWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5;
- (BOOL)isEligibleNow;
- (NSDate)currentEligibilityWindowEnd;
- (NSDate)currentEligibilityWindowStart;
- (NSMutableSet)blockReasonsSoFar;
- (NSMutableSet)persistentBlockers;
- (OS_dispatch_source)timer;
- (OS_os_log)logger;
- (_DASActivity)activity;
- (_DASDataCollectionSUTask)initWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5;
- (double)interval;
- (int64_t)currentEligibilityState;
- (void)addExperimentInformationWithDictionary:(id)a3;
- (void)evaluateActivityOnTick;
- (void)evaluatePolicies;
- (void)handleTaskExpiration;
- (void)handleTaskExpirationNeverEligible;
- (void)markAsCompleted;
- (void)reportBlockersOnEvaluation:(id)a3;
- (void)reportBlockersStatisticsOnExpiration;
- (void)reportSuccessOnEvaluation;
- (void)reportTaskBecomingEligible;
- (void)reportTaskExpiration;
- (void)resetCurrentEligibilityWindow;
- (void)setActivity:(id)a3;
- (void)setBlockReasonsSoFar:(id)a3;
- (void)setCurrentEligibilityState:(int64_t)a3;
- (void)setCurrentEligibilityWindowEnd;
- (void)setCurrentEligibilityWindowEnd:(id)a3;
- (void)setCurrentEligibilityWindowStart;
- (void)setCurrentEligibilityWindowStart:(id)a3;
- (void)setInterval:(double)a3;
- (void)setLogger:(id)a3;
- (void)setPersistentBlockers:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASDataCollectionSUTask

- (_DASDataCollectionSUTask)initWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)_DASDataCollectionSUTask;
  id v10 = [(_DASDataCollectionSUTask *)&v32 init];
  if (v10)
  {
    uint64_t v11 = _DASSchedulingPriorityMaintenance;
    uint64_t v12 = _DASActivityDurationShort;
    v13 = +[NSDate date];
    v14 = +[NSDate date];
    v15 = [v14 dateByAddingTimeInterval:86400.0];
    uint64_t v16 = +[_DASActivity activityWithName:v8 priority:v11 duration:v12 startingAfter:v13 startingBefore:v15];
    v17 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v16;

    [*((id *)v10 + 3) setTriggersRestart:1];
    *((double *)v10 + 2) = a4;
    objc_storeStrong((id *)v10 + 9, a5);
    *((void *)v10 + 4) = 0;
    uint64_t v18 = +[NSMutableSet set];
    v19 = (void *)*((void *)v10 + 7);
    *((void *)v10 + 7) = v18;

    uint64_t v20 = +[NSMutableSet set];
    v21 = (void *)*((void *)v10 + 8);
    *((void *)v10 + 8) = v20;

    v22 = +[_DASDaemon sharedInstance];
    v23 = [v22 evaluationQueue];
    dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v23);
    v25 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v24;

    v26 = *((void *)v10 + 1);
    dispatch_time_t v27 = dispatch_walltime(0, (uint64_t)(*((double *)v10 + 2) * 1000000000.0));
    dispatch_source_set_timer(v26, v27, (unint64_t)(*((double *)v10 + 2) * 1000000000.0), 0x3B9ACA00uLL);
    v28 = *((void *)v10 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10009EBB4;
    handler[3] = &unk_1001754F8;
    id v31 = v10;
    dispatch_source_set_event_handler(v28, handler);
    dispatch_activate(*((dispatch_object_t *)v10 + 1));
  }
  return (_DASDataCollectionSUTask *)v10;
}

+ (id)taskWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithName:v9 intervalDuration:v8 withLogger:a4];

  return v10;
}

- (BOOL)isEligibleNow
{
  v3 = +[_DASDaemon sharedInstance];
  v4 = +[_DASSmartPowerNapMonitor sharedMonitorWithDaemon:v3];

  unsigned __int8 v5 = [v4 inSmartPowerNap];
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCB80(v5, logger);
  }

  return v5;
}

- (void)evaluateActivityOnTick
{
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCD34();
  }
  if (self->_currentEligibilityState == 1)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FCD00();
    }
    [(_DASDataCollectionSUTask *)self evaluatePolicies];
  }
  unsigned int v3 = [(_DASDataCollectionSUTask *)self isEligibleNow];
  int64_t currentEligibilityState = self->_currentEligibilityState;
  if (!currentEligibilityState && v3)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FCCCC();
    }
    [(_DASDataCollectionSUTask *)self reportTaskBecomingEligible];
    self->_int64_t currentEligibilityState = 1;
    [(_DASDataCollectionSUTask *)self setCurrentEligibilityWindowStart];
    [(_DASDataCollectionSUTask *)self evaluatePolicies];
    return;
  }
  if (currentEligibilityState == 1) {
    char v5 = v3;
  }
  else {
    char v5 = 1;
  }
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FCC98();
    }
    self->_int64_t currentEligibilityState = 3;
    [(_DASDataCollectionSUTask *)self setCurrentEligibilityWindowEnd];
    [(_DASDataCollectionSUTask *)self handleTaskExpiration];
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FCC64();
    }
    goto LABEL_34;
  }
  if (currentEligibilityState == 2) {
    char v6 = v3;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FCC30();
    }
LABEL_34:
    self->_int64_t currentEligibilityState = 0;
    [(_DASDataCollectionSUTask *)self resetCurrentEligibilityWindow];
    uint64_t v16 = +[NSDate date];
    [(_DASActivity *)self->_activity setStartAfter:v16];

    id v8 = [(_DASActivity *)self->_activity startAfter];
    v14 = [v8 dateByAddingTimeInterval:86400.0];
    [(_DASActivity *)self->_activity setStartBefore:v14];
    goto LABEL_35;
  }
  if (currentEligibilityState) {
    char v7 = 1;
  }
  else {
    char v7 = v3;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = +[NSDate date];
    id v9 = [(_DASActivity *)self->_activity startBefore];
    id v10 = [v9 earlierDate:v8];
    uint64_t v11 = [(_DASActivity *)self->_activity startBefore];
    unsigned int v12 = [v10 isEqualToDate:v11];

    if (!v12)
    {
LABEL_36:

      return;
    }
    [(_DASDataCollectionSUTask *)self handleTaskExpirationNeverEligible];
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000FCBFC();
    }
    v13 = +[NSDate date];
    [(_DASActivity *)self->_activity setStartAfter:v13];

    v14 = [(_DASActivity *)self->_activity startAfter];
    v15 = [v14 dateByAddingTimeInterval:86400.0];
    [(_DASActivity *)self->_activity setStartBefore:v15];

LABEL_35:
    goto LABEL_36;
  }
}

- (void)evaluatePolicies
{
  v2 = self;
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCD68();
  }
  id v31 = (void *)os_transaction_create();
  unsigned int v3 = +[_DASPolicyManager allPoliciesForPlatform];
  v4 = +[NSMutableSet set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      id v8 = 0;
      id v32 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v8);
        if ([v9 appliesToActivity:v2->_activity])
        {
          unsigned int v12 = v2;
          activity = v2->_activity;
          +[_DASDaemon sharedInstance];
          v15 = v14 = v4;
          uint64_t v16 = [v15 context];
          v17 = [v9 responseForActivity:activity withState:v16];

          v4 = v14;
          if ([v17 policyDecision] == (id)33 || objc_msgSend(v17, "policyDecision") == (id)100)
          {
            uint64_t v18 = [v9 policyName];
            [v14 addObject:v18];

            if (objc_opt_respondsToSelector())
            {
              v19 = [v9 blockReasons:v17];
              [v14 addObjectsFromArray:v19];
            }
          }

          v2 = v12;
          id v6 = v32;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }

  id v20 = [v4 count];
  logger = v2->_logger;
  BOOL v22 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      v23 = logger;
      id v24 = [v4 count];
      *(_DWORD *)buf = 134217984;
      id v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SUTelemetryTask: found %lu blockers.", buf, 0xCu);
    }
    [(_DASDataCollectionSUTask *)v2 reportBlockersOnEvaluation:v4];
    blockReasonsSoFar = v2->_blockReasonsSoFar;
    [v4 allObjects];
    dispatch_time_t v27 = v26 = v4;
    [(NSMutableSet *)blockReasonsSoFar addObjectsFromArray:v27];

    id v28 = [(NSMutableSet *)v2->_persistentBlockers count];
    persistentBlockers = v2->_persistentBlockers;
    if (v28) {
      [(NSMutableSet *)persistentBlockers intersectSet:v26];
    }
    else {
      [(NSMutableSet *)persistentBlockers unionSet:v26];
    }
    v4 = v26;
  }
  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, "SUTelemetryTask: no blocking policies.", buf, 2u);
    }
    [(_DASDataCollectionSUTask *)v2 markAsCompleted];
    [(_DASDataCollectionSUTask *)v2 reportSuccessOnEvaluation];
  }
}

- (void)markAsCompleted
{
  self->_int64_t currentEligibilityState = 2;
  [(_DASDataCollectionSUTask *)self setCurrentEligibilityWindowEnd];
  [(NSMutableSet *)self->_blockReasonsSoFar removeAllObjects];
  persistentBlockers = self->_persistentBlockers;

  [(NSMutableSet *)persistentBlockers removeAllObjects];
}

- (void)handleTaskExpiration
{
  [(_DASDataCollectionSUTask *)self reportTaskExpiration];
  [(_DASDataCollectionSUTask *)self reportBlockersStatisticsOnExpiration];
  [(NSMutableSet *)self->_blockReasonsSoFar removeAllObjects];
  persistentBlockers = self->_persistentBlockers;

  [(NSMutableSet *)persistentBlockers removeAllObjects];
}

- (void)setCurrentEligibilityWindowStart
{
  self->_currentEligibilityWindowStart = +[NSDate date];

  _objc_release_x1();
}

- (void)setCurrentEligibilityWindowEnd
{
  self->_currentEligibilityWindowEnd = +[NSDate date];

  _objc_release_x1();
}

- (void)resetCurrentEligibilityWindow
{
  currentEligibilityWindowStart = self->_currentEligibilityWindowStart;
  self->_currentEligibilityWindowStart = 0;

  currentEligibilityWindowEnd = self->_currentEligibilityWindowEnd;
  self->_currentEligibilityWindowEnd = 0;
}

- (void)addExperimentInformationWithDictionary:(id)a3
{
  id v8 = a3;
  unsigned int v3 = +[_DASTrialManager sharedInstance];
  v4 = [v3 experimentID];

  if (v4)
  {
    id v5 = [v3 experimentID];
    [v8 setObject:v5 forKeyedSubscript:@"ExperimentID"];

    id v6 = [v3 treatmentID];
    [v8 setObject:v6 forKeyedSubscript:@"TreatmentID"];

    uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deploymentID]);
    [v8 setObject:v7 forKeyedSubscript:@"DeploymentID"];
  }
}

- (void)handleTaskExpirationNeverEligible
{
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCD9C();
  }
  unsigned int v3 = +[NSMutableDictionary dictionary];
  [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v3];
  [v3 setObject:@"NeverEligible" forKeyedSubscript:@"Decision"];
  id v5 = v3;
  AnalyticsSendEventLazy();
  [v5 setObject:@"NeverEligible" forKeyedSubscript:@"BlockReason"];
  id v4 = v5;
  AnalyticsSendEventLazy();
  [(NSMutableSet *)self->_blockReasonsSoFar removeAllObjects];
  [(NSMutableSet *)self->_persistentBlockers removeAllObjects];
}

- (void)reportBlockersOnEvaluation:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCDD0(logger, v4);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = +[NSMutableDictionary dictionary];
        [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v11];
        [v11 setObject:v10 forKeyedSubscript:@"Decision"];
        id v12 = v11;
        AnalyticsSendEventLazy();
      }
      id v7 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)reportSuccessOnEvaluation
{
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCE5C();
  }
  unsigned int v3 = +[NSMutableDictionary dictionary];
  [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v3];
  [v3 setObject:@"Success" forKeyedSubscript:@"Decision"];
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    id v4 = +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:");
    [v4 duration];
    id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"WindowDuration"];
  }
  id v7 = v3;
  AnalyticsSendEventLazy();
  [v7 setObject:@"Success" forKeyedSubscript:@"BlockReason"];
  id v6 = v7;
  AnalyticsSendEventLazy();
}

- (void)reportTaskBecomingEligible
{
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCE90();
  }
  unsigned int v3 = +[NSMutableDictionary dictionary];
  [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v3];
  [v3 setObject:@"Eligible" forKeyedSubscript:@"Decision"];
  id v5 = v3;
  AnalyticsSendEventLazy();
  [v5 setObject:@"Eligible" forKeyedSubscript:@"BlockReason"];
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)reportTaskExpiration
{
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCEC4();
  }
  unsigned int v3 = +[NSMutableDictionary dictionary];
  [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v3];
  [v3 setObject:@"Expired" forKeyedSubscript:@"Decision"];
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    id v4 = +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:");
    [v4 duration];
    id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"WindowDuration"];
  }
  id v7 = v3;
  AnalyticsSendEventLazy();
  [v7 setObject:@"Expired" forKeyedSubscript:@"BlockReason"];
  id v6 = v7;
  AnalyticsSendEventLazy();
}

- (void)reportBlockersStatisticsOnExpiration
{
  uint64_t v22 = +[_DASTrialManager sharedInstance];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCF2C((uint64_t)self, logger);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_persistentBlockers;
  id v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  id v5 = &AnalyticsSendEvent_ptr;
  id v6 = &unk_100175A20;
  if (v4)
  {
    id v7 = v4;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [v5[394] dictionary:v22];
        [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v11];
        [v11 setObject:v10 forKeyedSubscript:@"BlockReason"];
        if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
        {
          +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:");
          id v12 = v5;
          long long v14 = v13 = v6;
          [v14 duration];
          long long v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setObject:v15 forKeyedSubscript:@"WindowDuration"];

          id v6 = v13;
          id v5 = v12;
        }
        v25 = v11;
        id v16 = v11;
        AnalyticsSendEventLazy();
      }
      id v7 = [(NSMutableSet *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000FCEF8();
  }
  long long v17 = [v5[394] dictionary:v22];
  [(_DASDataCollectionSUTask *)self addExperimentInformationWithDictionary:v17];
  uint64_t v18 = +[NSNumber numberWithUnsignedInteger:[(NSMutableSet *)self->_blockReasonsSoFar count]];
  [v17 setObject:v18 forKeyedSubscript:@"NumberOfBlockers"];

  [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Expired"];
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    v19 = +[_CDDateRange periodWithStart:end:](_CDDateRange, "periodWithStart:end:");
    [v19 duration];
    id v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v17 setObject:v20 forKeyedSubscript:@"WindowDuration"];
  }
  id v21 = v17;
  AnalyticsSendEventLazy();
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (int64_t)currentEligibilityState
{
  return self->_currentEligibilityState;
}

- (void)setCurrentEligibilityState:(int64_t)a3
{
  self->_int64_t currentEligibilityState = a3;
}

- (NSDate)currentEligibilityWindowStart
{
  return self->_currentEligibilityWindowStart;
}

- (void)setCurrentEligibilityWindowStart:(id)a3
{
}

- (NSDate)currentEligibilityWindowEnd
{
  return self->_currentEligibilityWindowEnd;
}

- (void)setCurrentEligibilityWindowEnd:(id)a3
{
}

- (NSMutableSet)blockReasonsSoFar
{
  return self->_blockReasonsSoFar;
}

- (void)setBlockReasonsSoFar:(id)a3
{
}

- (NSMutableSet)persistentBlockers
{
  return self->_persistentBlockers;
}

- (void)setPersistentBlockers:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_persistentBlockers, 0);
  objc_storeStrong((id *)&self->_blockReasonsSoFar, 0);
  objc_storeStrong((id *)&self->_currentEligibilityWindowEnd, 0);
  objc_storeStrong((id *)&self->_currentEligibilityWindowStart, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end