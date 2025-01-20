@interface PSUICellularDataPlanDetailGroup
+ (id)accountManageButtonForPlanItem:(id)a3 target:(id)a4;
+ (id)specifiersFromCellularPlanItem:(id)a3 target:(id)a4;
+ (void)configurePlanSpecifiers:(id)a3 planItem:(id)a4 target:(id)a5;
- (BOOL)isFlowRunning;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSUICellularDataPlanDetailGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getLogger;
- (id)getPlanCellDataNumber:(id)a3;
- (id)getPlanDetailedStatus:(id)a3;
- (id)getPlanExpireDate:(id)a3;
- (id)getPlanPurchaseDate:(id)a3;
- (id)getPlanStatus:(id)a3;
- (id)getPlanStatusDataOnly:(id)a3;
- (id)getPlanStatusDate:(id)a3;
- (id)lastUpdatedText;
- (id)localizedManageAccountAlertTitle:(id)a3;
- (id)removeCellularPlanConfirmationMessage:(id)a3;
- (id)removeCellularPlanConfirmationTitle:(id)a3;
- (id)specifiers;
- (void)handleAccountSettingsTapped:(id)a3;
- (void)handleRemovePlanTapped:(id)a3;
- (void)managePlanPressed:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUICellularDataPlanDetailGroup

+ (id)specifiersFromCellularPlanItem:(id)a3 target:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [v6 plan];

  if (v9)
  {
    [a1 configurePlanSpecifiers:v8 planItem:v6 target:v7];
  }
  else
  {
    v10 = [MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDataPlanDetailGroup"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "+[PSUICellularDataPlanDetailGroup specifiersFromCellularPlanItem:target:]";
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid selected cellular plan", (uint8_t *)&v12, 0xCu);
    }
  }
  return v8;
}

+ (id)accountManageButtonForPlanItem:(id)a3 target:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 plan];
  int v8 = [v7 status];

  if (v8 == 1)
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = @"CELLULAR_ACCOUNT_OPTIONS_RENEW...";
    v11 = [v9 localizedStringForKey:@"CELLULAR_ACCOUNT_OPTIONS_RENEW..." value:&stru_26D410CA0 table:@"Cellular"];
  }
  else
  {
    int v12 = [v5 plan];
    v9 = [v12 carrierName];

    if ([v9 length])
    {
      v13 = NSString;
      uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"CELLULAR_ACCOUNT_OPTIONS_MANAGE_CARRIER_%@_ACCOUNT..." value:&stru_26D410CA0 table:@"Cellular"];
      v11 = objc_msgSend(v13, "stringWithFormat:", v15, v9);
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v14 localizedStringForKey:@"CELLULAR_ACCOUNT_OPTIONS_MANAGE_ACCOUNT..." value:&stru_26D410CA0 table:@"Cellular"];
    }

    v10 = 0;
  }

  v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:v6 set:0 get:0 detail:0 cell:13 edit:0];

  [v16 setIdentifier:v10];
  [v16 setButtonAction:sel_managePlanPressed_];
  if (([v5 isSelectable] & 1) == 0)
  {
    [v16 setCellType:4];
    [v16 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }

  return v16;
}

+ (void)configurePlanSpecifiers:(id)a3 planItem:(id)a4 target:(id)a5
{
  id v46 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v46)
  {
    v10 = [v8 plan];

    if (v10)
    {
      v11 = [v8 plan];
      int v12 = [v11 status];

      if (v12)
      {
        v13 = 0;
      }
      else
      {
        uint64_t v14 = [v8 plan];
        [v14 billingStartDate];
        double v16 = v15;

        if (v16 <= 0.0)
        {
          v13 = 0;
        }
        else
        {
          v17 = (void *)MEMORY[0x263F5FC40];
          v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v19 = [v18 localizedStringForKey:@"CELLULAR_PLAN_PURCHASE_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
          v13 = [v17 preferenceSpecifierNamed:v19 target:v9 set:0 get:sel_getPlanPurchaseDate_ detail:0 cell:4 edit:0];

          [v13 setIdentifier:@"CELLULAR_PLAN_PURCHASE_DATE"];
          [v46 addObject:v13];
        }
        v20 = [v8 plan];
        [v20 billingEndDate];
        double v22 = v21;

        if (v22 > 0.0)
        {
          v23 = (void *)MEMORY[0x263F5FC40];
          v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v25 = [v24 localizedStringForKey:@"CELLULAR_PLAN_EXPIRE_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
          v26 = [v23 preferenceSpecifierNamed:v25 target:v9 set:0 get:sel_getPlanExpireDate_ detail:0 cell:4 edit:0];

          [v26 setIdentifier:@"CELLULAR_PLAN_EXPIRE"];
          [v46 addObject:v26];
          v13 = v26;
        }
        v27 = [v8 plan];
        [v27 timestamp];
        double v29 = v28;

        if (v29 > 0.0)
        {
          v30 = (void *)MEMORY[0x263F5FC40];
          v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v32 = [v31 localizedStringForKey:@"CELLULAR_PLAN_STATUS_DATE_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
          v33 = [v30 preferenceSpecifierNamed:v32 target:v9 set:0 get:sel_getPlanStatusDate_ detail:0 cell:4 edit:0];

          [v33 setIdentifier:@"CELLULAR_PLAN_STATUS_DATE"];
          [v46 addObject:v33];
          v13 = v33;
        }
      }
      v34 = [v8 plan];
      v35 = [v34 phoneNumber];

      if ([v35 length])
      {
        v36 = (void *)MEMORY[0x263F5FC40];
        v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v38 = [v37 localizedStringForKey:@"CELLULAR_PLAN_CELL_NUMBER_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
        uint64_t v39 = [v36 preferenceSpecifierNamed:v38 target:v9 set:0 get:sel_getPlanCellDataNumber_ detail:0 cell:4 edit:0];

        [v46 addObject:v39];
        v13 = (void *)v39;
      }
      v40 = [v8 plan];
      v41 = [v40 accountURL];
      if (v41)
      {
      }
      else
      {
        if (!v8) {
          goto LABEL_17;
        }
        uint64_t v42 = [v8 plan];
        if (!v42) {
          goto LABEL_17;
        }
        v43 = (void *)v42;
        v44 = [v8 plan];
        char v45 = [v44 isDeleteNotAllowed];

        if (v45) {
          goto LABEL_18;
        }
      }
      v40 = [a1 accountManageButtonForPlanItem:v8 target:v9];
      [v46 addObject:v40];
LABEL_17:

LABEL_18:
    }
  }
}

- (PSUICellularDataPlanDetailGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDataPlanDetailGroup;
  id v8 = [(PSUICellularDataPlanDetailGroup *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
    flow = v9->_flow;
    v9->_flow = 0;
  }
  return v9;
}

- (id)specifiers
{
  v3 = +[PSUICellularPlanManagerCache sharedInstance];
  v4 = [v3 selectedPlanItem];

  id v5 = [(id)objc_opt_class() specifiersFromCellularPlanItem:v4 target:self];

  return v5;
}

- (id)lastUpdatedText
{
  v2 = +[PSUICellularPlanManagerCache sharedInstance];
  v3 = [v2 selectedPlanItem];

  v4 = [v3 plan];
  [v4 timestamp];
  double v6 = v5;

  if (v6 == 0.0)
  {
    double v15 = 0;
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F08790];
    id v8 = (void *)MEMORY[0x263EFF910];
    id v9 = [v3 plan];
    [v9 timestamp];
    v10 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = [v7 localizedStringFromDate:v10 dateStyle:2 timeStyle:1];

    objc_super v12 = NSString;
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"CELLULAR_PLAN_LAST_UPDATED" value:&stru_26D410CA0 table:@"Cellular"];
    double v15 = objc_msgSend(v12, "stringWithFormat:", v14, v11);
  }
  return v15;
}

- (BOOL)isFlowRunning
{
  return self->_flow != 0;
}

- (id)localizedManageAccountAlertTitle:(id)a3
{
  id v3 = a3;
  v4 = [v3 plan];
  int v5 = [v4 status];

  if (v5 == 1)
  {
    double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CELLULAR_ACCOUNT_OPTIONS_RENEW" value:&stru_26D410CA0 table:@"Cellular"];
  }
  else
  {
    id v8 = [v3 plan];
    double v6 = [v8 carrierName];

    if ([v6 length])
    {
      id v9 = NSString;
      v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"CELLULAR_ACCOUNT_OPTIONS_MANAGE_CARRIER_%@_ACCOUNT" value:&stru_26D410CA0 table:@"Cellular"];
      id v7 = objc_msgSend(v9, "stringWithFormat:", v11, v6);
    }
    else
    {
      v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v7 = [v10 localizedStringForKey:@"CELLULAR_ACCOUNT_OPTIONS_MANAGE_ACCOUNT" value:&stru_26D410CA0 table:@"Cellular"];
    }
  }
  return v7;
}

- (id)removeCellularPlanConfirmationMessage:(id)a3
{
  id v3 = [a3 plan];
  v4 = [v3 carrierName];

  if ([v4 length])
  {
    int v5 = NSString;
    double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"REMOVE_CARRIER_%@_PLAN_CONFIRMATION" value:&stru_26D410CA0 table:@"Cellular"];
    id v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v6 localizedStringForKey:@"REMOVE_PLAN_CONFIRMATION" value:&stru_26D410CA0 table:@"Cellular"];
  }

  return v8;
}

- (id)removeCellularPlanConfirmationTitle:(id)a3
{
  id v3 = [a3 plan];
  v4 = [v3 carrierName];

  if ([v4 length])
  {
    int v5 = NSString;
    double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"REMOVE_CARRIER_%@_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
    id v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v6 localizedStringForKey:@"REMOVE_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
  }

  return v8;
}

- (void)managePlanPressed:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v4 = +[PSUICellularPlanManagerCache sharedInstance];
  int v5 = [v4 selectedPlanItem];

  double v6 = [(PSUICellularDataPlanDetailGroup *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[PSUICellularDataPlanDetailGroup managePlanPressed:]";
    __int16 v28 = 2112;
    double v29 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  id v7 = (void *)MEMORY[0x263F82418];
  id v8 = [(PSUICellularDataPlanDetailGroup *)self localizedManageAccountAlertTitle:v5];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"MANAGE_ACCOUNT_DESCRIPTION" value:&stru_26D410CA0 table:@"Cellular"];
  v11 = [v7 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  objc_super v12 = [v5 plan];
  v13 = [v12 accountURL];

  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x263F82400];
    double v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v16 = [v15 localizedStringForKey:@"ACCOUNT_SETTINGS" value:&stru_26D410CA0 table:@"Cellular"];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke;
    v24[3] = &unk_2645E0F40;
    v24[4] = self;
    id v25 = v5;
    v17 = [v14 actionWithTitle:v16 style:0 handler:v24];

    [v11 addAction:v17];
  }
  v18 = (void *)MEMORY[0x263F82400];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke_2;
  v23[3] = &unk_2645E0CA0;
  v23[4] = self;
  double v21 = [v18 actionWithTitle:v20 style:1 handler:v23];

  [v11 addAction:v21];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

void __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) ctPlan];
  [v1 handleAccountSettingsTapped:v2];
}

void __53__PSUICellularDataPlanDetailGroup_managePlanPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "-[PSUICellularDataPlanDetailGroup managePlanPressed:]_block_invoke_2";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s cancel manage account", (uint8_t *)&v2, 0xCu);
  }
}

- (id)getPlanDetailedStatus:(id)a3
{
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  int v5 = PSUIFormatPlanStatusForPlan(v4);

  return v5;
}

- (id)getPlanStatus:(id)a3
{
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  if ([v4 isBackedByCellularPlan])
  {
    int v5 = [v4 plan];
    double v6 = PSUIGetPlanSubscriptionStatus([v5 status]);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)getPlanStatusDataOnly:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  int v5 = [v4 plan];
  double v6 = [v5 dataUsage];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v14 dataCapacity];
        double v11 = v11 + v15;
        [v14 dataUsed];
        double v12 = v12 + v16;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }

  v17 = NSString;
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"CELLULAR_PLAN_DATA_USAGE_SHORT" value:&stru_26D410CA0 table:@"Cellular"];
  v20 = [MEMORY[0x263F67F00] usageSizeString:v12];
  double v21 = [MEMORY[0x263F67F00] usageSizeString:v11];
  double v22 = objc_msgSend(v17, "stringWithFormat:", v19, v20, v21, (void)v24);

  return v22;
}

- (id)getPlanStatusDate:(id)a3
{
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  if ([v4 isBackedByCellularPlan])
  {
    int v5 = (void *)MEMORY[0x263F08790];
    double v6 = (void *)MEMORY[0x263EFF910];
    id v7 = [v4 plan];
    [v7 timestamp];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v9 = [v5 localizedStringFromDate:v8 dateStyle:2 timeStyle:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)getPlanPurchaseDate:(id)a3
{
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  if ([v4 isBackedByCellularPlan])
  {
    int v5 = (void *)MEMORY[0x263F08790];
    double v6 = (void *)MEMORY[0x263EFF910];
    id v7 = [v4 plan];
    [v7 billingStartDate];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v9 = [v5 localizedStringFromDate:v8 dateStyle:2 timeStyle:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)getPlanExpireDate:(id)a3
{
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  if ([v4 isBackedByCellularPlan])
  {
    int v5 = (void *)MEMORY[0x263F08790];
    double v6 = (void *)MEMORY[0x263EFF910];
    id v7 = [v4 plan];
    [v7 billingEndDate];
    uint64_t v8 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v9 = [v5 localizedStringFromDate:v8 dateStyle:2 timeStyle:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)getPlanCellDataNumber:(id)a3
{
  id v3 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v4 = [v3 selectedPlanItem];

  int v5 = [v4 plan];
  double v6 = [v5 phoneNumber];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v4 plan];
    uint64_t v9 = [v8 phoneNumber];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)handleAccountSettingsTapped:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(PSUICellularDataPlanDetailGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v15 = "-[PSUICellularDataPlanDetailGroup handleAccountSettingsTapped:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s account settings: %@", buf, 0x16u);
  }

  v12[0] = *MEMORY[0x263F66090];
  double v6 = [NSNumber numberWithUnsignedInteger:2];
  v12[1] = *MEMORY[0x263F660A8];
  v13[0] = v6;
  v13[1] = v4;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  uint64_t v8 = [(PSUICellularDataPlanDetailGroup *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v15 = "-[PSUICellularDataPlanDetailGroup handleAccountSettingsTapped:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s - launching flow with options: %@", buf, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x263F66078] flowWithOptions:v7];
  flow = self->_flow;
  self->_flow = v9;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSUICellularDataPlanDetailGroup_handleAccountSettingsTapped___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__PSUICellularDataPlanDetailGroup_handleAccountSettingsTapped___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F82670] currentDevice];
  int v3 = objc_msgSend(v2, "sf_isiPad");

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F829B8]);
    int v5 = [*(id *)(*(void *)(a1 + 32) + 8) firstViewController];
    id v7 = (id)[v4 initWithRootViewController:v5];

    [v7 setModalPresentationStyle:2];
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) firstViewController];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained presentViewController:v7 animated:1 completion:0];
}

- (void)handleRemovePlanTapped:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(PSUICellularDataPlanDetailGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v24 = "-[PSUICellularDataPlanDetailGroup handleRemovePlanTapped:]";
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s remove plan: %@", buf, 0x16u);
  }

  double v6 = (void *)MEMORY[0x263F82418];
  id v7 = [(PSUICellularDataPlanDetailGroup *)self removeCellularPlanConfirmationTitle:v4];
  uint64_t v8 = [(PSUICellularDataPlanDetailGroup *)self removeCellularPlanConfirmationMessage:v4];
  uint64_t v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

  uint64_t v10 = (void *)MEMORY[0x263F82400];
  double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v12 = [v11 localizedStringForKey:@"REMOVE" value:&stru_26D410CA0 table:@"Cellular"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke;
  v21[3] = &unk_2645E0F40;
  v21[4] = self;
  id v22 = v4;
  id v13 = v4;
  uint64_t v14 = [v10 actionWithTitle:v12 style:2 handler:v21];

  [v9 addAction:v14];
  double v15 = (void *)MEMORY[0x263F82400];
  __int16 v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_106;
  v20[3] = &unk_2645E0CA0;
  v20[4] = self;
  uint64_t v18 = [v15 actionWithTitle:v17 style:1 handler:v20];

  [v9 addAction:v18];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained presentViewController:v9 animated:1 completion:0];
}

void __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v8 = "-[PSUICellularDataPlanDetailGroup handleRemovePlanTapped:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s confirmed remove plan: %@", buf, 0x16u);
  }

  id v4 = [MEMORY[0x263F31978] sharedManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_104;
  v6[3] = &unk_2645E17B0;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  [v4 didDeletePlanItem:v5 completion:v6];
}

void __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_104(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Failed to delete plan item: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __58__PSUICellularDataPlanDetailGroup_handleRemovePlanTapped___block_invoke_106(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    uint64_t v3 = "-[PSUICellularDataPlanDetailGroup handleRemovePlanTapped:]_block_invoke";
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "%s cancel remove plan", (uint8_t *)&v2, 0xCu);
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PSUICellularDataPlanDetailGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0E68;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PSUICellularDataPlanDetailGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = [v3 navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDataPlanDetailGroup"];
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end