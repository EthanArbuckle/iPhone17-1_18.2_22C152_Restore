@interface TSActivationFlowWithSimSetupFlow
- (BOOL)_showPendingInstallItems;
- (BOOL)isPreinstallingViewControllerActive;
- (BOOL)requireSetup;
- (NSString)transferBackPlanPhoneNumber;
- (id)_createFirstViewController:(id)a3;
- (id)firstViewController;
- (id)initRequireSetup:(BOOL)a3 transferBackPlan:(id)a4;
- (id)nextViewControllerFrom:(id)a3;
- (id)transferBackPlan;
- (int64_t)signupUserConsentResponse;
- (void)_filterCarrierSetupItems:(id)a3;
- (void)_maybeShowPreinstallConsentOnViewController:(id)a3 planItems:(id)a4;
- (void)_requestCarrierSetupsWithCompletion:(id)a3;
- (void)_requestCrossPlatformTransferPlanListWithCompletion:(id)a3;
- (void)_requestPendingInstallItemsWithCompletion:(id)a3;
- (void)_requestPlansWithCompletion:(id)a3;
- (void)_requestTransferPlanListWithCompletion:(id)a3;
- (void)_sendSIMSetupReadyNotification;
- (void)_userDidTapCancel;
- (void)accountCancelled;
- (void)accountPendingRelease;
- (void)dealloc;
- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8;
- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9;
- (void)firstViewController;
- (void)firstViewController:(id)a3;
- (void)getWebsheetInfo:(id)a3 completion:(id)a4;
- (void)planItemsUpdated:(id)a3 planListError:(id)a4;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setIsPreinstallingViewControllerActive:(BOOL)a3;
- (void)setRequireSetup:(BOOL)a3;
- (void)setTransferBackPlan:(id)a3;
- (void)setTransferBackPlanPhoneNumber:(id)a3;
- (void)startOverWithFirstViewController:(id)a3;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSActivationFlowWithSimSetupFlow

- (id)initRequireSetup:(BOOL)a3 transferBackPlan:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TSActivationFlowWithSimSetupFlow;
  v8 = [(TSSIMSetupFlow *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v8 action:sel__userDidTapCancel];
    cancelButton = v8->_cancelButton;
    v8->_cancelButton = (UIBarButtonItem *)v9;

    v8->_requireSetup = a3;
    v8->_isPreinstallingViewControllerActive = 1;
    v8->_userConsentType = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    transferItems = v8->_transferItems;
    v8->_transferItems = v11;

    v8->_signupConsentResponse = 0;
    objc_storeStrong(&v8->_transferBackPlan, a4);
    uint64_t v13 = [v7 phoneNumber];
    transferBackPlanPhoneNumber = v8->_transferBackPlanPhoneNumber;
    v8->_transferBackPlanPhoneNumber = (NSString *)v13;

    id v15 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v16 = [v15 initWithQueue:MEMORY[0x263EF83A0]];
    client = v8->_client;
    v8->_client = (CoreTelephonyClient *)v16;

    v18 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v18 assertUserInPurchaseFlowStartOver:0 caller:v8];

    v19 = +[TSCellularPlanManagerCache sharedInstance];
    [v19 setDelegate:v8];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4 = +[TSCellularPlanManagerCache sharedInstance];
  [v4 resetDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)TSActivationFlowWithSimSetupFlow;
  [(TSActivationFlowWithSimSetupFlow *)&v5 dealloc];
}

- (id)firstViewController
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(TSActivationFlowWithSimSetupFlow *)v2 firstViewController];
  }

  return 0;
}

- (void)_sendSIMSetupReadyNotification
{
  if (objc_opt_respondsToSelector())
  {
    client = self->_client;
    [(CoreTelephonyClient *)client performSelector:sel_setUpeSIMLaunched_ withObject:&__block_literal_global_7];
  }
}

void __66__TSActivationFlowWithSimSetupFlow__sendSIMSetupReadyNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__TSActivationFlowWithSimSetupFlow__sendSIMSetupReadyNotification__block_invoke_cold_1();
    }
  }
}

- (void)firstViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke;
    v10[3] = &unk_264828300;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    uint64_t v5 = (void *)MEMORY[0x22A683B20](v10);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2;
    v7[3] = &unk_264827F98;
    objc_copyWeak(&v9, &location);
    id v6 = v5;
    id v8 = v6;
    [(TSActivationFlowWithSimSetupFlow *)self _requestPlansWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(TSActivationFlowWithSimSetupFlow *)self _sendSIMSetupReadyNotification];
  }
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _sendSIMSetupReadyNotification];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _filterCarrierSetupItems:WeakRetained[16]];
    id v5 = +[TSCellularPlanManagerCache sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_34;
    v14[3] = &unk_2648282B0;
    objc_copyWeak(&v16, v2);
    id v15 = *(id *)(a1 + 32);
    [v5 planItemsWithCompletion:v14];

    objc_destroyWeak(&v16);
  }
  else
  {
    id v6 = _TSLogDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained _createFirstViewController:v3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_34_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  v91[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[TSUtilities isRegulatoryRestrictionActive:self->_planInstallError])
  {
    self->_isPreinstallingViewControllerActive = 0;
    id v5 = [TSSubFlowViewController alloc];
    v90[0] = @"FlowTypeKey";
    v90[1] = @"SkipActivatingPane";
    v91[0] = &unk_26DC142A8;
    v91[1] = MEMORY[0x263EFFA88];
    id v6 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
    uint64_t v7 = [(TSSIMSetupFlow *)self navigationController];
    uint64_t v8 = [(TSSubFlowViewController *)v5 initWithOptions:v6 navigationController:v7];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__TSActivationFlowWithSimSetupFlow_nextViewControllerFrom___block_invoke;
    block[3] = &unk_2648279D0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    goto LABEL_63;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    if (![v9 isOtherButtonTapped])
    {
      if ([v9 crossPlatformTransferPlanSelected])
      {
        uint64_t v10 = _TSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v89 = "-[TSActivationFlowWithSimSetupFlow nextViewControllerFrom:]";
          _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "Cross platform transfer plan is selected! @%s", buf, 0xCu);
        }

        goto LABEL_9;
      }
      self->_isPreinstallingViewControllerActive = 0;
      if ([v9 showSIMSetup]) {
        self->_requireSetup = 1;
      }
      v19 = [TSSubFlowViewController alloc];
      v86[0] = @"FlowTypeKey";
      v86[1] = @"SkipActivatingPane";
      uint64_t v20 = MEMORY[0x263EFFA88];
      v87[0] = &unk_26DC142A8;
      v87[1] = MEMORY[0x263EFFA88];
      v86[2] = @"DelayStartActivatingTimer";
      int v21 = [v9 installingTransferPlan];
      v22 = &unk_26DC142D8;
      if (v21) {
        v22 = &unk_26DC142C0;
      }
      v87[2] = v22;
      v86[3] = @"TransferBackPlan";
      id transferBackPlan = self->_transferBackPlan;
      v24 = transferBackPlan;
      if (!transferBackPlan)
      {
        v24 = [MEMORY[0x263EFF9D0] null];
      }
      v87[3] = v24;
      v86[4] = @"PlanSetupTypeKey";
      int v25 = [v9 installingTransferPlan];
      v26 = &unk_26DC14308;
      if (v25) {
        v26 = &unk_26DC142F0;
      }
      v87[4] = v26;
      v86[5] = @"CarrierNameKey";
      v27 = [v9 carrierNameForSelectedItem];
      if (v27) {
        [v9 carrierNameForSelectedItem];
      }
      else {
      v43 = [MEMORY[0x263EFF9D0] null];
      }
      v86[6] = @"MaybeShowConfirmationCodePaneKey";
      v87[5] = v43;
      v87[6] = v20;
      v44 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:7];
      v45 = [(TSSIMSetupFlow *)self navigationController];
      uint64_t v8 = [(TSSubFlowViewController *)v19 initWithOptions:v44 navigationController:v45];

      if (transferBackPlan) {
        goto LABEL_62;
      }
LABEL_61:

      goto LABEL_62;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    if ([v9 isOtherButtonTapped])
    {
LABEL_12:
      BOOL v11 = +[TSUtilities transferOptions];
      if (!+[TSUtilities isPad] || v11) {
        uint64_t v12 = -[TSCellularPlanIntroViewController initWithShowTransferOption:requireDelayBluetoothConnection:]([TSCellularPlanIntroViewController alloc], "initWithShowTransferOption:requireDelayBluetoothConnection:", v11, [v9 requireDelayBluetoothConnection]);
      }
      else {
        uint64_t v12 = [[TSCellularPlanScanViewController alloc] initWithBackButton:0];
      }
      goto LABEL_19;
    }
    if ([v9 isCarrierSetupItemSelected])
    {
      v28 = [TSBuddyMLViewController alloc];
      v18 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
      v29 = [v18 objectAtIndexedSubscript:0];
      v30 = [v29 plan];
      uint64_t v8 = [(TSBuddyMLViewController *)v28 initWithCTPlan:v30 inBuddy:0];

      goto LABEL_32;
    }
    self->_isPreinstallingViewControllerActive = 0;
    if ([v9 showSIMSetup]) {
      self->_requireSetup = 1;
    }
    v32 = [TSSubFlowViewController alloc];
    v84[0] = @"FlowTypeKey";
    v84[1] = @"SkipActivatingPane";
    uint64_t v33 = MEMORY[0x263EFFA88];
    v85[0] = &unk_26DC142A8;
    v85[1] = MEMORY[0x263EFFA88];
    v84[2] = @"DelayStartActivatingTimer";
    int v34 = [v9 installingTransferPlan];
    v35 = &unk_26DC142D8;
    if (v34) {
      v35 = &unk_26DC142C0;
    }
    v85[2] = v35;
    v84[3] = @"PlanSetupTypeKey";
    int v36 = [v9 installingTransferPlan];
    v37 = &unk_26DC14308;
    if (v36) {
      v37 = &unk_26DC142F0;
    }
    v85[3] = v37;
    v84[4] = @"CarrierNameKey";
    v24 = [v9 carrierNameForSelectedItem];
    if (v24) {
      [v9 carrierNameForSelectedItem];
    }
    else {
    v40 = [MEMORY[0x263EFF9D0] null];
    }
    v84[5] = @"MaybeShowConfirmationCodePaneKey";
    v85[4] = v40;
    v85[5] = v33;
    v46 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:6];
    v47 = [(TSSIMSetupFlow *)self navigationController];
    uint64_t v8 = [(TSSubFlowViewController *)v32 initWithOptions:v46 navigationController:v47];

LABEL_60:
    goto LABEL_61;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [TSSubFlowViewController alloc];
    v82[0] = @"FlowTypeKey";
    v82[1] = @"SkipActivatingPane";
    v83[0] = &unk_26DC142A8;
    v83[1] = MEMORY[0x263EFFA80];
    uint64_t v14 = NSDictionary;
    id v15 = v83;
    id v16 = v82;
    uint64_t v17 = 2;
LABEL_17:
    id v9 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    v18 = [(TSSIMSetupFlow *)self navigationController];
    uint64_t v8 = [(TSSubFlowViewController *)v13 initWithOptions:v9 navigationController:v18];
LABEL_32:

    goto LABEL_62;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    if ([v9 confirmationCodeRequired])
    {
      v31 = [TSCellularPlanConfirmationCodeViewController alloc];
      v24 = [v9 fauxCardData];
      uint64_t v8 = [(TSCellularPlanConfirmationCodeViewController *)v31 initWithCardData:v24];
      goto LABEL_61;
    }
    if (self->_confirmationCodeRequired)
    {
      uint64_t v8 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_name];
      self->_confirmationCodeRequired = 0;
      goto LABEL_62;
    }
    if ([v9 manualCardInfoEntry])
    {
      uint64_t v12 = objc_alloc_init(TSCellularPlanCardInfoViewController);
      goto LABEL_19;
    }
    if (([v9 transferViaQRCode] & 1) == 0)
    {
      uint64_t v12 = [[TSCellularPlanUserConsentViewController alloc] initWithName:self->_name consentType:4 requireAdditionalConsent:self->_userConsentType != 0];
      goto LABEL_19;
    }
LABEL_9:
    uint64_t v8 = 0;
LABEL_62:

    goto LABEL_63;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    if ([v9 isProximityTransferButtonTapped])
    {
      v38 = [TSSubFlowViewController alloc];
      v80[0] = @"FlowTypeKey";
      v24 = [NSNumber numberWithUnsignedInteger:10002];
      v81[0] = v24;
      v81[1] = MEMORY[0x263EFFA80];
      v80[1] = @"IsClientKey";
      v80[2] = @"TransferBackPlan";
      id v39 = self->_transferBackPlan;
      v40 = v39;
      if (!v39)
      {
        v40 = [MEMORY[0x263EFF9D0] null];
      }
      v81[2] = v40;
      v41 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:3];
      v42 = [(TSSIMSetupFlow *)self navigationController];
      uint64_t v8 = [(TSSubFlowViewController *)v38 initWithOptions:v41 navigationController:v42];

      if (v39) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    if ([v9 isScanButtonTapped])
    {
      v49 = [TSSubFlowViewController alloc];
      v78[0] = @"FlowTypeKey";
      v78[1] = @"IsFirstViewKey";
      v79[0] = &unk_26DC14320;
      v79[1] = MEMORY[0x263EFFA80];
      v24 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
      v40 = [(TSSIMSetupFlow *)self navigationController];
      uint64_t v8 = [(TSSubFlowViewController *)v49 initWithOptions:v24 navigationController:v40];
      goto LABEL_60;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_confirmationCodeRequired)
    {
      uint64_t v8 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_name];
      self->_confirmationCodeRequired = 0;
      goto LABEL_63;
    }
    v50 = [TSCellularPlanUserConsentViewController alloc];
    name = self->_name;
    BOOL v53 = self->_userConsentType != 0;
    unint64_t userConsentType = 4;
LABEL_77:
    uint64_t v54 = [(TSCellularPlanUserConsentViewController *)v50 initWithName:name consentType:userConsentType requireAdditionalConsent:v53];
LABEL_78:
    uint64_t v8 = (TSSubFlowViewController *)v54;
    goto LABEL_63;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v4 confirmationCode];
    uint64_t v12 = [[TSCellularPlanUserConsentViewController alloc] initWithConfirmationCode:self->_name consentType:4 requireAdditionalConsent:self->_userConsentType != 0 confirmationCode:v9 acceptButtonTapped:0];
LABEL_19:
    uint64_t v8 = (TSSubFlowViewController *)v12;
    goto LABEL_62;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 consentType] != 4 || (self->_userConsentType & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      uint64_t v13 = [TSSubFlowViewController alloc];
      v76[0] = @"FlowTypeKey";
      v76[1] = @"SkipActivatingPane";
      v77[0] = &unk_26DC142A8;
      v77[1] = MEMORY[0x263EFFA88];
      v76[2] = @"PlanSetupTypeKey";
      v77[2] = &unk_26DC14338;
      uint64_t v14 = NSDictionary;
      id v15 = v77;
      id v16 = v76;
      uint64_t v17 = 3;
      goto LABEL_17;
    }
    v50 = [TSCellularPlanUserConsentViewController alloc];
    name = self->_name;
    unint64_t userConsentType = self->_userConsentType;
    BOOL v53 = 0;
    goto LABEL_77;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v55 = v4;
    if ([v55 subFlowType] != 16 && objc_msgSend(v55, "subFlowType") != 22) {
      goto LABEL_100;
    }
    if ([v55 isOfferFallbackFlow])
    {
      [v55 setIsOfferFallbackFlow:0];
      uint64_t v56 = 0;
      if (_os_feature_enabled_impl()) {
        uint64_t v56 = +[TSUtilities isPad] ^ 1;
      }
      v57 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v56 requireDelayBluetoothConnection:0];
      goto LABEL_110;
    }
    if (+[TSUtilities isPad])
    {
LABEL_100:
      uint64_t v8 = 0;
LABEL_111:

      goto LABEL_63;
    }
    v57 = [[TSCellularPlanLabelsViewController alloc] initWithAllowDismiss:1];
LABEL_110:
    uint64_t v8 = (TSSubFlowViewController *)v57;
    goto LABEL_111;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v61 = [v4 usesType];
      if (v61 == 2)
      {
        v66 = +[TSCellularPlanManagerCache sharedInstance];
        v67 = [v66 getDanglingPlanItems];
        uint64_t v68 = [v67 count];

        v58 = [TSCellularPlanUsesViewController alloc];
        uint64_t v59 = 1;
        if (!v68)
        {
          uint64_t v60 = 1;
          goto LABEL_93;
        }
LABEL_92:
        uint64_t v60 = 0;
LABEL_93:
        uint64_t v54 = [(TSCellularPlanUsesViewController *)v58 initWithType:v59 withDoneButton:v60];
        goto LABEL_78;
      }
      if (v61 != 1)
      {
        if (!v61)
        {
          v58 = [TSCellularPlanUsesViewController alloc];
          uint64_t v59 = 2;
          goto LABEL_92;
        }
        goto LABEL_112;
      }
      v69 = (void *)MEMORY[0x263EFF980];
      v70 = +[TSCellularPlanManagerCache sharedInstance];
      v71 = [v70 getDanglingPlanItems];
      v72 = [v69 arrayWithArray:v71];
      danglingPlanItems = self->_danglingPlanItems;
      self->_danglingPlanItems = v72;

      if (![(NSMutableArray *)self->_danglingPlanItems count]) {
        goto LABEL_112;
      }
      v74 = [TSCellularPlanRemapViewController alloc];
      BOOL v63 = (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] > 1;
      id v55 = [(NSMutableArray *)self->_danglingPlanItems objectAtIndex:0];
      v64 = v74;
      uint64_t v65 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] < 2)
      {
        goto LABEL_112;
      }
      [(NSMutableArray *)self->_danglingPlanItems removeObjectAtIndex:0];
      v62 = [TSCellularPlanRemapViewController alloc];
      BOOL v63 = (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] > 1;
      id v55 = [(NSMutableArray *)self->_danglingPlanItems objectAtIndex:0];
      v64 = v62;
      uint64_t v65 = 0;
    }
    v57 = [(TSCellularPlanRemapViewController *)v64 initWithBackButton:v65 continueButton:v63 danglingPlanItem:v55];
    goto LABEL_110;
  }
  if ([v4 requireSetup])
  {
    v58 = [TSCellularPlanUsesViewController alloc];
    uint64_t v59 = 0;
    goto LABEL_92;
  }
LABEL_112:
  uint64_t v8 = 0;
LABEL_63:

  return v8;
}

void __59__TSActivationFlowWithSimSetupFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"transfer.failed" object:*(void *)(*(void *)(a1 + 32) + 96)];
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
    v14.super_class = (Class)TSActivationFlowWithSimSetupFlow;
    [(TSSIMSetupFlow *)&v14 viewControllerDidComplete:v4];
    goto LABEL_7;
  }
  id v9 = [v5 navigationController];
  uint64_t v10 = [v9 viewControllers];
  BOOL v11 = [v10 objectAtIndex:v8 - 1];

  uint64_t v12 = [v5 navigationController];
  id v13 = (id)[v12 popToViewController:v11 animated:1];

  v15.receiver = self;
  v15.super_class = (Class)TSActivationFlowWithSimSetupFlow;
  [(TSSIMSetupFlow *)&v15 viewControllerDidComplete:v11];

LABEL_7:
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v12 = a3;
  BOOL v4 = +[TSUtilities isPad];
  id v5 = [v12 navigationItem];
  id v6 = v5;
  cancelButton = self->_cancelButton;
  if (v4) {
    [v5 setRightBarButtonItem:cancelButton];
  }
  else {
    [v5 setLeftBarButtonItem:cancelButton];
  }

  uint64_t v8 = [v12 navigationItem];
  [v8 setHidesBackButton:1 animated:0];

  id v9 = [v12 navigationController];
  uint64_t v10 = [v9 navigationBar];
  BOOL v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v10 setBackgroundColor:v11];
}

- (int64_t)signupUserConsentResponse
{
  return self->_signupConsentResponse;
}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  p_planInstallError = &self->_planInstallError;
  if (self->_planInstallError)
  {
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]((uint64_t)p_planInstallError, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_4:

    goto LABEL_45;
  }
  if (v7)
  {
    uint64_t v17 = _TSLogDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]();
    }

    v18 = [v8 domain];
    if ([v18 isEqualToString:*MEMORY[0x263F31920]])
    {
      uint64_t v19 = [v8 code];

      if (v19 == 19)
      {
        self->_confirmationCodeRequired = 1;
        goto LABEL_45;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_planInstallError, a4);
    if (!+[TSUtilities isRegulatoryRestrictionActive:v8])
    {
      v41 = +[TSUtilities getErrorTitleDetail:v8 forCarrier:self->_name];
      v42 = (void *)MEMORY[0x263F82418];
      v43 = [v41 objectForKeyedSubscript:@"ErrorHeader"];
      v44 = [v41 objectForKeyedSubscript:@"ErrorDetail"];
      v45 = [v42 alertControllerWithTitle:v43 message:v44 preferredStyle:1];

      v46 = (void *)MEMORY[0x263F82400];
      v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v48 = [v47 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke;
      v59[3] = &unk_264827F48;
      v59[4] = self;
      v49 = [v46 actionWithTitle:v48 style:1 handler:v59];
      [v45 addAction:v49];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke_2;
      block[3] = &unk_264827A70;
      block[4] = self;
      id v58 = v45;
      id v50 = v45;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_44;
    }
LABEL_42:
    v41 = [(TSSIMSetupFlow *)self topViewController];
    [(TSActivationFlowWithSimSetupFlow *)self viewControllerDidComplete:v41];
LABEL_44:

    goto LABEL_45;
  }
  if (v6)
  {
    if (self->_isPreinstallingViewControllerActive)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v20 = [v6 countByEnumeratingWithState:&v53 objects:v64 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v51 = 208;
        v52 = 0;
        int v22 = 0;
        BOOL v23 = 0;
        uint64_t v24 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v54 != v24) {
              objc_enumerationMutation(v6);
            }
            v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (objc_msgSend(v26, "isInstalling", v51, v52))
            {
              v27 = [v26 plan];
              int v28 = [v27 status];

              if (v28 != 6)
              {
                v29 = [v26 carrierName];
                v30 = (NSString *)[v29 copy];
                name = self->_name;
                self->_name = v30;

                v32 = [v26 iccid];
                BOOL v23 = [v32 length] != 0;

                uint64_t v33 = _TSLogDomain();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  int v34 = self->_name;
                  *(_DWORD *)buf = 138412546;
                  uint64_t v61 = (const char *)v34;
                  __int16 v62 = 2080;
                  BOOL v63 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_227A17000, v33, OS_LOG_TYPE_DEFAULT, "installing [%@] @%s", buf, 0x16u);
                }
              }
            }
            if (([v26 isSelected] & 1) != 0 || objc_msgSend(v26, "isInstalling")) {
              ++v22;
            }
          }
          uint64_t v21 = [v6 countByEnumeratingWithState:&v53 objects:v64 count:16];
        }
        while (v21);
        if (v22 >= 2) {
          self->_requireSetup = 1;
        }
        uint64_t v8 = v52;
        if (v23)
        {
          v35 = +[TSCellularPlanManagerCache sharedInstance];
          uint64_t v36 = [v35 calculateInstallConsentTextTypeFor:v6];

          switch(v36)
          {
            case 0:
            case 3:
            case 4:
            case 5:
              v37 = _TSLogDomain();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v61 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v37, OS_LOG_TYPE_DEFAULT, "Invalid consent @%s", buf, 0xCu);
              }
              unint64_t v38 = 0;
              goto LABEL_35;
            case 1:
              v37 = _TSLogDomain();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v61 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v37, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", buf, 0xCu);
              }
              unint64_t v38 = 3;
              goto LABEL_35;
            case 2:
              v37 = _TSLogDomain();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v61 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v37, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", buf, 0xCu);
              }
              unint64_t v38 = 2;
LABEL_35:

              self->_unint64_t userConsentType = v38;
              break;
            default:
              break;
          }
          if (*((unsigned char *)&self->super.super.isa + v51))
          {
            *((unsigned char *)&self->super.super.isa + v51) = 0;
            id v39 = [(TSSIMSetupFlow *)self topViewController];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              uint64_t v10 = _TSLogDomain();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v61 = "-[TSActivationFlowWithSimSetupFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "Ignore installing event for BuddyML @%s", buf, 0xCu);
              }
              goto LABEL_4;
            }
            goto LABEL_42;
          }
        }
      }
    }
  }
LABEL_45:
}

uint64_t __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userDidTapCancel];
}

void __67__TSActivationFlowWithSimSetupFlow_planItemsUpdated_planListError___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)didPurchasePlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSDMP:(id)a7 state:(id)a8
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  if (v11)
  {
    uint64_t v15 = +[TSCellularPlanManagerCache sharedInstance];
    [v15 didPurchasePlanForEid:v11 iccid:v12 smdpURL:v13 state:v14];
  }
  else
  {
    uint64_t v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(TSActivationFlowWithSimSetupFlow *)v15 didPurchasePlanSuccessfullyWithEid:v17 imei:v18 meid:v19 iccid:v20 alternateSDMP:v21 state:v22];
    }
  }
}

- (void)didTransferPlanSuccessfullyWithEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 srcIccid:(id)a7 alternateSDMP:(id)a8 state:(id)a9
{
  id v13 = a9;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  id v18 = +[TSCellularPlanManagerCache sharedInstance];
  [v18 didTransferPlanForEid:v17 iccid:v16 srcIccid:v15 smdpURL:v14 state:v13];
}

- (void)accountCancelled
{
}

- (void)accountPendingRelease
{
}

- (id)_createFirstViewController:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[TSUtilities transferOptions];
  id transferBackPlan = self->_transferBackPlan;
  uint64_t v7 = [(NSMutableArray *)self->_transferItems count];
  uint64_t v8 = v7;
  if (transferBackPlan)
  {
    if (v7 == 1)
    {
      id v9 = [(NSMutableArray *)self->_transferItems objectAtIndexedSubscript:0];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"planItem"];

      id v11 = [TSSinglePlanTransferViewController alloc];
      id v12 = [(NSMutableArray *)self->_transferItems objectAtIndexedSubscript:0];
      LOBYTE(v39) = 0;
      id v13 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:](v11, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:", v12, [v10 isPhysical], objc_msgSend(v10, "isTransferIneligiblePlan"), 0, 1, 1, v39, self->_transferBackPlanPhoneNumber);
      goto LABEL_4;
    }
    BOOL v23 = [[TSCellularPlanIntroViewController alloc] initWithTransferBackPlan:self->_transferBackPlan];
    goto LABEL_15;
  }
  id v15 = [(CTDisplayPlanList *)self->_pendingInstallPlans plans];
  uint64_t v16 = [v15 count] + v8;
  id v17 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
  if ((unint64_t)(v16 + [v17 count]) >= 2)
  {

    goto LABEL_14;
  }
  id v18 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
  id v40 = v4;
  uint64_t v19 = [v18 count];

  BOOL v20 = v19 == 1;
  id v4 = v40;
  if (v20)
  {
LABEL_14:
    LOBYTE(v39) = 1;
    BOOL v23 = [[TSTransferListViewController alloc] initWithTransferItems:self->_transferItems confirmCellularPlanTransfer:1 isActivationPolicyMismatch:self->_isActivationPolicyMismatch isDualeSIMCapabilityLoss:self->_isDualeSIMCapabilityLoss pendingInstallItems:self->_pendingInstallPlans carrierSetupItems:self->_carrierSetupItems showOtherOptions:v39];
    goto LABEL_15;
  }
  if ([(NSMutableArray *)self->_transferItems count] == 1)
  {
    uint64_t v21 = [(NSMutableArray *)self->_transferItems objectAtIndexedSubscript:0];
    uint64_t v10 = [v21 objectForKeyedSubscript:@"planItem"];

    uint64_t v22 = [(NSMutableArray *)self->_transferItems objectAtIndexedSubscript:0];
    id v12 = [v22 objectForKeyedSubscript:@"deviceInfo"];

    if (![v10 isOnDeviceTransferredPlan])
    {
      if ([v10 isTransferIneligiblePlan])
      {
        v29 = [TSNoPlanForTransferViewController alloc];
        v30 = [v10 carrierName];
        transferBackPlanPhoneNumber = self->_transferBackPlanPhoneNumber;
        v31 = [v10 plan];
        v32 = [v31 transferAttributes];
        uint64_t v33 = [v32 transferCapability];
        int v34 = [v12 deviceName];
        BYTE1(v39) = self->_transferBackPlan != 0;
        LOBYTE(v39) = 0;
        id v14 = -[TSNoPlanForTransferViewController initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](v29, "initWithCarrier:phoneNumber:transferCapability:showOtherOptions:entryPoint:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", v30, transferBackPlanPhoneNumber, v33, 1, 1, v34, v39);
      }
      else
      {
        unint64_t v38 = [TSSinglePlanTransferViewController alloc];
        v30 = [(NSMutableArray *)self->_transferItems objectAtIndexedSubscript:0];
        id v14 = -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:](v38, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:", v30, [v10 isPhysical], objc_msgSend(v10, "isTransferIneligiblePlan"), 0, 1, 1);
      }

      id v4 = v40;
      goto LABEL_5;
    }
    if (!+[TSUtilities isPad] || v5) {
      id v13 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v5 requireDelayBluetoothConnection:0];
    }
    else {
      id v13 = [[TSCellularPlanScanViewController alloc] initWithBackButton:0];
    }
LABEL_4:
    id v14 = (TSNoPlanForTransferViewController *)v13;
LABEL_5:

    goto LABEL_16;
  }
  v26 = [(CTDisplayPlanList *)self->_pendingInstallPlans plans];
  uint64_t v27 = [v26 count];

  if (v27 == 1)
  {
    int v28 = [TSSinglePlanTransferViewController alloc];
    uint64_t v10 = [(CTDisplayPlanList *)self->_pendingInstallPlans plans];
    id v12 = [v10 objectAtIndexedSubscript:0];
    id v13 = [(TSSinglePlanTransferViewController *)v28 initWithPendingInstallPlan:v12];
    goto LABEL_4;
  }
  v35 = [(CTDisplayPlanList *)self->_crossPlatformTransferItems plans];
  uint64_t v36 = [v35 count];

  if (v36 == 1)
  {
    v37 = [TSSinglePlanTransferViewController alloc];
    uint64_t v10 = [(CTDisplayPlanList *)self->_crossPlatformTransferItems plans];
    id v12 = [v10 objectAtIndexedSubscript:0];
    id v13 = [(TSSinglePlanTransferViewController *)v37 initWithCrossPlatformTransferPlan:v12];
    goto LABEL_4;
  }
  if (!+[TSUtilities isPad] || v5) {
    BOOL v23 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v5 requireDelayBluetoothConnection:0];
  }
  else {
    BOOL v23 = [[TSCellularPlanScanViewController alloc] initWithBackButton:0];
  }
LABEL_15:
  id v14 = (TSNoPlanForTransferViewController *)v23;
LABEL_16:
  [(TSSIMSetupFlow *)self setTopViewController:v14];
  [(TSNoPlanForTransferViewController *)v14 setDelegate:self];
  [(TSActivationFlowWithSimSetupFlow *)self _maybeShowPreinstallConsentOnViewController:v14 planItems:v4];

  uint64_t v24 = _TSLogDomain();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v43 = objc_opt_class();
    __int16 v44 = 2080;
    v45 = "-[TSActivationFlowWithSimSetupFlow _createFirstViewController:]";
    _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", buf, 0x16u);
  }

  return v14;
}

- (void)_maybeShowPreinstallConsentOnViewController:(id)a3 planItems:(id)a4
{
  id v6 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke;
  v13[3] = &unk_264828328;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  uint64_t v8 = +[TSUtilities preinstallPPRAlertControllerWithItems:a4 completion:v13];
  if (v8)
  {
    dispatch_time_t v9 = dispatch_time(0, 250000000);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke_2;
    v10[3] = &unk_264827A70;
    id v11 = v7;
    id v12 = v8;
    dispatch_after(v9, MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke(uint64_t result, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      *(void *)(*(void *)(result + 32) + 192) = 0;
      goto LABEL_7;
    case 1:
      return [*(id *)(result + 32) userDidTapCancel];
    case 2:
      uint64_t v2 = *(void *)(result + 32);
      uint64_t v3 = 2;
      goto LABEL_6;
    case 3:
      uint64_t v2 = *(void *)(result + 32);
      uint64_t v3 = 1;
LABEL_6:
      *(void *)(v2 + 192) = v3;
LABEL_7:
      result = [*(id *)(result + 40) didChangeValueForKey:@"userConsentAllowed"];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __90__TSActivationFlowWithSimSetupFlow__maybeShowPreinstallConsentOnViewController_planItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_requestPlansWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    BOOL v5 = (void *)MEMORY[0x22A683B20](v4);
    id v6 = (OS_dispatch_group *)dispatch_group_create();
    queryGroup = self->_queryGroup;
    self->_queryGroup = v6;

    dispatch_group_enter((dispatch_group_t)self->_queryGroup);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke;
    v26[3] = &unk_264827A20;
    objc_copyWeak(&v27, &location);
    [(TSActivationFlowWithSimSetupFlow *)self _requestTransferPlanListWithCompletion:v26];
    objc_destroyWeak(&v27);
    if (!self->_transferBackPlan)
    {
      if (!+[TSUtilities isPad])
      {
        dispatch_group_enter((dispatch_group_t)self->_queryGroup);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_91;
        v24[3] = &unk_264827A20;
        objc_copyWeak(&v25, &location);
        [(TSActivationFlowWithSimSetupFlow *)self _requestCarrierSetupsWithCompletion:v24];
        objc_destroyWeak(&v25);
      }
      if (!self->_transferBackPlan)
      {
        if ([(TSActivationFlowWithSimSetupFlow *)self _showPendingInstallItems])
        {
          dispatch_group_enter((dispatch_group_t)self->_queryGroup);
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_92;
          v22[3] = &unk_264827A20;
          objc_copyWeak(&v23, &location);
          [(TSActivationFlowWithSimSetupFlow *)self _requestPendingInstallItemsWithCompletion:v22];
          objc_destroyWeak(&v23);
        }
        if (!self->_transferBackPlan)
        {
          dispatch_group_enter((dispatch_group_t)self->_queryGroup);
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_93;
          v20[3] = &unk_264827A20;
          objc_copyWeak(&v21, &location);
          [(TSActivationFlowWithSimSetupFlow *)self _requestCrossPlatformTransferPlanListWithCompletion:v20];
          objc_destroyWeak(&v21);
        }
      }
    }
    uint64_t v8 = self->_queryGroup;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_94;
    v18[3] = &unk_264827CF0;
    id v19 = v5;
    id v9 = v5;
    dispatch_group_notify(v8, MEMORY[0x263EF83A0], v18);

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow _requestPlansWithCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    uint64_t v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_91(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    uint64_t v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_92(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    uint64_t v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_93(uint64_t a1)
{
  id WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[25]);
  }
  else
  {
    uint64_t v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

uint64_t __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestTransferPlanListWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (void *)MEMORY[0x22A683B20](v4);
    uint64_t v6 = +[TSCoreTelephonyClientCache sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke;
    v16[3] = &unk_264828378;
    id v7 = v5;
    id v17 = v7;
    objc_copyWeak(&v18, &location);
    v16[4] = self;
    [v6 bootstrapPlanTransferUsingMessageSession:0 completion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = +[TSCoreTelephonyClientCache sharedInstance];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_96;
    v7[3] = &unk_264828350;
    objc_copyWeak(&v9, (id *)(a1 + 48));
    id v6 = *(id *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v5 transferPlanListWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_96(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  uint64_t v41 = a1;
  id v8 = (id *)(a1 + 48);
  id v9 = v7;
  id WeakRetained = (id *)objc_loadWeakRetained(v8);
  uint64_t v11 = WeakRetained;
  if (!v9)
  {
    if (!v6)
    {
      uint64_t v12 = _TSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)uint64_t v51 = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
        _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "empty transfer plans @%s", buf, 0xCu);
      }
      goto LABEL_4;
    }
    if (!WeakRetained) {
      goto LABEL_5;
    }
    [*(id *)(*(void *)(v41 + 32) + 112) removeAllObjects];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v35 = v6;
    id obj = [v6 devices];
    uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (!v39)
    {
      BOOL v36 = 0;
LABEL_39:

      if (!+[TSUtilities isPad] && v36)
      {
        v30 = +[TSCoreTelephonyClientCache sharedInstance];
        char v31 = [v30 deviceSupportsHydra];

        if ((v31 & 1) == 0) {
          *(unsigned char *)(*(void *)(v41 + 32) + 91) = 1;
        }
      }
      uint64_t v12 = _TSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(v41 + 32);
        int v33 = *(unsigned __int8 *)(v32 + 90);
        uint64_t v34 = *(void *)(v32 + 112);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v51 = v33;
        *(_WORD *)&v51[4] = 2112;
        *(void *)&v51[6] = v34;
        *(_WORD *)&v51[14] = 2080;
        *(void *)&v51[16] = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
        _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "isActivationPolicyMismatch: %d, transfer plans: %@ @%s", buf, 0x1Cu);
      }
      id v9 = 0;
      id v6 = v35;
      goto LABEL_4;
    }
    BOOL v36 = 0;
    uint64_t v38 = *(void *)v47;
LABEL_10:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v47 != v38) {
        objc_enumerationMutation(obj);
      }
      uint64_t v40 = v13;
      uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
      if (objc_opt_respondsToSelector())
      {
        BOOL v36 = [v14 performSelector:sel_isMultiESimEnabled] != 0;
        uint64_t v15 = _TSLogDomain();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [v14 deviceName];
          *(_DWORD *)buf = 138412546;
          *(void *)uint64_t v51 = v16;
          *(_WORD *)&v51[8] = 2080;
          *(void *)&v51[10] = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
          _os_log_impl(&dword_227A17000, v15, OS_LOG_TYPE_DEFAULT, "remote device:%@ use dual eSIM config @%s", buf, 0x16u);
        }
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v17 = [v14 remoteDisplayPlans];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v18) {
        break;
      }
LABEL_33:

      uint64_t v13 = v40 + 1;
      if (v40 + 1 == v39)
      {
        uint64_t v39 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (!v39) {
          goto LABEL_39;
        }
        goto LABEL_10;
      }
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v43;
LABEL_19:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v43 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * v21);
      id v23 = [v11 transferBackPlan];

      if (!v23) {
        goto LABEL_28;
      }
      if ([v22 isTransferablePlan])
      {
        uint64_t v24 = [v11 transferBackPlanPhoneNumber];
        id v25 = [v22 phoneNumber];
        int v26 = [v24 isEqualToPhoneNumber:v25];

        if (v26) {
          break;
        }
      }
LABEL_31:
      if (v19 == ++v21)
      {
        uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (!v19) {
          goto LABEL_33;
        }
        goto LABEL_19;
      }
    }
    id v27 = _TSLogDomain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = [v11 transferBackPlanPhoneNumber];
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v51 = v28;
      *(_WORD *)&v51[8] = 2080;
      *(void *)&v51[10] = "-[TSActivationFlowWithSimSetupFlow _requestTransferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v27, OS_LOG_TYPE_DEFAULT, "find plan with same phone number : %@ @%s", buf, 0x16u);
    }
LABEL_28:
    v52[0] = @"planItem";
    v52[1] = @"deviceInfo";
    v53[0] = v22;
    v53[1] = v14;
    v29 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    [v11[14] addObject:v29];
    if ([v22 isNotEligibleActivationPolicyMismatchPlan]) {
      *(unsigned char *)(*(void *)(v41 + 32) + 90) = 1;
    }

    goto LABEL_31;
  }
  uint64_t v12 = _TSLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_96_cold_1();
  }
LABEL_4:

LABEL_5:
  (*(void (**)(void))(*(void *)(v41 + 40) + 16))();
}

- (void)_requestCrossPlatformTransferPlanListWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (void *)MEMORY[0x22A683B20](v4);
    id v6 = +[TSCoreTelephonyClientCache sharedInstance];
    id v7 = [v6 getCoreTelephonyClient];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke;
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
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow _requestCrossPlatformTransferPlanListWithCompletion:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
        __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2();
      }
    }
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v5;
      __int16 v21 = 2080;
      uint64_t v22 = "-[TSActivationFlowWithSimSetupFlow _requestCrossPlatformTransferPlanListWithCompletion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "Cross platform transfer items %@ @%s", (uint8_t *)&v19, 0x16u);
    }

    id v10 = v5;
    uint64_t v11 = WeakRetained[17];
    WeakRetained[17] = v10;
  }
  else
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestPendingInstallItemsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x22A683B20](v4);
    id v6 = +[TSCoreTelephonyClientCache sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__TSActivationFlowWithSimSetupFlow__requestPendingInstallItemsWithCompletion___block_invoke;
    v16[3] = &unk_2648283C8;
    objc_copyWeak(&v18, &location);
    id v7 = v5;
    id v17 = v7;
    [v6 pendingInstallItemsWithCompletion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow _requestPendingInstallItemsWithCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __78__TSActivationFlowWithSimSetupFlow__requestPendingInstallItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 15, a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestCarrierSetupsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x22A683B20](v4);
    id v6 = +[TSCoreTelephonyClientCache sharedInstance];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke;
    v16[3] = &unk_2648283F0;
    objc_copyWeak(&v18, &location);
    id v7 = v5;
    void v16[4] = self;
    id v17 = v7;
    [v6 getCarrierSetupWithCompletion:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TSActivationFlowWithSimSetupFlow _requestCarrierSetupsWithCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = _TSLogDomain();
  id v7 = v6;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2080;
      __int16 v21 = "-[TSActivationFlowWithSimSetupFlow _requestCarrierSetupsWithCompletion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Carrier setup %@ @%s", buf, 0x16u);
    }

    objc_storeStrong(WeakRetained + 16, a2);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_102;
    v16[3] = &unk_264827CF0;
    id v8 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    [v8 getWebsheetInfo:v4 completion:v16];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getWebsheetInfo:(id)a3 completion:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    objc_initWeak(location, self);
    id v8 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    BOOL v9 = (unint64_t)[v8 count] > 1;

    if (v9)
    {
      uint64_t v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[TSActivationFlowWithSimSetupFlow getWebsheetInfo:completion:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    id v18 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    BOOL v19 = [v18 count] == 0;

    if (!v19)
    {
      __int16 v20 = +[TSCoreTelephonyClientCache sharedInstance];
      __int16 v21 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
      uint64_t v22 = [v21 objectAtIndexedSubscript:0];
      uint64_t v23 = [v22 plan];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke;
      v25[3] = &unk_264828418;
      objc_copyWeak(&v27, location);
      int v26 = v7;
      [v20 getWebsheetInfoForPlan:v23 inBuddy:0 completion:v25];

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
      *(id *)((char *)location + 4) = "-[TSActivationFlowWithSimSetupFlow getWebsheetInfo:completion:]";
      _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "No carrier setup items @%s", (uint8_t *)location, 0xCu);
    }

    v7[2](v7);
  }
}

void __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 19, a2);
    objc_storeStrong(v9 + 20, a3);
  }
  else
  {
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_filterCarrierSetupItems:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v7 = +[TSFlowHelper hasTransferablePlanWithSameCarrierName:v5 transferablePlans:self->_transferItems inBuddy:0 matchingSODACarrierWebsheetTransferPlanIndex:v6];
  p_carrierSetupItems = (id *)&self->_carrierSetupItems;
  if (v7)
  {
    id v9 = *p_carrierSetupItems;
    id *p_carrierSetupItems = 0;
  }
  else
  {
    id v19 = v5;
    objc_storeStrong(p_carrierSetupItems, a3);
    id v18 = v6;
    uint64_t v10 = +[TSFlowHelper sortIndexesInDescending:v6];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntegerValue];
          uint64_t v16 = _TSLogDomain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = [(NSMutableArray *)self->_transferItems objectAtIndex:v15];
            *(_DWORD *)buf = 138412546;
            id v25 = v17;
            __int16 v26 = 2080;
            id v27 = "-[TSActivationFlowWithSimSetupFlow _filterCarrierSetupItems:]";
            _os_log_impl(&dword_227A17000, v16, OS_LOG_TYPE_DEFAULT, "Plan %@ will be removed from transfer list @%s", buf, 0x16u);
          }
          [(NSMutableArray *)self->_transferItems removeObjectAtIndex:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v12);
    }

    id v6 = v18;
    id v5 = v19;
  }
}

- (void)_userDidTapCancel
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
  unint64_t v8 = +[TSUtilities transferablePlans:self->_transferItems];
  id v9 = [(CTDisplayPlanList *)self->_pendingInstallPlans plans];
  uint64_t v10 = objc_msgSend(v7, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, v8, 0, objc_msgSend(v9, "count"), 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", self->_transferItems));
  [v6 submitSimSetupUsage:v10];

LABEL_5:
  [(TSSIMSetupFlow *)self userDidTapCancel];
}

- (void)startOverWithFirstViewController:(id)a3
{
  unint64_t v8 = (void (**)(id, void))a3;
  id v4 = [(TSSIMSetupFlow *)self navigationController];
  id v5 = [v4 topViewController];
  id v6 = [(TSSIMSetupFlow *)self navigationController];
  BOOL v7 = +[TSFlowHelper handleStartOverAgainstNoPlan:v5 navigationController:v6 completion:v8];

  if (!v7) {
    v8[2](v8, 0);
  }
}

- (BOOL)_showPendingInstallItems
{
  char v2 = _os_feature_enabled_impl();
  return +[TSUtilities isPad] & v2 ^ 1;
}

- (BOOL)isPreinstallingViewControllerActive
{
  return self->_isPreinstallingViewControllerActive;
}

- (void)setIsPreinstallingViewControllerActive:(BOOL)a3
{
  self->_isPreinstallingViewControllerActive = a3;
}

- (BOOL)requireSetup
{
  return self->_requireSetup;
}

- (void)setRequireSetup:(BOOL)a3
{
  self->_requireSetup = a3;
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setTransferBackPlan:(id)a3
{
}

- (NSString)transferBackPlanPhoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTransferBackPlanPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferBackPlanPhoneNumber, 0);
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_storeStrong((id *)&self->_queryGroup, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierSetupPostData, 0);
  objc_storeStrong((id *)&self->_carrierSetupUrl, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_crossPlatformTransferItems, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallPlans, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

- (void)firstViewController
{
}

void __66__TSActivationFlowWithSimSetupFlow__sendSIMSetupReadyNotification__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]send simsetup ready failed : %@ @%s", v2, v3, v4, v5, v6);
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__TSActivationFlowWithSimSetupFlow_firstViewController___block_invoke_34_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)planItemsUpdated:planListError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]error: %@ @%s", v2, v3, v4, v5, v6);
}

- (void)planItemsUpdated:(uint64_t)a3 planListError:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)didPurchasePlanSuccessfullyWithEid:(uint64_t)a3 imei:(uint64_t)a4 meid:(uint64_t)a5 iccid:(uint64_t)a6 alternateSDMP:(uint64_t)a7 state:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_requestPlansWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__TSActivationFlowWithSimSetupFlow__requestPlansWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_requestTransferPlanListWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]bootstrapPlanTransfer error: %@ @%s", v2, v3, v4, v5, v6);
}

void __75__TSActivationFlowWithSimSetupFlow__requestTransferPlanListWithCompletion___block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]query transfer plan error: %@ @%s", v2, v3, v4, v5, v6);
}

- (void)_requestCrossPlatformTransferPlanListWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __88__TSActivationFlowWithSimSetupFlow__requestCrossPlatformTransferPlanListWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_227A17000, v0, v1, "[E]%@ @%s", v2, v3, v4, v5, v6);
}

- (void)_requestPendingInstallItemsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_requestCarrierSetupsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__TSActivationFlowWithSimSetupFlow__requestCarrierSetupsWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getWebsheetInfo:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__TSActivationFlowWithSimSetupFlow_getWebsheetInfo_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end