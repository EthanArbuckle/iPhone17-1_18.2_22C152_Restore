@interface SubscriptionActivationEligibilityProvider
- (_TtC16NewsSubscription41SubscriptionActivationEligibilityProvider)init;
- (int64_t)eligibility;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SubscriptionActivationEligibilityProvider

- (int64_t)eligibility
{
  v2 = self;
  int64_t v3 = sub_1BFB12B14();

  return v3;
}

- (void)addObserver:(id)a3
{
  sub_1BFB135F8();
  swift_allocObject();
  swift_unknownObjectRetain_n();
  v4 = self;
  sub_1BFBD2A58();
  v5 = (Class *)((char *)&v4->super.isa
               + OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_observers);
  uint64_t v6 = swift_beginAccess();
  MEMORY[0x1C18BB940](v6);
  if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1BFBD4878();
  }
  sub_1BFBD4888();
  sub_1BFBD4838();
  swift_endAccess();
  swift_unknownObjectRelease();
}

- (void)removeObserver:(id)a3
{
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16NewsSubscription41SubscriptionActivationEligibilityProvider_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1BFB136B8(v7, (uint64_t)a3);
  swift_bridgeObjectRelease();
  uint64_t *v5 = v8;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC16NewsSubscription41SubscriptionActivationEligibilityProvider)init
{
  result = (_TtC16NewsSubscription41SubscriptionActivationEligibilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end