@interface TSTravelEducationIntroViewController
- (BOOL)isExistingPlanTapped;
- (BOOL)isPurchaseLocalPlanTapped;
- (BOOL)isRoamingTapped;
- (CoreTelephonyClient)client;
- (NSDictionary)options;
- (NSDictionary)text;
- (TSSIMSetupFlowDelegate)delegate;
- (TSTravelEducationIntroViewController)initWithOptions:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)getCellTextAt:(id)a3;
- (id)getDisplayOptions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonTapped;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsExistingPlanTapped:(BOOL)a3;
- (void)setIsPurchaseLocalPlanTapped:(BOOL)a3;
- (void)setIsRoamingTapped:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setText:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSTravelEducationIntroViewController

- (TSTravelEducationIntroViewController)initWithOptions:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"STAY_CONNECTED_TRAVEL_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"STAY_CONNECTED_TRAVEL_BODY" value:&stru_26DBE8E78 table:@"Localizable"];
  v23.receiver = self;
  v23.super_class = (Class)TSTravelEducationIntroViewController;
  v10 = [(OBTableWelcomeController *)&v23 initWithTitle:v7 detailText:v9 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v10->_isRoamingTapped = 0;
    v10->_isExistingPlanTapped = 0;
    v10->_isPurchaseLocalPlanTapped = 0;
    v24[0] = @"showRoamingOption";
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"TRAVEL_DATA_ROAMING_LIST_ITEM" value:&stru_26DBE8E78 table:@"Localizable"];
    v25[0] = v12;
    v24[1] = @"showLocalPlanOption";
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"TRAVEL_EXISTING_PLAN_LIST_ITEM" value:&stru_26DBE8E78 table:@"Localizable"];
    v25[1] = v14;
    v24[2] = @"showPurchaseOption";
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"TRAVEL_PURCHASE_PLAN_LIST_ITEM" value:&stru_26DBE8E78 table:@"Localizable"];
    v25[2] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    text = v10->_text;
    v10->_text = (NSDictionary *)v17;

    dispatch_queue_t v19 = dispatch_queue_create((const char *)@"Core Analytics", 0);
    uint64_t v20 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v19];
    client = v10->_client;
    v10->_client = (CoreTelephonyClient *)v20;
  }
  return v10;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)TSTravelEducationIntroViewController;
  [(TSOBTableWelcomeController *)&v20 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSTravelEducationIntroViewController *)self navigationController];
  id v5 = [v4 view];
  [v5 setBackgroundColor:v3];

  v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  v7 = [(OBBaseWelcomeController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  id v8 = objc_alloc(MEMORY[0x263F82C78]);
  v9 = objc_msgSend(v8, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v9];

  v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  v12 = [(OBTableWelcomeController *)self tableView];
  v13 = [MEMORY[0x263F825C8] clearColor];
  [v12 setBackgroundColor:v13];

  v14 = [(OBTableWelcomeController *)self tableView];
  [v14 setDataSource:self];

  v15 = [(OBTableWelcomeController *)self tableView];
  [v15 setDelegate:self];

  v16 = [(OBTableWelcomeController *)self tableView];
  [v16 setScrollEnabled:1];

  uint64_t v17 = [(OBTableWelcomeController *)self tableView];
  [v17 setAllowsMultipleSelection:0];

  v18 = [(OBTableWelcomeController *)self tableView];
  [v18 reloadData];

  dispatch_queue_t v19 = [(OBTableWelcomeController *)self tableView];
  [v19 layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_isRoamingTapped = 0;
  self->_isExistingPlanTapped = 0;
  self->_isPurchaseLocalPlanTapped = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTravelEducationIntroViewController;
  [(OBTableWelcomeController *)&v3 viewWillAppear:a3];
}

- (void)viewDidLayoutSubviews
{
  objc_super v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  v4 = [(TSTravelEducationIntroViewController *)self view];
  [v4 layoutIfNeeded];

  v6.receiver = self;
  v6.super_class = (Class)TSTravelEducationIntroViewController;
  [(TSTravelEducationIntroViewController *)&v6 updateViewConstraints];
  v5.receiver = self;
  v5.super_class = (Class)TSTravelEducationIntroViewController;
  [(OBTableWelcomeController *)&v5 viewDidLayoutSubviews];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSDictionary *)self->_options count];
}

- (id)getCellTextAt:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TSTravelEducationIntroViewController *)self getDisplayOptions];
  unint64_t v6 = [v4 row];
  if (v6 <= [v5 count])
  {
    text = self->_text;
    v9 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v7 = [(NSDictionary *)text objectForKeyedSubscript:v9];
  }
  else
  {
    v7 = &stru_26DBE8E78;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TSTravelEducationIntroViewController *)self getCellTextAt:v6];
  v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
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
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "stringWithFormat:", @"options%ld", objc_msgSend(v7, "section"));
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

  v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  uint64_t v17 = [v10 textLabel];
  [v17 setFont:v16];

  v18 = [(TSTravelEducationIntroViewController *)self getCellTextAt:v7];

  dispatch_queue_t v19 = [v10 textLabel];
  [v19 setText:v18];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a4;
  objc_super v5 = [(TSTravelEducationIntroViewController *)self getDisplayOptions];
  id v6 = [(OBTableWelcomeController *)self tableView];
  [v6 deselectRowAtIndexPath:v16 animated:1];

  unint64_t v7 = [v16 row];
  if (v7 <= [v5 count])
  {
    id v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
    char v9 = [v8 isEqualToString:@"showRoamingOption"];

    if (v9)
    {
      v10 = &OBJC_IVAR___TSTravelEducationIntroViewController__isRoamingTapped;
    }
    else
    {
      uint64_t v11 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
      char v12 = [v11 isEqualToString:@"showLocalPlanOption"];

      if (v12)
      {
        v10 = &OBJC_IVAR___TSTravelEducationIntroViewController__isExistingPlanTapped;
      }
      else
      {
        v13 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
        int v14 = [v13 isEqualToString:@"showPurchaseOption"];

        if (!v14)
        {
LABEL_9:
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained viewControllerDidComplete:self];

          goto LABEL_10;
        }
        v10 = &OBJC_IVAR___TSTravelEducationIntroViewController__isPurchaseLocalPlanTapped;
      }
    }
    *((unsigned char *)&self->super.super.super.super.super.super.super.isa + *v10) = 1;
    goto LABEL_9;
  }
LABEL_10:
}

- (id)getDisplayOptions
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:&unk_26DC14218];
  if ([v3 count])
  {
    uint64_t v4 = 0;
    int v5 = 0;
    do
    {
      options = self->_options;
      unint64_t v7 = [v3 objectAtIndexedSubscript:v4];
      id v8 = [(NSDictionary *)options objectForKey:v7];

      if (!v8)
      {
        [v3 removeObjectAtIndex:v4];
        --v5;
      }
      uint64_t v4 = ++v5;
    }
    while ([v3 count] > (unint64_t)v5);
  }
  return v3;
}

- (void)_cancelButtonTapped
{
  client = self->_client;
  uint64_t v5 = 0;
  [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"Intro View Controller_Cancel" carrierName:&stru_26DBE8E78 error:&v5];
  uint64_t v4 = [(TSTravelEducationIntroViewController *)self delegate];
  [v4 userDidTapCancel];
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setOptions:(id)a3
{
}

- (BOOL)isRoamingTapped
{
  return self->_isRoamingTapped;
}

- (void)setIsRoamingTapped:(BOOL)a3
{
  self->_isRoamingTapped = a3;
}

- (BOOL)isExistingPlanTapped
{
  return self->_isExistingPlanTapped;
}

- (void)setIsExistingPlanTapped:(BOOL)a3
{
  self->_isExistingPlanTapped = a3;
}

- (BOOL)isPurchaseLocalPlanTapped
{
  return self->_isPurchaseLocalPlanTapped;
}

- (void)setIsPurchaseLocalPlanTapped:(BOOL)a3
{
  self->_isPurchaseLocalPlanTapped = a3;
}

- (NSDictionary)text
{
  return (NSDictionary *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setText:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end