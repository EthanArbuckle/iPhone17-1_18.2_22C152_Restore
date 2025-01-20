@interface TUIDevicesWithIssuesViewController
- (AIDAAccountManager)accountManager;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (NSMutableArray)devicesWithIssuesIdentifiers;
- (TUIDevicesWithIssuesSpecifierProvider)deviceSpecifierProvider;
- (TUIDevicesWithIssuesViewController)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4;
- (id)specifiers;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setAccountManager:(id)a3;
- (void)setDeviceSpecifierProvider:(id)a3;
- (void)setDevicesWithIssuesIdentifiers:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)viewDidLoad;
@end

@implementation TUIDevicesWithIssuesViewController

- (TUIDevicesWithIssuesViewController)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIDevicesWithIssuesViewController;
  v9 = [(TUIDevicesWithIssuesViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_devicesWithIssuesIdentifiers, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v31[4] = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)TUIDevicesWithIssuesViewController;
  [(TUIDevicesWithIssuesViewController *)&v30 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  v4 = [(TUIDevicesWithIssuesViewController *)self view];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setClipsToBounds:1];
  v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) layer];
  [v6 setCornerRadius:10.0];

  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setScrollEnabled:0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) _setTopPadding:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) _setBottomPadding:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setSectionHeaderHeight:0.0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setSectionFooterHeight:0.0];
  id v7 = [MEMORY[0x263F1C550] clearColor];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setBackgroundColor:v7];

  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = (void *)MEMORY[0x263F08938];
  v28 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) leadingAnchor];
  v29 = [(TUIDevicesWithIssuesViewController *)self view];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v31[0] = v26;
  v24 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) trailingAnchor];
  v25 = [(TUIDevicesWithIssuesViewController *)self view];
  v23 = [v25 trailingAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v31[1] = v21;
  v20 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) topAnchor];
  id v8 = [(TUIDevicesWithIssuesViewController *)self view];
  v9 = [v8 topAnchor];
  v10 = [v20 constraintEqualToAnchor:v9];
  v31[2] = v10;
  v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) bottomAnchor];
  objc_super v12 = [(TUIDevicesWithIssuesViewController *)self view];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v31[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  [v22 activateConstraints:v15];

  v16 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) heightAnchor];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v5) contentSize];
  v18 = [v16 constraintEqualToConstant:v17];
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  self->_tableViewHeightConstraint = v18;

  [(NSLayoutConstraint *)self->_tableViewHeightConstraint setActive:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a4;
  deviceSpecifierProvider = self->_deviceSpecifierProvider;
  id v8 = a5;
  if ([(TUIDevicesWithIssuesSpecifierProvider *)deviceSpecifierProvider devicesWithIssuesCount])
  {
    [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  }
  else
  {
    [MEMORY[0x263F1C550] clearColor];
  v9 = };
  [v16 setBackgroundColor:v9];

  uint64_t v10 = [v8 row];
  uint64_t v11 = (int)*MEMORY[0x263F5FDD0];
  objc_super v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  uint64_t v13 = [v8 section];

  if (v10 == [v12 numberOfRowsInSection:v13] - 1)
  {
    [*(id *)((char *)&self->super.super.super.super.super.isa + v11) bounds];
    objc_msgSend(v16, "setSeparatorInset:", 0.0, 0.0, 0.0, v14);
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa + v11) layoutIfNeeded];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v11) contentSize];
  [(NSLayoutConstraint *)self->_tableViewHeightConstraint setConstant:v15];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    v6 = [[TUIDevicesWithIssuesSpecifierProvider alloc] initWithAccountManager:self->_accountManager devicesWithIssuesIdentifiers:self->_devicesWithIssuesIdentifiers];
    deviceSpecifierProvider = self->_deviceSpecifierProvider;
    self->_deviceSpecifierProvider = v6;

    [(TUIDevicesWithIssuesSpecifierProvider *)self->_deviceSpecifierProvider setDelegate:self];
    id v8 = [(TUIDevicesWithIssuesSpecifierProvider *)self->_deviceSpecifierProvider specifiers];
    [v5 addObjectsFromArray:v8];

    v9 = (objc_class *)[v5 copy];
    uint64_t v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(TUIDevicesWithIssuesViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  else {
    [(TUIDevicesWithIssuesViewController *)self showViewController:v6 sender:v7];
  }
}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_16);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __82__TUIDevicesWithIssuesViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_40_1);
  }
  id v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_260338000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }
}

uint64_t __82__TUIDevicesWithIssuesViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_42_0);
  }
  uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }
  if ([v9 count])
  {
    uint64_t v11 = [v8 specifiers];
    [(TUIDevicesWithIssuesViewController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v11 animated:v5];
  }
  else
  {
    [(TUIDevicesWithIssuesViewController *)self reloadSpecifiers];
  }
}

uint64_t __89__TUIDevicesWithIssuesViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_16, &__block_literal_global_44_0);
  }
  uint64_t v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_260338000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }
}

uint64_t __94__TUIDevicesWithIssuesViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_16 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
}

- (TUIDevicesWithIssuesSpecifierProvider)deviceSpecifierProvider
{
  return self->_deviceSpecifierProvider;
}

- (void)setDeviceSpecifierProvider:(id)a3
{
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end