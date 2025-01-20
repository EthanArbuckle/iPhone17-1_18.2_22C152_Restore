@interface _DASInCarPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)inCarKeyPath;
- (_CDContextualKeyPath)navigationKeyPath;
- (_DASInCarPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setInCarKeyPath:(id)a3;
- (void)setNavigationKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASInCarPolicy

- (double)weightForActivity:(id)a3
{
  return 2.0;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 1;
}

- (id)initializeTriggers
{
  v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_inCarKeyPath];
  v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:self->_navigationKeyPath];
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.duetactivityscheduler.incarpolicy.incar";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100186DA8;
  v12[3] = &__kCFBooleanFalse;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  v13[0] = v5;
  v9[0] = @"identifier";
  v9[1] = @"predicate";
  v10[0] = @"com.apple.duetactivityscheduler.incarpolicy.nav";
  v10[1] = v4;
  v9[2] = @"deviceSet";
  v9[3] = @"mustWake";
  v10[2] = &off_100186DA8;
  v10[3] = &__kCFBooleanFalse;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  v13[1] = v6;
  v7 = +[NSArray arrayWithObjects:v13 count:2];

  return v7;
}

- (_DASInCarPolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DASInCarPolicy;
  v2 = [(_DASInCarPolicy *)&v12 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"In Car Policy";

    uint64_t v5 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/car/isConnected"];
    inCarKeyPath = v3->_inCarKeyPath;
    v3->_inCarKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/maps/navigationInProgress"];
    navigationKeyPath = v3->_navigationKeyPath;
    v3->_navigationKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = [(_DASInCarPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v9;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058848;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3EA0 != -1) {
    dispatch_once(&qword_1001C3EA0, block);
  }
  v2 = (void *)qword_1001C3EA8;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.incarpolicy.incar"])
  {
    uint64_t v8 = 32;
  }
  else
  {
    if (![v6 isEqualToString:@"com.apple.duetactivityscheduler.incarpolicy.nav"])
    {
      unsigned __int8 v10 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = 40;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:*(Class *)((char *)&self->super.isa + v8)];
  unsigned __int8 v10 = [v9 BOOLValue];

LABEL_7:
  return v10;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  inCarKeyPath = self->_inCarKeyPath;
  id v8 = a4;
  uint64_t v9 = [v8 objectForKeyedSubscript:inCarKeyPath];
  unsigned int v10 = [v9 BOOLValue];

  v11 = [v8 objectForKeyedSubscript:self->_navigationKeyPath];

  unsigned int v12 = [v11 BOOLValue];
  if ((v10 & 1) == 0 && (v12 & 1) == 0)
  {
    v13 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:0 rationale:(double)0x384uLL];
    goto LABEL_18;
  }
  unsigned int v14 = [v6 isIntensive];
  unsigned int v15 = [v6 requiresDeviceInactivity];
  v16 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"In Car Policy"];
  if (!v12)
  {
    double v18 = 1.0;
    if (v10)
    {
      v19 = +[NSPredicate predicateWithFormat:@"inCar == YES"];
      [(_DASPolicyResponseRationale *)v16 addRationaleWithCondition:v19];

      double v18 = 0.5;
      if (v14) {
        goto LABEL_9;
      }
    }
LABEL_16:
    uint64_t v25 = +[_DASPolicyResponse policyResponseWithScore:v16 validityDuration:v18 rationale:(double)0x384uLL];
    goto LABEL_17;
  }
  v17 = +[NSPredicate predicateWithFormat:@"navigationInProgress == YES"];
  [(_DASPolicyResponseRationale *)v16 addRationaleWithCondition:v17];

  if (!v14)
  {
    if (v15)
    {
      +[NSPredicate predicateWithFormat:@"requiresInactive == %u", 1];
      goto LABEL_15;
    }
    id v20 = [v6 schedulingPriority];
    double v18 = 0.1;
    if ((unint64_t)v20 < _DASSchedulingPriorityUtility)
    {
      v21 = [v6 startBefore];
      [v21 timeIntervalSinceNow];
      double v23 = v22;

      if (v23 > 0.0)
      {
        +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"priority == %llu && timeUntilDeadline > 0", [v6 schedulingPriority]);
        goto LABEL_15;
      }
    }
    goto LABEL_16;
  }
LABEL_9:
  +[NSPredicate predicateWithFormat:@"isIntensive == %u", 1];
  v24 = LABEL_15:;
  [(_DASPolicyResponseRationale *)v16 addRationaleWithCondition:v24];

  uint64_t v25 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v16 rationale:(double)0x384uLL];
LABEL_17:
  v13 = (void *)v25;

LABEL_18:

  return v13;
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

- (_CDContextualKeyPath)inCarKeyPath
{
  return self->_inCarKeyPath;
}

- (void)setInCarKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)navigationKeyPath
{
  return self->_navigationKeyPath;
}

- (void)setNavigationKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationKeyPath, 0);
  objc_storeStrong((id *)&self->_inCarKeyPath, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end