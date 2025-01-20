@interface BundlePurchasePrewarmer
- (_TtC16NewsSubscription23BundlePurchasePrewarmer)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
@end

@implementation BundlePurchasePrewarmer

- (_TtC16NewsSubscription23BundlePurchasePrewarmer)init
{
  result = (_TtC16NewsSubscription23BundlePurchasePrewarmer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (void)networkReachabilityDidChange:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  if (objc_msgSend(a3, sel_isNetworkReachable))
  {
    sub_1BFB3D574();
    swift_unknownObjectRelease();

    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BFB3D574();

  swift_release();
}

@end