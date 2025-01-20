@interface MSDSetupUIController
+ (MSDSetupUIController)sharedInstance;
- (BFFNavigationController)navigationController;
- (BOOL)hasSecureCookie;
- (BOOL)originalLocationServicesState;
- (NSData)helpMenuUserTapped;
- (double)autoEnrollmentTimeStamp;
- (id)completionHandler;
- (void)_restoreLocationServicesState;
- (void)_setupComplete:(BOOL)a3;
- (void)_startEACSWithReason:(id)a3 eraseDataPlan:(BOOL)a4;
- (void)disconnectWiFi;
- (void)enableLocationServices;
- (void)markAsNotDemoAndEraseDataPlan:(BOOL)a3;
- (void)popTopmostViewController;
- (void)pushViewController:(id)a3 andRemoveTopmostView:(BOOL)a4;
- (void)quitToCustomerFlow;
- (void)quitToHomeScreen;
- (void)quitToOfflineMode;
- (void)saveLocationServicesState;
- (void)setAutoEnrollmentTimeStamp:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHelpMenuRowSelection:(id)a3;
- (void)setHelpMenuUserTapped:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setOriginalLocationServicesState:(BOOL)a3;
- (void)setupCompleteWithStoreID:(id)a3;
@end

@implementation MSDSetupUIController

+ (MSDSetupUIController)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return (MSDSetupUIController *)v2;
}

uint64_t __38__MSDSetupUIController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(MSDSetupUIController);
  return MEMORY[0x270F9A758]();
}

- (void)setNavigationController:(id)a3
{
}

- (void)pushViewController:(id)a3 andRemoveTopmostView:(BOOL)a4
{
  id v6 = a3;
  v7 = [(MSDSetupUIController *)self navigationController];
  v8 = [v7 topViewController];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke;
  v11[3] = &unk_264D88368;
  v11[4] = self;
  id v12 = v6;
  BOOL v14 = a4;
  id v13 = v8;
  id v9 = v8;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke_2;
  v6[3] = &unk_264D88340;
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 pushViewController:v3 completion:v6];
}

void __64__MSDSetupUIController_pushViewController_andRemoveTopmostView___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = defaultLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v3 = v9;
      _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Removing top most view: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    id v4 = [*(id *)(a1 + 40) navigationController];
    uint64_t v5 = [v4 viewControllers];
    id v6 = (void *)[v5 mutableCopy];

    [v6 removeObject:*(void *)(a1 + 32)];
    id v7 = [*(id *)(a1 + 40) navigationController];
    [v7 setViewControllers:v6];
  }
}

- (void)popTopmostViewController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__MSDSetupUIController_popTopmostViewController__block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__MSDSetupUIController_popTopmostViewController__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)setCompletionHandler:(id)a3
{
  self->_completionHandler = (id)MEMORY[0x23EC9D590](a3, a2);
  MEMORY[0x270F9A758]();
}

- (void)setupCompleteWithStoreID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_23911B000, v5, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI complete with store ID: %@", buf, 0xCu);
  }

  if (v4)
  {
    uint64_t v11 = *MEMORY[0x263F55C48];
    id v12 = v4;
    id v6 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = defaultLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_23911B000, v7, OS_LOG_TYPE_DEFAULT, "Starting demod with options: %{public}@", buf, 0xCu);
  }

  int v8 = [MEMORY[0x263F55C40] sharedInstance];
  [v8 sendAutoEnrollmentResult:v4 withStoreId:self->_helpMenuUserTapped withHelpMenuRowSelection:self->_autoEnrollmentTimeStamp];

  id v9 = [MEMORY[0x263F55C40] sharedInstance];
  uint64_t v10 = [v9 prepareWithOptions:v6];

  [(MSDSetupUIController *)self _setupComplete:v10];
}

- (void)quitToCustomerFlow
{
  id v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI exit, proceed to customer Buddy flow", v4, 2u);
  }

  [(MSDSetupUIController *)self _setupComplete:0];
}

- (void)quitToOfflineMode
{
  id v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI exit, proceed to offline mode", v6, 2u);
  }

  id v4 = [MEMORY[0x263F55C40] sharedInstance];
  uint64_t v5 = [v4 enterOfflineModeWithOptions:0 error:0];

  [(MSDSetupUIController *)self _setupComplete:v5];
}

- (BOOL)hasSecureCookie
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F55C40] sharedInstance];
  uint64_t v3 = [v2 typeOfDemoDevice];

  BOOL v5 = v3 == 5 || v3 == 3;
  id v6 = defaultLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "Device has secure cookie: %d", (uint8_t *)v8, 8u);
  }

  return v5;
}

- (void)quitToHomeScreen
{
  uint64_t v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemo setup UI exit, proceed to home screen", v4, 2u);
  }

  [(MSDSetupUIController *)self _setupComplete:1];
}

- (void)setHelpMenuRowSelection:(id)a3
{
  self->_helpMenuUserTapped = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:0 error:0];
  MEMORY[0x270F9A758]();
}

- (void)markAsNotDemoAndEraseDataPlan:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  if (os_variant_has_internal_content()
    && (+[MSDTestPreferences sharedInstance],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 skipMarkAsNotDemo],
        v5,
        v6))
  {
    v17 = defaultLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23911B000, v17, OS_LOG_TYPE_DEFAULT, "Skipping making the device as not demo...", buf, 2u);
    }
  }
  else
  {
    id v7 = [MEMORY[0x263F55C40] sharedInstance];
    uint64_t v8 = [v7 typeOfDemoDevice];

    if (v8 == 5)
    {
      uint64_t v9 = [MEMORY[0x263F55C40] sharedInstance];
      uint64_t v10 = +[MSDLanguageAndRegionManager sharedInstance];
      uint64_t v11 = [v10 getCurrentDeviceLanguage];
      id v12 = +[MSDLanguageAndRegionManager sharedInstance];
      id v13 = [v12 getCurrentDeviceRegion];
      [v9 sendAutoEnrollmentAbortEvent:v11 countryCode:v13];
    }
    id v14 = defaultLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23911B000, v14, OS_LOG_TYPE_DEFAULT, "Requesting device to be marked as not demo", buf, 2u);
    }

    uint64_t v15 = [MEMORY[0x263F55C40] sharedInstance];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__MSDSetupUIController_markAsNotDemoAndEraseDataPlan___block_invoke;
    v18[3] = &unk_264D88390;
    v18[4] = &v20;
    [v15 markAsNotDemoWithCompletion:v18];

    v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23911B000, v16, OS_LOG_TYPE_DEFAULT, "Waiting for mark as demo to complete...", buf, 2u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v21[5], 0xFFFFFFFFFFFFFFFFLL);
  }
  [(MSDSetupUIController *)self _startEACSWithReason:@"Not a Demo Device Erase" eraseDataPlan:v3];
  _Block_object_dispose(&v20, 8);
}

void __54__MSDSetupUIController_markAsNotDemoAndEraseDataPlan___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = defaultLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2114;
    id v9 = v5;
    _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "MarkAsNotDemo returned success: %d; error: %{public}@",
      (uint8_t *)v7,
      0x12u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (void)disconnectWiFi
{
  id v2 = [MEMORY[0x263F55C40] sharedInstance];
  [v2 disconnectAndForgetWiFi:0];
}

- (void)enableLocationServices
{
  id v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Enabling location services...", v3, 2u);
  }

  [MEMORY[0x263F00A60] setLocationServicesEnabled:1];
}

- (void)saveLocationServicesState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MSDSetupUIController_saveLocationServicesState__block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  if (saveLocationServicesState_onceToken != -1) {
    dispatch_once(&saveLocationServicesState_onceToken, block);
  }
}

void __49__MSDSetupUIController_saveLocationServicesState__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalLocationServicesState:", objc_msgSend(*(id *)(a1 + 32), "hasSecureCookie"));
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  id v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "Saving original Location Services state...", buf, 2u);
  }

  id v5 = dispatch_get_global_queue(21, 0);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __49__MSDSetupUIController_saveLocationServicesState__block_invoke_25;
  id v12 = &unk_264D882F0;
  uint64_t v13 = *(void *)(a1 + 32);
  int v6 = v2;
  id v14 = v6;
  dispatch_async(v5, &v9);

  if (dispatch_semaphore_wait(v6, v3))
  {
    id v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = objc_msgSend(*(id *)(a1 + 32), "originalLocationServicesState", v9, v10, v11, v12, v13);
      *(_DWORD *)buf = 67109376;
      int v16 = 30;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl(&dword_23911B000, v7, OS_LOG_TYPE_DEFAULT, "Timed out waiting for location services state after %ds; assume Location Services is %{BOOL}d",
        buf,
        0xEu);
    }
  }
}

intptr_t __49__MSDSetupUIController_saveLocationServicesState__block_invoke_25(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a1 + 32), "setOriginalLocationServicesState:", objc_msgSend(MEMORY[0x263F00A60], "locationServicesEnabled:", 0));
  dispatch_semaphore_t v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) originalLocationServicesState];
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Saved original Location Services state as %{BOOL}d", (uint8_t *)v5, 8u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_setupComplete:(BOOL)a3
{
  [(MSDSetupUIController *)self _restoreLocationServicesState];
  id v5 = [(MSDSetupUIController *)self completionHandler];

  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__MSDSetupUIController__setupComplete___block_invoke;
    block[3] = &unk_264D883B8;
    BOOL v9 = a3;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "No completion handler provided", v7, 2u);
    }
  }
}

void __39__MSDSetupUIController__setupComplete___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Calling MobileStoreDemoSetupUI completion handler with success=%{BOOL}d", (uint8_t *)v5, 8u);
  }

  id v4 = [*(id *)(a1 + 32) completionHandler];
  v4[2](v4, *(unsigned __int8 *)(a1 + 40));
}

- (void)_startEACSWithReason:(id)a3 eraseDataPlan:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = defaultLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "Starting Erase Content and Settings...", v10, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x263F3B438]);
  [v7 setEraseDataPlan:v4];
  int v8 = (void *)[objc_alloc(MEMORY[0x263F3B440]) initWithMode:4 options:v7 reason:v5];

  BOOL v9 = [MEMORY[0x263F3B448] sharedInstance];
  [v9 resetWithRequest:v8 completion:&__block_literal_global_31];
}

void __59__MSDSetupUIController__startEACSWithReason_eraseDataPlan___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v3 = defaultLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138543362;
      id v9 = v2;
      id v5 = "Request to erase all content and settings failed =  %{public}@";
      uint64_t v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "Reset was successful";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (void)_restoreLocationServicesState
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [(MSDSetupUIController *)self originalLocationServicesState];
    _os_log_impl(&dword_23911B000, v3, OS_LOG_TYPE_DEFAULT, "Restoring Location Services state to %{BOOL}d", (uint8_t *)v4, 8u);
  }

  objc_msgSend(MEMORY[0x263F00A60], "setLocationServicesEnabled:", -[MSDSetupUIController originalLocationServicesState](self, "originalLocationServicesState"));
}

- (double)autoEnrollmentTimeStamp
{
  return self->_autoEnrollmentTimeStamp;
}

- (void)setAutoEnrollmentTimeStamp:(double)a3
{
  self->_autoEnrollmentTimeStamp = a3;
}

- (BFFNavigationController)navigationController
{
  return self->_navigationController;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSData)helpMenuUserTapped
{
  return self->_helpMenuUserTapped;
}

- (void)setHelpMenuUserTapped:(id)a3
{
}

- (BOOL)originalLocationServicesState
{
  return self->_originalLocationServicesState;
}

- (void)setOriginalLocationServicesState:(BOOL)a3
{
  self->_originalLocationServicesState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpMenuUserTapped, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end