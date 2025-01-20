@interface PKPaymentSelectPassesViewController
- (BOOL)confirmIntentToDelete;
- (BOOL)showCancelButton;
- (NSString)buttonText;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (PKPaymentSelectPassesViewController)initWithSecureElementPasses:(id)a3 context:(int64_t)a4 delegate:(id)a5 peerPaymentAccount:(id)a6 reporter:(id)a7;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)headerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)minimumSelectionCount;
- (void)_cancelPressed;
- (void)_continuousButtonPressed;
- (void)_setContinuousButtonEnabledState;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_setViewEnabledState:(BOOL)a3;
- (void)setButtonText:(id)a3;
- (void)setConfirmIntentToDelete:(BOOL)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4;
- (void)setMinimumSelectionCount:(unint64_t)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PKPaymentSelectPassesViewController

- (PKPaymentSelectPassesViewController)initWithSecureElementPasses:(id)a3 context:(int64_t)a4 delegate:(id)a5 peerPaymentAccount:(id)a6 reporter:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentSelectPassesViewController;
  v17 = [(PKPaymentSetupTableViewController *)&v25 initWithContext:a4];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_passes, a3);
    objc_storeWeak((id *)&v18->_delegate, v14);
    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    selectedIndexPaths = v18->_selectedIndexPaths;
    v18->_selectedIndexPaths = (NSMutableArray *)v19;

    v18->_minimumSelectionCount = 1;
    objc_storeStrong((id *)&v18->_peerPaymentAccount, a6);
    objc_storeStrong((id *)&v18->_reporter, a7);
    v21 = PKLocalizedPaymentString(&cfstr_Continue.isa);
    [(PKPaymentSelectPassesViewController *)v18 setButtonText:v21];

    v22 = [(PKPaymentSetupTableViewController *)v18 dockView];
    v23 = [v22 primaryButton];
    [v23 addTarget:v18 action:sel__continuousButtonPressed forControlEvents:64];

    [(PKPaymentSelectPassesViewController *)v18 _setContinuousButtonEnabledState];
  }

  return v18;
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSelectPassesViewController;
  -[PKPaymentSelectPassesViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained selectPassesViewControllerDidTapBackButton:self];
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSelectPassesViewController;
  [(PKPaymentSelectPassesViewController *)&v6 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentSelectPassesViewControllerCellIdentifier"];

  v4 = [(PKPaymentSelectPassesViewController *)self headerView];
  v5 = [(PKPaymentSetupTableViewController *)self tableView];
  [v5 setTableHeaderView:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSelectPassesViewController;
  [(PKPaymentSetupTableViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSelectPassesViewController;
  [(PKPaymentSelectPassesViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(PKPaymentSelectPassesViewController *)self headerView];
  [v3 sizeToFit];

  objc_super v4 = [(PKPaymentSetupTableViewController *)self tableView];
  v5 = [(PKPaymentSelectPassesViewController *)self headerView];
  [v5 bounds];
  [v4 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v7)];
}

- (void)setMinimumSelectionCount:(unint64_t)a3
{
  self->_minimumSelectionCount = a3;
  [(PKPaymentSelectPassesViewController *)self _setContinuousButtonEnabledState];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_passes count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  CGRect v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentSelectPassesViewControllerCellIdentifier" forIndexPath:v6];
  v8 = -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", [v6 row]);
  [v7 setPass:v8];
  [v7 setPeerPaymentAccount:self->_peerPaymentAccount];
  v9 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v7 setBackgroundColor:v9];

  LODWORD(self) = [(NSMutableArray *)self->_selectedIndexPaths containsObject:v6];
  if (self) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v7 setAccessoryType:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSelectPassesViewController;
  [(PKPaymentSetupTableViewController *)&v22 tableView:v6 didSelectRowAtIndexPath:v7];
  [v6 deselectRowAtIndexPath:v7 animated:1];
  v8 = [v6 cellForRowAtIndexPath:v7];
  if (self->_minimumSelectionCount == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_selectedIndexPaths;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(v6, "cellForRowAtIndexPath:", *(void *)(*((void *)&v18 + 1) + 8 * v13), (void)v18);
          [v14 setAccessoryType:0];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)self->_selectedIndexPaths removeAllObjects];
    selectedIndexPaths = self->_selectedIndexPaths;
    goto LABEL_12;
  }
  int v16 = [(NSMutableArray *)self->_selectedIndexPaths containsObject:v7];
  selectedIndexPaths = self->_selectedIndexPaths;
  if (!v16)
  {
LABEL_12:
    -[NSMutableArray addObject:](selectedIndexPaths, "addObject:", v7, (void)v18);
    uint64_t v17 = 3;
    goto LABEL_13;
  }
  [(NSMutableArray *)selectedIndexPaths removeObject:v7];
  uint64_t v17 = 0;
LABEL_13:
  [v8 setAccessoryType:v17];
  [(PKPaymentSelectPassesViewController *)self _setContinuousButtonEnabledState];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[PKPaymentPassTableViewCell heightForCellWithMinimum:hasSubTitle:](PKPaymentPassTableViewCell, "heightForCellWithMinimum:hasSubTitle:", 1, a4, 60.0);
  return result;
}

- (void)setHeaderTitle:(id)a3
{
  p_headerTitle = &self->_headerTitle;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_headerTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_headerTitle, a3);
    [(PKPaymentSelectPassesViewController *)self setHeaderViewTitle:*p_headerTitle subtitle:self->_headerSubtitle];
  }
}

- (void)setHeaderSubtitle:(id)a3
{
  p_headerSubtitle = &self->_headerSubtitle;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_headerSubtitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_headerSubtitle, a3);
    [(PKPaymentSelectPassesViewController *)self setHeaderViewTitle:self->_headerTitle subtitle:*p_headerSubtitle];
  }
}

- (id)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    objc_super v4 = [PKTableHeaderView alloc];
    v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_headerView;
    self->_headerView = v5;

    id v7 = [(PKPaymentSelectPassesViewController *)self traitCollection];
    uint64_t v8 = [v7 userInterfaceIdiom];

    v9 = self->_headerView;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(PKPaymentSetupTableViewController *)self context];
      uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else
    {
      uint64_t IsSetupAssistant = 0;
    }
    [(PKTableHeaderView *)v9 setStyle:IsSetupAssistant];
    uint64_t v11 = [(PKTableHeaderView *)self->_headerView titleLabel];
    [v11 setText:self->_headerTitle];

    uint64_t v12 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
    [v12 setText:self->_headerSubtitle];

    uint64_t v13 = self->_headerView;
    id v14 = [(PKPaymentSetupTableViewController *)self tableView];
    [v14 bounds];
    -[PKTableHeaderView sizeThatFits:](v13, "sizeThatFits:", CGRectGetWidth(v21), 3.40282347e38);
    double v16 = v15;
    double v18 = v17;

    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v16, v18);
    headerView = self->_headerView;
  }

  return headerView;
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  id v18 = a4;
  id v6 = (NSString *)a3;
  id v7 = [(PKPaymentSelectPassesViewController *)self headerView];
  headerTitle = v6;
  if (!v6) {
    headerTitle = self->_headerTitle;
  }
  v9 = headerTitle;

  uint64_t v10 = [v7 titleLabel];
  [v10 setText:v9];

  if (v18)
  {
    uint64_t v11 = [v7 subtitleLabel];
    [v11 setText:v18];
  }
  uint64_t v12 = [(PKPaymentSetupTableViewController *)self tableView];
  [v7 frame];
  double v14 = v13;
  [v12 bounds];
  objc_msgSend(v7, "sizeThatFits:", v15, 1.79769313e308);
  if (v16 > v14)
  {
    double v17 = v16;
    [v12 _rectForTableHeaderView];
    objc_msgSend(v7, "setFrame:");
    [v12 _tableHeaderHeightDidChangeToHeight:v17];
  }
  [v7 setNeedsLayout];
}

- (void)setButtonText:(id)a3
{
  p_buttonText = &self->_buttonText;
  id v8 = a3;
  if (!-[NSString isEqualToString:](*p_buttonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_buttonText, a3);
    id v6 = [(PKPaymentSetupTableViewController *)self dockView];
    id v7 = [v6 primaryButton];
    [v7 setTitle:*p_buttonText forState:0];
  }
}

- (void)_setContinuousButtonEnabledState
{
  id v4 = [(PKPaymentSetupTableViewController *)self dockView];
  v3 = [v4 primaryButton];
  objc_msgSend(v3, "setEnabled:", -[NSMutableArray count](self->_selectedIndexPaths, "count") >= self->_minimumSelectionCount);
}

- (void)_continuousButtonPressed
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = self->_selectedIndexPaths;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", [*(id *)(*((void *)&v31 + 1) + 8 * i) row]);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke;
  aBlock[3] = &unk_1E59CA870;
  aBlock[4] = self;
  id v10 = v3;
  id v30 = v10;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = v11;
  if (self->_confirmIntentToDelete)
  {
    uint64_t v13 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
    unint64_t v14 = [v10 count];
    if (v14 > 1)
    {
      double v15 = PKLocalizedShareableCredentialString(&cfstr_SelectPassesTo_1.isa, &cfstr_Lu.isa, v14);
      double v16 = @"SELECT_PASSES_TO_DELETE_CONFIRMATION_MESSAGE_PLURAL";
    }
    else
    {
      double v15 = PKLocalizedShareableCredentialString(&cfstr_SelectPassesTo.isa);
      double v16 = @"SELECT_PASSES_TO_DELETE_CONFIRMATION_MESSAGE_SINGULAR";
    }
    [(PKPaymentSetupTableViewController *)self context];
    int IsBridge = PKPaymentSetupContextIsBridge();
    PKDeviceSpecificLocalizedStringKeyForKey(v16, IsBridge);
    id v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    long long v19 = PKLocalizedShareableCredentialString(v18);

    long long v20 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:v19 preferredStyle:v13];
    CGRect v21 = (void *)MEMORY[0x1E4FB1410];
    objc_super v22 = PKLocalizedShareableCredentialString(&cfstr_SelectPassesTo_5.isa);
    v23 = [v21 actionWithTitle:v22 style:1 handler:0];
    [v20 addAction:v23];

    uint64_t v24 = (void *)MEMORY[0x1E4FB1410];
    objc_super v25 = PKLocalizedShareableCredentialString(&cfstr_SelectPassesDe.isa);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_4;
    v27[3] = &unk_1E59CB150;
    id v28 = v12;
    v26 = [v24 actionWithTitle:v25 style:2 handler:v27];
    [v20 addAction:v26];

    [(PKPaymentSelectPassesViewController *)self presentViewController:v20 animated:1 completion:0];
  }
  else
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
}

void __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setViewEnabledState:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1120));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (void *)[*(id *)(a1 + 40) copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_2;
  v5[3] = &unk_1E59CA7D0;
  v5[4] = *(void *)(a1 + 32);
  [WeakRetained selectPassesViewController:v3 didSelectPasses:v4 completion:v5];
}

void __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setViewEnabledState:1];
}

uint64_t __63__PKPaymentSelectPassesViewController__continuousButtonPressed__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setViewEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKPaymentSelectPassesViewController *)self view];
  [v10 setUserInteractionEnabled:v3];
  uint64_t v5 = [(PKPaymentSetupTableViewController *)self dockView];
  uint64_t v6 = [v5 primaryButton];
  [v6 setEnabled:v3];

  [(PKPaymentSelectPassesViewController *)self _setNavigationBarEnabled:v3];
  if (v3)
  {
    uint64_t v7 = [(PKPaymentSelectPassesViewController *)self navigationItem];
    [v7 setRightBarButtonItem:0];
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
    v9 = [(PKPaymentSelectPassesViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  [v10 setNeedsLayout];
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKPaymentSelectPassesViewController *)self navigationController];
  uint64_t v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  uint64_t v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  uint64_t v7 = [(PKPaymentSelectPassesViewController *)self navigationItem];
  [v7 setHidesBackButton:v3 ^ 1];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (((!self->_showCancelButton ^ a3) & 1) == 0)
  {
    self->_showCancelButton = a3;
    id v4 = [(PKPaymentSelectPassesViewController *)self navigationItem];
    id v7 = v4;
    if (self->_showCancelButton)
    {
      uint64_t v5 = [(PKPaymentSelectPassesViewController *)self navigationItem];
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
      [v5 setLeftBarButtonItem:v6];
    }
    else
    {
      [v4 setLeftBarButtonItem:0];
    }
  }
}

- (void)_cancelPressed
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained selectPassesViewControllerDidTapBackButton:self];
}

- (unint64_t)minimumSelectionCount
{
  return self->_minimumSelectionCount;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)confirmIntentToDelete
{
  return self->_confirmIntentToDelete;
}

- (void)setConfirmIntentToDelete:(BOOL)a3
{
  self->_confirmIntentToDelete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_passes, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end