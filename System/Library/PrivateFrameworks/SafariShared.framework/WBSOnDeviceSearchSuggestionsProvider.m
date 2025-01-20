@interface WBSOnDeviceSearchSuggestionsProvider
- (BOOL)_findRootNodeForPrefix:(id)a3 rootNode:(_WBSSearchSuggestionCandidate *)a4;
- (WBSOnDeviceSearchSuggestionsProvider)init;
- (WBSOnDeviceSearchSuggestionsProviderDelegate)delegate;
- (id)_loadModel;
- (unint64_t)maximumNumberOfSuggestions;
- (void)_doSearch:(id)a3 atRootNode:(_WBSSearchSuggestionCandidate *)a4;
- (void)reloadModel;
- (void)setDelegate:(id)a3;
- (void)setMaximumNumberOfSuggestions:(unint64_t)a3;
- (void)setQueryString:(id)a3;
@end

@implementation WBSOnDeviceSearchSuggestionsProvider

- (WBSOnDeviceSearchSuggestionsProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSOnDeviceSearchSuggestionsProvider;
  v2 = [(WBSOnDeviceSearchSuggestionsProvider *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(WBSOnDeviceSearchSuggestionsProvider *)v2 reloadModel];
    v3->_maximumNumberOfSuggestions = 5;
    id v4 = [NSString stringWithFormat:@"com.apple.Safari.Shared.%@.%p", objc_opt_class(), v3];
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = (OS_dispatch_queue *)v5;

    v3->_prefixLock._os_unfair_lock_opaque = 0;
    v7 = v3;
  }

  return v3;
}

- (id)_loadModel
{
  v2 = +[WBSOnDeviceSearchSuggestionsModelManager sharedManager];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v2 fileURLForModelWithLocaleIfDownloaded:v3];
  dispatch_queue_t v5 = [v4 path];

  if (v5) {
    v6 = [[WBSOnDeviceSearchSuggestionsModel alloc] initWithModelFileAtPath:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)reloadModel
{
  v3 = [(WBSOnDeviceSearchSuggestionsProvider *)self _loadModel];
  searchModel = self->_searchModel;
  self->_searchModel = v3;
}

- (void)setQueryString:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_prefixLock);
  if ([(NSString *)self->_currentPrefix isEqualToString:v5])
  {
    os_unfair_lock_unlock(&self->_prefixLock);
  }
  else
  {
    objc_storeStrong((id *)&self->_currentPrefix, a3);
    completionQueue = self->_completionQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke;
    v7[3] = &unk_1E5C8D980;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(completionQueue, v7);
    os_unfair_lock_unlock(&self->_prefixLock);
  }
}

void __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if ([v2 isEqualToString:*(void *)(a1 + 40)] && objc_msgSend(v2, "length"))
  {
    uint64_t v8 = 0x200000000;
    char v9 = 0;
    v10 = &stru_1EFBE3CF8;
    if ([*(id *)(a1 + 32) _findRootNodeForPrefix:*(void *)(a1 + 40) rootNode:&v8])
    {
      [*(id *)(a1 + 32) _doSearch:*(void *)(a1 + 40) atRootNode:&v8];
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_3;
      v6[3] = &unk_1E5C8D980;
      id v5 = *(void **)(a1 + 40);
      v6[4] = *(void *)(a1 + 32);
      id v7 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v6);
    }
    id v4 = v10;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_2;
    block[3] = &unk_1E5C8D980;
    v3 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    v12 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v4 = v12;
  }
}

void __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained onDeviceSearchSuggestionProvider:*(void *)(a1 + 32) didFinishWithSuggestions:MEMORY[0x1E4F1CBF0] forQueryString:*(void *)(a1 + 40)];
}

void __55__WBSOnDeviceSearchSuggestionsProvider_setQueryString___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained onDeviceSearchSuggestionProvider:*(void *)(a1 + 32) didFinishWithSuggestions:MEMORY[0x1E4F1CBF0] forQueryString:*(void *)(a1 + 40)];
}

- (BOOL)_findRootNodeForPrefix:(id)a3 rootNode:(_WBSSearchSuggestionCandidate *)a4
{
  id v6 = a3;
  p_var3 = &a4->var3;
LABEL_2:
  unint64_t v8 = [*p_var3 length];
  if (v8 >= [v6 length])
  {
    unint64_t v13 = [*p_var3 length];
    BOOL v14 = v13 >= [v6 length];
  }
  else
  {
    searchModel = self->_searchModel;
    if (searchModel)
    {
      [(WBSOnDeviceSearchSuggestionsModel *)searchModel readTreeNodeWithCandidate:a4];
      uint64_t v10 = v16;
      uint64_t v11 = v17;
      while (v10 != v11)
      {
        if ([*(id *)(v10 + 16) length]
          && (([v6 hasPrefix:*(void *)(v10 + 16)] & 1) != 0
           || [*(id *)(v10 + 16) hasPrefix:v6]))
        {
          if (!*(unsigned char *)(v10 + 8)
            || (unint64_t v12 = [*(id *)(v10 + 16) length], v12 >= objc_msgSend(v6, "length")))
          {
            objc_storeStrong(&a4->var3, *(id *)(v10 + 16));
            a4->var2 = *(unsigned char *)(v10 + 8);
            a4->var1 = *(_DWORD *)(v10 + 4);
            v19 = (void **)&v16;
            std::vector<_WBSSearchSuggestionCandidate>::__destroy_vector::operator()[abi:sn180100](&v19);
            goto LABEL_2;
          }
        }
        v10 += 24;
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
    }
    v19 = (void **)&v16;
    std::vector<_WBSSearchSuggestionCandidate>::__destroy_vector::operator()[abi:sn180100](&v19);
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_doSearch:(id)a3 atRootNode:(_WBSSearchSuggestionCandidate *)a4
{
  id v27 = a3;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x6012000000;
  v66 = __Block_byref_object_copy__30;
  v67 = __Block_byref_object_dispose__30;
  v68 = &unk_1A6DD304D;
  memset(v69, 0, sizeof(v69));
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x6012000000;
  v59 = __Block_byref_object_copy__30;
  v60 = __Block_byref_object_dispose__30;
  v61 = &unk_1A6DD304D;
  memset(v62, 0, sizeof(v62));
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke;
  v55[3] = &unk_1E5C9E030;
  v55[4] = &v63;
  v55[5] = &v56;
  id v6 = (void (**)(void, void))MEMORY[0x1AD0C4F80](v55);
  uint64_t v52 = *(void *)&a4->var0;
  BOOL var2 = a4->var2;
  id v54 = a4->var3;
  ((void (**)(void, uint64_t *))v6)[2](v6, &v52);
  id v7 = v57;
  for (uint64_t i = v57[11]; i; uint64_t i = v57[11])
  {
    char v9 = v7 + 6;
    unint64_t v10 = *(void *)(v7[7] + 8 * ((i + v7[10] - 1) / 0xAAuLL)) + 24 * ((i + v7[10] - 1) % 0xAAuLL);
    char v11 = *(unsigned char *)(v10 + 8);
    uint64_t v49 = *(void *)v10;
    char v50 = v11;
    id v51 = *(id *)(v10 + 16);
    std::deque<_WBSSearchSuggestionCandidate>::pop_back(v9);
    searchModel = self->_searchModel;
    if (searchModel)
    {
      [(WBSOnDeviceSearchSuggestionsModel *)searchModel readTreeNodeWithCandidate:&v49];
    }
    else
    {
      v46 = 0;
      v47 = 0;
      uint64_t v48 = 0;
    }
    std::deque<_WBSSearchSuggestionCandidate>::deque(v43, v64 + 6);
    std::deque<_WBSSearchSuggestionCandidate>::deque(v40, v57 + 6);
    if (v45) {
      unsigned int v13 = *(_DWORD *)(*(void *)(*((void *)&v43[0] + 1) + 8 * (v44 / 0xAA)) + 24 * (v44 % 0xAA));
    }
    else {
      unsigned int v13 = -1;
    }
    if (v42 && *(_DWORD *)(*(void *)(*((void *)&v40[0] + 1) + 8 * (v41 / 0xAA)) + 24 * (v41 % 0xAA)) < v13) {
      unsigned int v13 = *(_DWORD *)(*(void *)(*((void *)&v40[0] + 1) + 8 * (v41 / 0xAA)) + 24 * (v41 % 0xAA));
    }
    std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v40);
    std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v43);
    v15 = v46;
    BOOL v14 = v47;
    while (v15 != v14)
    {
      if (*(_DWORD *)v15 > v13
        || (uint64_t v16 = v64,
            uint64_t v17 = v64[11],
            uint64_t v18 = v57,
            uint64_t v19 = v57[11],
            unint64_t v20 = v19 + v17,
            unint64_t maximumNumberOfSuggestions = self->_maximumNumberOfSuggestions,
            v19 + v17 < maximumNumberOfSuggestions))
      {
        uint64_t v22 = *v15;
        char v38 = *((unsigned char *)v15 + 8);
        uint64_t v37 = v22;
        id v39 = (id)v15[2];
        ((void (**)(void, uint64_t *))v6)[2](v6, &v37);
        uint64_t v16 = v64;
        uint64_t v17 = v64[11];
        uint64_t v18 = v57;
        uint64_t v19 = v57[11];
        unint64_t maximumNumberOfSuggestions = self->_maximumNumberOfSuggestions;
        unint64_t v20 = v19 + v17;
      }
      if (v20 > maximumNumberOfSuggestions)
      {
        uint64_t v23 = (uint64_t)(v18 + 6);
        if (v17
          && (!v19
           || *(_DWORD *)(*(void *)(v16[7] + 8 * (v16[10] / 0xAAuLL)) + 24 * (v16[10] % 0xAAuLL)) <= *(_DWORD *)(*(void *)(v18[7] + 8 * (v18[10] / 0xAAuLL)) + 24 * (v18[10] % 0xAAuLL))))
        {
          uint64_t v23 = (uint64_t)(v16 + 6);
        }
        std::deque<_WBSSearchSuggestionCandidate>::pop_front(v23);
        uint64_t v16 = v64;
      }
      std::deque<_WBSSearchSuggestionCandidate>::deque(v34, v16 + 6);
      std::deque<_WBSSearchSuggestionCandidate>::deque(v31, v57 + 6);
      if (v36) {
        unsigned int v13 = *(_DWORD *)(*(void *)(*((void *)&v34[0] + 1) + 8 * (v35 / 0xAA)) + 24 * (v35 % 0xAA));
      }
      else {
        unsigned int v13 = -1;
      }
      if (v33)
      {
        if (*(_DWORD *)(*(void *)(*((void *)&v31[0] + 1) + 8 * (v32 / 0xAA)) + 24 * (v32 % 0xAA)) < v13) {
          unsigned int v13 = *(_DWORD *)(*(void *)(*((void *)&v31[0] + 1) + 8 * (v32 / 0xAA)) + 24 * (v32 % 0xAA));
        }
      }
      std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v31);
      std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v34);
      v15 += 3;
    }
    v70 = (void **)&v46;
    std::vector<_WBSSearchSuggestionCandidate>::__destroy_vector::operator()[abi:sn180100](&v70);

    id v7 = v57;
  }
  v24 = [MEMORY[0x1E4F1CA48] array];
  while (v64[11])
  {
    [v24 addObject:*(void *)(*(void *)(v64[7] + 8 * (v64[10] / 0xAAuLL)) + 24 * (v64[10] % 0xAAuLL) + 16)];
    std::deque<_WBSSearchSuggestionCandidate>::pop_front((uint64_t)(v64 + 6));
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke_3;
  block[3] = &unk_1E5C8D840;
  block[4] = self;
  id v29 = v24;
  id v30 = v27;
  id v25 = v24;
  id v26 = v27;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v56, 8);
  std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v62);
  _Block_object_dispose(&v63, 8);
  std::deque<_WBSSearchSuggestionCandidate>::~deque[abi:sn180100](v69);
}

void __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(unsigned char *)(a2 + 8)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  uint64_t v4 = *(void *)(v3 + 8);
  id v5 = (void *)(v4 + 48);
  uint64_t v6 = *(void *)(v4 + 88);
  if (v6
    && (unsigned int v7 = *(_DWORD *)a2,
        unint64_t v8 = v5[4],
        uint64_t v9 = v5[1],
        *(_DWORD *)a2 <= *(_DWORD *)(*(void *)(v9 + 8 * ((v6 + v8 - 1) / 0xAA)) + 24 * ((v6 + v8 - 1) % 0xAA))))
  {
    unint64_t v10 = (void *)(v9 + 8 * (v8 / 0xAA));
    uint64_t v11 = v5[2];
    if (v11 == v9) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = *v10 + 24 * (v8 % 0xAA);
    }
    unint64_t v13 = v8 + v6;
    unint64_t v14 = v13 / 0xAA;
    unint64_t v15 = v13 % 0xAA;
LABEL_11:
    uint64_t v16 = (unsigned int *)v12;
    while (1)
    {
      uint64_t v17 = v11 == v9 ? 0 : *(void *)(v9 + 8 * v14) + 24 * v15;
      if (v16 == (unsigned int *)v17 || v7 <= *v16) {
        break;
      }
      v16 += 6;
      v12 += 24;
      if (*v10 + 4080 == v12)
      {
        uint64_t v18 = v10[1];
        ++v10;
        uint64_t v12 = v18;
        goto LABEL_11;
      }
    }
    std::deque<_WBSSearchSuggestionCandidate>::insert((uint64_t)v5, v10, v12, a2);
  }
  else
  {
    std::deque<_WBSSearchSuggestionCandidate>::push_back((uint64_t)v5, (uint64_t *)a2);
  }
  uint64_t v19 = *(void **)(a2 + 16);
}

void __61__WBSOnDeviceSearchSuggestionsProvider__doSearch_atRootNode___block_invoke_3(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  [WeakRetained onDeviceSearchSuggestionProvider:a1[4] didFinishWithSuggestions:a1[5] forQueryString:a1[6]];
}

- (unint64_t)maximumNumberOfSuggestions
{
  return self->_maximumNumberOfSuggestions;
}

- (void)setMaximumNumberOfSuggestions:(unint64_t)a3
{
  self->_unint64_t maximumNumberOfSuggestions = a3;
}

- (WBSOnDeviceSearchSuggestionsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSOnDeviceSearchSuggestionsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPrefix, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
}

@end