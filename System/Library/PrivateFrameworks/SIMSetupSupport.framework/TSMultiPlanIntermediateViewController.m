@interface TSMultiPlanIntermediateViewController
- (BOOL)installingTransferPlan;
- (BOOL)isOtherButtonTapped;
- (BOOL)isStandaloneProximityFlow;
- (BOOL)isTransferListCellTapped;
- (BOOL)showSIMSetup;
- (TSMultiPlanIntermediateViewController)initWithPendingInstallItems:(id)a3;
- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 pendingInstallItems:(id)a4 carrierSetupItems:(id)a5 showOtherOptions:(BOOL)a6;
- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 pendingInstallItems:(id)a4 carrierSetupItems:(id)a5 showOtherOptions:(BOOL)a6 isStandaloneProximityFlow:(BOOL)a7;
- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 showOtherOptions:(BOOL)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (double)_heightAnchorConstant;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_otherButtonTapped;
- (void)_skipButtonTapped;
- (void)setDelegate:(id)a3;
- (void)setInstallingTransferPlan:(BOOL)a3;
- (void)setIsOtherButtonTapped:(BOOL)a3;
- (void)setIsStandaloneProximityFlow:(BOOL)a3;
- (void)setIsTransferListCellTapped:(BOOL)a3;
- (void)setShowSIMSetup:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TSMultiPlanIntermediateViewController

- (TSMultiPlanIntermediateViewController)initWithPendingInstallItems:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"SET_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"MULTI_ALS_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  v22.receiver = self;
  v22.super_class = (Class)TSMultiPlanIntermediateViewController;
  v10 = [(OBTableWelcomeController *)&v22 initWithTitle:v7 detailText:v9 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pendingInstallItems, a3);
    v11->_showOtherOptions = 1;
    v12 = v11;
  }
  else
  {
    v13 = _TSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[TSMultiPlanIntermediateViewController initWithPendingInstallItems:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  return v11;
}

- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 showOtherOptions:(BOOL)a4
{
  id v7 = a3;
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"SINGLE_ESIM_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"SINGLE_ESIM_TRANSFER_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];

  v24.receiver = self;
  v24.super_class = (Class)TSMultiPlanIntermediateViewController;
  v12 = [(OBTableWelcomeController *)&v24 initWithTitle:v9 detailText:v11 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transferItems, a3);
    v13->_showOtherOptions = a4;
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TSMultiPlanIntermediateViewController initWithTransferItems:showOtherOptions:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  return v13;
}

- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 pendingInstallItems:(id)a4 carrierSetupItems:(id)a5 showOtherOptions:(BOOL)a6
{
  return [(TSMultiPlanIntermediateViewController *)self initWithTransferItems:a3 pendingInstallItems:a4 carrierSetupItems:a5 showOtherOptions:a6 isStandaloneProximityFlow:0];
}

- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 pendingInstallItems:(id)a4 carrierSetupItems:(id)a5 showOtherOptions:(BOOL)a6 isStandaloneProximityFlow:(BOOL)a7
{
  id v11 = a3;
  id obj = a4;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v12 plans];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = v11;
    uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"SET_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];

    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = v19;
    uint64_t v21 = @"MULTI_ALS_DETAIL";
LABEL_5:
    v23 = [v19 localizedStringForKey:v21 value:&stru_26DBE8E78 table:@"Localizable"];

    id v11 = v16;
    goto LABEL_6;
  }
  if ([v11 count])
  {
    id v16 = v11;
    uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v22 localizedStringForKey:@"SINGLE_ESIM_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = v19;
    uint64_t v21 = @"SINGLE_ESIM_TRANSFER_DETAIL";
    goto LABEL_5;
  }
  uint64_t v18 = 0;
  v23 = 0;
LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)TSMultiPlanIntermediateViewController;
  objc_super v24 = [(OBTableWelcomeController *)&v39 initWithTitle:v18 detailText:v23 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_transferItems, a3);
    objc_storeStrong((id *)&v25->_pendingInstallItems, obj);
    objc_storeStrong((id *)&v25->_carrierSetupItems, a5);
    v25->_showOtherOptions = a6;
    v25->_isStandaloneProximityFlow = a7;
    v26 = v25;
  }
  else
  {
    v27 = _TSLogDomain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[TSMultiPlanIntermediateViewController initWithTransferItems:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  return v25;
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)TSMultiPlanIntermediateViewController;
  [(TSOBTableWelcomeController *)&v29 viewDidLoad];
  self->_inBuddy = +[TSUtilities inBuddy];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSMultiPlanIntermediateViewController *)self navigationController];
  id v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  if (![(NSArray *)self->_transferItems count])
  {
    v6 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
    if ([v6 count])
    {
    }
    else
    {
      id v7 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
      uint64_t v8 = [v7 count];

      if (!v8) {
        goto LABEL_6;
      }
    }
  }
  id v9 = objc_alloc(MEMORY[0x263F82C78]);
  v10 = objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v10];

  id v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(OBTableWelcomeController *)self tableView];
  [v12 setRowHeight:*MEMORY[0x263F839B8]];

  id v13 = [(OBTableWelcomeController *)self tableView];
  [v13 setEstimatedRowHeight:1.0];

  uint64_t v14 = [(OBTableWelcomeController *)self tableView];
  [v14 setAllowsMultipleSelection:0];

  uint64_t v15 = [(OBTableWelcomeController *)self tableView];
  [v15 setScrollEnabled:1];

  id v16 = [(OBTableWelcomeController *)self tableView];
  uint64_t v17 = [MEMORY[0x263F825C8] clearColor];
  [v16 setBackgroundColor:v17];

  uint64_t v18 = [(OBTableWelcomeController *)self tableView];
  [v18 setDataSource:self];

  uint64_t v19 = [(OBTableWelcomeController *)self tableView];
  [v19 reloadData];

  uint64_t v20 = [(OBTableWelcomeController *)self tableView];
  uint64_t v21 = [v20 heightAnchor];
  [(TSMultiPlanIntermediateViewController *)self _heightAnchorConstant];
  objc_msgSend(v21, "constraintEqualToConstant:");
  uint64_t v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tableHeightAnchor = self->_tableHeightAnchor;
  self->_tableHeightAnchor = v22;

  [(NSLayoutConstraint *)self->_tableHeightAnchor setActive:1];
LABEL_6:
  if (!+[TSUtilities inBuddy] && self->_showOtherOptions)
  {
    objc_super v24 = [MEMORY[0x263F5B8D0] linkButton];
    [v24 addTarget:self action:sel__otherButtonTapped forControlEvents:64];
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26DBE8E78 table:@"Localizable"];
    [v24 setTitle:v26 forState:0];

    v27 = [(TSMultiPlanIntermediateViewController *)self buttonTray];
    [v27 addButton:v24];
  }
  if (+[TSUtilities inBuddy])
  {
    if (!self->_isStandaloneProximityFlow) {
      return;
    }
    uint64_t v28 = [(OBBaseWelcomeController *)self navigationItem];
    [v28 setHidesBackButton:1];
  }
  else
  {
    uint64_t v28 = [(TSMultiPlanIntermediateViewController *)self delegate];
    [v28 setDefaultNavigationItems:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSMultiPlanIntermediateViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  self->_isOtherButtonTapped = 0;
  self->_isTransferListCellTapped = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSMultiPlanIntermediateViewController;
  [(TSMultiPlanIntermediateViewController *)&v5 viewDidDisappear:a3];
  if ([(TSMultiPlanIntermediateViewController *)self showSIMSetup])
  {
    objc_super v4 = [(TSMultiPlanIntermediateViewController *)self delegate];
    [v4 receivedResponse];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (+[TSUtilities inBuddy]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v6, "stringWithFormat:", @"options%ld", objc_msgSend(v7, "section"));
  v10 = [v8 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:v9];
  }
  id v11 = [v10 contentView];
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  [v10 setAccessoryType:1];
  id v12 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v10 setBackgroundColor:v12];

  id v13 = [v10 textLabel];
  [v13 setLineBreakMode:0];

  uint64_t v14 = [v10 textLabel];
  [v14 setNumberOfLines:0];

  uint64_t v15 = [v10 textLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  uint64_t v17 = [v10 textLabel];
  [v17 setFont:v16];

  uint64_t v18 = [v10 detailTextLabel];
  [v18 setLineBreakMode:0];

  uint64_t v19 = [v10 detailTextLabel];
  [v19 setNumberOfLines:0];

  uint64_t v20 = [v10 detailTextLabel];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  uint64_t v22 = [v10 detailTextLabel];
  [v22 setFont:v21];

  uint64_t v23 = [v7 section];
  if (!v23)
  {
    NSUInteger v30 = [(NSArray *)self->_transferItems count];
    uint64_t v31 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
    uint64_t v32 = [v31 count];

    uint64_t v33 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    uint64_t v34 = [v33 count];

    if (!v30 || v32 || v34)
    {
      if (!v30 && !v32 && !v34)
      {
        v27 = 0;
        v25 = 0;
LABEL_20:
        uint64_t v28 = (void *)MEMORY[0x263F827E8];
        objc_super v29 = @"iphone.and.arrow.forward";
        goto LABEL_21;
      }
      v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v43 localizedStringForKey:@"MULTI_ALS_TEXT" value:&stru_26DBE8E78 table:@"Localizable"];

      v44 = NSString;
      objc_super v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v42 = [v39 localizedStringForKey:@"MULTI_ALS_SUBTEXT_WITH_COUNT_%lu" value:&stru_26DBE8E78 table:@"Plurals"];
      objc_msgSend(v44, "localizedStringWithFormat:", v42, v32 + v30 + v34);
    }
    else
    {
      v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v35 localizedStringForKey:@"TRANSFER_PLAN_ITEM_TITLE_MULTIPLE" value:&stru_26DBE8E78 table:@"Localizable"];

      BOOL v36 = +[TSUtilities isPad];
      v37 = NSString;
      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v39 = v38;
      if (v36) {
        v40 = @"IPAD_MULTI_TRANSFER_SUBTEXT_%lu";
      }
      else {
        v40 = @"MULTI_TRANSFER_SUBTEXT_%lu";
      }
      v42 = [v38 localizedStringForKey:v40 value:&stru_26DBE8E78 table:@"Plurals"];
      objc_msgSend(v37, "localizedStringWithFormat:", v42, v30);
    v27 = };

    goto LABEL_20;
  }
  if (!+[TSUtilities inBuddy])
  {
    v27 = 0;
    v25 = 0;
    v41 = 0;
    goto LABEL_22;
  }
  objc_super v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_26DBE8E78 table:@"Localizable"];

  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS_SUB" value:&stru_26DBE8E78 table:@"Localizable"];

  uint64_t v28 = (void *)MEMORY[0x263F827E8];
  objc_super v29 = @"gear";
LABEL_21:
  v41 = [v28 systemImageNamed:v29];
  v45 = [v10 textLabel];
  [v45 setText:v25];

  v46 = [v10 detailTextLabel];
  [v46 setText:v27];

LABEL_22:
  v47 = [MEMORY[0x263F825C8] systemBlueColor];
  v48 = [v41 imageWithTintColor:v47];

  [v48 size];
  CGFloat v50 = v49 * 1.5;
  [v48 size];
  v60.height = v51 * 1.5;
  v60.width = v50;
  UIGraphicsBeginImageContextWithOptions(v60, 0, 0.0);
  [v48 size];
  double v53 = v52 * 1.5;
  [v48 size];
  objc_msgSend(v48, "drawInRect:", 0.0, 0.0, v53, v54 * 1.5);
  v55 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v56 = (id)[v55 imageWithRenderingMode:1];
  v57 = [v10 imageView];
  [v57 setImage:v55];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  if ([v7 section])
  {
    if ([v7 section] == 1) {
      [(TSMultiPlanIntermediateViewController *)self _skipButtonTapped];
    }
  }
  else
  {
    self->_isTransferListCellTapped = 1;
    objc_super v5 = [(TSMultiPlanIntermediateViewController *)self delegate];
    [v5 viewControllerDidComplete:self];
  }
  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.100000001;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  objc_super v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v5;
}

- (void)_otherButtonTapped
{
  self->_isOtherButtonTapped = 1;
  id v3 = [(TSMultiPlanIntermediateViewController *)self delegate];
  [v3 viewControllerDidComplete:self];
}

- (void)_skipButtonTapped
{
  if (+[TSUtilities inBuddy])
  {
    id v3 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
    if ([v3 count])
    {
LABEL_5:

LABEL_6:
      objc_super v5 = (void *)MEMORY[0x263F82418];
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"SKIP_SETUP_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = [v8 localizedStringForKey:@"SKIP_SETUP_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
      v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

      id v11 = (void *)MEMORY[0x263F82400];
      id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"SKIP" value:&stru_26DBE8E78 table:@"Localizable"];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __58__TSMultiPlanIntermediateViewController__skipButtonTapped__block_invoke;
      v22[3] = &unk_264827F48;
      v22[4] = self;
      uint64_t v14 = [v11 actionWithTitle:v13 style:1 handler:v22];
      [v10 addAction:v14];

      uint64_t v15 = (void *)MEMORY[0x263F82400];
      id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
      uint64_t v18 = [v15 actionWithTitle:v17 style:0 handler:&__block_literal_global_6];
      [v10 addAction:v18];

      [(TSMultiPlanIntermediateViewController *)self presentViewController:v10 animated:1 completion:0];
      return;
    }
    id v4 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
    if ([v4 count])
    {

      goto LABEL_5;
    }
    uint64_t v19 = +[TSCoreTelephonyClientCache sharedInstance];
    char v20 = [v19 isEmbeddedSIMOnlyConfig];

    if (v20) {
      goto LABEL_6;
    }
  }
  id v21 = [(TSMultiPlanIntermediateViewController *)self delegate];
  [v21 userDidTapCancel];
}

void __58__TSMultiPlanIntermediateViewController__skipButtonTapped__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 userDidTapCancel];
}

- (double)_heightAnchorConstant
{
  v2 = [(TSMultiPlanIntermediateViewController *)self view];
  [v2 bounds];
  double v4 = v3 * 0.2;

  return v4;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isOtherButtonTapped
{
  return self->_isOtherButtonTapped;
}

- (void)setIsOtherButtonTapped:(BOOL)a3
{
  self->_isOtherButtonTapped = a3;
}

- (BOOL)installingTransferPlan
{
  return self->_installingTransferPlan;
}

- (void)setInstallingTransferPlan:(BOOL)a3
{
  self->_installingTransferPlan = a3;
}

- (BOOL)showSIMSetup
{
  return self->_showSIMSetup;
}

- (void)setShowSIMSetup:(BOOL)a3
{
  self->_showSIMSetup = a3;
}

- (BOOL)isTransferListCellTapped
{
  return self->_isTransferListCellTapped;
}

- (void)setIsTransferListCellTapped:(BOOL)a3
{
  self->_isTransferListCellTapped = a3;
}

- (BOOL)isStandaloneProximityFlow
{
  return self->_isStandaloneProximityFlow;
}

- (void)setIsStandaloneProximityFlow:(BOOL)a3
{
  self->_isStandaloneProximityFlow = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
}

- (void)initWithPendingInstallItems:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTransferItems:(uint64_t)a3 showOtherOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTransferItems:(uint64_t)a3 pendingInstallItems:(uint64_t)a4 carrierSetupItems:(uint64_t)a5 showOtherOptions:(uint64_t)a6 isStandaloneProximityFlow:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end