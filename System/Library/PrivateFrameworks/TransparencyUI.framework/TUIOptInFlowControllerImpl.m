@interface TUIOptInFlowControllerImpl
- (AAUIGrandSlamRemoteUIPresenter)ineligibleDevicesRemoteUIPresenter;
- (ACAccountStore)accountStore;
- (AIDAAccountManager)accountManager;
- (AIDAServiceOwnersManager)serviceOwnersManager;
- (IDSService)idsService;
- (IDSSignInController)idsSignInController;
- (KTOptInManager)optInManager;
- (NSMutableArray)devicesWithIssuesIdentifiers;
- (TUIAppleAccountManager)appleAccountManager;
- (TUIKTStateManager)stateManager;
- (TUIOBWelcomeController)welcomeController;
- (TUIOptInFlowControllerDelegate)delegate;
- (TUIOptInFlowControllerImpl)initWithPresentingNavigationController:(id)a3 parentViewController:(id)a4 accountManager:(id)a5 stateManager:(id)a6;
- (UINavigationController)presentingNavigationController;
- (UIViewController)parentViewController;
- (id)_appleAccount;
- (id)_idsAccount;
- (void)_attemptToSetOptInWithState:(BOOL)a3;
- (void)_beginIneligibleDevicesRemoteUIRequestWithCompletion:(id)a3;
- (void)_continueAttemptToSetOptInWithState:(BOOL)a3;
- (void)_dismiss;
- (void)_dismissIneligibleDevicesRemoteUI;
- (void)_dismissOptOutFlow;
- (void)_dismissWithoutStateChange;
- (void)_openMessagesSettings;
- (void)_openSettingsURL:(id)a3;
- (void)_openTapToRadar;
- (void)_openTrustedDeviceList;
- (void)_showErrorAlertWithError:(id)a3 presentingViewController:(id)a4;
- (void)_showOptInErrorForViewModel:(id)a3;
- (void)_showOptInResultError:(BOOL)a3 error:(id)a4;
- (void)_startFlowPressed;
- (void)_verifyCDPWithCompletion:(id)a3;
- (void)_verifyMessages:(id)a3;
- (void)beginOptInFlow;
- (void)beginOptOutFlow;
- (void)dismissPendingPopupUI;
- (void)dismissRemoteUIForViewController:(id)a3 error:(id)a4;
- (void)performAccountChecksForFlow:(unint64_t)a3;
- (void)remoteUIDidDismiss:(id)a3;
- (void)remoteUIDidEndFlow:(id)a3;
- (void)remoteUIDidPresentObjectModel:(id)a3 modally:(BOOL)a4;
- (void)remoteUIDidReceiveHTTPResponse:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)remoteUIWillLoadRequest:(id)a3;
- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4;
- (void)setAccountManager:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAppleAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevicesWithIssuesIdentifiers:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIdsSignInController:(id)a3;
- (void)setIneligibleDevicesRemoteUIPresenter:(id)a3;
- (void)setOptInManager:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setPresentingNavigationController:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setWelcomeController:(id)a3;
- (void)showActivityIndicatorForViewController:(id)a3;
- (void)showAppleIDErrorForFlow:(unint64_t)a3 withViewModel:(id)a4;
- (void)showWelcomeScreen;
@end

@implementation TUIOptInFlowControllerImpl

- (TUIOptInFlowControllerImpl)initWithPresentingNavigationController:(id)a3 parentViewController:(id)a4 accountManager:(id)a5 stateManager:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_1);
  }
  v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v38 = "-[TUIOptInFlowControllerImpl initWithPresentingNavigationController:parentViewController:accountManager:stateManager:]";
    __int16 v39 = 2114;
    id v40 = v11;
    __int16 v41 = 2114;
    id v42 = v12;
    __int16 v43 = 2114;
    id v44 = v13;
    __int16 v45 = 2114;
    id v46 = v14;
    __int16 v47 = 2114;
    v48 = self;
    _os_log_debug_impl(&dword_260338000, v15, OS_LOG_TYPE_DEBUG, "%s presentingNavigationController = %{public}@, parentViewController = %{public}@, accountManager = %{public}@, stateManager = %{public}@ on %{public}@", buf, 0x3Eu);
  }
  v36.receiver = self;
  v36.super_class = (Class)TUIOptInFlowControllerImpl;
  v16 = [(TUIOptInFlowControllerImpl *)&v36 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_stateManager, a6);
    objc_storeStrong((id *)&v17->_accountManager, a5);
    objc_storeStrong((id *)&v17->_parentViewController, a4);
    objc_storeStrong((id *)&v17->_presentingNavigationController, a3);
    id v18 = objc_alloc(MEMORY[0x263F80D28]);
    uint64_t v19 = [v18 initWithApplication:*MEMORY[0x263F80D78]];
    optInManager = v17->_optInManager;
    v17->_optInManager = (KTOptInManager *)v19;

    uint64_t v21 = [MEMORY[0x263EFB210] defaultStore];
    accountStore = v17->_accountStore;
    v17->_accountStore = (ACAccountStore *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x263F26D88]) initWithAccountStore:v17->_accountStore];
    serviceOwnersManager = v17->_serviceOwnersManager;
    v17->_serviceOwnersManager = (AIDAServiceOwnersManager *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    devicesWithIssuesIdentifiers = v17->_devicesWithIssuesIdentifiers;
    v17->_devicesWithIssuesIdentifiers = v25;

    v27 = [[TUIAppleAccountManager alloc] initWithAccountStore:v17->_accountStore];
    appleAccountManager = v17->_appleAccountManager;
    v17->_appleAccountManager = v27;

    id v29 = objc_alloc(MEMORY[0x263F4A0C0]);
    uint64_t v30 = [v29 initWithService:*MEMORY[0x263F49FB8]];
    idsService = v17->_idsService;
    v17->_idsService = (IDSService *)v30;

    id v32 = objc_alloc(MEMORY[0x263F4A0E0]);
    uint64_t v33 = [v32 initWithQueue:MEMORY[0x263EF83A0]];
    idsSignInController = v17->_idsSignInController;
    v17->_idsSignInController = (IDSSignInController *)v33;
  }
  return v17;
}

uint64_t __118__TUIOptInFlowControllerImpl_initWithPresentingNavigationController_parentViewController_accountManager_stateManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)beginOptInFlow
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __44__TUIOptInFlowControllerImpl_beginOptInFlow__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)beginOptOutFlow
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __45__TUIOptInFlowControllerImpl_beginOptOutFlow__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)showWelcomeScreen
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __47__TUIOptInFlowControllerImpl_showWelcomeScreen__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __47__TUIOptInFlowControllerImpl_showWelcomeScreen__block_invoke_47(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [[TUIOBWelcomeController alloc] initWithViewModel:*(void *)(a1 + 32)];
    [WeakRetained setWelcomeController:v3];

    uint64_t v4 = [WeakRetained welcomeController];
    uint64_t v5 = [v4 primaryButton];
    [v5 addTarget:WeakRetained action:sel__startFlowPressed forControlEvents:64];

    v6 = [WeakRetained welcomeController];
    v7 = [v6 secondaryButton];
    [v7 addTarget:WeakRetained action:sel__dismiss forControlEvents:64];

    v8 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:WeakRetained action:sel__dismiss];
    v9 = [WeakRetained welcomeController];
    v10 = [v9 navigationItem];
    [v10 setLeftBarButtonItem:v8];

    id v11 = [WeakRetained presentingNavigationController];
    id v12 = [WeakRetained welcomeController];
    [v11 pushViewController:v12 animated:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_49);
    }
    id v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[TUIOptInFlowControllerImpl showWelcomeScreen]_block_invoke";
      _os_log_impl(&dword_260338000, v13, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t __47__TUIOptInFlowControllerImpl_showWelcomeScreen__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)showActivityIndicatorForViewController:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F1C3D8];
  id v4 = a3;
  id v7 = (id)[[v3 alloc] initWithActivityIndicatorStyle:100];
  [v7 setHidesWhenStopped:1];
  [v7 startAnimating];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v7];
  v6 = [v4 navigationItem];

  [v6 setRightBarButtonItem:v5];
}

- (void)dismissPendingPopupUI
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __51__TUIOptInFlowControllerImpl_dismissPendingPopupUI__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __51__TUIOptInFlowControllerImpl_dismissPendingPopupUI__block_invoke_59(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained stateManager];
    char v4 = [v3 isVerifyCDPRunning];

    if ((v4 & 1) == 0) {
      [v2 _dismissWithoutStateChange];
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_61);
    }
    uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[TUIOptInFlowControllerImpl dismissPendingPopupUI]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __51__TUIOptInFlowControllerImpl_dismissPendingPopupUI__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_dismissWithoutStateChange
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __56__TUIOptInFlowControllerImpl__dismissWithoutStateChange__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_dismiss
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __38__TUIOptInFlowControllerImpl__dismiss__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_dismissOptOutFlow
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __48__TUIOptInFlowControllerImpl__dismissOptOutFlow__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_startFlowPressed
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __47__TUIOptInFlowControllerImpl__startFlowPressed__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)performAccountChecksForFlow:(unint64_t)a3
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_71);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl performAccountChecksForFlow:]();
  }
  if (self->_welcomeController)
  {
    uint64_t v5 = [(UINavigationController *)self->_presentingNavigationController topViewController];
    [(TUIOptInFlowControllerImpl *)self showActivityIndicatorForViewController:v5];

    int v6 = [(TUIOBWelcomeController *)self->_welcomeController primaryButton];
    [v6 setEnabled:0];

    id v7 = [(TUIOBWelcomeController *)self->_welcomeController secondaryButton];
    [v7 setEnabled:0];
  }
  [(TUIKTStateManager *)self->_stateManager setIsVerifyCDPRunning:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_72;
  v8[3] = &unk_265553178;
  v8[4] = self;
  v8[5] = a3;
  [(TUIOptInFlowControllerImpl *)self _verifyCDPWithCompletion:v8];
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_72(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = (id *)(a1 + 32);
  id v7 = [*(id *)(a1 + 32) stateManager];
  [v7 setIsVerifyCDPRunning:0];

  if (!a2)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_93);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
      __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_72_cold_2();
    }
    v9 = [v5 domain];
    if ([v9 isEqualToString:*MEMORY[0x263F342B0]])
    {
      if ([v5 code] == -5307)
      {
LABEL_19:

LABEL_20:
        id v13 = [*v6 delegate];
        [v13 optInFlowResultWithStateUpdate];

        goto LABEL_21;
      }
      uint64_t v10 = [v5 code];

      if (v10 == 5095) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    id v11 = *v6;
    v9 = [*v6 welcomeController];
    if (v9)
    {
      [v11 _showErrorAlertWithError:v5 presentingViewController:v9];
    }
    else
    {
      id v12 = [*v6 parentViewController];
      [v11 _showErrorAlertWithError:v5 presentingViewController:v12];
    }
    goto LABEL_19;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_74);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_72_cold_1();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75;
  v14[3] = &unk_265553150;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  v14[4] = v8;
  id v15 = v5;
  [v8 _verifyMessages:v14];

LABEL_21:
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75(uint64_t a1, char a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 != 1 || (a2 & 1) != 0)
  {
    if (v3 != 1) {
      goto LABEL_10;
    }
    int v6 = (id *)(a1 + 32);
    id v7 = [*(id *)(a1 + 32) _idsAccount];
    uint64_t v8 = objc_msgSend(v7, "aida_dsid");
    v9 = [*v6 _appleAccount];
    uint64_t v10 = objc_msgSend(v9, "aa_personID");
    char v11 = [v8 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_82);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
        __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75_cold_2();
      }
      v20 = [[TUIOBMismatchedAppleIDViewModel alloc] initWithFlow:*v4];
      [*v6 showAppleIDErrorForFlow:*v4 withViewModel:v20];
    }
    else
    {
LABEL_10:
      id v12 = [*(id *)(a1 + 40) domain];
      int v13 = [v12 isEqual:*MEMORY[0x263F80DA8]];

      if (v13)
      {
        int v14 = *(void **)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = [v14 welcomeController];
        id v22 = (id)v16;
        if (v16)
        {
          [v14 _showErrorAlertWithError:v15 presentingViewController:v16];
        }
        else
        {
          uint64_t v21 = [*(id *)(a1 + 32) parentViewController];
          [v14 _showErrorAlertWithError:v15 presentingViewController:v21];
        }
      }
      else if ((unint64_t)(*v4 - 1) > 1)
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_89);
        }
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
          __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75_cold_1();
        }
      }
      else
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_86);
        }
        v17 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          uint64_t v24 = v18;
          __int16 v25 = 1024;
          int v26 = v19;
          _os_log_impl(&dword_260338000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to set opt in state (%d)...", buf, 0x12u);
        }
        [*(id *)(a1 + 32) _attemptToSetOptInWithState:*(void *)(a1 + 48) == 1];
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_78);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
      __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75_cold_3();
    }
    id v5 = [[TUIOBMissingAppleIDViewModel alloc] initWithFlow:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) showAppleIDErrorForFlow:*(void *)(a1 + 48) withViewModel:v5];
  }
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_2_76()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_80()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_84()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_87()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_91()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)showAppleIDErrorForFlow:(unint64_t)a3 withViewModel:(id)a4
{
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_96);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl showAppleIDErrorForFlow:withViewModel:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke_97;
  v8[3] = &unk_2655531A0;
  objc_copyWeak(v10, &location);
  id v9 = v6;
  v10[1] = (id)a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

uint64_t __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke_97(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [[TUIOBWelcomeController alloc] initWithViewModel:*(void *)(a1 + 32)];
    uint64_t v4 = [(TUIOBWelcomeController *)v3 primaryButton];
    [v4 addTarget:WeakRetained action:sel__openMessagesSettings forControlEvents:64];

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5 == 1)
    {
      id v6 = &selRef__dismiss;
    }
    else
    {
      if (v5 != 2)
      {
LABEL_11:
        id v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:WeakRetained action:sel__dismiss];
        uint64_t v10 = [(OBBaseWelcomeController *)v3 navigationItem];
        [v10 setLeftBarButtonItem:v9];

        if (*(void *)(a1 + 48) == 2)
        {
          char v11 = [WeakRetained delegate];
          [v11 presentOptInNavigationController];
        }
        id v12 = [WeakRetained presentingNavigationController];
        [v12 pushViewController:v3 animated:1];

        goto LABEL_14;
      }
      id v6 = &selRef__dismissOptOutFlow;
    }
    uint64_t v8 = [(TUIOBWelcomeController *)v3 secondaryButton];
    [v8 addTarget:WeakRetained action:*v6 forControlEvents:64];

    goto LABEL_11;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_99);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    int v14 = "-[TUIOptInFlowControllerImpl showAppleIDErrorForFlow:withViewModel:]_block_invoke";
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v13, 0xCu);
  }
LABEL_14:
}

uint64_t __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_showOptInErrorForViewModel:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_105);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl _showOptInErrorForViewModel:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke_106;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke_106(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [[TUIOBWelcomeController alloc] initWithViewModel:*(void *)(a1 + 32)];
    id v4 = [(TUIOBWelcomeController *)v3 primaryButton];
    [v4 addTarget:WeakRetained action:sel__dismiss forControlEvents:64];

    id v5 = [(TUIOBWelcomeController *)v3 secondaryButton];
    [v5 addTarget:WeakRetained action:sel__openTrustedDeviceList forControlEvents:64];

    id v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:WeakRetained action:sel__dismiss];
    id v7 = [(OBBaseWelcomeController *)v3 navigationItem];
    [v7 setLeftBarButtonItem:v6];

    if ([MEMORY[0x263F20318] isInternalBuild])
    {
      id v8 = [MEMORY[0x263F5B8D0] linkButton];
      [v8 addTarget:WeakRetained action:sel__openTapToRadar forControlEvents:64];
      [v8 setTitle:@"[INTERNAL] Tap-To-Radar" forState:0];
      id v9 = [(TUIOBWelcomeController *)v3 buttonTray];
      [v9 addButton:v8];
    }
    uint64_t v10 = [WeakRetained presentingNavigationController];
    [v10 pushViewController:v3 animated:1];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_108);
    }
    char v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      int v13 = "-[TUIOptInFlowControllerImpl _showOptInErrorForViewModel:]_block_invoke";
      _os_log_impl(&dword_260338000, v11, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v12, 0xCu);
    }
  }
}

uint64_t __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_openMessagesSettings
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __51__TUIOptInFlowControllerImpl__openMessagesSettings__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_openTrustedDeviceList
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __52__TUIOptInFlowControllerImpl__openTrustedDeviceList__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_openSettingsURL:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_124);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl _openSettingsURL:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_125;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_125(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained delegate];
    [v4 optInFlowResultWithStateUpdate];

    id v5 = [v3 presentingNavigationController];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_128;
    v7[3] = &unk_2655531C8;
    id v8 = *(id *)(a1 + 32);
    [v5 dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_127);
    }
    id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[TUIOptInFlowControllerImpl _openSettingsURL:]_block_invoke";
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_128(uint64_t a1)
{
  id v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
}

- (void)dismissRemoteUIForViewController:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke;
  v10[3] = &unk_2655531F0;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = [a1[4] presentedViewController];

    if (v3)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_134);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
        __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_cold_1();
      }
      id v4 = a1[4];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_135;
      v12[3] = &unk_2655531C8;
      v12[4] = WeakRetained;
      [v4 dismissViewControllerAnimated:1 completion:v12];
    }
    else
    {
      uint64_t v6 = [WeakRetained welcomeController];
      if (v6)
      {
        id v7 = (void *)v6;
        id v8 = [a1[5] domain];
        if ([v8 isEqualToString:*MEMORY[0x263F342B0]])
        {
          uint64_t v9 = [a1[5] code];

          if (v9 == -5307)
          {
            uint64_t v10 = [WeakRetained welcomeController];
            v11[0] = MEMORY[0x263EF8330];
            v11[1] = 3221225472;
            v11[2] = __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_139;
            v11[3] = &unk_2655531C8;
            v11[4] = WeakRetained;
            [v10 dismissViewControllerAnimated:1 completion:v11];
          }
        }
        else
        {
        }
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_131);
    }
    id v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[TUIOptInFlowControllerImpl dismissRemoteUIForViewController:error:]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_132()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_135()
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_138);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_135_cold_1();
  }
}

uint64_t __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_2_136()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_139()
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_142);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_139_cold_1();
  }
}

uint64_t __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_2_140()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_verifyCDPWithCompletion:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_144);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:]();
  }
  id v5 = [(TUIOptInFlowControllerImpl *)self welcomeController];
  if (v5) {
    [(TUIOptInFlowControllerImpl *)self presentingNavigationController];
  }
  else {
  uint64_t v6 = [(TUIOptInFlowControllerImpl *)self parentViewController];
  }

  id v7 = objc_alloc(MEMORY[0x263F34A18]);
  id v8 = [MEMORY[0x263F34328] sharedInstance];
  uint64_t v9 = [v8 primaryAccountAltDSID];
  uint64_t v10 = (void *)[v7 initWithAltDSID:v9];

  [v10 setSecurityUpgradeContext:*MEMORY[0x263F29098]];
  [v10 setDeviceToDeviceEncryptionUpgradeUIStyle:1];
  [v10 setDeviceToDeviceEncryptionUpgradeType:0];
  [v10 setForceInlinePresentation:1];
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"DEVICE_VERIFICATION_SPECIFIER_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  [v10 setFeatureName:v12];

  [v10 setPresentingViewController:v6];
  id v13 = (void *)[objc_alloc(MEMORY[0x263F25CF0]) initWithFlowContext:v10 withPresentingViewController:v6];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  BOOL v23 = 0;
  BOOL v23 = +[TUIUtils isHSA2];
  id location = 0;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_156;
  v16[3] = &unk_265553240;
  objc_copyWeak(&v20, &location);
  id v14 = v4;
  id v18 = v14;
  uint64_t v19 = v22;
  id v15 = v6;
  id v17 = v15;
  [v13 verifyAndRepairManateeWithCompletion:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);
}

uint64_t __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_156(uint64_t a1, int a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_158);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v23 = "-[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_161);
  }
  id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    if (WeakRetained) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-120 description:@"object deallocated"];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);

    goto LABEL_20;
  }
  *(_DWORD *)buf = 136315906;
  BOOL v23 = "-[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:]_block_invoke_2";
  __int16 v24 = 1024;
  int v25 = a2;
  __int16 v26 = 2114;
  id v27 = v5;
  __int16 v28 = 2114;
  id v29 = WeakRetained;
  _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s isVerified = %d, error = %{public}@ on %{public}@", buf, 0x26u);
  if (!WeakRetained) {
    goto LABEL_19;
  }
LABEL_10:
  if (a2)
  {
    uint64_t v9 = [WeakRetained welcomeController];

    if (v9)
    {
      uint64_t v10 = [WeakRetained presentingNavigationController];
      id v11 = [v10 topViewController];
      [WeakRetained showActivityIndicatorForViewController:v11];
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v13 = [WeakRetained optInManager];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_166;
      v17[3] = &unk_265553218;
      id v14 = *(id *)(a1 + 40);
      char v21 = a2;
      id v20 = v14;
      v17[4] = WeakRetained;
      id v18 = *(id *)(a1 + 32);
      id v19 = v5;
      [v13 waitForIDSRegistration:v17];

      goto LABEL_20;
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [WeakRetained dismissRemoteUIForViewController:*(void *)(a1 + 32) error:v5];
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
LABEL_20:
}

uint64_t __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_159()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_169);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "waitForIDSRegistration error after verifying CDP %{public}@", (uint8_t *)&v6, 0xCu);
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) dismissRemoteUIForViewController:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v5();
}

uint64_t __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_2_167()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_attemptToSetOptInWithState:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_172);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    -[TUIOptInFlowControllerImpl _attemptToSetOptInWithState:]();
    if (v3) {
      goto LABEL_5;
    }
  }
  else if (v3)
  {
LABEL_5:
    id location = 0;
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_173;
    v5[3] = &unk_265553290;
    objc_copyWeak(&v6, &location);
    BOOL v7 = v3;
    [(TUIOptInFlowControllerImpl *)self _beginIneligibleDevicesRemoteUIRequestWithCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
    return;
  }
  [(TUIOptInFlowControllerImpl *)self _continueAttemptToSetOptInWithState:0];
}

uint64_t __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_173(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v7 = [MEMORY[0x263F80D50] logger];
    [v7 logResultForEvent:@"KTIneligibleDevicesUI" hardFailure:1 result:v5];

    if (a2)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_179);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
        __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_173_cold_1();
      }
    }
    else
    {
      [WeakRetained _dismissIneligibleDevicesRemoteUI];
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_182);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
        __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_173_cold_2();
      }
      *(void *)buf = 0;
      objc_initWeak((id *)buf, WeakRetained);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_183;
      block[3] = &unk_265553268;
      objc_copyWeak(&v11, (id *)buf);
      char v12 = *(unsigned char *)(a1 + 40);
      id v10 = v5;
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_175);
    }
    uint64_t v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIOptInFlowControllerImpl _attemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_177()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_180()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_183(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showOptInResultError:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_186);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[TUIOptInFlowControllerImpl _attemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_2_184()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_continueAttemptToSetOptInWithState:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_188);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  optInManager = self->_optInManager;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_189;
  v6[3] = &unk_2655532B8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = v3;
  [(KTOptInManager *)optInManager setOptInState:v3 detailedCompletionBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_189(uint64_t a1, __CFString *a2, void *a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = a4;
  id val = objc_loadWeakRetained((id *)(a1 + 32));
  id v32 = v7;
  if (val)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_194);
    }
    BOOL v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = val;
      __int16 v47 = 2048;
      v48 = a2;
      __int16 v49 = 2114;
      id v50 = v7;
      __int16 v51 = 2114;
      id v52 = v33;
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setOptInState result = %ld, loggableDatas = %{public}@, error = %{public}@", buf, 0x2Au);
    }
    uint64_t v9 = objc_msgSend(val, "devicesWithIssuesIdentifiers", a1);
    [v9 removeAllObjects];

    if (v33)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_197);
      }
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
        __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_189_cold_2();
      }
      if (!+[TUIUtils isNetworkError:v33])
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v10 = v7;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v42;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v42 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(__CFString **)(*((void *)&v41 + 1) + 8 * v13);
              if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
                dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_200);
              }
              uint64_t v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
              if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = val;
                __int16 v47 = 2114;
                v48 = v14;
                _os_log_debug_impl(&dword_260338000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@", buf, 0x16u);
              }
              if (![(__CFString *)v14 result])
              {
                if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
                  dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_203);
                }
                uint64_t v16 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
                if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
                {
                  id v19 = v16;
                  id v20 = [(__CFString *)v14 deviceID];
                  objc_msgSend(v20, "kt_hexString");
                  char v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  id v22 = [(__CFString *)v14 failure];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = val;
                  __int16 v47 = 2114;
                  v48 = v21;
                  __int16 v49 = 2114;
                  id v50 = v22;
                  _os_log_error_impl(&dword_260338000, v19, OS_LOG_TYPE_ERROR, "%{public}@ KTResultFailed on deviceId %{public}@, failure = %{public}@", buf, 0x20u);
                }
                id v17 = [val devicesWithIssuesIdentifiers];
                id v18 = [(__CFString *)v14 deviceID];
                [v17 addObject:v18];
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v11);
        }
      }
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_206);
      }
      BOOL v23 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
        __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_189_cold_1(val, v23);
      }
      *(void *)buf = 0;
      objc_initWeak((id *)buf, val);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_207;
      block[3] = &unk_265553268;
      objc_copyWeak(&v39, (id *)buf);
      char v40 = *(unsigned char *)(v31 + 40);
      id v24 = v33;
      id v38 = v24;
      dispatch_async(MEMORY[0x263EF83A0], block);
      int v25 = [MEMORY[0x263F80D50] logger];
      [v25 logResultForEvent:@"KTOptIn" hardFailure:1 result:v24];

      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_213);
      }
      id v27 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = @"YES";
        if (!*(unsigned char *)(v31 + 40)) {
          __int16 v28 = @"NO";
        }
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = val;
        __int16 v47 = 2114;
        v48 = v28;
        _os_log_impl(&dword_260338000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully set new opt in state: %{public}@", buf, 0x16u);
      }
      uint64_t v29 = [val delegate];
      [(id)v29 optInFlowResultWithStateUpdate];

      uint64_t v30 = [val welcomeController];
      LOBYTE(v29) = v30 == 0;

      if ((v29 & 1) == 0)
      {
        *(void *)buf = 0;
        objc_initWeak((id *)buf, val);
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_220;
        v35[3] = &unk_265553128;
        objc_copyWeak(&v36, (id *)buf);
        dispatch_async(MEMORY[0x263EF83A0], v35);
        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_191);
    }
    __int16 v26 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_260338000, v26, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_192()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_195()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_198()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_201()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_204()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_207(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showOptInResultError:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_210);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_2_208()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_211()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_220(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained welcomeController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_223);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_2_221()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_showOptInResultError:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v4)
  {
LABEL_10:
    uint64_t v7 = [(TUIOptInFlowControllerImpl *)self welcomeController];
    if (v7)
    {
      [(TUIOptInFlowControllerImpl *)self _showErrorAlertWithError:v6 presentingViewController:v7];
    }
    else
    {
      BOOL v8 = [(TUIOptInFlowControllerImpl *)self parentViewController];
      [(TUIOptInFlowControllerImpl *)self _showErrorAlertWithError:v6 presentingViewController:v8];
    }
    goto LABEL_13;
  }
  if (![(NSMutableArray *)self->_devicesWithIssuesIdentifiers count])
  {
    if (+[TUIUtils isMismatchedAccountError:v6])
    {
      uint64_t v7 = [[TUIOBMissingAppleIDViewModel alloc] initWithFlow:1];
      [(TUIOptInFlowControllerImpl *)self showAppleIDErrorForFlow:1 withViewModel:v7];
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_226);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl _showOptInResultError:error:]();
  }
  uint64_t v7 = [[TUIOBUpdateDevicesViewModel alloc] initWithAccountManager:self->_accountManager devicesWithIssuesIdentifiers:self->_devicesWithIssuesIdentifiers];
  [(TUIOptInFlowControllerImpl *)self _showOptInErrorForViewModel:v7];
LABEL_13:

  uint64_t v9 = [(TUIOptInFlowControllerImpl *)self delegate];
  [v9 optInFlowResultWithStateUpdate];
}

uint64_t __58__TUIOptInFlowControllerImpl__showOptInResultError_error___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_beginIneligibleDevicesRemoteUIRequestWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  int v5 = [MEMORY[0x263F29270] bagForAltDSID:0];
  id v6 = [v5 contactKeyVerificationIneligibleDevicesURL];

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_230);
  }
  uint64_t v7 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    [(TUIOptInFlowControllerImpl *)v7 _beginIneligibleDevicesRemoteUIRequestWithCompletion:(uint64_t)self];
    if (v6) {
      goto LABEL_5;
    }
LABEL_7:
    id v12 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-120 description:@"no ineligible devices remote UI URL"];
    v4[2](v4, 0, v12);
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_7;
  }
LABEL_5:
  *(_WORD *)&self->_ineligibleDevicesRemoteUICanceled = 0;
  BOOL v8 = (AAUIGrandSlamRemoteUIPresenter *)[objc_alloc(MEMORY[0x263F25CD8]) initWithAccountManager:self->_accountManager presenter:self->_presentingNavigationController];
  ineligibleDevicesRemoteUIPresenter = self->_ineligibleDevicesRemoteUIPresenter;
  self->_ineligibleDevicesRemoteUIPresenter = v8;

  [(AAUIGrandSlamRemoteUIPresenter *)self->_ineligibleDevicesRemoteUIPresenter setDelegate:self];
  id v10 = objc_alloc_init(MEMORY[0x263EFC5E8]);
  [v10 setURL:v6];
  [v10 setHTTPMethod:@"GET"];
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v11 = self->_ineligibleDevicesRemoteUIPresenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_239;
  v13[3] = &unk_265553330;
  objc_copyWeak(&v16, &location);
  uint64_t v15 = v4;
  id v12 = v10;
  id v14 = v12;
  [(AAUIGrandSlamRemoteUIPresenter *)v11 loadRequest:v12 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_8:
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_239(id *a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_241);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_244);
  }
  BOOL v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    if (WeakRetained) {
      goto LABEL_10;
    }
LABEL_14:
    id v10 = (void (**)(id, void, void *))a1[5];
    uint64_t v11 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-120 description:@"object deallocated"];
    v10[2](v10, 0, v11);

    goto LABEL_15;
  }
  *(_DWORD *)buf = 136315906;
  *(void *)&uint8_t buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke_2";
  __int16 v17 = 1024;
  int v18 = a2;
  __int16 v19 = 2114;
  id v20 = v5;
  __int16 v21 = 2114;
  id v22 = WeakRetained;
  _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: loadRequest result = %d, error = %{public}@ on %{public}@", buf, 0x26u);
  if (!WeakRetained) {
    goto LABEL_14;
  }
LABEL_10:
  if (+[TUIUtils isAuthError:v5])
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    uint64_t v9 = [WeakRetained appleAccountManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_245;
    v12[3] = &unk_265553308;
    objc_copyWeak(&v15, (id *)buf);
    id v14 = a1[5];
    id v13 = a1[4];
    [v9 silentRenewAppleAccountWithCompletionHandler:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
LABEL_15:
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_242()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_245(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_248);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_251);
  }
  BOOL v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke_2";
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 2114;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = WeakRetained;
    _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: silent renew result = %ld, error = %{public}@ on %{public}@", buf, 0x2Au);
    if (WeakRetained) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [MEMORY[0x263F80D68] errorWithDomain:*MEMORY[0x263F80DB8] code:-120 description:@"object deallocated"];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

    goto LABEL_13;
  }
  if (!WeakRetained) {
    goto LABEL_12;
  }
LABEL_10:
  *(void *)buf = 0;
  objc_initWeak((id *)buf, WeakRetained);
  uint64_t v9 = [WeakRetained ineligibleDevicesRemoteUIPresenter];
  uint64_t v10 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_252;
  v13[3] = &unk_2655532E0;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = *(id *)(a1 + 40);
  [v9 loadRequest:v10 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
LABEL_13:
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_2_246()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_249()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_252(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_255);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_258);
  }
  BOOL v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315906;
    uint64_t v10 = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = WeakRetained;
    _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: retry loadRequest result = %d, error = %{public}@ on %{public}@", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_2_253()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_256()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_dismissIneligibleDevicesRemoteUI
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __63__TUIOptInFlowControllerImpl__dismissIneligibleDevicesRemoteUI__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_showErrorAlertWithError:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_263);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
    -[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_264;
  v10[3] = &unk_2655531F0;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_264(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = +[TUIUtils isNetworkError:*(void *)(a1 + 32)];
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    if (v3)
    {
      id v6 = [v4 localizedStringForKey:@"CONTACT_KEY_VERIFICATION_NOT_AVAILABLE" value:&stru_270C3F140 table:@"Localizable"];

      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"CHECK_YOUR_NETWORK_CONNECTION" value:&stru_270C3F140 table:@"Localizable"];
    }
    else
    {
      id v6 = [v4 localizedStringForKey:@"DEVICE_VERIFICATION_OPTIN_ERROR" value:&stru_270C3F140 table:@"Localizable"];

      if (![MEMORY[0x263F20318] isInternalBuild] || (uint64_t v10 = *(void **)(a1 + 32)) == 0)
      {
        id v12 = 0;
        goto LABEL_13;
      }
      id v11 = NSString;
      id v7 = [v10 description];
      uint64_t v8 = [v11 stringWithFormat:@"%@", v7];
    }
    id v12 = (void *)v8;

LABEL_13:
    id v13 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v6 message:v12 preferredStyle:1];
    id v14 = (void *)MEMORY[0x263F1C3F0];
    __int16 v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"DISMISS" value:&stru_270C3F140 table:@"Localizable"];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_285;
    void v22[3] = &unk_265553358;
    id v23 = *(id *)(a1 + 40);
    uint64_t v17 = [v14 actionWithTitle:v16 style:1 handler:v22];
    [v13 addAction:v17];

    if ([MEMORY[0x263F20318] isInternalBuild])
    {
      uint64_t v18 = (void *)MEMORY[0x263F1C3F0];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_2_290;
      v20[3] = &unk_265553380;
      v20[4] = WeakRetained;
      id v21 = *(id *)(a1 + 40);
      __int16 v19 = [v18 actionWithTitle:@"[INTERNAL] Tap-to-Radar" style:0 handler:v20];
      [v13 addAction:v19];
    }
    [*(id *)(a1 + 40) presentViewController:v13 animated:1 completion:0];

    goto LABEL_16;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_266);
  }
  id v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v25 = "-[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:]_block_invoke";
    _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_16:
}

uint64_t __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_285(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_2_290(uint64_t a1)
{
  [*(id *)(a1 + 32) _openTapToRadar];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_openTapToRadar
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_293()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_306(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "kt_hexString");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

uint64_t __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_316()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_appleAccount
{
  return (id)[(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
}

- (id)_idsAccount
{
  return (id)[(AIDAServiceOwnersManager *)self->_serviceOwnersManager accountForService:*MEMORY[0x263F26D40]];
}

- (void)_verifyMessages:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (([(IDSSignInController *)self->_idsSignInController isiMessageEnabled] & 1) == 0)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_320);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
      -[TUIOptInFlowControllerImpl _verifyMessages:]();
    }
    goto LABEL_12;
  }
  uint64_t v5 = [(IDSService *)self->_idsService aliases];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_323);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
      -[TUIOptInFlowControllerImpl _verifyMessages:]();
    }
LABEL_12:
    v4[2](v4, 0);
    goto LABEL_13;
  }
  idsSignInController = self->_idsSignInController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_324;
  v8[3] = &unk_2655533D0;
  void v8[4] = self;
  id v9 = v4;
  [(IDSSignInController *)idsSignInController statusOfUsersOnService:1 withCompletion:v8];

LABEL_13:
}

uint64_t __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_321()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_324(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [a2 serviceUserInfos];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 type] == 1 && objc_msgSend(v8, "status") == 3)
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_326);
          }
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
            __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_324_cold_2();
          }

          char v9 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_329);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR)) {
    __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_324_cold_1();
  }
  char v9 = 0;
LABEL_20:
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_331;
  v10[3] = &unk_265553088;
  id v11 = *(id *)(a1 + 40);
  char v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_327()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_331(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_334);
  }
  uint64_t v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315906;
    long long v13 = "-[TUIOptInFlowControllerImpl remoteUIRequestComplete:error:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    __int16 v19 = self;
    _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: request = %{public}@, error = %{public}@ on %{public}@", (uint8_t *)&v12, 0x2Au);
    if (!v7) {
      goto LABEL_9;
    }
  }
  else if (!v7)
  {
    goto LABEL_9;
  }
  char v9 = [(TUIOptInFlowControllerImpl *)self welcomeController];
  if (v9)
  {
    [(TUIOptInFlowControllerImpl *)self _showErrorAlertWithError:v7 presentingViewController:v9];
  }
  else
  {
    uint64_t v10 = [(TUIOptInFlowControllerImpl *)self parentViewController];
    [(TUIOptInFlowControllerImpl *)self _showErrorAlertWithError:v7 presentingViewController:v10];
  }
  id v11 = [(TUIOptInFlowControllerImpl *)self delegate];
  [v11 optInFlowResultWithStateUpdate];

LABEL_9:
}

uint64_t __60__TUIOptInFlowControllerImpl_remoteUIRequestComplete_error___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIWillLoadRequest:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_336);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl remoteUIWillLoadRequest:]();
  }
  uint64_t v5 = [v4 URL];
  id v6 = [v5 path];
  int v7 = [v6 hasSuffix:@"/cancel"];

  if (v7) {
    self->_ineligibleDevicesRemoteUICanceled = 1;
  }
}

uint64_t __54__TUIOptInFlowControllerImpl_remoteUIWillLoadRequest___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIDidEndFlow:(id)a3
{
  id v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_341);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl remoteUIDidEndFlow:]();
  }
}

uint64_t __49__TUIOptInFlowControllerImpl_remoteUIDidEndFlow___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_343);
  }
  int v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315906;
    char v9 = "-[TUIOptInFlowControllerImpl remoteUIWillPresentObjectModel:modally:]";
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    __int16 v14 = 2114;
    id v15 = self;
    _os_log_debug_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: objectModel = %{public}@, isModal = %d on %{public}@", (uint8_t *)&v8, 0x26u);
  }
}

uint64_t __69__TUIOptInFlowControllerImpl_remoteUIWillPresentObjectModel_modally___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_345);
  }
  uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    [(TUIOptInFlowControllerImpl *)(uint64_t)v4 remoteUIDidDismiss:v5];
  }
  if (self->_ineligibleDevicesRemoteUICanceled)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_348);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
      -[TUIOptInFlowControllerImpl remoteUIDidDismiss:]();
    }
    [(TUIOptInFlowControllerImpl *)self _dismiss];
  }
  else if (self->_ineligibleDevicesRemoteUIPresented)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_354);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
      -[TUIOptInFlowControllerImpl remoteUIDidDismiss:]();
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_351);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
      -[TUIOptInFlowControllerImpl remoteUIDidDismiss:]();
    }
    [(TUIOptInFlowControllerImpl *)self _continueAttemptToSetOptInWithState:1];
  }
}

uint64_t __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke_346()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke_349()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke_352()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_356);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInFlowControllerImpl remoteUIDidReceiveHTTPResponse:]();
  }
}

uint64_t __61__TUIOptInFlowControllerImpl_remoteUIDidReceiveHTTPResponse___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIDidPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_358);
  }
  int v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315906;
    char v9 = "-[TUIOptInFlowControllerImpl remoteUIDidPresentObjectModel:modally:]";
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    __int16 v14 = 2114;
    id v15 = self;
    _os_log_debug_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: objectModel = %{public}@, isModal = %d on %{public}@", (uint8_t *)&v8, 0x26u);
  }
  self->_ineligibleDevicesRemoteUIPresented = 1;
}

uint64_t __68__TUIOptInFlowControllerImpl_remoteUIDidPresentObjectModel_modally___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (TUIOptInFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIOptInFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
}

- (UINavigationController)presentingNavigationController
{
  return self->_presentingNavigationController;
}

- (void)setPresentingNavigationController:(id)a3
{
}

- (TUIOBWelcomeController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
}

- (KTOptInManager)optInManager
{
  return self->_optInManager;
}

- (void)setOptInManager:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AIDAServiceOwnersManager)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
}

- (AAUIGrandSlamRemoteUIPresenter)ineligibleDevicesRemoteUIPresenter
{
  return self->_ineligibleDevicesRemoteUIPresenter;
}

- (void)setIneligibleDevicesRemoteUIPresenter:(id)a3
{
}

- (TUIAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (void)setAppleAccountManager:(id)a3
{
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (IDSSignInController)idsSignInController
{
  return self->_idsSignInController;
}

- (void)setIdsSignInController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsSignInController, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_ineligibleDevicesRemoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_optInManager, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_presentingNavigationController, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performAccountChecksForFlow:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_260338000, v0, v1, "%s requestedFlow = %d on %{public}@", v2);
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_72_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ verified that iCloud account is HSA2 and CDP enabled for opt in state (%d)...", v1, 0x12u);
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_72_cold_2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_260338000, v0, v1, "%{public}@ unable to verify HSA2 and CDP state on account, aborting...", v2, v3, v4, v5, v6);
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14(&dword_260338000, v0, v1, "%{public}@ unknown flow requested, unable to process opt in state (%d)...");
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75_cold_2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_260338000, v0, v1, "%{public}@ the iCloud and IDS account do not match, showing mismatched accounts error...", v2, v3, v4, v5, v6);
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_75_cold_3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_260338000, v0, v1, "%{public}@ messages verification failed, showing sign into messages with your Apple ID error...", v2, v3, v4, v5, v6);
}

- (void)showAppleIDErrorForFlow:withViewModel:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_260338000, v0, v1, "%s requestedFlow = %d on %{public}@", v2);
}

- (void)_showOptInErrorForViewModel:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_openSettingsURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_260338000, v0, v1, "%{public}@ dismissing CDP repair UI", v2, v3, v4, v5, v6);
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_135_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_260338000, v0, v1, "%{public}@ CDP repair UI dismissed", v2, v3, v4, v5, v6);
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_139_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_260338000, v0, v1, "%{public}@ CDP repair UI dismissed (welcomeController)", v2, v3, v4, v5, v6);
}

- (void)_verifyCDPWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_attemptToSetOptInWithState:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_260338000, v0, v1, "%s requested state = %d on %{public}@", v2);
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_173_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_260338000, v0, v1, "%{public}@ successfully requested ineligible devices remote UI", v2, v3, v4, v5, v6);
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_173_cold_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_260338000, v1, OS_LOG_TYPE_ERROR, "%{public}@ failed to request ineligible devices remote UI: error = %{public}@", v2, 0x16u);
}

- (void)_continueAttemptToSetOptInWithState:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_260338000, v0, v1, "%s requested opt in state = %d on %{public}@", v2);
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_189_cold_1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __int16 v3 = a2;
  uint64_t v4 = [a1 devicesWithIssuesIdentifiers];
  int v5 = 138543618;
  uint8_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [v4 count];
  _os_log_debug_impl(&dword_260338000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ devices with issues count: %ld", (uint8_t *)&v5, 0x16u);
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_189_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14(&dword_260338000, v0, v1, "%{public}@ unable to set requested opt in state = %d");
}

- (void)_showOptInResultError:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_260338000, v0, v1, "%{public}@ showing devices with issues...", v2, v3, v4, v5, v6);
}

- (void)_beginIneligibleDevicesRemoteUIRequestWithCompletion:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 absoluteString];
  int v7 = 136315650;
  uint64_t v8 = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]";
  __int16 v9 = 2114;
  __int16 v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a3;
  _os_log_debug_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI URL = '%{public}@' on %{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)_showErrorAlertWithError:presentingViewController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_260338000, v0, OS_LOG_TYPE_ERROR, "%s opt in state error = %{public}@ on %{public}@", (uint8_t *)v1, 0x20u);
}

- (void)_verifyMessages:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_260338000, v0, v1, "%s iMessage has no address selected on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_verifyMessages:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10(&dword_260338000, v0, v1, "%s iMessage is turned off on %{public}@", v2, v3, v4, v5, 2u);
}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_324_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_10(&dword_260338000, v0, v1, "%s user is not signed in to iMessage with their appleID on %{public}@", v2, v3, v4, v5, 2u);
}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_324_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s success on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)remoteUIWillLoadRequest:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s ineligible devices remote UI: request = %{public}@ on %{public}@", v2);
}

- (void)remoteUIDidEndFlow:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s ineligible devices remote UI: controller = %{public}@ on %{public}@", v2);
}

- (void)remoteUIDidDismiss:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s ineligible devices remote UI: no ineligible devices found => continue opt in on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)remoteUIDidDismiss:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s ineligible devices remote UI: Remove Devices in Settings pressed on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)remoteUIDidDismiss:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s ineligible devices remote UI: OK pressed on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)remoteUIDidDismiss:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 *)(a2 + 9);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  int v5 = 136316162;
  uint8_t v6 = "-[TUIOptInFlowControllerImpl remoteUIDidDismiss:]";
  __int16 v7 = 2114;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  _os_log_debug_impl(&dword_260338000, log, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: controller = %{public}@, presented = %d, canceled = %d on %{public}@", (uint8_t *)&v5, 0x2Cu);
}

- (void)remoteUIDidReceiveHTTPResponse:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s ineligible devices remote UI: response = %{public}@ on %{public}@", v2);
}

@end