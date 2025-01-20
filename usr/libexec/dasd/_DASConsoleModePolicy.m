@interface _DASConsoleModePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)enabled;
- (BOOL)isConsoleModeActive;
- (BOOL)queryAndUpdateCurrentConsoleModeState;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)consoleModeQueue;
- (_DASConsoleModePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)notifyToken;
- (void)consoleModeNotificationHandler;
- (void)setConsoleModeQueue:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIsConsoleModeActive:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASConsoleModePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (_DASConsoleModePolicy)init
{
  v14.receiver = self;
  v14.super_class = (Class)_DASConsoleModePolicy;
  v2 = [(_DASConsoleModePolicy *)&v14 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Console Mode Policy";

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dasd.consoleModeQueue", v5);
    consoleModeQueue = v3->_consoleModeQueue;
    v3->_consoleModeQueue = (OS_dispatch_queue *)v6;

    v3->_notifyToken = -1;
    v8 = (const char *)[@"com.apple.system.console_mode_changed" UTF8String];
    v9 = v3->_consoleModeQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003B898;
    handler[3] = &unk_1001759D0;
    v10 = v3;
    v13 = v10;
    notify_register_dispatch(v8, &v3->_notifyToken, v9, handler);
    [(_DASConsoleModePolicy *)v10 queryAndUpdateCurrentConsoleModeState];
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B940;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3C10 != -1) {
    dispatch_once(&qword_1001C3C10, block);
  }
  v2 = (void *)qword_1001C3C18;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Console Mode Policy"];
  if (self->_isConsoleModeActive)
  {
    v9 = +[_DASApplicationPolicy focalApplicationsWithContext:v7];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v10 = [v6 relatedApplications];
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([v9 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * i)])
          {

            [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"app foreground." withRequiredValue:1.0 withCurrentValue:1.0];
            uint64_t v17 = 0;
            goto LABEL_12;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v15 = +[NSNumber numberWithBool:self->_isConsoleModeActive];
    v16 = +[NSPredicate predicateWithFormat:@"consoleModeStatus = %@", v15];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v16];

    uint64_t v17 = 33;
LABEL_12:
  }
  else
  {
    uint64_t v17 = 0;
  }
  v18 = +[_DASPolicyResponse policyResponseWithDecision:v17 validityDuration:v8 rationale:(double)0x384uLL];

  return v18;
}

- (void)consoleModeNotificationHandler
{
  unsigned int v3 = [(_DASConsoleModePolicy *)self queryAndUpdateCurrentConsoleModeState];
  if (self->_isConsoleModeActive && v3 != 0)
  {
    v5 = +[_DASDaemon sharedInstance];
    CFStringRef v7 = @"com.apple.system.console_mode_changed";
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 handleTriggersBatched:v6];
  }
}

- (BOOL)queryAndUpdateCurrentConsoleModeState
{
  uint64_t state64 = 0;
  int notifyToken = self->_notifyToken;
  if (notifyToken == -1)
  {
    v9 = +[_DASDaemonLogger logForCategory:@"consoleModePolicy"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000F49EC(v9);
    }

    return 0;
  }
  else
  {
    int isConsoleModeActive = self->_isConsoleModeActive;
    uint32_t state = notify_get_state(notifyToken, &state64);
    id v6 = +[_DASDaemonLogger logForCategory:@"consoleModePolicy"];
    CFStringRef v7 = v6;
    if (state)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000F4A30(state, v7);
      }

      int v8 = self->_isConsoleModeActive;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = state64;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Console Mode Status is now %llu", buf, 0xCu);
      }

      int v8 = state64 != 0;
      self->_int isConsoleModeActive = v8;
    }
    return isConsoleModeActive != v8;
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
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

- (OS_dispatch_queue)consoleModeQueue
{
  return self->_consoleModeQueue;
}

- (void)setConsoleModeQueue:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_int notifyToken = a3;
}

- (BOOL)isConsoleModeActive
{
  return self->_isConsoleModeActive;
}

- (void)setIsConsoleModeActive:(BOOL)a3
{
  self->_int isConsoleModeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consoleModeQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end