@interface PKPaymentSetupAppRequiredViewController
- (PKPaymentSetupAppRequiredViewController)initWithSetupContext:(int64_t)a3 setupDelegate:(id)a4 product:(id)a5 linkedApplication:(id)a6;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_subtitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonTapped:(id)a3;
- (void)appViewContentSizeChanged:(id)a3;
- (void)setReporter:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupAppRequiredViewController

- (PKPaymentSetupAppRequiredViewController)initWithSetupContext:(int64_t)a3 setupDelegate:(id)a4 product:(id)a5 linkedApplication:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  v13 = [(PKPaymentSetupTableViewController *)&v16 initWithContext:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_product, a5);
    objc_storeStrong((id *)&v14->_linkedApplication, a6);
    objc_storeWeak((id *)&v14->_setupDelegate, v10);
    v14->_isBridge = PKPaymentSetupContextIsBridge();
    v14->_isBuddy = PKPaymentSetupContextIsSetupAssistant();
  }

  return v14;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  [(PKPaymentSetupAppRequiredViewController *)&v17 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKLinkedAppCellReuseIdentifier"];

  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  v7 = [(PKTableHeaderView *)self->_headerView titleLabel];
  v8 = PKLocalizedPaymentString(&cfstr_BankAppRequire.isa);
  [v7 setText:v8];

  v9 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  id v10 = [(PKPaymentSetupAppRequiredViewController *)self _subtitle];
  [v9 setText:v10];

  [(PKTableHeaderView *)self->_headerView sizeToFit];
  id v11 = [(PKPaymentSetupTableViewController *)self tableView];
  [v11 setTableHeaderView:self->_headerView];

  [(PKPaymentSetupTableViewController *)self context];
  LODWORD(v10) = PKPaymentSetupContextIsSetupAssistant();
  id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v13 = v12;
  if (v10)
  {
    v14 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v15 = (void *)[v13 initWithTitle:v14 style:0 target:self action:sel__doneButtonTapped_];
  }
  else
  {
    v15 = (void *)[v12 initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
  }
  objc_super v16 = [(PKPaymentSetupAppRequiredViewController *)self navigationItem];
  [v16 setRightBarButtonItem:v15];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  [(PKPaymentSetupTableViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  [(PKPaymentSetupAppRequiredViewController *)&v4 viewDidLayoutSubviews];
  [(PKTableHeaderView *)self->_headerView sizeToFit];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [(PKTableHeaderView *)self->_headerView bounds];
  [v3 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v5)];
}

- (id)_subtitle
{
  BOOL v3 = [(PKLinkedApplication *)self->_linkedApplication isInstalled];
  objc_super v4 = [(PKPaymentSetupProduct *)self->_product displayName];
  if (v3) {
    CGRect v5 = @"BANK_APP_REQUIRED_INSTALLED_SUBTITLE";
  }
  else {
    CGRect v5 = @"BANK_APP_REQUIRED_UNINSTALLED_SUBTITLE";
  }
  v6 = PKLocalizedPaymentString(&v5->isa, &stru_1EF1B4C70.isa, v4);
  v7 = (void *)[v6 mutableCopy];

  if (self->_isBuddy)
  {
    [v7 appendString:@"\n\n"];
    v8 = [(PKPaymentSetupProduct *)self->_product displayName];
    v9 = PKLocalizedPaymentString(&cfstr_BankAppRequire_2.isa, &stru_1EF1B4C70.isa, v8);
    [v7 appendString:v9];
  }
  id v10 = (void *)[v7 copy];

  return v10;
}

- (void)_doneButtonTapped:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    CGRect v5 = [(PKPaymentSetupAppRequiredViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return !self->_isBuddy;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  CGRect v5 = [[PKLinkedAppView alloc] initWithLinkedApplication:self->_linkedApplication reuseIdentifier:@"PKLinkedAppCellReuseIdentifier"];
  id v6 = [(PKLinkedAppView *)v5 linkedAppView];
  [v6 setDelegate:self];

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  [(PKPaymentSetupTableViewController *)&v5 tableView:a3 didSelectRowAtIndexPath:a4];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportOtherButtonPressed:@"appLink"];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupAppRequiredViewController;
  [(PKPaymentSetupTableViewController *)&v15 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:v9];
  if (![v9 section] && !objc_msgSend(v9, "row") && self->_isBridge)
  {
    id v10 = v8;
    id v11 = PKBridgeTextColor();
    [v10 setMainLabelColor:v11];

    id v12 = PKBridgeAltTextColor();
    [v10 setSubTextLabelColor:v12];

    v13 = PKBridgeBackgroundColor();
    [v10 setButtonBackgroundColor:v13];

    v14 = BPSBridgeTintColor();
    [v10 setButtonTintColor:v14];
  }
}

- (void)appViewContentSizeChanged:(id)a3
{
  objc_super v4 = [(PKPaymentSetupTableViewController *)self tableView];
  [v4 beginUpdates];

  id v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [v5 endUpdates];
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);

  objc_storeStrong((id *)&self->_product, 0);
}

@end