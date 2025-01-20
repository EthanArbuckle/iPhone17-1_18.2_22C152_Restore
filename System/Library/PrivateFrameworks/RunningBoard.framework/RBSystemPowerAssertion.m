@interface RBSystemPowerAssertion
- (RBSystemPowerAssertion)init;
- (id)_preventIdleSleepIdentifiers;
- (int)_targetPid;
@end

@implementation RBSystemPowerAssertion

- (RBSystemPowerAssertion)init
{
  v6.receiver = self;
  v6.super_class = (Class)RBSystemPowerAssertion;
  v2 = [(RBPowerAssertion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    baseName = v2->super._baseName;
    v2->super._baseName = (NSString *)@"runningboardd.system";
  }
  return v3;
}

- (id)_preventIdleSleepIdentifiers
{
  return [(RBSystemState *)self->_state preventIdleSleepIdentifiers];
}

- (int)_targetPid
{
  int result = [(RBSystemState *)self->_state preventIdleSleep];
  if (result)
  {
    return getpid();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end