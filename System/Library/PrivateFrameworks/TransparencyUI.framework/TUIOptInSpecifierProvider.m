@interface TUIOptInSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)_reportableFailureFound;
- (BOOL)_shouldShowErrorUI;
- (BOOL)handleURL:(id)a3;
- (KTOptInManager)optInManager;
- (KTStatus)keyTransparencyStatus;
- (NSArray)specifiers;
- (NSDictionary)handleURLResourceDictionary;
- (TUIKTPaneViewController)paneViewController;
- (TUIKTStateManager)stateManager;
- (TUIOptInSpecifierProvider)initWithAccountManager:(id)a3;
- (id)_transparencyPaneSpecifier;
- (void)_beginObservingTransparencyStatusChangedNotification;
- (void)_checkKTStatus;
- (void)_showTransparencyPane;
- (void)_stopObservingTransparencyStatusChangedNotification;
- (void)_transparencyStatusChangedNotificationHandler:(id)a3;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandleURLResourceDictionary:(id)a3;
- (void)setKeyTransparencyStatus:(id)a3;
- (void)setOptInManager:(id)a3;
- (void)setPaneViewController:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStateManager:(id)a3;
- (void)specifiers;
@end

@implementation TUIOptInSpecifierProvider

- (TUIOptInSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_4);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInSpecifierProvider initWithAccountManager:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)TUIOptInSpecifierProvider;
  v6 = [(TUIOptInSpecifierProvider *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    id v8 = objc_alloc(MEMORY[0x263F80D28]);
    uint64_t v9 = *MEMORY[0x263F80D78];
    uint64_t v10 = [v8 initWithApplication:*MEMORY[0x263F80D78]];
    optInManager = v7->_optInManager;
    v7->_optInManager = (KTOptInManager *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F80D38]) initWithApplication:v9];
    keyTransparencyStatus = v7->_keyTransparencyStatus;
    v7->_keyTransparencyStatus = (KTStatus *)v12;

    uint64_t v14 = objc_opt_new();
    stateManager = v7->_stateManager;
    v7->_stateManager = (TUIKTStateManager *)v14;

    [(TUIOptInSpecifierProvider *)v7 _checkKTStatus];
    [(TUIOptInSpecifierProvider *)v7 _beginObservingTransparencyStatusChangedNotification];
  }

  return v7;
}

uint64_t __52__TUIOptInSpecifierProvider_initWithAccountManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __36__TUIOptInSpecifierProvider_dealloc__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (BOOL)handleURL:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_38);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG)) {
    -[TUIOptInSpecifierProvider handleURL:]();
  }
  uint64_t v5 = (NSDictionary *)[v4 copy];
  handleURLResourceDictionary = self->_handleURLResourceDictionary;
  self->_handleURLResourceDictionary = v5;

  return 0;
}

uint64_t __39__TUIOptInSpecifierProvider_handleURL___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_checkKTStatus
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_40);
  }
  uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[TUIOptInSpecifierProvider _checkKTStatus]";
    __int16 v8 = 2114;
    uint64_t v9 = self;
    _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_DEFAULT, "%s getting CKV status on %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_41;
  block[3] = &unk_265553128;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

uint64_t __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_41(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x263F80D38]);
    uint64_t v3 = (void *)[v2 initWithApplication:*MEMORY[0x263F80D78]];
    id v11 = 0;
    id v4 = [v3 status:&v11];
    id v5 = v11;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_46);
    }
    id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = WeakRetained;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ got CKV status = %{public}@, error = %{public}@", buf, 0x20u);
    }
    v7 = [WeakRetained stateManager];
    [v7 updateStateWithKTStatusResult:v4];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_47;
    v9[3] = &unk_265553128;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_async(MEMORY[0x263EF83A0], v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_43_0);
    }
    __int16 v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[TUIOptInSpecifierProvider _checkKTStatus]_block_invoke";
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_44()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_47(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained reloadSpecifiers];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_50);
    }
    uint64_t v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "-[TUIOptInSpecifierProvider _checkKTStatus]_block_invoke";
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_2_48()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_beginObservingTransparencyStatusChangedNotification
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __81__TUIOptInSpecifierProvider__beginObservingTransparencyStatusChangedNotification__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_stopObservingTransparencyStatusChangedNotification
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __80__TUIOptInSpecifierProvider__stopObservingTransparencyStatusChangedNotification__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_transparencyStatusChangedNotificationHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_59);
  }
  uint64_t v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[TUIOptInSpecifierProvider _transparencyStatusChangedNotificationHandler:]";
    __int16 v8 = 2114;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = self;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %{public}@", (uint8_t *)&v6, 0x20u);
  }
  [(TUIOptInSpecifierProvider *)self _checkKTStatus];
}

uint64_t __75__TUIOptInSpecifierProvider__transparencyStatusChangedNotificationHandler___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSArray)specifiers
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_61_0);
  }
  uint64_t v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG)) {
    [(TUIOptInSpecifierProvider *)(uint64_t)self specifiers];
  }
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    int v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TRANSPARENCY_GROUP"];
    [v5 addObject:v6];
    v7 = [(TUIOptInSpecifierProvider *)self _transparencyPaneSpecifier];
    [v5 addObject:v7];

    __int16 v8 = (NSArray *)[v5 copy];
    id v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

uint64_t __39__TUIOptInSpecifierProvider_specifiers__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)reloadSpecifiers
{
  uint64_t v3 = self->_specifiers;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__TUIOptInSpecifierProvider_reloadSpecifiers__block_invoke;
  v6[3] = &unk_265553010;
  v6[4] = self;
  v7 = v3;
  uint64_t v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __45__TUIOptInSpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_68);
  }
  uint64_t v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_260338000, v2, OS_LOG_TYPE_INFO, "%{public}@ attempting to reload specifiers...", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:*(void *)(a1 + 40) animated:1];
}

uint64_t __45__TUIOptInSpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_transparencyPaneSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"DEVICE_VERIFICATION_SPECIFIER_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:2 edit:0];

  [v6 setControllerLoadAction:sel__showTransparencyPane];
  [v6 setIdentifier:@"TRANSPARENCY"];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  uint64_t v7 = *MEMORY[0x263F602C8];
  [v6 setProperty:&stru_270C3F140 forKey:*MEMORY[0x263F602C8]];
  BOOL v8 = [(TUIOptInSpecifierProvider *)self _shouldShowErrorUI];
  stateManager = self->_stateManager;
  if (!v8)
  {
    if ([(TUIKTStateManager *)stateManager optIn] == 2) {
      goto LABEL_12;
    }
    id v11 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [v6 setProperty:v11 forKey:*MEMORY[0x263F602C0]];

    unint64_t v12 = [(TUIKTStateManager *)self->_stateManager optIn];
    __int16 v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v10 = v13;
    if (v12 == 1) {
      uint64_t v14 = @"ACTIVE";
    }
    else {
      uint64_t v14 = @"OFF";
    }
    __int16 v15 = [v13 localizedStringForKey:v14 value:&stru_270C3F140 table:@"Localizable"];
    [v6 setProperty:v15 forKey:v7];

    goto LABEL_11;
  }
  if ([(TUIKTStateManager *)stateManager state] != 6
    && [(TUIKTStateManager *)self->_stateManager state] != 10
    && [(TUIKTStateManager *)self->_stateManager state] != 11)
  {
    __int16 v10 = [(TUIKTStateManager *)self->_stateManager stateLabel];
    [v6 setProperty:v10 forKey:v7];
LABEL_11:
  }
LABEL_12:
  return v6;
}

- (void)_showTransparencyPane
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_260338000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

uint64_t __50__TUIOptInSpecifierProvider__showTransparencyPane__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (BOOL)_shouldShowErrorUI
{
  return [(TUIKTStateManager *)self->_stateManager isErrorState]
      || [(TUIKTStateManager *)self->_stateManager optIn] == 1
      && [(TUIOptInSpecifierProvider *)self _reportableFailureFound];
}

- (BOOL)_reportableFailureFound
{
  return [(TUIKTStateManager *)self->_stateManager recentFailedEventIdsCount] != 0;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (KTOptInManager)optInManager
{
  return self->_optInManager;
}

- (void)setOptInManager:(id)a3
{
}

- (KTStatus)keyTransparencyStatus
{
  return self->_keyTransparencyStatus;
}

- (void)setKeyTransparencyStatus:(id)a3
{
}

- (TUIKTPaneViewController)paneViewController
{
  return self->_paneViewController;
}

- (void)setPaneViewController:(id)a3
{
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (NSDictionary)handleURLResourceDictionary
{
  return self->_handleURLResourceDictionary;
}

- (void)setHandleURLResourceDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_paneViewController, 0);
  objc_storeStrong((id *)&self->_keyTransparencyStatus, 0);
  objc_storeStrong((id *)&self->_optInManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s %{public}@ on %{public}@", v2);
}

- (void)handleURL:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_260338000, v0, v1, "%s %{public}@ on %{public}@", v2);
}

- (void)specifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 56);
  uint64_t v4 = a2;
  uint64_t v5 = [v3 stateDescription];
  uint64_t v6 = *(void *)(a1 + 16);
  int v7 = 136315906;
  BOOL v8 = "-[TUIOptInSpecifierProvider specifiers]";
  __int16 v9 = 2114;
  __int16 v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = a1;
  _os_log_debug_impl(&dword_260338000, v4, OS_LOG_TYPE_DEBUG, "%s %{public}@, specifiers = %{public}@ on %{public}@", (uint8_t *)&v7, 0x2Au);
}

@end