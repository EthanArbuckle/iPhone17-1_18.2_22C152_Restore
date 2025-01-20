@interface MTStateMachineState
- (MTStateMachine)stateMachine;
- (MTStateMachineState)initWithStateMachine:(id)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation MTStateMachineState

- (MTStateMachineState)initWithStateMachine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTStateMachineState;
  v5 = [(MTStateMachineState *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_stateMachine, v4);
  }

  return v6;
}

- (MTStateMachine)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);
  return (MTStateMachine *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end