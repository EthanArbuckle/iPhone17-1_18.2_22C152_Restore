@interface MTSleepCoordinatorStateMachine
- (BOOL)isUserAsleep;
- (MTSleepCoordinatorStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4;
- (MTSleepCoordinatorStateMachineAsleepState)asleepState;
- (MTSleepCoordinatorStateMachineAwakeState)awakeState;
- (MTSleepCoordinatorStateMachineDisabledState)disabledState;
- (id)currentDate;
- (id)sleepAlarm;
- (id)stateMachineLog;
- (unint64_t)sleepTimeOutMinutes;
- (void)setAsleepState:(id)a3;
- (void)setAwakeState:(id)a3;
- (void)setDisabledState:(id)a3;
- (void)stateMachine:(id)a3 dismissWakeUpAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)stateMachine:(id)a3 shouldScheduleAlarmTimeoutForSecondsFromNow:(double)a4;
- (void)stateMachineUserWentToBed:(id)a3;
- (void)stateMachineUserWokeUp:(id)a3;
- (void)updateState;
- (void)userBedTimeReached:(id)a3;
- (void)userWakeTimeReached:(id)a3;
- (void)userWakeUpAlarmFired;
- (void)userWentToBed;
- (void)userWokeUp;
- (void)wakeUpAlarmTimedOut;
@end

@implementation MTSleepCoordinatorStateMachine

- (MTSleepCoordinatorStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MTSleepCoordinatorStateMachine;
  v4 = [(MTStateMachine *)&v12 initWithDelegate:a3 infoProvider:a4];
  if (v4)
  {
    v5 = [(MTStateMachineState *)[MTSleepCoordinatorStateMachineAsleepState alloc] initWithStateMachine:v4];
    asleepState = v4->_asleepState;
    v4->_asleepState = v5;

    v7 = [(MTStateMachineState *)[MTSleepCoordinatorStateMachineAwakeState alloc] initWithStateMachine:v4];
    awakeState = v4->_awakeState;
    v4->_awakeState = v7;

    v9 = [(MTStateMachineState *)[MTSleepCoordinatorStateMachineDisabledState alloc] initWithStateMachine:v4];
    disabledState = v4->_disabledState;
    v4->_disabledState = v9;

    [(MTStateMachine *)v4 enterState:v4->_disabledState];
  }
  return v4;
}

- (BOOL)isUserAsleep
{
  v3 = [(MTStateMachine *)self currentState];
  v4 = [(MTSleepCoordinatorStateMachine *)self asleepState];
  if (v3 == v4)
  {
    char isKindOfClass = 1;
  }
  else
  {
    v5 = [(MTStateMachine *)self currentState];
    v6 = [(MTSleepCoordinatorStateMachine *)self asleepState];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)stateMachineLog
{
  return MTLogForCategory(7);
}

- (void)updateState
{
  id v2 = [(MTStateMachine *)self currentState];
  [v2 updateState];
}

- (void)userWentToBed
{
  id v2 = [(MTStateMachine *)self currentState];
  [v2 userWentToBed];
}

- (void)userWokeUp
{
  id v2 = [(MTStateMachine *)self currentState];
  [v2 userWokeUp];
}

- (void)userBedTimeReached:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachine *)self currentState];
  [v5 userBedTimeReached:v4];
}

- (void)userWakeTimeReached:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachine *)self currentState];
  [v5 userWakeTimeReached:v4];
}

- (void)userWakeUpAlarmFired
{
  id v2 = [(MTStateMachine *)self currentState];
  [v2 userWakeUpAlarmFired];
}

- (void)wakeUpAlarmTimedOut
{
  id v2 = [(MTStateMachine *)self currentState];
  [v2 wakeUpAlarmTimedOut];
}

- (id)sleepAlarm
{
  id v2 = [(MTStateMachine *)self infoProvider];
  v3 = [v2 sleepAlarm];

  return v3;
}

- (id)currentDate
{
  id v2 = [(MTStateMachine *)self infoProvider];
  v3 = [v2 currentDate];

  return v3;
}

- (unint64_t)sleepTimeOutMinutes
{
  id v2 = [(MTStateMachine *)self infoProvider];
  unint64_t v3 = [v2 sleepTimeOutMinutes];

  return v3;
}

- (void)stateMachineUserWokeUp:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachine *)self delegate];
  [v5 stateMachineUserWokeUp:v4];
}

- (void)stateMachineUserWentToBed:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachine *)self delegate];
  [v5 stateMachineUserWentToBed:v4];
}

- (void)stateMachine:(id)a3 dismissWakeUpAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MTStateMachine *)self delegate];
  [v10 stateMachine:v9 dismissWakeUpAlarm:v8 dismissAction:a5];
}

- (void)stateMachine:(id)a3 shouldScheduleAlarmTimeoutForSecondsFromNow:(double)a4
{
  id v6 = a3;
  id v7 = [(MTStateMachine *)self delegate];
  [v7 stateMachine:v6 shouldScheduleAlarmTimeoutForSecondsFromNow:a4];
}

- (MTSleepCoordinatorStateMachineAsleepState)asleepState
{
  return self->_asleepState;
}

- (void)setAsleepState:(id)a3
{
}

- (MTSleepCoordinatorStateMachineAwakeState)awakeState
{
  return self->_awakeState;
}

- (void)setAwakeState:(id)a3
{
}

- (MTSleepCoordinatorStateMachineDisabledState)disabledState
{
  return self->_disabledState;
}

- (void)setDisabledState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledState, 0);
  objc_storeStrong((id *)&self->_awakeState, 0);
  objc_storeStrong((id *)&self->_asleepState, 0);
}

@end