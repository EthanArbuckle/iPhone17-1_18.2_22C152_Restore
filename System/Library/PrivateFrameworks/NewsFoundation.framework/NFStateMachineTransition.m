@interface NFStateMachineTransition
- (NFStateMachine)stateMachine;
- (NFStateMachineContextType)context;
- (NFStateMachineEvent)event;
- (NFStateMachineState)fromState;
- (NFStateMachineState)toState;
- (NFStateMachineTransition)initWithStateMachine:(id)a3 event:(id)a4 fromState:(id)a5 toState:(id)a6 context:(id)a7;
- (id)description;
- (void)setContext:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFromState:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setToState:(id)a3;
@end

@implementation NFStateMachineTransition

- (NFStateMachineTransition)initWithStateMachine:(id)a3 event:(id)a4 fromState:(id)a5 toState:(id)a6 context:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NFStateMachineTransition;
  v17 = [(NFStateMachineTransition *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_stateMachine, a3);
    objc_storeStrong((id *)&v18->_event, a4);
    objc_storeStrong((id *)&v18->_fromState, a5);
    objc_storeStrong((id *)&v18->_toState, a6);
    objc_storeStrong((id *)&v18->_context, a7);
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NFStateMachineTransition *)self event];
  v5 = [(NFStateMachineTransition *)self fromState];
  v6 = [(NFStateMachineTransition *)self toState];
  v7 = [(NFStateMachineTransition *)self context];
  v8 = [v3 stringWithFormat:@"{%p event=%@, fromState=%@, toState=%@, context=%@}", self, v4, v5, v6, v7];

  return v8;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NFStateMachineEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NFStateMachineState)fromState
{
  return self->_fromState;
}

- (void)setFromState:(id)a3
{
}

- (NFStateMachineState)toState
{
  return self->_toState;
}

- (void)setToState:(id)a3
{
}

- (NFStateMachineContextType)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_toState, 0);
  objc_storeStrong((id *)&self->_fromState, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end