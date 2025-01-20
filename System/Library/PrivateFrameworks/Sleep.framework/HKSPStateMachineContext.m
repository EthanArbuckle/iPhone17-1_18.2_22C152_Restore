@interface HKSPStateMachineContext
- (BOOL)hasStateTransition;
- (BOOL)hasStateTransitionAndNotInitializing;
- (BOOL)hasStateTransitionOrInitializing;
- (BOOL)isInitializing;
- (HKSPStateMachineContext)contextWithNextState:(id)a3 previousState:(id)a4 isInitializing:(BOOL)a5;
- (HKSPStateMachineContext)initWithNextState:(id)a3 previousState:(id)a4 isInitializing:(BOOL)a5;
- (HKSPStateMachineState)nextState;
- (HKSPStateMachineState)previousState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setIsInitializing:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setPreviousState:(id)a3;
@end

@implementation HKSPStateMachineContext

- (HKSPStateMachineContext)initWithNextState:(id)a3 previousState:(id)a4 isInitializing:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPStateMachineContext;
  v11 = [(HKSPStateMachineContext *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_nextState, a3);
    objc_storeStrong((id *)&v12->_previousState, a4);
    v12->_isInitializing = a5;
    v13 = v12;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIsInitializing:", -[HKSPStateMachineContext isInitializing](self, "isInitializing"));
  v5 = [(HKSPStateMachineContext *)self nextState];
  [v4 setNextState:v5];

  v6 = [(HKSPStateMachineContext *)self previousState];
  [v4 setPreviousState:v6];

  return v4;
}

- (HKSPStateMachineContext)contextWithNextState:(id)a3 previousState:(id)a4 isInitializing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[(HKSPStateMachineContext *)self copy];
  [v10 setNextState:v9];

  [v10 setPreviousState:v8];
  [v10 setIsInitializing:v5];
  return (HKSPStateMachineContext *)v10;
}

- (BOOL)hasStateTransition
{
  nextState = self->_nextState;
  if (nextState && self->_previousState) {
    return [(HKSPStateMachineState *)nextState isMemberOfClass:objc_opt_class()] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)hasStateTransitionAndNotInitializing
{
  BOOL v3 = [(HKSPStateMachineContext *)self hasStateTransition];
  if (v3) {
    LOBYTE(v3) = !self->_isInitializing;
  }
  return v3;
}

- (BOOL)hasStateTransitionOrInitializing
{
  return [(HKSPStateMachineContext *)self hasStateTransition] || self->_isInitializing;
}

- (id)description
{
  return [(HKSPStateMachineContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(HKSPStateMachineContext *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[HKSPStateMachineContext isInitializing](self, "isInitializing"), @"isInitializing", 1);
  BOOL v5 = [(HKSPStateMachineContext *)self nextState];
  id v6 = (id)[v3 appendObject:v5 withName:@"nextState"];

  v7 = [(HKSPStateMachineContext *)self previousState];
  id v8 = (id)[v3 appendObject:v7 withName:@"previousState"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(HKSPStateMachineContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (void)setIsInitializing:(BOOL)a3
{
  self->_isInitializing = a3;
}

- (HKSPStateMachineState)nextState
{
  return self->_nextState;
}

- (void)setNextState:(id)a3
{
}

- (HKSPStateMachineState)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end