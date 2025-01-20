@interface TSQRCodeScanFlow
- (BOOL)confirmationCodeRequired;
- (BOOL)isPreinstallingViewControllerActive;
- (BOOL)withBackButton;
- (NSError)planInstallError;
- (NSString)name;
- (TSQRCodeScanFlow)initWithBackButton:(BOOL)a3;
- (UIBarButtonItem)cancelButton;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (int64_t)signupUserConsentResponse;
- (unint64_t)userConsentType;
- (void)dealloc;
- (void)firstViewController:(id)a3;
- (void)handleError:(id)a3;
- (void)planItemsUpdated:(id)a3 planListError:(id)a4;
- (void)setCancelButton:(id)a3;
- (void)setConfirmationCodeRequired:(BOOL)a3;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setIsPreinstallingViewControllerActive:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlanInstallError:(id)a3;
- (void)setSignupUserConsentResponse:(int64_t)a3;
- (void)setUserConsentType:(unint64_t)a3;
- (void)setWithBackButton:(BOOL)a3;
- (void)viewControllerDidComplete:(id)a3;
@end

@implementation TSQRCodeScanFlow

- (TSQRCodeScanFlow)initWithBackButton:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSQRCodeScanFlow;
  v4 = [(TSSIMSetupFlow *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v4 action:sel_userDidTapCancel];
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIBarButtonItem *)v5;

    v4->_withBackButton = a3;
    v4->_confirmationCodeRequired = 0;
    v4->_userConsentType = 0;
    v4->_isPreinstallingViewControllerActive = 1;
    v4->_signupUserConsentResponse = 0;
    v7 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v7 assertUserInPurchaseFlowStartOver:0 caller:v4];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v3 deassertUserInPurchaseFlowWithForce:0 caller:self];

  v4 = +[TSCellularPlanManagerCache sharedInstance];
  [v4 resetDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)TSQRCodeScanFlow;
  [(TSQRCodeScanFlow *)&v5 dealloc];
}

- (id)firstViewController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[TSCellularPlanManagerCache sharedInstance];
  [v3 setDelegate:self];

  v4 = [[TSCellularPlanScanViewController alloc] initWithBackButton:self->_withBackButton];
  objc_super v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2080;
    v10 = "-[TSQRCodeScanFlow firstViewController]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "first view controller : %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  [(TSCellularPlanScanViewController *)v4 setDelegate:self];
  [(TSSIMSetupFlow *)self setTopViewController:v4];
  return v4;
}

- (void)firstViewController:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(TSQRCodeScanFlow *)self firstViewController];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[TSUtilities isRegulatoryRestrictionActive:self->_planInstallError])
  {
    self->_isPreinstallingViewControllerActive = 0;
    id v5 = [TSSubFlowViewController alloc];
    v28[0] = @"FlowTypeKey";
    v28[1] = @"SkipActivatingPane";
    v29[0] = &unk_26DC14260;
    v29[1] = MEMORY[0x263EFFA88];
    id v6 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    int v7 = [(TSSIMSetupFlow *)self navigationController];
    uint64_t v8 = [(TSSubFlowViewController *)v5 initWithOptions:v6 navigationController:v7];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __43__TSQRCodeScanFlow_nextViewControllerFrom___block_invoke;
    v23[3] = &unk_2648279D0;
    v23[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v23);
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_confirmationCodeRequired)
      {
        uint64_t v8 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_name];
        self->_confirmationCodeRequired = 0;
        goto LABEL_30;
      }
      v13 = [TSCellularPlanUserConsentViewController alloc];
      name = self->_name;
      BOOL v16 = self->_userConsentType != 0;
      unint64_t userConsentType = 4;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v4 confirmationCode];
        v12 = [[TSCellularPlanUserConsentViewController alloc] initWithConfirmationCode:self->_name consentType:4 requireAdditionalConsent:self->_userConsentType != 0 confirmationCode:v9 acceptButtonTapped:0];
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = 0;
        goto LABEL_30;
      }
      if ([v4 consentType] != 4 || (self->_userConsentType & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
        self->_isPreinstallingViewControllerActive = 0;
        v17 = [TSSubFlowViewController alloc];
        v24[0] = @"FlowTypeKey";
        v24[1] = @"SkipActivatingPane";
        v25[0] = &unk_26DC14260;
        v25[1] = MEMORY[0x263EFFA88];
        v24[2] = @"PlanSetupTypeKey";
        v25[2] = &unk_26DC14290;
        v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
        v19 = [(TSSIMSetupFlow *)self navigationController];
        uint64_t v8 = [(TSSubFlowViewController *)v17 initWithOptions:v18 navigationController:v19];

        goto LABEL_30;
      }
      v13 = [TSCellularPlanUserConsentViewController alloc];
      name = self->_name;
      unint64_t userConsentType = self->_userConsentType;
      BOOL v16 = 0;
    }
    uint64_t v8 = [(TSCellularPlanUserConsentViewController *)v13 initWithName:name consentType:userConsentType requireAdditionalConsent:v16];
    goto LABEL_30;
  }
  id v9 = v4;
  if (![v9 confirmationCodeRequired])
  {
    if (self->_confirmationCodeRequired)
    {
      uint64_t v8 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_name];
      self->_confirmationCodeRequired = 0;
      goto LABEL_29;
    }
    if ([v9 manualCardInfoEntry])
    {
      v12 = objc_alloc_init(TSCellularPlanCardInfoViewController);
    }
    else
    {
      if ([v9 transferViaQRCode])
      {
        if (![v9 transferViaQRCode])
        {
          uint64_t v8 = 0;
          goto LABEL_29;
        }
        self->_isPreinstallingViewControllerActive = 0;
        v20 = [TSSubFlowViewController alloc];
        v26[0] = @"FlowTypeKey";
        v26[1] = @"SkipActivatingPane";
        v27[0] = &unk_26DC14260;
        v27[1] = MEMORY[0x263EFFA88];
        v26[2] = @"PlanSetupTypeKey";
        v27[2] = &unk_26DC14278;
        uint64_t v11 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
        v21 = [(TSSIMSetupFlow *)self navigationController];
        uint64_t v8 = [(TSSubFlowViewController *)v20 initWithOptions:v11 navigationController:v21];

        goto LABEL_6;
      }
      v12 = [[TSCellularPlanUserConsentViewController alloc] initWithName:self->_name consentType:4 requireAdditionalConsent:self->_userConsentType != 0];
    }
LABEL_28:
    uint64_t v8 = (TSSubFlowViewController *)v12;
    goto LABEL_29;
  }
  v10 = [TSCellularPlanConfirmationCodeViewController alloc];
  uint64_t v11 = [v9 fauxCardData];
  uint64_t v8 = [(TSCellularPlanConfirmationCodeViewController *)v10 initWithCardData:v11];
LABEL_6:

LABEL_29:
LABEL_30:

  return v8;
}

void __43__TSQRCodeScanFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"transfer.failed" object:*(void *)(*(void *)(a1 + 32) + 128)];
}

- (void)viewControllerDidComplete:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (([v5 isContinueByUser] & 1) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = [v5 navigationController];
      int v7 = [v6 viewControllers];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        while (2)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v12;
              [(TSSIMSetupFlow *)self setTopViewController:v13];
              v14 = [v5 navigationController];
              id v15 = (id)[v14 popToViewController:v13 animated:1];

              goto LABEL_14;
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)TSQRCodeScanFlow;
  [(TSSIMSetupFlow *)&v16 viewControllerDidComplete:v4];
LABEL_14:
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v6 = a3;
  if (+[TSUtilities isPad])
  {
    if (+[TSUtilities inBuddy]) {
      goto LABEL_6;
    }
    id v4 = [v6 navigationItem];
    [v4 setRightBarButtonItem:self->_cancelButton];
  }
  else
  {
    id v5 = [v6 navigationItem];
    [v5 setHidesBackButton:1 animated:0];

    id v4 = [v6 navigationItem];
    [v4 setLeftBarButtonItem:self->_cancelButton];
  }

LABEL_6:
  MEMORY[0x270F9A758]();
}

- (void)handleError:(id)a3
{
  id v25 = a3;
  id v4 = +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:");
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = [v4 objectForKeyedSubscript:@"ErrorHeader"];
  int v7 = [v4 objectForKeyedSubscript:@"ErrorDetail"];
  uint64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  objc_initWeak(location, self);
  uint64_t v9 = [(TSSIMSetupFlow *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v11 = (void *)MEMORY[0x263F82400];
  if (isKindOfClass)
  {
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DBE8E78 table:@"Localizable"];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __32__TSQRCodeScanFlow_handleError___block_invoke;
    v36[3] = &unk_264828138;
    v14 = &v38;
    objc_copyWeak(&v38, location);
    id v37 = v9;
    id v15 = [v11 actionWithTitle:v13 style:0 handler:v36];
    [v8 addAction:v15];

    if (+[TSUtilities inBuddy])
    {
      objc_super v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v16 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
    }
    else
    {
      objc_super v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v16 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v21 = };

    uint64_t v22 = (void *)MEMORY[0x263F82400];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_2;
    v34[3] = &unk_264827A48;
    objc_copyWeak(&v35, location);
    v23 = [v22 actionWithTitle:v21 style:1 handler:v34];
    [v8 addAction:v23];

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_3;
    v31[3] = &unk_264827B08;
    objc_copyWeak(&v33, location);
    id v32 = v8;
    id v24 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v31);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
  }
  else
  {
    long long v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v18 = [v17 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_4;
    void v29[3] = &unk_264827A48;
    v14 = &v30;
    objc_copyWeak(&v30, location);
    long long v19 = [v11 actionWithTitle:v18 style:1 handler:v29];
    [v8 addAction:v19];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__TSQRCodeScanFlow_handleError___block_invoke_5;
    block[3] = &unk_264827B08;
    objc_copyWeak(&v28, location);
    id v27 = v8;
    id v20 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v28);
  }
  objc_destroyWeak(v14);

  objc_destroyWeak(location);
}

void __32__TSQRCodeScanFlow_handleError___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v4 = *(id *)(a1 + 32);
    id v5 = [v4 navigationController];
    id v6 = [v5 viewControllers];
    unint64_t v7 = [v6 count];

    if (v7 < 2)
    {
      [v9 setPlanInstallError:0];
      [*(id *)(a1 + 32) startScanning];
      [v9 receivedResponseWithVC:v4];
    }
    else
    {
      [v4 setEntryPoint:1];
      id v8 = objc_loadWeakRetained(v2);
      [v8 restartWith:*(void *)(a1 + 32)];

      id v4 = v8;
    }

    id WeakRetained = v9;
  }
}

void __32__TSQRCodeScanFlow_handleError___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained userDidTapCancel];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setPlanInstallError:0];
}

void __32__TSQRCodeScanFlow_handleError___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained topViewController];
  [v2 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

void __32__TSQRCodeScanFlow_handleError___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = objc_loadWeakRetained(v1);
  id v6 = v5;
  if (isKindOfClass)
  {
    id v8 = [v5 topViewController];

    id v7 = objc_loadWeakRetained(v1);
    [v7 setPlanInstallError:0];

    [v8 onError];
  }
  else
  {
    [v5 userDidTapCancel];

    id v8 = objc_loadWeakRetained(v1);
    [v8 setPlanInstallError:0];
  }
}

void __32__TSQRCodeScanFlow_handleError___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained topViewController];
  [v2 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  p_planInstallError = (uint64_t *)&self->_planInstallError;
  if (self->_planInstallError)
  {
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSQRCodeScanFlow planItemsUpdated:planListError:](p_planInstallError, v10);
    }

    goto LABEL_5;
  }
  if (v7)
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSQRCodeScanFlow planItemsUpdated:planListError:]((uint64_t)v8, v11);
    }

    v12 = [v8 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F31920]])
    {
      uint64_t v13 = [v8 code];

      if (v13 == 19)
      {
        self->_confirmationCodeRequired = 1;
        goto LABEL_5;
      }
    }
    else
    {
    }
    BOOL v32 = +[TSUtilities isRegulatoryRestrictionActive:v8];
    objc_storeStrong((id *)&self->_planInstallError, a4);
    if (!v32)
    {
      [(TSQRCodeScanFlow *)self handleError:v8];
      goto LABEL_5;
    }
LABEL_38:
    id v33 = [(TSSIMSetupFlow *)self topViewController];
    [(TSQRCodeScanFlow *)self viewControllerDidComplete:v33];

    goto LABEL_5;
  }
  if (v6)
  {
    if (self->_isPreinstallingViewControllerActive)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v14 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v34 = 90;
        id v35 = 0;
        BOOL v16 = 0;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v6);
            }
            long long v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (objc_msgSend(v19, "isInstalling", v34, v35))
            {
              id v20 = [v19 plan];
              int v21 = [v20 status];

              if (v21 != 6)
              {
                uint64_t v22 = [v19 carrierName];
                v23 = (NSString *)[v22 copy];
                name = self->_name;
                self->_name = v23;

                id v25 = [v19 iccid];
                BOOL v16 = [v25 length] != 0;

                v26 = _TSLogDomain();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  id v27 = self->_name;
                  *(_DWORD *)buf = 138412546;
                  v41 = (const char *)v27;
                  __int16 v42 = 2080;
                  v43 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_227A17000, v26, OS_LOG_TYPE_DEFAULT, "installing [%@] @%s", buf, 0x16u);
                }
              }
            }
            if (([v19 isSelected] & 1) == 0) {
              [v19 isInstalling];
            }
          }
          uint64_t v15 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v15);
        id v8 = v35;
        if (v16)
        {
          id v28 = +[TSCellularPlanManagerCache sharedInstance];
          uint64_t v29 = [v28 calculateInstallConsentTextTypeFor:v6];

          switch(v29)
          {
            case 0:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
              id v30 = _TSLogDomain();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v41 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "Invalid consent @%s", buf, 0xCu);
              }
              unint64_t v31 = 0;
              goto LABEL_33;
            case 1:
              id v30 = _TSLogDomain();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v41 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", buf, 0xCu);
              }
              unint64_t v31 = 3;
              goto LABEL_33;
            case 2:
              id v30 = _TSLogDomain();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v41 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", buf, 0xCu);
              }
              unint64_t v31 = 2;
LABEL_33:

              self->_unint64_t userConsentType = v31;
              break;
            default:
              break;
          }
          if (*((unsigned char *)&self->super.super.isa + v34))
          {
            *((unsigned char *)&self->super.super.isa + v34) = 0;
            goto LABEL_38;
          }
        }
      }
    }
  }
LABEL_5:
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (BOOL)withBackButton
{
  return self->_withBackButton;
}

- (void)setWithBackButton:(BOOL)a3
{
  self->_withBackButton = a3;
}

- (BOOL)confirmationCodeRequired
{
  return self->_confirmationCodeRequired;
}

- (void)setConfirmationCodeRequired:(BOOL)a3
{
  self->_confirmationCodeRequired = a3;
}

- (BOOL)isPreinstallingViewControllerActive
{
  return self->_isPreinstallingViewControllerActive;
}

- (void)setIsPreinstallingViewControllerActive:(BOOL)a3
{
  self->_isPreinstallingViewControllerActive = a3;
}

- (unint64_t)userConsentType
{
  return self->_userConsentType;
}

- (void)setUserConsentType:(unint64_t)a3
{
  self->_unint64_t userConsentType = a3;
}

- (int64_t)signupUserConsentResponse
{
  return self->_signupUserConsentResponse;
}

- (void)setSignupUserConsentResponse:(int64_t)a3
{
  self->_signupUserConsentResponse = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setName:(id)a3
{
}

- (NSError)planInstallError
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPlanInstallError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planInstallError, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

- (void)planItemsUpdated:(uint64_t)a1 planListError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)planItemsUpdated:(uint64_t *)a1 planListError:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  uint64_t v6 = "-[TSQRCodeScanFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]received error already : %@ @%s", (uint8_t *)&v3, 0x16u);
}

@end