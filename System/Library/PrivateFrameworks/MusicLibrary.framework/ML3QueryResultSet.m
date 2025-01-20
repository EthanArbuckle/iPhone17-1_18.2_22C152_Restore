@interface ML3QueryResultSet
- (BOOL)_updateToLibraryCurrentRevision;
- (BOOL)updateToLibraryCurrentRevision;
- (ML3Query)query;
- (ML3QueryResultSet)initWithQuery:(id)a3;
- (id)_initWithQuery:(id)a3 supportsIncrementalUpdate:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)localRevision;
- (int64_t)persistentIDAtIndex:(unint64_t)a3;
- (int64_t)revision;
- (unint64_t)count;
- (unint64_t)entityLimit;
- (void)_loadCurrentFullResults;
- (void)_mergeChangesWithFromNewPIDs:(const void *)a3 changedPIDs:(void *)a4;
- (void)_onQueueAddUpdateFinishedBlock:(id)a3;
- (void)_onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult:(BOOL)a3;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
@end

@implementation ML3QueryResultSet

- (unint64_t)count
{
  return [(ML3QueryResultSet_BackingStore *)self->_backingStore count];
}

- (ML3Query)query
{
  return self->_query;
}

- (int64_t)localRevision
{
  return self->_localRevision;
}

uint64_t __49__ML3QueryResultSet_enumerateSectionsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateSectionsUsingBlock:*(void *)(a1 + 40)];
}

uint64_t __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __41__ML3QueryResultSet_persistentIDAtIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) persistentIDAtIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

void __83__ML3QueryResultSet__onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void (**)(id, void))MEMORY[0x1B3E93EE0](a2);
  v3[2](v3, *(unsigned __int8 *)(a1 + 32));
}

intptr_t __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke(uint64_t a1, int64_t a2, char a3)
{
}

void __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke_2(uint64_t a1, int64_t a2)
{
}

void __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_2;
  v9[3] = &unk_1E5FB6078;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v7;
  long long v10 = v7;
  [v2 _onQueueAddUpdateFinishedBlock:v9];
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 48) count] <= 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_3;
    block[3] = &unk_1E5FB8360;
    uint64_t v6 = *(void *)(a1 + 48);
    block[4] = v4;
    block[5] = v6;
    dispatch_barrier_async(v5, block);
  }
}

- (void)_onQueueAddUpdateFinishedBlock:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"ML3QueryResultSet.mm" lineNumber:433 description:@"invalid parameter.  completion block must be specified."];

    id v5 = 0;
  }
  updateToLibraryCurrentRevisionCompletionBlocks = self->_updateToLibraryCurrentRevisionCompletionBlocks;
  if (!updateToLibraryCurrentRevisionCompletionBlocks)
  {
    long long v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_updateToLibraryCurrentRevisionCompletionBlocks;
    self->_updateToLibraryCurrentRevisionCompletionBlocks = v7;

    updateToLibraryCurrentRevisionCompletionBlocks = self->_updateToLibraryCurrentRevisionCompletionBlocks;
    id v5 = v11;
  }
  v9 = (void *)[v5 copy];
  [(NSMutableArray *)updateToLibraryCurrentRevisionCompletionBlocks addObject:v9];
}

- (ML3QueryResultSet)initWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(ML3QueryResultSet *)self _initWithQuery:v4 supportsIncrementalUpdate:0];
LABEL_7:
    self = (ML3QueryResultSet *)v7;
    p_super = self;
    goto LABEL_10;
  }
  v8 = self;
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
  {
    id v7 = [(ML3QueryResultSet *)self _initWithQuery:v4 supportsIncrementalUpdate:1];
    goto LABEL_7;
  }
  id v10 = v4;
  id v11 = [v10 container];
  v12 = [v11 valueForProperty:@"smart_is_dynamic"];
  int v13 = [v12 intValue];

  if (v13)
  {
    v14 = [[ML3ContainerQueryResultSet alloc] initWithQuery:v10];
  }
  else
  {
    v14 = (ML3ContainerQueryResultSet *)[(ML3QueryResultSet *)self _initWithQuery:v10 supportsIncrementalUpdate:0];
    self = &v14->super;
  }
  p_super = &v14->super;

LABEL_10:
  return p_super;
}

- (id)_initWithQuery:(id)a3 supportsIncrementalUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ML3QueryResultSet;
  id v7 = [(ML3QueryResultSet *)&v34 init];
  v8 = v7;
  if (v7)
  {
    char v9 = [v6 orderingTerms];
    if ([(ML3OrderingTerm *)v9 count])
    {

      if (!v4) {
        goto LABEL_8;
      }
    }
    else
    {
      if (![v6 usingSections])
      {
        char v15 = 0;
        goto LABEL_14;
      }
      id v10 = [v6 sectionProperty];
      BOOL v11 = v10 != 0;

      if (!v11 || !v4)
      {
LABEL_8:
        char v15 = 0;
LABEL_15:
        objc_storeStrong((id *)&v7->_query, v6);
        v7->_supportsIncrementalUpdate = v15;
        dispatch_queue_t v27 = dispatch_queue_create("com.apple.ML3QueryResultSet.coalescing", 0);
        queue = v7->_queue;
        v7->_queue = (OS_dispatch_queue *)v27;

        v29 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, 0);
        dispatch_queue_t v30 = dispatch_queue_create("com.apple.ML3QueryResultSet", v29);
        fixedPriorityQueue = v8->_fixedPriorityQueue;
        v8->_fixedPriorityQueue = (OS_dispatch_queue *)v30;

        goto LABEL_16;
      }
    }
    v12 = [v6 predicate];
    int v13 = [v12 spotlightPredicate];
    BOOL v14 = v13 == 0;

    if (!v14) {
      goto LABEL_8;
    }
    char v9 = [v6 orderingTerms];
    if ([(ML3OrderingTerm *)v9 count])
    {
      char v15 = 1;
    }
    else
    {
      v16 = [v6 sectionProperty];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        char v15 = 1;
        goto LABEL_15;
      }
      v18 = [ML3OrderingTerm alloc];
      v19 = [v6 sectionProperty];
      char v9 = [(ML3OrderingTerm *)v18 initWithProperty:v19];

      v20 = [ML3Query alloc];
      v33 = [v6 library];
      uint64_t v21 = [v6 entityClass];
      v22 = [v6 predicate];
      v35[0] = v9;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      uint64_t v24 = [v6 usingSections];
      v25 = [v6 nonDirectAggregateQuery];
      uint64_t v26 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:](v20, "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v33, v21, v22, v23, v24, v25, 0, [v6 options]);

      char v15 = 1;
      id v6 = (id)v26;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

void __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_4;
  BOOL v11 = &unk_1E5FB8360;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v2 = (id)v12;
  id v3 = v9;
  if (_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::onceToken != -1) {
    dispatch_once(&_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::onceToken, &__block_literal_global_17129);
  }
  if (_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::timeQueryOps) {
    double Current = CFAbsoluteTimeGetCurrent();
  }
  else {
    double Current = 0.0;
  }
  v10((uint64_t)v3);
  if (_executeTimeQueryOperation(NSString *,ML3QueryResultSet *,void({block_pointer})(void))::timeQueryOps)
  {
    id v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = CFAbsoluteTimeGetCurrent();
      id v7 = [v2 query];
      *(_DWORD *)buf = 138543874;
      BOOL v14 = @"updated results";
      __int16 v15 = 2048;
      double v16 = v6 - Current;
      __int16 v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ in %.2f seconds for query with criteria: %{public}@", buf, 0x20u);
    }
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_5;
  v8[3] = &unk_1E5FB8360;
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 56), v8);
}

uint64_t __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _updateToLibraryCurrentRevision];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_updateToLibraryCurrentRevision
{
  id v3 = self->_query;
  BOOL v4 = [(ML3Query *)v3 library];
  if ([(ML3Query *)v3 filtersOnDynamicProperties]) {
    uint64_t v5 = [v4 currentRevision];
  }
  else {
    uint64_t v5 = [v4 currentContentRevision];
  }
  if (!self->_backingStore) {
    goto LABEL_14;
  }
  int64_t revision = self->_revision;
  if (revision == v5)
  {
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (!self->_supportsIncrementalUpdate || !revision || revision > v5 || revision + 100 < v5)
  {
LABEL_14:
    [(ML3QueryResultSet *)self _loadCurrentFullResults];
    ++self->_localRevision;
    BOOL v7 = 1;
    goto LABEL_15;
  }
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke;
  v10[3] = &unk_1E5FB60E8;
  BOOL v11 = v3;
  id v12 = v4;
  int v13 = self;
  BOOL v14 = &v15;
  [v12 performReadOnlyDatabaseTransactionWithBlock:v10];
  int v8 = *((unsigned __int8 *)v16 + 24);
  if (*((unsigned char *)v16 + 24)) {
    ++self->_localRevision;
  }
  BOOL v7 = v8 != 0;

  _Block_object_dispose(&v15, 8);
LABEL_15:

  return v7;
}

- (void)_loadCurrentFullResults
{
  id v3 = self->_query;
  BOOL v4 = [(ML3Query *)v3 library];
  self->_int64_t revision = [v4 currentRevision];
  uint64_t v5 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
  double v6 = [(ML3Query *)v3 sectionProperty];
  if (v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke;
    v11[3] = &unk_1E5FB6008;
    BOOL v7 = (id *)&v12;
    id v12 = v5;
    [(ML3Query *)v3 enumeratePersistentIDsAndSectionsWithProperty:v6 usingBlock:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __44__ML3QueryResultSet__loadCurrentFullResults__block_invoke_2;
    v9[3] = &unk_1E5FB7EE0;
    BOOL v7 = (id *)&v10;
    id v10 = v5;
    [(ML3Query *)v3 enumeratePersistentIDsUsingBlock:v9];
  }

  backingStore = self->_backingStore;
  self->_backingStore = &v5->super;
}

- (int64_t)persistentIDAtIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  fixedPriorityQueue = self->_fixedPriorityQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ML3QueryResultSet_persistentIDAtIndex___block_invoke;
  block[3] = &unk_1E5FB7B10;
  block[4] = self;
  block[5] = &v7;
  void block[6] = a3;
  dispatch_sync(fixedPriorityQueue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  fixedPriorityQueue = self->_fixedPriorityQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ML3QueryResultSet_enumerateSectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E5FB6E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(fixedPriorityQueue, v7);
}

void *__62__ML3QueryResultSet_BackingStore_enumerateSectionsUsingBlock___block_invoke(void *result)
{
  if (*(void *)(*(void *)(result[5] + 8) + 56))
  {
    v1 = result;
    if (*(unsigned __int8 *)(*(void *)(result[6] + 8) + 24) != 255)
    {
      char v3 = 0;
      uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
      if (!v3)
      {
        uint64_t v2 = *(void *)(v1[5] + 8);
        *(void *)(v2 + 48) += *(void *)(v2 + 56);
        *(void *)(v2 + 56) = 0;
      }
    }
  }
  return result;
}

- (BOOL)updateToLibraryCurrentRevision
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ML3QueryResultSet_updateToLibraryCurrentRevision__block_invoke;
  block[3] = &unk_1E5FB8208;
  dispatch_semaphore_t v8 = v3;
  uint64_t v9 = &v10;
  block[4] = self;
  uint64_t v5 = v3;
  dispatch_sync(queue, block);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(queue) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)queue;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedPriorityQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updateToLibraryCurrentRevisionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)_onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult:(BOOL)a3
{
  uint64_t v5 = (void *)[(NSMutableArray *)self->_updateToLibraryCurrentRevisionCompletionBlocks copy];
  [(NSMutableArray *)self->_updateToLibraryCurrentRevisionCompletionBlocks removeAllObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__ML3QueryResultSet__onQueueInvokeAndClearUpdateFinishedBlocksWithDidUpdateResult___block_invoke;
  v6[3] = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
  BOOL v7 = a3;
  [v5 enumerateObjectsUsingBlock:v6];
}

void *__69__ML3QueryResultSet_BackingStore_reverseEnumerateSectionsUsingBlock___block_invoke(void *result)
{
  if (*(void *)(*(void *)(result[5] + 8) + 56))
  {
    v1 = result;
    if (*(unsigned __int8 *)(*(void *)(result[6] + 8) + 24) != 255)
    {
      char v3 = 0;
      uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
      if (!v3)
      {
        uint64_t v2 = *(void *)(v1[5] + 8);
        *(void *)(v2 + 48) += *(void *)(v2 + 56);
        *(void *)(v2 + 56) = 0;
      }
    }
  }
  return result;
}

- (unint64_t)entityLimit
{
  return -1;
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4 = a3;
  fixedPriorityQueue = self->_fixedPriorityQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ML3QueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke;
  v7[3] = &unk_1E5FB6E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(fixedPriorityQueue, v7);
}

uint64_t __54__ML3QueryResultSet_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumeratePersistentIDsUsingBlock:*(void *)(a1 + 40)];
}

uint64_t __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) predicate];
  char v3 = (void *)[*(id *)(a1 + 32) entityClass];
  id v4 = [*(id *)(a1 + 32) orderingTerms];
  uint64_t v5 = [v3 revisionTrackingCode];
  v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  memset(v23, 0, sizeof(v23));
  int v24 = 1065353216;
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 24);
  if ([*(id *)(a1 + 32) filtersOnDynamicProperties]) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_2;
  v15[3] = &unk_1E5FB60C0;
  v20 = v3;
  id v16 = *(id *)(a1 + 40);
  id v9 = v2;
  id v17 = v9;
  id v10 = v4;
  uint64_t v11 = *(void *)(a1 + 48);
  id v18 = v10;
  uint64_t v19 = v11;
  uint64_t v21 = &v25;
  v22 = v23;
  [v6 getChangedPersistentIDsAfterRevision:v7 revisionTrackingCode:v5 maximumRevisionType:v8 usingBlock:v15];
  char v12 = [*(id *)(*(void *)(a1 + 48) + 8) containsPersistentIDs:v23];
  if (v25 == v26) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [*(id *)(a1 + 48) _mergeChangesWithFromNewPIDs:&v25 changedPIDs:v23];
  }
  *(void *)(*(void *)(a1 + 48) + 24) = [*(id *)(a1 + 40) currentRevision];

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v23);
  if (v25)
  {
    uint64_t v26 = v25;
    operator delete(v25);
  }

  return 1;
}

void __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_2(void *a1, unint64_t *a2, uint64_t a3)
{
  id v6 = (void *)a1[8];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = [*(id *)(a1[7] + 16) options];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_3;
  v12[3] = &__block_descriptor_40_e12_v24__0q8_B16l;
  v12[4] = a1[9];
  [v6 enumeratePersistentIDsInLibrary:v7 matchingPredicate:v8 orderingTerms:v9 persistentIDs:a2 count:a3 options:v10 usingBlock:v12];
  for (; a3; --a3)
  {
    unint64_t v11 = *a2++;
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1[10], v11, v11);
  }
}

void __52__ML3QueryResultSet__updateToLibraryCurrentRevision__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v3 + 8);
  unint64_t v4 = *(void *)(v3 + 16);
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v7 = *(void **)v3;
    uint64_t v8 = ((uint64_t)v5 - *(void *)v3) >> 3;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v4 - (void)v7;
    if (v10 >> 2 > v9) {
      unint64_t v9 = v10 >> 2;
    }
    BOOL v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v12);
      uint64_t v7 = *(void **)v3;
      uint64_t v5 = *(void **)(v3 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v14 = (void *)(v12 + 8 * v8);
    unint64_t v15 = v12 + 8 * v13;
    void *v14 = a2;
    id v6 = v14 + 1;
    while (v5 != v7)
    {
      uint64_t v16 = *--v5;
      *--BOOL v14 = v16;
    }
    *(void *)uint64_t v3 = v14;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    void *v5 = a2;
    id v6 = v5 + 1;
  }
  *(void *)(v3 + 8) = v6;
}

- (void)_mergeChangesWithFromNewPIDs:(const void *)a3 changedPIDs:(void *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  v44 = self->_query;
  v38 = [(ML3Query *)v44 library];
  v50 = [v38 checkoutReaderConnection];
  uint64_t v7 = [(ML3Query *)v44 entityClass];
  v43 = [(ML3Query *)v44 orderingTerms];
  if (![v43 count])
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"ML3QueryResultSet.mm", 298, @"Updateable query has no ordering! query: %@", v44 object file lineNumber description];
  }
  uint64_t v8 = [(ML3Query *)v44 sectionProperty];
  v52 = (void *)v8;
  if (v8)
  {
    unint64_t v9 = [(objc_class *)v7 joinClausesForProperty:v8];
    if ([v9 count])
    {
      uint64_t v10 = [v9 componentsJoinedByString:@" "];
    }
    else
    {
      uint64_t v10 = 0;
    }
    BOOL v11 = [(objc_class *)v7 databaseTable];
    unint64_t v12 = &stru_1F08D4D70;
    if (v10) {
      unint64_t v12 = v10;
    }
    v49 = [NSString stringWithFormat:@"SELECT %@ FROM %@ %@ WHERE %@.ROWID = ?", v52, v11, v12, v11];
  }
  else
  {
    v49 = 0;
  }
  v40 = [(objc_class *)v7 disambiguatedSQLForProperty:@"ROWID"];
  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v40, 0);
  uint64_t v13 = *(void *)a3;
  uint64_t v14 = *((void *)a3 + 1);
  location = (id *)&self->_backingStore;
  unint64_t v15 = [(ML3QueryResultSet_BackingStore *)self->_backingStore backingStoreByRemovingPersistentIDs:a4];
  unint64_t v16 = [v15 count];
  id v17 = objc_alloc_init(ML3QueryResultSet_MutableBackingStore);
  unint64_t v45 = [(ML3QueryResultSet *)self entityLimit];
  v41 = [(ML3Query *)v44 selectSQLWithColumns:v39 groupBy:0 orderingTerms:v43 directionality:0 usingLowerBound:1];
  id v18 = [(ML3Query *)v44 predicateIncludingSystemwidePredicates];
  v42 = [v18 databaseStatementParameters];

  if (v14 == v13)
  {
    unint64_t v21 = 0;
    objc_super v34 = 0;
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    unint64_t v51 = (v14 - v13) >> 3;
    do
    {
      v47 = [(ML3Query *)v44 lowerBoundParametersForOrderingTerms:v43 lowerBoundPersistentID:*(void *)(*(void *)a3 + 8 * v20)];
      v22 = [v42 arrayByAddingObjectsFromArray:v47];
      v48 = [v50 executeQuery:v41 withParameters:v22];

      uint64_t v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x2020000000;
      char v72 = 0;
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x2020000000;
      uint64_t v68 = 0;
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x2020000000;
      unint64_t v64 = v20 + 1;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __62__ML3QueryResultSet__mergeChangesWithFromNewPIDs_changedPIDs___block_invoke;
      v54[3] = &unk_1E5FB6030;
      v56 = &v61;
      unint64_t v59 = v51;
      v60 = a3;
      v55 = v15;
      v57 = &v65;
      v58 = &v69;
      [v48 enumerateRowsWithBlock:v54];
      if (*((unsigned char *)v70 + 24))
      {
        if (v21 < v16)
        {
          while (1)
          {
            int64_t v23 = *(void *)(v15[1] + 8 * v21);
            if (v23 == v66[3]) {
              break;
            }
            FastAppendPersistentID(v17, v23, *(unsigned char *)(v15[4] + v21++));
            if (v16 == v21)
            {
              unint64_t v21 = v16;
              goto LABEL_33;
            }
          }
          while (v20 < v62[3])
          {
            int64_t v24 = *(void *)(*(void *)a3 + 8 * v20);
            if (v52)
            {
              v25 = [NSNumber numberWithLongLong:*(void *)(*(void *)a3 + 8 * v20)];
              v74[0] = v25;
              uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
              uint64_t v27 = [v50 executeQuery:v49 withParameters:v26];
              char v28 = [v27 int64ValueForFirstRowAndColumn];
            }
            else
            {
              char v28 = 0;
            }
            FastAppendPersistentID(v17, v24, v28);
            ++v20;
          }
          --v20;
        }
      }
      else
      {
        if (v21 < v16)
        {
          do
          {
            FastAppendPersistentID(v17, *(void *)(v15[1] + 8 * v21), *(unsigned char *)(v15[4] + v21));
            ++v21;
          }
          while (v16 != v21);
          unint64_t v21 = v16;
        }
        if (v20 < v51)
        {
          do
          {
            int64_t v29 = *(void *)(*(void *)a3 + 8 * v20);
            if (v52)
            {
              dispatch_queue_t v30 = [NSNumber numberWithLongLong:*(void *)(*(void *)a3 + 8 * v20)];
              v73 = v30;
              v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
              v32 = [v50 executeQuery:v49 withParameters:v31];
              char v33 = [v32 int64ValueForFirstRowAndColumn];
            }
            else
            {
              char v33 = 0;
            }
            FastAppendPersistentID(v17, v29, v33);
            ++v20;
          }
          while (v51 != v20);
          unint64_t v20 = v51;
        }
      }
LABEL_33:

      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v69, 8);

      ++v20;
      objc_super v34 = v48;
      uint64_t v19 = v48;
    }
    while (v20 < v51);
  }
  v35 = v34;
  if (v21 < v16)
  {
    do
    {
      FastAppendPersistentID(v17, *(void *)(v15[1] + 8 * v21), *(unsigned char *)(v15[4] + v21));
      ++v21;
    }
    while (v16 != v21);
  }
  objc_storeStrong(location, v17);
  v36 = location;
  while ([*v36 count] > v45)
  {
    v36 = location;
    *((void *)*location + 2) -= 8;
  }
  [v38 checkInDatabaseConnection:v50];
}

void __62__ML3QueryResultSet__mergeChangesWithFromNewPIDs_changedPIDs___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  uint64_t v8 = [v14 int64ForColumnIndex:0];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v10 = *(void *)(v9 + 24);
  if (v10 >= *(void *)(a1 + 64))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    unint64_t v12 = *(void **)(v11 + 8);
    uint64_t v13 = *(void **)(v11 + 16);
    while (v12 != v13)
    {
      if (*v12 == v8) {
        goto LABEL_8;
      }
      ++v12;
    }
  }
  else
  {
    if (*(void *)(**(void **)(a1 + 72) + 8 * v10) == v8)
    {
      *(void *)(v9 + 24) = v10 + 1;
      goto LABEL_10;
    }
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  *a4 = 1;
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_query);
  v4[3] = self->_revision;
  objc_storeStrong(v4 + 1, self->_backingStore);
  *((unsigned char *)v4 + 40) = self->_supportsIncrementalUpdate;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.ML3QueryResultSet.coalescing", 0);
  id v6 = v4[7];
  v4[7] = v5;

  objc_storeStrong(v4 + 8, self->_fixedPriorityQueue);
  return v4;
}

@end