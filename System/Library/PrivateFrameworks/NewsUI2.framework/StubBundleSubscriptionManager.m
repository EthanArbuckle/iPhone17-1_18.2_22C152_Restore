@interface StubBundleSubscriptionManager
- (FCBundleSubscription)bundleSubscription;
- (FCBundleSubscription)cachedSubscription;
- (FCBundleSubscription)validatedCachedSubscription;
- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider;
- (id)bundleSubscriptionLookupEntry;
- (void)prepareForUseWithCompletion:(id)a3;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5;
- (void)setEntitlementsOverrideProvider:(id)a3;
@end

@implementation StubBundleSubscriptionManager

- (FCBundleSubscription)cachedSubscription
{
  return (FCBundleSubscription *)*(id *)self->cachedSubscription;
}

- (FCBundleSubscription)bundleSubscription
{
  return (FCBundleSubscription *)*(id *)self->bundleSubscription;
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  v2 = (void *)swift_unknownObjectRetain();
  return (FCEntitlementsOverrideProviderType *)v2;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  *(void *)self->entitlementsOverrideProvider = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (FCBundleSubscription)validatedCachedSubscription
{
  return (FCBundleSubscription *)*(id *)self->cachedSubscription;
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  v5 = (void (**)(const void *, uint64_t))_Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)self->bundleSubscription;
    v8 = v5[2];
    swift_retain();
    v8(v6, v7);
    _Block_release(v6);
    swift_release();
  }
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  v6 = (void (**)(const void *, uint64_t))_Block_copy(a5);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)self->bundleSubscription;
    v9 = v6[2];
    swift_retain();
    v9(v7, v8);
    _Block_release(v7);
    swift_release();
  }
}

- (id)bundleSubscriptionLookupEntry
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F7E2C8]), sel_init);
  return v2;
}

- (void)prepareForUseWithCompletion:(id)a3
{
  v3 = (void (**)(const void *))_Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    v5 = v3[2];
    swift_retain();
    v5(v4);
    _Block_release(v4);
    swift_release();
  }
}

@end