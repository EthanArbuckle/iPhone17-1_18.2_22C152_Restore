@interface PKSpendingSummaryViewController
- (BOOL)shouldResetContentOffsetAfterScrolling;
- (PKSpendingSummaryViewController)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 weeks:(id)a10 months:(id)a11 years:(id)a12 type:(unint64_t)a13 unit:(unint64_t)a14 currentMonthTransactions:(id)a15 pendingPayments:(id)a16 upcomingScheduledPayments:(id)a17 dispayType:(unint64_t)a18;
- (PKSpendingSummaryViewControllerDelegate)delegate;
- (double)footerViewContentHeight;
- (id)cachedDataAtIndex:(int64_t)a3;
- (id)emptyViewControllers;
- (id)footerView;
- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5;
- (id)pkNavigationController;
- (int64_t)numberOfItems;
- (int64_t)startingIndex;
- (unint64_t)_newDataSetIndexAfterTransitionFromMode:(unint64_t)a3 toMode:(unint64_t)a4;
- (unint64_t)categorization;
- (void)_changeModeTo:(unint64_t)a3;
- (void)_reportTappedButtonWithTag:(id)a3;
- (void)_updateBackTitle;
- (void)dealloc;
- (void)fetchDataAtIndex:(int64_t)a3 completion:(id)a4;
- (void)invalidatedSpendingSummaryOfType:(unint64_t)a3 startingWithDate:(id)a4;
- (void)invalidatedSummariesAvailable;
- (void)prefetchDataIfNecessary;
- (void)setCategorization:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKSpendingSummaryViewController

- (PKSpendingSummaryViewController)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 weeks:(id)a10 months:(id)a11 years:(id)a12 type:(unint64_t)a13 unit:(unint64_t)a14 currentMonthTransactions:(id)a15 pendingPayments:(id)a16 upcomingScheduledPayments:(id)a17 dispayType:(unint64_t)a18
{
  v89[3] = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  id v75 = a4;
  id v74 = a5;
  id v80 = a6;
  id v76 = a7;
  id v77 = a8;
  id v66 = a9;
  id v67 = a10;
  id v68 = a11;
  id v69 = a12;
  id v78 = a15;
  id v79 = a16;
  id v23 = a17;
  v88.receiver = self;
  v88.super_class = (Class)PKSpendingSummaryViewController;
  v24 = [(PKHorizontalScrollingViewController *)&v88 init];
  if (!v24) {
    goto LABEL_30;
  }
  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pendingUpdates = v24->_pendingUpdates;
  v24->_pendingUpdates = v25;

  objc_storeStrong((id *)&v24->_account, a6);
  objc_storeStrong((id *)&v24->_accountUserCollection, a7);
  objc_storeStrong((id *)&v24->_transactionSourceCollection, a3);
  uint64_t v27 = [(PKTransactionSourceCollection *)v24->_transactionSourceCollection paymentPass];
  pass = v24->_pass;
  v24->_pass = (PKPaymentPass *)v27;

  v24->_unint64_t currentSummaryType = a13;
  objc_storeStrong((id *)&v24->_summaryFetcher, a9);
  [(PKSpendingSummaryFetcher *)v24->_summaryFetcher registerObserver:v24];
  objc_storeStrong((id *)&v24->_currentMonthTransactions, a15);
  objc_storeStrong((id *)&v24->_familyCollection, a4);
  objc_storeStrong((id *)&v24->_avatarManager, a5);
  v24->_displayType = a18;
  v24->_lockUpdate._os_unfair_lock_opaque = 0;
  v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v30 = v24->_pendingUpdates;
  v24->_pendingUpdates = v29;

  objc_storeStrong((id *)&v24->_weeks, a10);
  objc_storeStrong((id *)&v24->_months, a11);
  p_years = (id *)&v24->_years;
  objc_storeStrong((id *)&v24->_years, a12);
  unint64_t currentSummaryType = v24->_currentSummaryType;
  if (currentSummaryType)
  {
    if (currentSummaryType == 2)
    {
      uint64_t v33 = 4;
    }
    else
    {
      if (currentSummaryType != 1)
      {
        uint64_t v33 = 0;
        goto LABEL_10;
      }
      uint64_t v33 = 8;
      p_years = (id *)&v24->_months;
    }
  }
  else
  {
    uint64_t v33 = 0x2000;
    p_years = (id *)&v24->_weeks;
  }
  v34 = (NSArray *)*p_years;
  currentDataSet = v24->_currentDataSet;
  v24->_currentDataSet = v34;

LABEL_10:
  if ([(PKSpendingSummaryViewController *)v24 numberOfItems] < 1)
  {
    v24->_startingIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24->_startingIndex = [(PKSpendingSummaryViewController *)v24 numberOfItems] - 1;
  }
  else
  {
    v36 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v37 = [(PKSpendingSummaryViewController *)v24 numberOfItems];
    while (v37-- >= 1)
    {
      v39 = [(NSArray *)v24->_currentDataSet objectAtIndex:v37];
      uint64_t v40 = [v36 component:v33 fromDate:v39];

      if (v40 == a14) {
        goto LABEL_19;
      }
    }
    uint64_t v37 = [(PKSpendingSummaryViewController *)v24 numberOfItems] - 1;
LABEL_19:
    v24->_startingIndex = v37;
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v42 = objc_alloc_init(PKTransactionGroupItemPresenter);
  v43 = objc_alloc_init(PKSpendingSummaryPresenter);
  unint64_t v44 = 0;
  do
  {
    v45 = [[PKSpendingSingleSummaryViewController alloc] initWithTransationSourceCollection:v73 familyCollection:v75 avatarManager:v74 account:v80 accountUserCollection:v76 physicalCards:v77 transactionGroupPresenter:v42 summaryPresenter:v43 currentMonthTransactions:v78 pendingPayments:v79 upcomingScheduledPayments:v23 displayType:a18];
    [(PKSpendingSingleSummaryViewController *)v45 setSummaryDelegate:v24];
    [v41 addObject:v45];
  }
  while (v44++ < 5 && a18 != 1);
  uint64_t v48 = [v41 copy];
  emptyViewControllers = v24->_emptyViewControllers;
  v24->_emptyViewControllers = (NSArray *)v48;

  if ([v80 supportsSchedulePayment])
  {
    v50 = [PKDashboardViewControllerFooterContainer alloc];
    uint64_t v51 = -[PKDashboardViewControllerFooterContainer initWithFrame:](v50, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    footerView = v24->_footerView;
    v24->_footerView = (PKHorizontalScrollingFooterViewProtocol *)v51;
  }
  v53 = [(PKSpendingSummaryViewController *)v24 navigationItem];
  if (!a18)
  {
    [(PKAccount *)v24->_account feature];
    objc_initWeak(&location, v24);
    id v60 = objc_alloc(MEMORY[0x1E4FB1C10]);
    v54 = (void *)MEMORY[0x1E4FB13F0];
    v70 = PKLocalizedFeatureString();
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke;
    v85[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v86, &location);
    v55 = [v54 actionWithTitle:v70 image:0 identifier:@"week" handler:v85];
    v89[0] = v55;
    v56 = (void *)MEMORY[0x1E4FB13F0];
    PKLocalizedFeatureString();
    id v64 = (id)objc_claimAutoreleasedReturnValue();
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_2;
    v83[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v84, &location);
    v57 = [v56 actionWithTitle:v64 image:0 identifier:@"month" handler:v83];
    v89[1] = v57;
    id v61 = (id)MEMORY[0x1E4FB13F0];
    PKLocalizedFeatureString();
    id v63 = (id)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_3;
    v81[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v82, &location);
    id v62 = [v61 actionWithTitle:v63 image:0 identifier:@"year" handler:v81];
    v89[2] = v62;
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:3];
    v72 = objc_msgSend(v60, "initWithFrame:actions:", v58, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

    [v72 setSelectedSegmentIndex:v24->_currentSummaryType];
    [v53 setTitleView:v72];
    [v53 setBackButtonDisplayMode:2];
    [(PKSpendingSummaryViewController *)v24 _updateBackTitle];

    objc_destroyWeak(&v82);
    objc_destroyWeak(&v84);
    objc_destroyWeak(&v86);
    objc_destroyWeak(&location);
  }

LABEL_30:
  return v24;
}

void __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _changeModeTo:0];
    id WeakRetained = v2;
  }
}

void __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _changeModeTo:1];
    id WeakRetained = v2;
  }
}

void __261__PKSpendingSummaryViewController_initWithTransactionSourceCollection_familyCollection_avatarManager_account_accountUserCollection_physicalCards_fetcher_weeks_months_years_type_unit_currentMonthTransactions_pendingPayments_upcomingScheduledPayments_dispayType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _changeModeTo:2];
    id WeakRetained = v2;
  }
}

- (id)pkNavigationController
{
  id v2 = [(PKSpendingSummaryViewController *)self navigationController];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)emptyViewControllers
{
  return self->_emptyViewControllers;
}

- (int64_t)numberOfItems
{
  return [(NSArray *)self->_currentDataSet count];
}

- (int64_t)startingIndex
{
  return self->_startingIndex;
}

- (id)footerView
{
  return self->_footerView;
}

- (double)footerViewContentHeight
{
  footerView = self->_footerView;
  if (!footerView) {
    return 0.0;
  }
  id v3 = [(PKSpendingSummaryViewController *)self view];
  [v3 bounds];
  -[PKHorizontalScrollingFooterViewProtocol sizeThatFits:](footerView, "sizeThatFits:", v4, v5);
  double v7 = v6;

  return v7;
}

- (id)cachedDataAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || [(NSArray *)self->_currentDataSet count] <= a3)
  {
    double v7 = 0;
  }
  else
  {
    summaryFetcher = self->_summaryFetcher;
    double v6 = [(NSArray *)self->_currentDataSet objectAtIndex:a3];
    double v7 = [(PKSpendingSummaryFetcher *)summaryFetcher cachedSpendingSummaryStartingWithDate:v6 type:self->_currentSummaryType];
  }

  return v7;
}

- (void)prefetchDataIfNecessary
{
  unint64_t currentSummaryType = self->_currentSummaryType;
  if (currentSummaryType == 2)
  {
    int v5 = 1;
    goto LABEL_10;
  }
  if (currentSummaryType != 1)
  {
    if (currentSummaryType) {
      return;
    }
    unint64_t v4 = [(PKSpendingSummaryViewController *)self _newDataSetIndexAfterTransitionFromMode:0 toMode:2];
    int v5 = 0;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    unint64_t v6 = v4;
    int v7 = 1;
LABEL_9:
    summaryFetcher = self->_summaryFetcher;
    v10 = [(NSArray *)self->_years objectAtIndex:v6];
    [(PKSpendingSummaryFetcher *)summaryFetcher spendingSummaryStartingWithDate:v10 type:2 includingLastPeriodChange:1 completion:0];

    if (!v7)
    {
LABEL_11:
      if (!v5) {
        return;
      }
      goto LABEL_14;
    }
LABEL_10:
    unint64_t v11 = [(PKSpendingSummaryViewController *)self _newDataSetIndexAfterTransitionFromMode:self->_currentSummaryType toMode:1];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = self->_summaryFetcher;
      v13 = [(NSArray *)self->_months objectAtIndex:v11];
      [(PKSpendingSummaryFetcher *)v12 spendingSummaryStartingWithDate:v13 type:1 includingLastPeriodChange:1 completion:0];

      if ((v5 & 1) == 0) {
        return;
      }
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  int v5 = 1;
  unint64_t v8 = [(PKSpendingSummaryViewController *)self _newDataSetIndexAfterTransitionFromMode:1 toMode:2];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v8;
    int v7 = 0;
    goto LABEL_9;
  }
LABEL_14:
  unint64_t v14 = [(PKSpendingSummaryViewController *)self _newDataSetIndexAfterTransitionFromMode:self->_currentSummaryType toMode:0];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = self->_summaryFetcher;
    id v16 = [(NSArray *)self->_weeks objectAtIndex:v14];
    [(PKSpendingSummaryFetcher *)v15 spendingSummaryStartingWithDate:v16 type:0 includingLastPeriodChange:1 completion:0];
  }
}

- (void)fetchDataAtIndex:(int64_t)a3 completion:(id)a4
{
  unint64_t v6 = (void (**)(id, void))a4;
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || [(NSArray *)self->_currentDataSet count] <= a3)
  {
    v6[2](v6, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    summaryFetcher = self->_summaryFetcher;
    unint64_t v8 = [(NSArray *)self->_currentDataSet objectAtIndex:a3];
    unint64_t currentSummaryType = self->_currentSummaryType;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke;
    v10[3] = &unk_1E59CEF50;
    objc_copyWeak(&v12, &location);
    unint64_t v11 = v6;
    [(PKSpendingSummaryFetcher *)summaryFetcher spendingSummaryStartingWithDate:v8 type:currentSummaryType includingLastPeriodChange:1 completion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __63__PKSpendingSummaryViewController_fetchDataAtIndex_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([*(id *)(a1 + 32) summaryType] == WeakRetained[155]) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = 0;
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
    id WeakRetained = v4;
  }
}

- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5
{
  id v8 = a3;
  v9 = [(NSArray *)self->_currentDataSet objectAtIndex:a4];
  v10 = [(PKSpendingSummaryFetcher *)self->_summaryFetcher cachedSpendingSummaryStartingWithDate:v9 type:self->_currentSummaryType];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v11 = v8;
    }
    else {
      unint64_t v11 = 0;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  id v12 = v11;
  v13 = v12;
  if (a5
    || [v12 summaryType] == self->_currentSummaryType
    && ([v13 startDate],
        unint64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = PKEqualObjects(),
        v14,
        (v15 & 1) != 0))
  {
    id v16 = 0;
    goto LABEL_22;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F85050]);
  id v16 = v17;
  if (!v10)
  {
    [v17 setSummaryType:self->_currentSummaryType];
    [v16 setStartDate:v9];
    unint64_t currentSummaryType = self->_currentSummaryType;
    if (currentSummaryType == 2)
    {
      uint64_t v27 = PKStartOfNextYear();
    }
    else if (currentSummaryType == 1)
    {
      uint64_t v27 = PKStartOfNextMonth();
    }
    else
    {
      if (currentSummaryType)
      {
        v25 = 0;
        goto LABEL_20;
      }
      uint64_t v27 = [MEMORY[0x1E4F85058] nextStartOfWeekFromDate:v9];
    }
    v25 = (void *)v27;
LABEL_20:
    v28 = [v25 dateByAddingTimeInterval:-1.0];
    [v16 setEndDate:v28];

    v29 = [(PKSpendingSummaryFetcher *)self->_summaryFetcher accountUser];
    v30 = [v29 altDSID];
    [v16 setAltDSID:v30];

    goto LABEL_21;
  }
  objc_msgSend(v17, "setSummaryType:", objc_msgSend(v10, "summaryType"));
  v18 = [v10 startDate];
  [v16 setStartDate:v18];

  v19 = [v10 endDate];
  [v16 setEndDate:v19];

  objc_msgSend(v16, "setSummaryUnit:", objc_msgSend(v10, "summaryUnit"));
  v20 = [v10 totalSpending];
  [v16 setTotalSpending:v20];

  v21 = [v10 previousMaxAmount];
  [v16 setPreviousMaxAmount:v21];

  v22 = [v10 previousTotalSpending];
  [v16 setPreviousTotalSpending:v22];

  id v23 = [v10 spendingsPerCalendarUnit];
  [v16 setSpendingsPerCalendarUnit:v23];

  v24 = [v10 spendingsPerAltDSID];
  [v16 setSpendingsPerAltDSID:v24];

  v25 = [v10 altDSID];
  [v16 setAltDSID:v25];
LABEL_21:

  [v16 setIsLoading:1];
LABEL_22:

  return v16;
}

- (void)dealloc
{
  [(PKSpendingSummaryFetcher *)self->_summaryFetcher unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryViewController;
  [(PKSpendingSummaryViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryViewController;
  [(PKHorizontalScrollingViewController *)&v4 viewDidLoad];
  objc_super v3 = [(PKSpendingSummaryViewController *)self view];
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85A30]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKSpendingSummaryViewController;
  [(PKSpendingSummaryViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F86730];
  v9[0] = *MEMORY[0x1E4F86308];
  v9[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86258];
  v10[0] = *MEMORY[0x1E4F864A0];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 reportDashboardEventIfNecessary:v7 forPass:self->_pass];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKSpendingSummaryViewController;
  [(PKSpendingSummaryViewController *)&v9 viewDidDisappear:a3];
  objc_super v4 = [(PKSpendingSummaryViewController *)self pkNavigationController];
  [v4 promptAppStoreReviewForTrigger:1];

  uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86258];
  v11[0] = *MEMORY[0x1E4F864A8];
  v11[1] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v5 reportDashboardEventIfNecessary:v8 forPass:self->_pass];
}

- (void)_updateBackTitle
{
  if (self->_currentSummaryType > 2)
  {
    id v4 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_super v3 = [(PKSpendingSummaryViewController *)self navigationItem];
  [v3 setBackButtonTitle:v4];
}

- (void)_changeModeTo:(unint64_t)a3
{
  if (!self->_transitioningMode)
  {
    self->_transitioningMode = 1;
    [(PKHorizontalScrollingViewController *)self clearPendingDataCollectionViewUpdates];
    [(PKHorizontalScrollingViewController *)self enableScrollView:0];
    unint64_t currentSummaryType = self->_currentSummaryType;
    if (a3 <= 2)
    {
      uint64_t v6 = off_1E59CEFD8[a3];
      uint64_t v7 = (void *)qword_1E59CEFF0[a3];
      PKSetBroadwaySummaryType();
      self->_unint64_t currentSummaryType = a3;
      objc_super v8 = (NSArray *)*(id *)((char *)&self->super.super.super.super.isa + *v6);
      currentDataSet = self->_currentDataSet;
      self->_currentDataSet = v8;

      [(PKSpendingSummaryViewController *)self _reportTappedButtonWithTag:*v7];
    }
    [(PKSpendingSummaryViewController *)self _updateBackTitle];
    int64_t v10 = [(PKSpendingSummaryViewController *)self _newDataSetIndexAfterTransitionFromMode:currentSummaryType toMode:a3];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v10 = [(PKSpendingSummaryViewController *)self numberOfItems] - 1;
    }
    [(PKHorizontalScrollingViewController *)self resetVisibleViewControllersWithNewPrimaryIndex:v10];
    [(PKHorizontalScrollingViewController *)self enableScrollView:1];
    self->_transitioningMode = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v12 = WeakRetained;
      [WeakRetained summaryTypeDidChange];
      id WeakRetained = v12;
    }
  }
}

- (unint64_t)_newDataSetIndexAfterTransitionFromMode:(unint64_t)a3 toMode:(unint64_t)a4
{
  uint64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  objc_super v8 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v9 = [(PKHorizontalScrollingViewController *)self primaryIndex];
  switch(a3)
  {
    case 0uLL:
      int64_t v10 = [(NSArray *)self->_weeks objectAtIndex:v9];
      if (a4 == 1)
      {
        NSUInteger v16 = [(NSArray *)self->_months count];
        unint64_t v11 = [v7 components:14 fromDate:v10];
        if (v16)
        {
          unint64_t v15 = 0;
          while (1)
          {
            id v17 = [(NSArray *)self->_months objectAtIndex:v15];
            char v18 = [v7 date:v17 matchesComponents:v11];

            if (v18) {
              goto LABEL_48;
            }
            if (v16 == ++v15) {
              goto LABEL_38;
            }
          }
        }
      }
      else
      {
        NSUInteger v29 = [(NSArray *)self->_years count];
        unint64_t v11 = [v7 components:6 fromDate:v10];
        if (v29)
        {
          unint64_t v15 = 0;
          while (1)
          {
            v30 = [(NSArray *)self->_years objectAtIndex:v15];
            char v31 = [v7 date:v30 matchesComponents:v11];

            if (v31) {
              goto LABEL_48;
            }
            if (v29 == ++v15) {
              goto LABEL_38;
            }
          }
        }
      }
      goto LABEL_38;
    case 1uLL:
      int64_t v10 = [(NSArray *)self->_months objectAtIndex:v9];
      if (a4)
      {
        unint64_t v11 = [v7 components:6 fromDate:v10];
        NSUInteger v19 = [(NSArray *)self->_years count];
        if (v19)
        {
          NSUInteger v20 = v19;
          unint64_t v15 = 0;
          while (1)
          {
            v21 = [(NSArray *)self->_years objectAtIndex:v15];
            char v22 = [v7 date:v21 matchesComponents:v11];

            if (v22) {
              goto LABEL_48;
            }
            if (v20 == ++v15) {
              goto LABEL_38;
            }
          }
        }
        goto LABEL_38;
      }
      unint64_t v11 = [v7 components:14 fromDate:v10];
      id v41 = v8;
      uint64_t v32 = [v7 date:v8 matchesComponents:v11];
      NSUInteger v33 = [(NSArray *)self->_weeks count];
      NSUInteger v24 = v33;
      if ((v32 & 1) == 0)
      {
        if (v33)
        {
          uint64_t v40 = v10;
          unint64_t v15 = 0;
          uint64_t v36 = 0;
          uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          while (1)
          {
            uint64_t v37 = -[NSArray objectAtIndex:](self->_weeks, "objectAtIndex:", v15, v40);
            int v38 = [v7 date:v37 matchesComponents:v11];

            if (v38)
            {
              ++v36;
              uint64_t v26 = v15;
              if (v36 == 3) {
                goto LABEL_45;
              }
            }
            if (v24 == ++v15)
            {
LABEL_44:
              unint64_t v15 = v26;
              goto LABEL_45;
            }
          }
        }
        goto LABEL_46;
      }
LABEL_33:
      unint64_t v15 = v24 - 1;
LABEL_47:
      objc_super v8 = v41;
      goto LABEL_48;
    case 2uLL:
      int64_t v10 = [(NSArray *)self->_years objectAtIndex:v9];
      unint64_t v11 = [v7 components:6 fromDate:v10];
      char v12 = [v7 date:v8 matchesComponents:v11];
      if (a4 == 1)
      {
        NSUInteger v13 = [(NSArray *)self->_months count];
        NSUInteger v14 = v13;
        if (v12)
        {
          unint64_t v15 = v13 - 1;
LABEL_48:

          goto LABEL_49;
        }
        if (v13)
        {
          unint64_t v15 = 0;
          do
          {
            v34 = [(NSArray *)self->_months objectAtIndex:v15];
            char v35 = [v7 date:v34 matchesComponents:v11];

            if (v35) {
              goto LABEL_48;
            }
          }
          while (v14 != ++v15);
        }
LABEL_38:
        unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_48;
      }
      id v41 = v8;
      NSUInteger v23 = [(NSArray *)self->_weeks count];
      NSUInteger v24 = v23;
      if ((v12 & 1) == 0)
      {
        if (v23)
        {
          uint64_t v40 = v10;
          unint64_t v15 = 0;
          uint64_t v25 = 0;
          uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          while (1)
          {
            uint64_t v27 = -[NSArray objectAtIndex:](self->_weeks, "objectAtIndex:", v15, v40);
            int v28 = [v7 date:v27 matchesComponents:v11];

            if (v28)
            {
              ++v25;
              uint64_t v26 = v15;
              if (v25 == 3) {
                break;
              }
            }
            if (v24 == ++v15) {
              goto LABEL_44;
            }
          }
LABEL_45:
          int64_t v10 = v40;
          objc_super v8 = v41;
          goto LABEL_48;
        }
LABEL_46:
        unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_47;
      }
      goto LABEL_33;
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_49:

  return v15;
}

- (BOOL)shouldResetContentOffsetAfterScrolling
{
  return 0;
}

- (void)invalidatedSpendingSummaryOfType:(unint64_t)a3 startingWithDate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  os_unfair_lock_lock(&self->_lockUpdate);
  id v8 = [(NSMutableDictionary *)self->_pendingUpdates objectForKey:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_pendingUpdates setObject:v8 forKey:v7];
  }
  if ([v8 containsObject:v6])
  {
    os_unfair_lock_unlock(&self->_lockUpdate);
  }
  else
  {
    [v8 addObject:v6];
    os_unfair_lock_unlock(&self->_lockUpdate);
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __85__PKSpendingSummaryViewController_invalidatedSpendingSummaryOfType_startingWithDate___block_invoke;
    void v10[3] = &unk_1E59CEF78;
    void v10[4] = self;
    id v11 = v7;
    id v12 = v6;
    unint64_t v13 = a3;
    dispatch_after(v9, MEMORY[0x1E4F14428], v10);
  }
}

void __85__PKSpendingSummaryViewController_invalidatedSpendingSummaryOfType_startingWithDate___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1272));
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1280) objectForKey:*(void *)(a1 + 40)];
  [v7 removeObject:*(void *)(a1 + 48)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1272));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 56) == *(void *)(v2 + 1240))
  {
    uint64_t v3 = [*(id *)(v2 + 1232) indexOfObject:*(void *)(a1 + 48)];
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = v3;
      uint64_t v5 = [*(id *)(a1 + 32) visibleIndices];
      int v6 = [v5 containsIndex:v4];

      if (v6) {
        [*(id *)(a1 + 32) reloadDataForViewControllerAtIndex:v4 swap:0];
      }
    }
  }
}

- (void)invalidatedSummariesAvailable
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 1168);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_2;
  v4[3] = &unk_1E59CEFA0;
  v4[4] = v1;
  return [v2 availableSummaries:v4];
}

void __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_3;
  v13[3] = &unk_1E59CB8B0;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __64__PKSpendingSummaryViewController_invalidatedSummariesAvailable__block_invoke_3(id *a1)
{
  objc_msgSend(*((id *)a1[4] + 154), "objectAtIndex:", objc_msgSend(a1[4], "primaryIndex"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)a1[4] + 149, a1[5]);
  uint64_t v2 = a1 + 6;
  objc_storeStrong((id *)a1[4] + 150, a1[6]);
  objc_storeStrong((id *)a1[4] + 151, a1[7]);
  id v3 = a1[4];
  uint64_t v4 = *((void *)v3 + 155);
  switch(v4)
  {
    case 0:
      uint64_t v2 = a1 + 5;
      goto LABEL_7;
    case 2:
      uint64_t v2 = a1 + 7;
      goto LABEL_7;
    case 1:
LABEL_7:
      id v5 = *v2;
      int v6 = (void *)*((void *)v3 + 154);
      *((void *)v3 + 154) = v5;

      id v3 = a1[4];
      break;
  }
  uint64_t v7 = [*((id *)v3 + 154) indexOfObject:v8];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a1[4] numberOfItems] < 1) {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v7 = [a1[4] numberOfItems] - 1;
    }
  }
  [a1[4] updateScrollViewContentOffsetWithNewPrimaryIndex:v7];
}

- (void)_reportTappedButtonWithTag:(id)a3
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F86308];
  v10[0] = *MEMORY[0x1E4F86730];
  v10[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F86380];
  v11[0] = *MEMORY[0x1E4F86258];
  v11[1] = v5;
  int v6 = (void *)MEMORY[0x1E4F843E0];
  void v10[2] = *MEMORY[0x1E4F86120];
  v11[2] = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v6 reportDashboardEventIfNecessary:v9 forPass:self->_pass];
}

- (PKSpendingSummaryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSpendingSummaryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)categorization
{
  return self->_categorization;
}

- (void)setCategorization:(unint64_t)a3
{
  self->_categorization = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_emptyViewControllers, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_currentMonthTransactions, 0);
  objc_storeStrong((id *)&self->_currentDataSet, 0);
  objc_storeStrong((id *)&self->_navTitle, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_weeks, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_summaryFetcher, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end