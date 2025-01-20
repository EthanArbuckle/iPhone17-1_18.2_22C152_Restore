@interface JSApplicationMessageTarget
- (NSString)targetIdentifier;
- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5;
- (void)setTargetIdentifier:(id)a3;
@end

@implementation JSApplicationMessageTarget

- (NSString)targetIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTargetIdentifier:(id)a3
{
  uint64_t v4 = sub_AB6510();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_targetIdentifier);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  uint64_t *v7 = v4;
  v7[1] = v6;
  v10 = self;
  sub_9919C0(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_995A10(a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_priorityMessage);
}

@end