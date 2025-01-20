@interface PSGFindMyiPhoneController
+ (id)shared;
- (BOOL)isFindMyiPhoneEnabled;
- (BOOL)isFindMyiPhoneProvisioned;
- (PSGFindMyiPhoneController)init;
- (id)preferredFindMyiPhoneAccount;
- (void)dealloc;
- (void)disablePhoneLocatorWithMessageString:(id)a3 buttonTitle:(id)a4 presentingViewController:(id)a5 completion:(id)a6;
- (void)enablePhoneLocatorWithCompletion:(id)a3;
- (void)isFindMyiPhoneEnabled;
- (void)locatorStateDidChange:(id)a3;
- (void)preferredFindMyiPhoneAccount;
@end

@implementation PSGFindMyiPhoneController

+ (id)shared
{
  v2 = (void *)gFindMyiPhoneController;
  if (!gFindMyiPhoneController)
  {
    v3 = objc_alloc_init(PSGFindMyiPhoneController);
    v4 = (void *)gFindMyiPhoneController;
    gFindMyiPhoneController = (uint64_t)v3;

    v2 = (void *)gFindMyiPhoneController;
  }
  return v2;
}

- (PSGFindMyiPhoneController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSGFindMyiPhoneController;
  v2 = [(PSGFindMyiPhoneController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_locatorStateDidChange_ name:*MEMORY[0x263F25C28] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSGFindMyiPhoneController;
  [(PSGFindMyiPhoneController *)&v4 dealloc];
}

- (BOOL)isFindMyiPhoneProvisioned
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F25750], "sharedManager", 0);
  v3 = [v2 accounts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = *MEMORY[0x263EFB410];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isProvisionedForDataclass:v7])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isFindMyiPhoneEnabled
{
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  stateChangeSem = self->_stateChangeSem;
  self->_stateChangeSem = v3;

  uint64_t v5 = [MEMORY[0x263F25CB8] sharedInstance];
  int v6 = [v5 isChangingState];

  if (v6)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stateChangeSem, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = [MEMORY[0x263F25CB8] sharedInstance];
    if ([v7 isChangingState]) {
      -[PSGFindMyiPhoneController isFindMyiPhoneEnabled]();
    }
  }
  v8 = self->_stateChangeSem;
  self->_stateChangeSem = 0;

  BOOL v9 = [MEMORY[0x263F25CB8] sharedInstance];
  char v10 = [v9 isEnabled];

  return v10;
}

- (void)locatorStateDidChange:(id)a3
{
  id v4 = a3;
  if (self->_stateChangeSem)
  {
    id v7 = v4;
    uint64_t v5 = [MEMORY[0x263F25CB8] sharedInstance];
    char v6 = [v5 isChangingState];

    id v4 = v7;
    if ((v6 & 1) == 0)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_stateChangeSem);
      id v4 = v7;
    }
  }
}

- (id)preferredFindMyiPhoneAccount
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F25750], "sharedManager", 0);
  v3 = [v2 accounts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x263EFB410];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 isProvisionedForDataclass:v8])
        {
          if ([v10 accountServiceType] != 1
            && [v10 accountServiceType] != 2)
          {
            -[PSGFindMyiPhoneController preferredFindMyiPhoneAccount]();
          }
          if (!v6
            || [v6 accountServiceType] == 1
            && [v10 accountServiceType] == 2
            || (int v11 = [v6 accountServiceType],
                v11 == [v10 accountServiceType])
            && [v10 primaryAccount])
          {
            id v12 = v10;

            char v6 = v12;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)enablePhoneLocatorWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if ([(PSGFindMyiPhoneController *)self isFindMyiPhoneEnabled])
  {
    v4[2](v4);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F25CA8];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__PSGFindMyiPhoneController_enablePhoneLocatorWithCompletion___block_invoke;
    v6[3] = &unk_264E8CB78;
    uint64_t v7 = v4;
    [v5 showEnableAlertWithCompletion:v6];
  }
}

uint64_t __62__PSGFindMyiPhoneController_enablePhoneLocatorWithCompletion___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)disablePhoneLocatorWithMessageString:(id)a3 buttonTitle:(id)a4 presentingViewController:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F10468]);
  v25 = &unk_26F103A78;
  v26[0] = MEMORY[0x263EFFA88];
  long long v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke;
  v20[3] = &unk_264E8CBC8;
  id v23 = v12;
  id v24 = v13;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  id v19 = v13;
  [v14 evaluatePolicy:1025 options:v15 reply:v20];
}

void __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _PSGLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "Evalutaing Policy Location Based Device Owner Authentication", buf, 2u);
  }

  if (!v4)
  {
    uint64_t v8 = [*(id *)(a1 + 32) preferredFindMyiPhoneAccount];
    BOOL v9 = _PSGLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v8;
      _os_log_impl(&dword_23D28D000, v9, OS_LOG_TYPE_DEFAULT, "########### FMiP Account: %@", buf, 0xCu);
    }

    if (v8)
    {
      id v10 = [MEMORY[0x263F25CB8] sharedInstance];
      int v11 = [v10 isChangingState];

      if (v11)
      {
        id v12 = _PSGLoggingFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D28D000, v12, OS_LOG_TYPE_DEFAULT, "########### FMiP state is changing.", buf, 2u);
        }
        uint64_t v13 = 3;
      }
      else
      {
        id v16 = [MEMORY[0x263F25CB8] sharedInstance];
        int v17 = [v16 isEnabled];

        if (v17) {
          goto LABEL_20;
        }
        id v12 = _PSGLoggingFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v13 = 2;
          _os_log_impl(&dword_23D28D000, v12, OS_LOG_TYPE_DEFAULT, "########### FMiP is already disabled.", buf, 2u);
        }
        else
        {
          uint64_t v13 = 2;
        }
      }
    }
    else
    {
      id v12 = _PSGLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D28D000, v12, OS_LOG_TYPE_DEFAULT, "########### No FMiP Account.", buf, 2u);
      }
      uint64_t v13 = 1;
    }

    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:FindMyiPhoneControllerErrorDomain code:v13 userInfo:0];
    if (v14)
    {
      long long v15 = (void *)v14;
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_23:

      goto LABEL_24;
    }
LABEL_20:
    id v18 = _PSGLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v18, OS_LOG_TYPE_DEFAULT, "########### FMiP have no error, proceeding to present alert.", buf, 2u);
    }

    id v19 = (void *)MEMORY[0x263F25CA8];
    v20 = [v8 account];
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke_17;
    v24[3] = &unk_264E8CBA0;
    uint64_t v23 = *(void *)(a1 + 56);
    id v25 = *(id *)(a1 + 64);
    [v19 showDisableAlertForAccount:v20 withMessage:v21 confirmationButtonTitle:v22 presentingViewController:v23 completion:v24];

    long long v15 = v25;
    goto LABEL_23;
  }
  char v6 = _PSGLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "Policy failed with %@", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:FindMyiPhoneControllerErrorDomain code:0 userInfo:0];
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
LABEL_24:
}

void __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke_17(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = _PSGLoggingFacility();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "########### User cancelled erase in FMiP alert", (uint8_t *)&v10, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = [MEMORY[0x263F087E8] errorWithDomain:FindMyiPhoneControllerErrorDomain code:0 userInfo:0];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    if (v7)
    {
      int v10 = 134217984;
      uint64_t v11 = [v5 length];
      _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "########### User confirms disable FMiP and obtained wipeToken of length: %ld", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
}

- (void)isFindMyiPhoneEnabled
{
}

- (void)preferredFindMyiPhoneAccount
{
  __assert_rtn("-[PSGFindMyiPhoneController preferredFindMyiPhoneAccount]", "PSGFindMyiPhoneController.m", 79, "account.accountServiceType == AAAccountServiceTypeMobileMe || account.accountServiceType == AAAccountServiceTypeiCloud");
}

@end