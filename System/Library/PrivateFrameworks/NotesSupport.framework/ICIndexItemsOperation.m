@interface ICIndexItemsOperation
- (BOOL)_shouldCommitDeletionWithHasItemsToDeleteThenUpdate:(BOOL)a3 shouldForceCommit:(BOOL)a4;
- (BOOL)_shouldCommitIndexingWithHasItemsToDeleteThenUpdate:(BOOL)a3 shouldForceCommit:(BOOL)a4;
- (ICIndexItemsOperation)init;
- (ICIndexItemsOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4;
- (ICSearchIndex)searchableIndex;
- (NSArray)dataSources;
- (NSError)error;
- (NSMutableArray)objectIDURIsToDelete;
- (NSMutableArray)objectIDsToIndex;
- (NSMutableArray)searchableItemsToIndex;
- (NSMutableDictionary)contextCache;
- (id)managedObjectContextForDataSource:(id)a3;
- (unint64_t)totalSizeOfSearchableItemsToIndex;
- (void)_commitObjectIDURIsToDeleteForDataSource:(id)a3;
- (void)_commitObjectIDsToIndexForDataSource:(id)a3;
- (void)commitIfNecessaryForDataSource:(id)a3 hasItemsToDeleteThenUpdate:(BOOL)a4 forceCommit:(BOOL)a5;
- (void)main;
- (void)processItems;
- (void)setContextCache:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setError:(id)a3;
- (void)setObjectIDURIsToDelete:(id)a3;
- (void)setObjectIDsToIndex:(id)a3;
- (void)setSearchableIndex:(id)a3;
- (void)setSearchableItemsToIndex:(id)a3;
- (void)setTotalSizeOfSearchableItemsToIndex:(unint64_t)a3;
@end

@implementation ICIndexItemsOperation

- (ICIndexItemsOperation)init
{
  return 0;
}

- (ICIndexItemsOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICIndexItemsOperation;
  v8 = [(ICIndexItemsOperation *)&v19 init];
  v9 = v8;
  if (v8)
  {
    [(ICIndexItemsOperation *)v8 setSearchableIndex:v6];
    [(ICIndexItemsOperation *)v9 setDataSources:v7];
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    objectIDsToIndex = v9->_objectIDsToIndex;
    v9->_objectIDsToIndex = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    searchableItemsToIndex = v9->_searchableItemsToIndex;
    v9->_searchableItemsToIndex = (NSMutableArray *)v12;

    v9->_totalSizeOfSearchableItemsToIndex = 0;
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    objectIDURIsToDelete = v9->_objectIDURIsToDelete;
    v9->_objectIDURIsToDelete = (NSMutableArray *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    contextCache = v9->_contextCache;
    v9->_contextCache = v16;
  }
  return v9;
}

- (id)managedObjectContextForDataSource:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  id v6 = [(ICIndexItemsOperation *)self contextCache];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    id v7 = (void *)[v4 newManagedObjectContext];
    v8 = [(ICIndexItemsOperation *)self contextCache];
    [v8 setObject:v7 forKeyedSubscript:v5];
  }
  return v7;
}

- (void)main
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Started main function of indexing items operation %@", v2, v3, v4, v5, v6);
}

- (void)processItems
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v0, v1, "%@ Order of data source to be indexed: %@");
}

BOOL __37__ICIndexItemsOperation_processItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 indexingPriority];
  unint64_t v6 = [v4 indexingPriority];

  return v5 < v6;
}

void __37__ICIndexItemsOperation_processItems__block_invoke_4(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) objectIDsToIndex];
  [v2 addObject:*(void *)(a1 + 40)];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v5 = 138412802;
    long long v17 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "searchableItemsToIndex", v17, (void)v18);
        [v10 addObject:v9];

        v11 = [v9 attributeSet];
        uint64_t v12 = [v11 textContent];
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v12 lengthOfBytesUsingEncoding:4];

        v13 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          v15 = [v9 uniqueIdentifier];
          uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          *(_DWORD *)buf = v17;
          uint64_t v23 = v14;
          __int16 v24 = 2112;
          v25 = v15;
          __int16 v26 = 2048;
          uint64_t v27 = v16;
          _os_log_debug_impl(&dword_20C263000, v13, OS_LOG_TYPE_DEBUG, "%@ item-to-index %@ is %lu bytes", buf, 0x20u);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }
}

void __37__ICIndexItemsOperation_processItems__block_invoke_6(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) objectIDURIsToDelete];
    [v2 addObject:*(void *)(a1 + 32)];

    if (ICVerboseSearchLogging())
    {
      id v3 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __37__ICIndexItemsOperation_processItems__block_invoke_6_cold_1();
      }
    }
  }
  uint64_t v4 = *(void **)(a1 + 48);
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v17;
      *(void *)&long long v7 = 138412546;
      long long v15 = v7;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "objectIDURIsToDelete", v15, (void)v16);
          [v12 addObject:v11];

          if (ICVerboseSearchLogging())
          {
            v13 = os_log_create("com.apple.notes", "SearchIndexer");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v14 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v15;
              uint64_t v21 = v14;
              __int16 v22 = 2112;
              uint64_t v23 = v11;
              _os_log_debug_impl(&dword_20C263000, v13, OS_LOG_TYPE_DEBUG, "%@ additional item-to-delete %@", buf, 0x16u);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v8);
    }
  }
}

- (void)commitIfNecessaryForDataSource:(id)a3 hasItemsToDeleteThenUpdate:(BOOL)a4 forceCommit:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = a3;
  BOOL v8 = [(ICIndexItemsOperation *)self _shouldCommitDeletionWithHasItemsToDeleteThenUpdate:v6 shouldForceCommit:v5];
  BOOL v9 = [(ICIndexItemsOperation *)self _shouldCommitIndexingWithHasItemsToDeleteThenUpdate:v6 shouldForceCommit:v5];
  if (v8) {
    [(ICIndexItemsOperation *)self _commitObjectIDURIsToDeleteForDataSource:v10];
  }
  if (v9) {
    [(ICIndexItemsOperation *)self _commitObjectIDsToIndexForDataSource:v10];
  }
}

- (BOOL)_shouldCommitDeletionWithHasItemsToDeleteThenUpdate:(BOOL)a3 shouldForceCommit:(BOOL)a4
{
  BOOL v5 = a3;
  long long v7 = [(ICIndexItemsOperation *)self objectIDURIsToDelete];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    BOOL v9 = 0;
    if (!v5) {
      return v9;
    }
    goto LABEL_8;
  }
  BOOL v9 = 1;
  if (!v5 && !a4)
  {
    id v10 = [(ICIndexItemsOperation *)self objectIDURIsToDelete];
    BOOL v9 = ([v10 count] & 0xFFFFFFFFFFFFC000) != 0;
  }
  if (v5)
  {
LABEL_8:
    uint64_t v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ICIndexItemsOperation _shouldCommitDeletionWithHasItemsToDeleteThenUpdate:shouldForceCommit:](v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  return v9;
}

- (void)_commitObjectIDURIsToDeleteForDataSource:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "-[ICIndexItemsOperation _commitObjectIDURIsToDeleteForDataSource:]", 1, 0, @"Unexpected call from main thread");
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  BOOL v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICIndexItemsOperation _commitObjectIDURIsToDeleteForDataSource:](self, v6);
  }

  long long v7 = [(ICIndexItemsOperation *)self objectIDURIsToDelete];
  uint64_t v8 = (void *)[v7 copy];
  [v4 searchIndexerWillDeleteSearchableItemsWithObjectIDURIs:v8];

  BOOL v9 = [(ICIndexItemsOperation *)self searchableIndex];
  id v10 = [(ICIndexItemsOperation *)self objectIDURIsToDelete];
  uint64_t v11 = (void *)[v10 copy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke;
  v14[3] = &unk_2640CD698;
  v14[4] = self;
  id v15 = v4;
  dispatch_semaphore_t v16 = v5;
  uint64_t v12 = v5;
  id v13 = v4;
  [v9 deleteSearchableItemsWithIdentifiers:v11 completionHandler:v14];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "SearchIndexer");
  dispatch_semaphore_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) setError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  uint64_t v12 = *(void **)(a1 + 40);
  id v13 = [*(id *)(a1 + 32) objectIDURIsToDelete];
  uint64_t v14 = (void *)[v13 copy];
  [v12 searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs:v14 error:v3];

  id v15 = [*(id *)(a1 + 32) objectIDURIsToDelete];
  [v15 removeAllObjects];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_shouldCommitIndexingWithHasItemsToDeleteThenUpdate:(BOOL)a3 shouldForceCommit:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(ICIndexItemsOperation *)self objectIDsToIndex];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    BOOL v9 = 0;
    if (!v5) {
      return v9;
    }
    goto LABEL_10;
  }
  BOOL v9 = 1;
  if (!v5 && !a4)
  {
    uint64_t v10 = [(ICIndexItemsOperation *)self objectIDsToIndex];
    if ((unint64_t)[v10 count] <= 0x63) {
      BOOL v9 = [(ICIndexItemsOperation *)self totalSizeOfSearchableItemsToIndex] >> 12 > 0x18;
    }
  }
  if (v5)
  {
LABEL_10:
    uint64_t v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ICIndexItemsOperation _shouldCommitIndexingWithHasItemsToDeleteThenUpdate:shouldForceCommit:](v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  return v9;
}

- (void)_commitObjectIDsToIndexForDataSource:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "-[ICIndexItemsOperation _commitObjectIDsToIndexForDataSource:]", 1, 0, @"Unexpected call from main thread");
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(ICIndexItemsOperation *)self _commitObjectIDsToIndexForDataSource:v6];
  }

  uint64_t v7 = [(ICIndexItemsOperation *)self objectIDsToIndex];
  uint64_t v8 = (void *)[v7 copy];
  [v4 searchIndexerWillIndexObjectIDs:v8];

  BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F02A38]) initWithKeyName:@"sy_isLinkItem"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [(ICIndexItemsOperation *)self searchableItemsToIndex];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [*(id *)(*((void *)&v28 + 1) + 8 * v13) attributeSet];
        uint64_t v15 = [v14 valueForCustomKey:v9];

        if (v15)
        {
          char v16 = 1;
          goto LABEL_15;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  char v16 = 0;
LABEL_15:

  objc_initWeak(&location, self);
  uint64_t v17 = [(ICIndexItemsOperation *)self searchableIndex];
  long long v18 = [(ICIndexItemsOperation *)self searchableItemsToIndex];
  long long v19 = (void *)[v18 copy];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke;
  v22[3] = &unk_2640CD6E0;
  objc_copyWeak(&v25, &location);
  id v20 = v4;
  id v23 = v20;
  char v26 = v16;
  uint64_t v21 = v5;
  __int16 v24 = v21;
  [v17 indexSearchableItems:v19 completionHandler:v22];

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_semaphore_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_2();
    }

    [WeakRetained setError:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_1();
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [WeakRetained objectIDsToIndex];
  BOOL v9 = (void *)[(id)v8 copy];
  [v7 searchIndexerDidFinishIndexingObjectIDs:v9 error:v3];

  uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
  LOBYTE(v8) = objc_msgSend(v10, "ic_isAppExtension");

  if ((v8 & 1) == 0)
  {
    uint64_t v11 = [WeakRetained searchableItemsToIndex];
    uint64_t v12 = (void *)[v11 copy];
    uint64_t v13 = objc_msgSend(v12, "ic_compactMap:", &__block_literal_global_26_0);

    if ([v13 count])
    {
      uint64_t v14 = +[ICImageAnalysisController sharedController];
      [v14 analyzeSearchableItems:v13 completion:0];
    }
  }
  uint64_t v15 = [WeakRetained searchableItemsToIndex];
  [v15 removeAllObjects];

  char v16 = [WeakRetained objectIDsToIndex];
  [v16 removeAllObjects];

  [WeakRetained setTotalSizeOfSearchableItemsToIndex:0];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v17 = (void *)getSYItemIndexingManagerClass_softClass;
    uint64_t v23 = getSYItemIndexingManagerClass_softClass;
    if (!getSYItemIndexingManagerClass_softClass)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __getSYItemIndexingManagerClass_block_invoke;
      v19[3] = &unk_2640CD368;
      v19[4] = &v20;
      __getSYItemIndexingManagerClass_block_invoke((uint64_t)v19);
      uint64_t v17 = (void *)v21[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v20, 8);
    [v18 indexedContentItemsDidChange];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F1D920];
  id v3 = a2;
  id v4 = [v3 attributeSet];
  dispatch_semaphore_t v5 = [v4 contentType];
  uint64_t v6 = [v2 typeWithIdentifier:v5];
  int v7 = [v6 conformsToType:*MEMORY[0x263F1DB18]];

  if (v7) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (ICSearchIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)setSearchableIndex:(id)a3
{
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)objectIDsToIndex
{
  return self->_objectIDsToIndex;
}

- (void)setObjectIDsToIndex:(id)a3
{
}

- (NSMutableArray)searchableItemsToIndex
{
  return self->_searchableItemsToIndex;
}

- (void)setSearchableItemsToIndex:(id)a3
{
}

- (unint64_t)totalSizeOfSearchableItemsToIndex
{
  return self->_totalSizeOfSearchableItemsToIndex;
}

- (void)setTotalSizeOfSearchableItemsToIndex:(unint64_t)a3
{
  self->_totalSizeOfSearchableItemsToIndex = a3;
}

- (NSMutableArray)objectIDURIsToDelete
{
  return self->_objectIDURIsToDelete;
}

- (void)setObjectIDURIsToDelete:(id)a3
{
}

- (NSMutableDictionary)contextCache
{
  return self->_contextCache;
}

- (void)setContextCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCache, 0);
  objc_storeStrong((id *)&self->_objectIDURIsToDelete, 0);
  objc_storeStrong((id *)&self->_searchableItemsToIndex, 0);
  objc_storeStrong((id *)&self->_objectIDsToIndex, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

void __37__ICIndexItemsOperation_processItems__block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_0(&dword_20C263000, v0, v1, "%@ item-to-delete %@");
}

- (void)_shouldCommitDeletionWithHasItemsToDeleteThenUpdate:(uint64_t)a3 shouldForceCommit:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20C263000, a2, a3, "Found items to delete-then-update, shouldCommitDeletion=%@", a5, a6, a7, a8, 2u);
}

- (void)_commitObjectIDURIsToDeleteForDataSource:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = [a1 objectIDURIsToDelete];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = [v4 count];
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "%@ deleting %d item(s) for current batch", (uint8_t *)&v5, 0x12u);
}

void __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_9(&dword_20C263000, v0, v1, "%@ error deleting searchable item batch: %@");
}

- (void)_shouldCommitIndexingWithHasItemsToDeleteThenUpdate:(uint64_t)a3 shouldForceCommit:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20C263000, a2, a3, "Found items to delete-then-update, shouldCommitIndexing=%@", a5, a6, a7, a8, 2u);
}

- (void)_commitObjectIDsToIndexForDataSource:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 searchableItemsToIndex];
  int v7 = 138413058;
  int v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = [v6 count];
  __int16 v11 = 2048;
  uint64_t v12 = [a1 totalSizeOfSearchableItemsToIndex];
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_debug_impl(&dword_20C263000, a3, OS_LOG_TYPE_DEBUG, "%@ indexing %lu item(s) for current batch. bytes=%lu from %@", (uint8_t *)&v7, 0x2Au);
}

void __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "%@ finished indexing batch", v2, v3, v4, v5, v6);
}

void __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_20C263000, v0, v1, "%@ error indexing batch: %@");
}

@end