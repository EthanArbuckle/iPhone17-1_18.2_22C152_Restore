@interface WPResources
+ (id)sharedInstance;
- (id).cxx_construct;
- (id)loadTrackerBlockerRuleListForStore:completionHandler:;
- (id)requestLinkFilteringData:completionHandler:;
- (id)requestTrackerQueryParameters:completionHandler:;
- (uint64_t)loadTrackerBlockerRuleListForStore:completionHandler:;
- (uint64_t)requestAllowedLinkFilteringData:completionHandler:;
- (uint64_t)requestLinkFilteringData:completionHandler:;
- (uint64_t)requestRestrictedOpenerDomains:completionHandler:;
- (uint64_t)requestStorageAccessPromptQuirksData:completionHandler:;
- (uint64_t)requestStorageAccessUserAgentStringQuirksData:completionHandler:;
- (uint64_t)requestTrackerBlockerContentExtension:completionHandler:;
- (uint64_t)requestTrackerDomainNames:completionHandler:;
- (uint64_t)requestTrackerDomainNamesData:completionHandler:;
- (uint64_t)requestTrackerNetworkAddresses:completionHandler:;
- (uint64_t)requestTrackerQueryParameters:completionHandler:;
- (void)_doWithCachedLinkFilteringData:(id)a3;
- (void)_installMessageHandlerForTesting:(id)a3;
- (void)_makeXPCTimeoutInstantForTesting;
- (void)_resetStateForTesting;
- (void)_waitForCachedLinkFilteringData;
- (void)loadTrackerBlockerRuleListForStore:(id)a3 completionHandler:(id)a4;
- (void)loadTrackerBlockerRuleListForStore:completionHandler:;
- (void)requestAllowedLinkFilteringData:(id)a3 completionHandler:(id)a4;
- (void)requestAllowedLinkFilteringData:completionHandler:;
- (void)requestLinkFilteringData:(id)a3 completionHandler:(id)a4;
- (void)requestLinkFilteringData:completionHandler:;
- (void)requestRestrictedOpenerDomains:(id)a3 completionHandler:(id)a4;
- (void)requestRestrictedOpenerDomains:completionHandler:;
- (void)requestStorageAccessPromptQuirksData:(id)a3 completionHandler:(id)a4;
- (void)requestStorageAccessPromptQuirksData:completionHandler:;
- (void)requestStorageAccessUserAgentStringQuirksData:(id)a3 completionHandler:(id)a4;
- (void)requestStorageAccessUserAgentStringQuirksData:completionHandler:;
- (void)requestTrackerBlockerContentExtension:(id)a3 completionHandler:(id)a4;
- (void)requestTrackerBlockerContentExtension:completionHandler:;
- (void)requestTrackerDomainNames:(id)a3 completionHandler:(id)a4;
- (void)requestTrackerDomainNames:completionHandler:;
- (void)requestTrackerDomainNamesData:(id)a3 completionHandler:(id)a4;
- (void)requestTrackerDomainNamesData:completionHandler:;
- (void)requestTrackerNetworkAddresses:(id)a3 completionHandler:(id)a4;
- (void)requestTrackerNetworkAddresses:completionHandler:;
- (void)requestTrackerQueryParameters:(id)a3 completionHandler:(id)a4;
- (void)requestTrackerQueryParameters:completionHandler:;
@end

@implementation WPResources

- (void)loadTrackerBlockerRuleListForStore:(id)a3 completionHandler:(id)a4
{
  v11[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v10 = 1;
  uint64_t v8 = MEMORY[0x263E40FD0](v6);
  id v9 = v5;
  v11[0] = &unk_270D83998;
  v11[1] = v8;
  v11[2] = v9;
  v11[3] = v11;
  WebPrivacy::Client::getList(v7, 1, &v10, (uint64_t)v11);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v11);
}

- (void)requestStorageAccessPromptQuirksData:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82D90;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 7, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)requestStorageAccessUserAgentStringQuirksData:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82E20;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 6, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)loadTrackerBlockerRuleListForStore:completionHandler:
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 > 3u) {
    v2 = "Invalid";
  }
  else {
    v2 = off_265586170[(char)(a1 - 1)];
  }
  int v3 = 136446210;
  v4 = v2;
  _os_log_error_impl(&dword_2617B2000, a2, OS_LOG_TYPE_ERROR, "Failed to request tracker block list rules with error: %{public}s", (uint8_t *)&v3, 0xCu);
}

- (id)loadTrackerBlockerRuleListForStore:completionHandler:
{
  *a2 = &unk_270D83998;
  a2[1] = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  id result = *(id *)(a1 + 16);
  a2[2] = result;
  return result;
}

- (void)requestStorageAccessUserAgentStringQuirksData:completionHandler:
{
  operator delete(a1);
}

- (void)requestStorageAccessPromptQuirksData:completionHandler:
{
  operator delete(a1);
}

- (uint64_t)requestStorageAccessUserAgentStringQuirksData:completionHandler:
{
  return a1;
}

- (uint64_t)requestStorageAccessPromptQuirksData:completionHandler:
{
  return a1;
}

+ (id)sharedInstance
{
  if (+[WPResources sharedInstance]::onceToken != -1) {
    dispatch_once(&+[WPResources sharedInstance]::onceToken, &__block_literal_global_2);
  }
  v2 = (void *)+[WPResources sharedInstance]::sharedInstance;

  return v2;
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

uint64_t __29__WPResources_sharedInstance__block_invoke()
{
  +[WPResources sharedInstance]::sharedInstance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)requestTrackerBlockerContentExtension:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82DD8;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 1, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)requestTrackerQueryParameters:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  inited = (WebPrivacy::Client *)objc_initWeak(&location, self);
  id v9 = (dispatch_queue_t *)WebPrivacy::Client::shared(inited);
  char v13 = [v6 afterUpdates];
  objc_copyWeak(&to, &location);
  uint64_t v12 = MEMORY[0x263E40FD0](v7);
  v17 = 0;
  v15 = &unk_270D82CB8;
  objc_moveWeak(v16, &to);
  char v10 = (void *)v12;
  uint64_t v12 = 0;
  v16[1] = v10;
  v17 = &v15;
  objc_destroyWeak(&to);
  WebPrivacy::Client::getList(v9, 2, &v13, (uint64_t)&v15);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](&v15);
  objc_destroyWeak(&location);
}

- (void)requestLinkFilteringData:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  inited = (WebPrivacy::Client *)objc_initWeak(&location, self);
  id v9 = (dispatch_queue_t *)WebPrivacy::Client::shared(inited);
  char v13 = [v6 afterUpdates];
  objc_copyWeak(&to, &location);
  uint64_t v12 = MEMORY[0x263E40FD0](v7);
  v17 = 0;
  v15 = &unk_270D82BE0;
  objc_moveWeak(v16, &to);
  char v10 = (void *)v12;
  uint64_t v12 = 0;
  v16[1] = v10;
  v17 = &v15;
  objc_destroyWeak(&to);
  WebPrivacy::Client::getList(v9, 2, &v13, (uint64_t)&v15);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](&v15);
  objc_destroyWeak(&location);
}

- (void)requestAllowedLinkFilteringData:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (WebPrivacy::Client *)a4;
  id v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82D48;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 5, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)requestTrackerDomainNames:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (WebPrivacy::Client *)a4;
  id v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82C28;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 3, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)requestTrackerDomainNamesData:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (WebPrivacy::Client *)a4;
  id v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82C70;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 3, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)requestTrackerNetworkAddresses:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (WebPrivacy::Client *)a4;
  id v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D82D00;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 4, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)requestRestrictedOpenerDomains:(id)a3 completionHandler:(id)a4
{
  v9[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (WebPrivacy::Client *)a4;
  id v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  char v8 = [v5 afterUpdates];
  v9[0] = &unk_270D83950;
  v9[1] = MEMORY[0x263E40FD0](v6);
  v9[3] = v9;
  WebPrivacy::Client::getList(v7, 8, &v8, (uint64_t)v9);
  std::__function::__value_func<void ()(WebPrivacy::MessageError,Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v9);
}

- (void)_doWithCachedLinkFilteringData:(id)a3
{
  v4 = (void (**)(id, void))a3;
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4[2](v4, *((void *)self + 1));
  std::mutex::unlock((std::mutex *)((char *)self + 16));
}

- (void)_waitForCachedLinkFilteringData
{
  int v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  if (![*((id *)self + 1) count])
  {
    uint64_t v4 = WebPrivacy::Client::shared(0);
    WebPrivacy::Client::getList(v4, 2u, (uint64_t)&v13);
    if (v13)
    {
      Platform::SharedMemory::view(v13);
      if (v5)
      {
        v10[0] = Platform::SharedMemory::view(v13);
        v10[1] = v6;
        WebPrivacy::createLinkFilteringData((uint64_t)v10, (uint64_t *)&v11);
        id v7 = v12;
        if (!v12)
        {
          uint64_t v8 = [v11 scopedQueryParameters];
          id v9 = (void *)*((void *)self + 1);
          *((void *)self + 1) = v8;

          id v7 = v12;
        }
      }
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v14);
    }
  }
  std::mutex::unlock(v3);
}

- (void)_installMessageHandlerForTesting:(id)a3
{
  uint64_t v6 = (WebPrivacy::Client *)a3;
  uint64_t v3 = WebPrivacy::Client::shared(v6);
  uint64_t v4 = MEMORY[0x263E40FD0](v6);
  uint64_t v5 = *(void **)(v3 + 416);
  *(void *)(v3 + 416) = v4;
}

- (void)_resetStateForTesting
{
  uint64_t v3 = (WebPrivacy::Client *)WebPrivacy::Client::shared((WebPrivacy::Client *)self);
  WebPrivacy::Client::resetStateForTesting(v3);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  uint64_t v4 = (void *)*((void *)self + 1);
  *((void *)self + 1) = 0;

  std::mutex::unlock((std::mutex *)((char *)self + 16));
}

- (void)_makeXPCTimeoutInstantForTesting
{
  uint64_t v2 = WebPrivacy::Client::shared((WebPrivacy::Client *)self);
  *(void *)(v2 + 448) = 0;
  *(unsigned char *)(v2 + 456) = 1;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 16));

  objc_storeStrong((id *)self + 1, 0);
}

- (uint64_t)requestTrackerBlockerContentExtension:completionHandler:
{
  *a2 = &unk_270D82DD8;
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerBlockerContentExtension:completionHandler:
{
  unsigned int v4 = *a2;
  WebPrivacy::createTrackingResourceRequestContentExtensionSource(a3, (uint64_t *)&v5);
  callCompletionHandler<void({block_pointer} {__strong})(NSData *,NSError *)>(*(void **)(a1 + 8), v5, v6, v4);
}

- (uint64_t)requestTrackerQueryParameters:completionHandler:
{
  *(void *)a2 = &unk_270D82CB8;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 16));
  *(void *)(a2 + 16) = result;
  return result;
}

- (void)requestTrackerQueryParameters:completionHandler:
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v27 = *a2;
  WebPrivacy::createLinkFilteringData(a3, (uint64_t *)&v32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    BOOL v5 = v32 == 0;

    if (!v5)
    {
      uint64_t v6 = (char *)objc_loadWeakRetained((id *)(a1 + 8));
      std::mutex::lock((std::mutex *)(v6 + 16));
      uint64_t v7 = [v32 scopedQueryParameters];
      uint64_t v8 = (void *)*((void *)v6 + 1);
      *((void *)v6 + 1) = v7;

      std::mutex::unlock((std::mutex *)(v6 + 16));
    }
  }
  id v9 = objc_opt_new();
  [v32 scopedQueryParameters];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(id *)(*((void *)&v28 + 1) + 8 * i);
        v15 = [v10 objectForKeyedSubscript:v14];
        v16 = [v15 domains];
        BOOL v17 = [v16 count] == 0;

        if (v17) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v11);
  }

  id v18 = v33;
  v19 = (void (**)(id, id, void))*(id *)(a1 + 16);
  id v20 = v9;
  id v21 = v18;
  if (v20)
  {
    v19[2](v19, v20, 0);
  }
  else if (v27)
  {
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08338];
    if (v27 > 3) {
      v23 = "Invalid";
    }
    else {
      v23 = off_265586170[(char)(v27 - 1)];
    }
    v24 = [NSString stringWithUTF8String:v23];
    v36[0] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v26 = [v22 errorWithDomain:@"WebPrivacyErrorDomain" code:v27 userInfo:v25];
    ((void (**)(id, id, void *))v19)[2](v19, 0, v26);
  }
  else
  {
    ((void (**)(id, id, id))v19)[2](v19, 0, v21);
  }
}

- (id)requestTrackerQueryParameters:completionHandler:
{
  uint64_t v2 = (id *)(a1 + 8);
  uint64_t v3 = (id *)operator new(0x18uLL);
  *uint64_t v3 = &unk_270D82CB8;
  objc_copyWeak(v3 + 1, v2);
  v3[2] = (id)MEMORY[0x263E40FD0](*(void *)(a1 + 16));
  return v3;
}

- (uint64_t)requestLinkFilteringData:completionHandler:
{
  *(void *)a2 = &unk_270D82BE0;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 16));
  *(void *)(a2 + 16) = result;
  return result;
}

- (void)requestLinkFilteringData:completionHandler:
{
  unsigned int v4 = (id *)(a1 + 8);
  unsigned int v5 = *a2;
  WebPrivacy::createLinkFilteringData(a3, (uint64_t *)&v11);
  id WeakRetained = objc_loadWeakRetained(v4);
  if (WeakRetained)
  {
    uint64_t v7 = v11;

    if (v7)
    {
      uint64_t v8 = (char *)objc_loadWeakRetained(v4);
      std::mutex::lock((std::mutex *)(v8 + 16));
      uint64_t v9 = [v11 scopedQueryParameters];
      id v10 = (void *)*((void *)v8 + 1);
      *((void *)v8 + 1) = v9;

      std::mutex::unlock((std::mutex *)(v8 + 16));
    }
  }
  callCompletionHandler<void({block_pointer} {__strong})(WPLinkFilteringData *,NSError *)>(*(void **)(a1 + 16), v11, v12, v5);
}

- (id)requestLinkFilteringData:completionHandler:
{
  uint64_t v2 = (id *)(a1 + 8);
  uint64_t v3 = (id *)operator new(0x18uLL);
  *uint64_t v3 = &unk_270D82BE0;
  objc_copyWeak(v3 + 1, v2);
  v3[2] = (id)MEMORY[0x263E40FD0](*(void *)(a1 + 16));
  return v3;
}

- (uint64_t)requestAllowedLinkFilteringData:completionHandler:
{
  *a2 = &unk_270D82D48;
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestAllowedLinkFilteringData:completionHandler:
{
  unsigned int v4 = *a2;
  WebPrivacy::createLinkFilteringData(a3, (uint64_t *)&v5);
  callCompletionHandler<void({block_pointer} {__strong})(WPLinkFilteringData *,NSError *)>(*(void **)(a1 + 8), v5, v6, v4);
}

- (uint64_t)requestTrackerDomainNames:completionHandler:
{
  *a2 = &unk_270D82C28;
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerDomainNames:completionHandler:
{
  unsigned int v4 = *a2;
  WebPrivacy::createTrackerDomainNamesJSONData(a3, (uint64_t *)&v5);
  callCompletionHandler<void({block_pointer} {__strong})(NSData *,NSError *)>(*(void **)(a1 + 8), v5, v6, v4);
}

- (uint64_t)requestTrackerDomainNamesData:completionHandler:
{
  *a2 = &unk_270D82C70;
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerDomainNamesData:completionHandler:
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *a2;
  WebPrivacy::createTrackerDomainNamesData(a3, &v15);
  id v5 = v15;
  id v6 = v16;
  uint64_t v7 = (void (**)(id, id, void))*(id *)(a1 + 8);
  id v8 = v5;
  id v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if (v4)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08338];
    if (v4 > 3) {
      uint64_t v11 = "Invalid";
    }
    else {
      uint64_t v11 = off_265586170[(char)(v4 - 1)];
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    v18[0] = v12;
    char v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v10 errorWithDomain:@"WebPrivacyErrorDomain" code:v4 userInfo:v13];
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);
  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }
}

- (uint64_t)requestTrackerNetworkAddresses:completionHandler:
{
  *a2 = &unk_270D82D00;
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerNetworkAddresses:completionHandler:
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *a2;
  WebPrivacy::createTrackerNetworkAddressesList(a3, &v15);
  id v5 = v15;
  id v6 = v16;
  uint64_t v7 = (void (**)(id, id, void))*(id *)(a1 + 8);
  id v8 = v5;
  id v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if (v4)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08338];
    if (v4 > 3) {
      uint64_t v11 = "Invalid";
    }
    else {
      uint64_t v11 = off_265586170[(char)(v4 - 1)];
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    v18[0] = v12;
    char v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v10 errorWithDomain:@"WebPrivacyErrorDomain" code:v4 userInfo:v13];
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);
  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }
}

- (uint64_t)requestRestrictedOpenerDomains:completionHandler:
{
  *a2 = &unk_270D83950;
  uint64_t result = MEMORY[0x263E40FD0](*(void *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestRestrictedOpenerDomains:completionHandler:
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *a2;
  WebPrivacy::createRestrictedOpenerDomains(a3, &v15);
  id v5 = v15;
  id v6 = v16;
  uint64_t v7 = (void (**)(id, id, void))*(id *)(a1 + 8);
  id v8 = v5;
  id v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if (v4)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08338];
    if (v4 > 3) {
      uint64_t v11 = "Invalid";
    }
    else {
      uint64_t v11 = off_265586170[(char)(v4 - 1)];
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    v18[0] = v12;
    char v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v14 = [v10 errorWithDomain:@"WebPrivacyErrorDomain" code:v4 userInfo:v13];
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);
  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }
}

- (uint64_t)loadTrackerBlockerRuleListForStore:completionHandler:
{
  return a1;
}

@end