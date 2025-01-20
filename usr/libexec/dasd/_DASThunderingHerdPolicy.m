@interface _DASThunderingHerdPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)ignoreTH;
- (BOOL)recentTriggerEvent;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)waitingForInactivity;
- (NSArray)triggers;
- (NSDate)eventTriggerTime;
- (NSString)policyDescription;
- (NSString)policyName;
- (NSString)recentTriggerReason;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)longTermTimer;
- (OS_dispatch_source)shortTermTimer;
- (_DASThunderingHerdPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)handleTriggerEvent;
- (void)setEventTriggerTime:(id)a3;
- (void)setIgnoreTH:(BOOL)a3;
- (void)setLongTermTimer:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentTriggerEvent:(BOOL)a3;
- (void)setRecentTriggerReason:(id)a3;
- (void)setShortTermTimer:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWaitingForInactivity:(BOOL)a3;
@end

@implementation _DASThunderingHerdPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 budgeted])
  {
    v4 = [v3 fileProtection];
    v5 = +[_DASFileProtection complete];
    unsigned int v6 = [v4 isEqual:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForPluginStatus];
  v14 = +[_CDContextualPredicate predicateForKeyPath:v2 equalToValue:&off_100186E98 withMinimumDurationInPreviousState:14400.0];

  id v3 = +[_CDContextQueries keyPathForKeybagLockStatus];
  v13 = +[_CDContextualPredicate predicateForKeyPath:v3 equalToValue:&off_100186EB0 withMinimumDurationInPreviousState:14400.0];

  v4 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v5 = +[NSPredicate predicateWithValue:1];
  unsigned int v6 = +[NSPredicate predicateWithFormat:@"self.value == %@", &off_100186EB0];
  v12 = +[_CDContextualPredicate predicateForKeyPath:v4 withPredicate:v5 withPredicateForPreviousState:v6 withMinimumDurationInPreviousState:14400.0];

  v19[0] = @"identifier";
  v19[1] = @"predicate";
  v20[0] = @"com.apple.duetactivityscheduler.thpolicy.lengthyUnplug";
  v20[1] = v14;
  v19[2] = @"deviceSet";
  v19[3] = @"mustWake";
  v20[2] = &off_100186EC8;
  v20[3] = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v21[0] = v7;
  v17[0] = @"identifier";
  v17[1] = @"predicate";
  v18[0] = @"com.apple.duetactivityscheduler.thpolicy.lengthyLock";
  v18[1] = v13;
  v17[2] = @"deviceSet";
  v17[3] = @"mustWake";
  v18[2] = &off_100186EC8;
  v18[3] = &__kCFBooleanTrue;
  v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v21[1] = v8;
  v15[0] = @"identifier";
  v15[1] = @"predicate";
  v16[0] = @"com.apple.duetactivityscheduler.thpolicy.lengthyNoNetwork";
  v16[1] = v12;
  v15[2] = @"deviceSet";
  v15[3] = @"mustWake";
  v16[2] = &off_100186EC8;
  v16[3] = &__kCFBooleanTrue;
  v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  v21[2] = v9;
  v10 = +[NSArray arrayWithObjects:v21 count:3];

  return v10;
}

- (_DASThunderingHerdPolicy)init
{
  v29.receiver = self;
  v29.super_class = (Class)_DASThunderingHerdPolicy;
  v2 = [(_DASThunderingHerdPolicy *)&v29 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Thundering Herd Policy";

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dasd.thunderingHerdPolicy.syncQueue", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_queue);
    shortTermTimer = v3->_shortTermTimer;
    v3->_shortTermTimer = (OS_dispatch_source *)v8;

    uint64_t v10 = [(_DASThunderingHerdPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v10;

    dispatch_source_set_timer((dispatch_source_t)v3->_shortTermTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xE8D4A51000uLL);
    dispatch_set_qos_class_fallback();
    v12 = v3->_shortTermTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10006BF00;
    handler[3] = &unk_1001754F8;
    v13 = v3;
    v28 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_activate((dispatch_object_t)v3->_shortTermTimer);
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_queue);
    dispatch_source_t v15 = v13[7];
    v13[7] = v14;

    dispatch_source_set_timer(v13[7], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xE8D4A51000uLL);
    dispatch_set_qos_class_fallback();
    v16 = v13[7];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10006BF0C;
    v25[3] = &unk_1001754F8;
    v17 = v13;
    v26 = v17;
    dispatch_source_set_event_handler(v16, v25);
    dispatch_activate(v13[7]);
    id v18 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
    *((unsigned char *)v17 + 10) = [v18 BOOLForKey:@"ignoreTH"];

    if (*((unsigned char *)v17 + 10))
    {
      v19 = +[_DASDaemonLogger logForCategory:@"thpolicy"];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Ignoring TH triggers!", buf, 2u);
      }
    }
    v20 = v3->_queue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006BF18;
    v22[3] = &unk_1001759D0;
    v23 = v17;
    notify_register_dispatch("com.apple.dasd.thunderingHerdTrigger", (int *)&unk_1001C4058, v20, v22);
  }
  return v3;
}

- (void)setRecentTriggerEvent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_recentTriggerEvent = a3;
  v4 = +[_DASDaemonLogger logForCategory:@"thpolicy"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting recent trigger event to %u", (uint8_t *)v5, 8u);
  }
}

- (void)setWaitingForInactivity:(BOOL)a3
{
  BOOL v3 = a3;
  self->_waitingForInactivity = a3;
  v4 = +[_DASDaemonLogger logForCategory:@"thpolicy"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set waiting for user inactivity to %u", (uint8_t *)v5, 8u);
  }
}

+ (id)policyInstance
{
  if (qword_1001C4060 != -1) {
    dispatch_once(&qword_1001C4060, &stru_1001768F0);
  }
  v2 = (void *)qword_1001C4068;

  return v2;
}

- (void)handleTriggerEvent
{
  [(_DASThunderingHerdPolicy *)self setRecentTriggerEvent:1];
  [(_DASThunderingHerdPolicy *)self setWaitingForInactivity:1];
  shortTermTimer = self->_shortTermTimer;
  dispatch_time_t v4 = dispatch_walltime(0, 300000000000);
  dispatch_source_set_timer(shortTermTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
  longTermTimer = self->_longTermTimer;
  dispatch_time_t v6 = dispatch_walltime(0, 900000000000);

  dispatch_source_set_timer(longTermTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  if (([v6 isEqualToString:@"com.apple.duetactivityscheduler.thpolicy.lengthyUnplug"] & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.duetactivityscheduler.thpolicy.lengthyLock") & 1) != 0|| objc_msgSend(v6, "isEqualToString:", @"com.apple.duetactivityscheduler.thpolicy.lengthyNoNetwork"))
  {
    [(_DASThunderingHerdPolicy *)self handleTriggerEvent];
    +[_DASMetricRecorder recordOccurrenceForKey:@"com.apple.dasd.thunderingHerdTrigger"];
    objc_storeStrong((id *)&self->_recentTriggerReason, a3);
  }

  return 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_recentTriggerEvent)
  {
    if (!self->_waitingForInactivity) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (self->_waitingForInactivity)
  {
LABEL_5:
    if (!+[_DASDeviceActivityPolicy isDeviceInUse:v7]) {
      [(_DASThunderingHerdPolicy *)self setWaitingForInactivity:0];
    }
LABEL_7:
    if (self->_ignoreTH) {
      goto LABEL_8;
    }
    v9 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Thundering Herd Policy"];
    if (self->_recentTriggerEvent)
    {
      +[NSPredicate predicateWithFormat:@"timeSinceThunderingHerdTriggerEvent < %@", &off_100186EE0, v19];
    }
    else
    {
      if (!self->_waitingForInactivity
        || !+[_DASDeviceActivityPolicy isDeviceInUse:v7])
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        goto LABEL_16;
      }
      +[NSPredicate predicateWithFormat:@"deviceInUse == %u and timeSinceThunderingHerdTriggerEvent < %@", 1, &off_100186EF8];
    uint64_t v10 = };
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v10];

    v11 = +[NSPredicate predicateWithFormat:@"recentTriggerReason == %@", self->_recentTriggerReason];
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v11];

    uint64_t v12 = 1;
    uint64_t v13 = 33;
LABEL_16:
    CFStringRef v20 = @"ThunderingHerd";
    dispatch_source_t v14 = +[NSNumber numberWithBool:v12];
    v21 = v14;
    dispatch_source_t v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

    v16 = +[_DASPPSDataManager sharedInstance];
    [v16 sendDataToPPS:v15 subsystem:@"BackgroundProcessing" category:@"SystemConditionsOther"];

    if (+[_DASPhotosPolicy isActivity:v6 consideredNonDiscretionary:v7])
    {
      v17 = +[NSPredicate predicateWithFormat:@"isPhotosConsideredNonDiscretionary == 1"];
      [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v17];

      +[_DASPolicyResponse policyResponseWithScore:v9 validityDuration:0.8 rationale:(double)0x384uLL];
    }
    else
    {
      +[_DASPolicyResponse policyResponseWithDecision:v13 validityDuration:v9 rationale:(double)0x384uLL];
    dispatch_source_t v8 = };

    goto LABEL_20;
  }
LABEL_8:
  dispatch_source_t v8 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:0 rationale:(double)0x384uLL];
LABEL_20:

  return v8;
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)shortTermTimer
{
  return self->_shortTermTimer;
}

- (void)setShortTermTimer:(id)a3
{
}

- (OS_dispatch_source)longTermTimer
{
  return self->_longTermTimer;
}

- (void)setLongTermTimer:(id)a3
{
}

- (NSDate)eventTriggerTime
{
  return self->_eventTriggerTime;
}

- (void)setEventTriggerTime:(id)a3
{
}

- (NSString)recentTriggerReason
{
  return self->_recentTriggerReason;
}

- (void)setRecentTriggerReason:(id)a3
{
}

- (BOOL)recentTriggerEvent
{
  return self->_recentTriggerEvent;
}

- (BOOL)waitingForInactivity
{
  return self->_waitingForInactivity;
}

- (BOOL)ignoreTH
{
  return self->_ignoreTH;
}

- (void)setIgnoreTH:(BOOL)a3
{
  self->_ignoreTH = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentTriggerReason, 0);
  objc_storeStrong((id *)&self->_eventTriggerTime, 0);
  objc_storeStrong((id *)&self->_longTermTimer, 0);
  objc_storeStrong((id *)&self->_shortTermTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end