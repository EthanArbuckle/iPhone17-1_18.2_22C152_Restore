@interface MTStateMachine
- (MTStateMachine)initWithDelegate:(id)a3;
- (MTStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4;
- (MTStateMachineDelegate)delegate;
- (MTStateMachineInfoProvider)infoProvider;
- (MTStateMachineState)currentState;
- (NSString)description;
- (id)stateMachineLog;
- (id)stateMachineName;
- (void)enterState:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInfoProvider:(id)a3;
@end

@implementation MTStateMachine

- (MTStateMachine)initWithDelegate:(id)a3
{
  return [(MTStateMachine *)self initWithDelegate:a3 infoProvider:0];
}

- (MTStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTStateMachine;
  v8 = [(MTStateMachine *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_infoProvider, v7);
  }

  return v9;
}

- (void)enterState:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MTStateMachine *)self currentState];

  if (v5 != v4)
  {
    id v6 = [(MTStateMachine *)self stateMachineLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(MTStateMachine *)self stateMachineName];
      currentState = self->_currentState;
      int v12 = 138543874;
      v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2114;
      v17 = currentState;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will enter state %@ with previous state %{public}@", (uint8_t *)&v12, 0x20u);
    }
    v9 = [(MTStateMachine *)self currentState];
    [(MTStateMachineState *)v9 willExitWithNextState:v4];
    [v4 willEnterWithPreviousState:v9];
    [(MTStateMachine *)self setCurrentState:v4];
    [(MTStateMachineState *)v9 didExitWithNextState:v4];
    [v4 didEnterWithPreviousState:v9];
    v10 = [(MTStateMachine *)self stateMachineLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v11 = [(MTStateMachine *)self stateMachineName];
      int v12 = 138543874;
      v13 = v11;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did enter state %{public}@ with previous state %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (id)stateMachineLog
{
  return MTLogForCategory(0);
}

- (id)stateMachineName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)MTStateMachine;
  v3 = [(MTStateMachine *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  id v5 = [(MTStateMachine *)self currentState];
  [v4 appendFormat:@"; currentState: %@>", v5];

  return (NSString *)v4;
}

- (MTStateMachineState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (MTStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTStateMachineInfoProvider)infoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_infoProvider);
  return (MTStateMachineInfoProvider *)WeakRetained;
}

- (void)setInfoProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_infoProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
}

@end