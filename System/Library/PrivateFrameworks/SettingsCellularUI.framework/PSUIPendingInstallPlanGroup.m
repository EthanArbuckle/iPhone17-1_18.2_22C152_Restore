@interface PSUIPendingInstallPlanGroup
- (CoreTelephonyClient)coreTelephonyClient;
- (PSListController)listController;
- (PSUIPendingInstallPlanGroup)init;
- (PSUIPendingInstallPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUIPendingInstallPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5;
- (id)getLogger;
- (id)specifiers;
- (id)specifiersForPendingInstallPlans;
- (void)pendingInstallPlanPressed:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setListController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIPendingInstallPlanGroup

- (PSUIPendingInstallPlanGroup)init
{
}

- (PSUIPendingInstallPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PSUICellularPlanManagerCache sharedInstance];
  v9 = [(PSUIPendingInstallPlanGroup *)self initWithListController:v7 groupSpecifier:v6 planManager:v8];

  return v9;
}

- (PSUIPendingInstallPlanGroup)initWithListController:(id)a3 groupSpecifier:(id)a4 planManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PSUIPendingInstallPlanGroup;
  v11 = [(PSUIPendingInstallPlanGroup *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_listController, v8);
    objc_storeStrong((id *)&v12->_groupSpecifier, a4);
    objc_storeStrong((id *)&v12->_cellularPlanManager, a5);
    id v13 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v14 = [v13 initWithQueue:MEMORY[0x263EF83A0]];
    coreTelephonyClient = v12->_coreTelephonyClient;
    v12->_coreTelephonyClient = (CoreTelephonyClient *)v14;

    [(CoreTelephonyClient *)v12->_coreTelephonyClient setDelegate:v12];
  }

  return v12;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(PSUIPendingInstallPlanGroup *)self specifiersForPendingInstallPlans];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)specifiersForPendingInstallPlans
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v6 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManager pendingInstallPlans];
    id v7 = [v6 plans];

    if ([v7 count])
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = [v7 objectAtIndex:v8];
        id v10 = NSString;
        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v12 = [v11 localizedStringForKey:@"PENDING_INSTALL_NAME_%@" value:&stru_26D410CA0 table:@"Cellular"];
        id v13 = [v9 carrierName];
        uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13);

        v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];
        [v15 setProperty:v9 forKey:@"plan"];
        [v15 setButtonAction:sel_pendingInstallPlanPressed_];
        [v3 addObject:v15];

        ++v8;
      }
      while ([v7 count] > v8);
    }
    v16 = [(PSUIPendingInstallPlanGroup *)self getLogger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v3;
      _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, "Pending install group specifiers: %@", buf, 0xCu);
    }
  }
  if ([v3 count])
  {
    groupSpecifier = self->_groupSpecifier;
    v18 = NSString;
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"PENDING_INSTALL_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];
    v21 = [v18 stringWithFormat:v20];
    [(PSSpecifier *)groupSpecifier setProperty:v21 forKey:*MEMORY[0x263F600F8]];
  }
  return v3;
}

- (void)pendingInstallPlanPressed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PSUIPendingInstallPlanGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = [v4 propertyForKey:@"plan"];
  coreTelephonyClient = self->_coreTelephonyClient;
  unint64_t v8 = [v6 plan];
  id v9 = [v6 carrierName];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__PSUIPendingInstallPlanGroup_pendingInstallPlanPressed___block_invoke;
  v13[3] = &unk_2645E1328;
  v13[4] = self;
  [(CoreTelephonyClient *)coreTelephonyClient startPendingPlanInstallationForPlan:v8 carrierName:v9 completionHandler:v13];

  id v10 = [(PSUICellularPlanManagerCache *)self->_cellularPlanManager planItems];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

void __57__PSUIPendingInstallPlanGroup_pendingInstallPlanPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
  {
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    id v4 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_221B17000, v4, OS_LOG_TYPE_ERROR, "Failed to install pending plan", v5, 2u);
    }
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(PSUIPendingInstallPlanGroup *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[PSUIPendingInstallPlanGroup simSetupFlowCompleted:]";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PSUIPendingInstallPlanGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0CD0;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __53__PSUIPendingInstallPlanGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained[4];
    WeakRetained[4] = 0;
    id v4 = WeakRetained;

    id v3 = objc_loadWeakRetained(v4 + 5);
    [v3 dismissViewControllerAnimated:1 completion:0];

    id WeakRetained = v4;
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PendingInstall"];
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
}

@end