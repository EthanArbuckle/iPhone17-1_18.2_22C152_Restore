@interface _DASPowerNapPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASPowerNapPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASPowerNapPolicy

- (_DASPowerNapPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASPowerNapPolicy;
  v2 = [(_DASPowerNapPolicy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Power Nap Policy";
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061A50;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3FB8 != -1) {
    dispatch_once(&qword_1001C3FB8, block);
  }
  v2 = (void *)qword_1001C3FC0;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4 = a3;
  v5 = +[_DASDaemon sharedInstance];
  objc_super v6 = +[_DASSleepWakeMonitor sharedMonitorWithDaemon:v5];

  v7 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Power Nap Policy"];
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 inADarkWake]);
  v9 = +[NSPredicate predicateWithFormat:@"inADarkWake == %@", v8];
  [(_DASPolicyResponseRationale *)v7 addRationaleWithCondition:v9];

  if (([v4 darkWakeEligible] & 1) != 0
    && [v4 beforeDaysFirstActivity])
  {
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 beforeDaysFirstActivity]);
    +[NSPredicate predicateWithFormat:@"appRefresh == %@", v10];
  }
  else
  {
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 darkWakeEligible]);
    +[NSPredicate predicateWithFormat:@"darkWakeEligible == %@", v10];
  v11 = };
  [(_DASPolicyResponseRationale *)v7 addRationaleWithCondition:v11];

  if (([v6 canRunInCurrentWakeState:v4] & 1) == 0)
  {
    v14 = [v6 wakeStateDescription];
    if (v14)
    {
      v15 = +[NSPredicate predicateWithFormat:@"wakeState == (%@)", v14];
      [(_DASPolicyResponseRationale *)v7 addRationaleWithCondition:v15];
    }
    goto LABEL_12;
  }
  if ([v4 darkWakeEligible])
  {
    if (([v4 beforeDaysFirstActivity] & 1) == 0)
    {
      v12 = [v4 name];
      unsigned int v13 = [v6 hasFinishedRunningSinceLastWake:v12];

      if (v13)
      {
        v14 = +[NSPredicate predicateWithFormat:@"runSinceLastWake == YES"];
        [(_DASPolicyResponseRationale *)v7 addRationaleWithCondition:v14];
LABEL_12:

        uint64_t v16 = 33;
        goto LABEL_14;
      }
    }
  }
  uint64_t v16 = 0;
LABEL_14:
  v17 = +[_DASPolicyResponse policyResponseWithDecision:v16 validityDuration:v7 rationale:(double)0x384uLL];

  return v17;
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