@interface PPEventCache
- (PPEventCache)initWithEventStorage:(id)a3;
- (id)cachedEventHighlightForEvent:(id)a3 rankingOptions:(int)a4 trialWrapper:(id)a5;
- (id)objectForRange:(_NSRange)a3;
- (id)refreshCacheWithChanges:(id)a3;
- (void)_scheduleCacheBackingFileUpdate;
- (void)evictAllEventsNotInRange:(_NSRange)a3;
- (void)removeAllObjects;
- (void)setEventHighlight:(id)a3;
- (void)setExtraSecondsToBackfill:(unint64_t)a3;
@end

@implementation PPEventCache

void __31__PPEventCache_objectForRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v62 = a1;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  [v4 removeIndexes:v3[2]];
  uint64_t v5 = [v4 firstIndex];
  v58 = v4;
  uint64_t v6 = [v4 lastIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    v9 = pp_events_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v3[3];
      *(_DWORD *)buf = 134218496;
      uint64_t v78 = v5;
      __int16 v79 = 2048;
      uint64_t v80 = v8;
      __int16 v81 = 2048;
      v82 = v10;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPEventCache: backfilling from %tu to %tu + %tu", buf, 0x20u);
    }

    v57 = v3;
    uint64_t v11 = (uint64_t)v3[3] + v8 - v5 + 1;
    v12 = (void *)MEMORY[0x1CB79D060]();
    v13 = objc_opt_new();
    v14 = *(void **)(*(void *)(v62 + 32) + 8);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __31__PPEventCache_objectForRange___block_invoke_49;
    v74[3] = &unk_1E65DBEF0;
    id v75 = v13;
    id v15 = v13;
    uint64_t v55 = v11;
    uint64_t v56 = v5;
    objc_msgSend(v14, "enumerateEventsInRange:usingBlock:", v5, v11, v74);
    v16 = objc_opt_new();
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __31__PPEventCache_objectForRange___block_invoke_2;
    v71[3] = &unk_1E65DBF18;
    uint64_t v17 = *(void *)(v62 + 32);
    id v72 = v16;
    uint64_t v73 = v17;
    id v18 = v16;
    v19 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v71);

    if ([v19 count]) {
      [*(id *)(*(void *)(v62 + 32) + 8) attemptToPurgeImmediately];
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v67 objects:v91 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v68;
      uint64_t v59 = *(void *)v68;
      id v60 = v20;
      do
      {
        uint64_t v24 = 0;
        uint64_t v61 = v22;
        do
        {
          if (*(void *)v68 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v67 + 1) + 8 * v24);
          v26 = pp_default_log_handle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [v25 objectID];
            v28 = [v25 title];
            v29 = [v25 calendar];
            v30 = [v29 title];
            v31 = [v25 startDate];
            v32 = [v25 endDate];
            uint64_t v33 = (int)[v25 availability];
            v34 = [v25 attendees];
            *(_DWORD *)buf = 138544899;
            uint64_t v78 = (uint64_t)v27;
            __int16 v79 = 2117;
            uint64_t v80 = (uint64_t)v28;
            __int16 v81 = 2117;
            v82 = v30;
            __int16 v83 = 2113;
            v84 = v31;
            __int16 v85 = 2113;
            v86 = v32;
            __int16 v87 = 2048;
            uint64_t v88 = v33;
            __int16 v89 = 2117;
            v90 = v34;
            _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPEventCache: backfilled event: o:%{public}@ t:'%{sensitive}@' c:'%{sensitive}@' s:%{private}@ e:%{private}@ b:%ld a:%{sensitive}@", buf, 0x48u);

            uint64_t v23 = v59;
            uint64_t v22 = v61;

            id v20 = v60;
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v67 objects:v91 count:16];
      }
      while (v22);
    }

    v35 = pp_events_log_handle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [v20 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v78 = v36;
      _os_log_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_DEFAULT, "PPEventCache: backfilling %tu events", buf, 0xCu);
    }

    v3 = v57;
    objc_msgSend(v57[2], "addIndexesInRange:", v56, v55);
    if ([v20 count])
    {
      uint64_t v37 = mergeDeduping(v57[1], v20);
      v38 = v57[1];
      v57[1] = (void *)v37;

      -[PPEventCache _scheduleCacheBackingFileUpdate](*(void *)(v62 + 32));
    }
    v39 = pp_events_log_handle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v57[1] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v78 = v40;
      _os_log_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_DEFAULT, "PPEventCache: cached event count after backfill: %tu", buf, 0xCu);
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v41 = v3[1];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v64 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v47 = [v46 startDate];
        [v47 timeIntervalSinceReferenceDate];
        double v49 = v48;

        v50 = [v46 endDate];
        v51 = [v46 startDate];
        [v50 timeIntervalSinceDate:v51];
        double v53 = v52;

        if (v49 < 0.0 || v53 < 0.0)
        {
          v54 = pp_events_log_handle();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_ERROR, "PPEventCache: Candidate event range is invalid", buf, 2u);
          }
        }
        else
        {
          v93.location = (unint64_t)v49;
          v93.length = (unint64_t)v53;
          if (NSIntersectionRange(*(NSRange *)(v62 + 48), v93).length) {
            [*(id *)(v62 + 40) addObject:v46];
          }
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v43);
  }
}

- (id)objectForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_new();
  data = self->_data;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __31__PPEventCache_objectForRange___block_invoke;
  uint64_t v17 = &unk_1E65D6570;
  NSUInteger v20 = location;
  NSUInteger v21 = length;
  id v18 = self;
  id v8 = v6;
  id v19 = v8;
  [(_PASLock *)data runWithLockAcquired:&v14];
  v9 = pp_events_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend(v8, "count", v14, v15, v16, v17, v18);
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v10;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPEventCache: cache returning %tu events", buf, 0xCu);
  }

  uint64_t v11 = v19;
  id v12 = v8;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calendarInternPool, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)cachedEventHighlightForEvent:(id)a3 rankingOptions:(int)a4 trialWrapper:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 eventIdentifier];
  if (v10 && ([v8 title], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    *(void *)buf = 0;
    v31 = buf;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__6584;
    v34 = __Block_byref_object_dispose__6585;
    id v35 = 0;
    data = self->_data;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __73__PPEventCache_cachedEventHighlightForEvent_rankingOptions_trialWrapper___block_invoke;
    v27 = &unk_1E65D66C8;
    v29 = buf;
    id v28 = v10;
    [(_PASLock *)data runWithLockAcquired:&v24];
    v13 = (void *)*((void *)v31 + 5);
    if (v13)
    {
      objc_msgSend(v13, "weightedScore", v24, v25, v26, v27);
      double v15 = v14;
      v16 = [[PPEventScorer alloc] initWithTrialWrapper:v9];
      uint64_t v17 = [(PPEventScorer *)v16 scoreIsExtraordinary:v6 rankingOptions:v15];

      id v18 = (void *)MEMORY[0x1E4F89E08];
      uint64_t v19 = [*((id *)v31 + 5) prominentFeature];
      NSUInteger v20 = [*((id *)v31 + 5) featureValues];
      NSUInteger v21 = [v18 eventHighlightWithEvent:v8 score:v19 prominentFeature:v20 features:v17 isExtraordinary:v15];
    }
    else
    {
      NSUInteger v21 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v22 = pp_events_log_handle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, "PPEventCache: trying to retrieve cache with nil eventIdentifier or nil title.", buf, 2u);
    }

    NSUInteger v21 = 0;
  }

  return v21;
}

uint64_t __73__PPEventCache_cachedEventHighlightForEvent_rankingOptions_trialWrapper___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a2 + 32) objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (void)setEventHighlight:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 eventIdentifier];
  if (v5)
  {
    uint64_t v6 = [PPEventFeatureScore alloc];
    v7 = [v4 features];
    [v4 score];
    id v9 = -[PPEventFeatureScore initWithFeatureValues:weightedScore:prominentFeature:](v6, "initWithFeatureValues:weightedScore:prominentFeature:", v7, [v4 prominentFeature], v8);

    data = self->_data;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__PPEventCache_setEventHighlight___block_invoke;
    v13[3] = &unk_1E65D64E0;
    id v14 = v5;
    double v15 = v9;
    uint64_t v11 = v9;
    [(_PASLock *)data runWithLockAcquired:v13];
  }
  else
  {
    uint64_t v11 = pp_events_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPEventCache: trying to set cache for event with nil eventIdentifier", (uint8_t *)v12, 2u);
    }
  }
}

uint64_t __34__PPEventCache_setEventHighlight___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)evictAllEventsNotInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_new();
  data = self->_data;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __41__PPEventCache_evictAllEventsNotInRange___block_invoke;
  id v18 = &unk_1E65D6650;
  NSUInteger v20 = location;
  NSUInteger v21 = length;
  id v19 = v6;
  id v8 = v6;
  [(_PASLock *)data runWithLockAcquired:&v15];
  id v9 = v8;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v10 = self->_data;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __42__PPEventCache_evictAllEventsNotInRanges___block_invoke;
  v22[3] = &unk_1E65D66A0;
  id v11 = v9;
  id v23 = v11;
  uint64_t v24 = &v30;
  uint64_t v25 = &v26;
  -[_PASLock runWithLockAcquired:](v10, "runWithLockAcquired:", v22, v15, v16, v17, v18);
  id v12 = pp_events_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v31[3];
    uint64_t v14 = v27[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v35 = v13;
    __int16 v36 = 2048;
    uint64_t v37 = v14;
    _os_log_debug_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEBUG, "PPEventCache: evictions happened: %tu to %tu events", buf, 0x16u);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

void __41__PPEventCache_evictAllEventsNotInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PPEventCache_evictAllEventsNotInRange___block_invoke_2;
  v4[3] = &unk_1E65D6628;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateRangesInRange:options:usingBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0, v4);
}

void __42__PPEventCache_evictAllEventsNotInRanges___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (([v3[2] isEqualToIndexSet:*(void *)(a1 + 32)] & 1) == 0)
  {
    objc_storeStrong(v3 + 2, *(id *)(a1 + 32));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3[1] count];
    id v4 = objc_opt_new();
    id v5 = v3[1];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __42__PPEventCache_evictAllEventsNotInRanges___block_invoke_2;
    uint64_t v10 = &unk_1E65D6678;
    id v11 = v3;
    id v12 = v4;
    id v6 = v4;
    [v5 enumerateObjectsUsingBlock:&v7];
    objc_msgSend(v3[1], "removeObjectsAtIndexes:", v6, v7, v8, v9, v10);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3[1] count];
  }
}

void __42__PPEventCache_evictAllEventsNotInRanges___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  id v13 = v5;
  uint64_t v7 = [v5 startDate];
  [v7 timeIntervalSinceReferenceDate];
  if (([v6 containsIndex:(unint64_t)v8] & 1) == 0)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v10 = [v13 endDate];
    [v10 timeIntervalSinceReferenceDate];
    LOBYTE(v9) = [v9 containsIndex:(unint64_t)v11];

    id v12 = v13;
    if (v9) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 40) addIndex:a3];
    uint64_t v7 = [v13 eventIdentifier];
    if (v7) {
      [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v7];
    }
  }

  id v12 = v13;
LABEL_6:
}

uint64_t __41__PPEventCache_evictAllEventsNotInRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
}

- (void)removeAllObjects
{
  v3 = pp_events_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "PPEventCache: removing all objects from event cache", v4, 2u);
  }

  [(PPCalendarInternPool *)self->_calendarInternPool clearPool];
  [(_PASLock *)self->_data runWithLockAcquired:&__block_literal_global_80];
}

uint64_t __32__PPEventCache_removeAllObjects__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)a2[1];
  v3 = a2;
  [v2 removeAllObjects];
  [(id)v3[2] removeAllIndexes];
  id v4 = (void *)v3[4];

  return [v4 removeAllObjects];
}

- (id)refreshCacheWithChanges:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v63 = self;
  [(PPCalendarInternPool *)self->_calendarInternPool clearPool];
  id v5 = objc_opt_new();
  uint64_t v59 = objc_opt_new();
  id v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_58);
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  double v8 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_63);
  id v9 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_65);
  v57 = (void *)[v7 initWithObjects:v8 forKeys:v9];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v82;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v82 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v81 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x1CB79D060]();
        objc_opt_class();
        if (v13)
        {
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v15 = [v13 ownerID];
            __40__PPEventCache_refreshCacheWithChanges___block_invoke(v15, v5);

            goto LABEL_10;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v13;
            if ([v16 changeType] == 2
              || (storage = v63->_storage,
                  [v16 calendarID],
                  id v18 = objc_claimAutoreleasedReturnValue(),
                  LODWORD(storage) = [(PPEventStorage *)storage shouldIgnoreEventsOnCalendarWithObjectID:v18], v18, !storage))
            {
              int v27 = [v16 changeType];
              if (v27 != 2)
              {
                if (v27 != 1)
                {
                  if (v27) {
                    goto LABEL_36;
                  }
                  uint64_t v28 = [v16 originalItemID];
                  BOOL v29 = v28 == 0;

                  if (!v29)
                  {
                    uint64_t v30 = [v16 originalItemID];
                    __40__PPEventCache_refreshCacheWithChanges___block_invoke(v30, v5);
                  }
                }
                NSUInteger v20 = [v16 changedObjectID];
                __40__PPEventCache_refreshCacheWithChanges___block_invoke(v20, v5);
                goto LABEL_35;
              }
              uint64_t v31 = [v16 changedObjectID];
              __40__PPEventCache_refreshCacheWithChanges___block_invoke((void *)v31, v59);

              uint64_t v32 = [v16 originalItemID];
              LOBYTE(v31) = v32 == 0;

              if ((v31 & 1) == 0)
              {
                NSUInteger v20 = [v16 originalItemID];
                __40__PPEventCache_refreshCacheWithChanges___block_invoke(v20, v5);
                goto LABEL_35;
              }
            }
            else
            {
              id v19 = pp_events_log_handle();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v16;
                _os_log_debug_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEBUG, "PPEventChange: filtered out subscribed calendar event change %@", buf, 0xCu);
              }

              NSUInteger v20 = [v16 changedObjectID];
              __40__PPEventCache_refreshCacheWithChanges___block_invoke(v20, v59);
LABEL_35:
            }
LABEL_36:

            goto LABEL_10;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v21 = v13;
            if ([v21 changeType] == 2) {
              goto LABEL_31;
            }
            uint64_t v22 = v63->_storage;
            id v23 = [v21 ownerID];
            uint64_t v24 = [v57 objectForKeyedSubscript:v23];
            LODWORD(v22) = [(PPEventStorage *)v22 shouldIgnoreEventsOnCalendarWithObjectID:v24];

            if (!v22)
            {
LABEL_31:
              uint64_t v26 = [v21 ownerID];
              __40__PPEventCache_refreshCacheWithChanges___block_invoke(v26, v5);
            }
            else
            {
              uint64_t v25 = pp_events_log_handle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v21;
                _os_log_debug_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_DEBUG, "PPEventChange: filtered out subscribed calendar event participant change %@", buf, 0xCu);
              }

              uint64_t v26 = [v21 changedObjectID];
              __40__PPEventCache_refreshCacheWithChanges___block_invoke(v26, v59);
            }
          }
        }
        else
        {
          objc_opt_class();
          objc_opt_class();
          objc_opt_class();
          objc_opt_class();
        }
LABEL_10:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v33 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
      uint64_t v10 = v33;
    }
    while (v33);
  }

  v34 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v35 = [v59 setByAddingObjectsFromSet:v5];
  id v36 = v35;
  if (v63)
  {
    data = v63->_data;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __36__PPEventCache__deleteCachedEvents___block_invoke;
    uint64_t v88 = &unk_1E65D6600;
    id v38 = v36;
    *(void *)&long long v89 = v36;
    [(_PASLock *)data runWithLockAcquired:buf];

    id v36 = v38;
  }
  uint64_t v56 = v36;

  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  uint64_t v78 = __Block_byref_object_copy__6584;
  __int16 v79 = __Block_byref_object_dispose__6585;
  id v80 = 0;
  v39 = v63->_data;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_71;
  v74[3] = &unk_1E65D65D8;
  void v74[4] = &v75;
  [(_PASLock *)v39 runWithLockAcquired:v74];
  uint64_t v62 = objc_opt_new();
  unint64_t v40 = [v5 count];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v60 = v5;
  uint64_t v41 = [v60 countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v71;
    do
    {
      uint64_t v43 = 0;
      unint64_t v58 = v40 - v41;
      do
      {
        if (*(void *)v71 != v42) {
          objc_enumerationMutation(v60);
        }
        uint64_t v44 = *(void *)(*((void *)&v70 + 1) + 8 * v43);
        v45 = (void *)MEMORY[0x1CB79D060]();
        v46 = v63->_storage;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_2_74;
        v67[3] = &unk_1E65D9138;
        v67[4] = v63;
        v67[5] = v44;
        long long v69 = &v75;
        id v68 = v62;
        [(PPEventStorage *)v46 runBlockWithPurgerDisabled:v67];
        if (!(v40 % 0xA)) {
          [(PPEventStorage *)v63->_storage attemptToPurgeImmediately];
        }

        ++v43;
        --v40;
      }
      while (v41 != v43);
      uint64_t v41 = [v60 countByEnumeratingWithState:&v70 objects:v85 count:16];
      unint64_t v40 = v58;
    }
    while (v41);
  }

  v47 = objc_opt_new();
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_4_77;
  v64[3] = &unk_1E65DBF18;
  id v48 = v47;
  id v65 = v48;
  long long v66 = v63;
  double v49 = objc_msgSend(v62, "_pas_mappedArrayWithTransform:", v64);

  v50 = pp_events_log_handle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = v76[5];
    *(_DWORD *)buf = 138413059;
    *(void *)&uint8_t buf[4] = v51;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v56;
    *(_WORD *)&buf[22] = 2117;
    uint64_t v88 = v49;
    LOWORD(v89) = 2112;
    *(void *)((char *)&v89 + 2) = obj;
    _os_log_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_DEFAULT, "PPEventCache: dateInterval for cache: %@, affected object IDs: %@, resulting PPEvents: %{sensitive}@, changes %@", buf, 0x2Au);
  }

  id v52 = v49;
  if ([v52 count])
  {
    double v53 = v63->_data;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = __37__PPEventCache__refreshCachedEvents___block_invoke;
    uint64_t v88 = &unk_1E65D64E0;
    *(void *)&long long v89 = v52;
    *((void *)&v89 + 1) = v63;
    [(_PASLock *)v53 runWithLockAcquired:buf];
  }
  v54 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v52 second:v56];

  _Block_object_dispose(&v75, 8);
  return v54;
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if ([v4 entityType] == 2) {
    [v3 addObject:v4];
  }
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke_71(uint64_t a1, void *a2)
{
  double v8 = a2;
  if ([v8[2] count])
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v8[2], "firstIndex"));
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v8[2], "lastIndex"));
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke_2_74(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PPEventCache_refreshCacheWithChanges___block_invoke_3_76;
  v5[3] = &unk_1E65DBEF0;
  id v6 = *(id *)(a1 + 48);
  [v2 enumerateEventsFromEKObjectIDs:v3 expandingRecurrencesInRange:v4 usingBlock:v5];
}

uint64_t __40__PPEventCache_refreshCacheWithChanges___block_invoke_4_77(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 24));
}

void __37__PPEventCache__refreshCachedEvents___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = pp_events_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v3[1] count];
    int v12 = 134217984;
    uint64_t v13 = v9;
    _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPEventCache: cached event count before refresh: %tu", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v5 = pp_events_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 138739971;
    uint64_t v13 = v10;
    _os_log_debug_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEBUG, "PPEventCache: refreshing events: %{sensitive}@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v6 = mergeDeduping(v3[1], *(void **)(a1 + 32));
  id v7 = v3[1];
  v3[1] = (id)v6;

  double v8 = pp_events_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v3[1] count];
    int v12 = 134217984;
    uint64_t v13 = v11;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPEventCache: cached event count after refresh: %tu", (uint8_t *)&v12, 0xCu);
  }

  -[PPEventCache _scheduleCacheBackingFileUpdate](*(void *)(a1 + 40));
}

- (void)_scheduleCacheBackingFileUpdate
{
  if (a1)
  {
    unsigned __int8 v2 = atomic_exchange((atomic_uchar *volatile)(a1 + 32), 1u);
    id v3 = pp_events_log_handle();
    uint64_t v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEBUG, "PPEventCache: cache backing plist file update already scheduled", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPEventCache: scheduling cache backing plist file update", buf, 2u);
      }

      uint64_t v5 = (void *)os_transaction_create();
      *(void *)buf = 0;
      objc_initWeak((id *)buf, (id)a1);
      dispatch_time_t v6 = [MEMORY[0x1E4F93B18] dispatchTimeWithSecondsFromNow:0.5];
      id v7 = *(NSObject **)(a1 + 40);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke;
      v9[3] = &unk_1E65DBF60;
      objc_copyWeak(&v11, (id *)buf);
      id v10 = v5;
      id v8 = v5;
      dispatch_after(v6, v7, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[2];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke_2;
    v5[3] = &unk_1E65D64E0;
    dispatch_time_t v6 = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    [v4 runWithLockAcquired:v5];
  }
}

id __47__PPEventCache__scheduleCacheBackingFileUpdate__block_invoke_2(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 32) + 32));
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    [*(id *)(v1 + 16) runWithLockAcquired:&__block_literal_global_6613];
  }
  return self;
}

void __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = a2;
  id v3 = objc_msgSend(v2[1], "_pas_mappedArrayWithTransform:", &__block_literal_global_44);
  if ([v2[5] isEqual:v3])
  {
    uint64_t v4 = pp_events_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "PPEventCache: cache backing plist file already up to date";
LABEL_6:
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F93B50] lazyPlistArrayWithPlistArray:v3];
    id v7 = v2[5];
    v2[5] = (id)v6;

    uint64_t v4 = pp_events_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "PPEventCache: wrote new cache backing plist file";
      goto LABEL_6;
    }
  }

  id v8 = v2[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke_46;
  v13[3] = &unk_1E65D6548;
  uint64_t v14 = v2;
  uint64_t v9 = v2;
  id v10 = objc_msgSend(v8, "_pas_mappedArrayWithIndexedTransform:", v13);
  uint64_t v11 = [v10 mutableCopy];
  id v12 = v2[1];
  v2[1] = (id)v11;
}

id __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc(MEMORY[0x1E4F89E00]);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 40);
  id v8 = [*(id *)(v6 + 8) objectAtIndexedSubscript:a3];
  uint64_t v9 = [v8 calendar];
  id v10 = (void *)[v5 initWithIndex:a3 inBackingPlists:v7 calendar:v9];

  return v10;
}

uint64_t __50__PPEventCache__updateCacheBackingFileImmediately__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 plist];
}

void __40__PPEventCache_refreshCacheWithChanges___block_invoke_3_76(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F89E00] deferredAllocationEventFromEKEvent:a2];
  [v2 addObject:v3];
}

void __36__PPEventCache__deleteCachedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8[1] count];
  if (v3)
  {
    uint64_t v4 = v3 - 1;
    do
    {
      id v5 = [v8[1] objectAtIndexedSubscript:v4];
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = [v5 objectID];
      LODWORD(v6) = [v6 containsObject:v7];

      if (v6) {
        [v8[1] removeObjectAtIndex:v4];
      }

      --v4;
    }
    while (v4 != -1);
  }
}

uint64_t __40__PPEventCache_refreshCacheWithChanges___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 changedObjectID];
}

uint64_t __40__PPEventCache_refreshCacheWithChanges___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 calendarID];
}

BOOL __40__PPEventCache_refreshCacheWithChanges___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 calendarID];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __31__PPEventCache_objectForRange___block_invoke_49(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = [MEMORY[0x1E4F89E00] deferredAllocationEventFromEKEvent:v7];
  uint64_t v6 = _Block_copy(v5);

  [v3 addObject:v6];
}

uint64_t __31__PPEventCache_objectForRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 24));
}

- (void)setExtraSecondsToBackfill:(unint64_t)a3
{
  data = self->_data;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PPEventCache_setExtraSecondsToBackfill___block_invoke;
  v4[3] = &__block_descriptor_40_e33_v16__0__PPEventCacheGuardedData_8l;
  void v4[4] = a3;
  [(_PASLock *)data runWithLockAcquired:v4];
}

uint64_t __42__PPEventCache_setExtraSecondsToBackfill___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(result + 32);
  return result;
}

- (PPEventCache)initWithEventStorage:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PPEventCache.m", 80, @"Invalid parameter not satisfying: %@", @"eventStorage" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)PPEventCache;
  id v7 = [(PPEventCache *)&v33 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_storage, a3);
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = (void *)v9[1];
    v9[1] = v10;

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = (void *)v9[2];
    v9[2] = v12;

    v9[3] = 3600;
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = (void *)v9[4];
    void v9[4] = v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v9];
    data = v8->_data;
    v8->_data = (_PASLock *)v16;

    uint64_t v18 = objc_opt_new();
    calendarInternPool = v8->_calendarInternPool;
    v8->_calendarInternPool = (PPCalendarInternPool *)v18;

    NSUInteger v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.proactive.PPEventCache", v21);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v22;

    dispatch_source_t v24 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, (dispatch_queue_t)v8->_queue);
    memoryPressureSource = v8->_memoryPressureSource;
    v8->_memoryPressureSource = (OS_dispatch_source *)v24;

    id location = 0;
    objc_initWeak(&location, v8);
    uint64_t v26 = v8->_memoryPressureSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__PPEventCache_initWithEventStorage___block_invoke;
    handler[3] = &unk_1E65DBF60;
    objc_copyWeak(&v31, &location);
    uint64_t v30 = v8;
    dispatch_source_set_event_handler(v26, handler);
    dispatch_resume((dispatch_object_t)v8->_memoryPressureSource);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __37__PPEventCache_initWithEventStorage___block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    WeakRetained[7] = (dispatch_source_t)dispatch_source_get_data(WeakRetained[6]);
    WeakRetained = v9;
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = v3[7];
      switch(v4)
      {
        case 4:
          id v5 = pp_events_log_handle();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            __int16 v10 = 0;
            id v7 = "PPEventCache: memory pressure critical";
            id v8 = (uint8_t *)&v10;
LABEL_13:
            _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, v7, v8, 2u);
          }
          break;
        case 2:
          id v5 = pp_events_log_handle();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v11 = 0;
            id v7 = "PPEventCache: memory pressure warning";
            id v8 = v11;
            goto LABEL_13;
          }
          break;
        case 1:
          id v5 = pp_events_log_handle();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPEventCache: memory pressure normal", buf, 2u);
          }
          uint64_t v6 = 3600;
          goto LABEL_15;
        default:
          goto LABEL_16;
      }
      uint64_t v6 = 0;
LABEL_15:

      [v3 setExtraSecondsToBackfill:v6];
      WeakRetained = v9;
    }
  }
LABEL_16:
}

@end