@interface PSUICarrierSpaceManager
+ (BOOL)isCarrierMetricTypeValid:(int)a3;
+ (id)getNSURLSessionConfiguration;
+ (id)sharedManager;
+ (int)carrierMetricTypeForString:(id)a3;
+ (int64_t)bytesFromString:(id)a3 carrierSpaceUnits:(int64_t)a4;
- (BOOL)hasUserConsent;
- (BOOL)planChangeIsRestricted;
- (BOOL)supportsSweetgum;
- (CTCarrierSpaceClient)carrierSpaceClient;
- (PSUICarrierSpaceManager)init;
- (id)appsInfo;
- (id)capabilities;
- (id)carrierAppInstallController;
- (id)descriptionForPlanMetrics:(id)a3;
- (id)getLogger;
- (id)localizedDataStringFromBytes:(unint64_t)a3;
- (id)planMetrics;
- (id)plansInfo;
- (id)subscribedDomesticPlanOptions;
- (id)subscribedPlanOptions;
- (id)usageInfo;
- (id)userConsentFlowInfo;
- (void)appsDidChange;
- (void)capabilitiesDidChange:(id)a3;
- (void)dealloc;
- (void)plansDidChange;
- (void)refresh;
- (void)refreshAndReload;
- (void)reset;
- (void)setCarrierSpaceClient:(id)a3;
- (void)setUserConsent:(BOOL)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)usageDidChange;
- (void)userConsentAcknowledged:(BOOL)a3;
- (void)userConsentFlowInfoDidChange;
@end

@implementation PSUICarrierSpaceManager

+ (id)sharedManager
{
  if (qword_26AC322E8 != -1) {
    dispatch_once(&qword_26AC322E8, &__block_literal_global_15);
  }
  v2 = (void *)_MergedGlobals_66;
  return v2;
}

uint64_t __40__PSUICarrierSpaceManager_sharedManager__block_invoke()
{
  _MergedGlobals_66 = objc_alloc_init(PSUICarrierSpaceManager);
  return MEMORY[0x270F9A758]();
}

+ (int)carrierMetricTypeForString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  int v5 = 1;
  [v4 setNumberStyle:1];
  v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v6];

  v7 = [v4 numberFromString:v3];

  if (!v7)
  {
    v8 = [v3 lowercaseString];
    uint64_t v9 = [v8 isEqualToString:@"unlimited"];

    if (v9)
    {
      int v5 = 2;
    }
    else
    {
      v10 = [v3 lowercaseString];
      int v11 = [v10 isEqualToString:@"-"];

      int v5 = v11 - 1;
    }
  }

  return v5;
}

+ (BOOL)isCarrierMetricTypeValid:(int)a3
{
  return (a3 - 1) < 2;
}

+ (int64_t)bytesFromString:(id)a3 carrierSpaceUnits:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setNumberStyle:1];
  v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];

  v8 = [v6 numberFromString:v5];

  [v8 floatValue];
  float v10 = v9;
  switch(a4)
  {
    case 1:
      break;
    case 2:
      float v11 = 1024.0;
      goto LABEL_9;
    case 3:
      float v11 = 1048600.0;
      goto LABEL_9;
    case 4:
      float v11 = 1073700000.0;
      goto LABEL_9;
    case 5:
      float v11 = 1.0995e12;
LABEL_9:
      float v10 = v9 * v11;
      break;
    default:
      v12 = [MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierSpaceManager"];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = [NSNumber numberWithInteger:a4];
        int v15 = 138412290;
        v16 = v14;
        _os_log_error_impl(&dword_221B17000, v12, OS_LOG_TYPE_ERROR, "invalid carrier space unit type: %@", (uint8_t *)&v15, 0xCu);
      }
      break;
  }

  return (uint64_t)v10;
}

- (PSUICarrierSpaceManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)PSUICarrierSpaceManager;
  v2 = [(PSUICarrierSpaceManager *)&v13 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"carrier_space"];
    uint64_t v4 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v3];
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v4;

    [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
    v6 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"carrier_space_client"];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v7 = (void *)getCTCarrierSpaceClientClass_softClass;
    uint64_t v18 = getCTCarrierSpaceClientClass_softClass;
    if (!getCTCarrierSpaceClientClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getCTCarrierSpaceClientClass_block_invoke;
      v14[3] = &unk_2645E0D98;
      v14[4] = &v15;
      __getCTCarrierSpaceClientClass_block_invoke((uint64_t)v14);
      v7 = (void *)v16[3];
    }
    v8 = v7;
    _Block_object_dispose(&v15, 8);
    uint64_t v9 = [[v8 alloc] initWithQueue:v6];
    carrierSpaceClient = v2->_carrierSpaceClient;
    v2->_carrierSpaceClient = (CTCarrierSpaceClient *)v9;

    [(CTCarrierSpaceClient *)v2->_carrierSpaceClient setDelegate:v2];
    v2->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    float v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_refreshAndReload name:@"com.apple.PreferencesApp.willBecomeActive" object:0];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_serverConnection)
  {
    _CTServerConnectionUnregisterForAllNotifications();
    CFRelease(self->_serverConnection);
  }
  v3.receiver = self;
  v3.super_class = (Class)PSUICarrierSpaceManager;
  [(PSUICarrierSpaceManager *)&v3 dealloc];
}

- (BOOL)hasUserConsent
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = [(PSUICarrierSpaceManager *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Fetching user consent", (uint8_t *)&v7, 2u);
  }

  if (!self->_hasUserConsent) {
    [(PSUICarrierSpaceManager *)self refresh];
  }
  uint64_t v4 = [(PSUICarrierSpaceManager *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    hasUserConsent = self->_hasUserConsent;
    int v7 = 138412290;
    v8 = hasUserConsent;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Has carrier space user consent: %@", (uint8_t *)&v7, 0xCu);
  }

  return [(NSNumber *)self->_hasUserConsent BOOLValue];
}

- (id)userConsentFlowInfo
{
  userConsentFlowInfo = self->_userConsentFlowInfo;
  if (!userConsentFlowInfo)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    carrierSpaceClient = self->_carrierSpaceClient;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__PSUICarrierSpaceManager_userConsentFlowInfo__block_invoke;
    v8[3] = &unk_2645E1388;
    v8[4] = self;
    dispatch_semaphore_t v9 = v4;
    v6 = v4;
    [(CTCarrierSpaceClient *)carrierSpaceClient getUserConsentFlowInfo:v8];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    userConsentFlowInfo = self->_userConsentFlowInfo;
  }
  return userConsentFlowInfo;
}

void __46__PSUICarrierSpaceManager_userConsentFlowInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Error getting user consent flow info: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_semaphore_t v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setUserConsent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = [(PSUICarrierSpaceManager *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"did not consent the";
    if (v3) {
      id v6 = @"consented the";
    }
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "User %@ terms", (uint8_t *)&v9, 0xCu);
  }

  int v7 = [NSNumber numberWithBool:v3];
  userConsentResponse = self->_userConsentResponse;
  self->_userConsentResponse = v7;
}

- (void)userConsentAcknowledged:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  userConsentResponse = self->_userConsentResponse;
  if (userConsentResponse)
  {
    BOOL v5 = a3;
    uint64_t v6 = [(NSNumber *)userConsentResponse BOOLValue];
    int v7 = self->_userConsentResponse;
    self->_userConsentResponse = 0;

    uint64_t v8 = [(PSUICarrierSpaceManager *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = @"failed";
      if (v5) {
        int v9 = @"succeeded";
      }
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Server %@ in acknowledging user's consent response", buf, 0xCu);
    }

    if (v5)
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      carrierSpaceClient = self->_carrierSpaceClient;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __51__PSUICarrierSpaceManager_userConsentAcknowledged___block_invoke;
      v13[3] = &unk_2645E0D20;
      v13[4] = self;
      dispatch_semaphore_t v14 = v10;
      id v12 = v10;
      [(CTCarrierSpaceClient *)carrierSpaceClient setUserConsent:v6 completion:v13];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

void __51__PSUICarrierSpaceManager_userConsentAcknowledged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    dispatch_semaphore_t v4 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_221B17000, v4, OS_LOG_TYPE_ERROR, "Error setting user consent: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)reset
{
  capabilities = self->_capabilities;
  self->_capabilities = 0;

  usageInfo = self->_usageInfo;
  self->_usageInfo = 0;

  plansInfo = self->_plansInfo;
  self->_plansInfo = 0;

  appsInfo = self->_appsInfo;
  self->_appsInfo = 0;

  hasUserConsent = self->_hasUserConsent;
  self->_hasUserConsent = 0;

  userConsentFlowInfo = self->_userConsentFlowInfo;
  self->_userConsentFlowInfo = 0;

  userConsentResponse = self->_userConsentResponse;
  self->_userConsentResponse = 0;
}

- (void)refreshAndReload
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICarrierSpaceManager *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[PSUICarrierSpaceManager refreshAndReload]";
    __int16 v7 = 2112;
    uint64_t v8 = @"com.apple.PreferencesApp.willBecomeActive";
    __int16 v9 = 2112;
    dispatch_semaphore_t v10 = @"PSUICarrierSpaceChanged";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@ and will post notification %@", (uint8_t *)&v5, 0x20u);
  }

  [(PSUICarrierSpaceManager *)self refresh];
  dispatch_semaphore_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"PSUICarrierSpaceChanged" object:0];
}

- (void)refresh
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICarrierSpaceManager *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(PSUICarrierSpaceManager *)self capabilities];
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_debug_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEBUG, "Refreshing carrier space info, current capabilities: %@", buf, 0xCu);
  }
  if ([(PSUICarrierSpaceManager *)self supportsSweetgum])
  {
    [(PSUICarrierSpaceManager *)self reset];
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    int v5 = [(PSUICarrierSpaceManager *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[PSUICarrierSpaceManager refresh]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space refresh request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__PSUICarrierSpaceManager_refresh__block_invoke;
    v9[3] = &unk_2645E0D20;
    v9[4] = self;
    dispatch_semaphore_t v10 = v4;
    __int16 v7 = v4;
    [(CTCarrierSpaceClient *)carrierSpaceClient refreshAllInfo:v9];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __34__PSUICarrierSpaceManager_refresh__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  dispatch_semaphore_t v4 = v3;
  if (!v3)
  {
    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[PSUICarrierSpaceManager refresh]_block_invoke";
      uint64_t v11 = "%s refresh request succeeded";
      id v12 = v6;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
LABEL_11:

    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = *(void **)(v8 + 48);
    uint64_t v10 = MEMORY[0x263EFFA88];
    goto LABEL_12;
  }
  uint64_t v5 = [v3 code];
  id v6 = [*(id *)(a1 + 32) getLogger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 != 3)
  {
    if (v7)
    {
      int v14 = 136315394;
      uint64_t v15 = "-[PSUICarrierSpaceManager refresh]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      uint64_t v11 = "%s refresh request failed: %@";
      id v12 = v6;
      uint32_t v13 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    int v14 = 136315138;
    uint64_t v15 = "-[PSUICarrierSpaceManager refresh]_block_invoke";
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s refresh request failed: user consent required", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(void **)(v8 + 48);
  uint64_t v10 = MEMORY[0x263EFFA80];
LABEL_12:
  *(void *)(v8 + 48) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)supportsSweetgum
{
  id v3 = [(PSUICarrierSpaceManager *)self capabilities];
  if ([v3 supportsPlans])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(PSUICarrierSpaceManager *)self capabilities];
    if ([v5 supportsUsage])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(PSUICarrierSpaceManager *)self capabilities];
      if ([v6 supportsServices])
      {
        char v4 = 1;
      }
      else
      {
        BOOL v7 = [(PSUICarrierSpaceManager *)self capabilities];
        char v4 = [v7 supportsApplications];
      }
    }
  }
  return v4;
}

- (id)capabilities
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  capabilities = v2->_capabilities;
  if (!capabilities)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v5 = [(PSUICarrierSpaceManager *)v2 getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v13 = "-[PSUICarrierSpaceManager capabilities]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space get capabilities request", buf, 0xCu);
    }

    carrierSpaceClient = v2->_carrierSpaceClient;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__PSUICarrierSpaceManager_capabilities__block_invoke;
    v10[3] = &unk_2645E13B0;
    v10[4] = v2;
    BOOL v7 = v4;
    uint64_t v11 = v7;
    [(CTCarrierSpaceClient *)carrierSpaceClient getCapabilities:v10];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    capabilities = v2->_capabilities;
  }
  uint64_t v8 = capabilities;
  objc_sync_exit(v2);

  return v8;
}

void __39__PSUICarrierSpaceManager_capabilities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) getLogger];
  __int16 v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint32_t v13 = "-[PSUICarrierSpaceManager capabilities]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "%s get capabilities request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint32_t v13 = "-[PSUICarrierSpaceManager capabilities]_block_invoke";
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "%s get capabilities request succeeded", (uint8_t *)&v12, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  uint64_t v10 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(const char **)(*(void *)(a1 + 32) + 8);
    int v12 = 138412290;
    uint32_t v13 = v11;
    _os_log_debug_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEBUG, "Received carrier space capabilities: %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)usageInfo
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICarrierSpaceManager *)self capabilities];
  if ([v3 supportsUsage])
  {
    usageInfo = self->_usageInfo;

    if (usageInfo) {
      goto LABEL_7;
    }
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(PSUICarrierSpaceManager *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v13 = "-[PSUICarrierSpaceManager usageInfo]";
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space fetch usage info request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__PSUICarrierSpaceManager_usageInfo__block_invoke;
    v10[3] = &unk_2645E13D8;
    v10[4] = self;
    dispatch_semaphore_t v11 = v5;
    id v3 = v5;
    [(CTCarrierSpaceClient *)carrierSpaceClient fetchUsageInfo:1 completion:v10];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_7:
  uint64_t v8 = self->_usageInfo;
  return v8;
}

void __36__PSUICarrierSpaceManager_usageInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) getLogger];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint32_t v13 = "-[PSUICarrierSpaceManager usageInfo]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "%s fetch usage info request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint32_t v13 = "-[PSUICarrierSpaceManager usageInfo]_block_invoke";
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch usage info request succeeded", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)plansInfo
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICarrierSpaceManager *)self capabilities];
  if ([v3 supportsPlans])
  {
    plansInfo = self->_plansInfo;

    if (plansInfo) {
      goto LABEL_7;
    }
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(PSUICarrierSpaceManager *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint32_t v13 = "-[PSUICarrierSpaceManager plansInfo]";
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space fetch plans info request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__PSUICarrierSpaceManager_plansInfo__block_invoke;
    v10[3] = &unk_2645E1400;
    v10[4] = self;
    dispatch_semaphore_t v11 = v5;
    id v3 = v5;
    [(CTCarrierSpaceClient *)carrierSpaceClient fetchPlansInfo:1 completion:v10];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_7:
  uint64_t v8 = self->_plansInfo;
  return v8;
}

void __36__PSUICarrierSpaceManager_plansInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) getLogger];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint32_t v13 = "-[PSUICarrierSpaceManager plansInfo]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "%s fetch plans info request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint32_t v13 = "-[PSUICarrierSpaceManager plansInfo]_block_invoke";
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch plans info request succeeded", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)subscribedPlanOptions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  dispatch_semaphore_t v4 = [(PSUICarrierSpaceManager *)self plansInfo];
  id v5 = [v4 planGroupsList];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = objc_msgSend(v10, "groupOptionsList", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v16 planStatus] == 1) {
                [v3 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  uint64_t v17 = (void *)[v3 copy];
  return v17;
}

- (id)subscribedDomesticPlanOptions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  dispatch_semaphore_t v4 = [(PSUICarrierSpaceManager *)self plansInfo];
  id v5 = [v4 planGroupsList];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 planCategory] == 1)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = objc_msgSend(v10, "groupOptionsList", 0);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                if ([v16 planStatus] == 1) {
                  [v3 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  uint64_t v17 = (void *)[v3 copy];
  return v17;
}

- (id)planMetrics
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  dispatch_semaphore_t v4 = [(PSUICarrierSpaceManager *)self usageInfo];
  id v5 = [v4 accountMetrics];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = objc_msgSend(v10, "applicablePlans", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              [v3 addObject:*(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  uint64_t v16 = (void *)[v3 copy];
  return v16;
}

- (id)appsInfo
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICarrierSpaceManager *)self capabilities];
  if ([v3 supportsApplications])
  {
    appsInfo = self->_appsInfo;

    if (appsInfo) {
      goto LABEL_7;
    }
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [(PSUICarrierSpaceManager *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[PSUICarrierSpaceManager appsInfo]";
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space fetch apps info request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__PSUICarrierSpaceManager_appsInfo__block_invoke;
    v10[3] = &unk_2645E1428;
    v10[4] = self;
    dispatch_semaphore_t v11 = v5;
    id v3 = v5;
    [(CTCarrierSpaceClient *)carrierSpaceClient fetchAppsInfo:1 completion:v10];
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
LABEL_7:
  uint64_t v8 = self->_appsInfo;
  return v8;
}

void __35__PSUICarrierSpaceManager_appsInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [*(id *)(a1 + 32) getLogger];
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[PSUICarrierSpaceManager appsInfo]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "%s fetch apps info request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[PSUICarrierSpaceManager appsInfo]_block_invoke";
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "%s fetch apps info request succeeded", (uint8_t *)&v12, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  uint64_t v10 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    dispatch_semaphore_t v11 = *(const char **)(*(void *)(a1 + 32) + 32);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_debug_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEBUG, "Received carrier space apps info: %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)carrierAppInstallController
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICarrierSpaceManager *)self appsInfo];
  dispatch_semaphore_t v4 = [v3 appsList];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(PSUICarrierSpaceManager *)self appsInfo];
    uint64_t v7 = [v6 appsList];
    uint64_t v8 = [(id)v7 objectAtIndexedSubscript:0];

    uint64_t v9 = [(PSUIAppInstallController *)self->_carrierAppInstallController appID];
    LOBYTE(v7) = [v9 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      uint64_t v10 = [(PSUICarrierSpaceManager *)self getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 138412290;
        long long v20 = (const char *)v8;
        _os_log_debug_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEBUG, "Instantiating app install controller with app ID: %@", (uint8_t *)&v19, 0xCu);
      }

      dispatch_semaphore_t v11 = [PSUIAppInstallController alloc];
      int v12 = [(PSUICarrierSpaceManager *)self appsInfo];
      uint64_t v13 = [v12 appsURL];
      __int16 v14 = [(PSUIAppInstallController *)v11 initWithAppID:v8 carrierMoreAppsURL:v13];
      carrierAppInstallController = self->_carrierAppInstallController;
      self->_carrierAppInstallController = v14;
    }
    uint64_t v16 = self->_carrierAppInstallController;
  }
  else
  {
    uint64_t v8 = [(PSUICarrierSpaceManager *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      appsInfo = self->_appsInfo;
      int v19 = 136315394;
      long long v20 = "-[PSUICarrierSpaceManager carrierAppInstallController]";
      __int16 v21 = 2112;
      long long v22 = appsInfo;
      _os_log_debug_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEBUG, "%s: appsInfo does not contain any apps: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)planChangeIsRestricted
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F537F0]] == 2;

  return v3;
}

- (id)descriptionForPlanMetrics:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 dataUsage];
  id v6 = [v5 sharedDataUsed];
  uint64_t v7 = [v6 length];

  uint64_t v8 = [v4 dataUsage];
  uint64_t v9 = v8;
  if (v7) {
    [v8 sharedDataUsed];
  }
  else {
  uint64_t v10 = [v8 thisDeviceDataUsed];
  }

  int v11 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v10];
  if (v11 == 1)
  {
    int v12 = [v4 dataUsage];
    int64_t v13 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v10, [v12 units]);
  }
  else
  {
    int64_t v13 = 0;
  }
  __int16 v14 = [(PSUICarrierSpaceManager *)self localizedDataStringFromBytes:v13];
  id v15 = [v4 dataUsage];
  uint64_t v16 = [v15 capacity];
  int v17 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v16];

  if (v17 != 1)
  {
    uint64_t v23 = [(PSUICarrierSpaceManager *)self localizedDataStringFromBytes:0];
    if (v11 == 1)
    {
      v27 = NSString;
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v25 = v28;
      if (v17 == 2) {
        uint64_t v29 = @"USED_%@_OF_UNLIMITED";
      }
      else {
        uint64_t v29 = @"USED_%@";
      }
      long long v26 = [v28 localizedStringForKey:v29 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
      objc_msgSend(v27, "stringWithFormat:", v26, v14, v36);
      goto LABEL_20;
    }
    if (!v11)
    {
      if (v17 == 2)
      {
        long long v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v30 = [v25 localizedStringForKey:@"UNLIMITED" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
        goto LABEL_21;
      }
      v31 = [(PSUICarrierSpaceManager *)self getLogger];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        v30 = &stru_26D410CA0;
        goto LABEL_22;
      }
      *(_DWORD *)buf = 136315138;
      v38 = "-[PSUICarrierSpaceManager descriptionForPlanMetrics:]";
      v33 = "%s failed to generate description for plan with hidden used data metric type";
      v34 = v31;
      uint32_t v35 = 12;
LABEL_30:
      _os_log_error_impl(&dword_221B17000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
      goto LABEL_17;
    }
LABEL_16:
    v31 = [(PSUICarrierSpaceManager *)self getLogger];
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315394;
    v38 = "-[PSUICarrierSpaceManager descriptionForPlanMetrics:]";
    __int16 v39 = 1024;
    int v40 = v11;
    v33 = "%s failed to generate description for plan with used data metric type of %i";
    v34 = v31;
    uint32_t v35 = 18;
    goto LABEL_30;
  }
  long long v18 = [v4 dataUsage];
  int v19 = [v18 capacity];
  long long v20 = [v4 dataUsage];
  int64_t v21 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v19, [v20 units]);

  long long v22 = [(PSUICarrierSpaceManager *)self localizedDataStringFromBytes:v21];
  uint64_t v23 = v22;
  if (v11 != 1)
  {
    if (!v11)
    {
      uint64_t v23 = v22;
      v30 = v23;
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  long long v24 = NSString;
  long long v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v26 = [v25 localizedStringForKey:@"USED_%@_OF_%@" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
  objc_msgSend(v24, "stringWithFormat:", v26, v14, v23);
LABEL_20:
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:

  return v30;
}

- (id)localizedDataStringFromBytes:(unint64_t)a3
{
  return (id)MEMORY[0x270EF2B10](a3, 0, 271056896);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [(PSUICarrierSpaceManager *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICarrierSpaceManager simStatusDidChange:status:]";
    __int16 v8 = 2112;
    uint64_t v9 = @"PSCarrierSpaceSIMStatusChanged";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PSCarrierSpaceSIMStatusChanged" object:0];
}

- (void)capabilitiesDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PSUICarrierSpaceManager_capabilitiesDidChange___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__PSUICarrierSpaceManager_capabilitiesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) reset];
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PSUICarrierSpaceManager capabilitiesDidChange:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = @"PSUICarrierSpaceChanged";
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v4, 0x16u);
  }

  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"PSUICarrierSpaceChanged" object:0];
}

- (void)usageDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PSUICarrierSpaceManager_usageDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__PSUICarrierSpaceManager_usageDidChange__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  int v4 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICarrierSpaceManager usageDidChange]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = @"PSUICarrierSpaceChanged";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PSUICarrierSpaceChanged" object:0];
}

- (void)plansDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PSUICarrierSpaceManager_plansDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__PSUICarrierSpaceManager_plansDidChange__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  int v4 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICarrierSpaceManager plansDidChange]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = @"PSUICarrierSpaceChanged";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PSUICarrierSpaceChanged" object:0];
}

- (void)appsDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__PSUICarrierSpaceManager_appsDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __40__PSUICarrierSpaceManager_appsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  int v4 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICarrierSpaceManager appsDidChange]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = @"PSUICarrierSpaceChanged";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PSUICarrierSpaceChanged" object:0];
}

- (void)userConsentFlowInfoDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PSUICarrierSpaceManager_userConsentFlowInfoDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__PSUICarrierSpaceManager_userConsentFlowInfoDidChange__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = 0;

  __int16 v8 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "-[PSUICarrierSpaceManager userConsentFlowInfoDidChange]_block_invoke";
    __int16 v12 = 2112;
    int64_t v13 = @"PSUICarrierSpaceChanged";
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"PSUICarrierSpaceChanged" object:0];
}

+ (id)getNSURLSessionConfiguration
{
  uint64_t v2 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  BOOL v3 = (void *)getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr;
  uint64_t v10 = getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr;
  if (!getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)CTCarrierSpaceLibrary();
    v8[3] = (uint64_t)dlsym(v4, "kCTCarrierSpaceConnectionAccountIdentifier");
    getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr = v8[3];
    BOOL v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
  {
    dlerror();
    uint64_t v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  objc_msgSend(v2, "set_sourceApplicationSecondaryIdentifier:", *v3);
  return v2;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierSpaceManager"];
}

- (CTCarrierSpaceClient)carrierSpaceClient
{
  return self->_carrierSpaceClient;
}

- (void)setCarrierSpaceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_userConsentResponse, 0);
  objc_storeStrong((id *)&self->_userConsentFlowInfo, 0);
  objc_storeStrong((id *)&self->_hasUserConsent, 0);
  objc_storeStrong((id *)&self->_carrierAppInstallController, 0);
  objc_storeStrong((id *)&self->_appsInfo, 0);
  objc_storeStrong((id *)&self->_plansInfo, 0);
  objc_storeStrong((id *)&self->_usageInfo, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end