@interface TSCoreTelephonyClientCache
+ (id)sharedInstance;
- (BOOL)deviceSupportsHydra;
- (BOOL)getTransferCapability:(unint64_t)a3;
- (BOOL)isEOnly;
- (BOOL)isEmbeddedSIMOnlyConfig;
- (BOOL)usingBootstrapDataService;
- (TSCoreTelephonyClientCache)init;
- (id)getCoreTelephonyClient;
- (id)updateSecureIntentData:(id)a3;
- (void)bootstrapPlanTransferUsingMessageSession:(id)a3 completion:(id)a4;
- (void)cancelTransferPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)convertPhysicalSIMToeSIMWithCompletion:(id)a3;
- (void)deviceSupportsHydra;
- (void)getCarrierSetupWithCompletion:(id)a3;
- (void)getPlanTransferCredentials:(id)a3 completion:(id)a4;
- (void)getSubscriptionInfo:(id)a3;
- (void)getWebsheetInfoForPlan:(id)a3 inBuddy:(BOOL)a4 completion:(id)a5;
- (void)hideTransferPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5;
- (void)installPendingPlan:(id)a3 completion:(id)a4;
- (void)installPendingPlanList:(id)a3 completion:(id)a4;
- (void)isAnyPlanOfTransferCapability:(unint64_t)a3 withCompletion:(id)a4;
- (void)pendingInstallItemsWithCompletion:(id)a3;
- (void)setDataFallbackEnabled:(BOOL)a3 forIccid:(id)a4;
- (void)setIsEOnly:(BOOL)a3;
- (void)submitPlanSetupDetails:(id)a3;
- (void)submitSimSetupUsage:(id)a3;
- (void)transferPlanListWithCompletion:(id)a3;
- (void)transferPlanWithIdentifier:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
- (void)transferPlansWithIdentifier:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation TSCoreTelephonyClientCache

+ (id)sharedInstance
{
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

uint64_t __44__TSCoreTelephonyClientCache_sharedInstance__block_invoke()
{
  sharedInstance_instance_1 = objc_alloc_init(TSCoreTelephonyClientCache);
  return MEMORY[0x270F9A758]();
}

- (TSCoreTelephonyClientCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)TSCoreTelephonyClientCache;
  v2 = [(TSCoreTelephonyClientCache *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v4 = [v3 initWithQueue:MEMORY[0x263EF83A0]];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;
  }
  return v2;
}

- (id)getCoreTelephonyClient
{
  return self->_client;
}

- (void)transferPlanListWithCompletion:(id)a3
{
  id v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke;
  v7[3] = &unk_264828928;
  id v8 = v4;
  id v6 = v4;
  [(CoreTelephonyClient *)client getTransferPlansWithCompletion:v7];
}

void __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v26 = a4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = v5;
  obuint64_t j = [v5 devices];
  uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (!v32)
  {
    char v30 = 0;
    goto LABEL_26;
  }
  char v30 = 0;
  uint64_t v31 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (*(void *)v38 != v31) {
        objc_enumerationMutation(obj);
      }
      objc_super v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v8 = [v7 remoteDisplayPlans];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v49 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            v14 = [v13 plan];

            if (!v14)
            {
              v20 = _TSLogDomain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_2(v47, &v48, v20);
              }
              goto LABEL_19;
            }
            v15 = [v13 plan];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              v20 = _TSLogDomain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v21 = [v13 plan];
                *(_DWORD *)buf = 138412546;
                v42 = v21;
                __int16 v43 = 2080;
                v44 = "-[TSCoreTelephonyClientCache transferPlanListWithCompletion:]_block_invoke";
                _os_log_error_impl(&dword_227A17000, v20, OS_LOG_TYPE_ERROR, "[E]%@ is not a CTRemotePlan @%s", buf, 0x16u);
              }
LABEL_19:

              continue;
            }
            v17 = [v13 plan];
            v18 = [v17 transferAttributes];
            uint64_t v19 = [v18 transferCapability];

            if (v19 == 11)
            {
              char v30 = 1;
              goto LABEL_22;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v49 count:16];
        }
        while (v10);
      }
LABEL_22:
    }
    uint64_t v32 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
  }
  while (v32);
LABEL_26:

  v22 = _TSLogDomain();
  v23 = v22;
  if (v26)
  {
    v24 = v28;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_1();
    }
  }
  else
  {
    v24 = v28;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = @"NO";
      if (v30) {
        v25 = @"YES";
      }
      *(_DWORD *)buf = 138412802;
      v42 = v28;
      __int16 v43 = 2112;
      v44 = (const char *)v25;
      __int16 v45 = 2080;
      v46 = "-[TSCoreTelephonyClientCache transferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v23, OS_LOG_TYPE_INFO, "[I] Tranfer plan list: %@ isActivationPolicyMismatch: %@ @%s", buf, 0x20u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transferPlanWithIdentifier:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke;
  v11[3] = &unk_264828950;
  id v12 = v8;
  id v10 = v8;
  [(CoreTelephonyClient *)client transferPlan:a3 fromDevice:a4 completionHandler:v11];
}

void __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if (v6)
  {
    objc_super v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transferPlansWithIdentifier:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke;
  v11[3] = &unk_264828950;
  id v12 = v8;
  id v10 = v8;
  [(CoreTelephonyClient *)client transferPlans:a3 fromDevice:a4 completionHandler:v11];
}

void __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if (v6)
  {
    objc_super v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelTransferPlan:(id)a3 fromDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke;
  v11[3] = &unk_264827FE8;
  id v12 = v8;
  id v10 = v8;
  [(CoreTelephonyClient *)client cancelCellularPlanTransfer:a3 fromDevice:a4 completionHandler:v11];
}

void __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPlanTransferCredentials:(id)a3 completion:(id)a4
{
  id v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke;
  v9[3] = &unk_264828978;
  id v10 = v6;
  id v8 = v6;
  [(CoreTelephonyClient *)client getPlanTransferCredentials:a3 completion:v9];
}

void __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_super v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)bootstrapPlanTransferUsingMessageSession:(id)a3 completion:(id)a4
{
}

- (void)isAnyPlanOfTransferCapability:(unint64_t)a3 withCompletion:(id)a4
{
}

- (BOOL)getTransferCapability:(unint64_t)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  dispatch_time_t v6 = dispatch_time(0, 20000000000);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  client = self->_client;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke;
  v10[3] = &unk_2648289A0;
  id v12 = &v13;
  id v8 = v5;
  uint64_t v11 = v8;
  [(CoreTelephonyClient *)client isAnyPlanOfTransferCapability:a3 availableForThisDeviceWithCompletion:v10];
  dispatch_semaphore_wait(v8, v6);
  LOBYTE(v6) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    dispatch_time_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setDataFallbackEnabled:(BOOL)a3 forIccid:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  client = self->_client;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke;
  v9[3] = &unk_2648289C8;
  BOOL v11 = v4;
  id v10 = v6;
  id v8 = v6;
  [(CoreTelephonyClient *)client setSupportDynamicDataSimSwitch:v4 forIccid:v8 completion:v9];
}

void __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)pendingInstallItemsWithCompletion:(id)a3
{
  id v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke;
  v7[3] = &unk_2648289F0;
  id v8 = v4;
  id v6 = v4;
  [(CoreTelephonyClient *)client plansPendingInstallWithCompletion:v7];
}

void __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_super v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke_cold_1();
    }
  }
  id v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2080;
    id v12 = "-[TSCoreTelephonyClientCache pendingInstallItemsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_INFO, "[I] Pending install items: %@ @%s", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)installPendingPlan:(id)a3 completion:(id)a4
{
}

- (void)installPendingPlanList:(id)a3 completion:(id)a4
{
}

- (void)hideTransferPlan:(id)a3 fromDevice:(id)a4 completion:(id)a5
{
}

- (void)convertPhysicalSIMToeSIMWithCompletion:(id)a3
{
  id v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__TSCoreTelephonyClientCache_convertPhysicalSIMToeSIMWithCompletion___block_invoke;
  v7[3] = &unk_264827FE8;
  id v8 = v4;
  id v6 = v4;
  [(CoreTelephonyClient *)client convertPhysicalToeSIMWithCompletionHandler:v7];
}

void __69__TSCoreTelephonyClientCache_convertPhysicalSIMToeSIMWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2080;
    int v9 = "-[TSCoreTelephonyClientCache convertPhysicalSIMToeSIMWithCompletion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "convert psim -> esim. error:%@ @%s", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)getSubscriptionInfo:(id)a3
{
}

- (BOOL)deviceSupportsHydra
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  client = self->_client;
  id v11 = 0;
  id v3 = [(CoreTelephonyClient *)client supportsHydraWithError:&v11];
  id v4 = v11;
  uint64_t v5 = _TSLogDomain();
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v3 BOOLValue];
      __int16 v8 = @"Not Supported";
      if (v7) {
        __int16 v8 = @"Supported";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "-[TSCoreTelephonyClientCache deviceSupportsHydra]";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Checking hydra result: %@ @%s", buf, 0x16u);
    }

    char v9 = [v3 BOOLValue];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[TSCoreTelephonyClientCache deviceSupportsHydra]();
    }

    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEmbeddedSIMOnlyConfig
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke;
  block[3] = &unk_2648279D0;
  block[4] = self;
  if (isEmbeddedSIMOnlyConfig_onceToken != -1) {
    dispatch_once(&isEmbeddedSIMOnlyConfig_onceToken, block);
  }
  return self->_isEOnly;
}

void __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v7 = 0;
  id v3 = [v2 isEmbeddedSIMOnlyConfig:&v7];
  id v4 = v7;
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    int v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = [v3 BOOLValue];
  }
}

- (void)submitSimSetupUsage:(id)a3
{
}

void __50__TSCoreTelephonyClientCache_submitSimSetupUsage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__TSCoreTelephonyClientCache_submitSimSetupUsage___block_invoke_cold_1();
    }
  }
}

- (void)getCarrierSetupWithCompletion:(id)a3
{
  id v4 = a3;
  client = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke;
  v7[3] = &unk_2648289F0;
  id v8 = v4;
  id v6 = v4;
  [(CoreTelephonyClient *)client getCarrierSetupWithCompletion:v7];
}

void __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke_cold_1();
    }
  }
  id v8 = _TSLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2080;
    id v12 = "-[TSCoreTelephonyClientCache getCarrierSetupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v8, OS_LOG_TYPE_INFO, "[I] Carrier setup items: %@ @%s", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getWebsheetInfoForPlan:(id)a3 inBuddy:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  client = self->_client;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke;
  v11[3] = &unk_264828A18;
  id v12 = v8;
  id v10 = v8;
  [(CoreTelephonyClient *)client websheetInfoForPlan:a3 inBuddy:v5 completion:v11];
}

void __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke_cold_1();
    }
  }
  __int16 v11 = _TSLogDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2080;
    v17 = "-[TSCoreTelephonyClientCache getWebsheetInfoForPlan:inBuddy:completion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_INFO, "[I] Websheet: %@ Postdata: %@ @%s", (uint8_t *)&v12, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)updateSecureIntentData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(CoreTelephonyClient *)self->_client updateSecureIntentData:a3];
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2080;
      id v9 = "-[TSCoreTelephonyClientCache updateSecureIntentData:]";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "updateSecureIntentData failed:%@ @%s", (uint8_t *)&v6, 0x16u);
    }
  }
  return v3;
}

- (BOOL)usingBootstrapDataService
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  client = self->_client;
  id v8 = 0;
  id v3 = [(CoreTelephonyClient *)client usingBootstrapDataService:&v8];
  id v4 = v8;
  if (v4)
  {
    BOOL v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v4;
      __int16 v11 = 2080;
      int v12 = "-[TSCoreTelephonyClientCache usingBootstrapDataService]";
      _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "usingBootstrapDataService failed:%@ @%s", buf, 0x16u);
    }
  }
  char v6 = [v3 BOOLValue];

  return v6;
}

- (void)submitPlanSetupDetails:(id)a3
{
}

void __53__TSCoreTelephonyClientCache_submitPlanSetupDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__TSCoreTelephonyClientCache_submitPlanSetupDetails___block_invoke_cold_1();
    }
  }
}

- (BOOL)isEOnly
{
  return self->_isEOnly;
}

- (void)setIsEOnly:(BOOL)a3
{
  self->_isEOnly = a3;
}

- (void).cxx_destruct
{
}

void __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Tranfer plan list retrieval failed: %@ @%s", v2, v3, v4, v5, v6);
}

void __61__TSCoreTelephonyClientCache_transferPlanListWithCompletion___block_invoke_cold_2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSCoreTelephonyClientCache transferPlanListWithCompletion:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid CTRemotePlan @%s", buf, 0xCu);
}

void __86__TSCoreTelephonyClientCache_transferPlanWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

void __87__TSCoreTelephonyClientCache_transferPlansWithIdentifier_fromDevice_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

void __78__TSCoreTelephonyClientCache_cancelTransferPlan_fromDevice_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

void __68__TSCoreTelephonyClientCache_getPlanTransferCredentials_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

void __52__TSCoreTelephonyClientCache_getTransferCapability___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

void __62__TSCoreTelephonyClientCache_setDataFallbackEnabled_forIccid___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  int v6 = 138413058;
  if (v3) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2080;
  uint64_t v13 = "-[TSCoreTelephonyClientCache setDataFallbackEnabled:forIccid:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]enabled:%@, iccid: %@, %@ @%s", (uint8_t *)&v6, 0x2Au);
}

void __64__TSCoreTelephonyClientCache_pendingInstallItemsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

- (void)deviceSupportsHydra
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Error checking hydra: %@ @%s", v2, v3, v4, v5, v6);
}

void __53__TSCoreTelephonyClientCache_isEmbeddedSIMOnlyConfig__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]query eONLY failed : %@ @%s", v2, v3, v4, v5, v6);
}

void __50__TSCoreTelephonyClientCache_submitSimSetupUsage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]submit sim setup usage failure. error:%@ @%s", v2, v3, v4, v5, v6);
}

void __60__TSCoreTelephonyClientCache_getCarrierSetupWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

void __72__TSCoreTelephonyClientCache_getWebsheetInfoForPlan_inBuddy_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

void __53__TSCoreTelephonyClientCache_submitPlanSetupDetails___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]submit plan setup details failure. error:%@ @%s", v2, v3, v4, v5, v6);
}

@end