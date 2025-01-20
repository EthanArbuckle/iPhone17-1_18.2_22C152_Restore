@interface HDSPEnvironmentStateMachine
- (BOOL)isSystemReady;
- (BOOL)needsDataMigration;
- (HDSPEnvironmentDemoState)demoState;
- (HDSPEnvironmentMigrationState)migrationState;
- (HDSPEnvironmentNotReadyState)notReadyState;
- (HDSPEnvironmentReadyState)readyState;
- (HDSPEnvironmentStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4;
- (unint64_t)loggingCategory;
- (void)dataMigrationDidComplete;
- (void)environmentDidBecomeReady;
- (void)environmentShouldMigrateData;
- (void)systemDidBecomeReady;
@end

@implementation HDSPEnvironmentStateMachine

- (HDSPEnvironmentStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDSPEnvironmentStateMachine;
  v4 = [(HKSPStateMachine *)&v15 initWithDelegate:a3 infoProvider:a4];
  if (v4)
  {
    v5 = [(HKSPStateMachineState *)[HDSPEnvironmentNotReadyState alloc] initWithStateMachine:v4];
    notReadyState = v4->_notReadyState;
    v4->_notReadyState = v5;

    v7 = [(HKSPStateMachineState *)[HDSPEnvironmentMigrationState alloc] initWithStateMachine:v4];
    migrationState = v4->_migrationState;
    v4->_migrationState = v7;

    v9 = [(HKSPStateMachineState *)[HDSPEnvironmentReadyState alloc] initWithStateMachine:v4];
    readyState = v4->_readyState;
    v4->_readyState = v9;

    v11 = [(HKSPStateMachineState *)[HDSPEnvironmentDemoState alloc] initWithStateMachine:v4];
    demoState = v4->_demoState;
    v4->_demoState = v11;

    [(HKSPStateMachine *)v4 setInitialState:v4->_notReadyState];
    v13 = v4;
  }

  return v4;
}

- (unint64_t)loggingCategory
{
  return 3;
}

- (void)systemDidBecomeReady
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 systemDidBecomeReady];
}

- (void)dataMigrationDidComplete
{
  id v2 = [(HKSPStateMachine *)self currentState];
  [v2 dataMigrationDidComplete];
}

- (void)environmentShouldMigrateData
{
}

uint64_t __59__HDSPEnvironmentStateMachine_environmentShouldMigrateData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 environmentShouldMigrateData];
}

- (void)environmentDidBecomeReady
{
}

uint64_t __56__HDSPEnvironmentStateMachine_environmentDidBecomeReady__block_invoke(uint64_t a1, void *a2)
{
  return [a2 environmentDidBecomeReady];
}

- (BOOL)isSystemReady
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 isSystemReady];

  return v3;
}

- (BOOL)needsDataMigration
{
  id v2 = [(HKSPStateMachine *)self infoProvider];
  char v3 = [v2 needsDataMigration];

  return v3;
}

- (HDSPEnvironmentNotReadyState)notReadyState
{
  return self->_notReadyState;
}

- (HDSPEnvironmentMigrationState)migrationState
{
  return self->_migrationState;
}

- (HDSPEnvironmentReadyState)readyState
{
  return self->_readyState;
}

- (HDSPEnvironmentDemoState)demoState
{
  return self->_demoState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoState, 0);
  objc_storeStrong((id *)&self->_readyState, 0);
  objc_storeStrong((id *)&self->_migrationState, 0);

  objc_storeStrong((id *)&self->_notReadyState, 0);
}

@end