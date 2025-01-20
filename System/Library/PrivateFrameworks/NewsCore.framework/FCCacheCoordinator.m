@interface FCCacheCoordinator
- (BOOL)cacheContainsKey:(id)a3;
- (FCCacheCoordinator)init;
- (FCCacheCoordinatorDelegate)delegate;
- (NSSet)allKeys;
- (NSSet)keysWithNonZeroInterest;
- (NSSet)keysWithZeroInterest;
- (id)addInterestInKeys:(id *)a1;
- (id)holdTokenForKey:(id)a3;
- (id)holdTokenForKeys:(id)a3;
- (id)holdTokensForKeys:(id)a3;
- (id)persistableHints;
- (void)_modifyCacheHintForKeys:(void *)a3 withBlock:;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didInsertKeyIntoCache:(id)a3;
- (void)didInsertKeyIntoCache:(id)a3 withLifetimeHint:(int64_t)a4;
- (void)didInsertKeysIntoCache:(id)a3 withLifetimeHints:(id)a4;
- (void)didRemoveKeysFromCache:(id)a3;
- (void)enableFlushingWithPolicy:(id)a3;
- (void)operationThrottlerPerformOperation:(id)a3;
- (void)performCacheRead:(id)a3;
- (void)performCacheWrite:(id)a3;
- (void)removeInterestInKeys:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)setupWithInitialKeys:(id)a3;
- (void)setupWithInitialKeys:(id)a3 persistedHints:(id)a4;
@end

@implementation FCCacheCoordinator

void __56__FCCacheCoordinator__modifyCacheHintForKeys_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v9, (void)v12);
          id v11 = (id)[v10 copy];

          if (!v11)
          {
            id v11 = objc_alloc_init(MEMORY[0x1E4F829F8]);
            [v11 setKey:v9];
          }
          [v3 setObject:v11 forKeyedSubscript:v9];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __36__FCCacheCoordinator_didAccessKeys___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessTime:*(void *)(a1 + 32)];
}

- (id)holdTokensForKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v13 = v4;
  -[FCCacheCoordinator addInterestInKeys:]((id *)&self->super.isa, v4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __40__FCCacheCoordinator_holdTokensForKeys___block_invoke;
        v15[3] = &unk_1E5B4BE70;
        v15[4] = self;
        v15[5] = v10;
        id v11 = +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", v15, v13);
        [v5 setObject:v11 forKey:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)holdTokenForKeys:(id)a3
{
  id v4 = -[FCCacheCoordinator addInterestInKeys:]((id *)&self->super.isa, a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__FCCacheCoordinator_holdTokenForKeys___block_invoke;
  v8[3] = &unk_1E5B4BE70;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = +[FCInterestToken interestTokenWithRemoveInterestBlock:v8];

  return v6;
}

- (id)addInterestInKeys:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__30;
    uint64_t v21 = __Block_byref_object_dispose__30;
    id v22 = 0;
    id v4 = a1[6];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __40__FCCacheCoordinator_addInterestInKeys___block_invoke;
    long long v13 = &unk_1E5B4C230;
    long long v16 = &v17;
    id v14 = v3;
    long long v15 = a1;
    [v4 performWithLockSync:&v10];

    id v5 = (id)v18[5];
    if (objc_msgSend(v5, "count", v10, v11, v12, v13))
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
      [v6 timeIntervalSince1970];
      unint64_t v8 = (unint64_t)v7;

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __36__FCCacheCoordinator_didAccessKeys___block_invoke;
      v23[3] = &__block_descriptor_40_e23_v16__0__NTPBCacheHint_8l;
      v23[4] = v8;
      -[FCCacheCoordinator _modifyCacheHintForKeys:withBlock:]((uint64_t)a1, v5, v23);
    }

    a1 = (id *)(id)v18[5];
    _Block_object_dispose(&v17, 8);
  }
  return a1;
}

- (void)_modifyCacheHintForKeys:(void *)a3 withBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && (FCProcessIsMemoryConstrained() & 1) == 0)
  {
    double v7 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__FCCacheCoordinator__modifyCacheHintForKeys_withBlock___block_invoke_2;
    v8[3] = &unk_1E5B54370;
    id v9 = v5;
    id v10 = v6;
    [v7 readWriteWithAccessor:v8];
  }
}

- (void)performCacheRead:(id)a3
{
  if (self) {
    [(FCCacheCoordinatorLocking *)self->_underlyingLock performReadSync:a3];
  }
}

void __63__FCCacheCoordinator_didInsertKeysIntoCache_withLifetimeHints___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 key];
  id v7 = [v2 objectForKeyedSubscript:v4];

  uint64_t v5 = [v7 integerValue];
  if (v5 == 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5 == 1;
  }
  [v3 setLifetime:v6];
}

- (id)holdTokenForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[FCCacheCoordinator holdTokenForKeys:](self, "holdTokenForKeys:", v6, v9, v10);

  return v7;
}

uint64_t __58__FCCacheCoordinator_setupWithInitialKeys_persistedHints___block_invoke(uint64_t a1, void *a2)
{
  return [a2 key];
}

id __40__FCCacheCoordinator_addInterestInKeys___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 32);
  }
  else {
    id v3 = 0;
  }
  id v4 = a2;
  id v5 = [v3 member:v4];
  uint64_t v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (FCCacheCoordinator)init
{
  v19.receiver = self;
  v19.super_class = (Class)FCCacheCoordinator;
  uint64_t v2 = [(FCCacheCoordinator *)&v19 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    storedKeys = v2->_storedKeys;
    v2->_storedKeys = v3;

    id v5 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    interestedKeys = v2->_interestedKeys;
    v2->_interestedKeys = v5;

    id v7 = objc_alloc_init(FCThreadSafeMutableDictionary);
    cacheHintsByKey = v2->_cacheHintsByKey;
    v2->_cacheHintsByKey = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    interestLock = v2->_interestLock;
    v2->_interestLock = (NFUnfairLock *)v9;

    uint64_t v11 = +[FCThreadSafeHashTable hashTableWithOptions:517];
    observers = v2->_observers;
    v2->_observers = (FCThreadSafeHashTable *)v11;

    long long v13 = [[FCTimedOperationThrottler alloc] initWithDelegate:v2];
    [(FCTimedOperationThrottler *)v13 setCooldownTime:5.0];
    [(FCTimedOperationThrottler *)v13 setSuspended:1];
    flushThrottler = v2->_flushThrottler;
    v2->_flushThrottler = (FCOperationThrottler *)v13;
    long long v15 = v13;

    v2->_flushingEnabled = 0;
    uint64_t v16 = objc_opt_new();
    underlyingLock = v2->_underlyingLock;
    v2->_underlyingLock = (FCCacheCoordinatorLocking *)v16;
  }
  return v2;
}

uint64_t __43__FCCacheCoordinator_removeInterestInKeys___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[4];
  }
  return objc_msgSend(v1, "fc_removeObjectsFromArray:", *(void *)(a1 + 40));
}

void __40__FCCacheCoordinator_holdTokensForKeys___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  -[FCCacheCoordinator removeInterestInKeys:](v1, v2);
}

- (void)removeInterestInKeys:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    unint64_t v8 = __43__FCCacheCoordinator_removeInterestInKeys___block_invoke;
    uint64_t v9 = &unk_1E5B4BE70;
    uint64_t v10 = a1;
    id v11 = v3;
    [v5 performWithLockSync:&v6];
    if (*(unsigned char *)(a1 + 8)) {
      objc_msgSend(*(id *)(a1 + 64), "tickle", v6, v7, v8, v9, v10);
    }
  }
}

void __39__FCCacheCoordinator_holdTokenForKeys___block_invoke(uint64_t a1)
{
}

- (BOOL)cacheContainsKey:(id)a3
{
  if (self) {
    self = (FCCacheCoordinator *)self->_storedKeys;
  }
  return [(FCCacheCoordinator *)self containsObject:a3];
}

uint64_t __58__FCCacheCoordinator_setupWithInitialKeys_persistedHints___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  return objc_msgSend(a2, "fc_removeObjectsForKeysNotInSet:", v3);
}

- (void)setupWithInitialKeys:(id)a3 persistedHints:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self) {
    storedKeys = self->_storedKeys;
  }
  else {
    storedKeys = 0;
  }
  unint64_t v8 = storedKeys;
  id v9 = a4;
  if ([(NSMutableSet *)v8 count])
  {
  }
  else
  {
    if (self) {
      interestedKeys = self->_interestedKeys;
    }
    else {
      interestedKeys = 0;
    }
    uint64_t v11 = [(NSCountedSet *)interestedKeys count];

    if (!v11) {
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v22 = (void *)[[NSString alloc] initWithFormat:@"initial keys should be added before anything else"];
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCCacheCoordinator setupWithInitialKeys:persistedHints:]";
    __int16 v26 = 2080;
    v27 = "FCCacheCoordinator.m";
    __int16 v28 = 1024;
    int v29 = 130;
    __int16 v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_9:
  if (self)
  {
LABEL_10:
    long long v12 = self->_storedKeys;
    goto LABEL_11;
  }
LABEL_25:
  long long v12 = 0;
LABEL_11:
  [(NSMutableSet *)v12 addObjectsFromArray:v6];
  objc_opt_class();
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      long long v13 = v9;
    }
    else {
      long long v13 = 0;
    }
  }
  else
  {
    long long v13 = 0;
  }
  id v14 = v13;

  if (v14 && [v14 version] == 2)
  {
    long long v15 = [v14 cacheHints];
    uint64_t v16 = objc_msgSend(v15, "fc_arrayByTransformingWithBlock:", &__block_literal_global_66);

    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    long long v18 = [v14 cacheHints];
    objc_super v19 = [v17 dictionaryWithObjects:v18 forKeys:v16];

    if (self)
    {
      [(FCThreadSafeMutableDictionary *)self->_cacheHintsByKey addEntriesFromDictionary:v19];
      cacheHintsByKey = self->_cacheHintsByKey;
    }
    else
    {
      [0 addEntriesFromDictionary:v19];
      cacheHintsByKey = 0;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__FCCacheCoordinator_setupWithInitialKeys_persistedHints___block_invoke_2;
    v23[3] = &unk_1E5B4BF78;
    v23[4] = self;
    [(FCThreadSafeMutableDictionary *)cacheHintsByKey readWriteWithAccessor:v23];
  }
  if (self) {
    flushThrottler = self->_flushThrottler;
  }
  else {
    flushThrottler = 0;
  }
  [(FCOperationThrottler *)flushThrottler setSuspended:0];
}

uint64_t __40__FCCacheCoordinator_addInterestInKeys___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__FCCacheCoordinator_addInterestInKeys___block_invoke_2;
  v9[3] = &unk_1E5B4DDA8;
  v9[4] = a1[5];
  uint64_t v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", v9);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = a1[5];
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 32);
  }
  else {
    uint64_t v7 = 0;
  }
  return [v7 addObjectsFromArray:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

- (id)persistableHints
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F829F0]);
  [v3 setVersion:2];
  if (self) {
    cacheHintsByKey = self->_cacheHintsByKey;
  }
  else {
    cacheHintsByKey = 0;
  }
  id v5 = [(FCThreadSafeMutableDictionary *)cacheHintsByKey allValues];
  uint64_t v6 = (void *)[v5 mutableCopy];
  [v3 setCacheHints:v6];

  return v3;
}

- (void)didInsertKeysIntoCache:(id)a3 withLifetimeHints:(id)a4
{
  id v6 = a4;
  if (self) {
    storedKeys = self->_storedKeys;
  }
  else {
    storedKeys = 0;
  }
  [(NSMutableSet *)storedKeys addObjectsFromArray:a3];
  unint64_t v8 = [v6 allKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__FCCacheCoordinator_didInsertKeysIntoCache_withLifetimeHints___block_invoke;
  v10[3] = &unk_1E5B542A8;
  id v11 = v6;
  id v9 = v6;
  -[FCCacheCoordinator _modifyCacheHintForKeys:withBlock:]((uint64_t)self, v8, v10);
}

- (void)performCacheWrite:(id)a3
{
  if (self) {
    [(FCCacheCoordinatorLocking *)self->_underlyingLock performWriteSync:a3];
  }
}

- (void)setupWithInitialKeys:(id)a3
{
}

- (void)enableFlushingWithPolicy:(id)a3
{
  uint64_t v4 = (char *)a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    if (self)
    {
      objc_setProperty_atomic(self, v4, v4, 72);
      self->_flushingEnabled = 1;
      flushThrottler = self->_flushThrottler;
    }
    else
    {
      flushThrottler = 0;
    }
    uint64_t v4 = (char *)[(FCOperationThrottler *)flushThrottler tickle];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setDelegate:(id)a3
{
}

- (void)operationThrottlerPerformOperation:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke;
  v26[3] = &unk_1E5B542F8;
  v26[4] = self;
  id v8 = v7;
  id v27 = v8;
  __int16 v28 = &v34;
  int v29 = &v30;
  if (self
    && ([(FCCacheCoordinatorLocking *)self->_underlyingLock performReadSync:v26],
        *((unsigned char *)v35 + 24))
    || *((unsigned char *)v31 + 24))
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__30;
    v24 = __Block_byref_object_dispose__30;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_4;
    v19[3] = &unk_1E5B54320;
    v19[4] = self;
    v19[5] = &v20;
    v19[6] = &v30;
    if (self)
    {
      [(FCCacheCoordinatorLocking *)self->_underlyingLock performWriteSync:v19];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      observers = self->_observers;
    }
    else
    {
      observers = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
    }
    uint64_t v10 = observers;
    id v11 = [(FCThreadSafeHashTable *)v10 allObjects];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) cacheCoordinator:self didFlushKeys:v21[5]];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v38 count:16];
      }
      while (v12);
    }

    _Block_object_dispose(&v20, 8);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  unint64_t v3 = [v2 cacheCoordinatorCurrentSizeWithReadLock:*(void *)(a1 + 32)];

  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    if (([*(id *)(a1 + 40) alwaysFlushKeysWithZeroInterest] & 1) != 0
      || [v4 highWaterMark] <= v3
      || (id v5 = *(void **)(a1 + 40)) != 0
      && ([*(id *)(a1 + 40) alwaysFlushKeysWithZeroInterest] & 1) == 0
      && [v5 highWaterMark] > v3
      && [v5 lowWaterMark] <= v3)
    {
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 0;
      id v6 = *(void **)(a1 + 32);
      if (v6) {
        id v6 = (void *)v6[6];
      }
      id v7 = v6;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_2;
      v12[3] = &unk_1E5B4C258;
      v12[4] = *(void *)(a1 + 32);
      v12[5] = &v13;
      [v7 performWithLockSync:v12];

      char v8 = *((unsigned char *)v14 + 24);
      if (v8)
      {
        id v9 = *(void **)(a1 + 40);
        if (v9) {
          char v8 = ([*(id *)(a1 + 40) alwaysFlushKeysWithZeroInterest] & 1) != 0
        }
            || [v9 highWaterMark] <= v3;
        else {
          char v8 = 0;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
      char v10 = *((unsigned char *)v14 + 24);
      if (v10)
      {
        id v11 = *(void **)(a1 + 40);
        char v10 = v11
           && ([*(id *)(a1 + 40) alwaysFlushKeysWithZeroInterest] & 1) == 0
           && [v11 highWaterMark] > v3
           && [v11 lowWaterMark] <= v3;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
      _Block_object_dispose(&v13, 8);
    }
  }
}

- (FCCacheCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCCacheCoordinatorDelegate *)WeakRetained;
}

- (void)dealloc
{
  uint64_t v2 = self;
  if (self) {
    self = (FCCacheCoordinator *)self->_flushThrottler;
  }
  [(FCCacheCoordinator *)self setSuspended:0];
  v3.receiver = v2;
  v3.super_class = (Class)FCCacheCoordinator;
  [(FCCacheCoordinator *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  if (self) {
    self = (FCCacheCoordinator *)self->_observers;
  }
  [(FCCacheCoordinator *)self addObject:a3];
}

- (NSSet)allKeys
{
  if (self) {
    self = (FCCacheCoordinator *)self->_storedKeys;
  }
  uint64_t v2 = (void *)[(FCCacheCoordinator *)self copy];
  return (NSSet *)v2;
}

- (NSSet)keysWithZeroInterest
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__30;
  uint64_t v12 = __Block_byref_object_dispose__30;
  id v13 = 0;
  if (self) {
    interestLock = self->_interestLock;
  }
  else {
    interestLock = 0;
  }
  uint64_t v4 = interestLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__FCCacheCoordinator_keysWithZeroInterest__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __42__FCCacheCoordinator_keysWithZeroInterest__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_super v3 = (void *)v2[3];
    uint64_t v2 = (void *)v2[4];
  }
  else
  {
    objc_super v3 = 0;
  }
  uint64_t v4 = v2;
  id v9 = v3;
  id v5 = objc_msgSend(v9, "fc_setByMinusingSet:", v4);
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (NSSet)keysWithNonZeroInterest
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__30;
  uint64_t v12 = __Block_byref_object_dispose__30;
  id v13 = 0;
  if (self) {
    interestLock = self->_interestLock;
  }
  else {
    interestLock = 0;
  }
  uint64_t v4 = interestLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FCCacheCoordinator_keysWithNonZeroInterest__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __45__FCCacheCoordinator_keysWithNonZeroInterest__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_super v3 = (void *)v2[3];
    uint64_t v2 = (void *)v2[4];
  }
  else
  {
    objc_super v3 = 0;
  }
  uint64_t v4 = v2;
  id v9 = v3;
  id v5 = objc_msgSend(v9, "fc_setByIntersectingSet:", v4);
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)didInsertKeyIntoCache:(id)a3
{
}

- (void)didInsertKeyIntoCache:(id)a3 withLifetimeHint:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self) {
    storedKeys = self->_storedKeys;
  }
  else {
    storedKeys = 0;
  }
  id v7 = a3;
  [(NSMutableSet *)storedKeys addObject:v7];
  v10[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__FCCacheCoordinator_didInsertKeyIntoCache_withLifetimeHint___block_invoke;
  v9[3] = &__block_descriptor_40_e23_v16__0__NTPBCacheHint_8l;
  v9[4] = a4;
  -[FCCacheCoordinator _modifyCacheHintForKeys:withBlock:]((uint64_t)self, v8, v9);
}

uint64_t __61__FCCacheCoordinator_didInsertKeyIntoCache_withLifetimeHint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = v2 == 1;
  }
  return [a2 setLifetime:v3];
}

- (void)didRemoveKeysFromCache:(id)a3
{
  if (self)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = self->_storedKeys;
    uint64_t v6 = [v4 setWithArray:a3];
    [(NSMutableSet *)v5 minusSet:v6];

    cacheHintsByKey = self->_cacheHintsByKey;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
    [0 minusSet:v8];

    cacheHintsByKey = 0;
  }
  [(FCThreadSafeMutableDictionary *)cacheHintsByKey removeObjectsForKeys:a3];
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_3;
  v5[3] = &unk_1E5B542D0;
  v5[4] = v2;
  id v4 = v3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "fc_containsObjectPassingTest:", v5);
}

uint64_t __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v3 containsObject:a2] ^ 1;
}

uint64_t __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_5;
  v17[3] = &unk_1E5B4C258;
  uint64_t v4 = *(void *)(a1 + 40);
  v17[4] = v2;
  v17[5] = v4;
  [v3 performWithLockSync:v17];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 40);
    }
    else {
      uint64_t v6 = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_7;
    v16[3] = &unk_1E5B51260;
    uint64_t v7 = *(void *)(a1 + 40);
    v16[4] = v5;
    v16[5] = v7;
    [v6 readWithAccessor:v16];
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  if (result)
  {
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v9 = (void *)v9[5];
    }
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = v9;
    uint64_t v12 = [v10 allObjects];
    [v11 removeObjectsForKeys:v12];

    id v13 = [*(id *)(a1 + 32) delegate];
    [v13 cacheCoordinator:*(void *)(a1 + 32) flushKeysWithWriteLock:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      uint64_t v15 = *(void **)(v14 + 24);
    }
    else {
      uint64_t v15 = 0;
    }
    return [v15 minusSet:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  return result;
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_6;
  v8[3] = &unk_1E5B542D0;
  void v8[4] = v2;
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v4, "fc_setOfObjectsPassingTest:", v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  return [v3 containsObject:a2] ^ 1;
}

void __57__FCCacheCoordinator_operationThrottlerPerformOperation___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a2;
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v14 = [v6 objectForKeyedSubscript:v13];
          if ([v14 lifetime] != 1) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    if ((unint64_t)[v7 count] >= 2)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __62__FCCacheCoordinator_filterKeysForPreemptiveFlush_cacheHints___block_invoke;
      v19[3] = &unk_1E5B54348;
      id v20 = v6;
      [v7 sortUsingComparator:v19];
      unint64_t v15 = (unint64_t)[v7 count] >> 1;
      objc_msgSend(v7, "removeObjectsInRange:", v15, objc_msgSend(v7, "count") - v15);
    }
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  }
  else
  {
    uint64_t v16 = 0;
  }

  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

uint64_t __62__FCCacheCoordinator_filterKeysForPreemptiveFlush_cacheHints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  int v9 = [v7 lifetime];
  if (v9 == [v8 lifetime])
  {
    unint64_t v10 = [v7 accessTime];
    unint64_t v11 = [v8 accessTime];
    uint64_t v12 = -1;
    if (v10 >= v11) {
      uint64_t v12 = 1;
    }
    if (v10 == v11) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
  }
  else if (v9 == 2)
  {
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_flushPolicy, 0);
  objc_storeStrong((id *)&self->_flushThrottler, 0);
  objc_storeStrong((id *)&self->_underlyingLock, 0);
  objc_storeStrong((id *)&self->_interestLock, 0);
  objc_storeStrong((id *)&self->_cacheHintsByKey, 0);
  objc_storeStrong((id *)&self->_interestedKeys, 0);
  objc_storeStrong((id *)&self->_storedKeys, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end