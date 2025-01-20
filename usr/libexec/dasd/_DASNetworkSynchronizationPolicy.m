@interface _DASNetworkSynchronizationPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)inPossibleSynchronizationWindow;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSIndexSet)affectedSeconds;
- (NSSet)spikeMinutes;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_source)timer;
- (_CDContext)context;
- (_DASNetworkSynchronizationPolicy)init;
- (double)lastUserInactivity;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)lastWakeDate;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (id)secondsFromSpikeMinutes:(id)a3 secondsBeforeSpike:(unint64_t)a4 secondsAfterSpike:(unint64_t)a5;
- (int)randomizationInterval;
- (int)recentActivityInterval;
- (int)recentWakeInterval;
- (unint64_t)secondsAfterSpike;
- (unint64_t)secondsBeforeSpike;
- (void)handleTimerFireAtDate:(id)a3 withContext:(id)a4;
- (void)postNotificationInWindow:(BOOL)a3;
- (void)setAffectedSeconds:(id)a3;
- (void)setContext:(id)a3;
- (void)setInPossibleSynchronizationWindow:(BOOL)a3;
- (void)setLastUserInactivity:(double)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setRandomizationInterval:(int)a3;
- (void)setRecentActivityInterval:(int)a3;
- (void)setRecentWakeInterval:(int)a3;
- (void)setSecondsAfterSpike:(unint64_t)a3;
- (void)setSecondsBeforeSpike:(unint64_t)a3;
- (void)setSpikeMinutes:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASNetworkSynchronizationPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_inPossibleSynchronizationWindow
    && [v4 requiresNetwork]
    && (id v6 = [v5 schedulingPriority], (unint64_t)v6 <= _DASSchedulingPriorityUtility))
  {
    v9 = [v5 startDate];
    if (v9 || +[_DASPhotosPolicy isiCPLActivity:v5])
    {
      BOOL v7 = 0;
    }
    else
    {
      v10 = [v5 fastPass];
      BOOL v7 = v10 == 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForInUseStatus];
  v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"Network Synchronization Policy";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186C58;
  v8[3] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (void)handleTimerFireAtDate:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSCalendar currentCalendar];
  v9 = [v8 components:192 fromDate:v6];
  id v10 = [v9 minute];
  v11 = (char *)[v9 second] + 60 * (void)v10;
  NSUInteger v12 = [(NSIndexSet *)self->_affectedSeconds indexGreaterThanOrEqualToIndex:v11];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 == (void)v11)
  {
    v18 = +[_DASDaemonLogger logForCategory:@"policy"];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000F5158((uint64_t)v11, v18);
    }

    v19 = +[_CDContextQueries keyPathForInUseStatus];
    v20 = [v7 objectForKeyedSubscript:v19];

    unsigned __int8 v21 = [v20 BOOLValue];
    v22 = +[_CDContextQueries keyPathForLastUseDate];
    v23 = [v7 objectForKeyedSubscript:v22];

    v24 = [(_DASNetworkSynchronizationPolicy *)self lastWakeDate];
    [v6 timeIntervalSinceDate:v24];
    double v26 = v25;
    [v6 timeIntervalSinceDate:v23];
    self->_lastUserInactivity = v27;
    if ((v21 & 1) == 0
      && v26 > 0.0
      && v26 < (double)self->_recentWakeInterval
      && v27 > (double)self->_recentActivityInterval)
    {
      if (!self->_inPossibleSynchronizationWindow) {
        [(_DASNetworkSynchronizationPolicy *)self postNotificationInWindow:1];
      }
      self->_inPossibleSynchronizationWindow = 1;
      v28 = +[_DASDaemonLogger logForCategory:@"policy"];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_1000F5114(v28);
      }
    }
    unint64_t v29 = self->_secondsAfterSpike + self->_secondsBeforeSpike;
    uint32_t v30 = arc4random_uniform(self->_randomizationInterval);
    timer = self->_timer;
    dispatch_time_t v32 = dispatch_walltime(0, 1000000000 * (v29 + v30));
    dispatch_source_set_timer(timer, v32, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
  else
  {
    v14 = (char *)v12;
    if (self->_inPossibleSynchronizationWindow) {
      [(_DASNetworkSynchronizationPolicy *)self postNotificationInWindow:0];
    }
    v15 = +[_DASDaemonLogger logForCategory:@"policy"];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000F51D0(v15);
    }

    self->_inPossibleSynchronizationWindow = 0;
    if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      v14 = (char *)[(NSIndexSet *)self->_affectedSeconds firstIndex] + 3600;
    }
    v16 = self->_timer;
    dispatch_time_t v17 = dispatch_walltime(0, 1000000000 * (v14 - v11));
    dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
}

- (id)secondsFromSpikeMinutes:(id)a3 secondsBeforeSpike:(unint64_t)a4 secondsAfterSpike:(unint64_t)a5
{
  id v7 = a3;
  v8 = +[NSMutableIndexSet indexSet];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v20 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = 60 * (void)[*(id *)(*((void *)&v21 + 1) + 8 * i) unsignedLongValue];
        if (a4)
        {
          unint64_t v13 = v12 + 3599;
          unint64_t v14 = a4;
          do
          {
            [v8 addIndex:v13 % 0xE10];
            --v13;
            --v14;
          }
          while (v14);
        }
        unint64_t v15 = 0;
        unint64_t v16 = v12;
        do
        {
          [v8 addIndex:v15 + v12 - 3600 * (v16 / 0xE10)];
          ++v15;
          ++v16;
        }
        while (v15 <= a5);
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v17 = [v8 copy];

  return v17;
}

- (_DASNetworkSynchronizationPolicy)init
{
  v22.receiver = self;
  v22.super_class = (Class)_DASNetworkSynchronizationPolicy;
  v2 = [(_DASNetworkSynchronizationPolicy *)&v22 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Network Synchronization Policy";

    uint64_t v5 = +[_CDClientContext userContext];
    context = v3->_context;
    v3->_context = (_CDContext *)v5;

    uint64_t v7 = [(_DASNetworkSynchronizationPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;

    uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100186C70, &off_100186C88, &off_100186CA0, &off_100186CB8, 0);
    spikeMinutes = v3->_spikeMinutes;
    v3->_spikeMinutes = (NSSet *)v9;

    *(_OWORD *)&v3->_secondsBeforeSpike = xmmword_100126990;
    uint64_t v11 = [(_DASNetworkSynchronizationPolicy *)v3 secondsFromSpikeMinutes:v3->_spikeMinutes secondsBeforeSpike:30 secondsAfterSpike:15];
    affectedSeconds = v3->_affectedSeconds;
    v3->_affectedSeconds = (NSIndexSet *)v11;

    v3->_recentActivityInterval = 300;
    *(void *)&v3->_randomizationInterval = 0xA000001C2;
    if ([(NSIndexSet *)v3->_affectedSeconds count])
    {
      unint64_t v13 = dispatch_get_global_queue(-2, 0);
      dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v13);
      timer = v3->_timer;
      v3->_timer = (OS_dispatch_source *)v14;

      unint64_t v16 = v3->_timer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10004995C;
      handler[3] = &unk_1001754F8;
      id v17 = v3;
      long long v21 = v17;
      dispatch_source_set_event_handler(v16, handler);
      v18 = +[NSDate now];
      [(_DASNetworkSynchronizationPolicy *)v17 handleTimerFireAtDate:v18 withContext:v3->_context];

      dispatch_activate((dispatch_object_t)v3->_timer);
    }
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3D28 != -1) {
    dispatch_once(&qword_1001C3D28, &stru_100176168);
  }
  v2 = (void *)qword_1001C3D30;

  return v2;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.00001;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"Network Synchronization Policy"])
  {
    if (+[_DASDeviceActivityPolicy isDeviceInUse:v6]
      && self->_inPossibleSynchronizationWindow)
    {
      BOOL v7 = 0;
      self->_inPossibleSynchronizationWindow = 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)lastWakeDate
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  size_t v5 = 16;
  sysctlbyname("kern.waketime", &v6, &v5, 0, 0);
  v2 = +[NSDate dateWithTimeIntervalSince1970:(double)v7 / 1000000000.0 + (double)v6];
  v3 = +[_DASDaemonLogger logForCategory:@"policy"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Last wake date: %@", buf, 0xCu);
  }

  return v2;
}

- (void)postNotificationInWindow:(BOOL)a3
{
  id v4 = dispatch_get_global_queue(-2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049C98;
  block[3] = &unk_100176188;
  BOOL v6 = a3;
  dispatch_async(v4, block);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  size_t v5 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  if (self->_inPossibleSynchronizationWindow && _os_feature_enabled_impl())
  {
    [(_DASPolicyResponseRationale *)v5 addRationaleForCondition:@"lastUserActivity" withRequiredValue:(double)self->_recentActivityInterval withCurrentValue:self->_lastUserInactivity];
    uint64_t v6 = 33;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = +[_DASPolicyResponse policyResponseWithDecision:v6 validityDuration:v5 rationale:(double)0x384uLL];

  return v7;
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

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)inPossibleSynchronizationWindow
{
  return self->_inPossibleSynchronizationWindow;
}

- (void)setInPossibleSynchronizationWindow:(BOOL)a3
{
  self->_inPossibleSynchronizationWindow = a3;
}

- (double)lastUserInactivity
{
  return self->_lastUserInactivity;
}

- (void)setLastUserInactivity:(double)a3
{
  self->_lastUserInactivity = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSIndexSet)affectedSeconds
{
  return self->_affectedSeconds;
}

- (void)setAffectedSeconds:(id)a3
{
}

- (NSSet)spikeMinutes
{
  return self->_spikeMinutes;
}

- (void)setSpikeMinutes:(id)a3
{
}

- (unint64_t)secondsBeforeSpike
{
  return self->_secondsBeforeSpike;
}

- (void)setSecondsBeforeSpike:(unint64_t)a3
{
  self->_secondsBeforeSpike = a3;
}

- (unint64_t)secondsAfterSpike
{
  return self->_secondsAfterSpike;
}

- (void)setSecondsAfterSpike:(unint64_t)a3
{
  self->_secondsAfterSpike = a3;
}

- (int)randomizationInterval
{
  return self->_randomizationInterval;
}

- (void)setRandomizationInterval:(int)a3
{
  self->_randomizationInterval = a3;
}

- (int)recentWakeInterval
{
  return self->_recentWakeInterval;
}

- (void)setRecentWakeInterval:(int)a3
{
  self->_recentWakeInterval = a3;
}

- (int)recentActivityInterval
{
  return self->_recentActivityInterval;
}

- (void)setRecentActivityInterval:(int)a3
{
  self->_recentActivityInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spikeMinutes, 0);
  objc_storeStrong((id *)&self->_affectedSeconds, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end