@interface MSDWelcomeViewController
+ (void)needsToRun:(id)a3;
- (BOOL)_bothWifiAndCellularActive;
- (MSDSetupUIController)controller;
- (MSDWelcomeViewController)init;
- (NSString)currentSSID;
- (id)completionHandler;
- (unint64_t)activeNetworkInterface;
- (void)_checkIn;
- (void)_showCheckInErrorAlert;
- (void)_showNetworkInterfaceSelectionAlert;
- (void)_showNextView;
- (void)setActiveNetworkInterface:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setController:(id)a3;
- (void)setCurrentSSID:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MSDWelcomeViewController

+ (void)needsToRun:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__MSDWelcomeViewController_needsToRun___block_invoke;
  v7[3] = &unk_264D88250;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__MSDWelcomeViewController_needsToRun___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F55C40] sharedInstance];
  int v3 = [v2 isEnrolled:0];

  id v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 1024;
    int v16 = v3 ^ 1;
    id v5 = v14;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ needs to run: %{BOOL}d", (uint8_t *)&v13, 0x12u);
  }
  id v6 = [MEMORY[0x263F55C30] sharedInstance];
  int v7 = [v6 isDeviceEnrolledWithDeKOTA:0];

  id v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 1024;
    int v16 = v7;
    id v10 = v9;
    _os_log_impl(&dword_23911B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ needs to enable SEP demo mode: %{BOOL}d", (uint8_t *)&v13, 0x12u);
  }
  if (v7)
  {
    v11 = [MEMORY[0x263F55C40] sharedInstance];
    [v11 setSEPDemoMode:1];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MSDWelcomeViewController)init
{
  int v3 = +[MSDSetupUILocalization localizedStringForKey:@"DEMO_SETUP_WAIT_TEXT"];
  v8.receiver = self;
  v8.super_class = (Class)MSDWelcomeViewController;
  id v4 = [(OBSetupAssistantSpinnerController *)&v8 initWithSpinnerText:v3];
  if (v4)
  {
    id v5 = +[MSDSetupUIController sharedInstance];
    [(MSDWelcomeViewController *)v4 setController:v5];

    [(MSDWelcomeViewController *)v4 setCurrentSSID:0];
    id v6 = [(OBBaseWelcomeController *)v4 navigationItem];
    [v6 setHidesBackButton:1];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v34[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F55C70];
  uint64_t v6 = *MEMORY[0x263F55C68];
  v34[0] = *MEMORY[0x263F55C70];
  v34[1] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v31.receiver = self;
  v31.super_class = (Class)MSDWelcomeViewController;
  [(OBBaseWelcomeController *)&v31 viewDidAppear:v3];
  objc_super v8 = [(MSDWelcomeViewController *)self controller];
  [v8 saveLocationServicesState];

  id v9 = [MEMORY[0x263EFF910] now];
  [v9 timeIntervalSince1970];
  double v11 = v10;
  v12 = [(MSDWelcomeViewController *)self controller];
  [v12 setAutoEnrollmentTimeStamp:v11];

  uint64_t v13 = [(MSDWelcomeViewController *)self navigationController];
  if (!v13
    || (id v14 = (void *)v13,
        [(MSDWelcomeViewController *)self navigationController],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[MSDWelcomeViewController viewDidAppear:]();
  }

  int v16 = [(MSDWelcomeViewController *)self controller];
  uint64_t v17 = [(MSDWelcomeViewController *)self completionHandler];
  [v16 setCompletionHandler:v17];

  v18 = [(MSDWelcomeViewController *)self controller];
  v19 = [(MSDWelcomeViewController *)self navigationController];
  [v18 setNavigationController:v19];

  v20 = [MEMORY[0x263F55C40] sharedInstance];
  uint64_t v21 = [v20 typeOfDemoDevice];

  if (v21 == 3)
  {
    v22 = defaultLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23911B000, v22, OS_LOG_TYPE_DEFAULT, "Device is a FDSKU device only and does not have demo bit; entering offline mode",
        buf,
        2u);
    }

    id v23 = [(MSDWelcomeViewController *)self controller];
    [v23 quitToOfflineMode];
  }
  else
  {
    v24 = [MEMORY[0x263F55C40] sharedInstance];
    id v30 = 0;
    v25 = [v24 getCurrentNetworkInfoForKeys:v7 outError:&v30];
    id v23 = v30;

    v26 = defaultLogHandle();
    v27 = v26;
    if (!v25 || v23)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[MSDWelcomeViewController viewDidAppear:]((uint64_t)v23, v27);
      }
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v25;
        _os_log_impl(&dword_23911B000, v27, OS_LOG_TYPE_DEFAULT, "Got current network info: %{public}@", buf, 0xCu);
      }

      v27 = [v25 objectForKey:v5];
      v28 = [v25 objectForKey:v6];
      if (v27) {
        [(MSDWelcomeViewController *)self setCurrentSSID:v27];
      }
      if (v28) {
        -[MSDWelcomeViewController setActiveNetworkInterface:](self, "setActiveNetworkInterface:", [v28 unsignedIntegerValue]);
      }
    }
    if ([(MSDWelcomeViewController *)self _bothWifiAndCellularActive])
    {
      v29 = defaultLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23911B000, v29, OS_LOG_TYPE_DEFAULT, "Both WiFi and Cellular are active on device, prompting user to choose network configuration...", buf, 2u);
      }

      [(MSDWelcomeViewController *)self _showNetworkInterfaceSelectionAlert];
    }
    else
    {
      [(MSDWelcomeViewController *)self _checkIn];
    }
  }
}

- (BOOL)_bothWifiAndCellularActive
{
  if ([(MSDWelcomeViewController *)self activeNetworkInterface]) {
    return ([(MSDWelcomeViewController *)self activeNetworkInterface] >> 1) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_checkIn
{
  if (!os_variant_has_internal_content())
  {
LABEL_14:
    v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23911B000, v12, OS_LOG_TYPE_DEFAULT, "Checking In with Demo Unit ...", buf, 2u);
    }

    uint64_t v13 = [MEMORY[0x263F55C40] sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__MSDWelcomeViewController__checkIn__block_invoke;
    v14[3] = &unk_264D88278;
    v14[4] = self;
    [v13 checkInWithCompletion:v14];

    return;
  }
  BOOL v3 = +[MSDTestPreferences sharedInstance];
  uint64_t v4 = [v3 storePickerUIMode];

  uint64_t v5 = +[MSDTestPreferences sharedInstance];
  int v6 = [v5 disassociateWiFiBeforeCheckIn];

  if (v4 != 1)
  {
    if (!v4)
    {
      int v7 = defaultLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23911B000, v7, OS_LOG_TYPE_DEFAULT, "Skipping CheckIn and calling demod...", buf, 2u);
      }

      objc_super v8 = [(MSDWelcomeViewController *)self controller];
      [v8 setupCompleteWithStoreID:0];

      return;
    }
    if (v6)
    {
      double v10 = defaultLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23911B000, v10, OS_LOG_TYPE_DEFAULT, "Disconnecting WiFi...", buf, 2u);
      }

      double v11 = [(MSDWelcomeViewController *)self controller];
      [v11 disconnectWiFi];
    }
    goto LABEL_14;
  }
  id v9 = defaultLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23911B000, v9, OS_LOG_TYPE_DEFAULT, "Showing store picker UI...", buf, 2u);
  }

  [(MSDWelcomeViewController *)self _showNextView];
}

void __36__MSDWelcomeViewController__checkIn__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  objc_super v8 = defaultLogHandle();
  id v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109376;
      int v19 = a2;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_impl(&dword_23911B000, v9, OS_LOG_TYPE_DEFAULT, "Device eligibility for demo: %d; showUI: %d",
        (uint8_t *)&v18,
        0xEu);
    }

    if (a2)
    {
      if (a3)
      {
        double v10 = defaultLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_23911B000, v10, OS_LOG_TYPE_DEFAULT, "Showing store picker UI...", (uint8_t *)&v18, 2u);
        }

        [*(id *)(a1 + 32) _showNextView];
        goto LABEL_16;
      }
      uint64_t v17 = [*(id *)(a1 + 32) controller];
      [v17 setupCompleteWithStoreID:0];
    }
    else
    {
      double v11 = defaultLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [*(id *)(a1 + 32) controller];
        int v13 = [v12 hasSecureCookie];
        int v18 = 67109120;
        int v19 = v13;
        _os_log_impl(&dword_23911B000, v11, OS_LOG_TYPE_DEFAULT, "Device is not eligible; hasSecureCookie=%d",
          (uint8_t *)&v18,
          8u);
      }
      id v14 = [*(id *)(a1 + 32) controller];
      int v15 = [v14 hasSecureCookie];

      int v16 = [*(id *)(a1 + 32) controller];
      uint64_t v17 = v16;
      if (v15) {
        [v16 quitToOfflineMode];
      }
      else {
        [v16 quitToCustomerFlow];
      }
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __36__MSDWelcomeViewController__checkIn__block_invoke_cold_1((uint64_t)v7, v9);
  }

  [*(id *)(a1 + 32) _showCheckInErrorAlert];
LABEL_16:
}

- (void)_showCheckInErrorAlert
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke(uint64_t a1)
{
  v2 = +[MSDSetupUILocalization localizedStringForKey:@"CHECK_IN_ERROR_TITLE"];
  BOOL v3 = +[MSDSetupUILocalization localizedStringForKey:@"CHOOSE_NETWORK_OPTION"];
  uint64_t v4 = +[MSDSetupUILocalization localizedStringForKey:@"COMPLETE_SETUP_OPTION"];
  uint64_t v5 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v2 message:0 preferredStyle:1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_2;
  v9[3] = &unk_264D882A0;
  v9[4] = *(void *)(a1 + 32);
  int v6 = [MEMORY[0x263F1C3F0] actionWithTitle:v3 style:0 handler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_27;
  v8[3] = &unk_264D882A0;
  v8[4] = *(void *)(a1 + 32);
  id v7 = [MEMORY[0x263F1C3F0] actionWithTitle:v4 style:1 handler:v8];
  [v5 addAction:v6];
  [v5 addAction:v7];
  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

void __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_2(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Back to wifi pane to choose different network", v4, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) controller];
  [v3 popTopmostViewController];
}

void __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_27(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Completing setup and quitting store picker UI...", v7, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) controller];
  int v4 = [v3 hasSecureCookie];

  uint64_t v5 = [*(id *)(a1 + 32) controller];
  int v6 = v5;
  if (v4) {
    [v5 quitToOfflineMode];
  }
  else {
    [v5 quitToHomeScreen];
  }
}

- (void)_showNetworkInterfaceSelectionAlert
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke(uint64_t a1)
{
  v2 = +[MSDSetupUILocalization localizedStringForKey:@"NETWORK_CONFIG_TITLE"];
  BOOL v3 = [*(id *)(a1 + 32) currentSSID];
  int v4 = +[MSDSetupUILocalization localizedStringForKey:@"NETWORK_CONFIG_DESCRIPTION" withStringArgument:v3];

  uint64_t v5 = +[MSDSetupUILocalization localizedStringForKey:@"USE_CELLULAR_OPTION"];
  int v6 = +[MSDSetupUILocalization localizedStringForKey:@"CHOOSE_NETWORK_OPTION"];
  if (MGGetBoolAnswer()) {
    id v7 = @"USE_WLAN_AND_CELLUAR_OPTION";
  }
  else {
    id v7 = @"USE_WIFI_AND_CELLUAR_OPTION";
  }
  objc_super v8 = +[MSDSetupUILocalization localizedStringForKey:v7];
  id v9 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v2 message:v4 preferredStyle:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_2;
  v15[3] = &unk_264D882A0;
  v15[4] = *(void *)(a1 + 32);
  double v10 = [MEMORY[0x263F1C3F0] actionWithTitle:v5 style:0 handler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_46;
  v14[3] = &unk_264D882A0;
  v14[4] = *(void *)(a1 + 32);
  double v11 = [MEMORY[0x263F1C3F0] actionWithTitle:v8 style:0 handler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_47;
  v13[3] = &unk_264D882A0;
  v13[4] = *(void *)(a1 + 32);
  v12 = [MEMORY[0x263F1C3F0] actionWithTitle:v6 style:0 handler:v13];
  [v9 addAction:v10];
  [v9 addAction:v11];
  [v9 addAction:v12];
  [v9 setPreferredAction:v12];
  [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
}

void __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Using Cellular Only", buf, 2u);
  }

  BOOL v3 = [MEMORY[0x263F55C40] sharedInstance];
  id v6 = 0;
  [v3 disconnectAndForgetWiFi:&v6];
  id v4 = v6;

  uint64_t v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_23911B000, v5, OS_LOG_TYPE_DEFAULT, "Disconnect and forget wifi completed with error: %{public}@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) _checkIn];
}

uint64_t __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_46(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Using WiFi + Cellular", v4, 2u);
  }

  return [*(id *)(a1 + 32) _checkIn];
}

void __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_47(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Back to wifi pane to choose different network", v4, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) controller];
  [v3 popTopmostViewController];
}

- (void)_showNextView
{
  id v4 = objc_alloc_init(MSDDemoSetupViewController);
  BOOL v3 = [(MSDWelcomeViewController *)self controller];
  [v3 pushViewController:v4 andRemoveTopmostView:0];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (MSDSetupUIController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (unint64_t)activeNetworkInterface
{
  return self->_activeNetworkInterface;
}

- (void)setActiveNetworkInterface:(unint64_t)a3
{
  self->_activeNetworkInterface = a3;
}

- (NSString)currentSSID
{
  return self->_currentSSID;
}

- (void)setCurrentSSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSSID, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)viewDidAppear:.cold.1()
{
}

- (void)viewDidAppear:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23911B000, a2, OS_LOG_TYPE_ERROR, "Failed to get current network info with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __36__MSDWelcomeViewController__checkIn__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23911B000, a2, OS_LOG_TYPE_ERROR, "CheckIn returned error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end