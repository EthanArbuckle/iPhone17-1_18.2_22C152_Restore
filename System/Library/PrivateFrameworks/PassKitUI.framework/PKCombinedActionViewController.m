@interface PKCombinedActionViewController
- (CGSize)_imageSize;
- (NSString)subtitleText;
- (NSString)titleText;
- (PKCollapsibleHeaderView)headerView;
- (PKCombinedActionViewController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 balanceModel:(id)a7 mode:(unint64_t)a8;
- (PKCombinedActionViewControllerDelegate)delegate;
- (UIColor)backgroundColor;
- (UIColor)headerBackgroundColor;
- (UIFont)titleFont;
- (id)headerImage;
- (void)_cancelButtonPressed:(id)a3;
- (void)didSelectAction:(id)a3 completion:(id)a4;
- (void)didSelectActionGroup:(id)a3 completion:(id)a4;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)remoteGroupActionsViewControllerDidCancel:(id)a3;
- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3;
- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderBackgroundColor:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKCombinedActionViewController

- (PKCombinedActionViewController)initWithPass:(id)a3 actionGroups:(id)a4 paymentDataProvider:(id)a5 webService:(id)a6 balanceModel:(id)a7 mode:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v33 = a5;
  id v32 = a6;
  id v17 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PKCombinedActionViewController;
  v18 = [(PKDynamicCollectionViewController *)&v34 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    objc_storeStrong((id *)&v19->_webService, a6);
    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    objc_storeStrong((id *)&v19->_actionGroups, a4);
    v19->_mode = a8;
    v20 = [v17 displayableCommutePlanActions];
    uint64_t v21 = objc_msgSend(v20, "pk_objectsPassingTest:", &__block_literal_global_120);
    actions = v19->_actions;
    v19->_actions = (NSArray *)v21;

    v23 = [PKCollapsibleHeaderView alloc];
    uint64_t v24 = -[PKCollapsibleHeaderView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    headerView = v19->_headerView;
    v19->_headerView = (PKCollapsibleHeaderView *)v24;

    v26 = [[PKPassView alloc] initWithPass:v15 content:5];
    passView = v19->_passView;
    v19->_passView = v26;

    objc_storeStrong((id *)&v19->_transitBalanceModel, a7);
    v28 = [(PKCombinedActionViewController *)v19 navigationItem];
    id v29 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v29 configureWithTransparentBackground];
    [v28 setStandardAppearance:v29];
    v30 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v19 action:sel__cancelButtonPressed_];
    [v28 setLeftBarButtonItem:v30];
    [(PKDynamicCollectionViewController *)v19 setUseItemIdentityWhenUpdating:1];
  }
  return v19;
}

uint64_t __109__PKCombinedActionViewController_initWithPass_actionGroups_paymentDataProvider_webService_balanceModel_mode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 2) {
    uint64_t v3 = [v2 isActionAvailable];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)viewDidLoad
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PKCombinedActionViewController;
  [(PKDynamicCollectionViewController *)&v23 viewDidLoad];
  uint64_t v3 = [(PKCombinedActionViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKCombinedActionViewController *)self setBackgroundColor:v4];
  [(PKCombinedActionViewController *)self setHeaderBackgroundColor:v4];
  unint64_t mode = self->_mode;
  if (mode == 1)
  {
    PKPassLocalizedStringWithFormat();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = [PKCombinedSelectActionViewControllerListSectionController alloc];
    id v15 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", 0);
    id v16 = [v15 UUIDString];
    id v17 = [(PKCombinedSelectActionViewControllerListSectionController *)v14 initWithIdentifier:v16 pass:self->_pass actions:self->_actions];
    actionsListController = self->_actionsListController;
    self->_actionsListController = v17;

    [(PKCombinedSelectActionViewControllerListSectionController *)self->_actionsListController setDelegate:self];
    uint64_t v24 = self->_actionsListController;
    v13 = &v24;
  }
  else
  {
    if (mode)
    {
      v7 = &stru_1EF1B5B50;
      goto LABEL_9;
    }
    v6 = [(NSArray *)self->_actionGroups firstObject];
    v7 = [v6 title];

    if (!v7)
    {
      uint64_t v22 = 0;
      PKPassLocalizedStringWithFormat();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v8 = [PKCombinedSelectActionGroupViewControllerListSectionController alloc];
    v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = [v9 UUIDString];
    v11 = [(PKCombinedSelectActionGroupViewControllerListSectionController *)v8 initWithIdentifier:v10 pass:self->_pass actionGroups:self->_actionGroups];
    actionGroupsListController = self->_actionGroupsListController;
    self->_actionGroupsListController = v11;

    [(PKCombinedSelectActionGroupViewControllerListSectionController *)self->_actionGroupsListController setDelegate:self];
    v25[0] = self->_actionGroupsListController;
    v13 = (PKCombinedSelectActionViewControllerListSectionController **)v25;
  }
  v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 1, v22);
  [(PKDynamicCollectionViewController *)self setSections:v19 animated:1];

LABEL_9:
  [(PKCombinedActionViewController *)self setTitleText:v7];
  passView = self->_passView;
  [(PKCombinedActionViewController *)self _imageSize];
  uint64_t v21 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](passView, "snapshotOfFrontFaceWithRequestedSize:");
  [(PKCombinedActionViewController *)self setHeaderImage:v21];

  [v3 addSubview:self->_headerView];
}

- (CGSize)_imageSize
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double v3 = dbl_1A0442FE0[v2 < 5];
  double v4 = dbl_1A0442FF0[v2 < 5];
  if (!v2)
  {
    double v4 = 81.0;
    double v3 = 51.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCombinedActionViewController;
  [(PKDynamicCollectionViewController *)&v4 viewDidAppear:a3];
  self->_viewDidAppear = 1;
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKCombinedActionViewController;
  [(PKDynamicCollectionViewController *)&v28 viewWillLayoutSubviews];
  double v3 = [(PKCombinedActionViewController *)self view];
  objc_super v4 = [v3 readableContentGuide];
  [v4 layoutFrame];
  double v6 = v5;
  double v8 = v7;

  [v3 safeAreaInsets];
  double v10 = v9;
  v11 = [(PKDynamicCollectionViewController *)self collectionView];
  [v11 frame];
  double v13 = v12;
  [v11 contentOffset];
  double v25 = v15;
  double v26 = v14;
  [v11 contentInset];
  double v17 = v16;
  double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  CGFloat v21 = v10 + v13;
  double headerHeight = self->_headerHeight;
  v29.origin.x = v6;
  v29.origin.y = v21;
  v29.size.width = v8;
  v29.size.height = headerHeight;
  CGRectGetMaxY(v29);
  -[PKCollapsibleHeaderView setFrame:](self->_headerView, "setFrame:", v6, v21, v8, headerHeight);
  headerView = self->_headerView;
  if (headerView)
  {
    [(PKCollapsibleHeaderView *)headerView heightBoundsForWidth:v8];
    double v24 = v27;
  }
  else
  {
    double v24 = 0.0;
  }
  objc_msgSend(v11, "setContentInset:", v24, v18, v19, v20);
  if (v17 - v24 != 0.0) {
    objc_msgSend(v11, "setContentOffset:", v26, v25 + v17 - v24);
  }
}

- (void)setTitleFont:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(PKCollapsibleHeaderView *)self->_headerView titleFont];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0) {
    [(PKCollapsibleHeaderView *)self->_headerView setTitleFont:v6];
  }
}

- (UIFont)titleFont
{
  return [(PKCollapsibleHeaderView *)self->_headerView titleFont];
}

- (void)setTitleText:(id)a3
{
  p_titleText = &self->_titleText;
  id v7 = a3;
  if (!-[NSString isEqualToString:](*p_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(PKCollapsibleHeaderView *)self->_headerView setTitle:*p_titleText subtitle:self->_subtitleText];
    id v6 = [(PKCombinedActionViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)setSubtitleText:(id)a3
{
  p_subtitleText = &self->_subtitleText;
  id v7 = a3;
  if (!-[NSString isEqualToString:](*p_subtitleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_subtitleText, a3);
    [(PKCollapsibleHeaderView *)self->_headerView setTitle:self->_titleText subtitle:*p_subtitleText];
    id v6 = [(PKCombinedActionViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v7 = (UIColor *)a3;
  if (self->_backgroundColor != v7)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    char v5 = [(PKDynamicCollectionViewController *)self collectionView];
    [v5 setBackgroundColor:v7];

    id v6 = [(PKCombinedActionViewController *)self view];
    [v6 setBackgroundColor:v7];
  }
}

- (void)setHeaderBackgroundColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_headerBackgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_headerBackgroundColor, a3);
    [(PKCollapsibleHeaderView *)self->_headerView setBackgroundColor:self->_headerBackgroundColor];
    char v5 = v6;
  }
}

- (id)headerImage
{
  return [(PKCollapsibleHeaderView *)self->_headerView image];
}

- (void)setHeaderImage:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(PKCollapsibleHeaderView *)self->_headerView image];
  char v5 = [v4 isEqual:v7];

  if ((v5 & 1) == 0)
  {
    [(PKCollapsibleHeaderView *)self->_headerView setImage:v7];
    id v6 = [(PKCombinedActionViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  double v5 = v4;
  id v6 = [(PKCombinedActionViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v5 + v7;

  double v25 = 0.0;
  long long v23 = 0u;
  long long v24 = 0u;
  headerView = self->_headerView;
  [(PKCollapsibleHeaderView *)headerView bounds];
  if (headerView)
  {
    [(PKCollapsibleHeaderView *)headerView heightBoundsForWidth:v10];
    double v11 = v25;
    double v12 = *(double *)&v23;
  }
  else
  {
    double v25 = 0.0;
    double v12 = 0.0;
    double v11 = 0.0;
    long long v23 = 0u;
    long long v24 = 0u;
  }
  double v13 = fmin(v11, fmax(-v8, v12));
  if (v13 != self->_headerHeight)
  {
    self->_double headerHeight = v13;
    double v14 = v13 + -8.0;
    if (v13 + -8.0 < *((double *)&v24 + 1) && self->_viewDidAppear)
    {
      titleText = self->_titleText;
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
      titleText = 0;
    }
    v22.receiver = self;
    v22.super_class = (Class)PKCombinedActionViewController;
    [(PKCombinedActionViewController *)&v22 setTitle:titleText];
    double v17 = (*((double *)&v24 + 1) - v14) * 0.125;
    double v18 = [(PKCombinedActionViewController *)self navigationItem];
    double v19 = v18;
    double v20 = 0.0;
    if (v16) {
      double v20 = v17;
    }
    [v18 _setManualScrollEdgeAppearanceProgress:v20];
  }
  CGFloat v21 = [(PKCombinedActionViewController *)self view];
  [v21 setNeedsLayout];
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = [(PKCombinedActionViewController *)self delegate];
  [v4 combinedActionViewControllerDidCancel:self];
}

- (void)didSelectActionGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [[PKRemoteActionGroupViewController alloc] initWithPass:self->_pass actionGroup:v6 paymentDataProvider:self->_paymentDataProvider webService:self->_webService];
  [(PKRemoteActionGroupViewController *)v8 setDelegate:self];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PKCombinedActionViewController_didSelectActionGroup_completion___block_invoke;
  v11[3] = &unk_1E59D6E68;
  objc_copyWeak(&v14, &location);
  double v9 = v8;
  double v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(PKRemoteActionGroupViewController *)v9 preflightWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__PKCombinedActionViewController_didSelectActionGroup_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = [WeakRetained navigationController];
      [v7 pushViewController:*(void *)(a1 + 32) animated:1];
    }
    else
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
}

- (void)didSelectAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v19 = 0;
  pass = self->_pass;
  id v18 = 0;
  char v9 = [(PKPaymentPass *)pass canPerformAction:v6 unableReason:&v19 displayableError:&v18];
  id v10 = v18;
  if ((v9 & 1) != 0 || v19 == 2)
  {
    double v12 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:v6 paymentDataProvider:self->_paymentDataProvider];
    [(PKPerformActionViewController *)v12 setDelegate:self];
    [(PKPerformActionViewController *)v12 setWebService:self->_webService];
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__PKCombinedActionViewController_didSelectAction_completion___block_invoke;
    v13[3] = &unk_1E59D6E68;
    objc_copyWeak(&v16, &location);
    double v11 = v12;
    id v14 = v11;
    double v15 = v7;
    [(PKPerformActionViewController *)v11 preflightWithCompletion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    double v11 = +[PKPerformActionViewController alertControllerForUnableReason:v19 action:v6 displayableError:v10 addCardActionHandler:0];
    [(PKCombinedActionViewController *)self presentViewController:v11 animated:1 completion:0];
    if (v7) {
      v7[2](v7);
    }
  }
}

void __61__PKCombinedActionViewController_didSelectAction_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = [WeakRetained navigationController];
      [v7 pushViewController:*(void *)(a1 + 32) animated:1];
    }
    else
    {
      [WeakRetained presentViewController:v9 animated:1 completion:0];
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
  }
}

- (void)remoteGroupActionsViewControllerDidCancel:(id)a3
{
  id v7 = a3;
  id v4 = [v7 navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:0];

  id v6 = [(PKCombinedActionViewController *)self delegate];
  [v6 combinedActionViewControllerDidCancel:self];

  [v7 setDelegate:0];
}

- (void)remoteGroupActionsViewControllerDidPerformFetchActionGroup:(id)a3
{
  id v7 = a3;
  id v4 = [v7 navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:0];

  id v6 = [(PKCombinedActionViewController *)self delegate];
  [v6 combinedActionViewControllerDidFinish:self];

  [v7 setDelegate:0];
}

- (void)remoteGroupActionsViewControllerDidPerformPayment:(id)a3
{
  id v7 = a3;
  id v4 = [v7 navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:0];

  id v6 = [(PKCombinedActionViewController *)self delegate];
  [v6 combinedActionViewControllerDidFinish:self];

  [v7 setDelegate:0];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v7 = a3;
  id v4 = [v7 navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:0];

  id v6 = [(PKCombinedActionViewController *)self delegate];
  [v6 combinedActionViewControllerDidCancel:self];

  [v7 setDelegate:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v5 = a3;
  id v4 = [(PKCombinedActionViewController *)self delegate];
  [v4 combinedActionViewControllerDidFinish:self];

  [v5 setDelegate:0];
}

- (PKCollapsibleHeaderView)headerView
{
  return self->_headerView;
}

- (PKCombinedActionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCombinedActionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIColor)headerBackgroundColor
{
  return self->_headerBackgroundColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_headerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_selectedActionGroup, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_actionsListController, 0);

  objc_storeStrong((id *)&self->_actionGroupsListController, 0);
}

@end