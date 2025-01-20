@interface RunningProgressSuppressionStateMachine.State
- (BOOL)canTransitionToState:(id)a3;
- (BOOL)shouldStartTimer;
- (NSString)description;
- (_TtCC11WorkflowKit38RunningProgressSuppressionStateMachineP33_D75DF74A866BF93BDD94A2803CD087FC5State)init;
- (double)timeoutDuration;
- (void)cancel;
@end

@implementation RunningProgressSuppressionStateMachine.State

- (BOOL)canTransitionToState:(id)a3
{
  return sub_1C824F30C() & 1;
}

- (BOOL)shouldStartTimer
{
  return sub_1C824F388();
}

- (double)timeoutDuration
{
  return sub_1C824F3C8();
}

- (void)cancel
{
  v2 = self;
  sub_1C824F3F4();
}

- (NSString)description
{
  v2 = self;
  sub_1C824F4E4();

  v3 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtCC11WorkflowKit38RunningProgressSuppressionStateMachineP33_D75DF74A866BF93BDD94A2803CD087FC5State)init
{
}

- (void).cxx_destruct
{
}

@end