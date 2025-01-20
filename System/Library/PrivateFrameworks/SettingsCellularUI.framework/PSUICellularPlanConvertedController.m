@interface PSUICellularPlanConvertedController
- (CTCellularPlanItem)planItem;
- (NSString)planStatus;
- (PSSpecifier)weakReactivateSpecifier;
- (PSSpecifier)weakStatusSpecifier;
- (PSUICellularPlanUniversalReference)planReference;
- (id)_labelSpecifier;
- (id)_phoneNumber:(id)a3;
- (id)_phoneNumberSpecifier;
- (id)_planLabel:(id)a3;
- (id)_reactivateSIMSpecifier;
- (id)_removeSIMSpecifier;
- (id)_simTypeSpecifier;
- (id)_status:(id)a3;
- (id)_statusSpecifier;
- (id)_turnOnThisLineSpecifier;
- (id)getLogger;
- (id)specifiers;
- (void)_cellularPlanChanged:(id)a3;
- (void)_maybeAddRemoveCellularPlanSpecifier:(id)a3;
- (void)_updatePlanStatus:(id)a3;
- (void)_updateReactivateSpecifier:(id)a3;
- (void)_updateStatusSpecifier:(id)a3;
- (void)dealloc;
- (void)setPlanItem:(id)a3;
- (void)setPlanReference:(id)a3;
- (void)setPlanStatus:(id)a3;
- (void)setWeakReactivateSpecifier:(id)a3;
- (void)setWeakStatusSpecifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation PSUICellularPlanConvertedController

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [(PSUICellularPlanConvertedController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEBUG, "dealloc : %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularPlanConvertedController;
  [(PSUICellularPlanConvertedController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PSUICellularPlanConvertedController;
  [(PSUICellularPlanConvertedController *)&v10 viewDidLoad];
  v3 = [(PSUICellularPlanConvertedController *)self specifier];
  objc_super v4 = [v3 propertyForKey:*MEMORY[0x263F5FFF0]];
  planReference = self->_planReference;
  self->_planReference = v4;

  v6 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v7 = [v6 planFromReferenceSafe:self->_planReference];
  planItem = self->_planItem;
  self->_planItem = v7;

  [(PSUICellularPlanConvertedController *)self _updatePlanStatus:self->_planItem];
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel__cellularPlanChanged_ name:@"PSUICellularPlanChanged" object:0];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(PSUICellularPlanConvertedController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "(re)loading specifiers", buf, 2u);
    }

    v6 = objc_opt_new();
    if (!self->_planReference)
    {
      uint64_t v7 = [(PSUICellularPlanConvertedController *)self specifier];
      v8 = [v7 propertyForKey:*MEMORY[0x263F5FFF0]];
      planReference = self->_planReference;
      self->_planReference = v8;

      objc_super v10 = +[PSUICellularPlanManagerCache sharedInstance];
      v11 = [v10 planFromReferenceSafe:self->_planReference];
      planItem = self->_planItem;
      self->_planItem = v11;
    }
    v13 = [(PSUICellularPlanConvertedController *)self _removeSIMSpecifier];
    [v6 addSpecifier:v13];

    v14 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v6 addSpecifier:v14];

    if (self->_planItem)
    {
      v15 = [(PSUICellularPlanConvertedController *)self _simTypeSpecifier];
      [v6 addSpecifier:v15];

      v16 = [(PSUICellularPlanConvertedController *)self _statusSpecifier];
      [v6 addSpecifier:v16];

      v17 = [(PSUICellularPlanConvertedController *)self _labelSpecifier];
      [v6 addSpecifier:v17];

      v18 = [(PSUICellularPlanConvertedController *)self _phoneNumberSpecifier];
      [v6 addSpecifier:v18];

      if ([(CTCellularPlanItem *)self->_planItem transferredStatus] == 4) {
        [(PSUICellularPlanConvertedController *)self _turnOnThisLineSpecifier];
      }
      else {
      v20 = [(PSUICellularPlanConvertedController *)self _reactivateSIMSpecifier];
      }
      [v6 addSpecifier:v20];

      [(PSUICellularPlanConvertedController *)self _maybeAddRemoveCellularPlanSpecifier:v6];
    }
    else
    {
      v19 = [(PSUICellularPlanConvertedController *)self getLogger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_221B17000, v19, OS_LOG_TYPE_DEFAULT, "No plan with the given plan reference", v23, 2u);
      }
    }
    [MEMORY[0x263F67F00] logSpecifiers:v6 origin:@"[PSUICellularPlanConvertedController specifiers] end"];
    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_planLabel:(id)a3
{
  uint64_t v3 = [(CTCellularPlanItem *)self->_planItem userLabel];
  objc_super v4 = [v3 label];

  return v4;
}

- (id)_status:(id)a3
{
  return self->_planStatus;
}

- (id)_phoneNumber:(id)a3
{
  uint64_t v3 = [(CTCellularPlanItem *)self->_planItem phoneNumber];
  objc_super v4 = +[SettingsCellularUtils formattedPhoneNumber:v3];

  return v4;
}

- (id)_removeSIMSpecifier
{
  v2 = [[PSUIRemoveSIMWarningSpecifier alloc] initWithPlanUniversalReference:self->_planReference];
  return v2;
}

- (id)_simTypeSpecifier
{
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CARRIER_NAME"];
  uint64_t v4 = [(CTCellularPlanItem *)self->_planItem type];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4) {
    uint64_t v7 = @"eSIM";
  }
  else {
    uint64_t v7 = @"SIM";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];
  [v3 setName:v8];

  return v3;
}

- (id)_statusSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"STATUS" value:&stru_26D410CA0 table:@"Cellular"];
  v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:sel__status_ detail:0 cell:4 edit:0];

  [v6 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  objc_storeWeak((id *)&self->_weakStatusSpecifier, v6);
  return v6;
}

- (id)_labelSpecifier
{
  uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x263F5FC40];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"CELLULAR_PLAN_LABEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    v5 = [v6 preferenceSpecifierNamed:v8 target:self set:0 get:sel__planLabel_ detail:0 cell:4 edit:0];

    [v5 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  return v5;
}

- (id)_phoneNumberSpecifier
{
  uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || ([(CTCellularPlanItem *)self->_planItem phoneNumber],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        !v6))
  {
    objc_super v10 = 0;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F5FC40];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"MY_NUMBER" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    objc_super v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel__phoneNumber_ detail:0 cell:4 edit:0];

    [v10 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  return v10;
}

- (id)_turnOnThisLineSpecifier
{
  if ([(CTCellularPlanItem *)self->_planItem isSelectable])
  {
    uint64_t v3 = [PSUITurnOnThisLineSpecifier alloc];
    planReference = self->_planReference;
    v5 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v6 = +[PSUICellularPlanManagerCache sharedInstance];
    uint64_t v7 = +[PSUICoreTelephonyCallCache sharedInstance];
    v8 = [(PSUITurnOnThisLineSpecifier *)v3 initWithPlanUniversalReference:planReference cellularPlanManager:v5 planManagerCache:v6 callCache:v7 hostController:self isActivating:0];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_reactivateSIMSpecifier
{
  uint64_t v3 = [[PSUIReactivateSIMSpecifier alloc] initWithPlanUniversalReference:self->_planReference hostController:self];
  objc_storeWeak((id *)&self->_weakReactivateSpecifier, v3);
  return v3;
}

- (void)_maybeAddRemoveCellularPlanSpecifier:(id)a3
{
  id v10 = a3;
  if ([(CTCellularPlanItem *)self->_planItem type] == 2)
  {
    uint64_t v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BOTTOM_SPACER_GROUP"];
    [v10 addObject:v4];

    v5 = [PSUIRemoveCellularPlanSpecifier alloc];
    planReference = self->_planReference;
    uint64_t v7 = [MEMORY[0x263F31978] sharedManager];
    v8 = +[PSUICellularPlanManagerCache sharedInstance];
    v9 = [(PSUIRemoveCellularPlanSpecifier *)v5 initWithPlanUniversalReference:planReference cellularPlanManager:v7 planManagerCache:v8 hostController:self popViewControllerOnPlanDeletion:1];

    [v10 addObject:v9];
  }
}

- (void)_cellularPlanChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = +[PSUICellularPlanManagerCache sharedInstance];
  v5 = [v4 planItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 iccid];
        v12 = [(CTCellularPlanItem *)self->_planItem iccid];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          objc_storeStrong((id *)&self->_planItem, v10);
          [(PSUICellularPlanConvertedController *)self _updatePlanStatus:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_updatePlanStatus:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__PSUICellularPlanConvertedController__updatePlanStatus___block_invoke;
  v6[3] = &unk_2645E0B60;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __57__PSUICellularPlanConvertedController__updatePlanStatus___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transferredStatus];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 _updateStatusSpecifier:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    [v4 _updateReactivateSpecifier:v5];
  }
  else
  {
    uint64_t v6 = [v3 navigationController];
    id v7 = [v6 visibleViewController];
    uint64_t v8 = *(void **)(a1 + 40);

    if (v7 == v8)
    {
      id v10 = [*(id *)(a1 + 40) navigationController];
      id v9 = (id)[v10 popViewControllerAnimated:1];
    }
  }
}

- (void)_updateStatusSpecifier:(id)a3
{
  int v4 = [a3 isCheckingCellularConnectivity];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = v5;
  if (v4) {
    [v5 localizedStringForKey:@"CHECKING" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  }
  else {
  id v7 = [v5 localizedStringForKey:@"INACTIVE" value:&stru_26D410CA0 table:@"Cellular"];
  }
  planStatus = self->_planStatus;
  self->_planStatus = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakStatusSpecifier);
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = [WeakRetained propertyForKey:*MEMORY[0x263F602B0]];
    [v11 setValue:self->_planStatus];
  }
  else
  {
    v12 = [(PSUICellularPlanConvertedController *)self getLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v13 = 0;
      _os_log_error_impl(&dword_221B17000, v12, OS_LOG_TYPE_ERROR, "invalid status specifier", v13, 2u);
    }
  }
}

- (void)_updateReactivateSpecifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakReactivateSpecifier);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained propertyForKey:*MEMORY[0x263F602B0]];
    int v8 = [v4 isCheckingCellularConnectivity];
    uint64_t v9 = *MEMORY[0x263F600A8];
    if (v8)
    {
      [v6 setProperty:MEMORY[0x263EFFA80] forKey:v9];
      id v10 = [v7 titleLabel];
      v11 = v10;
      uint64_t v12 = 0;
    }
    else
    {
      [v6 setProperty:MEMORY[0x263EFFA88] forKey:v9];
      id v10 = [v7 titleLabel];
      v11 = v10;
      uint64_t v12 = 1;
    }
    [v10 setEnabled:v12];
  }
  else
  {
    id v7 = [(PSUICellularPlanConvertedController *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v13 = 0;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "invalid status specifier", v13, 2u);
    }
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularPlanConvertedController"];
}

- (CTCellularPlanItem)planItem
{
  return self->_planItem;
}

- (void)setPlanItem:(id)a3
{
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
}

- (PSSpecifier)weakStatusSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakStatusSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setWeakStatusSpecifier:(id)a3
{
}

- (PSSpecifier)weakReactivateSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakReactivateSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setWeakReactivateSpecifier:(id)a3
{
}

- (NSString)planStatus
{
  return (NSString *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setPlanStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planStatus, 0);
  objc_destroyWeak((id *)&self->_weakReactivateSpecifier);
  objc_destroyWeak((id *)&self->_weakStatusSpecifier);
  objc_storeStrong((id *)&self->_planReference, 0);
  objc_storeStrong((id *)&self->_planItem, 0);
}

@end