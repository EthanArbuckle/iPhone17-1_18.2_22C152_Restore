@interface SWSystemSleepMonitorAggregateState
- (BOOL)hasSleepBeenRequested;
- (BOOL)isAwakeOrAbortingSleep;
- (BOOL)isSleepImminent;
- (SWSystemSleepMonitorAggregateState)initWithSleepMonitorState:(unint64_t)a3 stateTimestamp:(unint64_t)a4 powerManagementPhase:(unint64_t)a5 phaseTimestamp:(unint64_t)a6;
- (id)description;
- (id)descriptionForTimestamp:(unint64_t)a3;
- (unint64_t)powerManagementPhase;
- (unint64_t)powerManagementPhaseTimestamp;
- (unint64_t)sleepMonitorState;
- (unint64_t)sleepMonitorStateTimestamp;
@end

@implementation SWSystemSleepMonitorAggregateState

- (SWSystemSleepMonitorAggregateState)initWithSleepMonitorState:(unint64_t)a3 stateTimestamp:(unint64_t)a4 powerManagementPhase:(unint64_t)a5 phaseTimestamp:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SWSystemSleepMonitorAggregateState;
  result = [(SWSystemSleepMonitorAggregateState *)&v11 init];
  if (result)
  {
    result->_sleepMonitorState = a3;
    result->_sleepMonitorStateTimestamp = a4;
    result->_powerManagementPhase = a5;
    result->_powerManagementPhaseTimestamp = a6;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = mach_continuous_time();
  return [(SWSystemSleepMonitorAggregateState *)self descriptionForTimestamp:v3];
}

- (id)descriptionForTimestamp:(unint64_t)a3
{
  v5 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__SWSystemSleepMonitorAggregateState_descriptionForTimestamp___block_invoke;
  v9[3] = &unk_264139960;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  unint64_t v12 = a3;
  [v6 appendProem:0 block:v9];
  v7 = [v6 description];

  return v7;
}

id __62__SWSystemSleepMonitorAggregateState_descriptionForTimestamp___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8) - 1;
  if (v3 > 4) {
    v4 = @"waking";
  }
  else {
    v4 = off_264139AD0[v3];
  }
  [v2 appendString:v4 withName:@"SWSleepState"];
  v5 = *(void **)(a1 + 32);
  BSTimeDifferenceFromMachTimeToMachTime();
  id v6 = (id)objc_msgSend(v5, "appendTimeInterval:withName:decomposeUnits:", 0, 0);
  v7 = *(void **)(a1 + 32);
  v8 = NSStringForSWSystemSleepPowerManagementPhase(*(void *)(*(void *)(a1 + 40) + 24));
  [v7 appendString:v8 withName:@"phase"];

  v9 = *(void **)(a1 + 32);
  BSTimeDifferenceFromMachTimeToMachTime();
  return (id)objc_msgSend(v9, "appendTimeInterval:withName:decomposeUnits:", 0, 0);
}

- (BOOL)hasSleepBeenRequested
{
  return self->_sleepMonitorState > 2;
}

- (BOOL)isSleepImminent
{
  return self->_sleepMonitorState > 3;
}

- (BOOL)isAwakeOrAbortingSleep
{
  return self->_sleepMonitorState < 3;
}

- (unint64_t)sleepMonitorState
{
  return self->_sleepMonitorState;
}

- (unint64_t)sleepMonitorStateTimestamp
{
  return self->_sleepMonitorStateTimestamp;
}

- (unint64_t)powerManagementPhase
{
  return self->_powerManagementPhase;
}

- (unint64_t)powerManagementPhaseTimestamp
{
  return self->_powerManagementPhaseTimestamp;
}

@end