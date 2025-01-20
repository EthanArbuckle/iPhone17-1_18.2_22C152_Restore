@interface _DASCPUUsagePolicy
+ (id)initializeTriggers;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASCPUUsagePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASCPUUsagePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated
    || ([v3 triggersRestart] & 1) != 0
    || ([v3 isIntensive] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7 = [v3 startBefore];
    [v7 timeIntervalSinceNow];
    BOOL v5 = v8 >= 0.0;
  }
  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

+ (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForCPUUsageLevel];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186D00;
  v8[3] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  BOOL v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASCPUUsagePolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASCPUUsagePolicy;
  v2 = [(_DASCPUUsagePolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"CPU Usage Policy";

    uint64_t v5 = +[_DASCPUUsagePolicy initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3D68 != -1) {
    dispatch_once(&qword_1001C3D68, &stru_100176220);
  }
  v2 = (void *)qword_1001C3D70;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange"])
  {
    v6 = +[_CDContextQueries keyPathForCPUUsageLevel];
    v7 = [v5 objectForKeyedSubscript:v6];
    id v8 = [v7 integerValue];

    BOOL v9 = v8 != (id)qword_1001C45A8;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  BOOL v9 = [v6 startDate];
  [v9 timeIntervalSinceNow];
  double v11 = v10;

  if (v11 < 0.0)
  {
    double v12 = (double)0x384uLL;
    uint64_t v13 = 0;
LABEL_15:
    v18 = v8;
    goto LABEL_16;
  }
  v14 = +[_CDContextQueries keyPathForCPUUsageLevel];
  v15 = [v7 objectForKeyedSubscript:v14];
  id v16 = [v15 integerValue];

  unsigned int v17 = +[_DASDeviceActivityPolicy isDeviceInUse:v7];
  if ((v17 & 1) == 0 && +[_DASPhotosPolicy isiCPLActivity:v6])
  {
    double v12 = (double)0x384uLL;
    uint64_t v13 = 0;
    v18 = 0;
LABEL_16:
    uint64_t v24 = +[_DASPolicyResponse policyResponseWithDecision:v13 validityDuration:v18 rationale:v12];
    goto LABEL_17;
  }
  uint64_t v19 = qword_1001C45A8;
  id v20 = [v6 schedulingPriority];
  if ((unint64_t)v20 <= _DASSchedulingPriorityBackground)
  {
    v23 = (uint64_t *)&unk_1001C2C08;
    if (!v17) {
      v23 = &qword_1001C2C18;
    }
    unint64_t v22 = *v23;
  }
  else
  {
    id v21 = [v6 schedulingPriority];
    if ((unint64_t)v21 <= _DASSchedulingPriorityDefault) {
      unint64_t v22 = qword_1001C2C18;
    }
    else {
      unint64_t v22 = v19;
    }
  }
  if ((unint64_t)v16 > v22)
  {
    [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"Max allowed CPU Usage level" withRequiredValue:(double)v22 withCurrentValue:(double)(uint64_t)v16];
    double v12 = (double)0x384uLL;
    uint64_t v13 = 33;
    goto LABEL_15;
  }
  double v27 = (double)(100 - (uint64_t)v16) / 100.0;
  v28 = +[NSNumber numberWithInteger:v16];
  v29 = +[NSPredicate predicateWithFormat:@"cpuLevel == %@", v28];
  [(_DASPolicyResponseRationale *)v8 addRationaleWithCondition:v29];

  uint64_t v24 = +[_DASPolicyResponse policyResponseWithScore:v8 validityDuration:v27 rationale:(double)0x384uLL];
LABEL_17:
  v25 = (void *)v24;

  return v25;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end