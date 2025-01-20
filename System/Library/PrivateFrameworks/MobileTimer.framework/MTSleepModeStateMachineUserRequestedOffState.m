@interface MTSleepModeStateMachineUserRequestedOffState
- (BOOL)isEqualToState:(id)a3;
- (MTSleepModeStateMachineUserRequestedOffState)initWithKeepOffUntilDate:(id)a3 stateMachine:(id)a4;
- (NSDate)keepOffUntilDate;
- (void)didEnterWithPreviousState:(id)a3;
- (void)setKeepOffUntilDate:(id)a3;
- (void)updateState:(BOOL)a3;
@end

@implementation MTSleepModeStateMachineUserRequestedOffState

- (MTSleepModeStateMachineUserRequestedOffState)initWithKeepOffUntilDate:(id)a3 stateMachine:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTSleepModeStateMachineUserRequestedOffState;
  v8 = [(MTStateMachineState *)&v11 initWithStateMachine:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_keepOffUntilDate, a3);
  }

  return v9;
}

- (BOOL)isEqualToState:(id)a3
{
  v4 = (MTSleepModeStateMachineUserRequestedOffState *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 {
         && [(MTSleepModeStateMachineUserRequestedOffState *)v4 isMemberOfClass:objc_opt_class()])
  }
  {
    v6 = [(MTSleepModeStateMachineUserRequestedOffState *)self keepOffUntilDate];
    id v7 = [(MTSleepModeStateMachineUserRequestedOffState *)v5 keepOffUntilDate];
    char v8 = [v6 isEqualToDate:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)didEnterWithPreviousState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (![(MTSleepModeStateMachineUserRequestedOffState *)self isEqualToState:a3])
  {
    v4 = [(MTStateMachineState *)self stateMachine];
    v5 = [(MTStateMachineState *)self stateMachine];
    int v6 = [v4 stateMachine:v5 disengageSleepModeUserRequested:1];

    if (v6)
    {
      id v7 = MTLogForCategory(7);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        v18 = @"sleep mode";
        _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling manual %{public}@ invalidation", (uint8_t *)&v15, 0x16u);
      }

      char v8 = [(MTStateMachineState *)self stateMachine];
      int v9 = [v8 isUserAsleep];

      v10 = MTLogForCategory(7);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          v12 = [(MTSleepModeStateMachineUserRequestedOffState *)self keepOffUntilDate];
          int v15 = 138543618;
          v16 = self;
          __int16 v17 = 2114;
          v18 = v12;
          _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Keeping off until: %{public}@", (uint8_t *)&v15, 0x16u);
        }
        v10 = [(MTStateMachineState *)self stateMachine];
        v13 = [(MTStateMachineState *)self stateMachine];
        v14 = [(MTSleepModeStateMachineUserRequestedOffState *)self keepOffUntilDate];
        [v10 stateMachine:v13 keepSleepModeOffUntilDate:v14];
      }
      else if (v11)
      {
        int v15 = 138543362;
        v16 = self;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Not in user sleep window", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

- (void)updateState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MTSleepModeStateMachineState *)self updateModeKeepOffUntilDateIfNecessary];
  v5 = [(MTStateMachineState *)self stateMachine];
  int v6 = [v5 currentDate];

  id v7 = [(MTStateMachineState *)self stateMachine];
  char v8 = [v7 keepOffUntilDate];

  if (v8 && ![v6 mtIsAfterDate:v8])
  {
    v10 = MTLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      int v15 = v8;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring updateState until keepOffUntilDate: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    int v9 = MTLogForCategory(7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      int v15 = v8;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ We are past keepOffUntilDate: %{public}@", buf, 0x16u);
    }

    v11.receiver = self;
    v11.super_class = (Class)MTSleepModeStateMachineUserRequestedOffState;
    [(MTSleepModeStateMachineState *)&v11 updateState:v3];
  }
}

- (NSDate)keepOffUntilDate
{
  return self->_keepOffUntilDate;
}

- (void)setKeepOffUntilDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end