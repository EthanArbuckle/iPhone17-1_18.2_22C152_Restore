@interface ICSPrivateEmailSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)handleURL:(id)a3;
- (ICSPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3;
- (ICSPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (UIViewController)presenter;
- (id)account;
- (void)_fetchCloudStorageSummary;
- (void)_privateEmailSpecifierWasTapped:(id)a3;
- (void)_reloadPrivateEmailSpecifier;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSPrivateEmailSpecifierProvider

- (ICSPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICSPrivateEmailSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ICSPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  objc_storeStrong((id *)&self->_accountManager, a3);
  id v6 = a4;
  objc_storeWeak((id *)&self->_presenter, v6);

  [(ICSPrivateEmailSpecifierProvider *)self _fetchCloudStorageSummary];
  return self;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = (void *)MEMORY[0x263F5FC40];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PRIVATE_EMAIL_ADDRESSES" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
    v8 = [v5 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:1 edit:0];
    privateEmailSpecifier = self->privateEmailSpecifier;
    self->privateEmailSpecifier = v8;

    [(PSSpecifier *)self->privateEmailSpecifier setControllerLoadAction:sel__privateEmailSpecifierWasTapped_];
    [(PSSpecifier *)self->privateEmailSpecifier setIdentifier:@"PRIVATE_EMAIL_MANAGE"];
    v10 = (void *)MEMORY[0x263F827E8];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v10 imageNamed:@"privateEmailAddressIcon.png" inBundle:v11];

    [(PSSpecifier *)self->privateEmailSpecifier setProperty:v12 forKey:*MEMORY[0x263F60140]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      storageSummary = self->_storageSummary;
      if (!storageSummary)
      {

        goto LABEL_9;
      }
      v15 = [(ICQCloudStorageSummary *)storageSummary subscriptionInfo];
      char v16 = [v15 isiCloudPlusSubscriber];

      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    [v4 addObject:self->privateEmailSpecifier];
LABEL_9:
    v17 = (NSArray *)[v4 copy];
    v18 = self->_specifiers;
    self->_specifiers = v17;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (void)_reloadPrivateEmailSpecifier
{
  id v5 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:0];
}

- (void)_privateEmailSpecifierWasTapped:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained specifierProvider:self willBeginLoadingSpecifier:v5];

  v7 = [MEMORY[0x263F29270] bagForAltDSID:0];
  uint64_t v8 = [v7 privateEmailManageURL];

  id v9 = objc_alloc_init(MEMORY[0x263F089E0]);
  v24 = (void *)v8;
  [v9 setURL:v8];
  [v9 setHTTPMethod:@"GET"];
  v10 = LogSubsystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICSPrivateEmailSpecifierProvider _privateEmailSpecifierWasTapped:]((uint64_t)v9, v10);
  }

  v11 = objc_alloc_init(ICSMatterhornUpsellHook);
  v12 = objc_alloc_init(ICSPrivateEmailUpdateCacheHook);
  v13 = [(AIDAAccountManager *)self->_accountManager accounts];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  id v15 = objc_alloc(MEMORY[0x263F25CC0]);
  char v16 = objc_msgSend(v14, "aa_altDSID");
  v17 = (void *)[v15 initWithAltDSID:v16 upgradeContext:*MEMORY[0x263F29098]];

  v25[0] = v11;
  v25[1] = v12;
  v25[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v19 = objc_alloc(MEMORY[0x263F25CD8]);
  accountManager = self->_accountManager;
  id v21 = objc_loadWeakRetained((id *)&self->_presenter);
  v22 = (AAUIGrandSlamRemoteUIPresenter *)[v19 initWithAccountManager:accountManager presenter:v21 hooks:v18];
  privateEmailPresenter = self->_privateEmailPresenter;
  self->_privateEmailPresenter = v22;

  [(AAUIGrandSlamRemoteUIPresenter *)self->_privateEmailPresenter setDelegate:self];
  [(AAUIGrandSlamRemoteUIPresenter *)self->_privateEmailPresenter loadRequest:v9];
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = LogSubsystem();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICSPrivateEmailSpecifierProvider remoteUIRequestComplete:error:]((uint64_t)v5, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262993000, v7, OS_LOG_TYPE_DEFAULT, "private email specifier provider success", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ICSPrivateEmailSpecifierProvider_remoteUIRequestComplete_error___block_invoke;
  block[3] = &unk_2655B5688;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__ICSPrivateEmailSpecifierProvider_remoteUIRequestComplete_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(v3 + 48) specifierForID:@"PRIVATE_EMAIL_MANAGE"];
    [v5 specifierProvider:v3 didFinishLoadingSpecifier:v4];
  }
}

- (void)_fetchCloudStorageSummary
{
  id v3 = objc_alloc(MEMORY[0x263F888D0]);
  v4 = [(ICSPrivateEmailSpecifierProvider *)self account];
  id v5 = (void *)[v3 initWithAccount:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke;
  v6[3] = &unk_2655B5D30;
  v6[4] = self;
  [v5 fetchStorageSummaryWithCompletion:v6];
}

void __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v5;
  id v9 = v5;

  if (v6)
  {
    v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_cold_1((uint64_t)v6, v10);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_71;
  block[3] = &unk_2655B5688;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_71(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPrivateEmailSpecifier];
}

- (BOOL)handleURL:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"path"];
  int v5 = [v4 isEqualToString:@"PRIVATE_EMAIL_MANAGE"];
  if (v5) {
    [(ICSPrivateEmailSpecifierProvider *)self _privateEmailSpecifierWasTapped:self->privateEmailSpecifier];
  }

  return v5;
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

- (UIViewController)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (UIViewController *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->privateEmailSpecifier, 0);
  objc_storeStrong((id *)&self->_privateEmailPresenter, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_privateEmailSpecifierWasTapped:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_262993000, a2, OS_LOG_TYPE_DEBUG, "Private email specifier tapped, url %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIRequestComplete:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "private email specifier failed with error %@", (uint8_t *)&v2, 0xCu);
}

void __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch storage summary with error: %@", (uint8_t *)&v2, 0xCu);
}

@end