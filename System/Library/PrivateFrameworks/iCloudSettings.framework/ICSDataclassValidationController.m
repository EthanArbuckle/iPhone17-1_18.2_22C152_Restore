@interface ICSDataclassValidationController
- (ACAccount)account;
- (BOOL)_isDataclassAllowlisted:(id)a3;
- (BOOL)_isEligibleForWalrus;
- (BOOL)isDataclassAvailable:(id)a3;
- (ICSDataclassValidationController)initWithAccount:(id)a3 presentingViewController:(id)a4;
- (ICSDataclassValidationControllerDelegate)delegate;
- (UIViewController)presentingViewController;
- (unint64_t)_currentWalrusStatus;
- (void)_reloadSpecifiers;
- (void)_startObservingManateeAvailabilityNotification;
- (void)_startObservingNotifications;
- (void)_startObservingWalrusStateChangeNotification;
- (void)_stopObservingManateeAvailabilityNotification;
- (void)_stopObservingNotifications;
- (void)_stopObservingWalrusStateChangeNotification;
- (void)_walrusPresentUnknownErrorWithCompletionHandler:(id)a3;
- (void)_walrusValidateAccessForDataclass:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)validateAccessForDataclass:(id)a3 completion:(id)a4;
@end

@implementation ICSDataclassValidationController

- (ICSDataclassValidationController)initWithAccount:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICSDataclassValidationController;
  v9 = [(ICSDataclassValidationController *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
    validationAccessSemaphore = v10->_validationAccessSemaphore;
    v10->_validationAccessSemaphore = (OS_dispatch_semaphore *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.validation-access-queue", v13);
    validationAccessQueue = v10->_validationAccessQueue;
    v10->_validationAccessQueue = (OS_dispatch_queue *)v14;

    [(ICSDataclassValidationController *)v10 _startObservingNotifications];
  }

  return v10;
}

- (void)dealloc
{
  [(ICSDataclassValidationController *)self _stopObservingNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICSDataclassValidationController;
  [(ICSDataclassValidationController *)&v3 dealloc];
}

- (BOOL)isDataclassAvailable:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_manateeAvailable
    || [(ICSDataclassValidationController *)self _currentWalrusStatus] == 2
    || [(ICSDataclassValidationController *)self _isDataclassAllowlisted:v4];

  return v5;
}

- (void)validateAccessForDataclass:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = LogSubsystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_262993000, v8, OS_LOG_TYPE_DEFAULT, "[ICSDataclassValidationController validateAccessForDataclass] dataclass: %@", buf, 0xCu);
  }

  if (self->_manateeAvailable
    || [(ICSDataclassValidationController *)self _currentWalrusStatus] == 2
    || [(ICSDataclassValidationController *)self _isDataclassAllowlisted:v6])
  {
    v7[2](v7, 1);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v9 = self->_validationAccessSemaphore;
    validationAccessQueue = self->_validationAccessQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke;
    v12[3] = &unk_2655B5778;
    v13 = v9;
    dispatch_semaphore_t v11 = v9;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v7;
    id v14 = v6;
    dispatch_async(validationAccessQueue, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2;
  aBlock[3] = &unk_2655B5700;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  objc_super v3 = _Block_copy(aBlock);
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _currentWalrusStatus];
    BOOL v5 = LogSubsystem();
    id v6 = v5;
    if (v4 == 1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_2();
      }

      [WeakRetained _walrusValidateAccessForDataclass:*(void *)(a1 + 40) completion:v3];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "ICSDataclassValidationController: Dataclass access cannot be validated, walrus status is unknown", buf, 2u);
      }

      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_33;
      v8[3] = &unk_2655B5750;
      id v9 = WeakRetained;
      id v10 = v3;
      dispatch_async(MEMORY[0x263EF83A0], v8);
    }
  }
  else
  {
    id v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_1();
    }

    (*((void (**)(void *, void))v3 + 2))(v3, 0);
  }
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2(uint64_t a1, char a2)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_3;
  v4[3] = &unk_2655B56D8;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_33(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2_34;
  v2[3] = &unk_2655B5728;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _walrusPresentUnknownErrorWithCompletionHandler:v2];
}

uint64_t __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startObservingNotifications
{
  [(ICSDataclassValidationController *)self _startObservingWalrusStateChangeNotification];

  [(ICSDataclassValidationController *)self _startObservingManateeAvailabilityNotification];
}

- (void)_stopObservingNotifications
{
  [(ICSDataclassValidationController *)self _stopObservingWalrusStateChangeNotification];

  [(ICSDataclassValidationController *)self _stopObservingManateeAvailabilityNotification];
}

- (void)_reloadSpecifiers
{
  id v3 = [(ICSDataclassValidationController *)self delegate];
  [v3 reloadSpecifiersForDataclassValidationController:self];
}

- (BOOL)_isEligibleForWalrus
{
  v2 = [(ICSDataclassValidationController *)self account];
  char v3 = objc_msgSend(v2, "aa_isAccountClass:", *MEMORY[0x263F25618]);

  return v3;
}

- (unint64_t)_currentWalrusStatus
{
  if ([(ICSDataclassValidationController *)self _isEligibleForWalrus]) {
    return self->_currentWalrusStatus;
  }
  else {
    return 2;
  }
}

- (void)_startObservingWalrusStateChangeNotification
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Account not eligible for walrus, will not observe walrus state changes", v2, v3, v4, v5, v6);
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Received walrus state change notification, fetching current status...", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_35;
  v7[3] = &unk_2655B57C8;
  uint64_t v5 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v6 = v3;
  [v5 walrusStatusWithCompletion:v7];
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_35_cold_1((uint64_t)v5, a2, v6);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_36;
  block[3] = &unk_2655B57A0;
  id v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  uint64_t v10 = a2;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_36(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = LogSubsystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_262993000, v4, OS_LOG_TYPE_DEFAULT, "Setting current walrus status to: %lu", (uint8_t *)&v7, 0xCu);
  }

  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 48);
  if (v2 != v3) {
    [*(id *)(a1 + 32) _reloadSpecifiers];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F08A00];
  uint64_t v4 = a2;
  uint64_t v5 = [v3 defaultCenter];
  uint64_t v6 = *MEMORY[0x263F342B8];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_2;
  v9[3] = &unk_2655B5818;
  id v10 = *(id *)(a1 + 32);
  uint64_t v7 = [v5 addObserverForName:v6 object:0 queue:0 usingBlock:v9];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;
}

uint64_t __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_stopObservingWalrusStateChangeNotification
{
  id v5 = self->_walrusStateChangeNotificationObserver;
  if (v5)
  {
    uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:v5];
  }
  id walrusStateChangeNotificationObserver = self->_walrusStateChangeNotificationObserver;
  self->_id walrusStateChangeNotificationObserver = 0;
}

- (void)_startObservingManateeAvailabilityNotification
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Account not eligible for walrus, will not observe manatee availability", v2, v3, v4, v5, v6);
}

void __82__ICSDataclassValidationController__startObservingManateeAvailabilityNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 userInfo];

  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F342A8]];

  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = [v5 BOOLValue];
      int v7 = WeakRetained[16];
      WeakRetained[16] = v6;
      if (v7 != v6) {
        [WeakRetained _reloadSpecifiers];
      }
    }
  }
}

- (void)_stopObservingManateeAvailabilityNotification
{
  id v5 = self->_manateeAvailabilityNotificationObserver;
  if (v5)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:v5];
  }
  id manateeAvailabilityNotificationObserver = self->_manateeAvailabilityNotificationObserver;
  self->_id manateeAvailabilityNotificationObserver = 0;
}

- (void)_walrusValidateAccessForDataclass:(id)a3 completion:(id)a4
{
  id v5 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke;
  aBlock[3] = &unk_2655B5890;
  id v6 = v5;
  id v17 = v6;
  int v7 = _Block_copy(aBlock);
  if ([(ICSDataclassValidationController *)self _isEligibleForWalrus])
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F25C98]) initWithType:4];
    id v9 = objc_alloc(MEMORY[0x263F25CF0]);
    id v10 = [(ICSDataclassValidationController *)self presentingViewController];
    dispatch_semaphore_t v11 = (void *)[v9 initWithFlowContext:v8 withPresentingViewController:v10];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_51;
    v13[3] = &unk_2655B5890;
    id v14 = v7;
    [v11 verifyAndRepairManateeWithCompletion:v13];
  }
  else
  {
    v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v12, OS_LOG_TYPE_DEFAULT, "Account not eligible for walrus, will not perform dataclass access validation", buf, 2u);
    }

    (*((void (**)(void *, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v7 = LogSubsystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_cold_1((uint64_t)v5, v7);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_51(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_2;
  block[3] = &unk_2655B58B8;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_walrusPresentUnknownErrorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_TITLE" value:&stru_270DEF3F8 table:@"Localizable-Walrus"];
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_MESSAGE" value:&stru_270DEF3F8 table:@"Localizable-Walrus"];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v11 = [v10 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_BUTTON_TITLE" value:&stru_270DEF3F8 table:@"Localizable-Walrus"];
  id v13 = [v5 alertWithTitle:v7 message:v9 buttonTitle:v11];

  v12 = [(ICSDataclassValidationController *)self presentingViewController];
  [v12 presentViewController:v13 animated:1 completion:v4];
}

- (BOOL)_isDataclassAllowlisted:(id)a3
{
  uint64_t v3 = _isDataclassAllowlisted__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isDataclassAllowlisted__once, &__block_literal_global);
  }
  char v5 = [(id)_isDataclassAllowlisted__allowlistedDataclasses containsObject:v4];

  return v5;
}

void __60__ICSDataclassValidationController__isDataclassAllowlisted___block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263EFAC60];
  v5[0] = *MEMORY[0x263EFAC50];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263EFACB8];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)_isDataclassAllowlisted__allowlistedDataclasses;
  _isDataclassAllowlisted__allowlistedDataclasses = v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (ICSDataclassValidationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSDataclassValidationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_validationAccessQueue, 0);
  objc_storeStrong((id *)&self->_validationAccessSemaphore, 0);
  objc_storeStrong(&self->_manateeAvailabilityNotificationObserver, 0);

  objc_storeStrong(&self->_walrusStateChangeNotificationObserver, 0);
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_262993000, v0, OS_LOG_TYPE_ERROR, "ICSDataclassValidationController has been released, unable to continue validation", v1, 2u);
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262993000, v0, v1, "Attempting to toggle dataclass switch on walrus account", v2, v3, v4, v5, v6);
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_35_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "Failed to determine walrus status (%lu) with error: %@", (uint8_t *)&v3, 0x16u);
}

void __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Failed to repair manatee state for walrus account with error: %@", (uint8_t *)&v2, 0xCu);
}

@end