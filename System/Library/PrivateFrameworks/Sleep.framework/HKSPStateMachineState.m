@interface HKSPStateMachineState
- (BOOL)_willEnter;
- (BOOL)isCurrentState;
- (BOOL)isEqual:(id)a3;
- (HKSPStateMachine)stateMachine;
- (HKSPStateMachineState)initWithStateMachine:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)equalsBuilderWithObject:(id)a3;
- (id)stateIdentifier;
- (id)stateName;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setStateMachine:(id)a3;
@end

@implementation HKSPStateMachineState

- (HKSPStateMachineState)initWithStateMachine:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSPStateMachineState;
  v5 = [(HKSPStateMachineState *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_stateMachine, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)isCurrentState
{
  v2 = self;
  v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 currentState];
  LOBYTE(v2) = v4 == v2;

  return (char)v2;
}

- (BOOL)_willEnter
{
  return 1;
}

- (HKSPStateMachine)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);
  return (HKSPStateMachine *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (id)stateName
{
  return &stru_1EFE54160;
}

- (id)stateIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPStateMachineState *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HKSPStateMachineState *)self equalsBuilderWithObject:v4];
      char v6 = [v5 isEqual];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = [(HKSPStateMachineState *)self stateMachine];
  objc_storeWeak(v4 + 1, v5);

  return v4;
}

- (id)equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  char v6 = [(HKSPStateMachineState *)self stateName];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HKSPStateMachineState_equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E5D32588;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  return v5;
}

uint64_t __49__HKSPStateMachineState_equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stateName];
}

- (NSString)description
{
  return (NSString *)[(HKSPStateMachineState *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(HKSPStateMachineState *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(HKSPStateMachineState *)self stateName];
  [v3 appendString:v4 withName:@"stateName"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPStateMachineState *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
}

@end