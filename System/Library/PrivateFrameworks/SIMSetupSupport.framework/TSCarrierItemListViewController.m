@interface TSCarrierItemListViewController
- (CTCellularPlanCarrierItem)selectedCarrierItem;
- (CoreTelephonyClient)client;
- (NSArray)carrierItems;
- (TSCarrierItemListViewController)init;
- (TSSIMSetupFlowDelegate)delegate;
- (UITableViewHeaderFooterView)footer;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)getCellTextAt:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonTapped;
- (void)_fetchCarrierListWithCompletion:(id)a3;
- (void)prepare:(id)a3;
- (void)setCarrierItems:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooter:(id)a3;
- (void)setSelectedCarrierItem:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFooterView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSCarrierItemListViewController

- (TSCarrierItemListViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TRAVEL_PURCHASE_PLAN_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"TRAVEL_PURCHASE_PLAN_BODY" value:&stru_26DBE8E78 table:@"Localizable"];
  v12.receiver = self;
  v12.super_class = (Class)TSCarrierItemListViewController;
  v7 = [(OBTableWelcomeController *)&v12 initWithTitle:v4 detailText:v6 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];

  dispatch_queue_t v8 = dispatch_queue_create((const char *)@"Core Analytics", 0);
  uint64_t v9 = [objc_alloc(MEMORY[0x263F02D30]) initWithQueue:v8];
  client = v7->_client;
  v7->_client = (CoreTelephonyClient *)v9;

  return v7;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)TSCarrierItemListViewController;
  [(TSOBTableWelcomeController *)&v17 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonTapped];
  v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = objc_alloc(MEMORY[0x263F82C78]);
  v6 = objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v6];

  v7 = [(OBTableWelcomeController *)self tableView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  dispatch_queue_t v8 = [(OBTableWelcomeController *)self tableView];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  uint64_t v9 = [(OBTableWelcomeController *)self tableView];
  v10 = [MEMORY[0x263F825C8] clearColor];
  [v9 setBackgroundColor:v10];

  v11 = [(OBTableWelcomeController *)self tableView];
  [v11 setDataSource:self];

  objc_super v12 = [(OBTableWelcomeController *)self tableView];
  [v12 setDelegate:self];

  v13 = [(OBTableWelcomeController *)self tableView];
  [v13 setScrollEnabled:1];

  v14 = [(OBTableWelcomeController *)self tableView];
  [v14 setAllowsMultipleSelection:0];

  v15 = [(OBTableWelcomeController *)self tableView];
  [v15 reloadData];

  v16 = [(OBTableWelcomeController *)self tableView];
  [v16 layoutIfNeeded];

  [(TSCarrierItemListViewController *)self updateFooterView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  selectedCarrierItem = self->_selectedCarrierItem;
  self->_selectedCarrierItem = 0;

  v6.receiver = self;
  v6.super_class = (Class)TSCarrierItemListViewController;
  [(OBTableWelcomeController *)&v6 viewWillAppear:v3];
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(OBTableWelcomeController *)self tableView];
  [v3 reloadData];

  v4 = [(TSCarrierItemListViewController *)self view];
  [v4 layoutIfNeeded];

  v6.receiver = self;
  v6.super_class = (Class)TSCarrierItemListViewController;
  [(TSCarrierItemListViewController *)&v6 updateViewConstraints];
  v5.receiver = self;
  v5.super_class = (Class)TSCarrierItemListViewController;
  [(OBTableWelcomeController *)&v5 viewDidLayoutSubviews];
}

- (void)updateFooterView
{
  if (!self->_footer)
  {
    BOOL v3 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x263F82CA0]);
    footer = self->_footer;
    self->_footer = v3;

    objc_super v5 = [(UITableViewHeaderFooterView *)self->_footer textLabel];
    objc_super v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
    [v5 setFont:v6];

    v7 = [(UITableViewHeaderFooterView *)self->_footer textLabel];
    [v7 setLineBreakMode:0];

    dispatch_queue_t v8 = [(UITableViewHeaderFooterView *)self->_footer textLabel];
    [v8 setNumberOfLines:0];

    uint64_t v9 = [(UITableViewHeaderFooterView *)self->_footer textLabel];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"PRIVACY_FOOTER" value:&stru_26DBE8E78 table:@"Localizable"];
    [v9 setText:v11];

    id v13 = [(UITableViewHeaderFooterView *)self->_footer textLabel];
    objc_super v12 = [MEMORY[0x263F825C8] systemGrayColor];
    [v13 setTextColor:v12];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_carrierItems count];
}

- (id)getCellTextAt:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  if (v5 >= [(NSArray *)self->_carrierItems count])
  {
    v7 = &stru_26DBE8E78;
  }
  else
  {
    objc_super v6 = -[NSArray objectAtIndexedSubscript:](self->_carrierItems, "objectAtIndexedSubscript:", [v4 row]);
    v7 = [v6 name];
  }
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_queue_t v8 = [(TSCarrierItemListViewController *)self getCellTextAt:v6];
  uint64_t v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v10 = NSString;
  uint64_t v11 = [v6 section];

  objc_super v12 = objc_msgSend(v10, "stringWithFormat:", @"options%ld", v11);
  id v13 = [v7 dequeueReusableCellWithIdentifier:v12];

  objc_msgSend(v8, "sizeWithFont:constrainedToSize:lineBreakMode:", v9, 0, 235.0, 3.40282347e38);
  double v15 = fmax(v14, 60.0);

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", @"options%ld", objc_msgSend(v7, "section"));
  v10 = [v8 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:v9];
  }
  uint64_t v11 = [v10 contentView];
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  [v10 setAccessoryType:1];
  objc_super v12 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v10 setBackgroundColor:v12];

  id v13 = [v10 textLabel];
  [v13 setLineBreakMode:0];

  double v14 = [v10 textLabel];
  [v14 setNumberOfLines:0];

  double v15 = [v10 textLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  objc_super v17 = [v10 textLabel];
  [v17 setFont:v16];

  v18 = [(TSCarrierItemListViewController *)self getCellTextAt:v7];

  v19 = [v10 textLabel];
  [v19 setText:v18];

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_footer;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unint64_t v6 = [v5 row];
  if (v6 >= [(NSArray *)self->_carrierItems count])
  {
    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSCarrierItemListViewController tableView:didSelectRowAtIndexPath:](v11);
    }
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_carrierItems, "objectAtIndexedSubscript:", [v5 row]);
    id v7 = (CTCellularPlanCarrierItem *)objc_claimAutoreleasedReturnValue();
    selectedCarrierItem = self->_selectedCarrierItem;
    self->_selectedCarrierItem = v7;

    uint64_t v9 = _TSLogDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_selectedCarrierItem;
      *(_DWORD *)buf = 138412802;
      id v20 = v5;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2080;
      v24 = "-[TSCarrierItemListViewController tableView:didSelectRowAtIndexPath:]";
      _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "carrier item at %@: %@ @%s", buf, 0x20u);
    }
  }
  objc_super v12 = self->_selectedCarrierItem;
  if (v12)
  {
    client = self->_client;
    double v14 = [(CTCellularPlanCarrierItem *)v12 name];
    id v18 = 0;
    [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"purchase local plan" carrierName:v14 error:&v18];
    id v15 = v18;

    v16 = [(TSCarrierItemListViewController *)self delegate];
    [v16 viewControllerDidComplete:self];
  }
  objc_super v17 = [(OBTableWelcomeController *)self tableView];
  [v17 deselectRowAtIndexPath:v5 animated:1];
}

- (void)prepare:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_carrierItems)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    unint64_t v6 = +[TSUserInPurchaseFlowAssertion sharedInstance];
    [v6 assertUserInPurchaseFlowStartOver:0 caller:self];

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__TSCarrierItemListViewController_prepare___block_invoke;
    v7[3] = &unk_264828160;
    objc_copyWeak(&v9, &location);
    v7[4] = self;
    id v8 = v5;
    [(TSCarrierItemListViewController *)self _fetchCarrierListWithCompletion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __43__TSCarrierItemListViewController_prepare___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = +[TSUserInPurchaseFlowAssertion sharedInstance];
  [v5 deassertUserInPurchaseFlowWithForce:0 caller:*(void *)(a1 + 32)];

  if (WeakRetained && v7)
  {
    objc_storeStrong(WeakRetained + 154, a2);
    unint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    unint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)_cancelButtonTapped
{
  client = self->_client;
  uint64_t v5 = 0;
  [(CoreTelephonyClient *)client sendTravelBuddyCAEvent:@"purchase local plan_Cancel" carrierName:&stru_26DBE8E78 error:&v5];
  id v4 = [(TSCarrierItemListViewController *)self delegate];
  [v4 userDidTapCancel];
}

- (void)_fetchCarrierListWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [MEMORY[0x263F31978] sharedManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke;
  v7[3] = &unk_264828200;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 getSupportedFlowTypes:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2;
  block[3] = &unk_2648281D8;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v6);
}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((*(unsigned char *)(a1 + 48) & 0x20) != 0)
  {
    id v4 = [MEMORY[0x263F31978] sharedManager];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_3;
    v5[3] = &unk_2648281B0;
    id v6 = *(id *)(a1 + 32);
    [v4 carrierItemsShouldUpdate:0 completion:v5];
  }
  else
  {
    BOOL v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2_cold_1(v3);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_4;
  v6[3] = &unk_264828188;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSArray)carrierItems
{
  return self->_carrierItems;
}

- (void)setCarrierItems:(id)a3
{
}

- (CTCellularPlanCarrierItem)selectedCarrierItem
{
  return self->_selectedCarrierItem;
}

- (void)setSelectedCarrierItem:(id)a3
{
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UITableViewHeaderFooterView)footer
{
  return (UITableViewHeaderFooterView *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setFooter:(id)a3
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
  objc_storeStrong((id *)&self->_footer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedCarrierItem, 0);
  objc_storeStrong((id *)&self->_carrierItems, 0);
}

- (void)tableView:(os_log_t)log didSelectRowAtIndexPath:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSCarrierItemListViewController tableView:didSelectRowAtIndexPath:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid row selection @%s", (uint8_t *)&v1, 0xCu);
}

void __67__TSCarrierItemListViewController__fetchCarrierListWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSCarrierItemListViewController _fetchCarrierListWithCompletion:]_block_invoke_2";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]CarrierPlanItemFlow is unsupprted @%s", (uint8_t *)&v1, 0xCu);
}

@end