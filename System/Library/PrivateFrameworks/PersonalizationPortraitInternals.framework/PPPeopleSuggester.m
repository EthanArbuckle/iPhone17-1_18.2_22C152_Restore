@interface PPPeopleSuggester
+ (id)sharedInstance;
- (PPPeopleSuggester)init;
- (double)_cacheEntryAgeThresholdSecondsSince1970;
- (id)_rankedContactIdentifiersMatchingName:(id)a3;
- (id)rankedContactIdentifiers;
- (void)_sweepCache;
@end

@implementation PPPeopleSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueueForSweeping, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_sweepCache
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__PPPeopleSuggester__sweepCache__block_invoke;
  v3[3] = &unk_1E65D7150;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __32__PPPeopleSuggester__sweepCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = pp_contacts_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: sweeping cache", buf, 2u);
  }

  [*(id *)(a1 + 32) _cacheEntryAgeThresholdSecondsSince1970];
  double v6 = v5;
  v7 = [v3[2] mapTableRepresentation];
  v8 = [v7 keyEnumerator];
  v9 = [v8 allObjects];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    unsigned __int8 v14 = 0;
    uint64_t v15 = *(void *)v26;
    *(void *)&long long v12 = 138739971;
    long long v24 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v3[2], "objectForKey:", v17, v24, (void)v25);
        v19 = (void *)v18;
        if (v18 && *(double *)(v18 + 8) < v6)
        {
          v20 = pp_contacts_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            uint64_t v30 = v17;
            _os_log_debug_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: removing entry for %{sensitive}@", buf, 0xCu);
          }

          [v3[2] removeObjectForKey:v17];
          ++v14;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v13);
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  uint64_t v21 = objc_opt_new();
  id v22 = v3[3];
  v3[3] = (id)v21;

  v23 = pp_contacts_log_handle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v14;
    _os_log_debug_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: removed %d entries from cache", buf, 8u);
  }
}

- (id)_rankedContactIdentifiersMatchingName:(id)a3
{
  v4 = (__CFString *)a3;
  double v5 = v4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__10724;
  id v22 = __Block_byref_object_dispose__10725;
  id v23 = 0;
  double v6 = @"nilKey";
  if (v4) {
    double v6 = v4;
  }
  v7 = v6;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke;
  v13[3] = &unk_1E65D7128;
  v9 = v5;
  unsigned __int8 v14 = v9;
  id v10 = v7;
  uint64_t v15 = v10;
  v16 = self;
  uint64_t v17 = &v18;
  [(_PASLock *)lock runWithLockAcquired:v13];
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = pp_contacts_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v39 = [*(id *)(a1 + 32) length];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v39;
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: _rankedContactIdentifiersMatchingName: name.length: %tu", buf, 0xCu);
  }

  uint64_t v5 = [v3[2] objectForKey:*(void *)(a1 + 40)];
  double v6 = (id *)v5;
  if (v5
    && (double v7 = *(double *)(v5 + 8), [*(id *)(a1 + 48) _cacheEntryAgeThresholdSecondsSince1970], v7 >= v8))
  {
    id v12 = v6[2];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(id *)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    v40 = v6;
    uint64_t v9 = [*(id *)(a1 + 32) length];
    id v10 = v3[1];
    id v11 = objc_opt_new();
    if (v9) {
      [v10 rankedNameSuggestionsFromContext:v11 name:*(void *)(a1 + 32)];
    }
    else {
    uint64_t v15 = [v10 rankedGlobalSuggestionsFromContext:v11 contactsOnly:1];
    }
    v41 = (void *)a1;
    v42 = v3;

    v16 = pp_contacts_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v50 = v17;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPPeopleSuggester: %tu suggestions", buf, 0xCu);
    }

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v14 = v15;
    uint64_t v19 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v14);
          }
          id v23 = *(void **)(*((void *)&v44 + 1) + 8 * v22);
          long long v24 = (void *)MEMORY[0x1CB79D060]();
          long long v25 = [v23 conversationIdentifier];
          uint64_t v26 = [v25 length];

          if (v26)
          {
            long long v27 = pp_contacts_log_handle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              v29 = [v23 conversationIdentifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v50 = (uint64_t)v29;
              _os_log_debug_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_DEBUG, "PPPeopleSuggester: _PSSuggestion: id: %@", buf, 0xCu);
            }
            long long v28 = [v23 conversationIdentifier];
            [v18 addObject:v28];
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v14 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v20);
    }

    uint64_t v30 = objc_opt_new();
    v31 = objc_opt_new();
    [v31 timeIntervalSince1970];
    if (v30)
    {
      v30[1] = v32;

      id v33 = v18;
      v31 = (void *)v30[2];
      v30[2] = v33;
    }
    v3 = v42;

    [v42[2] setObject:v30 forKey:v41[5]];
    objc_storeStrong((id *)(*(void *)(v41[7] + 8) + 40), v18);
    v34 = objc_opt_new();
    [v34 timeIntervalSinceDate:v42[3]];
    double v36 = v35;

    if (v36 > 60.0)
    {
      uint64_t v37 = v41[6];
      v38 = *(NSObject **)(v37 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke_38;
      block[3] = &unk_1E65DBE30;
      block[4] = v37;
      dispatch_async(v38, block);
    }

    double v6 = v40;
  }
}

uint64_t __59__PPPeopleSuggester__rankedContactIdentifiersMatchingName___block_invoke_38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sweepCache];
}

- (double)_cacheEntryAgeThresholdSecondsSince1970
{
  v2 = objc_opt_new();
  [v2 timeIntervalSince1970];
  double v4 = v3 + -1800.0;

  return v4;
}

- (id)rankedContactIdentifiers
{
  return [(PPPeopleSuggester *)self _rankedContactIdentifiersMatchingName:0];
}

- (PPPeopleSuggester)init
{
  v17.receiver = self;
  v17.super_class = (Class)PPPeopleSuggester;
  v2 = [(PPPeopleSuggester *)&v17 init];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4F89CB0] defaultConfiguration];
    double v4 = +[PPConfiguration sharedInstance];
    objc_msgSend(v3, "setMaximumNumberOfSuggestions:", objc_msgSend(v4, "peopleSuggesterMax"));

    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F89CA8]) initWithConfiguration:v3];
    double v7 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v6;

    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v8;

    [*(id *)(v5 + 16) setCountLimit:4];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v5];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v12;

    uint64_t v14 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPPeopleSuggester.serialQueueForSweeping" qosClass:9];
    serialQueueForSweeping = v2->_serialQueueForSweeping;
    v2->_serialQueueForSweeping = (OS_dispatch_queue *)v14;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_10747);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_10748;
  return v2;
}

void __35__PPPeopleSuggester_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10748;
  sharedInstance__pasExprOnceResult_10748 = v1;
}

@end