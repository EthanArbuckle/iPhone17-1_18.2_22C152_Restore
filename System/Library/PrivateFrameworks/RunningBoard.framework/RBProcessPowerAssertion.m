@interface RBProcessPowerAssertion
- (id)_preventIdleSleepIdentifiers;
- (id)initWithProcess:(id *)a1;
- (int)_targetPid;
@end

@implementation RBProcessPowerAssertion

- (int)_targetPid
{
  if (!self->_process || ![(RBProcessState *)self->_state preventIdleSleep]) {
    return 0;
  }
  process = self->_process;
  return [(RBProcess *)process rbs_pid];
}

- (id)_preventIdleSleepIdentifiers
{
  return [(RBProcessState *)self->_state preventIdleSleepIdentifiers];
}

- (id)initWithProcess:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)RBProcessPowerAssertion;
    v5 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 7, a2);
      v6 = [a1[7] identity];
      uint64_t v7 = [v6 shortDescription];
      id v8 = a1[4];
      a1[4] = (id)v7;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end