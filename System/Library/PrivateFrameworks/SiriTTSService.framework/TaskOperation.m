@interface TaskOperation
- (NSString)description;
- (_TtC14SiriTTSService13TaskOperation)init;
- (void)cancel;
- (void)main;
@end

@implementation TaskOperation

- (void)main
{
  v2 = self;
  sub_19CDE30B8();
}

- (void)cancel
{
  v2 = self;
  sub_19CDE34C4();
}

- (NSString)description
{
  v2 = self;
  sub_19CDE3728();

  v3 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC14SiriTTSService13TaskOperation)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14SiriTTSService13TaskOperation_workflowError);
  uint64_t v4 = *(uint64_t *)((char *)&self->super._iop.__prevOp + OBJC_IVAR____TtC14SiriTTSService13TaskOperation_workflowError);
  uint64_t v5 = *(uint64_t *)((char *)&self->super._iop.__nextOp + OBJC_IVAR____TtC14SiriTTSService13TaskOperation_workflowError);
  sub_19CDCA2BC(v3, v4, v5);
}

@end