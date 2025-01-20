@interface _DASLowPowerModePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isChallengedForBatteryLife;
- (BOOL)isLowPowerModeEnabledWithContext:(id)a3;
- (BOOL)isLowPowerModePolicyEnforced:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)notifyQueue;
- (_CDContextualKeyPath)batteryLevelKeyPath;
- (_CDContextualKeyPath)lpmKeyPath;
- (_CDContextualKeyPath)pluginStatusKeyPath;
- (_DASLowPowerModePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)notifyToken;
- (int64_t)lastSavedBatteryLevel;
- (void)setBatteryLevelKeyPath:(id)a3;
- (void)setLastSavedBatteryLevel:(int64_t)a3;
- (void)setLpmKeyPath:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPluginStatusKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASLowPowerModePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 allowsUnrestrictedBackgroundLaunches])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 schedulingPriority];
    BOOL v4 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiated;
  }

  return v4;
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
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_batteryLevelKeyPath];
  BOOL v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_lpmKeyPath];
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.das.batterylevelpolicy.batterylevelchange";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100186BC8;
  v12[3] = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v13[0] = v5;
  v9[0] = @"identifier";
  v9[1] = @"predicate";
  v10[0] = @"com.apple.das.lpmchange";
  v10[1] = v4;
  v9[2] = @"deviceSet";
  v9[3] = @"mustWake";
  v10[2] = &off_100186BC8;
  v10[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  v13[1] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:2];

  return v7;
}

- (_DASLowPowerModePolicy)init
{
  v19.receiver = self;
  v19.super_class = (Class)_DASLowPowerModePolicy;
  v2 = [(_DASLowPowerModePolicy *)&v19 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Low Power Mode Policy";

    uint64_t v5 = +[_CDContextQueries keyPathForBatteryLevel];
    batteryLevelKeyPath = v3->_batteryLevelKeyPath;
    v3->_batteryLevelKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextQueries keyPathForLowPowerModeStatus];
    lpmKeyPath = v3->_lpmKeyPath;
    v3->_lpmKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = +[_CDContextQueries keyPathForPluginStatus];
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v9;

    v3->_lastSavedBatteryLevel = 0;
    uint64_t v11 = [(_DASLowPowerModePolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.duetActivityScheduler.lowPowerModePolicy.notify", 0);
    notifyQueue = v3->_notifyQueue;
    v3->_notifyQueue = (OS_dispatch_queue *)v13;

    uint32_t v15 = notify_register_check((const char *)[@"com.apple.powerui.nudge.LPM" UTF8String], &v3->_notifyToken);
    if (v15)
    {
      int v16 = v15;
      v17 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000F4744(v16, v17);
      }
    }
  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (BOOL)isChallengedForBatteryLife
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    uint64_t state64 = 0;
    notify_get_state(self->_notifyToken, &state64);
    LOBYTE(v3) = state64 != 0;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3BE0 != -1) {
    dispatch_once(&qword_1001C3BE0, &stru_100175C50);
  }
  v2 = (void *)qword_1001C3BE8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.das.batterylevelpolicy.batterylevelchange"])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:self->_batteryLevelKeyPath];
    id v8 = [v7 integerValue];

    int64_t lastSavedBatteryLevel = self->_lastSavedBatteryLevel;
    BOOL v10 = (uint64_t)v8 - lastSavedBatteryLevel < 5;
    if ((uint64_t)v8 - lastSavedBatteryLevel > 4 || (uint64_t)v8 < lastSavedBatteryLevel) {
      self->_int64_t lastSavedBatteryLevel = (int64_t)v8;
    }
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isLowPowerModeEnabledWithContext:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:self->_lpmKeyPath];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isLowPowerModePolicyEnforced:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:self->_batteryLevelKeyPath];
  [v5 doubleValue];
  if (v6 == 0.0)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v5 unsignedIntegerValue];
    uint64_t v9 = [v4 objectForKeyedSubscript:self->_pluginStatusKeyPath];
    unsigned __int8 v10 = [v9 BOOLValue];

    unsigned int v11 = [(_DASLowPowerModePolicy *)self isLowPowerModeEnabledWithContext:v4];
    char v12 = v10 ^ 1;
    if ((unint64_t)v8 < 0x1E) {
      char v12 = 1;
    }
    if (v11) {
      BOOL v7 = v12;
    }
    else {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  unsigned int v9 = [(_DASLowPowerModePolicy *)self isLowPowerModePolicyEnforced:v7];

  if (!v9)
  {
    v27 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:v8 rationale:(double)0x384uLL];
    goto LABEL_17;
  }
  unsigned __int8 v10 = +[NSDate date];
  unsigned int v11 = [v6 startBefore];
  char v12 = [v6 startAfter];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (v14 >= 1.0) {
    double v15 = v14;
  }
  else {
    double v15 = 1.0;
  }
  int v16 = [v6 startAfter];
  [v10 timeIntervalSinceDate:v16];
  double v18 = v17;

  objc_super v19 = +[NSNumber numberWithBool:1];
  v20 = +[NSPredicate predicateWithFormat:@"lowPowerModeEnforced == %@", v19];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v20];

  unsigned int v21 = [(_DASLowPowerModePolicy *)self isChallengedForBatteryLife];
  if (_os_feature_enabled_impl()
    && v21
    && (id v23 = [v6 schedulingPriority], (unint64_t)v23 < _DASSchedulingPriorityUserInitiated)
    && (double v22 = v18 / v15, v18 / v15 < 0.5))
  {
    v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v22);
    v25 = +[NSPredicate predicateWithFormat:@"isChallengedForBatteryLife == %@", v24];
    [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v25];
  }
  else if ((objc_msgSend(v6, "budgeted", v22) & 1) == 0)
  {
    id v28 = [v6 schedulingPriority];
    if ((unint64_t)v28 >= _DASSchedulingPriorityUtility)
    {
      double v26 = v18 / v15;
      if (v18 / v15 >= 0.9)
      {
        v29 = [v6 fastPass:v26];

        if (!v29)
        {
          uint64_t v30 = 0;
          goto LABEL_16;
        }
      }
    }
  }
  [(_DASPolicyResponseRationale *)v8 setResponseOptions:(unint64_t)[(_DASPolicyResponseRationale *)v8 responseOptions] | 1];
  uint64_t v30 = 33;
LABEL_16:
  v27 = +[_DASPolicyResponse policyResponseWithDecision:v30 validityDuration:v8 rationale:(double)0x384uLL];

LABEL_17:

  return v27;
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

- (_CDContextualKeyPath)lpmKeyPath
{
  return self->_lpmKeyPath;
}

- (void)setLpmKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)batteryLevelKeyPath
{
  return self->_batteryLevelKeyPath;
}

- (void)setBatteryLevelKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)pluginStatusKeyPath
{
  return self->_pluginStatusKeyPath;
}

- (void)setPluginStatusKeyPath:(id)a3
{
}

- (void)setTriggers:(id)a3
{
}

- (int64_t)lastSavedBatteryLevel
{
  return self->_lastSavedBatteryLevel;
}

- (void)setLastSavedBatteryLevel:(int64_t)a3
{
  self->_int64_t lastSavedBatteryLevel = a3;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_batteryLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_lpmKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end