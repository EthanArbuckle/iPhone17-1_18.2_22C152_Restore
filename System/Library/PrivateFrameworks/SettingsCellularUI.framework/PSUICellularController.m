@interface PSUICellularController
- (BOOL)_shouldShowCarrierItemGroup;
- (BOOL)deviceIsDualSIMCapableAndPlansExist;
- (BOOL)eSIMExistsInSubscriptionContexts;
- (BOOL)isCellularDisabled;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4;
- (BOOL)shouldShowAddPlanButton;
- (BOOL)shouldShowDataPlans;
- (BOOL)shouldShowFaceTimeSetup;
- (BOOL)shouldShowNoSIMsOrActivatePlansUI;
- (BOOL)shouldShowPendingInstallPlan;
- (BOOL)shouldShowPrivateNetworkPlansList;
- (BOOL)shouldUpdateHeaderForSIM;
- (BOOL)showDataPlanOnly;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CoreTelephonyClient)coreTelephonyClient;
- (PSUIAddOnPlanGroup)addOnPlanGroup;
- (PSUICarrierItemGroup)carrierItemGroup;
- (PSUICellularController)init;
- (PSUICellularDataPlanDetailGroup)cellularDataPlanDetailGroup;
- (PSUICellularDataPlanListGroup)cellularDataPlanListGroup;
- (PSUICellularPlanListGroup)cellularPlanListGroup;
- (PSUICellularPlanListGroup)privateNetworkPlanListGroup;
- (PSUIDeferredDeepLink)deferredDeepLink;
- (PSUIMiscOptionsGroup)miscOptionsGroup;
- (PSUIOtherOptionsGroup)otherOptionsGroup;
- (PSUIPendingInstallPlanGroup)pendingInstallPlanGroup;
- (PSUIPlanPendingTransferListGroup)planPendingTransferGroup;
- (PSUIQRCodeGroup)QRCodeGroup;
- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus;
- (PSUITopAppUsageGroup)topAppUsageGroup;
- (TSSIMSetupFlow)flow;
- (id)QRCodeGroupSpecifier;
- (id)_createESIMCardDataAlert:(id)a3;
- (id)_deadTelephonySpecifiers;
- (id)accountStore;
- (id)activeDataPlanCarrierName;
- (id)activeDataPlanLabel;
- (id)addOnPlanGroupSpecifier;
- (id)carrierItemGroupSpecifier;
- (id)cellularDataOptionsDetailText:(id)a3;
- (id)cellularPlacardSpecifier;
- (id)createPersonalHotspotSpecifier;
- (id)getLogger;
- (id)getTetheringStatus:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)topAppUsageGroupTitle;
- (id)transferPlanGroupSpecifier;
- (void)_maybeAddCrossPlatformSIMTransferSpecifier:(id)a3 toGroup:(id)a4;
- (void)addLocationFooterIfNecessary:(id)a3;
- (void)airplaneModeChanged;
- (void)carrierItemsChanged;
- (void)cellularDataSettingChanged;
- (void)cellularPlanChanged:(id)a3;
- (void)configureAddOnPlanTurnOnWifi:(id)a3;
- (void)createAddCellularPlanSpecifierIfNeeded;
- (void)createAddOnPlanGroupIfNeeded:(id)a3 showAddOnPlans:(BOOL)a4;
- (void)createCarrierItemGroupIfNeeded:(id)a3 showCarrierItems:(BOOL)a4;
- (void)createOrUpdateSubscriptionContextMenuGroup:(id)a3;
- (void)createQRCodeGroupIfNeeded:(id)a3;
- (void)createTransferPlanGroupIfNeeded:(id)a3;
- (void)dealloc;
- (void)didModifyStatisticsSetting;
- (void)didResetStatistics;
- (void)disableSpecifiersIfNeeded:(id)a3;
- (void)emitNavigationEvent;
- (void)entitlementStatusChanged;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)launchAddeSIMFlow;
- (void)launchDeferredDeepLinkIfNeeded;
- (void)launchTravelEducationFlow:(id)a3;
- (void)learnMoreLinkTapped;
- (void)newCarrierNotification;
- (void)perAppNetworkDataAccessPolicyChanged;
- (void)prefetchResourcesFor:(id)a3;
- (void)retryCarrierListFetch:(id)a3;
- (void)setAddOnPlanGroup:(id)a3;
- (void)setCarrierItemGroup:(id)a3;
- (void)setCellularDataPlanDetailGroup:(id)a3;
- (void)setCellularDataPlanListGroup:(id)a3;
- (void)setCellularPlanListGroup:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDeferredDeepLink:(id)a3;
- (void)setFlow:(id)a3;
- (void)setMiscOptionsGroup:(id)a3;
- (void)setOtherOptionsGroup:(id)a3;
- (void)setPendingInstallPlanGroup:(id)a3;
- (void)setPlanPendingTransferGroup:(id)a3;
- (void)setPrivateNetworkPlanListGroup:(id)a3;
- (void)setQRCodeGroup:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)setSubscriptionContextAndPlanProperties;
- (void)setSubscriptionContextMenus:(id)a3;
- (void)setTopAppUsageGroup:(id)a3;
- (void)setUpActivationSpecifiers:(id)a3;
- (void)setUpAddPlanGroup:(id)a3;
- (void)setUpCellularDataOptionsGroup:(id)a3;
- (void)setUpCellularDiagnosticsGroup:(id)a3;
- (void)setUpCellularListGroup:(id)a3;
- (void)setUpDataOnlyPlanListGroupIfNeeded:(id)a3;
- (void)setUpDefaultVoiceGroup:(id)a3;
- (void)setUpFacetimeSetupGroup:(id)a3;
- (void)setUpMiscOptionsGroup:(id)a3;
- (void)setUpPlanPendingTransferListGroup:(id)a3;
- (void)setUpPrivateNetworkListGroup:(id)a3;
- (void)setUpSubscriptionContextMenusGroup:(id)a3;
- (void)setUpTopAppUsageGroup:(id)a3;
- (void)setupCellularFaceTime:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)turnOnLocationServicesPressed:(id)a3;
- (void)turnOnWifiPressed:(id)a3;
- (void)updatePaneWithCellularDataState:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)wirelessDataUsageCacheRefreshed;
- (void)wirelessDataUsageChangedNotification;
@end

@implementation PSUICellularController

- (PSUICellularController)init
{
  v31.receiver = self;
  v31.super_class = (Class)PSUICellularController;
  v2 = [(PSUICellularController *)&v31 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v4 = [v3 initWithQueue:MEMORY[0x263EF83A0]];
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v4;

    [(CoreTelephonyClient *)v2->_coreTelephonyClient setDelegate:v2];
    v6 = [PSUIAppsAndCategoriesDataUsageSubgroup alloc];
    v7 = [MEMORY[0x263F67EE0] sharedInstance];
    v8 = [(PSUIAppsAndCategoriesDataUsageSubgroup *)v6 initWithPolicySpecifierDelegate:v2 statisticsCache:v7];

    v9 = [PSUITopAppUsageGroup alloc];
    v10 = [MEMORY[0x263F67ED0] sharedInstance];
    v11 = [MEMORY[0x263F67EE0] sharedInstance];
    v12 = +[PSUICarrierSpaceManager sharedManager];
    uint64_t v13 = [(PSUITopAppUsageGroup *)v9 initWithHostController:v2 cellularManagementCache:v10 dataUsageStatisticsCache:v11 carrierSpaceManager:v12 appsAndCategoriesSubgroup:v8];
    topAppUsageGroup = v2->_topAppUsageGroup;
    v2->_topAppUsageGroup = (PSUITopAppUsageGroup *)v13;

    v15 = [MEMORY[0x263F67EE0] sharedInstance];
    [v15 refreshCacheIfNeeded];

    v30.receiver = v2;
    v30.super_class = (Class)PSUICellularController;
    [(PSUICellularController *)&v30 setPrefetchingEnabled:1];
    v16 = +[PSUICarrierSpaceManager sharedManager];
    [v16 refresh];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v2 selector:sel_newCarrierNotification name:@"PSNewCarrierNotification" object:0];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v2 selector:sel_entitlementStatusChanged name:*MEMORY[0x263F3BAE8] object:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v2 selector:sel_cellularPlanChanged_ name:@"PSUICellularPlanChanged" object:0];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:v2 selector:sel_wirelessDataUsageChangedNotification name:*MEMORY[0x263F67F20] object:0];

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v2 selector:sel_carrierItemsChanged name:*MEMORY[0x263F31918] object:0];

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v2 selector:sel_cellularDataSettingChanged name:0x26D4164C0 object:0];

    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v2 selector:sel_airplaneModeChanged name:0x26D4164E0 object:0];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v2 selector:sel_perAppNetworkDataAccessPolicyChanged name:*MEMORY[0x263F67F08] object:0];

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v2 selector:sel_wirelessDataUsageCacheRefreshed name:*MEMORY[0x263F67F18] object:0];

    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"CELLULAR_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
    v28 = [(PSUICellularController *)v2 navigationItem];
    [v28 setBackButtonTitle:v27];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularController;
  [(PSUICellularController *)&v4 dealloc];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  [v4 setName:0];
  v5.receiver = self;
  v5.super_class = (Class)PSUICellularController;
  [(PSUICellularController *)&v5 setSpecifier:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PSUICellularController viewWillAppear:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)PSUICellularController;
  [(PSUICellularController *)&v9 viewWillAppear:v3];
  [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus viewWillAppear];
  v6 = [MEMORY[0x263F31978] sharedManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__PSUICellularController_viewWillAppear___block_invoke;
  v8[3] = &unk_2645E1188;
  v8[4] = self;
  [v6 startProvisioningWithCompletion:v8];

  v7 = +[PSUICellularPlanManagerCache sharedInstance];
  [v7 clearCachedCarrierItemsAndRemotePlans];

  [(PSUICellularController *)self reloadSpecifiers];
}

void __41__PSUICellularController_viewWillAppear___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"failed";
    if (a2) {
      id v4 = @"succeeded";
    }
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "provisioning start: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PSUICellularController;
  [(PSUICellularController *)&v11 viewDidAppear:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = 0;
LABEL_9:
    [(PSUICellularController *)self emitNavigationEvent];
    goto LABEL_10;
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  id v10 = 0;
  int v5 = [(CoreTelephonyClient *)coreTelephonyClient needToLaunchSetUpeSIM:&v10];
  id v6 = v10;
  if (v5)
  {
    if ([v5 BOOLValue])
    {
      uint64_t v7 = [(PSUICellularController *)self getLogger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Need to launch Set Up eSIM", buf, 2u);
      }

      v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 postNotificationName:@"PSUICellularPlanSetUpNeeded" object:0 userInfo:0];
    }
    goto LABEL_9;
  }
  objc_super v9 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Error with checking setup eSIM: %@", buf, 0xCu);
  }

LABEL_10:
}

- (void)willMoveToParentViewController:(id)a3
{
  if (!a3)
  {
    int v5 = [(PSUICellularController *)self parentViewController];
    id v6 = [v5 navigationItem];
    [v6 setTitleView:0];

    id v7 = [(PSUICellularController *)self navigationItem];
    [v7 setTitleView:0];
  }
}

- (void)emitNavigationEvent
{
  id v10 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Cellular"];
  id v3 = objc_alloc(MEMORY[0x263F08DB0]);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"CELLULAR_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  objc_super v9 = (void *)[v3 initWithKey:v5 table:0 locale:v6 bundleURL:v8];

  [(PSUICellularController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.cellular-settings" title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v10];
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (([v9 isEqualToString:@"CELLULAR"] & 1) != 0
    || ([*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:v9], uint64_t v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v14 = [[PSUIDeferredDeepLink alloc] initWithSpecifierID:v9 resourceDictionary:v10 completion:v11];
    [(PSUICellularController *)self setDeferredDeepLink:v14];

    BOOL v13 = 0;
  }

  return v13;
}

- (void)launchDeferredDeepLinkIfNeeded
{
  uint64_t v3 = [(PSUICellularController *)self deferredDeepLink];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    id v6 = [(PSUICellularController *)self deferredDeepLink];
    id v7 = [v6 specifierID];
    v8 = [v5 specifierForID:v7];

    if (v8)
    {
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3032000000;
      v10[3] = __Block_byref_object_copy__1;
      v10[4] = __Block_byref_object_dispose__1;
      id v11 = 0;
      id v11 = [(PSUICellularController *)self deferredDeepLink];
      [(PSUICellularController *)self setDeferredDeepLink:0];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __56__PSUICellularController_launchDeferredDeepLinkIfNeeded__block_invoke;
      v9[3] = &unk_2645E11B0;
      v9[4] = self;
      v9[5] = v10;
      dispatch_async(MEMORY[0x263EF83A0], v9);
      _Block_object_dispose(v10, 8);
    }
  }
}

void __56__PSUICellularController_launchDeferredDeepLinkIfNeeded__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) resourceDictionary];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) completion];
  [v2 handleURL:v4 withCompletion:v3];
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"type"];
  if ([v8 isEqualToString:@"travelEducation"])
  {
    BOOL v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PSUICellularController;
    BOOL v9 = [(PSUICellularController *)&v11 shouldDeferPushForSpecifierID:v6 urlDictionary:v7];
  }

  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICellularController handleURL:withCompletion:]";
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  BOOL v9 = [(PSUICellularController *)self viewIfLoaded];
  id v10 = [v9 window];

  if (v10)
  {
    objc_super v11 = [v6 objectForKeyedSubscript:@"type"];
    if ([v11 isEqualToString:@"travelEducation"])
    {
      uint64_t v12 = [v6 objectForKeyedSubscript:@"client"];
      char v13 = [v12 isEqualToString:@"com.apple.CommCenter"];

      uint64_t v14 = [(PSUICellularController *)self getLogger];
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "launching SIMSetup Travel Education Flow", buf, 2u);
        }

        [(PSUICellularController *)self launchTravelEducationFlow:v6];
        goto LABEL_23;
      }
      if (!v15) {
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      v18 = "invalid travel education client";
    }
    else
    {
      if (+[SettingsCellularUtils isCaseInsensitiveEqual:v11 withString:@"esim_qrcode_provisioning"])
      {
        v16 = [v6 objectForKeyedSubscript:@"carddata"];
        if ([v16 length])
        {
          coreTelephonyClient = self->_coreTelephonyClient;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __51__PSUICellularController_handleURL_withCompletion___block_invoke;
          v26[3] = &unk_2645E11F8;
          v26[4] = self;
          [(CoreTelephonyClient *)coreTelephonyClient getActionForCardData:v16 completionHandler:v26];
          v7[2](v7);
        }
        else
        {
          v22 = [(PSUICellularController *)self getLogger];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_221B17000, v22, OS_LOG_TYPE_DEFAULT, "Emtpy eSIM QR code data", buf, 2u);
          }

          v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
          v24 = [(PSUICellularController *)self _createESIMCardDataAlert:v23];

          [(PSUICellularController *)self presentViewController:v24 animated:1 completion:0];
          v7[2](v7);
        }
        goto LABEL_28;
      }
      if (![v11 isEqualToString:@"addeSIM"]) {
        goto LABEL_22;
      }
      v19 = [v6 objectForKeyedSubscript:@"client"];
      char v20 = [v19 isEqualToString:@"com.apple.Siri"];

      uint64_t v14 = [(PSUICellularController *)self getLogger];
      BOOL v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "launching add eSIM Flow", buf, 2u);
        }

        [(PSUICellularController *)self launchAddeSIMFlow];
        goto LABEL_23;
      }
      if (!v21)
      {
LABEL_16:

LABEL_22:
        v25.receiver = self;
        v25.super_class = (Class)PSUICellularController;
        [(PSUICellularController *)&v25 handleURL:v6 withCompletion:&__block_literal_global_124];
LABEL_23:
        v7[2](v7);
LABEL_28:

        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v18 = "invalid add eSIM client";
    }
    _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    goto LABEL_16;
  }
  v27.receiver = self;
  v27.super_class = (Class)PSUICellularController;
  [(PSUICellularController *)&v27 handleURL:v6 withCompletion:v7];
LABEL_29:
}

void __51__PSUICellularController_handleURL_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) getLogger];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "getActionForCardData callback: Success - %@", (uint8_t *)&v10, 0xCu);
    }

    [v5 performWithCompletionHandler:&__block_literal_global_12];
  }
  else
  {
    if (v8)
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Failed getActionForCardData with error %@", (uint8_t *)&v10, 0xCu);
    }

    BOOL v9 = [*(id *)(a1 + 32) _createESIMCardDataAlert:v6];
    [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
  }
}

- (id)_createESIMCardDataAlert:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ESIM_ACTIVATION_FAILED_ACTION_TITLE" value:&stru_26D410CA0 table:@"Cellular"];

  if ([v3 code] == 22)
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = v6;
    BOOL v8 = @"ESIM_ACTIVATION_FAILED_PARSE_MESSAGE";
  }
  else if ([v3 code] == 19)
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = v6;
    BOOL v8 = @"ESIM_ACTIVATION_DEVICE_NOT_SUPPORTED_MESSAGE";
  }
  else
  {
    uint64_t v9 = [v3 code];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = v6;
    if (v9 == 45) {
      BOOL v8 = @"ESIM_ACTIVATION_POLICY_MISMATCH_MESSAGE";
    }
    else {
      BOOL v8 = @"ESIM_ACTIVATION_FAILED_ACTION_MESSAGE";
    }
  }
  int v10 = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"Cellular"];

  id v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v5 message:v10 preferredStyle:1];
  uint64_t v12 = (void *)MEMORY[0x263F82400];
  char v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v14 = [v13 localizedStringForKey:@"OK_BUTTON" value:&stru_26D410CA0 table:@"Cellular"];
  BOOL v15 = [v12 actionWithTitle:v14 style:2 handler:&__block_literal_global_147];

  [v11 addAction:v15];
  return v11;
}

- (void)learnMoreLinkTapped
{
  v2 = (void *)*MEMORY[0x263F83300];
  id v3 = NSURL;
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v6 localizedStringForKey:@"LEARN_MORE_AT_LINK" value:&stru_26D410CA0 table:@"Cellular"];
  id v5 = [v3 URLWithString:v4];
  [v2 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (id)_deadTelephonySpecifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[PSUICellularController _deadTelephonySpecifiers]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v17, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(PSUICellularController *)self setUpCellularDiagnosticsGroup:v4];
  if (![v4 count])
  {
    id v5 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_221B17000, v5, OS_LOG_TYPE_ERROR, "No Cellular Diagnostics. Fall back", (uint8_t *)&v17, 2u);
    }

    id v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"UPDATE_REQUIRED_FOR_CELLULAR"];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = [v7 localizedStringForKey:@"UPDATE_REQUIRED_FOR_CELLULAR" value:&stru_26D410CA0 table:@"Cellular"];
    [v6 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

    [v6 setProperty:&unk_26D425ED0 forKey:*MEMORY[0x263F600B8]];
    uint64_t v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"LEARN_MORE_AT"];
    int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"LEARN_MORE" value:&stru_26D410CA0 table:@"Cellular"];

    [v9 setProperty:v11 forKey:*MEMORY[0x263F600E8]];
    v21.location = [v11 rangeOfString:v11];
    uint64_t v12 = NSStringFromRange(v21);
    [v9 setProperty:v12 forKey:*MEMORY[0x263F600D0]];

    char v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v9 setProperty:v14 forKey:*MEMORY[0x263F600C0]];

    [v9 setProperty:&unk_26D425ED0 forKey:*MEMORY[0x263F5FEF0]];
    BOOL v15 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v9 setProperty:v15 forKey:*MEMORY[0x263F600E0]];

    [v9 setProperty:@"learnMoreLinkTapped" forKey:*MEMORY[0x263F600C8]];
    [v4 addObject:v6];
    [v4 addObject:v9];
  }
  return v4;
}

- (void)retryCarrierListFetch:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PSUICellularController retryCarrierListFetch:]";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[PSUICellularPlanManagerCache sharedInstance];
  [v5 clearCachedCarrierItemsAndRemotePlans];

  [(PSUICellularController *)self reloadSpecifiers];
}

- (void)turnOnLocationServicesPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 URL];
    int v9 = 136315394;
    int v10 = "-[PSUICellularController turnOnLocationServicesPressed:]";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v8 = [v4 URL];
  [v7 openSensitiveURL:v8 withOptions:0];
}

- (void)turnOnWifiPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 URL];
    int v9 = 136315394;
    int v10 = "-[PSUICellularController turnOnWifiPressed:]";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v8 = [v4 URL];
  [v7 openSensitiveURL:v8 withOptions:0];
}

- (id)specifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[PSUICellularController specifiers]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4))
  {
    id v5 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[PSUICellularController specifiers]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", (uint8_t *)&v18, 0xCu);
    }

    if (PSIsTelephonyDead())
    {
      int v6 = [(PSUICellularController *)self _deadTelephonySpecifiers];
      id v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v6;

      goto LABEL_25;
    }
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v9 = [(PSUICellularController *)self cellularPlacardSpecifier];
    if (v9)
    {
      int v10 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PLACARD_GROUP"];
      [v8 addObject:v10];
      objc_msgSend(v8, "ps_addSpecifier:toGroup:", v9, v10);
    }
    [(PSUICellularController *)self setUpCellularDiagnosticsGroup:v8];
    BOOL v11 = [(PSUICellularController *)self shouldShowNoSIMsOrActivatePlansUI];
    uint64_t v12 = [(PSUICellularController *)self getLogger];
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v18 = 136315138;
        uint64_t v19 = "-[PSUICellularController specifiers]";
        _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s Setting up the no SIMs or activated plans specifiers", (uint8_t *)&v18, 0xCu);
      }

      [(PSUICellularController *)self setUpActivationSpecifiers:v8];
      if (+[SettingsCellularUtils shouldShowPendingTransferPlanOnPad])
      {
        [(PSUICellularController *)self setUpPlanPendingTransferListGroup:v8];
      }
    }
    else
    {
      if (v13)
      {
        int v18 = 136315138;
        uint64_t v19 = "-[PSUICellularController specifiers]";
        _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s plan items count is non-zero; continuing with normal specifier layout",
          (uint8_t *)&v18,
          0xCu);
      }

      [(PSUICellularController *)self setUpCellularDataOptionsGroup:v8];
      [(PSUICellularController *)self setUpDefaultVoiceGroup:v8];
      if (+[SettingsCellularUtils isUIDualSIM])
      {
        [(PSUICellularController *)self setUpCellularListGroup:v8];
        [(PSUICellularController *)self setUpPrivateNetworkListGroup:v8];
      }
      else
      {
        uint64_t v14 = [(PSUICellularController *)self getLogger];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315138;
          uint64_t v19 = "-[PSUICellularController specifiers]";
          _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "%s showing single sim specifiers", (uint8_t *)&v18, 0xCu);
        }

        [(PSUICellularController *)self setUpDataOnlyPlanListGroupIfNeeded:v8];
        [(PSUICellularController *)self setSubscriptionContextAndPlanProperties];
        [(PSUICellularController *)self setUpSubscriptionContextMenusGroup:v8];
        [(PSUICellularController *)self setUpAddPlanGroup:v8];
      }
      [(PSUICellularController *)self setUpFacetimeSetupGroup:v8];
      [(PSUICellularController *)self setUpTopAppUsageGroup:v8];
      [(PSUICellularController *)self setUpMiscOptionsGroup:v8];
    }
    [(PSUICellularController *)self disableSpecifiersIfNeeded:v8];
    [MEMORY[0x263F67F00] logSpecifiers:v8 origin:@"[PSUICellularController specifiers] end"];
    BOOL v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)v8;
  }
  [(PSUICellularController *)self launchDeferredDeepLinkIfNeeded];
LABEL_25:
  v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  return v16;
}

- (id)cellularPlacardSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CELLULAR_PLACARD" value:&stru_26D410CA0 table:@"Cellular"];
  int v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v6 setProperty:NSClassFromString(&cfstr_Settingscellul_4.isa) forKey:*MEMORY[0x263F5FFE0]];
  [v6 setIdentifier:@"CELLULAR_PLACARD"];
  return v6;
}

- (void)setUpActivationSpecifiers:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = 136315138;
    v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v48, 0xCu);
  }

  int v6 = _os_feature_enabled_impl();
  if (v6 && [(PSUICellularController *)self shouldShowPendingInstallPlan])
  {
    id v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PENDING_INSTALL_GROUP"];
    [v4 addObject:v7];
    id v8 = [[PSUIPendingInstallPlanGroup alloc] initWithListController:self groupSpecifier:v7];
    [(PSUICellularController *)self setPendingInstallPlanGroup:v8];

    int v9 = [(PSUICellularController *)self pendingInstallPlanGroup];
    int v10 = [v9 specifiers];
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v10, v7);

    BOOL v11 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"OTHER_OPTIONS_GROUP"];
    [v4 addObject:v11];
    uint64_t v12 = [[PSUIOtherOptionsGroup alloc] initWithListController:self groupSpecifier:v11];
    [(PSUICellularController *)self setOtherOptionsGroup:v12];

    BOOL v13 = [(PSUICellularController *)self otherOptionsGroup];
LABEL_37:
    v46 = v13;
    v47 = [v13 specifiers];
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v47, v11);

    goto LABEL_38;
  }
  if (![(PSUICellularController *)self deviceIsDualSIMCapableAndPlansExist])
  {
    if (![(PSUICellularController *)self shouldShowAddPlanButton])
    {
      id v7 = 0;
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  uint64_t v14 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v48 = 136315138;
    v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
    _os_log_debug_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEBUG, "%s device is dual sim capable, and plan items count is non-zero", (uint8_t *)&v48, 0xCu);
  }

  BOOL v15 = (void *)MEMORY[0x263F5FC40];
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v17 = [v16 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
  id v7 = [v15 groupSpecifierWithName:v17];

  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  [v4 addObject:v7];
  int v18 = [[PSUICellularPlanListGroup alloc] initWithListController:self groupSpecifier:v7 isPrivateNetworkPlansList:0];
  cellularPlanListGroup = self->_cellularPlanListGroup;
  self->_cellularPlanListGroup = v18;

  uint64_t v20 = [(PSUICellularPlanListGroup *)self->_cellularPlanListGroup specifiers];
  objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v20, v7);

  [(PSUICellularController *)self setUpPrivateNetworkListGroup:v4];
  if ([(PSUICellularController *)self shouldShowAddPlanButton])
  {
    if (v7)
    {
LABEL_16:
      [(PSUICellularController *)self createAddCellularPlanSpecifierIfNeeded];
      objc_msgSend(v4, "ps_addSpecifier:toGroup:", self->_addCellularPlanSpecifier, v7);
      [(PSUICellularController *)self addLocationFooterIfNecessary:v7];
      goto LABEL_18;
    }
LABEL_13:
    NSRange v21 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v48 = 136315138;
      v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
      _os_log_debug_impl(&dword_221B17000, v21, OS_LOG_TYPE_DEBUG, "%s device is not dual sim capable, or plan items count is zero; showing separate add cellular plan group",
        (uint8_t *)&v48,
        0xCu);
    }

    id v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADD_CELLULAR_PLAN_GROUP"];
    [v4 addObject:v7];
    goto LABEL_16;
  }
LABEL_18:
  v22 = [MEMORY[0x263F82670] currentDevice];
  int v23 = objc_msgSend(v22, "sf_isiPad");

  if (v23)
  {
    if (!v7)
    {
      id v7 = [(PSUICellularController *)self transferPlanGroupSpecifier];
      [(PSUICellularController *)self createTransferPlanGroupIfNeeded:v7];
      v24 = [(PSUICellularController *)self planPendingTransferGroup];
      objc_super v25 = [v24 specifiers];
      uint64_t v26 = [v25 count];

      if (v26)
      {
        [v4 addObject:v7];
        objc_super v27 = [(PSUICellularController *)self planPendingTransferGroup];
        v28 = [v27 specifiers];
        objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v28, v7);
      }
    }
  }
  v29 = [MEMORY[0x263F82670] currentDevice];
  int v30 = objc_msgSend(v29, "sf_isiPad");

  if (v30)
  {
    objc_super v31 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v48 = 136315138;
      v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
      _os_log_debug_impl(&dword_221B17000, v31, OS_LOG_TYPE_DEBUG, "%s showing add on plan group", (uint8_t *)&v48, 0xCu);
    }

    v32 = [(PSUICellularController *)self addOnPlanGroupSpecifier];
    [v4 addObject:v32];
    [(PSUICellularController *)self createAddOnPlanGroupIfNeeded:v32 showAddOnPlans:v6 ^ 1u];
    v33 = [(PSUICellularController *)self addOnPlanGroup];
    v34 = [v33 specifiers];
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v34, v32);

    if (((v6 ^ 1) & 1) == 0)
    {
      v35 = [(PSUICellularController *)self addOnPlanGroup];
      v36 = [v35 specifiers];
      uint64_t v37 = [v36 count];

      if (!v37) {
        [v4 removeObject:v32];
      }
    }
  }
  v38 = +[PSUICellularPlanManagerCache sharedInstance];
  int v39 = [v38 isCarrierItemFlowSupported];

  if (v39)
  {
    v40 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      int v48 = 136315138;
      v49 = "-[PSUICellularController setUpActivationSpecifiers:]";
      _os_log_debug_impl(&dword_221B17000, v40, OS_LOG_TYPE_DEBUG, "%s showing add new network group", (uint8_t *)&v48, 0xCu);
    }

    v41 = [(PSUICellularController *)self carrierItemGroupSpecifier];
    [(PSUICellularController *)self createCarrierItemGroupIfNeeded:v41 showCarrierItems:v6 ^ 1u];
    if ([(PSUICellularController *)self _shouldShowCarrierItemGroup])
    {
      [v4 addObject:v41];
      v42 = [(PSUICellularController *)self carrierItemGroup];
      v43 = [v42 specifiers];
      objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v43, v41);
    }
  }
  v44 = [MEMORY[0x263F82670] currentDevice];
  int v45 = objc_msgSend(v44, "sf_isiPad");

  if (v45)
  {
    BOOL v11 = [(PSUICellularController *)self QRCodeGroupSpecifier];
    [v4 addObject:v11];
    [(PSUICellularController *)self createQRCodeGroupIfNeeded:v11];
    BOOL v13 = [(PSUICellularController *)self QRCodeGroup];
    goto LABEL_37;
  }
LABEL_38:
}

- (void)setUpCellularDiagnosticsGroup:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PSUICellularDiagnosticsSpecifier);
  if ([(PSUICellularDiagnosticsSpecifier *)v5 cellularIssueFound])
  {
    int v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_DIAGNOSTICS_GROUP"];
    [v4 addObject:v6];
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", v5, v6);
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_GROUP_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];
    [v6 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
  }
  else
  {
    int v6 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Cellular Diagnostics: No cellular issue detected and not add Diagnostics menu", v9, 2u);
    }
  }
}

- (void)setUpCellularDataOptionsGroup:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = "-[PSUICellularController setUpCellularDataOptionsGroup:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s showing cellular data options group", buf, 0xCu);
  }

  int v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_DATA_OPTIONS_GROUP"];
  [v4 addObject:v6];
  id v7 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v8 = [v7 isAnyPlanActivating] ^ 1;

  int v9 = [[PSUICellularDataSpecifier alloc] initWithHostController:self];
  int v10 = [NSNumber numberWithBool:v8];
  uint64_t v11 = *MEMORY[0x263F600A8];
  [(PSUICellularDataSpecifier *)v9 setProperty:v10 forKey:*MEMORY[0x263F600A8]];

  objc_msgSend(v4, "ps_addSpecifier:toGroup:", v9, v6);
  if (!+[SettingsCellularUtils isUIDualSIM])
  {
    uint64_t v12 = +[PSUICellularPlanManagerCache sharedInstance];
    BOOL v13 = [v12 selectedPlanItem];

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x263F5FC40];
      BOOL v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"CELLULAR_DATA_OPTIONS" value:&stru_26D410CA0 table:@"Cellular"];
      int v17 = [v14 preferenceSpecifierNamed:v16 target:self set:0 get:sel_cellularDataOptionsDetailText_ detail:objc_opt_class() cell:2 edit:0];

      [v17 setIdentifier:@"CELLULAR_DATA_OPTIONS"];
      int v18 = [NSNumber numberWithBool:v8];
      [v17 setProperty:v18 forKey:v11];

      [v17 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      objc_msgSend(v4, "ps_addSpecifier:toGroup:", v17, v6);
    }
  }
  uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v20 = SFLocalizableWAPIStringKeyForKey();
  NSRange v21 = [v19 localizedStringForKey:v20 value:&stru_26D410CA0 table:@"Cellular"];

  [v6 setProperty:v21 forKey:*MEMORY[0x263F600F8]];
  v22 = [(PSUICellularController *)self createPersonalHotspotSpecifier];
  personalHotspotSpecifier = self->_personalHotspotSpecifier;
  self->_personalHotspotSpecifier = v22;

  v24 = self->_personalHotspotSpecifier;
  if (v24) {
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", v24, v6);
  }
}

- (void)setUpDefaultVoiceGroup:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[SettingsCellularUtils isUIDualSIM])
  {
    id v5 = +[PSUICellularPlanManagerCache sharedInstance];
    int v6 = [v5 planItems];
    unint64_t v7 = [v6 count];

    if (v7 >= 2)
    {
      uint64_t v8 = [(PSUICellularController *)self getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        uint64_t v12 = "-[PSUICellularController setUpDefaultVoiceGroup:]";
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s showing default voice group", (uint8_t *)&v11, 0xCu);
      }

      int v9 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DEFAULT_VOICE_LINE"];
      [v4 addObject:v9];
      id v10 = [[PSUIDefaultVoiceLineSpecifier alloc] initSpecifier];
      objc_msgSend(v4, "ps_addSpecifier:toGroup:", v10, v9);
    }
  }
}

- (void)setUpPlanPendingTransferListGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "showing plan pending transfer list group", v13, 2u);
  }

  int v6 = (void *)MEMORY[0x263F5FC40];
  unint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
  int v9 = [v6 groupSpecifierWithName:v8];

  [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  [v4 addObject:v9];
  id v10 = [[PSUIPlanPendingTransferListGroup alloc] initWithListController:self groupSpecifier:v9];
  planPendingTransferGroup = self->_planPendingTransferGroup;
  self->_planPendingTransferGroup = v10;

  uint64_t v12 = [(PSUIPlanPendingTransferListGroup *)self->_planPendingTransferGroup specifiers];
  objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v12, v9);
}

- (void)setUpCellularListGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    BOOL v15 = "-[PSUICellularController setUpCellularListGroup:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s showing dual sim cellular plans list group", (uint8_t *)&v14, 0xCu);
  }

  int v6 = (void *)MEMORY[0x263F5FC40];
  unint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
  int v9 = [v6 groupSpecifierWithName:v8];

  [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
  [v4 addObject:v9];
  id v10 = [[PSUICellularPlanListGroup alloc] initWithListController:self groupSpecifier:v9 isPrivateNetworkPlansList:0];
  cellularPlanListGroup = self->_cellularPlanListGroup;
  self->_cellularPlanListGroup = v10;

  uint64_t v12 = [(PSUICellularPlanListGroup *)self->_cellularPlanListGroup specifiers];
  objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v12, v9);

  uint64_t v13 = +[PSUICellularPlanManagerCache sharedInstance];
  LODWORD(v8) = [v13 isActivationCodeFlowSupported];

  if (v8)
  {
    [(PSUICellularController *)self createAddCellularPlanSpecifierIfNeeded];
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", self->_addCellularPlanSpecifier, v9);
    [(PSUICellularController *)self _maybeAddCrossPlatformSIMTransferSpecifier:v4 toGroup:v9];
  }
}

- (void)setUpPrivateNetworkListGroup:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(PSUICellularController *)self shouldShowPrivateNetworkPlansList])
  {
    id v5 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      int v17 = "-[PSUICellularController setUpPrivateNetworkListGroup:]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s showing dual sim private network plans list group", (uint8_t *)&v16, 0xCu);
    }

    int v6 = (void *)MEMORY[0x263F5FC40];
    unint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"NON_PUBLIC_NETWORK_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
    int v9 = [v6 groupSpecifierWithName:v8];

    [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    [v4 addObject:v9];
    id v10 = [[PSUICellularPlanListGroup alloc] initWithListController:self groupSpecifier:v9 isPrivateNetworkPlansList:1];
    privateNetworkPlanListGroup = self->_privateNetworkPlanListGroup;
    self->_privateNetworkPlanListGroup = v10;

    uint64_t v12 = [(PSUICellularPlanListGroup *)self->_privateNetworkPlanListGroup specifiers];
    objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v12, v9);

    uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v14 = SFLocalizableWAPIStringKeyForKey();
    BOOL v15 = [v13 localizedStringForKey:v14 value:&stru_26D410CA0 table:@"Cellular"];

    [v9 setProperty:v15 forKey:*MEMORY[0x263F600F8]];
  }
}

- (void)setUpDataOnlyPlanListGroupIfNeeded:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(PSUICellularController *)self shouldShowDataPlans])
  {
    id v5 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[PSUICellularController setUpDataOnlyPlanListGroupIfNeeded:]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s showing data plans", buf, 0xCu);
    }

    int v6 = (void *)MEMORY[0x263F5FC40];
    unint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
    int v9 = [v6 groupSpecifierWithName:v8];

    [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    id v10 = +[PSUICellularPlanManagerCache sharedInstance];
    int v11 = [v10 isAnyPlanActivating];

    uint64_t v12 = +[PSUICellularDataPlanListGroup groupWithListController:self groupSpecifier:v9];
    cellularDataPlanListGroup = self->_cellularDataPlanListGroup;
    self->_cellularDataPlanListGroup = v12;

    int v14 = [(PSUICellularDataPlanListGroup *)self->_cellularDataPlanListGroup specifiers];
    if ([v14 count])
    {
      if (v11)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          uint64_t v19 = *MEMORY[0x263F600A8];
          uint64_t v20 = MEMORY[0x263EFFA80];
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v21++), "setProperty:forKey:", v20, v19, (void)v23);
            }
            while (v17 != v21);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v17);
        }
      }
      objc_msgSend(v4, "addObject:", v9, (void)v23);
      objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v14, v9);
    }
    else
    {
      v22 = self->_cellularDataPlanListGroup;
      self->_cellularDataPlanListGroup = 0;
    }
  }
}

- (void)setSubscriptionContextAndPlanProperties
{
  id v3 = [MEMORY[0x263F67EF0] sharedInstance];
  id v22 = [v3 subscriptionsInUse];

  if ([v22 count])
  {
    id v4 = [v22 objectAtIndexedSubscript:0];
  }
  else
  {
    id v5 = [MEMORY[0x263F67EF0] sharedInstance];
    int v6 = [v5 subscriptionContexts];
    id v4 = [v6 objectAtIndexedSubscript:0];
  }
  uint64_t v7 = (int)*MEMORY[0x263F5FE98];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v7) setProperty:v4 forKey:*MEMORY[0x263F60290]];
  uint64_t v8 = +[PSUICellularPlanManagerCache sharedInstance];
  int v9 = [v8 selectedPlanItem];

  id v10 = +[PSUICellularPlanManagerCache sharedInstance];
  int v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 selectedPlanItem];

    uint64_t v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
    int v14 = +[PSUICellularPlanUniversalReference referenceFromPlanItem:v12];
    [v13 setProperty:v14 forKey:*MEMORY[0x263F5FFF0]];
  }
  else
  {
    id v15 = [v10 planItems];
    uint64_t v16 = [v15 count];

    if (v16 == 1)
    {
      uint64_t v17 = +[PSUICellularPlanManagerCache sharedInstance];
      uint64_t v18 = [v17 planItems];
      uint64_t v19 = [v18 objectAtIndexedSubscript:0];

      uint64_t v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
      uint64_t v21 = +[PSUICellularPlanUniversalReference referenceFromPlanItem:v19];
      [v20 setProperty:v21 forKey:*MEMORY[0x263F5FFF0]];
    }
    else
    {
      [*(id *)((char *)&self->super.super.super.super.super.isa + v7) removePropertyForKey:*MEMORY[0x263F5FFF0]];
    }
  }
}

- (void)setUpSubscriptionContextMenusGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F82670] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isiPhone");

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263F5FC40];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v9 = [v8 localizedStringForKey:@"CARRIER_SPACE_CARRIER" value:&stru_26D410CA0 table:@"Cellular"];
    id v10 = [v7 groupSpecifierWithID:@"SUBSCRIPTION_CONTEXT_MENUS_GROUP" name:v9];

    [(PSUICellularController *)self createOrUpdateSubscriptionContextMenuGroup:v10];
    int v11 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus specifiers];
    if ([v11 count])
    {
      uint64_t v12 = [(PSUICellularController *)self getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        int v14 = "-[PSUICellularController setUpSubscriptionContextMenusGroup:]";
        _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s showing subscription context menus group", (uint8_t *)&v13, 0xCu);
      }

      [v4 addObject:v10];
      objc_msgSend(v4, "ps_addSpecifiers:toGroup:", v11, v10);
    }
  }
}

- (void)setUpAddPlanGroup:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F67EF0] sharedInstance];
  if (([v5 isDualSimCapable] & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  int v6 = +[PSUICellularPlanManagerCache sharedInstance];
  int v7 = [v6 isActivationCodeFlowSupported];

  if (v7)
  {
    uint64_t v8 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[PSUICellularController setUpAddPlanGroup:]";
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s showing add plan group", (uint8_t *)&v9, 0xCu);
    }

    id v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADD_CELLULAR_PLAN_GROUP"];
    [v4 addObject:v5];
    [(PSUICellularController *)self createAddCellularPlanSpecifierIfNeeded];
    objc_msgSend(v4, "ps_addSpecifier:toGroup:", self->_addCellularPlanSpecifier, v5);
    [(PSUICellularController *)self _maybeAddCrossPlatformSIMTransferSpecifier:v4 toGroup:v5];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)setUpFacetimeSetupGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_facetimeSetupGroup)
  {
    id v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SETUP_FACETIME_CELLULAR_GROUP"];
    facetimeSetupGroup = self->_facetimeSetupGroup;
    self->_facetimeSetupGroup = v5;
  }
  if (!self->_facetimeSetupButton)
  {
    int v7 = (void *)MEMORY[0x263F5FC40];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v9 = [v8 localizedStringForKey:@"SETUP_FACETIME_CELLULAR" value:&stru_26D410CA0 table:@"Cellular"];
    id v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];
    facetimeSetupButton = self->_facetimeSetupButton;
    self->_facetimeSetupButton = v10;

    [(PSSpecifier *)self->_facetimeSetupButton setIdentifier:@"SETUP_FACETIME_CELLULAR"];
    [(PSSpecifier *)self->_facetimeSetupButton setButtonAction:sel_setupCellularFaceTime_];
    [(PSSpecifier *)self->_facetimeSetupButton setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60268]];
  }
  if ([(PSUICellularController *)self shouldShowFaceTimeSetup])
  {
    uint64_t v12 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[PSUICellularController setUpFacetimeSetupGroup:]";
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s showing facetime setup group", buf, 0xCu);
    }

    [v4 addObject:self->_facetimeSetupButton];
    [v4 addObject:self->_facetimeSetupGroup];
  }
}

- (void)setUpTopAppUsageGroup:(id)a3
{
  topAppUsageGroup = self->_topAppUsageGroup;
  id v5 = a3;
  int v6 = [(PSUICellularController *)self topAppUsageGroupTitle];
  [(PSUITopAppUsageGroup *)topAppUsageGroup setGroupSpecifierTitle:v6];

  id v7 = [(PSUITopAppUsageGroup *)self->_topAppUsageGroup specifiers];
  [v5 addObjectsFromArray:v7];
}

- (void)setUpMiscOptionsGroup:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_miscOptionsGroup)
  {
    uint64_t v21 = [PSUIMiscOptionsGroup alloc];
    id v5 = [MEMORY[0x263F67ED0] sharedInstance];
    int v6 = +[PSUICarrierSpaceManager sharedManager];
    id v7 = +[PSUICoreTelephonyDataCache sharedInstance];
    uint64_t v8 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    int v9 = objc_alloc_init(PSUIMBManagerWrapper);
    id v10 = objc_alloc_init(MEMORY[0x263F30588]);
    uint64_t v11 = [(PSUICellularController *)self accountStore];
    uint64_t v12 = [(PSUIMiscOptionsGroup *)v21 initWithHostController:self cellularManagementCache:v5 carrierSpaceManager:v6 dataCache:v7 carrierBundleCache:v8 backupManagerWrapper:v9 callHistoryManager:v10 appleAccountStore:v11 resetStatisticsDelegate:self];
    miscOptionsGroup = self->_miscOptionsGroup;
    self->_miscOptionsGroup = v12;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(PSUIMiscOptionsGroup *)self->_miscOptionsGroup setBillingPeriodSource:v19];
          goto LABEL_13;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v20 = [(PSUIMiscOptionsGroup *)self->_miscOptionsGroup specifiers];
  [v14 addObjectsFromArray:v20];
}

- (void)disableSpecifiersIfNeeded:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F82670] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    BOOL v7 = [(PSUICellularController *)self isCellularDisabled];
    self->_disabled = v7;
    if (v7)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v20 = v4;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        uint64_t v12 = *MEMORY[0x263F600A8];
        uint64_t v13 = *MEMORY[0x263F602B0];
        uint64_t v14 = MEMORY[0x263EFFA80];
        id v21 = v8;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
            uint64_t v17 = [(PSUICellularController *)self getLogger];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v19 = [v16 name];
              *(_DWORD *)buf = 136315394;
              uint64_t v27 = "-[PSUICellularController disableSpecifiersIfNeeded:]";
              __int16 v28 = 2112;
              v29 = v19;
              _os_log_debug_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEBUG, "%s disabling specifier: %@", buf, 0x16u);

              id v8 = v21;
            }

            [v16 setProperty:v14 forKey:v12];
            uint64_t v18 = [v16 propertyForKey:v13];
            [v18 setCellEnabled:0];

            ++v15;
          }
          while (v10 != v15);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v10);
      }

      id v4 = v20;
    }
  }
}

- (id)createPersonalHotspotSpecifier
{
  id v3 = PSBundlePathForPreferenceBundle();
  id v4 = (void *)MEMORY[0x263F086E0];
  id v5 = SFRuntimeAbsoluteFilePathForPath();
  int v6 = [v4 bundleWithPath:v5];

  BOOL v7 = (PSBundleController *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "principalClass")), "initWithParentListController:", self);
  personalHotspotBundleController = self->_personalHotspotBundleController;
  self->_personalHotspotBundleController = v7;

  uint64_t v9 = self->_personalHotspotBundleController;
  if (v9)
  {
    uint64_t v10 = [(PSBundleController *)v9 specifiersWithSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];
    uint64_t v11 = [v10 firstObject];
  }
  else
  {
    uint64_t v12 = [(PSUICellularController *)self getLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_error_impl(&dword_221B17000, v12, OS_LOG_TYPE_ERROR, "Failed to load Wireless Modem Settings aka Personal Hotspot bundle controller", v14, 2u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (void)createOrUpdateSubscriptionContextMenuGroup:(id)a3
{
  id v18 = a3;
  if (self->_subscriptionContextMenus)
  {
    uint64_t v4 = (int)*MEMORY[0x263F5FE98];
    uint64_t v5 = *MEMORY[0x263F60290];
    int v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:*MEMORY[0x263F60290]];

    if (v6)
    {
      BOOL v7 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus parentSpecifier];
      id v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:v5];
      [v7 setProperty:v8 forKey:v5];
    }
    uint64_t v9 = *MEMORY[0x263F5FFF0];
    uint64_t v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:*MEMORY[0x263F5FFF0]];

    if (v10)
    {
      uint64_t v11 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus parentSpecifier];
      uint64_t v12 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:v9];
      [v11 setProperty:v12 forKey:v9];
    }
    [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus setGroupSpecifier:v18];
  }
  else
  {
    uint64_t v13 = [PSUISubscriptionContextMenusGroup alloc];
    uint64_t v14 = [PSUISubscriptionContextMenusProductionFactory alloc];
    uint64_t v15 = [(PSUISubscriptionContextMenusProductionFactory *)v14 initWithHostController:self parentSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) groupSpecifier:v18 popViewControllerOnPlanRemoval:0];
    uint64_t v16 = [(PSUISubscriptionContextMenusGroup *)v13 initWithFactory:v15];
    subscriptionContextMenus = self->_subscriptionContextMenus;
    self->_subscriptionContextMenus = v16;
  }
}

- (id)transferPlanGroupSpecifier
{
  id v3 = [(PSUICellularController *)self planPendingTransferGroup];

  if (v3)
  {
    uint64_t v4 = [(PSUICellularController *)self planPendingTransferGroup];
    uint64_t v5 = [v4 groupSpecifier];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TRANSFER_PLAN_GROUP"];
  }
  return v5;
}

- (void)createTransferPlanGroupIfNeeded:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PSUICellularController *)self planPendingTransferGroup];

  if (!v4)
  {
    uint64_t v5 = [[PSUIPlanPendingTransferListGroup alloc] initWithListController:self groupSpecifier:v6];
    [(PSUICellularController *)self setPlanPendingTransferGroup:v5];
  }
}

- (id)addOnPlanGroupSpecifier
{
  id v3 = [(PSUICellularController *)self addOnPlanGroup];

  if (v3)
  {
    uint64_t v4 = [(PSUICellularController *)self addOnPlanGroup];
    uint64_t v5 = [v4 groupSpecifier];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADD_ON_PLAN_GROUP"];
  }
  return v5;
}

- (void)createAddOnPlanGroupIfNeeded:(id)a3 showAddOnPlans:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(PSUICellularController *)self addOnPlanGroup];

  if (!v6)
  {
    BOOL v7 = [[PSUIAddOnPlanGroup alloc] initWithListController:self groupSpecifier:v8 showAddOnPlans:v4];
    [(PSUICellularController *)self setAddOnPlanGroup:v7];
  }
}

- (id)carrierItemGroupSpecifier
{
  id v3 = [(PSUICellularController *)self carrierItemGroup];

  if (v3)
  {
    BOOL v4 = [(PSUICellularController *)self carrierItemGroup];
    uint64_t v5 = [v4 groupSpecifier];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADD_NEW_NETWORK_GROUP"];
  }
  return v5;
}

- (void)createCarrierItemGroupIfNeeded:(id)a3 showCarrierItems:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(PSUICellularController *)self carrierItemGroup];

  if (!v6)
  {
    BOOL v7 = [[PSUICarrierItemGroup alloc] initWithListController:self groupSpecifier:v8 showCarrierItems:v4];
    [(PSUICellularController *)self setCarrierItemGroup:v7];
  }
}

- (void)createAddCellularPlanSpecifierIfNeeded
{
  if (!self->_addCellularPlanSpecifier)
  {
    self->_addCellularPlanSpecifier = (PSSpecifier *)[[PSUIAddCellularPlanSpecifier alloc] initWithHostController:self isEmbeddedInCarrierList:0];
    MEMORY[0x270F9A758]();
  }
}

- (id)QRCodeGroupSpecifier
{
  id v3 = [(PSUICellularController *)self QRCodeGroup];

  if (v3)
  {
    BOOL v4 = [(PSUICellularController *)self QRCodeGroup];
    uint64_t v5 = [v4 groupSpecifier];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"QR_CODE_GROUP"];
  }
  return v5;
}

- (void)createQRCodeGroupIfNeeded:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PSUICellularController *)self QRCodeGroup];

  if (!v4)
  {
    uint64_t v5 = [[PSUIQRCodeGroup alloc] initWithListController:self groupSpecifier:v6];
    [(PSUICellularController *)self setQRCodeGroup:v5];
  }
}

- (void)_maybeAddCrossPlatformSIMTransferSpecifier:(id)a3 toGroup:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (_os_feature_enabled_impl())
  {
    crossPlatformSIMTransferSpecifier = self->_crossPlatformSIMTransferSpecifier;
    if (crossPlatformSIMTransferSpecifier
      || (v8 = [[PSUICrossPlatformSIMTransferSpecifier alloc] initWithHostController:self], uint64_t v9 = self->_crossPlatformSIMTransferSpecifier, self->_crossPlatformSIMTransferSpecifier = &v8->super, v9, (crossPlatformSIMTransferSpecifier = self->_crossPlatformSIMTransferSpecifier) != 0))
    {
      objc_msgSend(v10, "ps_addSpecifier:toGroup:", crossPlatformSIMTransferSpecifier, v6);
    }
  }
}

- (void)configureAddOnPlanTurnOnWifi:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Cellular: Wifi off", buf, 2u);
  }

  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];

  id v8 = NSString;
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", v10, v7);

  uint64_t v12 = [MEMORY[0x263F82670] currentDevice];
  int v13 = objc_msgSend(v12, "sf_isChinaRegionCellularDevice");

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v14 localizedStringForKey:@"TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v15 = v25 = self;

    uint64_t v16 = NSString;
    uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v19 = objc_msgSend(v16, "stringWithFormat:", v18, v15);

    BOOL v7 = (void *)v15;
    self = v25;
    uint64_t v11 = (void *)v19;
  }
  id v20 = (objc_class *)objc_opt_class();
  id v21 = NSStringFromClass(v20);
  [v4 setProperty:v21 forKey:*MEMORY[0x263F600C0]];

  [v4 setProperty:v11 forKey:*MEMORY[0x263F600E8]];
  v27.location = [v11 rangeOfString:v7];
  long long v22 = NSStringFromRange(v27);
  [v4 setProperty:v22 forKey:*MEMORY[0x263F600D0]];

  long long v23 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v4 setProperty:v23 forKey:*MEMORY[0x263F600F0]];

  long long v24 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v4 setProperty:v24 forKey:*MEMORY[0x263F600E0]];

  [v4 setProperty:@"turnOnWifiPressed:" forKey:*MEMORY[0x263F600C8]];
}

- (void)addLocationFooterIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F82670] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    uint64_t v38 = 0;
    int v39 = &v38;
    uint64_t v40 = 0x2020000000;
    BOOL v7 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
    v41 = getCLCopyAppsUsingLocationSymbolLoc_ptr_0;
    if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_0)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      v35 = __getCLCopyAppsUsingLocationSymbolLoc_block_invoke_0;
      v36 = &unk_2645E0D98;
      uint64_t v37 = &v38;
      id v8 = (void *)CoreLocationLibrary_0();
      v39[3] = (uint64_t)dlsym(v8, "CLCopyAppsUsingLocation");
      getCLCopyAppsUsingLocationSymbolLoc_ptr_0 = *(_UNKNOWN **)(v37[1] + 24);
      BOOL v7 = (uint64_t (*)(void))v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v7)
    {
      dlerror();
      uint64_t v31 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v38, 8);
      _Unwind_Resume(v31);
    }
    uint64_t v9 = (void *)v7();
    id v10 = [v9 objectForKey:@"/System/Library/Frameworks/CoreTelephony.framework"];
    if (!v10)
    {
      id v10 = [v9 objectForKey:@"com.apple.locationd.bundle-/System/Library/Frameworks/CoreTelephony.framework"];
    }
    int v11 = [getCLLocationManagerClass_0() locationServicesEnabled];
    char v12 = [getCLLocationManagerClass_0() isEntityAuthorizedForLocationDictionary:v10];
    if (v11 && (v12 & 1) != 0)
    {
      int v13 = +[PSUICellularPlanManagerCache sharedInstance];
      if (![v13 isActivationCodeFlowSupported])
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v14 = [MEMORY[0x263F82670] currentDevice];
      if (![(__CFString *)v14 sf_isChinaRegionCellularDevice])
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v15 = [MEMORY[0x263F82670] currentDevice];
      int v16 = objc_msgSend(v15, "sf_isiPad");

      if (!v16)
      {
LABEL_21:

        goto LABEL_22;
      }
      int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v13 localizedStringForKey:@"CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE" value:&stru_26D410CA0 table:@"Cellular"];
      uint64_t v17 = *MEMORY[0x263F600F8];
      id v18 = v4;
      uint64_t v19 = v14;
    }
    else
    {
      id v20 = [(PSUICellularController *)self getLogger];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v20, OS_LOG_TYPE_DEFAULT, "Cellular: Location Services off", buf, 2u);
      }

      id v21 = @"prefs:root=Privacy&path=LOCATION";
      if (v11) {
        id v21 = @"prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES";
      }
      v32 = v21;
      long long v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v13 = [v22 localizedStringForKey:@"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];

      long long v23 = NSString;
      long long v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v25 = [v24 localizedStringForKey:@"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
      objc_msgSend(v23, "stringWithFormat:", v25, v13);
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      long long v26 = (objc_class *)objc_opt_class();
      NSRange v27 = NSStringFromClass(v26);
      [v4 setProperty:v27 forKey:*MEMORY[0x263F600C0]];

      [v4 setProperty:v14 forKey:*MEMORY[0x263F600E8]];
      v42.location = [(__CFString *)v14 rangeOfString:v13];
      __int16 v28 = NSStringFromRange(v42);
      [v4 setProperty:v28 forKey:*MEMORY[0x263F600D0]];

      v29 = [NSURL URLWithString:v32];
      [v4 setProperty:v29 forKey:*MEMORY[0x263F600F0]];

      uint64_t v30 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
      [v4 setProperty:v30 forKey:*MEMORY[0x263F600E0]];

      uint64_t v17 = *MEMORY[0x263F600C8];
      uint64_t v19 = @"turnOnLocationServicesPressed:";
      id v18 = v4;
    }
    [v18 setProperty:v19 forKey:v17];
    goto LABEL_19;
  }
LABEL_22:
}

- (id)topAppUsageGroupTitle
{
  id v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v6 = v5;
  if (v4) {
    BOOL v7 = @"APP_WIRELESS_DATA_USAGE";
  }
  else {
    BOOL v7 = @"APP_DATA_USAGE";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];

  uint64_t v9 = [(PSUICellularController *)self activeDataPlanLabel];
  id v10 = [MEMORY[0x263F67EF0] sharedInstance];
  if (![v10 isDualSimCapable]) {
    goto LABEL_9;
  }
  int v11 = +[PSUICellularPlanManagerCache sharedInstance];
  char v12 = [v11 planItems];
  if ((unint64_t)[v12 count] <= 1)
  {

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v13 = [v9 length];

  if (v13)
  {
    uint64_t v14 = NSString;
    uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v16 = [v15 localizedStringForKey:@"APP_DATA_USAGE_FOR_%@" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v16, v9);
LABEL_13:

    id v8 = (void *)v17;
    goto LABEL_14;
  }
LABEL_10:
  id v18 = [MEMORY[0x263F82670] currentDevice];
  int v19 = objc_msgSend(v18, "sf_isiPad");

  if (!v19) {
    goto LABEL_15;
  }
  uint64_t v15 = [(PSUICellularController *)self activeDataPlanCarrierName];
  if ([v15 length])
  {
    id v20 = NSString;
    int v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v16 localizedStringForKey:@"APP_DATA_USAGE_FOR_%@" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v17 = objc_msgSend(v20, "stringWithFormat:", v21, v15);

    id v8 = (void *)v21;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  return v8;
}

- (id)activeDataPlanLabel
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  int v4 = [v3 planItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 136315394;
    long long v17 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActiveDataPlan", v17))
        {
          uint64_t v15 = [v10 userLabel];
          uint64_t v14 = [v15 label];

          goto LABEL_13;
        }
        int v11 = [(PSUICellularController *)self getLogger];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          char v12 = [v10 userLabel];
          uint64_t v13 = [v12 label];
          *(_DWORD *)buf = v17;
          long long v23 = "-[PSUICellularController activeDataPlanLabel]";
          __int16 v24 = 2112;
          long long v25 = v13;
          _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "%s Not adding app data usage for plan %@ because it's not active", buf, 0x16u);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_13:

  return v14;
}

- (id)activeDataPlanCarrierName
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = +[PSUICellularPlanManagerCache sharedInstance];
  id v3 = [v2 planItems];

  int v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isActiveDataPlan])
        {
          int v4 = [v7 carrierName];
          goto LABEL_11;
        }
      }
      int v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)accountStore
{
  if (qword_26AC32390 != -1) {
    dispatch_once(&qword_26AC32390, &__block_literal_global_333);
  }
  v2 = (void *)qword_26AC32388;
  return v2;
}

uint64_t __38__PSUICellularController_accountStore__block_invoke()
{
  qword_26AC32388 = (uint64_t)objc_alloc_init(MEMORY[0x263EFB210]);
  return MEMORY[0x270F9A758]();
}

- (BOOL)shouldShowNoSIMsOrActivatePlansUI
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isiPad");

  if (!v4)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    id v22 = 0;
    long long v9 = [(CoreTelephonyClient *)coreTelephonyClient isEmbeddedSIMOnlyConfig:&v22];
    id v10 = v22;
    if (v10)
    {
      long long v11 = [(PSUICellularController *)self getLogger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v10;
        _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "Embedded SIM config error: %@", buf, 0xCu);
      }
    }
    else if ([v9 BOOLValue])
    {
      long long v12 = +[PSUICellularPlanManagerCache sharedInstance];
      uint64_t v13 = [v12 planItems];
      uint64_t v14 = [v13 count];

      if (!v14) {
        goto LABEL_13;
      }
      if (v14 == 1)
      {
        uint64_t v15 = +[PSUICellularPlanManagerCache sharedInstance];
        char v16 = [v15 isAnyPlanActivating];

        if (v16) {
          goto LABEL_13;
        }
      }
    }
    long long v17 = [MEMORY[0x263F67EF0] sharedInstance];
    long long v18 = [v17 subscriptionsInUse];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      BOOL v7 = 0;
LABEL_14:

      return v7;
    }
LABEL_13:
    subscriptionContextMenus = self->_subscriptionContextMenus;
    self->_subscriptionContextMenus = 0;

    BOOL v7 = 1;
    goto LABEL_14;
  }
  uint64_t v5 = +[PSUICellularPlanManagerCache sharedInstance];
  long long v6 = [v5 planItems];
  BOOL v7 = [v6 count] == 0;

  return v7;
}

- (BOOL)eSIMExistsInSubscriptionContexts
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F67EF0], "sharedInstance", 0);
  id v3 = [v2 subscriptionContexts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = [MEMORY[0x263F67EF0] sharedInstance];
        uint64_t v9 = [v8 simHardwareInfo:v7];

        if (v9 == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)deviceIsDualSIMCapableAndPlansExist
{
  v2 = [MEMORY[0x263F67EF0] sharedInstance];
  if ([v2 isDualSimCapable])
  {
    id v3 = +[PSUICellularPlanManagerCache sharedInstance];
    uint64_t v4 = [v3 planItems];
    if ([v4 count])
    {
      BOOL v5 = 1;
    }
    else
    {
      long long v6 = +[PSUICellularPlanManagerCache sharedInstance];
      uint64_t v7 = [v6 danglingPlanItems];
      if ([v7 count])
      {
        BOOL v5 = 1;
      }
      else
      {
        uint64_t v8 = +[PSUICellularPlanManagerCache sharedInstance];
        uint64_t v9 = [v8 plansPendingTransfer];
        BOOL v5 = [v9 count] != 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowAddPlanButton
{
  v2 = +[PSUICellularPlanManagerCache sharedInstance];
  if ([v2 isCarrierItemFlowSupported])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = +[PSUICellularPlanManagerCache sharedInstance];
    if ([v4 isActivationCodeFlowSupported])
    {
      BOOL v5 = [MEMORY[0x263F82670] currentDevice];
      int v3 = objc_msgSend(v5, "sf_isiPad") ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)shouldShowDataPlans
{
  int v3 = [MEMORY[0x263F67EF0] sharedInstance];
  char v4 = [v3 isDualSimCapable];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = +[PSUICellularPlanManagerCache sharedInstance];
    long long v6 = [v5 planItems];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = +[PSUICellularPlanManagerCache sharedInstance];
      uint64_t v9 = [v8 planItems];
      unint64_t v10 = [v9 count];

      if (v10 > 1) {
        return 1;
      }
      if ([(PSUICellularController *)self eSIMExistsInSubscriptionContexts]) {
        return 1;
      }
      long long v11 = +[PSUICellularPlanManagerCache sharedInstance];
      char v12 = [v11 isAnyLocalFlowTypeSupported];

      if (v12) {
        return 1;
      }
      long long v13 = [MEMORY[0x263F82670] currentDevice];
      char v14 = objc_msgSend(v13, "sf_isChinaRegionCellularDevice");

      if (v14) {
        return 1;
      }
      uint64_t v16 = [(PSUICellularController *)self getLogger];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, "No cellular plans shown", v17, 2u);
      }
    }
  }
  return 0;
}

- (BOOL)shouldUpdateHeaderForSIM
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__PSUICellularController_shouldUpdateHeaderForSIM__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  if (qword_26AC32398 != -1) {
    dispatch_once(&qword_26AC32398, block);
  }
  return _MergedGlobals_1_2;
}

void __50__PSUICellularController_shouldUpdateHeaderForSIM__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 1552);
  id v6 = 0;
  int v3 = [v2 isEmbeddedSIMOnlyConfig:&v6];
  id v4 = v6;
  if (v4)
  {
    BOOL v5 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_error_impl(&dword_221B17000, v5, OS_LOG_TYPE_ERROR, "Embedded SIM config error: %@", buf, 0xCu);
    }
  }
  else
  {
    _MergedGlobals_1_2 = [v3 BOOLValue];
  }
}

- (BOOL)shouldShowPendingInstallPlan
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isiPad"))
  {
    int v3 = +[PSUICellularPlanManagerCache sharedInstance];
    id v4 = [v3 planItems];
    if ([v4 count])
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = +[PSUICellularPlanManagerCache sharedInstance];
      uint64_t v7 = [v6 pendingInstallPlans];
      id v8 = [v7 plans];
      BOOL v5 = [v8 count] != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v26 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v26;
    uint64_t v7 = [v6 textLabel];
    id v8 = [v7 text];
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v10 = [v9 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
    long long v11 = [v10 uppercaseString];

    if (v8 == v11)
    {
      long long v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v22 = [v21 localizedStringForKey:@"CELLULAR_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
      long long v23 = [v6 textLabel];
      [v23 setText:v22];

      if ([(PSUICellularController *)self shouldUpdateHeaderForSIM])
      {
        long long v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v19 = v18;
        long long v20 = @"CELLULAR_PLANS_eSIMs";
        goto LABEL_7;
      }
    }
    else
    {
      char v12 = [v6 textLabel];
      long long v13 = [v12 text];
      char v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v14 localizedStringForKey:@"NON_PUBLIC_NETWORK_PLANS" value:&stru_26D410CA0 table:@"Cellular"];
      uint64_t v16 = [v15 uppercaseString];
      int v17 = [v13 isEqualToString:v16];

      if (v17)
      {
        long long v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v19 = v18;
        long long v20 = @"NON_PUBLIC_NETWORK_PLANS";
LABEL_7:
        id v24 = [v18 localizedStringForKey:v20 value:&stru_26D410CA0 table:@"Cellular"];
        uint64_t v25 = [v6 textLabel];
        [v25 setText:v24];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)shouldShowPrivateNetworkPlansList
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v3 = +[PSUICellularPlanManagerCache sharedInstance];
  id v4 = [v3 planItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
      if (![v9 settingsMode] || objc_msgSend(v9, "settingsMode") == 1) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v30 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v16 = [(PSUICellularController *)self getLogger];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICellularController shouldShowPrivateNetworkPlansList]";
    int v17 = "%s Private network SIM exists on device, show private network plans list";
  }
  else
  {
LABEL_10:

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v10 = +[PSUICellularPlanManagerCache sharedInstance];
    id v4 = [v10 danglingPlanItems];

    uint64_t v11 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v11)
    {
LABEL_18:
      BOOL v15 = 0;
      goto LABEL_25;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
LABEL_12:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v19 + 1) + 8 * v14) isPrivateNetworkSim]) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
    uint64_t v16 = [(PSUICellularController *)self getLogger];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICellularController shouldShowPrivateNetworkPlansList]";
    int v17 = "%s Private network dangling plan exists on device, show private network plans list";
  }
  _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
LABEL_24:

  BOOL v15 = 1;
LABEL_25:

  return v15;
}

- (void)prefetchResourcesFor:(id)a3
{
  id v16 = a3;
  uint64_t v7 = -[PSUICellularController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:");
  uint64_t v8 = v7;
  if (v7)
  {
    int v3 = [v7 identifier];
    if ([v3 isEqualToString:@"APP_DATA_USAGE"])
    {
      id v4 = [v16 identifier];
      if ([v4 isEqualToString:@"DATA_USAGE_IN_PERIOD"])
      {
        int v9 = 0;
        int v10 = 1;
      }
      else
      {
        uint64_t v5 = [v16 identifier];
        if (([v5 isEqualToString:@"ROAMING_DATA_USAGE_IN_PERIOD"] & 1) == 0)
        {

          goto LABEL_25;
        }
        int v10 = 1;
        int v9 = 1;
      }
    }
    else
    {
      int v10 = 0;
      int v9 = 0;
    }
  }
  else
  {
    int v10 = 0;
    int v9 = 0;
  }
  uint64_t v11 = [v16 identifier];
  if ([v11 isEqualToString:0x26D415D00])
  {

    int v12 = 1;
    if (v9) {
      goto LABEL_9;
    }
LABEL_15:
    if (!v10) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v13 = [v16 identifier];
  if ([v13 isEqualToString:0x26D4120A0])
  {

    int v12 = 1;
    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = [v16 identifier];
    int v12 = [v14 isEqualToString:0x26D411200];

    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
LABEL_9:

  if (v10) {
LABEL_16:
  }

LABEL_17:
  if (v8)
  {

    if ((v12 & 1) == 0) {
      goto LABEL_26;
    }
LABEL_25:
    id v15 = (id)[v16 performGetter];
    goto LABEL_26;
  }
  if (v12) {
    goto LABEL_25;
  }
LABEL_26:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PSUICellularController;
  id v6 = a4;
  [(PSUICellularController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[PSUICellularController indexForIndexPath:](self, "indexForIndexPath:", v6, v10.receiver, v10.super_class);

  uint64_t v8 = [(PSUICellularController *)self specifierAtIndex:v7];
  int v9 = [(PSUICellularController *)self cellularDataPlanListGroup];
  [v9 listController:self didSelectSpecifier:v8];
}

- (void)entitlementStatusChanged
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F3BAE8];
    int v5 = 136315394;
    id v6 = "-[PSUICellularController entitlementStatusChanged]";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v5, 0x16u);
  }

  if (self->_ignoreNextEntitlementStatusChange)
  {
    self->_ignoreNextEntitlementStatusChange = 0;
  }
  else
  {
    self->_ignoreNextEntitlementStatusChange = 1;
    [(PSUICellularController *)self reloadSpecifiers];
  }
}

- (BOOL)isCellularDisabled
{
  v2 = [MEMORY[0x263F67EF0] sharedInstance];
  if ([v2 isSIMMissing] && PSSimIsRequired())
  {
    int v3 = +[PSUICellularPlanManagerCache sharedInstance];
    char v4 = [v3 isCellularDisabled];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)updatePaneWithCellularDataState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) animated:1];

  id v6 = +[PSUICellularPlanManagerCache sharedInstance];
  char v7 = [v6 shouldShowAccountSetup];

  if (!v3 || (v7 & 1) != 0 || [(PSUICellularController *)self showDataPlanOnly])
  {
    personalHotspotSpecifier = self->_personalHotspotSpecifier;
    if (personalHotspotSpecifier)
    {
      uint64_t v9 = [(PSSpecifier *)personalHotspotSpecifier identifier];
      objc_super v10 = [(PSUICellularController *)self specifierForID:v9];

      if (v10)
      {
        uint64_t v11 = [(PSUICellularController *)self getLogger];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          long long v24 = "-[PSUICellularController updatePaneWithCellularDataState:]";
          _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "%s Removing personal hotspot", buf, 0xCu);
        }

        [(PSUICellularController *)self removeSpecifier:self->_personalHotspotSpecifier animated:1];
      }
    }
    if ([(PSUICellularController *)self containsSpecifier:self->_facetimeSetupButton])
    {
      facetimeSetupButton = self->_facetimeSetupButton;
      v21[0] = self->_facetimeSetupGroup;
      v21[1] = facetimeSetupButton;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
      [(PSUICellularController *)self removeContiguousSpecifiers:v13 animated:1];
LABEL_11:
    }
  }
  else
  {
    uint64_t v14 = self->_personalHotspotSpecifier;
    if (v14)
    {
      id v15 = [(PSSpecifier *)v14 identifier];
      id v16 = [(PSUICellularController *)self specifierForID:v15];

      if (!v16)
      {
        int v17 = [(PSUICellularController *)self getLogger];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          long long v24 = "-[PSUICellularController updatePaneWithCellularDataState:]";
          _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "%s Adding personal hotspot back", buf, 0xCu);
        }

        [(PSUICellularController *)self insertSpecifier:self->_personalHotspotSpecifier afterSpecifierID:@"CELLULAR_DATA_OPTIONS" animated:1];
      }
    }
    if ([(PSUICellularController *)self shouldShowFaceTimeSetup])
    {
      if (([(PSUICellularController *)self containsSpecifier:self->_facetimeSetupButton] & 1) == 0)
      {
        long long v18 = self->_facetimeSetupButton;
        if (v18)
        {
          if (self->_facetimeSetupGroup)
          {
            v22[0] = self->_facetimeSetupGroup;
            v22[1] = v18;
            uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
            [(PSUICellularController *)self insertContiguousSpecifiers:v13 afterSpecifierID:@"VIEW_ACCOUNT" animated:1];
            goto LABEL_11;
          }
        }
      }
    }
  }
  long long v19 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v24 = "-[PSUICellularController updatePaneWithCellularDataState:]";
    _os_log_impl(&dword_221B17000, v19, OS_LOG_TYPE_DEFAULT, "%s Reloading cellular data options", buf, 0xCu);
  }

  long long v20 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:@"CELLULAR_DATA_OPTIONS"];
  [(PSUICellularController *)self reloadSpecifier:v20];
}

- (BOOL)showDataPlanOnly
{
  v2 = +[PSUICellularPlanManagerCache sharedInstance];
  int v3 = [v2 isMultipleDataPlanSupportAvailable];

  if (!v3) {
    return 0;
  }
  char v4 = +[PSUICellularPlanManagerCache sharedInstance];
  if ([v4 isSelectedPlanActivating])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = +[PSUICellularPlanManagerCache sharedInstance];
    if ([v6 shouldShowPlanSelector])
    {
      char v5 = 1;
    }
    else
    {
      char v7 = +[PSUICellularPlanManagerCache sharedInstance];
      char v5 = [v7 shouldShowAccountSetup];
    }
  }

  return v5;
}

- (id)cellularDataOptionsDetailText:(id)a3
{
  int v3 = +[PSUICoreTelephonyDataCache sharedInstance];
  int v4 = [v3 isCellularDataEnabled];

  if (PSIsVoiceRoamingOptionAvailable())
  {
    int v5 = PSIsVoiceRoamingEnabled();
    if (!v4) {
      goto LABEL_3;
    }
LABEL_6:
    if (PSIsVoiceRoamingEnabled()) {
      int v6 = PSIsDataRoamingEnabled();
    }
    else {
      int v6 = 0;
    }
    PSIsVoiceRoamingOptionAvailable();
    goto LABEL_11;
  }
  int v5 = 0;
  if (v4) {
    goto LABEL_6;
  }
LABEL_3:
  if (PSIsVoiceRoamingOptionAvailable())
  {
    int v6 = 0;
LABEL_11:
    int v8 = v5 | v6;
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v10 = v9;
    if (v8) {
      uint64_t v11 = @"CELLULAR_ACCOUNT_OPTIONS_ROAMING_ON";
    }
    else {
      uint64_t v11 = @"CELLULAR_ACCOUNT_OPTIONS_ROAMING_OFF";
    }
    char v7 = [v9 localizedStringForKey:v11 value:&stru_26D410CA0 table:@"Cellular"];

    goto LABEL_15;
  }
  char v7 = &stru_26D410CA0;
LABEL_15:
  return v7;
}

- (id)getTetheringStatus:(id)a3
{
  int v3 = objc_msgSend(MEMORY[0x263F5FC88], "sharedManager", a3);
  if ([v3 isTetheringEnabled])
  {
    int v4 = &stru_26D410CA0;
  }
  else
  {
    int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v4 = [v5 localizedStringForKey:@"OFF" value:&stru_26D410CA0 table:@"Cellular"];
  }
  return v4;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int v6 = [MEMORY[0x263F82670] currentDevice];
  int v7 = objc_msgSend(v6, "sf_isiPad");

  if (v7)
  {
    int v8 = [(PSUICellularController *)self specifierAtIndexPath:v5];
    uint64_t v9 = [v8 propertyForKey:*MEMORY[0x263F5FFF0]];
    uint64_t v11 = +[PSUICellularPlanManagerCache sharedInstance];
    objc_super v10 = [v11 planFromReferenceSafe:v9];

    LOBYTE(v11) = 0;
    if (v8 && v10)
    {
      int v12 = [v10 plan];
      if (v12)
      {
        uint64_t v13 = [v10 plan];
        LODWORD(v11) = [v13 isDeleteNotAllowed] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return (char)v11;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v48[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F82670] currentDevice];
  int v9 = objc_msgSend(v8, "sf_isiPad");

  if (v9)
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    int v45 = __Block_byref_object_copy__1;
    v46 = __Block_byref_object_dispose__1;
    id v47 = 0;
    id v47 = [(PSUICellularController *)self specifierAtIndexPath:v7];
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    int v39 = __Block_byref_object_copy__1;
    uint64_t v40 = __Block_byref_object_dispose__1;
    id v41 = 0;
    id v41 = [(id)v43[5] propertyForKey:*MEMORY[0x263F5FFF0]];
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__1;
    uint64_t v34 = __Block_byref_object_dispose__1;
    id v35 = 0;
    objc_super v10 = +[PSUICellularPlanManagerCache sharedInstance];
    id v35 = [v10 planFromReference:v37[5]];

    if (!v43[5]) {
      goto LABEL_6;
    }
    uint64_t v11 = (void *)v31[5];
    if (!v11) {
      goto LABEL_6;
    }
    int v12 = [v11 plan];
    if (v12
      && ([(id)v31[5] plan],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isDeleteNotAllowed],
          v13,
          v12,
          (v14 & 1) == 0))
    {
      id location = 0;
      objc_initWeak(&location, self);
      int v17 = (void *)MEMORY[0x263F82630];
      long long v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v19 = [v18 localizedStringForKey:@"REMOVE" value:&stru_26D410CA0 table:@"Cellular"];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
      v23[3] = &unk_2645E1298;
      uint64_t v25 = &v30;
      long long v26 = &v36;
      v23[4] = self;
      id v24 = v7;
      uint64_t v27 = &v42;
      objc_copyWeak(&v28, &location);
      long long v20 = [v17 contextualActionWithStyle:1 title:v19 handler:v23];

      long long v21 = (void *)MEMORY[0x263F82C30];
      v48[0] = v20;
      long long v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
      id v15 = [v21 configurationWithActions:v22];

      [v15 setPerformsFirstActionWithFullSwipe:0];
      objc_destroyWeak(&v28);

      objc_destroyWeak(&location);
    }
    else
    {
LABEL_6:
      id v15 = 0;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v7 = [v6 planFromReference:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  objc_super v10 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136316162;
    uint64_t v37 = "-[PSUICellularController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]_block_invoke";
    __int16 v38 = 2112;
    uint64_t v39 = v13;
    __int16 v40 = 2112;
    uint64_t v41 = v11;
    __int16 v42 = 2112;
    uint64_t v43 = v12;
    __int16 v44 = 2112;
    uint64_t v45 = v14;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s remove plan: %@, %@, %@, %@", buf, 0x34u);
  }

  id v15 = (void *)MEMORY[0x263F82418];
  id v16 = +[SettingsCellularUtils removePlanConfirmationTitle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  int v17 = +[SettingsCellularUtils removePlanConfirmationMessage:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  long long v18 = [v15 alertControllerWithTitle:v16 message:v17 preferredStyle:1];

  long long v19 = (void *)MEMORY[0x263F82400];
  long long v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v21 = [v20 localizedStringForKey:@"REMOVE" value:&stru_26D410CA0 table:@"Cellular"];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_365;
  v33[3] = &unk_2645E1248;
  uint64_t v22 = *(void *)(a1 + 48);
  v33[4] = *(void *)(a1 + 32);
  uint64_t v35 = v22;
  id v23 = v5;
  id v34 = v23;
  id v24 = [v19 actionWithTitle:v21 style:2 handler:v33];

  [v18 addAction:v24];
  uint64_t v25 = (void *)MEMORY[0x263F82400];
  long long v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v27 = [v26 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_371;
  v31[3] = &unk_2645E1270;
  v31[4] = *(void *)(a1 + 32);
  id v32 = v23;
  id v28 = v23;
  v29 = [v25 actionWithTitle:v27 style:1 handler:v31];

  [v18 addAction:v29];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained presentViewController:v18 animated:1 completion:0];
}

void __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_365(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    objc_super v10 = "-[PSUICellularController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s confirm remove plan: %@", buf, 0x16u);
  }

  int v4 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_366;
  v7[3] = &unk_2645E1220;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 didDeletePlanItem:v5 completion:v7];
}

void __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_366(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Failed to delete plan item: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = a2;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

uint64_t __87__PSUICellularController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_371(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[PSUICellularController tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s cancel remove plan", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)shouldShowFaceTimeSetup
{
  if (MGGetBoolAnswer())
  {
    v2 = +[PSUICoreTelephonyDataCache sharedInstance];
    if ([v2 isCellularDataEnabled])
    {
      uint64_t v3 = [MEMORY[0x263F3BB20] sharedInstance];
      int v4 = [v3 faceTimeNonWiFiEntitled] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setupCellularFaceTime:(id)a3
{
  id v11 = [MEMORY[0x263F33240] controllerForServiceType:0];
  int v4 = [MEMORY[0x263F67EF0] sharedInstance];
  id v5 = [v4 activeDataSubscriptionContext];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  uint64_t v7 = (void *)[(CoreTelephonyClient *)self->_coreTelephonyClient copyCarrierBundleValueWithDefault:v5 key:@"CarrierName" bundleType:v6 error:0];
  int v8 = (void *)[(CoreTelephonyClient *)self->_coreTelephonyClient copyCarrierBundleValueWithDefault:v5 key:@"TetheringPhoneNumber" bundleType:v6 error:0];
  id v9 = (void *)[(CoreTelephonyClient *)self->_coreTelephonyClient copyCarrierBundleValueWithDefault:v5 key:@"TetheringURL" bundleType:v6 error:0];
  if (v9)
  {
    uint64_t v10 = [NSURL URLWithString:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v11 showSetupFaceTimeOverCellularAlertForServiceProviderName:v7 serviceProviderPhoneNumber:v8 serviceProviderURL:v10 completion:0];
}

- (void)newCarrierNotification
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[PSUICellularController newCarrierNotification]";
    __int16 v6 = 2112;
    uint64_t v7 = @"PSNewCarrierNotification";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v4, 0x16u);
  }

  [(PSUICellularController *)self reloadSpecifiers];
}

- (void)cellularDataSettingChanged
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "-[PSUICellularController cellularDataSettingChanged]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification", (uint8_t *)&v5, 0xCu);
  }

  [(PSUICellularController *)self reloadSpecifierID:@"MOBILE_DATA_SETTINGS" animated:1];
  int v4 = +[PSUICoreTelephonyDataCache sharedInstance];
  -[PSUICellularController updatePaneWithCellularDataState:](self, "updatePaneWithCellularDataState:", [v4 isCellularDataEnabled]);

  [(PSUICellularController *)self reloadSpecifiers];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[PSUICellularController simStatusDidChange:status:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(PSUITopAppUsageGroup *)self->_topAppUsageGroup clearStoredSpecifiers];
  BOOL v6 = [(PSUICellularController *)self isCellularDisabled];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE88]));
    id v8 = (id)[WeakRetained popToRootViewControllerAnimated:1];
  }
  else if (self->_disabled)
  {
    [(PSUICellularController *)self reloadSpecifiers];
  }
  self->_disabled = v6;
  id v9 = [(PSUITopAppUsageGroup *)self->_topAppUsageGroup specifiers];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    BOOL v14 = !v6;
    uint64_t v15 = *MEMORY[0x263F600A8];
    uint64_t v16 = *MEMORY[0x263F602B0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v18, (void)v21) & 1) == 0)
        {
          long long v19 = [NSNumber numberWithBool:v14];
          [v18 setProperty:v19 forKey:v15];

          long long v20 = [v18 propertyForKey:v16];
          [v20 setCellEnabled:v14];
          [v20 setNeedsDisplay];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)airplaneModeChanged
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    BOOL v6 = "-[PSUICellularController airplaneModeChanged]";
    _os_log_error_impl(&dword_221B17000, v3, OS_LOG_TYPE_ERROR, "%s Airplane mode changed", (uint8_t *)&v5, 0xCu);
  }

  [(PSUICellularController *)self reloadSpecifierID:@"MOBILE_DATA_SETTINGS" animated:1];
  int v4 = +[PSUICoreTelephonyDataCache sharedInstance];
  -[PSUICellularController updatePaneWithCellularDataState:](self, "updatePaneWithCellularDataState:", [v4 isCellularDataEnabled]);

  [(PSUICellularController *)self reloadSpecifiers];
}

- (void)cellularPlanChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v7 = "-[PSUICellularController cellularPlanChanged:]";
    __int16 v8 = 2112;
    id v9 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  [(PSUITopAppUsageGroup *)self->_topAppUsageGroup clearStoredSpecifiers];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PSUICellularController_cellularPlanChanged___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__PSUICellularController_cellularPlanChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)wirelessDataUsageChangedNotification
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F67F20];
    int v5 = 136315394;
    BOOL v6 = "-[PSUICellularController wirelessDataUsageChangedNotification]";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v5, 0x16u);
  }

  [(PSUITopAppUsageGroup *)self->_topAppUsageGroup clearStoredSpecifiers];
  [(PSUICellularController *)self reloadSpecifiers];
}

- (void)wirelessDataUsageCacheRefreshed
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F67F18];
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[PSUICellularController wirelessDataUsageCacheRefreshed]";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  [(PSUITopAppUsageGroup *)self->_topAppUsageGroup clearStoredSpecifiers];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PSUICellularController_wirelessDataUsageCacheRefreshed__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__PSUICellularController_wirelessDataUsageCacheRefreshed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)carrierItemsChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F31918];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "received notification %@", buf, 0xCu);
  }

  int v5 = +[PSUICellularPlanManagerCache sharedInstance];
  BOOL v6 = [v5 planItems];
  if ([v6 count])
  {
  }
  else
  {
    __int16 v7 = +[PSUICellularPlanManagerCache sharedInstance];
    int v8 = [v7 isAnyLocalFlowTypeSupported];

    if (v8)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__PSUICellularController_carrierItemsChanged__block_invoke;
      block[3] = &unk_2645E0B88;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __45__PSUICellularController_carrierItemsChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)perAppNetworkDataAccessPolicyChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *MEMORY[0x263F67F08];
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[PSUICellularController perAppNetworkDataAccessPolicyChanged]";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__PSUICellularController_perAppNetworkDataAccessPolicyChanged__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__PSUICellularController_perAppNetworkDataAccessPolicyChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PSUICellularController;
  int v5 = [(PSUICellularController *)&v7 selectSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setParentSpecifier:v4];
  }

  return v5;
}

- (BOOL)_shouldShowCarrierItemGroup
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");

  if (!v4) {
    return 1;
  }
  int v5 = [(PSUICellularController *)self carrierItemGroup];
  BOOL v6 = [v5 specifiers];
  uint64_t v7 = [v6 count];

  if (v7) {
    return 1;
  }
  uint64_t v9 = [(PSUICellularController *)self getLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[PSUICellularController _shouldShowCarrierItemGroup]";
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "%s No carrier items available for ChinaRegionCellularDevice", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (void)launchTravelEducationFlow:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F660B0];
  v12[0] = *MEMORY[0x263F66090];
  v12[1] = v4;
  v13[0] = &unk_26D425EE8;
  v13[1] = a3;
  int v5 = NSDictionary;
  id v6 = a3;
  uint64_t v7 = [v5 dictionaryWithObjects:v13 forKeys:v12 count:2];
  __int16 v8 = [MEMORY[0x263F66078] flowWithOptions:v7];
  flow = self->_flow;
  self->_flow = v8;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  int v10 = self->_flow;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__PSUICellularController_launchTravelEducationFlow___block_invoke;
  v11[3] = &unk_2645E12C0;
  v11[4] = self;
  [(TSSIMSetupFlow *)v10 firstViewController:v11];
}

void __52__PSUICellularController_launchTravelEducationFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__PSUICellularController_launchTravelEducationFlow___block_invoke_2;
  v6[3] = &unk_2645E0B60;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __52__PSUICellularController_launchTravelEducationFlow___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:*(void *)(a1 + 32)];
    [v2 setModalPresentationStyle:2];
    [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
  }
}

- (void)launchAddeSIMFlow
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F66090];
  id v3 = [NSNumber numberWithInteger:3];
  v11[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  id v5 = [MEMORY[0x263F66078] flowWithOptions:v4];
  flow = self->_flow;
  self->_flow = v5;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  id location = 0;
  objc_initWeak(&location, self);
  id v7 = self->_flow;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__PSUICellularController_launchAddeSIMFlow__block_invoke;
  v8[3] = &unk_2645E12C0;
  v8[4] = self;
  [(TSSIMSetupFlow *)v7 firstViewController:v8];
  objc_destroyWeak(&location);
}

void __43__PSUICellularController_launchAddeSIMFlow__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = (objc_class *)MEMORY[0x263F829B8];
    id v4 = a2;
    id v5 = (id)[[v3 alloc] initWithRootViewController:v4];

    [v5 setModalPresentationStyle:2];
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__PSUICellularController_simSetupFlowCompleted___block_invoke;
  v3[3] = &unk_2645E0CD0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__PSUICellularController_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[195];
    WeakRetained[195] = 0;
    id v4 = WeakRetained;

    id v3 = [v4 presentedViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v4;
  }
}

- (void)didResetStatistics
{
  id v3 = [(PSUICellularController *)self view];
  id v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v5;

  id v7 = [(PSUICellularController *)self table];
  objc_msgSend(v7, "setContentOffset:animated:", 0, 0.0, -v6);
}

- (void)didModifyStatisticsSetting
{
}

void __52__PSUICellularController_didModifyStatisticsSetting__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F67F20] object:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularController"];
}

- (PSUICellularDataPlanListGroup)cellularDataPlanListGroup
{
  return self->_cellularDataPlanListGroup;
}

- (void)setCellularDataPlanListGroup:(id)a3
{
}

- (PSUICellularDataPlanDetailGroup)cellularDataPlanDetailGroup
{
  return self->_cellularDataPlanDetailGroup;
}

- (void)setCellularDataPlanDetailGroup:(id)a3
{
}

- (PSUICellularPlanListGroup)cellularPlanListGroup
{
  return self->_cellularPlanListGroup;
}

- (void)setCellularPlanListGroup:(id)a3
{
}

- (PSUICellularPlanListGroup)privateNetworkPlanListGroup
{
  return self->_privateNetworkPlanListGroup;
}

- (void)setPrivateNetworkPlanListGroup:(id)a3
{
}

- (PSUICarrierItemGroup)carrierItemGroup
{
  return self->_carrierItemGroup;
}

- (void)setCarrierItemGroup:(id)a3
{
}

- (PSUIAddOnPlanGroup)addOnPlanGroup
{
  return self->_addOnPlanGroup;
}

- (void)setAddOnPlanGroup:(id)a3
{
}

- (PSUIQRCodeGroup)QRCodeGroup
{
  return self->_QRCodeGroup;
}

- (void)setQRCodeGroup:(id)a3
{
}

- (PSUIPendingInstallPlanGroup)pendingInstallPlanGroup
{
  return self->_pendingInstallPlanGroup;
}

- (void)setPendingInstallPlanGroup:(id)a3
{
}

- (PSUIOtherOptionsGroup)otherOptionsGroup
{
  return self->_otherOptionsGroup;
}

- (void)setOtherOptionsGroup:(id)a3
{
}

- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus
{
  return self->_subscriptionContextMenus;
}

- (void)setSubscriptionContextMenus:(id)a3
{
}

- (PSUITopAppUsageGroup)topAppUsageGroup
{
  return self->_topAppUsageGroup;
}

- (void)setTopAppUsageGroup:(id)a3
{
}

- (PSUIMiscOptionsGroup)miscOptionsGroup
{
  return self->_miscOptionsGroup;
}

- (void)setMiscOptionsGroup:(id)a3
{
}

- (PSUIPlanPendingTransferListGroup)planPendingTransferGroup
{
  return self->_planPendingTransferGroup;
}

- (void)setPlanPendingTransferGroup:(id)a3
{
}

- (PSUIDeferredDeepLink)deferredDeepLink
{
  return self->_deferredDeepLink;
}

- (void)setDeferredDeepLink:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_deferredDeepLink, 0);
  objc_storeStrong((id *)&self->_planPendingTransferGroup, 0);
  objc_storeStrong((id *)&self->_miscOptionsGroup, 0);
  objc_storeStrong((id *)&self->_topAppUsageGroup, 0);
  objc_storeStrong((id *)&self->_subscriptionContextMenus, 0);
  objc_storeStrong((id *)&self->_otherOptionsGroup, 0);
  objc_storeStrong((id *)&self->_pendingInstallPlanGroup, 0);
  objc_storeStrong((id *)&self->_QRCodeGroup, 0);
  objc_storeStrong((id *)&self->_addOnPlanGroup, 0);
  objc_storeStrong((id *)&self->_carrierItemGroup, 0);
  objc_storeStrong((id *)&self->_privateNetworkPlanListGroup, 0);
  objc_storeStrong((id *)&self->_cellularPlanListGroup, 0);
  objc_storeStrong((id *)&self->_cellularDataPlanDetailGroup, 0);
  objc_storeStrong((id *)&self->_cellularDataPlanListGroup, 0);
  objc_storeStrong((id *)&self->_crossPlatformSIMTransferSpecifier, 0);
  objc_storeStrong((id *)&self->_addCellularPlanSpecifier, 0);
  objc_storeStrong((id *)&self->_personalHotspotBundleController, 0);
  objc_storeStrong((id *)&self->_personalHotspotSpecifier, 0);
  objc_storeStrong((id *)&self->_facetimeSetupGroup, 0);
  objc_storeStrong((id *)&self->_facetimeSetupButton, 0);
}

@end