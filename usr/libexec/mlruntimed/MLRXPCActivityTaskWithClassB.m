@interface MLRXPCActivityTaskWithClassB
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

@implementation MLRXPCActivityTaskWithClassB

- (BOOL)bypassDiagnosticsUsage
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.mlruntimed.xpc_activity-classb";
}

- (NSString)description
{
  v3 = [(MLRXPCActivityTaskWithClassB *)self identifier];
  v4 = [(MLRXPCActivityTaskWithClassB *)self activity];
  v5 = [(MLRXPCActivityTaskWithClassB *)self criteria];
  v6 = +[NSString stringWithFormat:@"identifier=%@, activity=%@, criteria=%@", v3, v4, v5];

  return (NSString *)v6;
}

- (id)criteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 0);

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
  v12[0] = MLRuntimePluginID_DPMLRuntimePluginClassB;
  v12[1] = MLRuntimePluginID_FedStatsPluginClassB;
  v5 = +[NSArray arrayWithObjects:v12 count:2];
  v6 = [(MLRXPCActivityTaskWithClassB *)self createTaskScheduler];
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v6;

  v8 = self->_taskScheduler;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005718;
  v10[3] = &unk_100018610;
  id v11 = v4;
  id v9 = v4;
  [(MLRTaskScheduler *)v8 startTasksForPluginIDs:v5 completion:v10];
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