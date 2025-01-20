@interface ICSPhotoStreamSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_isPhotoStreamEnabled:(id)a3;
- (BOOL)handleURL:(id)a3;
- (ICSPhotoStreamSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)_isPhotoStreamEnabledString:(id)a3;
- (id)_specifierForPhotoStream;
- (id)account;
- (void)_photoStreamSpecifierWasTapped:(id)a3;
- (void)_showPhotoStreamController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSPhotoStreamSpecifierProvider

- (ICSPhotoStreamSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSPhotoStreamSpecifierProvider;
  v6 = [(ICSPhotoStreamSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  v9[1] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(ICSPhotoStreamSpecifierProvider *)self _specifierForPhotoStream];
    id v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifierForPhotoStream
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  if ([v3 effectiveBoolValueForSetting:*MEMORY[0x263F53A08]] == 2
    && [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53A50]] == 2
    && [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53870]] == 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F5FC40];
    uint64_t v6 = *MEMORY[0x263EFACC0];
    v7 = [(ICSPhotoStreamSpecifierProvider *)self account];
    uint64_t v4 = objc_msgSend(v5, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v6, v7, self, 0, sel__isPhotoStreamEnabledString_, 0);

    uint64_t v11 = *MEMORY[0x263F23118];
    v8 = [(ICSPhotoStreamSpecifierProvider *)self account];
    v12[0] = v8;
    objc_super v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v4 setUserInfo:v9];

    [v4 setControllerLoadAction:sel__photoStreamSpecifierWasTapped_];
  }

  return v4;
}

- (id)_isPhotoStreamEnabledString:(id)a3
{
  BOOL v3 = [(ICSPhotoStreamSpecifierProvider *)self _isPhotoStreamEnabled:a3];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    uint64_t v6 = @"ON";
  }
  else {
    uint64_t v6 = @"OFF";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  return v7;
}

- (BOOL)_isPhotoStreamEnabled:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICSPhotoStreamSpecifierProvider _isPhotoStreamEnabled:]((id *)p_delegate, v12);
    }

    goto LABEL_8;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

  if ((v9 & 1) == 0)
  {
LABEL_8:
    char v11 = 0;
    goto LABEL_14;
  }
  v10 = [(ICSPhotoStreamSpecifierProvider *)self account];
  if ([v10 isEnabledForDataclass:*MEMORY[0x263EFACC0]])
  {
    char v11 = 1;
  }
  else
  {
    v13 = [(ICSPhotoStreamSpecifierProvider *)self account];
    if ([v13 isEnabledForDataclass:*MEMORY[0x263EFAD28]])
    {
      char v11 = 1;
    }
    else
    {
      v14 = [(ICSPhotoStreamSpecifierProvider *)self account];
      char v11 = [v14 isEnabledForDataclass:*MEMORY[0x263EFAC58]];
    }
  }

LABEL_14:
  return v11;
}

- (void)_photoStreamSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&v5->_delegate);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __66__ICSPhotoStreamSpecifierProvider__photoStreamSpecifierWasTapped___block_invoke;
    v9[3] = &unk_2655B5E48;
    v10 = v5;
    id v11 = v4;
    v12 = v10;
    [v8 validateDataclassAccessForProvider:v10 specifier:v11 completion:v9];
  }
}

void __66__ICSPhotoStreamSpecifierProvider__photoStreamSpecifierWasTapped___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(id *)(a1 + 32);
    [v4 _showPhotoStreamController:v3];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 32));
    [WeakRetained reloadSpecifierForProvider:*(void *)(a1 + 48) identifier:*MEMORY[0x263EFACC0]];
  }
}

- (void)_showPhotoStreamController:(id)a3
{
  id v4 = a3;
  photosSettingsController = self->_photosSettingsController;
  if (photosSettingsController)
  {
LABEL_4:
    [(PSListController *)photosSettingsController setSpecifier:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained specifierProvider:self showViewController:self->_photosSettingsController];

    if (self->_handleURLResourceDictionary && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(PSListController *)self->_photosSettingsController handleURL:self->_handleURLResourceDictionary];
      handleURLResourceDictionary = self->_handleURLResourceDictionary;
      self->_handleURLResourceDictionary = 0;
    }
    goto LABEL_10;
  }
  uint64_t v6 = objc_alloc_init(ICSPhotoSettingsController);
  if (v6)
  {
    char v7 = self->_photosSettingsController;
    self->_photosSettingsController = &v6->super;

    photosSettingsController = self->_photosSettingsController;
    goto LABEL_4;
  }
  v10 = LogSubsystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, "ICSPhotoStreamSpecifierProvider could not load the photos settings controller!", v11, 2u);
  }

LABEL_10:
}

- (BOOL)handleURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"path"];
  if (([v5 hasPrefix:*MEMORY[0x263EFACF8]] & 1) != 0
    || ([v5 hasPrefix:*MEMORY[0x263EFACC0]] & 1) != 0
    || ([v5 hasPrefix:*MEMORY[0x263EFAD28]] & 1) != 0
    || [v5 hasPrefix:*MEMORY[0x263EFAC58]])
  {
    uint64_t v6 = LogSubsystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_262993000, v6, OS_LOG_TYPE_DEFAULT, "%@ handling deeplink url for path: %@", buf, 0x16u);
    }

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __45__ICSPhotoStreamSpecifierProvider_handleURL___block_invoke;
    v9[3] = &unk_2655B5900;
    void v9[4] = self;
    id v10 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v9);

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __45__ICSPhotoStreamSpecifierProvider_handleURL___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) specifiers];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    id v4 = *(void **)(a1 + 32);
    id v6 = [v4 specifiers];
    id v5 = [v6 firstObject];
    [v4 _photoStreamSpecifierWasTapped:v5];
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_photosSettingsController, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_isPhotoStreamEnabled:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_error_impl(&dword_262993000, a2, OS_LOG_TYPE_ERROR, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", (uint8_t *)&v4, 0xCu);
}

@end