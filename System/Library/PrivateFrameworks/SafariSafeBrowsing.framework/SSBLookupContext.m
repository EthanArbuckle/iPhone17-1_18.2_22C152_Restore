@interface SSBLookupContext
+ (id)sharedLookupContext;
- (SSBLookupContext)init;
- (id).cxx_construct;
- (id)init;
- (uint64_t)_lookUpURL:ignoreEnableState:completionHandler:;
- (uint64_t)init;
- (void)_deleteAllDatabasesWithCompletionHandler:(id)a3;
- (void)_fetchCellularDataPlanWithCompletionHandler:(id)a3;
- (void)_forceDatabaseUpdateWithCompletionHandler:(id)a3;
- (void)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:(id)a3;
- (void)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:(id)a3;
- (void)_forceLookUpURL:(id)a3 completionHandler:(id)a4;
- (void)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:(id)a3;
- (void)_getDatabaseStatusWithCompletionHandler:(id)a3;
- (void)_getLastDatabaseUpdateTimeWithCompletionHandler:(id)a3;
- (void)_getSafeBrowsingEnabledState:(id)a3;
- (void)_getServiceStatusWithCompletionHandler:(id)a3;
- (void)_lookUpURL:(id)a3 ignoreEnableState:(int)a4 completionHandler:(id)a5;
- (void)_lookUpURL:ignoreEnableState:completionHandler:;
- (void)_lookUpURLs:(id)a3 forProtectionType:(int64_t)a4 completionHandler:(id)a5;
- (void)_setSafeBrowsingEnabledStateNeedsUpdate;
- (void)dealloc;
- (void)init;
- (void)lookUpURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SSBLookupContext

+ (id)sharedLookupContext
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = __39__SSBLookupContext_sharedLookupContext__block_invoke;
  block[3] = &__block_descriptor_33_ea8_32c52_ZTSKZ39__SSBLookupContext_sharedLookupContext_E3__0_e5_v8__0l;
  if (+[SSBLookupContext sharedLookupContext]::onceToken != -1) {
    dispatch_once(&+[SSBLookupContext sharedLookupContext]::onceToken, block);
  }
  v2 = (void *)+[SSBLookupContext sharedLookupContext]::lookupContext;

  return v2;
}

uint64_t __39__SSBLookupContext_sharedLookupContext__block_invoke()
{
  +[SSBLookupContext sharedLookupContext]::lookupContext = objc_alloc_init(SSBLookupContext);

  return MEMORY[0x270F9A758]();
}

- (SSBLookupContext)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SSBLookupContext;
  v2 = [(SSBLookupContext *)&v12 init];
  if (v2)
  {
    _ZNSt3__115allocate_sharedB8sn180100IN12SafeBrowsing13LookupContextENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(location);
    long long v3 = *(_OWORD *)location;
    location[0] = 0;
    location[1] = 0;
    v4 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:sn180100](v4);
      if (location[1]) {
        std::__shared_weak_count::__release_shared[abi:sn180100]((std::__shared_weak_count *)location[1]);
      }
    }
    objc_initWeak(location, v2);
    uint64_t v5 = *((void *)v2 + 1);
    objc_copyWeak(&to, location);
    v15 = 0;
    v13 = &unk_26BE0C138;
    objc_moveWeak(&v14, &to);
    v15 = &v13;
    objc_destroyWeak(&to);
    *((_DWORD *)v2 + 6) = SafeBrowsing::LookupContext::addDatabaseUpdateObserver(v5, (uint64_t)&v13);
    std::__function::__value_func<void ()(Backend::Google::DatabaseConfiguration)>::~__value_func[abi:sn180100](&v13);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)safeBrowsingEnabledStateChanged, @"SafeBrowsingEnabledStateDidChangeNotification", 0, (CFNotificationSuspensionBehavior)1028);
    v7 = [MEMORY[0x263F53C50] sharedConnection];
    [v7 addObserver:v2];

    v8 = v2;
    objc_destroyWeak(location);
  }

  return (SSBLookupContext *)v2;
}

- (void)dealloc
{
  SafeBrowsing::LookupContext::removeDatabaseUpdateObserver((SafeBrowsing::LookupContext *)self->_lookupContext.__ptr_, self->_observerToken);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SafeBrowsingEnabledStateDidChangeNotification", 0);
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SSBLookupContext;
  [(SSBLookupContext *)&v5 dealloc];
}

- (void)lookUpURL:(id)a3 completionHandler:(id)a4
{
}

- (void)_lookUpURL:(id)a3 ignoreEnableState:(int)a4 completionHandler:(id)a5
{
  v16[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = SSBOSLogLookup();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_209FC0000, v10, OS_LOG_TYPE_INFO, "Look up a url", v15, 2u);
  }
  v11 = SSBOSLogLookup();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SSBLookupContext _lookUpURL:ignoreEnableState:completionHandler:]((uint64_t)v8, v11);
  }
  ptr = self->_lookupContext.__ptr_;
  id v13 = v8;
  uint64_t v14 = MEMORY[0x210510880](v9);
  v16[0] = &unk_26BE0C1C8;
  v16[1] = v13;
  v16[2] = v14;
  v16[3] = v16;
  SafeBrowsing::LookupContext::lookUpURL(ptr, v13, a4, (uint64_t)v16);
  std::__function::__value_func<void ()(std::vector<Backend::LookupResult>,std::error_code)>::~__value_func[abi:sn180100](v16);
}

- (void).cxx_destruct
{
  cntrl = self->_lookupContext.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:sn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)_forceDatabaseUpdateWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C2E8;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::forceDatabaseUpdate(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_forceDeviceIdentificationTokenUpdateWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C408;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::forceDeviceIdentificationTokenUpdate(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(BOOL,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_getDatabaseStatusWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C258;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::getDatabaseStatus(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(SafeBrowsing::DatabaseStatus,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_getServiceStatusWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C210;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::getServiceStatus(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(SafeBrowsing::ServiceStatus,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_forceLoadRemoteConfigurationFromDiskWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C450;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::forceLoadRemoteConfigurationFromDisk(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(BOOL,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_forceUpdateRemoteConfigurationFromServerWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C498;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::forceUpdateRemoteConfigurationFromServer(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(BOOL,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_deleteAllDatabasesWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C2A0;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::deleteAllDatabases(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(BOOL,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_fetchCellularDataPlanWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C330;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::fetchCellularDataPlan(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(char const*,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_getLastDatabaseUpdateTimeWithCompletionHandler:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C378;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::getLastDatabaseUpdateTime(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(std::chrono::time_point<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>>,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_lookUpURLs:(id)a3 forProtectionType:(int64_t)a4 completionHandler:(id)a5
{
  v6 = (void (**)(id, SSBLookupResult *, void))a5;
  if (a4 == 1)
  {
    id v8 = v6;
    v7 = objc_alloc_init(SSBLookupResult);
    v8[2](v8, v7, 0);

    v6 = v8;
  }
}

- (void)_setSafeBrowsingEnabledStateNeedsUpdate
{
  long long v3 = SSBOSLogEnabledState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_209FC0000, v3, OS_LOG_TYPE_INFO, "Set safe browsing enabled state needs update", v4, 2u);
  }
  SafeBrowsing::LookupContext::setSafeBrowsingEnabledStateNeedsUpdate((SafeBrowsing::LookupContext *)self->_lookupContext.__ptr_);
}

- (void)_getSafeBrowsingEnabledState:(id)a3
{
  v4[4] = *MEMORY[0x263EF8340];
  ptr = self->_lookupContext.__ptr_;
  v4[0] = &unk_26BE0C180;
  v4[1] = MEMORY[0x210510880](a3, a2);
  v4[3] = v4;
  SafeBrowsing::LookupContext::getSafeBrowsingEnabledState(ptr, (uint64_t)v4);
  std::__function::__value_func<void ()(BOOL,std::error_code)>::~__value_func[abi:sn180100](v4);
}

- (void)_forceLookUpURL:(id)a3 completionHandler:(id)a4
{
}

- (uint64_t)init
{
  return a1;
}

- (void)init
{
  uint64_t v2 = *a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3321888768;
  block[2] = ___ZZ24__SSBLookupContext_init_ENK3__1clEN7Backend6Google21DatabaseConfigurationE_block_invoke;
  block[3] = &__block_descriptor_48_ea8_32c89_ZTSKZZ24__SSBLookupContext_init_ENK3__1clEN7Backend6Google21DatabaseConfigurationEEUlvE__e5_v8__0l;
  uint64_t v3 = v2;
  objc_copyWeak(&v4, (id *)(a1 + 8));
  block[4] = v3;
  objc_copyWeak(&v6, &v4);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
}

- (id)init
{
  v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_26BE0C138;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)_lookUpURL:ignoreEnableState:completionHandler:
{
  *a2 = &unk_26BE0C1C8;
  a2[1] = *(id *)(a1 + 8);
  uint64_t result = MEMORY[0x210510880](*(void *)(a1 + 16));
  a2[2] = result;
  return result;
}

- (void)_lookUpURL:ignoreEnableState:completionHandler:
{
  id v4 = *(void **)a2;
  objc_super v5 = *(void **)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  if (*(void *)&a3->__val_)
  {
    id v6 = nsErrorFromReplyErrorCode(*a3);
  }
  else
  {
    id v6 = 0;
  }
  v7 = [MEMORY[0x263EFF980] array];
  if (v4 != v5)
  {
    id v8 = v4;
    do
    {
      id v9 = [[SSBServiceLookupResult alloc] _initWithLookupResult:*v8];
      [v7 addObject:v9];

      ++v8;
    }
    while (v8 != v5);
  }
  id v10 = -[SSBLookupResult _initWithServiceLookUpResults:URLContainsUserInfo:]([SSBLookupResult alloc], "_initWithServiceLookUpResults:URLContainsUserInfo:", v7, objc_msgSend(*(id *)(a1 + 8), "ssb_hasUserInfo"));
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();

  if (v4)
  {
    operator delete(v4);
  }
}

- (void)_lookUpURL:(uint64_t)a1 ignoreEnableState:(NSObject *)a2 completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209FC0000, a2, OS_LOG_TYPE_DEBUG, "Look up a url %@", (uint8_t *)&v2, 0xCu);
}

@end