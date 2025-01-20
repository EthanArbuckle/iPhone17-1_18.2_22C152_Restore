@interface SSCellularPlanCarrierAppsViewController
- (BOOL)userInteractionEnabled;
- (SSCellularPlanCarrierAppsViewController)initWithCarrierApps:(id)a3 country:(id)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_userDidTapCancel;
- (void)setDelegate:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SSCellularPlanCarrierAppsViewController

- (SSCellularPlanCarrierAppsViewController)initWithCarrierApps:(id)a3 country:(id)a4
{
  id v20 = a3;
  v6 = NSString;
  v7 = (void *)MEMORY[0x263F086E0];
  id v8 = a4;
  v9 = [v7 bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"SET_UP_ESIM_TITLE_%@" value:&stru_26DBE8E78 table:@"Localizable"];
  v11 = objc_msgSend(v6, "stringWithFormat:", v10, v8);

  v12 = NSString;
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"SET_UP_ESIM_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
  v15 = objc_msgSend(v12, "stringWithFormat:", v14, v8);

  v21.receiver = self;
  v21.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  v16 = [(OBTableWelcomeController *)&v21 initWithTitle:v11 detailText:v15 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];
  v17 = v16;
  if (v16) {
    objc_storeStrong(&v16->_carrierApps, a3);
  }

  return v17;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  [(TSOBTableWelcomeController *)&v29 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(SSCellularPlanCarrierAppsViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  if (!+[TSUtilities inBuddy])
  {
    v9 = [(SSCellularPlanCarrierAppsViewController *)self navigationController];
    v10 = [v9 viewControllers];
    if ((unint64_t)[v10 count] < 2)
    {
    }
    else
    {
      BOOL v11 = +[TSUtilities isBackAllowed:self];

      if (v11)
      {
        v6 = [(OBBaseWelcomeController *)self navigationItem];
        v7 = v6;
        uint64_t v8 = 0;
        goto LABEL_7;
      }
    }
    v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__userDidTapCancel];
    v12 = [(OBBaseWelcomeController *)self navigationItem];
    [v12 setLeftBarButtonItem:v7];

    goto LABEL_10;
  }
  if (!+[TSUtilities isBackAllowed:self])
  {
    v6 = [(OBBaseWelcomeController *)self navigationItem];
    v7 = v6;
    uint64_t v8 = 1;
LABEL_7:
    [v6 setHidesBackButton:v8 animated:0];
LABEL_10:
  }
  v13 = [(SSCellularPlanCarrierAppsViewController *)self navigationController];
  v14 = [v13 navigationBar];
  v15 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v14 setBackgroundColor:v15];

  id v16 = objc_alloc(MEMORY[0x263F82C78]);
  v17 = objc_msgSend(v16, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v17];

  v18 = [(OBTableWelcomeController *)self tableView];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v19, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  id v20 = [(OBTableWelcomeController *)self tableView];
  objc_super v21 = [MEMORY[0x263F825C8] clearColor];
  [v20 setBackgroundColor:v21];

  v22 = [(OBTableWelcomeController *)self tableView];
  [v22 setDataSource:self];

  v23 = [(OBTableWelcomeController *)self tableView];
  [v23 setDelegate:self];

  v24 = [(OBTableWelcomeController *)self tableView];
  [v24 setScrollEnabled:1];

  v25 = [(OBTableWelcomeController *)self tableView];
  [v25 setAllowsSelection:0];

  v26 = [(OBTableWelcomeController *)self tableView];
  [v26 reloadData];

  v27 = [(OBTableWelcomeController *)self tableView];
  [v27 layoutIfNeeded];

  v28 = [(OBTableWelcomeController *)self tableView];
  [v28 registerClass:objc_opt_class() forCellReuseIdentifier:@"AppCell"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  [(OBTableWelcomeController *)&v3 viewWillAppear:a3];
}

- (void)viewDidLayoutSubviews
{
  objc_super v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  v4 = [(SSCellularPlanCarrierAppsViewController *)self view];
  [v4 layoutIfNeeded];

  v6.receiver = self;
  v6.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  [(SSCellularPlanCarrierAppsViewController *)&v6 updateViewConstraints];
  v5.receiver = self;
  v5.super_class = (Class)SSCellularPlanCarrierAppsViewController;
  [(OBTableWelcomeController *)&v5 viewDidLayoutSubviews];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return objc_msgSend(self->_carrierApps, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 row];
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"AppCell"];

  if (!v8) {
    uint64_t v8 = [[SSRecommendedCarrierAppCell alloc] initWithStyle:0 reuseIdentifier:@"AppCell"];
  }
  v9 = [self->_carrierApps objectAtIndexedSubscript:v7];
  [(SSRecommendedCarrierAppCell *)v8 setLockupRequest:v9 withDelegate:self];

  return v8;
}

- (BOOL)userInteractionEnabled
{
  return 1;
}

- (void)_userDidTapCancel
{
  id v2 = [(SSCellularPlanCarrierAppsViewController *)self delegate];
  [v2 userDidTapCancel];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_carrierApps, 0);
}

@end