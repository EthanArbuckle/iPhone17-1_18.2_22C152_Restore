@interface TSCellularPlanIntroViewController
- (BOOL)_hideQRCodeOption;
- (BOOL)isProximityTransferButtonTapped;
- (BOOL)isScanButtonTapped;
- (BOOL)requireDelayBluetoothConnection;
- (BOOL)userInteractionEnabled;
- (TSCellularPlanIntroViewController)initWithShowTransferOption:(BOOL)a3 requireDelayBluetoothConnection:(BOOL)a4;
- (TSCellularPlanIntroViewController)initWithTransferBackPlan:(id)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)getCellTextAt:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)transferBackPlan;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_laterButtonTapped;
- (void)_learnMoreButtonTapped;
- (void)_viewWillAppear;
- (void)setDelegate:(id)a3;
- (void)setIsProximityTransferButtonTapped:(BOOL)a3;
- (void)setIsScanButtonTapped:(BOOL)a3;
- (void)setRequireDelayBluetoothConnection:(BOOL)a3;
- (void)setTransferBackPlan:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSCellularPlanIntroViewController

- (TSCellularPlanIntroViewController)initWithShowTransferOption:(BOOL)a3 requireDelayBluetoothConnection:(BOOL)a4
{
  v7 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v8 = [v7 getSupportedFlowTypes];

  if (v8)
  {
    BOOL v9 = [(TSCellularPlanIntroViewController *)self _hideQRCodeOption];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    if (v9) {
      v12 = @"CELLULAR_PLAN_INTRO_DETAIL_NO_QR_CODE";
    }
    else {
      v12 = @"CELLULAR_PLAN_INTRO_DETAIL";
    }
    v13 = [v10 localizedStringForKey:v12 value:&stru_26DBE8E78 table:@"Localizable"];

    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"SET_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];
    v19.receiver = self;
    v19.super_class = (Class)TSCellularPlanIntroViewController;
    v16 = [(OBTableWelcomeController *)&v19 initWithTitle:v15 detailText:v13 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];

    if (v16)
    {
      v16->_showTransferOption = a3;
      v16->_requireDelayBluetoothConnection = a4;
    }
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (TSCellularPlanIntroViewController)initWithTransferBackPlan:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v7 = [v6 getSupportedFlowTypes];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v9 = [v8 localizedStringForKey:@"CELLULAR_PLAN_INTRO_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"SET_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];
    v15.receiver = self;
    v15.super_class = (Class)TSCellularPlanIntroViewController;
    v12 = [(OBTableWelcomeController *)&v15 initWithTitle:v11 detailText:v9 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];

    if (v12)
    {
      v12->_showTransferOption = 1;
      v12->_requireDelayBluetoothConnection = 0;
      objc_storeStrong(&v12->_transferBackPlan, a3);
    }
    self = v12;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)TSCellularPlanIntroViewController;
  [(TSOBTableWelcomeController *)&v34 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanIntroViewController *)self navigationController];
  id v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  if (+[TSUtilities inBuddy])
  {
    v6 = [MEMORY[0x263F5B8D0] linkButton];
    laterButton = self->_laterButton;
    self->_laterButton = v6;

    uint64_t v8 = self->_laterButton;
    BOOL v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_26DBE8E78 table:@"Localizable"];
    [(OBLinkTrayButton *)v8 setTitle:v10 forState:0];

    [(OBLinkTrayButton *)self->_laterButton addTarget:self action:sel__laterButtonTapped forControlEvents:64];
    v11 = [(TSCellularPlanIntroViewController *)self buttonTray];
    [v11 addButton:self->_laterButton];

    [(OBLinkTrayButton *)self->_laterButton setEnabled:1];
    goto LABEL_14;
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__laterButtonTapped];
  if (+[TSUtilities isPad])
  {
    v13 = [(OBBaseWelcomeController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];
    goto LABEL_10;
  }
  v14 = [(TSCellularPlanIntroViewController *)self navigationController];
  objc_super v15 = [v14 viewControllers];
  if ((unint64_t)[v15 count] < 2)
  {
  }
  else
  {
    BOOL v16 = +[TSUtilities isBackAllowed:self];

    if (v16)
    {
      v13 = [(OBBaseWelcomeController *)self navigationItem];
      [v13 setHidesBackButton:0 animated:0];
      goto LABEL_10;
    }
  }
  v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__laterButtonTapped];
  v17 = [(OBBaseWelcomeController *)self navigationItem];
  [v17 setLeftBarButtonItem:v13];

LABEL_10:
  if (_os_feature_enabled_impl() && !+[TSUtilities isPad])
  {
    v18 = [MEMORY[0x263F5B8B8] accessoryButton];
    objc_super v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"LEARN_MORE" value:&stru_26DBE8E78 table:@"Localizable"];
    [v18 setTitle:v20 forState:0];

    [v18 addTarget:self action:sel__learnMoreButtonTapped forControlEvents:64];
    v21 = [(TSCellularPlanIntroViewController *)self headerView];
    [v21 addAccessoryButton:v18];
  }
LABEL_14:
  id v22 = objc_alloc(MEMORY[0x263F82C78]);
  v23 = objc_msgSend(v22, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v23];

  v24 = [(OBTableWelcomeController *)self tableView];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v25, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  v26 = [(OBTableWelcomeController *)self tableView];
  v27 = [MEMORY[0x263F825C8] clearColor];
  [v26 setBackgroundColor:v27];

  v28 = [(OBTableWelcomeController *)self tableView];
  [v28 setDataSource:self];

  v29 = [(OBTableWelcomeController *)self tableView];
  [v29 setDelegate:self];

  v30 = [(OBTableWelcomeController *)self tableView];
  [v30 setScrollEnabled:1];

  v31 = [(OBTableWelcomeController *)self tableView];
  [v31 setAllowsMultipleSelection:0];

  v32 = [(OBTableWelcomeController *)self tableView];
  [v32 reloadData];

  v33 = [(OBTableWelcomeController *)self tableView];
  [v33 layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanIntroViewController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(TSCellularPlanIntroViewController *)self _viewWillAppear];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  objc_super v4 = [(TSCellularPlanIntroViewController *)self view];
  [v4 layoutIfNeeded];

  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanIntroViewController;
  [(TSCellularPlanIntroViewController *)&v6 updateViewConstraints];
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanIntroViewController;
  [(OBTableWelcomeController *)&v5 viewDidLayoutSubviews];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(TSCellularPlanIntroViewController *)self _hideQRCodeOption]
    || !self->_showTransferOption
    || self->_transferBackPlan)
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (id)getCellTextAt:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_showTransferOption && ![v4 row])
  {
    objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    uint64_t v8 = @"TRANSFER_CATEGORY_TITLE";
  }
  else
  {
    objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    uint64_t v8 = @"SCAN_CATEGORY_TITLE";
  }
  BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TSCellularPlanIntroViewController *)self getCellTextAt:v6];
  BOOL v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v10 = NSString;
  uint64_t v11 = [v6 section];

  v12 = objc_msgSend(v10, "stringWithFormat:", @"options%ld", v11);
  v13 = [v7 dequeueReusableCellWithIdentifier:v12];

  objc_msgSend(v8, "sizeWithFont:constrainedToSize:lineBreakMode:", v9, 0, 235.0, 3.40282347e38);
  double v15 = fmax(v14, 60.0);

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = NSString;
  id v8 = a3;
  BOOL v9 = objc_msgSend(v7, "stringWithFormat:", @"options%ld", objc_msgSend(v6, "section"));
  v10 = [v8 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:v9];
  }
  uint64_t v11 = [v10 contentView];
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  [v10 setAccessoryType:1];
  v12 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v10 setBackgroundColor:v12];

  v13 = [v10 textLabel];
  [v13 setLineBreakMode:0];

  double v14 = [v10 textLabel];
  [v14 setNumberOfLines:0];

  double v15 = [v10 textLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v17 = [v10 textLabel];
  [v17 setFont:v16];

  v18 = [MEMORY[0x263F82818] configurationWithPointSize:4 weight:2 scale:28.0];
  objc_super v19 = [MEMORY[0x263F827E8] systemImageNamed:@"iphone.and.arrow.forward" withConfiguration:v18];
  v20 = [MEMORY[0x263F827E8] systemImageNamed:@"qrcode" withConfiguration:v18];
  if (self->_showTransferOption && ![v6 row])
  {
    id v21 = v19;
    id v22 = [v10 textLabel];
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = v23;
    v25 = @"TRANSFER_CATEGORY_TITLE";
  }
  else
  {
    id v21 = v20;
    id v22 = [v10 textLabel];
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = v23;
    v25 = @"SCAN_CATEGORY_TITLE";
  }
  v26 = [v23 localizedStringForKey:v25 value:&stru_26DBE8E78 table:@"Localizable"];
  [v22 setText:v26];

  v27 = [MEMORY[0x263F825C8] systemBlueColor];
  v28 = [v21 imageWithTintColor:v27];

  [v19 size];
  double v30 = v29;
  [v20 size];
  if (v30 <= v31) {
    v32 = v20;
  }
  else {
    v32 = v19;
  }
  [v32 size];
  CGFloat v34 = v33;
  [v19 size];
  double v36 = v35;
  [v20 size];
  if (v36 <= v37) {
    v38 = v20;
  }
  else {
    v38 = v19;
  }
  [v38 size];
  v47.width = v34;
  UIGraphicsBeginImageContextWithOptions(v47, 0, 0.0);
  [v28 size];
  double v40 = v39;
  [v28 size];
  objc_msgSend(v28, "drawInRect:", 0.0, 0.0, v40, v41);
  v42 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v43 = (id)[v42 imageWithRenderingMode:1];
  v44 = [v10 imageView];
  [v44 setImage:v42];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_showTransferOption && ![v6 row]) {
    id v8 = &OBJC_IVAR___TSCellularPlanIntroViewController__isProximityTransferButtonTapped;
  }
  else {
    id v8 = &OBJC_IVAR___TSCellularPlanIntroViewController__isScanButtonTapped;
  }
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa + *v8) = 1;
  BOOL v9 = [(OBTableWelcomeController *)self tableView];
  [v9 deselectRowAtIndexPath:v7 animated:1];

  v10 = [(TSCellularPlanIntroViewController *)self delegate];
  [v10 viewControllerDidComplete:self];
}

- (BOOL)userInteractionEnabled
{
  return 1;
}

- (void)_laterButtonTapped
{
  if (+[TSUtilities inBuddy]
    && (+[TSCoreTelephonyClientCache sharedInstance],
        v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isEmbeddedSIMOnlyConfig],
        v3,
        (v4 & 1) != 0))
  {
    objc_super v5 = (void *)MEMORY[0x263F82418];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SKIP_SETUP_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v9 = [v8 localizedStringForKey:@"SKIP_SETUP_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
    v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    id v11 = (void *)MEMORY[0x263F82400];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"SKIP" value:&stru_26DBE8E78 table:@"Localizable"];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__TSCellularPlanIntroViewController__laterButtonTapped__block_invoke;
    v20[3] = &unk_264827F48;
    v20[4] = self;
    double v14 = [v11 actionWithTitle:v13 style:1 handler:v20];
    [v10 addAction:v14];

    double v15 = (void *)MEMORY[0x263F82400];
    BOOL v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v18 = [v15 actionWithTitle:v17 style:0 handler:&__block_literal_global_22];
    [v10 addAction:v18];

    [(TSCellularPlanIntroViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v19 = [(TSCellularPlanIntroViewController *)self delegate];
    [v19 userDidTapCancel];
  }
}

void __55__TSCellularPlanIntroViewController__laterButtonTapped__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 userDidTapCancel];
}

- (void)_learnMoreButtonTapped
{
  +[TSUtilities launchURL:@"https://support.apple.com/ht212780?cid=mc-ols-esim-article_ht212780-ios_ui-07192022"];
}

- (void)_viewWillAppear
{
  self->_isScanButtonTapped = 0;
  self->_isProximityTransferButtonTapped = 0;
  if (+[TSUtilities inBuddy]
    && !+[TSUtilities isBackAllowed:self])
  {
    id v3 = [(OBBaseWelcomeController *)self navigationItem];
    [v3 setHidesBackButton:1 animated:0];
  }
}

- (BOOL)_hideQRCodeOption
{
  char v2 = _os_feature_enabled_impl();
  if (+[TSUtilities inBuddy]) {
    return 0;
  }
  else {
    return +[TSUtilities isPad] & v2;
  }
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isProximityTransferButtonTapped
{
  return self->_isProximityTransferButtonTapped;
}

- (void)setIsProximityTransferButtonTapped:(BOOL)a3
{
  self->_isProximityTransferButtonTapped = a3;
}

- (BOOL)isScanButtonTapped
{
  return self->_isScanButtonTapped;
}

- (void)setIsScanButtonTapped:(BOOL)a3
{
  self->_isScanButtonTapped = a3;
}

- (BOOL)requireDelayBluetoothConnection
{
  return self->_requireDelayBluetoothConnection;
}

- (void)setRequireDelayBluetoothConnection:(BOOL)a3
{
  self->_requireDelayBluetoothConnection = a3;
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 1272, 1);
}

- (void)setTransferBackPlan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->viewController, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
}

@end