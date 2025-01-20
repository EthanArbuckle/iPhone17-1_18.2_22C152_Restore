@interface MLRXPCActivityTaskFedStatsWithLockedDevice
- (BOOL)activityDeferred;
- (BOOL)bypassDiagnosticsUsage;
- (BOOL)dynamicallyRegistered;
- (MLRTaskScheduler)taskScheduler;
- (NSString)description;
- (NSString)identifier;
- (OS_xpc_object)activity;
- (_xpc_activity_eligibility_changed_handler_s)eligibilityHandler;
- (id)createTaskScheduler;
- (id)criteria;
- (void)setActivity:(id)a3;
- (void)setActivityDeferred:(BOOL)a3;
- (void)setEligibilityHandler:(_xpc_activity_eligibility_changed_handler_s *)a3;
- (void)startTaskWithCompletion:(id)a3;
- (void)stop;
@end

@implementation MLRXPCActivityTaskFedStatsWithLockedDevice

- (BOOL)bypassDiagnosticsUsage
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.mlruntimed.xpc_activity-fedstats";
}

- (NSString)description
{
  v3 = [(MLRXPCActivityTaskFedStatsWithLockedDevice *)self identifier];
  v4 = [(MLRXPCActivityTaskFedStatsWithLockedDevice *)self activity];
  v5 = [(MLRXPCActivityTaskFedStatsWithLockedDevice *)self criteria];
  v6 = +[NSString stringWithFormat:@"identifier=%@, activity=%@, criteria=%@", v3, v4, v5];

  return (NSString *)v6;
}

- (id)criteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION, XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);

  return v2;
}

- (id)createTaskScheduler
{
  xpc_object_t v2 = [[MLRTaskScheduler alloc] initWithBaseURL:0 localeIdentifier:0 fromDesTool:0];

  return v2;
}

- (void)startTaskWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[DESBundleRegistry sharedInstance];
  v6 = [v5 allFedStatsUnrestrictedBundleIds];

  v7 = [(MLRXPCActivityTaskFedStatsWithLockedDevice *)self createTaskScheduler];
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v7;

  v9 = self->_taskScheduler;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000429C;
  v11[3] = &unk_100018610;
  id v12 = v4;
  id v10 = v4;
  [(MLRTaskScheduler *)v9 startTasksForPluginIDs:v6 completion:v11];
}

- (void)stop
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)activityDeferred
{
  return self->_activityDeferred;
}

- (void)setActivityDeferred:(BOOL)a3
{
  self->_activityDeferred = a3;
}

- (BOOL)dynamicallyRegistered
{
  return self->_dynamicallyRegistered;
}

- (_xpc_activity_eligibility_changed_handler_s)eligibilityHandler
{
  return self->_eligibilityHandler;
}

- (void)setEligibilityHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  self->_eligibilityHandler = a3;
}

- (MLRTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskScheduler, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end