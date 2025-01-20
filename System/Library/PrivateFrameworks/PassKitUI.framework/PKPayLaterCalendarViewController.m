@interface PKPayLaterCalendarViewController
- (BOOL)shouldResetContentOffsetAfterScrolling;
- (PKPayLaterCalendarViewController)initWithPlansFetcher:(id)a3 installmentPresenter:(id)a4 paymentIntentController:(id)a5;
- (double)footerViewContentHeight;
- (id)cachedDataAtIndex:(int64_t)a3;
- (id)emptyViewControllers;
- (id)footerView;
- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5;
- (int64_t)numberOfItems;
- (int64_t)startingIndex;
- (void)dealloc;
- (void)fetchDataAtIndex:(int64_t)a3 completion:(id)a4;
- (void)invalidatedInstallmentsMonth;
- (void)invalidatedInstallmentsMonthsWithDates:(id)a3;
- (void)preflightWithFirstShownDate:(id)a3 completion:(id)a4;
@end

@implementation PKPayLaterCalendarViewController

- (PKPayLaterCalendarViewController)initWithPlansFetcher:(id)a3 installmentPresenter:(id)a4 paymentIntentController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKPayLaterCalendarViewController;
  v12 = [(PKHorizontalScrollingViewController *)&v26 init];
  v13 = v12;
  if (v12)
  {
    p_fetcher = (id *)&v12->_fetcher;
    objc_storeStrong((id *)&v12->_fetcher, a3);
    objc_storeStrong((id *)&v13->_installmentPresenter, a4);
    [*p_fetcher registerObserver:v13];
    uint64_t v15 = [*p_fetcher payLaterAccount];
    payLaterAccount = v13->_payLaterAccount;
    v13->_payLaterAccount = (PKAccount *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingDateUpdates = v13->_pendingDateUpdates;
    v13->_pendingDateUpdates = v17;

    v13->_lockUpdate._os_unfair_lock_opaque = 0;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v20 = objc_alloc_init(PKPayLaterInstallmentsMonthPresenter);
    uint64_t v21 = 6;
    do
    {
      v22 = [[PKPayLaterCalendarMonthViewController alloc] initWithInstallmentsMonthPresenter:v20 installmentPresenter:v13->_installmentPresenter paymentIntentController:v11];
      [v19 addObject:v22];

      --v21;
    }
    while (v21);
    uint64_t v23 = [v19 copy];
    emptyViewControllers = v13->_emptyViewControllers;
    v13->_emptyViewControllers = (NSArray *)v23;
  }
  return v13;
}

- (void)dealloc
{
  [(PKPayLaterFinancingPlansFetcher *)self->_fetcher unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCalendarViewController;
  [(PKPayLaterCalendarViewController *)&v3 dealloc];
}

- (void)preflightWithFirstShownDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  fetcher = self->_fetcher;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke;
  v11[3] = &unk_1E59CA938;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(PKPayLaterFinancingPlansFetcher *)fetcher preflightDataIfNecessaryWithCompletion:v11];
}

void __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke_2;
  block[3] = &unk_1E59CA938;
  block[4] = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PKPayLaterCalendarViewController_preflightWithFirstShownDate_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 1128) monthDates];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 1152);
  *(void *)(v3 + 1152) = v2;

  *(void *)(a1[4] + 1160) = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = [*(id *)(a1[4] + 1152) count];
  if (v5 > 0)
  {
    uint64_t v6 = v5;
    if (a1[5] && [*(id *)(a1[4] + 1152) count])
    {
      uint64_t v7 = 0;
      while (1)
      {
        v8 = [*(id *)(a1[4] + 1152) objectAtIndexedSubscript:v7];
        id v9 = PKStartOfMonth();
        id v10 = PKEndOfMonth();
        if (PKDateIsBetweenDates()) {
          break;
        }

        if (++v7 >= (unint64_t)[*(id *)(a1[4] + 1152) count]) {
          goto LABEL_9;
        }
      }
      *(void *)(a1[4] + 1160) = v7;
    }
LABEL_9:
    uint64_t v11 = a1[4];
    if (*(void *)(v11 + 1160) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v11 + 1160) = v6 - 1;
    }
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

- (id)emptyViewControllers
{
  return self->_emptyViewControllers;
}

- (int64_t)numberOfItems
{
  return [(NSArray *)self->_months count];
}

- (int64_t)startingIndex
{
  return self->_startingIndex;
}

- (id)footerView
{
  return 0;
}

- (double)footerViewContentHeight
{
  return 0.0;
}

- (id)cachedDataAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || [(NSArray *)self->_months count] <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    fetcher = self->_fetcher;
    uint64_t v6 = [(NSArray *)self->_months objectAtIndexedSubscript:a3];
    uint64_t v7 = [(PKPayLaterFinancingPlansFetcher *)fetcher cachedInstallmentsMonthWithStartDate:v6];
  }

  return v7;
}

- (void)fetchDataAtIndex:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || [(NSArray *)self->_months count] <= a3)
  {
    v6[2](v6, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    fetcher = self->_fetcher;
    v8 = [(NSArray *)self->_months objectAtIndexedSubscript:a3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke;
    v9[3] = &unk_1E59CA988;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [(PKPayLaterFinancingPlansFetcher *)fetcher installmentsMonthWithDate:v8 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __64__PKPayLaterCalendarViewController_fetchDataAtIndex_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (id)loadingDataObjectWithCurrentData:(id)a3 index:(int64_t)a4 swap:(BOOL)a5
{
  return 0;
}

- (BOOL)shouldResetContentOffsetAfterScrolling
{
  return 1;
}

- (void)invalidatedInstallmentsMonthsWithDates:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_unfair_lock_lock(&self->_lockUpdate);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (([(NSMutableArray *)self->_pendingDateUpdates containsObject:v11] & 1) == 0)
          {
            [v5 addObject:v11];
            [(NSMutableArray *)self->_pendingDateUpdates addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(&self->_lockUpdate);
    if ([v5 count])
    {
      dispatch_time_t v12 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PKPayLaterCalendarViewController_invalidatedInstallmentsMonthsWithDates___block_invoke;
      block[3] = &unk_1E59CA870;
      void block[4] = self;
      id v14 = v5;
      dispatch_after(v12, MEMORY[0x1E4F14428], block);
    }
  }
}

void __75__PKPayLaterCalendarViewController_invalidatedInstallmentsMonthsWithDates___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1168));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 32) + 1176) removeObject:*(void *)(*((void *)&v20 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 1168));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1152), "indexOfObject:", *(void *)(*((void *)&v16 + 1) + 8 * v11), (void)v16);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = v12;
          id v14 = [*(id *)(a1 + 32) visibleIndices];
          int v15 = [v14 containsIndex:v13];

          if (v15) {
            [*(id *)(a1 + 32) reloadDataForViewControllerAtIndex:v13 swap:0];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)invalidatedInstallmentsMonth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 1128);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_2;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = v1;
  return [v2 preflightDataIfNecessaryWithCompletion:v4];
}

void __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_3;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__PKPayLaterCalendarViewController_invalidatedInstallmentsMonth__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) primaryIndex] == 0x7FFFFFFFFFFFFFFFLL
    || [*(id *)(a1 + 32) primaryIndex] < 0
    || (unint64_t v2 = [*(id *)(a1 + 32) primaryIndex],
        v2 >= [*(id *)(*(void *)(a1 + 32) + 1152) count]))
  {
    id v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1152), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "primaryIndex"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1128) monthDates];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1152);
  *(void *)(v4 + 1152) = v3;

  if (!v7
    || (uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1152) indexOfObject:v7], v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    if ([*(id *)(a1 + 32) numberOfItems] < 1) {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v6 = [*(id *)(a1 + 32) numberOfItems] - 1;
    }
  }
  [*(id *)(a1 + 32) updateScrollViewContentOffsetWithNewPrimaryIndex:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyViewControllers, 0);
  objc_storeStrong((id *)&self->_pendingDateUpdates, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_installmentPresenter, 0);

  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end