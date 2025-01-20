@interface PSUINetworkSettingsSubgroup
- (NSMutableArray)bundleControllers;
- (PSListController)listController;
- (PSSpecifier)parentSpecifier;
- (PSUINetworkSettingsSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUINetworkSettingsSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5;
- (id)specifiers;
- (void)setBundleControllers:(id)a3;
- (void)setListController:(id)a3;
- (void)setParentSpecifier:(id)a3;
@end

@implementation PSUINetworkSettingsSubgroup

- (PSUINetworkSettingsSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSUINetworkSettingsSubgroup;
  v9 = [(PSUINetworkSettingsSubgroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    objc_storeWeak((id *)&v10->_parentSpecifier, v8);
  }

  return v10;
}

- (PSUINetworkSettingsSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (id)specifiers
{
  v36[1] = *MEMORY[0x263EF8340];
  v30 = objc_opt_new();
  v3 = (NSMutableArray *)objc_opt_new();
  bundleControllers = self->_bundleControllers;
  self->_bundleControllers = v3;

  id v5 = [MEMORY[0x263F67EF0] sharedInstance];
  id v6 = [(PSUIVoiceAndDataSpecifier *)v5 subscriptionContexts];
  if ((unint64_t)[v6 count] <= 1)
  {
  }
  else
  {
    v29 = +[PSUICellularPlanManagerCache sharedInstance];
    id v7 = [v29 planItems];
    uint64_t v8 = [v7 count];
    v9 = +[PSUICellularPlanManagerCache sharedInstance];
    v10 = [v9 danglingPlanItems];
    uint64_t v11 = [v10 count] + v8;
    objc_super v12 = +[PSUICellularPlanManagerCache sharedInstance];
    v13 = [v12 plansPendingTransfer];
    unint64_t v14 = v11 + [v13 count];

    if (v14 < 2) {
      goto LABEL_7;
    }
    v15 = [PSUIVoiceAndDataSpecifier alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v17 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
    v18 = [v17 propertyForKey:*MEMORY[0x263F60290]];
    id v5 = [(PSUIVoiceAndDataSpecifier *)v15 initWithHostController:WeakRetained subscriptionContext:v18 groupSpecifierToUpdateFooterFor:0];

    if (v5) {
      [v30 addObject:v5];
    }
  }

LABEL_7:
  uint64_t v35 = *MEMORY[0x263F5FF68];
  v36[0] = @"EDGESettings";
  v19 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  v32 = v19;
  v33 = @"items";
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  v34 = v20;
  v21 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  id v22 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v23 = objc_loadWeakRetained((id *)&self->_listController);
  v24 = [v23 bundle];
  id v25 = objc_loadWeakRetained((id *)&self->_listController);
  id v31 = 0;
  v26 = SpecifiersFromPlist();

  id v27 = v31;
  -[NSMutableArray addObjectsFromArray:](self->_bundleControllers, "addObjectsFromArray:", v27, &v31);
  [v30 addObjectsFromArray:v26];

  return v30;
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
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end