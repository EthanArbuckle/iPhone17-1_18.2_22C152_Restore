@interface SearchUIButtonItemFactory
- (BOOL)countMoreButtonTowardsMaxCount;
- (NSDate)startTime;
- (NSMapTable)fetchedCommandButtonItemsForButtons;
- (NSMutableArray)buttonItemGenerators;
- (NSMutableSet)fullyGeneratedButtonItems;
- (SearchUIButtonItemFactory)init;
- (SearchUIButtonItemGeneratorViewDelegate)delegate;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (double)timeLimitForSubsequentButtonGeneratorUpdates;
- (void)fetchSearchUIButtonitemsWithSFButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 shouldReverseButtonOrder:(BOOL)a5 completion:(id)a6;
- (void)setButtonItemGenerators:(id)a3;
- (void)setCountMoreButtonTowardsMaxCount:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setFetchedCommandButtonItemsForButtons:(id)a3;
- (void)setFullyGeneratedButtonItems:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimeLimitForSubsequentButtonGeneratorUpdates:(double)a3;
- (void)updateCompletionHandlerWithSFButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 shouldReverseButtonOrder:(BOOL)a5 completion:(id)a6;
@end

@implementation SearchUIButtonItemFactory

- (SearchUIButtonItemFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIButtonItemFactory;
  v2 = [(SearchUIButtonItemFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SearchUIButtonItemFactory *)v2 setCountMoreButtonTowardsMaxCount:1];
  }
  return v3;
}

- (void)fetchSearchUIButtonitemsWithSFButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 shouldReverseButtonOrder:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [(SearchUIButtonItemFactory *)self timeLimitForSubsequentButtonGeneratorUpdates];
  if (v12 != 0.0)
  {
    v13 = [MEMORY[0x1E4F1C9C8] now];
    [(SearchUIButtonItemFactory *)self setStartTime:v13];

    objc_initWeak(&location, self);
    [(SearchUIButtonItemFactory *)self timeLimitForSubsequentButtonGeneratorUpdates];
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke;
    block[3] = &unk_1E6E73790;
    objc_copyWeak(v26, &location);
    id v24 = v10;
    v26[1] = (id)a4;
    BOOL v27 = a5;
    id v25 = v11;
    dispatch_after(v15, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_2;
  v18[3] = &unk_1E6E73808;
  v18[4] = self;
  id v19 = v10;
  BOOL v22 = a5;
  id v20 = v11;
  unint64_t v21 = a4;
  id v16 = v11;
  id v17 = v10;
  +[SearchUIUtilities dispatchMainIfNecessary:v18];
}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained updateCompletionHandlerWithSFButtonItems:*(void *)(a1 + 32) maxButtonItems:*(void *)(a1 + 56) shouldReverseButtonOrder:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 40)];
}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "count"));
  [*(id *)(a1 + 32) setFetchedCommandButtonItemsForButtons:v2];

  v3 = objc_opt_new();
  [*(id *)(a1 + 32) setButtonItemGenerators:v3];

  v4 = objc_opt_new();
  [*(id *)(a1 + 32) setFullyGeneratedButtonItems:v4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v8 _searchUIButtonItemGeneratorClass];
        v9 = objc_opt_new();
        id v10 = [*(id *)(a1 + 32) delegate];
        [v9 setDelegate:v10];

        id v11 = [*(id *)(a1 + 32) feedbackDelegate];
        [v9 setFeedbackDelegate:v11];

        objc_initWeak(&location, *(id *)(a1 + 32));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_3;
        v17[3] = &unk_1E6E737E0;
        objc_copyWeak(v20, &location);
        v17[4] = v8;
        id v12 = *(id *)(a1 + 40);
        double v14 = *(void **)(a1 + 48);
        v13 = *(void **)(a1 + 56);
        id v18 = v12;
        v20[1] = v13;
        char v21 = *(unsigned char *)(a1 + 64);
        id v19 = v14;
        [v9 generateSearchUIButtonItemsWithSFButtonItem:v8 completion:v17];
        if (v9)
        {
          dispatch_time_t v15 = [*(id *)(a1 + 32) buttonItemGenerators];
          [v15 addObject:v9];
        }
        objc_destroyWeak(v20);
        objc_destroyWeak(&location);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_4;
  v11[3] = &unk_1E6E737B8;
  objc_copyWeak(v16, (id *)(a1 + 56));
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  char v17 = a3;
  id v9 = v8;
  id v10 = *(void **)(a1 + 64);
  id v14 = v9;
  v16[1] = v10;
  char v18 = *(unsigned char *)(a1 + 72);
  id v15 = *(id *)(a1 + 48);
  +[SearchUIUtilities dispatchMainIfNecessary:v11];

  objc_destroyWeak(v16);
}

void __122__SearchUIButtonItemFactory_fetchSearchUIButtonitemsWithSFButtonItems_maxButtonItems_shouldReverseButtonOrder_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = [WeakRetained fetchedCommandButtonItemsForButtons];
  v3 = v2;
  if (*(void *)(a1 + 32)) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
  }
  [v2 setObject:v4 forKey:*(void *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 80))
  {
    id v5 = [WeakRetained fullyGeneratedButtonItems];
    [v5 addObject:*(void *)(a1 + 40)];
  }
  [WeakRetained updateCompletionHandlerWithSFButtonItems:*(void *)(a1 + 48) maxButtonItems:*(void *)(a1 + 72) shouldReverseButtonOrder:*(unsigned __int8 *)(a1 + 81) completion:*(void *)(a1 + 56)];
}

- (void)updateCompletionHandlerWithSFButtonItems:(id)a3 maxButtonItems:(unint64_t)a4 shouldReverseButtonOrder:(BOOL)a5 completion:(id)a6
{
  BOOL v43 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, void *, uint64_t))a6;
  id v11 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        char v18 = [(SearchUIButtonItemFactory *)self fetchedCommandButtonItemsForButtons];
        id v19 = [v18 objectForKey:v17];

        if ([v19 count]) {
          [v11 addObjectsFromArray:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v14);
  }

  if (a4 && [v11 count] > a4)
  {
    id v20 = objc_opt_new();
    unint64_t v21 = a4 - [(SearchUIButtonItemFactory *)self countMoreButtonTowardsMaxCount];
    for (unint64_t j = v21 - (v21 == [v11 count] - 1); j < objc_msgSend(v11, "count"); ++j)
    {
      long long v23 = [v11 objectAtIndexedSubscript:j];
      [v20 addObject:v23];
    }
    [v11 removeObjectsInArray:v20];
    long long v24 = objc_opt_new();
    [v24 setSymbolName:@"ellipsis"];
    [v24 setIsTemplate:1];
    long long v25 = [[SearchUIButtonItem alloc] initWithSFButtonItem:0];
    [(SearchUIButtonItem *)v25 setImage:v24];
    [(SearchUIButtonItem *)v25 setPreviewButtonItems:v20];
    [(SearchUIButtonItem *)v25 setIsOverflowButton:1];
    [v11 addObject:v25];
  }
  if (v43)
  {
    long long v26 = [v11 reverseObjectEnumerator];
    BOOL v27 = [v26 allObjects];
    uint64_t v28 = [v27 mutableCopy];

    id v11 = (void *)v28;
  }
  v29 = [(SearchUIButtonItemFactory *)self startTime];
  [v29 timeIntervalSinceNow];
  double v31 = v30;
  [(SearchUIButtonItemFactory *)self timeLimitForSubsequentButtonGeneratorUpdates];
  double v33 = v32;

  v34 = [(SearchUIButtonItemFactory *)self fetchedCommandButtonItemsForButtons];
  uint64_t v35 = [v34 count];
  uint64_t v36 = [v12 count];

  v37 = [(SearchUIButtonItemFactory *)self fullyGeneratedButtonItems];
  uint64_t v38 = [v37 count];
  uint64_t v39 = [v12 count];

  BOOL v41 = v33 < -v31 && v35 == v36;
  uint64_t v42 = v38 == v39 || v41;
  v10[2](v10, v11, v42);
}

- (SearchUIButtonItemGeneratorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIButtonItemGeneratorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (double)timeLimitForSubsequentButtonGeneratorUpdates
{
  return self->_timeLimitForSubsequentButtonGeneratorUpdates;
}

- (void)setTimeLimitForSubsequentButtonGeneratorUpdates:(double)a3
{
  self->_timeLimitForSubsequentButtonGeneratorUpdates = a3;
}

- (BOOL)countMoreButtonTowardsMaxCount
{
  return self->_countMoreButtonTowardsMaxCount;
}

- (void)setCountMoreButtonTowardsMaxCount:(BOOL)a3
{
  self->_countMoreButtonTowardsMaxCount = a3;
}

- (NSMapTable)fetchedCommandButtonItemsForButtons
{
  return self->_fetchedCommandButtonItemsForButtons;
}

- (void)setFetchedCommandButtonItemsForButtons:(id)a3
{
}

- (NSMutableArray)buttonItemGenerators
{
  return self->_buttonItemGenerators;
}

- (void)setButtonItemGenerators:(id)a3
{
}

- (NSMutableSet)fullyGeneratedButtonItems
{
  return self->_fullyGeneratedButtonItems;
}

- (void)setFullyGeneratedButtonItems:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_fullyGeneratedButtonItems, 0);
  objc_storeStrong((id *)&self->_buttonItemGenerators, 0);
  objc_storeStrong((id *)&self->_fetchedCommandButtonItemsForButtons, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end