@interface PSUIConvertToESIMSpecifier
+ (id)keyFor:(id)a3;
+ (id)specifierWithPhoneNumber:(id)a3 carrierName:(id)a4 hostController:(id)a5 isViewControllerPopNeeded:(BOOL)a6 iccid:(id)a7;
- (PSUIConvertToESIMSpecifier)initWithPhoneNumber:(id)a3 carrierName:(id)a4 hostController:(id)a5 isViewControllerPopNeeded:(BOOL)a6 iccid:(id)a7;
- (id)getLogger;
- (void)_convertToeSIM;
- (void)_showWifiAlert;
- (void)convertToeSIMCellPressed:(id)a3;
- (void)dealloc;
- (void)odcCanceled:(id)a3;
- (void)odcFailed:(id)a3;
- (void)odcSuccess:(id)a3 isViewControllerPopNeeded:(BOOL)a4;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIConvertToESIMSpecifier

+ (id)keyFor:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v3 stringWithFormat:@"%@:%@", objc_opt_class(), v4];

  return v5;
}

+ (id)specifierWithPhoneNumber:(id)a3 carrierName:(id)a4 hostController:(id)a5 isViewControllerPopNeeded:(BOOL)a6 iccid:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = +[PSUIConvertToESIMSpecifier keyFor:v14];
  v16 = +[SSFlowHostCache sharedInstance];
  v17 = [v16 objectForKey:v15];

  if (v17) {
    v18 = v17;
  }
  else {
    v18 = [[PSUIConvertToESIMSpecifier alloc] initWithPhoneNumber:v11 carrierName:v12 hostController:v13 isViewControllerPopNeeded:v8 iccid:v14];
  }
  v19 = v18;

  return v19;
}

- (PSUIConvertToESIMSpecifier)initWithPhoneNumber:(id)a3 carrierName:(id)a4 hostController:(id)a5 isViewControllerPopNeeded:(BOOL)a6 iccid:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  BOOL v27 = a6;
  id v17 = v14;
  v18 = v13;
  if (_MergedGlobals_1_1 != -1) {
    dispatch_once(&_MergedGlobals_1_1, &__block_literal_global_7);
  }
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"Convert to eSIM" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v28.receiver = self;
  v28.super_class = (Class)PSUIConvertToESIMSpecifier;
  v21 = [(PSUIConvertToESIMSpecifier *)&v28 initWithName:v20 target:0 set:0 get:0 detail:0 cell:13 edit:0];

  if (v21)
  {
    [(PSUIConvertToESIMSpecifier *)v21 setIdentifier:@"Convert to eSIM"];
    [(PSUIConvertToESIMSpecifier *)v21 setTarget:v21];
    [(PSUIConvertToESIMSpecifier *)v21 setButtonAction:sel_convertToeSIMCellPressed_];
    objc_storeStrong((id *)&v21->_phoneNumber, a3);
    objc_storeStrong((id *)&v21->_carrierName, a4);
    objc_storeWeak((id *)&v21->_hostController, v15);
    v22 = [v15 navigationController];
    objc_storeWeak((id *)&v21->_navigationController, v22);

    v21->_isViewControllerPopNeeded = v27;
    objc_storeStrong((id *)&v21->_iccid, a7);
  }
  v23 = [(id)qword_26AC32378 objectForKey:v16];
  v24 = v17;
  if (v23)
  {
    v25 = [(PSUIConvertToESIMSpecifier *)v21 getLogger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      _os_log_impl(&dword_221B17000, v25, OS_LOG_TYPE_DEFAULT, "update delegate to %@", buf, 0xCu);
    }

    [v23 setDelegate:v21];
  }

  return v21;
}

uint64_t __109__PSUIConvertToESIMSpecifier_initWithPhoneNumber_carrierName_hostController_isViewControllerPopNeeded_iccid___block_invoke()
{
  qword_26AC32378 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSUIConvertToESIMSpecifier;
  [(PSUIConvertToESIMSpecifier *)&v4 dealloc];
}

- (void)convertToeSIMCellPressed:(id)a3
{
  objc_super v4 = +[PSUIDeviceWiFiState sharedInstance];
  char v5 = [v4 isConnectedOverWiFi];

  if (v5)
  {
    [(PSUIConvertToESIMSpecifier *)self _convertToeSIM];
  }
  else
  {
    [(PSUIConvertToESIMSpecifier *)self _showWifiAlert];
  }
}

- (void)odcSuccess:(id)a3 isViewControllerPopNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PSUIConvertToESIMSpecifier *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "ODC Success", v10, 2u);
  }

  [(id)qword_26AC32378 removeObjectForKey:v6];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    id v9 = (id)[WeakRetained popViewControllerAnimated:1];
  }
}

- (void)odcFailed:(id)a3
{
  id v4 = a3;
  char v5 = [(PSUIConvertToESIMSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "ODC Failed", v6, 2u);
  }

  [(id)qword_26AC32378 removeObjectForKey:v4];
}

- (void)odcCanceled:(id)a3
{
  id v4 = a3;
  char v5 = [(PSUIConvertToESIMSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "ODC canceled", v6, 2u);
  }

  [(id)qword_26AC32378 removeObjectForKey:v4];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__PSUIConvertToESIMSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_2645E0E18;
  objc_copyWeak(v6, &location);
  v5[4] = self;
  v6[1] = (id)a3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __52__PSUIConvertToESIMSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 29);
    char v5 = [v4 presentedViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v14 = 134217984;
      uint64_t v15 = v7;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "simSetupFlowCompleted with completionType:%ld", (uint8_t *)&v14, 0xCu);
    }

    if (*((unsigned char *)v3 + 248) && *(void *)(a1 + 48) == 2)
    {
      id v8 = objc_loadWeakRetained(v3 + 29);
      id v9 = [v8 navigationController];
      id v10 = (id)[v9 popViewControllerAnimated:1];
    }
    id v11 = v3[26];
    v3[26] = 0;

    id v12 = +[PSUIConvertToESIMSpecifier keyFor:v3[32]];
    id v13 = +[SSFlowHostCache sharedInstance];
    [v13 removeObjectForKey:v12];
  }
}

- (void)_convertToeSIM
{
  v27[3] = *MEMORY[0x263EF8340];
  v3 = [(PSUIConvertToESIMSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "start convert physical SIM -> eSIM", buf, 2u);
  }

  if (!self->_carrierName)
  {
    id v4 = [(PSUIConvertToESIMSpecifier *)self getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "carrier name empty", buf, 2u);
    }

    char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"CARRIER" value:&stru_26D410CA0 table:@"Cellular"];
    carrierName = self->_carrierName;
    self->_carrierName = v6;
  }
  v26[0] = *MEMORY[0x263F66090];
  id v8 = [NSNumber numberWithInteger:9];
  uint64_t v9 = *MEMORY[0x263F66088];
  id v10 = self->_carrierName;
  v27[0] = v8;
  v27[1] = v10;
  uint64_t v11 = *MEMORY[0x263F66098];
  phoneNumber = self->_phoneNumber;
  v26[1] = v9;
  v26[2] = v11;
  if (phoneNumber) {
    id v13 = (__CFString *)phoneNumber;
  }
  else {
    id v13 = &stru_26D410CA0;
  }
  v27[2] = v13;
  int v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  uint64_t v15 = [(PSUIConvertToESIMSpecifier *)self getLogger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "launch SimSetupSupport with options:%@", buf, 0xCu);
  }

  uint64_t v16 = [MEMORY[0x263F66078] flowWithOptions:v14];
  flow = self->_flow;
  self->_flow = v16;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  v18 = [(id)qword_26AC32378 objectForKey:self->_iccid];
  if (v18)
  {
    id WeakRetained = [(PSUIConvertToESIMSpecifier *)self getLogger];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_221B17000, WeakRetained, OS_LOG_TYPE_ERROR, "The model shouldn't already exist until after _convertToeSIM call", buf, 2u);
    }
  }
  else
  {
    v20 = [ConvertToESIMSpecifierCache alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    v21 = [(ConvertToESIMSpecifierCache *)v20 initWithDelegate:WeakRetained isViewControllerPopNeeded:self->_isViewControllerPopNeeded odcFlow:self->_flow delegate:self iccid:self->_iccid];
    [(id)qword_26AC32378 setObject:v21 forKeyedSubscript:self->_iccid];
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v22 = self->_flow;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __44__PSUIConvertToESIMSpecifier__convertToeSIM__block_invoke;
  v23[3] = &unk_2645E0E90;
  objc_copyWeak(&v24, (id *)buf);
  [(TSSIMSetupFlow *)v22 firstViewController:v23];
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

void __44__PSUIConvertToESIMSpecifier__convertToeSIM__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v8];
    [v4 setModalPresentationStyle:2];
    id v5 = objc_loadWeakRetained(WeakRetained + 29);
    [v5 presentViewController:v4 animated:1 completion:0];

    id v6 = +[PSUIConvertToESIMSpecifier keyFor:WeakRetained[32]];
    uint64_t v7 = +[SSFlowHostCache sharedInstance];
    [v7 setObject:WeakRetained forKey:v6];
  }
}

- (void)_showWifiAlert
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = @"NOT_CONNECTED_TO_WLAN";
  }
  else {
    uint64_t v7 = @"NOT_CONNECTED_TO_WIFI";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
  int v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = v11;
  if (v10) {
    id v13 = @"TURN_ON_WLAN_FOR_CONVERT_TO_ESIM";
  }
  else {
    id v13 = @"TURN_ON_WIFI_FOR_CONVERT_TO_ESIM";
  }
  int v14 = [v11 localizedStringForKey:v13 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  uint64_t v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v14 preferredStyle:1];
  uint64_t v16 = [MEMORY[0x263F82670] currentDevice];
  int v17 = objc_msgSend(v16, "sf_isChinaRegionCellularDevice");
  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v19 = v18;
  if (v17) {
    v20 = @"WLAN_SETTINGS";
  }
  else {
    v20 = @"WIFI_SETTINGS";
  }
  v21 = [v18 localizedStringForKey:v20 value:&stru_26D410CA0 table:@"Gemini-Gemini"];

  v22 = [MEMORY[0x263F82400] actionWithTitle:v21 style:0 handler:&__block_literal_global_59];
  [v15 addAction:v22];
  v23 = (void *)MEMORY[0x263F82400];
  id v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __44__PSUIConvertToESIMSpecifier__showWifiAlert__block_invoke_2;
  v28[3] = &unk_2645E0CA0;
  v28[4] = self;
  v26 = [v23 actionWithTitle:v25 style:1 handler:v28];

  [v15 addAction:v26];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained presentViewController:v15 animated:1 completion:0];
}

void __44__PSUIConvertToESIMSpecifier__showWifiAlert__block_invoke()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=WIFI"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __44__PSUIConvertToESIMSpecifier__showWifiAlert__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_221B17000, v1, OS_LOG_TYPE_DEFAULT, "user canceled on device psim to esim conversion", v2, 2u);
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"convert.esim"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end