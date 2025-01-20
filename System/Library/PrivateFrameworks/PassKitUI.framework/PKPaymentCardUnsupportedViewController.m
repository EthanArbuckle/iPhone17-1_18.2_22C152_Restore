@interface PKPaymentCardUnsupportedViewController
- (PKPaymentCardUnsupportedViewController)initWithUnsupportedProduct:(id)a3 context:(int64_t)a4 delegate:(id)a5;
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)edgesForExtendedLayout;
- (void)_done:(id)a3;
- (void)_updateViewsWithProduct:(id)a3;
- (void)appViewContentSizeChanged:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setProduct:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKPaymentCardUnsupportedViewController

- (PKPaymentCardUnsupportedViewController)initWithUnsupportedProduct:(id)a3 context:(int64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentCardUnsupportedViewController;
  v11 = [(PKPaymentSetupTableViewController *)&v14 initWithContext:a4];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_product, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentCardUnsupportedViewController;
  [(PKPaymentSetupTableViewController *)&v2 dealloc];
}

- (unint64_t)edgesForExtendedLayout
{
  return 15;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentCardUnsupportedViewController;
  [(PKPaymentCardUnsupportedViewController *)&v15 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 setSeparatorStyle:0];

  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  v7 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 setTableHeaderView:self->_headerView];

  v8 = [[PKLinkedAppView alloc] initWithStoreIDs:0 systemAppBundleIdentifiers:0 appLaunchURL:0 reuseIdentifier:0];
  appViewCell = self->_appViewCell;
  self->_appViewCell = v8;

  id v10 = [(PKLinkedAppView *)self->_appViewCell linkedAppView];
  [v10 setDelegate:self];

  v11 = [(PKPaymentCardUnsupportedViewController *)self navigationItem];
  id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v13 = PKLocalizedString(&cfstr_Done.isa);
  objc_super v14 = (void *)[v12 initWithTitle:v13 style:2 target:self action:sel__done_];

  [v11 setRightBarButtonItem:v14];
  [(PKPaymentCardUnsupportedViewController *)self _updateViewsWithProduct:self->_product];
}

- (void)_updateViewsWithProduct:(id)a3
{
  id v22 = a3;
  v4 = [(PKTableHeaderView *)self->_headerView titleLabel];
  v5 = PKLocalizedPaymentString(&cfstr_CannotAddCardT.isa);
  [v4 setText:v5];

  v6 = [v22 associatedStoreIdentifiers];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [v22 displayName];
  id v9 = (void *)v8;
  if (v7)
  {
    uint64_t v10 = [v22 partnerName];
    v11 = (void *)v10;
    if (v10)
    {
      id v12 = PKLocalizedPaymentString(&cfstr_CannotAddCardM.isa, &stru_1EF1B5770.isa, v9, v10);
    }
    else
    {
      v13 = [v22 displayName];
      id v12 = PKLocalizedPaymentString(&cfstr_CannotAddCardM.isa, &stru_1EF1B5770.isa, v9, v13);
    }
  }
  else
  {
    id v12 = PKLocalizedPaymentString(&cfstr_CannotAddCardM_0.isa, &stru_1EF1B4C70.isa, v8);
  }

  objc_super v14 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  [v14 setText:v12];

  [(PKTableHeaderView *)self->_headerView sizeToFit];
  objc_super v15 = [(PKPaymentSetupTableViewController *)self tableView];
  [(PKTableHeaderView *)self->_headerView bounds];
  [v15 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v24)];

  v16 = [(PKLinkedAppView *)self->_appViewCell linkedAppView];
  v17 = [v22 associatedStoreIdentifiers];
  [v16 setStoreIDs:v17];

  v18 = [(PKLinkedAppView *)self->_appViewCell linkedAppView];
  v19 = [v22 appLaunchURL];
  [v18 setAppLaunchURL:v19];

  v20 = [(PKLinkedAppView *)self->_appViewCell linkedAppView];
  [v20 reloadApplicationStateIfNecessary];

  v21 = [(PKPaymentSetupTableViewController *)self tableView];
  [v21 reloadData];
}

- (void)setProduct:(id)a3
{
  v5 = (PKPaymentSetupProduct *)a3;
  if (self->_product != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_product, a3);
    [(PKPaymentCardUnsupportedViewController *)self _updateViewsWithProduct:self->_product];
    v5 = v6;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PKPaymentSetupProduct *)self->_product associatedStoreIdentifiers];
  int64_t v5 = [v4 count] != 0;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_appViewCell;
}

- (void)_done:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 viewControllerDidTerminateSetupFlow:self];
    }
  }
}

- (void)appViewContentSizeChanged:(id)a3
{
  v4 = [(PKPaymentSetupTableViewController *)self tableView];
  [v4 beginUpdates];

  id v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [v5 endUpdates];
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_appViewCell, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end