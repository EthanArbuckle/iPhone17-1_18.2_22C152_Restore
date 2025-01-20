@interface NewsUserProfileShim
- (FCBundleSubscription)bundleSubscription;
- (NSSet)purchasedTagIDs;
- (_TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim)init;
- (void)prepareForUseWithCompletion:(id)a3;
@end

@implementation NewsUserProfileShim

- (_TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim)init
{
  result = (_TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->userProfile[OBJC_IVAR____TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim_userProfile
                                       + 24]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSSet)purchasedTagIDs
{
  uint64_t v2 = sub_1AFFC8E38();
  sub_1AFD764F4(v2);
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1AFFCB348();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (FCBundleSubscription)bundleSubscription
{
  return (FCBundleSubscription *)objc_retainAutoreleaseReturnValue(*(id *)&self->userProfile[OBJC_IVAR____TtC10StocksCoreP33_6F15235305946077A82EB95D8E9A724719NewsUserProfileShim_userProfile
                                                                                           + 24]);
}

- (void)prepareForUseWithCompletion:(id)a3
{
  v4 = (void (**)(const void *))_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = v4[2];
    v7 = self;
    v6(v5);
    _Block_release(v5);
  }
}

@end