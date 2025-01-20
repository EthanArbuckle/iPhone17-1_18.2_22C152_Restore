@interface TSCellularPlanManagerCache
+ (id)sharedInstance;
- (NSArray)cachedPlanItems;
- (NSArray)danglingPlanItems;
- (NSArray)planItems;
- (NSError)lastError;
- (TSCellularPlanManagerCache)init;
- (TSCellularPlanManagerCacheDelegate)delegate;
- (id)_getValidatedPlanItemFor:(id)a3;
- (id)getDanglingPlanItems;
- (id)getPredefinedLabels;
- (id)getShortLabelsForLabels:(id)a3;
- (id)getSubscriptionContextUUIDforPlan:(id)a3;
- (id)remapSimLabel:(id)a3 to:(id)a4;
- (id)setLabelForPlan:(id)a3 label:(id)a4;
- (int64_t)calculateInstallConsentTextTypeFor:(id)a3;
- (void)_initializePlanItems;
- (void)_updateCachedPlanItems;
- (void)_updateLocalCachedPlanItems:(id)a3;
- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 confirmationCode:(id)a5 userConsent:(int64_t)a6 completion:(id)a7;
- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 userConsentResponse:(int64_t)a5 completion:(id)a6;
- (void)dealloc;
- (void)didEnablePlanItems:(id)a3;
- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7;
- (void)didPurchasePlanForEid:(id)a3 iccid:(id)a4 smdpURL:(id)a5 state:(id)a6;
- (void)didTransferPlanForEid:(id)a3 iccid:(id)a4 srcIccid:(id)a5 smdpURL:(id)a6 state:(id)a7;
- (void)hasInstallingPlanOrUserPlan:(id)a3;
- (void)planItemsWithCompletion:(id)a3;
- (void)provideUserResponse:(int64_t)a3 confirmationCode:(id)a4;
- (void)resetDelegate:(id)a3;
- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4;
- (void)selectPlanForData:(id)a3;
- (void)selectPlanForVoice:(id)a3;
- (void)selectPlansForIMessage:(id)a3;
- (void)sendUserResponse:(unint64_t)a3 confirmationCode:(id)a4;
- (void)setCachedPlanItems:(id)a3;
- (void)setDanglingPlanItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastError:(id)a3;
- (void)shouldShowPlanSetupWithCompletion:(id)a3;
@end

@implementation TSCellularPlanManagerCache

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __44__TSCellularPlanManagerCache_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(TSCellularPlanManagerCache);
  return MEMORY[0x270F9A758]();
}

- (TSCellularPlanManagerCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanManagerCache;
  v2 = [(TSCellularPlanManagerCache *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__updateLocalCachedPlanItems_ name:*MEMORY[0x263F31948] object:0];
  }
  return v2;
}

- (void)planItemsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    objc_super v5 = [MEMORY[0x263F31978] sharedManager];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke;
    v14[3] = &unk_2648285F0;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    id v15 = v4;
    [v5 planItemsWithCompletion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache planItemsWithCompletion:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2;
  block[3] = &unk_2648285C8;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v15 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v16);
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (!*(void *)(a1 + 32))
    {
      [*(id *)(a1 + 40) setCachedPlanItems:*(void *)(a1 + 48)];
      uint64_t v18 = *(void *)(a1 + 56);
      v19 = [*(id *)(a1 + 40) cachedPlanItems];
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

      goto LABEL_11;
    }
    v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_2(a1 + 32, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_11:
}

- (void)hasInstallingPlanOrUserPlan:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__TSCellularPlanManagerCache_hasInstallingPlanOrUserPlan___block_invoke;
    v14[3] = &unk_264828078;
    uint64_t v15 = v4;
    [(TSCellularPlanManagerCache *)self planItemsWithCompletion:v14];
    uint64_t v6 = v15;
  }
  else
  {
    uint64_t v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache hasInstallingPlanOrUserPlan:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t __58__TSCellularPlanManagerCache_hasInstallingPlanOrUserPlan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [a2 count] != 0;
  id v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);
  return v4(v2, v3);
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanManagerCache;
  [(TSCellularPlanManagerCache *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2080;
    uint64_t v9 = "-[TSCellularPlanManagerCache setDelegate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "set delegate : %@ @%s", (uint8_t *)&v6, 0x16u);
  }

  objc_storeWeak((id *)&self->delegate, v4);
}

- (void)resetDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    int v9 = 138412802;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2080;
    uint64_t v14 = "-[TSCellularPlanManagerCache resetDelegate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "reset delegate : %@ <> removedDelegate: %@ @%s", (uint8_t *)&v9, 0x20u);
  }
  p_delegate = &self->delegate;
  id v8 = objc_loadWeakRetained((id *)p_delegate);

  if (v8 == v4) {
    objc_storeWeak((id *)p_delegate, 0);
  }
}

- (NSArray)planItems
{
  cachedPlanItems = self->_cachedPlanItems;
  if (!cachedPlanItems)
  {
    objc_sync_enter(0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__TSCellularPlanManagerCache_planItems__block_invoke;
    block[3] = &unk_2648279D0;
    void block[4] = self;
    if (planItems_onceToken != -1) {
      dispatch_once(&planItems_onceToken, block);
    }
    objc_sync_exit(0);
    cachedPlanItems = self->_cachedPlanItems;
  }
  return cachedPlanItems;
}

uint64_t __39__TSCellularPlanManagerCache_planItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCachedPlanItems];
}

- (void)shouldShowPlanSetupWithCompletion:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F31978];
  id v4 = a3;
  id v5 = [v3 sharedManager];
  [v5 shouldShowPlanSetup:v4];
}

- (void)selectPlanForData:(id)a3
{
  BOOL v3 = [(TSCellularPlanManagerCache *)self _getValidatedPlanItemFor:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x263F31978] sharedManager];
    [v4 didSelectPlanForData:v3 completion:&__block_literal_global_31];
  }
  else
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache selectPlanForData:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __48__TSCellularPlanManagerCache_selectPlanForData___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48__TSCellularPlanManagerCache_selectPlanForData___block_invoke_cold_1();
    }
  }
}

- (void)selectPlanForVoice:(id)a3
{
  BOOL v3 = [(TSCellularPlanManagerCache *)self _getValidatedPlanItemFor:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x263F31978] sharedManager];
    [v4 didSelectPlanForDefaultVoice:v3 completion:&__block_literal_global_33];
  }
  else
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache selectPlanForVoice:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __49__TSCellularPlanManagerCache_selectPlanForVoice___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__TSCellularPlanManagerCache_selectPlanForVoice___block_invoke_cold_1();
    }
  }
}

- (void)selectPlansForIMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TSCellularPlanManagerCache selectPlansForIMessage:]();
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        __int16 v13 = -[TSCellularPlanManagerCache _getValidatedPlanItemFor:](self, "_getValidatedPlanItemFor:", v12, (void)v17);
        if (v13)
        {
          [v6 addObject:v12];
        }
        else
        {
          uint64_t v14 = _TSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            [(TSCellularPlanManagerCache *)buf selectPlansForIMessage:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    uint64_t v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanManagerCache selectPlansForIMessage:](v6, v15);
    }

    uint64_t v16 = [MEMORY[0x263F31978] sharedManager];
    [v16 didSelectPlansForIMessage:v6 completion:&__block_literal_global_36];
  }
}

void __53__TSCellularPlanManagerCache_selectPlansForIMessage___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__TSCellularPlanManagerCache_selectPlansForIMessage___block_invoke_cold_1();
    }
  }
}

- (id)getPredefinedLabels
{
  uint64_t v2 = [MEMORY[0x263F31978] sharedManager];
  BOOL v3 = [v2 getPredefinedLabels];

  return v3;
}

- (id)setLabelForPlan:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = [(TSCellularPlanManagerCache *)self _getValidatedPlanItemFor:a3];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v9 = [v8 setLabelForPlan:v7 label:v6];

    if (v9)
    {
      uint64_t v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TSCellularPlanManagerCache setLabelForPlan:label:]();
      }
    }
    [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
  }
  else
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache setLabelForPlan:label:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)getShortLabelsForLabels:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F31978];
  id v4 = a3;
  uint64_t v5 = [v3 sharedManager];
  id v6 = [v5 getShortLabelsForLabels:v4];

  return v6;
}

- (id)getDanglingPlanItems
{
  uint64_t v2 = [MEMORY[0x263F31978] sharedManager];
  BOOL v3 = [v2 danglingPlanItemsShouldUpdate:0];

  return v3;
}

- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 userConsentResponse:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _TSLogDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[TSCellularPlanManagerCache addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:]();
  }

  uint64_t v14 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __101__TSCellularPlanManagerCache_addNewPlanWithCardData_confirmationCode_userConsentResponse_completion___block_invoke;
  long long v19 = &unk_264828618;
  long long v20 = self;
  id v21 = v12;
  id v15 = v12;
  [v14 addNewPlanWithCardData:v10 confirmationCode:v11 triggerType:2 userConsent:a5 completion:&v16];

  [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
}

void __101__TSCellularPlanManagerCache_addNewPlanWithCardData_confirmationCode_userConsentResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = [v3 domain];
    if ([v4 isEqualToString:*MEMORY[0x263F31920]])
    {
      if ([v6 code] == 19)
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v5 = [v6 code];

      if (v5 == 2) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 planItemsUpdated:0 planListError:v6];
    goto LABEL_8;
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 confirmationCode:(id)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = _TSLogDomain();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2048;
    int64_t v29 = a6;
    __int16 v30 = 2080;
    v31 = "-[TSCellularPlanManagerCache addNewPlanWithAddress:matchingId:confirmationCode:userConsent:completion:]";
    _os_log_debug_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEBUG, "[Db] SMDP: %@, matchingid: %@ cc: %@ signup consent %lu @%s", buf, 0x34u);
  }

  if (BYSetupAssistantNeedsToRun()) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2;
  }
  uint64_t v18 = [MEMORY[0x263F31978] sharedManager];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __103__TSCellularPlanManagerCache_addNewPlanWithAddress_matchingId_confirmationCode_userConsent_completion___block_invoke;
  v20[3] = &unk_264828618;
  v20[4] = self;
  id v21 = v15;
  id v19 = v15;
  [v18 addNewPlanWithAddress:v12 matchingId:v13 oid:0 confirmationCode:v14 triggerType:v17 userConsent:a6 completion:v20];

  [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
}

void __103__TSCellularPlanManagerCache_addNewPlanWithAddress_matchingId_confirmationCode_userConsent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:"))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 planItemsUpdated:0 planListError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4
{
  BOOL v5 = a3;
  id v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[TSCellularPlanManagerCache resumePlanProvisioning:userConsent:](v5, a4, v7);
  }

  uint64_t v8 = [MEMORY[0x263F31978] sharedManager];
  [v8 resumePlanProvisioning:v5 userConsent:a4 completion:&__block_literal_global_40];

  [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
}

void __65__TSCellularPlanManagerCache_resumePlanProvisioning_userConsent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__TSCellularPlanManagerCache_resumePlanProvisioning_userConsent___block_invoke_cold_1();
    }
  }
}

- (id)remapSimLabel:(id)a3 to:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x263F31978];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 sharedManager];
  uint64_t v9 = [v8 remapSimLabel:v7 to:v6];

  if (v9)
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache remapSimLabel:to:]();
    }
  }
  return v9;
}

- (int64_t)calculateInstallConsentTextTypeFor:(id)a3
{
  return [MEMORY[0x263F31978] calculateInstallConsentTextTypeFor:a3];
}

- (void)provideUserResponse:(int64_t)a3 confirmationCode:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(TSCellularPlanManagerCache *)self planItems];
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 isInstalling])
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v12 = [MEMORY[0x263F31978] sharedManager];
  [v12 userDidProvideResponse:a3 confirmationCode:v6 forPlan:v8 isRemote:0 completion:&__block_literal_global_42];

  [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
}

void __67__TSCellularPlanManagerCache_provideUserResponse_confirmationCode___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__TSCellularPlanManagerCache_provideUserResponse_confirmationCode___block_invoke_cold_1();
    }
  }
}

- (void)sendUserResponse:(unint64_t)a3 confirmationCode:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [(TSCellularPlanManagerCache *)self planItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
      if ([v12 isInstalling]) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    long long v13 = v12;

    if (!v13) {
      goto LABEL_15;
    }
    if (a3) {
      uint64_t v14 = a3 == 2;
    }
    else {
      uint64_t v14 = 2;
    }
    long long v15 = [MEMORY[0x263F31978] sharedManager];
    [v15 userDidProvideResponse:v14 confirmationCode:v6 forPlan:v13 isRemote:0 completion:&__block_literal_global_44];

    [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
  }
  else
  {
LABEL_9:

LABEL_15:
    long long v13 = _TSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache sendUserResponse:confirmationCode:](v13, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void __64__TSCellularPlanManagerCache_sendUserResponse_confirmationCode___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    BOOL v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__TSCellularPlanManagerCache_sendUserResponse_confirmationCode___block_invoke_cold_1();
    }
  }
}

- (id)getSubscriptionContextUUIDforPlan:(id)a3
{
  id v3 = (void *)MEMORY[0x263F31978];
  id v4 = a3;
  BOOL v5 = [v3 sharedManager];
  id v6 = [v5 getSubscriptionContextUUIDforPlan:v4];

  return v6;
}

- (void)didPurchasePlanForEid:(id)a3 iccid:(id)a4 smdpURL:(id)a5 state:(id)a6
{
  id v14 = a5;
  id v9 = a6;
  if (a3)
  {
    id v10 = a4;
    uint64_t v11 = +[TSUtilities getByteRepresentationOf:a3];
    id v12 = [MEMORY[0x263F31978] sharedManager];
    [v12 didPurchasePlanForCsn:v11 iccid:v10 profileServer:v14 state:v9];
  }
  else
  {
    long long v13 = (void *)MEMORY[0x263F31978];
    id v12 = a4;
    uint64_t v11 = [v13 sharedManager];
    [v11 didPurchasePlanWithIccid:v12 downloadProfile:1];
  }
}

- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  uint64_t v11 = (void *)MEMORY[0x263F31978];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v11 sharedManager];
  [v17 didPurchasePlanForCarrier:v16 mnc:v15 gid1:v14 gid2:v13 state:v12];
}

- (void)didTransferPlanForEid:(id)a3 iccid:(id)a4 srcIccid:(id)a5 smdpURL:(id)a6 state:(id)a7
{
  id v17 = a5;
  id v11 = a6;
  id v12 = a7;
  if (a3)
  {
    id v13 = a4;
    id v14 = +[TSUtilities getByteRepresentationOf:a3];
    id v15 = [MEMORY[0x263F31978] sharedManager];
    [v15 didTransferPlanForCsn:v14 iccid:v13 srcIccid:v17 profileServer:v11 state:v12];
  }
  else
  {
    id v16 = (void *)MEMORY[0x263F31978];
    id v15 = a4;
    id v14 = [v16 sharedManager];
    [v14 didPurchasePlanWithIccid:v15 downloadProfile:1];
  }
}

- (void)didEnablePlanItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F31978] sharedManager];
  id v6 = [v5 didEnablePlanItems:v4];

  if (v6)
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412802;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2080;
      id v13 = "-[TSCellularPlanManagerCache didEnablePlanItems:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Enabling plans: %@, error: %@ @%s", (uint8_t *)&v8, 0x20u);
    }
  }
  [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
}

- (void)_initializePlanItems
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__TSCellularPlanManagerCache__initializePlanItems__block_invoke;
  block[3] = &unk_2648279D0;
  void block[4] = self;
  if (_initializePlanItems_onceToken != -1) {
    dispatch_once(&_initializePlanItems_onceToken, block);
  }
}

uint64_t __50__TSCellularPlanManagerCache__initializePlanItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCachedPlanItems];
}

- (void)_updateCachedPlanItems
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    lastError = self->_lastError;
    int v10 = 138412546;
    id v11 = lastError;
    __int16 v12 = 2080;
    id v13 = "-[TSCellularPlanManagerCache _updateCachedPlanItems]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "Updated plan list _lastError: %@ @%s", (uint8_t *)&v10, 0x16u);
  }

  BOOL v5 = [MEMORY[0x263F31978] sharedManager];
  id v6 = [v5 planItemsShouldUpdate:0];
  [(TSCellularPlanManagerCache *)self setCachedPlanItems:v6];

  id v7 = [(TSCellularPlanManagerCache *)self delegate];
  int v8 = [(TSCellularPlanManagerCache *)self cachedPlanItems];
  [v7 planItemsUpdated:v8 planListError:self->_lastError];

  id v9 = self->_lastError;
  self->_lastError = 0;
}

- (void)_updateLocalCachedPlanItems:(id)a3
{
  id v4 = [a3 userInfo];
  BOOL v5 = [v4 objectForKey:@"CTCellularPlanLocalInfoError"];

  if (v5)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanManagerCache _updateLocalCachedPlanItems:]();
    }

    id v7 = [(TSCellularPlanManagerCache *)self delegate];
    [v7 planItemsUpdated:0 planListError:v5];

    objc_storeStrong((id *)&self->_lastError, v5);
  }
  [(TSCellularPlanManagerCache *)self _updateCachedPlanItems];
}

- (id)_getValidatedPlanItemFor:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(TSCellularPlanManagerCache *)self planItems];
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v10 = [v9 iccid];
        id v11 = [v4 iccid];
        int v12 = [v10 isEqualToString:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (TSCellularPlanManagerCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (TSCellularPlanManagerCacheDelegate *)WeakRetained;
}

- (NSArray)cachedPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedPlanItems:(id)a3
{
}

- (NSArray)danglingPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDanglingPlanItems:(id)a3
{
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_cachedPlanItems, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)planItemsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __54__TSCellularPlanManagerCache_planItemsWithCompletion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hasInstallingPlanOrUserPlan:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)selectPlanForData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __48__TSCellularPlanManagerCache_selectPlanForData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

- (void)selectPlanForVoice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__TSCellularPlanManagerCache_selectPlanForVoice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

- (void)selectPlansForIMessage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_3();
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[TSCellularPlanManagerCache selectPlansForIMessage:]";
  _os_log_debug_impl(&dword_227A17000, a2, OS_LOG_TYPE_DEBUG, "[Db]  Going to send %lu plans to select iMessage %@ @%s", v4, 0x20u);
}

- (void)selectPlansForIMessage:(os_log_t)log .cold.2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSCellularPlanManagerCache selectPlansForIMessage:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Failed - plan item invalid @%s", buf, 0xCu);
}

- (void)selectPlansForIMessage:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[TSCellularPlanManagerCache selectPlansForIMessage:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
}

void __53__TSCellularPlanManagerCache_selectPlansForIMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

- (void)setLabelForPlan:(uint64_t)a3 label:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setLabelForPlan:label:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

- (void)addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  uint64_t v3 = v0;
  __int16 v4 = 2080;
  uint64_t v5 = "-[TSCellularPlanManagerCache addNewPlanWithCardData:confirmationCode:userConsentResponse:completion:]";
  _os_log_debug_impl(&dword_227A17000, v1, OS_LOG_TYPE_DEBUG, "[Db] adding new plan with card data %@ and confirmation code %@ @%s", v2, 0x20u);
}

- (void)resumePlanProvisioning:(os_log_t)log userConsent:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3[0] = 67109634;
  v3[1] = a1 & 1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  __int16 v6 = 2080;
  uint64_t v7 = "-[TSCellularPlanManagerCache resumePlanProvisioning:userConsent:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] Resume: [%d] signupConsent: %lu @%s", (uint8_t *)v3, 0x1Cu);
}

void __65__TSCellularPlanManagerCache_resumePlanProvisioning_userConsent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

- (void)remapSimLabel:to:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

void __67__TSCellularPlanManagerCache_provideUserResponse_confirmationCode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

- (void)sendUserResponse:(uint64_t)a3 confirmationCode:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__TSCellularPlanManagerCache_sendUserResponse_confirmationCode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Failed %@ @%s", v2, v3, v4, v5, v6);
}

- (void)_updateLocalCachedPlanItems:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]Plan list error: %@ @%s", v2, v3, v4, v5, v6);
}

@end