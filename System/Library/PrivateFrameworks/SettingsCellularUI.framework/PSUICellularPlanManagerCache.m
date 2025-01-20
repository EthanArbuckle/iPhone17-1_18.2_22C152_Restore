@interface PSUICellularPlanManagerCache
+ (PSUICellularPlanManagerCache)sharedInstance;
- (BOOL)carrierListFetchInProgress;
- (BOOL)hasSubscriptions;
- (BOOL)isActivationCodeFlowSupported;
- (BOOL)isAnyLocalFlowTypeSupported;
- (BOOL)isAnyPlanActivating;
- (BOOL)isBootstrapRecommended;
- (BOOL)isCarrierItemBeingFetched;
- (BOOL)isCarrierItemFlowSupported;
- (BOOL)isCellularDisabled;
- (BOOL)isMultipleDataPlanSupportAvailable;
- (BOOL)isSelectedPlanActivating;
- (BOOL)isSingleActivationCodeFlowSupported;
- (BOOL)isUsingBootstrapDataService;
- (BOOL)isWebUIFlowSupported;
- (BOOL)pendingInstallPlanFetchInProgress;
- (BOOL)remoteListFetchCompleted;
- (BOOL)remoteListFetchInProgress;
- (BOOL)shouldShowAccountSetup;
- (BOOL)shouldShowAddPlan;
- (BOOL)shouldShowNewUI;
- (BOOL)shouldShowOldUI;
- (BOOL)shouldShowPlanSelector;
- (CTCellularPlanItem)selectedPlanItem;
- (CTDisplayPlanList)cachedPendingInstallPlans;
- (CTDisplayPlanList)cachedRemotePlans;
- (CTDisplayPlanList)pendingInstallPlans;
- (CTDisplayPlanList)remotePlans;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSArray)cachedCarrierItems;
- (NSArray)carrierItems;
- (NSArray)danglingPlanItems;
- (NSArray)embeddedPlanItems;
- (NSArray)planItems;
- (NSArray)plansPendingTransfer;
- (PSUICellularPlanManagerCache)initWithCTClient:(id)a3;
- (id)danglingPlanFromReference:(id)a3;
- (id)getLogger;
- (id)planFromReference:(id)a3;
- (id)planFromReferenceSafe:(id)a3;
- (id)planPendingTransferFromReference:(id)a3;
- (id)predefinedLabels;
- (id)subscriptionContextForPlanItem:(id)a3 cachedSubscriptionContexts:(id)a4;
- (void)_carrierInfoDidChange;
- (void)_fetchPlanItemsIfNeeded;
- (void)_invalidatePlanItemsCache;
- (void)_mcSettingsDidChange;
- (void)_planInfoDidChange;
- (void)clearCachedCarrierItemsAndRemotePlans;
- (void)dealloc;
- (void)didEnablePlanItems:(id)a3;
- (void)didSelectDanglingPlan:(id)a3;
- (void)plansDidUpdate:(id)a3;
- (void)setCachedCarrierItems:(id)a3;
- (void)setCachedPendingInstallPlans:(id)a3;
- (void)setCachedRemotePlans:(id)a3;
- (void)setCarrierListFetchInProgress:(BOOL)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setLabel:(id)a3 forPlan:(id)a4;
- (void)setPendingInstallPlanFetchInProgress:(BOOL)a3;
- (void)setRemoteListFetchCompleted:(BOOL)a3;
- (void)setRemoteListFetchInProgress:(BOOL)a3;
- (void)setSelectedPlanItem:(id)a3;
- (void)setSelectedPlanItemForData:(id)a3;
@end

@implementation PSUICellularPlanManagerCache

- (BOOL)isCellularDisabled
{
  return !self->_isAnyLocalFlowTypeSupported
      && ![(NSArray *)self->_planItems count]
      && [(NSArray *)self->_danglingPlanItems count] == 0;
}

- (void)_fetchPlanItemsIfNeeded
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  if (!self->_cacheIsValid)
  {
    p_selectedPlanIteuint64_t m = &self->_selectedPlanItem;
    selectedPlanIteuint64_t m = self->_selectedPlanItem;
    self->_selectedPlanIteuint64_t m = 0;

    planItems = self->_planItems;
    self->_planItems = 0;

    self->_hasSubscriptions = 0;
    self->_shouldShowOldUI = 1;
    *(_DWORD *)&self->_BOOL isWebUIFlowSupported = 0;
    v6 = [MEMORY[0x263F31978] sharedManager];
    v7 = [v6 planItemsShouldUpdate:0];
    v8 = self->_planItems;
    self->_planItems = v7;

    v9 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_planItems;
      *(_DWORD *)buf = 138412290;
      v82 = (const char *)v10;
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "fetched cellular plan items: %@", buf, 0xCu);
    }

    v11 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v13 = [MEMORY[0x263F31978] sharedManager];
      v14 = [v13 danglingPlanItemsShouldUpdate:0];
      danglingPlanItems = self->_danglingPlanItems;
      self->_danglingPlanItems = v14;

      v16 = [(PSUICellularPlanManagerCache *)self getLogger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_danglingPlanItems;
        *(_DWORD *)buf = 138412290;
        v82 = (const char *)v17;
        _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, "fetched dangling plan items: %@", buf, 0xCu);
      }
    }
    v18 = [MEMORY[0x263F31978] sharedManager];
    id v80 = 0;
    v19 = [v18 getPlansPendingTransfer:&v80];
    v20 = (const char *)v80;
    plansPendingTransfer = self->_plansPendingTransfer;
    self->_plansPendingTransfer = v19;

    v22 = [(PSUICellularPlanManagerCache *)self getLogger];
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v82 = v20;
        _os_log_error_impl(&dword_221B17000, v23, OS_LOG_TYPE_ERROR, "unable to fetch plans pending transfer with error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_plansPendingTransfer;
      *(_DWORD *)buf = 138412290;
      v82 = (const char *)v24;
      _os_log_impl(&dword_221B17000, v23, OS_LOG_TYPE_DEFAULT, "fetched plans pending transfer: %@", buf, 0xCu);
    }
    v63 = (char *)v20;

    v25 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v26 = self->_plansPendingTransfer;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v77 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v76 + 1) + 8 * i);
          v32 = +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:v31];
          [v25 setObject:v31 forKey:v32];
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v28);
    }

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v33 = self->_danglingPlanItems;
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v72 objects:v87 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v73 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v72 + 1) + 8 * j);
          v39 = +[PSUICellularPlanUniversalReference referenceFromDanglingPlanItem:v38];
          [v25 setObject:v38 forKey:v39];
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v72 objects:v87 count:16];
      }
      while (v35);
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v40 = self->_planItems;
    uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v69;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v69 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v68 + 1) + 8 * k);
          v46 = +[PSUICellularPlanUniversalReference referenceFromPlanItem:v45];
          [v25 setObject:v45 forKey:v46];
        }
        uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v68 objects:v86 count:16];
      }
      while (v42);
    }

    objc_storeStrong((id *)&self->_referenceMap, v25);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v47 = self->_planItems;
    uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v64 objects:v85 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v65;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v65 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = *(void **)(*((void *)&v64 + 1) + 8 * m);
          if ([v52 isSelected]) {
            objc_storeStrong((id *)p_selectedPlanItem, v52);
          }
          if ([v52 isBackedByCellularPlan]) {
            self->_hasSubscriptions = 1;
          }
        }
        uint64_t v49 = [(NSArray *)v47 countByEnumeratingWithState:&v64 objects:v85 count:16];
      }
      while (v49);
    }

    v53 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v54 = [v53 getSupportedFlowTypes];

    self->_shouldShowOldUI = (v54 & 0x8000) == 0;
    BOOL isWebUIFlowSupported = v54 & 1;
    self->_BOOL isWebUIFlowSupported = v54 & 1;
    self->_isActivationCodeFlowSupported = (v54 & 2) != 0;
    if (v54 == 2)
    {
      v56 = [MEMORY[0x263F82670] currentDevice];
      if (objc_msgSend(v56, "sf_isChinaRegionCellularDevice"))
      {
        v57 = [MEMORY[0x263F82670] currentDevice];
        self->_isSingleActivationCodeFlowSupported = objc_msgSend(v57, "sf_isiPad");
      }
      else
      {
        self->_isSingleActivationCodeFlowSupported = 0;
      }

      BOOL isWebUIFlowSupported = self->_isWebUIFlowSupported;
    }
    else
    {
      self->_isSingleActivationCodeFlowSupported = 0;
    }
    self->_isCarrierItemFlowSupported = (v54 & 0x20) != 0;
    if (isWebUIFlowSupported) {
      BOOL v58 = 1;
    }
    else {
      BOOL v58 = self->_isActivationCodeFlowSupported || (v54 & 0x20) != 0;
    }
    self->_isAnyLocalFlowTypeSupported = v58;
    v60 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v82 = (const char *)v54;
      _os_log_impl(&dword_221B17000, v60, OS_LOG_TYPE_DEFAULT, "supported flows: 0x%lx", buf, 0xCu);
    }

    self->_isMultipleDataPlanSupportAvailable = (v54 & 0xFFFFFFFFFFFF7FFFLL) != 0;
    self->_cacheIsValid = 1;
    v61 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v82 = "-[PSUICellularPlanManagerCache _fetchPlanItemsIfNeeded]";
      __int16 v83 = 2112;
      v84 = @"PSUICellularPlanChanged";
      _os_log_impl(&dword_221B17000, v61, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", buf, 0x16u);
    }

    v62 = [MEMORY[0x263F08A00] defaultCenter];
    [v62 postNotificationName:@"PSUICellularPlanChanged" object:0 userInfo:0];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PlanManagerCache"];
}

void __46__PSUICellularPlanManagerCache_sharedInstance__block_invoke()
{
  v0 = [PSUICellularPlanManagerCache alloc];
  id v1 = objc_alloc(MEMORY[0x263F02D30]);
  id v5 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"plan_manager_cache"];
  v2 = (void *)[v1 initWithQueue:v5];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)v0 initWithCTClient:v2];
  v4 = (void *)_MergedGlobals_71;
  _MergedGlobals_71 = v3;
}

- (PSUICellularPlanManagerCache)initWithCTClient:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSUICellularPlanManagerCache;
  v6 = [(PSUICellularPlanManagerCache *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreTelephonyClient, a3);
    [(CoreTelephonyClient *)v7->_coreTelephonyClient setDelegate:v7];
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__planInfoDidChange name:*MEMORY[0x263F31928] object:0];

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v7 selector:sel__carrierInfoDidChange name:*MEMORY[0x263F31918] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v7 selector:sel__mcSettingsDidChange name:*MEMORY[0x263F536E0] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v7 selector:sel__mcSettingsDidChange name:*MEMORY[0x263F53B18] object:0];

    uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v7 selector:sel__planInfoDidChange name:*MEMORY[0x263F31950] object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v7 selector:sel__fetchPlanItemsIfNeeded name:*MEMORY[0x263F31948] object:0];
  }
  return v7;
}

+ (PSUICellularPlanManagerCache)sharedInstance
{
  if (qword_26AC32338 != -1) {
    dispatch_once(&qword_26AC32338, &__block_literal_global_20);
  }
  v2 = (void *)_MergedGlobals_71;
  return (PSUICellularPlanManagerCache *)v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularPlanManagerCache;
  [(PSUICellularPlanManagerCache *)&v4 dealloc];
}

- (void)_mcSettingsDidChange
{
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Querying due to MCEffectiveSettingsChangedNotification or MCProfileListChangedNotification", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__PSUICellularPlanManagerCache__mcSettingsDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__PSUICellularPlanManagerCache__mcSettingsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _planInfoDidChange];
}

- (void)_planInfoDidChange
{
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Querying due to CTCellularPlanInfoDidChangeNotification", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&planCacheLock);
  [(PSUICellularPlanManagerCache *)self _invalidatePlanItemsCache];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  os_unfair_lock_unlock((os_unfair_lock_t)&planCacheLock);
}

- (void)_invalidatePlanItemsCache
{
  self->_cacheIsValid = 0;
  selectedPlanIteuint64_t m = self->_selectedPlanItem;
  self->_selectedPlanIteuint64_t m = 0;

  planItems = self->_planItems;
  self->_planItems = 0;

  danglingPlanItems = self->_danglingPlanItems;
  self->_danglingPlanItems = 0;

  plansPendingTransfer = self->_plansPendingTransfer;
  self->_plansPendingTransfer = 0;

  referenceMap = self->_referenceMap;
  self->_referenceMap = 0;

  cachedRemotePlans = self->_cachedRemotePlans;
  self->_cachedRemotePlans = 0;

  self->_remoteListFetchCompleted = 0;
}

- (void)_carrierInfoDidChange
{
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Querying due to CTCarrierInfoDidChangeNotification", v6, 2u);
  }

  cachedCarrierItems = self->_cachedCarrierItems;
  self->_cachedCarrierItems = 0;

  self->_carrierListFetchInProgress = 0;
  id v5 = [(PSUICellularPlanManagerCache *)self carrierItems];
}

- (BOOL)shouldShowAddPlan
{
  return self->_isAnyLocalFlowTypeSupported;
}

- (NSArray)planItems
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v4 = [(NSArray *)self->_planItems count];
    int v7 = 134217984;
    NSUInteger v8 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%lu plan items exist", (uint8_t *)&v7, 0xCu);
  }

  planItems = self->_planItems;
  return planItems;
}

- (NSArray)embeddedPlanItems
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  NSUInteger v4 = [(PSUICellularPlanManagerCache *)self planItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 type] == 2 || objc_msgSend(v9, "type") == 3) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)danglingPlanItems
{
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  danglingPlanItems = self->_danglingPlanItems;
  return danglingPlanItems;
}

- (NSArray)plansPendingTransfer
{
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  plansPendingTransfer = self->_plansPendingTransfer;
  return plansPendingTransfer;
}

- (id)planFromReference:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v5 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  }
  else
  {
    uint64_t v7 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      long long v11 = (objc_class *)objc_opt_class();
      long long v12 = NSStringFromClass(v11);
      int v13 = 138412546;
      long long v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)danglingPlanFromReference:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v5 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  uint64_t v6 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    long long v11 = (objc_class *)objc_opt_class();
    long long v12 = NSStringFromClass(v11);
    int v13 = 138412546;
    long long v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    uint64_t v7 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)planPendingTransferFromReference:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v5 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  }
  else
  {
    uint64_t v7 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      long long v11 = (objc_class *)objc_opt_class();
      long long v12 = NSStringFromClass(v11);
      int v13 = 138412546;
      long long v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)planFromReferenceSafe:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v5 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(NSDictionary *)self->_referenceMap objectForKey:v4];
  }
  else
  {
    uint64_t v7 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      long long v11 = (objc_class *)objc_opt_class();
      long long v12 = NSStringFromClass(v11);
      int v13 = 138412546;
      long long v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "The referenced plan is an object of the class %@, expected an object of the class %{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (CTCellularPlanItem)selectedPlanItem
{
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  selectedPlanIteuint64_t m = self->_selectedPlanItem;
  return selectedPlanItem;
}

- (void)setSelectedPlanItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v7 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Can't activate nil plan", buf, 2u);
    }
    goto LABEL_14;
  }
  if (([v4 isSelected] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v7 = [v6 didSelectPlanItem:v5 isEnable:1];

    if (v7)
    {
      NSUInteger v8 = [(PSUICellularPlanManagerCache *)self getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v14 = v7;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Failed to select the plan: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [MEMORY[0x263F31978] sharedManager];
    v10 = [v9 didSelectPlanForData:v5];

    if (v10)
    {
      long long v11 = [(PSUICellularPlanManagerCache *)self getLogger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v14 = v10;
        _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "Failed to make plan active data plan: %@", buf, 0xCu);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__PSUICellularPlanManagerCache_setSelectedPlanItem___block_invoke;
    block[3] = &unk_2645E0B88;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_14:
  }
}

uint64_t __52__PSUICellularPlanManagerCache_setSelectedPlanItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidatePlanItemsCache];
  v2 = *(void **)(a1 + 32);
  return [v2 _fetchPlanItemsIfNeeded];
}

- (void)setSelectedPlanItemForData:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v7 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Can't set nil plan for data", buf, 2u);
    }
    goto LABEL_10;
  }
  if (([v4 isActiveDataPlan] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v7 = [v6 didSelectPlanForData:v5];

    if (v7)
    {
      NSUInteger v8 = [(PSUICellularPlanManagerCache *)self getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v11 = v7;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Failed to make plan active data plan: %@", buf, 0xCu);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__PSUICellularPlanManagerCache_setSelectedPlanItemForData___block_invoke;
    block[3] = &unk_2645E0B88;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_10:
  }
}

uint64_t __59__PSUICellularPlanManagerCache_setSelectedPlanItemForData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidatePlanItemsCache];
  v2 = *(void **)(a1 + 32);
  return [v2 _fetchPlanItemsIfNeeded];
}

- (void)didSelectDanglingPlan:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Selected dangling plan item: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v7 = [v6 resolveSimLabel:v4];

  if (v7)
  {
    NSUInteger v8 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Failed to resolve SIM label for plan: %@ with error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)isMultipleDataPlanSupportAvailable
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isMultipleDataPlanSupportAvailable) {
      id v4 = @"is";
    }
    else {
      id v4 = @"is not";
    }
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Multiple data plan support %@ available", (uint8_t *)&v6, 0xCu);
  }

  return self->_isMultipleDataPlanSupportAvailable;
}

- (BOOL)hasSubscriptions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_hasSubscriptions) {
      id v4 = @"Some plan item is backed by a cellular plan";
    }
    else {
      id v4 = @"No plan item is backed by a cellular plan";
    }
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  return self->_hasSubscriptions;
}

- (BOOL)shouldShowAccountSetup
{
  return ![(NSArray *)self->_planItems count] && self->_isMultipleDataPlanSupportAvailable;
}

- (BOOL)isSelectedPlanActivating
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self selectedPlanItem];
  if ([v3 isBackedByCellularPlan])
  {
    id v4 = [v3 plan];
    BOOL v5 = [v4 status] == 2;
  }
  else
  {
    BOOL v5 = 0;
  }
  int v6 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"is not";
    if (v5) {
      uint64_t v7 = @"is";
    }
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Selected plan item %@ activating", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (BOOL)isAnyPlanActivating
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self planItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v7 isBackedByCellularPlan])
        {
          uint64_t v8 = [v7 plan];
          int v9 = [v8 status];

          if (v9 == 2)
          {
            LODWORD(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  id v10 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"No plan is activating";
    if (v4) {
      uint64_t v11 = @"Some plan is activating";
    }
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  return v4;
}

- (BOOL)shouldShowPlanSelector
{
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  if (!self->_isMultipleDataPlanSupportAvailable || !self->_hasSubscriptions) {
    return 0;
  }
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self selectedPlanItem];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldShowOldUI
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"YES";
    if (!self->_shouldShowOldUI) {
      BOOL v4 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICellularPlanManagerCache shouldShowOldUI]";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_shouldShowOldUI;
}

- (BOOL)shouldShowNewUI
{
  return ![(PSUICellularPlanManagerCache *)self shouldShowOldUI];
}

- (BOOL)isAnyLocalFlowTypeSupported
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"YES";
    if (!self->_isAnyLocalFlowTypeSupported) {
      BOOL v4 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICellularPlanManagerCache isAnyLocalFlowTypeSupported]";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isAnyLocalFlowTypeSupported;
}

- (BOOL)isWebUIFlowSupported
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"YES";
    if (!self->_isWebUIFlowSupported) {
      BOOL v4 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICellularPlanManagerCache isWebUIFlowSupported]";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isWebUIFlowSupported;
}

- (BOOL)isActivationCodeFlowSupported
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"YES";
    if (!self->_isActivationCodeFlowSupported) {
      BOOL v4 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICellularPlanManagerCache isActivationCodeFlowSupported]";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isActivationCodeFlowSupported;
}

- (BOOL)isSingleActivationCodeFlowSupported
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"YES";
    if (!self->_isSingleActivationCodeFlowSupported) {
      BOOL v4 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICellularPlanManagerCache isSingleActivationCodeFlowSupported]";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isSingleActivationCodeFlowSupported;
}

- (BOOL)isCarrierItemFlowSupported
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(PSUICellularPlanManagerCache *)self _fetchPlanItemsIfNeeded];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = @"YES";
    if (!self->_isCarrierItemFlowSupported) {
      BOOL v4 = @"NO";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[PSUICellularPlanManagerCache isCarrierItemFlowSupported]";
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return self->_isCarrierItemFlowSupported;
}

- (CTDisplayPlanList)pendingInstallPlans
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[PSUICellularPlanManagerCache pendingInstallPlans]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  cachedPendingInstallPlans = self->_cachedPendingInstallPlans;
  if (!cachedPendingInstallPlans)
  {
    if (self->_pendingInstallPlanFetchInProgress)
    {
      cachedPendingInstallPlans = 0;
    }
    else
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      self->_pendingInstallPlanFetchInProgress = 1;
      coreTelephonyClient = self->_coreTelephonyClient;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke;
      v7[3] = &unk_2645E1828;
      objc_copyWeak(&v8, (id *)buf);
      v7[4] = self;
      [(CoreTelephonyClient *)coreTelephonyClient plansPendingInstallWithCompletion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
      cachedPendingInstallPlans = self->_cachedPendingInstallPlans;
    }
  }
  return cachedPendingInstallPlans;
}

void __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setPendingInstallPlanFetchInProgress:0];

  if (!v5 || v6)
  {
    uint64_t v11 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch pending install items with error: %@", buf, 0xCu);
    }

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = v8;
    id v10 = 0;
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = v8;
    id v10 = v5;
  }
  [v8 setCachedPendingInstallPlans:v10];

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  long long v13 = [v12 cachedPendingInstallPlans];

  if (v13)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke_97;
    block[3] = &unk_2645E0B88;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __51__PSUICellularPlanManagerCache_pendingInstallPlans__block_invoke_97(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    BOOL v4 = "-[PSUICellularPlanManagerCache pendingInstallPlans]_block_invoke";
    __int16 v5 = 2112;
    id v6 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PSUICellularPlanChanged" object:0 userInfo:0];
}

- (CTDisplayPlanList)remotePlans
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v15 = "-[PSUICellularPlanManagerCache remotePlans]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_remoteListFetchCompleted || self->_remoteListFetchInProgress)
  {
    BOOL v4 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = [(CTDisplayPlanList *)self->_cachedRemotePlans plans];
      uint64_t v6 = [v5 count];
      *(_DWORD *)buf = 134217984;
      long long v15 = (const char *)v6;
      _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%lu remote items exist", buf, 0xCu);
    }
  }
  else if (self->_isCarrierItemFlowSupported)
  {
    id location = 0;
    objc_initWeak(&location, self);
    self->_remoteListFetchInProgress = 1;
    int v9 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v15 = "-[PSUICellularPlanManagerCache remotePlans]";
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "%s fetching add on plans", buf, 0xCu);
    }

    coreTelephonyClient = self->_coreTelephonyClient;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__PSUICellularPlanManagerCache_remotePlans__block_invoke;
    v11[3] = &unk_2645E1850;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    [(CoreTelephonyClient *)coreTelephonyClient getRemoteDevices:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  cachedRemotePlans = self->_cachedRemotePlans;
  return cachedRemotePlans;
}

void __43__PSUICellularPlanManagerCache_remotePlans__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v32 = a3;
  id location = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setRemoteListFetchInProgress:0];

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v33 = v5;
  obuint64_t j = [v5 devices];
  uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v44;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v8;
        int v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
        id v10 = [*(id *)(a1 + 32) getLogger];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v9 deviceID];
          *(_DWORD *)buf = 138412290;
          id v49 = v11;
          _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Remote device => %@", buf, 0xCu);
        }
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v12 = [v9 remoteDisplayPlans];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v40 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v18 = [*(id *)(a1 + 32) getLogger];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v49 = v17;
                _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "Remote device plan => %@", buf, 0xCu);
              }

              [v7 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v14);
        }

        uint64_t v8 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v36);
  }

  if (v32 || !v7)
  {
    v22 = [*(id *)(a1 + 32) getLogger];
    uint64_t v20 = (id *)(a1 + 40);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v32;
      _os_log_impl(&dword_221B17000, v22, OS_LOG_TYPE_DEFAULT, "Failed to fetch addon items with error: %@", buf, 0xCu);
    }

    id v19 = objc_loadWeakRetained(location);
    [v19 setCachedRemotePlans:0];
  }
  else
  {
    id v19 = (id)[objc_alloc(MEMORY[0x263F02C60]) initWithDisplayPlans:v7];
    uint64_t v20 = (id *)(a1 + 40);
    id v21 = objc_loadWeakRetained(location);
    [v21 setCachedRemotePlans:v19];
  }
  id v23 = objc_loadWeakRetained(v20);
  [v23 setRemoteListFetchCompleted:1];

  int v24 = _os_feature_enabled_impl();
  id v25 = objc_loadWeakRetained(v20);
  v26 = v25;
  if (v24)
  {
    char v27 = [v25 remoteListFetchCompleted];

    if ((v27 & 1) == 0) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v28 = [v25 cachedCarrierItems];
    if (v28)
    {
    }
    else
    {
      id v29 = objc_loadWeakRetained(v20);
      v30 = [v29 cachedRemotePlans];

      if (v30) {
        goto LABEL_31;
      }
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__PSUICellularPlanManagerCache_remotePlans__block_invoke_102;
  block[3] = &unk_2645E0B88;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_31:
}

void __43__PSUICellularPlanManagerCache_remotePlans__block_invoke_102(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    BOOL v4 = "-[PSUICellularPlanManagerCache remotePlans]_block_invoke";
    __int16 v5 = 2112;
    uint64_t v6 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PSUICellularPlanChanged" object:0 userInfo:0];
}

- (NSArray)carrierItems
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_cachedCarrierItems && !self->_carrierListFetchInProgress && self->_isCarrierItemFlowSupported)
  {
    id location = 0;
    objc_initWeak(&location, self);
    self->_carrierListFetchInProgress = 1;
    int v3 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[PSUICellularPlanManagerCache carrierItems]";
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s fetching carrier items", buf, 0xCu);
    }

    BOOL v4 = [MEMORY[0x263F31978] sharedManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__PSUICellularPlanManagerCache_carrierItems__block_invoke;
    v9[3] = &unk_2645E1878;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    [v4 carrierItemsShouldUpdate:0 completion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  __int16 v5 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v6 = [(NSArray *)self->_cachedCarrierItems count];
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = (const char *)v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%lu carrier items exist", buf, 0xCu);
  }

  cachedCarrierItems = self->_cachedCarrierItems;
  return cachedCarrierItems;
}

void __44__PSUICellularPlanManagerCache_carrierItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCarrierListFetchInProgress:0];

  if (!v5 || v6)
  {
    uint64_t v11 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch carrier items with error: %@", buf, 0xCu);
    }

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = v8;
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = v8;
    id v10 = v5;
  }
  [v8 setCachedCarrierItems:v10];

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  int v13 = [v12 remoteListFetchCompleted];

  if (v13)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__PSUICellularPlanManagerCache_carrierItems__block_invoke_104;
    block[3] = &unk_2645E0B88;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __44__PSUICellularPlanManagerCache_carrierItems__block_invoke_104(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    BOOL v4 = "-[PSUICellularPlanManagerCache carrierItems]_block_invoke";
    __int16 v5 = 2112;
    id v6 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"PSUICellularPlanChanged" object:0 userInfo:0];
}

- (void)clearCachedCarrierItemsAndRemotePlans
{
  cachedCarrierItems = self->_cachedCarrierItems;
  self->_cachedCarrierItems = 0;

  cachedRemotePlans = self->_cachedRemotePlans;
  self->_cachedRemotePlans = 0;

  self->_remoteListFetchCompleted = 0;
}

- (id)predefinedLabels
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F31978] sharedManager];
  int v3 = [v2 getPredefinedLabels];

  if (!v3 || ![v3 count])
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:@"Primary"];
    v12[0] = v4;
    __int16 v5 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:@"Secondary"];
    v12[1] = v5;
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:@"Personal"];
    v12[2] = v6;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:@"Business"];
    v12[3] = v7;
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:@"Travel"];
    v12[4] = v8;
    int v9 = (void *)[objc_alloc(MEMORY[0x263F31990]) initWithLabel:@"Cellular Data"];
    v12[5] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];

    int v3 = (void *)v10;
  }
  return v3;
}

- (void)setLabel:(id)a3 forPlan:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Setting label: %@ for plan item: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v10 = [v9 setLabelForPlan:v7 label:v6];

  if (v10)
  {
    uint64_t v11 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "Failed to set label for plan: %@ with error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    [(PSUICellularPlanManagerCache *)self _invalidatePlanItemsCache];
  }
}

- (id)subscriptionContextForPlanItem:(id)a3 cachedSubscriptionContexts:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = [MEMORY[0x263F67EF0] sharedInstance];
    id v7 = [v8 subscriptionContexts];
  }
  int v9 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v10 = [v9 getSubscriptionContextUUIDforPlan:v6];

  if (!v10)
  {
    uint64_t v11 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_20:
      id v21 = 0;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412546;
    id v31 = v6;
    __int16 v32 = 2112;
    v33 = 0;
LABEL_19:
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "plan item: %@, context: %@", buf, 0x16u);
    goto LABEL_20;
  }
  id v23 = v6;
  int v24 = self;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v16, "uuid", v23);
        v18 = [v17 UUIDString];
        int v19 = [v10 isEqualToString:v18];

        if (v19)
        {
          uint64_t v20 = [(PSUICellularPlanManagerCache *)v24 getLogger];
          id v6 = v23;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v23;
            __int16 v32 = 2112;
            v33 = v16;
            _os_log_impl(&dword_221B17000, v20, OS_LOG_TYPE_DEFAULT, "plan item: %@, context: %@", buf, 0x16u);
          }

          id v21 = v16;
          goto LABEL_21;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = [(PSUICellularPlanManagerCache *)v24 getLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v6 = v23;
    id v31 = v23;
    __int16 v32 = 2112;
    v33 = 0;
    goto LABEL_19;
  }
  id v21 = 0;
  id v6 = v23;
LABEL_21:

  return v21;
}

- (void)didEnablePlanItems:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v5 = [MEMORY[0x263F31978] sharedManager];
  id v6 = [v5 didEnablePlanItems:v4];

  if (v6)
  {
    id v7 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Enabling plans: %@, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)isUsingBootstrapDataService
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  id v4 = [(CoreTelephonyClient *)coreTelephonyClient usingBootstrapDataService:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "usingBootstrapDataService failed:%@", buf, 0xCu);
    }
  }
  char v7 = [v4 BOOLValue];

  return v7;
}

- (BOOL)isBootstrapRecommended
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  id v4 = [(CoreTelephonyClient *)coreTelephonyClient getBootstrapState:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = [(PSUICellularPlanManagerCache *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "isBootstrapRecommended failed:%@", buf, 0xCu);
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [v4 bootstrapStatus] == 2;
  }

  return v7;
}

- (BOOL)isCarrierItemBeingFetched
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_carrierListFetchInProgress) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v6 = 138412290;
    BOOL v7 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "_carrierListFetchInProgress: %@", (uint8_t *)&v6, 0xCu);
  }

  return self->_carrierListFetchInProgress;
}

- (void)plansDidUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [(PSUICellularPlanManagerCache *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "CTDisplayPlanList: %@", (uint8_t *)&v16, 0xCu);
  }

  BOOL v7 = [v5 plans];
  uint64_t v8 = [v7 count];

  if (v8
    && ([v5 plans],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectAtIndexedSubscript:0],
        __int16 v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isPendingInstallPlan],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    uint64_t v13 = [v5 plans];
    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    int v15 = [v14 isAddOnPurchasablePlan];

    if (!v15) {
      goto LABEL_7;
    }
    uint64_t v12 = 80;
  }
  else
  {
    uint64_t v12 = 88;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v12), a3);
LABEL_7:
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_128);
}

void __47__PSUICellularPlanManagerCache_plansDidUpdate___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"PSUICellularPlanChanged" object:0 userInfo:0];
}

- (BOOL)remoteListFetchCompleted
{
  return self->_remoteListFetchCompleted;
}

- (void)setRemoteListFetchCompleted:(BOOL)a3
{
  self->_remoteListFetchCompleted = a3;
}

- (NSArray)cachedCarrierItems
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCachedCarrierItems:(id)a3
{
}

- (CTDisplayPlanList)cachedRemotePlans
{
  return (CTDisplayPlanList *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCachedRemotePlans:(id)a3
{
}

- (CTDisplayPlanList)cachedPendingInstallPlans
{
  return (CTDisplayPlanList *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCachedPendingInstallPlans:(id)a3
{
}

- (BOOL)carrierListFetchInProgress
{
  return self->_carrierListFetchInProgress;
}

- (void)setCarrierListFetchInProgress:(BOOL)a3
{
  self->_carrierListFetchInProgress = a3;
}

- (BOOL)remoteListFetchInProgress
{
  return self->_remoteListFetchInProgress;
}

- (void)setRemoteListFetchInProgress:(BOOL)a3
{
  self->_remoteListFetchInProgress = a3;
}

- (BOOL)pendingInstallPlanFetchInProgress
{
  return self->_pendingInstallPlanFetchInProgress;
}

- (void)setPendingInstallPlanFetchInProgress:(BOOL)a3
{
  self->_pendingInstallPlanFetchInProgress = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_cachedPendingInstallPlans, 0);
  objc_storeStrong((id *)&self->_cachedRemotePlans, 0);
  objc_storeStrong((id *)&self->_cachedCarrierItems, 0);
  objc_storeStrong((id *)&self->_selectedPlanItem, 0);
  objc_storeStrong((id *)&self->_referenceMap, 0);
  objc_storeStrong((id *)&self->_plansPendingTransfer, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_planItems, 0);
}

@end