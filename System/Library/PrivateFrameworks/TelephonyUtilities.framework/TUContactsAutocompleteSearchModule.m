@interface TUContactsAutocompleteSearchModule
- (BOOL)isCancelled;
- (BOOL)isSearchComplete;
- (CNAutocompleteCancelable)fetchRequest;
- (CNAutocompleteStore)autocompleteStore;
- (OS_dispatch_queue)queue;
- (TUAutocompleteResultPartitioner)autocompleteResultPartitioner;
- (TUContactsAutocompleteSearchModule)init;
- (TUSearchController)searchController;
- (TUSearchResults)searchResults;
- (id)completion;
- (void)_cleanup;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)cancelSearch;
- (void)dealloc;
- (void)searchForString:(id)a3 completion:(id)a4;
- (void)setAutocompleteResultPartitioner:(id)a3;
- (void)setAutocompleteStore:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSearchComplete:(BOOL)a3;
- (void)setSearchController:(id)a3;
@end

@implementation TUContactsAutocompleteSearchModule

- (TUContactsAutocompleteSearchModule)init
{
  v9.receiver = self;
  v9.super_class = (Class)TUContactsAutocompleteSearchModule;
  v2 = [(TUContactsAutocompleteSearchModule *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(TUAutocompleteResultPartitioner);
    autocompleteResultPartitioner = v2->_autocompleteResultPartitioner;
    v2->_autocompleteResultPartitioner = v3;

    v5 = [(TUContactsAutocompleteSearchModule *)v2 searchController];
    [(TUAutocompleteResultPartitioner *)v2->_autocompleteResultPartitioner setSearchController:v5];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.telephonyutilities.autocompletesearchmodule", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)dealloc
{
  [(TUContactsAutocompleteSearchModule *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)TUContactsAutocompleteSearchModule;
  [(TUContactsAutocompleteSearchModule *)&v3 dealloc];
}

- (void)_cleanup
{
  id v2 = [(TUContactsAutocompleteSearchModule *)self fetchRequest];
  [v2 cancel];
}

- (void)searchForString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TUContactsAutocompleteSearchModule *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__TUContactsAutocompleteSearchModule_searchForString_completion___block_invoke;
  block[3] = &unk_1E58E7140;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __65__TUContactsAutocompleteSearchModule_searchForString_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanup];
  [*(id *)(a1 + 32) setCompletion:*(void *)(a1 + 48)];
  id v2 = (void *)CUTWeakLinkClass();
  uint64_t v3 = CUTWeakLinkClass();
  uint64_t v4 = CUTWeakLinkClass();
  if (v2 && v3 && (v5 = (objc_class *)v4) != 0)
  {
    id v6 = [v2 request];
    [v6 setSearchString:*(void *)(a1 + 40)];
    [v6 setSearchType:2];
    [v6 setIncludeContacts:1];
    [v6 setIncludeRecents:0];
    [v6 setIncludeSuggestions:1];
    [v6 setIncludePredictions:1];
    [v6 setIncludeDirectoryServers:0];
    [v6 setIncludeCalendarServers:0];
    id v7 = objc_opt_new();
    if (kAppIDShareBear_block_invoke__pred_IMPreferredAccountForServiceIMCore != -1) {
      dispatch_once(&kAppIDShareBear_block_invoke__pred_IMPreferredAccountForServiceIMCore, &__block_literal_global_53);
    }
    v8 = (void *)CUTWeakLinkClass();
    id v9 = (void (*)(void))kAppIDShareBear_block_invoke__IMPreferredAccountForService;
    id v10 = [v8 facetimeService];
    v11 = v9();

    if (v11)
    {
      id v12 = [v11 uniqueID];
      [v7 setSendingAddressAccountIdentifier:v12];
    }
    [v6 setFetchContext:v7];
    id v13 = (void *)[[v5 alloc] initWithDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setAutocompleteStore:v13];

    v14 = TUDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "Requesting fetch from CNAutocompleteStore", buf, 2u);
    }

    v15 = [*(id *)(a1 + 32) autocompleteStore];
    v16 = [v15 scheduleFetchRequest:v6];
    [*(id *)(a1 + 32) setFetchRequest:v16];
  }
  else
  {
    v17 = [*(id *)(a1 + 32) completion];

    if (v17)
    {
      id v18 = [*(id *)(a1 + 32) completion];
      (*((void (**)(id, void, void))v18 + 2))(v18, *(void *)(a1 + 32), 0);
    }
  }
}

void *__65__TUContactsAutocompleteSearchModule_searchForString_completion___block_invoke_2()
{
  result = (void *)CUTWeakLinkSymbol();
  kAppIDShareBear_block_invoke__IMPreferredAccountForService = result;
  return result;
}

- (void)cancelSearch
{
  uint64_t v3 = [(TUContactsAutocompleteSearchModule *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__TUContactsAutocompleteSearchModule_cancelSearch__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__TUContactsAutocompleteSearchModule_cancelSearch__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCancelled:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 _cleanup];
}

- (TUSearchResults)searchResults
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  uint64_t v3 = [(TUContactsAutocompleteSearchModule *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__TUContactsAutocompleteSearchModule_searchResults__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUSearchResults *)v4;
}

void __51__TUContactsAutocompleteSearchModule_searchResults__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) autocompleteResultPartitioner];
  uint64_t v2 = [v5 searchResults];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TUContactsAutocompleteSearchModule *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TUContactsAutocompleteSearchModule_autocompleteFetch_didReceiveResults___block_invoke;
  block[3] = &unk_1E58E6258;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __74__TUContactsAutocompleteSearchModule_autocompleteFetch_didReceiveResults___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "autocompleteFetch:didReceiveResults:", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v3 = TUDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      id v5 = [*(id *)(a1 + 32) fetchRequest];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v4;
      __int16 v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "[WARN] ZOMBIE FETCH %@ did receive results but current search is %@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) autocompleteResultPartitioner];

    if (!v6)
    {
      id v7 = objc_alloc_init(TUAutocompleteResultPartitioner);
      [*(id *)(a1 + 32) setAutocompleteResultPartitioner:v7];

      v8 = [*(id *)(a1 + 32) searchController];
      id v9 = [*(id *)(a1 + 32) autocompleteResultPartitioner];
      [v9 setSearchController:v8];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v3 = *(id *)(a1 + 40);
    uint64_t v10 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v3);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
          v15 = objc_msgSend(*(id *)(a1 + 32), "autocompleteResultPartitioner", (void)v16);
          [v15 addResult:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }
  }
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(TUContactsAutocompleteSearchModule *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke;
  v8[3] = &unk_1E58E5C08;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke_cold_1(a1, v2);
  }

  uint64_t result = [*(id *)(a1 + 40) isCancelled];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 40) setSearchComplete:1];
    uint64_t v4 = [*(id *)(a1 + 40) completion];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) completion];
      v5[2](v5, *(void *)(a1 + 40), 0);
    }
    return [*(id *)(a1 + 40) _cleanup];
  }
  return result;
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  uint64_t v4 = [(TUContactsAutocompleteSearchModule *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__TUContactsAutocompleteSearchModule_autocompleteFetchDidFinish___block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __65__TUContactsAutocompleteSearchModule_autocompleteFetchDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "autocompleteFetchDidFinish:", v5, 2u);
  }

  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    [*(id *)(a1 + 32) setSearchComplete:1];
    uint64_t v3 = [*(id *)(a1 + 32) completion];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) completion];
      v4[2](v4, *(void *)(a1 + 32), 1);
    }
  }
}

- (TUSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (TUSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (CNAutocompleteStore)autocompleteStore
{
  return self->_autocompleteStore;
}

- (void)setAutocompleteStore:(id)a3
{
}

- (CNAutocompleteCancelable)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (TUAutocompleteResultPartitioner)autocompleteResultPartitioner
{
  return self->_autocompleteResultPartitioner;
}

- (void)setAutocompleteResultPartitioner:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (BOOL)isSearchComplete
{
  return self->_searchComplete;
}

- (void)setSearchComplete:(BOOL)a3
{
  self->_searchComplete = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_autocompleteResultPartitioner, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_autocompleteStore, 0);

  objc_destroyWeak((id *)&self->_searchController);
}

void __73__TUContactsAutocompleteSearchModule_autocompleteFetch_didFailWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "autocompleteFetch:didFailWithError: %@", (uint8_t *)&v3, 0xCu);
}

@end