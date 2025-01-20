@interface PSUIPlanPendingTransferMenusGroup
- (CTCellularPlanManager)cellularPlanManager;
- (CTCellularPlanPendingTransfer)planPendingTransfer;
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)parentSpecifier;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUIPlanPendingTransferMenusGroup)initWithHostController:(id)a3 parentSpecifier:(id)a4;
- (PSUIPlanPendingTransferMenusGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)activatePlanSpecifier;
- (id)cancelConsentRequestSpecifier;
- (id)getLogger;
- (id)planActivationInfo;
- (id)planPendingTransferLabel:(id)a3;
- (id)planPendingTransferNumber:(id)a3;
- (id)specifiers;
- (void)addSpecifierForHeaderString:(id)a3;
- (void)removePlanPendingTransfer:(id)a3;
- (void)setCellularPlanManager:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)setParentSpecifier:(id)a3;
- (void)setPlanManagerCache:(id)a3;
- (void)setPlanPendingTransfer:(id)a3;
@end

@implementation PSUIPlanPendingTransferMenusGroup

- (PSUIPlanPendingTransferMenusGroup)initWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSUIPlanPendingTransferMenusGroup;
  v8 = [(PSUIPlanPendingTransferMenusGroup *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parentSpecifier, a4);
    objc_storeWeak((id *)&v9->_listController, v6);
    uint64_t v10 = [MEMORY[0x263F31978] sharedManager];
    cellularPlanManager = v9->_cellularPlanManager;
    v9->_cellularPlanManager = (CTCellularPlanManager *)v10;

    uint64_t v12 = +[PSUICellularPlanManagerCache sharedInstance];
    planManagerCache = v9->_planManagerCache;
    v9->_planManagerCache = (PSUICellularPlanManagerCache *)v12;

    v14 = [(PSSpecifier *)v9->_parentSpecifier propertyForKey:*MEMORY[0x263F5FFF0]];
    uint64_t v15 = [(PSUICellularPlanManagerCache *)v9->_planManagerCache planPendingTransferFromReference:v14];
    planPendingTransfer = v9->_planPendingTransfer;
    v9->_planPendingTransfer = (CTCellularPlanPendingTransfer *)v15;
  }
  return v9;
}

- (id)specifiers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_planPendingTransfer)
  {
    [(PSUIPlanPendingTransferMenusGroup *)self addSpecifierForHeaderString:v3];
    v4 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v3 addObject:v4];
    v5 = [(PSUIPlanPendingTransferMenusGroup *)self activatePlanSpecifier];
    [v3 addObject:v5];
    id v6 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v8 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer deviceName];
      uint64_t v9 = [v8 length];

      if (!v9)
      {
LABEL_9:
        [v3 addObject:v4];
        if ([(CTCellularPlanPendingTransfer *)self->_planPendingTransfer status] != 2)
        {
          v27 = [(PSUIPlanPendingTransferMenusGroup *)self getLogger];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v35 = "-[PSUIPlanPendingTransferMenusGroup specifiers]";
            _os_log_debug_impl(&dword_221B17000, v27, OS_LOG_TYPE_DEBUG, "%s removing pending cellular plan", buf, 0xCu);
          }

          v28 = (void *)MEMORY[0x263F5FC40];
          v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v30 = [v29 localizedStringForKey:@"REMOVE_PENDING_CELLULAR_PLAN" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
          v31 = [v28 preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:0 cell:13 edit:0];

          [v31 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
          [v31 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
          [v31 setButtonAction:sel_removePlanPendingTransfer_];
          [v3 addObject:v31];
        }
        goto LABEL_14;
      }
      v33 = v5;
      uint64_t v10 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CARRIER_NAME"];
      v11 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer carrierName];
      [v10 setName:v11];

      [v3 addObject:v10];
      uint64_t v12 = (void *)MEMORY[0x263F5FC40];
      v13 = NSString;
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v14 localizedStringForKey:@"USED_ON_%@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      v16 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer deviceName];
      v17 = objc_msgSend(v13, "stringWithFormat:", v15, v16);
      objc_super v18 = [v12 preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:4 edit:0];

      [v3 addObject:v18];
    }
    else
    {
      v33 = v5;
      uint64_t v10 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CARRIER_NAME"];
      v19 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer carrierName];
      [v10 setName:v19];

      [v3 addObject:v10];
      v20 = (void *)MEMORY[0x263F5FC40];
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"CELLULAR_PLAN_LABEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      objc_super v18 = [v20 preferenceSpecifierNamed:v22 target:self set:0 get:sel_planPendingTransferLabel_ detail:0 cell:4 edit:0];

      [v3 addObject:v18];
      v23 = (void *)MEMORY[0x263F5FC40];
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"MY_NUMBER" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      v26 = [v23 preferenceSpecifierNamed:v25 target:self set:0 get:sel_planPendingTransferNumber_ detail:0 cell:4 edit:0];

      [v3 addObject:v26];
    }

    v5 = v33;
    goto LABEL_9;
  }
  v4 = [(PSUIPlanPendingTransferMenusGroup *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[PSUIPlanPendingTransferMenusGroup specifiers]";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s No specifiers to show, because there is no pending plan with the given plan reference", buf, 0xCu);
  }
LABEL_14:

  return v3;
}

- (PSUIPlanPendingTransferMenusGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)removePlanPendingTransfer:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [(PSUIPlanPendingTransferMenusGroup *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v9 = "-[PSUIPlanPendingTransferMenusGroup removePlanPendingTransfer:]";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  cellularPlanManager = self->_cellularPlanManager;
  planPendingTransfer = self->_planPendingTransfer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke;
  v7[3] = &unk_2645E0C20;
  v7[4] = self;
  [(CTCellularPlanManager *)cellularPlanManager deletePlanPendingTransfer:planPendingTransfer completion:v7];
}

void __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl(&dword_221B17000, v4, OS_LOG_TYPE_ERROR, "Failed to remove the plan pending transfer item: %@ with error: %@", buf, 0x16u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke_2;
    block[3] = &unk_2645E0B88;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__PSUIPlanPendingTransferMenusGroup_removePlanPendingTransfer___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) listController];
  v1 = [v3 navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

- (id)planPendingTransferLabel:(id)a3
{
  id v3 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer planLabel];
  v4 = [v3 label];

  return v4;
}

- (id)planPendingTransferNumber:(id)a3
{
  id v3 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer phoneNumber];
  v4 = +[SettingsCellularUtils formattedPhoneNumber:v3];

  return v4;
}

- (id)planActivationInfo
{
  p_isa = (id *)&self->super.isa;
  unint64_t v3 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer status];
  if (v3 - 2 < 2)
  {
    __int16 v9 = NSString;
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v7 localizedStringForKey:@"PLAN_PENDING_TRANSFER_CONSENT_%@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    uint64_t v11 = [p_isa[2] deviceName];
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_10;
  }
  if (v3 <= 1)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v8 = @"PLAN_PENDING_TRANSFER_ACTIVATION_PAD";
    }
    else {
      uint64_t v8 = @"PLAN_PENDING_TRANSFER_ACTIVATION";
    }
    p_isa = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    goto LABEL_9;
  }
LABEL_10:
  return p_isa;
}

- (id)activatePlanSpecifier
{
  unint64_t v4 = [(CTCellularPlanPendingTransfer *)self->_planPendingTransfer status];
  if (v4 >= 3)
  {
    if (v4 == 3)
    {
      id v2 = [(PSUIPlanPendingTransferMenusGroup *)self cancelConsentRequestSpecifier];
    }
  }
  else
  {
    uint64_t v5 = [PSUIPlanPendingTransferActivationButtonSpecifier alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    id v2 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)v5 initWithListController:WeakRetained planPendingTransfer:self->_planPendingTransfer];
  }
  return v2;
}

- (id)cancelConsentRequestSpecifier
{
  unint64_t v3 = [(PSUIPlanPendingTransferMenusGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Consent request has been sent for plan pending transfer", buf, 2u);
  }

  unint64_t v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"REQUEST_SENT" target:self set:0 get:0 detail:0 cell:4 edit:0];
  uint64_t v5 = +[PSUICellularPlanUniversalReference referenceFromCellularPlanPendingTransfer:self->_planPendingTransfer];
  [v4 setProperty:v5 forKey:*MEMORY[0x263F5FFF0]];

  [v4 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v4;
}

- (void)addSpecifierForHeaderString:(id)a3
{
  id v10 = a3;
  if ([(CTCellularPlanPendingTransfer *)self->_planPendingTransfer status] != 2)
  {
    unint64_t v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PLAN_PENDING_TRANSFER_MENUS"];
    p_groupSpecifier = &self->_groupSpecifier;
    objc_storeWeak((id *)&self->_groupSpecifier, v4);

    id v6 = [(PSUIPlanPendingTransferMenusGroup *)self planActivationInfo];
    id WeakRetained = objc_loadWeakRetained((id *)p_groupSpecifier);
    [WeakRetained setProperty:v6 forKey:*MEMORY[0x263F600F8]];

    id v8 = objc_loadWeakRetained((id *)p_groupSpecifier);
    [v8 setProperty:&unk_26D425DC8 forKey:*MEMORY[0x263F600B8]];

    id v9 = objc_loadWeakRetained((id *)p_groupSpecifier);
    [v10 addObject:v9];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PlanPendingTransferMenusGroup"];
}

- (PSSpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
{
}

- (CTCellularPlanPendingTransfer)planPendingTransfer
{
  return self->_planPendingTransfer;
}

- (void)setPlanPendingTransfer:(id)a3
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

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_storeStrong((id *)&self->_planPendingTransfer, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end