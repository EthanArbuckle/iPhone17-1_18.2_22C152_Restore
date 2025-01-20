@interface SearchUIBiomeSubscriberRegistry
+ (SearchUIBiomeSubscriberRegistry)sharedManager;
- (NSCache)subscribers;
- (SearchUIBiomeSubscriberRegistry)init;
- (id)requestSubscriberForIdentifier:(id)a3;
- (id)validCachedSubscriber:(id)a3 ofClass:(Class)a4;
- (void)cacheSubscriber:(id)a3 forKey:(id)a4;
- (void)flush;
- (void)setSubscribers:(id)a3;
@end

@implementation SearchUIBiomeSubscriberRegistry

+ (SearchUIBiomeSubscriberRegistry)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_10);
  }
  v2 = (void *)sharedManager_sharedRegistry;
  return (SearchUIBiomeSubscriberRegistry *)v2;
}

uint64_t __48__SearchUIBiomeSubscriberRegistry_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SearchUIBiomeSubscriberRegistry);
  uint64_t v1 = sharedManager_sharedRegistry;
  sharedManager_sharedRegistry = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SearchUIBiomeSubscriberRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIBiomeSubscriberRegistry;
  v2 = [(SearchUIBiomeSubscriberRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSCache *)v3;
  }
  return v2;
}

- (void)cacheSubscriber:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && [v6 length])
  {
    v7 = [(SearchUIBiomeSubscriberRegistry *)self subscribers];
    [v7 setObject:v8 forKey:v6];
  }
}

- (id)validCachedSubscriber:(id)a3 ofClass:(Class)a4
{
  id v5 = a3;
  id v6 = [(SearchUIBiomeSubscriberRegistry *)self subscribers];
  v7 = [v6 objectForKey:v5];

  if (v7 && (([v7 finished] & 1) != 0 || (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = [(SearchUIBiomeSubscriberRegistry *)self subscribers];
    [v9 removeObjectForKey:v5];

    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (id)requestSubscriberForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIBiomeSubscriberRegistry *)self validCachedSubscriber:v4 ofClass:objc_opt_class()];
  if (!v5)
  {
    id v5 = [[SearchUIBiomeStreamSubscriber alloc] initWithStreamIdentifier:v4];
    [(SearchUIBiomeSubscriberRegistry *)self cacheSubscriber:v5 forKey:v4];
  }

  return v5;
}

- (void)flush
{
  id v2 = [(SearchUIBiomeSubscriberRegistry *)self subscribers];
  [v2 removeAllObjects];
}

- (NSCache)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end