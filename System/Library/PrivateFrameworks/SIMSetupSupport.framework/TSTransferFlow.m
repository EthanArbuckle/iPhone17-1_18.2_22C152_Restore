@interface TSTransferFlow
+ (void)needsToRunUsingMessageSession:(id)a3 completion:(id)a4;
+ (void)needsToRunUsingMessageSession:(id)a3 transferablePlanOnSource:(BOOL)a4 completion:(id)a5;
- (BOOL)_hasTransferablePlan:(id)a3;
- (BOOL)hasTransferablePlan;
- (BOOL)isAvailableOptionsQueryCompleted;
- (BOOL)isSourceProxCardVisible;
- (BOOL)isStandaloneProximityTransfer;
- (CUMessageSession)session;
- (CoreTelephonyClient)ctClient;
- (TSTransferFlow)init;
- (TSTransferFlow)initWithSession:(id)a3 hasTransferablePlan:(BOOL)a4 isStandaloneProximityTransfer:(BOOL)a5 transferBackPlan:(id)a6;
- (TSTransferFlowModel)model;
- (id)_createIntroViewController;
- (id)_firstViewController:(id)a3;
- (id)firstViewController;
- (id)firstViewControllerCallback;
- (id)nextViewControllerFrom:(id)a3;
- (id)transferBackPlan;
- (void)_updateSourceProxCardState:(BOOL)a3;
- (void)dealloc;
- (void)firstViewController:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setFirstViewControllerCallback:(id)a3;
- (void)setHasTransferablePlan:(BOOL)a3;
- (void)setIsAvailableOptionsQueryCompleted:(BOOL)a3;
- (void)setIsSourceProxCardVisible:(BOOL)a3;
- (void)setIsStandaloneProximityTransfer:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setSession:(id)a3;
- (void)setTransferBackPlan:(id)a3;
- (void)startOverWithFirstViewController:(id)a3;
- (void)transferEventUpdate:(id)a3;
- (void)userDidTapCancel;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSTransferFlow

- (TSTransferFlow)init
{
  v10.receiver = self;
  v10.super_class = (Class)TSTransferFlow;
  v2 = [(TSSIMSetupFlow *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v2 action:sel_userDidTapCancel];
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v3;

    v5 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v5 assertUserInPurchaseFlowStartOver:0 caller:v2];

    id v6 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v7 = [v6 initWithQueue:MEMORY[0x263EF83A0]];
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v7;

    [(CoreTelephonyClient *)v2->_ctClient setDelegate:v2];
  }
  return v2;
}

- (TSTransferFlow)initWithSession:(id)a3 hasTransferablePlan:(BOOL)a4 isStandaloneProximityTransfer:(BOOL)a5 transferBackPlan:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)TSTransferFlow;
  v13 = [(TSSIMSetupFlow *)&v32 init];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v13 action:sel_userDidTapCancel];
    cancelButton = v13->_cancelButton;
    v13->_cancelButton = (UIBarButtonItem *)v14;

    objc_storeStrong((id *)&v13->_session, a3);
    v13->_BOOL hasTransferablePlan = a4;
    v13->_isStandaloneProximityTransfer = a5;
    v13->_isAvailableOptionsQueryCompleted = 0;
    v13->_isSourceProxCardVisible = 1;
    objc_storeStrong(&v13->_transferBackPlan, a6);
    id v16 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v17 = [v16 initWithQueue:MEMORY[0x263EF83A0]];
    ctClient = v13->_ctClient;
    v13->_ctClient = (CoreTelephonyClient *)v17;

    [(CoreTelephonyClient *)v13->_ctClient setDelegate:v13];
    v19 = [[TSTransferFlowModel alloc] initWithIsStandaloneProximityTransfer:v13->_isStandaloneProximityTransfer transferBackPlan:v13->_transferBackPlan];
    model = v13->_model;
    v13->_model = v19;

    objc_initWeak(&location, v13);
    v21 = v13->_model;
    session = v13->_session;
    BOOL hasTransferablePlan = v13->_hasTransferablePlan;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __101__TSTransferFlow_initWithSession_hasTransferablePlan_isStandaloneProximityTransfer_transferBackPlan___block_invoke;
    v29 = &unk_2648286B8;
    objc_copyWeak(&v30, &location);
    [(TSTransferFlowModel *)v21 arePlansAvailable:session transferablePlanOnSource:hasTransferablePlan bootstrapOnly:0 completion:&v26];
    v24 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v24 assertUserInPurchaseFlowStartOver:0 caller:v13];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __101__TSTransferFlow_initWithSession_hasTransferablePlan_isStandaloneProximityTransfer_transferBackPlan___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAvailableOptionsQueryCompleted:1];

  id v3 = objc_loadWeakRetained(v1);
  v4 = [v3 firstViewControllerCallback];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 firstViewControllerCallback];
    id v7 = objc_loadWeakRetained(v1);
    v8 = [v7 model];
    v9 = [v7 _firstViewController:v8];
    ((void (**)(void, void *))v6)[2](v6, v9);

    id v10 = objc_loadWeakRetained(v1);
    [v10 setFirstViewControllerCallback:0];
  }
}

- (void)dealloc
{
  id v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4.receiver = self;
  v4.super_class = (Class)TSTransferFlow;
  [(TSTransferFlow *)&v4 dealloc];
}

+ (void)needsToRunUsingMessageSession:(id)a3 completion:(id)a4
{
}

+ (void)needsToRunUsingMessageSession:(id)a3 transferablePlanOnSource:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    if (+[TSUtilities hasCellularBaseband])
    {
      v9 = +[TSTransferFlowModel sharedInstance];
      [v9 clearCache];

      id v10 = +[TSTransferFlowModel sharedInstance];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __84__TSTransferFlow_needsToRunUsingMessageSession_transferablePlanOnSource_completion___block_invoke;
      v11[3] = &unk_2648286E0;
      id v12 = v8;
      [v10 arePlansAvailable:v7 transferablePlanOnSource:v6 bootstrapOnly:1 completion:v11];
    }
    else
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

uint64_t __84__TSTransferFlow_needsToRunUsingMessageSession_transferablePlanOnSource_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)firstViewController
{
  return [(TSTransferFlow *)self _firstViewController:self->_model];
}

- (BOOL)_hasTransferablePlan:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", @"planItem", (void)v12);
        char v9 = [v8 isTransferablePlan];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)_firstViewController:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!+[TSUtilities isPad]
    || !+[TSUtilities isGreenTeaCapable]
    || !+[TSUtilities inBuddy])
  {
    id v7 = [v4 transferItems];
    transferItems = self->_transferItems;
    self->_transferItems = v7;

    if ([v4 shouldShowTransferredPane])
    {
      char v9 = [TSTransferredViewController alloc];
      BOOL v10 = [(NSArray *)self->_transferItems objectAtIndex:0];
      uint64_t v6 = [(TSTransferredViewController *)v9 initWithTransferredPlan:v10];

      [(TSTransferredViewController *)v6 setDelegate:self];
LABEL_22:
      [(TSSIMSetupFlow *)self setTopViewController:v6];
      goto LABEL_23;
    }
    id v11 = [v4 pendingInstallItems];
    pendingInstallItems = self->_pendingInstallItems;
    self->_pendingInstallItems = v11;

    self->_isActivationPolicyMismatch = [v4 isActivationPolicyMismatch];
    self->_isDualeSIMCapablityLoss = [v4 isDualeSIMCapablityLoss];
    long long v13 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
    unint64_t v14 = [v13 count];

    if (v14 >= 2)
    {
      if (+[TSUtilities inBuddy]) {
        long long v15 = TSMultiPlanIntermediateViewController;
      }
      else {
        long long v15 = TSTransferListViewController;
      }
      v23 = (TSMultiPlanIntermediateViewController *)[[v15 alloc] initWithPendingInstallItems:self->_pendingInstallItems];
      goto LABEL_18;
    }
    id v16 = [v4 pendingInstallItems];
    uint64_t v17 = [v16 plans];
    uint64_t v18 = [v17 count];

    if (v18 == 1)
    {
      v19 = [TSSinglePlanTransferViewController alloc];
      v20 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
      v21 = [v20 objectAtIndexedSubscript:0];
      uint64_t v22 = [(TSSinglePlanTransferViewController *)v19 initWithPendingInstallPlan:v21];
    }
    else
    {
      if ([(NSArray *)self->_transferItems count] >= 2)
      {
        if ([(TSTransferFlow *)self _hasTransferablePlan:self->_transferItems]
          || !self->_isStandaloneProximityTransfer)
        {
          if (+[TSUtilities inBuddy])
          {
            v23 = [[TSMultiPlanIntermediateViewController alloc] initWithTransferItems:self->_transferItems pendingInstallItems:0 carrierSetupItems:0 showOtherOptions:0 isStandaloneProximityFlow:self->_isStandaloneProximityTransfer];
          }
          else
          {
            v46 = [TSTransferListViewController alloc];
            BYTE1(v62) = self->_isStandaloneProximityTransfer;
            LOBYTE(v62) = 0;
            v23 = -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](v46, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", self->_transferItems, 0, self->_isActivationPolicyMismatch, self->_isDualeSIMCapablityLoss, 0, 0, v62);
          }
LABEL_18:
          uint64_t v6 = (TSTransferredViewController *)v23;
          goto LABEL_19;
        }
        uint64_t v27 = [TSNoPlanForTransferViewController alloc];
        v20 = [self->_transferBackPlan phoneNumber];
        char v28 = [v4 isTransferNotSupportedFromiPhone];
        BYTE1(v62) = self->_transferBackPlan != 0;
        LOBYTE(v62) = v28;
        uint64_t v6 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v27, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", 0, v20, 0, 0, 1, 0, v62);
LABEL_15:

LABEL_19:
        [(TSTransferredViewController *)v6 setDelegate:self];
        v24 = _TSLogDomain();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(void *)v67 = v25;
          *(_WORD *)&v67[8] = 2080;
          v68 = "-[TSTransferFlow _firstViewController:]";
          _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", buf, 0x16u);
        }

        goto LABEL_22;
      }
      if ([(NSArray *)self->_transferItems count] == 1)
      {
        v29 = [(NSArray *)self->_transferItems objectAtIndexedSubscript:0];
        v20 = [v29 objectForKeyedSubscript:@"planItem"];

        id v30 = [(NSArray *)self->_transferItems objectAtIndexedSubscript:0];
        v31 = [v30 objectForKeyedSubscript:@"deviceInfo"];

        v64 = v31;
        if ([v20 isTransferIneligiblePlan])
        {
          v63 = [TSNoPlanForTransferViewController alloc];
          objc_super v32 = [v20 carrierName];
          v33 = [self->_transferBackPlan phoneNumber];
          v34 = [v20 plan];
          v35 = [v34 transferAttributes];
          uint64_t v36 = [v35 transferCapability];
          v37 = [v31 deviceName];
          char v38 = [v4 isTransferNotSupportedFromiPhone];
          BYTE1(v62) = self->_transferBackPlan != 0;
          LOBYTE(v62) = v38;
          uint64_t v6 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v63, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v32, v33, v36, 0, 1, v37, v62);
        }
        else
        {
          v47 = [TSSinglePlanTransferViewController alloc];
          objc_super v32 = [(NSArray *)self->_transferItems objectAtIndexedSubscript:0];
          uint64_t v48 = [v20 isPhysical];
          uint64_t v49 = [v20 isTransferIneligiblePlan];
          BOOL v50 = +[TSUtilities inBuddy];
          BOOL isStandaloneProximityTransfer = self->_isStandaloneProximityTransfer;
          v33 = [self->_transferBackPlan phoneNumber];
          LOBYTE(v62) = isStandaloneProximityTransfer;
          uint64_t v6 = [(TSSinglePlanTransferViewController *)v47 initWithTransferPlan:v32 isPhysical:v48 isIneligible:v49 inBuddy:v50 confirmCellularPlanTransfer:0 showOtherOptions:0 isStandaloneProximityFlow:v62 transferBackPhoneNumber:v33];
        }

        goto LABEL_15;
      }
      if ([v4 shouldShowCarrierSetupPane])
      {
        v39 = [TSBuddyMLViewController alloc];
        v40 = [v4 carrierSetupItems];
        v41 = [v40 plans];
        v42 = [v41 objectAtIndexedSubscript:0];
        v43 = [v42 plan];
        v44 = [v4 websheetUrl];
        v45 = [v4 postdata];
        uint64_t v6 = [(TSBuddyMLViewController *)v39 initWithCTPlan:v43 websheetURL:v44 postdata:v45];

        v20 = dispatch_get_current_queue();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __39__TSTransferFlow__firstViewController___block_invoke;
        block[3] = &unk_2648279D0;
        block[4] = self;
        dispatch_async(v20, block);
        goto LABEL_15;
      }
      if (!self->_isStandaloneProximityTransfer)
      {
        BOOL v54 = +[TSUtilities isWifiAvailable];
        v55 = +[TSCellularPlanManagerCache sharedInstance];
        v56 = [v55 planItems];
        uint64_t v57 = [v56 count];

        v58 = +[TSCoreTelephonyClientCache sharedInstance];
        int v59 = [v58 usingBootstrapDataService];

        v60 = _TSLogDomain();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v67 = v54;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v57 != 0;
          LOWORD(v68) = 1024;
          *(_DWORD *)((char *)&v68 + 2) = v59;
          HIWORD(v68) = 2080;
          v69 = "-[TSTransferFlow _firstViewController:]";
          _os_log_impl(&dword_227A17000, v60, OS_LOG_TYPE_DEFAULT, "isWiFi:%d, hasPlans:%d, usingBootstrap:%d @%s", buf, 0x1Eu);
        }

        uint64_t v6 = 0;
        if (v57) {
          char v61 = 1;
        }
        else {
          char v61 = v54;
        }
        if (v61 & 1) != 0 || ((v59 ^ 1)) {
          goto LABEL_19;
        }
        v23 = [(TSTransferFlow *)self _createIntroViewController];
        goto LABEL_18;
      }
      v52 = [TSNoPlanForTransferViewController alloc];
      v20 = [self->_transferBackPlan carrierName];
      v21 = [self->_transferBackPlan phoneNumber];
      char v53 = [v4 isTransferNotSupportedFromiPhone];
      BYTE1(v62) = self->_transferBackPlan != 0;
      LOBYTE(v62) = v53;
      uint64_t v22 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v52, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v20, v21, 0, 0, 1, 0, v62);
    }
    uint64_t v6 = (TSTransferredViewController *)v22;

    goto LABEL_15;
  }
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v67 = "-[TSTransferFlow _firstViewController:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "Skip for greentea ipad in buddy @%s", buf, 0xCu);
  }

  uint64_t v6 = 0;
LABEL_23:

  return v6;
}

uint64_t __39__TSTransferFlow__firstViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSourceProxCardState:0];
}

- (id)_createIntroViewController
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()) {
    BOOL v3 = self->_session == 0;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = +[TSUtilities isPad];
  uint64_t v5 = !v4 & v3;
  if (v4 && v3) {
    uint64_t v5 = _os_feature_enabled_impl();
  }
  uint64_t v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "OFF";
    if (v5) {
      id v7 = "ON";
    }
    int v10 = 136315394;
    id v11 = v7;
    __int16 v12 = 2080;
    long long v13 = "-[TSTransferFlow _createIntroViewController]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "transfer option is %s @%s", (uint8_t *)&v10, 0x16u);
  }

  id v8 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v5 requireDelayBluetoothConnection:0];
  return v8;
}

- (void)firstViewController:(id)a3
{
  if (self->_isAvailableOptionsQueryCompleted)
  {
    model = self->_model;
    id v6 = a3;
    uint64_t v10 = [(TSTransferFlow *)self _firstViewController:model];
    (*((void (**)(id, uint64_t))a3 + 2))(v6, v10);

    id firstViewControllerCallback = (id)v10;
  }
  else
  {
    id v8 = a3;
    char v9 = (void *)MEMORY[0x22A683B20]();

    id firstViewControllerCallback = self->_firstViewControllerCallback;
    self->_id firstViewControllerCallback = v9;
  }
}

- (void)startOverWithFirstViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TSSIMSetupFlow *)self navigationController];
  id v6 = [v5 topViewController];
  id v7 = [(TSSIMSetupFlow *)self navigationController];
  BOOL v8 = +[TSFlowHelper handleStartOverAgainstNoPlan:v6 navigationController:v7 completion:v4];

  if (!v8)
  {
    objc_initWeak(&location, self);
    char v9 = +[TSCellularPlanManagerCache sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__TSTransferFlow_startOverWithFirstViewController___block_invoke;
    v10[3] = &unk_264828570;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [v9 hasInstallingPlanOrUserPlan:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __51__TSTransferFlow_startOverWithFirstViewController___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0
    || (id v3 = objc_loadWeakRetained((id *)(a1 + 40)),
        int v4 = [v3 isStandaloneProximityTransfer],
        v3,
        v4))
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [WeakRetained model];
    [v7 clearCache];

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    char v9 = [v8 model];
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = [v10 session];
    id v12 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v13 = [v12 hasTransferablePlan];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_2;
    v14[3] = &unk_264828570;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v15 = *(id *)(a1 + 32);
    [v9 arePlansAvailable:v11 transferablePlanOnSource:v13 bootstrapOnly:0 completion:v14];

    objc_destroyWeak(&v16);
  }
}

void __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_3;
  v3[3] = &unk_264827F70;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained firstViewController:v3];
}

uint64_t __51__TSTransferFlow_startOverWithFirstViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)nextViewControllerFrom:(id)a3
{
  v56[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(TSTransferFlowModel *)self->_model shouldShowCarrierSetupPane]) {
      goto LABEL_19;
    }
    if (![v5 isOtherButtonTapped])
    {
      uint64_t v13 = [TSSubFlowViewController alloc];
      v55[0] = @"FlowTypeKey";
      v55[1] = @"SkipActivatingPane";
      uint64_t v14 = MEMORY[0x263EFFA88];
      v56[0] = &unk_26DC14380;
      v56[1] = MEMORY[0x263EFFA88];
      v55[2] = @"DelayStartActivatingTimer";
      int v15 = [v5 installingTransferPlan];
      id v16 = &unk_26DC143B0;
      if (v15) {
        id v16 = &unk_26DC14398;
      }
      v56[2] = v16;
      v55[3] = @"TransferBackPlan";
      id transferBackPlan = self->_transferBackPlan;
      uint64_t v18 = transferBackPlan;
      if (!transferBackPlan)
      {
        uint64_t v18 = [MEMORY[0x263EFF9D0] null];
      }
      v56[3] = v18;
      v55[4] = @"PlanSetupTypeKey";
      int v19 = [v5 installingTransferPlan];
      v20 = &unk_26DC143E0;
      if (v19) {
        v20 = &unk_26DC143C8;
      }
      v56[4] = v20;
      v55[5] = @"CarrierNameKey";
      v21 = [v5 carrierNameForSelectedItem];
      if (v21) {
        [v5 carrierNameForSelectedItem];
      }
      else {
      v33 = [MEMORY[0x263EFF9D0] null];
      }
      v55[6] = @"MaybeShowConfirmationCodePaneKey";
      v56[5] = v33;
      v56[6] = v14;
      v34 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:7];
      v35 = [(TSSIMSetupFlow *)self navigationController];
      char v28 = [(TSSubFlowViewController *)v13 initWithOptions:v34 navigationController:v35];

      if (transferBackPlan) {
        goto LABEL_37;
      }
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isTransferListCellTapped])
    {
      id v6 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        id v8 = [TSTransferListViewController alloc];
        BOOL isActivationPolicyMismatch = self->_isActivationPolicyMismatch;
        BOOL isDualeSIMCapablityLoss = self->_isDualeSIMCapablityLoss;
        pendingInstallItems = self->_pendingInstallItems;
        BYTE1(v46) = self->_isStandaloneProximityTransfer;
        LOBYTE(v46) = 0;
        transferItems = 0;
LABEL_33:
        char v28 = -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](v8, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", transferItems, 0, isActivationPolicyMismatch, isDualeSIMCapablityLoss, pendingInstallItems, 0, v46);
        goto LABEL_38;
      }
      if ([(TSTransferFlow *)self _hasTransferablePlan:self->_transferItems])
      {
        id v8 = [TSTransferListViewController alloc];
        transferItems = self->_transferItems;
        BOOL isActivationPolicyMismatch = self->_isActivationPolicyMismatch;
        BOOL isDualeSIMCapablityLoss = self->_isDualeSIMCapablityLoss;
        BYTE1(v46) = self->_isStandaloneProximityTransfer;
        LOBYTE(v46) = 0;
        pendingInstallItems = 0;
        goto LABEL_33;
      }
    }
LABEL_34:
    char v28 = 0;
    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isCarrierSetupItemSelected])
    {
LABEL_19:
      uint64_t v22 = [TSBuddyMLViewController alloc];
      uint64_t v18 = [(TSTransferFlowModel *)self->_model carrierSetupItems];
      v23 = [v18 plans];
      v24 = [v23 objectAtIndexedSubscript:0];
      uint64_t v25 = [v24 plan];
      uint64_t v26 = [(TSTransferFlowModel *)self->_model websheetUrl];
      uint64_t v27 = [(TSTransferFlowModel *)self->_model postdata];
      char v28 = [(TSBuddyMLViewController *)v22 initWithCTPlan:v25 websheetURL:v26 postdata:v27];

LABEL_20:
LABEL_21:

LABEL_22:
LABEL_37:

      goto LABEL_38;
    }
    if (![v5 isOtherButtonTapped])
    {
      v37 = [TSSubFlowViewController alloc];
      v53[0] = @"FlowTypeKey";
      v53[1] = @"SkipActivatingPane";
      uint64_t v38 = MEMORY[0x263EFFA88];
      v54[0] = &unk_26DC14380;
      v54[1] = MEMORY[0x263EFFA88];
      v53[2] = @"DelayStartActivatingTimer";
      int v39 = [v5 installingTransferPlan];
      v40 = &unk_26DC143B0;
      if (v39) {
        v40 = &unk_26DC14398;
      }
      v54[2] = v40;
      v53[3] = @"PlanSetupTypeKey";
      int v41 = [v5 installingTransferPlan];
      v42 = &unk_26DC143E0;
      if (v41) {
        v42 = &unk_26DC143C8;
      }
      v54[3] = v42;
      v53[4] = @"CarrierNameKey";
      uint64_t v18 = [v5 carrierNameForSelectedItem];
      if (v18) {
        [v5 carrierNameForSelectedItem];
      }
      else {
      v23 = [MEMORY[0x263EFF9D0] null];
      }
      v53[5] = @"MaybeShowConfirmationCodePaneKey";
      v54[4] = v23;
      v54[5] = v38;
      v24 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:6];
      v45 = [(TSSIMSetupFlow *)self navigationController];
      char v28 = [(TSSubFlowViewController *)v37 initWithOptions:v24 navigationController:v45];

      goto LABEL_20;
    }
LABEL_27:
    char v28 = [(TSTransferFlow *)self _createIntroViewController];
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 isScanButtonTapped])
      {
        objc_super v32 = [TSSubFlowViewController alloc];
        v49[0] = @"FlowTypeKey";
        v49[1] = @"IsFirstViewKey";
        v50[0] = &unk_26DC14410;
        v50[1] = MEMORY[0x263EFFA80];
        uint64_t v18 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
        v23 = [(TSSIMSetupFlow *)self navigationController];
        char v28 = [(TSSubFlowViewController *)v32 initWithOptions:v18 navigationController:v23];
      }
      else
      {
        if (![v5 isProximityTransferButtonTapped])
        {
          char v28 = 0;
          goto LABEL_37;
        }
        v43 = [TSSubFlowViewController alloc];
        v47[0] = @"FlowTypeKey";
        uint64_t v18 = [NSNumber numberWithUnsignedInteger:10002];
        v47[1] = @"IsClientKey";
        v48[0] = v18;
        v48[1] = MEMORY[0x263EFFA80];
        v23 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
        v44 = [(TSSIMSetupFlow *)self navigationController];
        char v28 = [(TSSubFlowViewController *)v43 initWithOptions:v23 navigationController:v44];
      }
      goto LABEL_21;
    }
    goto LABEL_34;
  }
  v29 = [TSSubFlowViewController alloc];
  v51[0] = @"FlowTypeKey";
  v51[1] = @"SkipActivatingPane";
  v52[0] = &unk_26DC14380;
  v52[1] = MEMORY[0x263EFFA80];
  v51[2] = @"PlanSetupTypeKey";
  v52[2] = &unk_26DC143F8;
  id v30 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  v31 = [(TSSIMSetupFlow *)self navigationController];
  char v28 = [(TSSubFlowViewController *)v29 initWithOptions:v30 navigationController:v31];

  if (!self->_isSourceProxCardVisible) {
    [(TSTransferFlow *)self _updateSourceProxCardState:1];
  }
LABEL_38:

  return v28;
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v5 = v4;
  if ([v5 subFlowType] != 2
    || ([v5 navigationController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 viewControllers],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 indexOfObject:v5],
        v7,
        v6,
        !v8))
  {

LABEL_6:
    v14.receiver = self;
    v14.super_class = (Class)TSTransferFlow;
    [(TSSIMSetupFlow *)&v14 viewControllerDidComplete:v4];
    goto LABEL_7;
  }
  char v9 = [v5 navigationController];
  id v10 = [v9 viewControllers];
  id v11 = [v10 objectAtIndex:v8 - 1];

  id v12 = [v5 navigationController];
  id v13 = (id)[v12 popToViewController:v11 animated:1];

  v15.receiver = self;
  v15.super_class = (Class)TSTransferFlow;
  [(TSSIMSetupFlow *)&v15 viewControllerDidComplete:v11];

LABEL_7:
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[TSUtilities isPad];
  id v6 = [v4 navigationItem];
  uint64_t v7 = v6;
  cancelButton = self->_cancelButton;
  if (v5) {
    [v6 setRightBarButtonItem:cancelButton];
  }
  else {
    [v6 setLeftBarButtonItem:cancelButton];
  }

  id v9 = [v4 navigationItem];

  [v9 setHidesBackButton:1 animated:0];
}

- (void)transferEventUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2080;
    id v10 = "-[TSTransferFlow transferEventUpdate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [v4 objectForKey:@"UpdateProxCardVisibility"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TSTransferFlow _updateSourceProxCardState:](self, "_updateSourceProxCardState:", [v6 BOOLValue]);
    }
  }
}

- (void)userDidTapCancel
{
  id v3 = [(TSSIMSetupFlow *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v4 = [(TSSIMSetupFlow *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
  }
  id v6 = +[TSCoreTelephonyClientCache sharedInstance];
  id v7 = objc_alloc(MEMORY[0x263F02CE0]);
  id v8 = [(TSTransferFlowModel *)self->_model transferItems];
  unint64_t v9 = +[TSUtilities transferablePlans:v8];
  id v10 = [(TSTransferFlowModel *)self->_model pendingInstallItems];
  uint64_t v11 = [v10 plans];
  uint64_t v12 = [v11 count];
  id v13 = [(TSTransferFlowModel *)self->_model transferItems];
  objc_super v14 = objc_msgSend(v7, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 1, v9, 0, v12, 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", v13));
  [v6 submitSimSetupUsage:v14];

LABEL_5:
  if (!self->_isSourceProxCardVisible) {
    [(TSTransferFlow *)self _updateSourceProxCardState:1];
  }
  v15.receiver = self;
  v15.super_class = (Class)TSTransferFlow;
  [(TSSIMSetupFlow *)&v15 userDidTapCancel];
}

- (void)_updateSourceProxCardState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v5 = [(TSSIMSetupFlow *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = @"hiding";
      if (v3) {
        id v8 = @"showing";
      }
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      id v13 = "-[TSTransferFlow _updateSourceProxCardState:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "%@ prox card on source device @%s", (uint8_t *)&v10, 0x16u);
    }

    self->_isSourceProxCardVisible = v3;
    unint64_t v9 = [(TSSIMSetupFlow *)self delegate];
    [v9 updateSourceProxCardState:v3];
  }
}

- (CUMessageSession)session
{
  return (CUMessageSession *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSession:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCtClient:(id)a3
{
}

- (BOOL)hasTransferablePlan
{
  return self->_hasTransferablePlan;
}

- (void)setHasTransferablePlan:(BOOL)a3
{
  self->_BOOL hasTransferablePlan = a3;
}

- (BOOL)isStandaloneProximityTransfer
{
  return self->_isStandaloneProximityTransfer;
}

- (void)setIsStandaloneProximityTransfer:(BOOL)a3
{
  self->_BOOL isStandaloneProximityTransfer = a3;
}

- (BOOL)isAvailableOptionsQueryCompleted
{
  return self->_isAvailableOptionsQueryCompleted;
}

- (void)setIsAvailableOptionsQueryCompleted:(BOOL)a3
{
  self->_isAvailableOptionsQueryCompleted = a3;
}

- (BOOL)isSourceProxCardVisible
{
  return self->_isSourceProxCardVisible;
}

- (void)setIsSourceProxCardVisible:(BOOL)a3
{
  self->_isSourceProxCardVisible = a3;
}

- (TSTransferFlowModel)model
{
  return (TSTransferFlowModel *)objc_getProperty(self, a2, 168, 1);
}

- (void)setModel:(id)a3
{
}

- (id)firstViewControllerCallback
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setFirstViewControllerCallback:(id)a3
{
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setTransferBackPlan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong(&self->_firstViewControllerCallback, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_queryGroup, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

@end