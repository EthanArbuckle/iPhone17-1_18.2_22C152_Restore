@interface TSSIMSetupPublicApiInstallFlow
- (BOOL)isPreinstallingViewControllerActive;
- (TSSIMSetupPublicApiInstallFlow)initWithAppName:(id)a3 requireSetup:(BOOL)a4 skipGeneralInstallConsent:(BOOL)a5;
- (id)_firstViewController;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (int64_t)signupUserConsentResponse;
- (void)_alertConsentWithCompletion:(id)a3;
- (void)_displayUserConsentAlert:(id)a3;
- (void)_maybeShowPreinstallConsentOnViewController:(id)a3;
- (void)dealloc;
- (void)firstViewController:(id)a3;
- (void)planItemsUpdated:(id)a3 planListError:(id)a4;
- (void)setDefaultNavigationItems:(id)a3;
- (void)setIsPreinstallingViewControllerActive:(BOOL)a3;
- (void)userDidTapCancel;
@end

@implementation TSSIMSetupPublicApiInstallFlow

- (TSSIMSetupPublicApiInstallFlow)initWithAppName:(id)a3 requireSetup:(BOOL)a4 skipGeneralInstallConsent:(BOOL)a5
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSSIMSetupPublicApiInstallFlow;
  v8 = [(TSSIMSetupFlow *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    installName = v8->_installName;
    v8->_installName = (NSString *)v9;

    v8->_userConsentType = 0;
    v8->_signupConsentResponse = 0;
    v8->_skipGeneralInstallConsent = a5;
    v11 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v11 assertUserInPurchaseFlowStartOver:0 caller:v8];
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
  v5.super_class = (Class)TSSIMSetupPublicApiInstallFlow;
  [(TSSIMSetupPublicApiInstallFlow *)&v5 dealloc];
}

- (id)firstViewController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = +[TSCellularPlanManagerCache sharedInstance];
  [v3 setDelegate:self];

  self->_isPreinstallingViewControllerActive = 1;
  v4 = [[TSCellularPlanUserConsentViewController alloc] initWithName:self->_installName consentType:1 requireAdditionalConsent:0];
  [(TSCellularPlanUserConsentViewController *)v4 setDelegate:self];
  [(TSSIMSetupPublicApiInstallFlow *)self _maybeShowPreinstallConsentOnViewController:v4];
  objc_super v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2080;
    v10 = "-[TSSIMSetupPublicApiInstallFlow firstViewController]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  [(TSSIMSetupFlow *)self setTopViewController:v4];
  return v4;
}

- (void)firstViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__TSSIMSetupPublicApiInstallFlow_firstViewController___block_invoke;
    v5[3] = &unk_264828440;
    id v6 = v4;
    objc_copyWeak(&v7, &location);
    [(TSSIMSetupPublicApiInstallFlow *)self _displayUserConsentAlert:v5];
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
}

void __54__TSSIMSetupPublicApiInstallFlow_firstViewController___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained _firstViewController];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v5 userDidTapCancel];

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

- (id)nextViewControllerFrom:(id)a3
{
  v49[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[TSUtilities isRegulatoryRestrictionActive:self->_planInstallError])
  {
    self->_isPreinstallingViewControllerActive = 0;
    id v5 = [TSSubFlowViewController alloc];
    v48[0] = @"FlowTypeKey";
    v48[1] = @"SkipActivatingPane";
    v49[0] = &unk_26DC14350;
    v49[1] = MEMORY[0x263EFFA88];
    id v6 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
    id v7 = [(TSSIMSetupFlow *)self navigationController];
    uint64_t v8 = [(TSSubFlowViewController *)v5 initWithOptions:v6 navigationController:v7];

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __57__TSSIMSetupPublicApiInstallFlow_nextViewControllerFrom___block_invoke;
    v43[3] = &unk_2648279D0;
    v43[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v43);
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_confirmationCodeRequired)
    {
      uint64_t v8 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_carrierName];
      self->_confirmationCodeRequired = 0;
      goto LABEL_36;
    }
    if (self->_skipGeneralInstallConsent)
    {
      self->_isPreinstallingViewControllerActive = 0;
      v12 = [TSSubFlowViewController alloc];
      v46[0] = @"FlowTypeKey";
      v46[1] = @"SkipActivatingPane";
      v47[0] = &unk_26DC14350;
      v47[1] = MEMORY[0x263EFFA88];
      v46[2] = @"PlanSetupTypeKey";
      v47[2] = &unk_26DC14368;
      objc_super v13 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
      v14 = [(TSSIMSetupFlow *)self navigationController];
      uint64_t v8 = [(TSSubFlowViewController *)v12 initWithOptions:v13 navigationController:v14];

      goto LABEL_36;
    }
    v21 = [[TSCellularPlanUserConsentViewController alloc] initWithName:self->_carrierName consentType:4 requireAdditionalConsent:self->_userConsentType != 0];
    goto LABEL_35;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    if ([v9 consentType] == 1 && self->_confirmationCodeRequired)
    {
      uint64_t v8 = [[TSCellularPlanConfirmationCodeViewController alloc] initAsMidOperationWithCarrierName:self->_carrierName];
      self->_confirmationCodeRequired = 0;
LABEL_27:

      goto LABEL_36;
    }
    if ([v9 consentType] != 4 || (self->_userConsentType & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      self->_isPreinstallingViewControllerActive = 0;
      v16 = [MEMORY[0x263EFF9D0] null];
      if (self->_skipGeneralInstallConsent && [(NSString *)self->_installName length])
      {
        v17 = self->_installName;

        v16 = v17;
      }
      v18 = [TSSubFlowViewController alloc];
      v44[0] = @"FlowTypeKey";
      v44[1] = @"SkipActivatingPane";
      v45[0] = &unk_26DC14350;
      v45[1] = MEMORY[0x263EFFA88];
      v44[2] = @"PlanSetupTypeKey";
      v44[3] = @"CarrierNameKey";
      v45[2] = &unk_26DC14368;
      v45[3] = v16;
      v19 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
      v20 = [(TSSIMSetupFlow *)self navigationController];
      uint64_t v8 = [(TSSubFlowViewController *)v18 initWithOptions:v19 navigationController:v20];

      goto LABEL_27;
    }
    v15 = [[TSCellularPlanUserConsentViewController alloc] initWithName:self->_carrierName consentType:self->_userConsentType requireAdditionalConsent:0];
LABEL_26:
    uint64_t v8 = (TSSubFlowViewController *)v15;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v4;
    if (+[TSUtilities isPad](TSUtilities, "isPad") || [v10 subFlowType] != 16)
    {
      uint64_t v8 = 0;
      goto LABEL_29;
    }
    uint64_t v11 = [[TSCellularPlanLabelsViewController alloc] initWithIccid:0 forceDualSIMSetup:1 allowDismiss:1];
LABEL_14:
    uint64_t v8 = (TSSubFlowViewController *)v11;
LABEL_29:

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v4 confirmationCode];
    v15 = [[TSCellularPlanUserConsentViewController alloc] initWithConfirmationCode:self->_carrierName consentType:4 requireAdditionalConsent:self->_userConsentType != 0 confirmationCode:v9 acceptButtonTapped:0];
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = [TSCellularPlanUsesViewController alloc];
    uint64_t v23 = 0;
LABEL_33:
    BOOL v24 = 0;
LABEL_34:
    v21 = [(TSCellularPlanUsesViewController *)v22 initWithType:v23 withDoneButton:v24];
LABEL_35:
    uint64_t v8 = (TSSubFlowViewController *)v21;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] < 2)
    {
      goto LABEL_51;
    }
    [(NSMutableArray *)self->_danglingPlanItems removeObjectAtIndex:0];
    v27 = [TSCellularPlanRemapViewController alloc];
    BOOL v28 = (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] > 1;
    id v10 = [(NSMutableArray *)self->_danglingPlanItems objectAtIndex:0];
    v29 = v27;
    uint64_t v30 = 0;
    goto LABEL_50;
  }
  uint64_t v26 = [v4 usesType];
  switch(v26)
  {
    case 2:
      v31 = (void *)MEMORY[0x263EFF980];
      v32 = +[TSCellularPlanManagerCache sharedInstance];
      v33 = [v32 getDanglingPlanItems];
      v34 = [v31 arrayWithArray:v33];
      danglingPlanItems = self->_danglingPlanItems;
      self->_danglingPlanItems = v34;

      v36 = [TSCellularPlanUsesViewController alloc];
      BOOL v24 = [(NSMutableArray *)self->_danglingPlanItems count] != 0;
      v22 = v36;
      uint64_t v23 = 1;
      goto LABEL_34;
    case 1:
      v37 = (void *)MEMORY[0x263EFF980];
      v38 = +[TSCellularPlanManagerCache sharedInstance];
      v39 = [v38 getDanglingPlanItems];
      v40 = [v37 arrayWithArray:v39];
      v41 = self->_danglingPlanItems;
      self->_danglingPlanItems = v40;

      if (![(NSMutableArray *)self->_danglingPlanItems count]) {
        break;
      }
      v42 = [TSCellularPlanRemapViewController alloc];
      BOOL v28 = (unint64_t)[(NSMutableArray *)self->_danglingPlanItems count] > 1;
      id v10 = [(NSMutableArray *)self->_danglingPlanItems objectAtIndex:0];
      v29 = v42;
      uint64_t v30 = 1;
LABEL_50:
      uint64_t v11 = [(TSCellularPlanRemapViewController *)v29 initWithBackButton:v30 continueButton:v28 danglingPlanItem:v10];
      goto LABEL_14;
    case 0:
      v22 = [TSCellularPlanUsesViewController alloc];
      uint64_t v23 = 2;
      goto LABEL_33;
  }
LABEL_51:
  uint64_t v8 = 0;
LABEL_36:

  return v8;
}

void __57__TSSIMSetupPublicApiInstallFlow_nextViewControllerFrom___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"transfer.failed" object:*(void *)(*(void *)(a1 + 32) + 96)];
}

- (int64_t)signupUserConsentResponse
{
  return self->_signupConsentResponse;
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v3 = [a3 navigationItem];
  [v3 setHidesBackButton:1 animated:0];
}

- (void)userDidTapCancel
{
  uint64_t v3 = [(TSSIMSetupFlow *)self topViewController];
  if (!v3
    || (id v4 = (void *)v3,
        [(TSSIMSetupFlow *)self topViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    id v7 = +[TSCellularPlanManagerCache sharedInstance];
    [v7 resumePlanProvisioning:0 userConsent:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)TSSIMSetupPublicApiInstallFlow;
  [(TSSIMSetupFlow *)&v8 userDidTapCancel];
}

- (void)planItemsUpdated:(id)a3 planListError:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_planInstallError)
  {
    id v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:](v9);
    }

    goto LABEL_43;
  }
  if (v7)
  {
    id v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]((uint64_t)v8, v10);
    }

    uint64_t v11 = [v8 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F31920]])
    {
      uint64_t v12 = [v8 code];

      if (v12 == 19)
      {
        self->_confirmationCodeRequired = 1;
        goto LABEL_43;
      }
    }
    else
    {
    }
    BOOL v32 = +[TSUtilities isRegulatoryRestrictionActive:v8];
    objc_storeStrong((id *)&self->_planInstallError, a4);
    if (!v32)
    {
      v33 = +[TSUtilities getErrorTitleDetail:v8 forCarrier:self->_carrierName];
      v34 = (void *)MEMORY[0x263F82418];
      v35 = [v33 objectForKeyedSubscript:@"ErrorHeader"];
      v36 = [v33 objectForKeyedSubscript:@"ErrorDetail"];
      v37 = [v34 alertControllerWithTitle:v35 message:v36 preferredStyle:1];

      v38 = (void *)MEMORY[0x263F82400];
      v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke;
      v50[3] = &unk_264827F48;
      v50[4] = self;
      v41 = [v38 actionWithTitle:v40 style:1 handler:v50];
      [v37 addAction:v41];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke_2;
      block[3] = &unk_264827A70;
      block[4] = self;
      id v49 = v37;
      id v42 = v37;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_42;
    }
LABEL_40:
    v33 = [(TSSIMSetupFlow *)self topViewController];
    [(TSSIMSetupFlow *)self viewControllerDidComplete:v33];
LABEL_42:

    goto LABEL_43;
  }
  if (v6)
  {
    if (self->_isPreinstallingViewControllerActive)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v13 = [v6 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v43 = 160;
        int v15 = 0;
        BOOL v16 = 0;
        uint64_t v17 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v45 != v17) {
              objc_enumerationMutation(v6);
            }
            v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (objc_msgSend(v19, "isInstalling", v43))
            {
              v20 = [v19 plan];
              int v21 = [v20 status];

              if (v21 != 6)
              {
                v22 = [v19 carrierName];
                uint64_t v23 = (NSString *)[v22 copy];
                carrierName = self->_carrierName;
                self->_carrierName = v23;

                v25 = [v19 iccid];
                BOOL v16 = [v25 length] != 0;

                uint64_t v26 = _TSLogDomain();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = self->_carrierName;
                  *(_DWORD *)buf = 138412546;
                  v52 = (const char *)v27;
                  __int16 v53 = 2080;
                  v54 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                  _os_log_impl(&dword_227A17000, v26, OS_LOG_TYPE_DEFAULT, "installing [%@] @%s", buf, 0x16u);
                }
              }
            }
            if (([v19 isSelected] & 1) != 0 || objc_msgSend(v19, "isInstalling")) {
              ++v15;
            }
          }
          uint64_t v14 = [v6 countByEnumeratingWithState:&v44 objects:v55 count:16];
        }
        while (v14);
        if (v15 >= 2) {
          self->_requireSetup = 1;
        }
        objc_super v8 = 0;
        if (v16)
        {
          BOOL v28 = +[TSCellularPlanManagerCache sharedInstance];
          uint64_t v29 = [v28 calculateInstallConsentTextTypeFor:v6];

          switch(v29)
          {
            case 0:
            case 3:
            case 4:
            case 5:
              uint64_t v30 = _TSLogDomain();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "Invalid consent @%s", buf, 0xCu);
              }
              unint64_t v31 = 0;
              goto LABEL_35;
            case 1:
              uint64_t v30 = _TSLogDomain();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", buf, 0xCu);
              }
              unint64_t v31 = 3;
              goto LABEL_35;
            case 2:
              uint64_t v30 = _TSLogDomain();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v52 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
                _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", buf, 0xCu);
              }
              unint64_t v31 = 2;
LABEL_35:

              self->_userConsentType = v31;
              objc_super v8 = 0;
              break;
            default:
              break;
          }
          if (*((unsigned char *)&self->super.super.isa + v43))
          {
            *((unsigned char *)&self->super.super.isa + v43) = 0;
            goto LABEL_40;
          }
        }
      }
    }
  }
LABEL_43:
}

uint64_t __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userDidTapCancel];
}

void __65__TSSIMSetupPublicApiInstallFlow_planItemsUpdated_planListError___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_maybeShowPreinstallConsentOnViewController:(id)a3
{
  id v4 = a3;
  id v5 = +[TSCellularPlanManagerCache sharedInstance];
  id v6 = [v5 planItems];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke;
  v12[3] = &unk_264828468;
  v12[4] = self;
  id v7 = +[TSUtilities preinstallPPRAlertControllerWithItems:v6 completion:v12];
  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke_2;
    block[3] = &unk_264827A70;
    id v10 = v4;
    id v11 = v7;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke(uint64_t result, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      *(void *)(*(void *)(result + 32) + 152) = 0;
      break;
    case 1:
      result = [*(id *)(result + 32) userDidTapCancel];
      break;
    case 2:
      uint64_t v2 = *(void *)(result + 32);
      uint64_t v3 = 2;
      goto LABEL_6;
    case 3:
      uint64_t v2 = *(void *)(result + 32);
      uint64_t v3 = 1;
LABEL_6:
      *(void *)(v2 + 152) = v3;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __78__TSSIMSetupPublicApiInstallFlow__maybeShowPreinstallConsentOnViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_alertConsentWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ACTIVATE_NEW_ESIM_ALERT_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"ACTIVATE_NEW_ESIM_ALERT_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  dispatch_time_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"NOT_ALLOW" value:&stru_26DBE8E78 table:@"Localizable"];

  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"ALLOW" value:&stru_26DBE8E78 table:@"Localizable"];

  uint64_t v12 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke;
  block[3] = &unk_2648284B8;
  id v19 = v5;
  id v20 = v7;
  id v21 = v11;
  id v22 = v9;
  id v23 = v3;
  id v13 = v3;
  id v14 = v9;
  id v15 = v11;
  id v16 = v7;
  id v17 = v5;
  dispatch_async(v12, block);
}

void __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke(uint64_t a1)
{
  CFOptionFlags v7 = 0;
  SInt32 v2 = CFUserNotificationDisplayAlert(0.0, 1uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), *(CFStringRef *)(a1 + 48), *(CFStringRef *)(a1 + 56), 0, &v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2;
  block[3] = &unk_264828490;
  SInt32 v6 = v2;
  id v4 = *(id *)(a1 + 64);
  CFOptionFlags v5 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  SInt32 v2 = (int *)(a1 + 48);
  if (*(_DWORD *)(a1 + 48))
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2_cold_1(v2, v3);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 134218242;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      id v11 = "-[TSSIMSetupPublicApiInstallFlow _alertConsentWithCompletion:]_block_invoke";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "response flags = %lu @%s", (uint8_t *)&v8, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  CFOptionFlags v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v7();
}

- (void)_displayUserConsentAlert:(id)a3
{
  uint64_t v9 = (void (**)(id, void))a3;
  installName = self->_installName;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  SInt32 v6 = [v5 localizedStringForKey:@"CAMERA" value:&stru_26DBE8E78 table:@"Localizable"];
  LODWORD(installName) = [(NSString *)installName isEqualToString:v6];

  if (!installName)
  {
    CFOptionFlags v7 = self;
    int v8 = v9;
    goto LABEL_5;
  }
  if (+[TSUtilities openPrefsURL:@"prefs:root=MOBILE_DATA_SETTINGS_ID&path=CELLULAR"])
  {
    CFOptionFlags v7 = self;
    int v8 = v9;
LABEL_5:
    [(TSSIMSetupPublicApiInstallFlow *)v7 _alertConsentWithCompletion:v8];
    goto LABEL_7;
  }
  v9[2](v9, 0);
LABEL_7:
}

- (id)_firstViewController
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = +[TSCellularPlanManagerCache sharedInstance];
  [v3 setDelegate:self];

  self->_isPreinstallingViewControllerActive = 1;
  id v4 = objc_alloc_init(SSUserConsentViewController);
  [(SSUserConsentViewController *)v4 setDelegate:self];
  [(TSSIMSetupPublicApiInstallFlow *)self _maybeShowPreinstallConsentOnViewController:v4];
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2080;
    __int16 v10 = "-[TSSIMSetupPublicApiInstallFlow _firstViewController]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v7, 0x16u);
  }

  [(TSSIMSetupFlow *)self setTopViewController:v4];
  return v4;
}

- (BOOL)isPreinstallingViewControllerActive
{
  return self->_isPreinstallingViewControllerActive;
}

- (void)setIsPreinstallingViewControllerActive:(BOOL)a3
{
  self->_isPreinstallingViewControllerActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_installName, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_danglingPlanItems, 0);
  objc_storeStrong((id *)&self->_planInstallError, 0);
}

- (void)planItemsUpdated:(uint64_t)a1 planListError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)planItemsUpdated:(os_log_t)log planListError:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[TSSIMSetupPublicApiInstallFlow planItemsUpdated:planListError:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]received error already @%s", (uint8_t *)&v1, 0xCu);
}

void __62__TSSIMSetupPublicApiInstallFlow__alertConsentWithCompletion___block_invoke_2_cold_1(int *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2080;
  uint64_t v5 = "-[TSSIMSetupPublicApiInstallFlow _alertConsentWithCompletion:]_block_invoke_2";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]present notification failed:%d @%s", (uint8_t *)v3, 0x12u);
}

@end