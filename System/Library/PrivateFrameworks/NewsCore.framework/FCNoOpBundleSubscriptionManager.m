@interface FCNoOpBundleSubscriptionManager
- (FCBundleSubscription)bundleSubscription;
- (FCBundleSubscription)cachedSubscription;
- (FCBundleSubscription)validatedCachedSubscription;
- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider;
- (FCNoOpBundleSubscriptionManager)init;
- (id)bundleSubscriptionLookupEntry;
- (void)prepareForUseWithCompletion:(id)a3;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4;
- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5;
- (void)setEntitlementsOverrideProvider:(id)a3;
@end

@implementation FCNoOpBundleSubscriptionManager

- (FCNoOpBundleSubscriptionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)FCNoOpBundleSubscriptionManager;
  v2 = [(FCNoOpBundleSubscriptionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[FCBundleSubscription subscriptionWithSubscriptionState:3 bundleChannelIDs:MEMORY[0x1E4F1CBF0]];
    v4 = [NSNumber numberWithUnsignedInteger:v3 + 25];
    v5 = [NSNumber numberWithUnsignedInteger:-25 - v3];
    objc_setAssociatedObject((id)v3, (const void *)(v3 + 1), v4, (void *)1);
    objc_setAssociatedObject((id)v3, (const void *)(-26 - v3), v5, (void *)1);

    cachedSubscription = v2->cachedSubscription;
    v2->cachedSubscription = (FCBundleSubscription *)v3;
  }
  return v2;
}

- (id)bundleSubscriptionLookupEntry
{
  v2 = objc_alloc_init(FCBundleSubscriptionLookUpEntry);
  return v2;
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 hideBundleDetectionUI:(BOOL)a4 completion:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = [(FCNoOpBundleSubscriptionManager *)self cachedSubscription];
    (*((void (**)(id, id))a5 + 2))(v7, v8);
  }
}

- (void)refreshBundleSubscriptionWithCachePolicy:(unint64_t)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = [(FCNoOpBundleSubscriptionManager *)self cachedSubscription];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (void)prepareForUseWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (FCBundleSubscription)cachedSubscription
{
  return self->cachedSubscription;
}

- (FCBundleSubscription)validatedCachedSubscription
{
  return self->validatedCachedSubscription;
}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return self->entitlementsOverrideProvider;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
}

- (FCBundleSubscription)bundleSubscription
{
  return self->bundleSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleSubscription, 0);
  objc_storeStrong((id *)&self->entitlementsOverrideProvider, 0);
  objc_storeStrong((id *)&self->validatedCachedSubscription, 0);
  objc_storeStrong((id *)&self->cachedSubscription, 0);
}

@end