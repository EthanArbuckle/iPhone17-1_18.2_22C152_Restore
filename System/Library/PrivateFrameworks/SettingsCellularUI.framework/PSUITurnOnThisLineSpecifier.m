@interface PSUITurnOnThisLineSpecifier
- (BOOL)isPlanStatusActivatingPostinstall:(id)a3;
- (BOOL)isTransferredPlan:(id)a3;
- (CTCellularPlanManager)cellularPlanManager;
- (CXCallObserver)callObserver;
- (PSListController)hostController;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUICellularPlanUniversalReference)planReference;
- (PSUICoreTelephonyCallCache)callCache;
- (PSUITurnOnThisLineSpecifier)initWithPlanUniversalReference:(id)a3 cellularPlanManager:(id)a4 planManagerCache:(id)a5 callCache:(id)a6 hostController:(id)a7 isActivating:(BOOL)a8;
- (id)_getAlertMessage:(id)a3 onPad:(BOOL)a4;
- (id)getLogger;
- (id)isPlanEnabled:(id)a3;
- (void)_showPromptFor:(id)a3;
- (void)_turnItOff;
- (void)_useLine:(BOOL)a3 forPlan:(id)a4;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)setCallCache:(id)a3;
- (void)setCallObserver:(id)a3;
- (void)setCellularPlanManager:(id)a3;
- (void)setHostController:(id)a3;
- (void)setPlanEnabled:(id)a3 specifier:(id)a4;
- (void)setPlanManagerCache:(id)a3;
- (void)setPlanReference:(id)a3;
- (void)setSwitchEnabled;
@end

@implementation PSUITurnOnThisLineSpecifier

- (PSUITurnOnThisLineSpecifier)initWithPlanUniversalReference:(id)a3 cellularPlanManager:(id)a4 planManagerCache:(id)a5 callCache:(id)a6 hostController:(id)a7 isActivating:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v34 = a6;
  id v33 = a7;
  v18 = [(PSUITurnOnThisLineSpecifier *)self getLogger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = @"NO";
    if (v8) {
      v19 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v38 = v19;
    _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "Activating: %@", buf, 0xCu);
  }

  if (v8)
  {
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"TURN_ON_THIS_LINE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    v36.receiver = self;
    v36.super_class = (Class)PSUITurnOnThisLineSpecifier;
    v22 = [(PSUITurnOnThisLineSpecifier *)&v36 initWithName:v21 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [(PSUITurnOnThisLineSpecifier *)v22 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  }
  else
  {
    id v31 = v17;
    id v32 = v16;
    v23 = [v17 planFromReference:v15];
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"TURN_ON_THIS_LINE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];

    if ([v23 transferredStatus])
    {
      v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v27 = [v26 localizedStringForKey:@"USE_THIS_LINE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];

      v25 = (void *)v27;
    }
    v35.receiver = self;
    v35.super_class = (Class)PSUITurnOnThisLineSpecifier;
    v22 = [(PSUITurnOnThisLineSpecifier *)&v35 initWithName:v25 target:self set:sel_setPlanEnabled_specifier_ get:sel_isPlanEnabled_ detail:0 cell:6 edit:0];

    id v17 = v31;
    id v16 = v32;
  }
  if (v22)
  {
    objc_storeStrong((id *)&v22->_planReference, a3);
    objc_storeStrong((id *)&v22->_cellularPlanManager, a4);
    objc_storeStrong((id *)&v22->_planManagerCache, a5);
    objc_storeWeak((id *)&v22->_hostController, v33);
    objc_storeStrong((id *)&v22->_callCache, a6);
    v28 = (CXCallObserver *)objc_alloc_init(MEMORY[0x263EFC8E8]);
    callObserver = v22->_callObserver;
    v22->_callObserver = v28;

    [(CXCallObserver *)v22->_callObserver setDelegate:v22 queue:0];
    [(PSUITurnOnThisLineSpecifier *)v22 setProperty:v15 forKey:*MEMORY[0x263F5FFF0]];
    [(PSUITurnOnThisLineSpecifier *)v22 setSwitchEnabled];
  }

  return v22;
}

- (void)setSwitchEnabled
{
  v3 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planFromReference:self->_planReference];
  if ([(PSUICoreTelephonyCallCache *)self->_callCache isAnyCallActive]
    || [v3 transferredStatus] == 4)
  {
LABEL_7:
    uint64_t v5 = *MEMORY[0x263F600A8];
    goto LABEL_8;
  }
  if ([(PSUITurnOnThisLineSpecifier *)self isPlanStatusActivatingPostinstall:v3])
  {
    v4 = [(PSUITurnOnThisLineSpecifier *)self getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Plan status is ActivatingPostinstall", v8, 2u);
    }

    goto LABEL_7;
  }
  uint64_t v7 = [v3 transferredStatus];
  uint64_t v5 = *MEMORY[0x263F600A8];
  if (!v7)
  {
    uint64_t v6 = MEMORY[0x263EFFA88];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v6 = MEMORY[0x263EFFA80];
LABEL_9:
  [(PSUITurnOnThisLineSpecifier *)self setProperty:v6 forKey:v5];
}

- (id)isPlanEnabled:(id)a3
{
  v3 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planFromReference:self->_planReference];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isSelected"));

  return v4;
}

- (BOOL)isTransferredPlan:(id)a3
{
  return [a3 transferredStatus] != 0;
}

- (BOOL)isPlanStatusActivatingPostinstall:(id)a3
{
  v3 = [a3 plan];
  BOOL v4 = [v3 status] == 14;

  return v4;
}

- (void)setPlanEnabled:(id)a3 specifier:(id)a4
{
  id v14 = a4;
  planManagerCache = self->_planManagerCache;
  planReference = self->_planReference;
  id v8 = a3;
  v9 = [(PSUICellularPlanManagerCache *)planManagerCache planFromReference:planReference];
  uint64_t v10 = [v8 BOOLValue];

  if (v10 == [v9 isSelected])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    [WeakRetained reloadSpecifier:v14];
  }
  else
  {
    if ([(PSUITurnOnThisLineSpecifier *)self isTransferredPlan:v9])
    {
      v11 = self;
      if (v10)
      {
        [(PSUITurnOnThisLineSpecifier *)self _showPromptFor:v9];
        goto LABEL_9;
      }
      uint64_t v13 = 0;
    }
    else
    {
      v11 = self;
      uint64_t v13 = v10;
    }
    [(PSUITurnOnThisLineSpecifier *)v11 _useLine:v13 forPlan:v9];
  }
LABEL_9:
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__PSUITurnOnThisLineSpecifier_callObserver_callChanged___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__PSUITurnOnThisLineSpecifier_callObserver_callChanged___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostController];
  [v1 reloadSpecifiers];
}

- (id)_getAlertMessage:(id)a3 onPad:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"USE_THIS_LINE_DETAIL_IPAD" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  }
  else
  {
    v9 = [v5 phoneNumber];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = NSString;
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v7 localizedStringForKey:@"USE_THIS_LINE_DETAIL_WITH_PHONE_NUMBER_%@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      uint64_t v13 = [v6 phoneNumber];
      id v14 = +[SettingsCellularUtils formattedPhoneNumber:v13];
      id v8 = objc_msgSend(v11, "stringWithFormat:", v12, v14);
    }
    else
    {
      uint64_t v15 = [v6 type];
      id v16 = NSString;
      id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = v17;
      if (v15 == 2) {
        v18 = @"USE_THIS_LINE_DETAIL_CARRIER_ESIM_%@";
      }
      else {
        v18 = @"USE_THIS_LINE_DETAIL_CARRIER_SIM_%@";
      }
      v12 = [v17 localizedStringForKey:v18 value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      v19 = [v6 carrierName];
      id v8 = objc_msgSend(v16, "stringWithFormat:", v12, v19);
    }
  }

  return v8;
}

- (void)_showPromptFor:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x263F82418];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"USE_THIS_LINE_TITLE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  id v8 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  uint64_t v10 = [(PSUITurnOnThisLineSpecifier *)self _getAlertMessage:v4 onPad:(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v11 = [v5 alertControllerWithTitle:v7 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"CONTINUE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke;
  v26[3] = &unk_2645E1300;
  objc_copyWeak(&v28, &location);
  id v15 = v4;
  id v27 = v15;
  id v16 = [v12 actionWithTitle:v14 style:0 handler:v26];
  [v11 addAction:v16];

  id v17 = (void *)MEMORY[0x263F82400];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_2;
  v24[3] = &unk_2645E0C78;
  objc_copyWeak(&v25, &location);
  v20 = [v17 actionWithTitle:v19 style:0 handler:v24];
  [v11 addAction:v20];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_3;
  v22[3] = &unk_2645E0B60;
  v22[4] = self;
  id v23 = v11;
  id v21 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _useLine:1 forPlan:*(void *)(a1 + 32)];
}

void __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _turnItOff];
}

void __46__PSUITurnOnThisLineSpecifier__showPromptFor___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  v2 = [WeakRetained navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_turnItOff
{
  [(PSUITurnOnThisLineSpecifier *)self setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained reloadSpecifiers];
}

- (void)_useLine:(BOOL)a3 forPlan:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = (__CFString *)a4;
  uint64_t v7 = [(PSUITurnOnThisLineSpecifier *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"deselected";
    if (v4) {
      id v8 = @"selected";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "%@ plan %@", buf, 0x16u);
  }

  uint64_t v9 = [(CTCellularPlanManager *)self->_cellularPlanManager didSelectPlanItem:v6 isEnable:v4];
  if (v9)
  {
    uint64_t v10 = [(PSUITurnOnThisLineSpecifier *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_error_impl(&dword_221B17000, v10, OS_LOG_TYPE_ERROR, "Failed to select plan: %@, error: %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__PSUITurnOnThisLineSpecifier__useLine_forPlan___block_invoke;
    block[3] = &unk_2645E0B88;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __48__PSUITurnOnThisLineSpecifier__useLine_forPlan___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"TurnOnThisLine"];
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
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

- (PSUICoreTelephonyCallCache)callCache
{
  return self->_callCache;
}

- (void)setCallCache:(id)a3
{
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planReference, 0);
}

@end