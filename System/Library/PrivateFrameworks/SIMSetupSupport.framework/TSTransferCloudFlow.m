@interface TSTransferCloudFlow
- (BOOL)isSourceProxCardVisible;
- (TSTransferCloudFlow)initWithProximitySetupState:(unint64_t)a3;
- (TSTransferCloudFlowModel)model;
- (id)_createIntroViewController:(BOOL)a3;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)_updateSourceProxCardState:(BOOL)a3;
- (void)dealloc;
- (void)firstViewController:(id)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setIsSourceProxCardVisible:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)startOverWithFirstViewController:(id)a3;
- (void)userDidTapCancel;
@end

@implementation TSTransferCloudFlow

- (TSTransferCloudFlow)initWithProximitySetupState:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSTransferCloudFlow;
  v4 = [(TSSIMSetupFlow *)&v11 init];
  if (v4)
  {
    v5 = objc_alloc_init(TSTransferCloudFlowModel);
    model = v4->_model;
    v4->_model = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v4 action:sel_userDidTapCancel];
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIBarButtonItem *)v7;

    v4->_proximitySetupState = a3;
    v9 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v9 assertUserInPurchaseFlowStartOver:0 caller:v4];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4.receiver = self;
  v4.super_class = (Class)TSTransferCloudFlow;
  [(TSTransferCloudFlow *)&v4 dealloc];
}

- (id)firstViewController
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (+[TSUtilities isPad]
    && +[TSUtilities isGreenTeaCapable]
    && +[TSUtilities inBuddy])
  {
    v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[TSTransferCloudFlow firstViewController]";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "Skip for greentea ipad in buddy @%s", buf, 0xCu);
    }
LABEL_10:
    v8 = 0;
    goto LABEL_27;
  }
  v3 = [(TSTransferCloudFlowModel *)self->_model transferItems];
  objc_super v4 = [(TSTransferCloudFlowModel *)self->_model crossPlatformTransferItems];
  v5 = [v4 plans];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    uint64_t v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[TSTransferCloudFlow firstViewController]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Skip showing cross-platform VC. @%s", buf, 0xCu);
    }

    goto LABEL_10;
  }
  if ((unint64_t)[v3 count] < 2)
  {
    if ([v3 count] == 1)
    {
      v10 = [v3 objectAtIndexedSubscript:0];
      objc_super v11 = [v10 objectForKeyedSubscript:@"planItem"];

      v12 = [v3 objectAtIndexedSubscript:0];
      v13 = [v12 objectForKeyedSubscript:@"deviceInfo"];

      if ([v11 isTransferIneligiblePlan])
      {
        v14 = [TSNoPlanForTransferViewController alloc];
        v15 = [v11 carrierName];
        v16 = [v11 plan];
        v17 = [v16 transferAttributes];
        uint64_t v18 = [v17 transferCapability];
        v19 = [v13 deviceName];
        LOWORD(v30) = 0;
        v8 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v14, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v15, 0, v18, 1, 1, v19, v30);
      }
      else
      {
        v27 = [TSSinglePlanTransferViewController alloc];
        v15 = [v3 objectAtIndexedSubscript:0];
        v8 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:](v27, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:", v15, [v11 isPhysical], objc_msgSend(v11, "isTransferIneligiblePlan"), 1, 1, 1);
      }

      goto LABEL_24;
    }
    if ([(TSTransferCloudFlowModel *)self->_model shouldShowCarrierSetupPane])
    {
      v20 = [TSBuddyMLViewController alloc];
      v21 = [(TSTransferCloudFlowModel *)self->_model carrierSetupItems];
      v22 = [v21 plans];
      v23 = [v22 objectAtIndexedSubscript:0];
      v24 = [v23 plan];
      v25 = [(TSTransferCloudFlowModel *)self->_model websheetUrl];
      v26 = [(TSTransferCloudFlowModel *)self->_model postdata];
      v8 = [(TSBuddyMLViewController *)v20 initWithCTPlan:v24 websheetURL:v25 postdata:v26];

      [(TSTransferCloudFlow *)self _updateSourceProxCardState:0];
      goto LABEL_24;
    }
    if (self->_proximitySetupState != 1)
    {
      v8 = 0;
      goto LABEL_24;
    }
    v9 = [(TSTransferCloudFlow *)self _createIntroViewController:0];
  }
  else
  {
    v9 = [[TSMultiPlanIntermediateViewController alloc] initWithTransferItems:v3 showOtherOptions:0];
  }
  v8 = (TSNoPlanForTransferViewController *)v9;
LABEL_24:
  [(TSNoPlanForTransferViewController *)v8 setDelegate:self];
  v28 = _TSLogDomain();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = (const char *)objc_opt_class();
    __int16 v33 = 2080;
    v34 = "-[TSTransferCloudFlow firstViewController]";
    _os_log_impl(&dword_227A17000, v28, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", buf, 0x16u);
  }

  [(TSSIMSetupFlow *)self setTopViewController:v8];
LABEL_27:

  return v8;
}

- (void)firstViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v4 = (void (**)(id, void))a3;
  if (v4)
  {
    if (+[TSUtilities isPad] && (_os_feature_enabled_impl() & 1) == 0)
    {
      v9 = _TSLogDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[TSTransferCloudFlow firstViewController:]";
        _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "Skip transfer cloud flow on iPad @%s", buf, 0xCu);
      }

      v4[2](v4, 0);
    }
    else
    {
      v5 = +[TSCellularPlanManagerCache sharedInstance];
      uint64_t v6 = [v5 planItems];

      if ([v6 count])
      {
        uint64_t v7 = _TSLogDomain();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v15 = (const char *)[v6 count];
          __int16 v16 = 2080;
          v17 = "-[TSTransferCloudFlow firstViewController:]";
          _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Skip transfer cloud flow when user profiles: %zd @%s", buf, 0x16u);
        }

        v4[2](v4, 0);
      }
      else if (_os_feature_enabled_impl())
      {
        model = self->_model;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __43__TSTransferCloudFlow_firstViewController___block_invoke;
        v12[3] = &unk_264828730;
        v12[4] = self;
        v13 = v4;
        [(TSTransferCloudFlowModel *)model arePlansAvailable:v12];
      }
      else
      {
        v10 = _TSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "-[TSTransferCloudFlow firstViewController:]";
          _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/MagnoliaOverCloudInBuddy is disabled @%s", buf, 0xCu);
        }

        objc_super v11 = [(TSTransferCloudFlow *)self firstViewController];
        ((void (**)(id, void *))v4)[2](v4, v11);
      }
    }
  }
}

void __43__TSTransferCloudFlow_firstViewController___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) firstViewController];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_createIntroViewController:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = _os_feature_enabled_impl();
  if (+[TSUtilities isPad]) {
    uint64_t v4 = _os_feature_enabled_impl();
  }
  v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "disabled";
    if (v4) {
      uint64_t v6 = "enabled";
    }
    int v9 = 136315394;
    v10 = v6;
    __int16 v11 = 2080;
    v12 = "-[TSTransferCloudFlow _createIntroViewController:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/MagnoliaOverProximity or iPadESIMProvisioningParity is %s @%s", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v4 requireDelayBluetoothConnection:v3];
  return v7;
}

- (void)startOverWithFirstViewController:(id)a3
{
  id v4 = a3;
  v5 = [(TSSIMSetupFlow *)self navigationController];
  uint64_t v6 = [v5 topViewController];
  uint64_t v7 = [(TSSIMSetupFlow *)self navigationController];
  BOOL v8 = +[TSFlowHelper handleStartOverAgainstNoPlan:v6 navigationController:v7 completion:v4];

  if (!v8)
  {
    int v9 = +[TSCellularPlanManagerCache sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke;
    v10[3] = &unk_264828730;
    v10[4] = self;
    id v11 = v4;
    [v9 hasInstallingPlanOrUserPlan:v10];
  }
}

void __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke_2;
    v4[3] = &unk_264827F70;
    BOOL v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [v3 firstViewController:v4];
  }
}

uint64_t __56__TSTransferCloudFlow_startOverWithFirstViewController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)nextViewControllerFrom:(id)a3
{
  v42[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![v5 isOtherButtonTapped])
    {
      uint64_t v6 = [TSSubFlowViewController alloc];
      v41[0] = @"FlowTypeKey";
      v41[1] = @"SkipActivatingPane";
      v42[0] = &unk_26DC14428;
      v42[1] = MEMORY[0x263EFFA88];
      v41[2] = @"DelayStartActivatingTimer";
      int v7 = [v5 installingTransferPlan];
      BOOL v8 = &unk_26DC14458;
      if (v7) {
        BOOL v8 = &unk_26DC14440;
      }
      v42[2] = v8;
      v41[3] = @"PlanSetupTypeKey";
      int v9 = [v5 installingTransferPlan];
      v10 = &unk_26DC14488;
      if (v9) {
        v10 = &unk_26DC14470;
      }
      v42[3] = v10;
      id v11 = NSDictionary;
      v12 = v42;
      uint64_t v13 = v41;
LABEL_22:
      v24 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:4];
      v25 = [(TSSIMSetupFlow *)self navigationController];
      __int16 v16 = [(TSSubFlowViewController *)v6 initWithOptions:v24 navigationController:v25];

LABEL_23:
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isTransferListCellTapped])
    {
      v14 = [TSTransferListViewController alloc];
      v15 = [(TSTransferCloudFlowModel *)self->_model transferItems];
      __int16 v16 = [(TSTransferListViewController *)v14 initWithTransferItems:v15 confirmCellularPlanTransfer:1 isActivationPolicyMismatch:[(TSTransferCloudFlowModel *)self->_model isActivationPolicyMismatch] isDualeSIMCapabilityLoss:[(TSTransferCloudFlowModel *)self->_model isDualeSIMCapablityLoss] showOtherOptions:1];

      goto LABEL_25;
    }
LABEL_36:
    __int16 v16 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![v5 isOtherButtonTapped])
    {
      uint64_t v6 = [TSSubFlowViewController alloc];
      v39[0] = @"FlowTypeKey";
      v39[1] = @"SkipActivatingPane";
      v40[0] = &unk_26DC14428;
      v40[1] = MEMORY[0x263EFFA88];
      v39[2] = @"DelayStartActivatingTimer";
      int v20 = [v5 installingTransferPlan];
      v21 = &unk_26DC14458;
      if (v20) {
        v21 = &unk_26DC14440;
      }
      v40[2] = v21;
      v39[3] = @"PlanSetupTypeKey";
      int v22 = [v5 installingTransferPlan];
      v23 = &unk_26DC14488;
      if (v22) {
        v23 = &unk_26DC14470;
      }
      v40[3] = v23;
      id v11 = NSDictionary;
      v12 = v40;
      uint64_t v13 = v39;
      goto LABEL_22;
    }
LABEL_13:
    -[TSTransferCloudFlow _createIntroViewController:](self, "_createIntroViewController:", [v5 requireDelayBluetoothConnection]);
    __int16 v16 = (TSCellularPlanIntroViewController *)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [TSSubFlowViewController alloc];
    v37[0] = @"FlowTypeKey";
    v37[1] = @"SkipActivatingPane";
    v38[0] = &unk_26DC14428;
    v38[1] = MEMORY[0x263EFFA80];
    v37[2] = @"PlanSetupTypeKey";
    v38[2] = &unk_26DC144A0;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    v19 = [(TSSIMSetupFlow *)self navigationController];
    __int16 v16 = [(TSSubFlowViewController *)v17 initWithOptions:v18 navigationController:v19];

    if (!self->_isSourceProxCardVisible) {
      [(TSTransferCloudFlow *)self _updateSourceProxCardState:1];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 isProximityTransferButtonTapped])
      {
        v27 = [TSSubFlowViewController alloc];
        v35[0] = @"FlowTypeKey";
        v24 = [NSNumber numberWithUnsignedInteger:10002];
        v35[1] = @"IsClientKey";
        v36[0] = v24;
        v36[1] = MEMORY[0x263EFFA80];
        v28 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
        v29 = [(TSSIMSetupFlow *)self navigationController];
        __int16 v16 = [(TSSubFlowViewController *)v27 initWithOptions:v28 navigationController:v29];
      }
      else
      {
        if (![v5 isScanButtonTapped])
        {
          __int16 v16 = 0;
          goto LABEL_24;
        }
        v32 = [TSSubFlowViewController alloc];
        v33[0] = @"FlowTypeKey";
        v33[1] = @"IsFirstViewKey";
        v34[0] = &unk_26DC144B8;
        v34[1] = MEMORY[0x263EFFA80];
        v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
        v28 = [(TSSIMSetupFlow *)self navigationController];
        __int16 v16 = [(TSSubFlowViewController *)v32 initWithOptions:v24 navigationController:v28];
      }

      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_36;
    }
    id v30 = v4;
    if ([v30 isOfferFallbackFlow])
    {
      [v30 setIsOfferFallbackFlow:0];
      uint64_t v31 = _os_feature_enabled_impl();
      if (+[TSUtilities isPad]) {
        uint64_t v31 = _os_feature_enabled_impl();
      }
      __int16 v16 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v31 requireDelayBluetoothConnection:0];
    }
    else
    {
      __int16 v16 = 0;
    }
  }
LABEL_25:

  return v16;
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v8 = a3;
  id v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  uint64_t v6 = [v8 navigationItem];
  int v7 = v6;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [v6 setRightBarButtonItem:self->_cancelButton];
  }
  else
  {
    [v6 setHidesBackButton:1 animated:0];

    int v7 = [v8 navigationItem];
    [v7 setLeftBarButtonItem:self->_cancelButton];
  }
}

- (void)userDidTapCancel
{
  BOOL v3 = [(TSSIMSetupFlow *)self topViewController];
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
  uint64_t v6 = +[TSCoreTelephonyClientCache sharedInstance];
  id v7 = objc_alloc(MEMORY[0x263F02CE0]);
  id v8 = [(TSTransferCloudFlowModel *)self->_model transferItems];
  unint64_t v9 = +[TSUtilities transferablePlans:v8];
  v10 = [(TSTransferCloudFlowModel *)self->_model transferItems];
  id v11 = objc_msgSend(v7, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, v9, 0, 0, 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", v10));
  [v6 submitSimSetupUsage:v11];

LABEL_5:
  if (!self->_isSourceProxCardVisible) {
    [(TSTransferCloudFlow *)self _updateSourceProxCardState:1];
  }
  v12.receiver = self;
  v12.super_class = (Class)TSTransferCloudFlow;
  [(TSSIMSetupFlow *)&v12 userDidTapCancel];
}

- (void)_updateSourceProxCardState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TSSIMSetupFlow *)self delegate];
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
      id v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "-[TSTransferCloudFlow _updateSourceProxCardState:]";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "%@ prox card on source device @%s", (uint8_t *)&v10, 0x16u);
    }

    self->_isSourceProxCardVisible = v3;
    unint64_t v9 = [(TSSIMSetupFlow *)self delegate];
    [v9 updateSourceProxCardState:v3];
  }
}

- (TSTransferCloudFlowModel)model
{
  return (TSTransferCloudFlowModel *)objc_getProperty(self, a2, 112, 1);
}

- (void)setModel:(id)a3
{
}

- (BOOL)isSourceProxCardVisible
{
  return self->_isSourceProxCardVisible;
}

- (void)setIsSourceProxCardVisible:(BOOL)a3
{
  self->_isSourceProxCardVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end