@interface RegionalResourceObserver
- (RegionalResourceObserver)initWithResourceProvider:(void *)a3;
- (id).cxx_construct;
- (void)clearProvider;
@end

@implementation RegionalResourceObserver

void __53__RegionalResourceObserver_initWithResourceProvider___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (std::mutex *)(WeakRetained + 16);
    v9 = WeakRetained;
    std::mutex::lock((std::mutex *)(WeakRetained + 16));
    uint64_t v3 = *((void *)v9 + 1);
    if (v3)
    {
      std::mutex::lock((std::mutex *)(v3 + 112));
      if (GEOGetVectorKitVKGeoResourceProviderLog(void)::onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKGeoResourceProviderLog(void)::onceToken, &__block_literal_global_85);
      }
      v4 = GEOGetVectorKitVKGeoResourceProviderLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKGeoResourceProviderLog(void)::log, OS_LOG_TYPE_INFO))
      {
        unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v3 + 328) - *(void *)(v3 + 320)) >> 3);
        *(_DWORD *)buf = 134217984;
        unint64_t v11 = v5;
        _os_log_impl(&dword_1A1780000, v4, OS_LOG_TYPE_INFO, "Received onRegionalResourceUpdate - clearing cached resource names (count:%lu)", buf, 0xCu);
      }
      uint64_t v6 = *(void *)(v3 + 320);
      for (uint64_t i = *(void *)(v3 + 328); i != v6; i -= 24)
      {
        v8 = *(std::__shared_weak_count **)(i - 8);
        if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      *(void *)(v3 + 328) = v6;
      grl::ResourceProvider::clearResourceNamesCache((grl::ResourceProvider *)v3);
      std::mutex::unlock((std::mutex *)(v3 + 112));
    }
    std::mutex::unlock(v2);
    WeakRetained = v9;
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  return self;
}

- (RegionalResourceObserver)initWithResourceProvider:(void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)RegionalResourceObserver;
  v4 = [(RegionalResourceObserver *)&v13 init];
  unint64_t v5 = v4;
  if (v4)
  {
    *((void *)v4 + 1) = a3;
    objc_initWeak(&location, v4);
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__RegionalResourceObserver_initWithResourceProvider___block_invoke;
    v10[3] = &unk_1E5A93B98;
    objc_copyWeak(&v11, &location);
    uint64_t v7 = [v6 addObserverForName:@"GEOTileLoaderDidUpdateRegionalResourcesNotification" object:0 queue:0 usingBlock:v10];
    v8 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 10, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
}

- (void)clearProvider
{
  uint64_t v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((void *)self + 1) = 0;
  std::mutex::unlock(v3);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:*((void *)self + 10)];
}

@end