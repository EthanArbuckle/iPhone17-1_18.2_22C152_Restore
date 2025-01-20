@interface _DASEnvironmentalPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASEnvironmentalPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASEnvironmentalPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if (([v3 backlogged] & 1) != 0 || !objc_msgSend(v3, "requiresPlugin"))
  {
    BOOL v5 = 0;
  }
  else
  {
    id v4 = [v3 schedulingPriority];
    BOOL v5 = (unint64_t)v4 <= _DASSchedulingPriorityBackground;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 2.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForPluginStatus];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.environmentpolicy.ispluggedin";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186C28;
  v8[3] = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  BOOL v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASEnvironmentalPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASEnvironmentalPolicy;
  v2 = [(_DASEnvironmentalPolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Environmental Policy";

    uint64_t v5 = [(_DASEnvironmentalPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004857C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3CF8 != -1) {
    dispatch_once(&qword_1001C3CF8, block);
  }
  v2 = (void *)qword_1001C3D00;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Environmental Policy"];
  if (!+[_DASConfig hasRecentlyUpdated])
  {
    v6 = +[_DASGridDataManager sharedInstance];
    if ([v6 isHighCarbonImpactWindow])
    {
      v7 = [v4 startDate];

      if (!v7)
      {
        if (!+[_DASActivityDurationTracker shouldTrackActivity:](_DASActivityDurationTracker, "shouldTrackActivity:", v4)|| (+[_DASActivityDurationTracker sharedInstance](_DASActivityDurationTracker, "sharedInstance"), objc_super v8 = [(_DASPolicyResponseRationale *)v5 addRationaleForCondition:@"isInHighCarbonImpactWindow" withRequiredValue:0.0 withCurrentValue:1.0];
        {
          uint64_t v10 = 33;
          goto LABEL_9;
        }
        [(_DASPolicyResponseRationale *)v5 addRationaleForCondition:@"hadEnoughRuntime" withRequiredValue:1.0 withCurrentValue:0.0];
      }
    }
    else
    {
    }
  }
  uint64_t v10 = 0;
LABEL_9:
  v11 = +[_DASPolicyResponse policyResponseWithDecision:v10 validityDuration:v5 rationale:(double)0x384uLL];

  return v11;
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