@interface PSUIAddCellularPlanSpecifier
- (BOOL)isEmbeddedInCarrierList;
- (BOOL)isRequestingFirstViewController;
- (PSListController)hostController;
- (PSUIAddCellularPlanSpecifier)initWithHostController:(id)a3 isEmbeddedInCarrierList:(BOOL)a4;
- (PSUIAddCellularPlanSpecifier)initWithHostController:(id)a3 isEmbeddedInCarrierList:(BOOL)a4 planManager:(id)a5;
- (TSSIMSetupFlow)flow;
- (UIViewController)firstViewController;
- (id)getLogger;
- (int64_t)userConsentResponse;
- (void)_showWifiAlert;
- (void)addCellularPlanCellPressed:(id)a3;
- (void)cellularPlanChanged;
- (void)setFirstViewController:(id)a3;
- (void)setFlow:(id)a3;
- (void)setHostController:(id)a3;
- (void)setIsEmbeddedInCarrierList:(BOOL)a3;
- (void)setIsRequestingFirstViewController:(BOOL)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setUpeSIMNeeded;
- (void)showSpinner:(BOOL)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIAddCellularPlanSpecifier

- (PSUIAddCellularPlanSpecifier)initWithHostController:(id)a3 isEmbeddedInCarrierList:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x263F31978];
  id v7 = a3;
  v8 = [v6 sharedManager];
  v9 = [(PSUIAddCellularPlanSpecifier *)self initWithHostController:v7 isEmbeddedInCarrierList:v4 planManager:v8];

  return v9;
}

- (PSUIAddCellularPlanSpecifier)initWithHostController:(id)a3 isEmbeddedInCarrierList:(BOOL)a4 planManager:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = @"CELLULAR_CHOOSE_NETWORK_OTHER";
    v12 = [v10 localizedStringForKey:@"CELLULAR_CHOOSE_NETWORK_OTHER" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v13 = 3;
  }
  else
  {
    v14 = +[PSUICellularPlanManagerCache sharedInstance];
    v15 = [v14 planItems];
    uint64_t v16 = [v15 count];

    v10 = [MEMORY[0x263F82670] currentDevice];
    if (objc_msgSend(v10, "sf_isiPad"))
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      v19 = @"ADD_CELLULAR_PLAN";
      v20 = @"Gemini-Gemini";
    }
    else
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = v17;
      if (v16 <= 0) {
        v19 = @"SETUP_CELLULAR";
      }
      else {
        v19 = @"ADD_ESIM";
      }
      v20 = @"Cellular";
    }
    v12 = [v17 localizedStringForKey:v19 value:&stru_26D410CA0 table:v20];

    v11 = @"ADD_CELLULAR_PLAN";
    uint64_t v13 = 13;
  }

  v26.receiver = self;
  v26.super_class = (Class)PSUIAddCellularPlanSpecifier;
  v21 = [(PSUIAddCellularPlanSpecifier *)&v26 initWithName:v12 target:0 set:0 get:0 detail:0 cell:v13 edit:0];
  v22 = v21;
  if (v21)
  {
    [(PSUIAddCellularPlanSpecifier *)v21 setIdentifier:v11];
    [(PSUIAddCellularPlanSpecifier *)v22 setTarget:v22];
    [(PSUIAddCellularPlanSpecifier *)v22 setButtonAction:sel_addCellularPlanCellPressed_];
    objc_storeWeak((id *)&v22->_hostController, v8);
    objc_storeStrong((id *)&v22->_planManager, a5);
    v22->_isRequestingFirstViewController = 0;
    v22->_isEmbeddedInCarrierList = v6;
  }
  v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:v22 selector:sel_setUpeSIMNeeded name:@"PSUICellularPlanSetUpNeeded" object:0];

  v24 = [MEMORY[0x263F08A00] defaultCenter];
  [v24 addObserver:v22 selector:sel_cellularPlanChanged name:@"PSUICellularPlanChanged" object:0];

  return v22;
}

- (void)setUpeSIMNeeded
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = @"PSUICellularPlanSetUpNeeded";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Received notification %@", (uint8_t *)&v4, 0xCu);
  }

  [(PSUIAddCellularPlanSpecifier *)self addCellularPlanCellPressed:self];
}

- (void)addCellularPlanCellPressed:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[PSUIAddCellularPlanSpecifier addCellularPlanCellPressed:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_flow
    && (self->_isRequestingFirstViewController
     || (id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController),
         [WeakRetained presentedViewController],
         id v7 = objc_claimAutoreleasedReturnValue(),
         BOOL v8 = v7 == 0,
         v7,
         WeakRetained,
         !v8)))
  {
    id v9 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "duplicate request to launch SimSetupSupport", buf, 2u);
    }
  }
  else if (+[SettingsCellularUtils noDataConnectivityAvailable])
  {
    v10 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [MEMORY[0x263F82670] currentDevice];
      int v12 = objc_msgSend(v11, "sf_isiPhone");
      uint64_t v13 = "iPad";
      if (v12) {
        uint64_t v13 = "iPhone";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Data connectivity is not available to set up eSIM(s) on %s", buf, 0xCu);
    }
    [(PSUIAddCellularPlanSpecifier *)self _showWifiAlert];
  }
  else
  {
    [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    uint64_t v21 = *MEMORY[0x263F66090];
    v14 = [NSNumber numberWithInteger:3];
    v22 = v14;
    v15 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    uint64_t v16 = [MEMORY[0x263F66078] flowWithOptions:v15];
    flow = self->_flow;
    self->_flow = v16;

    [(TSSIMSetupFlow *)self->_flow setDelegate:self];
    self->_isRequestingFirstViewController = 1;
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v18 = self->_flow;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__PSUIAddCellularPlanSpecifier_addCellularPlanCellPressed___block_invoke;
    v19[3] = &unk_2645E0CF8;
    objc_copyWeak(&v20, (id *)buf);
    v19[4] = self;
    [(TSSIMSetupFlow *)v18 firstViewController:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __59__PSUIAddCellularPlanSpecifier_addCellularPlanCellPressed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setFirstViewController:v3];
    [v5 setIsRequestingFirstViewController:0];
    id v6 = objc_loadWeakRetained(v5 + 30);
    int v7 = [v6 isModalInPresentation];

    BOOL v8 = [*(id *)(a1 + 32) getLogger];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v10 = [v5 hostController];
        v11 = [v5 hostController];
        int v12 = [v11 navigationController];
        uint64_t v13 = [v5 flow];
        int v20 = 138412802;
        uint64_t v21 = v10;
        __int16 v22 = 2112;
        v23 = v12;
        __int16 v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "presented inline. host:%@, nc:%@, flow:%@", (uint8_t *)&v20, 0x20u);
      }
      v14 = [v5 hostController];
      v15 = [v14 navigationController];
      [v15 pushViewController:v3 animated:1];
    }
    else
    {
      if (v9)
      {
        uint64_t v16 = [v5 hostController];
        v17 = [v5 hostController];
        v18 = [v17 navigationController];
        v19 = [v5 flow];
        int v20 = 138412802;
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        v23 = v18;
        __int16 v24 = 2112;
        v25 = v19;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "present in sheet. host:%@, nc:%@, flow:%@", (uint8_t *)&v20, 0x20u);
      }
      v14 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
      [v14 setModalPresentationStyle:2];
      v15 = [v5 hostController];
      [v15 presentViewController:v14 animated:1 completion:0];
    }

    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    _os_log_error_impl(&dword_221B17000, &_os_log_internal, OS_LOG_TYPE_ERROR, "invalid PSUIAddCellularPlanSpecifier", (uint8_t *)&v20, 2u);
  }
}

- (void)cellularPlanChanged
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[PSUIAddCellularPlanSpecifier cellularPlanChanged]";
    __int16 v15 = 2112;
    uint64_t v16 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v13, 0x16u);
  }

  if ([(PSUIAddCellularPlanSpecifier *)self isEmbeddedInCarrierList])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"CELLULAR_CHOOSE_NETWORK_OTHER" value:&stru_26D410CA0 table:@"Cellular"];
    [(PSUIAddCellularPlanSpecifier *)self setName:v5];
  }
  else
  {
    id v6 = +[PSUICellularPlanManagerCache sharedInstance];
    int v7 = [v6 planItems];
    uint64_t v8 = [v7 count];

    id v4 = [MEMORY[0x263F82670] currentDevice];
    if (objc_msgSend(v4, "sf_isiPad"))
    {
      BOOL v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v5 = v9;
      v10 = @"ADD_CELLULAR_PLAN";
      v11 = @"Gemini-Gemini";
    }
    else
    {
      BOOL v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v5 = v9;
      if (v8 <= 0) {
        v10 = @"SETUP_CELLULAR";
      }
      else {
        v10 = @"ADD_ESIM";
      }
      v11 = @"Cellular";
    }
    int v12 = [v9 localizedStringForKey:v10 value:&stru_26D410CA0 table:v11];
    [(PSUIAddCellularPlanSpecifier *)self setName:v12];
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "finish activation flow. self:%@", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__PSUIAddCellularPlanSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_2645E0E68;
  objc_copyWeak(&v6, (id *)buf);
  v5[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __54__PSUIAddCellularPlanSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [WeakRetained hostController];
      v5 = [WeakRetained hostController];
      id v6 = [v5 navigationController];
      int v7 = [WeakRetained flow];
      int v10 = 138412802;
      v11 = v4;
      __int16 v12 = 2112;
      int v13 = v6;
      __int16 v14 = 2112;
      __int16 v15 = v7;
      _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "dismiss view controller. host:%@, nc:%@, flow:%@", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v8 = [WeakRetained hostController];
    BOOL v9 = [v8 navigationController];
    [v9 dismissViewControllerAnimated:1 completion:0];

    [WeakRetained setFlow:0];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v10) = 0;
    _os_log_error_impl(&dword_221B17000, &_os_log_internal, OS_LOG_TYPE_ERROR, "specifier is invalid. CANNOT dismiss UI", (uint8_t *)&v10, 2u);
  }
}

- (int64_t)userConsentResponse
{
  return 2;
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_spinner)
  {
    uint64_t v5 = *MEMORY[0x263F602B0];
  }
  else
  {
    id v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v6;

    uint64_t v5 = *MEMORY[0x263F602B0];
    uint64_t v8 = [(PSUIAddCellularPlanSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
    BOOL v9 = [v8 accessoryView];
    id originAccessoryView = self->_originAccessoryView;
    self->_id originAccessoryView = v9;
  }
  v11 = [(PSUIAddCellularPlanSpecifier *)self propertyForKey:v5];
  __int16 v12 = v11;
  if (v11)
  {
    if (v3)
    {
      [v11 setAccessoryView:self->_spinner];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
      [v12 setAccessoryView:self->_originAccessoryView];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__PSUIAddCellularPlanSpecifier_showSpinner___block_invoke;
    block[3] = &unk_2645E0B88;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    int v13 = [(PSUIAddCellularPlanSpecifier *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, "invalid table cell", buf, 2u);
    }
  }
}

void __44__PSUIAddCellularPlanSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)*MEMORY[0x263F602B0] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      BOOL v9 = [v8 textLabel];
      [v9 setNumberOfLines:0];

      int v10 = [v8 textLabel];
      [v10 setLineBreakMode:0];

      if (self->_spinner) {
        objc_msgSend(v8, "setAccessoryView:");
      }
    }
  }
  if ([(id)*MEMORY[0x263F600A8] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSUIAddCellularPlanSpecifier showSpinner:](self, "showSpinner:", [v6 BOOLValue] ^ 1);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUIAddCellularPlanSpecifier;
  [(PSUIAddCellularPlanSpecifier *)&v11 setProperty:v6 forKey:v7];
}

- (void)_showWifiAlert
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"NOT_CONNECTED_TO_INTERNET" value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  uint64_t v5 = [MEMORY[0x263F82670] currentDevice];
  LODWORD(v3) = objc_msgSend(v5, "sf_isiPhone");
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v3) {
    id v8 = @"TURN_ON_WIFI_TO_SETUP_ESIM";
  }
  else {
    id v8 = @"TURN_ON_WIFI_TO_SETUP_ESIM_IPAD";
  }
  BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  int v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v4 message:v9 preferredStyle:1];
  objc_super v11 = [MEMORY[0x263F82670] currentDevice];
  int v12 = objc_msgSend(v11, "sf_isChinaRegionCellularDevice");
  int v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v14 = v13;
  if (v12) {
    __int16 v15 = @"CHOOSE_WLAN";
  }
  else {
    __int16 v15 = @"CHOOSE_WIFI";
  }
  uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  uint64_t v17 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:&__block_literal_global_23];
  [v10 addAction:v17];
  v18 = (void *)MEMORY[0x263F82400];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __46__PSUIAddCellularPlanSpecifier__showWifiAlert__block_invoke_2;
  v23[3] = &unk_2645E0CA0;
  v23[4] = self;
  uint64_t v21 = [v18 actionWithTitle:v20 style:1 handler:v23];

  [v10 addAction:v21];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained presentViewController:v10 animated:1 completion:0];
}

void __46__PSUIAddCellularPlanSpecifier__showWifiAlert__block_invoke()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __46__PSUIAddCellularPlanSpecifier__showWifiAlert__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "user canceled setting up eSIM", v2, 2u);
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"add.cp"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (UIViewController)firstViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setFirstViewController:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 256, 1);
}

- (void)setFlow:(id)a3
{
}

- (BOOL)isRequestingFirstViewController
{
  return self->_isRequestingFirstViewController;
}

- (void)setIsRequestingFirstViewController:(BOOL)a3
{
  self->_isRequestingFirstViewController = a3;
}

- (BOOL)isEmbeddedInCarrierList
{
  return self->_isEmbeddedInCarrierList;
}

- (void)setIsEmbeddedInCarrierList:(BOOL)a3
{
  self->_isEmbeddedInCarrierList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_firstViewController);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
  objc_storeStrong((id *)&self->_planManager, 0);
}

@end