@interface DropboxBundleSubscriptionManager
- (BOOL)canGetAccessToItemPaid:(BOOL)a3 bundlePaid:(BOOL)a4 channel:(id)a5;
- (BOOL)canGetBundleSubscriptionToChannel:(id)a3;
- (BOOL)canGetSubscriptionToChannel:(id)a3;
- (BOOL)isPreparedForUse;
- (FCBundleSubscription)bundleSubscription;
- (FCBundleSubscription)cachedSubscription;
- (FCBundleSubscription)validatedCachedSubscription;
- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider;
- (NSSet)purchasedTagIDs;
- (_TtC18NewsScoringService32DropboxBundleSubscriptionManager)init;
- (id)bundleSubscriptionLookupEntry;
- (void)prepareForUseWithCompletion:(id)a3;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5;
- (void)setEntitlementsOverrideProvider:(id)a3;
@end

@implementation DropboxBundleSubscriptionManager

- (FCBundleSubscription)cachedSubscription
{
  v2 = self;
  id v3 = sub_10000B174();

  return (FCBundleSubscription *)v3;
}

- (FCBundleSubscription)bundleSubscription
{
  v2 = self;
  id v3 = sub_10000B174();

  return (FCBundleSubscription *)v3;
}

- (FCBundleSubscription)validatedCachedSubscription
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_lazyDropboxData);
  id v3 = (uint64_t *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_10000BDC8(v3, (uint64_t *)&v8);
  os_unfair_lock_unlock(v4);
  id v6 = [v8 bundleSubscription];

  swift_unknownObjectRelease();
  return (FCBundleSubscription *)v6;
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  uint64_t v2 = (void *)swift_unknownObjectRetain();
  return (FCEntitlementsOverrideProviderType *)v2;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_entitlementsOverrideProvider) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    id v6 = (void (**)(void, void))v5;
    id v8 = self;
    _Block_copy(v6);
    id v7 = sub_10000B174();
    ((void (**)(void, id))v6)[2](v6, v7);
    _Block_release(v6);

    _Block_release(v6);
  }
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  id v6 = _Block_copy(a5);
  if (v6)
  {
    id v7 = (void (**)(void, void))v6;
    v9 = self;
    _Block_copy(v7);
    id v8 = sub_10000B174();
    ((void (**)(void, id))v7)[2](v7, v8);
    _Block_release(v7);

    _Block_release(v7);
  }
}

- (id)bundleSubscriptionLookupEntry
{
  id result = (id)sub_10000C320();
  __break(1u);
  return result;
}

- (BOOL)canGetAccessToItemPaid:(BOOL)a3 bundlePaid:(BOOL)a4 channel:(id)a5
{
  BOOL result = sub_10000C320();
  __break(1u);
  return result;
}

- (BOOL)canGetSubscriptionToChannel:(id)a3
{
  BOOL result = sub_10000C320();
  __break(1u);
  return result;
}

- (BOOL)canGetBundleSubscriptionToChannel:(id)a3
{
  BOOL result = sub_10000C320();
  __break(1u);
  return result;
}

- (BOOL)isPreparedForUse
{
  return 1;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  v4 = (void (**)(const void *))_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    id v6 = v4[2];
    id v7 = self;
    v6(v5);
    _Block_release(v5);
  }
}

- (NSSet)purchasedTagIDs
{
  uint64_t v2 = self;
  sub_10000B924();

  v3.super.isa = sub_10000C240().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)v3.super.isa;
}

- (_TtC18NewsScoringService32DropboxBundleSubscriptionManager)init
{
  BOOL result = (_TtC18NewsScoringService32DropboxBundleSubscriptionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18NewsScoringService32DropboxBundleSubscriptionManager_todayDropbox));
  swift_release();
  swift_unknownObjectRelease();
}

@end