@interface PKPaymentSetupDisambiguationViewController
- (NSArray)products;
- (NSString)enteredCardNumber;
- (PKPaymentSetupDisambiguationViewController)initWithProducts:(id)a3 context:(int64_t)a4;
- (PKPaymentSetupDisambiguationViewControllerDelegate)delegate;
- (PKPaymentSetupProduct)selectedProduct;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_productAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_nextTapped:(id)a3;
- (void)_notifyDelegateDidSelectProduct:(id)a3;
- (void)_popToCameraCapture:(id)a3;
- (void)_setupLater:(id)a3;
- (void)_updateSelectedProduct:(id)a3;
- (void)clearSelectedProduct;
- (void)setDelegate:(id)a3;
- (void)setEnteredCardNumber:(id)a3;
- (void)setProducts:(id)a3;
- (void)setupFooterViewForTableView:(id)a3;
- (void)setupHeaderViewForTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKPaymentSetupDisambiguationViewController

- (PKPaymentSetupDisambiguationViewController)initWithProducts:(id)a3 context:(int64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  v7 = [(PKPaymentSetupTableViewController *)&v18 initWithContext:a4];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v9 = PKLocalizedPaymentString(&cfstr_Next.isa);
    uint64_t v10 = [v8 initWithTitle:v9 style:2 target:v7 action:sel__nextTapped_];
    nextBarButtonItem = v7->_nextBarButtonItem;
    v7->_nextBarButtonItem = (UIBarButtonItem *)v10;

    v12 = [(PKPaymentSetupDisambiguationViewController *)v7 navigationItem];
    [v12 setRightBarButtonItem:v7->_nextBarButtonItem];

    [(UIBarButtonItem *)v7->_nextBarButtonItem setEnabled:0];
    v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"displayName" ascending:1];
    v19[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v15 = [v6 sortedArrayUsingDescriptors:v14];
    products = v7->_products;
    v7->_products = (NSArray *)v15;
  }
  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  [(PKPaymentSetupDisambiguationViewController *)&v4 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [(PKPaymentSetupDisambiguationViewController *)self setupHeaderViewForTableView:v3];
  [(PKPaymentSetupDisambiguationViewController *)self setupFooterViewForTableView:v3];
  [v3 setTableHeaderView:self->_headerView];
  [v3 setTableFooterView:self->_footerView];
  [v3 setSeparatorStyle:1];
}

- (void)setupHeaderViewForTableView:(id)a3
{
  id v4 = a3;
  v5 = [PKTableHeaderView alloc];
  id v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v6;

  uint64_t v8 = PKLocalizedPaymentString(&cfstr_SelectCard.isa);
  enteredCardNumber = (__CFString *)self->_enteredCardNumber;
  if (!enteredCardNumber) {
    enteredCardNumber = @"--";
  }
  id v17 = (id)v8;
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_SelectCardSubt.isa, &stru_1EF1B4C70.isa, enteredCardNumber);
  v11 = [(PKTableHeaderView *)self->_headerView imageView];
  [v11 setImage:0];

  v12 = [(PKTableHeaderView *)self->_headerView titleLabel];
  [v12 setText:v17];

  v13 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  [v13 setText:v10];

  v14 = self->_headerView;
  uint64_t v15 = [v4 backgroundColor];

  v16 = [v15 colorWithAlphaComponent:0.949999988];
  [(PKTableHeaderView *)v14 setBackgroundColor:v16];

  [(PKTableHeaderView *)self->_headerView sizeToFit];
}

- (void)setupFooterViewForTableView:(id)a3
{
  id v18 = a3;
  id v4 = [(PKPaymentSetupTableViewController *)self tableView];
  [v4 bounds];
  double v6 = v5;

  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E4FB13F0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke;
  v21[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v22, &location);
  uint64_t v8 = [v7 actionWithHandler:v21];
  v9 = (void *)MEMORY[0x1E4FB13F0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke_2;
  v19[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v20, &location);
  uint64_t v10 = [v9 actionWithHandler:v19];
  v11 = PKLocalizedPaymentString(&cfstr_SelectCardDiff.isa);
  v12 = PKLocalizedPaymentString(&cfstr_SelectCardLate.isa);
  v13 = PKLocalizedPaymentString(&cfstr_SelectCardFoot.isa);
  [(PKPaymentSetupTableViewController *)self context];
  if (PKPaymentSetupContextIsSetupAssistant()) {
    v14 = -[PKDisambiguationFooterView initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:]([PKDisambiguationFooterView alloc], "initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:", v8, v10, v11, v12, v13, 0.0, 0.0, v6, 130.0);
  }
  else {
    v14 = -[PKDisambiguationFooterView initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:]([PKDisambiguationFooterView alloc], "initWithFrame:action:secondaryAction:title:secondaryTitle:desscription:", v8, 0, v11, 0, v13, 0.0, 0.0, v6, 130.0);
  }
  footerView = self->_footerView;
  self->_footerView = v14;

  v16 = [(PKDisambiguationFooterView *)self->_footerView descriptionLabel];
  id v17 = PKLocalizedPaymentString(&cfstr_SelectCardFoot.isa);
  [v16 setText:v17];

  [(PKDisambiguationFooterView *)self->_footerView sizeToFitForTableView:v18];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained _popToCameraCapture:v4];
}

void __74__PKPaymentSetupDisambiguationViewController_setupFooterViewForTableView___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained _setupLater:v4];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  [(PKPaymentSetupDisambiguationViewController *)&v6 viewDidLayoutSubviews];
  footerView = self->_footerView;
  id v4 = [(PKPaymentSetupTableViewController *)self tableView];
  [(PKDisambiguationFooterView *)footerView sizeToFitForTableView:v4];

  double v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [(PKDisambiguationFooterView *)self->_footerView bounds];
  [v5 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v7)];
}

- (id)_productAtIndexPath:(id)a3
{
  products = self->_products;
  uint64_t v4 = [a3 row];

  return [(NSArray *)products objectAtIndex:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_products count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  CGRect v7 = [(PKPaymentSetupDisambiguationViewController *)self _productAtIndexPath:a4];
  uint64_t v8 = +[PKPaymentSetupProductCell reuseIdentifier];
  v9 = [v6 dequeueReusableCellWithIdentifier:v8];

  if (!v9) {
    v9 = objc_alloc_init(PKPaymentSetupProductCell);
  }
  [(PKPaymentSetupProductCell *)v9 setProduct:v7];
  [(PKPaymentSetupProductCell *)v9 setTextLabelOffset:50.0];
  if (self->_selectedProduct == v7) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [(PKPaymentSetupProductCell *)v9 setAccessoryType:v10];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupDisambiguationViewController;
  id v6 = a4;
  [(PKPaymentSetupTableViewController *)&v9 tableView:a3 didSelectRowAtIndexPath:v6];
  CGRect v7 = -[PKPaymentSetupDisambiguationViewController _productAtIndexPath:](self, "_productAtIndexPath:", v6, v9.receiver, v9.super_class);
  [(PKPaymentSetupDisambiguationViewController *)self _updateSelectedProduct:v7];
  uint64_t v8 = [(PKPaymentSetupTableViewController *)self tableView];
  [v8 deselectRowAtIndexPath:v6 animated:0];
}

- (void)setEnteredCardNumber:(id)a3
{
  if (self->_enteredCardNumber != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    enteredCardNumber = self->_enteredCardNumber;
    self->_enteredCardNumber = v4;

    id v6 = (__CFString *)self->_enteredCardNumber;
    if (!v6) {
      id v6 = @"--";
    }
    PKLocalizedPaymentString(&cfstr_SelectCardSubt.isa, &stru_1EF1B4C70.isa, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    CGRect v7 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
    [v7 setText:v8];
  }
}

- (void)setProducts:(id)a3
{
  if (self->_products != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    products = self->_products;
    self->_products = v4;

    id v6 = [(PKPaymentSetupTableViewController *)self tableView];
    [v6 reloadData];

    footerView = self->_footerView;
    id v8 = [(PKPaymentSetupTableViewController *)self tableView];
    [(PKDisambiguationFooterView *)footerView sizeToFitForTableView:v8];

    id v9 = [(PKPaymentSetupTableViewController *)self tableView];
    [(PKDisambiguationFooterView *)self->_footerView bounds];
    [v9 _tableFooterHeightDidChangeToHeight:CGRectGetHeight(v11)];
  }
}

- (void)_updateSelectedProduct:(id)a3
{
  double v5 = (PKPaymentSetupProduct *)a3;
  if (self->_selectedProduct != v5)
  {
    CGRect v7 = v5;
    objc_storeStrong((id *)&self->_selectedProduct, a3);
    id v6 = [(PKPaymentSetupTableViewController *)self tableView];
    [v6 reloadData];

    [(UIBarButtonItem *)self->_nextBarButtonItem setEnabled:self->_selectedProduct != 0];
    double v5 = v7;
  }
}

- (void)clearSelectedProduct
{
}

- (void)_nextTapped:(id)a3
{
  uint64_t v4 = [(PKPaymentSetupDisambiguationViewController *)self selectedProduct];
  if (v4)
  {
    double v5 = v4;
    [(PKPaymentSetupDisambiguationViewController *)self _notifyDelegateDidSelectProduct:v4];
    uint64_t v4 = v5;
  }
}

- (void)_notifyDelegateDidSelectProduct:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 disambiguationViewController:self didSelectProduct:v9];
    }
  }
}

- (void)_popToCameraCapture:(id)a3
{
  uint64_t v4 = [(PKPaymentSetupDisambiguationViewController *)self navigationController];
  id v8 = [v4 viewControllers];

  double v5 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v8, "count") - 3);
  id v6 = [(PKPaymentSetupDisambiguationViewController *)self navigationController];
  id v7 = (id)[v6 popToViewController:v5 animated:1];
}

- (void)_setupLater:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 disambiguationViewControllerSetUpLater:self];
    }
  }
}

- (PKPaymentSetupDisambiguationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupDisambiguationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)products
{
  return self->_products;
}

- (PKPaymentSetupProduct)selectedProduct
{
  return self->_selectedProduct;
}

- (NSString)enteredCardNumber
{
  return self->_enteredCardNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredCardNumber, 0);
  objc_storeStrong((id *)&self->_selectedProduct, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_nextBarButtonItem, 0);

  objc_storeStrong((id *)&self->_products, 0);
}

@end