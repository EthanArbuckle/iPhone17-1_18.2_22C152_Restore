@interface WBSSiriIntelligenceHistorySearch
- (void)dealloc;
- (void)findURLStringsForHistoryItemsContainingString:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSSiriIntelligenceHistorySearch

- (void)dealloc
{
  [(CSSearchQuery *)self->_searchQuery cancel];
  v3.receiver = self;
  v3.super_class = (Class)WBSSiriIntelligenceHistorySearch;
  [(WBSSiriIntelligenceHistorySearch *)&v3 dealloc];
}

- (void)findURLStringsForHistoryItemsContainingString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    searchQuery = self->_searchQuery;
    if (searchQuery)
    {
      [(CSSearchQuery *)searchQuery cancel];
      v9 = self->_searchQuery;
      self->_searchQuery = 0;
    }
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__21;
    v21[4] = __Block_byref_object_dispose__21;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v10 = [NSString stringWithFormat:@"textContent == \"%@*\"cd && contentType == \"%@\"", v6, *MEMORY[0x1E4F98920]];
    id v11 = objc_alloc_init(MEMORY[0x1E4F23830]);
    if (objc_opt_respondsToSelector()) {
      [v11 setPrivateQuery:1];
    }
    [v11 setFetchAttributes:&unk_1F0341F90];
    v12 = (CSSearchQuery *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v10 queryContext:v11];
    v13 = self->_searchQuery;
    self->_searchQuery = v12;

    objc_initWeak(&location, self->_searchQuery);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke;
    v18[3] = &unk_1E5E44578;
    objc_copyWeak(&v19, &location);
    v18[4] = v21;
    [(CSSearchQuery *)self->_searchQuery setFoundItemsHandler:v18];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_3;
    v14[3] = &unk_1E5E445A0;
    objc_copyWeak(&v17, &location);
    id v15 = v7;
    v16 = v21;
    [(CSSearchQuery *)self->_searchQuery setCompletionHandler:v14];
    [(CSSearchQuery *)self->_searchQuery start];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

    _Block_object_dispose(v21, 8);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v6);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_2;
    v7[3] = &unk_1E5E44550;
    v7[4] = *(void *)(a1 + 32);
    [v3 enumerateObjectsUsingBlock:v7];
    objc_sync_exit(v6);
  }
}

void __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 attributeSet];
  v4 = [v3 contentURL];
  id v6 = [v4 absoluteString];

  v5 = v6;
  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
    v5 = v6;
  }
}

void __100__WBSSiriIntelligenceHistorySearch_findURLStringsForHistoryItemsContainingString_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v7 || !WeakRetained || [WeakRetained isCancelled])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v4);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    objc_sync_exit(v4);
  }
}

- (void).cxx_destruct
{
}

@end