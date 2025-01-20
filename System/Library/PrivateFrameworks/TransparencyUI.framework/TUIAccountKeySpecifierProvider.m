@interface TUIAccountKeySpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)isExpanded;
- (BOOL)isPeerAccount;
- (NSArray)specifiers;
- (TUIAccountKeySpecifierProvider)init;
- (TUIAccountKeySpecifierProvider)initWithAccountManager:(id)a3;
- (TUIAccountKeySpecifierProvider)initWithStaticIdentityManager:(id)a3 analytics:(id)a4;
- (TUIAnalytics)analytics;
- (TUIStaticIdentityManager)staticIdentityManager;
- (id)_accountKeySpecifier;
- (id)_buttonSpecifier;
- (id)_collapsedButtonSpecifier;
- (id)_collapsedGroupSpecifier;
- (id)_currentAccountKeyString;
- (id)_getAccountKeyButtonEnabledForSpecifier:(id)a3;
- (id)_groupSpecifier;
- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8;
- (int64_t)_accountKeyButtonTableCellType;
- (void)_accountKeyButtonTapped:(id)a3;
- (void)_learnMoreTapped;
- (void)_showInfoAlert:(id)a3;
- (void)_showPublicVerificationCodeTapped:(id)a3;
- (void)_startSpinnerForSpecifier:(id)a3;
- (void)refreshSelfAccountKey;
- (void)reloadSpecifiers;
- (void)setAnalytics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsPeerAccount:(BOOL)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStaticIdentityManager:(id)a3;
@end

@implementation TUIAccountKeySpecifierProvider

- (TUIAccountKeySpecifierProvider)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(TUIAccountKeySpecifierProvider *)self initWithStaticIdentityManager:v3 analytics:v4];

  if (v5) {
    [(TUIStaticIdentityManager *)v5->_staticIdentityManager requestSelfAccountKey];
  }
  return v5;
}

- (TUIAccountKeySpecifierProvider)initWithStaticIdentityManager:(id)a3 analytics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIAccountKeySpecifierProvider;
  v9 = [(TUIAccountKeySpecifierProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticIdentityManager, a3);
    objc_storeStrong((id *)&v10->_analytics, a4);
    v11 = [(TUIStaticIdentityManager *)v10->_staticIdentityManager delegate];

    if (!v11) {
      [(TUIStaticIdentityManager *)v10->_staticIdentityManager setDelegate:v10];
    }
  }

  return v10;
}

- (TUIAccountKeySpecifierProvider)initWithAccountManager:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_10);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR)) {
    -[TUIAccountKeySpecifierProvider initWithAccountManager:]();
  }

  return 0;
}

uint64_t __57__TUIAccountKeySpecifierProvider_initWithAccountManager___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)refreshSelfAccountKey
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

uint64_t __55__TUIAccountKeySpecifierProvider_refreshSelfAccountKey__block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    if (self->_isExpanded)
    {
      v5 = [(TUIAccountKeySpecifierProvider *)self _groupSpecifier];
      [v4 addObject:v5];

      v6 = [(TUIAccountKeySpecifierProvider *)self _accountKeySpecifier];
      [v4 addObject:v6];

      [(TUIAccountKeySpecifierProvider *)self _buttonSpecifier];
    }
    else
    {
      id v7 = [(TUIAccountKeySpecifierProvider *)self _collapsedGroupSpecifier];
      [v4 addObject:v7];

      [(TUIAccountKeySpecifierProvider *)self _collapsedButtonSpecifier];
    id v8 = };
    [v4 addObject:v8];

    v9 = (NSArray *)[v4 copy];
    v10 = self->_specifiers;
    self->_specifiers = v9;

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
  block[2] = __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_40_0);
    }
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      id v7 = WeakRetained;
      _os_log_impl(&dword_260338000, v3, OS_LOG_TYPE_INFO, "%{public}@ attempting to reload specifiers...", (uint8_t *)&v6, 0xCu);
    }
    id v4 = [WeakRetained delegate];
    [v4 reloadSpecifiersForProvider:WeakRetained oldSpecifiers:*(void *)(a1 + 32) animated:1];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_37);
    }
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      id v7 = "-[TUIAccountKeySpecifierProvider reloadSpecifiers]_block_invoke";
      _os_log_impl(&dword_260338000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

uint64_t __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke_38()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)_startSpinnerForSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:*MEMORY[0x263F602B0]];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  [v3 startAnimating];
  [v4 setAccessoryView:v3];
}

- (id)_collapsedGroupSpecifier
{
  if (self->_isPeerAccount) {
    v3 = @"PEER_PUBLIC_VERIFICATION_CODE";
  }
  else {
    v3 = @"PUBLIC_VERIFICATION_CODE";
  }
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"ACCOUNT_KEY_GROUP_FOOTER_PART1" value:&stru_270C3F140 table:@"Localizable"];
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  uint64_t v8 = [(TUIAccountKeySpecifierProvider *)self createGroupSpecifierWithIdentifier:v3 title:0 footerText:v5 linkText:v7 actionMethodName:@"_learnMoreTapped" target:self];

  return v8;
}

- (id)_collapsedButtonSpecifier
{
  v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"SHOW_PUBLIC_VERIFICATION_CODE" value:&stru_270C3F140 table:@"Localizable"];
  int v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  uint64_t v7 = MEMORY[0x263EFFA88];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  [v6 setButtonAction:sel__showPublicVerificationCodeTapped_];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F5FEF8]];
  return v6;
}

- (void)_showPublicVerificationCodeTapped:(id)a3
{
  self->_isExpanded = 1;
  [(TUIAccountKeySpecifierProvider *)self reloadSpecifiers];
}

- (id)_groupSpecifier
{
  v5 = @"PEER_PUBLIC_VERIFICATION_CODE";
  BOOL isPeerAccount = self->_isPeerAccount;
  if (!self->_isPeerAccount) {
    v5 = @"PUBLIC_VERIFICATION_CODE";
  }
  v19 = v5;
  if (self->_isPeerAccount)
  {
    uint64_t v7 = [(TUIStaticIdentityManager *)self->_staticIdentityManager localizedPeerAccountNameMessage:@"VERIFICATION_CODE_GROUP_PEER_TITLE"];
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v8 localizedStringForKey:@"VERIFICATION_CODE_GROUP_SELF_TITLE" value:&stru_270C3F140 table:@"Localizable"];
  }
  BOOL v9 = self->_isPeerAccount;
  if (self->_isPeerAccount)
  {
    [(TUIStaticIdentityManager *)self->_staticIdentityManager localizedPeerAccountNameMessage:@"VERIFICATION_CODE_GROUP_PEER_FOOTER"];
  }
  else
  {
    v16 = NSString;
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v18 localizedStringForKey:@"ACCOUNT_KEY_GROUP_FOOTER_PART1" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"ACCOUNT_KEY_GROUP_FOOTER_PART2" value:&stru_270C3F140 table:@"Localizable"];
    v17 = (void *)v11;
    [v16 stringWithFormat:@"%@ %@", v11, v3];
  v10 = };
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"LEARN_MORE" value:&stru_270C3F140 table:@"Localizable"];
  v14 = [(TUIAccountKeySpecifierProvider *)self createGroupSpecifierWithIdentifier:v19 title:v7 footerText:v10 linkText:v13 actionMethodName:@"_learnMoreTapped" target:self];

  if (!v9)
  {

    v10 = v18;
  }

  if (!isPeerAccount) {
  return v14;
  }
}

- (id)_accountKeySpecifier
{
  v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_270C3F140 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id v4 = [NSNumber numberWithDouble:*MEMORY[0x263F1D600]];
  [v3 setProperty:v4 forKey:*MEMORY[0x263F602A8]];

  v5 = [(TUIAccountKeySpecifierProvider *)self _currentAccountKeyString];
  [v3 setProperty:v5 forKey:*MEMORY[0x263F602D0]];

  [v3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  if (self->_isPeerAccount) {
    int v6 = kTUIAccessibilityIdentifierPeerPublicVerificationCode;
  }
  else {
    int v6 = kTUIAccessibilityIdentifierSelfPublicVerificationCode;
  }
  [v3 setProperty:*v6 forKey:*MEMORY[0x263F60308]];
  return v3;
}

- (id)_buttonSpecifier
{
  uint64_t v2 = (unsigned __int8 *)self;
  BOOL v3 = [(TUIStaticIdentityManager *)self->_staticIdentityManager conversationVerified];
  id v4 = (void *)MEMORY[0x263F5FC40];
  int v5 = v2[8];
  int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = v6;
  if (v5)
  {
    if (v3)
    {
      uint64_t v8 = [v6 localizedStringForKey:@"VERIFIED" value:&stru_270C3F140 table:@"Localizable"];
      int v9 = 0;
      int v10 = 1;
    }
    else
    {
      uint64_t v8 = [v6 localizedStringForKey:@"MARK_AS_VERIFIED_NO_DOTS" value:&stru_270C3F140 table:@"Localizable"];
      int v10 = 0;
      int v9 = 1;
    }
  }
  else
  {
    uint64_t v8 = [v6 localizedStringForKey:@"COPY_VERIFICATION_CODE" value:&stru_270C3F140 table:@"Localizable"];
    int v10 = 0;
    int v9 = 0;
  }
  uint64_t v11 = objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v2, 0, sel__getAccountKeyButtonEnabledForSpecifier_, 0, objc_msgSend(v2, "_accountKeyButtonTableCellType"), 0);
  if (v5)
  {
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {

    if (!v9)
    {
LABEL_8:
      if (!v10) {
        goto LABEL_9;
      }
LABEL_13:

      if (v3) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }

  if (v10) {
    goto LABEL_13;
  }
LABEL_9:
  if (v3)
  {
LABEL_10:
    [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v12 = (void *)MEMORY[0x263F1C6B0];
    objc_super v13 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D298] scale:-1];
    v14 = [v12 systemImageNamed:@"checkmark.circle.fill" withConfiguration:v13];

    [v11 setProperty:v14 forKey:*MEMORY[0x263F60140]];
    [v11 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    goto LABEL_20;
  }
LABEL_14:
  v14 = [v2 _currentAccountKeyString];
  v15 = NSNumber;
  if (v14)
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v2 localizedStringForKey:@"VERIFICATION_CODE_NOT_AVAILABLE" value:&stru_270C3F140 table:@"Localizable"];
    uint64_t v16 = [v14 isEqualToString:v8] ^ 1;
  }
  else
  {
    uint64_t v16 = 0;
  }
  v17 = [v15 numberWithInt:v16];
  [v11 setProperty:v17 forKey:*MEMORY[0x263F600A8]];

  if (v14)
  {
  }
  [v11 setButtonAction:sel__accountKeyButtonTapped_];
LABEL_20:

  return v11;
}

- (id)_getAccountKeyButtonEnabledForSpecifier:(id)a3
{
  id v4 = a3;
  int v5 = [(TUIAccountKeySpecifierProvider *)self _currentAccountKeyString];

  if (!v5) {
    [(TUIAccountKeySpecifierProvider *)self _startSpinnerForSpecifier:v4];
  }

  return 0;
}

- (int64_t)_accountKeyButtonTableCellType
{
  uint64_t v2 = [(TUIAccountKeySpecifierProvider *)self _currentAccountKeyString];

  if (v2) {
    return 13;
  }
  else {
    return -1;
  }
}

- (void)_accountKeyButtonTapped:(id)a3
{
  if (self->_isPeerAccount)
  {
    [(TUIAnalytics *)self->_analytics ktInteraction:@"markAsVerifiedSelected"];
    staticIdentityManager = self->_staticIdentityManager;
    [(TUIStaticIdentityManager *)staticIdentityManager verifyConversation];
  }
  else
  {
    int v5 = objc_msgSend(MEMORY[0x263F1C840], "generalPasteboard", a3);
    int v6 = [(TUIAccountKeySpecifierProvider *)self _currentAccountKeyString];
    [v5 setString:v6];

    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v8 localizedStringForKey:@"VERIFICATON_CODE_COPIED" value:&stru_270C3F140 table:@"Localizable"];
    [(TUIAccountKeySpecifierProvider *)self _showInfoAlert:v7];
  }
}

- (void)_learnMoreTapped
{
  id v2 = [NSURL URLWithString:@"https://support.apple.com/ht213465"];
  [(id)*MEMORY[0x263F1D020] openURL:v2 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (id)_currentAccountKeyString
{
  BOOL isPeerAccount = self->_isPeerAccount;
  staticIdentityManager = self->_staticIdentityManager;
  if (isPeerAccount) {
    [(TUIStaticIdentityManager *)staticIdentityManager peerAccountKeyDisplayString];
  }
  else {
  id v4 = [(TUIStaticIdentityManager *)staticIdentityManager selfAccountKeyDisplayString];
  }
  return v4;
}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  objc_super v13 = (void *)MEMORY[0x263F5FC40];
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

- (void)_showInfoAlert:(id)a3
{
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_DEBUG)) {
    -[TUIAccountKeySpecifierProvider _showInfoAlert:]();
  }
  id location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke_112;
  block[3] = &unk_265552FE8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

void __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke_112(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:*(void *)(a1 + 32) message:0 preferredStyle:1];
    id v4 = (void *)MEMORY[0x263F1C3F0];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v6 = [v5 localizedStringForKey:@"DISMISS" value:&stru_270C3F140 table:@"Localizable"];
    id v7 = [v4 actionWithTitle:v6 style:0 handler:0];
    [v3 addAction:v7];

    id v8 = [WeakRetained delegate];
    [v8 specifierProvider:WeakRetained showViewController:v3];
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1) {
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_114);
    }
    int v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[TUIAccountKeySpecifierProvider _showInfoAlert:]_block_invoke";
      _os_log_impl(&dword_260338000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

uint64_t __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke_2()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
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

- (BOOL)isPeerAccount
{
  return self->_isPeerAccount;
}

- (void)setIsPeerAccount:(BOOL)a3
{
  self->_BOOL isPeerAccount = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
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

- (void)initWithAccountManager:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_260338000, v0, OS_LOG_TYPE_ERROR, "%s initWithAccountManager is not supported on %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)_showInfoAlert:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_260338000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

@end