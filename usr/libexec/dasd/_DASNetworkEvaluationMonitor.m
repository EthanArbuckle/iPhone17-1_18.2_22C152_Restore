@interface _DASNetworkEvaluationMonitor
+ (BOOL)inexpensivePathAvailable;
+ (_DASNetworkEvaluationMonitor)sharedInstance;
+ (id)defaultInexpensivePathEvaluator;
+ (id)defaultPathEvaluator;
+ (id)defaultUnconstrainedPathEvaluator;
+ (id)nwParametersForActivity:(id)a3;
- (BOOL)isNetworkPathAvailableForActivity:(id)a3;
- (BOOL)isUnconstrainedPathAvailableForActivity:(id)a3;
- (BOOL)requiresNetworkPathMonitoring:(id)a3;
- (NSMutableArray)networkEvaluationGroups;
- (OS_dispatch_queue)callbackQueue;
- (OS_os_log)log;
- (_DASNetworkEvaluationMonitor)init;
- (id)callback;
- (id)evaluationGroupForActivityID:(id)a3;
- (id)evaluationGroupForParameters:(id)a3 endpoint:(id)a4;
- (id)setupNetworkMonitoringWithNetworkParameters:(id)a3 endpoint:(id)a4 withActivityID:(id)a5;
- (os_unfair_recursive_lock_s)lock;
- (void)registerForNetworkEvaluationWithCallback:(id)a3;
- (void)setCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setLock:(os_unfair_recursive_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNetworkEvaluationGroups:(id)a3;
- (void)startMonitoringActivity:(id)a3 withNetworkParameters:(id)a4 withEndpoint:(id)a5;
- (void)stopMonitoringActivity:(id)a3;
@end

@implementation _DASNetworkEvaluationMonitor

- (BOOL)requiresNetworkPathMonitoring:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:kNWEndpointKey];
  BOOL v5 = v4 != 0;

  return v5;
}

- (_DASNetworkEvaluationMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)_DASNetworkEvaluationMonitor;
  v2 = [(_DASNetworkEvaluationMonitor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    networkEvaluationGroups = v2->_networkEvaluationGroups;
    v2->_networkEvaluationGroups = (NSMutableArray *)v3;

    BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NetworkEvaluationMonitor.serial", v5);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v6;

    os_log_t v8 = os_log_create("com.apple.duetactivityscheduler", "NetworkEvaluationMonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v8;

    v2->_lock = 0;
  }
  return v2;
}

+ (_DASNetworkEvaluationMonitor)sharedInstance
{
  if (qword_1001C4450 != -1) {
    dispatch_once(&qword_1001C4450, &stru_100178320);
  }
  v2 = (void *)qword_1001C4458;

  return (_DASNetworkEvaluationMonitor *)v2;
}

+ (id)defaultPathEvaluator
{
  if (qword_1001C4460 != -1) {
    dispatch_once(&qword_1001C4460, &stru_100178340);
  }
  v2 = (void *)qword_1001C4468;

  return v2;
}

+ (id)defaultInexpensivePathEvaluator
{
  if (qword_1001C4470 != -1) {
    dispatch_once(&qword_1001C4470, &stru_100178360);
  }
  v2 = (void *)qword_1001C4478;

  return v2;
}

+ (id)defaultUnconstrainedPathEvaluator
{
  if (qword_1001C4480 != -1) {
    dispatch_once(&qword_1001C4480, &stru_100178380);
  }
  v2 = (void *)qword_1001C4488;

  return v2;
}

+ (id)nwParametersForActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:kNWParametersKey];

  if (!v5)
  {
    if ([v3 requiresInexpensiveNetworking])
    {
      if (qword_1001C4490 != -1) {
        dispatch_once(&qword_1001C4490, &stru_1001783A0);
      }
      dispatch_queue_t v6 = &qword_1001C4498;
    }
    else
    {
      if (qword_1001C44A0 != -1) {
        dispatch_once(&qword_1001C44A0, &stru_1001783C0);
      }
      dispatch_queue_t v6 = &qword_1001C44A8;
    }
    id v5 = (id)*v6;
  }

  return v5;
}

+ (BOOL)inexpensivePathAvailable
{
  v2 = [(id)objc_opt_class() defaultInexpensivePathEvaluator];
  id v3 = [v2 path];
  id v4 = [v3 status];

  return v4 != (id)2;
}

- (void)registerForNetworkEvaluationWithCallback:(id)a3
{
  self->_callback = objc_retainBlock(a3);

  _objc_release_x1();
}

- (void)startMonitoringActivity:(id)a3 withNetworkParameters:(id)a4 withEndpoint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_DASNetworkEvaluationMonitor *)self evaluationGroupForParameters:v9 endpoint:v10];
  if (v11)
  {
    v12 = (void *)v11;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_10010075C();
    }
  }
  else
  {
    v12 = [(_DASNetworkEvaluationMonitor *)self setupNetworkMonitoringWithNetworkParameters:v9 endpoint:v10 withActivityID:v8];
  }
  [v12 startMonitoringForActivityID:v8];
}

- (id)evaluationGroupForParameters:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = self->_networkEvaluationGroups;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "isMonitoringWithParameters:endpoint:", v6, v7, (void)v14))
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();

  return v9;
}

- (id)setupNetworkMonitoringWithNetworkParameters:(id)a3 endpoint:(id)a4 withActivityID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[_DASNetworkMonitorEvaluationGroup alloc] initWithEndpoint:v9 parameters:v8 activityID:v10 callback:self->_callback onQueue:self->_callbackQueue];
  if (v11)
  {
    os_unfair_recursive_lock_lock_with_options();
    [(NSMutableArray *)self->_networkEvaluationGroups addObject:v11];
    os_unfair_recursive_lock_unlock();
    v12 = v11;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Unable to instantiate evaluationGroup for %@ (%@, %@", (uint8_t *)&v15, 0x20u);
    }
  }

  return v11;
}

- (void)stopMonitoringActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASNetworkEvaluationMonitor *)self evaluationGroupForActivityID:v4];
  if (v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    if ([v5 stopMonitoringForActivityID:v4]) {
      [(NSMutableArray *)self->_networkEvaluationGroups removeObject:v5];
    }
    os_unfair_recursive_lock_unlock();
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1001007D0();
  }
}

- (id)evaluationGroupForActivityID:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_networkEvaluationGroups;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isMonitoringActivityID:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();

  return v6;
}

- (BOOL)isNetworkPathAvailableForActivity:(id)a3
{
  id v4 = a3;
  if ([(_DASNetworkEvaluationMonitor *)self requiresNetworkPathMonitoring:v4])
  {
    id v5 = [v4 uuid];

    id v6 = [(_DASNetworkEvaluationMonitor *)self evaluationGroupForActivityID:v5];

    if (v6) {
      unsigned __int8 v7 = [v6 isNetworkPathAvailable];
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned int v8 = [v4 requiresInexpensiveNetworking];

    id v9 = objc_opt_class();
    if (v8) {
      [v9 defaultInexpensivePathEvaluator];
    }
    else {
    id v10 = [v9 defaultPathEvaluator];
    }
    long long v11 = [v10 path];
    id v12 = [v11 status];

    return v12 != (id)2;
  }
  return v7;
}

- (BOOL)isUnconstrainedPathAvailableForActivity:(id)a3
{
  id v4 = a3;
  if (![(_DASNetworkEvaluationMonitor *)self requiresNetworkPathMonitoring:v4])
  {
    evaluator_for_endpoint = [(id)objc_opt_class() defaultUnconstrainedPathEvaluator];
    id v12 = [evaluator_for_endpoint path];
    BOOL v13 = [v12 status] == (id)2;
    goto LABEL_11;
  }
  id v5 = [v4 startDate];

  if (v5)
  {
    id v6 = [v4 userInfo];
    unsigned __int8 v7 = [v6 objectForKeyedSubscript:kNWEndpointKey];

    unsigned int v8 = +[_DASNetworkEvaluationMonitor nwParametersForActivity:v4];
    id v9 = [v7 copyCEndpoint];
    id v10 = [v8 copyCParameters];
    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  }
  else
  {
    unsigned __int8 v7 = [v4 uuid];
    unsigned int v8 = [(_DASNetworkEvaluationMonitor *)self evaluationGroupForActivityID:v7];
    evaluator_for_endpoint = [v8 evaluator];
  }

  if (evaluator_for_endpoint)
  {
    id v12 = nw_path_evaluator_copy_path();
    if (nw_path_is_constrained(v12))
    {
      BOOL v14 = 0;
LABEL_14:

      goto LABEL_15;
    }
    BOOL v13 = nw_path_get_status(v12) == nw_path_status_unsatisfied;
LABEL_11:
    BOOL v14 = !v13;
    goto LABEL_14;
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (NSMutableArray)networkEvaluationGroups
{
  return self->_networkEvaluationGroups;
}

- (void)setNetworkEvaluationGroups:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (os_unfair_recursive_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_recursive_lock_s)a3
{
  self->_lock = a3;
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
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_networkEvaluationGroups, 0);
}

@end