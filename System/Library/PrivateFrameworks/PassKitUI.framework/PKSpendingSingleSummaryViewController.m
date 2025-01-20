@interface PKSpendingSingleSummaryViewController
- (BOOL)_hasFooterForSection:(unint64_t)a3;
- (BOOL)_hasHeaderForSection:(unint64_t)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)visible;
- (CGSize)_sizeForAggregateOrRewardsCellInCollectionView:(id)a3 atIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKHorizontalScrollingChildViewControllerDelegate)scrollingDelegate;
- (PKSpendingSingleSummaryViewController)initWithTransationSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 transactionGroupPresenter:(id)a9 summaryPresenter:(id)a10 currentMonthTransactions:(id)a11 pendingPayments:(id)a12 upcomingScheduledPayments:(id)a13 displayType:(unint64_t)a14;
- (PKSpendingSingleSummaryViewControllerDelegate)summaryDelegate;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)contentInset;
- (UIGestureRecognizer)gestureRecognizerRequiredToFail;
- (double)alphaForIndexPath:(id)a3 visible:(BOOL)a4 transition:(double)a5;
- (double)alphaTransition;
- (double)lineSpacingForSection:(int64_t)a3;
- (id)_nonSpendingTransactionGroupForType:(unint64_t)a3;
- (id)_sortedAccountUsersForSummary:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)data;
- (id)footer;
- (id)indexPathForSummary;
- (int64_t)_numberOfAggregateCells;
- (int64_t)_numberOfNonSpendingTransactionTypeRowsEnabled;
- (int64_t)_numberOfRewardsCells;
- (int64_t)_numberOfSummaryCells;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)contentInsetAdjustmentBehavior;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_aggregateCellAtIndex:(unint64_t)a3;
- (unint64_t)_nonSpendingTransactionTypeForRow:(int64_t)a3;
- (unint64_t)_rewardsCellAtIndex:(unint64_t)a3;
- (unint64_t)categorization;
- (unsigned)horizontalAlignmentForSection:(int64_t)a3;
- (void)_accountsChanged:(id)a3;
- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5;
- (void)_configureDefaultFooter;
- (void)_configureFooter;
- (void)_configureFooterForAccountUsers;
- (void)_configureFooterView:(id)a3 inSection:(unint64_t)a4;
- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4;
- (void)_configureRewardsHubButtonCell:(id)a3;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)buttonTappedInFooterView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAlphaTransition:(double)a3;
- (void)setCategorization:(unint64_t)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setContentInsetAdjustmentBehavior:(int64_t)a3;
- (void)setData:(id)a3 swap:(BOOL)a4;
- (void)setGestureRecognizerRequiredToFail:(id)a3;
- (void)setScrollingDelegate:(id)a3;
- (void)setSummary:(id)a3 swap:(BOOL)a4;
- (void)setSummaryDelegate:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKSpendingSingleSummaryViewController

- (PKSpendingSingleSummaryViewController)initWithTransationSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 transactionGroupPresenter:(id)a9 summaryPresenter:(id)a10 currentMonthTransactions:(id)a11 pendingPayments:(id)a12 upcomingScheduledPayments:(id)a13 displayType:(unint64_t)a14
{
  id v75 = a3;
  id v64 = a4;
  id v19 = a4;
  id v20 = a7;
  id v74 = v19;
  id v65 = a5;
  id v73 = a5;
  id v72 = a6;
  id v21 = a7;
  id v71 = a8;
  id v22 = a9;
  id v70 = a10;
  id v69 = a11;
  id v68 = a12;
  id v67 = a13;
  v23 = objc_alloc_init(PKHorizontalScrollingChildLayout);
  v76.receiver = self;
  v76.super_class = (Class)PKSpendingSingleSummaryViewController;
  v24 = [(PKSpendingSingleSummaryViewController *)&v76 initWithCollectionViewLayout:v23];
  v25 = v24;
  if (v24)
  {
    p_layout = (id *)&v24->_layout;
    objc_storeStrong((id *)&v24->_layout, v23);
    [*p_layout setDataSource:v25];
    objc_storeStrong((id *)&v25->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v25->_account, a6);
    objc_storeStrong((id *)&v25->_accountUserCollection, v20);
    uint64_t v27 = [v71 copy];
    physicalCards = v25->_physicalCards;
    v25->_physicalCards = (NSSet *)v27;

    v25->_feature = [v72 feature];
    objc_storeStrong((id *)&v25->_familyCollection, v64);
    v25->_displayType = a14;
    objc_storeStrong((id *)&v25->_avatarManager, v65);
    v29 = [[PKDashboardAvatarPresenter alloc] initWithAvatarManager:v73];
    avatarPresenter = v25->_avatarPresenter;
    v25->_avatarPresenter = v29;

    v31 = [[PKSpendingSummaryAccountUserPresenter alloc] initWithTransactionSourceCollection:v75 familyCollection:v74 avatarManager:v73 interimSpacing:8.0];
    summaryUsersPresenter = v25->_summaryUsersPresenter;
    v25->_summaryUsersPresenter = v31;

    uint64_t v33 = [(PKSpendingSingleSummaryViewController *)v25 _sortedAccountUsersForSummary:v25->_summary];
    sortedAccountUsers = v25->_sortedAccountUsers;
    v25->_sortedAccountUsers = (NSArray *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v25->_currentCalendar;
    v25->_currentCalendar = (NSCalendar *)v35;

    uint64_t v37 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v25->_accountService;
    v25->_accountService = (PKAccountService *)v37;

    v25->_footerNeedsConfiguration = 1;
    uint64_t v39 = PKIsLowEndDevice();
    v25->_isLowEndDevice = v39;
    [*p_layout setIsLowEndDevice:v39];
    v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v40 addObserver:v25 selector:sel__accountsChanged_ name:*MEMORY[0x1E4F85BF8] object:0];

    v41 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterDay = v25->_formatterDay;
    v25->_formatterDay = v41;

    [(NSDateFormatter *)v25->_formatterDay setLocalizedDateFormatFromTemplate:@"dd"];
    v43 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonth = v25->_formatterMonth;
    v25->_formatterMonth = v43;

    [(NSDateFormatter *)v25->_formatterMonth setLocalizedDateFormatFromTemplate:@"MMM yyyy"];
    v45 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterFullMonth = v25->_formatterFullMonth;
    v25->_formatterFullMonth = v45;

    [(NSDateFormatter *)v25->_formatterFullMonth setLocalizedDateFormatFromTemplate:@"MMMM yyyy"];
    v47 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterYear = v25->_formatterYear;
    v25->_formatterYear = v47;

    [(NSDateFormatter *)v25->_formatterYear setLocalizedDateFormatFromTemplate:@"yyyy"];
    objc_storeStrong((id *)&v25->_transactionGroupPresenter, a9);
    objc_storeStrong((id *)&v25->_summaryPresenter, a10);
    objc_storeStrong((id *)&v25->_currentMonthTransactions, a11);
    objc_storeStrong((id *)&v25->_pendingPayments, a12);
    objc_storeStrong((id *)&v25->_upcomingScheduledPayments, a13);
    v49 = [PKDashboardTitleHeaderView alloc];
    double v50 = *MEMORY[0x1E4F1DB28];
    double v51 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v52 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v53 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v54 = -[PKDashboardTitleHeaderView initWithFrame:](v49, "initWithFrame:", *MEMORY[0x1E4F1DB28], v51, v52, v53);
    sampleHeaderView = v25->_sampleHeaderView;
    v25->_sampleHeaderView = (PKDashboardTitleHeaderView *)v54;

    v56 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v50, v51, v52, v53);
    sampleFooterView = v25->_sampleFooterView;
    v25->_sampleFooterView = v56;

    v58 = -[PKDashboardButtonCollectionViewCell initWithFrame:]([PKDashboardButtonCollectionViewCell alloc], "initWithFrame:", v50, v51, v52, v53);
    sampleButtonCell = v25->_sampleButtonCell;
    v25->_sampleButtonCell = v58;

    v60 = -[PKDashboardTitleDetailCell initWithFrame:]([PKDashboardTitleDetailCell alloc], "initWithFrame:", v50, v51, v52, v53);
    sampleHighlightsCell = v25->_sampleHighlightsCell;
    v25->_sampleHighlightsCell = v60;
  }
  return v25;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSingleSummaryViewController;
  [(PKSpendingSingleSummaryViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKSpendingSingleSummaryViewController;
  [(PKSpendingSingleSummaryViewController *)&v8 viewDidLoad];
  v3 = [(PKSpendingSingleSummaryViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"transactionGroupPresenter"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"spendingPresenter"];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *MEMORY[0x1E4FB2770];
  [v3 registerClass:v4 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"titleIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:v5 withReuseIdentifier:@"bigTitleIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"footerIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"emptyCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"buttonCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"titleDetailIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"avatarPresenter"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"spendingAccountUserPresenter"];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setAlwaysBounceVertical:1];
  [v3 setBounces:1];
  v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v6];

  objc_msgSend(v3, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  [v3 setContentInsetAdjustmentBehavior:self->_contentInsetAdjustmentBehavior];
  v7 = [(PKSpendingSingleSummaryViewController *)self view];
  [v7 setClipsToBounds:0];

  [v3 setClipsToBounds:0];
}

- (id)footer
{
  return self->_currentFooter;
}

- (void)setData:(id)a3 swap:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PKSpendingSingleSummaryViewController *)self setSummary:v6 swap:v4];
  }
}

- (id)data
{
  return self->_summary;
}

- (void)setAlphaTransition:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_alphaTransition != a3)
  {
    self->_double alphaTransition = a3;
    -[PKHorizontalScrollingChildLayout setAlphaTransition:](self->_layout, "setAlphaTransition:");
    float v4 = 0.0;
    double v5 = 0.0;
    if (!self->_isLowEndDevice && self->_visible)
    {
      double alphaTransition = self->_alphaTransition;
      double v5 = 20.0;
      if (alphaTransition < 0.2) {
        float v4 = (alphaTransition / -0.2 + 1.0) * 0.15;
      }
    }
    id v6 = [(PKSpendingSingleSummaryViewController *)self collectionView];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v7 = objc_msgSend(v6, "indexPathsForVisibleItems", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v13 = [v12 section];
          v14 = [v6 cellForItemAtIndexPath:v12];
          if (v13 == 1 && ![v12 row])
          {
            v15 = [v14 layer];
            *(float *)&double v16 = v4;
            [v15 setShadowOpacity:v16];
            [v15 setShadowRadius:v5];
            [v15 setMasksToBounds:0];
            v17 = [v14 contentView];
            v18 = [v17 layer];

            [v18 setCornerRadius:10.0];
            [v18 setMasksToBounds:1];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }
}

- (void)setVisible:(BOOL)a3
{
  if (((!self->_visible ^ a3) & 1) == 0)
  {
    self->_visible = a3;
    -[PKHorizontalScrollingChildLayout setVisible:](self->_layout, "setVisible:");
  }
}

- (double)alphaForIndexPath:(id)a3 visible:(BOOL)a4 transition:(double)a5
{
  double result = 0.0;
  if (a4)
  {
    unint64_t v7 = objc_msgSend(a3, "section", 0.0);
    double result = 1.0;
    if (v7 > 1) {
      return a5;
    }
  }
  return result;
}

- (double)lineSpacingForSection:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 2) {
    return 8.0;
  }
  return result;
}

- (unsigned)horizontalAlignmentForSection:(int64_t)a3
{
  float v4 = [(PKSpendingSingleSummaryViewController *)self collectionView];
  int v5 = [v4 _shouldReverseLayoutDirection];

  if (v5) {
    unsigned int v6 = 2;
  }
  else {
    unsigned int v6 = 0;
  }
  if (a3 == 2) {
    return v6;
  }
  else {
    return 1;
  }
}

- (id)_sortedAccountUsersForSummary:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__21;
  v32 = __Block_byref_object_dispose__21;
  id v33 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__21;
  v26 = __Block_byref_object_dispose__21;
  id v27 = 0;
  int v5 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourcesForType:2];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke;
  v21[3] = &unk_1E59D3618;
  v21[4] = &v28;
  v21[5] = &v22;
  unsigned int v6 = objc_msgSend(v5, "pk_setByApplyingBlock:", v21);

  unint64_t v7 = [v4 altDSID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_2;
    v19[3] = &unk_1E59D3640;
    id v20 = v4;
    uint64_t v10 = objc_msgSend(v6, "pk_anyObjectPassingTest:", v19);
    v11 = objc_msgSend(v9, "initWithObjects:", v10, 0);
    v12 = &v20;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_3;
    v17[3] = &unk_1E59D3668;
    id v18 = v4;
    v11 = [v6 objectsPassingTest:v17];
    v12 = &v18;
    uint64_t v10 = v6;
  }

  uint64_t v13 = [v11 allObjects];
  v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_85];
  v15 = (void *)[v14 mutableCopy];

  if (v23[5] && objc_msgSend(v15, "containsObject:"))
  {
    [v15 removeObject:v23[5]];
    [v15 insertObject:v23[5] atIndex:0];
  }
  if (v29[5] && objc_msgSend(v15, "containsObject:"))
  {
    [v15 removeObject:v29[5]];
    [v15 insertObject:v29[5] atIndex:0];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

id __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accountUser];
  if ([v3 isCurrentUser])
  {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    if ([v3 accessLevel] != 1) {
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(a1 + 40);
  }
  objc_storeStrong((id *)(*(void *)(v4 + 8) + 40), v3);
LABEL_6:

  return v3;
}

uint64_t __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 altDSID];
  uint64_t v4 = [*(id *)(a1 + 32) altDSID];
  id v5 = v3;
  id v6 = v4;
  unint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) spendingsPerAltDSID];
  id v5 = [v3 altDSID];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    unint64_t v7 = [v6 totalSpending];
    uint64_t v8 = [v7 amount];
    int v9 = objc_msgSend(v8, "pk_isZeroNumber") ^ 1;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v10 = [v3 isCurrentUser] | v9;

  return v10;
}

uint64_t __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 nameComponents];
  id v6 = [v5 givenName];
  unint64_t v7 = [v4 nameComponents];

  uint64_t v8 = [v7 givenName];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)setSummary:(id)a3 swap:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    unint64_t v7 = [(PKSpendingSingleSummaryViewController *)self _sortedAccountUsersForSummary:v6];
    char v8 = PKEqualObjects();
    if ((v8 & 1) == 0) {
      objc_storeStrong((id *)&self->_sortedAccountUsers, v7);
    }
    unint64_t summaryType = self->_summaryType;
    if (summaryType == [v6 summaryType])
    {
      uint64_t v10 = [v6 startDate];
      int v11 = PKEqualObjects() ^ 1;
    }
    else
    {
      LOBYTE(v11) = 1;
    }
    BOOL v12 = self->_summary == 0;
    char v13 = v4 | v11 ^ 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke;
    aBlock[3] = &unk_1E59D36B0;
    if (v12) {
      char v13 = 0;
    }
    char v14 = v8 & v13;
    aBlock[4] = self;
    char v37 = v11;
    v15 = _Block_copy(aBlock);
    double v16 = [(PKSpendingSingleSummaryViewController *)self collectionView];
    if (v14)
    {
      uint64_t v28 = v15;
      v29 = v7;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_2;
      v32[3] = &unk_1E59D2A68;
      id v35 = v15;
      id v17 = v6;
      id v33 = v17;
      id v34 = v16;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_3;
      v30[3] = &unk_1E59CB6D8;
      id v18 = v34;
      id v31 = v18;
      [v18 performBatchUpdates:v32 completion:v30];
      id v19 = [(PKSpendingSingleSummaryViewController *)self indexPathForSummary];
      id v27 = [v18 supplementaryViewForElementKind:*MEMORY[0x1E4FB2770] atIndexPath:v19];
      -[PKSpendingSingleSummaryViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:");
      uint64_t v20 = *MEMORY[0x1E4FB2760];
      long long v21 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:5];
      uint64_t v22 = [v18 supplementaryViewForElementKind:v20 atIndexPath:v21];

      [(PKSpendingSingleSummaryViewController *)self _configureFooterView:v22 inSection:5];
      long long v23 = objc_alloc_init(PKDashboardSpendingSummaryItem);
      [(PKDashboardSpendingSummaryItem *)v23 setSpendingSummary:v17];
      summaryPresenter = self->_summaryPresenter;
      uint64_t v25 = [v18 cellForItemAtIndexPath:v19];
      if (v4) {
        [(PKSpendingSummaryPresenter *)summaryPresenter swapSummaryInCell:v25 forItem:v23 inCollectionView:v18 atIndexPath:v19];
      }
      else {
        [(PKSpendingSummaryPresenter *)summaryPresenter updateCell:v25 forItem:v23 inCollectionView:v18 atIndexPath:v19];
      }

      v26 = v35;
      v15 = v28;
      unint64_t v7 = v29;
    }
    else
    {
      (*((void (**)(void *, id))v15 + 2))(v15, v6);
      [v16 reloadData];
      v26 = [v16 collectionViewLayout];
      [v26 invalidateLayout];
    }

    if (self->_displayType == 1) {
      self->_footerNeedsConfiguration = 1;
    }
    [(PKSpendingSingleSummaryViewController *)self _configureFooter];
  }
}

void __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1104), a2);
  if (*(unsigned char *)(a1 + 40)) {
    *(void *)(*(void *)(a1 + 32) + 1384) = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 1112) = [v11 summaryType];
  uint64_t v4 = [v11 startDate];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1120);
  *(void *)(v5 + 1120) = v4;

  uint64_t v7 = [v11 endDate];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 1128);
  *(void *)(v8 + 1128) = v7;

  uint64_t v10 = [v11 orderedSpendingCategories];
  *(unsigned char *)(*(void *)(a1 + 32) + 1136) = [v10 count] != 0;
}

void __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (PKFinHealthInsightsEnabled()) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  id v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v2, v2 ^ 7);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 reloadSections:v4];
}

void __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

- (void)_configureFooter
{
  if (self->_footerNeedsConfiguration)
  {
    self->_footerNeedsConfiguration = 0;
    if (!self->_currentFooter)
    {
      id v3 = [PKDashboardViewControllerFooterView alloc];
      id v4 = -[PKDashboardViewControllerFooterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      currentFooter = self->_currentFooter;
      self->_currentFooter = v4;

      [(PKDashboardViewControllerFooterView *)self->_currentFooter setDelegate:self];
    }
    unint64_t displayType = self->_displayType;
    if (displayType == 1)
    {
      [(PKSpendingSingleSummaryViewController *)self _configureFooterForAccountUsers];
    }
    else if (!displayType)
    {
      [(PKSpendingSingleSummaryViewController *)self _configureDefaultFooter];
    }
    uint64_t v7 = self->_currentFooter;
    [(PKDashboardViewControllerFooterView *)v7 setNeedsLayout];
  }
}

- (void)_configureDefaultFooter
{
  unint64_t v3 = +[PKCreditAccountController paymentEducationStateForAccount:self->_account mostRecentTransactions:self->_currentMonthTransactions pendingPayments:self->_pendingPayments upcomingScheduledPayments:self->_upcomingScheduledPayments];
  [(PKAccount *)self->_account feature];
  id v4 = [(PKAccount *)self->_account creditDetails];
  id v74 = [v4 accountSummary];

  uint64_t v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [v5 accountSummary];
  uint64_t v7 = [v6 currentStatement];

  uint64_t v8 = [(PKAccount *)self->_account creditDetails];
  uint64_t v9 = [v8 currencyCode];

  uint64_t v10 = [v74 remainingStatementBalance];
  id v11 = v10;
  id v72 = v9;
  if (v10)
  {
    BOOL v12 = PKCurrencyAmountCreate(v10, v9);
  }
  else
  {
    BOOL v12 = 0;
  }
  char v13 = [(PKAccount *)self->_account creditDetails];
  id v73 = [v13 cardBalance];

  switch(v3)
  {
    case 0uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      char v14 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingTitle];
      v15 = PKLocalizedFeatureString();
      [v14 setText:v15];

      double v16 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingDetail];
      id v17 = [v73 formattedStringValue];
      [v16 setText:v17];

      id v18 = [v74 adjustedBalance];
      id v19 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v20 = [v18 compare:v19];

      if (v20 == 1)
      {
        currentFooter = self->_currentFooter;
        [(PKAccount *)self->_account feature];
        if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 8)
        {
          uint64_t v22 = PKLocalizedFeatureString();
          [(PKDashboardViewControllerFooterView *)currentFooter setButtonTitle:v22];

          goto LABEL_15;
        }
        v41 = PKLocalizedFeatureString();
        [(PKDashboardViewControllerFooterView *)currentFooter setButtonTitle:v41];
      }
      else
      {
        [(PKDashboardViewControllerFooterView *)self->_currentFooter setButtonTitle:0];
      }

      goto LABEL_13;
    case 1uLL:
      v46 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingTitle];
      v47 = PKLocalizedFeatureString();
      [v46 setText:v47];

      v48 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingDetail];
      v49 = [v73 formattedStringValue];
      [v48 setText:v49];

      double v50 = self->_currentFooter;
      [(PKAccount *)self->_account feature];
      double v51 = PKLocalizedFeatureString();
      [(PKDashboardViewControllerFooterView *)v50 setButtonTitle:v51];

LABEL_15:
      int v40 = 0;
      goto LABEL_17;
    case 2uLL:
      double v52 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingTitle];
      double v53 = PKLocalizedFeatureString();
      [v52 setText:v53];

      uint64_t v54 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingDetail];
      v55 = [MEMORY[0x1E4F28C28] zero];
      v56 = PKCurrencyAmountCreate(v55, v72);
      v57 = [v56 formattedStringValue];
      [v54 setText:v57];

      [(PKDashboardViewControllerFooterView *)self->_currentFooter setButtonTitle:0];
      int v40 = 1;
      goto LABEL_17;
    case 3uLL:
    case 5uLL:
      uint64_t v23 = [v7 openingDate];
      id v71 = v7;
      uint64_t v24 = [v7 closingDate];
      id v70 = (void *)v23;
      [v24 timeIntervalSinceDate:v23];
      double v26 = v25;

      id v69 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v23 sinceDate:v26 * 0.5];
      id v27 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v27 setDay:-1];
      id v68 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v67 = [v68 dateByAddingComponents:v27 toDate:v69 options:0];
      uint64_t v28 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      v29 = [v28 components:8 fromDate:v67];
      [v29 month];

      uint64_t v30 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingTitle];
      id v31 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v32 = PKLocalizedFeatureString();
      [v30 setText:v32];

      id v33 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingDetail];
      id v34 = [v12 formattedStringValue];
      [v33 setText:v34];

      id v35 = self->_currentFooter;
      [(PKAccount *)self->_account feature];
      v36 = PKLocalizedFeatureString();
      [(PKDashboardViewControllerFooterView *)v35 setButtonTitle:v36];

      char v37 = [v74 paymentDueDate];
      [v37 timeIntervalSinceNow];
      double v39 = v38;

      if (v39 <= 604800.0)
      {
        uint64_t v7 = v71;
LABEL_13:
        v42 = self->_currentFooter;
        v43 = [MEMORY[0x1E4FB1618] blackColor];
        [(PKDashboardViewControllerFooterView *)v42 setButtonTintColor:v43];

        v44 = self->_currentFooter;
        v45 = [MEMORY[0x1E4FB1618] whiteColor];
        [(PKDashboardViewControllerFooterView *)v44 setButtonTitleColor:v45];
      }
      else
      {
        int v40 = 0;
        uint64_t v7 = v71;
LABEL_17:
        v58 = self->_currentFooter;
        v59 = [MEMORY[0x1E4FB1618] colorWithWhite:0.92 alpha:1.0];
        [(PKDashboardViewControllerFooterView *)v58 setButtonTintColor:v59];

        v60 = self->_currentFooter;
        v61 = [MEMORY[0x1E4FB1618] blackColor];
        [(PKDashboardViewControllerFooterView *)v60 setButtonTitleColor:v61];

        if (v40)
        {
          v62 = PKPassKitUIBundle();
          v63 = [v62 URLForResource:@"Bill_Payment_Checkmark" withExtension:@"pdf"];

          double v64 = PKUIScreenScale();
          id v65 = PKUIImageFromPDF(v63, 30.0, 30.0, v64);
          v66 = [v65 imageWithRenderingMode:2];

          [(PKDashboardViewControllerFooterView *)self->_currentFooter setPayButtonImage:v66];
          goto LABEL_20;
        }
      }
      [(PKDashboardViewControllerFooterView *)self->_currentFooter setPayButtonImage:0];
LABEL_20:

      return;
    default:
      goto LABEL_13;
  }
}

- (void)_configureFooterForAccountUsers
{
  id v15 = [(PKSpendingSummary *)self->_summary startDate];
  unint64_t v3 = [(PKSpendingSummary *)self->_summary endDate];
  if (v15) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v5 = PKDateRangeStringFromDateToDate();
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingTitle];
      [v7 setText:v6];

      uint64_t v8 = [(PKSpendingSummary *)self->_summary totalSpending];
      uint64_t v9 = [v8 amount];
      int v10 = objc_msgSend(v9, "pk_isNegativeNumber");

      if (v10)
      {
        id v11 = [v8 negativeValue];

        BOOL v12 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingDetail];
        char v13 = [v11 formattedStringValue];
        char v14 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v13);
        [v12 setText:v14];

        uint64_t v8 = v11;
      }
      else
      {
        BOOL v12 = [(PKDashboardViewControllerFooterView *)self->_currentFooter leadingDetail];
        char v13 = [v8 formattedStringValue];
        [v12 setText:v13];
      }
    }
  }
}

- (int64_t)_numberOfSummaryCells
{
  return 1;
}

- (int64_t)_numberOfRewardsCells
{
  if ([(PKSpendingSummary *)self->_summary isLoading]) {
    return 0;
  }
  if (self->_displayType == 1)
  {
    BOOL v4 = [(NSArray *)self->_sortedAccountUsers firstObject];
    int v5 = [v4 isCurrentUser] ^ 1;
  }
  else
  {
    int v5 = 0;
  }
  if (PKRewardsCenterEnabled() ^ 1 | v5) {
    return 1;
  }
  else {
    return 2;
  }
}

- (unint64_t)_rewardsCellAtIndex:(unint64_t)a3
{
  return a3;
}

- (int64_t)_numberOfAggregateCells
{
  uint64_t v2 = [(PKSpendingSummary *)self->_summary interest];
  unint64_t v3 = [v2 totalAmount];

  if (v3)
  {
    BOOL v4 = [v3 amount];
    int v5 = [MEMORY[0x1E4F28C28] zero];
    int64_t v6 = [v4 compare:v5] == 1;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_aggregateCellAtIndex:(unint64_t)a3
{
  return a3;
}

- (id)indexPathForSummary
{
  if (_MergedGlobals_9_0 != -1) {
    dispatch_once(&_MergedGlobals_9_0, &__block_literal_global_112);
  }
  uint64_t v2 = (void *)qword_1E94F5760;

  return v2;
}

void __60__PKSpendingSingleSummaryViewController_indexPathForSummary__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:1];
  id v1 = (void *)qword_1E94F5760;
  qword_1E94F5760 = v0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PKSpendingSingleSummaryViewController *)self scrollingDelegate];
  int v5 = v4;
  if (v4) {
    [v4 horizontalScrollingChildViewController:self scrollViewDidScroll:v6];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_summary) {
    return 7;
  }
  else {
    return 0;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      int64_t displayType = self->_displayType;
      if (displayType)
      {
        if (displayType != 1) {
          goto LABEL_5;
        }
        int64_t displayType = [(NSArray *)self->_sortedAccountUsers count] != 0;
      }
      goto LABEL_23;
    case 1:
LABEL_5:
      int64_t v8 = [(PKSpendingSingleSummaryViewController *)self _numberOfSummaryCells];
      goto LABEL_22;
    case 2:
      unint64_t v9 = self->_displayType;
      if (v9 == 1) {
        goto LABEL_20;
      }
      if (v9)
      {
LABEL_11:
        int64_t v8 = [(PKSpendingSingleSummaryViewController *)self _numberOfRewardsCells];
        goto LABEL_22;
      }
      if ([(PKAccount *)self->_account accessLevel] == 1
        && [(NSArray *)self->_sortedAccountUsers count] >= 2)
      {
        int64_t v8 = [(NSArray *)self->_sortedAccountUsers count];
LABEL_22:
        int64_t displayType = v8;
        goto LABEL_23;
      }
LABEL_20:
      int64_t displayType = 0;
      goto LABEL_23;
    case 3:
      goto LABEL_11;
    case 4:
      int64_t v8 = [(PKSpendingSingleSummaryViewController *)self _numberOfAggregateCells];
      goto LABEL_22;
    case 5:
      if (([(PKSpendingSummary *)self->_summary isLoading] & 1) != 0 || !self->_hasTransactions) {
        goto LABEL_20;
      }
      unint64_t categorization = self->_categorization;
      if (categorization == 1)
      {
        id v11 = [(PKSpendingSummary *)self->_summary orderedSpendingPerMerchants];
        if ([v11 count])
        {
          BOOL v12 = [(PKSpendingSummary *)self->_summary orderedSpendingPerMerchants];
          goto LABEL_26;
        }
        int64_t displayType = 1;
      }
      else
      {
        if (categorization) {
          goto LABEL_20;
        }
        id v11 = [(PKSpendingSummary *)self->_summary orderedSpendingCategories];
        if ([v11 count])
        {
          BOOL v12 = [(PKSpendingSummary *)self->_summary orderedSpendingCategories];
LABEL_26:
          char v14 = v12;
          int64_t displayType = [v12 count];

          goto LABEL_29;
        }
        int64_t displayType = [(PKSpendingSingleSummaryViewController *)self _numberOfNonSpendingTransactionTypeRowsEnabled] < 1;
      }
LABEL_29:

LABEL_23:
      return displayType;
    case 6:
      if (self->_categorization) {
        goto LABEL_20;
      }
      int64_t v8 = [(PKSpendingSingleSummaryViewController *)self _numberOfNonSpendingTransactionTypeRowsEnabled];
      goto LABEL_22;
    default:
      goto LABEL_20;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 section])
  {
    case 0:
      int64_t v8 = objc_alloc_init(PKDashboardAvatarItem);
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", [v7 row]);
      unint64_t v9 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();
      int v10 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
      id v11 = [(PKDashboardSpendingSummaryAccountUserItem *)v9 altDSID];
      BOOL v12 = [v10 objectForKey:v11];
      [(PKDashboardAvatarItem *)v8 setFamilyMember:v12];

      [(PKDashboardAvatarItem *)v8 setAccountUser:v9];
      avatarPresenter = self->_avatarPresenter;
      char v14 = v8;
      goto LABEL_7;
    case 1:
      if ([v7 row])
      {
        id v15 = 0;
      }
      else
      {
        v29 = objc_alloc_init(PKDashboardSpendingSummaryItem);
        [(PKDashboardSpendingSummaryItem *)v29 setSpendingSummary:self->_summary];
        id v15 = [(PKSpendingSummaryPresenter *)self->_summaryPresenter cellForItem:v29 inCollectionView:v6 atIndexPath:v7];
        uint64_t v30 = [v15 contentView];
        id v31 = [v30 subviews];
        v32 = [v31 firstObject];

        [v32 setVisible:self->_visible];
      }
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, [v7 row] == 0, -[PKSpendingSingleSummaryViewController _numberOfSummaryCells](self, "_numberOfSummaryCells") == objc_msgSend(v7, "row") + 1);
      uint64_t v33 = [v7 row];
      id v34 = (void *)MEMORY[0x1E4F85B28];
      if (!v33) {
        id v34 = (void *)MEMORY[0x1E4F85390];
      }
      [v15 setAccessibilityIdentifier:*v34];
      if ([v7 row]) {
        goto LABEL_42;
      }
      if (self->_isLowEndDevice)
      {
        int64_t v8 = [v15 layer];
LABEL_25:
        [(PKDashboardAvatarItem *)v8 setShadowOpacity:0.0];
        [(PKDashboardAvatarItem *)v8 setShadowRadius:0.0];
        goto LABEL_26;
      }
      BOOL visible = self->_visible;
      v48 = [v15 layer];
      int64_t v8 = v48;
      if (!visible) {
        goto LABEL_25;
      }
      double alphaTransition = self->_alphaTransition;
      if (alphaTransition >= 0.2) {
        goto LABEL_25;
      }
      double v50 = (alphaTransition / -0.2 + 1.0) * 0.15;
      *(float *)&double v50 = v50;
      [(PKDashboardAvatarItem *)v48 setShadowOpacity:v50];
      [(PKDashboardAvatarItem *)v8 setShadowRadius:20.0];
      [(PKDashboardAvatarItem *)v8 setMasksToBounds:0];
LABEL_26:
      id v35 = [v15 contentView];
      unint64_t v9 = [v35 layer];

      [(PKDashboardSpendingSummaryAccountUserItem *)v9 setCornerRadius:10.0];
      [(PKDashboardSpendingSummaryAccountUserItem *)v9 setMasksToBounds:1];
LABEL_8:

LABEL_18:
      goto LABEL_42;
    case 2:
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", [v7 row]);
      int64_t v8 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
      unint64_t v9 = objc_alloc_init(PKDashboardSpendingSummaryAccountUserItem);
      [(PKDashboardSpendingSummaryAccountUserItem *)v9 setSpendingSummary:self->_summary];
      double v16 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
      id v17 = [(PKDashboardAvatarItem *)v8 altDSID];
      id v18 = [v16 objectForKey:v17];
      [(PKDashboardSpendingSummaryAccountUserItem *)v9 setFamilyMember:v18];

      [(PKDashboardSpendingSummaryAccountUserItem *)v9 setAccountUser:v8];
      avatarPresenter = self->_summaryUsersPresenter;
      char v14 = v9;
LABEL_7:
      id v15 = [avatarPresenter cellForItem:v14 inCollectionView:v6 atIndexPath:v7];
      goto LABEL_8;
    case 3:
      unint64_t v19 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", [v7 row]);
      if (v19 == 1)
      {
        id v15 = [v6 dequeueReusableCellWithReuseIdentifier:@"buttonCellIdentifier" forIndexPath:v7];
        [(PKSpendingSingleSummaryViewController *)self _configureRewardsHubButtonCell:v15];
      }
      else if (v19)
      {
        id v15 = 0;
      }
      else
      {
        uint64_t v20 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        long long v21 = [(PKSpendingSummary *)self->_summary rewards];
        [(PKDashboardPaymentTransactionGroupItem *)v20 setGroup:v21];

        [(PKDashboardPaymentTransactionGroupItem *)v20 setTransactionSourceCollection:self->_transactionSourceCollection];
        [(PKDashboardPaymentTransactionGroupItem *)v20 setFamilyCollection:self->_familyCollection];
        [(PKDashboardPaymentTransactionGroupItem *)v20 setAccount:self->_account];
        [(PKDashboardPaymentTransactionGroupItem *)v20 setAccountUserCollection:self->_accountUserCollection];
        [(PKDashboardPaymentTransactionGroupItem *)v20 setPhysicalCards:self->_physicalCards];
        id v15 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter cellForItem:v20 inCollectionView:v6 atIndexPath:v7];
      }
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, [v7 row] == 0, -[PKSpendingSingleSummaryViewController _numberOfRewardsCells](self, "_numberOfRewardsCells") == objc_msgSend(v7, "row") + 1);
      unint64_t v40 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", [v7 row]);
      double v39 = (void *)MEMORY[0x1E4F85920];
      v41 = (void *)MEMORY[0x1E4F85928];
      if (v40 != 1) {
        v41 = (void *)MEMORY[0x1E4F85B28];
      }
      if (v40) {
        double v39 = v41;
      }
      goto LABEL_37;
    case 4:
      if (-[PKSpendingSingleSummaryViewController _aggregateCellAtIndex:](self, "_aggregateCellAtIndex:", [v7 row]))
      {
        id v15 = 0;
      }
      else
      {
        v36 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        char v37 = [(PKSpendingSummary *)self->_summary interest];
        [(PKDashboardPaymentTransactionGroupItem *)v36 setGroup:v37];

        [(PKDashboardPaymentTransactionGroupItem *)v36 setTransactionSourceCollection:self->_transactionSourceCollection];
        [(PKDashboardPaymentTransactionGroupItem *)v36 setFamilyCollection:self->_familyCollection];
        [(PKDashboardPaymentTransactionGroupItem *)v36 setAccount:self->_account];
        [(PKDashboardPaymentTransactionGroupItem *)v36 setAccountUserCollection:self->_accountUserCollection];
        [(PKDashboardPaymentTransactionGroupItem *)v36 setPhysicalCards:self->_physicalCards];
        id v15 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter cellForItem:v36 inCollectionView:v6 atIndexPath:v7];
      }
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, [v7 row] == 0, -[PKSpendingSingleSummaryViewController _numberOfAggregateCells](self, "_numberOfAggregateCells") == objc_msgSend(v7, "row") + 1);
      unint64_t v38 = -[PKSpendingSingleSummaryViewController _aggregateCellAtIndex:](self, "_aggregateCellAtIndex:", [v7 row]);
      double v39 = (void *)MEMORY[0x1E4F85B28];
      if (!v38) {
        double v39 = (void *)MEMORY[0x1E4F85630];
      }
LABEL_37:
      [v15 setAccessibilityIdentifier:*v39];
      goto LABEL_42;
    case 5:
      uint64_t v22 = [v7 row];
      unint64_t categorization = self->_categorization;
      if (categorization == 1)
      {
        uint64_t v24 = [(PKSpendingSummary *)self->_summary orderedSpendingPerMerchants];
        goto LABEL_39;
      }
      if (!categorization)
      {
        uint64_t v24 = [(PKSpendingSummary *)self->_summary orderedSpendingCategories];
LABEL_39:
        v42 = v24;
        v43 = [v24 objectAtIndex:v22];
        uint64_t v44 = [v42 count];

        goto LABEL_41;
      }
      uint64_t v44 = 0;
      v43 = 0;
LABEL_41:
      v45 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      [(PKDashboardPaymentTransactionGroupItem *)v45 setGroup:v43];
      [(PKDashboardPaymentTransactionGroupItem *)v45 setTransactionSourceCollection:self->_transactionSourceCollection];
      [(PKDashboardPaymentTransactionGroupItem *)v45 setFamilyCollection:self->_familyCollection];
      [(PKDashboardPaymentTransactionGroupItem *)v45 setAccount:self->_account];
      [(PKDashboardPaymentTransactionGroupItem *)v45 setAccountUserCollection:self->_accountUserCollection];
      [(PKDashboardPaymentTransactionGroupItem *)v45 setPhysicalCards:self->_physicalCards];
      id v15 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter cellForItem:v45 inCollectionView:v6 atIndexPath:v7];
      [(PKSpendingSingleSummaryViewController *)self _applyMaskToCell:v15 firstInSection:v22 == 0 lastInSection:v44 == v22 + 1];

LABEL_42:
      return v15;
    case 6:
      uint64_t v25 = [v7 row];
      int64_t v8 = [(PKSpendingSingleSummaryViewController *)self _nonSpendingTransactionGroupForType:[(PKSpendingSingleSummaryViewController *)self _nonSpendingTransactionTypeForRow:v25]];
      BOOL v26 = v25 == 0;
      BOOL v27 = v25 + 1 == [(PKSpendingSingleSummaryViewController *)self _numberOfNonSpendingTransactionTypeRowsEnabled];
      uint64_t v28 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      [(PKDashboardPaymentTransactionGroupItem *)v28 setGroup:v8];
      [(PKDashboardPaymentTransactionGroupItem *)v28 setTransactionSourceCollection:self->_transactionSourceCollection];
      [(PKDashboardPaymentTransactionGroupItem *)v28 setFamilyCollection:self->_familyCollection];
      [(PKDashboardPaymentTransactionGroupItem *)v28 setAccount:self->_account];
      [(PKDashboardPaymentTransactionGroupItem *)v28 setAccountUserCollection:self->_accountUserCollection];
      [(PKDashboardPaymentTransactionGroupItem *)v28 setPhysicalCards:self->_physicalCards];
      id v15 = [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter cellForItem:v28 inCollectionView:v6 atIndexPath:v7];
      [(PKSpendingSingleSummaryViewController *)self _applyMaskToCell:v15 firstInSection:v26 lastInSection:v27];

      goto LABEL_18;
    default:
      id v15 = 0;
      goto LABEL_42;
  }
}

- (int64_t)_numberOfNonSpendingTransactionTypeRowsEnabled
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
  {
    int v5 = [(PKSpendingSingleSummaryViewController *)self _nonSpendingTransactionGroupForType:v3];

    if (v5) {
      ++v4;
    }
    ++v3;
  }
  while (v3 != 3);
  return v4;
}

- (unint64_t)_nonSpendingTransactionTypeForRow:(int64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    id v7 = [(PKSpendingSingleSummaryViewController *)self _nonSpendingTransactionGroupForType:v5];

    if (v7)
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 3);
  return v5;
}

- (id)_nonSpendingTransactionGroupForType:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = [(PKSpendingSummary *)self->_summary adjustments];
  }
  else if (a3 == 1)
  {
    uint64_t v3 = [(PKSpendingSummary *)self->_summary refunds];
  }
  else if (a3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(PKSpendingSummary *)self->_summary payments];
  }

  return v3;
}

- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v11 = v7;
  uint64_t v8 = 3;
  if (!v6 || !v5) {
    uint64_t v8 = 1;
  }
  uint64_t v9 = 2;
  if (!v5) {
    uint64_t v9 = 0;
  }
  if (v6) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  [v7 setMaskType:v10];
  [v11 setShowsBottomSeparator:!v5];
}

- (CGSize)_sizeForAggregateOrRewardsCellInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  uint64_t v9 = [(PKSpendingSummary *)self->_summary rewards];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setGroup:v9];

  [(PKDashboardPaymentTransactionGroupItem *)v8 setTransactionSourceCollection:self->_transactionSourceCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setFamilyCollection:self->_familyCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setAccount:self->_account];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setAccountUserCollection:self->_accountUserCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v8 setPhysicalCards:self->_physicalCards];
  [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter sizeForItem:v8 inCollectionView:v7 atIndexPath:v6];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 section];
  id v12 = (id)*MEMORY[0x1E4FB2770];
  if ((id)*MEMORY[0x1E4FB2770] == v9) {
    double v13 = @"titleIdentifier";
  }
  else {
    double v13 = @"footerIdentifier";
  }
  double v14 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v10];
  if (v12 == v9)
  {
    if (v11) {
      double v15 = @"titleIdentifier";
    }
    else {
      double v15 = @"bigTitleIdentifier";
    }
    uint64_t v16 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v15 forIndexPath:v10];

    [(PKSpendingSingleSummaryViewController *)self _configureHeaderView:v16 inSection:v11];
    double v14 = (void *)v16;
  }
  else if ((id)*MEMORY[0x1E4FB2760] == v9)
  {
    [(PKSpendingSingleSummaryViewController *)self _configureFooterView:v14 inSection:v11];
  }

  return v14;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(PKSpendingSingleSummaryViewController *)self _hasHeaderForSection:a5])
  {
    [(PKSpendingSingleSummaryViewController *)self _configureHeaderView:self->_sampleHeaderView inSection:a5];
    sampleHeaderView = self->_sampleHeaderView;
    [v7 bounds];
    -[PKDashboardTitleHeaderView sizeThatFits:](sampleHeaderView, "sizeThatFits:", v9, 3.40282347e38);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(PKSpendingSingleSummaryViewController *)self _hasFooterForSection:a5])
  {
    [(PKSpendingSingleSummaryViewController *)self _configureFooterView:self->_sampleFooterView inSection:a5];
    sampleFooterView = self->_sampleFooterView;
    [v7 bounds];
    double v10 = v9;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    -[PKDashboardFooterTextView sizeThatFits:](sampleFooterView, "sizeThatFits:", v10 + v11 * -2.0, 3.40282347e38);
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  switch([v5 section])
  {
    case 2:
    case 4:
    case 6:
      goto LABEL_2;
    case 3:
      uint64_t v7 = [v5 row];
      if (v7 == 2) {
        goto LABEL_7;
      }
      if (v7)
      {
LABEL_2:
        BOOL hasTransactions = 1;
      }
      else
      {
        id v8 = [(PKSpendingSummary *)self->_summary rewards];
        BOOL hasTransactions = [v8 transactionCount] != 0;
      }
      break;
    case 5:
      BOOL hasTransactions = self->_hasTransactions;
      break;
    default:
LABEL_7:
      BOOL hasTransactions = 0;
      break;
  }

  return hasTransactions;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  switch([v5 section])
  {
    case 1:
      [v5 row];
      goto LABEL_33;
    case 2:
      uint64_t v6 = [(PKSpendingSummary *)self->_summary summaryType];
      uint64_t v7 = [(PKSpendingSummary *)self->_summary startDate];
      double v39 = (void *)v7;
      if (v6)
      {
        if (v6 == 1)
        {
          uint64_t v49 = v7;
          double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
          id v8 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          if (v6 == 2)
          {
            v50[0] = v7;
            id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
            double v9 = (void *)MEMORY[0x1E4F1CBF0];
            uint64_t v38 = MEMORY[0x1E4F1CBF0];
LABEL_30:
            id v34 = -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", [v5 row]);
            id v35 = (void *)[objc_alloc(MEMORY[0x1E4F85058]) initWithTransactionSourceCollection:self->_transactionSourceCollection account:self->_account accountUser:v34];
            id v18 = (void *)v38;
            double v17 = -[PKSpendingSummaryViewController initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:]([PKSpendingSummaryViewController alloc], "initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:", self->_transactionSourceCollection, self->_familyCollection, self->_avatarManager, self->_account, self->_accountUserCollection, self->_physicalCards, v35, v38, v9, v8, v6, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0,
                    1);

            goto LABEL_31;
          }
          id v8 = (void *)MEMORY[0x1E4F1CBF0];
          double v9 = (void *)MEMORY[0x1E4F1CBF0];
        }
        uint64_t v38 = (uint64_t)v8;
        goto LABEL_30;
      }
      uint64_t v48 = v7;
      uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
      double v9 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_30;
    case 3:
      unint64_t v10 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", [v5 row]);
      if (v10 != 1)
      {
        if (v10) {
          goto LABEL_33;
        }
        double v11 = [PKTransactionHistoryViewController alloc];
        uint64_t v12 = [(PKSpendingSummary *)self->_summary rewards];
LABEL_12:
        double v13 = (void *)v12;
        double v14 = [(PKTransactionHistoryViewController *)v11 initWithTransactionGroup:v12 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards fetcher:0 transactionHistory:0 detailViewStyle:0];
        goto LABEL_16;
      }
      if (!PKRewardsCenterEnabled()) {
        goto LABEL_33;
      }
      unint64_t v19 = [[PKRewardsHubViewController alloc] initWithAccount:self->_account transactionSourceCollection:self->_transactionSourceCollection accountService:self->_accountService];
      if (v19)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F843E0];
        uint64_t v21 = *MEMORY[0x1E4F86258];
        uint64_t v22 = *MEMORY[0x1E4F86308];
        v46[0] = *MEMORY[0x1E4F86730];
        v46[1] = v22;
        uint64_t v23 = *MEMORY[0x1E4F86468];
        v47[0] = v21;
        v47[1] = v23;
        v46[2] = *MEMORY[0x1E4F86BB0];
        v47[2] = *MEMORY[0x1E4F86600];
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
        uint64_t v25 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
        [v20 reportDashboardEventIfNecessary:v24 forPass:v25];

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
        v44[3] = &unk_1E59CAEA8;
        v44[4] = self;
        v45 = v19;
        [(PKRewardsHubViewController *)v45 preflightWithCompletion:v44];
      }
      goto LABEL_25;
    case 4:
      if (-[PKSpendingSingleSummaryViewController _aggregateCellAtIndex:](self, "_aggregateCellAtIndex:", [v5 row]))
      {
        goto LABEL_33;
      }
      double v11 = [PKTransactionHistoryViewController alloc];
      uint64_t v12 = [(PKSpendingSummary *)self->_summary interest];
      goto LABEL_12;
    case 5:
      unint64_t categorization = self->_categorization;
      if (categorization == 1)
      {
        BOOL v26 = [(PKSpendingSummary *)self->_summary orderedSpendingPerMerchants];
        BOOL v27 = objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v5, "row"));

        uint64_t v28 = [v27 transactions];
        unint64_t v19 = [v28 firstObject];

        id v29 = objc_alloc(MEMORY[0x1E4F84620]);
        uint64_t v30 = [(PKRewardsHubViewController *)v19 merchant];
        id v31 = (void *)[v29 initWithMerchant:v30 transactionSourceCollection:self->_transactionSourceCollection paymentDataProvider:0];

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
        v40[3] = &unk_1E59D36D8;
        id v41 = v31;
        v42 = self;
        id v43 = v27;
        id v32 = v27;
        id v33 = v31;
        [v33 reloadTransactionsWithCompletion:v40];

LABEL_25:
      }
      else if (!categorization)
      {
        double v16 = [(PKSpendingSummary *)self->_summary orderedSpendingCategories];
        double v13 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v5, "row"));

        double v14 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v13 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards fetcher:0 transactionHistory:0 detailViewStyle:0];
LABEL_16:
        double v17 = (PKSpendingSummaryViewController *)v14;

        if (v17)
        {
LABEL_32:
          v36 = [(PKSpendingSingleSummaryViewController *)self parentViewController];
          char v37 = [v36 navigationController];
          [v37 pushViewController:v17 animated:1];
        }
      }
LABEL_33:

      return;
    case 6:
      id v18 = -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", -[PKSpendingSingleSummaryViewController _nonSpendingTransactionTypeForRow:](self, "_nonSpendingTransactionTypeForRow:", [v5 row]));
      if (v18) {
        double v17 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v18 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards fetcher:0 transactionHistory:0 detailViewStyle:0];
      }
      else {
        double v17 = 0;
      }
LABEL_31:

      if (v17) {
        goto LABEL_32;
      }
      goto LABEL_33;
    default:
      goto LABEL_33;
  }
}

void __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) parentViewController];
  uint64_t v2 = [v3 navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

void __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  v8[3] = &unk_1E59CB8B0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = v3;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [PKTransactionHistoryViewController alloc];
  id v3 = *(void **)(a1 + 40);
  uint64_t v6 = [(PKTransactionHistoryViewController *)v2 initWithFetcher:*(void *)(a1 + 32) transactionSourceCollection:v3[127] familyCollection:v3[135] account:v3[129] accountUserCollection:v3[130] physicalCards:v3[131] featuredTransaction:0 selectedTransactions:*(void *)(a1 + 48) transactionHistory:*(void *)(a1 + 56)];
  id v4 = [*(id *)(a1 + 40) parentViewController];
  uint64_t v5 = [v4 navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = *MEMORY[0x1E4FB2848];
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ((unint64_t)a5 <= 7)
  {
    if (a5 == 2)
    {
      double v9 = 0.0;
      double v11 = 16.0;
      double v12 = 33.0;
      double v10 = 16.0;
    }
    else if ([v7 numberOfItemsInSection:a5] >= 1)
    {
      double v11 = 0.0;
      double v12 = 16.0;
      double v10 = 0.0;
      double v9 = 0.0;
    }
  }

  double v13 = v9;
  double v14 = v10;
  double v15 = v12;
  double v16 = v11;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  switch([v8 section])
  {
    case 0:
      double v9 = objc_alloc_init(PKDashboardAvatarItem);
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", [v8 row]);
      double v10 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();
      double v11 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
      double v12 = [(PKDashboardSpendingSummaryAccountUserItem *)v10 altDSID];
      double v13 = [v11 objectForKey:v12];
      [(PKDashboardAvatarItem *)v9 setFamilyMember:v13];

      [(PKDashboardAvatarItem *)v9 setAccountUser:v10];
      uint64_t v14 = 1312;
      goto LABEL_17;
    case 1:
      double v15 = objc_alloc_init(PKDashboardSpendingSummaryItem);
      [(PKDashboardSpendingSummaryItem *)v15 setSpendingSummary:self->_summary];
      [(PKSpendingSummaryPresenter *)self->_summaryPresenter sizeForItem:v15 inCollectionView:v7 atIndexPath:v8];
      double v17 = v16;
      double v19 = v18;
      unint64_t v20 = [v8 row];

      if (v20 >= 2) {
        goto LABEL_4;
      }
      goto LABEL_25;
    case 2:
LABEL_4:
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", [v8 row]);
      double v9 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
      double v10 = objc_alloc_init(PKDashboardSpendingSummaryAccountUserItem);
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setSpendingSummary:self->_summary];
      uint64_t v21 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
      uint64_t v22 = [(PKDashboardAvatarItem *)v9 altDSID];
      uint64_t v23 = [v21 objectForKey:v22];
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setFamilyMember:v23];

      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setAccountUser:v9];
      uint64_t v24 = 1320;
      goto LABEL_23;
    case 3:
      [(PKSpendingSingleSummaryViewController *)self _sizeForAggregateOrRewardsCellInCollectionView:v7 atIndexPath:v8];
      double v17 = v25;
      double v19 = v26;
      unint64_t v27 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", [v8 row]);
      if (!v27 || v27 == 2) {
        goto LABEL_25;
      }
      if (v27 == 1)
      {
        [(PKSpendingSingleSummaryViewController *)self _configureRewardsHubButtonCell:self->_sampleButtonCell];
        -[PKDashboardButtonCollectionViewCell sizeThatFits:](self->_sampleButtonCell, "sizeThatFits:", v17, v19);
LABEL_11:
        double v19 = v28;
      }
      else
      {
LABEL_9:
        double v17 = *MEMORY[0x1E4F1DB30];
        double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      goto LABEL_25;
    case 4:
      [(PKSpendingSingleSummaryViewController *)self _sizeForAggregateOrRewardsCellInCollectionView:v7 atIndexPath:v8];
      double v17 = v29;
      goto LABEL_11;
    case 5:
      if (!self->_hasTransactions)
      {
        [v7 bounds];
        double v35 = v34;
        +[PKDashboardCollectionViewCell defaultHorizontalInset];
        double v17 = v35 + v36 * -2.0;
        double v19 = 76.0;
        goto LABEL_25;
      }
      unint64_t categorization = self->_categorization;
      if (categorization == 1)
      {
        id v31 = [(PKSpendingSummary *)self->_summary orderedSpendingPerMerchants];
        goto LABEL_20;
      }
      if (!categorization)
      {
        id v31 = [(PKSpendingSummary *)self->_summary orderedSpendingCategories];
LABEL_20:
        char v37 = v31;
        objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v8, "row"));
        double v9 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      double v9 = 0;
LABEL_22:
      double v10 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setGroup:v9];
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setTransactionSourceCollection:self->_transactionSourceCollection];
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setFamilyCollection:self->_familyCollection];
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setAccount:self->_account];
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setAccountUserCollection:self->_accountUserCollection];
      [(PKDashboardSpendingSummaryAccountUserItem *)v10 setPhysicalCards:self->_physicalCards];
      uint64_t v24 = 1264;
LABEL_23:
      id v32 = *(Class *)((char *)&self->super.super.super.super.isa + v24);
      id v33 = v10;
LABEL_24:
      [v32 sizeForItem:v33 inCollectionView:v7 atIndexPath:v8];
      double v17 = v38;
      double v19 = v39;

LABEL_25:
      double v40 = v17;
      double v41 = v19;
      result.height = v41;
      result.width = v40;
      return result;
    case 6:
      double v9 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", -[PKSpendingSingleSummaryViewController _nonSpendingTransactionTypeForRow:](self, "_nonSpendingTransactionTypeForRow:", [v8 row]));
      double v10 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();
      [(PKDashboardAvatarItem *)v9 setGroup:v10];
      [(PKDashboardAvatarItem *)v9 setTransactionSourceCollection:self->_transactionSourceCollection];
      [(PKDashboardAvatarItem *)v9 setFamilyCollection:self->_familyCollection];
      [(PKDashboardAvatarItem *)v9 setAccount:self->_account];
      [(PKDashboardAvatarItem *)v9 setAccountUserCollection:self->_accountUserCollection];
      [(PKDashboardAvatarItem *)v9 setPhysicalCards:self->_physicalCards];
      uint64_t v14 = 1264;
LABEL_17:
      id v32 = *(Class *)((char *)&self->super.super.super.super.isa + v14);
      id v33 = v9;
      goto LABEL_24;
    default:
      goto LABEL_9;
  }
}

- (BOOL)_hasHeaderForSection:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 != 6)
  {
    if (a3 == 5 && ([(PKSpendingSummary *)self->_summary isLoading] & 1) == 0) {
      return self->_hasTransactions;
    }
    return 0;
  }
  unint64_t v5 = [(PKSpendingSingleSummaryViewController *)self _numberOfNonSpendingTransactionTypeRowsEnabled];
  if (([(PKSpendingSummary *)self->_summary isLoading] & 1) != 0 || self->_categorization) {
    return 0;
  }
  if (v5 > 1) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }
  return !self->_hasTransactions;
}

- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  [v6 setHorizontalInset:24.0];
  [v6 setUseCompactTopInset:1];
  switch(a4)
  {
    case 6uLL:
      if ([(PKSpendingSummary *)self->_summary isLoading])
      {
        [v6 setTitle:&stru_1EF1B5B50];
      }
      else
      {
        double v9 = PKLocalizedFeatureString();
        [v6 setTitle:v9];
      }
      [v6 setHorizontalInset:18.0];
      [v6 setTitleStyle:0];
      goto LABEL_25;
    case 5uLL:
      if ([(PKSpendingSummary *)self->_summary isLoading])
      {
        [v6 setTitle:&stru_1EF1B5B50];
      }
      else if (self->_categorization <= 1)
      {
        double v15 = PKLocalizedFeatureString();
        [v6 setTitle:v15];
      }
      [v6 setTitleStyle:0];
      [v6 setHorizontalInset:18.0];
      if (self->_hasTransactions)
      {
        if (self->_categorization <= 1)
        {
          double v16 = PKLocalizedFeatureString();
          [v6 setActionTitle:v16];
        }
        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __72__PKSpendingSingleSummaryViewController__configureHeaderView_inSection___block_invoke;
        v17[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v18, &location);
        [v6 setAction:v17];
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        break;
      }
LABEL_25:
      [v6 setActionTitle:0];
      break;
    case 1uLL:
      uint64_t v7 = [(PKSpendingSummary *)self->_summary summaryType];
      if (v7)
      {
        if (v7 == 1)
        {
          uint64_t v8 = 1240;
        }
        else
        {
          if (v7 != 2)
          {
            double v13 = 0;
            goto LABEL_21;
          }
          uint64_t v8 = 1256;
        }
        uint64_t v14 = *(Class *)((char *)&self->super.super.super.super.isa + v8);
        double v10 = [(PKSpendingSummary *)self->_summary startDate];
        double v11 = [v14 stringFromDate:v10];
        double v13 = objc_msgSend(v11, "pk_uppercaseFirstStringForPreferredLocale");
      }
      else
      {
        double v10 = [(PKSpendingSummary *)self->_summary startDate];
        double v11 = [(PKSpendingSummary *)self->_summary endDate];
        double v12 = PKDateRangeStringFromDateToDate();
        double v13 = objc_msgSend(v12, "pk_uppercaseFirstStringForPreferredLocale");
      }
LABEL_21:
      [v6 setTitleStyle:1];
      [v6 setTitle:v13];
      [v6 setActionTitle:0];
      [v6 setHorizontalInset:24.0];

      break;
  }
}

void __72__PKSpendingSingleSummaryViewController__configureHeaderView_inSection___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v2 = WeakRetained[173];
  if (!v2)
  {
    uint64_t v3 = 1;
    goto LABEL_6;
  }
  if (v2 == (id)1)
  {
    uint64_t v3 = 0;
LABEL_6:
    WeakRetained[173] = (id)v3;
  }
  uint64_t v8 = WeakRetained;
  id v4 = [WeakRetained collectionView];
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 5, 2);
  [v4 reloadSections:v5];

  id v6 = objc_loadWeakRetained(v8 + 172);
  uint64_t v7 = v6;
  if (v6) {
    [v6 spendingSingleSummaryViewController:v8 changedSelection:v8[173]];
  }

  WeakRetained = v8;
LABEL_10:
}

- (BOOL)_hasFooterForSection:(unint64_t)a3
{
  if (a3 != 5) {
    return 0;
  }
  uint64_t v3 = [(PKAccount *)self->_account creditDetails];
  id v4 = [v3 accountSummary];
  char v5 = [v4 requiresDebtCollectionNotices];

  return v5;
}

- (void)_configureFooterView:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  objc_msgSend(v6, "setHorizontalInset:");
  if (a4 == 5)
  {
    char v5 = PKLocalizedFeatureString();
    [v6 setFooterText:v5];
  }
}

- (void)_configureRewardsHubButtonCell:(id)a3
{
  id v3 = a3;
  PKLocalizedFeatureString();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setTitle:v4];
  [v3 setStyle:1];
}

- (void)_accountsChanged:(id)a3
{
  accountService = self->_accountService;
  char v5 = [(PKAccount *)self->_account accountIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke;
  v6[3] = &unk_1E59CB1C8;
  v6[4] = self;
  [(PKAccountService *)accountService accountWithIdentifier:v5 completion:v6];
}

void __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1032), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _configureFooter];
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PKSpendingSingleSummaryViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __64__PKSpendingSingleSummaryViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1080);
  *(void *)(v3 + 1080) = v2;

  id v5 = [*(id *)(a1 + 32) collectionView];
  [v5 reloadData];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(PKSpendingSingleSummaryViewController *)self gestureRecognizerRequiredToFail];

  return v6 == v5;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  self->_contentInsetAdjustmentBehavior = a3;
  if ([(PKSpendingSingleSummaryViewController *)self isViewLoaded])
  {
    id v5 = [(PKSpendingSingleSummaryViewController *)self collectionView];
    [v5 setContentInsetAdjustmentBehavior:a3];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_contentInset = a3;
  if ([(PKSpendingSingleSummaryViewController *)self isViewLoaded])
  {
    id v8 = [(PKSpendingSingleSummaryViewController *)self collectionView];
    objc_msgSend(v8, "setContentInset:", top, left, bottom, right);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKSpendingSingleSummaryViewController;
  [(PKSpendingSingleSummaryViewController *)&v20 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKSpendingSingleSummaryViewController *)self traitCollection];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      id v7 = [v4 preferredContentSizeCategory];
      id v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        double v10 = [PKDashboardTitleHeaderView alloc];
        double v11 = *MEMORY[0x1E4F1DB28];
        double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v15 = -[PKDashboardTitleHeaderView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
        sampleHeaderView = self->_sampleHeaderView;
        self->_sampleHeaderView = v15;

        double v17 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v11, v12, v13, v14);
        sampleFooterView = self->_sampleFooterView;
        self->_sampleFooterView = v17;

        double v19 = [(PKSpendingSingleSummaryViewController *)self collectionView];
        [(PKTransactionGroupItemPresenter *)self->_transactionGroupPresenter traitCollectionDidChangeFromTrait:v4 toTrait:v6 inCollectionView:v19];
        [(PKSpendingSummaryPresenter *)self->_summaryPresenter traitCollectionDidChangeFromTrait:v4 toTrait:v6 inCollectionView:v19];
        [v19 reloadData];
      }
    }
  }
}

- (void)buttonTappedInFooterView:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSingleSummaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");
  }
  else
  {
    resolutionController = self->_resolutionController;
    if (!resolutionController)
    {
      uint64_t v5 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:self->_account accountUserCollection:self->_accountUserCollection transactionSourceCollection:self->_transactionSourceCollection];
      id v6 = self->_resolutionController;
      self->_resolutionController = v5;

      [(PKAccountServiceAccountResolutionController *)self->_resolutionController setDelegate:self];
      resolutionController = self->_resolutionController;
    }
    [(PKAccountServiceAccountResolutionController *)resolutionController presentFlowForAccountResolution:1 configuration:0 completion:0];
    id v7 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v8 = *MEMORY[0x1E4F86258];
    uint64_t v9 = *MEMORY[0x1E4F86308];
    v14[0] = *MEMORY[0x1E4F86730];
    v14[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F86380];
    v15[0] = v8;
    v15[1] = v10;
    v14[2] = *MEMORY[0x1E4F86120];
    v15[2] = *MEMORY[0x1E4F86CD0];
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    double v12 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
    [v7 reportDashboardEventIfNecessary:v11 forPass:v12];
  }
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(UIViewController *)self pkui_frontMostViewController];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInsett.top;
  double left = self->_contentInsett.left;
  double bottom = self->_contentInsett.bottom;
  double right = self->_contentInsett.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)alphaTransition
{
  return self->_alphaTransition;
}

- (BOOL)visible
{
  return self->_visible;
}

- (PKHorizontalScrollingChildViewControllerDelegate)scrollingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->scrollingDelegate);

  return (PKHorizontalScrollingChildViewControllerDelegate *)WeakRetained;
}

- (void)setScrollingDelegate:(id)a3
{
}

- (UIGestureRecognizer)gestureRecognizerRequiredToFail
{
  return self->gestureRecognizerRequiredToFail;
}

- (void)setGestureRecognizerRequiredToFail:(id)a3
{
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (PKSpendingSingleSummaryViewControllerDelegate)summaryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_summaryDelegate);

  return (PKSpendingSingleSummaryViewControllerDelegate *)WeakRetained;
}

- (void)setSummaryDelegate:(id)a3
{
}

- (unint64_t)categorization
{
  return self->_categorization;
}

- (void)setCategorization:(unint64_t)a3
{
  self->_unint64_t categorization = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_summaryDelegate);
  objc_storeStrong((id *)&self->gestureRecognizerRequiredToFail, 0);
  objc_destroyWeak((id *)&self->scrollingDelegate);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_storeStrong((id *)&self->_sortedAccountUsers, 0);
  objc_storeStrong((id *)&self->_summaryUsersPresenter, 0);
  objc_storeStrong((id *)&self->_avatarPresenter, 0);
  objc_storeStrong((id *)&self->_sampleHighlightsCell, 0);
  objc_storeStrong((id *)&self->_sampleButtonCell, 0);
  objc_storeStrong((id *)&self->_sampleFooterView, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_summaryPresenter, 0);
  objc_storeStrong((id *)&self->_transactionGroupPresenter, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_formatterDay, 0);
  objc_storeStrong((id *)&self->_formatterFullMonth, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_upcomingScheduledPayments, 0);
  objc_storeStrong((id *)&self->_pendingPayments, 0);
  objc_storeStrong((id *)&self->_currentMonthTransactions, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_currentFooter, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end