@interface ICCDCSIReindexer
+ (id)searchableIndex;
+ (id)sharedReindexer;
- (ICCDCSIReindexer)init;
- (NSMutableArray)registeredDelegates;
- (void)_reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)registerCoreDataCoreSpotlightDelegate:(id)a3;
- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)setRegisteredDelegates:(id)a3;
- (void)stopIndexing;
- (void)unregisterCoreDataCoreSpotlightDelegate:(id)a3;
@end

@implementation ICCDCSIReindexer

+ (id)sharedReindexer
{
  if (ICUseCoreDataCoreSpotlightIntegration())
  {
    if (sharedReindexer_onceToken != -1) {
      dispatch_once(&sharedReindexer_onceToken, &__block_literal_global_3);
    }
    id v2 = (id)sharedReindexer_sSharedReindexer;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __35__ICCDCSIReindexer_sharedReindexer__block_invoke()
{
  sharedReindexer_sSharedReindexer = objc_alloc_init(ICCDCSIReindexer);
  return MEMORY[0x270F9A758]();
}

- (ICCDCSIReindexer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICCDCSIReindexer;
  id v2 = [(ICCDCSIReindexer *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(ICCDCSIReindexer *)v2 setRegisteredDelegates:v3];
  }
  return v2;
}

- (void)registerCoreDataCoreSpotlightDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCDCSIReindexer *)self registeredDelegates];
  [v5 addObject:v4];
}

- (void)unregisterCoreDataCoreSpotlightDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCDCSIReindexer *)self registeredDelegates];
  [v5 removeObject:v4];
}

- (void)stopIndexing
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(ICCDCSIReindexer *)self registeredDelegates];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) stopSpotlightIndexing];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)searchableIndex
{
  if (searchableIndex_s_token_for_searchable_index != -1) {
    dispatch_once(&searchableIndex_s_token_for_searchable_index, &__block_literal_global_3);
  }
  id v2 = (void *)searchableIndex_s_instance;
  return v2;
}

uint64_t __35__ICCDCSIReindexer_searchableIndex__block_invoke()
{
  searchableIndex_s_instance = objc_alloc_init(ICSearchIndexImplementation);
  return MEMORY[0x270F9A758]();
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICCDCSIReindexer deleteAllSearchableItemsWithCompletionHandler:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  uint64_t v12 = [(id)objc_opt_class() searchableIndex];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v14[3] = &unk_2640CD4E8;
  id v15 = v3;
  id v13 = v3;
  [v12 deleteAllSearchableItemsWithCompletionHandler:v14];
}

void __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.notes", "SearchIndexer");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)_reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v8 = [(ICCDCSIReindexer *)self registeredDelegates];
  uint64_t v9 = [v8 count];

  uint64_t v43 = v9;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  uint64_t v10 = os_log_create("com.apple.notes", "SearchIndexer");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v11) {
      -[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:]((uint64_t)v6, v10);
    }
  }
  else if (v11)
  {
    -[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:](v10, v12, v13, v14, v15, v16, v17, v18);
  }

  v19 = [(ICCDCSIReindexer *)self registeredDelegates];
  v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_10];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2;
  aBlock[3] = &unk_2640CD530;
  v39 = v41;
  v40 = v42;
  id v31 = v7;
  id v38 = v31;
  v21 = _Block_copy(aBlock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v20;
  uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v33 + 1) + 8 * v24);
        v26 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v25;
          _os_log_debug_impl(&dword_20C263000, v26, OS_LOG_TYPE_DEBUG, "reindexing with ICCoreDataCoreSpotlightDelegate: %@", buf, 0xCu);
        }

        uint64_t v27 = objc_opt_class();
        v28 = [(id)objc_opt_class() searchableIndex];
        v29 = ICDynamicCast(v27, (uint64_t)v28);

        if (v29)
        {
          v30 = [v29 searchableIndex];
          if (v6) {
            [v25 searchableIndex:v30 reindexSearchableItemsWithIdentifiers:v6 acknowledgementHandler:v21];
          }
          else {
            [v25 searchableIndex:v30 reindexAllSearchableItemsWithAcknowledgementHandler:v21];
          }
        }
        else
        {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCDCSIReindexer _reindexSearchableItemsWithIdentifiers:completionHandler:]", 1, 0, @"Searchable index of %@ is unexpectately not of type %@.", self, objc_opt_class());
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v22);
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
}

BOOL __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 indexingPriority];
  unint64_t v6 = [v4 indexingPriority];

  return v5 < v6;
}

void __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (uint64_t)(a1 + 5);
  if (++*(void *)(*(void *)(a1[5] + 8) + 24) == *(void *)(*(void *)(a1[6] + 8) + 24) && a1[4])
  {
    id v3 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2_cold_1(v2, v3);
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    id v4 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v5 = @"non-nil";
      if (!a1[4]) {
        unint64_t v5 = @"nil";
      }
      uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 24);
      int v8 = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_debug_impl(&dword_20C263000, v4, OS_LOG_TYPE_DEBUG, "completionHandler is %@, completedReindexes = %lu, countOfRegisteredDelegates = %lu", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (NSMutableArray)registeredDelegates
{
  return self->_registeredDelegates;
}

- (void)setRegisteredDelegates:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__ICCDCSIReindexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "Error deleting all searchable items: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_reindexSearchableItemsWithIdentifiers:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_reindexSearchableItemsWithIdentifiers:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "About to reindex searchable items: %@", (uint8_t *)&v2, 0xCu);
}

void __77__ICCDCSIReindexer__reindexSearchableItemsWithIdentifiers_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "completedReindexes = %lu, triggering completionHandler", (uint8_t *)&v3, 0xCu);
}

@end