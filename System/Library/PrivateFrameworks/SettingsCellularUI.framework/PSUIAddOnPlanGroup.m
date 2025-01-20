@interface PSUIAddOnPlanGroup
- (BOOL)_shouldShowWiFiOffFooter;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSUIAddOnPlanGroup)init;
- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5 ctPlanManager:(id)a6 showAddOnPlans:(BOOL)a7;
- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 showAddOnPlans:(BOOL)a5;
- (TSSIMSetupFlow)flow;
- (id)getLogger;
- (id)specifiers;
- (id)specifiersForRemotePlans:(BOOL)a3;
- (void)_addButtonPressed:(id)a3;
- (void)_addOnPlanOptionPressed:(id)a3;
- (void)_addWiFiOffFooter;
- (void)_handleAddRemotePlan:(id)a3;
- (void)_turnOnWifiPressed:(id)a3;
- (void)setFlow:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIAddOnPlanGroup

- (PSUIAddOnPlanGroup)init
{
}

- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PSUICellularPlanManagerCache sharedInstance];
  v9 = [MEMORY[0x263F31978] sharedManager];
  v10 = [(PSUIAddOnPlanGroup *)self initWithListController:v7 groupSpecifier:v6 planManager:v8 ctPlanManager:v9 showAddOnPlans:1];

  return v10;
}

- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 showAddOnPlans:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[PSUICellularPlanManagerCache sharedInstance];
  v11 = [MEMORY[0x263F31978] sharedManager];
  v12 = [(PSUIAddOnPlanGroup *)self initWithListController:v9 groupSpecifier:v8 planManager:v10 ctPlanManager:v11 showAddOnPlans:v5];

  return v12;
}

- (PSUIAddOnPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5 ctPlanManager:(id)a6 showAddOnPlans:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PSUIAddOnPlanGroup;
  v16 = [(PSUIAddOnPlanGroup *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_listController, v12);
    objc_storeStrong((id *)&v17->_groupSpecifier, a4);
    objc_storeStrong((id *)&v17->_cellularPlanManager, a5);
    objc_storeStrong((id *)&v17->_ctCellularPlanManager, a6);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    remotePlansSpecifiers = v17->_remotePlansSpecifiers;
    v17->_remotePlansSpecifiers = v18;

    v17->_showAddOnPlans = a7;
  }

  return v17;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v4 = _os_feature_enabled_impl();
  if (self->_showAddOnPlans)
  {
    char v5 = v4;
    id v6 = [(PSUIAddOnPlanGroup *)self specifiersForRemotePlans:1];
    [v3 addObjectsFromArray:v6];

    if ([v3 count])
    {
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"ADD_ON_PLAN_CHOOSE_NETWORK" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)self->_groupSpecifier setName:v8];

      if ([(PSUICellularPlanManagerCache *)self->_cellularPlanManager remoteListFetchCompleted])
      {
        groupSpecifier = self->_groupSpecifier;
        v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v11 = v10;
        if (v5) {
          id v12 = @"ADD_ON_PLAN_FOOTER_NEW";
        }
        else {
          id v12 = @"ADD_ON_PLAN_FOOTER";
        }
        v23 = [v10 localizedStringForKey:v12 value:&stru_26D410CA0 table:@"Cellular"];
        [(PSSpecifier *)groupSpecifier setProperty:v23 forKey:*MEMORY[0x263F600F8]];
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F5FC40];
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"ADD_ON_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
    v16 = [v13 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v16 setButtonAction:sel__addOnPlanOptionPressed_];
    [v3 addObject:v16];
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    v18 = [(PSUIAddOnPlanGroup *)self specifiersForRemotePlans:0];
    [v17 addObjectsFromArray:v18];

    if ([(PSUIAddOnPlanGroup *)self _shouldShowWiFiOffFooter])
    {
      v19 = [(PSUIAddOnPlanGroup *)self getLogger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v19, OS_LOG_TYPE_DEFAULT, "WiFi/Cellular is off while iCloud signed in", buf, 2u);
      }

      [v16 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
      [(PSUIAddOnPlanGroup *)self _addWiFiOffFooter];
    }
    else if ([v17 count])
    {
      v20 = self->_groupSpecifier;
      objc_super v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"ADD_ON_PLAN_FOOTER_NEW" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)v20 setProperty:v22 forKey:*MEMORY[0x263F600F8]];
    }
    else
    {
      v24 = [(PSUIAddOnPlanGroup *)self getLogger];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_221B17000, v24, OS_LOG_TYPE_DEFAULT, "No add-on plan(s) is available", v26, 2u);
      }

      [v3 removeAllObjects];
    }
  }
  return v3;
}

- (id)specifiersForRemotePlans:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263F82670] currentDevice];
  char v6 = objc_msgSend(v5, "sf_isiPad");

  if ((v6 & 1) == 0)
  {
    v22 = self->_remotePlansSpecifiers;
LABEL_21:
    objc_super v21 = v22;
    goto LABEL_22;
  }
  BOOL v7 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManager isCarrierItemFlowSupported];
  remotePlansSpecifiers = self->_remotePlansSpecifiers;
  if (!v7)
  {
    v22 = remotePlansSpecifiers;
    goto LABEL_21;
  }
  [(NSMutableArray *)remotePlansSpecifiers removeAllObjects];
  if (!self->_showAddOnPlans
    && v3
    && ![(PSUICellularPlanManagerCache *)self->_cellularPlanManager remoteListFetchCompleted])
  {
    id v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:15 edit:0];
    [(NSMutableArray *)self->_remotePlansSpecifiers addObject:v9];
  }
  v10 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManager remotePlans];
  v11 = [v10 plans];

  if ([v11 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v11 objectAtIndex:v12];
      id v14 = [(PSUIAddOnPlanGroup *)self getLogger];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v13;
        _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "remote plan: %@", buf, 0xCu);
      }

      if ([(NSMutableArray *)v13 attributes] == 8)
      {
        id v15 = [(NSMutableArray *)v13 carrierName];
        carrierName = self->_carrierName;
        self->_carrierName = v15;

        id v17 = [[PSUICellularPlanAddOnPlanSpecifier alloc] initWithTarget:self action:sel__addButtonPressed_ displayPlan:v13];
        v18 = [(PSUICellularPlanAddOnPlanSpecifier *)v17 addButton];
        [v18 setTag:v12];

        [(NSMutableArray *)self->_remotePlansSpecifiers insertObject:v17 atIndex:v12];
      }
      else
      {
        id v17 = [(PSUIAddOnPlanGroup *)self getLogger];
        if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221B17000, &v17->super.super, OS_LOG_TYPE_DEFAULT, "plan not addon type, skipping...", buf, 2u);
        }
      }

      ++v12;
    }
    while ([v11 count] > v12);
  }
  v19 = [(PSUIAddOnPlanGroup *)self getLogger];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = self->_remotePlansSpecifiers;
    *(_DWORD *)buf = 138412290;
    v25 = v20;
    _os_log_impl(&dword_221B17000, v19, OS_LOG_TYPE_DEFAULT, "specifiers:  %@", buf, 0xCu);
  }

  objc_super v21 = self->_remotePlansSpecifiers;
LABEL_22:
  return v21;
}

- (void)_addButtonPressed:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [MEMORY[0x263F82670] currentDevice];
  char v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    BOOL v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_remotePlansSpecifiers, "objectAtIndexedSubscript:", [v4 tag]);
    id v8 = [(PSUIAddOnPlanGroup *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 userInfo];
      *(_DWORD *)buf = 138412290;
      v33 = v9;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Remote item pressed: %@", buf, 0xCu);
    }
    v10 = NSString;
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v12 = [v11 localizedStringForKey:@"ADD_ON_PLAN_ALERT_BODY_%@" value:&stru_26D410CA0 table:@"Cellular"];
    id v13 = [v7 userInfo];
    id v14 = [v13 carrierName];
    id v15 = objc_msgSend(v10, "stringWithFormat:", v12, v14);

    v16 = (void *)MEMORY[0x263F82418];
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"ADD_ON_PLAN_ALERT_TITILE" value:&stru_26D410CA0 table:@"Cellular"];
    v19 = [v16 alertControllerWithTitle:v18 message:v15 preferredStyle:1];

    v20 = (void *)MEMORY[0x263F82400];
    objc_super v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"NOT_ALLOW_BUTTON" value:&stru_26D410CA0 table:@"Cellular"];
    v23 = [v20 actionWithTitle:v22 style:1 handler:&__block_literal_global_19];

    [v19 addAction:v23];
    v24 = (void *)MEMORY[0x263F82400];
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v26 = [v25 localizedStringForKey:@"OK_BUTTON" value:&stru_26D410CA0 table:@"Cellular"];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __40__PSUIAddOnPlanGroup__addButtonPressed___block_invoke_2;
    v30[3] = &unk_2645E0F40;
    v30[4] = self;
    id v31 = v7;
    id v27 = v7;
    v28 = [v24 actionWithTitle:v26 style:0 handler:v30];

    [v19 addAction:v28];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [WeakRetained presentViewController:v19 animated:1 completion:0];
  }
  else
  {
    id v15 = [(PSUIAddOnPlanGroup *)self getLogger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_221B17000, v15, OS_LOG_TYPE_FAULT, "Invalid action", buf, 2u);
    }
  }
}

uint64_t __40__PSUIAddOnPlanGroup__addButtonPressed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAddRemotePlan:*(void *)(a1 + 40)];
}

- (void)_handleAddRemotePlan:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  char v6 = [WeakRetained view];
  [v6 setUserInteractionEnabled:0];

  BOOL v7 = [v4 addButton];
  [v7 setHidden:1];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  id v9 = [v4 propertyForKey:*MEMORY[0x263F602B0]];
  v10 = [v9 accessoryView];
  [v9 setAccessoryView:v8];
  [v8 startAnimating];
  v28[0] = *MEMORY[0x263F66090];
  v11 = [NSNumber numberWithInteger:17];
  v29[0] = v11;
  v28[1] = *MEMORY[0x263F660A8];
  unint64_t v12 = [v4 userInfo];
  id v13 = [v12 plan];
  v29[1] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

  id v15 = [MEMORY[0x263F66078] flowWithOptions:v14];
  flow = self->_flow;
  self->_flow = v15;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  id v17 = self->_flow;
  id v18 = objc_loadWeakRetained((id *)&self->_listController);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke;
  v23[3] = &unk_2645E1708;
  v23[4] = self;
  id v24 = v8;
  id v25 = v9;
  id v26 = v10;
  id v27 = v4;
  id v19 = v4;
  id v20 = v10;
  id v21 = v9;
  id v22 = v8;
  [(TSSIMSetupFlow *)v17 showFirstViewControllerWithHostController:v18 completion:v23];
}

void __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke(id *a1)
{
  id location = 0;
  objc_initWeak(&location, a1[4]);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke_2;
  v2[3] = &unk_2645E16E0;
  objc_copyWeak(&v7, &location);
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  id v6 = a1[8];
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __43__PSUIAddOnPlanGroup__handleAddRemotePlan___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 7);
    id v4 = [v3 view];
    [v4 setUserInteractionEnabled:1];

    [*(id *)(a1 + 32) stopAnimating];
    [*(id *)(a1 + 40) setAccessoryView:*(void *)(a1 + 48)];
    id v5 = [*(id *)(a1 + 56) addButton];
    [v5 setHidden:0];

    id WeakRetained = v6;
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__PSUIAddOnPlanGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E1730;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __44__PSUIAddOnPlanGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;
    id v5 = WeakRetained;

    id WeakRetained = v5;
    if (*(void *)(a1 + 40) != 1)
    {
      id v4 = [v5 listController];
      [v4 dismissViewControllerAnimated:1 completion:0];

      id WeakRetained = v5;
    }
  }
}

- (void)_addOnPlanOptionPressed:(id)a3
{
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  int v5 = [WeakRetained isInModalPresentation];

  if (v5)
  {
    v10 = [[PSUICarrierListController alloc] initWithOptions:1 showCarrierItemGroup:0];
    id v6 = objc_loadWeakRetained((id *)p_listController);
    id v7 = [v6 navigationController];
    [v7 pushViewController:v10 animated:1];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F829B8]);
    id v9 = [[PSUICarrierListController alloc] initWithOptions:1 showCarrierItemGroup:0];
    v10 = (PSUICarrierListController *)[v8 initWithRootViewController:v9];

    [(PSUICarrierListController *)v10 setModalPresentationStyle:2];
    id v6 = objc_loadWeakRetained((id *)p_listController);
    [v6 presentViewController:v10 animated:1 completion:0];
  }
}

- (BOOL)_shouldShowWiFiOffFooter
{
  v2 = +[PSUICellularPlanManagerCache sharedInstance];
  if ([v2 isSingleActivationCodeFlowSupported])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [MEMORY[0x263F82670] currentDevice];
    if (objc_msgSend(v4, "sf_isiPad"))
    {
      int v5 = [MEMORY[0x263EFB210] defaultStore];
      id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
      if (v6)
      {
        id v7 = +[PSUIDeviceWiFiState sharedInstance];
        if ([v7 isConnectedOverWiFi])
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          id v8 = +[PSUIDeviceCellularState sharedInstance];
          int v3 = [v8 isConnectedOverCellular] ^ 1;
        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_addWiFiOffFooter
{
  int v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v25 = [v3 localizedStringForKey:@"TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];

  id v4 = NSString;
  int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"TURN_ON_WIFI_FAUX_CARD_SCANNER_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v25);

  id v8 = [MEMORY[0x263F82670] currentDevice];
  int v9 = objc_msgSend(v8, "sf_isChinaRegionCellularDevice");

  if (v9)
  {
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_HYPERLINK_SUBSTRING" value:&stru_26D410CA0 table:@"Cellular"];

    unint64_t v12 = NSString;
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"TURN_ON_WLAN_FAUX_CARD_SCANNER_FOOTER_%@" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);

    id v7 = (void *)v15;
    id v25 = (id)v11;
  }
  groupSpecifier = self->_groupSpecifier;
  id v17 = (objc_class *)objc_opt_class();
  id v18 = NSStringFromClass(v17);
  [(PSSpecifier *)groupSpecifier setProperty:v18 forKey:*MEMORY[0x263F600C0]];

  [(PSSpecifier *)self->_groupSpecifier setProperty:v7 forKey:*MEMORY[0x263F600E8]];
  id v19 = self->_groupSpecifier;
  v27.id location = [v7 rangeOfString:v25];
  id v20 = NSStringFromRange(v27);
  [(PSSpecifier *)v19 setProperty:v20 forKey:*MEMORY[0x263F600D0]];

  id v21 = self->_groupSpecifier;
  id v22 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [(PSSpecifier *)v21 setProperty:v22 forKey:*MEMORY[0x263F600F0]];

  v23 = self->_groupSpecifier;
  id v24 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [(PSSpecifier *)v23 setProperty:v24 forKey:*MEMORY[0x263F600E0]];

  [(PSSpecifier *)self->_groupSpecifier setProperty:@"_turnOnWifiPressed:" forKey:*MEMORY[0x263F600C8]];
}

- (void)_turnOnWifiPressed:(id)a3
{
  int v3 = (void *)MEMORY[0x263F01880];
  id v4 = a3;
  id v6 = [v3 defaultWorkspace];
  int v5 = [v4 URL];

  [v6 openSensitiveURL:v5 withOptions:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AddOnPlan"];
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

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_remotePlansSpecifiers, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_ctCellularPlanManager, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
}

@end