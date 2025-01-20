@interface ICCoreDataIndexer
- (BOOL)needsFetchedResultsControllerUpdate;
- (BOOL)shouldIncludeOutlineParentItems;
- (ICCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (ICCoreDataIndexerDelegate)delegate;
- (ICItemIdentifier)firstRelevantItemIdentifier;
- (NSManagedObjectContext)legacyManagedObjectContext;
- (NSManagedObjectContext)modernManagedObjectContext;
- (NSSet)activeFetchedResultsControllers;
- (NSString)expansionStateContext;
- (OS_dispatch_queue)reloadDataSerialQueue;
- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5;
- (id)newSnapshotFromIndex;
- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)sectionIdentifierForHeaderInSection:(int64_t)a3;
- (id)sectionIdentifiersForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3;
- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5;
- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4;
- (void)indexObjectsWithCompletion:(id)a3;
- (void)performAndWaitForFetchedResultsControllers:(id)a3 block:(id)a4;
- (void)reloadData:(id)a3;
- (void)reloadDataAndWait;
- (void)setDelegate:(id)a3;
- (void)setNeedsFetchedResultsControllerUpdate:(BOOL)a3;
- (void)setReloadDataSerialQueue:(id)a3;
- (void)setShouldIncludeOutlineParentItems:(BOOL)a3;
- (void)unsafelyIndexAllObjectsForFetchedResultsController:(id)a3;
- (void)unsafelyReloadData;
@end

@implementation ICCoreDataIndexer

- (NSManagedObjectContext)modernManagedObjectContext
{
  return self->_modernManagedObjectContext;
}

- (ICCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICCoreDataIndexer;
  v9 = [(ICCoreDataIndexer *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyManagedObjectContext, a3);
    objc_storeStrong((id *)&v10->_modernManagedObjectContext, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.notes.indexer-reload-data-serial-queue", v11);
    reloadDataSerialQueue = v10->_reloadDataSerialQueue;
    v10->_reloadDataSerialQueue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 managedObjectContext];
}

id __72__ICCoreDataIndexer_unsafelyIndexAllObjectsForFetchedResultsController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)[*(id *)(a1 + 32) indexObjectsInSection:a2 sectionIndex:a3 fetchedResultsController:*(void *)(a1 + 40)];
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)setDelegate:(id)a3
{
}

- (id)newSnapshotFromIndex
{
  v3 = [(ICCoreDataIndexer *)self legacyManagedObjectContext];
  v4 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
  id v5 = [(ICCoreDataIndexer *)self newSnapshotFromIndexWithLegacyManagedObjectContext:v3 modernManagedObjectContext:v4];

  return v5;
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  return self->_legacyManagedObjectContext;
}

uint64_t __32__ICCoreDataIndexer_reloadData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unsafelyReloadData];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)unsafelyReloadData
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(ICCoreDataIndexer *)self needsFetchedResultsControllerUpdate]
    || ([(ICCoreDataIndexer *)self activeFetchedResultsControllers],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        !v4))
  {
    id v5 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke;
    v31[3] = &unk_1E5FD8DF0;
    v31[4] = self;
    [v5 performBlockAndWait:v31];

    v6 = [(ICCoreDataIndexer *)self legacyManagedObjectContext];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_2;
    v30[3] = &unk_1E5FD8DF0;
    v30[4] = self;
    [v6 performBlockAndWait:v30];

    [(ICCoreDataIndexer *)self setNeedsFetchedResultsControllerUpdate:0];
  }
  [(ICCoreDataIndexer *)self activeFetchedResultsControllers];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) setDelegate:self];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v8);
  }

  objc_msgSend(v7, "ic_map:", &__block_literal_global_78);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_super v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if (([v15 automaticallyMergesChangesFromParent] & 1) == 0) {
          [v15 setAutomaticallyMergesChangesFromParent:1];
        }
        if ([v15 concurrencyType] != 2)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_4;
          v21[3] = &unk_1E5FD8DF0;
          v21[4] = v15;
          [v15 performBlockAndWait:v21];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v12);
  }

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5;
  v16[3] = &unk_1E5FDDC98;
  v16[4] = self;
  v16[5] = &v17;
  [(ICCoreDataIndexer *)self performAndWaitForFetchedResultsControllers:v7 block:v16];
  if (!*((unsigned char *)v18 + 24)) {
    [(ICCoreDataIndexer *)self willIndex];
  }
  [(ICCoreDataIndexer *)self didIndex];
  _Block_object_dispose(&v17, 8);
}

- (void)performAndWaitForFetchedResultsControllers:(id)a3 block:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v12 = [v11 managedObjectContext];
        uint64_t v13 = [v12 concurrencyType];

        if (v13 == 2)
        {
          v14 = [v11 managedObjectContext];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke;
          v35[3] = &unk_1E5FD8F20;
          id v15 = v6;
          v35[4] = v11;
          id v36 = v15;
          [v14 performBlockAndWait:v35];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }
  v16 = dispatch_group_create();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        long long v23 = [v22 managedObjectContext];
        uint64_t v24 = [v23 concurrencyType];

        if (v24 != 2)
        {
          dispatch_group_enter(v16);
          long long v25 = [v22 managedObjectContext];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke_2;
          v28[3] = &unk_1E5FDB0C8;
          id v30 = v6;
          v28[4] = v22;
          long long v29 = v16;
          [v25 performBlock:v28];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v19);
  }

  dispatch_time_t v26 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v16, v26))
  {
    long long v27 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ICCoreDataIndexer performAndWaitForFetchedResultsControllers:block:](v27);
    }
  }
}

- (BOOL)needsFetchedResultsControllerUpdate
{
  return self->_needsFetchedResultsControllerUpdate;
}

- (void)setNeedsFetchedResultsControllerUpdate:(BOOL)a3
{
  self->_needsFetchedResultsControllerUpdate = a3;
}

- (void)reloadData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCoreDataIndexer *)self reloadDataSerialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__ICCoreDataIndexer_reloadData___block_invoke;
  v7[3] = &unk_1E5FD8F48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)reloadDataSerialQueue
{
  return self->_reloadDataSerialQueue;
}

- (BOOL)shouldIncludeOutlineParentItems
{
  return self->_shouldIncludeOutlineParentItems;
}

void __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  v3 = a1[5];
  dispatch_group_leave(v3);
}

void __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = 0;
  [v3 performFetch:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5_cold_1((uint64_t)v4, v5);
    }
  }
  else
  {
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      [*(id *)(a1 + 32) willIndex];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    objc_sync_exit(v6);

    [*(id *)(a1 + 32) unsafelyIndexAllObjectsForFetchedResultsController:v3];
  }
}

- (void)unsafelyIndexAllObjectsForFetchedResultsController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sections];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICCoreDataIndexer_unsafelyIndexAllObjectsForFetchedResultsController___block_invoke;
  v7[3] = &unk_1E5FDDCC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLegacyFetchedResultsControllers];
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateModernFetchedResultsControllers];
}

- (void)setShouldIncludeOutlineParentItems:(BOOL)a3
{
  self->_shouldIncludeOutlineParentItems = a3;
}

uint64_t __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCoreDataIndexer *)self delegate];
  [v8 indexer:self didChangeContentWithDifference:v6 controller:v7];
}

- (ICCoreDataIndexerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICCoreDataIndexerDelegate *)WeakRetained;
}

- (NSSet)activeFetchedResultsControllers
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (NSString)expansionStateContext
{
  return 0;
}

- (void)reloadDataAndWait
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for reload to complete", v1, 2u);
}

intptr_t __38__ICCoreDataIndexer_reloadDataAndWait__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unsafelyReloadData];
  uint64_t v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (void)indexObjectsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(ICCoreDataIndexer *)self reloadDataSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke;
  block[3] = &unk_1E5FDD438;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained willIndex];
    id v4 = [v3 activeFetchedResultsControllers];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke_2;
    v6[3] = &unk_1E5FDDC50;
    v6[4] = v3;
    [v3 performAndWaitForFetchedResultsControllers:v4 block:v6];

    [v3 didIndex];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unsafelyIndexAllObjectsForFetchedResultsController:a2];
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  return objc_alloc_init(MEMORY[0x1E4FB1360]);
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3
{
  uint64_t v5 = [(ICCoreDataIndexer *)self legacyManagedObjectContext];
  id v6 = [(ICCoreDataIndexer *)self modernManagedObjectContext];
  id v7 = [(ICCoreDataIndexer *)self sectionSnapshotsForSectionType:a3 legacyManagedObjectContext:v5 modernManagedObjectContext:v6];

  return v7;
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  return 0;
}

- (ICItemIdentifier)firstRelevantItemIdentifier
{
  return self->_firstRelevantItemIdentifier;
}

- (void)setReloadDataSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadDataSerialQueue, 0);
  objc_storeStrong((id *)&self->_firstRelevantItemIdentifier, 0);
  objc_storeStrong((id *)&self->_modernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_legacyManagedObjectContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performAndWaitForFetchedResultsControllers:(os_log_t)log block:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for block to complete for background fetched results controllers", v1, 2u);
}

void __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error performing fetch: %@", (uint8_t *)&v2, 0xCu);
}

@end