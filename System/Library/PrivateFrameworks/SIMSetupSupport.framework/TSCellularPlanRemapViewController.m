@interface TSCellularPlanRemapViewController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)hasBackButton;
- (BOOL)hasContinueButton;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CTCellularPlanItem)defaultVoiceItem;
- (CTDanglingPlanItem)danglingPlanItem;
- (NSArray)selectedPlanItems;
- (NSIndexPath)chosenTargetCellularPlanItem;
- (NSLayoutConstraint)heightAnchor;
- (TSCellularPlanRemapViewController)initWithBackButton:(BOOL)a3 continueButton:(BOOL)a4 danglingPlanItem:(id)a5;
- (TSSIMSetupFlowDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonTapped;
- (void)prepare:(id)a3;
- (void)remapDanglingItem:(id)a3;
- (void)setChosenTargetCellularPlanItem:(id)a3;
- (void)setDanglingPlanItem:(id)a3;
- (void)setDefaultVoiceItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasBackButton:(BOOL)a3;
- (void)setHasContinueButton:(BOOL)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setSelectedPlanItems:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TSCellularPlanRemapViewController

- (TSCellularPlanRemapViewController)initWithBackButton:(BOOL)a3 continueButton:(BOOL)a4 danglingPlanItem:(id)a5
{
  id v7 = a5;
  v8 = [v7 phoneNumber];
  uint64_t v9 = [v8 length];

  v10 = NSString;
  unint64_t v11 = 0x263F08000uLL;
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = v12;
  if (v9)
  {
    v14 = [v12 localizedStringForKey:@"CELLULAR_PLAN_CONTACT_DETAIL_WITH_NUMBER_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    v15 = [v7 userLabel];
    v16 = [v15 label];
    v17 = [v7 phoneNumber];
    v18 = +[TSUtilities formattedPhoneNumber:v17 withCountryCode:0];
    v19 = objc_msgSend(v10, "stringWithFormat:", v14, v16, v18);

    unint64_t v11 = 0x263F08000;
  }
  else
  {
    v14 = [v12 localizedStringForKey:@"CELLULAR_PLAN_CONTACT_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    v15 = [v7 userLabel];
    v16 = [v15 label];
    v19 = objc_msgSend(v10, "stringWithFormat:", v14, v16);
  }

  v20 = [*(id *)(v11 + 1760) bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"CELLULAR_PLAN_CONTACT_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v26.receiver = self;
  v26.super_class = (Class)TSCellularPlanRemapViewController;
  v22 = [(OBTableWelcomeController *)&v26 initWithTitle:v21 detailText:v19 icon:0];

  if (v22)
  {
    v22->_hasBackButton = a3;
    v22->_hasContinueButton = a4;
    objc_storeStrong((id *)&v22->_danglingPlanItem, a5);
  }

  return v22;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)TSCellularPlanRemapViewController;
  [(TSOBTableWelcomeController *)&v35 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanRemapViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  LODWORD(v5) = self->_hasContinueButton;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v5) {
    v8 = @"CONTINUE";
  }
  else {
    v8 = @"DONE";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];

  v10 = [MEMORY[0x263F5B898] boldButton];
  doneButton = self->_doneButton;
  self->_doneButton = v10;

  [(OBBoldTrayButton *)self->_doneButton addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  [(OBBoldTrayButton *)self->_doneButton setTitle:v9 forState:0];
  [(OBBoldTrayButton *)self->_doneButton setEnabled:0];
  v12 = [(TSCellularPlanRemapViewController *)self buttonTray];
  [v12 addButton:self->_doneButton];

  v13 = [(TSCellularPlanRemapViewController *)self navigationController];
  v14 = [v13 navigationItem];
  [v14 setHidesBackButton:!self->_hasBackButton];

  id v15 = objc_alloc(MEMORY[0x263F82C78]);
  v16 = objc_msgSend(v15, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v16];

  v17 = [(OBTableWelcomeController *)self tableView];
  v18 = [MEMORY[0x263F825C8] clearColor];
  [v17 setBackgroundColor:v18];

  v19 = [(OBTableWelcomeController *)self tableView];
  [v19 setAllowsSelectionDuringEditing:1];

  v20 = [(OBTableWelcomeController *)self tableView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(OBTableWelcomeController *)self tableView];
  [v21 setRowHeight:*MEMORY[0x263F839B8]];

  v22 = [(OBTableWelcomeController *)self tableView];
  [v22 setEstimatedRowHeight:0.0];

  v23 = [(OBTableWelcomeController *)self tableView];
  [v23 setDataSource:self];

  v24 = [(OBTableWelcomeController *)self tableView];
  [v24 setDelegate:self];

  v25 = [(OBTableWelcomeController *)self tableView];
  [v25 reloadData];

  if (!+[TSUtilities inBuddy])
  {
    objc_super v26 = [(TSCellularPlanRemapViewController *)self navigationController];
    v27 = [v26 navigationBar];
    v28 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v27 setBackgroundColor:v28];
  }
  v29 = [(OBTableWelcomeController *)self tableView];
  v30 = [v29 heightAnchor];
  v31 = [(OBTableWelcomeController *)self tableView];
  [v31 contentSize];
  v33 = [v30 constraintEqualToConstant:v32];
  [(TSCellularPlanRemapViewController *)self setHeightAnchor:v33];

  v34 = [(TSCellularPlanRemapViewController *)self heightAnchor];
  [v34 setActive:1];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(TSCellularPlanRemapViewController *)self view];
  [v3 layoutIfNeeded];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 contentSize];
  double v6 = v5;
  id v7 = [(TSCellularPlanRemapViewController *)self heightAnchor];
  [v7 setConstant:v6];

  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanRemapViewController;
  [(OBTableWelcomeController *)&v8 viewDidLayoutSubviews];
}

- (void)remapDanglingItem:(id)a3
{
  v4 = (void (**)(void))a3;
  double v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TSCellularPlanRemapViewController remapDanglingItem:]((uint64_t)self, v5);
  }

  NSInteger v6 = [(NSIndexPath *)self->_chosenTargetCellularPlanItem row];
  if (v6 == [(NSArray *)self->_selectedPlanItems count])
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanRemapViewController remapDanglingItem:](v7);
    }

    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    objc_super v8 = +[TSCellularPlanManagerCache sharedInstance];
    danglingPlanItem = self->_danglingPlanItem;
    v10 = [(NSArray *)self->_selectedPlanItems objectAtIndex:[(NSIndexPath *)self->_chosenTargetCellularPlanItem row]];
    id v11 = (id)[v8 remapSimLabel:danglingPlanItem to:v10];

    if (v4) {
      v4[2](v4);
    }
  }
}

- (void)prepare:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = +[TSCellularPlanManagerCache sharedInstance];
  NSInteger v6 = [v5 planItems];

  id v7 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 isSelected]) {
          [v7 addObject:v13];
        }
        if ([v13 isDefaultVoice]) {
          objc_storeStrong((id *)&self->_defaultVoiceItem, v13);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v14 = [v7 sortedArrayUsingSelector:sel_compare_];
  selectedPlanItems = self->_selectedPlanItems;
  self->_selectedPlanItems = v14;

  if (v4)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__TSCellularPlanRemapViewController_prepare___block_invoke;
    block[3] = &unk_264828900;
    id v17 = v4;
    objc_copyWeak(&v18, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
}

void __45__TSCellularPlanRemapViewController_prepare___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained selectedPlanItems];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, (unint64_t)[v2 count] > 1);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_selectedPlanItems count] + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  NSInteger v6 = [[TSCellularPlanRemapTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"use"];
  [(TSCellularPlanRemapTableViewCell *)v6 setSelectionStyle:0];
  uint64_t v7 = [v5 row];
  if (v7 == [(NSArray *)self->_selectedPlanItems count])
  {
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"CELLULAR_PLAN_CONTACT_ROW_DECIDE_LATER" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v10 = [(TSCellularPlanRemapTableViewCell *)v6 titleLabel];
    [v10 setText:v9];
  }
  else
  {
    uint64_t v11 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"CELLULAR_PLAN_CONTACT_ROW_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v10 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [v5 row]);
    v12 = [v10 label];
    v13 = objc_msgSend(v11, "stringWithFormat:", v9, v12);
    v14 = [(TSCellularPlanRemapTableViewCell *)v6 titleLabel];
    [v14 setText:v13];
  }
  if ([(NSIndexPath *)self->_chosenTargetCellularPlanItem isEqual:v5]) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [(TSCellularPlanRemapTableViewCell *)v6 setAccessoryType:v15];

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = NSString;
  NSInteger v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"CELLULAR_PLAN_CONTACT_SECTION_FOOTER" value:&stru_26DBE8E78 table:@"Localizable"];
  id v8 = [(CTCellularPlanItem *)self->_defaultVoiceItem userLabel];
  uint64_t v9 = [v8 label];
  uint64_t v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);

  return v10;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "textLabel", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x263F825C8] systemGrayColor];
  [v6 setTextColor:v5];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(OBBoldTrayButton *)self->_doneButton setEnabled:1];
  uint64_t v7 = [(OBTableWelcomeController *)self tableView];
  [v7 reloadData];

  objc_storeStrong((id *)&self->_chosenTargetCellularPlanItem, a4);
  if (objc_msgSend(v10, "numberOfRowsInSection:", objc_msgSend(v6, "section")) >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (v8 != [v6 row])
      {
        uint64_t v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v8, objc_msgSend(v6, "section"));
        [v10 deselectRowAtIndexPath:v9 animated:0];
      }
      ++v8;
    }
    while (v8 < objc_msgSend(v10, "numberOfRowsInSection:", objc_msgSend(v6, "section")));
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 3;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
}

- (void)_doneButtonTapped
{
  v3 = [(TSCellularPlanRemapViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  objc_initWeak(&location, self);
  id v4 = dispatch_get_global_queue(2, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke;
  v5[3] = &unk_264827A20;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_2;
  v2[3] = &unk_2648279D0;
  v2[4] = WeakRetained;
  [WeakRetained remapDanglingItem:v2];
}

void __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_3;
  block[3] = &unk_2648279D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 viewControllerDidComplete:*(void *)(a1 + 32)];
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

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (NSArray)selectedPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setSelectedPlanItems:(id)a3
{
}

- (CTDanglingPlanItem)danglingPlanItem
{
  return (CTDanglingPlanItem *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setDanglingPlanItem:(id)a3
{
}

- (CTCellularPlanItem)defaultVoiceItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setDefaultVoiceItem:(id)a3
{
}

- (NSIndexPath)chosenTargetCellularPlanItem
{
  return (NSIndexPath *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setChosenTargetCellularPlanItem:(id)a3
{
}

- (BOOL)hasBackButton
{
  return self->_hasBackButton;
}

- (void)setHasBackButton:(BOOL)a3
{
  self->_hasBackButton = a3;
}

- (BOOL)hasContinueButton
{
  return self->_hasContinueButton;
}

- (void)setHasContinueButton:(BOOL)a3
{
  self->_hasContinueButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenTargetCellularPlanItem, 0);
  objc_storeStrong((id *)&self->_defaultVoiceItem, 0);
  objc_storeStrong((id *)&self->_danglingPlanItem, 0);
  objc_storeStrong((id *)&self->_selectedPlanItems, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)remapDanglingItem:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[TSCellularPlanRemapViewController remapDanglingItem:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] update later selected, skipping remap @%s", (uint8_t *)&v1, 0xCu);
}

- (void)remapDanglingItem:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 1288) row];
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = "-[TSCellularPlanRemapViewController remapDanglingItem:]";
  _os_log_debug_impl(&dword_227A17000, a2, OS_LOG_TYPE_DEBUG, "[Db] remapping dangling item... selected row: %ld @%s", (uint8_t *)&v4, 0x16u);
}

@end