@interface WFWalletMerchantSelectionTableViewController
- (NSArray)merchants;
- (NSMutableSet)previouslySelectedMerchants;
- (NSMutableSet)selectedMerchantIdentifiers;
- (NSSet)cardIdentifiers;
- (PKPaymentTransactionIconGenerator)generator;
- (UITableView)tableView;
- (WFWalletMerchantSelectionTableViewController)initWithTransactionIdentifiers:(id)a3 selectedMerchants:(id)a4;
- (WFWalletMerchantSelectionTableViewControllerDelegate)delegate;
- (id)filteredMerchants;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)clear:(id)a3;
- (void)done:(id)a3;
- (void)fetchTransactions;
- (void)loadView;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedMerchantIdentifiers:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFWalletMerchantSelectionTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslySelectedMerchants, 0);
  objc_storeStrong((id *)&self->_selectedMerchantIdentifiers, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_merchants, 0);
  objc_storeStrong((id *)&self->_cardIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMutableSet)previouslySelectedMerchants
{
  return self->_previouslySelectedMerchants;
}

- (void)setSelectedMerchantIdentifiers:(id)a3
{
}

- (NSMutableSet)selectedMerchantIdentifiers
{
  return self->_selectedMerchantIdentifiers;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (PKPaymentTransactionIconGenerator)generator
{
  return self->_generator;
}

- (NSArray)merchants
{
  return self->_merchants;
}

- (NSSet)cardIdentifiers
{
  return self->_cardIdentifiers;
}

- (void)setDelegate:(id)a3
{
}

- (WFWalletMerchantSelectionTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWalletMerchantSelectionTableViewControllerDelegate *)WeakRetained;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4 = [(WFWalletMerchantSelectionTableViewController *)self tableView];
  [v4 reloadData];
}

- (void)done:(id)a3
{
  id v4 = [(WFWalletMerchantSelectionTableViewController *)self merchants];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__WFWalletMerchantSelectionTableViewController_done___block_invoke;
  v7[3] = &unk_2649CBFC8;
  v7[4] = self;
  v5 = objc_msgSend(v4, "if_objectsPassingTest:", v7);

  v6 = [(WFWalletMerchantSelectionTableViewController *)self delegate];
  [v6 walletMerchantViewController:self didFinishWithMerchants:v5];
}

uint64_t __53__WFWalletMerchantSelectionTableViewController_done___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 selectedMerchantIdentifiers];
  v5 = [v3 uniqueIdentifier];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

- (void)clear:(id)a3
{
  id v4 = objc_opt_new();
  [(WFWalletMerchantSelectionTableViewController *)self setSelectedMerchantIdentifiers:v4];

  id v5 = [(WFWalletMerchantSelectionTableViewController *)self tableView];
  [v5 reloadData];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(WFWalletMerchantSelectionTableViewController *)self tableView];
  [v6 deselectRowAtIndexPath:v5 animated:1];

  v7 = [(WFWalletMerchantSelectionTableViewController *)self filteredMerchants];
  v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));

  v9 = [(WFWalletMerchantSelectionTableViewController *)self selectedMerchantIdentifiers];
  v10 = [v8 uniqueIdentifier];
  int v11 = [v9 containsObject:v10];

  v12 = [(WFWalletMerchantSelectionTableViewController *)self selectedMerchantIdentifiers];
  v13 = [v8 uniqueIdentifier];
  if (v11) {
    [v12 removeObject:v13];
  }
  else {
    [v12 addObject:v13];
  }

  v14 = [(WFWalletMerchantSelectionTableViewController *)self tableView];
  v16[0] = v5;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v14 reloadRowsAtIndexPaths:v15 withRowAnimation:100];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 dequeueReusableCellWithIdentifier:@"cell" forIndexPath:v7];
  v9 = [v8 imageView];
  [v9 setClipsToBounds:1];

  v10 = [v8 imageView];
  int v11 = [v10 layer];
  [v11 setMasksToBounds:1];

  v12 = [v8 imageView];
  [v12 _setContinuousCornerRadius:6.0];

  v13 = [(WFWalletMerchantSelectionTableViewController *)self filteredMerchants];
  v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  v15 = [v14 displayName];
  v16 = [v8 textLabel];
  [v16 setText:v15];

  v17 = [(WFWalletMerchantSelectionTableViewController *)self selectedMerchantIdentifiers];
  v18 = [v14 uniqueIdentifier];
  int v19 = [v17 containsObject:v18];

  if (v19) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 0;
  }
  [v8 setAccessoryType:v20];
  v21 = [(WFWalletMerchantSelectionTableViewController *)self generator];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v31 = &unk_2649CC090;
  id v32 = v6;
  id v33 = v7;
  id v22 = v7;
  id v23 = v6;
  v24 = objc_msgSend(v21, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v14, 0, 0, &v28, 29.0, 29.0);

  if (v24)
  {
    v25 = WFScaledImage(v24);
    v26 = objc_msgSend(v8, "imageView", v28, v29, v30, v31, v32, v33);
    [v26 setImage:v25];
  }
  return v8;
}

void __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_2649CC068;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__WFWalletMerchantSelectionTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) cellForRowAtIndexPath:*(void *)(a1 + 40)];
  v2 = WFScaledImage(*(void **)(a1 + 48));
  id v3 = [v4 imageView];
  [v3 setImage:v2];

  [v4 setNeedsLayout];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(WFWalletMerchantSelectionTableViewController *)self filteredMerchants];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WFWalletMerchantSelectionTableViewController;
  [(WFWalletMerchantSelectionTableViewController *)&v4 viewDidLoad];
  id v3 = [(WFWalletMerchantSelectionTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];

  [(WFWalletMerchantSelectionTableViewController *)self fetchTransactions];
}

- (void)fetchTransactions
{
  id v3 = objc_alloc_init(MEMORY[0x263F5C0A8]);
  objc_super v4 = [(WFWalletMerchantSelectionTableViewController *)self cardIdentifiers];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke;
  v5[3] = &unk_2649CC040;
  v5[4] = self;
  [v3 transactionsForTransactionSourceIdentifiers:v4 withTransactionSource:0 withBackingData:0 limit:100 completion:v5];
}

void __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_2;
  v6[3] = &unk_2649CC018;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = objc_opt_new();
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_3;
  v15 = &unk_2649CBFF0;
  id v16 = v2;
  id v17 = v3;
  id v5 = v3;
  id v6 = v2;
  [v4 enumerateObjectsUsingBlock:&v12];
  id v7 = objc_msgSend(v5, "allObjects", v12, v13, v14, v15);
  uint64_t v8 = [v7 copy];
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = *(void **)(v9 + 992);
  *(void *)(v9 + 992) = v8;

  int v11 = [*(id *)(a1 + 40) tableView];
  [v11 reloadData];
}

void __65__WFWalletMerchantSelectionTableViewController_fetchTransactions__block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = [a2 merchant];
  id v3 = [v8 uniqueIdentifier];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v8 uniqueIdentifier];
    LOBYTE(v4) = [v4 containsObject:v5];

    if ((v4 & 1) == 0)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = [v8 uniqueIdentifier];
      [v6 addObject:v7];

      [*(id *)(a1 + 40) addObject:v8];
    }
  }
}

- (id)filteredMerchants
{
  id v3 = [(WFWalletMerchantSelectionTableViewController *)self navigationItem];
  uint64_t v4 = [v3 searchController];
  id v5 = [v4 searchBar];

  id v6 = [v5 text];
  uint64_t v7 = [v6 length];
  id v8 = [(WFWalletMerchantSelectionTableViewController *)self merchants];
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__WFWalletMerchantSelectionTableViewController_filteredMerchants__block_invoke;
    v11[3] = &unk_2649CBFC8;
    id v12 = v6;
    uint64_t v9 = objc_msgSend(v8, "if_objectsPassingTest:", v11);

    id v8 = (void *)v9;
  }

  return v8;
}

uint64_t __65__WFWalletMerchantSelectionTableViewController_filteredMerchants__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 displayName];
  uint64_t v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  return v4;
}

- (void)loadView
{
  v34[4] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)WFWalletMerchantSelectionTableViewController;
  [(WFWalletMerchantSelectionTableViewController *)&v33 loadView];
  id v3 = objc_alloc(MEMORY[0x263F82C78]);
  uint64_t v4 = objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setAllowsMultipleSelection:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setDataSource:self];
  [v4 setDelegate:self];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];
  id v5 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v4 setTableHeaderView:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v4 setTableFooterView:v6];

  uint64_t v7 = [(WFWalletMerchantSelectionTableViewController *)self view];
  [v7 addSubview:v4];

  [(WFWalletMerchantSelectionTableViewController *)self setTableView:v4];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
  [v8 setObscuresBackgroundDuringPresentation:0];
  uint64_t v9 = [v8 searchBar];
  [v9 setAutocorrectionType:1];

  [v8 setHidesNavigationBarDuringPresentation:0];
  id v32 = v8;
  v10 = [v8 searchBar];
  [v10 setDelegate:self];

  int v11 = [(WFWalletMerchantSelectionTableViewController *)self navigationItem];
  [v11 setSearchController:v8];

  id v12 = [(WFWalletMerchantSelectionTableViewController *)self navigationItem];
  [v12 setHidesSearchBarWhenScrolling:0];

  uint64_t v13 = WFLocalizedString(@"Merchants");
  [(WFWalletMerchantSelectionTableViewController *)self setTitle:v13];

  v24 = (void *)MEMORY[0x263F08938];
  v30 = [v4 topAnchor];
  v31 = [(WFWalletMerchantSelectionTableViewController *)self view];
  uint64_t v29 = [v31 topAnchor];
  uint64_t v28 = [v30 constraintEqualToAnchor:v29];
  v34[0] = v28;
  v26 = [v4 leadingAnchor];
  v27 = [(WFWalletMerchantSelectionTableViewController *)self view];
  v25 = [v27 leadingAnchor];
  id v23 = [v26 constraintEqualToAnchor:v25];
  v34[1] = v23;
  v14 = [v4 bottomAnchor];
  v15 = [(WFWalletMerchantSelectionTableViewController *)self view];
  id v16 = [v15 bottomAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16];
  v34[2] = v17;
  v18 = [v4 trailingAnchor];
  int v19 = [(WFWalletMerchantSelectionTableViewController *)self view];
  uint64_t v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v34[3] = v21;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  [v24 activateConstraints:v22];
}

- (WFWalletMerchantSelectionTableViewController)initWithTransactionIdentifiers:(id)a3 selectedMerchants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)WFWalletMerchantSelectionTableViewController;
  id v8 = [(WFWalletMerchantSelectionTableViewController *)&v27 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    cardIdentifiers = v8->_cardIdentifiers;
    v8->_cardIdentifiers = (NSSet *)v9;

    int v11 = [(WFWalletMerchantSelectionTableViewController *)v8 navigationItem];
    id v12 = objc_alloc(MEMORY[0x263F824A8]);
    uint64_t v13 = WFLocalizedString(@"Clear");
    v14 = (void *)[v12 initWithTitle:v13 style:0 target:v8 action:sel_clear_];
    [v11 setLeftBarButtonItem:v14];

    v15 = [(WFWalletMerchantSelectionTableViewController *)v8 navigationItem];
    id v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v8 action:sel_done_];
    [v15 setRightBarButtonItem:v16];

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    id v17 = (void *)getPKPaymentTransactionIconGeneratorClass_softClass;
    uint64_t v32 = getPKPaymentTransactionIconGeneratorClass_softClass;
    if (!getPKPaymentTransactionIconGeneratorClass_softClass)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __getPKPaymentTransactionIconGeneratorClass_block_invoke;
      v28[3] = &unk_2649CC0B8;
      v28[4] = &v29;
      __getPKPaymentTransactionIconGeneratorClass_block_invoke((uint64_t)v28);
      id v17 = (void *)v30[3];
    }
    v18 = v17;
    _Block_object_dispose(&v29, 8);
    id v19 = [v18 alloc];
    uint64_t v20 = [MEMORY[0x263F82B60] mainScreen];
    [v20 scale];
    uint64_t v21 = objc_msgSend(v19, "initWithCache:scale:", 1);
    generator = v8->_generator;
    v8->_generator = (PKPaymentTransactionIconGenerator *)v21;

    uint64_t v23 = objc_opt_new();
    selectedMerchantIdentifiers = v8->_selectedMerchantIdentifiers;
    v8->_selectedMerchantIdentifiers = (NSMutableSet *)v23;

    v25 = v8;
  }

  return v8;
}

@end