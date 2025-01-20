@interface PSUIPlanPendingTransferListGroup
- (BOOL)_isChinaRegionCellularDevice;
- (BOOL)_isInChina;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)transferPlanSpecifier;
- (PSUIPlanPendingTransferListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getLogger;
- (id)specifiers;
- (void)_showSpinner:(BOOL)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)setTransferPlanSpecifier:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)transferablePlanPressed:(id)a3;
@end

@implementation PSUIPlanPendingTransferListGroup

- (PSUIPlanPendingTransferListGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSUIPlanPendingTransferListGroup;
  v8 = [(PSUIPlanPendingTransferListGroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeStrong((id *)&v9->_groupSpecifier, a4);
  }

  return v9;
}

- (id)specifiers
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v32 = (id)objc_opt_new();
  v31 = self;
  if (!_os_feature_enabled_impl())
  {
    v14 = +[PSUICellularPlanManagerCache sharedInstance];
    v15 = [v14 plansPendingTransfer];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v34;
      uint64_t v29 = *MEMORY[0x263F5FFE0];
      uint64_t v18 = *MEMORY[0x263F5FFF0];
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x263F5FC40];
          v22 = [v20 carrierName];
          v23 = [MEMORY[0x263F82670] currentDevice];
          uint64_t v24 = [v23 userInterfaceIdiom];

          if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            uint64_t v25 = 0;
          }
          else {
            uint64_t v25 = objc_opt_class();
          }
          v26 = [v21 preferenceSpecifierNamed:v22 target:v31 set:0 get:0 detail:v25 cell:2 edit:0];

          if ((unint64_t)[v20 status] <= 3) {
            [v26 setProperty:objc_opt_class() forKey:v29];
          }
          v27 = +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:v20];
          [v26 setProperty:v27 forKey:v18];

          [v32 addObject:v26];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v16);
    }
    v13 = obj;
    v12 = obj;
    goto LABEL_23;
  }
  if (![(PSUIPlanPendingTransferListGroup *)self _isChinaRegionCellularDevice]) {
    goto LABEL_7;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  v3 = (void *)_MergedGlobals_67;
  uint64_t v41 = _MergedGlobals_67;
  if (!_MergedGlobals_67)
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __getCLLocationManagerClass_block_invoke_1;
    v37[3] = &unk_2645E0D98;
    v37[4] = &v38;
    __getCLLocationManagerClass_block_invoke_1((uint64_t)v37);
    v3 = (void *)v39[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v38, 8);
  if ([v4 locationServicesEnabled])
  {
    self = v31;
    if (![(PSUIPlanPendingTransferListGroup *)v31 _isInChina])
    {
LABEL_7:
      transferPlanSpecifier = self->_transferPlanSpecifier;
      if (!transferPlanSpecifier)
      {
        id v6 = (void *)MEMORY[0x263F5FC40];
        id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v8 = [v7 localizedStringForKey:@"TRANSFER_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
        uint64_t v9 = [v6 preferenceSpecifierNamed:v8 target:v31 set:0 get:0 detail:0 cell:13 edit:0];
        v10 = v31->_transferPlanSpecifier;
        v31->_transferPlanSpecifier = (PSSpecifier *)v9;

        [(PSSpecifier *)v31->_transferPlanSpecifier setButtonAction:sel_transferablePlanPressed_];
        transferPlanSpecifier = v31->_transferPlanSpecifier;
      }
      [v32 addObject:transferPlanSpecifier];
      groupSpecifier = v31->_groupSpecifier;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"TRANSFER_PLAN_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)groupSpecifier setProperty:v13 forKey:*MEMORY[0x263F600F8]];
LABEL_23:
    }
  }
  return v32;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__PSUIPlanPendingTransferListGroup_simSetupFlowCompleted___block_invoke;
  v3[3] = &unk_2645E0CD0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __58__PSUIPlanPendingTransferListGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained[1];
    WeakRetained[1] = 0;
    id v4 = WeakRetained;

    id v3 = objc_loadWeakRetained(v4 + 5);
    [v3 dismissViewControllerAnimated:1 completion:0];

    WeakRetained = v4;
  }
}

- (void)transferablePlanPressed:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  [(PSUIPlanPendingTransferListGroup *)self _showSpinner:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v6 = [WeakRetained view];
  [v6 setUserInteractionEnabled:0];

  uint64_t v17 = *MEMORY[0x263F66090];
  id v7 = [NSNumber numberWithInteger:3];
  v18[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  uint64_t v9 = [MEMORY[0x263F66078] flowWithOptions:v8];
  flow = self->_flow;
  self->_flow = v9;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  id location = 0;
  objc_initWeak(&location, self);
  objc_super v11 = self->_flow;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__PSUIPlanPendingTransferListGroup_transferablePlanPressed___block_invoke;
  v13[3] = &unk_2645E1468;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  id v12 = v4;
  id v14 = v12;
  [(TSSIMSetupFlow *)v11 firstViewController:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __60__PSUIPlanPendingTransferListGroup_transferablePlanPressed___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 5);
    int v7 = [v6 isInModalPresentation];

    if (v7)
    {
      id v8 = objc_loadWeakRetained(v5 + 5);
      uint64_t v9 = [v8 navigationController];
      [v9 pushViewController:v3 animated:1];
    }
    else
    {
      id v8 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
      [v8 setModalPresentationStyle:2];
      uint64_t v9 = objc_loadWeakRetained(v5 + 5);
      [v9 presentViewController:v8 animated:1 completion:0];
    }

    id v11 = objc_loadWeakRetained(v5 + 5);
    id v12 = [v11 view];
    [v12 setUserInteractionEnabled:1];

    [a1[5] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    [a1[4] _showSpinner:0];
  }
  else
  {
    v10 = [a1[4] getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Invalid specifier", v13, 2u);
    }
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

    uint64_t v9 = [(PSUIPlanPendingTransferListGroup *)self transferPlanSpecifier];
    v10 = [v9 propertyForKey:*MEMORY[0x263F602B0]];
    id v11 = [v10 accessoryView];
    id originAccessoryView = self->_originAccessoryView;
    self->_id originAccessoryView = v11;

    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    v13 = [(PSUIPlanPendingTransferListGroup *)self transferPlanSpecifier];
    id v14 = [v13 propertyForKey:*MEMORY[0x263F602B0]];
    [v14 setAccessoryView:self->_originAccessoryView];

    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(PSUIPlanPendingTransferListGroup *)self transferPlanSpecifier];
  id v6 = [v5 propertyForKey:*MEMORY[0x263F602B0]];
  [v6 setAccessoryView:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
LABEL_6:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PSUIPlanPendingTransferListGroup__showSpinner___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __49__PSUIPlanPendingTransferListGroup__showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  id v2 = [*(id *)(a1 + 32) transferPlanSpecifier];
  [WeakRetained reloadSpecifier:v2];
}

- (BOOL)_isChinaRegionCellularDevice
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isChinaRegionCellularDevice"))
  {
    BOOL v3 = [MEMORY[0x263F82670] currentDevice];
    char v4 = objc_msgSend(v3, "sf_isiPad");
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_isInChina
{
  id v2 = +[PSUICellularPlanManagerCache sharedInstance];
  char v3 = [v2 isCarrierItemFlowSupported] ^ 1;

  return v3;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PendingXferListGroup"];
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

- (PSSpecifier)transferPlanSpecifier
{
  return self->_transferPlanSpecifier;
}

- (void)setTransferPlanSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferPlanSpecifier, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end