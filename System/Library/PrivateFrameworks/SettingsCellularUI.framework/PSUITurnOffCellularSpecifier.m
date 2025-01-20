@interface PSUITurnOffCellularSpecifier
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (CXCallObserver)callObserver;
- (NSNumber)cellularOff;
- (PSListController)hostController;
- (PSUICoreTelephonyCallCache)callCache;
- (PSUITurnOffCellularSpecifier)initWithContext:(id)a3 callCache:(id)a4 hostController:(id)a5;
- (id)getLogger;
- (void)_disableCellular:(BOOL)a3;
- (void)_showPopup;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)setCallCache:(id)a3;
- (void)setCallObserver:(id)a3;
- (void)setCellularOff:(id)a3;
- (void)setCellularOff:(id)a3 specifier:(id)a4;
- (void)setHostController:(id)a3;
- (void)setSubscriptionContext:(id)a3;
- (void)setSwitchEnabled;
@end

@implementation PSUITurnOffCellularSpecifier

- (PSUITurnOffCellularSpecifier)initWithContext:(id)a3 callCache:(id)a4 hostController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"TURN_OFF_CELLULAR" value:&stru_26D410CA0 table:@"Cellular"];
  v22.receiver = self;
  v22.super_class = (Class)PSUITurnOffCellularSpecifier;
  v14 = [(PSUITurnOffCellularSpecifier *)&v22 initWithName:v13 target:self set:sel_setCellularOff_specifier_ get:sel_isCellularOff_ detail:0 cell:6 edit:0];

  if (v14)
  {
    objc_storeWeak((id *)&v14->_hostController, v11);
    objc_storeStrong((id *)&v14->_subscriptionContext, a3);
    objc_storeStrong((id *)&v14->_callCache, a4);
    v15 = (CXCallObserver *)objc_alloc_init(MEMORY[0x263EFC8E8]);
    callObserver = v14->_callObserver;
    v14->_callObserver = v15;

    [(CXCallObserver *)v14->_callObserver setDelegate:v14 queue:0];
    [(PSUITurnOffCellularSpecifier *)v14 setSwitchEnabled];
    v17 = NSNumber;
    v18 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
    uint64_t v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "getTurnOffCellular:", v9));
    cellularOff = v14->_cellularOff;
    v14->_cellularOff = (NSNumber *)v19;
  }
  return v14;
}

- (void)setSwitchEnabled
{
  BOOL v3 = [(PSUICoreTelephonyCallCache *)self->_callCache isAnyCallActive];
  uint64_t v4 = *MEMORY[0x263F600A8];
  if (v3) {
    uint64_t v5 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  [(PSUITurnOffCellularSpecifier *)self setProperty:v5 forKey:v4];
}

- (void)setCellularOff:(id)a3 specifier:(id)a4
{
  id v10 = a4;
  int v6 = [a3 BOOLValue];
  v7 = [(PSUITurnOffCellularSpecifier *)self cellularOff];
  int v8 = [v7 BOOLValue];

  if (v6 == v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    [WeakRetained reloadSpecifier:v10];
  }
  else if (v6)
  {
    [(PSUITurnOffCellularSpecifier *)self _showPopup];
  }
  else
  {
    [(PSUITurnOffCellularSpecifier *)self _disableCellular:0];
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__PSUITurnOffCellularSpecifier_callObserver_callChanged___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__PSUITurnOffCellularSpecifier_callObserver_callChanged___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hostController];
  [v1 reloadSpecifiers];
}

- (void)_showPopup
{
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x263F82418];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"TURN_OFF_CELLULAR_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = SFLocalizableWAPIStringKeyForKey();
  int v8 = [v6 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];
  id v9 = [v3 alertControllerWithTitle:v5 message:v8 preferredStyle:1];

  id v10 = (void *)MEMORY[0x263F82400];
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"CONTINUE" value:&stru_26D410CA0 table:@"Cellular"];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke;
  v22[3] = &unk_2645E0C78;
  objc_copyWeak(&v23, &location);
  v13 = [v10 actionWithTitle:v12 style:0 handler:v22];
  [v9 addAction:v13];

  v14 = (void *)MEMORY[0x263F82400];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_2;
  v21[3] = &unk_2645E0CA0;
  v21[4] = self;
  v17 = [v14 actionWithTitle:v16 style:0 handler:v21];
  [v9 addAction:v17];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_3;
  block[3] = &unk_2645E0B60;
  block[4] = self;
  id v20 = v9;
  id v18 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _disableCellular:1];
}

void __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  [WeakRetained reloadSpecifiers];
}

void __42__PSUITurnOffCellularSpecifier__showPopup__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  v2 = [WeakRetained navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_disableCellular:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA80];
  }
  [(PSUITurnOffCellularSpecifier *)self setCellularOff:v5];
  int v6 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  v7 = [(PSUITurnOffCellularSpecifier *)self subscriptionContext];
  [v6 setTurnOffCellular:v7 enabled:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained reloadSpecifiers];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"TurnOffCellular"];
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
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

- (NSNumber)cellularOff
{
  return self->_cellularOff;
}

- (void)setCellularOff:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularOff, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end