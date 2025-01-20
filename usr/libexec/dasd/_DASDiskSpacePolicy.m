@interface _DASDiskSpacePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASDiskSpacePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASDiskSpacePolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 diskVolume];
  if (v4) {
    BOOL v5 = [v3 downloadSize] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (_DASDiskSpacePolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASDiskSpacePolicy;
  v2 = [(_DASDiskSpacePolicy *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Disk Space Policy";
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D5A0;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3D78 != -1) {
    dispatch_once(&qword_1001C3D78, block);
  }
  v2 = (void *)qword_1001C3D80;

  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  objc_super v6 = +[_DASDaemon sharedInstance];
  v7 = +[_DASDiskSpaceMonitor sharedMonitorWithDaemon:v6];

  LODWORD(v6) = [v7 isDiskSpaceAvailableForActivity:v5];
  v8 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  v9 = v8;
  double v10 = 1.0;
  if (v6)
  {
    uint64_t v11 = 0;
  }
  else
  {
    double v10 = 0.0;
    uint64_t v11 = 33;
  }
  [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"diskSpaceAvailable" withRequiredValue:1.0 withCurrentValue:v10];
  v12 = +[_DASPolicyResponse policyResponseWithDecision:v11 validityDuration:v9 rationale:(double)0x384uLL];

  return v12;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
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