@interface ICQUINativeManageStorageController
- (AAUISpecifierProvider)appListSpecifierProvider;
- (AAUISpecifierProvider)headerSpecifierProvider;
- (AAUISpecifierProvider)tipSpecifierProvider;
- (AIDAAccountManager)accountManager;
- (BOOL)_didFetchBackupSpecifier;
- (BOOL)_didFetchPhotosSpecifier;
- (BOOL)_isFreshmintLink:(id)a3;
- (BOOL)shouldLaunchBackupDrilldown;
- (BOOL)shouldLaunchPhotosDrilldown;
- (ICQCloudStorageSummary)storageSummary;
- (ICQLiftUIPresenter)liftUIPresenter;
- (ICQPreferencesFreshmintManager)freshmintManager;
- (ICQPreferencesRemoteUIDelegate)ruiDelegate;
- (ICQUINativeManageStorageController)initWithAccountManager:(id)a3 summary:(id)a4 ruiDelegate:(id)a5;
- (ICQUIRemoteUIPresenter)remoteUIPresenter;
- (PSSpecifier)activeSpecifier;
- (id)account;
- (id)actionInfoForSpecifier:(id)a3;
- (id)icqLinkForSpecifier:(id)a3;
- (id)specifiers;
- (id)urlForSpecifier:(id)a3;
- (void)_fetchStorageSummary;
- (void)_fetchStorageSummaryIgnoreCache:(BOOL)a3 completion:(id)a4;
- (void)_launchBackupDrilldown;
- (void)_launchDeeplinksIfNeeded;
- (void)_launchLocalBackupController;
- (void)_launchPhotosDrilldown;
- (void)_startSpinnerInSpecifier:(id)a3;
- (void)_stopSpinnerInSpecifier:(id)a3;
- (void)_updateStorageSummaryAndNotify;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)launchFreshmint;
- (void)launchFreshmintFlowForLink:(id)a3;
- (void)launchFreshmintFlowForSpecifier:(id)a3;
- (void)launchICQLinkFromSpecifier:(id)a3;
- (void)launchLegacyPurchase;
- (void)launchLegacyPurchaseFromSpecifier:(id)a3;
- (void)liftUIPresenterDidCancel:(id)a3;
- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4;
- (void)liftUIPresenterDidComplete:(id)a3;
- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4;
- (void)loadDrilldownFromSpecifier:(id)a3;
- (void)loadLiftUIDrilldownFromSpecifier:(id)a3;
- (void)loadRemoteUIDrilldownFromSpecifier:(id)a3;
- (void)presentLiftUISheetFromSpecifier:(id)a3;
- (void)presentRemoteUISheetFromSpecifier:(id)a3;
- (void)presentServerUISheetFromSpecifier:(id)a3;
- (void)provider:(id)a3 loadActionFromSpecifier:(id)a4;
- (void)refreshAppList;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)setAccountManager:(id)a3;
- (void)setActiveSpecifier:(id)a3;
- (void)setAppListSpecifierProvider:(id)a3;
- (void)setFreshmintManager:(id)a3;
- (void)setHeaderSpecifierProvider:(id)a3;
- (void)setLiftUIPresenter:(id)a3;
- (void)setRemoteUIPresenter:(id)a3;
- (void)setRuiDelegate:(id)a3;
- (void)setShouldLaunchBackupDrilldown:(BOOL)a3;
- (void)setShouldLaunchPhotosDrilldown:(BOOL)a3;
- (void)setStorageSummary:(id)a3;
- (void)setTipSpecifierProvider:(id)a3;
- (void)showAlertFromSpecifier:(id)a3;
- (void)specifierProvider:(id)a3 showViewController:(id)a4;
- (void)startFamilySharingFromSpecifier:(id)a3;
- (void)stopActiveSpecifier;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICQUINativeManageStorageController

- (ICQUINativeManageStorageController)initWithAccountManager:(id)a3 summary:(id)a4 ruiDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)ICQUINativeManageStorageController;
  v12 = [(ICQUINativeManageStorageController *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountManager, a3);
    objc_storeStrong((id *)&v13->_storageSummary, a4);
    objc_storeStrong((id *)&v13->_ruiDelegate, a5);
    v14 = [[ICQUIManageStorageHeaderSpecifierProvider alloc] initWithAccountManager:v9 storageSummary:v10];
    headerSpecifierProvider = v13->_headerSpecifierProvider;
    v13->_headerSpecifierProvider = (AAUISpecifierProvider *)v14;

    [(AAUISpecifierProvider *)v13->_headerSpecifierProvider setDelegate:v13];
    v16 = [[ICQUIManageStorageTipSpecifierProvider alloc] initWithAccountManager:v13->_accountManager presenter:v13 summary:v10];
    tipSpecifierProvider = v13->_tipSpecifierProvider;
    v13->_tipSpecifierProvider = (AAUISpecifierProvider *)v16;

    [(AAUISpecifierProvider *)v13->_tipSpecifierProvider setDelegate:v13];
    v18 = [ICQUIManageStorageListSpecifierProvider alloc];
    v19 = [(ICQUINativeManageStorageController *)v13 navigationItem];
    uint64_t v20 = [(ICQUIManageStorageListSpecifierProvider *)v18 initWithAccountManager:v9 navigationItem:v19];
    appListSpecifierProvider = v13->_appListSpecifierProvider;
    v13->_appListSpecifierProvider = (AAUISpecifierProvider *)v20;

    [(AAUISpecifierProvider *)v13->_appListSpecifierProvider setDelegate:v13];
    v22 = [v10 manageStoragePage];
    v23 = [v22 title];
    [(ICQUINativeManageStorageController *)v13 setTitle:v23];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v13 selector:sel__fetchStorageSummary name:@"QuotaDidChange" object:0];
  }
  return v13;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICQUINativeManageStorageController;
  [(ICQUINativeManageStorageController *)&v5 viewWillDisappear:a3];
  v4 = [(ICQUINativeManageStorageController *)self ruiDelegate];
  [v4 cancelRemoteUI];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (void)dealloc
{
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = [(ICQUINativeManageStorageController *)self headerSpecifierProvider];
    v8 = [v7 specifiers];
    id v9 = (void *)[v8 copy];

    id v10 = [(ICQUINativeManageStorageController *)self tipSpecifierProvider];
    id v11 = [v10 specifiers];
    v12 = (void *)[v11 copy];

    v13 = [(ICQUINativeManageStorageController *)self appListSpecifierProvider];
    v14 = [v13 specifiers];
    v15 = (void *)[v14 copy];

    if (v9) {
      [v6 addObjectsFromArray:v9];
    }
    if (v12) {
      [v6 addObjectsFromArray:v12];
    }
    if (v15) {
      [v6 addObjectsFromArray:v15];
    }
    v16 = (objc_class *)[v6 copy];
    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v16;

    id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _ICQGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v17, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v11 = [v8 specifiers];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ([v9 count])
  {
    v13 = [v8 specifiers];
    uint64_t v14 = [v13 count];

    if (!v14)
    {
      [(ICQUINativeManageStorageController *)self removeContiguousSpecifiers:v9 animated:v5];
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if ((unint64_t)[v9 count] >= 3)
    {
      [(ICQUINativeManageStorageController *)self reloadSpecifiers];
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    v15 = [v8 specifiers];
    [(ICQUINativeManageStorageController *)self replaceContiguousSpecifiers:v9 withSpecifiers:v15 animated:v5];

    if (isKindOfClass) {
LABEL_13:
    }
      [(ICQUINativeManageStorageController *)self _launchDeeplinksIfNeeded];
  }
  else
  {
    if (isKindOfClass)
    {
      [(ICQUINativeManageStorageController *)self addSpecifiersFromArray:v11 animated:v5];
      goto LABEL_13;
    }
    uint64_t v16 = [(ICQUINativeManageStorageController *)self numberOfGroups];
    if (v16 < 2) {
      [(ICQUINativeManageStorageController *)self addSpecifiersFromArray:v11 animated:v5];
    }
    else {
      [(ICQUINativeManageStorageController *)self insertContiguousSpecifiers:v11 atEndOfGroup:v16 - 2 animated:v5];
    }
  }
LABEL_14:
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [MEMORY[0x263F82E10] ICQUIUpsellPrefferredPresentationSize];
    objc_msgSend(v6, "setPreferredContentSize:");
    [(UIViewController *)self presentPreferredSizeWithViewController:v6 animated:1 completion:0];
  }
  else
  {
    [(ICQUINativeManageStorageController *)self showViewController:v6 sender:v7];
  }
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(ICQUINativeManageStorageController *)self setActiveSpecifier:v4];
  id v7 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  if (v7)
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    id v6 = [MEMORY[0x263F825C8] systemGrayColor];
    [v5 setColor:v6];

    [v5 startAnimating];
    [v7 setAccessoryView:v5];
  }
}

- (void)_stopSpinnerInSpecifier:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = [v6 propertyForKey:*MEMORY[0x263F602B0]];
  if (v4)
  {
    BOOL v5 = [v6 propertyForKey:*MEMORY[0x263F60028]];
    [v4 setAccessoryView:v5];
  }
  [(ICQUINativeManageStorageController *)self setActiveSpecifier:0];
}

- (void)stopActiveSpecifier
{
  id v3 = [(ICQUINativeManageStorageController *)self activeSpecifier];
  [(ICQUINativeManageStorageController *)self _stopSpinnerInSpecifier:v3];
}

- (void)provider:(id)a3 loadActionFromSpecifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController provider:loadActionFromSpecifier:](v6);
  }

  id v7 = [(ICQUINativeManageStorageController *)self icqLinkForSpecifier:v5];
  uint64_t v8 = [v7 action];
  id v9 = [v5 objectForKeyedSubscript:@"DRILLDOWN_APP_INFO"];

  id v10 = [(ICQUINativeManageStorageController *)self actionInfoForSpecifier:v5];
  id v11 = [v10 confirmation];

  if (v11)
  {
    [(ICQUINativeManageStorageController *)self showAlertFromSpecifier:v5];
  }
  else if (v9 || v8 == 110)
  {
    [(ICQUINativeManageStorageController *)self loadDrilldownFromSpecifier:v5];
  }
  else
  {
    switch(v8)
    {
      case 'm':
        goto LABEL_13;
      case 'o':
        [(ICQUINativeManageStorageController *)self startFamilySharingFromSpecifier:v5];
        break;
      case 'p':
      case 's':
      case 'x':
      case 'y':
        [(ICQUINativeManageStorageController *)self presentServerUISheetFromSpecifier:v5];
        break;
      case 'w':
        [(ICQUINativeManageStorageController *)self launchLegacyPurchaseFromSpecifier:v5];
        break;
      default:
        v12 = _ICQGetLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138412290;
          uint64_t v14 = v7;
          _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "Unhandled action in link %@, falling back to default icq flow", (uint8_t *)&v13, 0xCu);
        }

LABEL_13:
        [(ICQUINativeManageStorageController *)self launchICQLinkFromSpecifier:v5];
        break;
    }
  }
}

- (void)launchICQLinkFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQUINativeManageStorageController *)self activeSpecifier];

  if (v5)
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v6 = [v4 objectForKeyedSubscript:@"ACTION_INFO"];
    uint64_t v14 = [v6 icqLink];
    [v14 performAction];
  }
}

- (void)launchLegacyPurchaseFromSpecifier:(id)a3
{
  id v4 = [(ICQUINativeManageStorageController *)self activeSpecifier];

  if (v4)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    [(ICQUINativeManageStorageController *)self launchLegacyPurchase];
  }
}

- (void)launchLegacyPurchase
{
  id v2 = [(ICQUINativeManageStorageController *)self ruiDelegate];
  [v2 beginLegacyFlow];
}

- (void)presentServerUISheetFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"ACTION_INFO"];
  uint64_t v6 = [v5 icqLink];
  if ([v6 action] == 112 || objc_msgSend(v6, "action") == 110)
  {
    [(ICQUINativeManageStorageController *)self presentRemoteUISheetFromSpecifier:v4];
  }
  else if ([v6 action] == 115)
  {
    [(ICQUINativeManageStorageController *)self presentLiftUISheetFromSpecifier:v4];
  }
  else if ([v6 action] == 121 || objc_msgSend(v6, "action") == 120)
  {
    [(ICQUINativeManageStorageController *)self launchFreshmintFlowForSpecifier:v4];
  }
  else
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICQUINativeManageStorageController presentServerUISheetFromSpecifier:]();
    }
  }
}

- (void)loadDrilldownFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQUINativeManageStorageController *)self activeSpecifier];

  uint64_t v6 = _ICQGetLogSystem();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:]();
    }

    uint64_t v15 = [(ICQUINativeManageStorageController *)self table];
    uint64_t v16 = [(ICQUINativeManageStorageController *)self table];
    int v17 = [v16 indexPathForSelectedRow];
    [v15 deselectRowAtIndexPath:v17 animated:1];

    uint64_t v7 = [(ICQUINativeManageStorageController *)self icqLinkForSpecifier:v4];
    if ([v7 action] == 112 || [v7 action] == 110)
    {
      [(ICQUINativeManageStorageController *)self loadRemoteUIDrilldownFromSpecifier:v4];
    }
    else if ([v7 action] == 115)
    {
      [(ICQUINativeManageStorageController *)self loadLiftUIDrilldownFromSpecifier:v4];
    }
    else
    {
      id v18 = _ICQGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:](v7);
      }
    }
  }
}

- (void)loadLiftUIDrilldownFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController loadLiftUIDrilldownFromSpecifier:]();
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v6 = [(ICQUINativeManageStorageController *)self urlForSpecifier:v4];
  uint64_t v7 = [ICQLiftUIPresenter alloc];
  uint64_t v8 = [(ICQUINativeManageStorageController *)self account];
  uint64_t v9 = [(ICQLiftUIPresenter *)v7 initWithURL:v6 account:v8 data:0];
  [(ICQUINativeManageStorageController *)self setLiftUIPresenter:v9];

  uint64_t v10 = [(ICQUINativeManageStorageController *)self liftUIPresenter];
  [v10 setDelegate:self];

  uint64_t v11 = [(ICQUINativeManageStorageController *)self liftUIPresenter];
  uint64_t v12 = [(ICQUINativeManageStorageController *)self navigationController];
  char v13 = [v11 pushInNavigationController:v12 animated:1];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _launchLiftUIWithURL:]();
    }

    [(ICQUINativeManageStorageController *)self setLiftUIPresenter:0];
  }
}

- (void)loadRemoteUIDrilldownFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController loadRemoteUIDrilldownFromSpecifier:]();
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v6 = [(ICQUINativeManageStorageController *)self urlForSpecifier:v4];
  if (v6)
  {
    uint64_t v7 = [(ICQUINativeManageStorageController *)self ruiDelegate];
    [v7 setNextSignpostId:@"MANAGE_DRILLDOWN"];

    [(ICQUINativeManageStorageController *)self _startSpinnerInSpecifier:v4];
    uint64_t v8 = [(ICQUINativeManageStorageController *)self account];
    uint64_t v9 = +[ICQCloudStorageInfo backupInfoHeadersForAccount:v8];

    uint64_t v10 = [(ICQUINativeManageStorageController *)self ruiDelegate];
    [v10 loadURL:v6 postBody:0 additionalHeaders:v9];
  }
  else
  {
    uint64_t v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICQUINativeManageStorageController loadRemoteUIDrilldownFromSpecifier:](v4);
    }
  }
}

- (void)presentRemoteUISheetFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController presentRemoteUISheetFromSpecifier:]();
  }

  uint64_t v6 = [(ICQUINativeManageStorageController *)self remoteUIPresenter];

  if (!v6)
  {
    uint64_t v7 = [ICQUIRemoteUIPresenter alloc];
    uint64_t v8 = [(ICQUINativeManageStorageController *)self account];
    uint64_t v9 = [(ICQUIRemoteUIPresenter *)v7 initWithAccount:v8 presenter:self];
    [(ICQUINativeManageStorageController *)self setRemoteUIPresenter:v9];
  }
  uint64_t v10 = [(ICQUINativeManageStorageController *)self urlForSpecifier:v4];
  uint64_t v11 = [(ICQUINativeManageStorageController *)self remoteUIPresenter];
  [v11 beginRUIFlowWithURL:v10];
}

- (void)presentLiftUISheetFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController presentLiftUISheetFromSpecifier:]();
  }

  uint64_t v6 = [(ICQUINativeManageStorageController *)self urlForSpecifier:v4];
  uint64_t v7 = [ICQLiftUIPresenter alloc];
  uint64_t v8 = [(ICQUINativeManageStorageController *)self account];
  uint64_t v9 = [(ICQLiftUIPresenter *)v7 initWithURL:v6 account:v8 data:0];
  [(ICQUINativeManageStorageController *)self setLiftUIPresenter:v9];

  uint64_t v10 = [(ICQUINativeManageStorageController *)self liftUIPresenter];
  [v10 setDelegate:self];

  uint64_t v11 = [(ICQUINativeManageStorageController *)self liftUIPresenter];
  uint64_t v12 = [(ICQUINativeManageStorageController *)self navigationController];
  char v13 = [v11 presentInViewController:v12 animated:1];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = _ICQGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICQUITipSpecifierProvider _launchLiftUIWithURL:]();
    }

    [(ICQUINativeManageStorageController *)self setLiftUIPresenter:0];
  }
}

- (id)actionInfoForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"DRILLDOWN_APP_INFO"];
  id v5 = [v4 action];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 objectForKeyedSubscript:@"ACTION_INFO"];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)icqLinkForSpecifier:(id)a3
{
  id v3 = [(ICQUINativeManageStorageController *)self actionInfoForSpecifier:a3];
  id v4 = [v3 icqLink];

  return v4;
}

- (id)urlForSpecifier:(id)a3
{
  id v3 = [(ICQUINativeManageStorageController *)self icqLinkForSpecifier:a3];
  id v4 = [v3 serverUIURL];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 actionURL];
  }
  id v7 = v6;

  return v7;
}

- (void)refreshAppList
{
  id v2 = [(ICQUINativeManageStorageController *)self appListSpecifierProvider];
  [v2 setSpecifiers:0];
}

- (void)launchFreshmintFlowForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController launchFreshmintFlowForSpecifier:]();
  }

  [(ICQUINativeManageStorageController *)self _startSpinnerInSpecifier:v4];
  id v6 = [v4 objectForKeyedSubscript:@"DRILLDOWN_APP_INFO"];
  id v7 = [v6 action];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v4 objectForKeyedSubscript:@"ACTION_INFO"];
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v10 icqLink];
  [(ICQUINativeManageStorageController *)self launchFreshmintFlowForLink:v11];
}

- (void)launchFreshmintFlowForLink:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICQUINativeManageStorageController launchFreshmintFlowForLink:]();
  }

  id v6 = [(ICQUINativeManageStorageController *)self freshmintManager];

  if (!v6)
  {
    id v7 = objc_alloc_init(ICQPreferencesFreshmintManager);
    [(ICQUINativeManageStorageController *)self setFreshmintManager:v7];

    uint64_t v8 = [(ICQUINativeManageStorageController *)self freshmintManager];
    [v8 setDelegate:self];
  }
  id v9 = [MEMORY[0x263F88928] sharedOfferManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke;
  v11[3] = &unk_264923D78;
  id v12 = v4;
  char v13 = self;
  id v10 = v4;
  [v9 getOfferWithCompletion:v11];
}

void __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke_2;
  block[3] = &unk_264922568;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) action] == 121)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = [*(id *)(a1 + 40) freshmintManager];
    [v3 setOffer:v2];

    id v8 = [*(id *)(a1 + 40) freshmintManager];
    [v8 beginFlowWithICQLink:*(void *)(a1 + 32) completion:0];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) freshmintManager];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) serverUIURL];
    if (v6)
    {
      [v8 beginFlowWithDelegate:v5 offer:v4 url:v6 completion:0];
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) actionURL];
      [v8 beginFlowWithDelegate:v5 offer:v4 url:v7 completion:0];
    }
  }
}

- (void)launchFreshmint
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(ICQUINativeManageStorageController *)self storageSummary];
  uint64_t v4 = [v3 manageStoragePage];
  uint64_t v5 = [v4 specifiers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [*(id *)(*((void *)&v25 + 1) + 8 * v9) actions];
      uint64_t v11 = [v10 firstObject];
      id v12 = [v11 icqLink];

      if ([(ICQUINativeManageStorageController *)self _isFreshmintLink:v12]) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    char v13 = [(ICQUINativeManageStorageController *)self storageSummary];
    uint64_t v14 = [v13 manageStoragePage];
    uint64_t v5 = [v14 tips];

    uint64_t v15 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v15)
    {
LABEL_17:

      [(ICQUINativeManageStorageController *)self launchFreshmintFlowForLink:0];
      return;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
LABEL_11:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v5);
      }
      uint64_t v19 = [*(id *)(*((void *)&v21 + 1) + 8 * v18) actions];
      uint64_t v20 = [v19 firstObject];
      id v12 = [v20 icqLink];

      if ([(ICQUINativeManageStorageController *)self _isFreshmintLink:v12]) {
        break;
      }

      if (v16 == ++v18)
      {
        uint64_t v16 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v16) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }
  [(ICQUINativeManageStorageController *)self launchFreshmintFlowForLink:v12];
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[ICQUINativeManageStorageController upgradeFlowManagerDidCancel:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ICQUINativeManageStorageController_upgradeFlowManagerDidCancel___block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__ICQUINativeManageStorageController_upgradeFlowManagerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopActiveSpecifier];
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[ICQUINativeManageStorageController upgradeFlowManagerDidComplete:]";
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ICQUINativeManageStorageController_upgradeFlowManagerDidComplete___block_invoke;
  block[3] = &unk_264921C80;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __68__ICQUINativeManageStorageController_upgradeFlowManagerDidComplete___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStorageSummaryAndNotify];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 stopActiveSpecifier];
}

- (void)_fetchStorageSummary
{
}

- (void)_fetchStorageSummaryIgnoreCache:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  id v7 = objc_alloc(MEMORY[0x263F888D0]);
  uint64_t v8 = [(ICQUINativeManageStorageController *)self account];
  id v19 = (id)[v7 initWithAccount:v8];

  [(id)v15[5] setShouldIgnoreCache:v4];
  uint64_t v9 = (void *)v15[5];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke;
  v11[3] = &unk_264923DC8;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  char v13 = &v14;
  [v9 fetchStorageSummaryWithCompletion:v11];

  _Block_object_dispose(&v14, 8);
}

void __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke_2;
  block[3] = &unk_264923DA0;
  uint64_t v7 = a1[4];
  uint64_t v8 = (void *)a1[5];
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  uint64_t v16 = a1[6];
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setStorageSummary:");
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)_updateStorageSummaryAndNotify
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"QuotaDidChange" object:0];
}

- (BOOL)_isFreshmintLink:(id)a3
{
  uint64_t v3 = [a3 action];
  return ((unint64_t)(v3 - 112) < 0xA) & (0x309u >> (v3 - 112));
}

- (void)startFamilySharingFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Launching start family sharing flow.", buf, 2u);
  }

  [(ICQUINativeManageStorageController *)self _startSpinnerInSpecifier:v4];
  uint64_t v34 = 0;
  uint64_t v35 = (uint64_t)&v34;
  uint64_t v36 = 0x2050000000;
  id v6 = (void *)getFACircleContextClass_softClass_2;
  v37 = (void *)getFACircleContextClass_softClass_2;
  if (!getFACircleContextClass_softClass_2)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = (uint64_t)__getFACircleContextClass_block_invoke_2;
    uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t))&unk_264921E58;
    v32 = (void (*)(uint64_t))&v34;
    __getFACircleContextClass_block_invoke_2((uint64_t)buf);
    id v6 = *(void **)(v35 + 24);
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v34, 8);
  id v8 = [v7 alloc];
  uint64_t v34 = 0;
  uint64_t v35 = (uint64_t)&v34;
  uint64_t v36 = 0x2020000000;
  id v9 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_2;
  v37 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_2;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_2)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    uint64_t v30 = (uint64_t)__getFACircleEventTypeInitiateSymbolLoc_block_invoke_2;
    uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t))&unk_264921E58;
    v32 = (void (*)(uint64_t))&v34;
    id v10 = (void *)FamilyCircleUILibrary_2();
    uint64_t v11 = dlsym(v10, "FACircleEventTypeInitiate");
    *(void *)(*((void *)v32 + 1) + 24) = v11;
    getFACircleEventTypeInitiateSymbolLoc_ptr_2 = *(void *)(*((void *)v32 + 1) + 24);
    id v9 = *(void **)(v35 + 24);
  }
  _Block_object_dispose(&v34, 8);
  if (!v9) {
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:]();
  }
  id v12 = (void *)[v8 initWithEventType:*v9];
  [v12 setClientName:@"iCloudStorage"];
  *(void *)buf = 0;
  uint64_t v29 = (uint64_t)buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__15;
  v32 = __Block_byref_object_dispose__15;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  uint64_t v20 = (void *)getFACircleStateControllerClass_softClass_2;
  uint64_t v42 = getFACircleStateControllerClass_softClass_2;
  if (!getFACircleStateControllerClass_softClass_2)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    uint64_t v36 = (uint64_t)__getFACircleStateControllerClass_block_invoke_2;
    v37 = &unk_264921E58;
    v38 = &v39;
    __getFACircleStateControllerClass_block_invoke_2((uint64_t)&v34, v13, v14, v15, v16, v17, v18, v19, v24);
    uint64_t v20 = (void *)v40[3];
  }
  long long v21 = v20;
  _Block_object_dispose(&v39, 8);
  id v33 = (id)[[v21 alloc] initWithPresenter:self];
  long long v22 = *(void **)(v29 + 40);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke;
  v25[3] = &unk_264923DF0;
  v25[4] = self;
  id v23 = v4;
  id v26 = v23;
  long long v27 = buf;
  [v22 performWithContext:v12 completion:v25];

  _Block_object_dispose(buf, 8);
}

void __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_2;
  id v12 = &unk_264921B68;
  id v4 = (void *)a1[5];
  uint64_t v13 = a1[4];
  id v14 = v4;
  dispatch_async(MEMORY[0x263EF83A0], &v9);
  id v5 = objc_msgSend(v3, "error", v9, v10, v11, v12, v13);

  if (v5)
  {
    id v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_cold_1(v3);
    }
  }
  else
  {
    [(id)a1[4] _updateStorageSummaryAndNotify];
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

uint64_t __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInSpecifier:*(void *)(a1 + 40)];
}

- (void)showAlertFromSpecifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [(ICQUINativeManageStorageController *)self actionInfoForSpecifier:a3];
  id v4 = [v3 confirmation];

  uint64_t v5 = [v4 title];
  uint64_t v20 = [v4 subtitle];
  long long v21 = (void *)v5;
  id v6 = objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v5);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v19 = v4;
  id obj = [v4 actions];
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 icqLink];
        uint64_t v13 = [v12 action];

        if ([v11 isDestructive]) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = v13 == 101;
        }
        uint64_t v15 = (void *)MEMORY[0x263F82400];
        uint64_t v16 = [v11 title];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke;
        v26[3] = &unk_264923BD0;
        v26[4] = v11;
        v26[5] = self;
        v26[6] = v13;
        uint64_t v17 = [v15 actionWithTitle:v16 style:v14 handler:v26];
        [v6 addAction:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke_2;
  v24[3] = &unk_264921C80;
  id v25 = v19;
  id v18 = v19;
  [(ICQUINativeManageStorageController *)self presentViewController:v6 animated:1 completion:v24];
}

void __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 6)
  {
    id v10 = v3;
    id v7 = [*(id *)(a1 + 32) icqLink];
    [v7 performAction];
  }
  else
  {
    if (v4 != 112) {
      goto LABEL_9;
    }
    id v10 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) actionURL];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) icqLink];
      id v7 = [v8 serverUIURL];
    }
    uint64_t v9 = [*(id *)(a1 + 40) ruiDelegate];
    [v9 loadURL:v7 postBody:0 additionalHeaders:0];

    [*(id *)(a1 + 40) _updateStorageSummaryAndNotify];
  }

  id v3 = v10;
LABEL_9:
}

void __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "Presenting alert from confirmation info: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[ICQUINativeManageStorageController liftUIPresenterDidComplete:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(ICQUINativeManageStorageController *)self liftUIPresenterDidComplete:v4 userInfo:0];
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[ICQUINativeManageStorageController liftUIPresenterDidCancel:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(ICQUINativeManageStorageController *)self liftUIPresenterDidCancel:v4 userInfo:0];
}

- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ICQUINativeManageStorageController liftUIPresenterDidComplete:userInfo:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [(ICQUINativeManageStorageController *)self navigationController];
  id v7 = (id)[v6 popViewControllerAnimated:1];

  [(ICQUINativeManageStorageController *)self setLiftUIPresenter:0];
  [(ICQUINativeManageStorageController *)self _updateStorageSummaryAndNotify];
}

- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[ICQUINativeManageStorageController liftUIPresenterDidCancel:userInfo:]";
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [(ICQUINativeManageStorageController *)self navigationController];
  id v7 = (id)[v6 popViewControllerAnimated:1];

  [(ICQUINativeManageStorageController *)self setLiftUIPresenter:0];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v7 = (void (**)(void))a4;
  int v6 = [a3 objectForKeyedSubscript:@"path"];
  if ((objc_msgSend(v6, "icqui_isChangeStoragePlanPath") & 1) != 0
    || objc_msgSend(v6, "icqui_isDeviceOffersPath"))
  {
    [(ICQUINativeManageStorageController *)self launchLegacyPurchase];
  }
  else if (objc_msgSend(v6, "icqui_isStorageUpgradePath"))
  {
    [(ICQUINativeManageStorageController *)self launchFreshmint];
  }
  else if (objc_msgSend(v6, "icqui_isPhotosPath"))
  {
    if ([(ICQUINativeManageStorageController *)self _didFetchPhotosSpecifier]) {
      [(ICQUINativeManageStorageController *)self _launchPhotosDrilldown];
    }
    else {
      [(ICQUINativeManageStorageController *)self setShouldLaunchPhotosDrilldown:1];
    }
  }
  else if (objc_msgSend(v6, "icqui_isCurrentDeviceBackupPath"))
  {
    if ([(ICQUINativeManageStorageController *)self _didFetchBackupSpecifier]) {
      [(ICQUINativeManageStorageController *)self _launchBackupDrilldown];
    }
    else {
      [(ICQUINativeManageStorageController *)self setShouldLaunchBackupDrilldown:1];
    }
  }
  else if (objc_msgSend(v6, "icqui_isLocalDeviceBackupPath"))
  {
    [(ICQUINativeManageStorageController *)self _launchLocalBackupController];
  }
  if (v7) {
    v7[2]();
  }
}

- (void)_launchDeeplinksIfNeeded
{
  if ([(ICQUINativeManageStorageController *)self shouldLaunchPhotosDrilldown]
    && [(ICQUINativeManageStorageController *)self _didFetchPhotosSpecifier])
  {
    [(ICQUINativeManageStorageController *)self setShouldLaunchPhotosDrilldown:0];
    [(ICQUINativeManageStorageController *)self _launchPhotosDrilldown];
  }
  else if ([(ICQUINativeManageStorageController *)self shouldLaunchBackupDrilldown] {
         && [(ICQUINativeManageStorageController *)self _didFetchBackupSpecifier])
  }
  {
    [(ICQUINativeManageStorageController *)self setShouldLaunchBackupDrilldown:0];
    [(ICQUINativeManageStorageController *)self _launchBackupDrilldown];
  }
}

- (BOOL)_didFetchPhotosSpecifier
{
  id v2 = [(ICQUINativeManageStorageController *)self specifierForID:@"com.apple.mobileslideshow"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_didFetchBackupSpecifier
{
  id v2 = [(ICQUINativeManageStorageController *)self specifierForID:@"com.apple.__mobilebackup__"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_launchPhotosDrilldown
{
  BOOL v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Launching photos drilldown via deeplink", v5, 2u);
  }

  id v4 = [(ICQUINativeManageStorageController *)self specifierForID:@"com.apple.mobileslideshow"];
  [(ICQUINativeManageStorageController *)self loadDrilldownFromSpecifier:v4];
}

- (void)_launchBackupDrilldown
{
  BOOL v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Launching backup drilldown via deeplink", v5, 2u);
  }

  id v4 = [(ICQUINativeManageStorageController *)self specifierForID:@"com.apple.__mobilebackup__"];
  [(ICQUINativeManageStorageController *)self loadDrilldownFromSpecifier:v4];
}

- (void)_launchLocalBackupController
{
  BOOL v3 = [(ICQUINativeManageStorageController *)self account];
  id v6 = +[ICQLocalBackupController specifierForAccount:v3];

  id v4 = [(ICQUINativeManageStorageController *)self navigationController];
  uint64_t v5 = CreateDetailControllerInstanceWithClass();
  [v5 setParentController:0];
  [v5 setRootController:v4];
  [v5 setSpecifier:v6];
  [v4 pushViewController:v5 animated:1];
}

- (ICQCloudStorageSummary)storageSummary
{
  return self->_storageSummary;
}

- (void)setStorageSummary:(id)a3
{
}

- (ICQPreferencesRemoteUIDelegate)ruiDelegate
{
  return self->_ruiDelegate;
}

- (void)setRuiDelegate:(id)a3
{
}

- (ICQUIRemoteUIPresenter)remoteUIPresenter
{
  return self->_remoteUIPresenter;
}

- (void)setRemoteUIPresenter:(id)a3
{
}

- (ICQLiftUIPresenter)liftUIPresenter
{
  return self->_liftUIPresenter;
}

- (void)setLiftUIPresenter:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
}

- (AAUISpecifierProvider)headerSpecifierProvider
{
  return self->_headerSpecifierProvider;
}

- (void)setHeaderSpecifierProvider:(id)a3
{
}

- (AAUISpecifierProvider)tipSpecifierProvider
{
  return self->_tipSpecifierProvider;
}

- (void)setTipSpecifierProvider:(id)a3
{
}

- (AAUISpecifierProvider)appListSpecifierProvider
{
  return self->_appListSpecifierProvider;
}

- (void)setAppListSpecifierProvider:(id)a3
{
}

- (ICQPreferencesFreshmintManager)freshmintManager
{
  return self->_freshmintManager;
}

- (void)setFreshmintManager:(id)a3
{
}

- (BOOL)shouldLaunchPhotosDrilldown
{
  return self->_shouldLaunchPhotosDrilldown;
}

- (void)setShouldLaunchPhotosDrilldown:(BOOL)a3
{
  self->_shouldLaunchPhotosDrilldown = a3;
}

- (BOOL)shouldLaunchBackupDrilldown
{
  return self->_shouldLaunchBackupDrilldown;
}

- (void)setShouldLaunchBackupDrilldown:(BOOL)a3
{
  self->_shouldLaunchBackupDrilldown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshmintManager, 0);
  objc_storeStrong((id *)&self->_appListSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_tipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_headerSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
}

- (void)provider:(os_log_t)log loadActionFromSpecifier:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[ICQUINativeManageStorageController provider:loadActionFromSpecifier:]";
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "%s called", (uint8_t *)&v1, 0xCu);
}

- (void)launchICQLinkFromSpecifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)presentServerUISheetFromSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_22C821000, v0, v1, "Unable to handle action for link %@", v2, v3, v4, v5, v6);
}

- (void)loadDrilldownFromSpecifier:(void *)a1 .cold.1(void *a1)
{
  [a1 action];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v1, v2, "Invalid drilldown action %ld", v3, v4, v5, v6, v7);
}

- (void)loadDrilldownFromSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
}

- (void)loadLiftUIDrilldownFromSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
}

- (void)loadRemoteUIDrilldownFromSpecifier:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "Found no url for specifier w/ id: %@, Bailing.", v4, v5, v6, v7, v8);
}

- (void)loadRemoteUIDrilldownFromSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
}

- (void)presentRemoteUISheetFromSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
}

- (void)presentLiftUISheetFromSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
}

- (void)launchFreshmintFlowForSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
}

- (void)launchFreshmintFlowForLink:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22C821000, v0, v1, "%s called for icqLink %@.", v2, v3, v4, v5, 2u);
}

void __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "Family sharing launch error %@", v4, v5, v6, v7, v8);
}

@end