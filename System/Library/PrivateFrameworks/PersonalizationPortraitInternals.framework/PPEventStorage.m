@interface PPEventStorage
+ (id)defaultStorage;
- (BOOL)_isAllDayOrMultiDayEvent:(BOOL)a1;
- (BOOL)attemptToPurgeImmediately;
- (BOOL)eventKitChangeIsEvent:(id)a3;
- (BOOL)shouldIgnoreEventsOnCalendarWithObjectID:(id)a3;
- (BOOL)shouldIngestEvent:(id)a3;
- (PPEventStorage)init;
- (PPEventStorage)initWithEventStorePurger:(id)a3;
- (PPEventStorage)initWithEventStorePurgerGetter:(id)a3;
- (id)_loadCalendars;
- (id)eventWithExternalID:(id)a3;
- (id)eventWithIdentifier:(id)a3;
- (id)eventsInRange:(_NSRange)a3;
- (id)nlEventsInRange:(_NSRange)a3;
- (id)resolveEventFromEKChange:(id)a3;
- (id)suggestedEventsInRange:(_NSRange)a3 ekStore:(id)a4;
- (void)clearCaches;
- (void)enumerateEventsFromEKObjectIDs:(id)a3 expandingRecurrencesInRange:(id)a4 usingBlock:(id)a5;
- (void)enumerateEventsFromEKObjectIDs:(void *)a3 expandingRecurrencesInRange:(char)a4 withFiltering:(void *)a5 usingBlock:;
- (void)enumerateEventsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)iterateEventsFrom:(id)a3 to:(id)a4 inChunks:(int)a5 withBlock:(id)a6;
- (void)runBlockWithPurgerDisabled:(id)a3;
- (void)setInvisibleCalendarIdentifiers:(id)a3;
@end

@implementation PPEventStorage

- (id)suggestedEventsInRange:(_NSRange)a3 ekStore:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = pp_events_log_handle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (length < 0x127501)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPEventStorage: suggestedEventsInRange: short query, using date range predicate", buf, 2u);
    }

    v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)location];
    v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(location + length)];
    uint64_t v14 = [v7 predicateForEventsWithStartDate:v12 endDate:v13 calendars:0];
    if (v14)
    {
      v15 = (void *)v14;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke_49;
      v21[3] = &unk_1E65D9448;
      v21[4] = self;
      id v22 = v8;
      [v7 enumerateEventsMatchingPredicate:v15 usingBlock:v21];

      goto LABEL_10;
    }
    v19 = pp_events_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      NSUInteger v28 = location;
      __int16 v29 = 2048;
      NSUInteger v30 = length;
      _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "PPEventStorage: EventKit returned a nil predicate for Events range: (%tu, %tu)", buf, 0x16u);
    }

LABEL_18:
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPEventStorage: suggestedEventsInRange: large query, using suggested event predicate", buf, 2u);
  }

  uint64_t v11 = [v7 predicateForEventsCreatedFromSuggestion];
  if (!v11)
  {
    v12 = pp_events_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPEventStorage: EventKit returned a nil predicate for predicateForEventsCreatedFromSuggestion", buf, 2u);
    }
    goto LABEL_18;
  }
  v12 = v11;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke;
  v23[3] = &unk_1E65D9420;
  NSUInteger v25 = location;
  NSUInteger v26 = length;
  id v24 = v8;
  [v7 enumerateEventsMatchingPredicate:v12 usingBlock:v23];
  v13 = v24;
LABEL_10:

  uint64_t v16 = [v8 sortedArrayUsingSelector:sel_compareStartDateWithEvent_];
  v12 = v16;
  v17 = (void *)MEMORY[0x1E4F1CBF0];
  if (v16) {
    v17 = (void *)v16;
  }
  id v18 = v17;
LABEL_19:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_purgerGetter, 0);
}

- (void)setInvisibleCalendarIdentifiers:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PPEventStorage_setInvisibleCalendarIdentifiers___block_invoke;
  v7[3] = &unk_1E65D95A8;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __50__PPEventStorage_setInvisibleCalendarIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithArray:*(void *)(a1 + 32)];
  id v6 = (id)v4[3];
  v4[3] = v5;
}

- (void)clearCaches
{
}

void __29__PPEventStorage_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)a2[2];
  a2[2] = 0;
  v3 = a2;

  id v4 = (id)v3[4];
  v3[4] = 0;
}

- (BOOL)shouldIgnoreEventsOnCalendarWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PPEventStorage_shouldIgnoreEventsOnCalendarWithObjectID___block_invoke;
    v9[3] = &unk_1E65D9580;
    v9[4] = self;
    uint64_t v11 = &v12;
    id v10 = v4;
    [(_PASLock *)lock runWithLockAcquired:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __59__PPEventStorage_shouldIgnoreEventsOnCalendarWithObjectID___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a2[4];
  if (!v3)
  {
    uint64_t v5 = (void *)a1[4];
    id v6 = a2;
    id v7 = -[PPEventStorage _loadCalendars](v5);
    v3 = (void *)a2[4];
  }
  uint64_t result = [v3 containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result ^ 1;
  return result;
}

- (id)_loadCalendars
{
  if (a1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = &v4;
    uint64_t v6 = 0x3032000000;
    id v7 = __Block_byref_object_copy__18072;
    id v8 = __Block_byref_object_dispose__18073;
    id v9 = 0;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __32__PPEventStorage__loadCalendars__block_invoke;
    v3[3] = &unk_1E65D9660;
    v3[5] = &v4;
    v3[6] = sel__loadCalendars;
    v3[4] = a1;
    [a1 runBlockWithPurgerDisabled:v3];
    id v1 = (id)v5[5];
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

uint64_t __32__PPEventStorage__loadCalendars__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  uint64_t v1 = *(void *)(a1 + 48);
  long long v2 = *(_OWORD *)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[2] = __32__PPEventStorage__loadCalendars__block_invoke_2;
  v5[3] = &unk_1E65D9638;
  uint64_t v7 = v1;
  long long v6 = v2;
  return [v3 runWithLockAcquired:v5];
}

void __32__PPEventStorage__loadCalendars__block_invoke_2(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = pp_events_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPEventStorage: loading calendars", buf, 2u);
  }

  uint64_t v5 = (void *)[v3 ekStore];
  if (!v5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a1[6], a1[4], @"PPEventStorage.m", 583, @"Invalid parameter not satisfying: %@", @"[guardedData ekStore]" object file lineNumber description];
  }
  long long v6 = (void *)[v3 ekStore];
  uint64_t v7 = [v6 calendarsForEntityType:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __32__PPEventStorage__loadCalendars__block_invoke_82;
  v24[3] = &unk_1E65D95D0;
  id v8 = v3;
  id v25 = v8;
  uint64_t v9 = objc_msgSend(v7, "_pas_filteredArrayWithTest:", v24);
  uint64_t v10 = *(void *)(a1[5] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v13 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_87_18080);
  uint64_t v14 = [v12 initWithArray:v13];
  char v15 = (void *)v8[2];
  v8[2] = v14;

  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v17 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_90);
  uint64_t v18 = [v16 initWithArray:v17];
  v19 = (void *)v8[4];
  v8[4] = v18;

  v20 = pp_events_log_handle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [*(id *)(*(void *)(a1[5] + 8) + 40) count];
    uint64_t v22 = *(void *)(*(void *)(a1[5] + 8) + 40);
    *(_DWORD *)buf = 134218243;
    uint64_t v27 = v21;
    __int16 v28 = 2113;
    uint64_t v29 = v22;
    _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPEventStorage: will use %tu calendars: %{private}@", buf, 0x16u);
  }
}

uint64_t __32__PPEventStorage__loadCalendars__block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3
    || ([v3 isSubscribed] & 1) != 0
    || ([v3 source],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isDelegate],
        v4,
        (v5 & 1) != 0)
    || [v3 type] == 4)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v9 = [v3 calendarIdentifier];
    LODWORD(v8) = [v8 containsObject:v9];

    uint64_t v6 = v8 ^ 1;
  }

  return v6;
}

uint64_t __32__PPEventStorage__loadCalendars__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

id __32__PPEventStorage__loadCalendars__block_invoke_2_84(uint64_t a1, void *a2)
{
  long long v2 = [a2 calendarIdentifier];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)shouldIngestEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PPEventStorage_shouldIngestEvent___block_invoke;
  v8[3] = &unk_1E65D9580;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __36__PPEventStorage_shouldIngestEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = a2;
  id v3 = (void *)v10[2];
  if (!v3)
  {
    id v4 = -[PPEventStorage _loadCalendars](*(void **)(a1 + 32));
    id v3 = (void *)v10[2];
  }
  char v5 = [*(id *)(a1 + 40) calendar];
  id v6 = [v5 calendarIdentifier];
  char v7 = [v3 containsObject:v6];

  if (v7)
  {
    BOOL v8 = -[PPEventStorage _isAllDayOrMultiDayEvent:](*(void *)(a1 + 32), *(void **)(a1 + 40));
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!v8)
    {
      *(unsigned char *)(v9 + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v9 + 24) = 0;
LABEL_8:
}

- (BOOL)_isAllDayOrMultiDayEvent:(BOOL)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isAllDay])
    {
      a1 = 1;
    }
    else
    {
      char v5 = [v4 endDate];
      id v6 = [v4 startDate];
      [v5 timeIntervalSinceDate:v6];
      a1 = v7 >= 86400.0;
    }
  }

  return a1;
}

- (BOOL)eventKitChangeIsEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v3 entityType] == 2;

  return v4;
}

- (id)eventWithExternalID:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    char v15 = __Block_byref_object_copy__18072;
    id v16 = __Block_byref_object_dispose__18073;
    id v17 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__PPEventStorage_eventWithExternalID___block_invoke;
    v9[3] = &unk_1E65D9338;
    id v10 = v4;
    uint64_t v11 = &v12;
    [(_PASLock *)lock runWithLockAcquired:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __38__PPEventStorage_eventWithExternalID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 ekStore];
  id v4 = [v3 calendarItemsWithExternalIdentifier:*(void *)(a1 + 32)];

  if ([v4 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)enumerateEventsFromEKObjectIDs:(id)a3 expandingRecurrencesInRange:(id)a4 usingBlock:(id)a5
{
}

- (void)enumerateEventsFromEKObjectIDs:(void *)a3 expandingRecurrencesInRange:(char)a4 withFiltering:(void *)a5 usingBlock:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1 && [v9 count])
  {
    long long v12 = objc_opt_new();
    long long v13 = *(void **)(a1 + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __102__PPEventStorage_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_withFiltering_usingBlock___block_invoke;
    v15[3] = &unk_1E65D9558;
    char v21 = a4;
    id v16 = v9;
    uint64_t v17 = a1;
    id v18 = v10;
    id v19 = v12;
    id v20 = v11;
    id v14 = v12;
    [v13 runWithLockAcquired:v15];
  }
}

void __102__PPEventStorage_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_withFiltering_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v84 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v81;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v81 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v80 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1CB79D060]();
        id v10 = (void *)MEMORY[0x1CB79D060]();
        id v11 = (void *)[v3 ekStore];
        long long v12 = [v11 publicObjectWithObjectID:v8];

        if (!v12)
        {
          uint64_t v22 = pp_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v86 = v8;
            v23 = v22;
            id v24 = "PPEventStorage: objectID %@ no longer exists, probably deleted";
            goto LABEL_35;
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v22 = pp_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412547;
            uint64_t v86 = v8;
            __int16 v87 = 2117;
            v88 = v12;
            _os_log_fault_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_FAULT, "PPEventStorage: saw non-ekevent: %@ %{sensitive}@", buf, 0x16u);
          }
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v13 = [v12 startDate];
        if (!v13
          || (id v14 = (void *)v13,
              [v12 endDate],
              char v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v14,
              !v15))
        {
          uint64_t v22 = pp_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v86 = v8;
            v23 = v22;
            id v24 = "PPEventStorage: objectID %@ has no startDate and/or endDate, probably deleted";
LABEL_35:
            _os_log_debug_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
          }
          goto LABEL_25;
        }
        if (*(unsigned char *)(a1 + 72) && ([*(id *)(a1 + 40) shouldIngestEvent:v12] & 1) == 0)
        {
          uint64_t v22 = pp_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v27 = [v12 startDate];
            [v12 title];
            __int16 v28 = v77 = a1;
            *(_DWORD *)buf = 138412803;
            uint64_t v86 = v8;
            __int16 v87 = 2113;
            v88 = v27;
            __int16 v89 = 2117;
            v90 = v28;
            _os_log_debug_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs skipping objectID %@ because shouldIngestEvent returned NO: %{private}@ %{sensitive}@", buf, 0x20u);

            a1 = v77;
          }
          goto LABEL_25;
        }
        if (!*(void *)(a1 + 48)
          || ([v12 isDetached] & 1) != 0
          || ([v12 hasRecurrenceRules] & 1) == 0)
        {
          id v25 = (void *)MEMORY[0x1CB79D060]();
          NSUInteger v26 = pp_default_log_handle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            contextb = [v12 startDate];
            [v12 title];
            v54 = uint64_t v78 = a1;
            *(_DWORD *)buf = 138412803;
            uint64_t v86 = v8;
            __int16 v87 = 2113;
            v88 = contextb;
            __int16 v89 = 2117;
            v90 = v54;
            _os_log_debug_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs calling block for objectID %@ without recurrence expansion: %{private}@ %{sensitive}@", buf, 0x20u);

            a1 = v78;
          }

          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_26:
          if (v84) {
            goto LABEL_73;
          }
          goto LABEL_27;
        }
        v61 = (void *)MEMORY[0x1CB79D060]();
        id v16 = pp_default_log_handle();
        uint64_t v76 = a1;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v56 = [v12 startDate];
          v57 = [v12 title];
          *(_DWORD *)buf = 138412803;
          uint64_t v86 = v8;
          __int16 v87 = 2113;
          v88 = v56;
          __int16 v89 = 2117;
          v90 = v57;
          _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs will expand recurrences for objectID %@: %{private}@ %{sensitive}@", buf, 0x20u);

          a1 = v76;
        }

        uint64_t v17 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
        if (v84)
        {
LABEL_73:

          goto LABEL_74;
        }
        id v18 = (void *)MEMORY[0x1CB79D060](v17);
        id v19 = [v12 exceptionDates];
        id v20 = v19;
        if (v19)
        {
          id v21 = v19;
        }
        else
        {
          id v21 = [MEMORY[0x1E4F1CAD0] set];
        }
        v71 = v21;

        context = (void *)MEMORY[0x1CB79D060]();
        uint64_t v29 = [v12 detachedItems];
        uint64_t v30 = objc_msgSend(v29, "_pas_mappedSetWithTransform:", &__block_literal_global_70_18103);
        uint64_t v31 = v30;
        if (v30)
        {
          id v32 = v30;
        }
        else
        {
          id v32 = [MEMORY[0x1E4F1CAD0] set];
        }
        v33 = v32;

        v34 = (void *)MEMORY[0x1CB79D060]();
        contexta = [v71 setByAddingObjectsFromSet:v33];

        uint64_t v35 = [v12 startCalendarDate];
        uint64_t v36 = [v12 recurrenceRules];
        uint64_t v37 = [v12 persistentObject];
        v70 = (void *)v36;
        v72 = (void *)v35;
        v69 = (void *)v37;
        if (v36) {
          BOOL v38 = v37 == 0;
        }
        else {
          BOOL v38 = 1;
        }
        char v39 = v38;
        char v60 = v39;
        if (v38)
        {
          v40 = pp_default_log_handle();
          a1 = v76;
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_66;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = v8;
          v41 = v40;
          v42 = "PPEventStorage: objectID %@ has lost its recurrenceRules and/or persistentObject, probably deleted";
LABEL_64:
          _os_log_debug_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);
          goto LABEL_66;
        }
        a1 = v76;
        if (!v35)
        {
          v40 = pp_default_log_handle();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_66;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = v8;
          v41 = v40;
          v42 = "PPEventStorage: enumerateEventsFromEKObjectIDs cancelled expanding recurrences for objectID %@ (startCal"
                "endarDate was nil)";
          goto LABEL_64;
        }
        v40 = [*(id *)(v76 + 48) startDate];
        if (!v84)
        {
          unint64_t v43 = 0;
          uint64_t v59 = v6;
          while (1)
          {
            v64 = v40;
            unint64_t v44 = v43;
            v68 = (void *)MEMORY[0x1CB79D060]();
            v63 = *(void **)(a1 + 56);
            v45 = (void *)MEMORY[0x1E4F57838];
            v66 = [MEMORY[0x1E4F1CAF0] calendarTimeZone];
            v46 = [v45 calendarDateWithDate:v40 timeZone:v66];
            unint64_t v62 = v44;
            v40 = [v63 nextOccurrenceDateWithEKRecurrences:v70 forCalendarItem:v12 exceptionDates:contexta initialDate:v72 afterDate:v46 inclusive:v44 == 0];

            if (!v40 || ![*(id *)(a1 + 48) containsDate:v40]) {
              break;
            }
            v47 = [v12 startDate];
            char v48 = [v40 isEqual:v47];

            uint64_t v6 = v59;
            if ((v48 & 1) == 0)
            {
              v49 = (void *)MEMORY[0x1CB79D060]();
              v50 = (void *)[objc_alloc(MEMORY[0x1E4F25538]) initWithPersistentObject:v69 occurrenceDate:v40];
              v51 = pp_default_log_handle();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                [v50 startDate];
                v52 = v67 = v40;
                [v50 title];
                v53 = v65 = v50;
                *(_DWORD *)buf = 138412803;
                uint64_t v86 = v8;
                __int16 v87 = 2113;
                v88 = v52;
                __int16 v89 = 2117;
                v90 = v53;
                _os_log_debug_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs object ID %@ calling block for occurrence: %{private}@ %{sensitive}@", buf, 0x20u);

                v50 = v65;
                v40 = v67;
              }

              (*(void (**)(void))(*(void *)(v76 + 64) + 16))();
            }
            a1 = v76;
            if (v62 <= 0x12)
            {
              unint64_t v43 = v62 + 1;
              if (!v84) {
                continue;
              }
            }
            goto LABEL_66;
          }
          uint64_t v6 = v59;
        }
LABEL_66:

        char v55 = v60;
        if (!v84) {
          char v55 = 1;
        }
        if ((v55 & 1) == 0) {
          goto LABEL_73;
        }
LABEL_27:

        ++v7;
      }
      while (v7 != v5);
      uint64_t v58 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
      uint64_t v5 = v58;
    }
    while (v58);
  }
LABEL_74:
}

uint64_t __102__PPEventStorage_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_withFiltering_usingBlock___block_invoke_67(uint64_t a1, void *a2)
{
  return [a2 recurrenceDate];
}

- (id)resolveEventFromEKChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    char v15 = __Block_byref_object_copy__18072;
    id v16 = __Block_byref_object_dispose__18073;
    id v17 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__PPEventStorage_resolveEventFromEKChange___block_invoke;
    v9[3] = &unk_1E65D9338;
    id v10 = v4;
    id v11 = &v12;
    [(_PASLock *)lock runWithLockAcquired:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __43__PPEventStorage_resolveEventFromEKChange___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) entityType] == 2)
  {
    id v3 = (void *)[v7 ekStore];
    uint64_t v4 = [v3 publicObjectWithObjectID:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)iterateEventsFrom:(id)a3 to:(id)a4 inChunks:(int)a5 withBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!a5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PPEventStorage.m", 313, @"Invalid parameter not satisfying: %@", @"numberOfChunks" object file lineNumber description];
  }
  lock = self->_lock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke;
  v19[3] = &unk_1E65D9510;
  id v20 = v12;
  id v21 = v11;
  int v24 = a5;
  uint64_t v22 = self;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  [(_PASLock *)lock runWithLockAcquired:v19];
}

void __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(a1 + 40)];
  double v6 = v5;
  int v7 = *(_DWORD *)(a1 + 64);
  uint64_t v8 = -[PPEventStorage _loadCalendars](*(void **)(a1 + 48));
  if (*(int *)(a1 + 64) >= 1)
  {
    int v9 = 0;
    double v10 = v6 / (double)v7;
    double v11 = 0.0;
    do
    {
      id v12 = (void *)MEMORY[0x1CB79D060]();
      if (v9) {
        [*(id *)(a1 + 48) attemptToPurgeImmediately];
      }
      id v13 = [*(id *)(a1 + 40) dateByAddingTimeInterval:v11];
      uint64_t v14 = [v13 dateByAddingTimeInterval:v10];
      [v14 timeIntervalSinceReferenceDate];
      double v16 = v15;
      [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
      if (v16 >= v17)
      {
        id v18 = *(id *)(a1 + 32);

        uint64_t v14 = v18;
      }
      id v19 = *(void **)(a1 + 48);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_2;
      v22[3] = &unk_1E65D94E8;
      id v23 = v3;
      id v24 = v13;
      id v25 = v14;
      id v26 = v8;
      id v27 = v4;
      id v28 = *(id *)(a1 + 56);
      id v20 = v14;
      id v21 = v13;
      [v19 runBlockWithPurgerDisabled:v22];
      double v11 = v10 + v11;

      ++v9;
    }
    while (v9 < *(_DWORD *)(a1 + 64));
  }
}

void __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_2(uint64_t a1)
{
  long long v2 = (void *)[*(id *)(a1 + 32) ekStore];
  id v3 = [v2 predicateForEventsWithStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) calendars:*(void *)(a1 + 56)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_3;
  v4[3] = &unk_1E65D94C0;
  id v5 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 72);
  [v2 enumerateEventsMatchingPredicate:v3 usingBlock:v4];
}

void __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "hash"));
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = *(void **)(a1 + 32);
    int v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "hash"));
    [v6 addObject:v7];
  }
}

- (id)nlEventsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__18072;
  double v17 = __Block_byref_object_dispose__18073;
  id v18 = 0;
  id v18 = (id)objc_opt_new();
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__PPEventStorage_nlEventsInRange___block_invoke;
  v12[3] = &unk_1E65D9498;
  v12[5] = location;
  v12[6] = length;
  v12[4] = &v13;
  [(_PASLock *)lock runWithLockAcquired:v12];
  uint64_t v7 = [(id)v14[5] sortedArrayUsingSelector:sel_compareStartDateWithEvent_];
  id v8 = (void *)v7;
  int v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    int v9 = (void *)v7;
  }
  id v10 = v9;

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __34__PPEventStorage_nlEventsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[v3 ekStore];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)*(unint64_t *)(a1 + 40)];
  id v6 = [v4 predicateForNaturalLanguageSuggestedEventsWithSearchString:0 startDate:v5];

  uint64_t v7 = (void *)[v3 ekStore];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__PPEventStorage_nlEventsInRange___block_invoke_2;
  v8[3] = &unk_1E65D9470;
  long long v9 = *(_OWORD *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  [v7 enumerateEventsMatchingPredicate:v6 usingBlock:v8];
}

void __34__PPEventStorage_nlEventsInRange___block_invoke_2(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 startDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  unint64_t v6 = a1[5];
  if (v5 > (double)v6 && v5 < (double)(a1[6] + v6)) {
    [*(id *)(*(void *)(a1[4] + 8) + 40) addObject:v7];
  }
}

void __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 startDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  unint64_t v6 = *(void *)(a1 + 40);
  if (v5 > (double)v6 && v5 < (double)(*(void *)(a1 + 48) + v6)) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  if (v4)
  {
    double v5 = (void *)MEMORY[0x1CB79D060]();
    unint64_t v6 = [v7 customObjectForKey:@"SGEventMetadataKey"];

    if (v6) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
  else
  {
  }
}

- (void)enumerateEventsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__18072;
  uint64_t v36 = __Block_byref_object_dispose__18073;
  id v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke;
  v31[3] = &unk_1E65D93A8;
  v31[6] = location;
  v31[7] = length;
  v31[4] = self;
  v31[5] = &v32;
  [(PPEventStorage *)self runBlockWithPurgerDisabled:v31];
  [(PPEventStorage *)self attemptToPurgeImmediately];
  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)location];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 duration:(double)length];

  uint64_t v16 = [(id)v33[5] count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)v33[5];
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
LABEL_3:
    uint64_t v11 = 0;
    unint64_t v12 = v16;
    v16 -= v9;
    while (1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
      uint64_t v14 = (void *)MEMORY[0x1CB79D060]();
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_3;
      v19[3] = &unk_1E65D93F8;
      void v19[4] = self;
      v19[5] = v13;
      id v20 = v8;
      id v21 = v18;
      uint64_t v22 = &v23;
      [(PPEventStorage *)self runBlockWithPurgerDisabled:v19];
      if (!(v12 % 0xA)) {
        [(PPEventStorage *)self attemptToPurgeImmediately];
      }
      int v15 = *((unsigned __int8 *)v24 + 24);

      _Block_object_dispose(&v23, 8);
      if (v15) {
        break;
      }
      ++v11;
      --v12;
      if (v9 == v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v32, 8);
}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (!v2) {
    goto LABEL_4;
  }
  unint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__18072;
  uint64_t v32 = __Block_byref_object_dispose__18073;
  id v33 = 0;
  double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v3];
  unint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(v3 + v4)];
  id v7 = *(void **)(v2 + 16);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __59__PPEventStorage__predicateForRange_loadDefaultProperties___block_invoke;
  uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E65D9688;
  uint64_t v39 = &v28;
  id v8 = v5;
  uint64_t v36 = v8;
  id v9 = v6;
  id v37 = v9;
  uint64_t v38 = v2;
  char v40 = 0;
  [v7 runWithLockAcquired:buf];
  id v10 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v35 = __Block_byref_object_copy__18072;
    uint64_t v36 = __Block_byref_object_dispose__18073;
    id v37 = 0;
    unint64_t v12 = *(void **)(a1[4] + 16);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_45;
    v27[3] = &unk_1E65D9380;
    v27[4] = buf;
    [v12 runWithLockAcquired:v27];
    id v13 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_2;
    uint64_t v25 = &unk_1E65DBEF0;
    id v26 = v11;
    id v14 = v11;
    [v13 enumerateEventsMatchingPredicate:v10 usingBlock:&v22];

    uint64_t v15 = objc_msgSend(v14, "array", v22, v23, v24, v25);
    uint64_t v16 = *(void *)(a1[5] + 8);
    double v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
LABEL_4:
    id v18 = pp_events_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = a1[6];
      uint64_t v21 = a1[7];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v21;
      _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "PPEventStorage: EventKit returned a nil predicate for Events range: (%tu, %tu)", buf, 0x16u);
    }

    id v10 = 0;
    uint64_t v19 = *(void *)(a1[5] + 8);
    id v14 = *(id *)(v19 + 40);
    *(void *)(v19 + 40) = MEMORY[0x1E4F1CBF0];
  }
}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_3(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v14[0] = *(void *)(a1 + 40);
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v4 = *(void **)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_4;
  v9[3] = &unk_1E65D93D0;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v12 = v7;
  uint64_t v13 = v8;
  -[PPEventStorage enumerateEventsFromEKObjectIDs:expandingRecurrencesInRange:withFiltering:usingBlock:](v2, v3, v5, 0, v9);
}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_4(void *a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v5 = [v9 startDate];
  uint64_t v6 = [v9 endDate];
  id v7 = (void *)v6;
  if (v5 && v6 && [v5 compare:v6] != 1)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v7];
    if ([v8 intersectsDateInterval:a1[4]])
    {
      if (-[PPEventStorage _isAllDayOrMultiDayEvent:](a1[5], v9))
      {
        *a3 = 1;
      }
      else
      {
        (*(void (**)(void))(a1[6] + 16))();
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *a3;
      }
    }
  }
}

uint64_t __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_45(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 ekStore];
  return MEMORY[0x1F41817F8]();
}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectID];
  [v2 addObject:v3];
}

void __59__PPEventStorage__predicateForRange_loadDefaultProperties___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v4 = (void *)[v11 ekStore];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = -[PPEventStorage _loadCalendars](*(void **)(a1 + 48));
  uint64_t v8 = [v4 predicateForEventsWithStartDate:v5 endDate:v6 calendars:v7 loadDefaultProperties:*(unsigned __int8 *)(a1 + 64)];

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)eventsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__PPEventStorage_eventsInRange___block_invoke;
  v11[3] = &unk_1E65DA200;
  v11[4] = self;
  NSUInteger v13 = location;
  NSUInteger v14 = length;
  id v7 = v6;
  id v12 = v7;
  [(PPEventStorage *)self runBlockWithPurgerDisabled:v11];
  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __32__PPEventStorage_eventsInRange___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__PPEventStorage_eventsInRange___block_invoke_2;
  v3[3] = &unk_1E65DBEF0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateEventsInRange:usingBlock:", *(void *)(a1 + 48), *(void *)(a1 + 56), v3);
}

void __32__PPEventStorage_eventsInRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 startDate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [v6 endDate];

    if (v5) {
      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v6, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_42));
    }
  }
}

uint64_t __32__PPEventStorage_eventsInRange___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateWithEvent:");
}

- (id)eventWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  NSUInteger v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__18072;
  uint64_t v16 = __Block_byref_object_dispose__18073;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PPEventStorage_eventWithIdentifier___block_invoke;
  v9[3] = &unk_1E65D9338;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__PPEventStorage_eventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = (void *)MEMORY[0x1CB79D060]();
  id v4 = (void *)[v8 ekStore];
  uint64_t v5 = [v4 eventWithIdentifier:*(void *)(a1 + 32)];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)runBlockWithPurgerDisabled:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = (void *)MEMORY[0x1CB79D060]([(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_36]);
  v6[2]();
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_38];
}

uint64_t __45__PPEventStorage_runBlockWithPurgerDisabled___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40) - 1;
  *(void *)(a2 + 40) = v2;
  if (!v2) {
    return [*(id *)(a2 + 8) setPurgingAllowed:1];
  }
  return result;
}

uint64_t __45__PPEventStorage_runBlockWithPurgerDisabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = v2 + 1;
  if (!v2) {
    return [*(id *)(a2 + 8) setPurgingAllowed:0];
  }
  return result;
}

- (BOOL)attemptToPurgeImmediately
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PPEventStorage_attemptToPurgeImmediately__block_invoke;
  v5[3] = &unk_1E65D9338;
  void v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__PPEventStorage_attemptToPurgeImmediately__block_invoke(uint64_t a1, void *a2)
{
  char v3 = a2;
  if (v3[5])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    id v11 = v3;
    id v4 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v5 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v6 = [v11[1] acquireCachedEventStoreOrCreate:0];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 connection];
      [v8 disconnect];
    }
    uint64_t v9 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
    id v10 = v11[1];
    v11[1] = (id)v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    char v3 = v11;
  }
}

- (PPEventStorage)initWithEventStorePurgerGetter:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PPEventStorage;
  uint64_t v5 = [(PPEventStorage *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v4 copy];
    id purgerGetter = v5->_purgerGetter;
    v5->_id purgerGetter = (id)v7;

    uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v10 = (*((void (**)(void))v5->_purgerGetter + 2))();
    id v11 = (void *)v6[1];
    v6[1] = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v6];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v12;

    uint64_t v14 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.proactive.PPEventStorage.serialQueue" qosClass:9];
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v14;
  }
  return v5;
}

- (PPEventStorage)initWithEventStorePurger:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PPEventStorage_initWithEventStorePurger___block_invoke;
  v8[3] = &unk_1E65D92F0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(PPEventStorage *)self initWithEventStorePurgerGetter:v8];

  return v6;
}

id __43__PPEventStorage_initWithEventStorePurger___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PPEventStorage)init
{
  return [(PPEventStorage *)self initWithEventStorePurgerGetter:&__block_literal_global_27_18139];
}

id __22__PPEventStorage_init__block_invoke()
{
  self;
  v0 = objc_opt_new();
  [v0 setTimeout:0.5];
  [v0 setPurgingAllowed:1];
  [v0 setCreationBlock:&__block_literal_global_24];
  return v0;
}

id __31__PPEventStorage_ekStorePurger__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = PPNewEKEventStore();
  return v1;
}

+ (id)defaultStorage
{
  if (defaultStorage__pasOnceToken6 != -1) {
    dispatch_once(&defaultStorage__pasOnceToken6, &__block_literal_global_18145);
  }
  uint64_t v2 = (void *)defaultStorage__pasExprOnceResult;
  return v2;
}

void __32__PPEventStorage_defaultStorage__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)defaultStorage__pasExprOnceResult;
  defaultStorage__pasExprOnceResult = v1;
}

@end