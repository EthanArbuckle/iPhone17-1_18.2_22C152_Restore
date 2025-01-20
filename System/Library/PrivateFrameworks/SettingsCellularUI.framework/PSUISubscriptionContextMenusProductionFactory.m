@interface PSUISubscriptionContextMenusProductionFactory
- (BOOL)popViewControllerOnPlanRemoval;
- (BOOL)shouldPopViewControllerOnPlanRemoval;
- (PSListController)hostController;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)parentSpecifier;
- (PSUISubscriptionContextMenusProductionFactory)initWithHostController:(id)a3 parentSpecifier:(id)a4 groupSpecifier:(id)a5 popViewControllerOnPlanRemoval:(BOOL)a6;
- (id)createCallCache;
- (id)createCallingSubgroup;
- (id)createCapabilitiesCache;
- (id)createCarrierBundleCache;
- (id)createCarrierSpaceSubgroup;
- (id)createCellularPlanManager;
- (id)createCellularPlanManagerCache;
- (id)createDataCache;
- (id)createDataModeSubgroupWithContext:(id)a3;
- (id)createMyNumberSubgroup;
- (id)createNetworkSelectionSubgroup;
- (id)createNetworkSettingsSubgroup;
- (id)createPasscodeStatusCache;
- (id)createRoamingSpecifiersSubgroupWithServiceDescriptor:(id)a3;
- (id)createSatelliteSubgroupWithContext:(id)a3;
- (id)createSimStatusCache;
- (id)createSimSubgroup;
- (void)setGroupSpecifier:(id)a3;
- (void)setHostController:(id)a3;
- (void)setParentSpecifier:(id)a3;
- (void)setPopViewControllerOnPlanRemoval:(BOOL)a3;
@end

@implementation PSUISubscriptionContextMenusProductionFactory

- (PSUISubscriptionContextMenusProductionFactory)initWithHostController:(id)a3 parentSpecifier:(id)a4 groupSpecifier:(id)a5 popViewControllerOnPlanRemoval:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSUISubscriptionContextMenusProductionFactory;
  v13 = [(PSUISubscriptionContextMenusProductionFactory *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_hostController, v10);
    objc_storeWeak((id *)&v14->_parentSpecifier, v11);
    objc_storeWeak((id *)&v14->_groupSpecifier, v12);
    v14->_popViewControllerOnPlanRemoval = a6;
  }

  return v14;
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (PSSpecifier)parentSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (BOOL)shouldPopViewControllerOnPlanRemoval
{
  return self->_popViewControllerOnPlanRemoval;
}

- (id)createCallingSubgroup
{
  v3 = [PSUICallingSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  id v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v7 = [(PSUICallingSubgroup *)v3 initWithListController:WeakRetained groupSpecifier:v5 parentSpecifier:v6];

  return v7;
}

- (id)createCarrierSpaceSubgroup
{
  v3 = [PSUICarrierSpaceGroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  id v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v7 = objc_alloc(MEMORY[0x263F02D30]);
  v8 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"carrier_space"];
  v9 = (void *)[v7 initWithQueue:v8];
  id v10 = [(PSUICarrierSpaceGroup *)v3 initWithListController:WeakRetained groupSpecifier:v5 parentSpecifier:v6 ctClient:v9];

  return v10;
}

- (id)createNetworkSelectionSubgroup
{
  v3 = [PSUINetworkSelectionSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  id v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v7 = [(PSUINetworkSelectionSubgroup *)v3 initWithListController:WeakRetained groupSpecifier:v5 parentSpecifier:v6];

  return v7;
}

- (id)createMyNumberSubgroup
{
  v3 = [PSUIMyNumberSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  id v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v7 = [(PSUIMyNumberSubgroup *)v3 initWithListController:WeakRetained groupSpecifier:v5 parentSpecifier:v6];

  return v7;
}

- (id)createNetworkSettingsSubgroup
{
  v3 = [PSUINetworkSettingsSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  id v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v7 = [(PSUINetworkSettingsSubgroup *)v3 initWithListController:WeakRetained groupSpecifier:v5 parentSpecifier:v6];

  return v7;
}

- (id)createSimSubgroup
{
  v3 = [PSUISIMSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v5 = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  id v6 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  id v7 = [(PSUISIMSubgroup *)v3 initWithListController:WeakRetained groupSpecifier:v5 parentSpecifier:v6];

  return v7;
}

- (id)createCallCache
{
  return +[PSUICoreTelephonyCallCache sharedInstance];
}

- (id)createSimStatusCache
{
  return (id)[MEMORY[0x263F67EF0] sharedInstance];
}

- (id)createCarrierBundleCache
{
  return +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
}

- (id)createDataCache
{
  return +[PSUICoreTelephonyDataCache sharedInstance];
}

- (id)createCellularPlanManagerCache
{
  return +[PSUICellularPlanManagerCache sharedInstance];
}

- (id)createCellularPlanManager
{
  return (id)[MEMORY[0x263F31978] sharedManager];
}

- (id)createPasscodeStatusCache
{
  return +[PSUIDevicePasscodeState sharedInstance];
}

- (id)createDataModeSubgroupWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [PSUIDataModeSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v7 = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  v8 = +[PSUICoreTelephonyDataCache sharedInstance];
  id v9 = objc_alloc(MEMORY[0x263F02D30]);
  id v10 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"data_mode"];
  id v11 = (void *)[v9 initWithQueue:v10];
  id v12 = [(PSUIDataModeSubgroup *)v5 initWithHostController:WeakRetained parentSpecifier:v7 dataCache:v8 context:v4 ctClient:v11];

  return v12;
}

- (id)createRoamingSpecifiersSubgroupWithServiceDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [PSUIRoamingSpecifiersSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v7 = +[PSUICoreTelephonyDataCache sharedInstance];
  v8 = [(PSUIRoamingSpecifiersSubgroup *)v5 initWithListController:WeakRetained dataCache:v7 serviceDescriptor:v4];

  return v8;
}

- (id)createSatelliteSubgroupWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [PSUISatelliteSubgroup alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v7 = [(PSUISatelliteSubgroup *)v5 initWithHostController:WeakRetained context:v4];

  return v7;
}

- (id)createCapabilitiesCache
{
  return +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
}

- (void)setHostController:(id)a3
{
}

- (void)setParentSpecifier:(id)a3
{
}

- (void)setGroupSpecifier:(id)a3
{
}

- (BOOL)popViewControllerOnPlanRemoval
{
  return self->_popViewControllerOnPlanRemoval;
}

- (void)setPopViewControllerOnPlanRemoval:(BOOL)a3
{
  self->_popViewControllerOnPlanRemoval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_hostController);
}

@end