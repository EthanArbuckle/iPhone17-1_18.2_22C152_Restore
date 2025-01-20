@interface TransferBackPlanCache
- (BOOL)_canLaunchSIMSetupFlow;
- (BOOL)isPlanReactivated;
- (CTCellularPlanItem)transferToItem;
- (NSArray)existedIccids;
- (NSError)failureWebsheetError;
- (NSError)transferError;
- (NSString)installingIccid;
- (NSTimer)activateTimer;
- (PSUIReActivateSIMSpecifierModelDelegate)delegate;
- (TSSIMSetupFlow)flow;
- (TransferBackPlanCache)initWithDelegate:(id)a3 navigationController:(id)a4 transferBackPlan:(id)a5;
- (UINavigationController)navigationController;
- (UIViewController)rootViewController;
- (id)getLogger;
- (id)transferBackItem;
- (void)_handleActivateExpiry;
- (void)_prepareSIMSetupFlow;
- (void)_presentViewController:(id)a3;
- (void)_showWifiAlert;
- (void)_useLine:(BOOL)a3 forPlan:(id)a4;
- (void)cellularPlanChanged:(id)a3;
- (void)dealloc;
- (void)setActivateTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExistedIccids:(id)a3;
- (void)setFailureWebsheetError:(id)a3;
- (void)setFlow:(id)a3;
- (void)setInstallingIccid:(id)a3;
- (void)setIsPlanReactivated:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setTransferBackItem:(id)a3;
- (void)setTransferError:(id)a3;
- (void)setTransferToItem:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)transferBack:(id)a3;
@end

@implementation TransferBackPlanCache

- (TransferBackPlanCache)initWithDelegate:(id)a3 navigationController:(id)a4 transferBackPlan:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TransferBackPlanCache;
  v12 = [(TransferBackPlanCache *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_transferBackItem, a5);
    objc_storeStrong((id *)&v13->_delegate, a3);
    objc_storeWeak((id *)&v13->_navigationController, v10);
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v13 selector:sel_cellularPlanChanged_ name:@"PSUICellularPlanChanged" object:0];

    [(TransferBackPlanCache *)v13 transferBack:v11];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(TransferBackPlanCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    flow = self->_flow;
    *(_DWORD *)buf = 138412290;
    v8 = flow;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "release SS flow : %@", buf, 0xCu);
  }

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)TransferBackPlanCache;
  [(TransferBackPlanCache *)&v6 dealloc];
}

- (void)transferBack:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v21 = a3;
  objc_storeStrong(&self->_transferBackItem, a3);
  v5 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objc_super v6 = +[PSUICellularPlanManagerCache sharedInstance];
  v7 = [v6 planItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v13 = [v12 iccid];

        if (v13)
        {
          v14 = [(TransferBackPlanCache *)self getLogger];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v12 iccid];
            *(_DWORD *)buf = 138412290;
            v27 = v15;
            _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "existed iccid : %@", buf, 0xCu);
          }
          objc_super v16 = [v12 iccid];
          [v5 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  v17 = (NSArray *)[v5 copy];
  existedIccids = self->_existedIccids;
  self->_existedIccids = v17;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TransferBackPlanCache *)self _useLine:1 forPlan:v21];
    if ([(TransferBackPlanCache *)self _canLaunchSIMSetupFlow])
    {
      v19 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__handleActivateExpiry selector:0 userInfo:0 repeats:30.0];
      activateTimer = self->_activateTimer;
      self->_activateTimer = v19;
    }
  }
  [(TransferBackPlanCache *)self _prepareSIMSetupFlow];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = [(TransferBackPlanCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "finish SS flow : %lu", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TransferBackPlanCache_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0E18;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = (id)a3;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __47__TransferBackPlanCache_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained navigationController];
    v5 = [v4 topViewController];
    objc_super v6 = [v5 presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    [v3 setFlow:0];
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7 != 2)
    {
      if (v7 == 1)
      {
        uint64_t v8 = [*(id *)(a1 + 32) getLogger];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "transfer back canceled", buf, 2u);
        }

        uint64_t v9 = [v3 delegate];
        uint64_t v10 = [v3 transferBackItem];
        [v9 transferBackCanceled:v10];
        goto LABEL_13;
      }
      v13 = [*(id *)(a1 + 32) getLogger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "transfer back failed, abort", v14, 2u);
      }

      uint64_t v9 = [v3 delegate];
      uint64_t v10 = [v3 transferBackItem];
      v12 = [v3 transferError];
      [v9 transferBackFailed:v10 error:v12];
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    id v11 = [v3 transferToItem];

    if (v11)
    {
      uint64_t v9 = [v3 delegate];
      uint64_t v10 = [v3 transferBackItem];
      v12 = [v3 transferToItem];
      [v9 transferBackSuccessFrom:v10 to:v12];
      goto LABEL_12;
    }
  }
LABEL_14:
}

- (BOOL)_canLaunchSIMSetupFlow
{
  v3 = [self->_transferBackItem phoneNumber];
  uint64_t v4 = [v3 length];

  BOOL result = 0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [self->_transferBackItem type] == 2) {
      return 1;
    }
  }
  return result;
}

- (void)_prepareSIMSetupFlow
{
  v13[2] = *MEMORY[0x263EF8340];
  if ([(TransferBackPlanCache *)self _canLaunchSIMSetupFlow])
  {
    v3 = (void *)MEMORY[0x263F66078];
    v12[0] = *MEMORY[0x263F66090];
    v12[1] = @"TransferBackPlan";
    id transferBackItem = self->_transferBackItem;
    v13[0] = &unk_26D425DF8;
    v13[1] = transferBackItem;
    v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    objc_super v6 = [v3 flowWithOptions:v5];
    flow = self->_flow;
    self->_flow = v6;

    [(TSSIMSetupFlow *)self->_flow setDelegate:self];
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v8 = self->_flow;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__TransferBackPlanCache__prepareSIMSetupFlow__block_invoke;
    v9[3] = &unk_2645E0CF8;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    [(TSSIMSetupFlow *)v8 firstViewController:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __45__TransferBackPlanCache__prepareSIMSetupFlow__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained isPlanReactivated] & 1) == 0)
    {
      objc_super v6 = [v5 activateTimer];

      if (v6) {
        [v5 setRootViewController:v3];
      }
      else {
        [v5 _presentViewController:v3];
      }
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "invalid PSUIReActivateSIMSpecifier", v8, 2u);
    }
  }
}

- (void)_useLine:(BOOL)a3 forPlan:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v6 = (__CFString *)a4;
  uint64_t v7 = [(TransferBackPlanCache *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = @"deselected";
    if (v4) {
      uint64_t v8 = @"selected";
    }
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "%@ plan %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x263F31978] sharedManager];
  id v10 = [v9 didSelectPlanItem:v6 isEnable:v4];

  if (v10)
  {
    id v11 = [(TransferBackPlanCache *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      v13 = v6;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "Failed to select plan: %@, error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_handleActivateExpiry
{
  [(NSTimer *)self->_activateTimer invalidate];
  activateTimer = self->_activateTimer;
  self->_activateTimer = 0;

  if (!self->_isPlanReactivated)
  {
    [(TransferBackPlanCache *)self _useLine:0 forPlan:self->_transferBackItem];
    if (self->_rootViewController)
    {
      -[TransferBackPlanCache _presentViewController:](self, "_presentViewController:");
      rootViewController = self->_rootViewController;
      self->_rootViewController = 0;
    }
  }
}

- (void)_presentViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[PSUIDeviceWiFiState sharedInstance];
  if ([v5 isConnectedOverWiFi])
  {

LABEL_4:
    uint64_t v8 = [(TransferBackPlanCache *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
      id v10 = [WeakRetained topViewController];
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "present %@. current top view controller : %@", (uint8_t *)&v15, 0x16u);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v4;
    }
    else
    {
      id v11 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v4];
      [v11 setModalPresentationStyle:2];
    }
    id v12 = objc_loadWeakRetained((id *)&self->_navigationController);
    v13 = [v12 topViewController];
    [v13 presentViewController:v11 animated:1 completion:0];

    goto LABEL_13;
  }
  objc_super v6 = +[PSUIDeviceCellularState sharedInstance];
  char v7 = [v6 isConnectedOverCellular];

  if (v7) {
    goto LABEL_4;
  }
  __int16 v14 = [(TransferBackPlanCache *)self getLogger];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEFAULT, "Data connectivity is not available to set up eSIM(s)", (uint8_t *)&v15, 2u);
  }

  [(TransferBackPlanCache *)self _showWifiAlert];
LABEL_13:
}

- (void)_showWifiAlert
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"NOT_CONNECTED_TO_INTERNET" value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  v5 = [MEMORY[0x263F82670] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isiPhone");
  char v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = @"TURN_ON_WIFI_TO_SETUP_ESIM";
  }
  else {
    uint64_t v9 = @"TURN_ON_WIFI_TO_SETUP_ESIM_IPAD";
  }
  id v10 = [v7 localizedStringForKey:v9 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  id v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v4 message:v10 preferredStyle:1];
  id location = 0;
  objc_initWeak(&location, self);
  id v12 = [MEMORY[0x263F82670] currentDevice];
  long long v23 = (void *)v4;
  if (objc_msgSend(v12, "sf_isChinaRegionCellularDevice"))
  {
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v13 localizedStringForKey:@"CHOOSE_WLAN" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  }
  else
  {
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v13 localizedStringForKey:@"CHOOSE_WIFI" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  __int16 v14 = };

  int v15 = (void *)MEMORY[0x263F82400];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __39__TransferBackPlanCache__showWifiAlert__block_invoke;
  v26[3] = &unk_2645E0C78;
  objc_copyWeak(&v27, &location);
  id v16 = [v15 actionWithTitle:v14 style:0 handler:v26];
  [v11 addAction:v16];
  __int16 v17 = (void *)MEMORY[0x263F82400];
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __39__TransferBackPlanCache__showWifiAlert__block_invoke_2;
  v24[3] = &unk_2645E0E40;
  v24[4] = self;
  objc_copyWeak(&v25, &location);
  v20 = [v17 actionWithTitle:v19 style:1 handler:v24];

  [v11 addAction:v20];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  long long v22 = [WeakRetained topViewController];
  [v22 presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
}

void __39__TransferBackPlanCache__showWifiAlert__block_invoke(id *a1)
{
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:51 userInfo:0];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(a1);
  v5 = [v4 transferBackItem];
  [v3 transferBackFailed:v5 error:v8];

  int v6 = [MEMORY[0x263F01880] defaultWorkspace];
  char v7 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v6 openSensitiveURL:v7 withOptions:0];
}

void __39__TransferBackPlanCache__showWifiAlert__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "user canceled setting up eSIM", v8, 2u);
  }

  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained delegate];
  id v6 = objc_loadWeakRetained(v3);
  char v7 = [v6 transferBackItem];
  [v5 transferBackCanceled:v7];
}

- (id)getLogger
{
  v2 = (void *)MEMORY[0x263F67EB0];
  id v3 = NSString;
  id v4 = [self->_transferBackItem iccid];
  v5 = [v3 stringWithFormat:@"reactivate.sim.model.%@", v4];
  id v6 = [v2 loggerWithCategory:v5];

  return v6;
}

- (void)cellularPlanChanged:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (!self->_transferBackItem) {
    return;
  }
  id v4 = [(TransferBackPlanCache *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = @"PSUICellularPlanChanged";
    _os_log_debug_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEBUG, "received notification %@", buf, 0xCu);
  }

  v5 = +[PSUICellularPlanManagerCache sharedInstance];
  id v6 = [v5 planItems];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v8) {
    goto LABEL_29;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v33;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v33 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = *(__CFString **)(*((void *)&v32 + 1) + 8 * v11);
    existedIccids = self->_existedIccids;
    __int16 v14 = [(__CFString *)v12 iccid];
    LODWORD(existedIccids) = [(NSArray *)existedIccids hasIccid:v14];

    if (!existedIccids) {
      goto LABEL_12;
    }
    int v15 = [(__CFString *)v12 iccid];
    id v16 = [self->_transferBackItem iccid];
    int v17 = [v15 isEqualToString:v16];

    if (v17) {
      break;
    }
LABEL_21:
    if (v9 == ++v11)
    {
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v9) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  if ([(__CFString *)v12 transferredStatus])
  {
LABEL_12:
    if ([(__CFString *)v12 isInstalling])
    {
      v18 = [(__CFString *)v12 iccid];

      if (v18)
      {
        uint64_t v19 = [(__CFString *)v12 iccid];
        installingIccid = self->_installingIccid;
        self->_installingIccid = v19;
      }
    }
    else
    {
      id v21 = [(__CFString *)v12 plan];
      int v22 = [v21 status];

      if (!v22)
      {
        long long v23 = self->_installingIccid;
        long long v24 = [(__CFString *)v12 iccid];
        LODWORD(v23) = [(NSString *)v23 isEqualToString:v24];

        if (v23)
        {
          if (([(__CFString *)v12 isSelected] & 1) == 0 && !self->_flow)
          {
            v30 = [(TransferBackPlanCache *)self getLogger];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v12;
              _os_log_impl(&dword_221B17000, v30, OS_LOG_TYPE_DEFAULT, "transfer disabled item back as new item: %@. enable it.", buf, 0xCu);
            }

            [(TransferBackPlanCache *)self _useLine:1 forPlan:v12];
            goto LABEL_29;
          }
          id v25 = [(__CFString *)v12 phoneNumber];
          v26 = [self->_transferBackItem phoneNumber];
          int v27 = [v25 isEqualToPhoneNumber:v26];

          if (v27)
          {
            if ([(__CFString *)v12 type])
            {
              v31 = [(TransferBackPlanCache *)self getLogger];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_221B17000, v31, OS_LOG_TYPE_DEFAULT, "yeah, the phone number transferred back", buf, 2u);
              }

              objc_storeStrong((id *)&self->_transferToItem, v12);
              if (self->_flow) {
                goto LABEL_29;
              }
LABEL_28:
              [(PSUIReActivateSIMSpecifierModelDelegate *)self->_delegate transferBackSuccessFrom:self->_transferBackItem to:v12];
              goto LABEL_29;
            }
          }
        }
      }
    }
    goto LABEL_21;
  }
  v28 = [(TransferBackPlanCache *)self getLogger];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v28, OS_LOG_TYPE_DEFAULT, "the plan is activated back", buf, 2u);
  }

  [(NSTimer *)self->_activateTimer invalidate];
  activateTimer = self->_activateTimer;
  self->_activateTimer = 0;

  self->_isPlanReactivated = 1;
  if (!self->_flow || self->_rootViewController) {
    goto LABEL_28;
  }
LABEL_29:
}

- (PSUIReActivateSIMSpecifierModelDelegate)delegate
{
  return (PSUIReActivateSIMSpecifierModelDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlow:(id)a3
{
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRootViewController:(id)a3
{
}

- (NSArray)existedIccids
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExistedIccids:(id)a3
{
}

- (id)transferBackItem
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setTransferBackItem:(id)a3
{
}

- (NSTimer)activateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivateTimer:(id)a3
{
}

- (CTCellularPlanItem)transferToItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransferToItem:(id)a3
{
}

- (NSString)installingIccid
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInstallingIccid:(id)a3
{
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTransferError:(id)a3
{
}

- (NSError)failureWebsheetError
{
  return (NSError *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFailureWebsheetError:(id)a3
{
}

- (BOOL)isPlanReactivated
{
  return self->_isPlanReactivated;
}

- (void)setIsPlanReactivated:(BOOL)a3
{
  self->_isPlanReactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureWebsheetError, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_installingIccid, 0);
  objc_storeStrong((id *)&self->_transferToItem, 0);
  objc_storeStrong((id *)&self->_activateTimer, 0);
  objc_storeStrong(&self->_transferBackItem, 0);
  objc_storeStrong((id *)&self->_existedIccids, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end