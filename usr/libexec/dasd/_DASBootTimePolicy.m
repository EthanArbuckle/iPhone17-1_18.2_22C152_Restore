@interface _DASBootTimePolicy
+ (id)getDeviceBootTime;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)didExceedMinDurationAfterBoot;
- (BOOL)didExceedMinDurationAfterBootNetworkActivites;
- (BOOL)didExceedMinDurationAfterBootNonRepeatingNonDiscretionary;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSDate)bootTime;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASBootTimePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setBootTime:(id)a3;
- (void)setDidExceedMinDurationAfterBoot:(BOOL)a3;
- (void)setDidExceedMinDurationAfterBootNetworkActivites:(BOOL)a3;
- (void)setDidExceedMinDurationAfterBootNonRepeatingNonDiscretionary:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASBootTimePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 fastPass];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v3 schedulingPriority];
    BOOL v5 = (unint64_t)v6 < _DASSchedulingPriorityUserInitiated;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (_DASBootTimePolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASBootTimePolicy;
  v2 = [(_DASBootTimePolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Boot Time Policy";

    uint64_t v5 = +[_DASBootTimePolicy getDeviceBootTime];
    bootTime = v3->_bootTime;
    v3->_bootTime = (NSDate *)v5;

    *(_WORD *)&v3->_didExceedMinDurationAfterBoot = 0;
    v3->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = 0;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3CE0 != -1) {
    dispatch_once(&qword_1001C3CE0, &stru_100176110);
  }
  v2 = (void *)qword_1001C3CE8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

+ (id)getDeviceBootTime
{
  v2 = (void *)qword_1001C3CF0;
  if (!qword_1001C3CF0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    *(void *)v9 = 0x1500000001;
    size_t v8 = 16;
    if (sysctl(v9, 2u, &v6, &v8, 0, 0) != -1)
    {
      uint64_t v3 = +[NSDate dateWithTimeIntervalSince1970:(double)(int)v7 / 1000000.0 + (double)v6];
      v4 = (void *)qword_1001C3CF0;
      qword_1001C3CF0 = v3;
    }
    v2 = (void *)qword_1001C3CF0;
  }

  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  if (!self->_bootTime)
  {
    uint64_t v7 = +[_DASBootTimePolicy getDeviceBootTime];
    bootTime = self->_bootTime;
    self->_bootTime = v7;
  }
  id v9 = [v5 schedulingPriority];
  if ((unint64_t)v9 >= _DASSchedulingPriorityUtility)
  {
    [v5 interval];
    BOOL v10 = v11 == 0.0;
  }
  else
  {
    BOOL v10 = 0;
  }
  unsigned int v12 = [v5 requiresNetwork];
  if (!self->_bootTime
    || self->_didExceedMinDurationAfterBoot
    || (unsigned int v16 = v12) != 0 && self->_didExceedMinDurationAfterBootNetworkActivites
    || v10 && self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary)
  {
    uint64_t v13 = 0;
    goto LABEL_9;
  }
  v17 = +[NSDate date];
  [v17 timeIntervalSinceDate:self->_bootTime];
  double v19 = v18;

  if (v19 >= -15.0) {
    double v20 = v19;
  }
  else {
    double v20 = 301.0;
  }
  double v21 = 120.0;
  if (!v16) {
    double v21 = 300.0;
  }
  if (v10) {
    double v21 = 15.0;
  }
  if (v20 > 300.0)
  {
    self->_didExceedMinDurationAfterBoot = 1;
LABEL_29:
    self->_didExceedMinDurationAfterBootNetworkActivites = 1;
    goto LABEL_30;
  }
  if (v20 > 120.0) {
    char v22 = v16;
  }
  else {
    char v22 = 0;
  }
  if (v22) {
    goto LABEL_29;
  }
  if (v20 <= 15.0 || !v10)
  {
    uint64_t v13 = 33;
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v13 = 0;
  self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = 1;
LABEL_31:
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v6, "addRationaleForCondition:withRequiredValue:withCurrentValue:", @"Minimum seconds after boot", v21);
LABEL_9:
  v14 = +[_DASPolicyResponse policyResponseWithDecision:v13 validityDuration:v6 rationale:(double)0x384uLL];

  return v14;
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

- (NSDate)bootTime
{
  return self->_bootTime;
}

- (void)setBootTime:(id)a3
{
}

- (BOOL)didExceedMinDurationAfterBoot
{
  return self->_didExceedMinDurationAfterBoot;
}

- (void)setDidExceedMinDurationAfterBoot:(BOOL)a3
{
  self->_didExceedMinDurationAfterBoot = a3;
}

- (BOOL)didExceedMinDurationAfterBootNetworkActivites
{
  return self->_didExceedMinDurationAfterBootNetworkActivites;
}

- (void)setDidExceedMinDurationAfterBootNetworkActivites:(BOOL)a3
{
  self->_didExceedMinDurationAfterBootNetworkActivites = a3;
}

- (BOOL)didExceedMinDurationAfterBootNonRepeatingNonDiscretionary
{
  return self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary;
}

- (void)setDidExceedMinDurationAfterBootNonRepeatingNonDiscretionary:(BOOL)a3
{
  self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootTime, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end