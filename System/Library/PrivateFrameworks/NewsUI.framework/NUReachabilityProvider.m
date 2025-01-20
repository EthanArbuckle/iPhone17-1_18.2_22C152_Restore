@interface NUReachabilityProvider
- (BOOL)isNetworkReachable;
- (FCNetworkReachability)networkReachability;
- (NSHashTable)observers;
- (NUReachabilityProvider)initWithNetworkReachability:(id)a3;
- (void)addReachabilityObserver:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
- (void)removeReachabilityObserver:(id)a3;
@end

@implementation NUReachabilityProvider

- (NUReachabilityProvider)initWithNetworkReachability:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NUReachabilityProvider;
  v6 = [(NUReachabilityProvider *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_networkReachability, a3);
    [v5 addObserver:v6];
  }

  return v6;
}

- (BOOL)isNetworkReachable
{
  v2 = [(NUReachabilityProvider *)self networkReachability];
  char v3 = [v2 isNetworkReachable];

  return v3;
}

- (void)addReachabilityObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUReachabilityProvider *)self observers];
  [v5 addObject:v4];
}

- (void)removeReachabilityObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(NUReachabilityProvider *)self observers];
  [v5 removeObject:v4];
}

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 isNetworkReachable];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NUReachabilityProvider *)self observers];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) reachabilityChanged:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (FCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_networkReachability, 0);
}

@end