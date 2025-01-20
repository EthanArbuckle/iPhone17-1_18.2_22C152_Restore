@interface _DASGroupSchedulingPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASGroupSchedulingPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASGroupSchedulingPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 groupName];
  if (v4)
  {
    id v5 = [v3 schedulingPriority];
    BOOL v6 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiatedOvercommit;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 0.5;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (_DASGroupSchedulingPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASGroupSchedulingPolicy;
  v2 = [(_DASGroupSchedulingPolicy *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Activity Group Policy";
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058360;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3E90 != -1) {
    dispatch_once(&qword_1001C3E90, block);
  }
  v2 = (void *)qword_1001C3E98;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4 = a3;
  id v5 = +[_DASDaemon sharedInstance];
  objc_super v6 = [v4 groupName];
  uint64_t v7 = (uint64_t)[v5 additionalCapacityForActivity:v4 inGroupWithName:v6 shouldTryToSuspend:1];

  if (v7 < 1)
  {
    v9 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Activity Group Policy"];
    v10 = +[NSPredicate predicateWithFormat:@"%@.currentAvailableLimit == %ld", v6, v7];
    [(_DASPolicyResponseRationale *)v9 addRationaleWithCondition:v10];

    v8 = +[_DASPolicyResponse policyResponseWithDecision:33 validityDuration:v9 rationale:(double)0x384uLL];
  }
  else
  {
    v8 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:0 rationale:(double)0x384uLL];
  }

  return v8;
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