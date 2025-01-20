@interface PKTransactionHistoryViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)_shouldBlurButtons;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)shouldPromptForReview;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKContactAvatarManager)contactAvatarManager;
- (PKFamilyMemberCollection)familyCollection;
- (PKPaymentTransaction)transaction;
- (PKTransactionHistoryViewController)initWithFetcher:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 featuredTransaction:(id)a9 selectedTransactions:(id)a10 transactionHistory:(id)a11;
- (PKTransactionHistoryViewController)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8;
- (PKTransactionHistoryViewController)initWithTransactionGroup:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 transactionHistory:(id)a10 detailViewStyle:(int64_t)a11;
- (PKTransactionHistoryViewController)initWithTransactionGroups:(id)a3 headerGroup:(id)a4 groupPresenter:(id)a5 regionUpdater:(id)a6 tokens:(id)a7 transactionSourceCollection:(id)a8 familyCollection:(id)a9 account:(id)a10 accountUserCollection:(id)a11 physicalCards:(id)a12;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (id)_barButtonItems;
- (id)_toolbarItems;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (unint64_t)historyType;
- (void)_handleEditButtonTapped:(id)a3;
- (void)_handleInfoButtonTapped;
- (void)_handleMessageButtonTapped;
- (void)_handlePhoneButtonTapped;
- (void)_handleRemoveButtonTapped:(id)a3;
- (void)_handleSelectButtonTapped:(id)a3;
- (void)_showContactDetailsViewController;
- (void)_showMapsDetailsViewController;
- (void)_showRemoveAlert:(id)a3;
- (void)_updateButtonConfigurationsDisablingBlur:(BOOL)a3;
- (void)_updateHeaderCellWithAnimationProgress:(id)a3;
- (void)_updateNavigationBar;
- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3;
- (void)_updateNavigationBarIconWithLogoURL:(id)a3;
- (void)_updateTitle;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)presentActivityDeletionConfirmationWithCompletion:(id)a3;
- (void)setContactAvatarManager:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setShouldPromptForReview:(BOOL)a3;
- (void)updateContent;
- (void)updateGroup:(id)a3;
- (void)updateGroups:(id)a3 headerGroup:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKTransactionHistoryViewController

- (PKTransactionHistoryViewController)initWithFetcher:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 featuredTransaction:(id)a9 selectedTransactions:(id)a10 transactionHistory:(id)a11
{
  v53[6] = *MEMORY[0x1E4F143B8];
  id v51 = a4;
  id v47 = a5;
  id v50 = a5;
  id v49 = a9;
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  unint64_t v23 = [v22 type];
  uint64_t v24 = 0;
  int v25 = 0;
  if (v23 <= 6)
  {
    if (((1 << v23) & 0x59) != 0)
    {
      int v25 = 0;
      uint64_t v24 = 2;
    }
    else if (v23 == 1)
    {
      int v25 = 1;
      uint64_t v24 = 1;
    }
    else if (v23 == 5)
    {
      int v25 = 0;
      uint64_t v24 = 3;
    }
  }
  v26 = [[PKTransactionHistoryDataSource alloc] initWithFetcher:v22 transactionSourceCollection:v51 familyCollection:v50 account:v21 accountUserCollection:v20 physicalCards:v19 featuredTransaction:v49 selectedTransactions:v18 transactionHistory:v17 type:v24];

  v27 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v28 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:1 detailViewStyle:0 avatarViewDelegate:self];
  v29 = objc_alloc_init(PKDashboardMapItemPresenter);
  v30 = objc_alloc_init(PKDashboardTextActionItemPresenter);
  v31 = objc_alloc_init(PKDashboardTransactionInstallmentItemPresenter);
  v48 = objc_alloc_init(PKDashboardTransactionReceiptItemPresenter);
  v32 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  v33 = v32;
  if (v25) {
    [(PKHeaderVerticalScrollingLayout *)v32 setUseStickyHeader:1];
  }
  v53[0] = v27;
  v53[1] = v28;
  v53[2] = v29;
  v53[3] = v30;
  v53[4] = v31;
  v53[5] = v48;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:6];
  v52.receiver = self;
  v52.super_class = (Class)PKTransactionHistoryViewController;
  v35 = [(PKDashboardViewController *)&v52 initWithDataSource:v26 presenters:v34 layout:v33];

  if (v35)
  {
    v45 = v28;
    objc_storeStrong((id *)&v35->_transaction, a9);
    objc_storeStrong((id *)&v35->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v35->_familyCollection, v47);
    v35->_historyType = v24;
    uint64_t v36 = [(PKTransactionHistoryDataSource *)v26 headerIndexPath];
    headerIndexPath = v35->_headerIndexPath;
    v35->_headerIndexPath = (NSIndexPath *)v36;

    objc_storeStrong((id *)&v35->_headerPresenter, v27);
    [(PKTransactionHistoryDataSource *)v26 setCustomDelegate:v35];
    v38 = [(PKTransactionHistoryViewController *)v35 navigationItem];
    [(PKDashboardViewController *)v35 setUseChromelessNavigationItem:v35->_historyType != 1];
    objc_msgSend(v38, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v38, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v39 = [(PKTransactionHistoryViewController *)v35 _barButtonItems];
    [v38 setRightBarButtonItems:v39];

    v40 = [v38 standardAppearance];
    v41 = [v40 backgroundEffect];
    [(PKDashboardDetailHeaderItemPresenter *)v27 setOverlayEffect:v41];

    v42 = [v40 shadowColor];
    [(PKDashboardDetailHeaderItemPresenter *)v27 setShadowColor:v42];

    v43 = [(PKTransactionHistoryViewController *)v35 collectionView];
    [v43 setAllowsMultipleSelectionDuringEditing:1];

    v28 = v45;
  }

  return v35;
}

- (PKTransactionHistoryViewController)initWithTransactionGroup:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 transactionHistory:(id)a10 detailViewStyle:(int64_t)a11
{
  v59[3] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a6;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  v55 = v17;
  uint64_t v24 = [[PKTransactionHistoryDataSource alloc] initWithTransactionGroup:v16 transactionSourceCollection:v23 familyCollection:v22 account:v17 accountUserCollection:v21 physicalCards:v20 fetcher:v19 transactionHistory:v18];

  uint64_t v25 = 3;
  switch([v16 type])
  {
    case 4:
      break;
    case 5:
      uint64_t v25 = 4;
      break;
    case 7:
      uint64_t v25 = [v17 feature] == 2;
      break;
    case 9:
      uint64_t v25 = 1;
      break;
    default:
      uint64_t v25 = 0;
      break;
  }
  v26 = self;
  v27 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:v25 detailViewStyle:a11 avatarViewDelegate:self];
  v28 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v29 = objc_alloc_init(PKTransactionGroupItemPresenter);
  v30 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  if ([v16 type] == 14)
  {
    v54 = v24;
    v31 = v29;
    v32 = v27;
    v33 = [v16 searchQuery];
    v34 = [v33 tokens];
    uint64_t v35 = [v34 count];

    uint64_t v36 = [v16 searchQuery];
    v37 = [v36 merchantToken];
    v38 = [v37 group];
    v39 = [v38 merchant];

    int v40 = 0;
    if (v35 == 1)
    {
      if (v39)
      {
        int v40 = 1;
        [(PKHeaderVerticalScrollingLayout *)v30 setUseStickyHeader:1];
      }
      v27 = v32;
      v26 = self;
      v29 = v31;
    }
    else
    {
      v27 = v32;
      v26 = self;
      v29 = v31;
    }
    uint64_t v24 = v54;
  }
  else
  {
    int v40 = 0;
    v39 = 0;
  }
  uint64_t v41 = [v16 type];
  if (v41 == 2)
  {
    uint64_t v42 = 1;
    goto LABEL_19;
  }
  if (v41 == 9 || v41 == 7)
  {
    uint64_t v42 = 2;
LABEL_19:
    [(PKHeaderVerticalScrollingLayout *)v30 setTitleInset:v42];
  }
  v59[0] = v28;
  v59[1] = v27;
  v59[2] = v29;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
  v58.receiver = v26;
  v58.super_class = (Class)PKTransactionHistoryViewController;
  v44 = [(PKDashboardViewController *)&v58 initWithDataSource:v24 presenters:v43 layout:v30];

  if (v44)
  {
    v57 = v27;
    v44->_historyType = 2;
    uint64_t v45 = [(PKTransactionHistoryDataSource *)v24 headerIndexPath];
    headerIndexPath = v44->_headerIndexPath;
    v44->_headerIndexPath = (NSIndexPath *)v45;

    objc_storeStrong((id *)&v44->_headerPresenter, v28);
    [(PKTransactionHistoryDataSource *)v24 setCustomDelegate:v44];
    id v47 = [(PKTransactionHistoryViewController *)v44 navigationItem];
    [(PKDashboardViewController *)v44 setUseChromelessNavigationItem:v40 ^ 1u];
    if (((v40 ^ 1) & 1) == 0)
    {
      objc_msgSend(v47, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v47, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    }
    v48 = [(PKTransactionHistoryViewController *)v44 _barButtonItems];
    [v47 setRightBarButtonItems:v48];

    id v49 = [v47 standardAppearance];
    id v50 = [v49 backgroundEffect];
    [(PKDashboardDetailHeaderItemPresenter *)v28 setOverlayEffect:v50];

    id v51 = [v49 shadowColor];
    [(PKDashboardDetailHeaderItemPresenter *)v28 setShadowColor:v51];

    objc_super v52 = [(PKTransactionHistoryViewController *)v44 collectionView];
    [v52 setAllowsMultipleSelectionDuringEditing:1];

    v27 = v57;
  }

  return v44;
}

- (void)updateGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDashboardViewController *)self dataSource];
  [v5 updateGroup:v4];
}

- (void)setContactAvatarManager:(id)a3
{
  id v5 = (PKContactAvatarManager *)a3;
  if (self->_contactAvatarManager != v5)
  {
    objc_storeStrong((id *)&self->_contactAvatarManager, a3);
    [(PKDashboardDetailHeaderItemPresenter *)self->_headerPresenter setAvatarManager:v5];
  }
}

- (PKTransactionHistoryViewController)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  v42[4] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id obj = a5;
  id v16 = a5;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  v39 = v16;
  int v40 = v15;
  id v21 = [[PKTransactionHistoryDataSource alloc] initWithInstallmentPlan:v20 transactionSourceCollection:v15 familyCollection:v16 account:v19 accountUserCollection:v18 physicalCards:v17];

  id v22 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  id v23 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:1 detailViewStyle:0 avatarViewDelegate:self];
  uint64_t v24 = objc_alloc_init(PKDashboardInstallmentPlanStatusItemPresenter);
  uint64_t v25 = objc_alloc_init(PKDashboardTextActionItemPresenter);
  v26 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  v42[0] = v22;
  v42[1] = v24;
  v42[2] = v23;
  v42[3] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  v41.receiver = self;
  v41.super_class = (Class)PKTransactionHistoryViewController;
  v28 = [(PKDashboardViewController *)&v41 initWithDataSource:v21 presenters:v27 layout:v26];

  if (v28)
  {
    v28->_historyType = 3;
    objc_storeStrong((id *)&v28->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v28->_familyCollection, obj);
    uint64_t v29 = [(PKTransactionHistoryDataSource *)v21 headerIndexPath];
    headerIndexPath = v28->_headerIndexPath;
    v28->_headerIndexPath = (NSIndexPath *)v29;

    [(PKTransactionHistoryDataSource *)v21 setCustomDelegate:v28];
    [(PKDashboardViewController *)v28 setUseChromelessNavigationItem:1];
    v31 = [(PKTransactionHistoryViewController *)v28 navigationItem];
    v32 = [(PKTransactionHistoryViewController *)v28 _barButtonItems];
    [v31 setRightBarButtonItems:v32];

    v33 = [v31 standardAppearance];
    v34 = [v33 backgroundEffect];
    [(PKDashboardDetailHeaderItemPresenter *)v22 setOverlayEffect:v34];

    uint64_t v35 = [v33 shadowColor];
    [(PKDashboardDetailHeaderItemPresenter *)v22 setShadowColor:v35];

    uint64_t v36 = [(PKTransactionHistoryViewController *)v28 collectionView];
    [v36 setAllowsMultipleSelectionDuringEditing:1];
  }
  return v28;
}

- (PKTransactionHistoryViewController)initWithTransactionGroups:(id)a3 headerGroup:(id)a4 groupPresenter:(id)a5 regionUpdater:(id)a6 tokens:(id)a7 transactionSourceCollection:(id)a8 familyCollection:(id)a9 account:(id)a10 accountUserCollection:(id)a11 physicalCards:(id)a12
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v49 = a5;
  id v17 = a9;
  id v18 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a3;
  objc_super v52 = v17;
  uint64_t v25 = [[PKTransactionHistoryDataSource alloc] initWithTransactionGroups:v24 headerGroup:v16 regionUpdater:v23 tokens:v22 transactionSourceCollection:v21 familyCollection:v17 account:v20 accountUserCollection:v19 physicalCards:v18];

  v26 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v27 = [v49 snapshotManager];
  [(PKDashboardDetailHeaderItemPresenter *)v26 setSnapshotManager:v27];

  v28 = [v49 avatarManager];
  [(PKDashboardDetailHeaderItemPresenter *)v26 setAvatarManager:v28];

  uint64_t v29 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  if ([v16 type] == 14)
  {
    v30 = [v16 searchQuery];
    v31 = [v30 tokens];
    uint64_t v32 = [v31 count];

    v33 = [v16 searchQuery];
    v34 = [v33 merchantToken];
    uint64_t v35 = [v34 group];
    uint64_t v36 = [v35 merchant];

    int v37 = 0;
    if (v32 == 1 && v36)
    {
      int v37 = 1;
      [(PKHeaderVerticalScrollingLayout *)v29 setUseStickyHeader:1];
    }
  }
  else
  {
    int v37 = 0;
    uint64_t v36 = 0;
  }
  v54[0] = v26;
  v54[1] = v49;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  v53.receiver = self;
  v53.super_class = (Class)PKTransactionHistoryViewController;
  v39 = [(PKDashboardViewController *)&v53 initWithDataSource:v25 presenters:v38 layout:v29];

  if (v39)
  {
    v39->_historyType = 4;
    uint64_t v40 = [(PKTransactionHistoryDataSource *)v25 headerIndexPath];
    headerIndexPath = v39->_headerIndexPath;
    v39->_headerIndexPath = (NSIndexPath *)v40;

    objc_storeStrong((id *)&v39->_familyCollection, a9);
    [(PKTransactionHistoryDataSource *)v25 setCustomDelegate:v39];
    uint64_t v42 = [(PKTransactionHistoryViewController *)v39 navigationItem];
    [(PKDashboardViewController *)v39 setUseChromelessNavigationItem:v37 ^ 1u];
    if (((v37 ^ 1) & 1) == 0)
    {
      objc_msgSend(v42, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v42, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    }
    v43 = [(PKTransactionHistoryViewController *)v39 _barButtonItems];
    [v42 setRightBarButtonItems:v43];

    v44 = [v42 standardAppearance];
    uint64_t v45 = [v44 backgroundEffect];
    [(PKDashboardDetailHeaderItemPresenter *)v26 setOverlayEffect:v45];

    v46 = [v44 shadowColor];
    [(PKDashboardDetailHeaderItemPresenter *)v26 setShadowColor:v46];

    id v47 = [(PKTransactionHistoryViewController *)v39 collectionView];
    [v47 setAllowsMultipleSelectionDuringEditing:1];
  }
  return v39;
}

- (void)updateGroups:(id)a3 headerGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKDashboardViewController *)self dataSource];
  [v8 updateGroups:v7 headerGroup:v6];
}

- (void)dealloc
{
  loadingMapsTimer = self->_loadingMapsTimer;
  if (loadingMapsTimer)
  {
    dispatch_source_cancel(loadingMapsTimer);
    id v4 = self->_loadingMapsTimer;
    self->_loadingMapsTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryViewController;
  [(PKDashboardViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionHistoryViewController;
  [(PKDashboardViewController *)&v11 viewDidLoad];
  v3 = [(PKDashboardViewController *)self dataSource];
  id v4 = v3;
  if (self->_historyType)
  {
    objc_super v5 = [v3 merchant];
    self->_isHeaderPinned = v5 != 0;
  }
  else
  {
    self->_isHeaderPinned = 0;
  }
  id v6 = [(PKTransactionHistoryViewController *)self navigationItem];
  if ([v4 useLargeTitle]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [v6 setLargeTitleDisplayMode:v7];
  id v8 = [(PKTransactionHistoryViewController *)self view];
  v9 = +[PKDashboardViewController backgroundColor];
  [v8 setBackgroundColor:v9];

  [(PKTransactionHistoryViewController *)self _updateTitle];
  v10 = [(PKTransactionHistoryViewController *)self view];
  [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85AE0]];
}

- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3
{
  BOOL v3 = a3;
  titleIconImageView = self->_titleIconImageView;
  if (titleIconImageView)
  {
    titleView = self->_titleView;
    if (v3)
    {
      if (!titleView)
      {
        uint64_t v7 = [(PKTransactionHistoryViewController *)self navigationController];
        id v8 = [v7 navigationBar];
        [v8 frame];
        double v10 = v9;

        objc_super v11 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
        v12 = self->_titleView;
        self->_titleView = v11;

        v13 = [(PKTransactionHistoryViewController *)self navigationItem];
        objc_msgSend(v13, "pkui_setCenterAlignedTitleView:", self->_titleView);

        titleView = self->_titleView;
        titleIconImageView = self->_titleIconImageView;
      }
    }
    else
    {
      titleIconImageView = 0;
    }
    [(PKAnimatedNavigationBarTitleView *)titleView setTitleView:titleIconImageView animated:1];
  }
  else if (self->_titleText)
  {
    v14 = [(PKTransactionHistoryViewController *)self navigationItem];
    id v16 = v14;
    if (v3) {
      titleText = self->_titleText;
    }
    else {
      titleText = 0;
    }
    [v14 _setTitle:titleText animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  [(PKDashboardViewController *)self shouldPresentAllContent:1 animated:v3];
  objc_super v5 = [(PKDashboardViewController *)self dataSource];
  if ([v5 useLargeTitle])
  {
    id v6 = [(PKTransactionHistoryViewController *)self navigationController];
    uint64_t v7 = [v6 navigationBar];
    [v7 setPrefersLargeTitles:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryViewController;
  [(PKTransactionHistoryViewController *)&v5 viewDidDisappear:a3];
  if ([(PKTransactionHistoryViewController *)self shouldPromptForReview])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    [WeakRetained promptAppStoreReviewForTrigger:2];
  }
}

- (void)viewWillLayoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)PKTransactionHistoryViewController;
  [(PKTransactionHistoryViewController *)&v30 viewWillLayoutSubviews];
  BOOL v3 = [(PKTransactionHistoryViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  [v3 safeAreaInsets];
  double v8 = v7;
  double v9 = (double *)MEMORY[0x1E4FB2848];
  if (self->_footer)
  {
    double v10 = v6;
    [(PKDashboardViewControllerFooterContainer *)self->_footerContainer bounds];
    double v12 = v11 - v10;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  double v13 = v9[1];
  double v14 = v9[3];
  if (self->_isHeaderPinned)
  {
    double v15 = self->_headerHeight - v8 - fmin(v5, 0.0);
    double v16 = -v8;
  }
  else
  {
    double v16 = *v9;
    double v15 = *v9;
  }
  objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v15, v9[1], v12, v9[3]);
  objc_msgSend(v3, "setContentInset:", v16, v13, v12, v14);
  double merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;
  double headerHeight = self->_headerHeight;
  if (headerHeight <= 0.0)
  {
    self->_double merchantHeaderAnimationProgress = 0.0;
    double v19 = 0.0;
  }
  else
  {
    double v19 = fmin(fmax(v5 / vabdd_f64(headerHeight, v8), 0.0), 1.0);
    self->_double merchantHeaderAnimationProgress = v19;
    if (merchantHeaderAnimationProgress < 1.0 && v19 >= 1.0)
    {
      uint64_t v20 = 1;
LABEL_18:
      [(PKTransactionHistoryViewController *)self _updateNavigationBarIconForNavigationBarAppeared:v20];
      goto LABEL_19;
    }
  }
  if (merchantHeaderAnimationProgress >= 1.0 && v19 < 1.0)
  {
    uint64_t v20 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (self->_headerIndexPath)
  {
    id v22 = [(PKTransactionHistoryViewController *)self collectionView];
    id v23 = [v22 cellForItemAtIndexPath:self->_headerIndexPath];

    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PKTransactionHistoryViewController *)self _updateHeaderCellWithAnimationProgress:v23];
      }
    }
  }
  if (self->_isHeaderPinned)
  {
    double v24 = self->_merchantHeaderAnimationProgress;
    uint64_t v25 = [(PKTransactionHistoryViewController *)self navigationItem];
    v26 = v25;
    double v27 = 1.0;
    if (v24 < 1.0) {
      double v27 = 0.0;
    }
    [v25 _setManualScrollEdgeAppearanceProgress:v27];

    if (merchantHeaderAnimationProgress > 0.35 && v19 <= 0.35 || merchantHeaderAnimationProgress < 0.35 && v19 >= 0.35)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __60__PKTransactionHistoryViewController_viewWillLayoutSubviews__block_invoke;
      v28[3] = &unk_1E59CDA78;
      v28[4] = self;
      BOOL v29 = v19 >= 0.35;
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:6 animations:v28 completion:0];
    }
  }
}

uint64_t __60__PKTransactionHistoryViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1288));
  [WeakRetained setNeedsNavigationBarUpdate];

  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v3 _updateButtonConfigurationsDisablingBlur:v4];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionHistoryViewController;
  [(PKTransactionHistoryViewController *)&v13 viewDidLayoutSubviews];
  BOOL v3 = [(PKTransactionHistoryViewController *)self view];
  [v3 bounds];
  if (self->_footerContainer)
  {
    double v7 = v4;
    double v8 = v5;
    double v9 = v6;
    [v3 safeAreaInsets];
    double v11 = v10;
    -[PKDashboardViewControllerFooterContainer sizeThatFits:](self->_footerContainer, "sizeThatFits:", v8, v9);
    -[PKDashboardViewControllerFooterContainer setFrame:](self->_footerContainer, "setFrame:", 0.0, v7 + v9 - (v11 + v12), v8);
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKTransactionHistoryViewController;
  [(PKTransactionHistoryViewController *)&v7 didMoveToParentViewController:a3];
  double v4 = [(PKTransactionHistoryViewController *)self navigationController];
  if (!v4 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), double v6 = v4, (isKindOfClass & 1) == 0)) {
    double v6 = 0;
  }
  objc_storeWeak((id *)&self->_navigationController, v6);
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKTransactionHistoryViewController;
  [(PKTransactionHistoryViewController *)&v16 setEditing:a3 animated:1];
  double v5 = [(PKTransactionHistoryViewController *)self navigationItem];
  double v6 = [(PKTransactionHistoryViewController *)self _barButtonItems];
  [v5 setRightBarButtonItems:v6];

  if (v3)
  {
    objc_super v7 = [(PKTransactionHistoryViewController *)self collectionView];
    double v8 = [v7 indexPathsForSelectedItems];
    uint64_t v9 = [v8 count];

    if (v9) {
      double v10 = @"TRANSACTION_HISTORY_DESELECT_ALL";
    }
    else {
      double v10 = @"TRANSACTION_HISTORY_SELECT_ALL";
    }
    double v11 = PKLocalizedPaymentString(&v10->isa);
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v11 style:0 target:self action:sel__handleSelectButtonTapped_];
    objc_super v13 = [(PKTransactionHistoryViewController *)self navigationItem];
    [v13 setLeftBarButtonItem:v12 animated:1];

    double v14 = [(PKTransactionHistoryViewController *)self _toolbarItems];
    [(PKTransactionHistoryViewController *)self setToolbarItems:v14];
  }
  else
  {
    double v11 = [(PKTransactionHistoryViewController *)self navigationItem];
    [v11 setLeftBarButtonItem:0 animated:0];
  }

  double v15 = [(PKTransactionHistoryViewController *)self navigationController];
  [v15 setToolbarHidden:!v3 animated:1];
}

- (void)updateContent
{
  v42.receiver = self;
  v42.super_class = (Class)PKTransactionHistoryViewController;
  [(PKDashboardViewController *)&v42 updateContent];
  BOOL v3 = [(PKTransactionHistoryViewController *)self navigationItem];
  double v4 = [v3 rightBarButtonItems];
  double v5 = [(PKTransactionHistoryViewController *)self _barButtonItems];
  if ((PKEqualObjects() & 1) == 0) {
    [v3 setRightBarButtonItems:v5 animated:1];
  }
  double v6 = [(PKDashboardViewController *)self dataSource];
  [(PKTransactionHistoryViewController *)self _updateTitle];
  objc_super v7 = [v6 footerTitle];
  if (v7)
  {
    footer = self->_footer;
    if (!footer)
    {
      uint64_t v9 = [PKDashboardViewControllerFooterView alloc];
      double v10 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v14 = -[PKDashboardViewControllerFooterView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
      double v15 = self->_footer;
      self->_footer = v14;

      objc_super v16 = -[PKDashboardViewControllerFooterContainer initWithFrame:]([PKDashboardViewControllerFooterContainer alloc], "initWithFrame:", v10, v11, v12, v13);
      footerContainer = self->_footerContainer;
      self->_footerContainer = v16;

      [(PKDashboardViewControllerFooterContainer *)self->_footerContainer setCurrentFooter:self->_footer];
      id v18 = [(PKTransactionHistoryViewController *)self view];
      [v18 addSubview:self->_footerContainer];

      footer = self->_footer;
    }
    double v19 = [(PKDashboardViewControllerFooterView *)footer leadingTitle];
    [v19 setText:v7];

    uint64_t v20 = [v6 footerTotal];
    id v21 = [v20 amount];
    int v22 = objc_msgSend(v21, "pk_isNegativeNumber");

    if (v22)
    {
      [v20 negativeValue];
      uint64_t v40 = v7;
      id v23 = v5;
      v25 = double v24 = v4;

      v26 = [(PKDashboardViewControllerFooterView *)self->_footer leadingDetail];
      double v27 = [v25 formattedStringValue];
      v28 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v27);
      [v26 setText:v28];

      uint64_t v20 = v25;
      double v4 = v24;
      double v5 = v23;
      objc_super v7 = v40;
    }
    else
    {
      v26 = [(PKDashboardViewControllerFooterView *)self->_footer leadingDetail];
      double v27 = [v20 formattedStringValue];
      [v26 setText:v27];
    }

    BOOL v29 = [v6 footerSecondaryTitle];
    uint64_t v30 = [v6 footerSecondaryTotal];
    v31 = (void *)v30;
    if (v29 && v30)
    {
      v39 = v4;
      objc_super v41 = v3;
      uint64_t v32 = [(PKDashboardViewControllerFooterView *)self->_footer trailingTitle];
      [v32 setText:v29];

      v33 = [v31 amount];
      int v34 = objc_msgSend(v33, "pk_isNegativeNumber");

      if (v34)
      {
        uint64_t v35 = [v31 negativeValue];

        uint64_t v36 = [(PKDashboardViewControllerFooterView *)self->_footer trailingDetail];
        int v37 = [v35 formattedStringValue];
        v38 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v37);
        [v36 setText:v38];

        v31 = v35;
      }
      else
      {
        uint64_t v36 = [(PKDashboardViewControllerFooterView *)self->_footer trailingDetail];
        int v37 = [v31 formattedStringValue];
        [v36 setText:v37];
      }
      BOOL v3 = v41;

      double v4 = v39;
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKTransactionHistoryViewController;
  [(PKDashboardViewController *)&v16 collectionView:a3 layout:a4 sizeForItemAtIndexPath:v8];
  double v10 = v9;
  double v12 = v11;
  if (self->_headerIndexPath && objc_msgSend(v8, "isEqual:") && self->_headerHeight != v12)
  {
    self->_double headerHeight = v12;
    double v13 = [(PKTransactionHistoryViewController *)self view];
    [v13 setNeedsLayout];
  }
  double v14 = v10;
  double v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionHistoryViewController;
  objc_super v7 = [(PKDashboardViewController *)&v9 collectionView:a3 cellForItemAtIndexPath:v6];
  if (self->_headerIndexPath)
  {
    if (objc_msgSend(v6, "isEqual:"))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PKTransactionHistoryViewController *)self _updateHeaderCellWithAnimationProgress:v7];
      }
    }
  }

  return v7;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEditing])
  {
    id v8 = [(PKDashboardViewController *)self dataSource];
    objc_super v9 = [v8 itemAtIndexPath:v7];

    double v10 = [(PKDashboardViewController *)self dataSource];
    unsigned __int8 v11 = [v10 canDeleteItem:v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PKTransactionHistoryViewController;
    unsigned __int8 v11 = [(PKDashboardViewController *)&v13 collectionView:v6 shouldSelectItemAtIndexPath:v7];
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryViewController;
  id v6 = a3;
  [(PKDashboardViewController *)&v8 collectionView:v6 didSelectItemAtIndexPath:a4];
  LODWORD(a4) = objc_msgSend(v6, "isEditing", v8.receiver, v8.super_class);

  if (a4)
  {
    id v7 = [(PKTransactionHistoryViewController *)self _toolbarItems];
    [(PKTransactionHistoryViewController *)self setToolbarItems:v7];

    [(PKTransactionHistoryViewController *)self _updateNavigationBar];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  if ([a3 isEditing])
  {
    double v5 = [(PKTransactionHistoryViewController *)self _toolbarItems];
    [(PKTransactionHistoryViewController *)self setToolbarItems:v5];

    [(PKTransactionHistoryViewController *)self _updateNavigationBar];
  }
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  double v4 = [(PKDashboardViewController *)self dataSource];
  char v5 = [v4 areTransactionsEditable];

  return v5;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (void)_updateHeaderCellWithAnimationProgress:(id)a3
{
  id v4 = a3;
  [v4 setOverlayAlpha:self->_merchantHeaderAnimationProgress];
  if (self->_isHeaderPinned && self->_merchantHeaderAnimationProgress >= 1.0) {
    [v4 setOverlayAlpha:0.0];
  }
}

- (void)_updateNavigationBarIconWithLogoURL:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F84830];
    id v5 = a3;
    id v6 = [v4 sharedImageAssetDownloader];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke;
    v7[3] = &unk_1E59DBE50;
    v7[4] = self;
    [v6 downloadFromUrl:v5 completionHandler:v7];
  }
}

void __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    id v5 = [MEMORY[0x1E4FB1818] imageWithData:a2];
    id v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke_2;
      v7[3] = &unk_1E59CA870;
      v7[4] = *(void *)(a1 + 32);
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

uint64_t __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1320) setImage:*(void *)(a1 + 40)];
}

- (void)_updateNavigationBar
{
  BOOL v3 = [(PKTransactionHistoryViewController *)self navigationItem];
  id v4 = [(PKTransactionHistoryViewController *)self _barButtonItems];
  [v3 setRightBarButtonItems:v4];

  id v5 = [(PKTransactionHistoryViewController *)self collectionView];
  LODWORD(v4) = [v5 isEditing];

  if (v4)
  {
    id v6 = [(PKTransactionHistoryViewController *)self collectionView];
    id v7 = [v6 indexPathsForSelectedItems];
    uint64_t v8 = [v7 count];

    id v12 = [(PKTransactionHistoryViewController *)self navigationItem];
    objc_super v9 = [v12 leftBarButtonItem];
    if (v8) {
      double v10 = @"TRANSACTION_HISTORY_DESELECT_ALL";
    }
    else {
      double v10 = @"TRANSACTION_HISTORY_SELECT_ALL";
    }
    unsigned __int8 v11 = PKLocalizedPaymentString(&v10->isa);
    [v9 setTitle:v11];
  }
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryViewController;
  [(PKDashboardViewController *)&v8 deleteItemsAtIndexPaths:a3];
  id v4 = [(PKDashboardViewController *)self dataSource];
  uint64_t v5 = [v4 transactionHistoryItemsCount];

  if (!v5)
  {
    id v6 = [(PKTransactionHistoryViewController *)self navigationController];
    id v7 = (id)[v6 popViewControllerAnimated:1];
  }
}

- (void)presentActivityDeletionConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PKLocalizedIdentityString(&cfstr_TransactionDel.isa);
    id v6 = PKLocalizedIdentityString(&cfstr_TransactionDel_0.isa);
    id v7 = PKLocalizedIdentityString(&cfstr_TransactionDel_1.isa);
    objc_super v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:0 preferredStyle:0];
    objc_super v9 = (void *)MEMORY[0x1E4FB1410];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke;
    v19[3] = &unk_1E59CB150;
    id v10 = v4;
    id v20 = v10;
    unsigned __int8 v11 = [v9 actionWithTitle:v6 style:2 handler:v19];
    [v8 addAction:v11];

    id v12 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    objc_super v16 = __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2;
    id v17 = &unk_1E59CB150;
    id v18 = v10;
    objc_super v13 = [v12 actionWithTitle:v7 style:1 handler:&v14];
    objc_msgSend(v8, "addAction:", v13, v14, v15, v16, v17);

    [(PKTransactionHistoryViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v3 = [(PKDashboardViewController *)self dataSource];
  id v4 = v3;
  BOOL v7 = 0;
  if (self->_historyType - 1 <= 3)
  {
    uint64_t v5 = [v3 merchant];
    if (v5)
    {
      double merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;

      if (merchantHeaderAnimationProgress < 0.35) {
        BOOL v7 = 1;
      }
    }
  }

  BOOL v8 = v7;
  int64_t v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)_updateTitle
{
  id v25 = [(PKTransactionHistoryViewController *)self navigationItem];
  BOOL v3 = [(PKDashboardViewController *)self dataSource];
  uint64_t v4 = [v3 type];
  if (v4 == 4 || v4 == 2)
  {
    uint64_t v5 = [v3 group];
    uint64_t v9 = [v5 type];
    BOOL v8 = 0;
    BOOL v7 = 0;
    switch(v9)
    {
      case 0:
        uint64_t v10 = [v5 merchantCategory];
        double v11 = PKUIScreenScale();
        BOOL v7 = PKIconForMerchantCategory(35.0, 35.0, v11, v10, 0, 0);
        goto LABEL_20;
      case 1:
        goto LABEL_9;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 8:
        break;
      case 7:
        uint64_t v15 = [v5 transactions];
        objc_super v16 = [v15 firstObject];
        uint64_t v17 = [v16 accountType];

        id v18 = PKPassKitUIBundle();
        id v12 = v18;
        if (v17 == 3) {
          double v19 = @"SAVINGS_Interest";
        }
        else {
          double v19 = @"InterestIcon";
        }
        goto LABEL_17;
      case 9:
        id v18 = PKPassKitUIBundle();
        id v12 = v18;
        double v19 = @"AppleCardIcon";
LABEL_17:
        uint64_t v14 = [v18 URLForResource:v19 withExtension:@"pdf"];
        double v20 = PKUIScreenScale();
        BOOL v7 = PKUIImageFromPDF(v14, 35.0, 35.0, v20);
        goto LABEL_18;
      default:
        if (v9 == 14)
        {
LABEL_9:
          id v12 = [v3 merchant];
          if (v12)
          {
            double v13 = PKUIScreenScale();
            BOOL v7 = PKIconForMerchant(v12, 0, 0, 0, 35.0, 35.0, v13);
            uint64_t v14 = [v12 logoImageURL];
            [(PKTransactionHistoryViewController *)self _updateNavigationBarIconWithLogoURL:v14];
LABEL_18:
          }
          else
          {
            BOOL v7 = 0;
          }

LABEL_20:
          BOOL v8 = 0;
        }
        else
        {
          BOOL v7 = 0;
        }
        break;
    }
  }
  else
  {
    if (v4 != 1)
    {
      BOOL v8 = 0;
      BOOL v7 = 0;
      goto LABEL_22;
    }
    uint64_t v5 = [v3 merchant];
    double v6 = PKUIScreenScale();
    BOOL v7 = PKIconForMerchant(v5, 0, 0, 0, 35.0, 35.0, v6);
    BOOL v8 = [v5 logoImageURL];
  }

LABEL_22:
  char v21 = [v3 useLargeTitle];
  int v22 = [v3 navigationBarTitle];
  [v25 setBackButtonTitle:v22];
  [v25 setBackButtonDisplayMode:1];
  if (v7)
  {
    id v23 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    titleIconImageView = self->_titleIconImageView;
    self->_titleIconImageView = v23;

    [(UIImageView *)self->_titleIconImageView setContentMode:1];
    [(UIImageView *)self->_titleIconImageView _setContinuousCornerRadius:3.0];
    [(UIImageView *)self->_titleIconImageView setClipsToBounds:1];
    [(PKTransactionHistoryViewController *)self _updateNavigationBarIconWithLogoURL:v8];
  }
  else if (v21)
  {
    [v25 setTitle:v22];
  }
  else
  {
    objc_storeStrong((id *)&self->_titleText, v22);
  }
}

- (BOOL)_shouldBlurButtons
{
  BOOL v3 = [(PKDashboardViewController *)self dataSource];
  uint64_t v4 = v3;
  unint64_t historyType = self->_historyType;
  BOOL v6 = historyType > 4;
  uint64_t v7 = (1 << historyType) & 0x16;
  if (v6 || v7 == 0)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = [v3 merchant];
    uint64_t v10 = [v9 heroImageURL];
    BOOL v11 = v10 != 0;
  }
  return v11;
}

- (id)_barButtonItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PKDashboardViewController *)self dataSource];
  uint64_t v5 = [v4 merchant];
  BOOL v6 = v5;
  unint64_t historyType = self->_historyType;
  if (historyType - 1 < 2) {
    goto LABEL_4;
  }
  if (!historyType)
  {
    BOOL v11 = [v4 contact];
    BOOL v8 = v11 != 0;

    int v56 = 0;
    BOOL v9 = 0;
    BOOL v10 = 0;
    goto LABEL_13;
  }
  if (historyType == 4)
  {
LABEL_4:
    if (v5)
    {
      if ([v5 useRawMerchantData])
      {
        BOOL v8 = 0;
      }
      else
      {
        id v12 = [v6 mapsMerchant];
        BOOL v8 = v12 != 0;
      }
      double v13 = [v6 phoneNumber];
      BOOL v10 = v13 != 0;

      uint64_t v14 = [v6 businessChatURL];
      BOOL v9 = v14 != 0;
    }
    else
    {
      BOOL v9 = 0;
      BOOL v10 = 0;
      BOOL v8 = 0;
    }
    int v56 = [v4 areTransactionsEditable];
  }
  else
  {
    int v56 = 0;
    BOOL v9 = 0;
    BOOL v10 = 0;
    BOOL v8 = 0;
  }
LABEL_13:
  BOOL v15 = [(PKTransactionHistoryViewController *)self _shouldBlurButtons];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke;
  aBlock[3] = &unk_1E59DBE78;
  BOOL v71 = v15;
  aBlock[4] = self;
  objc_super v58 = (void (**)(void *, void *, void, void *))_Block_copy(aBlock);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_2;
  v68[3] = &__block_descriptor_48_e49___PKAlignedContentContainerView_16__0__UIButton_8l;
  int64x2_t v69 = vdupq_n_s64(0x4040000000000000uLL);
  v57 = (void (**)(void *, UIButton *))_Block_copy(v68);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_3;
  v66[3] = &unk_1E59CA7D0;
  id v16 = v3;
  id v67 = v16;
  uint64_t v17 = (void (**)(void))_Block_copy(v66);
  objc_initWeak(&location, self);
  if (v8)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    if (!self->_detailsButton)
    {
      [(PKDashboardViewController *)self dataSource];
      objc_super v52 = v53 = v4;
      id v18 = [v52 merchant];
      double v19 = [v18 heroImageURL];

      if (v19) {
        double v20 = @"info";
      }
      else {
        double v20 = @"info.circle";
      }
      char v21 = [MEMORY[0x1E4FB1818] systemImageNamed:v20];
      int v22 = (void *)MEMORY[0x1E4FB13F0];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_4;
      v63[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v64, &location);
      id v23 = [v22 actionWithHandler:v63];
      v58[2](v58, v21, 0, v23);
      double v24 = (UIButton *)objc_claimAutoreleasedReturnValue();
      detailsButton = self->_detailsButton;
      self->_detailsButton = v24;

      v57[2](v57, self->_detailsButton);
      v26 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      detailsButtonContainer = self->_detailsButtonContainer;
      self->_detailsButtonContainer = v26;

      objc_destroyWeak(&v64);
      uint64_t v4 = v53;
    }
    v28 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_detailsButtonContainer];
    [v28 setAccessibilityIdentifier:*MEMORY[0x1E4F85608]];
    [v16 addObject:v28];
  }
  if (v10)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    if (!self->_phoneButton)
    {
      v54 = v4;
      BOOL v29 = [MEMORY[0x1E4FB1818] systemImageNamed:@"phone.fill"];
      uint64_t v30 = (void *)MEMORY[0x1E4FB13F0];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_5;
      v61[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v62, &location);
      v31 = [v30 actionWithHandler:v61];
      v58[2](v58, v29, 0, v31);
      uint64_t v32 = (UIButton *)objc_claimAutoreleasedReturnValue();
      phoneButton = self->_phoneButton;
      self->_phoneButton = v32;

      v57[2](v57, self->_phoneButton);
      int v34 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      phoneButtonContainer = self->_phoneButtonContainer;
      self->_phoneButtonContainer = v34;

      objc_destroyWeak(&v62);
      uint64_t v4 = v54;
    }
    uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_phoneButtonContainer];
    [v36 setAccessibilityIdentifier:*MEMORY[0x1E4F85820]];
    [v16 addObject:v36];
  }
  if (v9)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    if (!self->_messageButton)
    {
      v55 = v4;
      int v37 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message.fill"];
      v38 = (void *)MEMORY[0x1E4FB13F0];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_6;
      v59[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v60, &location);
      v39 = [v38 actionWithHandler:v59];
      v58[2](v58, v37, 0, v39);
      uint64_t v40 = (UIButton *)objc_claimAutoreleasedReturnValue();
      messageButton = self->_messageButton;
      self->_messageButton = v40;

      v57[2](v57, self->_messageButton);
      objc_super v42 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      messageButtonContainer = self->_messageButtonContainer;
      self->_messageButtonContainer = v42;

      objc_destroyWeak(&v60);
      uint64_t v4 = v55;
    }
    v44 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_messageButtonContainer];
    [v44 setAccessibilityIdentifier:*MEMORY[0x1E4F856E0]];
    [v16 addObject:v44];
  }
  if (v56)
  {
    if ([v16 count]) {
      v17[2](v17);
    }
    uint64_t v45 = [(PKTransactionHistoryViewController *)self collectionView];
    int v46 = [v45 isEditing];

    id v47 = objc_alloc(MEMORY[0x1E4FB14A8]);
    if (v46) {
      uint64_t v48 = 1;
    }
    else {
      uint64_t v48 = 2;
    }
    id v49 = (void *)[v47 initWithBarButtonSystemItem:v48 target:self action:sel__handleEditButtonTapped_];
    [v16 addObject:v49];
  }
  id v50 = (void *)[v16 copy];
  objc_destroyWeak(&location);

  return v50;
}

id __53__PKTransactionHistoryViewController__barButtonItems__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB14D8];
  id v8 = a4;
  id v9 = a2;
  BOOL v10 = [v7 plainButtonConfiguration];
  [v10 setImage:v9];

  [v10 setCornerStyle:4];
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v11 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
    id v12 = [v10 background];
    [v12 setVisualEffect:v11];
  }
  double v13 = 14.0;
  if (!*(void *)(*(void *)(a1 + 32) + 1384)) {
    double v13 = 18.0;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4FB1830];
  BOOL v15 = (double *)MEMORY[0x1E4FB09D8];
  if (a3) {
    BOOL v15 = (double *)MEMORY[0x1E4FB09B8];
  }
  id v16 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v13 weight:*v15];
  uint64_t v17 = [v14 configurationWithFont:v16];

  [v10 setPreferredSymbolConfigurationForImage:v17];
  id v18 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:v8];

  return v18;
}

PKAlignedContentContainerView *__53__PKTransactionHistoryViewController__barButtonItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [PKAlignedContentContainerView alloc];
  uint64_t v5 = -[PKAlignedContentContainerView initWithContentView:alignment:size:](v4, "initWithContentView:alignment:size:", v3, *MEMORY[0x1E4F87150], *(double *)(a1 + 32), *(double *)(a1 + 40));

  -[PKAlignedContentContainerView setFrame:](v5, "setFrame:", 0.0, 0.0, 32.0, 32.0);

  return v5;
}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_3(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v2 setWidth:15.0];
  [*(id *)(a1 + 32) addObject:v2];
}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInfoButtonTapped];
}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePhoneButtonTapped];
}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMessageButtonTapped];
}

- (id)_toolbarItems
{
  id v3 = [(PKTransactionHistoryViewController *)self collectionView];
  uint64_t v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 count];

  BOOL v6 = PKLocalizedPaymentString(&cfstr_TransactionHis_2.isa, &cfstr_Lu.isa, v5);
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v7 setText:v6];
  id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09E0]];
  [v7 setFont:v8];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v7];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 menu:0];
  [v10 addObject:v11];
  [v10 addObject:v9];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 menu:0];
  [v10 addObject:v12];
  id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v14 = PKLocalizedPaymentString(&cfstr_TransactionHis_3.isa);
  BOOL v15 = (void *)[v13 initWithTitle:v14 style:0 target:self action:sel__showRemoveAlert_];

  id v16 = [MEMORY[0x1E4FB1618] systemRedColor];
  [v15 setTintColor:v16];

  [v15 setEnabled:v5 != 0];
  [v10 addObject:v15];
  uint64_t v17 = (void *)[v10 copy];

  return v17;
}

- (void)_updateButtonConfigurationsDisablingBlur:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PKTransactionHistoryViewController *)self _shouldBlurButtons];
  uint64_t v5 = [(PKTransactionHistoryViewController *)self _barButtonItems];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    BOOL v9 = a3 || !v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) customView];
        id v12 = [v11 contentView];
        id v13 = [v12 configuration];
        uint64_t v14 = [v13 background];
        if (v9)
        {
          if (a3) {
            [MEMORY[0x1E4FB1618] secondarySystemFillColor];
          }
          else {
          id v16 = [MEMORY[0x1E4FB1618] clearColor];
          }
          [v14 setBackgroundColor:v16];
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v15 = [MEMORY[0x1E4FB14C8] effectWithStyle:1];
          id v16 = (void *)v15;
        }
        [v14 setVisualEffect:v15];

        [v12 setConfiguration:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)_handleInfoButtonTapped
{
  unint64_t historyType = self->_historyType;
  if (historyType - 1 < 2)
  {
LABEL_4:
    [(PKTransactionHistoryViewController *)self _showMapsDetailsViewController];
    return;
  }
  if (historyType)
  {
    if (historyType != 4) {
      return;
    }
    goto LABEL_4;
  }
  [(PKTransactionHistoryViewController *)self _showContactDetailsViewController];
}

- (void)_handleMessageButtonTapped
{
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [(PKTransactionHistoryViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    id v3 = [(PKDashboardViewController *)self dataSource];
    unint64_t historyType = self->_historyType;
    BOOL v5 = historyType > 4;
    uint64_t v6 = (1 << historyType) & 0x16;
    if (v5 || v6 == 0) {
      goto LABEL_11;
    }
    id v11 = v3;
    uint64_t v8 = [v3 merchant];
    BOOL v9 = [v8 businessChatURL];

    if (v9)
    {
      id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v10 openURL:v9 configuration:0 completionHandler:0];
    }
  }
  id v3 = v11;
LABEL_11:
}

- (void)_handlePhoneButtonTapped
{
  if (!PKStoreDemoModeEnabled())
  {
    id v3 = [(PKDashboardViewController *)self dataSource];
    unint64_t historyType = self->_historyType;
    if (historyType - 1 >= 2)
    {
      if (!historyType)
      {
        id v13 = v3;
        uint64_t v8 = [v3 contact];
        BOOL v9 = [v8 phoneNumbers];
        id v10 = [v9 firstObject];
        uint64_t v6 = [v10 value];

        if (v6)
        {
          id v11 = [v6 stringValue];
          uint64_t v7 = PKTelephoneURLFromPhoneNumber();

          goto LABEL_10;
        }
LABEL_11:

        goto LABEL_12;
      }
      if (historyType != 4) {
        goto LABEL_13;
      }
    }
    id v13 = v3;
    BOOL v5 = [v3 merchant];
    uint64_t v6 = [v5 phoneNumber];

    if (v6)
    {
      uint64_t v7 = PKTelephoneURLFromPhoneNumber();
LABEL_10:
      id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v12 openSensitiveURL:v7 withOptions:0];

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  PKUIStoreDemoGatewayViewController();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(PKTransactionHistoryViewController *)self presentViewController:v13 animated:1 completion:0];
LABEL_12:
  id v3 = v13;
LABEL_13:
}

- (void)_handleEditButtonTapped:(id)a3
{
  BOOL v4 = [(PKTransactionHistoryViewController *)self collectionView];
  uint64_t v5 = [v4 isEditing] ^ 1;

  [(PKTransactionHistoryViewController *)self setEditing:v5];
}

- (void)_handleSelectButtonTapped:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PKTransactionHistoryViewController *)self collectionView];
  uint64_t v5 = [v4 indexPathsForSelectedItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v7 = [(PKTransactionHistoryViewController *)self collectionView];
    uint64_t v8 = [v7 indexPathsForSelectedItems];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
          uint64_t v14 = [(PKTransactionHistoryViewController *)self collectionView];
          [v14 deselectItemAtIndexPath:v13 animated:0];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v15 = [(PKTransactionHistoryViewController *)self collectionView];
    uint64_t v16 = [v15 numberOfSections];

    if (v16 >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        long long v18 = [(PKTransactionHistoryViewController *)self collectionView];
        uint64_t v19 = [v18 numberOfItemsInSection:v17];

        if (v19 >= 1)
        {
          uint64_t v20 = 0;
          do
          {
            long long v21 = [(PKTransactionHistoryViewController *)self collectionView];
            int v22 = [MEMORY[0x1E4F28D58] indexPathForRow:v20 inSection:v17];
            BOOL v23 = [(PKTransactionHistoryViewController *)self collectionView:v21 shouldSelectItemAtIndexPath:v22];

            if (v23)
            {
              double v24 = [(PKTransactionHistoryViewController *)self collectionView];
              id v25 = [MEMORY[0x1E4F28D58] indexPathForRow:v20 inSection:v17];
              [v24 selectItemAtIndexPath:v25 animated:0 scrollPosition:0];
            }
            ++v20;
            v26 = [(PKTransactionHistoryViewController *)self collectionView];
            uint64_t v27 = [v26 numberOfItemsInSection:v17];
          }
          while (v20 < v27);
        }
        ++v17;
        v28 = [(PKTransactionHistoryViewController *)self collectionView];
        uint64_t v29 = [v28 numberOfSections];
      }
      while (v17 < v29);
    }
  }
  [(PKTransactionHistoryViewController *)self _updateNavigationBar];
  uint64_t v30 = [(PKTransactionHistoryViewController *)self _toolbarItems];
  [(PKTransactionHistoryViewController *)self setToolbarItems:v30];
}

- (void)_handleRemoveButtonTapped:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PKDashboardViewController *)self dataSource];
  uint64_t v5 = [(PKDashboardViewController *)self actualIndexPathsForSelectedItems];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v4, "itemAtIndexPath:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v4 deleteItems:v6];
  [(PKTransactionHistoryViewController *)self setEditing:0];
}

- (void)_showContactDetailsViewController
{
  id v9 = [(PKDashboardViewController *)self dataSource];
  Class CNContactViewControllerClass = getCNContactViewControllerClass();
  BOOL v4 = [v9 contact];
  uint64_t v5 = [(objc_class *)CNContactViewControllerClass viewControllerForContact:v4];

  [v5 setAllowsEditing:0];
  id v6 = [v5 navigationItem];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v7 configureWithTransparentBackground];
  [v6 setStandardAppearance:v7];
  if (v5)
  {
    uint64_t v8 = [(PKTransactionHistoryViewController *)self navigationController];
    [v8 pushViewController:v5 animated:1];
  }
}

- (void)_showMapsDetailsViewController
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (!self->_loadingMapsViewController)
  {
    id v3 = [(PKDashboardViewController *)self dataSource];
    BOOL v4 = [v3 merchant];
    uint64_t v5 = [v4 mapsMerchant];
    id v6 = (void *)[v5 identifier];

    if (v6)
    {
      self->_loadingMapsViewController = 1;
      loadingMapsTimer = self->_loadingMapsTimer;
      if (loadingMapsTimer)
      {
        dispatch_source_cancel(loadingMapsTimer);
        uint64_t v8 = self->_loadingMapsTimer;
        self->_loadingMapsTimer = 0;
      }
      objc_initWeak(&location, self);
      id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      uint64_t v10 = self->_loadingMapsTimer;
      self->_loadingMapsTimer = v9;

      uint64_t v11 = self->_loadingMapsTimer;
      dispatch_time_t v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      long long v13 = self->_loadingMapsTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke;
      handler[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v21, &location);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume((dispatch_object_t)self->_loadingMapsTimer);
      id v14 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
      long long v15 = [NSNumber numberWithUnsignedLongLong:v6];
      v23[0] = v15;
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [v14 _setMuids:v16];

      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v14];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_2;
      v18[3] = &unk_1E59DBEE8;
      objc_copyWeak(v19, &location);
      v18[4] = self;
      v19[1] = v6;
      [v17 startWithCompletionHandler:v18];
      objc_destroyWeak(v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

void __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id *)WeakRetained;
  if (WeakRetained)
  {
    id v3 = *((void *)WeakRetained + 149);
    uint64_t v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      id v4 = v5[149];
      v5[149] = 0;

      id v2 = v5;
    }
    objc_msgSend(v2[153], "pkui_updateConfigurationShowingActivityIndicator:", 1);
    id v2 = v5;
  }
}

void __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_3;
  block[3] = &unk_1E59DBEC0;
  objc_copyWeak(v13, (id *)(a1 + 40));
  block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v7 = *(void **)(a1 + 48);
  id v12 = v5;
  v13[1] = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v13);
}

void __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[149];
    if (v4)
    {
      dispatch_source_cancel(v4);
      id v5 = v3[149];
      v3[149] = 0;
    }
    *((unsigned char *)v3 + 1184) = 0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1224), "pkui_updateConfigurationShowingActivityIndicator:", 0);
    if (*(void *)(a1 + 40)
      || ([*(id *)(a1 + 48) mapItems],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 count],
          v10,
          !v11))
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 64);
        id v8 = *(void **)(a1 + 40);
        if (v8)
        {
          id v9 = [v8 localizedDescription];
        }
        else
        {
          id v9 = @"no map items.";
        }
        int v23 = 134218242;
        uint64_t v24 = v7;
        __int16 v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKTransactionHistoryViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v23, 0x16u);
        if (v8) {
      }
        }
      uint64_t v17 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v18 = PKLocalizedPaymentString(&cfstr_DashboardMapsM.isa);
      uint64_t v19 = [v17 alertControllerWithTitle:0 message:v18 preferredStyle:1];

      uint64_t v20 = (void *)MEMORY[0x1E4FB1410];
      id v21 = PKLocalizedPaymentString(&cfstr_DashboardMapsM_0.isa);
      int v22 = [v20 actionWithTitle:v21 style:0 handler:0];
      [v19 addAction:v22];

      [v3 presentViewController:v19 animated:1 completion:0];
    }
    else
    {
      id v12 = [PKMerchantMapViewController alloc];
      long long v13 = [*(id *)(a1 + 48) mapItems];
      id v14 = [v13 firstObject];
      long long v15 = [(PKMerchantMapViewController *)v12 initWithMapItem:v14];

      long long v16 = [v3 navigationController];
      [v16 pushViewController:v15 animated:1];
    }
  }
}

- (void)_showRemoveAlert:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PKTransactionHistoryViewController__showRemoveAlert___block_invoke;
  v6[3] = &unk_1E59CAEA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKTransactionHistoryViewController *)self presentActivityDeletionConfirmationWithCompletion:v6];
}

uint64_t __55__PKTransactionHistoryViewController__showRemoveAlert___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _handleRemoveButtonTapped:*(void *)(result + 40)];
  }
  return result;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (unint64_t)historyType
{
  return self->_historyType;
}

- (PKContactAvatarManager)contactAvatarManager
{
  return self->_contactAvatarManager;
}

- (BOOL)shouldPromptForReview
{
  return self->_shouldPromptForReview;
}

- (void)setShouldPromptForReview:(BOOL)a3
{
  self->_shouldPromptForReview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_headerPresenter, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleIconImageView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_messageButtonContainer, 0);
  objc_storeStrong((id *)&self->_phoneButtonContainer, 0);
  objc_storeStrong((id *)&self->_detailsButtonContainer, 0);
  objc_storeStrong((id *)&self->_loadingMapsTimer, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);

  objc_storeStrong((id *)&self->_footer, 0);
}

@end