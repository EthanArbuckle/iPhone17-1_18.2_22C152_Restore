@interface PSUINetworkSelectionSubgroup
- (CoreTelephonyClient)ctClient;
- (NSMutableArray)bundleControllers;
- (PSListController)listController;
- (PSSpecifier)parentSpecifier;
- (PSUINetworkSelectionSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUINetworkSelectionSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5;
- (id)getLogger;
- (id)localizedCellularNetworkName:(id)a3;
- (id)specifiers;
- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)reloadCellularNetworkSpecifier;
- (void)setBundleControllers:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setListController:(id)a3;
- (void)setParentSpecifier:(id)a3;
@end

@implementation PSUINetworkSelectionSubgroup

- (PSUINetworkSelectionSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSUINetworkSelectionSubgroup;
  v9 = [(PSUINetworkSelectionSubgroup *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    objc_storeWeak((id *)&v10->_parentSpecifier, v8);
    id v11 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v12 = [v11 initWithQueue:MEMORY[0x263EF83A0]];
    ctClient = v10->_ctClient;
    v10->_ctClient = (CoreTelephonyClient *)v12;

    [(CoreTelephonyClient *)v10->_ctClient setDelegate:v10];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v10 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];
  }
  return v10;
}

- (PSUINetworkSelectionSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (id)specifiers
{
  v23[1] = *MEMORY[0x263EF8340];
  v17 = objc_opt_new();
  v3 = (NSMutableArray *)objc_opt_new();
  bundleControllers = self->_bundleControllers;
  self->_bundleControllers = v3;

  uint64_t v22 = *MEMORY[0x263F5FF68];
  v23[0] = @"CellularNetworkTelephonySettings";
  id v5 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v19 = v5;
  v20 = @"items";
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  v21 = v6;
  id v7 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v9 = objc_loadWeakRetained((id *)&self->_listController);
  v10 = [v9 bundle];
  id v11 = objc_loadWeakRetained((id *)&self->_listController);
  id v18 = 0;
  uint64_t v12 = SpecifiersFromPlist();

  id v13 = v18;
  objc_msgSend(v12, "firstObject", &v18);
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    [v14 setTarget:self];
    *(void *)&v15[*MEMORY[0x263F5FE28]] = sel_localizedCellularNetworkName_;
  }
  [v17 addObjectsFromArray:v12];
  [(NSMutableArray *)self->_bundleControllers addObjectsFromArray:v13];

  return v17;
}

- (id)localizedCellularNetworkName:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v5 = [WeakRetained propertyForKey:*MEMORY[0x263F60290]];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = +[PSUICoreTelephonyRegistrationCache sharedInstance];
  id v7 = [v6 localizedOperatorName:v5];

  id v8 = [(PSUINetworkSelectionSubgroup *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Localized cellular network name: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (!v7) {
LABEL_5:
  }
    id v7 = &stru_26D410CA0;

  return v7;
}

- (void)reloadCellularNetworkSpecifier
{
  v3 = [(PSUINetworkSelectionSubgroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Reloading telephony settings", v8, 2u);
  }

  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v6 = [WeakRetained specifierForID:@"CELLULAR_NETWORK_TELEPHONY_SETTINGS"];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_listController);
    [v7 reloadSpecifier:v6 animated:1];
  }
}

- (void)networkSelected:(id)a3 success:(BOOL)a4 mode:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 slotID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v11 = [WeakRetained propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v12 = [v11 slotID];

  id v13 = [(PSUINetworkSelectionSubgroup *)self getLogger];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v9 == v12)
  {
    if (v14)
    {
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Network selected changed to %{public}@", (uint8_t *)&v15, 0xCu);
    }

    [(PSUINetworkSelectionSubgroup *)self reloadCellularNetworkSpecifier];
  }
  else
  {
    if (v14)
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring network selected for %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 slotID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  int v10 = [WeakRetained propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v11 = [v10 slotID];

  uint64_t v12 = [(PSUINetworkSelectionSubgroup *)self getLogger];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8 == v11)
  {
    if (v13)
    {
      int v14 = 138543362;
      id v15 = v7;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "Operator name changed to %{public}@", (uint8_t *)&v14, 0xCu);
    }

    [(PSUINetworkSelectionSubgroup *)self reloadCellularNetworkSpecifier];
  }
  else
  {
    if (v13)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring operator name change for %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"NetworkSelection"];
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
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

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (NSMutableArray)bundleControllers
{
  return self->_bundleControllers;
}

- (void)setBundleControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleControllers, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end