@interface _DASCustomSystemConstraintsPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)heavyDiskUsage;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSMutableDictionary)workloadDates;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)resetTimer;
- (_DASCustomSystemConstraintsPolicy)init;
- (_DASDaemon)daemon;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)gpWorkloadCounts;
- (void)armResetTimer;
- (void)cancelResetTimer;
- (void)reevaluateAllActivitiesWithDaemon:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setGpWorkloadCounts:(int64_t)a3;
- (void)setHeavyDiskUsage:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResetTimer:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWorkloadDates:(id)a3;
- (void)updateHeavyDiskUsage:(BOOL)a3;
- (void)updateSystemConstraint:(id)a3 withState:(BOOL)a4 withDaemon:(id)a5;
@end

@implementation _DASCustomSystemConstraintsPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 0.1;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  CFStringRef v5 = @"identifier";
  CFStringRef v6 = @"com.apple.duetactivityscheduler.customsystemconstraint";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v7 = v2;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];

  return v3;
}

- (_DASCustomSystemConstraintsPolicy)init
{
  v14.receiver = self;
  v14.super_class = (Class)_DASCustomSystemConstraintsPolicy;
  v2 = [(_DASCustomSystemConstraintsPolicy *)&v14 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Custom System Constraints Policy";

    v3->_heavyDiskUsage = 0;
    uint64_t v5 = +[NSMutableDictionary dictionary];
    workloadDates = v3->_workloadDates;
    v3->_workloadDates = (NSMutableDictionary *)v5;

    resetTimer = v3->_resetTimer;
    v3->_gpWorkloadCounts = 0;
    v3->_resetTimer = 0;

    uint64_t v8 = [(_DASCustomSystemConstraintsPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.dasd.sysConstraint", v10);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v11;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DC738;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4440 != -1) {
    dispatch_once(&qword_1001C4440, block);
  }
  v2 = (void *)qword_1001C4448;

  return v2;
}

- (void)reevaluateAllActivitiesWithDaemon:(id)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_workloadDates objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];
  if (v5)
  {

LABEL_4:
    int v7 = 0;
    goto LABEL_5;
  }
  CFStringRef v6 = [(NSMutableDictionary *)self->_workloadDates objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];

  if (v6) {
    goto LABEL_4;
  }
  v13 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Reevaluate to unblock activities from system constraint policy!", v14, 2u);
  }

  int v7 = 1;
LABEL_5:
  uint64_t v8 = [(NSMutableDictionary *)self->_workloadDates objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
  if (v8)
  {
  }
  else
  {
    v9 = [(NSMutableDictionary *)self->_workloadDates objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

    if (!v9)
    {
      if (!v7) {
        return;
      }
      goto LABEL_11;
    }
  }
  v10 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reevaluate to block activities from system constraint policy!", v14, 2u);
  }

LABEL_11:
  if (a3)
  {
    daemon = self->_daemon;
    CFStringRef v15 = @"com.apple.duetactivityscheduler.customsystemconstraint";
    v12 = +[NSArray arrayWithObjects:&v15 count:1];
    [(_DASDaemon *)daemon handleTriggersBatched:v12];
  }
  else
  {
    v12 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100100594(v12);
    }
  }
}

- (void)armResetTimer
{
  if (!self->_resetTimer)
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    resetTimer = self->_resetTimer;
    self->_resetTimer = v3;

    uint64_t v5 = self->_resetTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000DCB0C;
    handler[3] = &unk_1001754F8;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    CFStringRef v6 = self->_resetTimer;
    dispatch_time_t v7 = dispatch_walltime(0, 300000000000);
    dispatch_source_set_timer(v6, v7, 0x45D964B800uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)self->_resetTimer);
    uint64_t v8 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v11 = &off_100187438;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Armed timer to fire in %@", buf, 0xCu);
    }
  }
}

- (void)cancelResetTimer
{
  id v3 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001005D8(v3);
  }

  resetTimer = self->_resetTimer;
  if (resetTimer && !dispatch_source_testcancel(resetTimer))
  {
    uint64_t v5 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled timer", v7, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_resetTimer);
    CFStringRef v6 = self->_resetTimer;
    self->_resetTimer = 0;
  }
}

- (void)updateHeavyDiskUsage:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting _heavyDiskUsage = %d", buf, 8u);
  }

  self->_heavyDiskUsage = v3;
  if (v3)
  {
    dispatch_time_t v6 = dispatch_time(0, 15000000000);
    dispatch_time_t v7 = dispatch_get_global_queue(9, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DD060;
    block[3] = &unk_1001754F8;
    block[4] = self;
    dispatch_after(v6, v7, block);
  }
}

- (void)updateSystemConstraint:(id)a3 withState:(BOOL)a4 withDaemon:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = [v8 UTF8String];
    __int16 v29 = 1024;
    BOOL v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting %s running state = %d", buf, 0x12u);
  }

  dispatch_queue_t v11 = [(NSMutableDictionary *)self->_workloadDates objectForKeyedSubscript:v8];
  if ([v8 isEqualToString:kDASSystemContextKeyHeavyDiskUsage])
  {
    [(_DASCustomSystemConstraintsPolicy *)self updateHeavyDiskUsage:v6];
    goto LABEL_10;
  }
  if ([v8 isEqualToString:kDASSystemContextMCWorkloadRunningState])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DD374;
    block[3] = &unk_1001782B0;
    BOOL v26 = v6;
    id v22 = v11;
    v23 = self;
    id v24 = v8;
    id v25 = v9;
    dispatch_sync(queue, block);

    v13 = v22;
  }
  else
  {
    if (![v8 isEqualToString:kDASSystemContextGPWorkloadRunningState]) {
      goto LABEL_10;
    }
    objc_super v14 = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000DD508;
    v17[3] = &unk_1001782D8;
    BOOL v20 = v6;
    v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    dispatch_sync(v14, v17);

    v13 = v18;
  }

LABEL_10:
  daemon = self->_daemon;
  p_daemon = &self->_daemon;
  if (!daemon) {
    objc_storeStrong((id *)p_daemon, a5);
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return [a3 isEqualToString:@"com.apple.duetactivityscheduler.customsystemconstraint"] ^ 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Custom System Constraints Policy"];
  id v9 = self;
  objc_sync_enter(v9);
  if (v9->_heavyDiskUsage)
  {
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"heavyDiskUsage" withRequiredValue:0.0 withCurrentValue:1.0];
    uint64_t v10 = 100;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (!+[_DASPhotosPolicy isiCPLActivity:v6])
  {
    dispatch_queue_t v11 = [(NSMutableDictionary *)v9->_workloadDates objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
    if (v11)
    {
      v12 = [v6 relatedApplications];
      unsigned __int8 v13 = [v12 containsObject:@"com.apple.GenerativePlaygroundApp"];

      if ((v13 & 1) == 0)
      {
        [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"gpRunning" withRequiredValue:0.0 withCurrentValue:1.0];
        uint64_t v10 = 100;
      }
    }
    objc_super v14 = [(NSMutableDictionary *)v9->_workloadDates objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

    if (v14)
    {
      [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"mcRunning" withRequiredValue:0.0 withCurrentValue:1.0];
      uint64_t v10 = 100;
    }
  }
  CFStringRef v15 = +[_DASPolicyResponse policyResponseWithDecision:v10 validityDuration:v8 rationale:15.0];
  objc_sync_exit(v9);

  return v15;
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

- (void)setTriggers:(id)a3
{
}

- (BOOL)heavyDiskUsage
{
  return self->_heavyDiskUsage;
}

- (void)setHeavyDiskUsage:(BOOL)a3
{
  self->_heavyDiskUsage = a3;
}

- (NSMutableDictionary)workloadDates
{
  return self->_workloadDates;
}

- (void)setWorkloadDates:(id)a3
{
}

- (int64_t)gpWorkloadCounts
{
  return self->_gpWorkloadCounts;
}

- (void)setGpWorkloadCounts:(int64_t)a3
{
  self->_gpWorkloadCounts = a3;
}

- (OS_dispatch_source)resetTimer
{
  return self->_resetTimer;
}

- (void)setResetTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_workloadDates, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end