@interface SCLSettingsSyncState
- (SCLSettingsSyncState)initWithStateMachine:(id)a3;
- (SCLSettingsSyncStateMachine)stateMachine;
- (unint64_t)status;
- (void)setStateMachine:(id)a3;
- (void)settingsDidChange;
- (void)significantUserInteractionOccurred;
@end

@implementation SCLSettingsSyncState

- (SCLSettingsSyncState)initWithStateMachine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCLSettingsSyncState;
  v5 = [(SCLSettingsSyncState *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_stateMachine, v4);
  }

  return v6;
}

- (void)settingsDidChange
{
  id v3 = [(SCLSettingsSyncState *)self stateMachine];
  v2 = [v3 context];
  [v2 clearRecoveryHistory];
}

- (void)significantUserInteractionOccurred
{
  id v3 = [(SCLSettingsSyncState *)self stateMachine];
  v2 = [v3 context];
  [v2 clearRecoveryHistory];
}

- (unint64_t)status
{
  return self->_status;
}

- (SCLSettingsSyncStateMachine)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);
  return (SCLSettingsSyncStateMachine *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end