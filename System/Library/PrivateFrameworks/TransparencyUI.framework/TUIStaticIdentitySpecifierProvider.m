@interface TUIStaticIdentitySpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (TUIAnalytics)analytics;
- (TUIStaticIdentityManager)staticIdentityManager;
- (TUIStaticIdentitySpecifierProvider)initWithAccountManager:(id)a3;
- (TUIStaticIdentitySpecifierProvider)initWithStaticIdentityManager:(id)a3 analytics:(id)a4;
- (id)_buttonsSpecifier;
- (id)_codeSpecifier;
- (id)_groupSpecifier;
- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8;
- (void)_markAsVerifiedAction:(id)a3;
- (void)_noMatchAction:(id)a3;
- (void)_usePublicVerificationCodesTapped;
- (void)reloadSpecifiers;
- (void)setAnalytics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStaticIdentityManager:(id)a3;
- (void)verifyContact:(id)a3 peerPublicAccountIdentity:(id)a4;
@end

@implementation TUIStaticIdentitySpecifierProvider

- (TUIStaticIdentitySpecifierProvider)initWithStaticIdentityManager:(id)a3 analytics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIStaticIdentitySpecifierProvider;
  v9 = [(TUIStaticIdentitySpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticIdentityManager, a3);
    [(TUIStaticIdentityManager *)v10->_staticIdentityManager setDelegate:v10];
    [(TUIStaticIdentityManager *)v10->_staticIdentityManager requestNewSasCode];
    [(TUIStaticIdentityManager *)v10->_staticIdentityManager requestConversationVerificationState:0];
    objc_storeStrong((id *)&v10->_analytics, a4);
  }

  return v10;
}

- (TUIStaticIdentitySpecifierProvider)initWithAccountManager:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_18);
  }
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "initWithAccountManager is not supported", v7, 2u);
  }

  return 0;
}

uint64_t __61__TUIStaticIdentitySpecifierProvider_initWithAccountManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = [(TUIStaticIdentitySpecifierProvider *)self _groupSpecifier];
    [v4 addObject:v5];

    v6 = [(TUIStaticIdentitySpecifierProvider *)self _codeSpecifier];
    [v4 addObject:v6];

    id v7 = [(TUIStaticIdentitySpecifierProvider *)self _buttonsSpecifier];
    [v4 addObject:v7];

    id v8 = (NSArray *)[v4 copy];
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)reloadSpecifiers
{
  v3 = self->_specifiers;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__TUIStaticIdentitySpecifierProvider_reloadSpecifiers__block_invoke;
  v6[3] = &unk_265553010;
  v6[4] = self;
  id v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __54__TUIStaticIdentitySpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_26);
  }
  v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_260338000, v2, OS_LOG_TYPE_INFO, "Attempting to reload specifiers...", v4, 2u);
  }
  v3 = [*(id *)(a1 + 32) delegate];
  [v3 reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:*(void *)(a1 + 40) animated:1];
}

uint64_t __54__TUIStaticIdentitySpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (id)_groupSpecifier
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"STATIC_IDENTITY_GROUP_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  BOOL v6 = [(TUIStaticIdentityManager *)self->_staticIdentityManager accountKeysDisplayed];
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v2 localizedStringForKey:@"STATIC_IDENTITY_GROUP_FOOTER_PART1" value:&stru_270C3F140 table:@"Localizable"];
  }
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"STATIC_IDENTITY_GROUP_FOOTER_PART2" value:&stru_270C3F140 table:@"Localizable"];
  v10 = [(TUIStaticIdentitySpecifierProvider *)self createGroupSpecifierWithIdentifier:@"TUI_STATIC_IDENTITY_GROUP" title:v5 footerText:v7 linkText:v9 actionMethodName:@"_usePublicVerificationCodesTapped" target:self];

  if (!v6)
  {
  }
  return v10;
}

- (void)_usePublicVerificationCodesTapped
{
  [(TUIAnalytics *)self->_analytics ktInteraction:@"showPublicKeysSelected"];
  staticIdentityManager = self->_staticIdentityManager;
  [(TUIStaticIdentityManager *)staticIdentityManager showAccountKeys];
}

- (id)_codeSpecifier
{
  v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"TUI_STATIC_IDENTITY_CODE" target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id v4 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F602A8]];

  v5 = [(TUIStaticIdentityManager *)self->_staticIdentityManager sasCodeString];
  [v3 setProperty:v5 forKey:*MEMORY[0x263F602D0]];

  BOOL v6 = [(TUIStaticIdentityManager *)self->_staticIdentityManager sasCodeString];
  if (v6)
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"VERIFY_CODE_SUBTITLE" value:&stru_270C3F140 table:@"Localizable"];
  }
  else
  {
    id v8 = [(TUIStaticIdentityManager *)self->_staticIdentityManager localizedPeerAccountNameMessage:@"GENERATE_CODE_SUBTITLE"];
  }

  v9 = NSString;
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  objc_super v12 = [v9 stringWithFormat:@"%@ %@", v8, v11];

  [v3 setProperty:v12 forKey:*MEMORY[0x263F602C8]];
  [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];

  return v3;
}

- (id)_buttonsSpecifier
{
  v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"TUI_STATIC_IDENTITY_BUTTONS" target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v3 setConfirmationAlternateAction:sel__noMatchAction_];
  [v3 setConfirmationAction:sel__markAsVerifiedAction_];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[TUIStaticIdentityManager sasCodeValid](self->_staticIdentityManager, "sasCodeValid"));
  [v3 setProperty:v4 forKey:*MEMORY[0x263F600A8]];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[TUIStaticIdentityManager conversationVerified](self->_staticIdentityManager, "conversationVerified"));
  [v3 setProperty:v5 forKey:*MEMORY[0x263F60308]];

  return v3;
}

- (void)_noMatchAction:(id)a3
{
  [(TUIAnalytics *)self->_analytics ktInteraction:@"doNotMatchSelected"];
  id location = 0;
  objc_initWeak(&location, self);
  id v4 = dispatch_get_global_queue(33, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke;
  v5[3] = &unk_265553128;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x263F80D38]);
    v3 = (void *)[v2 initWithApplication:*MEMORY[0x263F80D78]];
    id v12 = 0;
    id v4 = [v3 status:&v12];
    id v5 = v12;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_84_0);
    }
    id v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = WeakRetained;
      __int16 v14 = 2114;
      v15 = v4;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_260338000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ got CKV status = %{public}@, error = %{public}@", buf, 0x20u);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_85;
    block[3] = &unk_265552FE8;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v4;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_80_0);
    }
    id v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[TUIStaticIdentitySpecifierProvider _noMatchAction:]_block_invoke";
      _os_log_impl(&dword_260338000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_82()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_85(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x263F1C3F8];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"NO_MATCH_ALERT_TITLE" value:&stru_270C3F140 table:@"Localizable"];
    id v6 = [WeakRetained staticIdentityManager];
    id v7 = [v6 localizedPeerAccountNameMessage:@"NO_MATCH_ALERT_TEXT"];
    id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

    if (+[TUIUtils isTransparencyFeatureEnabled:ffKTReportToApple])
    {
      v9 = (void *)MEMORY[0x263F1C3F0];
      id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v11 = [v10 localizedStringForKey:@"REPORT_TO_APPLE_TITLE" value:&stru_270C3F140 table:@"Localizable"];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_101;
      v20[3] = &unk_265553380;
      id v21 = *(id *)(a1 + 32);
      id v22 = WeakRetained;
      id v12 = [v9 actionWithTitle:v11 style:0 handler:v20];
      [v8 addAction:v12];
    }
    v13 = (void *)MEMORY[0x263F1C3F0];
    __int16 v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"DISMISS" value:&stru_270C3F140 table:@"Localizable"];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_111;
    v19[3] = &unk_265553358;
    v19[4] = WeakRetained;
    __int16 v16 = [v13 actionWithTitle:v15 style:1 handler:v19];
    [v8 addAction:v16];

    id v17 = [WeakRetained delegate];
    [v17 specifierProvider:WeakRetained showViewController:v8];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_88_1);
    }
    uint64_t v18 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[TUIStaticIdentitySpecifierProvider _noMatchAction:]_block_invoke";
      _os_log_impl(&dword_260338000, v18, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }
}

uint64_t __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_2_86()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_101(uint64_t a1)
{
  id v2 = objc_alloc_init(TUIKTReportToAppleContext);
  v3 = [*(id *)(a1 + 32) recentFailedEventIds];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) recentFailedEventIds];
    id v6 = [v5 firstObject];
    [(TUIKTReportToAppleContext *)v2 setFailingValidation:v6];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_105_1);
    }
    id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR)) {
      __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_101_cold_1(a1, v7);
    }
  }
  id v8 = [TUIKTReportToAppleViewController alloc];
  v9 = [*(id *)(a1 + 40) staticIdentityManager];
  id v10 = [(TUIKTReportToAppleViewController *)v8 initWithContext:v2 staticIdentityManager:v9];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  [WeakRetained specifierProvider:*(void *)(a1 + 40) showViewController:v10];

  [*(id *)(*(void *)(a1 + 40) + 32) ktConversationNoMatch:1];
}

uint64_t __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_2_103()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_111(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) ktConversationNoMatch:0];
}

- (void)_markAsVerifiedAction:(id)a3
{
  [(TUIAnalytics *)self->_analytics ktInteraction:@"markAsVerifiedSelected"];
  staticIdentityManager = self->_staticIdentityManager;
  [(TUIStaticIdentityManager *)staticIdentityManager verifyConversation];
}

- (void)verifyContact:(id)a3 peerPublicAccountIdentity:(id)a4
{
  id v6 = [MEMORY[0x263EFEBF8] viewControllerForUpdatingContact:a3 withPublicAccountIdentity:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained specifierProvider:self showViewController:v6];
}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = [MEMORY[0x263F5FC40] groupSpecifierWithID:a3 name:a4];
  if (v13)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%@ %@", v13, v14];
    [v17 setProperty:v18 forKey:*MEMORY[0x263F600F8]];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v17 setProperty:v20 forKey:*MEMORY[0x263F600C0]];

    [v17 setProperty:v18 forKey:*MEMORY[0x263F600E8]];
    v25.id location = [v18 rangeOfString:v14];
    id v21 = NSStringFromRange(v25);
    [v17 setProperty:v21 forKey:*MEMORY[0x263F600D0]];

    id v22 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v16];
    [v17 setProperty:v22 forKey:*MEMORY[0x263F600E0]];

    [v17 setProperty:v15 forKey:*MEMORY[0x263F600C8]];
  }

  return v17;
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

- (TUIStaticIdentityManager)staticIdentityManager
{
  return self->_staticIdentityManager;
}

- (void)setStaticIdentityManager:(id)a3
{
}

- (TUIAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_staticIdentityManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_101_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_260338000, a2, OS_LOG_TYPE_ERROR, "%{public}@ no recent failed event id found, cannot get report data for no match", (uint8_t *)&v3, 0xCu);
}

@end