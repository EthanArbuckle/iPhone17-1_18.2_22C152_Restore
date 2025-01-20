@interface _DASCPMModePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASCPMModeMonitor)monitor;
- (_DASCPMModePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setMonitor:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASCPMModePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresPlugin])
  {
    v4 = [v3 fileProtection];
    v5 = +[_DASFileProtection complete];
    if ([v4 isEqual:v5])
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      v7 = [v3 fileProtection];
      v8 = +[_DASFileProtection completeUnlessOpen];
      if ([v7 isEqual:v8])
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        v9 = [v3 startDate];
        if (v9) {
          LOBYTE(v6) = 0;
        }
        else {
          unsigned int v6 = !+[_DASConditionScore isPremiumClient:v3];
        }
      }
    }
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

- (_DASCPMModePolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASCPMModePolicy;
  v2 = [(_DASCPMModePolicy *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"CPM Mode Policy";

    uint64_t v5 = [(_DASCPMModePolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    uint64_t v7 = +[_DASCPMModeMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (_DASCPMModeMonitor *)v7;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F11C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4290 != -1) {
    dispatch_once(&qword_1001C4290, block);
  }
  v2 = (void *)qword_1001C4298;

  return v2;
}

- (id)initializeTriggers
{
  CFStringRef v5 = @"identifier";
  CFStringRef v6 = @"com.apple.das.cpm.modeChanged";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v7 = v2;
  id v3 = +[NSArray arrayWithObjects:&v7 count:1];

  return v3;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_DASCPMModeMonitor *)self->_monitor currentMode];
  v9 = +[_DASDaemonLogger logForCategory:@"cpmModes"];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000FAF80((uint64_t)v6, (uint64_t)v8, v9);
  }

  if (!v8)
  {
    v16 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:0 rationale:(double)0x384uLL];
    goto LABEL_14;
  }
  objc_super v10 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"CPM Mode Policy"];
  v11 = +[NSPredicate predicateWithFormat:@"activeMode == %@", v8];
  [(_DASPolicyResponseRationale *)v10 addRationaleWithCondition:v11];

  if ([v8 isEqual:@"InUseChargingMode"])
  {
    v12 = +[_CDContextQueries keyPathForPluginStatus];
    v13 = [v7 lastModifiedDateForContextualKeyPath:v12];

    v14 = +[NSDate now];
    [v14 timeIntervalSinceDate:v13];
    if (v15 < 900.0)
    {
      v16 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v10 rationale:(double)0x384uLL];

      goto LABEL_13;
    }

    goto LABEL_10;
  }
  if (![v8 isEqual:@"AcceleratedChargingMode"])
  {
LABEL_10:
    double v17 = (double)0x384uLL;
    uint64_t v18 = 0;
    goto LABEL_11;
  }
  double v17 = (double)0x384uLL;
  uint64_t v18 = 33;
LABEL_11:
  v16 = +[_DASPolicyResponse policyResponseWithDecision:v18 validityDuration:v10 rationale:v17];
LABEL_13:

LABEL_14:

  return v16;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return [a3 isEqualToString:@"com.apple.das.cpm.modeChanged"] ^ 1;
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

- (_DASCPMModeMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end