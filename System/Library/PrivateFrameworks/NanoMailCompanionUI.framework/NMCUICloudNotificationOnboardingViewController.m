@interface NMCUICloudNotificationOnboardingViewController
+ (BOOL)missingCredentialsForAccounts:(id)a3;
+ (id)detailTextForAccounts:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NMCUICloudNotificationAccountDataSource)dataSource;
- (NMCUICloudNotificationOnboardingViewController)initWithAccount:(id)a3 dataSource:(id)a4 completion:(id)a5;
- (NMCUICloudNotificationOnboardingViewController)initWithAccounts:(id)a3 dataSource:(id)a4 completion:(id)a5;
- (NSArray)accounts;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (id)completion;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)accountDataSourceAccountsChanged:(id)a3;
- (void)enableButtonTapped:(id)a3;
- (void)notNowButtonTapped:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)setupView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation NMCUICloudNotificationOnboardingViewController

- (NMCUICloudNotificationOnboardingViewController)initWithAccount:(id)a3 dataSource:(id)a4 completion:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  v12 = [v11 localizedStringForKey:@"CLOUD_NOTIFICATIONS_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  v20[0] = v8;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v14 = +[NMCUICloudNotificationOnboardingViewController detailTextForAccounts:v13];
  v18.receiver = self;
  v18.super_class = (Class)NMCUICloudNotificationOnboardingViewController;
  v15 = [(OBTableWelcomeController *)&v18 initWithTitle:v12 detailText:v14 symbolName:@"bell.badge.fill"];

  if (v15)
  {
    id v19 = v8;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    [(NMCUICloudNotificationOnboardingViewController *)v15 setAccounts:v16];

    [(NMCUICloudNotificationOnboardingViewController *)v15 setCompletion:v10];
    [v9 addObserver:v15];
    [(NMCUICloudNotificationOnboardingViewController *)v15 setDataSource:v9];
    [(NMCUICloudNotificationOnboardingViewController *)v15 setupView];
  }

  return v15;
}

- (NMCUICloudNotificationOnboardingViewController)initWithAccounts:(id)a3 dataSource:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(a3, "ac_filter:", &__block_literal_global_0);
  v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  v12 = [v11 localizedStringForKey:@"CLOUD_NOTIFICATIONS_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  v13 = +[NMCUICloudNotificationOnboardingViewController detailTextForAccounts:v10];
  v16.receiver = self;
  v16.super_class = (Class)NMCUICloudNotificationOnboardingViewController;
  v14 = [(OBTableWelcomeController *)&v16 initWithTitle:v12 detailText:v13 symbolName:@"bell.badge.fill"];

  if (v14)
  {
    [v8 addObserver:v14];
    [(NMCUICloudNotificationOnboardingViewController *)v14 setDataSource:v8];
    [(NMCUICloudNotificationOnboardingViewController *)v14 setCompletion:v9];
    [(NMCUICloudNotificationOnboardingViewController *)v14 setAccounts:v10];
    [(NMCUICloudNotificationOnboardingViewController *)v14 setupView];
  }

  return v14;
}

BOOL __89__NMCUICloudNotificationOnboardingViewController_initWithAccounts_dataSource_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[NMCUICloudNotificationAccountDataSource accountSupportsNotifications:a2];
}

- (void)setupView
{
  id v27 = [MEMORY[0x263F5B898] boldButton];
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  v4 = [v3 localizedStringForKey:@"CLOUD_NOTIFICATIONS_ENABLE_BUTTON_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  [v27 setTitle:v4 forState:0];

  [v27 addTarget:self action:sel_enableButtonTapped_ forControlEvents:64];
  v5 = [(NMCUICloudNotificationOnboardingViewController *)self buttonTray];
  [v5 addButton:v27];

  v6 = [MEMORY[0x263F5B8D0] linkButton];
  v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  id v8 = [v7 localizedStringForKey:@"CLOUD_NOTIFICATIONS_SKIP_BUTTON_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  [v6 setTitle:v8 forState:0];

  [v6 addTarget:self action:sel_notNowButtonTapped_ forControlEvents:64];
  id v9 = [(NMCUICloudNotificationOnboardingViewController *)self buttonTray];
  [v9 addButton:v6];

  id v10 = [(NMCUICloudNotificationOnboardingViewController *)self buttonTray];
  v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  v12 = [v11 localizedStringForKey:@"CLOUD_NOTIFICATIONS_API_DISCLOSURE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
  [v10 setCaptionText:v12];

  id v13 = objc_alloc(MEMORY[0x263F1CA40]);
  v14 = objc_msgSend(v13, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v14];

  v15 = [(OBTableWelcomeController *)self tableView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v16 = [(OBTableWelcomeController *)self tableView];
  [v16 setScrollEnabled:0];

  v17 = [(OBTableWelcomeController *)self tableView];
  uint64_t v18 = objc_opt_class();
  id v19 = +[NMCUIAccountsSettingsViewCell reuseIdentifier];
  [v17 registerClass:v18 forCellReuseIdentifier:v19];

  v20 = [(OBTableWelcomeController *)self tableView];
  [v20 setDataSource:self];

  v21 = [(OBTableWelcomeController *)self tableView];
  [v21 setDelegate:self];

  v22 = [(OBTableWelcomeController *)self tableView];
  v23 = [v22 heightAnchor];
  v24 = [v23 constraintEqualToConstant:400.0];
  [(NMCUICloudNotificationOnboardingViewController *)self setTableViewHeightConstraint:v24];

  v25 = [(OBTableWelcomeController *)self tableView];
  v26 = [(NMCUICloudNotificationOnboardingViewController *)self tableViewHeightConstraint];
  [v25 addConstraint:v26];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(NMCUICloudNotificationOnboardingViewController *)self view];
  [v3 layoutIfNeeded];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  v7 = [(NMCUICloudNotificationOnboardingViewController *)self tableViewHeightConstraint];
  [v7 setConstant:v6];

  v8.receiver = self;
  v8.super_class = (Class)NMCUICloudNotificationOnboardingViewController;
  [(OBTableWelcomeController *)&v8 viewDidLayoutSubviews];
}

+ (id)detailTextForAccounts:(id)a3
{
  v3 = [a3 firstObject];
  v4 = [v3 acAccount];

  double v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
  double v6 = v5;
  if (v4) {
    v7 = @"CLOUD_NOTIFICATIONS_DETAIL_TINKER";
  }
  else {
    v7 = @"CLOUD_NOTIFICATIONS_DETAIL";
  }
  objc_super v8 = [v5 localizedStringForKey:v7 value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];

  return v8;
}

+ (BOOL)missingCredentialsForAccounts:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (!+[NMCUICloudNotificationAccountDataSource accountHasCredentials:](NMCUICloudNotificationAccountDataSource, "accountHasCredentials:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)enableButtonTapped:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(id)objc_opt_class() missingCredentialsForAccounts:self->_accounts])
  {
    uint64_t v5 = (void *)MEMORY[0x263F1C3F8];
    double v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
    v7 = [v6 localizedStringForKey:@"CLOUD_NOTIFICATIONS_NOT_ALL_ACCOUNT_ENABLED_ALERT_TITLE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
    long long v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
    long long v9 = [v8 localizedStringForKey:@"CLOUD_NOTIFICATIONS_NOT_ALL_ACCOUNT_ENABLED_ALERT_DETAILS" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
    long long v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    long long v11 = (void *)MEMORY[0x263F1C3F0];
    v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
    uint64_t v13 = [v12 localizedStringForKey:@"CANCEL_ALERT_BUTTON" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
    v14 = [v11 actionWithTitle:v13 style:1 handler:0];

    objc_initWeak(location, self);
    v15 = (void *)MEMORY[0x263F1C3F0];
    objc_super v16 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoMailCompanionUI"];
    v17 = [v16 localizedStringForKey:@"CONTINUE" value:&stru_26E53EF08 table:@"NanoMailCompanionUI"];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __69__NMCUICloudNotificationOnboardingViewController_enableButtonTapped___block_invoke;
    v26 = &unk_264B990F0;
    objc_copyWeak(&v28, location);
    id v27 = self;
    uint64_t v18 = [v15 actionWithTitle:v17 style:0 handler:&v23];

    objc_msgSend(v10, "addAction:", v14, v23, v24, v25, v26);
    [v10 addAction:v18];
    [(NMCUICloudNotificationOnboardingViewController *)self presentViewController:v10 animated:1 completion:0];

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  else
  {
    id v19 = [(NMCUICloudNotificationOnboardingViewController *)self dataSource];
    [v19 setCloudNotificationsEnabled:1];

    v20 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = [(NMCUICloudNotificationOnboardingViewController *)self dataSource];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v22;
      _os_log_impl(&dword_2309EA000, v21, OS_LOG_TYPE_DEFAULT, "self.dataSource.cloudNotificationsEnabled: %{public}@", (uint8_t *)location, 0xCu);
    }
    [(NMCUICloudNotificationOnboardingViewController *)self dismissViewControllerAnimated:1 completion:self->_completion];
  }
}

void __69__NMCUICloudNotificationOnboardingViewController_enableButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained dataSource];
  [v2 setCloudNotificationsEnabled:1];

  id v3 = [*(id *)(a1 + 32) completion];
  [WeakRetained dismissViewControllerAnimated:1 completion:v3];
}

- (void)notNowButtonTapped:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_accounts count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = +[NMCUIAccountsSettingsViewCell reuseIdentifier];
  long long v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  long long v10 = [(NMCUICloudNotificationOnboardingViewController *)self accounts];
  uint64_t v11 = [v6 item];

  v12 = [v10 objectAtIndexedSubscript:v11];

  uint64_t v13 = [v12 displayName];
  v14 = [v9 textLabel];
  [v14 setText:v13];

  v15 = [v12 emailAddress];
  objc_super v16 = [v9 detailTextLabel];
  [v16 setText:v15];

  v17 = [(NMCUICloudNotificationOnboardingViewController *)self dataSource];
  LODWORD(v15) = [v17 accountIsPending:v12];

  if (v15)
  {
    uint64_t v18 = [v9 spinner];
    [v9 setAccessoryView:v18];

    id v19 = [v9 spinner];
    [v19 startAnimating];

LABEL_5:
    uint64_t v20 = 0;
    goto LABEL_7;
  }
  if (+[NMCUICloudNotificationAccountDataSource accountHasCredentials:v12])
  {
    [v9 setAccessoryView:0];
    goto LABEL_5;
  }
  v21 = [v9 warningLabel];
  [v9 setAccessoryView:v21];

  uint64_t v20 = 3;
LABEL_7:
  [v9 setSelectionStyle:v20];

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(NMCUICloudNotificationOnboardingViewController *)self accounts];
  uint64_t v7 = [v5 item];

  long long v8 = [v6 objectAtIndexedSubscript:v7];

  LOBYTE(v6) = !+[NMCUICloudNotificationAccountDataSource accountHasCredentials:v8];
  return (char)v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(NMCUICloudNotificationOnboardingViewController *)self accounts];
  long long v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

  objc_initWeak(&location, self);
  long long v10 = [(NMCUICloudNotificationOnboardingViewController *)self dataSource];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__NMCUICloudNotificationOnboardingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v11[3] = &unk_264B99118;
  objc_copyWeak(&v12, &location);
  [v10 handleAccountAuthenication:v9 viewController:self stateUpdateHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __84__NMCUICloudNotificationOnboardingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__NMCUICloudNotificationOnboardingViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_264B99118;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __84__NMCUICloudNotificationOnboardingViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tableView];
  [v1 reloadData];
}

- (void)accountDataSourceAccountsChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__NMCUICloudNotificationOnboardingViewController_accountDataSourceAccountsChanged___block_invoke;
  v6[3] = &unk_264B99140;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __83__NMCUICloudNotificationOnboardingViewController_accountDataSourceAccountsChanged___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  id v3 = [*(id *)(a1 + 32) accounts];
  uint64_t v18 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v20 = a1;
  obuint64_t j = [*(id *)(a1 + 40) accounts];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v8 = [*(id *)(v20 + 32) accounts];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * j) identifier];
              v14 = [v7 identifier];
              int v15 = [v13 isEqualToString:v14];

              if (v15)
              {
                [v18 addObject:v7];
                goto LABEL_16;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  [*(id *)(v20 + 32) setAccounts:v18];
  objc_super v16 = [*(id *)(v20 + 32) tableView];
  [v16 reloadData];
}

- (NMCUICloudNotificationAccountDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end