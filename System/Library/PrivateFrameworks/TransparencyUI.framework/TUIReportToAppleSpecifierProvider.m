@interface TUIReportToAppleSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (TUIKTReportToAppleContext)context;
- (TUIReportManager)reportManager;
- (TUIReportToAppleSpecifierProvider)initWithAccountManager:(id)a3;
- (TUIReportToAppleSpecifierProvider)initWithContext:(id)a3 reportManager:(id)a4;
- (UIViewController)presentingViewController;
- (id)_groupSpecifier;
- (id)_reportDetailsSpecifier;
- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8;
- (void)_learnMoreTapped;
- (void)reloadSpecifiers;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setReportManager:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation TUIReportToAppleSpecifierProvider

- (TUIReportToAppleSpecifierProvider)initWithContext:(id)a3 reportManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIReportToAppleSpecifierProvider;
  v9 = [(TUIReportToAppleSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_reportManager, a4);
  }

  return v10;
}

- (TUIReportToAppleSpecifierProvider)initWithAccountManager:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_20);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_ERROR)) {
    -[TUIReportToAppleSpecifierProvider initWithAccountManager:]();
  }

  return 0;
}

uint64_t __60__TUIReportToAppleSpecifierProvider_initWithAccountManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = [(TUIReportToAppleSpecifierProvider *)self _groupSpecifier];
    [v4 addObject:v5];

    v6 = [(TUIReportToAppleSpecifierProvider *)self _reportDetailsSpecifier];
    [v4 addObject:v6];

    id v7 = (NSArray *)[v4 copy];
    id v8 = self->_specifiers;
    self->_specifiers = v7;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)reloadSpecifiers
{
  v3 = self->_specifiers;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_29_0);
    }
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_INFO, "Attempting to reload specifiers...", (uint8_t *)&v6, 2u);
    }
    id v4 = [WeakRetained delegate];
    [v4 reloadSpecifiersForProvider:WeakRetained oldSpecifiers:*(void *)(a1 + 32) animated:1];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_26_0);
    }
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[TUIReportToAppleSpecifierProvider reloadSpecifiers]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke_27()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_groupSpecifier
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"REPORT_TO_APPLE_GROUP_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v6 = [v5 localizedStringForKey:@"REPORT_TO_APPLE_GROUP_FOOTER" value:&stru_270C3F140 table:@"Localizable"];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  v9 = [(TUIReportToAppleSpecifierProvider *)self createGroupSpecifierWithIdentifier:@"TUI_REPORT_TO_APPLE_GROUP" title:v4 footerText:v6 linkText:v8 actionMethodName:@"_learnMoreTapped" target:self];

  return v9;
}

- (void)_learnMoreTapped
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

uint64_t __53__TUIReportToAppleSpecifierProvider__learnMoreTapped__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __53__TUIReportToAppleSpecifierProvider__learnMoreTapped__block_invoke_51(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = objc_opt_new();
    v3 = [WeakRetained presentingViewController];
    [v2 presentWithPresentingViewController:v3];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_53);
    }
    id v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[TUIReportToAppleSpecifierProvider _learnMoreTapped]_block_invoke";
      _os_log_impl(&dword_260338000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __53__TUIReportToAppleSpecifierProvider__learnMoreTapped__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_reportDetailsSpecifier
{
  v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"TUI_REPORT_DETAILS" target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id v4 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F602A8]];

  int v5 = [(TUIReportManager *)self->_reportManager reportData];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F80D88]];

  [v3 setProperty:v6 forKey:*MEMORY[0x263F602C8]];
  [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

  return v3;
}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  v13 = (void *)MEMORY[0x263F5FC40];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  v18 = [v13 groupSpecifierWithID:a3 name:a4];
  v19 = [NSString stringWithFormat:@"%@ %@", v17, v16];

  [v18 setProperty:v19 forKey:*MEMORY[0x263F600F8]];
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  [v18 setProperty:v21 forKey:*MEMORY[0x263F600C0]];

  [v18 setProperty:v19 forKey:*MEMORY[0x263F600E8]];
  NSUInteger v22 = [v19 rangeOfString:v16];
  NSUInteger v24 = v23;

  v29.id location = v22;
  v29.length = v24;
  v25 = NSStringFromRange(v29);
  [v18 setProperty:v25 forKey:*MEMORY[0x263F600D0]];

  v26 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v14];

  [v18 setProperty:v26 forKey:*MEMORY[0x263F600E0]];
  [v18 setProperty:v15 forKey:*MEMORY[0x263F600C8]];

  return v18;
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

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (TUIKTReportToAppleContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (TUIReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_260338000, v0, OS_LOG_TYPE_ERROR, "%s not supported on %{public}@", (uint8_t *)v1, 0x16u);
}

@end