@interface PKSpendNotificationLimitViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (PKSpendNotificationLimitViewController)initWithTitle:(id)a3 footerText:(id)a4 provider:(id)a5;
- (id)changeHandler;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_deleteOptionAtIndexPath:(id)a3;
- (void)_doneButtonTapped:(id)a3;
- (void)_updateNavigationItemsIsEditing:(BOOL)a3;
- (void)_updateSnapshotAnimated:(BOOL)a3 completion:(id)a4;
- (void)setChangeHandler:(id)a3;
- (void)setMaximumInput:(unint64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSpendNotificationLimitViewController

- (PKSpendNotificationLimitViewController)initWithTitle:(id)a3 footerText:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKSpendNotificationLimitViewController;
  v11 = -[PKSpendNotificationLimitViewController initWithStyle:](&v27, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    footerText = v11->_footerText;
    v11->_footerText = (NSString *)v12;

    objc_storeStrong((id *)&v11->_provider, a5);
    v14 = [PKCurrencyAmountSelectorCustomEntryItem alloc];
    v15 = [(PKCurrencyAmountSelectorOptionProvider *)v11->_provider currencyCode];
    uint64_t v16 = [(PKCurrencyAmountSelectorCustomEntryItem *)v14 initWithCurrencyCode:v15];
    customEntryItem = v11->_customEntryItem;
    v11->_customEntryItem = (PKCurrencyAmountSelectorCustomEntryItem *)v16;

    objc_initWeak(&location, v11);
    v18 = v11->_customEntryItem;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke;
    v24[3] = &unk_1E59CB100;
    objc_copyWeak(&v25, &location);
    [(PKCurrencyAmountSelectorCustomEntryItem *)v18 setEditingChangedHandler:v24];
    v19 = v11->_customEntryItem;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke_2;
    v22[3] = &unk_1E59CB100;
    objc_copyWeak(&v23, &location);
    [(PKCurrencyAmountSelectorCustomEntryItem *)v19 setInputValueChangedHandler:v22];
    [(PKSpendNotificationLimitViewController *)v11 setTitle:v8];
    v20 = [(PKSpendNotificationLimitViewController *)v11 navigationItem];
    objc_msgSend(v20, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v20, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    [(PKSpendNotificationLimitViewController *)v11 _updateNavigationItemsIsEditing:0];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNavigationItemsIsEditing:a2];
}

void __76__PKSpendNotificationLimitViewController_initWithTitle_footerText_provider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained navigationItem];
  v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:a2];
}

- (void)setMaximumInput:(unint64_t)a3
{
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKSpendNotificationLimitViewController;
  [(PKSpendNotificationLimitViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKSpendNotificationLimitViewController *)self tableView];
  v4 = [(PKSpendNotificationLimitViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PKSpendNotificationLimitViewController;
  [(PKSpendNotificationLimitViewController *)&v17 viewDidLoad];
  v3 = [(PKSpendNotificationLimitViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = +[PKCurrencyAmountSelectorOption cellReuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  v7 = +[PKCurrencyAmountSelectorCustomEntryItem cellReuseIdentifier];
  [v3 registerClass:v6 forCellReuseIdentifier:v7];

  id v8 = [(UITableViewDiffableDataSource *)[PKTableViewDiffableDataSource alloc] initWithTableView:v3 cellProvider:&__block_literal_global_260];
  dataSource = self->_dataSource;
  self->_dataSource = v8;

  [(PKTableViewDiffableDataSource *)self->_dataSource setSectionHeaderProvider:&__block_literal_global_263];
  [(PKTableViewDiffableDataSource *)self->_dataSource setSectionFooterProvider:&__block_literal_global_265];
  objc_initWeak(&location, self);
  id v10 = self->_dataSource;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_4;
  v14[3] = &unk_1E59D8190;
  objc_copyWeak(&v15, &location);
  [(PKTableViewDiffableDataSource *)v10 setCommitEditingHandler:v14];
  provider = self->_provider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_5;
  v12[3] = &unk_1E59CB088;
  objc_copyWeak(&v13, &location);
  [(PKCurrencyAmountSelectorOptionProvider *)provider setOptionsUpdateHandler:v12];
  [(PKSpendNotificationLimitViewController *)self _updateSnapshotAnimated:0 completion:0];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85AE8]];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 tableViewCellForTableView:a2 atIndexPath:a3];
}

uint64_t __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 title];
}

uint64_t __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 footer];
}

void __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a3 == 1 && WeakRetained) {
    [WeakRetained _deleteOptionAtIndexPath:v8];
  }
}

void __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_6;
    v3[3] = &unk_1E59CA7D0;
    v3[4] = WeakRetained;
    [WeakRetained _updateSnapshotAnimated:0 completion:v3];
  }
}

void __53__PKSpendNotificationLimitViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 1056))
  {
    id v3 = [*(id *)(v1 + 1032) selectedOption];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 1056) + 16))();
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a4;
  [a3 deselectRowAtIndexPath:v17 animated:1];
  [(PKCurrencyAmountSelectorCustomEntryItem *)self->_customEntryItem clear];
  [(PKCurrencyAmountSelectorCustomEntryItem *)self->_customEntryItem endEditing];
  uint64_t v6 = [v17 section];
  v7 = [(UITableViewDiffableDataSource *)self->_dataSource snapshot];
  id v8 = [v7 sectionIdentifiers];
  id v9 = [v8 objectAtIndexedSubscript:v6];
  id v10 = [v9 identifier];

  v11 = v10;
  uint64_t v12 = v11;
  if (v11 == @"SpendLimitOptionsSectionIdentifier"
    || v11
    && (int v13 = [(__CFString *)v11 isEqualToString:@"SpendLimitOptionsSectionIdentifier"],
        v12,
        v13))
  {
    v14 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v17];
    id v15 = [v14 currencyAmount];
    uint64_t v16 = [v15 amount];

    [(PKCurrencyAmountSelectorOptionProvider *)self->_provider selectAmount:v16];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  char v5 = [v4 shouldHighlight];

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  int64_t v5 = [v4 editingStyle];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "section", a3);
  uint64_t v6 = [(UITableViewDiffableDataSource *)self->_dataSource snapshot];
  v7 = [v6 sectionIdentifiers];
  id v8 = [v7 objectAtIndexedSubscript:v5];
  id v9 = [v8 identifier];

  id v10 = v9;
  v11 = v10;
  if (v10 == @"SpendLimitOptionsSectionIdentifier")
  {
    char v12 = 1;
  }
  else if (v10)
  {
    char v12 = [(__CFString *)v10 isEqualToString:@"SpendLimitOptionsSectionIdentifier"];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_deleteOptionAtIndexPath:(id)a3
{
  id v7 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a3];
  provider = self->_provider;
  uint64_t v5 = [v7 currencyAmount];
  uint64_t v6 = [v5 amount];
  [(PKCurrencyAmountSelectorOptionProvider *)provider removeCustomAmount:v6];
}

- (void)_updateNavigationItemsIsEditing:(BOOL)a3
{
  if (a3)
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonTapped_];
    [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F854C0]];
    uint64_t v4 = [(PKSpendNotificationLimitViewController *)self navigationItem];
    uint64_t v5 = v4;
    id v6 = v7;
  }
  else
  {
    id v7 = [(PKSpendNotificationLimitViewController *)self navigationItem];
    uint64_t v5 = [(PKSpendNotificationLimitViewController *)self editButtonItem];
    uint64_t v4 = v7;
    id v6 = v5;
  }
  [v4 setRightBarButtonItem:v6];
}

- (void)_doneButtonTapped:(id)a3
{
  [(PKCurrencyAmountSelectorCustomEntryItem *)self->_customEntryItem endEditing];
  id v4 = [(PKCurrencyAmountSelectorCustomEntryItem *)self->_customEntryItem decimalNumberValue];
  if (v4) {
    [(PKCurrencyAmountSelectorOptionProvider *)self->_provider insertCustomAmount:v4];
  }
  [(PKCurrencyAmountSelectorCustomEntryItem *)self->_customEntryItem clear];
}

- (void)_updateSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  id v8 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"SpendLimitOptionsSectionIdentifier"];
  id v9 = v8;
  if (!self->_customEntryItem) {
    [(PKTableViewDiffableDataSourceSection *)v8 setFooter:self->_footerText];
  }
  v17[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v7 appendSectionsWithIdentifiers:v10];

  v11 = [(PKCurrencyAmountSelectorOptionProvider *)self->_provider options];
  [v7 appendItemsWithIdentifiers:v11 intoSectionWithIdentifier:v9];

  if (self->_customEntryItem)
  {
    char v12 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"CustomOptionEntrySectionIdentifier"];
    [(PKTableViewDiffableDataSourceSection *)v12 setFooter:self->_footerText];
    uint64_t v16 = v12;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v7 appendSectionsWithIdentifiers:v13];

    customEntryItem = self->_customEntryItem;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&customEntryItem count:1];
    [v7 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:v12];
  }
  [(UITableViewDiffableDataSource *)self->_dataSource applySnapshot:v7 animatingDifferences:v4 completion:v6];
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_customEntryItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_provider, 0);

  objc_storeStrong((id *)&self->_footerText, 0);
}

@end