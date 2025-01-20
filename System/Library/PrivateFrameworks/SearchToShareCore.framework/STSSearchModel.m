@interface STSSearchModel
+ (id)serverURLString;
+ (unint64_t)clientQueryId;
+ (void)incrementClientQueryId;
- (NSArray)categoryList;
- (NSArray)predictedSuggestions;
- (NSArray)querySuggestions;
- (NSArray)recentResults;
- (NSArray)searchResults;
- (NSArray)sections;
- (NSMutableArray)recentsToDedup;
- (NSMutableDictionary)reportConcernStore;
- (NSMutableDictionary)searchResultStore;
- (NSMutableDictionary)zkwResultStore;
- (NSString)conversationID;
- (NSString)currentQuery;
- (OS_dispatch_queue)mutableSectionsQueue;
- (OS_dispatch_queue)queryQueue;
- (PARSession)parsecSession;
- (PARTask)currentTask;
- (STSRecentsDelegate)recentsDelegate;
- (STSSearchModel)init;
- (STSSearchModelDelegate)delegate;
- (STSSearchModelQuerySuggestionsDelegate)querySuggestionsDelegate;
- (id)createQuerySession;
- (id)defaultCategoryList;
- (id)mockQuerySuggestions;
- (id)removeOutdatedReportedResults:(id)a3;
- (id)resultsWithReportedImagesRemoved:(id)a3;
- (unint64_t)categoryListRequestQueryId;
- (unint64_t)numberOfReportedResults;
- (void)_clearQuerySuggestionsAndNotifyDelegate;
- (void)_clearSectionsAndNotifyDelegate;
- (void)_performParsecdSearchQuery:(id)a3 requestType:(int64_t)a4 completion:(id)a5;
- (void)_updateSearchProviderImageForResult:(id)a3;
- (void)addSearchResultToReportConcernStore:(id)a3;
- (void)appendQueryItemsForRequest:(id)a3 type:(int64_t)a4;
- (void)fetchMoreResults;
- (void)loadReportConcernStoreFromDefaults;
- (void)performCategoryListRequest:(id)a3;
- (void)performSearchWithQueryString:(id)a3 requestType:(int64_t)a4 completion:(id)a5;
- (void)performZKWSearchQueryWithCompletion:(id)a3;
- (void)prefetchRecentsWithCompletion:(id)a3;
- (void)removeQuerySuggestions;
- (void)removeResultAtIndexPath:(id)a3;
- (void)saveReportConcernStoreToUserDefaults;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
- (void)setCategoryList:(id)a3;
- (void)setCategoryListRequestQueryId:(unint64_t)a3;
- (void)setConversationID:(id)a3;
- (void)setCurrentTask:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMutableSectionsQueue:(id)a3;
- (void)setParsecSession:(id)a3;
- (void)setPredictedSuggestions:(id)a3;
- (void)setQueryQueue:(id)a3;
- (void)setQuerySuggestions:(id)a3;
- (void)setQuerySuggestionsDelegate:(id)a3;
- (void)setRecentResults:(id)a3;
- (void)setRecentsDelegate:(id)a3;
- (void)setRecentsToDedup:(id)a3;
- (void)setReportConcernStore:(id)a3;
- (void)setSearchResultStore:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setSections:(id)a3;
- (void)setZkwResultStore:(id)a3;
@end

@implementation STSSearchModel

- (STSSearchModel)init
{
  v18.receiver = self;
  v18.super_class = (Class)STSSearchModel;
  v2 = [(STSSearchModel *)&v18 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    sections = v2->_sections;
    v2->_sections = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.messages.searchbrowser.sectionq", 0);
    mutableSectionsQueue = v2->_mutableSectionsQueue;
    v2->_mutableSectionsQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.messages.searchbrowser.queryq", MEMORY[0x263EF83A8]);
    queryQueue = v2->_queryQueue;
    v2->_queryQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    zkwResultStore = v2->_zkwResultStore;
    v2->_zkwResultStore = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    searchResultStore = v2->_searchResultStore;
    v2->_searchResultStore = v11;

    uint64_t v13 = [(STSSearchModel *)v2 defaultCategoryList];
    categoryList = v2->_categoryList;
    v2->_categoryList = (NSArray *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    recentsToDedup = v2->_recentsToDedup;
    v2->_recentsToDedup = v15;

    [(STSSearchModel *)v2 loadReportConcernStoreFromDefaults];
  }
  return v2;
}

- (void)fetchMoreResults
{
  v3 = [(NSArray *)self->_sections firstObject];
  uint64_t v4 = [v3 results];
  dispatch_queue_t v5 = (void *)v4;
  v6 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  v8 = [v7 lastObject];
  v9 = [v8 moreResults];

  if (v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __34__STSSearchModel_fetchMoreResults__block_invoke;
    v11[3] = &unk_264A05E18;
    v11[4] = self;
    [v9 loadSearchResultsWithCompletionHandler:v11];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchModel:self insertedResultsAtIndexPaths:0 removedResultsAtIndexPaths:0];
  }
}

void __34__STSSearchModel_fetchMoreResults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "More results loaded %@ results", (uint8_t *)&buf, 0xCu);
  }
  v21 = [*(id *)(*(void *)(a1 + 32) + 16) firstObject];
  if (v21)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_12;
    v30[3] = &unk_264A05DA0;
    v30[4] = &buf;
    [v3 enumerateObjectsUsingBlock:v30];
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = *(void **)(*(void *)(a1 + 32) + 152);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_2;
    v27[3] = &unk_264A05DC8;
    id v7 = v3;
    id v28 = v7;
    id v19 = v5;
    id v29 = v19;
    [v6 enumerateObjectsUsingBlock:v27];
    v20 = (void *)[v7 mutableCopy];
    [v20 removeObjectsInArray:v19];
    v8 = (void *)[v20 copy];

    v9 = [*(id *)(a1 + 32) resultsWithReportedImagesRemoved:v8];

    v10 = [v21 results];
    v11 = [v10 arrayByAddingObjectsFromArray:v9];
    v12 = [[STSSearchResultSection alloc] initWithResultsArray:v11];
    uint64_t v13 = [v10 count];
    v14 = [MEMORY[0x263EFF980] array];
    for (unint64_t i = v13; i < [v9 count] + v13; ++i)
    {
      v16 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:0];
      [v14 addObject:v16];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_4;
    block[3] = &unk_264A05DF0;
    block[4] = *(void *)(a1 + 32);
    v23 = v12;
    id v3 = v9;
    id v24 = v3;
    id v25 = v14;
    p_long long buf = &buf;
    id v17 = v14;
    objc_super v18 = v12;
    dispatch_async(MEMORY[0x263EF83A0], block);

    _Block_object_dispose(&buf, 8);
  }
}

void __34__STSSearchModel_fetchMoreResults__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 queryId])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 queryId];
    *a4 = 1;
  }
}

void __34__STSSearchModel_fetchMoreResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_3;
  v6[3] = &unk_264A05DC8;
  id v7 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __34__STSSearchModel_fetchMoreResults__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [*(id *)(a1 + 32) identifier];
  id v7 = [v9 identifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v9];
    *a4 = 1;
  }
}

void __34__STSSearchModel_fetchMoreResults__block_invoke_4(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v7[0] = a1[5];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v5 = +[STSFeedbackReporter sharedInstance];
  [v5 didLoadResults:a1[6] indexPaths:a1[7] queryId:*(void *)(*(void *)(a1[8] + 8) + 24)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  [WeakRetained searchModel:a1[4] insertedResultsAtIndexPaths:a1[7] removedResultsAtIndexPaths:0];
}

+ (id)serverURLString
{
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 stringForKey:@"TCServerURLKey"];

  if (![(__CFString *)v3 length])
  {

    uint64_t v3 = @"https://api.smoot.apple.com";
  }

  return v3;
}

- (id)createQuerySession
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"TCUseThirdParty"];

  uint64_t v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F08B98]) initWithMemoryCapacity:0 diskCapacity:104857600 diskPath:@"Search"];
  [v4 setURLCache:v5];

  [v4 setHTTPCookieStorage:0];
  [v4 setHTTPMaximumConnectionsPerHost:8];
  objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:", 10.0);
  objc_msgSend(v4, "set_allowsTCPFastOpen:", 1);
  objc_msgSend(v4, "set_allowsTLSSessionTickets:", 1);
  if (v3)
  {
    id v9 = @"User-Agent";
    v10[0] = @"Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13C75 Safari/601.1";
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v4 setHTTPAdditionalHeaders:v6];
  }
  id v7 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v4];

  return v7;
}

- (void)appendQueryItemsForRequest:(id)a3 type:(int64_t)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_opt_new();
  if ((unint64_t)a4 > 9) {
    id v7 = 0;
  }
  else {
    id v7 = off_264A06080[a4];
  }
  int v8 = [MEMORY[0x263F08BD0] queryItemWithName:@"qtype" value:v7];
  v10[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v6 addObjectsFromArray:v9];

  [v5 setQueryItems:v6];
}

- (void)performSearchWithQueryString:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(STSSearchModel *)self _clearSectionsAndNotifyDelegate];
  [(NSMutableArray *)self->_recentsToDedup removeAllObjects];
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_querySuggestionsDelegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_querySuggestionsDelegate);
      [v12 searchModelWillFetchQuerySuggestionsCompletions:self];
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke;
  v14[3] = &unk_264A05E90;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  [(STSSearchModel *)self _performParsecdSearchQuery:v8 requestType:a4 completion:v14];
}

void __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  v42[1] = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_cold_1((uint64_t)v11, (uint64_t)v13);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_69;
    block[3] = &unk_264A05E40;
    id v40 = *(id *)(a1 + 40);
    id v39 = v13;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v14 = v40;
  }
  else
  {
    id v15 = [v12 results];
    if (v15)
    {
      v16 = [v12 results];
    }
    else
    {
      v16 = (void *)MEMORY[0x263EFFA68];
    }

    if (a3 == 8 || (a3 & 0xFFFFFFFFFFFFFFFBLL) - 1 <= 2)
    {
      id v14 = [*(id *)(a1 + 32) resultsWithReportedImagesRemoved:v16];

      if ([v14 count])
      {
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_2;
        v33[3] = &unk_264A05E68;
        id v14 = v14;
        uint64_t v17 = *(void *)(a1 + 32);
        objc_super v18 = *(void **)(a1 + 40);
        id v34 = v14;
        uint64_t v35 = v17;
        uint64_t v37 = a4;
        id v36 = v18;
        dispatch_async(MEMORY[0x263EF83A0], v33);
      }
      else
      {
        id v19 = NSString;
        v20 = STSLocalizedString(@"ERROR_DESC_NO_RESULTS_FOR_QUERY");
        v21 = objc_msgSend(v19, "stringWithFormat:", v20, v11);

        uint64_t v41 = *MEMORY[0x263F08320];
        v42[0] = v21;
        v22 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
        v23 = [MEMORY[0x263F087E8] errorWithDomain:@"STSErrorDomain" code:2 userInfo:v22];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_3;
        v30[3] = &unk_264A05E40;
        id v24 = *(id *)(a1 + 40);
        id v31 = v23;
        id v32 = v24;
        id v25 = v23;
        dispatch_async(MEMORY[0x263EF83A0], v30);
      }
    }
    else
    {
      if (!a3)
      {
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_4;
        v26[3] = &unk_264A05E68;
        v26[4] = *(void *)(a1 + 32);
        id v27 = v12;
        uint64_t v29 = a4;
        id v28 = *(id *)(a1 + 40);
        dispatch_async(MEMORY[0x263EF83A0], v26);
      }
      id v14 = v16;
    }
  }
}

uint64_t __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_2(uint64_t a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[STSImageCache sharedCache];
  int v3 = [v2 searchProviderImage];

  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) firstObject];
    [*(id *)(a1 + 40) _updateSearchProviderImageForResult:v4];
  }
  id v5 = [[STSSearchResultSection alloc] initWithResultsArray:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x263EFF980] array];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [MEMORY[0x263F088C8] indexPathForRow:v7 inSection:0];
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < [*(id *)(a1 + 32) count]);
  }
  id v9 = [*(id *)(*(void *)(a1 + 40) + 16) firstObject];
  v10 = [v9 results];
  uint64_t v11 = [v10 count];
  unint64_t v12 = 0x263EFF000uLL;
  if (v11 > 0)
  {
    uint64_t v13 = v11;
    id v14 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != v13; ++i)
    {
      v16 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:0];
      [v14 addObject:v16];
    }
    uint64_t v17 = [STSSearchResultSection alloc];
    objc_super v18 = [(STSSearchResultSection *)v17 initWithResultsArray:MEMORY[0x263EFFA68]];
    v33[0] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    uint64_t v20 = *(void *)(a1 + 40);
    v21 = *(void **)(v20 + 16);
    *(void *)(v20 + 16) = v19;

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
      [v24 searchModel:*(void *)(a1 + 40) insertedResultsAtIndexPaths:0 removedResultsAtIndexPaths:v14];
    }
    unint64_t v12 = 0x263EFF000;
  }
  id v32 = v5;
  uint64_t v25 = [*(id *)(v12 + 2240) arrayWithObjects:&v32 count:1];
  uint64_t v26 = *(void *)(a1 + 40);
  id v27 = *(void **)(v26 + 16);
  *(void *)(v26 + 16) = v25;

  id v28 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    v30 = +[STSFeedbackReporter sharedInstance];
    [v30 didLoadResults:*(void *)(a1 + 32) indexPaths:v6 queryId:*(void *)(a1 + 56)];

    id v31 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [v31 searchModel:*(void *)(a1 + 40) insertedResultsAtIndexPaths:v6 removedResultsAtIndexPaths:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) suggestions];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v8 searchModelUpdatedQuerySuggestions:*(void *)(a1 + 32)];

    id v9 = +[STSFeedbackReporter sharedInstance];
    v10 = [*(id *)(a1 + 40) suggestions];
    [v9 didShowQuerySuggestions:v10 queryId:*(void *)(a1 + 56)];
  }
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v11();
}

- (void)prefetchRecentsWithCompletion:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(void))a3;
  if ([(NSArray *)self->_recentResults count])
  {
    id v24 = v4;
    id v5 = dispatch_group_create();
    uint64_t v26 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v6 setRequestCachePolicy:1];
    [v6 setURLCache:0];
    char v23 = v6;
    char v7 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v6];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v22 = self;
    obj = self->_recentResults;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v39;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(obj);
          }
          unint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
          dispatch_group_enter(v5);
          uint64_t v13 = [v12 thumbnail];
          id v14 = [v13 urlValue];
          id v15 = [MEMORY[0x263F089E0] requestWithURL:v14];
          [v15 setHTTPMethod:@"HEAD"];
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          void v33[2] = __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke;
          v33[3] = &unk_264A05EB8;
          id v34 = v26;
          uint64_t v35 = v12;
          id v36 = v14;
          uint64_t v37 = v5;
          id v16 = v14;
          uint64_t v17 = [v7 dataTaskWithRequest:v15 completionHandler:v33];
          [v17 resume];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v9);
    }

    objc_super v18 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_86;
    block[3] = &unk_264A05EE0;
    id v28 = v5;
    id v29 = v7;
    v30 = v22;
    id v31 = v26;
    uint64_t v4 = v24;
    id v32 = v24;
    id v19 = v26;
    id v20 = v7;
    v21 = v5;
    dispatch_async(v18, block);
  }
  else
  {
    v4[2](v4);
  }
}

void __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 statusCode];
  if (!a4 || v6 == 200)
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138412290;
      uint64_t v12 = v10;
      uint64_t v8 = &_os_log_internal;
      uint64_t v9 = "successfully downloaded header for image %@, adding to recents";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    int v11 = 138412290;
    uint64_t v12 = v7;
    uint64_t v8 = &_os_log_internal;
    uint64_t v9 = "failed to download header for image %@, removing from to recents";
LABEL_7:
    _os_log_impl(&dword_22F3DE000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_86(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v2, v3);
  [*(id *)(a1 + 40) invalidateAndCancel];
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 80), *(id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  id v5 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_2;
  block[3] = &unk_264A053F0;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async(v5, block);
}

void __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained updateRecentResults:*(void *)(*(void *)(a1 + 32) + 80)];
}

- (void)performZKWSearchQueryWithCompletion:(id)a3
{
  id v4 = a3;
  [(STSSearchModel *)self _clearSectionsAndNotifyDelegate];
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke;
  v13[3] = &unk_264A053F0;
  uint64_t v6 = v5;
  id v14 = v6;
  [(STSSearchModel *)self prefetchRecentsWithCompletion:v13];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2;
  v9[3] = &unk_264A05F58;
  int v11 = self;
  id v12 = v4;
  uint64_t v10 = v6;
  id v7 = v4;
  uint64_t v8 = v6;
  [(STSSearchModel *)self _performParsecdSearchQuery:&stru_26E2ACAA8 requestType:4 completion:v9];
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke(uint64_t a1)
{
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a2;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = *(NSObject **)(a1 + 32);
  dispatch_time_t v14 = dispatch_time(0, 11000000000);
  dispatch_group_wait(v13, v14);
  if (v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_cold_1((uint64_t)v12);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_90;
    block[3] = &unk_264A05E40;
    id v15 = &v27;
    id v27 = *(id *)(a1 + 48);
    id v26 = v12;
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v16 = v26;
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_91;
    v20[3] = &unk_264A05F30;
    id v15 = (id *)v21;
    id v17 = v11;
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = *(void **)(a1 + 48);
    v21[0] = v17;
    v21[1] = v18;
    uint64_t v24 = a4;
    id v23 = v19;
    id v22 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v20);

    id v16 = v23;
  }
}

uint64_t __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_91(uint64_t a1)
{
  v52[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) results];
  if (v2)
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) results];
  }
  else
  {
    dispatch_time_t v3 = (void *)MEMORY[0x263EFFA68];
  }

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = *(void *)(a1 + 40);
  v44 = v4;
  if (*(void *)(v5 + 80))
  {
    uint64_t v6 = v4;
    [*(id *)(v5 + 152) removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 152) addObjectsFromArray:*(void *)(*(void *)(a1 + 40) + 80)];
    id v7 = *(void **)(*(void *)(a1 + 40) + 80);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_3;
    v45[3] = &unk_264A05F08;
    id v46 = v3;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 40);
    id v47 = v8;
    uint64_t v48 = v9;
    id v10 = v3;
    [v7 enumerateObjectsUsingBlock:v45];
    id v11 = (void *)[v10 mutableCopy];
    [v11 removeObjectsInArray:v8];
    dispatch_time_t v3 = [*(id *)(*(void *)(a1 + 40) + 80) arrayByAddingObjectsFromArray:v11];
  }
  uint64_t v43 = [[STSSearchResultSection alloc] initWithResultsArray:v3];
  id v12 = [MEMORY[0x263EFF980] array];
  if ([v3 count])
  {
    unint64_t v13 = 0;
    do
    {
      dispatch_time_t v14 = [MEMORY[0x263F088C8] indexPathForRow:v13 inSection:0];
      [v12 addObject:v14];

      ++v13;
    }
    while (v13 < [v3 count]);
  }
  v42 = [*(id *)(*(void *)(a1 + 40) + 16) firstObject];
  id v15 = [v42 results];
  uint64_t v16 = [v15 count];
  if (v16 > 0)
  {
    uint64_t v17 = v16;
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    for (uint64_t i = 0; i != v17; ++i)
    {
      id v20 = [MEMORY[0x263F088C8] indexPathForRow:i inSection:0];
      [v18 addObject:v20];
    }
    v21 = [STSSearchResultSection alloc];
    id v22 = [(STSSearchResultSection *)v21 initWithResultsArray:MEMORY[0x263EFFA68]];
    v52[0] = v22;
    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
    uint64_t v24 = *(void *)(a1 + 40);
    uint64_t v25 = *(void **)(v24 + 16);
    *(void *)(v24 + 16) = v23;

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    [WeakRetained searchModel:*(void *)(a1 + 40) insertedResultsAtIndexPaths:0 removedResultsAtIndexPaths:v18];
  }
  v51 = v43;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
  uint64_t v28 = *(void *)(a1 + 40);
  id v29 = *(void **)(v28 + 16);
  *(void *)(v28 + 16) = v27;

  v30 = +[STSFeedbackReporter sharedInstance];
  [v30 didLoadResults:v3 indexPaths:v12 queryId:*(void *)(a1 + 64)];

  id v31 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  [v31 searchModel:*(void *)(a1 + 40) insertedResultsAtIndexPaths:v12 removedResultsAtIndexPaths:0];

  if ([v3 count])
  {
    id v32 = +[STSImageCache sharedCache];
    uint64_t v33 = [v32 searchProviderImage];

    if (!v33)
    {
      id v34 = [v3 firstObject];
      [*(id *)(a1 + 40) _updateSearchProviderImageForResult:v34];
    }
    uint64_t v35 = *(void *)(a1 + 56);
    if (v35) {
      (*(void (**)(uint64_t, uint64_t, void))(v35 + 16))(v35, 1, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_91_cold_1();
    }
    id v36 = NSString;
    uint64_t v37 = STSLocalizedString(@"ERROR_DESC_NO_SUGGESTIONS_FOUND");
    long long v38 = objc_msgSend(v36, "stringWithFormat:", v37, *(void *)(a1 + 48));

    uint64_t v49 = *MEMORY[0x263F08320];
    v50 = v38;
    long long v39 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    long long v40 = [MEMORY[0x263F087E8] errorWithDomain:@"STSErrorDomain" code:2 userInfo:v39];
    uint64_t v41 = *(void *)(a1 + 56);
    if (v41) {
      (*(void (**)(uint64_t, void, void *))(v41 + 16))(v41, 0, v40);
    }
  }
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) firstObject];
  objc_msgSend(v3, "setQueryId:", objc_msgSend(v4, "queryId"));

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_4;
  v9[3] = &unk_264A05F08;
  id v10 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v3;
  [v5 enumerateObjectsUsingBlock:v9];
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [*(id *)(a1 + 32) identifier];
  uint64_t v7 = [v9 identifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v9];
    [*(id *)(*(void *)(a1 + 48) + 152) removeObject:*(void *)(a1 + 32)];
    *a4 = 1;
  }
}

- (void)_performParsecdSearchQuery:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = 22;
  switch(a4)
  {
    case 0:
      uint64_t v10 = 21;
      goto LABEL_8;
    case 1:
      goto LABEL_8;
    case 2:
    case 3:
    case 5:
    case 6:
      uint64_t v10 = 8;
      goto LABEL_8;
    case 4:
      +[STSSearchModel incrementClientQueryId];
      uint64_t v11 = objc_msgSend(MEMORY[0x263F36D80], "zeroKeywordRequest:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
      goto LABEL_9;
    case 7:
      uint64_t v10 = 9;
      goto LABEL_8;
    case 8:
      uint64_t v10 = 23;
      goto LABEL_8;
    default:
      uint64_t v10 = 0;
LABEL_8:
      +[STSSearchModel incrementClientQueryId];
      unint64_t v12 = +[STSSearchModel clientQueryId];
      uint64_t v11 = [MEMORY[0x263F36D60] searchRequestWithString:v8 triggerEvent:v10 queryId:v12];
LABEL_9:
      unint64_t v13 = (void *)v11;
      dispatch_time_t v14 = [MEMORY[0x263F82B60] mainScreen];
      [v14 scale];
      objc_msgSend(v13, "setScale:");

      id v15 = [MEMORY[0x263F828C0] sharedInputModeController];
      uint64_t v16 = [v15 currentInputMode];
      uint64_t v17 = [v16 identifierWithLayouts];
      [v13 setKeyboardInputMode:v17];

      [(STSSearchModel *)self appendQueryItemsForRequest:v13 type:a4];
      uint64_t v18 = [(STSSearchModel *)self parsecSession];
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      uint64_t v27 = __68__STSSearchModel__performParsecdSearchQuery_requestType_completion___block_invoke;
      uint64_t v28 = &unk_264A05F80;
      id v29 = self;
      id v31 = v9;
      id v19 = v8;
      id v30 = v19;
      int64_t v32 = a4;
      id v20 = v9;
      v21 = [v18 taskWithRequest:v13 completion:&v25];

      currentQuery = self->_currentQuery;
      self->_currentQuery = (NSString *)v19;
      id v23 = v19;

      -[STSSearchModel setCurrentTask:](self, "setCurrentTask:", v21, v25, v26, v27, v28, v29);
      uint64_t v24 = [(STSSearchModel *)self currentTask];
      [v24 resume];

      return;
  }
}

void __68__STSSearchModel__performParsecdSearchQuery_requestType_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  id v8 = (void *)a1[4];
  id v9 = a2;
  id v10 = [v8 currentTask];

  if (v10 == v9) {
    (*(void (**)(void, void, void, unint64_t, id, id))(a1[6] + 16))(a1[6], a1[5], a1[7], +[STSSearchModel clientQueryId], v11, v7);
  }
}

- (void)_updateSearchProviderImageForResult:(id)a3
{
  objc_msgSend(a3, "sts_searchProviderImage");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 loadImageDataWithCompletionHandler:&__block_literal_global_3];
}

void __54__STSSearchModel__updateSearchProviderImageForResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STSImageCache sharedCache];
    id v4 = [v3 searchProviderImage];

    if (!v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__STSSearchModel__updateSearchProviderImageForResult___block_invoke_2;
      block[3] = &unk_264A053F0;
      id v6 = v2;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __54__STSSearchModel__updateSearchProviderImageForResult___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F827E8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  id v7 = (id)objc_msgSend(v2, "initWithData:scale:", v3);

  uint64_t v5 = [v7 imageWithRenderingMode:2];
  id v6 = +[STSImageCache sharedCache];
  [v6 setSearchProviderImage:v5];
}

- (void)removeQuerySuggestions
{
  self->_querySuggestions = (NSArray *)MEMORY[0x263EFFA68];
  MEMORY[0x270F9A758]();
}

- (void)_clearSectionsAndNotifyDelegate
{
  id v7 = [(NSArray *)self->_sections firstObject];
  uint64_t v3 = [v7 results];
  id v4 = objc_msgSend(v3, "sts_map:", &__block_literal_global_105);

  sections = self->_sections;
  self->_sections = (NSArray *)MEMORY[0x263EFFA68];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchModel:self insertedResultsAtIndexPaths:0 removedResultsAtIndexPaths:v4];
}

uint64_t __49__STSSearchModel__clearSectionsAndNotifyDelegate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
}

- (void)_clearQuerySuggestionsAndNotifyDelegate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__STSSearchModel__clearQuerySuggestionsAndNotifyDelegate__block_invoke;
  block[3] = &unk_264A053F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__STSSearchModel__clearQuerySuggestionsAndNotifyDelegate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = MEMORY[0x263EFFA68];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v6 searchModelUpdatedQuerySuggestions:*(void *)(a1 + 32)];
  }
}

- (void)removeResultAtIndexPath:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  sections = self->_sections;
  id v5 = a3;
  id v6 = [(NSArray *)sections firstObject];
  id v7 = [v6 results];
  id v8 = (void *)[v7 mutableCopy];

  objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v5, "row"));
  [v6 setResults:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11[0] = v5;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  [WeakRetained searchModel:self insertedResultsAtIndexPaths:0 removedResultsAtIndexPaths:v10];
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "bag loaded", v5, 2u);
  }
}

- (id)mockQuerySuggestions
{
  if (mockQuerySuggestions_swap) {
    uint64_t v2 = &unk_26E2BAA38;
  }
  else {
    uint64_t v2 = &unk_26E2BAA20;
  }
  mockQuerySuggestions_swap ^= 1u;
  uint64_t v3 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __38__STSSearchModel_mockQuerySuggestions__block_invoke;
  v7[3] = &unk_264A05FE8;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateObjectsUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return v5;
}

void __38__STSSearchModel_mockQuerySuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)objc_opt_new();
  [v4 setSuggestion:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (PARSession)parsecSession
{
  parsecSession = self->_parsecSession;
  if (!parsecSession)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F36D70]) initWithId:@"Messages-searchToShare-session" userAgent:@"Messages/1.0"];
    [v4 setDontPreloadImages:1];
    id v5 = [MEMORY[0x263F36D68] sessionWithConfiguration:v4 delegate:self startImmediately:1];
    [v5 setDelegate:self];
    id v6 = self->_parsecSession;
    self->_parsecSession = (PARSession *)v5;

    parsecSession = self->_parsecSession;
  }

  return parsecSession;
}

- (void)performCategoryListRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[STSSearchModel clientQueryId];
  self->_categoryListRequestQueryId = v5;
  id v6 = [MEMORY[0x263F36D80] zeroKeywordRequest:v5];
  id v7 = [MEMORY[0x263F828C0] sharedInputModeController];
  id v8 = [v7 currentInputMode];
  id v9 = [v8 identifierWithLayouts];
  [v6 setKeyboardInputMode:v9];

  id v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 scale];
  objc_msgSend(v6, "setScale:");

  [(STSSearchModel *)self appendQueryItemsForRequest:v6 type:7];
  id v11 = [(STSSearchModel *)self parsecSession];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __45__STSSearchModel_performCategoryListRequest___block_invoke;
  uint64_t v17 = &unk_264A06010;
  uint64_t v18 = self;
  id v19 = v4;
  id v12 = v4;
  unint64_t v13 = [v11 taskWithRequest:v6 completion:&v14];

  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

void __45__STSSearchModel_performCategoryListRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v14 suggestions];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [v14 suggestions];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 72);
    *(void *)(v11 + 72) = v10;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);
  }
}

- (id)defaultCategoryList
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__STSSearchModel_defaultCategoryList__block_invoke;
  v6[3] = &unk_264A06038;
  id v7 = v2;
  id v3 = v2;
  [&unk_26E2BAA50 enumerateObjectsUsingBlock:v6];
  id v4 = (void *)[v3 copy];

  return v4;
}

void __37__STSSearchModel_defaultCategoryList__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F67A10];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithSuggestion:v4 query:&stru_26E2ACAA8 score:1 type:0.0];

  [*(id *)(a1 + 32) addObject:v5];
}

+ (unint64_t)clientQueryId
{
  return queryId;
}

+ (void)incrementClientQueryId
{
}

- (id)resultsWithReportedImagesRemoved:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __51__STSSearchModel_resultsWithReportedImagesRemoved___block_invoke;
  uint64_t v13 = &unk_264A05DC8;
  id v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __51__STSSearchModel_resultsWithReportedImagesRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 url];
  id v5 = [v4 absoluteString];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:v5];

  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Removed reported image from result set", v7, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)addSearchResultToReportConcernStore:(id)a3
{
  id v4 = [a3 url];
  id v7 = [v4 absoluteString];

  id v5 = [MEMORY[0x263EFF910] now];
  id v6 = [(NSMutableDictionary *)self->_reportConcernStore objectForKey:v7];
  if (v6 || ![v7 length])
  {
  }
  else if (v5)
  {
    [(NSMutableDictionary *)self->_reportConcernStore setObject:v5 forKey:v7];
  }
  [(STSSearchModel *)self saveReportConcernStoreToUserDefaults];
}

- (id)removeOutdatedReportedResults:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__STSSearchModel_removeOutdatedReportedResults___block_invoke;
  v8[3] = &unk_264A06060;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __48__STSSearchModel_removeOutdatedReportedResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  id v9 = [v7 components:16 fromDate:v8 toDate:v6 options:0];

  if ([v9 day] > -31)
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Removed expired reported image", v10, 2u);
  }
}

- (void)saveReportConcernStoreToUserDefaults
{
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = (void *)[(NSMutableDictionary *)self->_reportConcernStore copy];
  [v4 setObject:v3 forKey:@"STSReportConcernResults"];

  [v4 synchronize];
}

- (void)loadReportConcernStoreFromDefaults
{
  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v7 dictionaryForKey:@"STSReportConcernResults"];
  id v4 = [(STSSearchModel *)self removeOutdatedReportedResults:v3];
  id v5 = (NSMutableDictionary *)[v4 mutableCopy];
  reportConcernStore = self->_reportConcernStore;
  self->_reportConcernStore = v5;

  [(STSSearchModel *)self saveReportConcernStoreToUserDefaults];
}

- (unint64_t)numberOfReportedResults
{
  id v2 = [(NSMutableDictionary *)self->_reportConcernStore allKeys];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSString)currentQuery
{
  return self->_currentQuery;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)querySuggestions
{
  return self->_querySuggestions;
}

- (void)setQuerySuggestions:(id)a3
{
}

- (NSArray)predictedSuggestions
{
  return self->_predictedSuggestions;
}

- (void)setPredictedSuggestions:(id)a3
{
}

- (STSSearchModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSSearchModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STSRecentsDelegate)recentsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDelegate);

  return (STSRecentsDelegate *)WeakRetained;
}

- (void)setRecentsDelegate:(id)a3
{
}

- (STSSearchModelQuerySuggestionsDelegate)querySuggestionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_querySuggestionsDelegate);

  return (STSSearchModelQuerySuggestionsDelegate *)WeakRetained;
}

- (void)setQuerySuggestionsDelegate:(id)a3
{
}

- (void)setParsecSession:(id)a3
{
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
}

- (NSArray)recentResults
{
  return self->_recentResults;
}

- (void)setRecentResults:(id)a3
{
}

- (unint64_t)categoryListRequestQueryId
{
  return self->_categoryListRequestQueryId;
}

- (void)setCategoryListRequestQueryId:(unint64_t)a3
{
  self->_categoryListRequestQueryId = a3;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (PARTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (OS_dispatch_queue)mutableSectionsQueue
{
  return self->_mutableSectionsQueue;
}

- (void)setMutableSectionsQueue:(id)a3
{
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
}

- (NSMutableDictionary)zkwResultStore
{
  return self->_zkwResultStore;
}

- (void)setZkwResultStore:(id)a3
{
}

- (NSMutableDictionary)searchResultStore
{
  return self->_searchResultStore;
}

- (void)setSearchResultStore:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (NSMutableArray)recentsToDedup
{
  return self->_recentsToDedup;
}

- (void)setRecentsToDedup:(id)a3
{
}

- (NSMutableDictionary)reportConcernStore
{
  return self->_reportConcernStore;
}

- (void)setReportConcernStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernStore, 0);
  objc_storeStrong((id *)&self->_recentsToDedup, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchResultStore, 0);
  objc_storeStrong((id *)&self->_zkwResultStore, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_mutableSectionsQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_recentResults, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_parsecSession, 0);
  objc_destroyWeak((id *)&self->_querySuggestionsDelegate);
  objc_destroyWeak((id *)&self->_recentsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predictedSuggestions, 0);
  objc_storeStrong((id *)&self->_querySuggestions, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_currentQuery, 0);
}

void __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Search with query %@ failed: %@", (uint8_t *)&v2, 0x16u);
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ZKW search failed: %@", (uint8_t *)&v1, 0xCu);
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_91_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ZKW search returned 0 results", v0, 2u);
}

@end