@interface PSUICarrierItemGroup
- (BOOL)hasCarrierItems;
- (BOOL)isCellNetworkSearchAuthorized;
- (BOOL)isFlowRunning;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSUICarrierItemGroup)init;
- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5 ctPlanManager:(id)a6 showCarrierItems:(BOOL)a7;
- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 showCarrierItems:(BOOL)a5;
- (id)addCellularPlanSpecifier;
- (id)getLogger;
- (id)specifiers;
- (id)specifiersForCarrierItems;
- (void)_addLocationFooterIfNecessary;
- (void)_handleAddCarrierItem:(id)a3 specifier:(id)a4;
- (void)carrierItemOptionPressed:(id)a3;
- (void)carrierItemPressed:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)turnOnLocationServicesPressed:(id)a3;
@end

@implementation PSUICarrierItemGroup

- (BOOL)isFlowRunning
{
  return self->_flow != 0;
}

- (PSUICarrierItemGroup)init
{
}

- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PSUICellularPlanManagerCache sharedInstance];
  v9 = [MEMORY[0x263F31978] sharedManager];
  v10 = [(PSUICarrierItemGroup *)self initWithListController:v7 groupSpecifier:v6 planManager:v8 ctPlanManager:v9 showCarrierItems:1];

  return v10;
}

- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 showCarrierItems:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[PSUICellularPlanManagerCache sharedInstance];
  v11 = [MEMORY[0x263F31978] sharedManager];
  v12 = [(PSUICarrierItemGroup *)self initWithListController:v9 groupSpecifier:v8 planManager:v10 ctPlanManager:v11 showCarrierItems:v5];

  return v12;
}

- (PSUICarrierItemGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5 ctPlanManager:(id)a6 showCarrierItems:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PSUICarrierItemGroup;
  v16 = [(PSUICarrierItemGroup *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_listController, v12);
    objc_storeStrong((id *)&v17->_groupSpecifier, a4);
    objc_storeStrong((id *)&v17->_cellularPlanManagerCache, a5);
    objc_storeStrong((id *)&v17->_ctCellularPlanManager, a6);
    v17->_showCarrierItems = a7;
    flow = v17->_flow;
    v17->_flow = 0;
  }
  return v17;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_showCarrierItems)
  {
    v4 = [(PSUICarrierItemGroup *)self specifiersForCarrierItems];
    [v3 addObjectsFromArray:v4];

    if ([v3 count])
    {
      BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v6 = [v5 localizedStringForKey:@"CELLULAR_CHOOSE_NETWORK" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)self->_groupSpecifier setName:v6];

      groupSpecifier = self->_groupSpecifier;
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = [v8 localizedStringForKey:@"CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)groupSpecifier setProperty:v9 forKey:*MEMORY[0x263F600F8]];
    }
    if (![v3 count]) {
      [(PSUICarrierItemGroup *)self _addLocationFooterIfNecessary];
    }
    if ((_os_feature_enabled_impl() & 1) == 0
      && [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache isActivationCodeFlowSupported])
    {
      v10 = [(PSUICarrierItemGroup *)self addCellularPlanSpecifier];
      if (v10) {
        [v3 addObject:v10];
      }
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v12 = [(PSUICarrierItemGroup *)self specifiersForCarrierItems];
    [v11 addObjectsFromArray:v12];

    if ([getCLLocationManagerClass_1() locationServicesEnabled])
    {
      id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"CARRIER_ITEM_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];

      BOOL v15 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache isCarrierItemBeingFetched];
      v16 = (void *)MEMORY[0x263F5FC40];
      if (v15)
      {
        v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D410CA0 target:self set:0 get:0 detail:0 cell:13 edit:0];
        [v17 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
        [v17 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      }
      else
      {
        v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v23 = [v22 localizedStringForKey:@"CARRIER_ITEM" value:&stru_26D410CA0 table:@"Cellular"];
        v17 = [v16 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];

        if (![v11 count])
        {
          v24 = [(PSUICarrierItemGroup *)self getLogger];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_221B17000, v24, OS_LOG_TYPE_DEFAULT, "No carrier item(s) is available in this location", v28, 2u);
          }

          [v17 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
          v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v26 = [v25 localizedStringForKey:@"NO_CARRIER_ITEM_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];

          id v14 = (void *)v26;
        }
      }
      [(PSSpecifier *)self->_groupSpecifier setProperty:v14 forKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      v18 = [(PSUICarrierItemGroup *)self getLogger];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "Location Services is off", buf, 2u);
      }

      v19 = (void *)MEMORY[0x263F5FC40];
      objc_super v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"CARRIER_ITEM" value:&stru_26D410CA0 table:@"Cellular"];
      v17 = [v19 preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v17 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
      [(PSUICarrierItemGroup *)self _addLocationFooterIfNecessary];
    }
    [v3 addObject:v17];
    [v17 setButtonAction:sel_carrierItemOptionPressed_];
  }
  return v3;
}

- (id)addCellularPlanSpecifier
{
  if (![(PSUICarrierItemGroup *)self hasCarrierItems])
  {
    p_addCellularPlanSpecifierStandard = &self->_addCellularPlanSpecifierStandard;
    addCellularPlanSpecifierStandard = self->_addCellularPlanSpecifierStandard;
    if (!addCellularPlanSpecifierStandard)
    {
      id v9 = [PSUIAddCellularPlanSpecifier alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      v10 = [(PSUIAddCellularPlanSpecifier *)v9 initWithHostController:WeakRetained isEmbeddedInCarrierList:0];
      addCellularPlanSpecifierEmbedded = self->_addCellularPlanSpecifierStandard;
      self->_addCellularPlanSpecifierStandard = v10;
      goto LABEL_7;
    }
LABEL_8:
    id v11 = addCellularPlanSpecifierStandard;
    goto LABEL_9;
  }
  if (self->_showCarrierItems)
  {
    p_addCellularPlanSpecifierStandard = &self->_addCellularPlanSpecifierEmbedded;
    addCellularPlanSpecifierStandard = self->_addCellularPlanSpecifierEmbedded;
    if (!addCellularPlanSpecifierStandard)
    {
      BOOL v5 = [PSUIAddCellularPlanSpecifier alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      id v7 = [(PSUIAddCellularPlanSpecifier *)v5 initWithHostController:WeakRetained isEmbeddedInCarrierList:1];
      addCellularPlanSpecifierEmbedded = self->_addCellularPlanSpecifierEmbedded;
      self->_addCellularPlanSpecifierEmbedded = v7;
LABEL_7:

      addCellularPlanSpecifierStandard = *p_addCellularPlanSpecifierStandard;
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = 0;
LABEL_9:
  return v11;
}

- (BOOL)hasCarrierItems
{
  if (![(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache isCarrierItemFlowSupported])return 0; {
  id v3 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache carrierItems];
  }
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)specifiersForCarrierItems
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
    && [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache isCarrierItemFlowSupported])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [(PSUICellularPlanManagerCache *)self->_cellularPlanManagerCache carrierItems];
    uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x263F5FC40];
          id v12 = [v10 name];
          id v13 = [v11 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setButtonAction:sel_carrierItemPressed_];
          [v13 setUserInfo:v10];
          [v3 addObject:v13];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v7);
    }

    id v14 = [(PSUICarrierItemGroup *)self getLogger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "Carrier Group specifiers:  %@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)carrierItemPressed:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [(PSUICarrierItemGroup *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  uint64_t v7 = [v5 warningText];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v5 warningText],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        v10))
  {
    id v11 = (void *)MEMORY[0x263F82418];
    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"CARRIER_LOCK_WARNING_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
    id v14 = [v5 warningText];
    BOOL v15 = [v11 alertControllerWithTitle:v13 message:v14 preferredStyle:1];

    v16 = (void *)MEMORY[0x263F82400];
    long long v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v18 = [v17 localizedStringForKey:@"CONTINUE" value:&stru_26D410CA0 table:@"Cellular"];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke;
    v26[3] = &unk_2645E18D8;
    v26[4] = self;
    id v27 = v5;
    id v28 = v4;
    long long v19 = [v16 actionWithTitle:v18 style:0 handler:v26];

    [v15 addAction:v19];
    long long v20 = (void *)MEMORY[0x263F82400];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke_63;
    v25[3] = &unk_2645E0CA0;
    v25[4] = self;
    v23 = [v20 actionWithTitle:v22 style:1 handler:v25];

    [v15 addAction:v23];
    uint64_t v24 = [(PSUICarrierItemGroup *)self listController];
    [v24 presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    BOOL v15 = [v5 plan];
    [(PSUICarrierItemGroup *)self _handleAddCarrierItem:v15 specifier:v4];
  }
}

void __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "continue pressed", v5, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) plan];
  [v3 _handleAddCarrierItem:v4 specifier:*(void *)(a1 + 48)];
}

void __43__PSUICarrierItemGroup_carrierItemPressed___block_invoke_63(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "cancel pressed", v2, 2u);
  }
}

- (void)_handleAddCarrierItem:(id)a3 specifier:(id)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x263F823E8];
  id v8 = a4;
  id v9 = (void *)[[v7 alloc] initWithActivityIndicatorStyle:100];
  uint64_t v10 = [v8 propertyForKey:*MEMORY[0x263F602B0]];

  [v10 setAccessoryView:v9];
  [v9 startAnimating];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v12 = [WeakRetained view];
  [v12 setUserInteractionEnabled:0];

  v27[0] = *MEMORY[0x263F66090];
  id v13 = [NSNumber numberWithUnsignedInteger:17];
  v27[1] = *MEMORY[0x263F660A8];
  v28[0] = v13;
  v28[1] = v6;
  id v14 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  BOOL v15 = [(PSUICarrierItemGroup *)self getLogger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v14;
    _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "launching flow with options: %@", buf, 0xCu);
  }

  v16 = [MEMORY[0x263F66078] flowWithOptions:v14];
  flow = self->_flow;
  self->_flow = v16;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  long long v18 = self->_flow;
  id v19 = objc_loadWeakRetained((id *)&self->_listController);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke;
  v22[3] = &unk_2645E1900;
  v22[4] = self;
  id v23 = v9;
  id v24 = v10;
  id v20 = v10;
  id v21 = v9;
  [(TSSIMSetupFlow *)v18 showFirstViewControllerWithHostController:v19 completion:v22];
}

void __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke(id *a1)
{
  id location = 0;
  objc_initWeak(&location, a1[4]);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke_2;
  v2[3] = &unk_2645E0D48;
  objc_copyWeak(&v5, &location);
  id v3 = a1[5];
  id v4 = a1[6];
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __56__PSUICarrierItemGroup__handleAddCarrierItem_specifier___block_invoke_2(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 8);
    id v4 = [v3 view];
    [v4 setUserInteractionEnabled:1];

    [a1[4] stopAnimating];
    [a1[5] setAccessoryView:0];
    id WeakRetained = v5;
  }
}

- (void)_addLocationFooterIfNecessary
{
  int v3 = _os_feature_enabled_impl();
  int v4 = [getCLLocationManagerClass_1() locationServicesEnabled];
  if (v4 && [(PSUICarrierItemGroup *)self isCellNetworkSearchAuthorized])
  {
    id v31 = +[PSUICellularPlanManagerCache sharedInstance];
    if ([v31 isActivationCodeFlowSupported])
    {
      id v5 = [MEMORY[0x263F82670] currentDevice];
      if (objc_msgSend(v5, "sf_isChinaRegionCellularDevice"))
      {
        id v6 = [MEMORY[0x263F82670] currentDevice];
        int v7 = objc_msgSend(v6, "sf_isiPad");

        if (!v7) {
          return;
        }
        id v31 = [(PSUICarrierItemGroup *)self groupSpecifier];
        id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v9 = [v8 localizedStringForKey:@"CELLULAR_SETUP_DATA_COLLECTION_DISCLOSURE" value:&stru_26D410CA0 table:@"Cellular"];
        [v31 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
      }
      else
      {
      }
    }
  }
  else
  {
    uint64_t v10 = [(PSUICarrierItemGroup *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Cellular: Location Services off", buf, 2u);
    }

    if (v4) {
      id v11 = @"prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES";
    }
    else {
      id v11 = @"prefs:root=Privacy&path=LOCATION";
    }
    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];

    id v14 = NSString;
    BOOL v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = v15;
    if (v3) {
      long long v17 = @"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_NEW_UI_%@";
    }
    else {
      long long v17 = @"TURN_ON_LOCATION_SERVICES_FAUX_CARD_SCANNER_FOOTER_%@";
    }
    long long v18 = [v15 localizedStringForKey:v17 value:&stru_26D410CA0 table:@"Cellular"];
    id v19 = objc_msgSend(v14, "stringWithFormat:", v18, v13);

    id v20 = [(PSUICarrierItemGroup *)self groupSpecifier];
    id v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    [v20 setProperty:v22 forKey:*MEMORY[0x263F600C0]];

    id v23 = [(PSUICarrierItemGroup *)self groupSpecifier];
    [v23 setProperty:v19 forKey:*MEMORY[0x263F600E8]];

    id v24 = [(PSUICarrierItemGroup *)self groupSpecifier];
    v34.id location = [v19 rangeOfString:v13];
    v25 = NSStringFromRange(v34);
    [v24 setProperty:v25 forKey:*MEMORY[0x263F600D0]];

    uint64_t v26 = [(PSUICarrierItemGroup *)self groupSpecifier];
    id v27 = [NSURL URLWithString:v11];
    [v26 setProperty:v27 forKey:*MEMORY[0x263F600F0]];

    id v28 = [(PSUICarrierItemGroup *)self groupSpecifier];
    v29 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v28 setProperty:v29 forKey:*MEMORY[0x263F600E0]];

    v30 = [(PSUICarrierItemGroup *)self groupSpecifier];
    [v30 setProperty:@"turnOnLocationServicesPressed:" forKey:*MEMORY[0x263F600C8]];
  }
}

- (void)turnOnLocationServicesPressed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICarrierItemGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v4 URL];
    int v14 = 138412290;
    BOOL v15 = v13;
    _os_log_debug_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v14, 0xCu);
  }
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)p_listController);
  int v8 = [WeakRetained isInModalPresentation];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_listController);
    uint64_t v10 = [v9 navigationController];
    [v10 dismissViewControllerAnimated:1 completion:0];
  }
  id v11 = [MEMORY[0x263F01880] defaultWorkspace];
  id v12 = [v4 URL];
  [v11 openSensitiveURL:v12 withOptions:0];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PSUICarrierItemGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E1730;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __46__PSUICarrierItemGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    id v5 = WeakRetained;

    id WeakRetained = v5;
    if (*(void *)(a1 + 40) != 1)
    {
      id v4 = objc_loadWeakRetained((id *)v5 + 8);
      [v4 dismissViewControllerAnimated:1 completion:0];

      id WeakRetained = v5;
    }
  }
}

- (void)carrierItemOptionPressed:(id)a3
{
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  int v5 = [WeakRetained isInModalPresentation];

  if (v5)
  {
    uint64_t v10 = [[PSUICarrierListController alloc] initWithOptions:0 showCarrierItemGroup:1];
    id v6 = objc_loadWeakRetained((id *)p_listController);
    int v7 = [v6 navigationController];
    [v7 pushViewController:v10 animated:1];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F829B8]);
    id v9 = [[PSUICarrierListController alloc] initWithOptions:0 showCarrierItemGroup:1];
    uint64_t v10 = (PSUICarrierListController *)[v8 initWithRootViewController:v9];

    [(PSUICarrierListController *)v10 setModalPresentationStyle:2];
    id v6 = objc_loadWeakRetained((id *)p_listController);
    [v6 presentViewController:v10 animated:1 completion:0];
  }
}

- (BOOL)isCellNetworkSearchAuthorized
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v2 = (uint64_t (*)(void))getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  id v12 = getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_1)
  {
    int v3 = (void *)CoreLocationLibrary_1();
    v10[3] = (uint64_t)dlsym(v3, "CLCopyAppsUsingLocation");
    getCLCopyAppsUsingLocationSymbolLoc_ptr_1 = (_UNKNOWN *)v10[3];
    v2 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    dlerror();
    id v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  id v4 = (void *)v2();
  int v5 = [v4 objectForKey:@"/System/Library/Frameworks/CoreTelephony.framework"];
  if (!v5)
  {
    int v5 = [v4 objectForKey:@"com.apple.locationd.bundle-/System/Library/Frameworks/CoreTelephony.framework"];
  }
  char v6 = [getCLLocationManagerClass_1() isEntityAuthorizedForLocationDictionary:v5];

  return v6;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierItemGroup"];
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_addCellularPlanSpecifierStandard, 0);
  objc_storeStrong((id *)&self->_addCellularPlanSpecifierEmbedded, 0);
  objc_storeStrong((id *)&self->_ctCellularPlanManager, 0);
  objc_storeStrong((id *)&self->_cellularPlanManagerCache, 0);
}

@end