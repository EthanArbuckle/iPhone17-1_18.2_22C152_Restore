@interface TSCellularPlanUsesViewController
+ (BOOL)sInPrivateNetworkMode:(id)a3;
+ (BOOL)sInPrivateNetworkModeForItem:(id)a3;
+ (id)sGetSelectedPlanItems;
- (BOOL)hasDoneButton;
- (NSArray)planItemBadges;
- (NSArray)selectedPlanItems;
- (NSIndexPath)chosenUseIndexPath;
- (NSLayoutConstraint)heightAnchor;
- (NSMutableArray)chosenUseIndexPaths;
- (TSCellularPlanUsesViewController)initWithType:(unint64_t)a3 withDoneButton:(BOOL)a4;
- (TSSIMSetupFlowDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)usesType;
- (void)_doneButtonTapped;
- (void)dataSwitchChanged:(id)a3;
- (void)prepare:(id)a3;
- (void)saveDefaultUse:(id)a3;
- (void)setChosenUseIndexPath:(id)a3;
- (void)setChosenUseIndexPaths:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasDoneButton:(BOOL)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setPlanItemBadges:(id)a3;
- (void)setSelectedPlanItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TSCellularPlanUsesViewController

- (TSCellularPlanUsesViewController)initWithType:(unint64_t)a3 withDoneButton:(BOOL)a4
{
  v7 = +[TSCellularPlanUsesViewController sGetSelectedPlanItems];
  BOOL v8 = +[TSCellularPlanUsesViewController sInPrivateNetworkMode:v7];
  switch(a3)
  {
    case 2uLL:
      BOOL v30 = a4;
      v13 = (void *)MEMORY[0x263F827E8];
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v13 imageNamed:@"imessage" inBundle:v14 withConfiguration:0];

      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"CELLULAR_PLAN_IMESSAGE_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"CELLULAR_PLAN_IMESSAGE_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
      v31.receiver = self;
      v31.super_class = (Class)TSCellularPlanUsesViewController;
      self = [(OBTableWelcomeController *)&v31 initWithTitle:v17 detailText:v19 icon:v15 adoptTableViewScrollView:0];

      v20 = (NSMutableArray *)objc_opt_new();
      chosenUseIndexPaths = self->_chosenUseIndexPaths;
      self->_chosenUseIndexPaths = v20;

LABEL_12:
      a4 = v30;
LABEL_13:
      self->_usesType = a3;
      self->_hasDoneButton = a4;
      objc_storeStrong((id *)&self->_selectedPlanItems, v7);
      self->_inPrivateNetworkMode = v8;
      goto LABEL_14;
    case 1uLL:
      BOOL v30 = a4;
      v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = v22;
      if (v8)
      {
        v24 = [v22 localizedStringForKey:@"CELLULAR_PLAN_DATA_TITLE_PNW" value:&stru_26DBE8E78 table:@"Localizable"];
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"CELLULAR_PLAN_DATA_DETAIL_PNW" value:&stru_26DBE8E78 table:@"Localizable"];
        v33.receiver = self;
        v33.super_class = (Class)TSCellularPlanUsesViewController;
        v27 = [(OBTableWelcomeController *)&v33 initWithTitle:v24 detailText:v26 icon:0 adoptTableViewScrollView:0];
      }
      else
      {
        v24 = [v22 localizedStringForKey:@"CELLULAR_PLAN_DATA_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"CELLULAR_PLAN_DATA_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
        v32.receiver = self;
        v32.super_class = (Class)TSCellularPlanUsesViewController;
        v27 = [(OBTableWelcomeController *)&v32 initWithTitle:v24 detailText:v26 icon:0 adoptTableViewScrollView:0];
      }
      self = v27;

      self->_dataSwitchEnabled = 0;
      goto LABEL_12;
    case 0uLL:
      BOOL v29 = a4;
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = [v9 localizedStringForKey:@"CELLULAR_PLAN_LINE_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"CELLULAR_PLAN_LINE_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
      v34.receiver = self;
      v34.super_class = (Class)TSCellularPlanUsesViewController;
      self = [(OBTableWelcomeController *)&v34 initWithTitle:v10 detailText:v12 icon:0 adoptTableViewScrollView:0];

      a4 = v29;
      break;
  }
  if (self) {
    goto LABEL_13;
  }
LABEL_14:

  return self;
}

- (void)viewDidLoad
{
  v39[1] = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)TSCellularPlanUsesViewController;
  [(TSOBTableWelcomeController *)&v38 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanUsesViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  LODWORD(v5) = self->_hasDoneButton;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = v6;
  if (v5) {
    BOOL v8 = @"DONE";
  }
  else {
    BOOL v8 = @"CONTINUE";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];

  v10 = [MEMORY[0x263F5B898] boldButton];
  doneButton = self->_doneButton;
  self->_doneButton = v10;

  [(OBBoldTrayButton *)self->_doneButton addTarget:self action:sel__doneButtonTapped forControlEvents:64];
  [(OBBoldTrayButton *)self->_doneButton setTitle:v9 forState:0];
  v12 = [(TSCellularPlanUsesViewController *)self buttonTray];
  [v12 addButton:self->_doneButton];

  if (!self->_inPrivateNetworkMode)
  {
    id v13 = objc_alloc(MEMORY[0x263F82C78]);
    v14 = objc_msgSend(v13, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(OBTableWelcomeController *)self setTableView:v14];

    v15 = [(OBTableWelcomeController *)self tableView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(OBTableWelcomeController *)self tableView];
    [v16 setRowHeight:*MEMORY[0x263F839B8]];

    v17 = [(OBTableWelcomeController *)self tableView];
    v18 = [MEMORY[0x263F825C8] clearColor];
    [v17 setBackgroundColor:v18];

    v19 = [(OBTableWelcomeController *)self tableView];
    [v19 setDataSource:self];

    v20 = [(OBTableWelcomeController *)self tableView];
    [v20 setDelegate:self];

    v21 = [(OBTableWelcomeController *)self tableView];
    [v21 setScrollEnabled:0];
  }
  unint64_t usesType = self->_usesType;
  if (usesType == 1)
  {
    if (self->_inPrivateNetworkMode)
    {
      uint64_t v24 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (usesType != 2)
  {
LABEL_11:
    v23 = [(OBTableWelcomeController *)self tableView];
    [v23 setAllowsMultipleSelection:0];
    uint64_t v24 = 0;
    goto LABEL_12;
  }
  v23 = [(OBTableWelcomeController *)self tableView];
  uint64_t v24 = 1;
  [v23 setAllowsMultipleSelection:1];
LABEL_12:

LABEL_13:
  [(OBBoldTrayButton *)self->_doneButton setEnabled:v24];
  v25 = [(OBTableWelcomeController *)self tableView];
  [v25 reloadData];

  if (!+[TSUtilities inBuddy])
  {
    v26 = [(TSCellularPlanUsesViewController *)self navigationController];
    v27 = [v26 navigationBar];
    v28 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v27 setBackgroundColor:v28];
  }
  BOOL v29 = [(OBTableWelcomeController *)self tableView];

  if (v29)
  {
    BOOL v30 = [(OBTableWelcomeController *)self tableView];
    objc_super v31 = [v30 heightAnchor];
    objc_super v32 = [(OBTableWelcomeController *)self tableView];
    [v32 contentSize];
    objc_super v34 = [v31 constraintEqualToConstant:v33];
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v34;

    v36 = (void *)MEMORY[0x263F08938];
    v39[0] = self->_heightConstraint;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    [v36 activateConstraints:v37];
  }
}

- (void)viewDidLayoutSubviews
{
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  v4 = [(TSCellularPlanUsesViewController *)self view];
  [v4 layoutIfNeeded];

  v13.receiver = self;
  v13.super_class = (Class)TSCellularPlanUsesViewController;
  [(TSCellularPlanUsesViewController *)&v13 updateViewConstraints];
  if (self->_heightConstraint)
  {
    v5 = [(OBTableWelcomeController *)self tableView];
    [v5 contentSize];
    double v7 = v6;

    BOOL v8 = [(OBTableWelcomeController *)self tableView];
    [v8 frame];
    double v10 = v9;

    if (v7 >= v10) {
      double v11 = v7;
    }
    else {
      double v11 = v10;
    }
    [(NSLayoutConstraint *)self->_heightConstraint setConstant:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)TSCellularPlanUsesViewController;
  [(OBTableWelcomeController *)&v12 viewDidLayoutSubviews];
}

+ (id)sGetSelectedPlanItems
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = +[TSCellularPlanManagerCache sharedInstance];
  v3 = [v2 planItems];

  v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSelected", (void)v13)) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v11 = [v4 sortedArrayUsingSelector:sel_compare_];

  return v11;
}

+ (BOOL)sInPrivateNetworkModeForItem:(id)a3
{
  return [a3 settingsMode] == 1;
}

+ (BOOL)sInPrivateNetworkMode:(id)a3
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
        if (+[TSCellularPlanUsesViewController sInPrivateNetworkModeForItem:](TSCellularPlanUsesViewController, "sInPrivateNetworkModeForItem:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
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

- (void)prepare:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if (!v4)
  {
    long long v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanUsesViewController prepare:]((uint64_t)self, v11);
    }
    goto LABEL_13;
  }
  p_selectedPlanItems = &self->_selectedPlanItems;
  if ([(NSArray *)self->_selectedPlanItems count] == 2)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v7 = [(NSArray *)*p_selectedPlanItems objectAtIndex:0];
    long long v8 = [v7 userLabel];
    long long v9 = [(NSArray *)*p_selectedPlanItems objectAtIndex:1];
    long long v10 = [v9 userLabel];
    long long v11 = objc_msgSend(v6, "initWithObjects:", v8, v10, 0);

    objc_super v12 = +[TSCellularPlanManagerCache sharedInstance];
    uint64_t v13 = [v12 getShortLabelsForLabels:v11];
    planItemBadges = self->_planItemBadges;
    self->_planItemBadges = v13;

    if (self->_usesType == 1)
    {
      v4[2](v4, 1);
    }
    else
    {
      objc_initWeak(&location, self);
      long long v16 = +[TSCoreTelephonyClientCache sharedInstance];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __44__TSCellularPlanUsesViewController_prepare___block_invoke;
      v17[3] = &unk_264827AC0;
      objc_copyWeak(&v19, &location);
      uint64_t v18 = v4;
      [v16 getSubscriptionInfo:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
LABEL_13:

    goto LABEL_14;
  }
  if ([(NSArray *)*p_selectedPlanItems count] >= 3)
  {
    long long v15 = _TSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TSCellularPlanUsesViewController prepare:]((id *)p_selectedPlanItems, v15);
    }
  }
  v4[2](v4, 0);
LABEL_14:
}

void __44__TSCellularPlanUsesViewController_prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v26 = a2;
  uint64_t v24 = a1;
  id v25 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id location = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained selectedPlanItems];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = 0;
    uint64_t v10 = *(void *)v31;
    char v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v14 = objc_msgSend(v26, "subscriptions", location, v24, v25);
        long long v15 = +[TSUtilities findSubscriptionContextForCellularPlanItem:v13 fromSubscriptionContexts:v14];

        if ([v15 isSimDataOnly])
        {
          char v11 = 0;
        }
        else
        {
          id v16 = v13;

          long long v9 = v16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }
  else
  {
    long long v9 = 0;
    char v11 = 1;
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TSCellularPlanUsesViewController_prepare___block_invoke_2;
  block[3] = &unk_264827B80;
  id v28 = *(id *)(v24 + 32);
  char v29 = v11 & 1;
  dispatch_async(MEMORY[0x263EF83A0], block);
  if ((v11 & 1) == 0 && v9)
  {
    id v17 = objc_loadWeakRetained(location);
    uint64_t v18 = [v17 usesType];

    if (!v18)
    {
      v21 = +[TSCellularPlanManagerCache sharedInstance];
      [v21 selectPlanForVoice:v9];
      goto LABEL_19;
    }
    id v19 = objc_loadWeakRetained(location);
    uint64_t v20 = [v19 usesType];

    if (v20 == 2)
    {
      v21 = +[TSCellularPlanManagerCache sharedInstance];
      objc_super v34 = v9;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      [v21 selectPlansForIMessage:v22];

LABEL_19:
    }
  }
}

uint64_t __44__TSCellularPlanUsesViewController_prepare___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (self->_usesType == 2)
  {
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(OBTableWelcomeController *)self tableView];

  if (v7)
  {
    unint64_t usesType = self->_usesType;
    if (!usesType)
    {
      long long v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v10 = v9;
      char v11 = @"CELLULAR_PLAN_LINE_SECTION_FOOTER";
      goto LABEL_9;
    }
    uint64_t v7 = 0;
    if (a4 && usesType == 1)
    {
      long long v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v10 = v9;
      char v11 = @"CELLULAR_PLAN_DATA_SECTION_FOOTER";
LABEL_9:
      uint64_t v7 = [v9 localizedStringForKey:v11 value:&stru_26DBE8E78 table:@"Localizable"];
    }
  }
LABEL_10:

  return v7;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "textLabel", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [MEMORY[0x263F825C8] systemGrayColor];
  [v6 setTextColor:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_inPrivateNetworkMode) {
    return 0;
  }
  if (self->_usesType == 1) {
    return 2;
  }
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    id v6 = [[TSCellularPlanUsesDataSwitchCell alloc] initWithStyle:0 reuseIdentifier:@"dataswitch"];
    BOOL dataSwitchEnabled = self->_dataSwitchEnabled;
    uint64_t v8 = [(TSCellularPlanUsesDataSwitchCell *)v6 switchControl];
    [v8 setOn:dataSwitchEnabled];

    long long v9 = [(TSCellularPlanUsesDataSwitchCell *)v6 switchControl];
    [v9 addTarget:self action:sel_dataSwitchChanged_ forControlEvents:4096];
  }
  else
  {
    id v6 = [[TSCellularPlanUsesTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"uses"];
    [(TSCellularPlanUsesDataSwitchCell *)v6 setSelectionStyle:0];
    uint64_t v10 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [v5 row]);
    long long v9 = [v10 label];

    if (self->_usesType > 1)
    {
      if ([(NSMutableArray *)self->_chosenUseIndexPaths containsObject:v5]) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = 0;
      }
      [(TSCellularPlanUsesDataSwitchCell *)v6 setAccessoryType:v13];
      long long v14 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [v5 row]);
      long long v15 = [v14 phoneNumber];
      uint64_t v16 = [v15 length];

      if (v16)
      {
        objc_super v12 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [v5 row]);
        id v17 = [v12 phoneNumber];
        uint64_t v18 = +[TSUtilities formattedPhoneNumber:v17 withCountryCode:0];
        id v19 = -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", [v5 row]);
        [(TSCellularPlanUsesDataSwitchCell *)v6 setLabel:v9 description:v18 badge:v19];
      }
      else
      {
        uint64_t v20 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [v5 row]);
        v21 = [v20 carrierName];
        uint64_t v22 = [v21 length];

        if (v22)
        {
          v23 = NSString;
          objc_super v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v24 = [v12 localizedStringForKey:@"CELLULAR_PLAN_IMESSAGE_NO_PHONE_NUMBER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          id v25 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [v5 row]);
          id v26 = [v25 carrierName];
          v27 = objc_msgSend(v23, "stringWithFormat:", v24, v26);
          id v28 = -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", [v5 row]);
          [(TSCellularPlanUsesDataSwitchCell *)v6 setLabel:v9 description:v27 badge:v28];
        }
        else
        {
          objc_super v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v24 = [v12 localizedStringForKey:@"CELLULAR_PLAN_IMESSAGE_NO_CARRIER_NAME" value:&stru_26DBE8E78 table:@"Localizable"];
          char v29 = -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", [v5 row]);
          [(TSCellularPlanUsesDataSwitchCell *)v6 setLabel:v9 description:v24 badge:v29];
        }
      }
    }
    else
    {
      if ([(NSIndexPath *)self->_chosenUseIndexPath isEqual:v5]) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = 0;
      }
      [(TSCellularPlanUsesDataSwitchCell *)v6 setAccessoryType:v11];
      objc_super v12 = -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", [v5 row]);
      [(TSCellularPlanUsesDataSwitchCell *)v6 setLabel:v9 description:0 badge:v12];
    }

    long long v30 = [(TSCellularPlanUsesViewController *)self traitCollection];
    uint64_t v31 = [v30 userInterfaceStyle];

    if (v31 == 1)
    {
      long long v32 = [MEMORY[0x263F825C8] colorWithWhite:0.95 alpha:1.0];
      [(TSCellularPlanUsesDataSwitchCell *)v6 setBackgroundColor:v32];
    }
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  [(OBBoldTrayButton *)self->_doneButton setEnabled:1];
  unint64_t usesType = self->_usesType;
  uint64_t v7 = [(OBTableWelcomeController *)self tableView];
  [v7 reloadData];

  if (usesType > 1)
  {
    char v8 = [(NSMutableArray *)self->_chosenUseIndexPaths containsObject:v10];
    chosenUseIndexPaths = self->_chosenUseIndexPaths;
    if (v8) {
      [(NSMutableArray *)chosenUseIndexPaths removeObject:v10];
    }
    else {
      [(NSMutableArray *)chosenUseIndexPaths addObject:v10];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_chosenUseIndexPath, a4);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (self->_usesType == 1 && [v7 section] == 1) {
    id v9 = 0;
  }
  else {
    id v9 = v8;
  }

  return v9;
}

- (void)_doneButtonTapped
{
  id v3 = [(TSCellularPlanUsesViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  objc_initWeak(&location, self);
  uint64_t v4 = dispatch_get_global_queue(2, 0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke;
  v5[3] = &unk_264827A20;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_2;
  v2[3] = &unk_2648279D0;
  v2[4] = WeakRetained;
  [WeakRetained saveDefaultUse:v2];
}

void __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_3;
  block[3] = &unk_2648279D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setUserInteractionEnabled:1];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 viewControllerDidComplete:*(void *)(a1 + 32)];
}

- (void)dataSwitchChanged:(id)a3
{
  self->_BOOL dataSwitchEnabled = [a3 isOn];
}

- (void)saveDefaultUse:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  id v5 = +[TSCellularPlanManagerCache sharedInstance];
  uint64_t v6 = +[TSCoreTelephonyClientCache sharedInstance];
  id v7 = (void *)v6;
  unint64_t v8 = 0x2681B6000uLL;
  if (self->_usesType == 2)
  {
    uint64_t v22 = (void *)v6;
    v23 = v5;
    id v9 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = self->_chosenUseIndexPaths;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "row", v22));
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    id v5 = v23;
    [v23 selectPlansForIMessage:v9];
    uint64_t v16 = _TSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanUsesViewController saveDefaultUse:]();
    }
    id v7 = v22;
    unint64_t v8 = 0x2681B6000;
  }
  else
  {
    id v9 = [(NSArray *)self->_selectedPlanItems objectAtIndex:[(NSIndexPath *)self->_chosenUseIndexPath row]];
    if (self->_usesType)
    {
      if (!self->_inPrivateNetworkMode) {
        [v5 selectPlanForData:v9];
      }
    }
    else
    {
      [v5 selectPlanForVoice:v9];
    }
    uint64_t v16 = _TSLogDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[TSCellularPlanUsesViewController saveDefaultUse:]();
    }
  }

  if (self->_usesType == 1)
  {
    id v17 = -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *(int *)(v8 + 2680)) row] == 0);
    p_BOOL dataSwitchEnabled = &self->_dataSwitchEnabled;
    BOOL v19 = *p_dataSwitchEnabled;
    uint64_t v20 = [v17 iccid];
    [v7 setDataFallbackEnabled:v19 forIccid:v20];

    v21 = _TSLogDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      [(TSCellularPlanUsesViewController *)p_dataSwitchEnabled saveDefaultUse:v21];
    }
  }
  if (v4) {
    v4[2](v4);
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

- (unint64_t)usesType
{
  return self->_usesType;
}

- (BOOL)hasDoneButton
{
  return self->_hasDoneButton;
}

- (void)setHasDoneButton:(BOOL)a3
{
  self->_hasDoneButton = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (NSIndexPath)chosenUseIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setChosenUseIndexPath:(id)a3
{
}

- (NSMutableArray)chosenUseIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setChosenUseIndexPaths:(id)a3
{
}

- (NSArray)planItemBadges
{
  return (NSArray *)objc_getProperty(self, a2, 1296, 1);
}

- (void)setPlanItemBadges:(id)a3
{
}

- (NSArray)selectedPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setSelectedPlanItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPlanItems, 0);
  objc_storeStrong((id *)&self->_planItemBadges, 0);
  objc_storeStrong((id *)&self->_chosenUseIndexPaths, 0);
  objc_storeStrong((id *)&self->_chosenUseIndexPath, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)prepare:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 1264);
  int v3 = 134218242;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  uint64_t v6 = "-[TSCellularPlanUsesViewController prepare:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]missing completion for prepare uses view : %lu @%s", (uint8_t *)&v3, 0x16u);
}

- (void)prepare:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [*a1 count];
  OUTLINED_FUNCTION_0();
  uint64_t v4 = "-[TSCellularPlanUsesViewController prepare:]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Too many select items. %lu @%s", v3, 0x16u);
}

- (void)saveDefaultUse:(os_log_t)log .cold.1(unsigned char *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*a1) {
    int v3 = @"Yes";
  }
  else {
    int v3 = @"No";
  }
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  __int16 v8 = 2080;
  id v9 = "-[TSCellularPlanUsesViewController saveDefaultUse:]";
  _os_log_debug_impl(&dword_227A17000, log, OS_LOG_TYPE_DEBUG, "[Db] data switch set to %@, non data preferred plan: %@ @%s", (uint8_t *)&v4, 0x20u);
}

- (void)saveDefaultUse:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  uint64_t v2 = "-[TSCellularPlanUsesViewController saveDefaultUse:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
}

@end