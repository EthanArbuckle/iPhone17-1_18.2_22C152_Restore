@interface _DASMotionStatePolicy
+ (id)initializeTriggers;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASMotionStatePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASMotionStatePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 motionState];
  if (v4 == (id)_DASMotionStateAny)
  {
    id v5 = [v3 schedulingPriority];
    if ((unint64_t)v5 >= _DASSchedulingPriorityUserInitiated)
    {
      unsigned __int8 v6 = 0;
      goto LABEL_8;
    }
    if (([v3 requiresNetwork] & 1) == 0
      && ([v3 isIntensive] & 1) == 0)
    {
      unsigned __int8 v6 = [v3 requiresSignificantUserInactivity];
      goto LABEL_8;
    }
  }
  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

+ (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForMotionState];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.motionstatepolicy.motionstatechange";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186DF0;
  v8[3] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASMotionStatePolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASMotionStatePolicy;
  v2 = [(_DASMotionStatePolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Motion State Policy";

    uint64_t v5 = +[_DASMotionStatePolicy initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CBBC;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3F48 != -1) {
    dispatch_once(&qword_1001C3F48, block);
  }
  v2 = (void *)qword_1001C3F50;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[_CDContextQueries keyPathForMotionState];
  objc_super v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [v8 integerValue];
  v10 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Motion State Policy"];
  v11 = +[NSNumber numberWithInteger:v9];
  v12 = +[NSPredicate predicateWithFormat:@"motionState = %@", v11];
  [(_DASPolicyResponseRationale *)v10 addRationaleWithCondition:v12];

  id v13 = [v5 motionState];
  if (v13 != (id)_DASMotionStateAny)
  {
    if (v9 == [v5 motionState]) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = 33;
    }
    double v20 = (double)0x384uLL;
    goto LABEL_15;
  }
  if (v9 == v13 || v9 == (id)_DASMotionStateStationary) {
    goto LABEL_14;
  }
  v14 = [v5 startBefore];
  [v14 timeIntervalSinceNow];
  double v16 = v15;

  if (v16 <= 0.0
    || ([v5 isIntensive] & 1) == 0
    && ![v5 requiresSignificantUserInactivity])
  {
    if ([v5 requiresNetwork])
    {
      v22 = +[NSPredicate predicateWithFormat:@"requiresNetwork == YES"];
      [(_DASPolicyResponseRationale *)v10 addRationaleWithCondition:v22];

      uint64_t v23 = +[_DASPolicyResponse policyResponseWithScore:v10 validityDuration:0.1 rationale:(double)0x384uLL];
      goto LABEL_16;
    }
LABEL_14:
    double v20 = (double)0x384uLL;
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 requiresSignificantUserInactivity]);
  v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isIntensive]);
  v19 = +[NSPredicate predicateWithFormat:@"requiresSignificantUserInactivity == %@ AND isIntensive == %@", v17, v18];
  [(_DASPolicyResponseRationale *)v10 addRationaleWithCondition:v19];

  double v20 = (double)0x384uLL;
  uint64_t v21 = 33;
LABEL_15:
  uint64_t v23 = +[_DASPolicyResponse policyResponseWithDecision:v21 validityDuration:v10 rationale:v20];
LABEL_16:
  v24 = (void *)v23;

  return v24;
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

- (NSArray)triggers
{
  return self->_triggers;
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