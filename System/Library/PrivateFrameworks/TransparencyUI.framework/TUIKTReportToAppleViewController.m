@interface TUIKTReportToAppleViewController
- (TUIKTReportToAppleViewController)initWithContext:(id)a3;
- (TUIKTReportToAppleViewController)initWithContext:(id)a3 staticIdentityManager:(id)a4;
- (TUIReportManager)reportManager;
- (TUIReportToAppleSpecifierProvider)reportToAppleSpecifierProvider;
- (UIGestureRecognizer)gestureRecognizer;
- (id)_additionalDetailsForSpecifier:(id)a3;
- (id)_additionalDetailsTitleSpecifier;
- (id)_reportToAppleButtonSpecifier;
- (id)_specifiersForAdditionalDetails;
- (id)specifiers;
- (void)_dismiss;
- (void)_dismissKeyboard:(id)a3;
- (void)_reportToApple:(id)a3;
- (void)_send;
- (void)_setAdditionalDetails:(id)a3 withSpecifier:(id)a4;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setGestureRecognizer:(id)a3;
- (void)setReportManager:(id)a3;
- (void)setReportToAppleSpecifierProvider:(id)a3;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TUIKTReportToAppleViewController

- (TUIKTReportToAppleViewController)initWithContext:(id)a3
{
  return [(TUIKTReportToAppleViewController *)self initWithContext:a3 staticIdentityManager:0];
}

- (TUIKTReportToAppleViewController)initWithContext:(id)a3 staticIdentityManager:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_21);
  }
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[TUIKTReportToAppleViewController initWithContext:staticIdentityManager:]";
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@, staticIdentityManager = %{public}@ on %{public}@", buf, 0x2Au);
  }
  v10 = [(TUIKTReportToAppleViewController *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a3);
    if (!v8)
    {
      id v8 = (id)objc_opt_new();
      [v8 requestSelfAccountKey];
    }
    v12 = [[TUIReportManager alloc] initWithStaticIdentityManager:v8];
    reportManager = v11->_reportManager;
    v11->_reportManager = v12;

    uint64_t v17 = objc_opt_class();
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    id v15 = (id)[(TUIKTReportToAppleViewController *)v11 registerForTraitChanges:v14 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v11;
}

uint64_t __74__TUIKTReportToAppleViewController_initWithContext_staticIdentityManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TUIKTReportToAppleViewController;
  [(TUIKTReportToAppleViewController *)&v17 viewWillAppear:a3];
  reportManager = self->_reportManager;
  v5 = [(TUIKTReportToAppleContext *)self->_context failingValidation];
  [(TUIReportManager *)reportManager fetchDataWithUUID:v5];

  v6 = [(TUIKTReportToAppleViewController *)self navigationItem];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"REPORT_TO_APPLE_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  [v6 setTitle:v8];

  id v9 = objc_alloc(MEMORY[0x263F1C468]);
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"SEND" value:&stru_270C3F140 table:@"Localizable"];
  v12 = (void *)[v9 initWithTitle:v11 style:0 target:self action:sel__send];

  [v6 setRightBarButtonItem:v12];
  v13 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__dismiss];
  [v6 setLeftBarButtonItem:v13];
  v14 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__dismissKeyboard_];
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = v14;

  [(UIGestureRecognizer *)self->_gestureRecognizer setCancelsTouchesInView:0];
  v16 = [(TUIKTReportToAppleViewController *)self view];
  [v16 addGestureRecognizer:self->_gestureRecognizer];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_49_0);
  }
  id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG)) {
    -[TUIKTReportToAppleViewController traitEnvironment:didChangeTraitCollection:]((uint64_t)self, v8);
  }
  id v9 = [(TUIKTReportToAppleViewController *)self traitCollection];
  uint64_t v10 = [v9 userInterfaceStyle];
  uint64_t v11 = [v7 userInterfaceStyle];

  if (v10 != v11) {
    [(TUIKTReportToAppleViewController *)self reloadSpecifiers];
  }
}

uint64_t __78__TUIKTReportToAppleViewController_traitEnvironment_didChangeTraitCollection___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    if (+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
    {
      id v6 = [(TUIKTReportToAppleViewController *)self _additionalDetailsTitleSpecifier];
      [v5 addObject:v6];

      id v7 = [(TUIKTReportToAppleViewController *)self _specifiersForAdditionalDetails];
      [v5 addObject:v7];

      reportToAppleSpecifierProvider = self->_reportToAppleSpecifierProvider;
      if (!reportToAppleSpecifierProvider)
      {
        id v9 = [[TUIReportToAppleSpecifierProvider alloc] initWithContext:self->_context reportManager:self->_reportManager];
        uint64_t v10 = self->_reportToAppleSpecifierProvider;
        self->_reportToAppleSpecifierProvider = v9;

        [(TUIReportToAppleSpecifierProvider *)self->_reportToAppleSpecifierProvider setPresentingViewController:self];
        [(TUIReportToAppleSpecifierProvider *)self->_reportToAppleSpecifierProvider setDelegate:self];
        reportToAppleSpecifierProvider = self->_reportToAppleSpecifierProvider;
      }
      uint64_t v11 = [(TUIReportToAppleSpecifierProvider *)reportToAppleSpecifierProvider specifiers];
      [v5 addObjectsFromArray:v11];

      v12 = [(TUIKTReportToAppleViewController *)self _reportToAppleButtonSpecifier];
      [v5 addObject:v12];
    }
    v13 = (objc_class *)[v5 copy];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v13;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_reportToAppleButtonSpecifier
{
  uint64_t v3 = (void *)MEMORY[0x263F5FC40];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"SHOW_DETAILS" value:&stru_270C3F140 table:@"Localizable"];
  id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:sel__reportToApple_];
  [v6 setProperty:&unk_270C4C160 forKey:*MEMORY[0x263F5FEE8]];
  return v6;
}

- (void)_reportToApple:(id)a3
{
  id v8 = [[TUIReportDetailsViewController alloc] initWithReportManager:self->_reportManager];
  v4 = objc_opt_new();
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"DETAILS_BACK_BUTTON_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  [v4 setTitle:v6];

  id v7 = [(TUIKTReportToAppleViewController *)self navigationItem];
  [v7 setBackBarButtonItem:v4];

  [(TUIKTReportToAppleViewController *)self showViewController:v8 sender:self];
}

- (id)_additionalDetailsTitleSpecifier
{
  v2 = (void *)MEMORY[0x263F5FC40];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ADDITIONAL_DETAILS" value:&stru_270C3F140 table:@"Localizable"];
  v5 = [v2 groupSpecifierWithID:@"TUI_ADDITIONAL_DETAILS_KEY" name:v4];

  return v5;
}

- (id)_specifiersForAdditionalDetails
{
  v2 = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:&stru_270C3F140 target:self set:sel__setAdditionalDetails_withSpecifier_ get:sel__additionalDetailsForSpecifier_ detail:0 cell:14 edit:0];
  [v2 setKeyboardType:0 autoCaps:2 autoCorrection:0];
  [v2 setProperty:&unk_270C4C178 forKey:*MEMORY[0x263F602A8]];
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ADDITIONAL_DETAILS_PLACEHOLDER" value:&stru_270C3F140 table:@"Localizable"];
  [v2 setProperty:v4 forKey:*MEMORY[0x263F602D0]];

  [v2 setProperty:@"TUIKTSpecifierAdditionalDetails" forKey:*MEMORY[0x263F60170]];
  [v2 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v2;
}

- (id)_additionalDetailsForSpecifier:(id)a3
{
  return [(TUIReportManager *)self->_reportManager additionalDetails];
}

- (void)_setAdditionalDetails:(id)a3 withSpecifier:(id)a4
{
  id v7 = [a4 propertyForKey:*MEMORY[0x263F602B0]];
  if ([v7 placeholderDisplayed])
  {
    [(TUIReportManager *)self->_reportManager setAdditionalDetails:&stru_270C3F140];
  }
  else
  {
    v5 = [v7 textView];
    id v6 = [v5 text];
    [(TUIReportManager *)self->_reportManager setAdditionalDetails:v6];
  }
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(TUIKTReportToAppleViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else {
    [(TUIKTReportToAppleViewController *)self showViewController:v6 sender:v7];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_88_2);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __80__TUIKTReportToAppleViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_90_0);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __80__TUIKTReportToAppleViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_92);
  }
  uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }
  if ([v9 count])
  {
    uint64_t v11 = [v8 specifiers];
    [(TUIKTReportToAppleViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v11 animated:v5];
  }
  else
  {
    [(TUIKTReportToAppleViewController *)self reloadSpecifiers];
  }
}

uint64_t __87__TUIKTReportToAppleViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_94_1);
  }
  uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }
}

uint64_t __92__TUIKTReportToAppleViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_send
{
  reportManager = self->_reportManager;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__TUIKTReportToAppleViewController__send__block_invoke;
  v3[3] = &unk_2655535B8;
  v3[4] = self;
  [(TUIReportManager *)reportManager sendReport:v3];
}

void __41__TUIKTReportToAppleViewController__send__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__TUIKTReportToAppleViewController__send__block_invoke_2;
  v6[3] = &unk_2655531F0;
  objc_copyWeak(&v9, &location);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__TUIKTReportToAppleViewController__send__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32))
  {
    id v3 = (void *)MEMORY[0x263F1C3F8];
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"REPORT_TO_APPLE_TITLE" value:&stru_270C3F140 table:@"Localizable"];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"REPORT_TO_APPLE_ERROR" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

    id v9 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"DISMISS" value:&stru_270C3F140 table:@"Localizable"];
    int v12 = [v9 actionWithTitle:v11 style:1 handler:&__block_literal_global_104_0];

    [v8 addAction:v12];
    [*(id *)(a1 + 40) presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_106_0);
    }
    id v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_260338000, v13, OS_LOG_TYPE_DEBUG, "Report to Apple sent", v14, 2u);
    }
    [WeakRetained _dismiss];
  }
}

uint64_t __41__TUIKTReportToAppleViewController__send__block_invoke_4()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_dismiss
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TUIKTReportToAppleViewController__dismiss__block_invoke;
  block[3] = &unk_2655531C8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__TUIKTReportToAppleViewController__dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_dismissKeyboard:(id)a3
{
  id v3 = [(TUIKTReportToAppleViewController *)self view];
  [v3 endEditing:1];
}

- (TUIReportToAppleSpecifierProvider)reportToAppleSpecifierProvider
{
  return self->_reportToAppleSpecifierProvider;
}

- (void)setReportToAppleSpecifierProvider:(id)a3
{
}

- (TUIReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_reportToAppleSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)traitEnvironment:(uint64_t)a1 didChangeTraitCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[TUIKTReportToAppleViewController traitEnvironment:didChangeTraitCollection:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)&v2, 0x16u);
}

@end