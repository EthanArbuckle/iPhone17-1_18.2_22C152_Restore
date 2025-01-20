@interface SXDebugLayoutOptionsProvider
- (NSHashTable)observers;
- (SXDebugLayoutOptionsProvider)init;
- (id)overrideConditionKeys:(id)a3;
- (id)overrideContentSizeCategory:(id)a3;
- (int64_t)bundleSubscriptionStatus;
- (int64_t)channelSubscriptionStatus;
- (int64_t)offerUpsellScenario;
- (int64_t)overrideBundleSubscriptionStatus:(int64_t)a3;
- (int64_t)overrideChannelSubscriptionStatus:(int64_t)a3;
- (int64_t)overrideNewsletterSubscriptionStatus:(unint64_t)a3;
- (int64_t)overrideOfferUpsellScenario:(int64_t)a3;
- (int64_t)overrideSubscriptionActivationEligibility:(int64_t)a3;
- (int64_t)subscriptionActivationEligibility;
- (unint64_t)newsletterSubscriptionStatus;
- (unint64_t)overrideViewingLocation:(unint64_t)a3;
- (unint64_t)viewingLocation;
- (void)addObserver:(id)a3;
- (void)notifyObservers;
- (void)removeObserver:(id)a3;
- (void)setBundleSubscriptionStatus:(int64_t)a3;
- (void)setChannelSubscriptionStatus:(int64_t)a3;
- (void)setNewsletterSubscriptionStatus:(unint64_t)a3;
- (void)setOfferUpsellScenario:(int64_t)a3;
- (void)setSubscriptionActivationEligibility:(int64_t)a3;
- (void)setViewingLocation:(unint64_t)a3;
@end

@implementation SXDebugLayoutOptionsProvider

- (SXDebugLayoutOptionsProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SXDebugLayoutOptionsProvider;
  v2 = [(SXDebugLayoutOptionsProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v3;

    int64x2_t v5 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)(v2 + 8) = v5;
    *(int64x2_t *)(v2 + 24) = v5;
    *(int64x2_t *)(v2 + 40) = v5;
  }
  return (SXDebugLayoutOptionsProvider *)v2;
}

- (id)overrideContentSizeCategory:(id)a3
{
  id v3 = a3;
  return v3;
}

- (unint64_t)overrideViewingLocation:(unint64_t)a3
{
  if (self->_viewingLocation == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return self->_viewingLocation;
  }
}

- (int64_t)overrideBundleSubscriptionStatus:(int64_t)a3
{
  if (self->_bundleSubscriptionStatus == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return self->_bundleSubscriptionStatus;
  }
}

- (int64_t)overrideChannelSubscriptionStatus:(int64_t)a3
{
  if (self->_channelSubscriptionStatus == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return self->_channelSubscriptionStatus;
  }
}

- (int64_t)overrideNewsletterSubscriptionStatus:(unint64_t)a3
{
  if (self->_newsletterSubscriptionStatus == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return self->_newsletterSubscriptionStatus;
  }
}

- (int64_t)overrideOfferUpsellScenario:(int64_t)a3
{
  if (self->_offerUpsellScenario == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return self->_offerUpsellScenario;
  }
}

- (int64_t)overrideSubscriptionActivationEligibility:(int64_t)a3
{
  if (self->_subscriptionActivationEligibility == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  else {
    return self->_subscriptionActivationEligibility;
  }
}

- (id)overrideConditionKeys:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SXDebugLayoutOptionsProvider *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SXDebugLayoutOptionsProvider *)self observers];
  [v5 removeObject:v4];
}

- (void)setViewingLocation:(unint64_t)a3
{
  if (self->_viewingLocation != a3)
  {
    self->_viewingLocation = a3;
    [(SXDebugLayoutOptionsProvider *)self notifyObservers];
  }
}

- (void)setBundleSubscriptionStatus:(int64_t)a3
{
  if (self->_bundleSubscriptionStatus != a3)
  {
    self->_bundleSubscriptionStatus = a3;
    [(SXDebugLayoutOptionsProvider *)self notifyObservers];
  }
}

- (void)setChannelSubscriptionStatus:(int64_t)a3
{
  if (self->_channelSubscriptionStatus != a3)
  {
    self->_channelSubscriptionStatus = a3;
    [(SXDebugLayoutOptionsProvider *)self notifyObservers];
  }
}

- (void)setNewsletterSubscriptionStatus:(unint64_t)a3
{
  if (self->_newsletterSubscriptionStatus != a3)
  {
    self->_newsletterSubscriptionStatus = a3;
    [(SXDebugLayoutOptionsProvider *)self notifyObservers];
  }
}

- (void)setOfferUpsellScenario:(int64_t)a3
{
  if (self->_offerUpsellScenario != a3)
  {
    self->_offerUpsellScenario = a3;
    [(SXDebugLayoutOptionsProvider *)self notifyObservers];
  }
}

- (void)setSubscriptionActivationEligibility:(int64_t)a3
{
  if (self->_subscriptionActivationEligibility != a3)
  {
    self->_subscriptionActivationEligibility = a3;
    [(SXDebugLayoutOptionsProvider *)self notifyObservers];
  }
}

- (void)notifyObservers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(SXDebugLayoutOptionsProvider *)self observers];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) debugLayoutOptionsDidChange:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)viewingLocation
{
  return self->_viewingLocation;
}

- (int64_t)bundleSubscriptionStatus
{
  return self->_bundleSubscriptionStatus;
}

- (int64_t)channelSubscriptionStatus
{
  return self->_channelSubscriptionStatus;
}

- (unint64_t)newsletterSubscriptionStatus
{
  return self->_newsletterSubscriptionStatus;
}

- (int64_t)offerUpsellScenario
{
  return self->_offerUpsellScenario;
}

- (int64_t)subscriptionActivationEligibility
{
  return self->_subscriptionActivationEligibility;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end