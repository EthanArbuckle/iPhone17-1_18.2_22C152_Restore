@interface JSSubscriptionStatusCoordinator
- (void)dealloc;
@end

@implementation JSSubscriptionStatusCoordinator

- (void)dealloc
{
  v2 = self;
  JSSubscriptionStatusCoordinator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSubscriptionStatusCoordinator_lastKnownSubscriptionStatusResponse));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore31JSSubscriptionStatusCoordinator_subscriptionRequestTimeout));
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSSubscriptionStatusCoordinator____lazy_storage___signpost;

  sub_A6F0C8((uint64_t)v3);
}

@end