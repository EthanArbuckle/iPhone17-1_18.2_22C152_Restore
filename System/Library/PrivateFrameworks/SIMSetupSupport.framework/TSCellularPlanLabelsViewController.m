@interface TSCellularPlanLabelsViewController
- (BOOL)allowDismiss;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)forceDualSIMSetup;
- (BOOL)requireSetup;
- (BOOL)showDupLabelsFooter;
- (NSArray)planItemBadges;
- (NSLayoutConstraint)heightAnchor;
- (NSMutableArray)sortedPlanItemsWithPendingLabels;
- (NSString)iccid;
- (TSCellularPlanLabelPickerTableViewController)labelPickerViewController;
- (TSCellularPlanLabelsViewController)initWithAllowDismiss:(BOOL)a3;
- (TSCellularPlanLabelsViewController)initWithIccid:(id)a3 forceDualSIMSetup:(BOOL)a4 allowDismiss:(BOOL)a5;
- (TSSIMSetupFlowDelegate)delegate;
- (id)getPendingLabelAtIndex:(int64_t)a3;
- (id)getPlanItemByIndex:(int64_t)a3;
- (id)getPredefinedUserLabels;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonTapped;
- (void)_doneButtonTapped;
- (void)prepare:(id)a3;
- (void)prepareLabels:(id)a3;
- (void)savePlanLabels:(id)a3;
- (void)setAllowDismiss:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceDualSIMSetup:(BOOL)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setLabelPickerViewController:(id)a3;
- (void)setPendingLabel:(id)a3 forPlanItem:(id)a4;
- (void)setPlanItemBadges:(id)a3;
- (void)setRequireSetup:(BOOL)a3;
- (void)setShowDupLabelsFooter:(BOOL)a3;
- (void)setSortedPlanItemsWithPendingLabels:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSCellularPlanLabelsViewController

- (TSCellularPlanLabelsViewController)initWithAllowDismiss:(BOOL)a3
{
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CELLULAR_PLAN_LABELS_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CELLULAR_PLAN_LABELS_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
  v14.receiver = self;
  v14.super_class = (Class)TSCellularPlanLabelsViewController;
  v9 = [(OBTableWelcomeController *)&v14 initWithTitle:v6 detailText:v8 icon:0];

  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sortedPlanItemsWithPendingLabels = v9->_sortedPlanItemsWithPendingLabels;
    v9->_sortedPlanItemsWithPendingLabels = v10;

    iccid = v9->_iccid;
    v9->_iccid = 0;

    v9->_forceDualSIMSetup = 0;
    v9->_allowDismiss = a3;
    v9->_showDupLabelsFooter = 0;
  }
  return v9;
}

- (TSCellularPlanLabelsViewController)initWithIccid:(id)a3 forceDualSIMSetup:(BOOL)a4 allowDismiss:(BOOL)a5
{
  id v9 = a3;
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"CELLULAR_PLAN_LABELS_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"CELLULAR_PLAN_LABELS_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
  v18.receiver = self;
  v18.super_class = (Class)TSCellularPlanLabelsViewController;
  objc_super v14 = [(OBTableWelcomeController *)&v18 initWithTitle:v11 detailText:v13 icon:0];

  if (v14)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sortedPlanItemsWithPendingLabels = v14->_sortedPlanItemsWithPendingLabels;
    v14->_sortedPlanItemsWithPendingLabels = v15;

    objc_storeStrong((id *)&v14->_iccid, a3);
    v14->_forceDualSIMSetup = a4;
    v14->_allowDismiss = a5;
    v14->_showDupLabelsFooter = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)TSCellularPlanLabelsViewController;
  [(TSOBTableWelcomeController *)&v35 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanLabelsViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = [MEMORY[0x263F5B898] boldButton];
  doneButton = self->_doneButton;
  self->_doneButton = v6;

  [(OBBoldTrayButton *)self->_doneButton addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  v8 = self->_doneButton;
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBBoldTrayButton *)v8 setTitle:v10 forState:0];

  v11 = [(TSCellularPlanLabelsViewController *)self buttonTray];
  [v11 addButton:self->_doneButton];

  id v12 = objc_alloc(MEMORY[0x263F82C78]);
  v13 = objc_msgSend(v12, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v13];

  objc_super v14 = [(OBTableWelcomeController *)self tableView];
  [v14 setAllowsSelectionDuringEditing:1];

  v15 = [(OBTableWelcomeController *)self tableView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(OBTableWelcomeController *)self tableView];
  [v16 setRowHeight:*MEMORY[0x263F839B8]];

  v17 = [(OBTableWelcomeController *)self tableView];
  [v17 setEstimatedRowHeight:0.0];

  objc_super v18 = [(OBTableWelcomeController *)self tableView];
  v19 = [MEMORY[0x263F825C8] clearColor];
  [v18 setBackgroundColor:v19];

  v20 = [(OBTableWelcomeController *)self tableView];
  [v20 setDataSource:self];

  v21 = [(OBTableWelcomeController *)self tableView];
  [v21 setDelegate:self];

  v22 = [(OBTableWelcomeController *)self tableView];
  [v22 setScrollEnabled:0];

  v23 = [(OBTableWelcomeController *)self tableView];
  [v23 reloadData];

  v24 = [(OBTableWelcomeController *)self tableView];
  v25 = [v24 heightAnchor];
  v26 = [(OBTableWelcomeController *)self tableView];
  [v26 contentSize];
  v28 = [v25 constraintEqualToConstant:v27];
  [(TSCellularPlanLabelsViewController *)self setHeightAnchor:v28];

  v29 = [(TSCellularPlanLabelsViewController *)self heightAnchor];
  [v29 setActive:1];

  if (self->_allowDismiss) {
    v30 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  }
  else {
    v30 = 0;
  }
  v31 = [(OBBaseWelcomeController *)self navigationItem];
  [v31 setLeftBarButtonItem:v30];

  if (!+[TSUtilities inBuddy])
  {
    v32 = [(TSCellularPlanLabelsViewController *)self navigationController];
    v33 = [v32 navigationBar];
    v34 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v33 setBackgroundColor:v34];
  }
}

- (void)viewDidLayoutSubviews
{
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  v4 = [(TSCellularPlanLabelsViewController *)self view];
  [v4 layoutIfNeeded];

  v5 = [(TSCellularPlanLabelsViewController *)self heightAnchor];
  v6 = [(OBTableWelcomeController *)self tableView];
  [v6 contentSize];
  [v5 setConstant:v7];

  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanLabelsViewController;
  [(OBTableWelcomeController *)&v8 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)TSCellularPlanLabelsViewController;
  [(OBTableWelcomeController *)&v28 viewWillAppear:a3];
  if (([(TSCellularPlanLabelsViewController *)self isMovingToParentViewController] & 1) == 0)
  {
    v4 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];

    if (v4)
    {
      v5 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];
      v6 = [v5 chosenLabel];
      double v7 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];
      objc_super v8 = [v7 associatedPlanItem];
      [(TSCellularPlanLabelsViewController *)self setPendingLabel:v6 forPlanItem:v8];

      [(TSCellularPlanLabelsViewController *)self setLabelPickerViewController:0];
      id v9 = [(OBTableWelcomeController *)self tableView];
      [v9 reloadData];
    }
  }
  if ((unint64_t)[(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels count] >= 2)
  {
    v10 = [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels objectAtIndex:0];
    v11 = [v10 valueForKey:@"pendingLabel"];
    id v12 = [v11 label];

    v13 = [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels objectAtIndex:1];
    objc_super v14 = [v13 valueForKey:@"pendingLabel"];
    v15 = [v14 label];

    int v16 = [v12 isEqualToString:v15];
    if (v16)
    {
      v17 = _TSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        [(TSCellularPlanLabelsViewController *)(uint64_t)v12 viewWillAppear:v17];
      }

      BOOL v18 = 1;
    }
    else
    {
      BOOL v18 = 0;
    }
    [(OBBoldTrayButton *)self->_doneButton setEnabled:v16 ^ 1u];
    self->_showDupLabelsFooter = v18;
    id v19 = objc_alloc(MEMORY[0x263EFF8C0]);
    v20 = [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels objectAtIndex:0];
    v21 = [v20 valueForKey:@"pendingLabel"];
    v22 = [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels objectAtIndex:1];
    v23 = [v22 valueForKey:@"pendingLabel"];
    v24 = objc_msgSend(v19, "initWithObjects:", v21, v23, 0);

    v25 = +[TSCellularPlanManagerCache sharedInstance];
    v26 = [v25 getShortLabelsForLabels:v24];
    planItemBadges = self->_planItemBadges;
    self->_planItemBadges = v26;
  }
}

- (void)savePlanLabels:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  if ([(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_sortedPlanItemsWithPendingLabels;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v11 = +[TSCellularPlanManagerCache sharedInstance];
          id v12 = [v10 objectForKeyedSubscript:@"planItem"];
          v13 = [v10 objectForKeyedSubscript:@"pendingLabel"];
          id v14 = (id)[v11 setLabelForPlan:v12 label:v13];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    goto LABEL_11;
  }
  if (v4) {
LABEL_11:
  }
    v4[2](v4);
}

- (void)setPendingLabel:(id)a3 forPlanItem:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v13[0] = @"pendingLabel";
  v13[1] = @"planItem";
  v14[0] = v6;
  v14[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  if ([(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels count])
  {
    uint64_t v9 = 0;
    while (1)
    {
      v10 = [(TSCellularPlanLabelsViewController *)self getPlanItemByIndex:v9];
      v11 = [v10 uuid];
      id v12 = [v7 uuid];

      if (v11 == v12) {
        break;
      }
      if ([(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels count] <= (unint64_t)++v9) {
        goto LABEL_5;
      }
    }
    [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels replaceObjectAtIndex:v9 withObject:v8];
  }
  else
  {
LABEL_5:
    [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels addObject:v8];
  }
}

- (id)getPlanItemByIndex:(int64_t)a3
{
  v3 = [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels objectAtIndexedSubscript:(int)a3];
  v4 = [v3 objectForKeyedSubscript:@"planItem"];

  return v4;
}

- (id)getPendingLabelAtIndex:(int64_t)a3
{
  v3 = [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels objectAtIndexedSubscript:(int)a3];
  v4 = [v3 objectForKeyedSubscript:@"pendingLabel"];

  return v4;
}

- (void)prepareLabels:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TSCellularPlanManagerCache sharedInstance];
  id v6 = [v5 planItems];

  id v7 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v13 isSelected]) {
          [v7 addObject:v13];
        }
        if (!-[NSString length](self->_iccid, "length") && [v13 isInstalling])
        {
          id v14 = [v13 iccid];
          iccid = self->_iccid;
          self->_iccid = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v10);
  }

  long long v16 = [v7 sortedArrayUsingSelector:sel_compare_];
  if ((unint64_t)[v16 count] >= 2)
  {
    long long v17 = [v16 objectAtIndex:0];
    long long v18 = [v17 label];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      uint64_t v20 = [v16 objectAtIndex:0];
      [v20 userLabel];
    }
    else
    {
      uint64_t v20 = [(TSCellularPlanLabelsViewController *)self getPredefinedUserLabels];
      [v20 objectAtIndex:0];
    v21 = };
    v22 = [v16 objectAtIndex:0];
    [(TSCellularPlanLabelsViewController *)self setPendingLabel:v21 forPlanItem:v22];

    v23 = [v16 objectAtIndex:1];
    v24 = [v23 label];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      v26 = [v16 objectAtIndex:1];
      [v26 userLabel];
    }
    else
    {
      v26 = [(TSCellularPlanLabelsViewController *)self getPredefinedUserLabels];
      [v26 objectAtIndex:1];
    double v27 = };
    objc_super v28 = [v16 objectAtIndex:1];
    [(TSCellularPlanLabelsViewController *)self setPendingLabel:v27 forPlanItem:v28];

    v29 = _TSLogDomain();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanLabelsViewController prepareLabels:](v16);
    }

    v30 = _TSLogDomain();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanLabelsViewController prepareLabels:](v16);
    }
  }
  v31 = _TSLogDomain();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v16 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v43 = v32;
    __int16 v44 = 2080;
    v45 = "-[TSCellularPlanLabelsViewController prepareLabels:]";
    _os_log_impl(&dword_227A17000, v31, OS_LOG_TYPE_DEFAULT, "[sortedSelectedItems count]:%ld @%s", buf, 0x16u);
  }

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __52__TSCellularPlanLabelsViewController_prepareLabels___block_invoke;
  v35[3] = &unk_264828188;
  id v36 = v16;
  id v37 = v4;
  id v33 = v16;
  id v34 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v35);
}

uint64_t __52__TSCellularPlanLabelsViewController_prepareLabels___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  BOOL v2 = (unint64_t)[*(id *)(a1 + 32) count] > 1;
  v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);
  return v3(v1, v2);
}

- (id)getPredefinedUserLabels
{
  BOOL v2 = [MEMORY[0x263F31978] sharedManager];
  v3 = [v2 getPredefinedLabels];

  return v3;
}

- (void)prepare:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_forceDualSIMSetup)
    {
      [(TSCellularPlanLabelsViewController *)self prepareLabels:v4];
    }
    else
    {
      objc_initWeak(&location, self);
      v5 = +[TSCellularPlanManagerCache sharedInstance];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __46__TSCellularPlanLabelsViewController_prepare___block_invoke;
      v6[3] = &unk_264828570;
      objc_copyWeak(&v8, &location);
      id v7 = v4;
      [v5 shouldShowPlanSetupWithCompletion:v6];

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2;
  block[3] = &unk_264828548;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_1(v4);
    }
    goto LABEL_8;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_2(v4);
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  WeakRetained[1240] = 1;
  [WeakRetained prepareLabels:*(void *)(a1 + 32)];
LABEL_9:
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (![(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels count])
  {
    long long v17 = 0;
    goto LABEL_12;
  }
  id v6 = [(TSCellularPlanLabelsViewController *)self getPlanItemByIndex:a4];
  char v7 = [v6 iccid];
  int v8 = [v7 isEqualToString:self->_iccid];

  uint64_t v9 = v6;
  if (!v8)
  {
    uint64_t v10 = [v6 phoneNumber];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = NSString;
      v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"LABEL_FOR_PHONE_NUMBER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
      long long v15 = [v6 phoneNumber];
      long long v16 = +[TSUtilities formattedPhoneNumber:v15 withCountryCode:0];
      long long v17 = objc_msgSend(v12, "stringWithFormat:", v14, v16);

      goto LABEL_9;
    }
    uint64_t v9 = v6;
  }
  long long v18 = [v9 carrierName];
  uint64_t v19 = [v18 length];

  if (!v19)
  {
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v17 = [v13 localizedStringForKey:@"LABEL_FOR_YOUR_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];
    goto LABEL_11;
  }
  uint64_t v20 = NSString;
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"LABEL_FOR_YOUR_CARRIER_PLAN_%@" value:&stru_26DBE8E78 table:@"Localizable"];
  v21 = [v6 carrierName];
  long long v17 = objc_msgSend(v20, "stringWithFormat:", v14, v21);

LABEL_9:
LABEL_11:

LABEL_12:
  return v17;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "textLabel", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x263F825C8] systemGrayColor];
  [v6 setTextColor:v5];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  char v7 = v6;
  if (self->_showDupLabelsFooter && [v6 numberOfSections] - 1 == a4)
  {
    int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"CELLULAR_PLAN_LABELS_SECTION_FOOTER" value:&stru_26DBE8E78 table:@"Localizable"];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "textLabel", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x263F825C8] systemGrayColor];
  [v6 setTextColor:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sortedPlanItemsWithPendingLabels count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [[TSCellularPlanLabelTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"plan"];
  char v7 = -[TSCellularPlanLabelsViewController getPendingLabelAtIndex:](self, "getPendingLabelAtIndex:", [v5 section]);
  int v8 = [v7 label];

  [(TSCellularPlanLabelTableViewCell *)v6 setAccessoryType:1];
  planItemBadges = self->_planItemBadges;
  uint64_t v10 = [v5 section];

  uint64_t v11 = [(NSArray *)planItemBadges objectAtIndex:v10];
  [(TSCellularPlanLabelTableViewCell *)v6 setLabel:v8 badge:v11];

  id v12 = [(TSCellularPlanLabelsViewController *)self traitCollection];
  uint64_t v13 = [v12 userInterfaceStyle];

  if (v13 == 1)
  {
    id v14 = [MEMORY[0x263F825C8] colorWithWhite:0.95 alpha:1.0];
    [(TSCellularPlanLabelTableViewCell *)v6 setBackgroundColor:v14];
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(TSCellularPlanLabelPickerTableViewController);
  [(TSCellularPlanLabelsViewController *)self setLabelPickerViewController:v6];

  char v7 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];
  int v8 = -[TSCellularPlanLabelsViewController getPlanItemByIndex:](self, "getPlanItemByIndex:", [v5 section]);
  [v7 setAssociatedPlanItem:v8];

  uint64_t v9 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];
  uint64_t v10 = -[TSCellularPlanLabelsViewController getPendingLabelAtIndex:](self, "getPendingLabelAtIndex:", [v5 section]);
  [v9 setInitialLabel:v10];

  uint64_t v11 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];
  id v12 = [(TSCellularPlanLabelsViewController *)self getPredefinedUserLabels];
  [v11 setPredefinedUserLabels:v12];

  uint64_t v13 = [(TSCellularPlanLabelsViewController *)self navigationController];
  id v14 = [(TSCellularPlanLabelsViewController *)self labelPickerViewController];
  [v13 pushViewController:v14 animated:1];

  id v15 = [(OBTableWelcomeController *)self tableView];
  [v15 deselectRowAtIndexPath:v5 animated:1];
}

- (void)_cancelButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userDidTapCancel];
}

- (void)_doneButtonTapped
{
  v3 = [(TSCellularPlanLabelsViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  objc_initWeak(&location, self);
  id v4 = dispatch_get_global_queue(2, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke;
  v5[3] = &unk_264827A20;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_2;
  v2[3] = &unk_2648279D0;
  v2[4] = WeakRetained;
  [WeakRetained savePlanLabels:v2];
}

void __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_3;
  block[3] = &unk_2648279D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_3(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 viewControllerDidComplete:*(void *)(a1 + 32)];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)requireSetup
{
  return self->_requireSetup;
}

- (void)setRequireSetup:(BOOL)a3
{
  self->_requireSetup = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (BOOL)showDupLabelsFooter
{
  return self->_showDupLabelsFooter;
}

- (void)setShowDupLabelsFooter:(BOOL)a3
{
  self->_showDupLabelsFooter = a3;
}

- (NSMutableArray)sortedPlanItemsWithPendingLabels
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setSortedPlanItemsWithPendingLabels:(id)a3
{
}

- (TSCellularPlanLabelPickerTableViewController)labelPickerViewController
{
  return (TSCellularPlanLabelPickerTableViewController *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setLabelPickerViewController:(id)a3
{
}

- (NSArray)planItemBadges
{
  return (NSArray *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setPlanItemBadges:(id)a3
{
}

- (BOOL)forceDualSIMSetup
{
  return self->_forceDualSIMSetup;
}

- (void)setForceDualSIMSetup:(BOOL)a3
{
  self->_forceDualSIMSetup = a3;
}

- (BOOL)allowDismiss
{
  return self->_allowDismiss;
}

- (void)setAllowDismiss:(BOOL)a3
{
  self->_allowDismiss = a3;
}

- (NSString)iccid
{
  return (NSString *)objc_getProperty(self, a2, 1288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_planItemBadges, 0);
  objc_storeStrong((id *)&self->_labelPickerViewController, 0);
  objc_storeStrong((id *)&self->_sortedPlanItemsWithPendingLabels, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)viewWillAppear:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2080;
  int v8 = "-[TSCellularPlanLabelsViewController viewWillAppear:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] Chosen labels %@, %@ duplicated, disabling the continue button @%s", (uint8_t *)&v3, 0x20u);
}

- (void)prepareLabels:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 objectAtIndex:1];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_227A17000, v2, v3, "[Db] Secondary item: %@ @%s", v4, v5, v6, v7, v8);
}

- (void)prepareLabels:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 objectAtIndex:0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_227A17000, v2, v3, "[Db] Primary item: %@ @%s", v4, v5, v6, v7, v8);
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[TSCellularPlanLabelsViewController prepare:]_block_invoke_2";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid self @%s", (uint8_t *)&v1, 0xCu);
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[TSCellularPlanLabelsViewController prepare:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]No need setup @%s", (uint8_t *)&v1, 0xCu);
}

@end