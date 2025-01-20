@interface TSTransferFlowModel
+ (id)sharedInstance;
- (BOOL)arePlansRequested;
- (BOOL)areTransferPlansReady;
- (BOOL)isActivationPolicyMismatch;
- (BOOL)isDualeSIMCapablityLoss;
- (BOOL)isStandaloneProximityTransfer;
- (BOOL)isTransferNotSupportedFromiPhone;
- (BOOL)shouldShowCarrierSetupPane;
- (BOOL)shouldShowTransferredPane;
- (BOOL)showTransferredPane;
- (CTDisplayPlanList)carrierSetupItems;
- (CTDisplayPlanList)pendingInstallItems;
- (NSDictionary)postdata;
- (NSMutableArray)transferItems;
- (NSString)websheetUrl;
- (TSTransferFlowModel)initWithIsStandaloneProximityTransfer:(BOOL)a3 transferBackPlan:(id)a4;
- (id)requestCompletion;
- (id)transferBackPlan;
- (void)arePlansAvailable:(id)a3 transferablePlanOnSource:(BOOL)a4 bootstrapOnly:(BOOL)a5 completion:(id)a6;
- (void)bootstrap:(id)a3 completion:(id)a4;
- (void)clearCache;
- (void)clearCarrierSetupItemsCache;
- (void)filterCarrierSetupItems:(id)a3;
- (void)filterTransferPlans:(id)a3;
- (void)forceRecheckTransferableAndPendingInstallPlans;
- (void)getWebsheetInfo:(id)a3 completion:(id)a4;
- (void)requestCarrierSetups:(id)a3;
- (void)requestPendingInstallPlans:(id)a3;
- (void)requestPlans:(id)a3 transferablePlanOnSource:(BOOL)a4 bootstrapOnly:(BOOL)a5 completion:(id)a6;
- (void)requestTransferPlans:(id)a3;
- (void)setAreTransferPlansReady:(BOOL)a3;
- (void)setCarrierSetupItems:(id)a3;
- (void)setIsActivationPolicyMismatch:(BOOL)a3;
- (void)setIsDualeSIMCapablityLoss:(BOOL)a3;
- (void)setIsStandaloneProximityTransfer:(BOOL)a3;
- (void)setIsTransferNotSupportedFromiPhone:(BOOL)a3;
- (void)setPendingInstallItems:(id)a3;
- (void)setPostdata:(id)a3;
- (void)setRequestCompletion:(id)a3;
- (void)setShowTransferredPane:(BOOL)a3;
- (void)setTransferBackPlan:(id)a3;
- (void)setTransferItems:(id)a3;
- (void)setWebsheetUrl:(id)a3;
@end

@implementation TSTransferFlowModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sModel;
  return v2;
}

uint64_t __37__TSTransferFlowModel_sharedInstance__block_invoke()
{
  sharedInstance_sModel = objc_alloc_init(TSTransferFlowModel);
  return MEMORY[0x270F9A758]();
}

- (TSTransferFlowModel)initWithIsStandaloneProximityTransfer:(BOOL)a3 transferBackPlan:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TSTransferFlowModel;
  v8 = [(TSTransferFlowModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_isStandaloneProximityTransfer = a3;
    objc_storeStrong(&v8->_transferBackPlan, a4);
  }

  return v9;
}

- (void)arePlansAvailable:(id)a3 transferablePlanOnSource:(BOOL)a4 bootstrapOnly:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v12 = v11;
  if (v10) {
    self->_isProximityFlow = 1;
  }
  v13 = (void *)MEMORY[0x22A683B20](v11);
  id requestCompletion = self->_requestCompletion;
  self->_id requestCompletion = v13;

  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke;
  v16[3] = &unk_264828640;
  objc_copyWeak(&v18, &location);
  id v15 = v12;
  BOOL v19 = v7;
  v16[4] = self;
  id v17 = v15;
  [(TSTransferFlowModel *)self requestPlans:v10 transferablePlanOnSource:v8 bootstrapOnly:v7 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v11 = _TSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315138;
        v32 = "-[TSTransferFlowModel arePlansAvailable:transferablePlanOnSource:bootstrapOnly:completion:]_block_invoke";
        _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "Clear pending install plans & transfer plans flag @%s", (uint8_t *)&v31, 0xCu);
      }

      WeakRetained[8] = 0;
      WeakRetained[18] = 0;
    }
    [*(id *)(a1 + 32) filterCarrierSetupItems:v9];
    if (v7 && [v7 count]) {
      goto LABEL_14;
    }
    if (v8)
    {
      uint64_t v12 = [v8 plans];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v8 plans];
        uint64_t v15 = [v14 count];

        if (v15) {
          goto LABEL_14;
        }
      }
    }
    if (!v9) {
      goto LABEL_18;
    }
    uint64_t v16 = [v9 plans];
    if (!v16) {
      goto LABEL_18;
    }
    id v17 = (void *)v16;
    id v18 = [v9 plans];
    uint64_t v19 = [v18 count];

    if (v19)
    {
LABEL_14:
      v20 = [WeakRetained requestCompletion];
      v21 = (void (*)(void))v20[2];
    }
    else
    {
LABEL_18:
      v30 = [MEMORY[0x263F31978] sharedManager];
      [v30 getSupportedFlowTypes];

      v20 = [WeakRetained requestCompletion];
      v21 = (void (*)(void))v20[2];
    }
    v21();
  }
  else
  {
    v22 = _TSLogDomain();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)bootstrap:(id)a3 completion:(id)a4
{
  if (!self->_isBootstrapTriggerred)
  {
    self->_isBootstrapTriggerred = 1;
    id v5 = a4;
    id v6 = a3;
    id v7 = +[TSCoreTelephonyClientCache sharedInstance];
    [v7 bootstrapPlanTransferUsingMessageSession:v6 completion:v5];
  }
}

- (void)filterTransferPlans:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableArray *)self->_transferItems removeAllObjects];
  if (!v4)
  {
    p_super = _TSLogDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v84 = "-[TSTransferFlowModel filterTransferPlans:]";
      _os_log_impl(&dword_227A17000, p_super, OS_LOG_TYPE_DEFAULT, "no remote plans @%s", buf, 0xCu);
    }
    goto LABEL_86;
  }
  v67 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v56 = v4;
  id obj = [v4 devices];
  uint64_t v61 = [obj countByEnumeratingWithState:&v78 objects:v96 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v79;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v79 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v63 = v5;
        id v6 = *(void **)(*((void *)&v78 + 1) + 8 * v5);
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        v68 = v6;
        id v7 = [v6 remoteDisplayPlans];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v95 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v75 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              if ([v12 isNotEligibleActivationPolicyMismatchPlan]) {
                [(TSTransferFlowModel *)self setIsActivationPolicyMismatch:1];
              }
              v13 = [v12 plan];

              if (v13)
              {
                v14 = [v12 plan];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  id transferBackPlan = self->_transferBackPlan;
                  if (transferBackPlan)
                  {
                    id v17 = [transferBackPlan phoneNumber];
                    id v18 = [v12 phoneNumber];
                    int v19 = [v17 isEqualToPhoneNumber:v18];

                    if (!v19) {
                      continue;
                    }
                    v20 = _TSLogDomain();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      v21 = [self->_transferBackPlan phoneNumber];
                      *(_DWORD *)buf = 138412546;
                      v84 = v21;
                      __int16 v85 = 2080;
                      v86 = "-[TSTransferFlowModel filterTransferPlans:]";
                      _os_log_impl(&dword_227A17000, v20, OS_LOG_TYPE_DEFAULT, "find plan with same phone number : %@ @%s", buf, 0x16u);
                    }
                  }
                  if ([v12 isPhysical])
                  {
                    v89[0] = @"planItem";
                    v89[1] = @"deviceInfo";
                    v90[0] = v12;
                    v90[1] = v68;
                    v22 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
                    transferItems = v67;
                  }
                  else
                  {
                    v91[0] = @"planItem";
                    v91[1] = @"deviceInfo";
                    v92[0] = v12;
                    v92[1] = v68;
                    v22 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
                    transferItems = self->_transferItems;
                  }
                  [(NSMutableArray *)transferItems addObject:v22];
                }
                else
                {
                  v22 = _TSLogDomain();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v24 = [v12 plan];
                    *(_DWORD *)buf = 138412546;
                    v84 = v24;
                    __int16 v85 = 2080;
                    v86 = "-[TSTransferFlowModel filterTransferPlans:]";
                    _os_log_error_impl(&dword_227A17000, v22, OS_LOG_TYPE_ERROR, "[E]%@ is not a CTRemotePlan @%s", buf, 0x16u);
                  }
                }
              }
              else
              {
                v22 = _TSLogDomain();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                  [(TSTransferFlowModel *)v93 filterTransferPlans:v22];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v74 objects:v95 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v63 + 1;
      }
      while (v63 + 1 != v61);
      uint64_t v61 = [obj countByEnumeratingWithState:&v78 objects:v96 count:16];
    }
    while (v61);
  }

  uint64_t v25 = +[TSCoreTelephonyClientCache sharedInstance];
  if (([v25 deviceSupportsHydra] & 1) != 0 || +[TSUtilities isPad](TSUtilities, "isPad"))
  {

    p_super = &v67->super.super;
  }
  else
  {
    BOOL v55 = +[TSUtilities inBuddy];

    p_super = &v67->super.super;
    if (v55) {
      goto LABEL_38;
    }
  }
  uint64_t v27 = (void *)[(NSMutableArray *)self->_transferItems copy];
  [(NSMutableArray *)self->_transferItems removeAllObjects];
  [(NSMutableArray *)self->_transferItems addObjectsFromArray:p_super];
  [(NSMutableArray *)self->_transferItems addObjectsFromArray:v27];

LABEL_38:
  uint64_t v28 = _TSLogDomain();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [(NSMutableArray *)self->_transferItems count];
    v30 = self->_transferItems;
    *(_DWORD *)buf = 134218498;
    v84 = (const char *)v29;
    __int16 v85 = 2112;
    v86 = (const char *)v30;
    __int16 v87 = 2080;
    v88 = "-[TSTransferFlowModel filterTransferPlans:]";
    _os_log_impl(&dword_227A17000, v28, OS_LOG_TYPE_DEFAULT, "transfer plans [%lu] : %@ @%s", buf, 0x20u);
  }

  if ([(NSMutableArray *)self->_transferItems count] == 1)
  {
    int v31 = [(NSMutableArray *)self->_transferItems objectAtIndex:0];
    v32 = [v31 objectForKeyedSubscript:@"planItem"];
    uint64_t v33 = [v32 plan];

    v34 = [v33 transferAttributes];
    unint64_t v35 = [v34 transferCapability];

    if (v35 <= 6 && ((1 << v35) & 0x68) != 0) {
      self->_showTransferredPane = 1;
    }

    if (v35 <= 6 && ((1 << v35) & 0x68) != 0)
    {
      id v4 = v56;
      goto LABEL_86;
    }
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v36 = self->_transferItems;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v71;
    uint64_t v69 = *(void *)v71;
    v66 = v36;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v71 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = [*(id *)(*((void *)&v70 + 1) + 8 * v40) objectForKeyedSubscript:@"planItem"];
        v42 = [v41 plan];
        v43 = [v42 transferAttributes];
        if (![v43 transferCapability]) {
          goto LABEL_67;
        }
        v44 = [v42 transferAttributes];
        if ([v44 transferCapability] == 1) {
          goto LABEL_66;
        }
        v45 = [v42 transferAttributes];
        if ([v45 transferCapability] == 12) {
          goto LABEL_65;
        }
        v46 = [v42 transferAttributes];
        if ([v46 transferCapability] == 9) {
          goto LABEL_64;
        }
        v47 = [v42 transferAttributes];
        if ([v47 transferCapability] == 7) {
          goto LABEL_63;
        }
        *(void *)v65 = v38;
        v48 = [v42 transferAttributes];
        if ([v48 transferCapability] == 11) {
          goto LABEL_62;
        }
        v64 = v48;
        v49 = [v42 transferAttributes];
        if ([v49 transferCapability] == 8) {
          goto LABEL_61;
        }
        v62 = v49;
        v50 = [v42 transferAttributes];
        if ([v50 transferCapability] == 13)
        {

          v49 = v62;
LABEL_61:

          v48 = v64;
LABEL_62:

          uint64_t v38 = *(void *)v65;
LABEL_63:

LABEL_64:
LABEL_65:

          v36 = v66;
          uint64_t v39 = v69;
LABEL_66:

LABEL_67:
          goto LABEL_68;
        }
        id obja = [v42 transferAttributes];
        uint64_t v60 = [obja transferCapability];

        uint64_t v38 = *(void *)v65;
        v36 = v66;
        uint64_t v39 = v69;
        if (v60 != 14) {
          goto LABEL_84;
        }
LABEL_68:
        v51 = [v42 transferAttributes];
        if ([v51 transferCapability] == 8)
        {
          BOOL v52 = +[TSUtilities inBuddy];

          if (!v52) {
            goto LABEL_84;
          }
        }
        else
        {
        }
        if (self->_isStandaloneProximityTransfer && [v41 isTransferIneligiblePlan])
        {
LABEL_84:

          goto LABEL_85;
        }

        ++v40;
      }
      while (v38 != v40);
      uint64_t v53 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v70 objects:v82 count:16];
      uint64_t v38 = v53;
    }
    while (v53);
  }

  v54 = _TSLogDomain();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
    -[TSTransferFlowModel filterTransferPlans:](v54);
  }

  [(NSMutableArray *)self->_transferItems removeAllObjects];
LABEL_85:
  id v4 = v56;
  p_super = &v67->super.super;
LABEL_86:
}

- (BOOL)shouldShowTransferredPane
{
  if (!self->_showTransferredPane) {
    return 0;
  }
  v2 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)requestTransferPlans:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_areTransferPlansReady)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    if (!self->_transferItems)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      transferItems = self->_transferItems;
      self->_transferItems = v6;
    }
    objc_initWeak(&location, self);
    uint64_t v8 = +[TSCoreTelephonyClientCache sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__TSTransferFlowModel_requestTransferPlans___block_invoke;
    v9[3] = &unk_264828350;
    objc_copyWeak(&v11, &location);
    v9[4] = self;
    id v10 = v5;
    [v8 transferPlanListWithCompletion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __44__TSTransferFlowModel_requestTransferPlans___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v7)
    {
      uint64_t v9 = _TSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_2((uint64_t)v7, v9);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 17) = [v7 code] == 61;
    }
    else if (v6)
    {
      if (!+[TSUtilities isPad])
      {
        id v18 = +[TSCoreTelephonyClientCache sharedInstance];
        char v19 = [v18 deviceSupportsHydra];

        if ((v19 & 1) == 0)
        {
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v20 = objc_msgSend(v6, "devices", 0);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v30;
            uint64_t v24 = &selRef_setTransferItems_;
            while (2)
            {
              uint64_t v25 = 0;
              uint64_t v26 = v24[260];
              do
              {
                if (*(void *)v30 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v27 = *(void **)(*((void *)&v29 + 1) + 8 * v25);
                if ((objc_opt_respondsToSelector() & 1) != 0 && [v27 performSelector:v26])
                {
                  uint64_t v28 = _TSLogDomain();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v34 = "-[TSTransferFlowModel requestTransferPlans:]_block_invoke";
                    _os_log_impl(&dword_227A17000, v28, OS_LOG_TYPE_DEFAULT, "remote has dual eSIM config @%s", buf, 0xCu);
                  }

                  [*(id *)(a1 + 32) setIsDualeSIMCapablityLoss:1];
                  goto LABEL_25;
                }
                ++v25;
              }
              while (v22 != v25);
              uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
              uint64_t v24 = &selRef_setTransferItems_;
              if (v22) {
                continue;
              }
              break;
            }
          }
LABEL_25:
        }
      }
      [*(id *)(a1 + 32) filterTransferPlans:v6];
    }
  }
  else
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)requestPendingInstallPlans:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_hasPendingInstallPlansQueried) {
    goto LABEL_4;
  }
  if (self->_isStandaloneProximityTransfer)
  {
    self->_hasPendingInstallPlansQueried = 1;
LABEL_4:
    (*((void (**)(id))v4 + 2))(v4);
    goto LABEL_5;
  }
  objc_initWeak(&location, self);
  id v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[TSTransferFlowModel requestPendingInstallPlans:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "_requestPendingInstallItems @%s", buf, 0xCu);
  }

  id v7 = +[TSCoreTelephonyClientCache sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__TSTransferFlowModel_requestPendingInstallPlans___block_invoke;
  v8[3] = &unk_2648283C8;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  [v7 pendingInstallItemsWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
LABEL_5:
}

void __50__TSTransferFlowModel_requestPendingInstallPlans___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2080;
      id v10 = "-[TSTransferFlowModel requestPendingInstallPlans:]_block_invoke";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "pending plans: %@ @%s", (uint8_t *)&v7, 0x16u);
    }

    objc_storeStrong(WeakRetained + 4, a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)filterCarrierSetupItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (self->_areTransferPlansReady)
    {
      int v7 = [v5 plans];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (+[TSFlowHelper hasTransferablePlanWithSameCarrierName:v6 transferablePlans:self->_transferItems inBuddy:1 matchingSODACarrierWebsheetTransferPlanIndex:v9])
        {
          [(TSTransferFlowModel *)self clearCarrierSetupItemsCache];
        }
        else
        {
          objc_storeStrong((id *)&self->_carrierSetupItems, a3);
          id v18 = v9;
          id v10 = +[TSFlowHelper sortIndexesInDescending:v9];
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) unsignedIntegerValue];
                uint64_t v16 = _TSLogDomain();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v17 = [(NSMutableArray *)self->_transferItems objectAtIndex:v15];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v24 = v17;
                  __int16 v25 = 2080;
                  uint64_t v26 = "-[TSTransferFlowModel filterCarrierSetupItems:]";
                  _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "Transferrable plan %@ will be removed from the list @%s", buf, 0x16u);
                }
                [(NSMutableArray *)self->_transferItems removeObjectAtIndex:v15];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }
          if ([(NSMutableArray *)self->_transferItems count]) {
            [(TSTransferFlowModel *)self clearCarrierSetupItemsCache];
          }

          id v9 = v18;
        }
      }
    }
  }
}

- (void)getWebsheetInfo:(id)a3 completion:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if (v6)
  {
    objc_initWeak(location, self);
    uint64_t v8 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    BOOL v9 = (unint64_t)[v8 count] > 1;

    if (v9)
    {
      id v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TSTransferFlowModel getWebsheetInfo:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    id v18 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    BOOL v19 = [v18 count] == 0;

    if (!v19)
    {
      long long v20 = +[TSCoreTelephonyClientCache sharedInstance];
      long long v21 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
      long long v22 = [v21 objectAtIndexedSubscript:0];
      uint64_t v23 = [v22 plan];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke;
      v25[3] = &unk_264828418;
      objc_copyWeak(&v27, location);
      uint64_t v26 = v7;
      [v20 getWebsheetInfoForPlan:v23 inBuddy:1 completion:v25];

      objc_destroyWeak(&v27);
    }
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v24 = _TSLogDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[TSTransferFlowModel getWebsheetInfo:completion:]";
      _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "No carrier setup items @%s", (uint8_t *)location, 0xCu);
    }

    v7[2](v7);
  }
}

void __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 6, a2);
    objc_storeStrong(v9 + 7, a3);
  }
  else
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowCarrierSetupPane
{
  return (+[TSUtilities isOnBootstrap]
       || self->_isStandaloneProximityTransfer)
      && self->_websheetUrl
      && self->_postdata != 0;
}

- (void)requestCarrierSetups:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasCarrierSetupItemsQueried)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = +[TSCoreTelephonyClientCache sharedInstance];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__TSTransferFlowModel_requestCarrierSetups___block_invoke;
    v7[3] = &unk_2648283F0;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    id v8 = v5;
    [v6 getCarrierSetupWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __44__TSTransferFlowModel_requestCarrierSetups___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2080;
      uint64_t v13 = "-[TSTransferFlowModel requestCarrierSetups:]_block_invoke";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Carrier setup %@ @%s", buf, 0x16u);
    }

    objc_storeStrong(WeakRetained + 5, a2);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__TSTransferFlowModel_requestCarrierSetups___block_invoke_39;
    v8[3] = &unk_264827CF0;
    id v7 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v7 getWebsheetInfo:v4 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __44__TSTransferFlowModel_requestCarrierSetups___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)arePlansRequested
{
  return self->_areTransferPlansReady && self->_hasPendingInstallPlansQueried && self->_hasCarrierSetupItemsQueried;
}

- (void)clearCache
{
  self->_areTransferPlansReady = 0;
  *(_WORD *)&self->_isBootstrapTriggerred = 0;
}

- (void)clearCarrierSetupItemsCache
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[TSTransferFlowModel clearCarrierSetupItemsCache]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "Clear carrier setup items cache @%s", (uint8_t *)&v7, 0xCu);
  }

  carrierSetupItems = self->_carrierSetupItems;
  self->_carrierSetupItems = 0;

  websheetUrl = self->_websheetUrl;
  self->_websheetUrl = 0;

  postdata = self->_postdata;
  self->_postdata = 0;
}

- (void)forceRecheckTransferableAndPendingInstallPlans
{
  self->_areTransferPlansReady = 0;
  self->_hasPendingInstallPlansQueried = 0;
  self->_hasCarrierSetupItemsQueried = 0;
}

- (void)requestPlans:(id)a3 transferablePlanOnSource:(BOOL)a4 bootstrapOnly:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (void (**)(id, NSMutableArray *, CTDisplayPlanList *, CTDisplayPlanList *))a6;
  if ([(TSTransferFlowModel *)self arePlansRequested])
  {
    v11[2](v11, self->_transferItems, self->_pendingInstallItems, self->_carrierSetupItems);
  }
  else
  {
    objc_initWeak(&location, self);
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy_;
    v32[4] = __Block_byref_object_dispose_;
    id v33 = (id)MEMORY[0x22A683B20](v11);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke;
    v31[3] = &unk_264828668;
    v31[4] = v32;
    __int16 v12 = (void *)MEMORY[0x22A683B20](v31);
    if (!self->_transferItems)
    {
      uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      transferItems = self->_transferItems;
      self->_transferItems = v13;
    }
    if (self->_isProximityFlow && v8 && !self->_areTransferPlansReady)
    {
      if (self->_isBootstrapComplete)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_2;
        v28[3] = &unk_264827F98;
        objc_copyWeak(&v30, &location);
        id v29 = v12;
        [(TSTransferFlowModel *)self requestTransferPlans:v28];

        objc_destroyWeak(&v30);
      }
      else
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_3;
        v24[3] = &unk_264828690;
        objc_copyWeak(&v26, &location);
        id v17 = v12;
        BOOL v27 = a5;
        v24[4] = self;
        id v25 = v17;
        [(TSTransferFlowModel *)self bootstrap:v10 completion:v24];

        objc_destroyWeak(&v26);
      }
    }
    else
    {
      self->_areTransferPlansReady = 1;
    }
    if (self->_hasCarrierSetupItemsQueried || +[TSUtilities isPad])
    {
      uint64_t v15 = _TSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v36 = "-[TSTransferFlowModel requestPlans:transferablePlanOnSource:bootstrapOnly:completion:]";
        _os_log_impl(&dword_227A17000, v15, OS_LOG_TYPE_DEFAULT, "Skip querying SODA plans on iPad! @%s", buf, 0xCu);
      }

      self->_hasCarrierSetupItemsQueried = 1;
    }
    else
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_5;
      v21[3] = &unk_264827F98;
      objc_copyWeak(&v23, &location);
      id v22 = v12;
      [(TSTransferFlowModel *)self requestCarrierSetups:v21];

      objc_destroyWeak(&v23);
    }
    if (a5)
    {
      uint64_t v16 = _TSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v36 = "-[TSTransferFlowModel requestPlans:transferablePlanOnSource:bootstrapOnly:completion:]";
        _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "Skip querying pending install plans! @%s", buf, 0xCu);
      }

      self->_hasPendingInstallPlansQueried = 1;
      if ([(TSTransferFlowModel *)self arePlansRequested]) {
        v11[2](v11, self->_transferItems, self->_pendingInstallItems, self->_carrierSetupItems);
      }
    }
    else
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_41;
      v18[3] = &unk_264827F98;
      objc_copyWeak(&v20, &location);
      id v19 = v12;
      [(TSTransferFlowModel *)self requestPendingInstallPlans:v18];

      objc_destroyWeak(&v20);
    }

    _Block_object_dispose(v32, 8);
    objc_destroyWeak(&location);
  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[18] = 1;
    if ([WeakRetained arePlansRequested])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [v7 transferItems];
      id v5 = [v7 pendingInstallItems];
      id v6 = [v7 carrierSetupItems];
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3 || *(unsigned char *)(a1 + 56))
    {
      WeakRetained[18] = 1;
      WeakRetained[10] = 1;
      if ([WeakRetained arePlansRequested])
      {
        uint64_t v6 = *(void *)(a1 + 40);
        id v7 = [v5 transferItems];
        BOOL v8 = [v5 pendingInstallItems];
        uint64_t v9 = [v5 carrierSetupItems];
        (*(void (**)(uint64_t, void *, void *, void *))(v6 + 16))(v6, v7, v8, v9);
      }
    }
    else
    {
      WeakRetained[10] = 1;
      id v10 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_4;
      v11[3] = &unk_264827F98;
      objc_copyWeak(&v13, (id *)(a1 + 48));
      id v12 = *(id *)(a1 + 40);
      [v10 requestTransferPlans:v11];

      objc_destroyWeak(&v13);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[18] = 1;
    if ([WeakRetained arePlansRequested])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [v7 transferItems];
      id v5 = [v7 pendingInstallItems];
      uint64_t v6 = [v7 carrierSetupItems];
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[12] = 1;
    if ([WeakRetained arePlansRequested])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [v7 transferItems];
      id v5 = [v7 pendingInstallItems];
      uint64_t v6 = [v7 carrierSetupItems];
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__TSTransferFlowModel_requestPlans_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_41(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[8] = 1;
    if ([WeakRetained arePlansRequested])
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [v7 transferItems];
      id v5 = [v7 pendingInstallItems];
      uint64_t v6 = [v7 carrierSetupItems];
      (*(void (**)(uint64_t, void *, void *, void *))(v3 + 16))(v3, v4, v5, v6);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSMutableArray)transferItems
{
  return self->_transferItems;
}

- (void)setTransferItems:(id)a3
{
}

- (CTDisplayPlanList)pendingInstallItems
{
  return self->_pendingInstallItems;
}

- (void)setPendingInstallItems:(id)a3
{
}

- (CTDisplayPlanList)carrierSetupItems
{
  return self->_carrierSetupItems;
}

- (void)setCarrierSetupItems:(id)a3
{
}

- (BOOL)isActivationPolicyMismatch
{
  return self->_isActivationPolicyMismatch;
}

- (void)setIsActivationPolicyMismatch:(BOOL)a3
{
  self->_isActivationPolicyMismatch = a3;
}

- (BOOL)isDualeSIMCapablityLoss
{
  return self->_isDualeSIMCapablityLoss;
}

- (void)setIsDualeSIMCapablityLoss:(BOOL)a3
{
  self->_isDualeSIMCapablityLoss = a3;
}

- (BOOL)isStandaloneProximityTransfer
{
  return self->_isStandaloneProximityTransfer;
}

- (void)setIsStandaloneProximityTransfer:(BOOL)a3
{
  self->_isStandaloneProximityTransfer = a3;
}

- (BOOL)showTransferredPane
{
  return self->_showTransferredPane;
}

- (void)setShowTransferredPane:(BOOL)a3
{
  self->_showTransferredPane = a3;
}

- (BOOL)isTransferNotSupportedFromiPhone
{
  return self->_isTransferNotSupportedFromiPhone;
}

- (void)setIsTransferNotSupportedFromiPhone:(BOOL)a3
{
  self->_isTransferNotSupportedFromiPhone = a3;
}

- (BOOL)areTransferPlansReady
{
  return self->_areTransferPlansReady;
}

- (void)setAreTransferPlansReady:(BOOL)a3
{
  self->_areTransferPlansReady = a3;
}

- (NSString)websheetUrl
{
  return self->_websheetUrl;
}

- (void)setWebsheetUrl:(id)a3
{
}

- (NSDictionary)postdata
{
  return self->_postdata;
}

- (void)setPostdata:(id)a3
{
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setTransferBackPlan:(id)a3
{
}

- (id)requestCompletion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setRequestCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_websheetUrl, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
}

void __91__TSTransferFlowModel_arePlansAvailable_transferablePlanOnSource_bootstrapOnly_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)filterTransferPlans:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[TSTransferFlowModel filterTransferPlans:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] no eligible plan to transfer in buddy @%s", (uint8_t *)&v1, 0xCu);
}

- (void)filterTransferPlans:(os_log_t)log .cold.2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSTransferFlowModel filterTransferPlans:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid CTRemotePlan @%s", buf, 0xCu);
}

void __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__TSTransferFlowModel_requestTransferPlans___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[TSTransferFlowModel requestTransferPlans:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)getWebsheetInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__TSTransferFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end