@interface _DASRemoteDeviceNearbyPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASRemoteDeviceNearbyPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASRemoteDeviceNearbyPolicy

- (BOOL)appliesToActivity:(id)a3
{
  return [a3 targetDevice] == (id)3;
}

- (_DASRemoteDeviceNearbyPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASRemoteDeviceNearbyPolicy;
  v2 = [(_DASRemoteDeviceNearbyPolicy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Remote Device Nearby Policy";
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F0B60;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4570 != -1) {
    dispatch_once(&qword_1001C4570, block);
  }
  v2 = (void *)qword_1001C4578;

  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  v5 = [a3 remoteDevice];
  objc_super v6 = +[_DASDaemon sharedInstance];
  v7 = +[_DASRemoteDeviceNearbyMonitor sharedMonitorWithDaemon:v6];

  LODWORD(v6) = [v7 isRemoteDeviceNearby:v5];
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
  [(_DASPolicyResponseRationale *)v8 addRationaleForCondition:@"remoteDeviceNearby" withRequiredValue:1.0 withCurrentValue:v10];
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