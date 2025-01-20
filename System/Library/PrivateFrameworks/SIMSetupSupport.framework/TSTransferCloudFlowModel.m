@interface TSTransferCloudFlowModel
- (BOOL)isActivationPolicyMismatch;
- (BOOL)isDualeSIMCapablityLoss;
- (BOOL)shouldShowCarrierSetupPane;
- (CTDisplayPlanList)carrierSetupItems;
- (CTDisplayPlanList)crossPlatformTransferItems;
- (NSDictionary)postdata;
- (NSMutableArray)transferItems;
- (NSString)websheetUrl;
- (void)arePlansAvailable:(id)a3;
- (void)clearCarrierSetupItemsCache;
- (void)filterCarrierSetupItems:(id)a3;
- (void)filterTransferPlans:(id)a3;
- (void)getWebsheetInfo:(id)a3 completion:(id)a4;
- (void)requestCarrierSetups:(id)a3;
- (void)requestCrossPlatformTransferPlanListWithCompletion:(id)a3;
- (void)requestPlansWithCompletion:(id)a3;
- (void)requestTransferPlans:(id)a3;
- (void)setCarrierSetupItems:(id)a3;
- (void)setCrossPlatformTransferItems:(id)a3;
- (void)setIsActivationPolicyMismatch:(BOOL)a3;
- (void)setIsDualeSIMCapablityLoss:(BOOL)a3;
- (void)setPostdata:(id)a3;
- (void)setTransferItems:(id)a3;
- (void)setWebsheetUrl:(id)a3;
@end

@implementation TSTransferCloudFlowModel

- (void)arePlansAvailable:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke;
  v6[3] = &unk_2648279A8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  v6[4] = self;
  id v7 = v5;
  [(TSTransferCloudFlowModel *)self requestPlansWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    v18 = _TSLogDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_10;
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = [WeakRetained carrierSetupItems];
  [v4 filterCarrierSetupItems:v5];

  uint64_t v6 = [v3 transferItems];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v3 transferItems];
    uint64_t v9 = [v8 count];

    if (v9) {
      goto LABEL_16;
    }
  }
  uint64_t v10 = [v3 carrierSetupItems];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [v3 carrierSetupItems];
    uint64_t v13 = [v12 plans];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [v3 carrierSetupItems];
      v16 = [v15 plans];
      uint64_t v17 = [v16 count];

      if (v17)
      {
LABEL_16:
        v26 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  uint64_t v27 = [v3 crossPlatformTransferItems];
  if (v27)
  {
    v18 = v27;
    v28 = [v3 crossPlatformTransferItems];
    uint64_t v29 = [v28 plans];
    if (v29)
    {
      v30 = (void *)v29;
      v31 = [v3 crossPlatformTransferItems];
      v32 = [v31 plans];
      uint64_t v33 = [v32 count];

      if (v33) {
        goto LABEL_16;
      }
      goto LABEL_11;
    }

LABEL_10:
  }
LABEL_11:
  v26 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_17:
  v26();
}

- (void)requestPlansWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x22A683B20](v4);
  uint64_t v6 = (OS_dispatch_group *)dispatch_group_create();
  queryGroup = self->_queryGroup;
  self->_queryGroup = v6;

  BOOL v8 = +[TSUtilities isWifiAvailable];
  dispatch_group_enter((dispatch_group_t)self->_queryGroup);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke;
  v21[3] = &unk_264827A20;
  objc_copyWeak(&v22, &location);
  [(TSTransferCloudFlowModel *)self requestCrossPlatformTransferPlanListWithCompletion:v21];
  objc_destroyWeak(&v22);
  if (v8)
  {
    dispatch_group_enter((dispatch_group_t)self->_queryGroup);
    uint64_t v9 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v10 = objc_msgSend(v9, "aa_primaryAppleAccount");

    if (v10)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_24;
      v19[3] = &unk_264827A20;
      objc_copyWeak(&v20, &location);
      [(TSTransferCloudFlowModel *)self requestTransferPlans:v19];
      objc_destroyWeak(&v20);
    }
    else
    {
      v12 = _TSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = "-[TSTransferCloudFlowModel requestPlansWithCompletion:]";
        _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "Device not sign in to the iCloud @%s", buf, 0xCu);
      }

      dispatch_group_leave((dispatch_group_t)self->_queryGroup);
    }
    if (!+[TSUtilities isPad])
    {
      dispatch_group_enter((dispatch_group_t)self->_queryGroup);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_25;
      v17[3] = &unk_264827A20;
      objc_copyWeak(&v18, &location);
      [(TSTransferCloudFlowModel *)self requestCarrierSetups:v17];
      objc_destroyWeak(&v18);
    }
  }
  else
  {
    v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v25 = "-[TSTransferCloudFlowModel requestPlansWithCompletion:]";
      _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "WiFi is required to query transfer plans and carrier setup items @%s", buf, 0xCu);
    }
  }
  uint64_t v13 = self->_queryGroup;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_26;
  block[3] = &unk_264827CF0;
  id v16 = v5;
  id v14 = v5;
  dispatch_group_notify(v13, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&location);
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[1]);
  }
  else
  {
    v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_24(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[1]);
  }
  else
  {
    v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_25(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[1]);
  }
  else
  {
    v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

uint64_t __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestTransferPlans:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_transferItems)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      transferItems = self->_transferItems;
      self->_transferItems = v5;
    }
    objc_initWeak(&location, self);
    uint64_t v7 = +[TSCoreTelephonyClientCache sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke;
    v16[3] = &unk_264828708;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    id v17 = v4;
    [v7 bootstrapPlanTransferUsingMessageSession:0 completion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TSTransferCloudFlowModel requestTransferPlans:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v3)
    {
      uint64_t v6 = +[TSCoreTelephonyClientCache sharedInstance];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_29;
      v8[3] = &unk_264828350;
      objc_copyWeak(&v10, (id *)(a1 + 48));
      id v7 = *(id *)(a1 + 40);
      v8[4] = *(void *)(a1 + 32);
      id v9 = v7;
      [v6 transferPlanListWithCompletion:v8];

      objc_destroyWeak(&v10);
      goto LABEL_8;
    }
    uint64_t v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_8:
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_29(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_29_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_7;
  }
  if (v7)
  {
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_29_cold_2();
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v6)
  {
    if (!+[TSUtilities isPad])
    {
      id v17 = +[TSCoreTelephonyClientCache sharedInstance];
      char v18 = [v17 deviceSupportsHydra];

      if ((v18 & 1) == 0)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v19 = objc_msgSend(v6, "devices", 0);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v29;
          uint64_t v23 = &selRef_setTransferItems_;
          while (2)
          {
            uint64_t v24 = 0;
            uint64_t v25 = v23[260];
            do
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v26 = *(void **)(*((void *)&v28 + 1) + 8 * v24);
              if ((objc_opt_respondsToSelector() & 1) != 0 && [v26 performSelector:v25])
              {
                uint64_t v27 = _TSLogDomain();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  uint64_t v33 = "-[TSTransferCloudFlowModel requestTransferPlans:]_block_invoke";
                  _os_log_impl(&dword_227A17000, v27, OS_LOG_TYPE_DEFAULT, "remote has dual eSIM config @%s", buf, 0xCu);
                }

                [*(id *)(a1 + 32) setIsDualeSIMCapablityLoss:1];
                goto LABEL_25;
              }
              ++v24;
            }
            while (v21 != v24);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v34 count:16];
            uint64_t v23 = &selRef_setTransferItems_;
            if (v21) {
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
LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)filterTransferPlans:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableArray *)self->_transferItems removeAllObjects];
  if (!v4)
  {
    p_super = _TSLogDomain();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
      _os_log_impl(&dword_227A17000, p_super, OS_LOG_TYPE_DEFAULT, "no remote plans @%s", buf, 0xCu);
    }
    goto LABEL_77;
  }
  v51 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v40 = v4;
  id obj = [v4 devices];
  uint64_t v45 = [obj countByEnumeratingWithState:&v62 objects:v80 count:16];
  if (v45)
  {
    uint64_t v43 = *(void *)v63;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v63 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v5;
        id v6 = *(void **)(*((void *)&v62 + 1) + 8 * v5);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v52 = v6;
        id v7 = [v6 remoteDisplayPlans];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v79 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v59 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              if ([v12 isNotEligibleActivationPolicyMismatchPlan]) {
                [(TSTransferCloudFlowModel *)self setIsActivationPolicyMismatch:1];
              }
              uint64_t v13 = [v12 plan];

              if (v13)
              {
                uint64_t v14 = [v12 plan];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) == 0)
                {
                  uint64_t v16 = _TSLogDomain();
                  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_30;
                  }
                  uint64_t v20 = [v12 plan];
                  *(_DWORD *)buf = 138412546;
                  v68 = v20;
                  __int16 v69 = 2080;
                  v70 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
                  _os_log_error_impl(&dword_227A17000, v16, OS_LOG_TYPE_ERROR, "[E]%@ is not a CTRemotePlan @%s", buf, 0x16u);
                  goto LABEL_29;
                }
                uint64_t v16 = [v12 plan];
                id v17 = [v16 transferAttributes];
                unint64_t v18 = [v17 transferCapability];

                if (v18 > 6 || ((1 << v18) & 0x68) == 0)
                {
                  if ([v12 isPhysical])
                  {
                    v73[0] = @"planItem";
                    v73[1] = @"deviceInfo";
                    v74[0] = v12;
                    v74[1] = v52;
                    uint64_t v20 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
                    transferItems = v51;
                  }
                  else
                  {
                    v75[0] = @"planItem";
                    v75[1] = @"deviceInfo";
                    v76[0] = v12;
                    v76[1] = v52;
                    uint64_t v20 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
                    transferItems = self->_transferItems;
                  }
                  [(NSMutableArray *)transferItems addObject:v20];
LABEL_29:
                }
              }
              else
              {
                uint64_t v16 = _TSLogDomain();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                  [(TSTransferCloudFlowModel *)v77 filterTransferPlans:v16];
                }
              }
LABEL_30:
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v79 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v47 + 1;
      }
      while (v47 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v62 objects:v80 count:16];
    }
    while (v45);
  }

  uint64_t v22 = +[TSCoreTelephonyClientCache sharedInstance];
  if ([v22 deviceSupportsHydra])
  {

LABEL_39:
    [(NSMutableArray *)self->_transferItems addObjectsFromArray:v51];
    goto LABEL_40;
  }
  BOOL v24 = +[TSUtilities isPad];

  if (v24) {
    goto LABEL_39;
  }
LABEL_40:
  uint64_t v25 = _TSLogDomain();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [(NSMutableArray *)self->_transferItems count];
    uint64_t v27 = self->_transferItems;
    *(_DWORD *)buf = 134218498;
    v68 = (const char *)v26;
    __int16 v69 = 2112;
    v70 = (const char *)v27;
    __int16 v71 = 2080;
    v72 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
    _os_log_impl(&dword_227A17000, v25, OS_LOG_TYPE_DEFAULT, "transfer plans [%lu] : %@ @%s", buf, 0x20u);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v53 = self->_transferItems;
  uint64_t v28 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (!v28) {
    goto LABEL_73;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v55;
  do
  {
    uint64_t v31 = 0;
    do
    {
      if (*(void *)v55 != v30) {
        objc_enumerationMutation(v53);
      }
      v32 = [*(id *)(*((void *)&v54 + 1) + 8 * v31) objectForKeyedSubscript:@"planItem"];
      uint64_t v33 = [v32 plan];
      v34 = [v33 transferAttributes];
      if (![v34 transferCapability]) {
        goto LABEL_52;
      }
      uint64_t v35 = [v33 transferAttributes];
      if ([v35 transferCapability] == 1) {
        goto LABEL_51;
      }
      v36 = [v33 transferAttributes];
      if ([v36 transferCapability] == 12)
      {

LABEL_51:
LABEL_52:

        goto LABEL_53;
      }
      v50 = [v33 transferAttributes];
      if ([v50 transferCapability] == 9)
      {
        BOOL v37 = 0;
      }
      else
      {
        v49 = [v33 transferAttributes];
        if ([v49 transferCapability] == 7)
        {
          BOOL v37 = 0;
        }
        else
        {
          v48 = [v33 transferAttributes];
          if ([v48 transferCapability] == 11)
          {
            BOOL v37 = 0;
          }
          else
          {
            v46 = [v33 transferAttributes];
            if ([v46 transferCapability] == 8)
            {
              BOOL v37 = 0;
            }
            else
            {
              v44 = [v33 transferAttributes];
              if ([v44 transferCapability] == 13)
              {
                BOOL v37 = 0;
              }
              else
              {
                id obja = [v33 transferAttributes];
                BOOL v37 = [obja transferCapability] != 14;
              }
            }
          }
        }
      }
      if (v37)
      {

        goto LABEL_76;
      }
LABEL_53:

      ++v31;
    }
    while (v29 != v31);
    uint64_t v38 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v54 objects:v66 count:16];
    uint64_t v29 = v38;
  }
  while (v38);
LABEL_73:

  v39 = _TSLogDomain();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    -[TSTransferCloudFlowModel filterTransferPlans:](v39);
  }

  [(NSMutableArray *)self->_transferItems removeAllObjects];
LABEL_76:
  id v4 = v40;
  p_super = &v51->super.super;
LABEL_77:
}

- (void)requestCarrierSetups:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = +[TSCoreTelephonyClientCache sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke;
    v14[3] = &unk_2648283F0;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    id v15 = v4;
    [v5 getCarrierSetupWithCompletion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TSTransferCloudFlowModel requestCarrierSetups:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke(uint64_t a1, void *a2)
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
      uint64_t v13 = "-[TSTransferCloudFlowModel requestCarrierSetups:]_block_invoke";
      _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Carrier setup %@ @%s", buf, 0x16u);
    }

    objc_storeStrong(WeakRetained + 4, a2);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke_34;
    v8[3] = &unk_264827CF0;
    uint64_t v7 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v7 getWebsheetInfo:v4 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __49__TSTransferCloudFlowModel_requestCarrierSetups___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)filterCarrierSetupItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 plans];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (+[TSFlowHelper hasTransferablePlanWithSameCarrierName:v6 transferablePlans:self->_transferItems inBuddy:1 matchingSODACarrierWebsheetTransferPlanIndex:v9])
      {
        [(TSTransferCloudFlowModel *)self clearCarrierSetupItemsCache];
      }
      else
      {
        objc_storeStrong((id *)&self->_carrierSetupItems, a3);
      }
      uint64_t v10 = +[TSFlowHelper getAccountMemberTransferablePlanWithSameCarrierName:v6 transferablePlans:self->_transferItems];

      uint64_t v19 = (void *)v10;
      id v11 = +[TSFlowHelper sortIndexesInDescending:v10];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntegerValue];
            id v17 = _TSLogDomain();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v18 = [(NSMutableArray *)self->_transferItems objectAtIndex:v16];
              *(_DWORD *)buf = 138412546;
              uint64_t v25 = v18;
              __int16 v26 = 2080;
              uint64_t v27 = "-[TSTransferCloudFlowModel filterCarrierSetupItems:]";
              _os_log_impl(&dword_227A17000, v17, OS_LOG_TYPE_DEFAULT, "Transferrable plan %@ will be removed from the list @%s", buf, 0x16u);
            }
            [(NSMutableArray *)self->_transferItems removeObjectAtIndex:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v13);
      }
      if ([(NSMutableArray *)self->_transferItems count]) {
        [(TSTransferCloudFlowModel *)self clearCarrierSetupItemsCache];
      }
    }
  }
}

- (void)getWebsheetInfo:(id)a3 completion:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (v6)
  {
    objc_initWeak(location, self);
    uint64_t v8 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    BOOL v9 = (unint64_t)[v8 count] > 1;

    if (v9)
    {
      uint64_t v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TSTransferCloudFlowModel getWebsheetInfo:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    unint64_t v18 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    BOOL v19 = [v18 count] == 0;

    if (!v19)
    {
      long long v20 = +[TSCoreTelephonyClientCache sharedInstance];
      long long v21 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
      long long v22 = [v21 objectAtIndexedSubscript:0];
      long long v23 = [v22 plan];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke;
      v25[3] = &unk_264828418;
      objc_copyWeak(&v27, location);
      __int16 v26 = v7;
      [v20 getWebsheetInfoForPlan:v23 inBuddy:1 completion:v25];

      objc_destroyWeak(&v27);
    }
    objc_destroyWeak(location);
  }
  else
  {
    BOOL v24 = _TSLogDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[TSTransferCloudFlowModel getWebsheetInfo:completion:]";
      _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "No carrier setup items @%s", (uint8_t *)location, 0xCu);
    }

    v7[2](v7);
  }
}

void __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowCarrierSetupPane
{
  return self->_websheetUrl && self->_postdata != 0;
}

- (void)requestCrossPlatformTransferPlanListWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x22A683B20](v4);
    id v6 = +[TSCoreTelephonyClientCache sharedInstance];
    id v7 = [v6 getCoreTelephonyClient];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke;
    v17[3] = &unk_2648283A0;
    objc_copyWeak(&v19, &location);
    id v8 = v5;
    id v18 = v8;
    [v7 plansPendingCrossPlatformTransferWithCompletion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TSTransferCloudFlowModel requestCrossPlatformTransferPlanListWithCompletion:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = _TSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2();
      }
    }
    BOOL v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v5;
      __int16 v21 = 2080;
      long long v22 = "-[TSTransferCloudFlowModel requestCrossPlatformTransferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "Cross platform transfer items %@ @%s", (uint8_t *)&v19, 0x16u);
    }

    id v10 = v5;
    uint64_t v11 = WeakRetained[5];
    WeakRetained[5] = v10;
  }
  else
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearCarrierSetupItemsCache
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[TSTransferCloudFlowModel clearCarrierSetupItemsCache]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "Clear carrier setup items cache @%s", (uint8_t *)&v7, 0xCu);
  }

  carrierSetupItems = self->_carrierSetupItems;
  self->_carrierSetupItems = 0;

  websheetUrl = self->_websheetUrl;
  self->_websheetUrl = 0;

  postdata = self->_postdata;
  self->_postdata = 0;
}

- (NSMutableArray)transferItems
{
  return self->_transferItems;
}

- (void)setTransferItems:(id)a3
{
}

- (CTDisplayPlanList)carrierSetupItems
{
  return self->_carrierSetupItems;
}

- (void)setCarrierSetupItems:(id)a3
{
}

- (CTDisplayPlanList)crossPlatformTransferItems
{
  return self->_crossPlatformTransferItems;
}

- (void)setCrossPlatformTransferItems:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postdata, 0);
  objc_storeStrong((id *)&self->_websheetUrl, 0);
  objc_storeStrong((id *)&self->_crossPlatformTransferItems, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_queryGroup, 0);
}

void __46__TSTransferCloudFlowModel_arePlansAvailable___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__TSTransferCloudFlowModel_requestPlansWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestTransferPlans:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]query bootstrap transfer plan error: %@ @%s", v2, v3, v4, v5, v6);
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_29_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__TSTransferCloudFlowModel_requestTransferPlans___block_invoke_29_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]error: %@ @%s", v2, v3, v4, v5, v6);
}

- (void)filterTransferPlans:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] no eligible plan to transfer in buddy @%s", (uint8_t *)&v1, 0xCu);
}

- (void)filterTransferPlans:(os_log_t)log .cold.2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[TSTransferCloudFlowModel filterTransferPlans:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid CTRemotePlan @%s", buf, 0xCu);
}

- (void)requestCarrierSetups:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getWebsheetInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__TSTransferCloudFlowModel_getWebsheetInfo_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestCrossPlatformTransferPlanListWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__TSTransferCloudFlowModel_requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

@end