@interface HDSPSleepScheduleStateCoordinatorInitialState
- (id)stateName;
- (unint64_t)scheduleState;
- (void)updateStateForcibly:(BOOL)a3;
@end

@implementation HDSPSleepScheduleStateCoordinatorInitialState

- (id)stateName
{
  return @"Initial";
}

- (unint64_t)scheduleState
{
  return 0;
}

- (void)updateStateForcibly:(BOOL)a3
{
  v4 = [(HKSPStateMachineState *)self stateMachine];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__HDSPSleepScheduleStateCoordinatorInitialState_updateStateForcibly___block_invoke;
  v6[3] = &unk_2645D90C0;
  v6[4] = self;
  v5 = +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:5];
  [v4 perform:v6 withContext:v5];
}

id __69__HDSPSleepScheduleStateCoordinatorInitialState_updateStateForcibly___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HDSPSleepScheduleStateCoordinatorInitialState;
  return objc_msgSendSuper2(&v2, sel_updateStateForcibly_, 1);
}

@end