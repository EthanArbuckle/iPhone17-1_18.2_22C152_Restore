@interface ICQInternetPrivacyLocationSharingViewController
- (ICQInternetPrivacyLocationSharingSpecifierProvider)specifierProvider;
- (ICQInternetPrivacyLocationSharingViewController)init;
- (ICQInternetPrivacyViewModel)viewModel;
- (id)specifiers;
- (void)_setupNavigationBar;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setSpecifierProvider:(id)a3;
- (void)setViewModel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICQInternetPrivacyLocationSharingViewController

- (ICQInternetPrivacyLocationSharingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICQInternetPrivacyLocationSharingViewController;
  v2 = [(ICQInternetPrivacyLocationSharingViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ICQInternetPrivacyLocationSharingSpecifierProvider);
    specifierProvider = v2->_specifierProvider;
    v2->_specifierProvider = v3;

    [(ICQInternetPrivacyLocationSharingSpecifierProvider *)v2->_specifierProvider setDelegate:v2];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQInternetPrivacyLocationSharingViewController;
  [(ICQInternetPrivacyLocationSharingViewController *)&v4 viewWillAppear:a3];
  [(ICQInternetPrivacyLocationSharingViewController *)self _setupNavigationBar];
}

- (void)_setupNavigationBar
{
  id v4 = [(ICQInternetPrivacyLocationSharingViewController *)self navigationItem];
  v3 = [(ICQInternetPrivacyViewModel *)self->_viewModel IPAddressLocationSettingsTitle];
  [v4 setTitle:v3];
}

- (id)specifiers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    id v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyLocationSharingViewController is loading specifiers.", (uint8_t *)&v13, 2u);
    }

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v6 = [(ICQInternetPrivacyLocationSharingViewController *)self specifierProvider];
    v7 = [v6 specifiers];
    [v5 addObjectsFromArray:v7];

    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;
  }
  v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    int v13 = 138412290;
    uint64_t v14 = v10;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyLocationSharingViewController specifiers: returning %@", (uint8_t *)&v13, 0xCu);
  }

  v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v11;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICQInternetPrivacyLocationSharingViewController *)self reloadSpecifiers];
}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (ICQInternetPrivacyLocationSharingSpecifierProvider)specifierProvider
{
  return self->_specifierProvider;
}

- (void)setSpecifierProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end