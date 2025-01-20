@interface _DASPeakPowerPressurePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isUnderPeakPowerPressureWithContext:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)peakPowerPressureKeyPath;
- (_DASPeakPowerPressurePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPeakPowerPressureKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASPeakPowerPressurePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:_DASCTSBypassPeakPowerPressureKey];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v3 schedulingPriority];
    BOOL v7 = (unint64_t)v8 < _DASSchedulingPriorityUserInitiated;
  }

  return v7;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000843C4;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4210 != -1) {
    dispatch_once(&qword_1001C4210, block);
  }
  v2 = (void *)qword_1001C4218;

  return v2;
}

- (_DASPeakPowerPressurePolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASPeakPowerPressurePolicy;
  v2 = [(_DASPeakPowerPressurePolicy *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Peak Power Pressure Policy";

    uint64_t v5 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/system/peakPowerPressureLevel"];
    peakPowerPressureKeyPath = v3->_peakPowerPressureKeyPath;
    v3->_peakPowerPressureKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = [(_DASPeakPowerPressurePolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;
  }
  return v3;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_peakPowerPressureKeyPath];
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.peakpowerpressurepolicy.peakpowerpressurechange";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100187060;
  v7[3] = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  id v8 = v3;
  v4 = +[NSArray arrayWithObjects:&v8 count:1];

  return v4;
}

- (BOOL)isUnderPeakPowerPressureWithContext:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:self->_peakPowerPressureKeyPath];
  BOOL v4 = [v3 integerValue] != 0;

  return v4;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.peakpowerpressurepolicy.peakpowerpressurechange"])BOOL v7 = -[_DASPeakPowerPressurePolicy isUnderPeakPowerPressureWithContext:](self, "isUnderPeakPowerPressureWithContext:", v6); {
  else
  }
    BOOL v7 = 0;

  return v7;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a4;
  id v6 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Peak Power Pressure Policy"];
  LODWORD(self) = [(_DASPeakPowerPressurePolicy *)self isUnderPeakPowerPressureWithContext:v5];

  if (self)
  {
    BOOL v7 = +[NSPredicate predicateWithFormat:@"peakPowerPressure == %@", &__kCFBooleanTrue];
    [(_DASPolicyResponseRationale *)v6 addRationaleWithCondition:v7];

    uint64_t v8 = 100;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = +[_DASPolicyResponse policyResponseWithDecision:v8 validityDuration:v6 rationale:(double)0x384uLL];

  return v9;
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

- (_CDContextualKeyPath)peakPowerPressureKeyPath
{
  return self->_peakPowerPressureKeyPath;
}

- (void)setPeakPowerPressureKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peakPowerPressureKeyPath, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end