@interface BundleSessionManager
- (_TtC8NewsFeed20BundleSessionManager)init;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)dealloc;
- (void)familySharingStatusDidChange;
- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
@end

@implementation BundleSessionManager

- (void)dealloc
{
  v2 = self;
  BundleSessionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20BundleSessionManager_featureAvailability);
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC8NewsFeed20BundleSessionManager)init
{
  result = (_TtC8NewsFeed20BundleSessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)familySharingStatusDidChange
{
  v2 = self;
  sub_1C02DEDC0();
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C02DEDC0();
}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  v3 = self;
  sub_1C02DEDC0();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C02DEFD4((uint64_t)&unk_1F1B99710, (uint64_t)&unk_1F1B99738, (uint64_t)&unk_1EA1994B0);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C02DEFD4((uint64_t)&unk_1F1B996C0, (uint64_t)&unk_1F1B996E8, (uint64_t)&unk_1EA199498);
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1C02DEFD4((uint64_t)&unk_1F1B99620, (uint64_t)&unk_1F1B99648, (uint64_t)&unk_1EA199448);
}

@end