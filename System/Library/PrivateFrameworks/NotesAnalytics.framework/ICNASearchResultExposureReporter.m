@interface ICNASearchResultExposureReporter
- (ICNAEventReporter)eventReporter;
- (ICNASearchResultExposureReporter)initWithWindow:(id)a3;
- (NSMutableArray)searchResultExposureItems;
- (NSString)searchSessionID;
- (OS_dispatch_queue)isolationQueue;
- (UIWindow)window;
- (id)_exposureDataThreadUnsafe;
- (void)analyticsSessionWillEnd:(id)a3;
- (void)dealloc;
- (void)eventReporterLostSession:(id)a3;
- (void)invalidateSearchSessionID;
- (void)setEventReporter:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setSearchResultExposureItems:(id)a3;
- (void)setSearchSessionID:(id)a3;
- (void)setWindow:(id)a3;
- (void)startTrackingNewSearchString:(id)a3;
- (void)submitEventIfApplicable;
- (void)updateSearchResultWasSelected:(BOOL)a3;
- (void)updateSearchSessionID:(id)a3;
- (void)updateWithTopHitResultCount:(unint64_t)a3 nonTopHitResultCount:(unint64_t)a4 attachmentSectionCount:(unint64_t)a5;
@end

@implementation ICNASearchResultExposureReporter

- (ICNASearchResultExposureReporter)initWithWindow:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICNASearchResultExposureReporter;
  v5 = [(ICNASearchResultExposureReporter *)&v13 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.notes.analytics.searchResultExposureReporter", v6);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_window, v4);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    searchResultExposureItems = v5->_searchResultExposureItems;
    v5->_searchResultExposureItems = v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v5 selector:sel_analyticsSessionWillEnd_ name:@"ICNASessionWillEndNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNASearchResultExposureReporter;
  [(ICNASearchResultExposureReporter *)&v4 dealloc];
}

- (void)updateSearchSessionID:(id)a3
{
  id v4 = a3;
  v5 = [(ICNASearchResultExposureReporter *)self isolationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICNASearchResultExposureReporter_updateSearchSessionID___block_invoke;
  v7[3] = &unk_1E64B8A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __58__ICNASearchResultExposureReporter_updateSearchSessionID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSearchSessionID:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) searchResultExposureItems];
  [v2 removeAllObjects];
}

- (void)invalidateSearchSessionID
{
  v3 = [(ICNASearchResultExposureReporter *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICNASearchResultExposureReporter_invalidateSearchSessionID__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

void __61__ICNASearchResultExposureReporter_invalidateSearchSessionID__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSearchSessionID:0];
  id v2 = [*(id *)(a1 + 32) searchResultExposureItems];
  [v2 removeAllObjects];
}

- (void)startTrackingNewSearchString:(id)a3
{
  id v4 = a3;
  v5 = [(ICNASearchResultExposureReporter *)self isolationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__ICNASearchResultExposureReporter_startTrackingNewSearchString___block_invoke;
  v7[3] = &unk_1E64B8A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __65__ICNASearchResultExposureReporter_startTrackingNewSearchString___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchSessionID];
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) searchResultExposureItems];
    v5 = [v4 lastObject];
    id v6 = [v5 searchString];
    char v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

    if ((v7 & 1) == 0)
    {
      id v9 = [*(id *)(a1 + 32) searchResultExposureItems];
      id v8 = [[ICNASearchResultExposureItem alloc] initWithSearchString:*(void *)(a1 + 40)];
      [v9 addObject:v8];
    }
  }
}

- (void)updateWithTopHitResultCount:(unint64_t)a3 nonTopHitResultCount:(unint64_t)a4 attachmentSectionCount:(unint64_t)a5
{
  id v9 = [(ICNASearchResultExposureReporter *)self isolationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__ICNASearchResultExposureReporter_updateWithTopHitResultCount_nonTopHitResultCount_attachmentSectionCount___block_invoke;
  v10[3] = &unk_1E64B8DA8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_barrier_async(v9, v10);
}

void __108__ICNASearchResultExposureReporter_updateWithTopHitResultCount_nonTopHitResultCount_attachmentSectionCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchSessionID];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) searchResultExposureItems];
    id v4 = [v3 lastObject];

    [v4 updateWithTopHitResultCount:*(void *)(a1 + 40) nonTopHitResultCount:*(void *)(a1 + 48) attachmentSectionCount:*(void *)(a1 + 56)];
  }
}

- (void)updateSearchResultWasSelected:(BOOL)a3
{
  v5 = [(ICNASearchResultExposureReporter *)self isolationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__ICNASearchResultExposureReporter_updateSearchResultWasSelected___block_invoke;
  v6[3] = &unk_1E64B8DD0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

void __66__ICNASearchResultExposureReporter_updateSearchResultWasSelected___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchSessionID];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) searchResultExposureItems];
    id v4 = [v3 lastObject];

    [v4 setSearchResultWasSelected:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)submitEventIfApplicable
{
  v3 = [(ICNASearchResultExposureReporter *)self isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICNASearchResultExposureReporter_submitEventIfApplicable__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__ICNASearchResultExposureReporter_submitEventIfApplicable__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchSessionID];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) _exposureDataThreadUnsafe];
    v3 = [*(id *)(a1 + 32) eventReporter];
    id v4 = [*(id *)(a1 + 32) searchSessionID];
    [v3 submitSearchResultExposureSummaryEventWithSearchResultExposureData:v5 searchSessionID:v4];
  }
}

- (id)_exposureDataThreadUnsafe
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(ICNASearchResultExposureReporter *)self searchResultExposureItems];
  uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v34)
  {
    char v31 = 0;
    unint64_t v32 = 0;
    unint64_t v3 = 0;
    uint64_t v29 = *(void *)v37;
    unint64_t v30 = 0;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v6 = [v5 searchString];
        unint64_t v7 = [v6 length];
        uint64_t v8 = [v6 length];
        uint64_t v9 = v8;
        if (v7 <= v3)
        {
          unint64_t v35 = v3;
          if (v8 == v3)
          {
            unint64_t v10 = [v5 topHitResultCount];
            unint64_t v11 = v30;
            if (v30 <= v10) {
              unint64_t v11 = v10;
            }
            unint64_t v30 = v11;
            unint64_t v12 = [v5 attachmentSectionCount];
            unint64_t v13 = v32;
            if (v32 <= v12) {
              unint64_t v13 = v12;
            }
            unint64_t v32 = v13;
            v31 |= [v5 nonTopHitResultCount] != 0;
          }
        }
        else
        {
          unint64_t v30 = [v5 topHitResultCount];
          unint64_t v32 = [v5 attachmentSectionCount];
          char v31 = [v5 nonTopHitResultCount] != 0;
          unint64_t v35 = v9;
        }
        v14 = [ICASSearchBufferArrayData alloc];
        v15 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v6, "length")));
        v16 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v5, "topHitResultCount")));
        v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "nonTopHitResultCount") != 0);
        v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "searchResultWasSelected"));
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v5, "nonTopHitResultCount")));
        v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "attachmentSectionCount"));
        v21 = [(ICASSearchBufferArrayData *)v14 initWithSearchStringLength:v15 topHitCount:v16 nonTopHitCount:v17 isResultSelected:v18 nonTopHitRawCount:v19 attachmentHitCount:v20];

        objc_msgSend(v33, "ic_addNonNilObject:", v21);
        unint64_t v3 = v35;
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v34);
  }
  else
  {
    char v31 = 0;
    unint64_t v32 = 0;
    unint64_t v30 = 0;
  }

  v22 = [ICASSearchResultExposureData alloc];
  v23 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v30)];
  v24 = [NSNumber numberWithBool:v31 & 1];
  v25 = [NSNumber numberWithUnsignedInteger:v32];
  v26 = [(ICASSearchResultExposureData *)v22 initWithTopHitCountForLongestSearchString:v23 hasNonTopHitResultsForLongestSearchString:v24 attachmentHitCountForLongestSearchString:v25 searchBufferArray:v33];

  return v26;
}

- (void)analyticsSessionWillEnd:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];

  id v6 = ICDynamicCast();

  unint64_t v7 = [v6 session];
  uint64_t v8 = [v7 persistentIdentifier];
  uint64_t v9 = [(ICNASearchResultExposureReporter *)self window];
  unint64_t v10 = [v9 windowScene];
  unint64_t v11 = [v10 session];
  unint64_t v12 = [v11 persistentIdentifier];
  int v13 = [v8 isEqual:v12];

  if (v13)
  {
    v14 = +[ICNAController sharedController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke;
    v15[3] = &unk_1E64B8A48;
    v15[4] = self;
    [v14 performOnInstrumentationQueueWaitUntilDone:0 block:v15];
  }
}

void __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) isolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke_62;
  block[3] = &unk_1E64B8DF8;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v12;
  dispatch_sync(v2, block);

  if (v13[5])
  {
    unint64_t v3 = [ICASSearchData alloc];
    id v4 = [*(id *)(a1 + 32) searchSessionID];
    id v5 = [(ICASSearchData *)v3 initWithSearchSessionID:v4];

    id v6 = +[ICNAController sharedController];
    uint64_t v7 = objc_opt_class();
    v18[0] = v13[5];
    v18[1] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v9 = [*(id *)(a1 + 32) eventReporter];
    unint64_t v10 = [v9 subTracker];
    [v6 _immediatelySubmitEventOfType:v7 pushThenPopDataObjects:v8 subTracker:v10];
  }
  _Block_object_dispose(&v12, 8);
}

void __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke_62(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) searchSessionID];

  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _exposureDataThreadUnsafe];
    MEMORY[0x1F41817F8]();
  }
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAOptedInObject isOptedInForAnalytics])
  {
    unint64_t v3 = [ICNAEventReporter alloc];
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [(ICNASearchResultExposureReporter *)self window];
    uint64_t v7 = [(ICNAEventReporter *)v3 initWithSubTrackerName:v5 window:v6];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel_eventReporterLostSession_ name:@"ICNAEventReporterLostSessionNotification" object:self->_eventReporter];
  }
  unint64_t v10 = self->_eventReporter;
  return v10;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = [v5 object];

  [v7 removeObserver:self name:@"ICNAEventReporterLostSessionNotification" object:v6];
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (NSString)searchSessionID
{
  return self->_searchSessionID;
}

- (void)setSearchSessionID:(id)a3
{
}

- (NSMutableArray)searchResultExposureItems
{
  return self->_searchResultExposureItems;
}

- (void)setSearchResultExposureItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultExposureItems, 0);
  objc_storeStrong((id *)&self->_searchSessionID, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end