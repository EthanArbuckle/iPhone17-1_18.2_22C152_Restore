@interface WBSPasswordBreachResults
- (WBSPasswordBreachResults)initWithContext:(id)a3;
- (id)recentlyBreachedResultRecords;
- (id)resultRecordsForQueries:(id)a3;
- (void)_restoreResultsFromPersistentStoreIfNecessary;
- (void)_saveResultsToPersistentStore;
- (void)addResultRecords:(id)a3;
- (void)clearAllResultsSynchronously;
- (void)clearRecentlyBreachedResultRecords;
- (void)markAllCompromisedResultRecordsAsRecentlyBreached;
@end

@implementation WBSPasswordBreachResults

- (WBSPasswordBreachResults)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasswordBreachResults;
  v6 = [(WBSPasswordBreachResults *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

- (id)resultRecordsForQueries:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WBSPasswordBreachResults *)self _restoreResultsFromPersistentStoreIfNecessary];
  v23 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v8)
  {

    goto LABEL_15;
  }
  uint64_t v9 = v8;
  lock = &self->_lock;
  char v21 = 0;
  uint64_t v10 = *(void *)v25;
  id obj = v7;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "persistentIdentifier", lock);
      v14 = [(NSMutableDictionary *)self->_resultRecordsByPersistentIdentifier objectForKeyedSubscript:v13];
      if (v14)
      {
        v15 = v14;
        v16 = [(WBSPasswordBreachResultRecord *)v14 dateLastModified];
        v17 = [v12 dateLastModified];
        uint64_t v18 = [v16 compare:v17];

        if (v18 != -1) {
          goto LABEL_10;
        }
        [(NSMutableDictionary *)self->_resultRecordsByPersistentIdentifier setObject:0 forKeyedSubscript:v13];

        char v21 = 1;
      }
      v15 = [[WBSPasswordBreachResultRecord alloc] initWithPersistentIdentifier:v13 result:0 dateLastModified:v23];
LABEL_10:
      [v6 addObject:v15];
    }
    id v7 = obj;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v9);

  p_lock = lock;
  if (v21) {
    [(WBSPasswordBreachResults *)self _saveResultsToPersistentStore];
  }
LABEL_15:
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)addResultRecords:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(WBSPasswordBreachResults *)self _restoreResultsFromPersistentStoreIfNecessary];
  id v5 = [(WBSPasswordBreachContext *)self->_context configuration];
  int v6 = [v5 verboseSensitiveLoggingEnabled];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v13 = [v12 result];
        v14 = [v12 persistentIdentifier];
        v15 = [(NSMutableDictionary *)self->_resultRecordsByPersistentIdentifier objectForKeyedSubscript:v14];
        [(NSMutableDictionary *)self->_resultRecordsByPersistentIdentifier setObject:v12 forKeyedSubscript:v14];
        if ([v15 result] == 1 && (v13 & 0xFFFFFFFFFFFFFFFELL) == 2) {
          [(NSMutableSet *)self->_recentlyBreachedPersistentIdentifiers addObject:v14];
        }
        if (v6)
        {
          if (v13 > 3) {
            v17 = 0;
          }
          else {
            v17 = off_1E615C1E0[v13];
          }
          uint64_t v18 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v20 = NSString;
            log = v18;
            v19 = objc_msgSend(v20, "safari_stringAsHexWithData:", v14);
            *(_DWORD *)buf = 138740227;
            long long v27 = v19;
            __int16 v28 = 2117;
            uint64_t v29 = v17;
            _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Result for persistent identifier %{sensitive}@: %{sensitive}@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  [(WBSPasswordBreachResults *)self _saveResultsToPersistentStore];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)markAllCompromisedResultRecordsAsRecentlyBreached
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  resultRecordsByPersistentIdentifier = self->_resultRecordsByPersistentIdentifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__WBSPasswordBreachResults_markAllCompromisedResultRecordsAsRecentlyBreached__block_invoke;
  v5[3] = &unk_1E615C1C0;
  v5[4] = self;
  [(NSMutableDictionary *)resultRecordsByPersistentIdentifier enumerateKeysAndObjectsUsingBlock:v5];
  os_unfair_lock_unlock(p_lock);
}

void __77__WBSPasswordBreachResults_markAllCompromisedResultRecordsAsRecentlyBreached__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 result] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:v5];
  }
}

- (id)recentlyBreachedResultRecords
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WBSPasswordBreachResults *)self _restoreResultsFromPersistentStoreIfNecessary];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v6 = self->_recentlyBreachedPersistentIdentifiers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_resultRecordsByPersistentIdentifier, "objectForKeyedSubscript:", v11, (void)v16);
        if (v12)
        {
          unint64_t v13 = v5;
          v14 = v12;
        }
        else
        {
          unint64_t v13 = v4;
          v14 = v11;
        }
        [v13 addObject:v14];
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v4 count])
  {
    [(NSMutableSet *)self->_recentlyBreachedPersistentIdentifiers minusSet:v4];
    [(WBSPasswordBreachResults *)self _saveResultsToPersistentStore];
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)clearRecentlyBreachedResultRecords
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WBSPasswordBreachResults *)self _restoreResultsFromPersistentStoreIfNecessary];
  [(NSMutableSet *)self->_recentlyBreachedPersistentIdentifiers removeAllObjects];
  [(WBSPasswordBreachResults *)self _saveResultsToPersistentStore];
  os_unfair_lock_unlock(p_lock);
}

- (void)clearAllResultsSynchronously
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_recentlyBreachedPersistentIdentifiers removeAllObjects];
  [(NSMutableDictionary *)self->_resultRecordsByPersistentIdentifier removeAllObjects];
  [(WBSPasswordBreachResults *)self _saveResultsToPersistentStore];
  id v4 = [(WBSPasswordBreachContext *)self->_context store];
  [v4 saveStoreSynchronously];

  os_unfair_lock_unlock(p_lock);
}

- (void)_saveResultsToPersistentStore
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = [(WBSPasswordBreachContext *)self->_context store];
  v3 = [(NSMutableDictionary *)self->_resultRecordsByPersistentIdentifier allValues];
  id v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_40);

  [v6 setResultRecords:v4];
  id v5 = [(NSMutableSet *)self->_recentlyBreachedPersistentIdentifiers allObjects];
  [v6 setRecentlyBreachedPersistentIdentifiers:v5];
}

uint64_t __57__WBSPasswordBreachResults__saveResultsToPersistentStore__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)_restoreResultsFromPersistentStoreIfNecessary
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Unexpected non-dictionary type in saved results.", buf, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyBreachedPersistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_resultRecordsByPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end