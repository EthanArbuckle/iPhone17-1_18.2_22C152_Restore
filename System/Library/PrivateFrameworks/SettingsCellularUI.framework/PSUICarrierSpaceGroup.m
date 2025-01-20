@interface PSUICarrierSpaceGroup
- (CTCarrierSpaceCapabilities)capabilities;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)parentSpecifier;
- (PSUICarrierSpaceGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5 ctClient:(id)a6;
- (PSUICarrierSpaceOptInSplashScreen)optInSplashScreen;
- (RemoteUIController)remoteUIController;
- (id)carrierServicesSpecifier;
- (id)cellularPlansSpecifier;
- (id)descriptionForPlans:(id)a3;
- (id)descriptionForUsage:(id)a3;
- (id)getLogger;
- (id)specifierForID:(id)a3;
- (id)usageSpecifier;
- (void)agreePressed;
- (void)carrierSpaceChanged;
- (void)disagreeOrCancelPressed;
- (void)newCarrierNotification;
- (void)openURLWithSpecifier:(id)a3;
- (void)prepareSpecifiers;
- (void)refreshSpecifiers;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)setCapabilities:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setIsSubscriptionDataPreferred;
- (void)setListController:(id)a3;
- (void)setOptInSplashScreen:(id)a3;
- (void)setParentSpecifier:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)showConsentFlow:(id)a3;
- (void)showTermsAndConditions:(id)a3 consentFlowInfo:(id)a4;
@end

@implementation PSUICarrierSpaceGroup

- (PSUICarrierSpaceGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5 ctClient:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PSUICarrierSpaceGroup;
  v14 = [(PSUICarrierSpaceGroup *)&v26 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_listController, v10);
    objc_storeWeak((id *)&v15->_groupSpecifier, v11);
    id v16 = objc_storeWeak((id *)&v15->_parentSpecifier, v12);
    uint64_t v17 = [v12 propertyForKey:*MEMORY[0x263F60290]];
    subscriptionContext = v15->_subscriptionContext;
    v15->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v17;

    v19 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v15->_subscriptionContext];
    v20 = [v19 instance];
    uint64_t v21 = [v20 stringValue];
    instance = v15->_instance;
    v15->_instance = (NSString *)v21;

    objc_storeStrong((id *)&v15->_ctClient, a6);
    [(CoreTelephonyClient *)v15->_ctClient setDelegate:v15];
    [(PSUICarrierSpaceGroup *)v15 setIsSubscriptionDataPreferred];
    [(PSUICarrierSpaceGroup *)v15 prepareSpecifiers];
    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v15 selector:sel_carrierSpaceChanged name:0x26D414D60 object:0];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v15 selector:sel_newCarrierNotification name:@"PSNewCarrierNotification" object:0];
  }
  return v15;
}

- (void)refreshSpecifiers
{
  [(PSUICarrierSpaceGroup *)self prepareSpecifiers];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PSUICarrierSpaceGroup_refreshSpecifiers__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__PSUICarrierSpaceGroup_refreshSpecifiers__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listController];
  [v1 reloadSpecifiers];
}

- (void)prepareSpecifiers
{
  v3 = (NSDictionary *)objc_opt_new();
  specifersByID = self->_specifersByID;
  self->_specifersByID = v3;

  id v15 = [(PSUICarrierSpaceGroup *)self cellularPlansSpecifier];
  if (v15)
  {
    v5 = self->_specifersByID;
    v6 = [v15 identifier];
    [(NSDictionary *)v5 setValue:v15 forKey:v6];
  }
  v7 = [(PSUICarrierSpaceGroup *)self usageSpecifier];
  v8 = v7;
  if (v7)
  {
    v9 = self->_specifersByID;
    id v10 = [v7 identifier];
    [(NSDictionary *)v9 setValue:v8 forKey:v10];
  }
  id v11 = [(PSUICarrierSpaceGroup *)self carrierServicesSpecifier];
  id v12 = v11;
  if (v11)
  {
    id v13 = self->_specifersByID;
    v14 = [v11 identifier];
    [(NSDictionary *)v13 setValue:v12 forKey:v14];
  }
}

- (id)carrierServicesSpecifier
{
  if (self->_isSubscriptionDataPreferred)
  {
    v3 = [(PSUICarrierSpaceGroup *)self capabilities];
    if ([v3 supportsApplications])
    {
      v4 = +[PSUICarrierSpaceManager sharedManager];
      v5 = [v4 appsInfo];
      v6 = [v5 appsList];
      BOOL v7 = [v6 count] != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  v8 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  v9 = [v8 carrierServices:self->_subscriptionContext];
  uint64_t v10 = [v9 count];

  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = !v7;
  }
  if (v11)
  {
    uint64_t v17 = [PSUIMyAccountSpecifier alloc];
    subscriptionContext = self->_subscriptionContext;
    v19 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    v20 = [(PSUIMyAccountSpecifier *)v17 initWithContext:subscriptionContext cbCache:v19];

    if (v20)
    {
      uint64_t v21 = [(PSUICarrierSpaceGroup *)self getLogger];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_221B17000, v21, OS_LOG_TYPE_DEFAULT, "My account specifier found. Returning My Account Specifier for Carrier Services.", v34, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      [(PSUIMyAccountSpecifier *)v20 setHostController:WeakRetained];

      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:@"CARRIER_SERVICES" value:&stru_26D410CA0 table:@"CarrierSpace"];
      [(PSUIMyAccountSpecifier *)v20 setName:v24];

      [(PSUIMyAccountSpecifier *)v20 setIdentifier:@"PSCarrierSpaceCarrierServicesSpecifierKey"];
      id v16 = v20;
    }
    else
    {
      v25 = +[PSUICarrierServicesSpecifierCache sharedInstance];
      id v16 = [v25 mmsInfoSpecifierWithTarget:self context:self->_subscriptionContext];

      objc_super v26 = [(PSUICarrierSpaceGroup *)self getLogger];
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v27)
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_221B17000, v26, OS_LOG_TYPE_DEFAULT, "MMS Info Specifier found. Returning MMS Info specifier for Carrier Services.", v33, 2u);
        }

        v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v29 = [v28 localizedStringForKey:@"CARRIER_SERVICES" value:&stru_26D410CA0 table:@"CarrierSpace"];
        [(PSUIMyAccountSpecifier *)v16 setName:v29];

        [(PSUIMyAccountSpecifier *)v16 setIdentifier:@"PSCarrierSpaceCarrierServicesSpecifierKey"];
        v30 = v16;
      }
      else
      {
        if (v27)
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_221B17000, v26, OS_LOG_TYPE_DEFAULT, "No specifier found for Carrier Services.", v32, 2u);
        }
      }
    }
  }
  else
  {
    id v12 = [(PSUICarrierSpaceGroup *)self getLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "Carrier services or apps available. Returning PSLinkListCell specifier for Carrier Services.", buf, 2u);
    }

    id v13 = (void *)MEMORY[0x263F5FC40];
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"CARRIER_SERVICES" value:&stru_26D410CA0 table:@"CarrierSpace"];
    id v16 = [v13 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [(PSUIMyAccountSpecifier *)v16 setIdentifier:@"PSCarrierSpaceCarrierServicesSpecifierKey"];
    [(PSUIMyAccountSpecifier *)v16 setProperty:self->_subscriptionContext forKey:*MEMORY[0x263F60290]];
  }
  return v16;
}

- (id)cellularPlansSpecifier
{
  if (!self->_isSubscriptionDataPreferred)
  {
    uint64_t v10 = 0;
    goto LABEL_22;
  }
  v3 = +[PSUICarrierSpaceManager sharedManager];
  v4 = [v3 capabilities];
  [(PSUICarrierSpaceGroup *)self setCapabilities:v4];

  unsigned __int8 v5 = [v3 hasUserConsent];
  v6 = [(PSUICarrierSpaceGroup *)self capabilities];
  if ([v6 supportsPlans])
  {
    if (v5)
    {
      BOOL v7 = [v3 plansInfo];
      v8 = [v7 planGroupsList];
      uint64_t v9 = [v8 count];

      if (!v9) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    int v11 = [v3 planChangeIsRestricted];
    id v12 = [(PSUICarrierSpaceGroup *)self descriptionForPlans:0];
    uint64_t v13 = [v12 length];

    if (!v11 || (uint64_t v10 = 0, v13))
    {
      if (v11) {
        uint64_t v14 = 4;
      }
      else {
        uint64_t v14 = 2;
      }
      if ((v11 | v5 ^ 1))
      {
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v14 = 2;
      }
      id v16 = (void *)MEMORY[0x263F5FC40];
      uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"PLANS" value:&stru_26D410CA0 table:@"CarrierSpace"];
      uint64_t v10 = [v16 preferenceSpecifierNamed:v18 target:self set:0 get:sel_descriptionForPlans_ detail:v15 cell:v14 edit:0];

      if ((v5 & 1) == 0)
      {
        [v10 setButtonAction:sel_showConsentFlow_];
        [v10 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
      }
      [v10 setIdentifier:@"PSCarrierSpaceCellularPlansSpeciferKey"];
    }
    goto LABEL_21;
  }

LABEL_8:
  uint64_t v10 = 0;
LABEL_21:

LABEL_22:
  return v10;
}

- (id)usageSpecifier
{
  if (!self->_isSubscriptionDataPreferred)
  {
    int v11 = 0;
    goto LABEL_14;
  }
  v3 = +[PSUICarrierSpaceManager sharedManager];
  v4 = [v3 capabilities];
  [(PSUICarrierSpaceGroup *)self setCapabilities:v4];

  char v5 = [v3 hasUserConsent];
  v6 = [(PSUICarrierSpaceGroup *)self capabilities];
  if ([v6 supportsUsage])
  {
    if ((v5 & 1) == 0)
    {

      uint64_t v10 = 0;
      goto LABEL_10;
    }
    BOOL v7 = [v3 usageInfo];
    v8 = [v7 accountMetrics];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = objc_opt_class();
LABEL_10:
      id v12 = (void *)MEMORY[0x263F5FC40];
      uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v13 localizedStringForKey:@"USAGE" value:&stru_26D410CA0 table:@"CarrierSpace"];
      int v11 = [v12 preferenceSpecifierNamed:v14 target:self set:0 get:sel_descriptionForUsage_ detail:v10 cell:2 edit:0];

      if ((v5 & 1) == 0)
      {
        [v11 setButtonAction:sel_showConsentFlow_];
        [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
      }
      [v11 setIdentifier:@"PSCarrierSpaceUsageSpecifierKey"];
      goto LABEL_13;
    }
  }
  else
  {
  }
  int v11 = 0;
LABEL_13:

LABEL_14:
  return v11;
}

- (void)setIsSubscriptionDataPreferred
{
  v3 = [MEMORY[0x263F67EF0] sharedInstance];
  v4 = [v3 activeDataSubscriptionContext];

  if (!self->_subscriptionContext)
  {
    v8 = [(PSUICarrierSpaceGroup *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Subscription is not set", buf, 2u);
    }
    goto LABEL_11;
  }
  if (v4)
  {
    char v5 = [v4 uuid];
    v6 = [(CTXPCServiceSubscriptionContext *)self->_subscriptionContext uuid];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      self->_isSubscriptionDataPreferred = 1;
      v8 = [(PSUICarrierSpaceGroup *)self getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        uint64_t v9 = "Subscription is data preferred";
        uint64_t v10 = (uint8_t *)&v12;
LABEL_10:
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      v8 = [(PSUICarrierSpaceGroup *)self getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        uint64_t v9 = "Subscription is not data preferred";
        uint64_t v10 = (uint8_t *)&v11;
        goto LABEL_10;
      }
    }
LABEL_11:
  }
}

- (void)newCarrierNotification
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpaceGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[PSUICarrierSpaceGroup newCarrierNotification]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s reloading specifiers", (uint8_t *)&v4, 0xCu);
  }

  [(PSUICarrierSpaceGroup *)self refreshSpecifiers];
}

- (id)descriptionForPlans:(id)a3
{
  v3 = +[PSUICarrierSpaceManager sharedManager];
  int v4 = [v3 hasUserConsent];

  if (!v4)
  {
    uint64_t v9 = &stru_26D410CA0;
    goto LABEL_13;
  }
  char v5 = +[PSUICarrierSpaceManager sharedManager];
  uint64_t v6 = [v5 subscribedPlanOptions];
  int v7 = [v5 subscribedDomesticPlanOptions];
  if ([v6 count])
  {
    if ([v6 count] == 1)
    {
      v8 = v6;
    }
    else
    {
      if ([v7 count] != 1)
      {
        __int16 v11 = NSString;
        uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        __int16 v12 = [v10 localizedStringForKey:@"%@_PLANS" value:&stru_26D410CA0 table:@"CarrierSpace"];
        uint64_t v13 = (void *)MEMORY[0x263F08A30];
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        uint64_t v15 = [v13 localizedStringFromNumber:v14 numberStyle:1];
        objc_msgSend(v11, "stringWithFormat:", v12, v15);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      v8 = v7;
    }
    uint64_t v10 = [v8 objectAtIndexedSubscript:0];
    uint64_t v9 = [v10 planLabel];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v9 = &stru_26D410CA0;
LABEL_12:

LABEL_13:
  return v9;
}

- (id)descriptionForUsage:(id)a3
{
  v3 = +[PSUICarrierSpaceManager sharedManager];
  int v4 = [v3 hasUserConsent];

  if (v4)
  {
    char v5 = +[PSUICarrierSpaceManager sharedManager];
    uint64_t v6 = [v5 planMetrics];
    if ([v6 count] == 1)
    {
      int v7 = [v6 objectAtIndexedSubscript:0];
      v8 = [v5 descriptionForPlanMetrics:v7];
    }
    else
    {
      v8 = &stru_26D410CA0;
    }
  }
  else
  {
    v8 = &stru_26D410CA0;
  }
  return v8;
}

- (void)carrierSpaceChanged
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpaceGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[PSUICarrierSpaceGroup carrierSpaceChanged]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s reloading specifiers", (uint8_t *)&v4, 0xCu);
  }

  [(PSUICarrierSpaceGroup *)self refreshSpecifiers];
}

- (void)showConsentFlow:(id)a3
{
  id v4 = a3;
  char v5 = [(PSUICarrierSpaceGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Showing carrier space consent flow", buf, 2u);
  }

  uint64_t v6 = +[PSUICarrierSpaceManager sharedManager];
  int v7 = [v6 userConsentFlowInfo];

  v8 = [v7 webURL];
  if ([v8 length])
  {
    uint64_t v9 = [PSUICarrierSpaceOptInSplashScreen alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    __int16 v11 = [(PSUICarrierSpaceOptInSplashScreen *)v9 initWithParent:WeakRetained];
    optInSplashScreen = self->_optInSplashScreen;
    self->_optInSplashScreen = v11;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id location = 0;
    objc_initWeak(&location, self->_optInSplashScreen);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __41__PSUICarrierSpaceGroup_showConsentFlow___block_invoke;
    v18 = &unk_2645E10D8;
    objc_copyWeak(&v20, (id *)buf);
    objc_copyWeak(&v21, &location);
    id v19 = v7;
    [(PSUICarrierSpaceOptInSplashScreen *)self->_optInSplashScreen setContinueButtonAction:&v15];
    id v13 = objc_loadWeakRetained((id *)&self->_listController);
    uint64_t v14 = objc_msgSend(v13, "navigationController", v15, v16, v17, v18);
    [v14 pushViewController:self->_optInSplashScreen animated:1];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

void __41__PSUICarrierSpaceGroup_showConsentFlow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained showTermsAndConditions:v2 consentFlowInfo:*(void *)(a1 + 32)];
}

- (void)showTermsAndConditions:(id)a3 consentFlowInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSUICarrierSpaceGroup *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Showing carrier terms and conditions", buf, 2u);
  }

  uint64_t v9 = [v7 webURL];
  if ([v9 length])
  {
    uint64_t v10 = [NSURL URLWithString:v9];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    __int16 v11 = (void *)_MergedGlobals_63;
    uint64_t v39 = _MergedGlobals_63;
    if (!_MergedGlobals_63)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      v33 = __getRemoteUIControllerClass_block_invoke;
      v34 = &unk_2645E0D98;
      v35 = &v36;
      __getRemoteUIControllerClass_block_invoke((uint64_t)buf);
      __int16 v11 = (void *)v37[3];
    }
    __int16 v12 = v11;
    _Block_object_dispose(&v36, 8);
    id v13 = (RemoteUIController *)objc_alloc_init(v12);
    remoteUIController = self->_remoteUIController;
    self->_remoteUIController = v13;

    [(RemoteUIController *)self->_remoteUIController setDelegate:self];
    [(RemoteUIController *)self->_remoteUIController setHostViewController:v6];
    uint64_t v15 = self->_remoteUIController;
    uint64_t v16 = +[PSUICarrierSpaceManager getNSURLSessionConfiguration];
    [(RemoteUIController *)v15 setSessionConfiguration:v16];

    uint64_t v17 = [MEMORY[0x263F82670] currentDevice];
    LODWORD(v16) = objc_msgSend(v17, "sf_isInternalInstall");

    if (v16)
    {
      v18 = [(RemoteUIController *)self->_remoteUIController loader];
      [v18 setAllowNonSecureHTTP:1];
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    id v19 = self->_remoteUIController;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke;
    v29[3] = &unk_2645E1100;
    v29[4] = self;
    objc_copyWeak(&v30, (id *)buf);
    [(RemoteUIController *)v19 setHandlerForElementName:@"agree" handler:v29];
    id v20 = self->_remoteUIController;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_65;
    v27[3] = &unk_2645E1100;
    v27[4] = self;
    objc_copyWeak(&v28, (id *)buf);
    [(RemoteUIController *)v20 setHandlerForElementName:@"disagree" handler:v27];
    id v21 = self->_remoteUIController;
    v22 = [v7 postData];
    v23 = [v22 dataUsingEncoding:4];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_66;
    v25[3] = &unk_2645E1128;
    v25[4] = self;
    v24 = v10;
    objc_super v26 = v24;
    [(RemoteUIController *)v21 loadURL:v24 postBody:v23 completion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v24 = [(PSUICarrierSpaceGroup *)self getLogger];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v24, OS_LOG_TYPE_DEFAULT, "No carrier space consent url", buf, 2u);
    }
  }
}

void __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "Agree pressed for carrier terms and conditions", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained agreePressed];

  id v4 = +[PSUICarrierSpaceManager sharedManager];
  [v4 setUserConsent:1];
}

void __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_65(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "Disagree pressed for carrier terms and conditions", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained disagreeOrCancelPressed];

  id v4 = +[PSUICarrierSpaceManager sharedManager];
  [v4 setUserConsent:0];
}

void __64__PSUICarrierSpaceGroup_showTermsAndConditions_consentFlowInfo___block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      v8 = [NSNumber numberWithBool:a2];
      int v9 = 138412802;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      __int16 v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Could not load consent url: %@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)openURLWithSpecifier:(id)a3
{
  v3 = NSURL;
  id v4 = [a3 propertyForKey:@"url"];
  id v5 = [v3 URLWithString:v4];

  [(id)*MEMORY[0x263F83300] openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)agreePressed
{
  v3 = [(PSUICarrierSpaceGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Agree pressed", v10, 2u);
  }

  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)p_listController);
  id v6 = [WeakRetained navigationController];
  [v6 dismissViewControllerAnimated:1 completion:0];

  id v7 = objc_loadWeakRetained((id *)p_listController);
  v8 = [v7 navigationController];
  id v9 = (id)[v8 popViewControllerAnimated:0];
}

- (void)disagreeOrCancelPressed
{
  v3 = [(PSUICarrierSpaceGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Disagree or cancel pressed", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v5 = [WeakRetained navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F824A8];
  id v6 = a4;
  id v9 = (id)[[v5 alloc] initWithBarButtonSystemItem:1 target:self action:sel_disagreeOrCancelPressed];
  id v7 = [v6 topViewController];

  v8 = [v7 navigationItem];
  [v8 setLeftBarButtonItem:v9 animated:0];
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "statusCode", a3) == 200;
  id v5 = +[PSUICarrierSpaceManager sharedManager];
  [v5 userConsentAcknowledged:v4];
}

- (id)specifierForID:(id)a3
{
  return [(NSDictionary *)self->_specifersByID valueForKey:a3];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CSGroup" instance:self->_instance];
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)parentSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setParentSpecifier:(id)a3
{
}

- (CTCarrierSpaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (PSUICarrierSpaceOptInSplashScreen)optInSplashScreen
{
  return self->_optInSplashScreen;
}

- (void)setOptInSplashScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInSplashScreen, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_specifersByID, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end