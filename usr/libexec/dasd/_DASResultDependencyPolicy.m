@interface _DASResultDependencyPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASActivityDependencyManager)dependencyManager;
- (_DASResultDependencyPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setDependencyManager:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASResultDependencyPolicy

- (BOOL)appliesToActivity:(id)a3
{
  return [(_DASActivityDependencyManager *)self->_dependencyManager isDependentActivity:a3];
}

+ (id)policyInstance
{
  if (qword_1001C3BA0 != -1) {
    dispatch_once(&qword_1001C3BA0, &stru_100175A68);
  }
  v2 = (void *)qword_1001C3BA8;

  return v2;
}

- (_DASResultDependencyPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASResultDependencyPolicy;
  v2 = [(_DASResultDependencyPolicy *)&v8 init];
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Result Dependency Policy";

    uint64_t v5 = +[_DASActivityDependencyManager sharedInstance];
    dependencyManager = v3->_dependencyManager;
    v3->_dependencyManager = (_DASActivityDependencyManager *)v5;
  }
  return v3;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  BOOL v5 = -[_DASActivityDependencyManager areDependenciesSatisfiedFor:](self->_dependencyManager, "areDependenciesSatisfiedFor:", a3, a4);
  v6 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:self->_policyName];
  if (v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 100;
  }
  objc_super v8 = +[NSNumber numberWithBool:v5];
  v9 = +[NSPredicate predicateWithFormat:@"dependencySatisfaction == %@", v8];
  [(_DASPolicyResponseRationale *)v6 addRationaleWithCondition:v9];

  v10 = +[_DASPolicyResponse policyResponseWithDecision:v7 validityDuration:v6 rationale:(double)0x384uLL];

  return v10;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
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

- (_DASActivityDependencyManager)dependencyManager
{
  return self->_dependencyManager;
}

- (void)setDependencyManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyManager, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyName, 0);

  objc_storeStrong((id *)&self->_policyDescription, 0);
}

@end