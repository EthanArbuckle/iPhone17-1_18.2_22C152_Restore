@interface ICQInternetPrivacyLocationSharingSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (AIDAAccountManager)accountManager;
- (BOOL)locationSharingEnabled;
- (ICQInternetPrivacyLocationSharingSpecifierProvider)init;
- (ICQInternetPrivacyLocationSharingSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQInternetPrivacyViewModel)viewModel;
- (NSArray)specifiers;
- (PSSpecifier)enableSpecifier;
- (void)_reloadSpecifiers;
- (void)_specifierWasTapped:(id)a3;
- (void)_startFetchingSharingLocationPreference;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableSpecifier:(id)a3;
- (void)setLocationSharingEnabled:(BOOL)a3;
- (void)setSpecifiers:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation ICQInternetPrivacyLocationSharingSpecifierProvider

- (ICQInternetPrivacyLocationSharingSpecifierProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICQInternetPrivacyLocationSharingSpecifierProvider;
  v2 = [(ICQInternetPrivacyLocationSharingSpecifierProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_viewModel)
    {
      v4 = objc_alloc_init(ICQInternetPrivacyViewModel);
      viewModel = v3->_viewModel;
      v3->_viewModel = v4;
    }
    [(ICQInternetPrivacyLocationSharingSpecifierProvider *)v3 _startFetchingSharingLocationPreference];
  }
  return v3;
}

- (ICQInternetPrivacyLocationSharingSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v6 = [(ICQInternetPrivacyLocationSharingSpecifierProvider *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (NSArray)specifiers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  p_specifiers = &self->_specifiers;
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = (void *)MEMORY[0x263F5FC40];
    objc_super v7 = [(ICQInternetPrivacyViewModel *)self->_viewModel IPAddressLocationEnabledTitle];
    v8 = [v6 groupSpecifierWithID:v7];

    [v5 addObject:v8];
    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = [(ICQInternetPrivacyViewModel *)self->_viewModel IPAddressLocationEnabledTitle];
    v11 = [v9 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];
    enableSpecifier = self->_enableSpecifier;
    self->_enableSpecifier = v11;

    if (self->_locationSharingEnabled) {
      v13 = &unk_26E01ED20;
    }
    else {
      v13 = &unk_26E01ED38;
    }
    uint64_t v14 = *MEMORY[0x263F5FEE8];
    [(PSSpecifier *)self->_enableSpecifier setProperty:v13 forKey:*MEMORY[0x263F5FEE8]];
    [(PSSpecifier *)self->_enableSpecifier setButtonAction:sel__specifierWasTapped_];
    [(PSSpecifier *)self->_enableSpecifier setUserInfo:MEMORY[0x263EFFA88]];
    [v5 addObject:self->_enableSpecifier];
    v15 = (void *)MEMORY[0x263F5FC40];
    v16 = [(ICQInternetPrivacyViewModel *)self->_viewModel IPAddressLocationDisabledTitle];
    v17 = [v15 preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:3 edit:0];

    if (self->_locationSharingEnabled) {
      v18 = &unk_26E01ED38;
    }
    else {
      v18 = &unk_26E01ED20;
    }
    [v17 setProperty:v18 forKey:v14];
    [v17 setButtonAction:sel__specifierWasTapped_];
    [v17 setUserInfo:MEMORY[0x263EFFA80]];
    [v5 addObject:v17];
    viewModel = self->_viewModel;
    if (self->_locationSharingEnabled) {
      [(ICQInternetPrivacyViewModel *)viewModel IPAddressLocationEnabledMessage];
    }
    else {
    v20 = [(ICQInternetPrivacyViewModel *)viewModel IPAddressLocationDisabledMessage];
    }
    [v8 setProperty:v20 forKey:*MEMORY[0x263F600F8]];
    objc_storeStrong((id *)p_specifiers, v5);
    v21 = _ICQGetLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *p_specifiers;
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_impl(&dword_22C821000, v21, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyLocationSharingSpecifierProvider returning specifiers %@", buf, 0xCu);
    }

    specifiers = *p_specifiers;
  }
  return specifiers;
}

- (void)_specifierWasTapped:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Location Sharing Specifier Tapped: %@", buf, 0xCu);
  }

  v6 = [v4 userInfo];
  viewModel = self->_viewModel;
  uint64_t v8 = [v6 BOOLValue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__ICQInternetPrivacyLocationSharingSpecifierProvider__specifierWasTapped___block_invoke;
  v9[3] = &unk_264922450;
  v9[4] = self;
  [(ICQInternetPrivacyViewModel *)viewModel enableLocationSharing:v8 completion:v9];
}

uint64_t __74__ICQInternetPrivacyLocationSharingSpecifierProvider__specifierWasTapped___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _startFetchingSharingLocationPreference];
  }
  return result;
}

- (void)_startFetchingSharingLocationPreference
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v7 = "-[ICQInternetPrivacyLocationSharingSpecifierProvider _startFetchingSharingLocationPreference]";
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  viewModel = self->_viewModel;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __93__ICQInternetPrivacyLocationSharingSpecifierProvider__startFetchingSharingLocationPreference__block_invoke;
  v5[3] = &unk_264921BB0;
  v5[4] = self;
  [(ICQInternetPrivacyViewModel *)viewModel isLocationSharingEnabled:v5];
}

uint64_t __93__ICQInternetPrivacyLocationSharingSpecifierProvider__startFetchingSharingLocationPreference__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = a2;
  return [*(id *)(a1 + 32) _reloadSpecifiers];
}

- (void)_reloadSpecifiers
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id v4 = [(ICQInternetPrivacyLocationSharingSpecifierProvider *)self delegate];
  [v4 reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:0];
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

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (BOOL)locationSharingEnabled
{
  return self->_locationSharingEnabled;
}

- (void)setLocationSharingEnabled:(BOOL)a3
{
  self->_locationSharingEnabled = a3;
}

- (PSSpecifier)enableSpecifier
{
  return self->_enableSpecifier;
}

- (void)setEnableSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableSpecifier, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end