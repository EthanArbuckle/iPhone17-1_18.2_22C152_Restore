@interface WFRunningProgressSuppressionStateMachine
- (WFRunningProgressSuppressionStateMachine)init;
- (WFRunningProgressSuppressionStateMachineDelegate)delegate;
- (void)decideRunningProgressIsAllowed:(BOOL)a3 withReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startedRunningAction:(id)a3 inShortcut:(id)a4;
- (void)startedRunningShortcut:(id)a3 withDialogAttribution:(id)a4;
@end

@implementation WFRunningProgressSuppressionStateMachine

- (WFRunningProgressSuppressionStateMachineDelegate)delegate
{
  v2 = (void *)sub_1C824FC80();
  return (WFRunningProgressSuppressionStateMachineDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C824FD2C();
}

- (WFRunningProgressSuppressionStateMachine)init
{
  return (WFRunningProgressSuppressionStateMachine *)RunningProgressSuppressionStateMachine.init()();
}

- (void)startedRunningShortcut:(id)a3 withDialogAttribution:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C8250084(v6, v7);
}

- (void)startedRunningAction:(id)a3 inShortcut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C82501E8(v6, v7);
}

- (void)decideRunningProgressIsAllowed:(BOOL)a3 withReason:(id)a4
{
  sub_1C8532658();
  id v6 = self;
  sub_1C8250670(a3);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1C7F782F8((uint64_t)self + OBJC_IVAR___WFRunningProgressSuppressionStateMachine_delegate);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFRunningProgressSuppressionStateMachine_initialDialogAttribution));
  swift_release();
}

@end