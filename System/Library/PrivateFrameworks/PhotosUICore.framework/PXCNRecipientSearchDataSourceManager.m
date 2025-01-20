@interface PXCNRecipientSearchDataSourceManager
- (NSArray)_searchResults;
- (PXCNRecipientSearchDataSourceManager)initWithVerificationType:(int64_t)a3;
- (int64_t)_verificationType;
- (void)_createDataSource;
- (void)_creationQueue_creatingRecipientSearchResultsForResults:(id)a3 forSearchTaskID:(id)a4 finished:(BOOL)a5;
- (void)_handleAddressQueryResults:(id)a3 error:(id)a4;
- (void)_processRecipientSearchResultsWithMoreComing:(BOOL)a3;
- (void)_setSearchResults:(id)a3;
- (void)_updateRecipientSearchResults:(id)a3 forSearchTaskID:(id)a4 finished:(BOOL)a5;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)finishedSearchingForAutocompleteResults;
- (void)queryStringDidChange;
- (void)removeRecipientResult:(id)a3;
@end

@implementation PXCNRecipientSearchDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__searchResults, 0);
  objc_storeStrong((id *)&self->_cloudKitShareQueryController, 0);
  objc_storeStrong((id *)&self->_searchResultsByDestination, 0);
  objc_storeStrong((id *)&self->_searchResultsQueue, 0);
  objc_storeStrong((id *)&self->_idsAddressQueryController, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
}

- (int64_t)_verificationType
{
  return self->__verificationType;
}

- (NSArray)_searchResults
{
  return self->__searchResults;
}

- (void)_updateRecipientSearchResults:(id)a3 forSearchTaskID:(id)a4 finished:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCNRecipientSearchDataSourceManager.m", 350, @"%s must be called on the main thread", "-[PXCNRecipientSearchDataSourceManager _updateRecipientSearchResults:forSearchTaskID:finished:]");
  }
  if ([(NSNumber *)self->_currentSearchTaskID isEqualToNumber:v10])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__PXCNRecipientSearchDataSourceManager__updateRecipientSearchResults_forSearchTaskID_finished___block_invoke;
    v12[3] = &unk_1E5DD0978;
    BOOL v14 = a5;
    v12[4] = self;
    id v13 = v9;
    [(PXCNRecipientSearchDataSourceManager *)self performChanges:v12];
  }
}

uint64_t __95__PXCNRecipientSearchDataSourceManager__updateRecipientSearchResults_forSearchTaskID_finished___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setSearchState:2];
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _setSearchResults:v3];
}

- (void)_creationQueue_creatingRecipientSearchResultsForResults:(id)a3 forSearchTaskID:(id)a4 finished:(BOOL)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v11 = atomic_load(&self->_currentAtomicSearchTaskID);
  if ([v9 unsignedIntegerValue] != v11) {
    goto LABEL_25;
  }
  val = self;
  BOOL v31 = a5;
  id v33 = v9;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v13)
  {

    id v9 = v33;
    BOOL v28 = a5;
    v29 = self;
LABEL_24:
    objc_initWeak((id *)buf, v29);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__PXCNRecipientSearchDataSourceManager__creationQueue_creatingRecipientSearchResultsForResults_forSearchTaskID_finished___block_invoke;
    block[3] = &unk_1E5DC4710;
    objc_copyWeak(&v37, (id *)buf);
    id v35 = v10;
    id v36 = v9;
    BOOL v38 = v28;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }
  uint64_t v14 = v13;
  id v30 = v8;
  unint64_t v15 = 0;
  uint64_t v16 = *(void *)v40;
  LOBYTE(v17) = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v40 != v16) {
        objc_enumerationMutation(v12);
      }
      if (!v17)
      {

        id v8 = v30;
        id v9 = v33;
        goto LABEL_25;
      }
      v19 = [(PXCNComposeRecipient *)[PXCNRecipientSearchResult alloc] initWithRecipient:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      v20 = [(PXRecipient *)v19 invalidAddressString];

      v21 = PLSharingGetLog();
      v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = [(PXRecipient *)v19 invalidAddressString];
          *(_DWORD *)buf = 138412290;
          v44 = v23;
          _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "Invalid address %@. Recipient not added to search results.", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [(PXRecipient *)v19 suggestedTransport];
          v25 = [v24 address];
          *(_DWORD *)buf = 138412290;
          v44 = v25;
          _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "Added recipient %@ to search results.", buf, 0xCu);
        }
        [v10 addObject:v19];
      }
      if (v15 >= 0x19)
      {
        v26 = v33;
        uint64_t v27 = atomic_load(&val->_currentAtomicSearchTaskID);
        unint64_t v15 = 0;
        BOOL v17 = [v26 unsignedIntegerValue] == v27;
      }
      else
      {
        ++v15;
        BOOL v17 = 1;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v14) {
      continue;
    }
    break;
  }

  id v8 = v30;
  id v9 = v33;
  BOOL v28 = v31;
  v29 = val;
  if (v17) {
    goto LABEL_24;
  }
LABEL_25:
}

void __121__PXCNRecipientSearchDataSourceManager__creationQueue_creatingRecipientSearchResultsForResults_forSearchTaskID_finished___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateRecipientSearchResults:*(void *)(a1 + 32) forSearchTaskID:*(void *)(a1 + 40) finished:*(unsigned __int8 *)(a1 + 56)];
}

- (void)finishedSearchingForAutocompleteResults
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    currentSearchTaskID = self->_currentSearchTaskID;
    int v5 = 138543362;
    v6 = currentSearchTaskID;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[auto-complete task %{public}@] finished", (uint8_t *)&v5, 0xCu);
  }

  [(PXCNRecipientSearchDataSourceManager *)self _processRecipientSearchResultsWithMoreComing:0];
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentSearchTaskID = self->_currentSearchTaskID;
    *(_DWORD *)buf = 138543362;
    unint64_t v15 = currentSearchTaskID;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "[auto-complete task %{public}@] updating", buf, 0xCu);
  }

  if (self->_currentSearchTaskID && objc_msgSend(v7, "isEqualToNumber:"))
  {
    id v10 = [(PXRecipientSearchDataSourceManager *)self usedAddresses];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v13 = v12;

    v13;
    PXFilter();
  }
}

uint64_t __80__PXCNRecipientSearchDataSourceManager_consumeAutocompleteSearchResults_taskID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 address];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)_processRecipientSearchResultsWithMoreComing:(BOOL)a3
{
  if ([(NSMutableArray *)self->_autocompleteSearchResults count])
  {
    BOOL v5 = !a3;
    id v6 = (void *)[(NSMutableArray *)self->_autocompleteSearchResults copy];
    id v7 = self->_currentSearchTaskID;
    objc_initWeak(&location, self);
    creationQueue = self->_creationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PXCNRecipientSearchDataSourceManager__processRecipientSearchResultsWithMoreComing___block_invoke;
    block[3] = &unk_1E5DC4710;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    uint64_t v14 = v7;
    BOOL v16 = v5;
    id v9 = v7;
    id v10 = v6;
    dispatch_async(creationQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (!a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PXCNRecipientSearchDataSourceManager__processRecipientSearchResultsWithMoreComing___block_invoke_2;
    v11[3] = &unk_1E5DD0FA8;
    v11[4] = self;
    [(PXCNRecipientSearchDataSourceManager *)self performChanges:v11];
  }
}

void __85__PXCNRecipientSearchDataSourceManager__processRecipientSearchResultsWithMoreComing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_creationQueue_creatingRecipientSearchResultsForResults:forSearchTaskID:finished:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __85__PXCNRecipientSearchDataSourceManager__processRecipientSearchResultsWithMoreComing___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSearchState:2];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  return [v2 _setSearchResults:v3];
}

- (void)removeRecipientResult:(id)a3
{
}

- (void)_handleAddressQueryResults:(id)a3 error:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke;
  v26[3] = &unk_1E5DB75D0;
  v26[4] = self;
  id v8 = v7;
  id v27 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v26];

  if ([v8 count])
  {
    id v9 = PLSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Update datasource with changed results", buf, 2u);
    }

    id v10 = [(PXSectionedDataSourceManager *)self dataSource];
    uint64_t v11 = [PXCNRecipientSearchDataSource alloc];
    id v12 = [(PXCNRecipientSearchDataSourceManager *)self _searchResults];
    id v13 = [(PXCNRecipientSearchDataSource *)v11 initWithSearchResults:v12];

    uint64_t v14 = [(PXCNRecipientSearchDataSourceManager *)self _searchResults];
    id v15 = [(PXCNRecipientSearchDataSourceManager *)self _searchResults];
    uint64_t v16 = [off_1E5DA5568 changeDetailsFromArray:v14 toArray:v15 changedObjects:v8];

    id v17 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v18 = [v10 identifier];
    uint64_t v19 = [(PXCNRecipientSearchDataSource *)v13 identifier];
    v20 = [off_1E5DA5568 changeDetailsWithNoChanges];
    BOOL v28 = &unk_1F02D6448;
    v29[0] = v16;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v22 = (void *)[v17 initWithFromDataSourceIdentifier:v18 toDataSourceIdentifier:v19 sectionChanges:v20 itemChangeDetailsBySection:v21 subitemChangeDetailsByItemBySection:0];

    id v23 = v22;
    v24 = v13;
    px_dispatch_on_main_queue();
  }
}

void __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__46414;
  uint64_t v19 = __Block_byref_object_dispose__46415;
  id v20 = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 192);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke_51;
  block[3] = &unk_1E5DCCA20;
  uint64_t v14 = &v15;
  void block[4] = v7;
  id v9 = v5;
  id v13 = v9;
  dispatch_sync(v8, block);
  if ([v6 BOOLValue]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  uint64_t v11 = (void *)v16[5];
  if (v11 && [v11 validationType] != v10)
  {
    [(id)v16[5] setValidationType:v10];
    [*(id *)(a1 + 40) addObject:v16[5]];
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40) changeDetails:*(void *)(a1 + 48)];
}

void __73__PXCNRecipientSearchDataSourceManager__handleAddressQueryResults_error___block_invoke_51(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 200) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setSearchResults:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  p_searchResults = &self->__searchResults;
  long long v40 = (NSArray *)a3;
  if (*p_searchResults != v40)
  {
    SEL v37 = a2;
    val = self;
    BOOL v38 = [(PXCNRecipientSearchDataSourceManager *)self _searchResults];
    uint64_t v7 = PLSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v59 = [v38 count];
      __int16 v60 = 2048;
      uint64_t v61 = [(NSArray *)v40 count];
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[auto-complete results] set (old: %lu, new: %lu)", buf, 0x16u);
    }

    objc_storeStrong((id *)p_searchResults, a3);
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v40, "count"));
    uint64_t v8 = [(PXCNRecipientSearchDataSourceManager *)val _verificationType];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obj = v40;
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v13 = [v12 recipient];
          uint64_t v14 = [[PXCNComposeRecipient alloc] initWithRecipient:v13];
          uint64_t v15 = [(PXRecipient *)v14 suggestedTransport];
          uint64_t v16 = [v15 address];
          uint64_t v17 = [v15 addressKind];
          if (!v16)
          {
            id v36 = [MEMORY[0x1E4F28B00] currentHandler];
            [v36 handleFailureInMethod:v37, val, @"PXCNRecipientSearchDataSourceManager.m", 180, @"Invalid parameter not satisfying: %@", @"suggestedAddress" object file lineNumber description];
          }
          switch(v17)
          {
            case 1:
              if (v8) {
                id v20 = v16;
              }
              else {
                id v20 = (id)MEMORY[0x1AD109970](v16);
              }
              uint64_t v18 = v20;
              [v42 addObject:v20];
              break;
            case 2:
              if (v8) {
                id v19 = v16;
              }
              else {
                id v19 = (id)IDSCopyIDForPhoneNumber();
              }
              uint64_t v18 = v19;
              [v41 addObject:v19];
              break;
            case 0:
              id v35 = [MEMORY[0x1E4F28B00] currentHandler];
              [v35 handleFailureInMethod:v37 object:val file:@"PXCNRecipientSearchDataSourceManager.m" lineNumber:197 description:@"Code which should be unreachable has been reached"];

              abort();
            default:
              uint64_t v18 = 0;
              break;
          }
          if ([v18 length]) {
            [v44 setObject:v12 forKeyedSubscript:v18];
          }
        }
        uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v9);
    }

    if (v8 == 1)
    {
      objc_initWeak((id *)buf, val);
      cloudKitShareQueryController = val->_cloudKitShareQueryController;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_2;
      v47[3] = &unk_1E5DBB208;
      objc_copyWeak(&v48, (id *)buf);
      [(PXSharedLibraryParticipantValidationManager *)cloudKitShareQueryController requestValidationForPhoneNumbers:v41 emailAddresses:v42 resultHandler:v47];
      objc_destroyWeak(&v48);
      objc_destroyWeak((id *)buf);
    }
    else if (!v8)
    {
      v21 = [v42 arrayByAddingObjectsFromArray:v41];
      if ([v21 count])
      {
        objc_initWeak((id *)buf, val);
        idsAddressQueryController = val->_idsAddressQueryController;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke;
        v49[3] = &unk_1E5DBB208;
        objc_copyWeak(&v50, (id *)buf);
        [(PXIDSAddressQueryController *)idsAddressQueryController performBatchQueryForAddresses:v21 resultHandler:v49];
        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
      }
    }
    searchResultsQueue = val->_searchResultsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_3;
    block[3] = &unk_1E5DD32A8;
    void block[4] = val;
    id v46 = v44;
    id v25 = v44;
    dispatch_sync(searchResultsQueue, block);
    v26 = [(PXSectionedDataSourceManager *)val dataSource];
    id v27 = [[PXCNRecipientSearchDataSource alloc] initWithSearchResults:obj];
    BOOL v28 = [off_1E5DA5568 changeDetailsFromArray:v38 toArray:obj changedObjects:MEMORY[0x1E4F1CBF0]];
    id v29 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v30 = [v26 identifier];
    uint64_t v31 = [(PXCNRecipientSearchDataSource *)v27 identifier];
    v32 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v55 = &unk_1F02D6448;
    v56 = v28;
    id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    v34 = (void *)[v29 initWithFromDataSourceIdentifier:v30 toDataSourceIdentifier:v31 sectionChanges:v32 itemChangeDetailsBySection:v33 subitemChangeDetailsByItemBySection:0];

    [(PXSectionedDataSourceManager *)val setDataSource:v27 changeDetails:v34];
  }
}

void __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleAddressQueryResults:v6 error:v5];
}

void __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleAddressQueryResults:v6 error:v5];
}

void __58__PXCNRecipientSearchDataSourceManager__setSearchResults___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 200);
  *(void *)(v3 + 200) = v2;
}

- (void)queryStringDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_currentSearchTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentSearchTaskID = self->_currentSearchTaskID;
    self->_currentSearchTaskID = 0;

    atomic_store([(NSNumber *)self->_currentSearchTaskID unsignedIntegerValue], &self->_currentAtomicSearchTaskID);
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  autocompleteSearchResults = self->_autocompleteSearchResults;
  self->_autocompleteSearchResults = v4;

  id v6 = [(PXRecipientSearchDataSourceManager *)self queryString];
  if ([v6 length])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke;
    v12[3] = &unk_1E5DD0FA8;
    v12[4] = self;
    [(PXCNRecipientSearchDataSourceManager *)self performChanges:v12];
    uint64_t v7 = [(CNAutocompleteSearchManager *)self->_searchManager searchForText:v6 consumer:self];
    uint64_t v8 = self->_currentSearchTaskID;
    self->_currentSearchTaskID = v7;

    atomic_store([(NSNumber *)self->_currentSearchTaskID unsignedIntegerValue], &self->_currentAtomicSearchTaskID);
    uint64_t v9 = PLSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = self->_currentSearchTaskID;
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "[auto-complete task %{public}@] started", buf, 0xCu);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke_36;
    v11[3] = &unk_1E5DD0FA8;
    v11[4] = self;
    [(PXCNRecipientSearchDataSourceManager *)self performChanges:v11];
  }
}

uint64_t __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSearchState:1];
}

uint64_t __60__PXCNRecipientSearchDataSourceManager_queryStringDidChange__block_invoke_36(uint64_t a1)
{
  [*(id *)(a1 + 32) setSearchState:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _setSearchResults:0];
}

- (void)_createDataSource
{
  uint64_t v3 = [PXCNRecipientSearchDataSource alloc];
  uint64_t v4 = [(PXCNRecipientSearchDataSourceManager *)self _searchResults];
  id v5 = [(PXCNRecipientSearchDataSource *)v3 initWithSearchResults:v4];

  [(PXSectionedDataSourceManager *)self setDataSource:v5 changeDetails:0];
}

- (PXCNRecipientSearchDataSourceManager)initWithVerificationType:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PXCNRecipientSearchDataSourceManager;
  uint64_t v4 = [(PXRecipientSearchDataSourceManager *)&v17 init];
  if (v4)
  {
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.PXCNRecipientSearchDataSourceManager.creationQueue", v6);
    creationQueue = v4->_creationQueue;
    v4->_creationQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F5A108]) initWithAutocompleteSearchType:2];
    searchManager = v4->_searchManager;
    v4->_searchManager = (CNAutocompleteSearchManager *)v9;

    [(CNAutocompleteSearchManager *)v4->_searchManager setShouldIncludeGroupResults:0];
    v4->__verificationType = a3;
    if (a3 == 1)
    {
      uint64_t v11 = objc_alloc_init(PXSharedLibraryParticipantValidationManager);
      uint64_t v12 = 208;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        dispatch_queue_t v14 = dispatch_queue_create("com.apple.PXCNRecipientSearchDataSourceManager.searchResultsQueue", v6);
        searchResultsQueue = v4->_searchResultsQueue;
        v4->_searchResultsQueue = (OS_dispatch_queue *)v14;

        [(PXCNRecipientSearchDataSourceManager *)v4 _createDataSource];
        return v4;
      }
      uint64_t v11 = objc_alloc_init(PXIDSAddressQueryController);
      uint64_t v12 = 184;
    }
    id v13 = *(Class *)((char *)&v4->super.super.super.super.isa + v12);
    *(Class *)((char *)&v4->super.super.super.super.isa + v12) = (Class)v11;

    goto LABEL_7;
  }
  return v4;
}

@end