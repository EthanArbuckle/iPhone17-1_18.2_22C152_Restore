@interface _DASActivityRateLimitPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASActivityRateLimitPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASActivityRateLimitPolicy

- (BOOL)appliesToActivity:(id)a3
{
  v3 = [a3 rateLimitConfigurationName];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)initializeTriggers
{
  CFStringRef v8 = @"identifier";
  CFStringRef v9 = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  v2 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v10[0] = v2;
  CFStringRef v6 = @"identifier";
  CFStringRef v7 = @"com.apple.das.lpmchange";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v10[1] = v3;
  BOOL v4 = +[NSArray arrayWithObjects:v10 count:2];

  return v4;
}

- (_DASActivityRateLimitPolicy)init
{
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityRateLimitPolicy;
  v2 = [(_DASActivityRateLimitPolicy *)&v9 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"ActivityRateLimitPolicy";

    policyDescription = v3->_policyDescription;
    v3->_policyDescription = (NSString *)@"Blocks rate limited activities if rate limit configuration group is at capacity.";

    uint64_t v6 = [(_DASActivityRateLimitPolicy *)v3 initializeTriggers];
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v6;
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001C3C30 != -1) {
    dispatch_once(&qword_1001C3C30, &stru_100175F18);
  }
  v2 = (void *)qword_1001C3C38;

  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  CFStringRef v7 = [v5 rateLimitConfigurationName];
  if (v7 && ([v5 startDate], CFStringRef v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    v10 = +[_DASActivityRateLimitManager sharedLimiter];
    v11 = [v10 evaluateRateLimitedActivity:v5];

    v12 = [v11 maxedRateLimits];
    id v13 = [v12 count];

    if (v13)
    {
      [(_DASPolicyResponseRationale *)v6 addRationaleForCondition:@"ratelimited" withRequiredValue:1.0 withCurrentValue:0.0];
      uint64_t v14 = 33;
    }
    else
    {
      uint64_t v14 = 0;
    }
    objc_super v9 = +[_DASPolicyResponse policyResponseWithDecision:v14 validityDuration:v6 rationale:(double)0x384uLL];
  }
  else
  {
    objc_super v9 = +[_DASPolicyResponse policyResponseWithDecision:0 validityDuration:v6 rationale:(double)0x384uLL];
  }

  return v9;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((([v5 isEqualToString:@"com.apple.das.lpmchange"] & 1) != 0
     || [v5 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])&& !+[_DASRateLimiterUtilities consideredInLPMWithState:](_DASRateLimiterUtilities, "consideredInLPMWithState:", v6))
  {
    CFStringRef v8 = +[_DASActivityRateLimitManager sharedLimiter];
    [v8 recalculateStartDates];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
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