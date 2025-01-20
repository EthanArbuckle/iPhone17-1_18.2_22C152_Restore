@interface _DASCarPlayPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASCarPlayPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASCarPlayPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (id)initializeTriggers
{
  v2 = +[_CDContextQueries keyPathForCarplayConnectedStatus];
  id v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.carplaypolicy.carplayconnected";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186CE8;
  v8[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASCarPlayPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASCarPlayPolicy;
  v2 = [(_DASCarPlayPolicy *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Carplay Connected Policy";

    uint64_t v5 = [(_DASCarPlayPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CBE4;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3D58 != -1) {
    dispatch_once(&qword_1001C3D58, block);
  }
  v2 = (void *)qword_1001C3D60;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.carplaypolicy.carplayconnected"])
  {
    v6 = +[_CDContextQueries keyPathForCarplayConnectedStatus];
    v7 = [v5 objectForKeyedSubscript:v6];
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[_CDContextQueries keyPathForCarplayConnectedStatus];
  unsigned __int8 v8 = [v6 objectForKeyedSubscript:v7];
  unsigned int v9 = [v8 BOOLValue];

  v10 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Carplay Connected Policy"];
  if (!v9) {
    goto LABEL_5;
  }
  v11 = +[NSNumber numberWithBool:1];
  v12 = +[NSPredicate predicateWithFormat:@"carplayConnected = %@", v11];
  [(_DASPolicyResponseRationale *)v10 addRationaleWithCondition:v12];

  if (([v5 requiresDeviceInactivity] & 1) != 0
    || (+[_DASThermalPolicy policyInstance],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 thermalPressureWithState:v6],
        v13,
        v14 >= 0x14))
  {
    uint64_t v15 = 33;
  }
  else
  {
LABEL_5:
    uint64_t v15 = 0;
  }
  v16 = +[_DASPolicyResponse policyResponseWithDecision:v15 validityDuration:v10 rationale:(double)0x384uLL];

  return v16;
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