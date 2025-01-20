@interface EngagementMessageTarget
- (BOOL)shouldBeNotifiedOfNilPriorityMessageAfterRegistration;
- (NSString)targetIdentifier;
- (_TtC9SeymourUI23EngagementMessageTarget)init;
- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5;
@end

@implementation EngagementMessageTarget

- (_TtC9SeymourUI23EngagementMessageTarget)init
{
  result = (_TtC9SeymourUI23EngagementMessageTarget *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23EngagementMessageTarget_onBannerUpdate));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI23EngagementMessageTarget_onBannerRemoval);

  sub_239C25118(v3);
}

- (NSString)targetIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  uint64_t v8 = sub_23A7FF988();
  unint64_t v10 = v9;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  sub_23A1787FC(a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (BOOL)shouldBeNotifiedOfNilPriorityMessageAfterRegistration
{
  return 1;
}

@end