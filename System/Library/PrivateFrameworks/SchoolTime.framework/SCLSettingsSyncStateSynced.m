@interface SCLSettingsSyncStateSynced
- (unint64_t)status;
- (void)didEnterWithPreviousState:(id)a3;
- (void)settingsDidChange;
@end

@implementation SCLSettingsSyncStateSynced

- (void)didEnterWithPreviousState:(id)a3
{
  v4 = [(SCLSettingsSyncState *)self stateMachine];
  v5 = [v4 context];
  [v5 setError:0];

  v6 = [(SCLSettingsSyncState *)self stateMachine];
  v7 = [v6 context];
  [v7 setMessageIdentifier:0];

  v8 = [(SCLSettingsSyncState *)self stateMachine];
  v9 = [v8 context];
  [v9 clearRecoveryHistory];

  id v10 = [(SCLSettingsSyncState *)self stateMachine];
  [v10 cancelRetryActivity];
}

- (unint64_t)status
{
  return 0;
}

- (void)settingsDidChange
{
  id v5 = [(SCLSettingsSyncState *)self stateMachine];
  v3 = [(SCLSettingsSyncState *)self stateMachine];
  v4 = [v3 pendingSendState];
  [v5 transitionToState:v4];
}

@end