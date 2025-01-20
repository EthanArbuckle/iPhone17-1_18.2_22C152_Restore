@interface PSUICellularDataPlanListGroup
+ (id)groupWithListController:(id)a3 groupSpecifier:(id)a4;
+ (id)key;
- (PSListController)listController;
- (PSSpecifier)addNewPlanSpecifier;
- (PSSpecifier)groupSpecifier;
- (PSUICellularDataPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (TSSIMSetupFlow)flow;
- (UIActivityIndicatorView)spinner;
- (UIViewController)firstViewController;
- (id)getLogger;
- (id)specifiers;
- (void)_infoSymbolTapped:(id)a3;
- (void)_showSpinner:(BOOL)a3;
- (void)_showWifiAlert;
- (void)addNewPlanPressed:(id)a3;
- (void)listController:(id)a3 didSelectSpecifier:(id)a4;
- (void)selectPlanWithSpecifier:(id)a3;
- (void)setAddNewPlanSpecifier:(id)a3;
- (void)setFirstViewController:(id)a3;
- (void)setFlow:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUpPendingTransferPlanSpecifiers:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)turnOnLocationServicesPressed:(id)a3;
@end

@implementation PSUICellularDataPlanListGroup

+ (id)key
{
  return (id)[NSString stringWithFormat:@"%@", objc_opt_class()];
}

+ (id)groupWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[PSUICellularDataPlanListGroup key];
  v8 = +[SSFlowHostCache sharedInstance];
  v9 = [v8 objectForKey:v7];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = [[PSUICellularDataPlanListGroup alloc] initWithListController:v5 groupSpecifier:v6];
  }
  v11 = v10;

  return v11;
}

- (PSUICellularDataPlanListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDataPlanListGroup;
  v8 = [(PSUICellularDataPlanListGroup *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
  }
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:v9 selector:sel__infoSymbolTapped_ name:@"PSDataPlanInfoSymbolTappedNotification" object:0];

  return v9;
}

- (void)turnOnLocationServicesPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularDataPlanListGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 URL];
    int v9 = 136315394;
    v10 = "-[PSUICellularDataPlanListGroup turnOnLocationServicesPressed:]";
    __int16 v11 = 2112;
    objc_super v12 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [MEMORY[0x263F01880] defaultWorkspace];
  v8 = [v4 URL];
  [v7 openSensitiveURL:v8 withOptions:0];
}

- (id)specifiers
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v78 = objc_alloc_init(MEMORY[0x263EFF980]);
  v2 = +[PSUICellularPlanManagerCache sharedInstance];
  v3 = [v2 planItems];

  id v4 = [MEMORY[0x263F67EF0] sharedInstance];
  v74 = [v4 subscriptionsInUse];

  if ([v74 count])
  {
    v77 = [v74 objectAtIndexedSubscript:0];
  }
  else
  {
    id v5 = [MEMORY[0x263F67EF0] sharedInstance];
    id v6 = [v5 subscriptionContexts];
    v77 = [v6 objectAtIndexedSubscript:0];
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v81;
    uint64_t v9 = *MEMORY[0x263F5FFE0];
    uint64_t v10 = *MEMORY[0x263F5FFF0];
    uint64_t v11 = *MEMORY[0x263F60290];
    uint64_t v75 = *MEMORY[0x263F60200];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v81 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x263F5FC40];
        v15 = [v13 name];
        v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

        [v16 setProperty:objc_opt_class() forKey:v9];
        v17 = +[PSUICellularPlanUniversalReference referenceFromPlanItem:v13];
        [v16 setProperty:v17 forKey:v10];

        [v16 setProperty:v77 forKey:v11];
        [v16 setUserInfo:v13];
        if ([v13 isSelected])
        {
          [v78 insertObject:v16 atIndex:0];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
          [WeakRetained setProperty:v16 forKey:v75];
        }
        else
        {
          [v78 addObject:v16];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v7);
  }

  if (+[SettingsCellularUtils shouldShowPendingTransferPlanOnPad])
  {
    [(PSUICellularDataPlanListGroup *)self setUpPendingTransferPlanSpecifiers:v78];
  }
  v19 = +[PSUICellularPlanManagerCache sharedInstance];
  int v20 = [v19 shouldShowAddPlan];

  if (v20)
  {
    v21 = (void *)MEMORY[0x263F5FC40];
    v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"CELLULAR_PLAN_NEW" value:&stru_26D410CA0 table:@"Cellular"];
    v24 = [v21 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];
    addNewPlanSpecifier = self->_addNewPlanSpecifier;
    self->_addNewPlanSpecifier = v24;

    [(PSSpecifier *)self->_addNewPlanSpecifier setIdentifier:@"CELLULAR_PLAN_NEW"];
    [(PSSpecifier *)self->_addNewPlanSpecifier setButtonAction:sel_addNewPlanPressed_];
    [v78 addObject:self->_addNewPlanSpecifier];
    v26 = +[PSUICellularPlanManagerCache sharedInstance];
    LODWORD(v21) = [v26 isSingleActivationCodeFlowSupported];

    if (v21)
    {
      uint64_t v89 = 0;
      v90 = &v89;
      uint64_t v91 = 0x2020000000;
      v27 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr;
      v92 = getCLCopyAppsUsingLocationSymbolLoc_ptr;
      if (!getCLCopyAppsUsingLocationSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v85 = 3221225472;
        v86 = __getCLCopyAppsUsingLocationSymbolLoc_block_invoke;
        v87 = &unk_2645E0D98;
        v88 = &v89;
        v28 = (void *)CoreLocationLibrary();
        v29 = dlsym(v28, "CLCopyAppsUsingLocation");
        *(void *)(v88[1] + 24) = v29;
        getCLCopyAppsUsingLocationSymbolLoc_ptr = *(_UNKNOWN **)(v88[1] + 24);
        v27 = (uint64_t (*)(void))v90[3];
      }
      _Block_object_dispose(&v89, 8);
      if (!v27)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      id v30 = (id)v27();
      v31 = [v30 objectForKey:@"/System/Library/Frameworks/CoreTelephony.framework"];
      if (!v31)
      {
        v31 = [v30 objectForKey:@"com.apple.locationd.bundle-/System/Library/Frameworks/CoreTelephony.framework"];
      }
      int v32 = [getCLLocationManagerClass() locationServicesEnabled];
      if (v32 & [getCLLocationManagerClass() isEntityAuthorizedForLocationDictionary:v31])
      {
        v33 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:@"CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE" value:&stru_26D410CA0 table:@"Cellular"];
        [v33 setProperty:v35 forKey:*MEMORY[0x263F600F8]];
      }
      else
      {
        v36 = [(PSUICellularDataPlanListGroup *)self getLogger];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221B17000, v36, OS_LOG_TYPE_DEFAULT, "Cellular: Location Services off", buf, 2u);
        }

        if (v32) {
          v37 = @"prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES";
        }
        else {
          v37 = @"prefs:root=Privacy&path=LOCATION";
        }
        v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v33 = [v38 localizedStringForKey:@"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];

        v39 = NSString;
        v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v41 = [v40 localizedStringForKey:@"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
        v34 = objc_msgSend(v39, "stringWithFormat:", v41, v33);

        id v42 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        [v42 setProperty:v44 forKey:*MEMORY[0x263F600C0]];

        id v45 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        [v45 setProperty:v34 forKey:*MEMORY[0x263F600E8]];

        id v46 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v96.location = [v34 rangeOfString:v33];
        v47 = NSStringFromRange(v96);
        [v46 setProperty:v47 forKey:*MEMORY[0x263F600D0]];

        id v48 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v49 = [NSURL URLWithString:v37];
        [v48 setProperty:v49 forKey:*MEMORY[0x263F600F0]];

        id v50 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        v51 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
        [v50 setProperty:v51 forKey:*MEMORY[0x263F600E0]];

        v35 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
        [v35 setProperty:@"turnOnLocationServicesPressed:" forKey:*MEMORY[0x263F600C8]];
      }
    }
    else
    {
      id v30 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v33 = [v31 localizedStringForKey:@"CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE" value:&stru_26D410CA0 table:@"Cellular"];
      [v30 setProperty:v33 forKey:*MEMORY[0x263F600F8]];
    }
  }
  v52 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v53 = [v52 userInterfaceIdiom];

  if ((v53 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v54 = +[PSUICellularPlanManagerCache sharedInstance];
    char v55 = [v54 isAnyLocalFlowTypeSupported];

    if ((v55 & 1) == 0)
    {
      v56 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v57 = [v56 localizedStringForKey:@"LEARN_MORE" value:&stru_26D410CA0 table:@"Cellular"];

      v58 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v59 = [v58 localizedStringForKey:@"APPLE_SIM_MESSAGE" value:&stru_26D410CA0 table:@"Cellular"];
      v60 = [v59 stringByAppendingString:@"\n"];
      v61 = [v60 stringByAppendingString:v57];

      id v62 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      [v62 setProperty:v61 forKey:*MEMORY[0x263F600E8]];

      id v63 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v97.location = [v61 rangeOfString:v57];
      v64 = NSStringFromRange(v97);
      [v63 setProperty:v64 forKey:*MEMORY[0x263F600D0]];

      id v65 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v66 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v66);
      [v65 setProperty:v67 forKey:*MEMORY[0x263F600C0]];

      id v68 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
      v69 = NSURL;
      v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v71 = [v70 localizedStringForKey:@"APPLE_SIM_LEARN_MORE_URL" value:&stru_26D410CA0 table:@"Cellular"];
      v72 = [v69 URLWithString:v71];
      [v68 setProperty:v72 forKey:*MEMORY[0x263F600F0]];
    }
  }

  return v78;
}

- (void)setUpPendingTransferPlanSpecifiers:(id)a3
{
  id v3 = a3;
  id v5 = [[PSUIPlanPendingTransferListGroup alloc] initWithListController:0 groupSpecifier:0];
  id v4 = [(PSUIPlanPendingTransferListGroup *)v5 specifiers];
  [v3 addObjectsFromArray:v4];
}

- (void)listController:(id)a3 didSelectSpecifier:(id)a4
{
  uint64_t v11 = 0;
  id v6 = a3;
  [v6 getGroup:&v11 row:0 ofSpecifier:a4];
  uint64_t v7 = objc_msgSend(v6, "specifierAtIndex:", objc_msgSend(v6, "indexOfGroup:", v11));

  uint64_t v8 = [v7 propertyForKey:*MEMORY[0x263F60168]];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = [v7 propertyForKey:*MEMORY[0x263F60200]];
    [(PSUICellularDataPlanListGroup *)self selectPlanWithSpecifier:v10];
  }
}

- (void)addNewPlanPressed:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[PSUICellularPlanManagerCache sharedInstance];
  char v6 = [v5 isCarrierItemFlowSupported];

  if (v6)
  {
    int v7 = _os_feature_enabled_impl();
    id v8 = objc_alloc(MEMORY[0x263F829B8]);
    int v9 = off_2645E0568;
    if (!v7) {
      int v9 = off_2645E0578;
    }
    id v10 = objc_alloc_init(*v9);
    uint64_t v11 = (void *)[v8 initWithRootViewController:v10];

    [v11 setModalPresentationStyle:2];
    objc_super v12 = [(PSUICellularDataPlanListGroup *)self listController];
    [v12 presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    uint64_t v13 = [(PSUICellularDataPlanListGroup *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "CarrierItemFlow is not supported.", buf, 2u);
    }

    if (!self->_flow
      || ([(PSUICellularDataPlanListGroup *)self listController],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 presentedViewController],
          v15 = objc_claimAutoreleasedReturnValue(),
          BOOL v16 = v15 == 0,
          v15,
          v14,
          v16))
    {
      if (+[SettingsCellularUtils noDataConnectivityAvailable])
      {
        v18 = [(PSUICellularDataPlanListGroup *)self getLogger];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "Data connectivity is not available to set up eSIM(s) on iPad", buf, 2u);
        }

        [(PSUICellularDataPlanListGroup *)self _showWifiAlert];
      }
      else
      {
        [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
        [(PSUICellularDataPlanListGroup *)self _showSpinner:1];
        uint64_t v27 = *MEMORY[0x263F66090];
        v19 = [NSNumber numberWithInteger:3];
        v28[0] = v19;
        int v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];

        v21 = [MEMORY[0x263F66078] flowWithOptions:v20];
        flow = self->_flow;
        self->_flow = v21;

        [(TSSIMSetupFlow *)self->_flow setDelegate:self];
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        v23 = self->_flow;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __51__PSUICellularDataPlanListGroup_addNewPlanPressed___block_invoke;
        v24[3] = &unk_2645E0CF8;
        objc_copyWeak(&v25, (id *)buf);
        v24[4] = self;
        [(TSSIMSetupFlow *)v23 firstViewController:v24];
        objc_destroyWeak(&v25);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v17 = [(PSUICellularDataPlanListGroup *)self getLogger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_221B17000, v17, OS_LOG_TYPE_ERROR, "Duplicate request to launch SimSetupSupport", buf, 2u);
      }
    }
  }
}

void __51__PSUICellularDataPlanListGroup_addNewPlanPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setFirstViewController:v3];
    char v6 = [objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
    [v6 setModalPresentationStyle:2];
    int v7 = [v5 listController];
    [v7 presentViewController:v6 animated:1 completion:0];

    [*(id *)(a1 + 32) _showSpinner:0];
    id v8 = +[SSFlowHostCache sharedInstance];
    int v9 = +[PSUICellularDataPlanListGroup key];
    [v8 setObject:v5 forKey:v9];
  }
  else
  {
    char v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "Invalid PSUICellularDataPlanListGroup", v10, 2u);
    }
  }
}

- (void)selectPlanWithSpecifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [(PSUICellularDataPlanListGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[PSUICellularDataPlanListGroup selectPlanWithSpecifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s selected plan %@", (uint8_t *)&v7, 0x16u);
  }

  char v6 = +[PSUICellularPlanManagerCache sharedInstance];
  [v6 setSelectedPlanItem:v4];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PSUICellularDataPlanListGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0E68;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__PSUICellularDataPlanListGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) addNewPlanSpecifier];
    [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    id v5 = [v4 navigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    int v7 = [*(id *)(a1 + 32) addNewPlanSpecifier];
    [v6 reloadSpecifier:v7];

    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = 0;

    id v10 = +[SSFlowHostCache sharedInstance];
    uint64_t v11 = +[PSUICellularDataPlanListGroup key];
    [v10 removeObjectForKey:v11];

    id WeakRetained = v12;
  }
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_spinner)
  {
    int v7 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v7;

    __int16 v9 = [(PSUICellularDataPlanListGroup *)self addNewPlanSpecifier];
    id v10 = [v9 propertyForKey:*MEMORY[0x263F602B0]];
    uint64_t v11 = [v10 accessoryView];
    id originAccessoryView = self->_originAccessoryView;
    self->_id originAccessoryView = v11;

    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    uint64_t v13 = [(PSUICellularDataPlanListGroup *)self addNewPlanSpecifier];
    v14 = [v13 propertyForKey:*MEMORY[0x263F602B0]];
    [v14 setAccessoryView:self->_originAccessoryView];

    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  id v5 = [(PSUICellularDataPlanListGroup *)self addNewPlanSpecifier];
  id v6 = [v5 propertyForKey:*MEMORY[0x263F602B0]];
  [v6 setAccessoryView:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
LABEL_6:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PSUICellularDataPlanListGroup__showSpinner___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __46__PSUICellularDataPlanListGroup__showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  v2 = [*(id *)(a1 + 32) addNewPlanSpecifier];
  [WeakRetained reloadSpecifier:v2];
}

- (void)_showWifiAlert
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"NOT_CONNECTED_TO_INTERNET" value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  id v5 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v3) = objc_msgSend(v5, "sf_isiPhone");
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v7 = v6;
  if (v3) {
    uint64_t v8 = @"TURN_ON_WIFI_TO_SETUP_ESIM";
  }
  else {
    uint64_t v8 = @"TURN_ON_WIFI_TO_SETUP_ESIM_IPAD";
  }
  __int16 v9 = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  id v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v4 message:v9 preferredStyle:1];
  uint64_t v11 = [MEMORY[0x263F82670] currentDevice];
  int v12 = objc_msgSend(v11, "sf_isChinaRegionCellularDevice");
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = v13;
  if (v12) {
    v15 = @"CHOOSE_WLAN";
  }
  else {
    v15 = @"CHOOSE_WIFI";
  }
  BOOL v16 = [v13 localizedStringForKey:v15 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  v17 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:&__block_literal_global_8];
  [v10 addAction:v17];
  v18 = (void *)MEMORY[0x263F82400];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __47__PSUICellularDataPlanListGroup__showWifiAlert__block_invoke_2;
  v23[3] = &unk_2645E0CA0;
  v23[4] = self;
  v21 = [v18 actionWithTitle:v20 style:1 handler:v23];

  [v10 addAction:v21];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained presentViewController:v10 animated:1 completion:0];
}

void __47__PSUICellularDataPlanListGroup__showWifiAlert__block_invoke()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __47__PSUICellularDataPlanListGroup__showWifiAlert__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "user canceled setting up eSIM", v2, 2u);
  }
}

- (void)_infoSymbolTapped:(id)a3
{
  id v7 = [a3 object];
  if (v7)
  {
    id v4 = [[PSUIDataPlanDetailsController alloc] initWithParentSpecifier:v7];
    [(PSUIDataPlanDetailsController *)v4 setSpecifier:v7];
    id v5 = [(PSUICellularDataPlanListGroup *)self listController];
    id v6 = [v5 navigationController];
    [v6 pushViewController:v4 animated:1];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDataPlanListGroup"];
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setGroupSpecifier:(id)a3
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

- (UIViewController)firstViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setFirstViewController:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFlow:(id)a3
{
}

- (PSSpecifier)addNewPlanSpecifier
{
  return self->_addNewPlanSpecifier;
}

- (void)setAddNewPlanSpecifier:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_firstViewController);
  objc_destroyWeak((id *)&self->_listController);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_addNewPlanSpecifier, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
}

@end