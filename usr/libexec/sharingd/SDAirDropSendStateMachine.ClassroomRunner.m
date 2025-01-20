@interface SDAirDropSendStateMachine.ClassroomRunner
- (void)operationEndedWithOperation:(id)a3;
- (void)operationMadeProgressWithOperation:(id)a3;
- (void)operationStartedWithOperation:(id)a3;
@end

@implementation SDAirDropSendStateMachine.ClassroomRunner

- (void)operationStartedWithOperation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10065D44C();
}

- (void)operationMadeProgressWithOperation:(id)a3
{
}

- (void)operationEndedWithOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner_sendOperationQueue));
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtCC16DaemoniOSLibrary25SDAirDropSendStateMachine15ClassroomRunner_sendContinuation, &qword_10096CCA0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end