@interface WFDatabaseResult
+ (id)callbackQueue;
- (NSArray)descriptors;
- (NSArray)observers;
- (NSArray)staticDescriptors;
- (NSError)fetchError;
- (NSHashTable)observersTable;
- (NSNumber)cachedCount;
- (NSPredicate)searchPredicate;
- (OS_dispatch_queue)queue;
- (WFDatabase)database;
- (WFDatabaseResult)initWithStaticDescriptors:(id)a3;
- (WFDatabaseResultState)state;
- (id)_init;
- (id)description;
- (id)unsearchedDescriptorsWithError:(id *)a3;
- (unint64_t)count;
- (void)registerObserver:(id)a3;
- (void)reset;
- (void)setCachedCount:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDescriptors:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setSearchPredicate:(id)a3;
- (void)setState:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateDescriptorsAndNotify:(id)a3 state:(id)a4;
@end

@implementation WFDatabaseResult

void __25__WFDatabaseResult_count__block_invoke_2(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setCachedCount:v2];
}

- (void)setCachedCount:(id)a3
{
}

void __37__WFDatabaseResult_registerObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observersTable];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)observersTable
{
  return self->_observersTable;
}

- (void)setDatabase:(id)a3
{
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)WFDatabaseResult;
  id v2 = [(WFDatabaseResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    WFDatabaseResultCommonInit(v2);
    v4 = v3;
  }

  return v3;
}

void __25__WFDatabaseResult_count__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v3 = (void *)v2[1];
LABEL_3:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
    return;
  }
  v4 = [v2 cachedCount];

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 cachedCount];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 unsignedIntValue];
  }
  else
  {
    v3 = (void *)v5[6];
    if (v3) {
      goto LABEL_3;
    }
  }
}

- (NSNumber)cachedCount
{
  return self->_cachedCount;
}

- (void)setSearchPredicate:(id)a3
{
  v4 = (NSPredicate *)a3;
  if (self->_searchPredicate != v4)
  {
    v5 = [(WFDatabaseResult *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__WFDatabaseResult_setSearchPredicate___block_invoke;
    v6[3] = &unk_1E6558938;
    v6[4] = self;
    v7 = v4;
    dispatch_sync(v5, v6);
  }
}

- (void)reset
{
  v3 = [(WFDatabaseResult *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WFDatabaseResult_reset__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (unint64_t)count
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v3 = [(WFDatabaseResult *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WFDatabaseResult_count__block_invoke;
  block[3] = &unk_1E6558960;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v3, block);

  unint64_t v4 = v11[3];
  if (!v4)
  {
    unint64_t v5 = [(WFDatabase *)self->_database countForResult:self];
    v11[3] = v5;
    id v6 = [(WFDatabaseResult *)self queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __25__WFDatabaseResult_count__block_invoke_2;
    v8[3] = &unk_1E6558960;
    v8[4] = self;
    v8[5] = &v10;
    dispatch_sync(v6, v8);

    unint64_t v4 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)registerObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFDatabaseResult.m", 197, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  id v6 = [(WFDatabaseResult *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__WFDatabaseResult_registerObserver___block_invoke;
  block[3] = &unk_1E6558938;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(v6, block);
}

- (NSArray)descriptors
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__70915;
  v11 = __Block_byref_object_dispose__70916;
  id v12 = 0;
  v3 = [(WFDatabaseResult *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__WFDatabaseResult_descriptors__block_invoke;
  v6[3] = &unk_1E6558960;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __31__WFDatabaseResult_descriptors__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    id v4 = *(void **)(v2 + 48);
    if (v4)
    {
      objc_storeStrong((id *)(v2 + 8), v4);
    }
    else
    {
      id v16 = 0;
      uint64_t v5 = [(id)v2 unsearchedDescriptorsWithError:&v16];
      id v6 = v16;
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      *(void *)(v7 + 8) = v5;

      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v6;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(void *)(v11 + 32))
    {
      uint64_t v12 = objc_msgSend(*(id *)(v11 + 8), "filteredArrayUsingPredicate:");
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 8);
      *(void *)(v13 + 8) = v12;

      uint64_t v11 = *(void *)(a1 + 32);
    }
    v15 = *(void **)(v11 + 72);
    *(void *)(v11 + 72) = 0;

    v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

- (void)setState:(id)a3
{
}

- (WFDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCount, 0);
  objc_storeStrong((id *)&self->_observersTable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_staticDescriptors, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_searchPredicate, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

void __25__WFDatabaseResult_reset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = 0;
}

- (NSArray)staticDescriptors
{
  return self->_staticDescriptors;
}

- (WFDatabaseResultState)state
{
  return self->_state;
}

- (NSPredicate)searchPredicate
{
  return self->_searchPredicate;
}

- (void)setFetchError:(id)a3
{
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setDescriptors:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFDatabaseResult *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__WFDatabaseResult_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6558938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__WFDatabaseResult_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observersTable];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (NSArray)observers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__70915;
  uint64_t v11 = __Block_byref_object_dispose__70916;
  id v12 = 0;
  v3 = [(WFDatabaseResult *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__WFDatabaseResult_observers__block_invoke;
  v6[3] = &unk_1E6558960;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __29__WFDatabaseResult_observers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) observersTable];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __39__WFDatabaseResult_setSearchPredicate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;
}

- (void)updateDescriptorsAndNotify:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFDatabaseResult *)self descriptors];
  uint64_t v9 = [(WFDatabaseResult *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke;
  v13[3] = &unk_1E6558910;
  id v14 = v6;
  v15 = self;
  id v16 = v8;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_sync(v9, v13);
}

void __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) searchPredicate];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) searchPredicate];
    uint64_t v5 = [v2 filteredArrayUsingPredicate:v4];

    id v2 = (id)v5;
  }
  id v6 = *(id *)(a1 + 48);
  id v7 = v2;
  id v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (v7 && v6)
    {
      char v9 = [v6 isEqualToArray:v7];

      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v10 = (void *)[v8 copy];
    [*(id *)(a1 + 40) setDescriptors:v10];

    [*(id *)(a1 + 40) setFetchError:0];
    [*(id *)(a1 + 40) setCachedCount:0];
    [*(id *)(a1 + 40) setState:*(void *)(a1 + 56)];
    id v11 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v16 = "-[WFDatabaseResult updateDescriptorsAndNotify:state:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEBUG, "%s Database result changed: %@", buf, 0x16u);
    }

    uint64_t v13 = +[WFDatabaseResult callbackQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke_183;
    block[3] = &unk_1E6558B28;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v13, block);
  }
LABEL_13:
}

void __53__WFDatabaseResult_updateDescriptorsAndNotify_state___block_invoke_183(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) databaseResultDidChange:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)unsearchedDescriptorsWithError:(id *)a3
{
  return 0;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return v6;
}

- (WFDatabaseResult)initWithStaticDescriptors:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFDatabaseResult.m", 71, @"Invalid parameter not satisfying: %@", @"descriptors" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFDatabaseResult;
  uint64_t v6 = [(WFDatabaseResult *)&v13 init];
  long long v7 = v6;
  if (v6)
  {
    WFDatabaseResultCommonInit(v6);
    uint64_t v8 = [v5 copy];
    staticDescriptors = v7->_staticDescriptors;
    v7->_staticDescriptors = (NSArray *)v8;

    long long v10 = v7;
  }

  return v7;
}

+ (id)callbackQueue
{
  if (callbackQueue_onceToken != -1) {
    dispatch_once(&callbackQueue_onceToken, &__block_literal_global_70934);
  }
  id v2 = (void *)callbackQueue_callbackQueue;
  return v2;
}

void __33__WFDatabaseResult_callbackQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.shortcuts.WFDatabaseResult-callback", v2);
  v1 = (void *)callbackQueue_callbackQueue;
  callbackQueue_callbackQueue = (uint64_t)v0;
}

@end