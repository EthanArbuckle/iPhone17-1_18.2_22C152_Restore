@interface _DASSmartPowerNapPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)pluginStatusKeyPath;
- (_DASSmartPowerNapPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPluginStatusKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
@end

@implementation _DASSmartPowerNapPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 useStatisticalModelForTriggersRestart])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v3 fastPass];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [v3 schedulingPriority];
      BOOL v4 = (unint64_t)v6 < _DASSchedulingPriorityUserInitiated;
    }
  }
  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (NSArray)triggers
{
  return self->triggers;
}

- (_DASSmartPowerNapPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASSmartPowerNapPolicy;
  v2 = [(_DASSmartPowerNapPolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"SmartPowerNap Policy";

    uint64_t v5 = +[_CDContextQueries keyPathForPluginStatus];
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F15C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C40A8 != -1) {
    dispatch_once(&qword_1001C40A8, block);
  }
  v2 = (void *)qword_1001C40B0;

  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = +[_DASDaemon sharedInstance];
  v9 = +[_DASSmartPowerNapMonitor sharedMonitorWithDaemon:v8];

  unsigned int v10 = [v9 inSmartPowerNap];
  v11 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  if (![v6 requiresSignificantUserInactivity])
  {
    if (!v10) {
      goto LABEL_13;
    }
    v13 = [v6 launchReason];
    if ([v13 isEqualToString:_DASLaunchReasonBackgroundRefresh])
    {
    }
    else
    {
      v14 = [v6 launchReason];
      unsigned __int8 v15 = [v14 isEqualToString:_DASLaunchReasonBackgroundFetch];

      if ((v15 & 1) == 0)
      {
        uint64_t v18 = [v6 widgetID];
        if (v18)
        {
          v19 = (void *)v18;
          id v20 = [v6 targetDevice];

          if (!v20)
          {
            CFStringRef v12 = @"smartPowerNap == YES AND LocalWidget == YES";
            goto LABEL_9;
          }
        }
        v21 = [v7 objectForKeyedSubscript:self->_pluginStatusKeyPath];
        unsigned __int8 v22 = [v21 BOOLValue];

        if ((v22 & 1) == 0)
        {
          v25 = [v6 startBefore];
          v26 = [v6 startAfter];
          [v25 timeIntervalSinceDate:v26];
          double v28 = v27;

          v29 = [v6 startAfter];
          [v29 timeIntervalSinceNow];
          double v31 = v30;

          if ([v6 budgeted])
          {
            CFStringRef v12 = @"smartPowerNap == YES";
            goto LABEL_9;
          }
          if (v28 < 1.0) {
            double v28 = 1.0;
          }
          id v32 = [v6 schedulingPriority];
          CFStringRef v12 = @"smartPowerNap == YES";
          if ((unint64_t)v32 < _DASSchedulingPriorityUtility || -v31 / v28 < 0.9) {
            goto LABEL_9;
          }
        }
        goto LABEL_13;
      }
    }
    CFStringRef v12 = @"smartPowerNap == YES AND LaunchReason == BackgroundRefresh";
    goto LABEL_9;
  }
  if ((v10 & 1) == 0)
  {
    CFStringRef v12 = @"smartPowerNap == NO";
LABEL_9:
    v16 = +[NSPredicate predicateWithFormat:v12];
    [(_DASPolicyResponseRationale *)v11 addRationaleWithCondition:v16];

    uint64_t v17 = 33;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v17 = 0;
LABEL_14:
  v23 = +[_DASPolicyResponse policyResponseWithDecision:v17 validityDuration:v11 rationale:(double)0x384uLL];

  return v23;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
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

- (_CDContextualKeyPath)pluginStatusKeyPath
{
  return self->_pluginStatusKeyPath;
}

- (void)setPluginStatusKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginStatusKeyPath, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);

  objc_storeStrong((id *)&self->triggers, 0);
}

@end