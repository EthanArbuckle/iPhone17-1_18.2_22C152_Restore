@interface _DASCallInProgressPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASCallInProgressPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASCallInProgressPolicy

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
  v2 = +[_CDContextQueries keyPathForCallInProgressStatus];
  v3 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v2];

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.callinprogresspolicy.callinprogress";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100186CD0;
  v8[3] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v9 = v4;
  v5 = +[NSArray arrayWithObjects:&v9 count:1];

  return v5;
}

- (_DASCallInProgressPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASCallInProgressPolicy;
  v2 = [(_DASCallInProgressPolicy *)&v8 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Call In Progress Policy";

    uint64_t v5 = [(_DASCallInProgressPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C6C8;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3D48 != -1) {
    dispatch_once(&qword_1001C3D48, block);
  }
  v2 = (void *)qword_1001C3D50;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.callinprogresspolicy.callinprogress"])
  {
    v6 = +[_CDContextQueries keyPathForCallInProgressStatus];
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
  v7 = +[_CDContextQueries keyPathForCallInProgressStatus];
  unsigned __int8 v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [v8 BOOLValue];
  v10 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Call In Progress Policy"];
  v11 = +[NSNumber numberWithBool:v9];
  v12 = +[NSPredicate predicateWithFormat:@"callInProgress = %@", v11];
  [(_DASPolicyResponseRationale *)v10 addRationaleWithCondition:v12];

  double v13 = 1.0;
  if (v9)
  {
    if ((objc_msgSend(v5, "requiresDeviceInactivity", 1.0) & 1) != 0
      || [v5 requestsApplicationLaunch])
    {
      uint64_t v14 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v10 rationale:(double)0x384uLL];
      goto LABEL_7;
    }
    double v13 = 0.1;
  }
  uint64_t v14 = +[_DASPolicyResponse policyResponseWithScore:v10 validityDuration:v13 rationale:(double)0x384uLL];
LABEL_7:
  v15 = (void *)v14;

  return v15;
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