@interface REElementCoordinator
+ (id)applicationPrewarmIdentifiers;
- (NSDictionary)displayElements;
- (OS_dispatch_queue)callbackQueue;
- (REElementCoordinator)initWithRelevanceEngine:(id)a3;
- (id)elementAtPath:(id)a3;
- (id)pathForElement:(id)a3;
- (unint64_t)numberOfElementsInSection:(id)a3;
- (unint64_t)numberOfObservers;
- (void)_enqueueOrPerformOperation:(id)a3;
- (void)_enumerateValidObservers:(id)a3;
- (void)_performOperation:(id)a3 toObserver:(id)a4;
- (void)_performOperationsToDisplayElements:(id)a3;
- (void)_performOperationsToDisplayElements:(id)a3 toSection:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enumerateObservers:(id)a3;
- (void)insertElement:(id)a3 atPath:(id)a4;
- (void)moveElement:(id)a3 fromPath:(id)a4 toPath:(id)a5;
- (void)performBatchUpdateBlock:(id)a3;
- (void)refreshElement:(id)a3 atPath:(id)a4;
- (void)reloadElement:(id)a3 atPath:(id)a4;
- (void)removeElement:(id)a3 atPath:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation REElementCoordinator

void __48__REElementCoordinator_initWithRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a2;
  id v7 = [v3 array];
  v5 = *(void **)(*(void *)(a1 + 32) + 40);
  v6 = [v4 name];

  [v5 setObject:v7 forKeyedSubscript:v6];
}

- (REElementCoordinator)initWithRelevanceEngine:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)REElementCoordinator;
  v5 = [(RERelevanceEngineSubsystem *)&v25 initWithRelevanceEngine:v4];
  if (v5)
  {
    v6 = [[REObserverStore alloc] initWithFunctionsOptions:512];
    observers = v5->_observers;
    v5->_observers = v6;

    v5->_performingBatch = 0;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    updates = v5->_updates;
    v5->_updates = (NSMutableArray *)v8;

    v10 = [v4 configuration];
    v11 = [v10 observerQueue];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v13;
    }
    else
    {
      v15 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v16 = MEMORY[0x263EF83A0];
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v15;
    }

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    displayElements = v5->_displayElements;
    v5->_displayElements = (NSMutableDictionary *)v17;

    v19 = [(RERelevanceEngineSubsystem *)v5 relevanceEngine];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __48__REElementCoordinator_initWithRelevanceEngine___block_invoke;
    v23[3] = &unk_2644C0268;
    v20 = v5;
    v24 = v20;
    [v19 enumerateSectionDescriptorsWithOptions:0 includeHistoric:1 usingBlock:v23];

    v21 = [v4 logger];
    [v21 addLoggable:v20];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  id v4 = [v3 logger];
  [v4 removeLoggable:self];

  v5.receiver = self;
  v5.super_class = (Class)REElementCoordinator;
  [(RERelevanceEngineSubsystem *)&v5 dealloc];
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[_RERelevanceEngineObserverWrapper alloc] initWithObserver:v4];

  [(REObserverStore *)self->_observers addObserver:v5];
  [(REElementCoordinator *)self didAddObserver:v5];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  id v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __39__REElementCoordinator_removeObserver___block_invoke;
  v9 = &unk_2644C0290;
  id v5 = v4;
  id v10 = v5;
  v11 = &v12;
  [(REElementCoordinator *)self _enumerateValidObservers:&v6];
  if (v13[5])
  {
    -[REObserverStore removeObserver:](self->_observers, "removeObserver:", v6, v7, v8, v9);
    [(REElementCoordinator *)self didRemoveObserver:v13[5]];
  }

  _Block_object_dispose(&v12, 8);
}

void __39__REElementCoordinator_removeObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (void)enumerateObservers:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__REElementCoordinator_enumerateObservers___block_invoke;
    v6[3] = &unk_2644C02B8;
    id v7 = v4;
    [(REElementCoordinator *)self _enumerateValidObservers:v6];
  }
}

uint64_t __43__REElementCoordinator_enumerateObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)numberOfObservers
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__REElementCoordinator_numberOfObservers__block_invoke;
  v4[3] = &unk_2644C02E0;
  v4[4] = &v5;
  [(REElementCoordinator *)self _enumerateValidObservers:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__REElementCoordinator_numberOfObservers__block_invoke(uint64_t result)
{
  return result;
}

- (void)_enumerateValidObservers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    observers = self->_observers;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__REElementCoordinator__enumerateValidObservers___block_invoke;
    v17[3] = &unk_2644C0308;
    id v19 = v4;
    id v7 = v5;
    id v18 = v7;
    [(REObserverStore *)observers enumerateObserversWithBlock:v17];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[REObserverStore removeObserver:](self->_observers, "removeObserver:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
      }
      while (v10);
    }
  }
}

void __49__REElementCoordinator__enumerateValidObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 observer];
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (id)applicationPrewarmIdentifiers
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (NSDictionary)displayElements
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  displayElements = self->_displayElements;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__REElementCoordinator_displayElements__block_invoke;
  v8[3] = &unk_2644BD1C8;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)displayElements enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

void __39__REElementCoordinator_displayElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)elementAtPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  displayElements = self->_displayElements;
  id v6 = [v4 sectionName];
  id v7 = [(NSMutableDictionary *)displayElements objectForKeyedSubscript:v6];

  if (v7 && (unint64_t v8 = [v4 element], v8 < objc_msgSend(v7, "count")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "element"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 identifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = (id)[v9 shallowCopy];
      long long v13 = [v12 identifier];
      long long v14 = [v13 identifier];
      [v12 _updateIdentifier:v14];
    }
    else
    {
      id v12 = v9;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (unint64_t)numberOfElementsInSection:(id)a3
{
  callbackQueue = self->_callbackQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  id v6 = [(NSMutableDictionary *)self->_displayElements objectForKeyedSubscript:v5];

  unint64_t v7 = [v6 count];
  return v7;
}

- (id)pathForElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__28;
  long long v16 = __Block_byref_object_dispose__28;
  id v17 = 0;
  displayElements = self->_displayElements;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__REElementCoordinator_pathForElement___block_invoke;
  v9[3] = &unk_2644C0358;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableDictionary *)displayElements enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__REElementCoordinator_pathForElement___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__REElementCoordinator_pathForElement___block_invoke_2;
  v11[3] = &unk_2644C0330;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v14 = v9;
  id v10 = v7;
  id v13 = v10;
  [a3 enumerateObjectsUsingBlock:v11];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __39__REElementCoordinator_pathForElement___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 identifier];
  id v8 = [*(id *)(a1 + 32) identifier];
  id v9 = v7;
  id v10 = v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) == 0 || (v12)
  {
    char v16 = isKindOfClass | ~v12;
    id v13 = v9;
    long long v15 = v10;
    if (v16) {
      goto LABEL_7;
    }
    long long v15 = [v10 identifier];
    uint64_t v14 = v10;
    id v13 = v9;
  }
  else
  {
    id v13 = [v9 identifier];
    uint64_t v14 = v9;
    long long v15 = v10;
  }

LABEL_7:
  int v17 = [v13 isEqualToString:v15];

  if (v17)
  {
    uint64_t v18 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 40) element:a3];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
  }
}

- (void)performBatchUpdateBlock:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  id v5 = RELogForDomain(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[REElementCoordinator performBatchUpdateBlock:]6();
  }

  if (self->_performingBatch)
  {
    id v6 = RELogForDomain(7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REElementCoordinator performBatchUpdateBlock:]5();
    }
  }
  self->_performingBatch = 1;
  if (v4) {
    v4[2](v4);
  }
  id v7 = (void *)[(NSMutableArray *)self->_updates copy];
  [(NSMutableArray *)self->_updates removeAllObjects];
  uint64_t v8 = [v7 count];
  id v9 = RELogForDomain(7);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    uint64_t v11 = RELogForDomain(7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    char v12 = RELogForDomain(7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]2();
    }

    [(NSMutableDictionary *)self->_displayElements enumerateKeysAndObjectsUsingBlock:&__block_literal_global_80];
    id v13 = RELogForDomain(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]1();
    }

    uint64_t v14 = RELogForDomain(7);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    long long v15 = RELogForDomain(7);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    [(REElementCoordinator *)self _performOperationsToDisplayElements:v7];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      while (2)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v38 + 1) + 8 * v20) type] != 4)
          {
            char v21 = 1;
            goto LABEL_32;
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    char v21 = 0;
LABEL_32:

    v22 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_13;
    v33 = &unk_2644C03F0;
    id v34 = v16;
    v35 = self;
    char v37 = v21;
    id v9 = v22;
    v36 = v9;
    [(REElementCoordinator *)self enumerateObservers:&v30];
    v23 = RELogForDomain(7);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    v24 = RELogForDomain(7);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    objc_super v25 = RELogForDomain(7);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:].cold.6();
    }

    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayElements, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_23, v30, v31, v32, v33);
    v26 = RELogForDomain(7);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:].cold.5();
    }

    v27 = RELogForDomain(7);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }

    v28 = RELogForDomain(7);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[REElementCoordinator performBatchUpdateBlock:]();
    }
  }
  else if (v10)
  {
    -[REElementCoordinator performBatchUpdateBlock:]();
  }

  self->_performingBatch = 0;
  v29 = RELogForDomain(7);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    -[REElementCoordinator performBatchUpdateBlock:]();
  }
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_cold_1((uint64_t)v4, v6);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_12;
  v8[3] = &unk_2644C03A0;
  id v9 = v4;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:a3];
    uint64_t v8 = REStringForSectionPath(v7);
    id v9 = [v5 identifier];
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_debug_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEBUG, "[%@]: %@", (uint8_t *)&v10, 0x16u);
  }
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_2;
  v9[3] = &unk_2644BDBF0;
  id v4 = v3;
  id v10 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  uint64_t v7 = MEMORY[0x223C31700](v9);
  uint64_t v8 = (void *)v7;
  if (*(unsigned char *)(a1 + 56)) {
    [v4 relevanceEngine:*(void *)(a1 + 48) performBatchUpdateBlock:v7 completion:&__block_literal_global_19];
  }
  else {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v2 = RELogForDomain(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = *(void **)(a1 + 32);
    if (isKindOfClass)
    {
      id v4 = [*(id *)(a1 + 32) observer];
    }
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_INFO, "[EC]: Begin view updates for observer: %{public}@.", buf, 0xCu);
    if (isKindOfClass) {
  }
    }
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_14;
  uint64_t v12 = &unk_2644C03C8;
  id v5 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = *(id *)(a1 + 32);
  [v5 enumerateObjectsUsingBlock:&v9];
  uint64_t v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();
    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = objc_msgSend(v8, "observer", v9, v10, v11, v12, v13);
    }
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "[EC]: End view updates for observer: %{public}@.", buf, 0xCu);
    if (v7) {
  }
    }
}

uint64_t __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performOperation:a2 toObserver:*(void *)(a1 + 40)];
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_cold_1((uint64_t)v4, v6);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_24;
  v8[3] = &unk_2644C03A0;
  id v9 = v4;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_24(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = RELogForDomain(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v8 = [v5 identifier];
    int v9 = 136315650;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "[%s - %lu]: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)reloadElement:(id)a3 atPath:(id)a4
{
  callbackQueue = self->_callbackQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  id v9 = +[REElementUpdateOperation reloadElement:v8 atPath:v7];

  [(REElementCoordinator *)self _enqueueOrPerformOperation:v9];
}

- (void)insertElement:(id)a3 atPath:(id)a4
{
  callbackQueue = self->_callbackQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  id v9 = +[REElementUpdateOperation insertElement:v8 atPath:v7];

  [(REElementCoordinator *)self _enqueueOrPerformOperation:v9];
}

- (void)removeElement:(id)a3 atPath:(id)a4
{
  callbackQueue = self->_callbackQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  id v9 = +[REElementUpdateOperation removeElement:v8 atPath:v7];

  [(REElementCoordinator *)self _enqueueOrPerformOperation:v9];
}

- (void)moveElement:(id)a3 fromPath:(id)a4 toPath:(id)a5
{
  callbackQueue = self->_callbackQueue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  id v12 = +[REElementUpdateOperation moveElement:v11 fromPath:v10 toPath:v9];

  [(REElementCoordinator *)self _enqueueOrPerformOperation:v12];
}

- (void)refreshElement:(id)a3 atPath:(id)a4
{
  callbackQueue = self->_callbackQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  id v9 = +[REElementUpdateOperation refreshElement:v8 atPath:v7];

  [(REElementCoordinator *)self _enqueueOrPerformOperation:v9];
}

- (void)_enqueueOrPerformOperation:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  uint64_t v5 = [v4 type];
  uint64_t v6 = RELogForDomain(7);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5 == 3)
  {
    if (v7)
    {
      uint64_t v25 = [v4 type];
      v28 = [v4 path];
      id v27 = [v28 sectionName];
      uint64_t v24 = [v27 UTF8String];
      v26 = [v4 path];
      uint64_t v23 = [v26 element];
      id v8 = [v4 movedToPath];
      id v9 = [v8 sectionName];
      uint64_t v10 = [v9 UTF8String];
      id v11 = [v4 movedToPath];
      uint64_t v12 = [v11 element];
      __int16 v13 = [v4 element];
      id v14 = [v13 identifier];
      *(_DWORD *)buf = 134219266;
      uint64_t v34 = v25;
      __int16 v35 = 2080;
      uint64_t v36 = v24;
      __int16 v37 = 2048;
      uint64_t v38 = v23;
      __int16 v39 = 2080;
      uint64_t v40 = v10;
      __int16 v41 = 2048;
      uint64_t v42 = v12;
      __int16 v43 = 2112;
      v44 = v14;
      _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "[EC]: Enqueue operation: %lu %s-%lu → %s-%lu for element %@", buf, 0x3Eu);
    }
  }
  else if (v7)
  {
    uint64_t v29 = [v4 type];
    uint64_t v15 = [v4 path];
    id v16 = [v15 sectionName];
    uint64_t v17 = [v16 UTF8String];
    uint64_t v18 = [v4 path];
    uint64_t v19 = [v18 element];
    uint64_t v20 = [v4 element];
    char v21 = [v20 identifier];
    *(_DWORD *)buf = 134218754;
    uint64_t v34 = v29;
    __int16 v35 = 2080;
    uint64_t v36 = v17;
    __int16 v37 = 2048;
    uint64_t v38 = v19;
    __int16 v39 = 2112;
    uint64_t v40 = (uint64_t)v21;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "[EC]: Enqueue operation: %lu %s-%lu for element %@", buf, 0x2Au);
  }
  if (self->_performingBatch)
  {
    [(NSMutableArray *)self->_updates addObject:v4];
  }
  else
  {
    id v32 = v4;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [(REElementCoordinator *)self _performOperationsToDisplayElements:v22];

    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __51__REElementCoordinator__enqueueOrPerformOperation___block_invoke;
    v30[3] = &unk_2644BF938;
    v30[4] = self;
    id v31 = v4;
    [(REElementCoordinator *)self enumerateObservers:v30];
  }
}

uint64_t __51__REElementCoordinator__enqueueOrPerformOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performOperation:*(void *)(a1 + 40) toObserver:a2];
}

- (void)_performOperation:(id)a3 toObserver:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 element];
  id v9 = [v6 path];
  uint64_t v10 = [(RERelevanceEngineSubsystem *)self relevanceEngine];
  switch([v6 type])
  {
    case 0:
    case 4:
      id v11 = RELogForDomain(7);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[REElementCoordinator _performOperation:toObserver:](v8, v9);
      }

      [v7 relevanceEngine:v10 didReloadElement:v8 atPath:v9];
      break;
    case 1:
      uint64_t v12 = RELogForDomain(7);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[REElementCoordinator _performOperation:toObserver:](v8, v9);
      }

      [v7 relevanceEngine:v10 didRemoveElement:v8 atPath:v9];
      break;
    case 2:
      __int16 v13 = RELogForDomain(7);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[REElementCoordinator _performOperation:toObserver:](v8, v9);
      }

      [v7 relevanceEngine:v10 didInsertElement:v8 atPath:v9];
      break;
    case 3:
      id v14 = [v6 movedToPath];
      uint64_t v15 = RELogForDomain(7);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = [v8 identifier];
        uint64_t v17 = REStringForSectionPath(v9);
        uint64_t v18 = REStringForSectionPath(v14);
        int v19 = 138412802;
        uint64_t v20 = v16;
        __int16 v21 = 2112;
        v22 = v17;
        __int16 v23 = 2112;
        uint64_t v24 = v18;
        _os_log_debug_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEBUG, "[EC]: Move %@ from %@ to %@", (uint8_t *)&v19, 0x20u);
      }
      [v7 relevanceEngine:v10 didMoveElement:v8 fromPath:v9 toPath:v14];

      break;
    default:
      break;
  }
}

- (void)_performOperationsToDisplayElements:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 path];
        __int16 v13 = [v12 sectionName];

        id v14 = [v5 objectForKeyedSubscript:v13];

        if (!v14)
        {
          uint64_t v15 = [MEMORY[0x263EFF980] array];
          [v5 setObject:v15 forKeyedSubscript:v13];
        }
        id v16 = [v5 objectForKeyedSubscript:v13];
        [v16 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__REElementCoordinator__performOperationsToDisplayElements___block_invoke;
  v17[3] = &unk_2644BD1C8;
  void v17[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];
}

uint64_t __60__REElementCoordinator__performOperationsToDisplayElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _performOperationsToDisplayElements:a3 toSection:a2];
}

- (void)_performOperationsToDisplayElements:(id)a3 toSection:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  __int16 v37 = [(NSMutableDictionary *)self->_displayElements objectForKeyedSubscript:v7];
  uint64_t v38 = [MEMORY[0x263F089C8] indexSet];
  __int16 v39 = [MEMORY[0x263F089C8] indexSet];
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        switch([v15 type])
        {
          case 0:
          case 4:
            id v16 = [v15 path];
            uint64_t v17 = [v16 element];

            long long v18 = [v15 element];
            long long v19 = [NSNumber numberWithUnsignedInteger:v17];
            [v9 setObject:v18 forKeyedSubscript:v19];

            break;
          case 1:
            uint64_t v23 = [v15 path];
            uint64_t v24 = [v23 element];

            [v38 addIndex:v24];
            break;
          case 2:
            v22 = [v15 path];
            goto LABEL_11;
          case 3:
            long long v20 = [v15 path];
            uint64_t v21 = [v20 element];

            [v38 addIndex:v21];
            v22 = [v15 movedToPath];
LABEL_11:
            uint64_t v25 = v22;
            uint64_t v26 = [v22 element];

            [v39 addIndex:v26];
            id v27 = [v15 element];
            v28 = [NSNumber numberWithUnsignedInteger:v26];
            [v8 setObject:v27 forKeyedSubscript:v28];

            break;
          default:
            continue;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v12);
  }

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke;
  v47[3] = &unk_2644C0418;
  id v29 = v7;
  id v48 = v29;
  id v30 = v37;
  id v49 = v30;
  id v31 = v9;
  [v9 enumerateKeysAndObjectsUsingBlock:v47];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_30;
  v44[3] = &unk_2644C00A8;
  id v32 = v29;
  id v45 = v32;
  id v33 = v30;
  id v46 = v33;
  [v38 enumerateIndexesWithOptions:2 usingBlock:v44];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_32;
  v40[3] = &unk_2644C0440;
  id v41 = v8;
  id v42 = v32;
  id v43 = v33;
  id v34 = v33;
  id v35 = v32;
  id v36 = v8;
  [v39 enumerateIndexesUsingBlock:v40];
}

void __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  id v7 = RELogForDomain(7);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v5 identifier];
    uint64_t v9 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:v6];
    id v10 = REStringForSectionPath(v9);
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_debug_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_DEBUG, "[EC]: Reload %@ into display elements at %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 40) setObject:v5 atIndexedSubscript:v6];
}

uint64_t __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_30(uint64_t a1, uint64_t a2)
{
  id v4 = RELogForDomain(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_30_cold_1(a1, a2, v4);
  }

  return [*(id *)(a1 + 40) removeObjectAtIndex:a2];
}

void __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_32(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = RELogForDomain(7);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v6 identifier];
    uint64_t v9 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 40) element:a2];
    id v10 = REStringForSectionPath(v9);
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_debug_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_DEBUG, "[EC]: Insert %@ into display elements at %@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 48) insertObject:v6 atIndex:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayElements, 0);
}

- (void)performBatchUpdateBlock:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: Finish batch update", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: No updates. Not notifying observers", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "\n", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: Final Display Elements End", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: Final Display Elements Begin", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.11()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: Current Display Elements End", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.12()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: Current Display Elements Begin", v2, v3, v4, v5, v6);
}

- (void)performBatchUpdateBlock:.cold.15()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_ERROR, "trying to do recursive batch updates. results are undefined", v1, 2u);
}

- (void)performBatchUpdateBlock:.cold.16()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "[EC]: Begin batch update", v2, v3, v4, v5, v6);
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "[EC]: Begin section %@", (uint8_t *)&v2, 0xCu);
}

- (void)_performOperation:(void *)a1 toObserver:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = REStringForSectionPath(a2);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_5(&dword_21E6E6000, v5, v6, "[EC]: Insert %@ at %@", v7, v8, v9, v10, v11);
}

- (void)_performOperation:(void *)a1 toObserver:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = REStringForSectionPath(a2);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_5(&dword_21E6E6000, v5, v6, "[EC]: Reload %@ at %@", v7, v8, v9, v10, v11);
}

- (void)_performOperation:(void *)a1 toObserver:(void *)a2 .cold.3(void *a1, void *a2)
{
  uint64_t v3 = [a1 identifier];
  uint64_t v4 = REStringForSectionPath(a2);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_5(&dword_21E6E6000, v5, v6, "[EC]: Remove %@ at %@", v7, v8, v9, v10, v11);
}

void __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_30_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[RESectionPath sectionPathWithSectionName:*(void *)(a1 + 32) element:a2];
  uint64_t v5 = REStringForSectionPath(v4);
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_21E6E6000, a3, OS_LOG_TYPE_DEBUG, "[EC]: Remove element in display elements at %@", (uint8_t *)&v6, 0xCu);
}

@end