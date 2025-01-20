@interface REAppNameCache
- (id)_init;
- (id)localizedNameForApplicationWithIdentifier:(id)a3;
@end

@implementation REAppNameCache

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)REAppNameCache;
  v2 = [(RESingleton *)&v8 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = (void *)v2[1];
    v2[1] = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)v2[2];
    v2[2] = v5;
  }
  return v2;
}

- (id)localizedNameForApplicationWithIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t IsRemote = REApplicationIsRemote(v4);
  v6 = [[_REAppKey alloc] initWithIdentifier:v4 remote:IsRemote];
  [(NSLock *)self->_lock lock];
  v7 = [(NSMutableDictionary *)self->_nameCache objectForKeyedSubscript:v6];
  [(NSLock *)self->_lock unlock];
  if (!v7)
  {
    if (IsRemote)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2050000000;
      objc_super v8 = (void *)getCSLPRFDefaultAppDataProviderClass_softClass_0;
      uint64_t v22 = getCSLPRFDefaultAppDataProviderClass_softClass_0;
      if (!getCSLPRFDefaultAppDataProviderClass_softClass_0)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCSLPRFDefaultAppDataProviderClass_block_invoke_0;
        v24 = &unk_2644BC768;
        v25 = &v19;
        __getCSLPRFDefaultAppDataProviderClass_block_invoke_0((uint64_t)buf);
        objc_super v8 = (void *)v20[3];
      }
      v9 = v8;
      _Block_object_dispose(&v19, 8);
      id v10 = objc_alloc_init(v9);
      dispatch_get_global_queue(33, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        v24 = v11;
        _os_log_impl(&dword_21E6E6000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ is loading apps using %@, completionQueue %@", buf, 0x20u);
      }
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __60__REAppNameCache_localizedNameForApplicationWithIdentifier___block_invoke;
      v17[3] = &unk_2644BF2C8;
      v17[4] = self;
      dispatch_semaphore_t v18 = v12;
      v13 = v12;
      [v10 loadAppsWithCompletion:v17 completionQueue:v11];
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      [(NSLock *)self->_lock lock];
      v7 = [(NSMutableDictionary *)self->_nameCache objectForKeyedSubscript:v6];
      [(NSLock *)self->_lock unlock];
    }
    else
    {
      id v16 = 0;
      id v10 = (id)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:1 error:&v16];
      id v11 = v16;
      v7 = [v10 localizedName];
      [(NSLock *)self->_lock lock];
      [(NSMutableDictionary *)self->_nameCache setObject:v7 forKeyedSubscript:v6];
      [(NSLock *)self->_lock unlock];
    }
  }
  id v14 = v7;

  return v14;
}

void __60__REAppNameCache_localizedNameForApplicationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v4;
    __int16 v24 = 1024;
    int v25 = [v3 count];
    _os_log_impl(&dword_21E6E6000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ loaded %d apps, processing", buf, 0x12u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_msgSend(v3, "allValues", v3);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        if (v10) {
          id v11 = (__CFString *)v10;
        }
        else {
          id v11 = &stru_26CFA57D0;
        }
        dispatch_semaphore_t v12 = [_REAppKey alloc];
        v13 = [v9 bundleID];
        id v14 = [(_REAppKey *)v12 initWithIdentifier:v13 remote:1];

        [*(id *)(*(void *)(a1 + 32) + 16) lock];
        [*(id *)(*(void *)(a1 + 32) + 8) setObject:v11 forKeyedSubscript:v14];
        [*(id *)(*(void *)(a1 + 32) + 16) unlock];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_nameCache, 0);
}

@end