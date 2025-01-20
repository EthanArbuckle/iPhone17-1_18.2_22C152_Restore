@interface MTSleepModeStateMachine
- (BOOL)isSleepModeEnabled:(BOOL *)a3;
- (BOOL)isUserAsleep;
- (BOOL)stateMachine:(id)a3 disengageSleepModeUserRequested:(BOOL)a4;
- (BOOL)stateMachine:(id)a3 engageSleepModeUntilDate:(id)a4 userEngaged:(BOOL)a5;
- (MTSleepModeStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4;
- (MTSleepModeStateMachineInitialState)initialState;
- (MTSleepModeStateMachineOffState)offState;
- (MTSleepModeStateMachineWaitingState)waitingState;
- (id)currentDate;
- (id)keepOffUntilDate;
- (id)onStateWithSleepModeEndDate:(id)a3;
- (id)sleepAlarm;
- (id)stateMachineLog;
- (id)userRequestedOffStateWithKeepOffUntilDate:(id)a3;
- (void)sleepModeEnabled:(BOOL)a3 userRequested:(BOOL)a4 date:(id)a5;
- (void)stateMachine:(id)a3 keepSleepModeOffUntilDate:(id)a4;
- (void)stateMachine:(id)a3 scheduleUpdateForSecondsFromNow:(double)a4;
- (void)stateMachineClearKeepSleepModeOff:(id)a3;
- (void)updateState:(BOOL)a3;
- (void)userWokeUp;
@end

@implementation MTSleepModeStateMachine

- (MTSleepModeStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MTSleepModeStateMachine;
  v4 = [(MTStateMachine *)&v12 initWithDelegate:a3 infoProvider:a4];
  if (v4)
  {
    v5 = [(MTStateMachineState *)[MTSleepModeStateMachineInitialState alloc] initWithStateMachine:v4];
    initialState = v4->_initialState;
    v4->_initialState = v5;

    v7 = [(MTStateMachineState *)[MTSleepModeStateMachineOffState alloc] initWithStateMachine:v4];
    offState = v4->_offState;
    v4->_offState = v7;

    v9 = [(MTStateMachineState *)[MTSleepModeStateMachineWaitingState alloc] initWithStateMachine:v4];
    waitingState = v4->_waitingState;
    v4->_waitingState = v9;

    [(MTStateMachine *)v4 enterState:v4->_initialState];
  }
  return v4;
}

- (id)onStateWithSleepModeEndDate:(id)a3
{
  id v4 = a3;
  v5 = [[MTSleepModeStateMachineOnState alloc] initWithSleepModeEndDate:v4 stateMachine:self];

  return v5;
}

- (id)userRequestedOffStateWithKeepOffUntilDate:(id)a3
{
  id v4 = a3;
  v5 = [[MTSleepModeStateMachineUserRequestedOffState alloc] initWithKeepOffUntilDate:v4 stateMachine:self];

  return v5;
}

- (id)stateMachineLog
{
  return MTLogForCategory(7);
}

- (void)updateState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTStateMachine *)self currentState];
  [v4 updateState:v3];
}

- (void)sleepModeEnabled:(BOOL)a3 userRequested:(BOOL)a4 date:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(MTStateMachine *)self currentState];
  [v9 sleepModeEnabled:v6 userRequested:v5 date:v8];
}

- (void)userWokeUp
{
  id v2 = [(MTStateMachine *)self currentState];
  [v2 userWokeUp];
}

- (id)sleepAlarm
{
  id v2 = [(MTStateMachine *)self infoProvider];
  BOOL v3 = [v2 sleepAlarm];

  return v3;
}

- (id)currentDate
{
  id v2 = [(MTStateMachine *)self infoProvider];
  BOOL v3 = [v2 currentDate];

  return v3;
}

- (BOOL)isSleepModeEnabled:(BOOL *)a3
{
  id v4 = [(MTStateMachine *)self infoProvider];
  LOBYTE(a3) = [v4 isSleepModeEnabled:a3];

  return (char)a3;
}

- (id)keepOffUntilDate
{
  id v2 = [(MTStateMachine *)self infoProvider];
  BOOL v3 = [v2 keepOffUntilDate];

  return v3;
}

- (BOOL)isUserAsleep
{
  id v2 = [(MTStateMachine *)self infoProvider];
  char v3 = [v2 isUserAsleep];

  return v3;
}

- (BOOL)stateMachine:(id)a3 engageSleepModeUntilDate:(id)a4 userEngaged:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(MTStateMachine *)self delegate];
  LOBYTE(v5) = [v10 stateMachine:v9 engageSleepModeUntilDate:v8 userEngaged:v5];

  return v5;
}

- (BOOL)stateMachine:(id)a3 disengageSleepModeUserRequested:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = [(MTStateMachine *)self delegate];
  LOBYTE(v4) = [v7 stateMachine:v6 disengageSleepModeUserRequested:v4];

  return v4;
}

- (void)stateMachine:(id)a3 keepSleepModeOffUntilDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTStateMachine *)self delegate];
  [v8 stateMachine:v7 keepSleepModeOffUntilDate:v6];
}

- (void)stateMachineClearKeepSleepModeOff:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStateMachine *)self delegate];
  [v5 stateMachineClearKeepSleepModeOff:v4];
}

- (void)stateMachine:(id)a3 scheduleUpdateForSecondsFromNow:(double)a4
{
  id v6 = a3;
  id v7 = [(MTStateMachine *)self delegate];
  [v7 stateMachine:v6 scheduleUpdateForSecondsFromNow:a4];
}

- (MTSleepModeStateMachineInitialState)initialState
{
  return self->_initialState;
}

- (MTSleepModeStateMachineOffState)offState
{
  return self->_offState;
}

- (MTSleepModeStateMachineWaitingState)waitingState
{
  return self->_waitingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingState, 0);
  objc_storeStrong((id *)&self->_offState, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
}

@end