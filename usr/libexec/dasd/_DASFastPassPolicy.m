@interface _DASFastPassPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)fastPassShallYield;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASFastPassPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)rationaleWithAllSystemConditions;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)makeDecisionBasedOnSystemConstraints;
- (void)setFastPassShallYield:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateFastPassShallYield:(BOOL)a3;
@end

@implementation _DASFastPassPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v4 = [v3 fastPass];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)policyInstance
{
  if (qword_1001C3E60 != -1) {
    dispatch_once(&qword_1001C3E60, &stru_100176338);
  }
  v2 = (void *)qword_1001C3E68;

  return v2;
}

- (_DASFastPassPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASFastPassPolicy;
  v2 = [(_DASFastPassPolicy *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Fast Pass Policy";

    v3->_fastPassShallYield = 0;
  }
  return v3;
}

- (void)updateFastPassShallYield:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    self->_fastPassShallYield = v3;
    if (v3)
    {
      dispatch_time_t v5 = dispatch_time(0, 900000000000);
      objc_super v6 = dispatch_get_global_queue(9, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100055B50;
      block[3] = &unk_1001754F8;
      block[4] = self;
      dispatch_after(v5, v6, block);
    }
  }
  else
  {
    v7 = +[_DASDaemonLogger logForCategory:@"fastpasspolicy"];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000F6088(v7);
    }
  }
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  int64_t v5 = [(_DASFastPassPolicy *)self makeDecisionBasedOnSystemConstraints];
  objc_super v6 = [(_DASFastPassPolicy *)self rationaleWithAllSystemConditions];
  v7 = +[_DASPolicyResponse policyResponseWithDecision:v5 validityDuration:v6 rationale:900.0];

  return v7;
}

- (int64_t)makeDecisionBasedOnSystemConstraints
{
  if (self->_fastPassShallYield) {
    return 100;
  }
  else {
    return 0;
  }
}

- (id)rationaleWithAllSystemConditions
{
  BOOL v3 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Fast Pass Policy"];
  v4 = v3;
  double v5 = 1.0;
  if (!self->_fastPassShallYield) {
    double v5 = 0.0;
  }
  [(_DASPolicyResponseRationale *)v3 addRationaleForCondition:@"fastPassShallYield" withRequiredValue:0.0 withCurrentValue:v5];

  return v4;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.001;
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (BOOL)fastPassShallYield
{
  return self->_fastPassShallYield;
}

- (void)setFastPassShallYield:(BOOL)a3
{
  self->_fastPassShallYield = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyName, 0);

  objc_storeStrong((id *)&self->_policyDescription, 0);
}

@end