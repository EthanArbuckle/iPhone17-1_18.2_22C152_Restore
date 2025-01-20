@interface TUIKTPaneViewController
- (AAGrandSlamSigner)grandSlamSigner;
- (AAUIRemoteUIController)activeRemoteUIController;
- (ACAccount)grandSlamAccount;
- (AIDAAccountManager)accountManager;
- (AKAppleIDAuthenticationController)authController;
- (AKAppleIDServerResourceLoadDelegate)serverUILoadDelegate;
- (BOOL)_reportableFailureFound;
- (BOOL)_shouldShowErrorUI;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (KTOptInManager)optInManager;
- (KTStatus)keyTransparencyStatus;
- (NSDictionary)handleURLResourceDictionary;
- (PSSpecifier)appleIDSpecifier;
- (PSSpecifier)deviceDetailsButtonSpecifier;
- (PSSpecifier)topGroupSpecifier;
- (RUIObjectModel)currentObjectModel;
- (TUIAccountKeySpecifierProvider)accountKeySpecifierProvider;
- (TUIAppleAccountManager)appleAccountManager;
- (TUIDeviceSpecifierProvider)deviceSpecifierProvider;
- (TUIKTPaneViewController)initWithAccountManager:(id)a3 optInManager:(id)a4;
- (TUIKTReportToAppleViewController)reportToAppleViewController;
- (TUIKTStateManager)stateManager;
- (TUINetworkMonitor)networkMonitor;
- (TUIOptInFlowControllerImpl)optInFlowController;
- (UIAlertController)alert;
- (UINavigationController)optInNavigationController;
- (UINavigationController)reportNavigationController;
- (id)_accountStore;
- (id)_appleAccount;
- (id)_authController;
- (id)_createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8;
- (id)_getDeviceVerificationEnabledForSpecifier:(id)a3;
- (id)_grandSlamAccount;
- (id)_grandSlamSigner;
- (id)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 preparation:(id)a5 completion:(id)a6;
- (id)_messagesSettingsSpecifier;
- (id)_optInSpecifier;
- (id)_reportToAppleSpecifier;
- (id)_resetButtonSpecifier;
- (id)_resetButtonSpecifierGroup;
- (id)_tapToRadarSpecifier;
- (id)_topGroupSpecifier;
- (id)_topGroupSpecifierWithError;
- (id)_turnOffButtonSpecifier;
- (id)_turnOffButtonSpecifierGroup;
- (id)_updateAppleIDSpecifier;
- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (id)specifiers;
- (int64_t)_optInTableCellType;
- (void)_addHeadersToRequest:(id)a3;
- (void)_attemptUpdateAuthControllerWithActionableResponse:(id)a3;
- (void)_authController;
- (void)_beginObservingTransparencyStatusChangedNotification;
- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3;
- (void)_changeOptInState:(id)a3 requestedOptInChange:(unint64_t)a4;
- (void)_checkKTStatus:(BOOL)a3;
- (void)_disableCellForSpecifier:(id)a3 showSpinner:(BOOL)a4;
- (void)_dismissPendingAlert;
- (void)_enableCellForSpecifier:(id)a3 hideSpinner:(BOOL)a4;
- (void)_getServerUILoadDelegateWithCompletion:(id)a3;
- (void)_handleLaunchURL;
- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5;
- (void)_learnMoreTapped;
- (void)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 specifier:(id)a5;
- (void)_maybeRefreshMonitorStateInBackground;
- (void)_openMessagesSettings;
- (void)_openReportToApple;
- (void)_openTapToRadar;
- (void)_provideNavigationDonations;
- (void)_resetButtonPressed:(id)a3;
- (void)_setDeviceVerificationEnabled:(id)a3 withSpecifier:(id)a4;
- (void)_setFooterTextWithLinkForSpecifier:(id)a3 footerText:(id)a4 linkText:(id)a5 actionMethodName:(id)a6 target:(id)a7;
- (void)_setupUIStateCDPError:(id)a3;
- (void)_setupUIStateCDPWaiting:(id)a3;
- (void)_setupUIStateDeviceError:(id)a3;
- (void)_setupUIStateIDSDisabled:(id)a3;
- (void)_setupUIStateNoError:(id)a3;
- (void)_setupUIStateNoIDSAppleID:(id)a3;
- (void)_setupUIStateOptInPendingCDPError:(id)a3;
- (void)_setupUIStateOptInPendingCDPWaiting:(id)a3;
- (void)_setupUIStateOtherError:(id)a3;
- (void)_setupUIStateTemporaryError:(id)a3;
- (void)_setupUIStateTreeReset:(id)a3;
- (void)_showOptOutConfirmationAlertWithCompletion:(id)a3;
- (void)_showResetConfirmationAlertWithCompletion:(id)a3;
- (void)_startSpinnerForSpecifier:(id)a3;
- (void)_stopObservingTransparencyStatusChangedNotification;
- (void)_stopSpinnerForSpecifier:(id)a3;
- (void)_transparencyStatusChangedNotificationHandler:(id)a3;
- (void)_turnOffButtonPressed:(id)a3;
- (void)_updateAppleID;
- (void)_updateAppleIDButtonPressed;
- (void)_updateTopGroupSpecifierFooter:(BOOL)a3;
- (void)activeConnectionChanged;
- (void)dealloc;
- (void)dismissRemoteUIForViewController;
- (void)optInFlowResultWithStateUpdate;
- (void)presentOptInNavigationController;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)setAccountKeySpecifierProvider:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setActiveRemoteUIController:(id)a3;
- (void)setAlert:(id)a3;
- (void)setAppleAccountManager:(id)a3;
- (void)setAppleIDSpecifier:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setCurrentObjectModel:(id)a3;
- (void)setDeviceDetailsButtonSpecifier:(id)a3;
- (void)setDeviceSpecifierProvider:(id)a3;
- (void)setGrandSlamAccount:(id)a3;
- (void)setGrandSlamSigner:(id)a3;
- (void)setHandleURLResourceDictionary:(id)a3;
- (void)setKeyTransparencyStatus:(id)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setOptInFlowController:(id)a3;
- (void)setOptInManager:(id)a3;
- (void)setOptInNavigationController:(id)a3;
- (void)setReportNavigationController:(id)a3;
- (void)setReportToAppleViewController:(id)a3;
- (void)setServerUILoadDelegate:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setTopGroupSpecifier:(id)a3;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 loadRequest:(id)a4 withIdentifier:(id)a5 specifier:(id)a6;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)specifiers;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TUIKTPaneViewController

- (TUIKTPaneViewController)initWithAccountManager:(id)a3 optInManager:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_14);
  }
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[TUIKTPaneViewController initWithAccountManager:optInManager:]";
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    v32 = self;
    _os_log_debug_impl(&dword_260338000, v9, OS_LOG_TYPE_DEBUG, "%s accountManager = %{public}@, optInManager = %{public}@ on %{public}@", buf, 0x2Au);
  }
  v24.receiver = self;
  v24.super_class = (Class)TUIKTPaneViewController;
  v10 = [(TUIKTPaneViewController *)&v24 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountManager, a3);
    objc_storeStrong((id *)&v11->_optInManager, a4);
    id v12 = objc_alloc(MEMORY[0x263F80D38]);
    uint64_t v13 = [v12 initWithApplication:*MEMORY[0x263F80D78]];
    keyTransparencyStatus = v11->_keyTransparencyStatus;
    v11->_keyTransparencyStatus = (KTStatus *)v13;

    v15 = [TUIAppleAccountManager alloc];
    v16 = [(TUIKTPaneViewController *)v11 _accountStore];
    uint64_t v17 = [(TUIAppleAccountManager *)v15 initWithAccountStore:v16];
    appleAccountManager = v11->_appleAccountManager;
    v11->_appleAccountManager = (TUIAppleAccountManager *)v17;

    uint64_t v19 = objc_opt_new();
    networkMonitor = v11->_networkMonitor;
    v11->_networkMonitor = (TUINetworkMonitor *)v19;

    [(TUINetworkMonitor *)v11->_networkMonitor setDelegate:v11];
    [(TUINetworkMonitor *)v11->_networkMonitor setUpNetworkPathMonitor];
    uint64_t v21 = objc_opt_new();
    stateManager = v11->_stateManager;
    v11->_stateManager = (TUIKTStateManager *)v21;
  }
  return v11;
}

uint64_t __63__TUIKTPaneViewController_initWithAccountManager_optInManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __34__TUIKTPaneViewController_dealloc__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_39);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController viewWillAppear:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)TUIKTPaneViewController;
  [(TUIKTPaneViewController *)&v8 viewWillAppear:v3];
  uint64_t v5 = [(TUIKTPaneViewController *)self navigationItem];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"DEVICE_VERIFICATION_SPECIFIER_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  [v5 setTitle:v7];
}

uint64_t __42__TUIKTPaneViewController_viewWillAppear___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewDidLoad
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __38__TUIKTPaneViewController_viewDidLoad__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __38__TUIKTPaneViewController_viewDidLoad__block_invoke_53(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F1C7F8]);
    [WeakRetained setOptInNavigationController:v2];

    uint64_t v3 = [WeakRetained optInNavigationController];
    uint64_t v4 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = -2;
    }
    [v3 setModalPresentationStyle:v6];

    id v7 = [TUIOptInFlowControllerImpl alloc];
    objc_super v8 = [WeakRetained optInNavigationController];
    v9 = [WeakRetained accountManager];
    v10 = [WeakRetained stateManager];
    v11 = [(TUIOptInFlowControllerImpl *)v7 initWithPresentingNavigationController:v8 parentViewController:WeakRetained accountManager:v9 stateManager:v10];
    [WeakRetained setOptInFlowController:v11];

    id v12 = [WeakRetained optInFlowController];
    [v12 setDelegate:WeakRetained];

    [WeakRetained _checkKTStatus:1];
    [WeakRetained _beginObservingTransparencyStatusChangedNotification];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_55);
    }
    uint64_t v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[TUIKTPaneViewController viewDidLoad]_block_invoke";
      _os_log_impl(&dword_260338000, v13, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t __38__TUIKTPaneViewController_viewDidLoad__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_59_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController viewDidAppear:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)TUIKTPaneViewController;
  [(TUIKTPaneViewController *)&v8 viewDidAppear:v3];
  uint64_t v5 = [(TUIKTPaneViewController *)self stateManager];
  int v6 = [v5 shouldMaybeUpdateMonitor];

  if (v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_64);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ forcing a refresh since we are in error", buf, 0xCu);
    }
    [(TUIKTPaneViewController *)self _maybeRefreshMonitorStateInBackground];
  }
  [(TUIKTPaneViewController *)self _provideNavigationDonations];
}

uint64_t __41__TUIKTPaneViewController_viewDidAppear___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __41__TUIKTPaneViewController_viewDidAppear___block_invoke_62()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_provideNavigationDonations
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __54__TUIKTPaneViewController__provideNavigationDonations__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __54__TUIKTPaneViewController__provideNavigationDonations__block_invoke_80()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_84);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController viewWillDisappear:]();
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIKTPaneViewController;
  [(TUIKTPaneViewController *)&v5 viewWillDisappear:v3];
}

uint64_t __45__TUIKTPaneViewController_viewWillDisappear___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_88);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController viewDidDisappear:]();
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIKTPaneViewController;
  [(TUIKTPaneViewController *)&v5 viewDidDisappear:v3];
}

uint64_t __44__TUIKTPaneViewController_viewDidDisappear___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIKTPaneViewController;
  [(TUIKTPaneViewController *)&v6 willMoveToParentViewController:a3];
  uint64_t v4 = [(AAUIRemoteUIController *)self->_activeRemoteUIController loader];
  [v4 cancel];

  [(AAUIRemoteUIController *)self->_activeRemoteUIController setNavigationController:0];
  activeRemoteUIController = self->_activeRemoteUIController;
  self->_activeRemoteUIController = 0;
}

- (void)_setupUIStateNoError:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_94);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateNoError:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifier];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  unint64_t v7 = [(TUIKTStateManager *)self->_stateManager optIn];
  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (v7 == 1)
  {
    if (!accountKeySpecifierProvider)
    {
      v9 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
      v10 = self->_accountKeySpecifierProvider;
      self->_accountKeySpecifierProvider = v9;

      [(TUIAccountKeySpecifierProvider *)self->_accountKeySpecifierProvider setDelegate:self];
      accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
    }
    [accountKeySpecifierProvider refreshSelfAccountKey];
    accountKeySpecifierProvider = [(TUIAccountKeySpecifierProvider *)self->_accountKeySpecifierProvider specifiers];
    [v4 addObjectsFromArray:accountKeySpecifierProvider];
  }
  else
  {
    self->_accountKeySpecifierProvider = 0;
  }
}

uint64_t __48__TUIKTPaneViewController__setupUIStateNoError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateNoIDSAppleID:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_97);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateNoIDSAppleID:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  unint64_t v7 = [(TUIKTPaneViewController *)self _messagesSettingsSpecifier];
  [v4 addObject:v7];

  objc_super v8 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifierGroup];
  [v4 addObject:v8];

  v9 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifier];
  [v4 addObject:v9];
}

uint64_t __53__TUIKTPaneViewController__setupUIStateNoIDSAppleID___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateCDPWaiting:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_99_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateCDPWaiting:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  unint64_t v7 = [(TUIKTPaneViewController *)self _resetButtonSpecifierGroup];
  [v4 addObject:v7];

  objc_super v8 = [(TUIKTPaneViewController *)self _resetButtonSpecifier];
  [v4 addObject:v8];
}

uint64_t __51__TUIKTPaneViewController__setupUIStateCDPWaiting___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateDeviceError:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_101);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateDeviceError:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  topGroupSpecifier = self->_topGroupSpecifier;
  self->_topGroupSpecifier = v5;

  [v4 addObject:self->_topGroupSpecifier];
  unint64_t v7 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v7];

  if (+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
  {
    objc_super v8 = [(TUIKTPaneViewController *)self _reportToAppleSpecifier];
    [v4 addObject:v8];
  }
  v9 = [[TUIDeviceSpecifierProvider alloc] initWithAccountManager:self->_accountManager stateManager:self->_stateManager];
  deviceSpecifierProvider = self->_deviceSpecifierProvider;
  self->_deviceSpecifierProvider = v9;

  [(TUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider setDelegate:self];
  uint64_t v11 = [(TUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider specifiers];
  [v4 addObjectsFromArray:v11];

  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (!accountKeySpecifierProvider)
  {
    uint64_t v13 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
    int v14 = self->_accountKeySpecifierProvider;
    self->_accountKeySpecifierProvider = v13;

    [(TUIAccountKeySpecifierProvider *)self->_accountKeySpecifierProvider setDelegate:self];
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  }
  v15 = [(TUIAccountKeySpecifierProvider *)accountKeySpecifierProvider specifiers];
  [v4 addObjectsFromArray:v15];

  uint64_t v16 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifierGroup];
  [v4 addObject:v16];

  uint64_t v17 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifier];
  [v4 addObject:v17];
}

uint64_t __52__TUIKTPaneViewController__setupUIStateDeviceError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateOtherError:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_105_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateOtherError:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  if (+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
  {
    unint64_t v7 = [(TUIKTPaneViewController *)self _reportToAppleSpecifier];
    [v4 addObject:v7];
  }
  if ([MEMORY[0x263F20318] isInternalBuild])
  {
    objc_super v8 = [(TUIKTPaneViewController *)self _tapToRadarSpecifier];
    [v4 addObject:v8];
  }
  v9 = [(TUIKTPaneViewController *)self _resetButtonSpecifierGroup];
  [v4 addObject:v9];

  v10 = [(TUIKTPaneViewController *)self _resetButtonSpecifier];
  [v4 addObject:v10];

  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (!accountKeySpecifierProvider)
  {
    id v12 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
    uint64_t v13 = self->_accountKeySpecifierProvider;
    self->_accountKeySpecifierProvider = v12;

    [(TUIAccountKeySpecifierProvider *)self->_accountKeySpecifierProvider setDelegate:self];
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  }
  int v14 = [(TUIAccountKeySpecifierProvider *)accountKeySpecifierProvider specifiers];
  [v4 addObjectsFromArray:v14];

  v15 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifierGroup];
  [v4 addObject:v15];

  uint64_t v16 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifier];
  [v4 addObject:v16];
}

uint64_t __51__TUIKTPaneViewController__setupUIStateOtherError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateCDPError:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_108_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateCDPError:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  unint64_t v7 = [(TUIKTPaneViewController *)self _updateAppleIDSpecifier];
  [v4 addObject:v7];

  objc_super v8 = [(TUIKTPaneViewController *)self _resetButtonSpecifierGroup];
  [v4 addObject:v8];

  v9 = [(TUIKTPaneViewController *)self _resetButtonSpecifier];
  [v4 addObject:v9];
}

uint64_t __49__TUIKTPaneViewController__setupUIStateCDPError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateTemporaryError:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_110);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateTemporaryError:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  if (+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
  {
    unint64_t v7 = [(TUIKTPaneViewController *)self _reportToAppleSpecifier];
    [v4 addObject:v7];
  }
  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (!accountKeySpecifierProvider)
  {
    v9 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
    v10 = self->_accountKeySpecifierProvider;
    self->_accountKeySpecifierProvider = v9;

    [(TUIAccountKeySpecifierProvider *)self->_accountKeySpecifierProvider setDelegate:self];
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  }
  uint64_t v11 = [(TUIAccountKeySpecifierProvider *)accountKeySpecifierProvider specifiers];
  [v4 addObjectsFromArray:v11];

  id v12 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifierGroup];
  [v4 addObject:v12];

  uint64_t v13 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifier];
  [v4 addObject:v13];
}

uint64_t __55__TUIKTPaneViewController__setupUIStateTemporaryError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateTreeReset:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_112);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateTreeReset:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  if (+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
  {
    unint64_t v7 = [(TUIKTPaneViewController *)self _reportToAppleSpecifier];
    [v4 addObject:v7];
  }
  objc_super v8 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifierGroup];
  [v4 addObject:v8];

  v9 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifier];
  [v4 addObject:v9];
}

uint64_t __50__TUIKTPaneViewController__setupUIStateTreeReset___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateOptInPendingCDPError:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_114_0);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateOptInPendingCDPError:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  unint64_t v7 = [(TUIKTPaneViewController *)self _updateAppleIDSpecifier];
  [v4 addObject:v7];
}

uint64_t __61__TUIKTPaneViewController__setupUIStateOptInPendingCDPError___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateOptInPendingCDPWaiting:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_116);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateOptInPendingCDPWaiting:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];
}

uint64_t __63__TUIKTPaneViewController__setupUIStateOptInPendingCDPWaiting___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_setupUIStateIDSDisabled:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_118);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setupUIStateIDSDisabled:]();
  }
  objc_super v5 = [(TUIKTPaneViewController *)self _topGroupSpecifierWithError];
  [v4 addObject:v5];

  objc_super v6 = [(TUIKTPaneViewController *)self _optInSpecifier];
  [v4 addObject:v6];

  unint64_t v7 = [(TUIKTPaneViewController *)self stateManager];
  uint64_t v8 = [v7 optIn];

  if (v8 == 1)
  {
    v9 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifierGroup];
    [v4 addObject:v9];

    v10 = [(TUIKTPaneViewController *)self _turnOffButtonSpecifier];
    [v4 addObject:v10];
  }
}

uint64_t __52__TUIKTPaneViewController__setupUIStateIDSDisabled___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)specifiers
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_120);
  }
  BOOL v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    [(TUIKTPaneViewController *)(uint64_t)self specifiers];
  }
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  objc_super v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x263EFF980] array];
    switch([(TUIKTStateManager *)self->_stateManager state])
    {
      case -1:
      case 0:
      case 1:
      case 2:
        goto LABEL_7;
      case 3:
        [(TUIKTPaneViewController *)self _setupUIStateNoIDSAppleID:v6];
        break;
      case 4:
        [(TUIKTPaneViewController *)self _setupUIStateDeviceError:v6];
        break;
      case 5:
        [(TUIKTPaneViewController *)self _setupUIStateCDPError:v6];
        break;
      case 6:
        [(TUIKTPaneViewController *)self _setupUIStateCDPWaiting:v6];
        break;
      case 7:
        [(TUIKTPaneViewController *)self _setupUIStateOtherError:v6];
        break;
      case 8:
        [(TUIKTPaneViewController *)self _setupUIStateTemporaryError:v6];
        break;
      case 9:
        [(TUIKTPaneViewController *)self _setupUIStateTreeReset:v6];
        break;
      case 10:
        [(TUIKTPaneViewController *)self _setupUIStateOptInPendingCDPError:v6];
        break;
      case 11:
        [(TUIKTPaneViewController *)self _setupUIStateOptInPendingCDPWaiting:v6];
        break;
      case 12:
        [(TUIKTPaneViewController *)self _setupUIStateIDSDisabled:v6];
        break;
      default:
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_124_0);
        }
        v10 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR)) {
          [(TUIKTPaneViewController *)(void **)&self->_stateManager specifiers];
        }
LABEL_7:
        [(TUIKTPaneViewController *)self _setupUIStateNoError:v6];
        break;
    }
    unint64_t v7 = (objc_class *)[v6 copy];
    uint64_t v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v7;

    [(TUIKTPaneViewController *)self _handleLaunchURL];
    objc_super v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  }
  return v5;
}

uint64_t __37__TUIKTPaneViewController_specifiers__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __37__TUIKTPaneViewController_specifiers__block_invoke_122()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_topGroupSpecifier
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"DEVICE_VERIFICATION_SPECIFIER_FOOTER" value:&stru_270C3F140 table:@"Localizable"];
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  unint64_t v7 = [(TUIKTPaneViewController *)self _createGroupSpecifierWithIdentifier:@"TUI_PANE_TOP_GROUP" title:0 footerText:v4 linkText:v6 actionMethodName:@"_learnMoreTapped" target:self];

  return v7;
}

- (id)_topGroupSpecifierWithError
{
  BOOL v3 = [(TUIKTStateManager *)self->_stateManager isCDPErrorState];
  int64_t v4 = [(TUIKTStateManager *)self->_stateManager state];
  if (v3)
  {
    if (v4 == 6 || [(TUIKTStateManager *)self->_stateManager state] == 11)
    {
      objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v6 = v5;
      unint64_t v7 = @"DEVICE_VERIFICATION_SPECIFIER_FOOTER";
    }
    else
    {
      objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v6 = v5;
      unint64_t v7 = @"UPDATE_APPLE_ID_FOOTER";
    }
    goto LABEL_10;
  }
  if (v4 == 8)
  {
    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v6 = v5;
    uint64_t v8 = @"TEMPORARY_ERROR_FOOTER";
  }
  else if ([(TUIKTStateManager *)self->_stateManager state] == 9)
  {
    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v6 = v5;
    uint64_t v8 = @"TREE_RESET_FOOTER";
  }
  else
  {
    if ([(TUIKTStateManager *)self->_stateManager state] == 4
      && [(TUIKTStateManager *)self->_stateManager expectedResolutionDays])
    {
      v10 = NSString;
      objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v6 localizedStringForKey:@"TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER_WITH_DAYS" value:&stru_270C3F140 table:@"Localizable"];
      v9 = objc_msgSend(v10, "localizedStringWithFormat:", v11, -[TUIKTStateManager expectedResolutionDays](self->_stateManager, "expectedResolutionDays"));

      goto LABEL_18;
    }
    if ([(TUIKTStateManager *)self->_stateManager state] == 3)
    {
      objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v6 = v5;
      uint64_t v8 = @"MISSING_APPLEID_OPTIN_ERROR_DETAIL";
    }
    else
    {
      int64_t v18 = [(TUIKTStateManager *)self->_stateManager state];
      objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v6 = v5;
      if (v18 == 12)
      {
        unint64_t v7 = @"IDS_KT_DISABLED_DETAIL";
LABEL_10:
        v9 = [v5 localizedStringForKey:v7 value:&stru_270C3F140 table:@"Localizable"];
        goto LABEL_18;
      }
      uint64_t v8 = @"TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER";
    }
  }
  v9 = [v5 localizedStringForKey:v8 value:&stru_270C3F140 table:@"Localizable"];

  if (!+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])goto LABEL_19; {
  id v12 = [v9 stringByAppendingString:@" "];
  }

  objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v6 localizedStringForKey:@"REPORT_TO_APPLE_FOOTER" value:&stru_270C3F140 table:@"Localizable"];
  v9 = [v12 stringByAppendingString:v13];

LABEL_18:
LABEL_19:
  int v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  uint64_t v16 = [(TUIKTPaneViewController *)self _createGroupSpecifierWithIdentifier:@"TUI_PANE_TOP_GROUP" title:0 footerText:v9 linkText:v15 actionMethodName:@"_learnMoreTapped" target:self];

  return v16;
}

- (void)_learnMoreTapped
{
  id v2 = [NSURL URLWithString:@"https://support.apple.com/ht213465"];
  [(id)*MEMORY[0x263F1D020] openURL:v2 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (id)_optInSpecifier
{
  BOOL v3 = (void *)MEMORY[0x263F5FC40];
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"DEVICE_VERIFICATION_OPTIN_SPECIFIER_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  objc_super v6 = objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel__setDeviceVerificationEnabled_withSpecifier_, sel__getDeviceVerificationEnabledForSpecifier_, 0, -[TUIKTPaneViewController _optInTableCellType](self, "_optInTableCellType"), 0);

  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  if ([(TUIKTPaneViewController *)self _shouldShowErrorUI])
  {
    unint64_t v7 = [(TUIKTStateManager *)self->_stateManager stateLabel];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F602C8]];

    if ([(TUIKTStateManager *)self->_stateManager state] == 6
      || [(TUIKTStateManager *)self->_stateManager state] == 11)
    {
      uint64_t v8 = [MEMORY[0x263F1C550] secondaryLabelColor];
      [v6 setProperty:v8 forKey:*MEMORY[0x263F602C0]];
    }
    [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  }
  return v6;
}

- (int64_t)_optInTableCellType
{
  if ([(TUIKTPaneViewController *)self _shouldShowErrorUI]) {
    return -1;
  }
  int64_t result = [(TUIKTStateManager *)self->_stateManager state];
  if (result == -1) {
    return result;
  }
  if ([(TUIKTStateManager *)self->_stateManager isVerifyCDPRunning]) {
    return -1;
  }
  if ([(TUIKTStateManager *)self->_stateManager optIn] == 2) {
    return -1;
  }
  return 6;
}

- (id)_getDeviceVerificationEnabledForSpecifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_176);
  }
  objc_super v5 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _getDeviceVerificationEnabledForSpecifier:]((uint64_t)self, v5);
  }
  if ([(TUIKTPaneViewController *)self _shouldShowErrorUI])
  {
    objc_super v6 = &stru_270C3F140;
    goto LABEL_15;
  }
  if ([(TUIKTStateManager *)self->_stateManager state] == -1
    || [(TUIKTStateManager *)self->_stateManager isVerifyCDPRunning])
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_179_0);
    }
    unint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_DWORD *)uint64_t v16 = 138543362;
    *(void *)&v16[4] = self;
    uint64_t v8 = "%{public}@ adding spinner to specifier...";
LABEL_13:
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_INFO, v8, v16, 0xCu);
LABEL_14:
    -[TUIKTPaneViewController _startSpinnerForSpecifier:](self, "_startSpinnerForSpecifier:", v4, *(_OWORD *)v16);
    objc_super v6 = (__CFString *)MEMORY[0x263EFFA80];
    goto LABEL_15;
  }
  if ([(TUIKTStateManager *)self->_stateManager optIn] == 2)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_182_0);
    }
    unint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_DWORD *)uint64_t v16 = 138543362;
    *(void *)&v16[4] = self;
    uint64_t v8 = "%{public}@ cached opt in state is not available, adding spinner to specifier...";
    goto LABEL_13;
  }
  v10 = [v4 propertyForKey:*MEMORY[0x263F602B0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 control];
    [v11 setIsAccessibilityElement:1];
    [v11 setAccessibilityIdentifier:@"OptIn Switch"];
    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TUIKTStateManager optIn](self->_stateManager, "optIn"));
    uint64_t v13 = [v12 stringValue];
    [v11 setAccessibilityValue:v13];

    int v14 = [NSNumber numberWithBool:self->_hasActiveConnection];
    [v4 setProperty:v14 forKey:*MEMORY[0x263F600A8]];

    objc_msgSend(NSNumber, "numberWithInt:", -[TUIKTStateManager optIn](self->_stateManager, "optIn") == 1);
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_186_0);
    }
    v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR)) {
      [(TUIKTPaneViewController *)(uint64_t)self _getDeviceVerificationEnabledForSpecifier:v15];
    }
    objc_super v6 = &stru_270C3F140;
  }

LABEL_15:
  return v6;
}

uint64_t __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke_177()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke_180()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke_184()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_updateAppleIDSpecifier
{
  BOOL v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"UPDATE_APPLE_ID_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  objc_super v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
  appleIDSpecifier = self->_appleIDSpecifier;
  self->_appleIDSpecifier = v6;

  [(PSSpecifier *)self->_appleIDSpecifier setButtonAction:sel__updateAppleIDButtonPressed];
  uint64_t v8 = self->_appleIDSpecifier;
  return v8;
}

- (void)_updateAppleIDButtonPressed
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __54__TUIKTPaneViewController__updateAppleIDButtonPressed__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)dismissRemoteUIForViewController
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ dismissing CDP repair UI", (uint8_t *)&v2, 0xCu);
}

uint64_t __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_197(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_200;
    v4[3] = &unk_2655531C8;
    v4[4] = WeakRetained;
    [WeakRetained dismissViewControllerAnimated:1 completion:v4];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_199);
    }
    uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v6 = "-[TUIKTPaneViewController dismissRemoteUIForViewController]_block_invoke";
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_200(uint64_t a1)
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_203_0);
  }
  int v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_200_cold_1(a1, v2);
  }
}

uint64_t __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_2_201()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_updateAppleID
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __41__TUIKTPaneViewController__updateAppleID__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_209(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_214);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "-[TUIKTPaneViewController _updateAppleID]_block_invoke_2";
      __int16 v14 = 1024;
      int v15 = a2;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2114;
      id v19 = WeakRetained;
      _os_log_debug_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "%s isVerified = %d, error = %{public}@ on %{public}@", buf, 0x26u);
      if (a2)
      {
LABEL_6:
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
        {
          uint64_t v8 = [WeakRetained optInManager];
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __41__TUIKTPaneViewController__updateAppleID__block_invoke_215;
          v11[3] = &unk_2655535B8;
          v11[4] = WeakRetained;
          [v8 waitForIDSRegistration:v11];
        }
        goto LABEL_14;
      }
    }
    else if (a2)
    {
      goto LABEL_6;
    }
    v10 = [WeakRetained stateManager];
    [v10 setIsVerifyCDPRunning:0];

    [WeakRetained dismissRemoteUIForViewController];
    [WeakRetained _checkKTStatus:0];
    goto LABEL_14;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_211);
  }
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[TUIKTPaneViewController _updateAppleID]_block_invoke";
    _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_14:
}

uint64_t __41__TUIKTPaneViewController__updateAppleID__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __41__TUIKTPaneViewController__updateAppleID__block_invoke_212()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_215(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_218);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "waitForIDSRegistration error after verifying CDP %{public}@", (uint8_t *)&v8, 0xCu);
    }
    id v5 = [*(id *)(a1 + 32) optInFlowController];
    objc_super v6 = [*(id *)(a1 + 32) presentedViewController];
    [v5 _showErrorAlertWithError:v3 presentingViewController:v6];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) stateManager];
    [v7 setIsVerifyCDPRunning:0];

    [*(id *)(a1 + 32) dismissRemoteUIForViewController];
    [*(id *)(a1 + 32) _checkKTStatus:0];
  }
}

uint64_t __41__TUIKTPaneViewController__updateAppleID__block_invoke_2_216()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_messagesSettingsSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"MESSAGES_SETTINGS_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  objc_super v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:sel__openMessagesSettings];
  return v6;
}

- (void)_openMessagesSettings
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __48__TUIKTPaneViewController__openMessagesSettings__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __48__TUIKTPaneViewController__openMessagesSettings__block_invoke_228(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v3 = [NSURL URLWithString:@"prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"];
    [v2 openSensitiveURL:v3 withOptions:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_230_0);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      objc_super v6 = "-[TUIKTPaneViewController _openMessagesSettings]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __48__TUIKTPaneViewController__openMessagesSettings__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_reportToAppleSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"REPORT_TO_APPLE" value:&stru_270C3F140 table:@"Localizable"];
  objc_super v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:sel__openReportToApple];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TUIKTPaneViewController _reportableFailureFound](self, "_reportableFailureFound"));
  [v6 setProperty:v7 forKey:*MEMORY[0x263F600A8]];

  return v6;
}

- (id)_tapToRadarSpecifier
{
  uint64_t v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"[INTERNAL] File a Tap-to-Radar..." target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v2 setButtonAction:sel__openTapToRadar];
  [v2 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  return v2;
}

- (id)_resetButtonSpecifierGroup
{
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"RESET_CONTACT_KEY_VERIFICATION" name:0];
  int64_t v4 = [(TUIKTStateManager *)self->_stateManager state];
  int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = v5;
  if (v4 == 7) {
    uint64_t v7 = @"RESET_CONTACT_KEY_VERIFICATION_ISSUE_FOOTER";
  }
  else {
    uint64_t v7 = @"RESET_CONTACT_KEY_VERIFICATION_FOOTER";
  }
  int v8 = [v5 localizedStringForKey:v7 value:&stru_270C3F140 table:@"Localizable"];
  [v3 setProperty:v8 forKey:*MEMORY[0x263F600F8]];

  return v3;
}

- (id)_resetButtonSpecifier
{
  int64_t v3 = [(TUIKTStateManager *)self->_stateManager state];
  int64_t v4 = (void *)MEMORY[0x263F5FC40];
  int v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v6 = [v5 localizedStringForKey:@"RESET_CONTACT_KEY_VERIFICATION_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  if (v3 == 7)
  {
    uint64_t v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v7 setButtonAction:sel__resetButtonPressed_];
  }
  else
  {
    uint64_t v7 = [v4 deleteButtonSpecifierWithName:v6 target:self action:sel__resetButtonPressed_];

    [v7 setProperty:@"RESET_CONTACT_KEY_VERIFICATION_BUTTON" forKey:*MEMORY[0x263F60138]];
  }
  uint64_t v8 = MEMORY[0x263EFFA88];
  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F600A8]];
  return v7;
}

- (void)_resetButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_257);
  }
  int v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _resetButtonPressed:]";
    __int16 v11 = 2114;
    id v12 = self;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_258;
  v7[3] = &unk_265552FE8;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

uint64_t __47__TUIKTPaneViewController__resetButtonPressed___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_258(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained stateManager];
    uint64_t v5 = [v4 state];

    if (v5 == 7)
    {
      [v3 _changeOptInState:*(void *)(a1 + 32) requestedOptInChange:2];
    }
    else
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, v3);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_261;
      v7[3] = &unk_265553608;
      objc_copyWeak(&v9, (id *)buf);
      id v8 = *(id *)(a1 + 32);
      [v3 _showResetConfirmationAlertWithCompletion:v7];

      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_260);
    }
    id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _resetButtonPressed:]_block_invoke";
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_261(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2) {
      [WeakRetained _changeOptInState:*(void *)(a1 + 32) requestedOptInChange:0];
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_264);
    }
    id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[TUIKTPaneViewController _resetButtonPressed:]_block_invoke";
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_2_262()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_changeOptInState:(id)a3 requestedOptInChange:(unint64_t)a4
{
  id v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_267);
  }
  int v7 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _changeOptInState:requestedOptInChange:](v7, a4, (uint64_t)self);
  }
  [(TUIKTPaneViewController *)self _disableCellForSpecifier:v6 showSpinner:1];
  id v8 = [(TUIKTPaneViewController *)self appleIDSpecifier];
  [(TUIKTPaneViewController *)self _disableCellForSpecifier:v8 showSpinner:0];

  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v9 = [(TUIKTPaneViewController *)self optInManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_268;
  v11[3] = &unk_265553630;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v9 changeOptInState:a4 detailedCompletionBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_268(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_273);
    }
    id v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 136316162;
      *(void *)&location[4] = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]_block_invoke_2";
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      id v23 = WeakRetained;
      _os_log_debug_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "%s changeOptInState int64_t result = %d, loggableDatas = %{public}@, error = %{public}@ on %{public}@", location, 0x30u);
    }
    *(void *)id location = 0;
    objc_initWeak((id *)location, WeakRetained);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_274;
    v12[3] = &unk_265552FE8;
    objc_copyWeak(&v14, (id *)location);
    id v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_270);
    }
    uint64_t v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]_block_invoke";
      _os_log_impl(&dword_260338000, v11, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }
}

uint64_t __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_271()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_274(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _enableCellForSpecifier:*(void *)(a1 + 32) hideSpinner:1];
    id v4 = [v3 appleIDSpecifier];
    [v3 _enableCellForSpecifier:v4 hideSpinner:0];

    [v3 _checkKTStatus:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_277);
    }
    uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_2_275()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_turnOffButtonSpecifierGroup
{
  return (id)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"TUI_PANE_TURNOFF_GROUP"];
}

- (id)_turnOffButtonSpecifier
{
  int64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"TURN_OFF" value:&stru_270C3F140 table:@"Localizable"];
  int v6 = [v3 deleteButtonSpecifierWithName:v5 target:self action:sel__turnOffButtonPressed_];

  [v6 setProperty:@"TURN_OFF_BUTTON" forKey:*MEMORY[0x263F60138]];
  return v6;
}

- (void)_turnOffButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_291);
  }
  uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _turnOffButtonPressed:]";
    __int16 v11 = 2114;
    id v12 = self;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_292;
  v7[3] = &unk_265552FE8;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

uint64_t __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_292(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_295;
    v5[3] = &unk_265553658;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    [v3 _showOptOutConfirmationAlertWithCompletion:v5];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_294);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[TUIKTPaneViewController _turnOffButtonPressed:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_295(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _disableCellForSpecifier:*(void *)(a1 + 40) showSpinner:1];
    id v3 = [*(id *)(a1 + 32) optInFlowController];
    [v3 beginOptOutFlow];
  }
}

- (void)_beginObservingTransparencyStatusChangedNotification
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __79__TUIKTPaneViewController__beginObservingTransparencyStatusChangedNotification__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_stopObservingTransparencyStatusChangedNotification
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __78__TUIKTPaneViewController__stopObservingTransparencyStatusChangedNotification__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_transparencyStatusChangedNotificationHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_304);
  }
  uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _transparencyStatusChangedNotificationHandler:]";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 2114;
    id v14 = self;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %{public}@", buf, 0x20u);
  }
  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKey:*MEMORY[0x263F80D80]];

  if (v7)
  {
    if (self->_alert) {
      [(TUIKTPaneViewController *)self _dismissPendingAlert];
    }
    else {
      [(TUIOptInFlowControllerImpl *)self->_optInFlowController dismissPendingPopupUI];
    }
  }
  [(TUIKTPaneViewController *)self _checkKTStatus:0];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke_305;
  block[3] = &unk_265553128;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

uint64_t __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke_305(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained accountKeySpecifierProvider];
    [v3 refreshSelfAccountKey];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_307);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[TUIKTPaneViewController _transparencyStatusChangedNotificationHandler:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_disableCellForSpecifier:(id)a3 showSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *MEMORY[0x263F600A8];
  id v6 = a3;
  [v6 setProperty:MEMORY[0x263EFFA80] forKey:v5];
  id v8 = [v6 propertyForKey:*MEMORY[0x263F602B0]];

  [v8 setCellEnabled:0];
  if (v4)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    [v8 setAccessoryView:v7];
  }
  [v8 setNeedsDisplay];
}

- (void)_enableCellForSpecifier:(id)a3 hideSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *MEMORY[0x263F602B0];
  id v6 = a3;
  uint64_t v7 = [v6 propertyForKey:v5];
  id v9 = v7;
  if (v4)
  {
    id v8 = [v7 accessoryView];
    [v8 stopAnimating];

    uint64_t v7 = v9;
  }
  [v7 setCellEnabled:1];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
}

- (void)_checkKTStatus:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_310);
  }
  uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _checkKTStatus:]";
    __int16 v11 = 2114;
    id v12 = self;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEFAULT, "%s getting CKV status on %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v6 = dispatch_get_global_queue(33, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TUIKTPaneViewController__checkKTStatus___block_invoke_311;
  v7[3] = &unk_265553680;
  objc_copyWeak(&v8, (id *)buf);
  BOOL v9 = a3;
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

uint64_t __42__TUIKTPaneViewController__checkKTStatus___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_311(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x263F80D38]);
    BOOL v4 = (void *)[v3 initWithApplication:*MEMORY[0x263F80D78]];
    id v14 = 0;
    uint64_t v5 = [v4 status:&v14];
    id v6 = v14;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_316);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _checkKTStatus:]_block_invoke_2";
      __int16 v16 = 2114;
      int v17 = v5;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = WeakRetained;
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "%s got CKV status = %{public}@, error = %{public}@ on %{public}@", buf, 0x2Au);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__TUIKTPaneViewController__checkKTStatus___block_invoke_317;
    v10[3] = &unk_265553268;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v5;
    char v13 = *(unsigned char *)(a1 + 40);
    id v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_313);
    }
    BOOL v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _checkKTStatus:]_block_invoke";
      _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __42__TUIKTPaneViewController__checkKTStatus___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __42__TUIKTPaneViewController__checkKTStatus___block_invoke_314()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_317(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained stateManager];
    [v4 updateStateWithKTStatusResult:*(void *)(a1 + 32)];

    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = [v3 stateManager];
      int v6 = [v5 shouldMaybeUpdateMonitor];

      if (v6)
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_323_0);
        }
        uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138543362;
          id v10 = (const char *)v3;
          _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ forcing a refresh on because of failure at initial load", (uint8_t *)&v9, 0xCu);
        }
        [v3 _maybeRefreshMonitorStateInBackground];
      }
    }
    [v3 reloadSpecifiers];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_320_0);
    }
    id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[TUIKTPaneViewController _checkKTStatus:]_block_invoke";
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
}

uint64_t __42__TUIKTPaneViewController__checkKTStatus___block_invoke_2_318()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __42__TUIKTPaneViewController__checkKTStatus___block_invoke_321()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_maybeRefreshMonitorStateInBackground
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_325);
}

void __64__TUIKTPaneViewController__maybeRefreshMonitorStateInBackground__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F80D60]);
  [v0 maybeUpdateMonitorState];
}

- (void)_setDeviceVerificationEnabled:(id)a3 withSpecifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_328);
  }
  id v8 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _setDeviceVerificationEnabled:withSpecifier:]((uint64_t)self, v8);
  }
  if ([(TUIKTStateManager *)self->_stateManager optIn] != 2)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    if ([(TUIKTStateManager *)self->_stateManager optIn])
    {
      if ([(TUIKTStateManager *)self->_stateManager optIn] != 1)
      {
LABEL_15:
        objc_destroyWeak((id *)buf);
        goto LABEL_16;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_335;
      block[3] = &unk_265552FE8;
      id v10 = &v13;
      objc_copyWeak(&v13, (id *)buf);
      id v12 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_332;
      v14[3] = &unk_265553128;
      id v10 = &v15;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_async(MEMORY[0x263EF83A0], v14);
    }
    objc_destroyWeak(v10);
    goto LABEL_15;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_331);
  }
  int v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ cached opt in state is not available, aborting attempt to change opt in state...", buf, 0xCu);
  }
LABEL_16:
}

uint64_t __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_329()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_332(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained optInNavigationController];
    [v2 presentViewController:v3 animated:1 completion:0];

    BOOL v4 = [v2 optInFlowController];
    [v4 beginOptInFlow];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_334_0);
    }
    uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[TUIKTPaneViewController _setDeviceVerificationEnabled:withSpecifier:]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_335(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_339;
    v4[3] = &unk_265553658;
    id v5 = *(id *)(a1 + 32);
    id v6 = WeakRetained;
    [WeakRetained _showOptOutConfirmationAlertWithCompletion:v4];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_338);
    }
    id v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = "-[TUIKTPaneViewController _setDeviceVerificationEnabled:withSpecifier:]_block_invoke";
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_2_336()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_339(uint64_t a1, int a2)
{
  BOOL v4 = [*(id *)(a1 + 32) propertyForKey:*MEMORY[0x263F602B0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2)
    {
      [v4 setLoading:1];
      id v5 = [*(id *)(a1 + 40) optInFlowController];
      [v5 beginOptOutFlow];
    }
    else
    {
      id v5 = [v4 control];
      [v5 setOn:1 animated:1];
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_342);
    }
    id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR)) {
      __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_339_cold_1(a1, (uint64_t)v4, v6);
    }
  }
}

uint64_t __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_2_340()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_openReportToApple
{
  id v3 = [TUIKTReportToAppleContext alloc];
  if ([(TUIKTPaneViewController *)self _reportableFailureFound])
  {
    BOOL v4 = [(TUIKTStateManager *)self->_stateManager firstRecentFailedEventId];
    [(TUIKTReportToAppleContext *)v3 setFailingValidation:v4];
  }
  id v5 = [[TUIKTReportToAppleViewController alloc] initWithContext:v3 staticIdentityManager:0];
  reportToAppleViewController = self->_reportToAppleViewController;
  self->_reportToAppleViewController = v5;

  id location = 0;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__TUIKTPaneViewController__openReportToApple__block_invoke;
  v7[3] = &unk_265553128;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x263EF83A0], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__TUIKTPaneViewController__openReportToApple__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x263F1C7F8]);
    id v3 = [WeakRetained reportToAppleViewController];
    BOOL v4 = (void *)[v2 initWithRootViewController:v3];
    [WeakRetained setReportNavigationController:v4];

    id v5 = [WeakRetained reportNavigationController];
    id v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = -2;
    }
    [v5 setModalPresentationStyle:v8];

    uint64_t v9 = [WeakRetained reportNavigationController];
    [WeakRetained presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_346);
    }
    id v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[TUIKTPaneViewController _openReportToApple]_block_invoke";
      _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

uint64_t __45__TUIKTPaneViewController__openReportToApple__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_openTapToRadar
{
  if ([MEMORY[0x263F20318] isInternalBuild])
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_348_0);
    }
    id v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260338000, v2, OS_LOG_TYPE_DEBUG, "User tapped on 'File a Tap-to-Radar'... Attempting to open Tap-to-Radar.", buf, 2u);
    }
    id v3 = (id)*MEMORY[0x263F80D78];
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F80D40]) initWithApplication:v3];
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [MEMORY[0x263EFF980] array];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__TUIKTPaneViewController__openTapToRadar__block_invoke_350;
    v14[3] = &unk_2655536A8;
    id v7 = v6;
    id v15 = v7;
    uint64_t v8 = v5;
    __int16 v16 = v8;
    [v4 copyDeviceStatus:v3 complete:v14];
    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      id v10 = @"tap-to-radar://new?componentid=986752&ComponentName=Transparency&ComponentVersion=all";
    }
    else
    {
      int v11 = [v7 componentsJoinedByString:@","];
      [NSString stringWithFormat:@"%@&%@=%@", @"tap-to-radar://new?componentid=986752&ComponentName=Transparency&ComponentVersion=all", @"DeviceIDs", v11];
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v12 = [NSURL URLWithString:v10];
    uint64_t v13 = [MEMORY[0x263F01880] defaultWorkspace];
    [v13 openSensitiveURL:v12 withOptions:0];
  }
}

uint64_t __42__TUIKTPaneViewController__openTapToRadar__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __42__TUIKTPaneViewController__openTapToRadar__block_invoke_350(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) idms];
        dispatch_time_t v9 = [v8 pushToken];

        if (v9) {
          [*(id *)(a1 + 32) addObject:v9];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_showOptOutConfirmationAlertWithCompletion:(id)a3
{
  id v22 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_362);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _showOptOutConfirmationAlertWithCompletion:]();
  }
  uint64_t v4 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"TURN_OFF_ALERT_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"TURN_OFF_ALERT_MESSAGE" value:&stru_270C3F140 table:@"Localizable"];
  dispatch_time_t v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  alert = self->_alert;
  self->_alert = v9;

  long long v11 = (void *)MEMORY[0x263F1C3F0];
  long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v13 = [v12 localizedStringForKey:@"TURN_OFF_ALERT_TURN_OFF_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_374;
  v25[3] = &unk_2655536D0;
  v25[4] = self;
  id v14 = v22;
  id v26 = v14;
  uint64_t v15 = [v11 actionWithTitle:v13 style:1 handler:v25];

  __int16 v16 = [MEMORY[0x263F1C550] systemRedColor];
  [v15 _setTitleTextColor:v16];

  [(UIAlertController *)self->_alert addAction:v15];
  uint64_t v17 = (void *)MEMORY[0x263F1C3F0];
  __int16 v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"TURN_OFF_ALERT_KEEP_USING_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_2;
  v23[3] = &unk_2655536D0;
  v23[4] = self;
  id v24 = v14;
  id v20 = v14;
  id v21 = [v17 actionWithTitle:v19 style:0 handler:v23];

  [(UIAlertController *)self->_alert addAction:v21];
  [(UIAlertController *)self->_alert setPreferredAction:v21];
  [(TUIKTPaneViewController *)self presentViewController:self->_alert animated:1 completion:0];
}

uint64_t __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_374(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlert:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlert:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_showResetConfirmationAlertWithCompletion:(id)a3
{
  id v22 = a3;
  uint64_t v4 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"RESET_CONTACT_KEY_VERIFICATION_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"RESET_CONTACT_KEY_VERIFICATION_MESSAGE" value:&stru_270C3F140 table:@"Localizable"];
  dispatch_time_t v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  alert = self->_alert;
  self->_alert = v9;

  long long v11 = (void *)MEMORY[0x263F1C3F0];
  long long v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v13 = [v12 localizedStringForKey:@"RESET_CONTACT_KEY_VERIFICATION_RESET_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke;
  v25[3] = &unk_2655536D0;
  v25[4] = self;
  id v14 = v22;
  id v26 = v14;
  uint64_t v15 = [v11 actionWithTitle:v13 style:1 handler:v25];

  __int16 v16 = [MEMORY[0x263F1C550] systemRedColor];
  [v15 _setTitleTextColor:v16];

  [(UIAlertController *)self->_alert addAction:v15];
  uint64_t v17 = (void *)MEMORY[0x263F1C3F0];
  __int16 v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"RESET_CONTACT_KEY_VERIFICATION_KEEP_USING_BUTTON" value:&stru_270C3F140 table:@"Localizable"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke_2;
  v23[3] = &unk_2655536D0;
  v23[4] = self;
  id v24 = v14;
  id v20 = v14;
  id v21 = [v17 actionWithTitle:v19 style:0 handler:v23];

  [(UIAlertController *)self->_alert addAction:v21];
  [(UIAlertController *)self->_alert setPreferredAction:v21];
  [(TUIKTPaneViewController *)self presentViewController:self->_alert animated:1 completion:0];
}

uint64_t __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlert:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlert:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)_createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  id v14 = (void *)MEMORY[0x263F5FC40];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = [v14 groupSpecifierWithID:a3 name:a4];
  [(TUIKTPaneViewController *)self _setFooterTextWithLinkForSpecifier:v19 footerText:v18 linkText:v17 actionMethodName:v16 target:v15];

  return v19;
}

- (void)_setFooterTextWithLinkForSpecifier:(id)a3 footerText:(id)a4 linkText:(id)a5 actionMethodName:(id)a6 target:(id)a7
{
  long long v11 = NSString;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v23 = [v11 stringWithFormat:@"%@ %@", a4, v14];
  [v15 setProperty:v23 forKey:*MEMORY[0x263F600F8]];
  id v16 = (objc_class *)objc_opt_class();
  id v17 = NSStringFromClass(v16);
  [v15 setProperty:v17 forKey:*MEMORY[0x263F600C0]];

  [v15 setProperty:v23 forKey:*MEMORY[0x263F600E8]];
  NSUInteger v18 = [v23 rangeOfString:v14];
  NSUInteger v20 = v19;

  v25.id location = v18;
  v25.length = v20;
  id v21 = NSStringFromRange(v25);
  [v15 setProperty:v21 forKey:*MEMORY[0x263F600D0]];

  id v22 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v12];

  [v15 setProperty:v22 forKey:*MEMORY[0x263F600E0]];
  [v15 setProperty:v13 forKey:*MEMORY[0x263F600C8]];
}

- (void)_startSpinnerForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:*MEMORY[0x263F602B0]];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [v3 startAnimating];
  [v4 setAccessoryView:v3];
}

- (void)_stopSpinnerForSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:*MEMORY[0x263F602B0]];
  [v3 setAccessoryView:0];
}

- (BOOL)_shouldShowErrorUI
{
  return [(TUIKTStateManager *)self->_stateManager isErrorState]
      || [(TUIKTStateManager *)self->_stateManager optIn] == 1
      && [(TUIKTPaneViewController *)self _reportableFailureFound];
}

- (BOOL)_reportableFailureFound
{
  return [(TUIKTStateManager *)self->_stateManager recentFailedEventIdsCount] != 0;
}

- (void)_dismissPendingAlert
{
  id location = 0;
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke;
  v2[3] = &unk_265553128;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained alert];

    if (v3)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_400);
      }
      id v4 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
        __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_cold_1(v4, v2);
      }
      uint64_t v5 = [v2 alert];
      [v5 dismissViewControllerAnimated:1 completion:0];

      [v2 setAlert:0];
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_397);
    }
    uint64_t v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[TUIKTPaneViewController _dismissPendingAlert]_block_invoke";
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_398()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_handleLaunchURL
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 1392);
  int v4 = 136315650;
  uint64_t v5 = "-[TUIKTPaneViewController _handleLaunchURL]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  OUTLINED_FUNCTION_4_0(&dword_260338000, a2, a3, "%s %{public}@ on %{public}@", (uint8_t *)&v4);
}

uint64_t __43__TUIKTPaneViewController__handleLaunchURL__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_403(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained handleURLResourceDictionary];
    int v4 = [v3 objectForKeyedSubscript:@"id"];

    if (v4)
    {
      if ([v4 isEqualToString:@"STATUS"]) {
        [v2 setHandleURLResourceDictionary:0];
      }
      if ([v4 isEqualToString:@"PUBLIC_VERIFICATION_CODE"])
      {
        uint64_t v5 = [v2 accountKeySpecifierProvider];

        if (v5)
        {
          [v2 setHandleURLResourceDictionary:0];
          __int16 v6 = [v2 accountKeySpecifierProvider];
          [v6 setIsExpanded:1];
        }
      }
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_417);
      }
      __int16 v8 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
        __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_403_cold_1(v8, v2);
      }
      uint64_t v9 = [v2 appleIDSpecifier];

      if (v9)
      {
        [v2 setHandleURLResourceDictionary:0];
        [v2 _updateAppleID];
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_405);
    }
    uint64_t v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      long long v11 = "-[TUIKTPaneViewController _handleLaunchURL]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_415()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)presentOptInNavigationController
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __59__TUIKTPaneViewController_presentOptInNavigationController__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __59__TUIKTPaneViewController_presentOptInNavigationController__block_invoke_420(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained optInNavigationController];
    [v2 presentViewController:v3 animated:1 completion:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_422);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      __int16 v6 = "-[TUIKTPaneViewController presentOptInNavigationController]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __59__TUIKTPaneViewController_presentOptInNavigationController__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)optInFlowResultWithStateUpdate
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_424);
  }
  uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_260378E2D, buf, 2u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_425;
  block[3] = &unk_265553128;
  objc_copyWeak(&v5, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

uint64_t __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_425(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _checkKTStatus:0];
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_430);
    }
    uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_INFO, "Attempting to reload specifiers in transparency pane...", (uint8_t *)&v5, 2u);
    }
    [v2 reloadSpecifiers];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_427);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      __int16 v6 = "-[TUIKTPaneViewController optInFlowResultWithStateUpdate]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_428()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(TUIKTPaneViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else {
    [(TUIKTPaneViewController *)self showViewController:v6 sender:v7];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_432);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __71__TUIKTPaneViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_434);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __71__TUIKTPaneViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_436);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController reloadSpecifiersForProvider:oldSpecifiers:animated:]();
  }
  if ([v9 count])
  {
    int v10 = [v8 specifiers];
    [(TUIKTPaneViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v10 animated:v5];
  }
  else
  {
    [(TUIKTPaneViewController *)self reloadSpecifiers];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_topGroupSpecifier) {
    [(TUIKTPaneViewController *)self _updateTopGroupSpecifierFooter:v5];
  }
}

uint64_t __78__TUIKTPaneViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_438);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController validateDataclassAccessForProvider:specifier:completion:]();
  }
}

uint64_t __83__TUIKTPaneViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 loadRequest:(id)a4 withIdentifier:(id)a5 specifier:(id)a6
{
}

- (void)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_deviceDetailsButtonSpecifier)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_440);
    }
    long long v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:specifier:]";
      __int16 v17 = 2114;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = self;
      _os_log_debug_impl(&dword_260338000, v11, OS_LOG_TYPE_DEBUG, "%s another request is runnning, ignoring request = %{public}@, identifier = %{public}@ on %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_deviceDetailsButtonSpecifier, a5);
    [(TUIKTPaneViewController *)self _startSpinnerForSpecifier:v10];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke_441;
    v14[3] = &unk_2655536F8;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v12 = [(TUIKTPaneViewController *)self _loadRemoteRequest:v8 withIdentifier:v9 preparation:0 completion:v14];
    activeRemoteUIController = self->_activeRemoteUIController;
    self->_activeRemoteUIController = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke_441(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained deviceDetailsButtonSpecifier];
    [v2 _stopSpinnerForSpecifier:v3];

    [v2 setDeviceDetailsButtonSpecifier:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_443);
    }
    uint64_t v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:specifier:]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 preparation:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a5;
  id v13 = a6;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_445);
  }
  id v14 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v28 = "-[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:preparation:completion:]";
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    id v32 = v11;
    __int16 v33 = 2114;
    v34 = self;
    _os_log_debug_impl(&dword_260338000, v14, OS_LOG_TYPE_DEBUG, "%s request = %{public}@, identifier = %{public}@ on %{public}@", buf, 0x2Au);
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x263F25D30]) initWithIdentifier:v11];
  [v15 setDelegate:self];
  id v16 = [(TUIKTPaneViewController *)self navigationController];
  [v15 setNavigationController:v16];

  if (v12) {
    v12[2](v12, v15);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_447;
  v23[3] = &unk_265553770;
  id v26 = v13;
  id v17 = v15;
  id v24 = v17;
  id v25 = v10;
  id v18 = v10;
  id v19 = v13;
  [(TUIKTPaneViewController *)self _getServerUILoadDelegateWithCompletion:v23];
  id v20 = v25;
  id v21 = v17;

  return v21;
}

uint64_t __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_447(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_2;
    v10[3] = &unk_265553748;
    id v11 = v7;
    id v12 = *(id *)(a1 + 48);
    [v11 loadRequest:v8 completion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
}

void __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_449);
  }
  id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v7;
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_DEBUG, "%@ done loading request with success %d. Error: %@", buf, 0x1Cu);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_450;
  v10[3] = &unk_265553720;
  id v8 = *(id *)(a1 + 40);
  char v14 = a2;
  id v13 = v8;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_3()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_450(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_453);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController remoteUIController:createPageWithName:attributes:]();
  }
  id v10 = objc_alloc_init(MEMORY[0x263F25D28]);
  [v10 setHidesBottomBarWhenPushed:1];

  return v10;
}

uint64_t __76__TUIKTPaneViewController_remoteUIController_createPageWithName_attributes___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_456);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController remoteUIController:didRefreshObjectModel:]();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(TUIKTPaneViewController *)self _handleObjectModelChangeForController:v6 objectModel:v7 isModal:0];
  }
}

uint64_t __68__TUIKTPaneViewController_remoteUIController_didRefreshObjectModel___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_458);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController remoteUIController:willPresentObjectModel:modally:]();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(TUIKTPaneViewController *)self _handleObjectModelChangeForController:v8 objectModel:v9 isModal:v5];
  }
}

uint64_t __77__TUIKTPaneViewController_remoteUIController_willPresentObjectModel_modally___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_460);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController remoteUIController:shouldLoadRequest:redirectResponse:]();
  }
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate processResponse:v10];
  id v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"fmip1", @"prefs", @"itms", 0);
  id v12 = [v9 URL];
  id v13 = [v12 scheme];
  int v14 = [v11 containsObject:v13];

  if (v14)
  {
    id v15 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v16 = [v9 URL];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke_471;
    v18[3] = &unk_265553798;
    id v19 = v9;
    [v15 openURL:v16 configuration:0 completionHandler:v18];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TUIKTPaneViewController *)self _attemptUpdateAuthControllerWithActionableResponse:v10];
    }
    [(TUIKTPaneViewController *)self _addHeadersToRequest:v9];
  }

  return v14 ^ 1;
}

uint64_t __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke_471(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_473);
    }
    id v7 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v10 = [v8 URL];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_ERROR, "TUIKTPaneViewController shouldLoadRequest failed to open URL: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

uint64_t __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_477);
  }
  int v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 136316162;
    *(void *)&location[4] = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]";
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = self;
    _os_log_debug_impl(&dword_260338000, v11, OS_LOG_TYPE_DEBUG, "%s controller = %{public}@, error = %{public}@, request = %{public}@ on %{public}@", location, 0x34u);
  }
  if (+[TUIUtils isAuthError:v9])
  {
    *(void *)id location = 0;
    objc_initWeak((id *)location, self);
    id v12 = [(TUIKTPaneViewController *)self appleAccountManager];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_478;
    v13[3] = &unk_2655537C0;
    objc_copyWeak(&v16, (id *)location);
    id v14 = v8;
    id v15 = v10;
    [v12 silentRenewAppleAccountWithCompletionHandler:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }
}

uint64_t __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_478(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_480);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_483);
  }
  id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke_2";
    __int16 v14 = 2048;
    uint64_t v15 = a2;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = WeakRetained;
    _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s device details remote UI: silent renew uint64_t result = %ld, error = %{public}@ on %{public}@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, WeakRetained);
  id v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_484;
  v11[3] = &unk_2655536F8;
  objc_copyWeak(&v12, (id *)buf);
  [v10 loadRequest:v9 completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

uint64_t __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_481()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_484(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_487);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke";
      _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_490);
  }
  id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315906;
    id v10 = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = WeakRetained;
    _os_log_debug_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, "%s device details remote UI: retry loadRequest uint64_t result = %d, error = %{public}@ on %{public}@", (uint8_t *)&v9, 0x26u);
  }
}

uint64_t __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_2_485()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_488()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_493);
  }
  __int16 v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136316162;
    __int16 v13 = "-[TUIKTPaneViewController remoteUIController:didReceiveHTTPResponse:forRequest:]";
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = self;
    _os_log_debug_impl(&dword_260338000, v11, OS_LOG_TYPE_DEBUG, "%s controller = %{public}@, response = %{public}@, request = %{public}@ on %{public}@", (uint8_t *)&v12, 0x34u);
  }
}

uint64_t __80__TUIKTPaneViewController_remoteUIController_didReceiveHTTPResponse_forRequest___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_495);
  }
  id v10 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v20 = v10;
    id v21 = [v9 identifier];
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[TUIKTPaneViewController _handleObjectModelChangeForController:objectModel:isModal:]";
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    __int16 v29 = v21;
    __int16 v30 = 2114;
    __int16 v31 = self;
    _os_log_debug_impl(&dword_260338000, v20, OS_LOG_TYPE_DEBUG, "%s controller = %{public}@, model: %{public}@ on %{public}@", location, 0x2Au);
  }
  objc_storeStrong((id *)&self->_currentObjectModel, a4);
  __int16 v11 = [v9 defaultPages];
  int v12 = [v11 firstObject];
  __int16 v13 = [v12 navigationItem];

  __int16 v14 = [v13 leftBarButtonItems];
  LODWORD(v12) = [v14 count] == 0;

  if (v12)
  {
    if (v5)
    {
      id v16 = objc_alloc(MEMORY[0x263F1C468]);
      id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      __int16 v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_270C3F140 table:@"Localizable"];
      id v19 = (void *)[v16 initWithTitle:v18 style:0 target:self action:sel__cancelButtonForRemoteObjectModelWasTapped_];
      [v13 setLeftBarButtonItem:v19];
    }
  }
  else
  {
    *(void *)id location = 0;
    objc_initWeak((id *)location, v8);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke_502;
    v22[3] = &unk_2655537E8;
    objc_copyWeak(&v23, (id *)location);
    uint64_t v15 = *MEMORY[0x263F28EC8];
    BOOL v24 = v5;
    [v8 setHandlerForButtonName:v15 handler:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
}

uint64_t __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke_502(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28EF0]];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F28ED0]];

    if (v8)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        id v9 = (id)[WeakRetained dismissObjectModelsAnimated:1 completion:0];
      }
      else
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_504);
        }
        id v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)__int16 v11 = 0;
          _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "Cancel action received for a non-modal flow", v11, 2u);
        }
      }
    }
  }
}

uint64_t __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_507);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController remoteUIController:didReceiveObjectModel:actionSignal:]();
  }
  id v9 = [v8 clientInfo];
  id v10 = v9;
  if (v9)
  {
    __int16 v11 = [v9 objectForKey:*MEMORY[0x263F63818]];
    if ([v11 isEqualToString:@"update:trustedDevicesSummary"])
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_513);
      }
      int v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_260338000, v12, OS_LOG_TYPE_DEBUG, "Server request client to update trusted devices list", v13, 2u);
      }
      [(TUIDeviceSpecifierProvider *)self->_deviceSpecifierProvider refreshDeviceList];
    }
  }
}

uint64_t __81__TUIKTPaneViewController_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __81__TUIKTPaneViewController_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke_511()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_515);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _cancelButtonForRemoteObjectModelWasTapped:]();
  }
  id v5 = (id)[(AAUIRemoteUIController *)self->_activeRemoteUIController dismissObjectModelsAnimated:1 completion:0];
}

uint64_t __70__TUIKTPaneViewController__cancelButtonForRemoteObjectModelWasTapped___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_addHeadersToRequest:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_517);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _addHeadersToRequest:]();
  }
  id v5 = [(TUIKTPaneViewController *)self _grandSlamAccount];
  id v6 = [(TUIKTPaneViewController *)self _accountStore];
  id v7 = [v6 credentialForAccount:v5 serviceID:*MEMORY[0x263F256C8]];

  id v8 = [v7 token];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate setServiceToken:v8];
  [(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate signRequest:v4];
  id v9 = objc_msgSend(v5, "aida_dsid");
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v9);

  objc_msgSend(v4, "aa_addAppProvidedContext:", @"transparency");
}

uint64_t __48__TUIKTPaneViewController__addHeadersToRequest___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_authController
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_522);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _authController]();
  }
  authController = self->_authController;
  if (!authController)
  {
    id v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
    id v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

uint64_t __42__TUIKTPaneViewController__authController__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_attemptUpdateAuthControllerWithActionableResponse:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_525);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _attemptUpdateAuthControllerWithActionableResponse:]();
  }
  if ([(AKAppleIDServerResourceLoadDelegate *)self->_serverUILoadDelegate isResponseActionable:v4])
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_528);
    }
    id v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "Final Apple ID settings UI server response! Informing AuthKit...", buf, 2u);
    }
    id v6 = [(TUIKTPaneViewController *)self _grandSlamAccount];
    id v7 = objc_alloc_init(MEMORY[0x263F29110]);
    id v8 = objc_msgSend(v6, "aida_alternateDSID");
    [v7 setAltDSID:v8];

    [v7 setAnticipateEscrowAttempt:1];
    id v9 = [v6 username];
    [v7 setUsername:v9];

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    __int16 v11 = [(TUIKTPaneViewController *)self _authController];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_530;
    v13[3] = &unk_265553810;
    dispatch_semaphore_t v14 = v10;
    int v12 = v10;
    [v11 updateStateWithExternalAuthenticationResponse:v4 forContext:v7 completion:v13];

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

uint64_t __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_526()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_530(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_535);
    }
    uint64_t v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      id v7 = "Successfully passed on auth response to AuthKit.";
      id v8 = v6;
      uint32_t v9 = 2;
LABEL_10:
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_532);
    }
    uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v5;
      id v7 = "Failed to inform AuthKit of auth response! Error: %@.";
      id v8 = v10;
      uint32_t v9 = 12;
      goto LABEL_10;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_533()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, AKAppleIDServerResourceLoadDelegate *, void))a3;
  if (self->_serverUILoadDelegate)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_537);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      -[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:]();
      if (!v4) {
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    if (v4) {
LABEL_6:
    }
      v4[2](v4, self->_serverUILoadDelegate, 0);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_540);
    }
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
      -[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:]();
    }
    id v5 = [(TUIKTPaneViewController *)self _grandSlamAccount];
    id v6 = objc_alloc_init(MEMORY[0x263F29110]);
    id v7 = objc_msgSend(v5, "aida_alternateDSID");
    [v6 setAltDSID:v7];

    [v6 setAnticipateEscrowAttempt:1];
    id v8 = [(TUIKTPaneViewController *)self _authController];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_541;
    v9[3] = &unk_265553860;
    v9[4] = self;
    uint64_t v10 = v4;
    [v8 getServerUILoadDelegateWithContext:v6 completion:v9];
  }
LABEL_12:
}

uint64_t __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_538()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_541(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_543);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
      __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_541_cold_1((uint64_t)v6, a1, v7);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_544;
  v12[3] = &unk_265553838;
  uint64_t v8 = *(void *)(a1 + 32);
  uint32_t v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_544(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(a1[5] + 1472), v2);
  }
  uint64_t result = a1[7];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_accountStore
{
  return (id)[(AIDAAccountManager *)self->_accountManager accountStore];
}

- (id)_appleAccount
{
  uint64_t v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (id)_grandSlamAccount
{
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    id v4 = [(TUIKTPaneViewController *)self _appleAccount];

    if (v4)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_546);
      }
      id v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "Fetching grandslam account from apple account", buf, 2u);
      }
      id v6 = [(TUIKTPaneViewController *)self _accountStore];
      id v7 = [(TUIKTPaneViewController *)self _appleAccount];
      objc_msgSend(v6, "aida_accountForiCloudAccount:", v7);
      uint64_t v8 = (ACAccount *)objc_claimAutoreleasedReturnValue();
      uint32_t v9 = self->_grandSlamAccount;
      self->_grandSlamAccount = v8;
    }
    grandSlamAccount = self->_grandSlamAccount;
    if (!grandSlamAccount)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_549);
      }
      id v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "Could not fetch GrandSlam Account, we're destined for failure!", v12, 2u);
      }
      grandSlamAccount = self->_grandSlamAccount;
    }
  }
  return grandSlamAccount;
}

uint64_t __44__TUIKTPaneViewController__grandSlamAccount__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __44__TUIKTPaneViewController__grandSlamAccount__block_invoke_547()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_grandSlamSigner
{
  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    id v4 = objc_alloc(MEMORY[0x263F25878]);
    id v5 = [(TUIKTPaneViewController *)self _accountStore];
    id v6 = [(TUIKTPaneViewController *)self _grandSlamAccount];
    id v7 = (AAGrandSlamSigner *)[v4 initWithAccountStore:v5 grandSlamAccount:v6 appTokenID:*MEMORY[0x263F256D0]];
    uint64_t v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (void)_updateTopGroupSpecifierFooter:(BOOL)a3
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_552);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTPaneViewController _updateTopGroupSpecifierFooter:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke_553;
  block[3] = &unk_265553680;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke_553(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained stateManager];
    if ([v4 state] == 4)
    {
      id v5 = [v3 stateManager];
      uint64_t v6 = [v5 expectedResolutionDays];

      if (v6)
      {
        BOOL v7 = NSString;
        uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint32_t v9 = [v8 localizedStringForKey:@"TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER_WITH_DAYS" value:&stru_270C3F140 table:@"Localizable"];
        id v10 = [v3 stateManager];
        uint64_t v11 = objc_msgSend(v7, "localizedStringWithFormat:", v9, objc_msgSend(v10, "expectedResolutionDays"));
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER" value:&stru_270C3F140 table:@"Localizable"];

    if (!+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
    {
LABEL_13:
      id v15 = [v3 topGroupSpecifier];
      id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = [v16 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
      [v3 _setFooterTextWithLinkForSpecifier:v15 footerText:v14 linkText:v17 actionMethodName:@"_learnMoreTapped" target:v3];

      __int16 v18 = [v3 topGroupSpecifier];
      [v3 reloadSpecifier:v18 animated:*(unsigned __int8 *)(a1 + 40)];

      goto LABEL_14;
    }
    id v10 = [v14 stringByAppendingString:@" "];

    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint32_t v9 = [v8 localizedStringForKey:@"REPORT_TO_APPLE_FOOTER" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v11 = [v10 stringByAppendingString:v9];
LABEL_12:
    uint64_t v14 = (void *)v11;

    goto LABEL_13;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_555);
  }
  id v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v20 = "-[TUIKTPaneViewController _updateTopGroupSpecifierFooter:]_block_invoke";
    _os_log_impl(&dword_260338000, v12, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_14:
}

uint64_t __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)activeConnectionChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = 136315650;
  id v5 = "-[TUIKTPaneViewController activeConnectionChanged]";
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_260338000, log, OS_LOG_TYPE_DEBUG, "%s hasActiveConnection = %d on %{public}@", (uint8_t *)&v4, 0x1Cu);
}

uint64_t __50__TUIKTPaneViewController_activeConnectionChanged__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSDictionary)handleURLResourceDictionary
{
  return self->_handleURLResourceDictionary;
}

- (void)setHandleURLResourceDictionary:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (UINavigationController)optInNavigationController
{
  return self->_optInNavigationController;
}

- (void)setOptInNavigationController:(id)a3
{
}

- (TUIOptInFlowControllerImpl)optInFlowController
{
  return self->_optInFlowController;
}

- (void)setOptInFlowController:(id)a3
{
}

- (TUIKTReportToAppleViewController)reportToAppleViewController
{
  return self->_reportToAppleViewController;
}

- (void)setReportToAppleViewController:(id)a3
{
}

- (TUIDeviceSpecifierProvider)deviceSpecifierProvider
{
  return self->_deviceSpecifierProvider;
}

- (void)setDeviceSpecifierProvider:(id)a3
{
}

- (TUIAccountKeySpecifierProvider)accountKeySpecifierProvider
{
  return self->_accountKeySpecifierProvider;
}

- (void)setAccountKeySpecifierProvider:(id)a3
{
}

- (KTStatus)keyTransparencyStatus
{
  return self->_keyTransparencyStatus;
}

- (void)setKeyTransparencyStatus:(id)a3
{
}

- (AAUIRemoteUIController)activeRemoteUIController
{
  return self->_activeRemoteUIController;
}

- (void)setActiveRemoteUIController:(id)a3
{
}

- (AKAppleIDAuthenticationController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (AKAppleIDServerResourceLoadDelegate)serverUILoadDelegate
{
  return self->_serverUILoadDelegate;
}

- (void)setServerUILoadDelegate:(id)a3
{
}

- (ACAccount)grandSlamAccount
{
  return self->_grandSlamAccount;
}

- (void)setGrandSlamAccount:(id)a3
{
}

- (AAGrandSlamSigner)grandSlamSigner
{
  return self->_grandSlamSigner;
}

- (void)setGrandSlamSigner:(id)a3
{
}

- (RUIObjectModel)currentObjectModel
{
  return self->_currentObjectModel;
}

- (void)setCurrentObjectModel:(id)a3
{
}

- (UINavigationController)reportNavigationController
{
  return self->_reportNavigationController;
}

- (void)setReportNavigationController:(id)a3
{
}

- (TUINetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (KTOptInManager)optInManager
{
  return self->_optInManager;
}

- (void)setOptInManager:(id)a3
{
}

- (PSSpecifier)appleIDSpecifier
{
  return self->_appleIDSpecifier;
}

- (void)setAppleIDSpecifier:(id)a3
{
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (PSSpecifier)topGroupSpecifier
{
  return self->_topGroupSpecifier;
}

- (void)setTopGroupSpecifier:(id)a3
{
}

- (UIAlertController)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (PSSpecifier)deviceDetailsButtonSpecifier
{
  return self->_deviceDetailsButtonSpecifier;
}

- (void)setDeviceDetailsButtonSpecifier:(id)a3
{
}

- (TUIAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (void)setAppleAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_deviceDetailsButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_topGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_appleIDSpecifier, 0);
  objc_storeStrong((id *)&self->_optInManager, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_reportNavigationController, 0);
  objc_storeStrong((id *)&self->_currentObjectModel, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_serverUILoadDelegate, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_activeRemoteUIController, 0);
  objc_storeStrong((id *)&self->_keyTransparencyStatus, 0);
  objc_storeStrong((id *)&self->_accountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_reportToAppleViewController, 0);
  objc_storeStrong((id *)&self->_optInFlowController, 0);
  objc_storeStrong((id *)&self->_optInNavigationController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
}

- (void)viewWillAppear:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)viewDidAppear:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)viewWillDisappear:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)viewDidDisappear:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateNoError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateNoIDSAppleID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateCDPWaiting:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateDeviceError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateOtherError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateCDPError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateTemporaryError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateTreeReset:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateOptInPendingCDPError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateOptInPendingCDPWaiting:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_setupUIStateIDSDisabled:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)specifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 1536);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 stateDescription];
  uint64_t v6 = *(void *)(a1 + (int)*MEMORY[0x263F5FDB8]);
  int v7 = 136315906;
  __int16 v8 = "-[TUIKTPaneViewController specifiers]";
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = a1;
  _os_log_debug_impl(&dword_260338000, v4, OS_LOG_TYPE_DEBUG, "%s %{public}@, specifiers = %{public}@ on %{public}@", (uint8_t *)&v7, 0x2Au);
}

- (void)_getDeviceVerificationEnabledForSpecifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_260338000, a2, a3, "%{public}@ trying update the switch cell that is not there, %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_getDeviceVerificationEnabledForSpecifier:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 1536);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 stateDescription];
  [*(id *)(a1 + 1536) isVerifyCDPRunning];
  v6[0] = 136315906;
  OUTLINED_FUNCTION_5_0();
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_260338000, v4, OS_LOG_TYPE_DEBUG, "%s %{public}@, isVerifyCDPRunning = %d on %{public}@", (uint8_t *)v6, 0x26u);
}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_200_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ CDP repair UI dismissed", (uint8_t *)&v3, 0xCu);
}

- (void)_changeOptInState:(uint64_t)a3 requestedOptInChange:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSNumber;
  uint64_t v6 = a1;
  uint64_t v7 = [v5 numberWithUnsignedInteger:a2];
  int v9 = 136315650;
  uint64_t v10 = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]";
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  OUTLINED_FUNCTION_4_0(&dword_260338000, v6, v8, "%s requestedOptInChange = %{public}@ on %{public}@", (uint8_t *)&v9);
}

- (void)_setDeviceVerificationEnabled:(uint64_t)a1 withSpecifier:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = (id *)(a1 + 1536);
  uint64_t v4 = *(void **)(a1 + 1536);
  uint64_t v5 = a2;
  uint64_t v6 = [v4 stateDescription];
  [*v3 isVerifyCDPRunning];
  v7[0] = 136315906;
  OUTLINED_FUNCTION_5_0();
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_260338000, v5, OS_LOG_TYPE_DEBUG, "%s %{public}@, isVerifyCDPRunning = %d on %{public}@", (uint8_t *)v7, 0x26u);
}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_339_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_260338000, a2, a3, "%{public}@ trying update the switch cell that is not there, %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_showOptOutConfirmationAlertWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

void __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 alert];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_260338000, v3, v5, "%s alert = %{public}@ on %{public}@", (uint8_t *)v6);
}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_403_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 appleIDSpecifier];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_260338000, v3, v5, "%s appleIDSpecifier = %{public}@ on %{public}@", (uint8_t *)v6);
}

- (void)reloadSpecifiersForProvider:oldSpecifiers:animated:.cold.1()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "-[TUIKTPaneViewController reloadSpecifiersForProvider:oldSpecifiers:animated:]";
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s reloading specifiers for provider %@ on %{public}@", (void)v2, DWORD2(v2));
}

- (void)validateDataclassAccessForProvider:specifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s not implemented on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)remoteUIController:createPageWithName:attributes:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
}

- (void)remoteUIController:didRefreshObjectModel:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
}

- (void)remoteUIController:willPresentObjectModel:modally:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
}

- (void)remoteUIController:shouldLoadRequest:redirectResponse:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
}

- (void)remoteUIController:didReceiveObjectModel:actionSignal:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
}

- (void)_cancelButtonForRemoteObjectModelWasTapped:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_addHeadersToRequest:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s request = %{public}@ on %{public}@", v2);
}

- (void)_authController
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_attemptUpdateAuthControllerWithActionableResponse:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_getServerUILoadDelegateWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s Starting to fetch AKAppleIDServerResourceLoadDelegate on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_getServerUILoadDelegateWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s AKAppleIDServerResourceLoadDelegate cache available on %{public}@", v2, v3, v4, v5, 2u);
}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_541_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_6(&dword_260338000, a2, a3, "%s Error! Unable to get AKAppleIDServerResourceLoadDelegate. %@ on %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a2 + 32));
}

- (void)_updateTopGroupSpecifierFooter:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

@end