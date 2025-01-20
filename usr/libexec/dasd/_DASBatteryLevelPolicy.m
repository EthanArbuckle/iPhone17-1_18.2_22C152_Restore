@interface _DASBatteryLevelPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRationale:(id)a4 withBatteryLevel:(double)a5 isPluggedIn:(BOOL)a6;
- (BOOL)isiPad;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)batteryLevelKeyPath;
- (_CDContextualKeyPath)defaultPairedBatteryKeyPath;
- (_CDContextualKeyPath)defaultPairedPluginKeyPath;
- (_CDContextualKeyPath)pluginStatusKeyPath;
- (_DASBatteryLevelPolicy)init;
- (double)baselineScoreForActivity:(id)a3;
- (double)getScoreForActivity:(id)a3 forBatteryLevel:(double)a4 isPluggedIn:(BOOL)a5;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)lastSavedBatteryLevel;
- (void)setBatteryLevelKeyPath:(id)a3;
- (void)setDefaultPairedBatteryKeyPath:(id)a3;
- (void)setDefaultPairedPluginKeyPath:(id)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setLastSavedBatteryLevel:(int64_t)a3;
- (void)setPluginStatusKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASBatteryLevelPolicy

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

- (double)baselineScoreForActivity:(id)a3
{
  return 0.5;
}

- (id)initializeTriggers
{
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_batteryLevelKeyPath];
  BOOL v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_defaultPairedBatteryKeyPath];
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.das.batterylevelpolicy.batterylevelchange";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100186C10;
  v12[3] = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v13[0] = v5;
  v9[0] = @"identifier";
  v9[1] = @"predicate";
  v10[0] = @"com.apple.das.batterylevelpolicy.watchbatterylevelchange";
  v10[1] = v4;
  v9[2] = @"deviceSet";
  v9[3] = @"mustWake";
  v10[2] = &off_100186C10;
  v10[3] = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  v13[1] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:2];

  return v7;
}

- (_DASBatteryLevelPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)_DASBatteryLevelPolicy;
  v2 = [(_DASBatteryLevelPolicy *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Battery Level Policy";

    uint64_t v5 = +[_CDContextQueries keyPathForBatteryLevel];
    batteryLevelKeyPath = v3->_batteryLevelKeyPath;
    v3->_batteryLevelKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextQueries keyPathForPluginStatus];
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = +[_CDContextQueries keyPathForDefaultPairedDeviceBatteryLevel];
    defaultPairedBatteryKeyPath = v3->_defaultPairedBatteryKeyPath;
    v3->_defaultPairedBatteryKeyPath = (_CDContextualKeyPath *)v9;

    uint64_t v11 = +[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus];
    defaultPairedPluginKeyPath = v3->_defaultPairedPluginKeyPath;
    v3->_defaultPairedPluginKeyPath = (_CDContextualKeyPath *)v11;

    v3->_isiPad = +[_DASConfig isiPad];
    uint64_t v13 = [(_DASBatteryLevelPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    v3->_lastSavedBatteryLevel = 0;
  }
  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001C3CC8 != -1) {
    dispatch_once(&qword_1001C3CC8, &stru_1001760F0);
  }
  v2 = (void *)qword_1001C3CD0;

  return v2;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:self->_batteryLevelKeyPath];
  uint64_t v4 = (uint64_t)[v3 integerValue];

  uint64_t v5 = +[_DASDaemon sharedInstance];
  id v6 = v5;
  if (v4 > 9)
  {
    if ((unint64_t)v4 > 0x13) {
      [v5 removeConstraint:1 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    }
    else {
      [v5 addConstraint:1 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    }
    [v6 removeConstraint:1 forSchedulingPriority:_DASSchedulingPriorityUtility];
  }
  else
  {
    [v5 addConstraint:1 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v6 addConstraint:1 forSchedulingPriority:_DASSchedulingPriorityUtility];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.das.batterylevelpolicy.batterylevelchange"])
  {
    uint64_t v7 = [v6 objectForKeyedSubscript:self->_batteryLevelKeyPath];
    id v8 = [v7 integerValue];

    [(_DASBatteryLevelPolicy *)self updateSystemConstraintsWithContext:v6];
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

- (double)getScoreForActivity:(id)a3 forBatteryLevel:(double)a4 isPluggedIn:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [v7 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:_DASCTSMinBatteryLevelKey];
  id v10 = [v9 integerValue];

  double v11 = 0.0;
  if ((double)(uint64_t)v10 <= a4)
  {
    id v12 = [v7 schedulingPriority:(double)(uint64_t)v10];
    if ((unint64_t)v12 >= _DASSchedulingPriorityUserInitiated)
    {
      double v15 = 5.0;
      double v14 = 0.25;
    }
    else
    {
      id v13 = [v7 schedulingPriority];
      double v14 = 0.5;
      if ((unint64_t)v13 >= _DASSchedulingPriorityUtility) {
        double v14 = 0.4;
      }
      double v15 = 10.0;
      if ((unint64_t)v13 < _DASSchedulingPriorityUtility) {
        double v15 = 20.0;
      }
    }
    double v16 = pow((a4 - v15) / (100.0 - v15), v14);
    if (v5) {
      double v16 = v16 * 1.2;
    }
    if (v16 > 1.0) {
      double v16 = 1.0;
    }
    double v11 = fmax(v16, 0.0);
  }

  return v11;
}

- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRationale:(id)a4 withBatteryLevel:(double)a5 isPluggedIn:(BOOL)a6
{
  id v10 = a4;
  unsigned int v11 = [a3 isEqualToString:_DASLaunchReasonBackgroundProcessing];
  BOOL v12 = 1;
  if (v11 && !a6 && (a5 < 75.0 || !self->_isiPad))
  {
    double v14 = +[NSNumber numberWithDouble:a5];
    double v15 = +[NSPredicate predicateWithFormat:@"launchType == PROCESSING AND batteryLevel == %@", v14];
    [v10 addRationaleWithCondition:v15];

    BOOL v12 = 0;
  }

  return v12;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047D40;
  block[3] = &unk_100175570;
  block[4] = self;
  id v7 = a4;
  id v36 = v7;
  if (qword_1001C3CD8 != -1) {
    dispatch_once(&qword_1001C3CD8, block);
  }
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  uint64_t v9 = [v7 objectForKeyedSubscript:self->_batteryLevelKeyPath];
  [v9 doubleValue];
  if (v10 == 0.0)
  {
    double v11 = (double)0x384uLL;
    uint64_t v12 = 0;
    id v13 = 0;
LABEL_5:
    uint64_t v14 = +[_DASPolicyResponse policyResponseWithDecision:v12 validityDuration:v13 rationale:v11];
    goto LABEL_17;
  }
  id v15 = [v9 unsignedIntegerValue];
  double v16 = +[NSPredicate predicateWithFormat:@"batteryLevel == %ld", v15];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v16];

  v17 = [v7 objectForKeyedSubscript:self->_pluginStatusKeyPath];
  id v18 = [v17 BOOLValue];

  v19 = +[NSNumber numberWithBool:v18];
  v20 = +[NSPredicate predicateWithFormat:@"pluggedIn == %@", v19];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v20];

  if ([v6 requestsApplicationLaunch])
  {
    v21 = [v6 launchReason];
    double v22 = (double)(unint64_t)v15;
    unsigned __int8 v23 = [(_DASBatteryLevelPolicy *)self backgroundTaskAllowedWithType:v21 withRationale:v8 withBatteryLevel:v18 isPluggedIn:(double)(unint64_t)v15];

    if ((v23 & 1) == 0)
    {
      double v11 = (double)0x384uLL;
      uint64_t v12 = 33;
      id v13 = v8;
      goto LABEL_5;
    }
  }
  else
  {
    double v22 = (double)(unint64_t)v15;
  }
  [(_DASBatteryLevelPolicy *)self getScoreForActivity:v6 forBatteryLevel:v18 isPluggedIn:v22];
  double v25 = v24;
  if ([v6 targetDevice] == (id)1 || objc_msgSend(v6, "targetDevice") == (id)2)
  {
    v26 = [v7 objectForKeyedSubscript:self->_defaultPairedBatteryKeyPath];
    v27 = v26;
    if (v26)
    {
      id v28 = [v26 unsignedIntegerValue];
      v29 = +[NSPredicate predicateWithFormat:@"watchBatteryLevel == %ld", v28];
      [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v29];

      v30 = [v7 objectForKeyedSubscript:self->_defaultPairedPluginKeyPath];
      id v31 = [v30 BOOLValue];

      [(_DASBatteryLevelPolicy *)self getScoreForActivity:v6 forBatteryLevel:v31 isPluggedIn:(double)(unint64_t)v28];
      if (v25 >= v32) {
        double v25 = v32;
      }
    }
  }
  uint64_t v14 = +[_DASPolicyResponse policyResponseWithScore:v8 validityDuration:v25 rationale:(double)0x384uLL];
LABEL_17:
  v33 = (void *)v14;

  return v33;
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

- (_CDContextualKeyPath)defaultPairedBatteryKeyPath
{
  return self->_defaultPairedBatteryKeyPath;
}

- (void)setDefaultPairedBatteryKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)defaultPairedPluginKeyPath
{
  return self->_defaultPairedPluginKeyPath;
}

- (void)setDefaultPairedPluginKeyPath:(id)a3
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

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_defaultPairedPluginKeyPath, 0);
  objc_storeStrong((id *)&self->_defaultPairedBatteryKeyPath, 0);
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_batteryLevelKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end