@interface RESharedLocationRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
- (CLLocation)currentLocation;
- (void)_queue_loadLocation:(id)a3;
- (void)locationManagerDidUpdateLocation:(id)a3;
- (void)pause;
- (void)resume;
@end

@implementation RESharedLocationRelevanceProviderManager

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (CLLocation)currentLocation
{
  return self->_lastLocationUpdate;
}

- (void)_queue_loadLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationUpdate, a3);
  id v5 = a3;
  id v6 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];

  [(RERelevanceProviderManager *)self _scheduleUpdate:v6];
}

- (void)resume
{
  v3 = [(RERelevanceProviderManager *)self environment];
  v4 = [v3 relevanceEngine];
  id v6 = [v4 locationManager];

  [v6 addObserver:self];
  id v5 = [v6 currentLocation];
  [(RESharedLocationRelevanceProviderManager *)self _queue_loadLocation:v5];
}

- (void)pause
{
  id v5 = [(RERelevanceProviderManager *)self environment];
  v3 = [v5 relevanceEngine];
  v4 = [v3 locationManager];
  [v4 removeObserver:self];
}

- (void)locationManagerDidUpdateLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(RERelevanceProviderManager *)self _manager_queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__RESharedLocationRelevanceProviderManager_locationManagerDidUpdateLocation___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __77__RESharedLocationRelevanceProviderManager_locationManagerDidUpdateLocation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) currentLocation];
  objc_msgSend(v1, "_queue_loadLocation:", v2);
}

- (void).cxx_destruct
{
}

@end