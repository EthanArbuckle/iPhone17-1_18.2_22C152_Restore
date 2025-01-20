@interface PPLocalEventStore
+ (id)defaultStore;
- (BOOL)attemptToPurgeImmediately;
- (BOOL)iterEventNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5;
- (PPLocalEventStore)init;
- (PPLocalEventStore)initWithTrialWrapper:(id)a3 eventStorage:(id)a4;
- (double)_scoreForSecondsRelativeToNow:(double)a1;
- (id)customObjectForKey:(id)a3 eventIdentifier:(id)a4;
- (id)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5;
- (id)eventNameRecordsForClient:(id)a3 error:(id *)a4;
- (id)eventWithExternalID:(id)a3;
- (id)eventWithIdentifier:(id)a3;
- (id)eventsFromDate:(id)a3 toDate:(id)a4;
- (id)nlEventsFromDate:(id)a3 toDate:(id)a4;
- (id)resolveEventNameRecordChanges:(id)a3 client:(id)a4 error:(id *)a5;
- (id)scoredEventsWithQuery:(id)a3;
- (uint64_t)_isEventQueryRangeValidWithInterval:(double)a3 andDuration:;
- (void)_clearAndReloadAllCachesAndData;
- (void)_preloadEvents;
- (void)clearCaches;
- (void)enumerateEventsFromEKObjectIDs:(id)a3 expandingRecurrencesInRange:(id)a4 usingBlock:(id)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)runBlockWithPurgerDisabled:(id)a3;
@end

@implementation PPLocalEventStore

BOOL __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 expiration];
  BOOL v4 = [v2 compare:v3] != -1;

  return v4;
}

- (id)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v64 = a4;
  v7 = +[PPSettings sharedInstance];
  char v8 = [v7 bundleIdentifierIsEnabledForDonation:*MEMORY[0x1E4F8A040]];

  if (v8)
  {
    id obj = [(PPLocalEventStore *)self eventsFromDate:v65 toDate:v64];
    v67 = objc_opt_new();
    id v63 = +[PPEventRankerDateUtils dateTwoWeeksPriorToDate:v65];
    id v76 = v65;
    if (self)
    {
      v9 = [MEMORY[0x1E4F1C9C8] now];
      v10 = [v9 dateByAddingTimeInterval:1800.0];
      v11 = objc_opt_new();
      [v11 setFormatOptions:275];
      v12 = objc_opt_new();
      if (eventMetaDataFromDate_toDate__onceToken != -1) {
        dispatch_once(&eventMetaDataFromDate_toDate__onceToken, &__block_literal_global_148);
      }
      [(id)eventMetaDataFromDate_toDate__invalidationTimer runAfterDelaySeconds:1 coalescingBehavior:1800.0];
      v13 = +[PPEventMetadata eventMetadataWithTitlesAndParticipants:MEMORY[0x1E4F1CC08] earliestStartTime:0 eventCount:0 eventHasAlarmCount:-1.0];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_4;
      aBlock[3] = &unk_1E65D88F0;
      id v14 = v13;
      id v112 = v14;
      v15 = _Block_copy(aBlock);
      uint64_t v105 = 0;
      v106 = &v105;
      uint64_t v107 = 0x3032000000;
      v108 = __Block_byref_object_copy__16377;
      v109 = __Block_byref_object_dispose__16378;
      id v70 = v14;
      id v110 = v70;
      uint64_t v101 = 0;
      v102 = &v101;
      uint64_t v103 = 0x2020000000;
      uint64_t v104 = 0;
      uint64_t v97 = 0;
      v98 = &v97;
      uint64_t v99 = 0x2020000000;
      uint64_t v100 = 0;
      v16 = (void *)eventMetaDataFromDate_toDate__cacheLock;
      *(void *)v82 = MEMORY[0x1E4F143A8];
      uint64_t v83 = 3221225472;
      v84 = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_5;
      v85 = &unk_1E65D8988;
      v60 = v9;
      v86 = v60;
      id v74 = v63;
      id v87 = v74;
      v94 = &v101;
      v95 = &v97;
      v72 = (PPEventScorer *)v76;
      v88 = v72;
      v89 = self;
      id v71 = v15;
      id v93 = v71;
      v61 = v10;
      v90 = v61;
      v17 = v12;
      v91 = v17;
      id v66 = v11;
      id v92 = v66;
      v96 = &v105;
      [v16 runWithLockAcquired:v82];
      [(id)v106[5] earliestStartTime];
      if (v18 != -1.0)
      {
        id v19 = objc_alloc(MEMORY[0x1E4F1C9A8]);
        v20 = (void *)[v19 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
        v21 = [v20 components:16 fromDate:v74 toDate:v72 options:0];
        uint64_t v22 = [v21 day];
        if ((unint64_t)[v17 count] < 2
          || v22 < 9
          || (double)(unint64_t)[v17 count] / (double)(v22 + 1) < 0.55)
        {
          v23 = [(id)v106[5] titlesAndParticipants];
          uint64_t v24 = [(id)v106[5] eventCount];
          uint64_t v25 = +[PPEventMetadata eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:](PPEventMetadata, "eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v23, v24, [(id)v106[5] eventHasAlarmCount], -1.0);
          v26 = (void *)v106[5];
          v106[5] = v25;
        }
      }
      v27 = pp_events_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (uint64_t (*)(uint64_t, uint64_t))v102[3];
        uint64_t v29 = v98[3];
        [(id)v106[5] earliestStartTime];
        uint64_t v31 = v30;
        uint64_t v32 = [(id)v106[5] eventCount];
        uint64_t v33 = [(id)v106[5] eventHasAlarmCount];
        v34 = [(id)v106[5] titlesAndParticipants];
        uint64_t v35 = [v34 count];
        uint64_t v36 = v106[5];
        *(_DWORD *)buf = 138545411;
        *(void *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v72;
        *(_WORD *)&buf[22] = 2048;
        v115 = v28;
        *(_WORD *)v116 = 2048;
        *(void *)&v116[2] = v29;
        *(_WORD *)&v116[10] = 2048;
        *(void *)&v116[12] = v31;
        __int16 v117 = 2048;
        uint64_t v118 = v32;
        __int16 v119 = 2048;
        uint64_t v120 = v33;
        __int16 v121 = 2048;
        uint64_t v122 = v35;
        __int16 v123 = 2117;
        uint64_t v124 = v36;
        _os_log_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_DEFAULT, "eventMetaDataFromDate:%{public}@ toDate:%{public}@ (cached chunks %tu, misses %tu) = earliestStartTime:%f, eventCount:%tu, eventHasAlarmCount:%tu, titlesAndParticipants.count:%tu, %{sensitive}@", buf, 0x5Cu);
      }
      id v62 = (id)v106[5];

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(&v105, 8);
    }
    else
    {
      id v62 = 0;
    }

    v37 = [PPEventScorer alloc];
    v38 = [v62 titlesAndParticipants];
    [v62 earliestStartTime];
    double v40 = v39;
    if (v62)
    {
      if ([v62 eventHasAlarmCount] && objc_msgSend(v62, "eventCount"))
      {
        unint64_t v41 = [v62 eventHasAlarmCount];
        BOOL v42 = [v62 eventCount] > v41;
      }
      else
      {
        BOOL v42 = 1;
      }
    }
    else
    {
      BOOL v42 = 0;
    }
    v45 = +[PPTrialWrapper sharedInstance];
    v75 = [(PPEventScorer *)v37 initWithPastEventTitlesAndParticipants:v38 andEarliestStartTime:v42 shouldConsiderAlarms:a5 withOptions:v45 trialWrapper:v40];

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    obja = obj;
    uint64_t v46 = [obja countByEnumeratingWithState:&v78 objects:v113 count:16];
    if (v46)
    {
      uint64_t v73 = *(void *)v79;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v79 != v73) {
            objc_enumerationMutation(obja);
          }
          v48 = *(void **)(*((void *)&v78 + 1) + 8 * v47);
          v49 = (void *)MEMORY[0x1CB79D060]();
          LOBYTE(v105) = 0;
          id v50 = v48;
          v51 = v75;
          id v52 = v76;
          if (self)
          {
            LOBYTE(v105) = 0;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v115 = __Block_byref_object_copy__16377;
            *(void *)v116 = __Block_byref_object_dispose__16378;
            *(void *)&v116[8] = 0;
            *(void *)&v116[8] = [(PPEventCache *)self->_eventCache cachedEventHighlightForEvent:v50 rankingOptions:a5 trialWrapper:self->_trialWrapper];
            v53 = *(void **)(*(void *)&buf[8] + 40);
            if (!v53)
            {
              v54 = (void *)MEMORY[0x1CB79D060]();
              storage = self->_storage;
              *(void *)v82 = MEMORY[0x1E4F143A8];
              uint64_t v83 = 3221225472;
              v84 = __95__PPLocalEventStore_eventHighlightForEvent_usingScorer_date_rankingOptions_loadedFromEventKit___block_invoke;
              v85 = &unk_1E65D88A8;
              v86 = self;
              id v56 = v50;
              v90 = buf;
              v91 = &v105;
              id v87 = v56;
              v88 = v51;
              v89 = (PPLocalEventStore *)v52;
              [(PPEventStorage *)storage runBlockWithPurgerDisabled:v82];

              v53 = *(void **)(*(void *)&buf[8] + 40);
            }
            id v57 = v53;
            _Block_object_dispose(buf, 8);
          }
          else
          {
            id v57 = 0;
          }

          if (v57 && ((a5 & 1) != 0 || [v57 isExtraordinary])) {
            [v67 addObject:v57];
          }

          ++v47;
        }
        while (v46 != v47);
        uint64_t v58 = [obja countByEnumeratingWithState:&v78 objects:v113 count:16];
        uint64_t v46 = v58;
      }
      while (v58);
    }

    v44 = [v67 sortedArrayUsingComparator:&__block_literal_global_142];

    v43 = obja;
  }
  else
  {
    v43 = pp_events_log_handle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v82 = 0;
      _os_log_impl(&dword_1CA9A8000, v43, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: EventHighlights disabled due to settings", v82, 2u);
    }
    v44 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v44;
}

void __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_5(id *a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_6;
  v75[3] = &unk_1E65D8918;
  v60 = a1;
  id v76 = a1[4];
  uint64_t v58 = v3;
  v55 = [v3 indexesOfObjectsPassingTest:v75];
  [v3 removeObjectsAtIndexes:v55];
  id v56 = objc_opt_new();
  [a1[5] timeIntervalSinceReferenceDate];
  double v5 = v4;
  [a1[6] timeIntervalSinceReferenceDate];
  unint64_t v59 = vcvtmd_u64_f64(v5 / 14400.0);
  for (unint64_t i = vcvtpd_u64_f64(v6 / 14400.0); v59 <= i; ++v59)
  {
    v61 = objc_opt_new();
    [v61 setChunkIndex:v59];
    unint64_t v7 = objc_msgSend(v58, "indexOfObject:inSortedRange:options:usingComparator:", v61, 0, objc_msgSend(v58, "count"), 1024, &__block_literal_global_161);
    if (v7 < [v58 count]
      && ([v58 objectAtIndexedSubscript:v7],
          char v8 = objc_claimAutoreleasedReturnValue(),
          BOOL v9 = [v8 chunkIndex] == v59,
          v8,
          v9))
    {
      ++*(void *)(*((void *)v60[12] + 1) + 24);
      [v58 objectAtIndexedSubscript:v7];
      v61 = id v10 = v61;
    }
    else
    {
      ++*(void *)(*((void *)v60[13] + 1) + 24);
      v11 = objc_opt_new();
      uint64_t v81 = 0;
      v82 = (double *)&v81;
      uint64_t v83 = 0x2020000000;
      unint64_t v84 = 0xBFF0000000000000;
      *(void *)&long long v77 = 0;
      *((void *)&v77 + 1) = &v77;
      long long v78 = 0x2020000000uLL;
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      uint64_t v74 = 0;
      v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v59 * 14400.0];
      v13 = [v12 dateByAddingTimeInterval:14400.0];
      id v14 = (void *)*((void *)v60[7] + 2);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_8;
      v64[3] = &unk_1E65D8960;
      id v15 = v12;
      id v65 = v15;
      id v10 = v11;
      id v66 = v10;
      id v67 = v56;
      v68 = &v81;
      v69 = &v77;
      id v70 = &v71;
      [v14 iterateEventsFrom:v15 to:v13 inChunks:1 withBlock:v64];
      if (v72[3]) {
        [*((id *)v60[7] + 2) attemptToPurgeImmediately];
      }
      v16 = (void (**)(id, void *))v60[11];
      v17 = (void *)[v10 copy];
      double v18 = +[PPEventMetadata eventMetadataWithTitlesAndParticipants:v17 earliestStartTime:v72[3] eventCount:*(void *)(*((void *)&v77 + 1) + 24) eventHasAlarmCount:v82[3]];

      id v19 = v16[2](v16, v18);
      [v61 setMetadata:v19];

      [v61 setExpiration:v60[8]];
      [v58 insertObject:v61 atIndex:v7];

      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v77, 8);
      _Block_object_dispose(&v81, 8);
    }

    v20 = [v61 metadata];
    BOOL v21 = [v20 eventCount] == 0;

    if (!v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v59 * 14400.0 + 7200.0];
      id v23 = v60[9];
      uint64_t v24 = [v60[10] stringFromDate:v22];
      [v23 addObject:v24];
    }
    id v62 = *(void **)(*((void *)v60[14] + 1) + 40);
    id v25 = [v61 metadata];
    id v63 = v25;
    if (v62)
    {
      v26 = [v25 titlesAndParticipants];
      BOOL v27 = [v26 count] == 0;

      v28 = [v62 titlesAndParticipants];
      uint64_t v29 = v28;
      if (!v27)
      {
        BOOL v30 = [v28 count] == 0;

        if (v30)
        {
          uint64_t v29 = [v63 titlesAndParticipants];
        }
        else
        {
          uint64_t v31 = [v62 titlesAndParticipants];
          uint64_t v32 = (void *)[v31 mutableCopy];

          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          uint64_t v33 = [v63 titlesAndParticipants];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v77 objects:&v81 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v78;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v78 != v35) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v37 = *(void *)(*((void *)&v77 + 1) + 8 * j);
                v38 = [v62 titlesAndParticipants];
                double v39 = [v38 objectForKeyedSubscript:v37];

                double v40 = [v63 titlesAndParticipants];
                unint64_t v41 = [v40 objectForKeyedSubscript:v37];

                if (v39)
                {
                  BOOL v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v41, "unsignedIntegerValue") + objc_msgSend(v39, "unsignedIntegerValue"));
                  [v32 setObject:v42 forKeyedSubscript:v37];
                }
                else
                {
                  [v32 setObject:v41 forKeyedSubscript:v37];
                }
              }
              uint64_t v34 = [v33 countByEnumeratingWithState:&v77 objects:&v81 count:16];
            }
            while (v34);
          }

          uint64_t v29 = (void *)[v32 copy];
        }
      }
      [v62 earliestStartTime];
      int v44 = v43 != -1.0;
      [v63 earliestStartTime];
      int v46 = v45 == -1.0;
      [v62 earliestStartTime];
      double v48 = v47;
      [v63 earliestStartTime];
      if (v48 >= v49) {
        double v50 = v48;
      }
      else {
        double v50 = v49;
      }
      if (v48 < v49) {
        double v49 = v48;
      }
      if (v44 != v46) {
        double v51 = v49;
      }
      else {
        double v51 = v50;
      }
      uint64_t v52 = +[PPEventMetadata eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:](PPEventMetadata, "eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v29, [v63 eventCount] + objc_msgSend(v62, "eventCount"), objc_msgSend(v63, "eventHasAlarmCount") + objc_msgSend(v62, "eventHasAlarmCount"), v51);
    }
    else
    {
      uint64_t v52 = 0;
    }

    uint64_t v53 = *((void *)v60[14] + 1);
    v54 = *(void **)(v53 + 40);
    *(void *)(v53 + 40) = v52;
  }
}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 chunkIndex];
  if (v6 == [v5 chunkIndex])
  {
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = [v4 chunkIndex];
    if (v8 < [v5 chunkIndex]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (id)scoredEventsWithQuery:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = pp_events_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v72 = (uint64_t)v4;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: scoredEventsWithQuery: %@", buf, 0xCu);
  }

  uint64_t v6 = +[PPSettings sharedInstance];
  char v7 = [v6 bundleIdentifierIsEnabledForDonation:*MEMORY[0x1E4F8A040]];

  if ((v7 & 1) == 0)
  {
    BOOL v21 = pp_events_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: ScoredEvents disabled due to settings", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
    id v64 = v4;
    if (self)
    {
      id v65 = (id)objc_opt_new();
      BOOL v9 = [v8 fromDate];
      id v10 = [v8 toDate];
      id v11 = v9;
      id v12 = v10;
      [v11 timeIntervalSinceReferenceDate];
      double v14 = v13;
      [v12 timeIntervalSinceDate:v11];
      double v16 = v15;
      if (-[PPLocalEventStore _isEventQueryRangeValidWithInterval:andDuration:]((uint64_t)self, v14, v15))
      {
        v17 = PPNewEKEventStore();
        double v18 = -[PPEventStorage suggestedEventsInRange:ekStore:](self->_storage, "suggestedEventsInRange:ekStore:", (unint64_t)v14, (unint64_t)v16, v17);
        id v19 = objc_opt_new();
        v20 = [MEMORY[0x1E4F89E00] convertBatchOfEKEvents:v18 calendarInternPool:v19];
      }
      else
      {
        v20 = (void *)MEMORY[0x1E4F1CBF0];
      }

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v23 = v20;
      uint64_t v47 = [v23 countByEnumeratingWithState:&v66 objects:buf count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v67 != v49) {
              objc_enumerationMutation(v23);
            }
            double v51 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            if ([v51 suggestedEventCategory])
            {
              uint64_t v52 = [v8 matchingCategories];
              if (!v52) {
                goto LABEL_41;
              }
              uint64_t v53 = (void *)v52;
              v54 = [v8 matchingCategories];
              v55 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v51, "suggestedEventCategory"));
              int v56 = [v54 containsObject:v55];

              if (v56)
              {
LABEL_41:
                id v57 = (void *)[objc_alloc(MEMORY[0x1E4F89F58]) initWithPPEvent:v51];
                if (v57) {
                  [v65 addObject:v57];
                }
              }
            }
          }
          uint64_t v48 = [v23 countByEnumeratingWithState:&v66 objects:buf count:16];
        }
        while (v48);
      }

LABEL_47:
LABEL_48:

      id v4 = v64;
      goto LABEL_49;
    }
    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v4;
      id v64 = v4;
      if (self)
      {
        id v23 = (id)objc_opt_new();
        uint64_t v24 = [v8 fromDate];
        id v25 = [v24 dateByAddingTimeInterval:-10368000.0];

        id v63 = v8;
        v26 = [v8 toDate];
        BOOL v27 = [v26 dateByAddingTimeInterval:10368000.0];

        [v25 timeIntervalSinceReferenceDate];
        unint64_t v29 = (unint64_t)v28;
        id v62 = v27;
        [v27 timeIntervalSinceDate:v25];
        unint64_t v31 = (unint64_t)v30;
        v61 = PPNewEKEventStore();
        uint64_t v32 = [(PPEventStorage *)self->_storage suggestedEventsInRange:v29 ekStore:v31];
        uint64_t v33 = pp_events_log_handle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = [v32 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v72 = v34;
          _os_log_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_DEFAULT, "[PPLocalEventStore tripEventsWithQuery] Found %lu suggested events in the given range", buf, 0xCu);
        }

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v35 = v32;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:buf count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v67;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v67 != v38) {
                objc_enumerationMutation(v35);
              }
              double v40 = *(void **)(*((void *)&v66 + 1) + 8 * j);
              unint64_t v41 = +[PPTripAggregator keyForCategory:](PPTripAggregator, "keyForCategory:", objc_msgSend(v40, "pp_suggestedCategory"));
              if (v41)
              {
                BOOL v42 = [v23 objectForKeyedSubscript:v41];

                if (v42)
                {
                  double v43 = [v23 objectForKeyedSubscript:v41];
                  int v44 = [v43 arrayByAddingObject:v40];
                  [v23 setObject:v44 forKey:v41];
                }
                else
                {
                  id v70 = v40;
                  double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
                  [v23 setObject:v43 forKey:v41];
                }
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:buf count:16];
          }
          while (v37);
        }

        id v8 = v63;
        double v45 = [v63 fromDate];
        int v46 = [v63 toDate];
        id v65 = +[PPTripAggregator tripEventsWithEvents:v23 from:v45 to:v46];

        goto LABEL_47;
      }
LABEL_54:
      id v65 = 0;
      goto LABEL_48;
    }
    BOOL v21 = pp_events_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v59 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v59);
      *(_DWORD *)buf = 138412290;
      uint64_t v72 = (uint64_t)v60;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "Unsupport event query object of class: %@", buf, 0xCu);
    }
LABEL_10:

    id v65 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_49;
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  if (!self) {
    uint64_t v22 = 0;
  }
  id v65 = v22;
LABEL_49:

  return v65;
}

+ (id)defaultStore
{
  if (defaultStore__pasOnceToken10 != -1) {
    dispatch_once(&defaultStore__pasOnceToken10, &__block_literal_global_123_16459);
  }
  v2 = (void *)defaultStore__pasExprOnceResult_16460;
  return v2;
}

- (id)eventsFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v6 timeIntervalSinceDate:v7];
  double v11 = v10;

  if (-[PPLocalEventStore _isEventQueryRangeValidWithInterval:andDuration:]((uint64_t)self, v9, v11))
  {
    if (self)
    {
      id v12 = pp_events_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134218240;
        unint64_t v21 = (unint64_t)v9;
        __int16 v22 = 2048;
        unint64_t v23 = (unint64_t)v11;
        _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore queried for range: %tu - %tu", (uint8_t *)&v20, 0x16u);
      }

      double v13 = pp_events_signpost_handle();
      os_signpost_id_t v14 = os_signpost_id_generate(v13);

      double v15 = pp_events_signpost_handle();
      double v16 = v15;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v20) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PPLocalEventStore.eventsInRange", "", (uint8_t *)&v20, 2u);
      }

      -[PPEventCache objectForRange:](self->_eventCache, "objectForRange:", (unint64_t)v9, (unint64_t)v11);
      self = (PPLocalEventStore *)objc_claimAutoreleasedReturnValue();
      v17 = pp_events_signpost_handle();
      double v18 = v17;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(v20) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v18, OS_SIGNPOST_INTERVAL_END, v14, "PPLocalEventStore.eventsInRange", "", (uint8_t *)&v20, 2u);
      }
    }
  }
  else
  {
    self = (PPLocalEventStore *)MEMORY[0x1E4F1CBF0];
  }
  return self;
}

- (uint64_t)_isEventQueryRangeValidWithInterval:(double)a3 andDuration:
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 < 0.0)
    {
      id v4 = pp_events_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134217984;
        double v8 = a2;
        id v5 = "PPLocalEventStore: from date appears to be before the reference date(interval = %f) which is unsupported.";
LABEL_11:
        _os_log_error_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    if (a3 < 0.0)
    {
      id v4 = pp_events_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134217984;
        double v8 = a3;
        id v5 = "PPLocalEventStore: to date appears to be before from date(duration = %f) which is unsupported.";
        goto LABEL_11;
      }
LABEL_7:

      return 0;
    }
    return 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedChanges, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_assetUpdateNotificationToken, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_eventCache, 0);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  int v7 = pp_events_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138739971;
    id v11 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "Event feedback received: %{sensitive}@", (uint8_t *)&v10, 0xCu);
  }

  double v8 = [v5 feedbackItems];
  uint64_t v9 = [v8 count];

  if (v9) {
    +[PPFeedbackStorage logFeedback:v5 domain:3 domainStatus:2 inBackground:0];
  }
  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (id)nlEventsFromDate:(id)a3 toDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v7 timeIntervalSinceDate:v6];
  double v11 = v10;
  if (-[PPLocalEventStore _isEventQueryRangeValidWithInterval:andDuration:]((uint64_t)self, v9, v10))
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__16377;
    int v20 = __Block_byref_object_dispose__16378;
    id v21 = 0;
    storage = self->_storage;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__PPLocalEventStore_nlEventsFromDate_toDate___block_invoke;
    v15[3] = &unk_1E65D93A8;
    v15[6] = (unint64_t)v9;
    v15[7] = (unint64_t)v11;
    v15[4] = self;
    v15[5] = &v16;
    [(PPEventStorage *)storage runBlockWithPurgerDisabled:v15];
    id v13 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __45__PPLocalEventStore_nlEventsFromDate_toDate___block_invoke(void *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "nlEventsInRange:", a1[6], a1[7]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F89E00] convertBatchOfEKEvents:v6 calendarInternPool:v2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __52__PPLocalEventStore_eventHighlightsFrom_to_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

void __95__PPLocalEventStore_eventHighlightForEvent_usingScorer_date_rankingOptions_loadedFromEventKit___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) eventIdentifier];
  uint64_t v4 = [v2 eventWithIdentifier:v3];

  if (v4)
  {
    id v5 = *(unsigned char **)(a1 + 72);
    if (v5) {
      *id v5 = 1;
    }
    uint64_t v6 = [*(id *)(a1 + 48) scoreEvent:v4 usingDate:*(void *)(a1 + 56)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(*(void *)(a1 + 32) + 8) setEventHighlight:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isExtraordinary])
    {
      double v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) endDate];
      [v9 timeIntervalSinceNow];
      double v11 = v10;

      if (v11 <= 0.0)
      {
        id v13 = pp_events_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)os_signpost_id_t v14 = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "Suppressing metrics logging of past event", v14, 2u);
        }
      }
      else
      {
        uint64_t v12 = +[PPEventMetricsLogger defaultLogger];
        [v12 logEventInteractionForEventHighlight:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) interface:0 actionType:0];
      }
    }
  }
}

id __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) isEqual:v3];
  id v5 = v3;
  if (v4) {
    id v5 = *(void **)(a1 + 32);
  }
  id v6 = v5;

  return v6;
}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_8(void *a1, void *a2)
{
  id v13 = a2;
  id v3 = (void *)a1[4];
  int v4 = [v13 startDate];
  uint64_t v5 = [v3 compare:v4];

  if (v5 != 1)
  {
    +[PPEventScorer enrichDictionary:a1[5] withEvent:v13 interningSet:a1[6]];
    if (([v13 isAllDay] & 1) == 0)
    {
      id v6 = [v13 startDate];
      +[PPEventRankerDateUtils secondsFromMidnight:v6];
      double v8 = v7;

      uint64_t v9 = *(void *)(a1[7] + 8);
      double v10 = *(double *)(v9 + 24);
      if (v8 < v10 || v10 == -1.0) {
        *(double *)(v9 + 24) = v8;
      }
    }
    if ([v13 hasAlarms]) {
      ++*(void *)(*(void *)(a1[8] + 8) + 24);
    }
    ++*(void *)(*(void *)(a1[9] + 8) + 24);
  }
  return MEMORY[0x1F41817F8]();
}

void __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  v1 = objc_opt_new();
  uint64_t v2 = [v0 initWithGuardedData:v1];
  id v3 = (void *)eventMetaDataFromDate_toDate__cacheLock;
  eventMetaDataFromDate_toDate__cacheLock = v2;

  id v6 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"eventMetaDataFromDate:toDate: cache clearing queue" qosClass:9];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B98]) initWithQueue:v6 leewaySeconds:&__block_literal_global_152 operation:60.0];
  uint64_t v5 = (void *)eventMetaDataFromDate_toDate__invalidationTimer;
  eventMetaDataFromDate_toDate__invalidationTimer = v4;
}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_2()
{
  return [(id)eventMetaDataFromDate_toDate__cacheLock tryWithLockAcquired:&__block_literal_global_155_16409];
}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)enumerateEventsFromEKObjectIDs:(id)a3 expandingRecurrencesInRange:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  storage = self->_storage;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PPLocalEventStore_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_usingBlock___block_invoke;
  v15[3] = &unk_1E65DA018;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(PPEventStorage *)storage runBlockWithPurgerDisabled:v15];
}

uint64_t __91__PPLocalEventStore_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_usingBlock___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) enumerateEventsFromEKObjectIDs:a1[5] expandingRecurrencesInRange:a1[6] usingBlock:a1[7]];
}

- (BOOL)attemptToPurgeImmediately
{
  return [(PPEventStorage *)self->_storage attemptToPurgeImmediately];
}

- (id)customObjectForKey:(id)a3 eventIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__16377;
  id v21 = __Block_byref_object_dispose__16378;
  id v22 = 0;
  storage = self->_storage;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PPLocalEventStore_customObjectForKey_eventIdentifier___block_invoke;
  v13[3] = &unk_1E65D9138;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v16 = &v17;
  id v10 = v6;
  id v15 = v10;
  [(PPEventStorage *)storage runBlockWithPurgerDisabled:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __56__PPLocalEventStore_customObjectForKey_eventIdentifier___block_invoke(void *a1)
{
  id v6 = [*(id *)(a1[4] + 16) eventWithIdentifier:a1[5]];
  if (v6)
  {
    uint64_t v2 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v3 = [v6 customObjectForKey:a1[6]];
    uint64_t v4 = *(void *)(a1[7] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)eventWithIdentifier:(id)a3
{
  return [(PPEventStorage *)self->_storage eventWithIdentifier:a3];
}

- (id)eventWithExternalID:(id)a3
{
  return [(PPEventStorage *)self->_storage eventWithExternalID:a3];
}

- (id)resolveEventNameRecordChanges:(id)a3 client:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v19 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
        id v15 = (void *)MEMORY[0x1CB79D060]();
        if ([(PPEventStorage *)self->_storage eventKitChangeIsEvent:v14])
        {
          storage = self->_storage;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __64__PPLocalEventStore_resolveEventNameRecordChanges_client_error___block_invoke;
          v20[3] = &unk_1E65D87E8;
          v20[4] = self;
          v20[5] = v14;
          id v21 = v8;
          [(PPEventStorage *)storage runBlockWithPurgerDisabled:v20];
        }
        else
        {
          uint64_t v17 = pp_events_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v14;
            _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "skipping non-event change: %@", buf, 0xCu);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }

  return v8;
}

void __64__PPLocalEventStore_resolveEventNameRecordChanges_client_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) resolveEventFromEKChange:*(void *)(a1 + 40)];
  if (!v2)
  {
    double v30 = pp_events_log_handle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138412290;
      int v44 = v33;
      _os_log_debug_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEBUG, "deleted event: %@", buf, 0xCu);
    }

    if (*(void *)(v1 + 32))
    {
      unint64_t v31 = (void *)MEMORY[0x1E4F89E10];
      uint64_t v32 = [*(id *)(v1 + 40) stringRepresentation];
      uint64_t v29 = [v31 eventNameRecordWithScore:v32 eventIdentifier:3 changeType:&stru_1F253DF18 title:&stru_1F253DF18 location:MEMORY[0x1E4F1CBF0] participantNames:0.0];
    }
    else
    {
      uint64_t v29 = 0;
    }
    goto LABEL_24;
  }
  if ([*(id *)(*(void *)(v1 + 32) + 16) shouldIngestEvent:v2])
  {
    uint64_t v3 = pp_events_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = [v2 eventIdentifier];
      *(_DWORD *)buf = 138412290;
      int v44 = v34;
      _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "modified event: %@", buf, 0xCu);
    }
    uint64_t v37 = v1;
    uint64_t v38 = v2;
    uint64_t v4 = *(void *)(v1 + 32);
    id v5 = v2;
    if (v4)
    {
      uint64_t v6 = objc_opt_new();
      id v7 = [v5 startDate];
      id v35 = (void *)v6;
      [v7 timeIntervalSinceDate:v6];
      double v9 = -[PPLocalEventStore _scoreForSecondsRelativeToNow:](v8);

      id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v11 = [v5 attendees];
      uint64_t v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v36 = v5;
      uint64_t v13 = [v5 attendees];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:buf count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v19 = (void *)MEMORY[0x1CB79D060]();
            uint64_t v20 = [v18 name];
            if (v20)
            {
              id v21 = (void *)v20;
              long long v22 = [v18 name];
              uint64_t v23 = [v22 length];

              if (v23)
              {
                long long v24 = [v18 name];
                [v12 addObject:v24];
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:buf count:16];
        }
        while (v15);
      }

      id v5 = v36;
      long long v25 = [v36 locationWithoutPrediction];
      if (![v25 length])
      {

        long long v25 = 0;
      }
      uint64_t v1 = v37;
      uint64_t v2 = v38;
      v26 = (void *)MEMORY[0x1E4F89E10];
      uint64_t v27 = [v36 eventIdentifier];
      double v28 = [v36 title];
      uint64_t v29 = [v26 eventNameRecordWithScore:v27 eventIdentifier:0 changeType:v28 title:v25 location:v12 participantNames:v9];
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v1 = v37;
    }

    [v29 setChangeType:1];
LABEL_24:
    [*(id *)(v1 + 48) addObject:v29];
  }
}

- (double)_scoreForSecondsRelativeToNow:(double)a1
{
  double v1 = a1 / 3600.0;
  if (a1 / 3600.0 <= -3.0) {
    return 0.3;
  }
  if (v1 <= -2.0) {
    return 0.4;
  }
  double result = 0.5;
  if (v1 > -1.0)
  {
    double result = 0.7;
    if (v1 > 0.0)
    {
      if (v1 <= 1.0)
      {
        return 0.9;
      }
      else if (v1 <= 2.0)
      {
        return 0.85;
      }
      else if (v1 <= 3.0)
      {
        return 0.8;
      }
      else if (v1 > 4.0)
      {
        if (v1 <= 5.0)
        {
          return 0.6;
        }
        else
        {
          double result = 0.5;
          if (v1 > 6.0)
          {
            double result = 0.4;
            if (v1 > 7.0)
            {
              double result = 0.3;
              if (v1 > 8.0)
              {
                if (v1 <= 9.0)
                {
                  return 0.2;
                }
                else if (v1 <= 10.0)
                {
                  return 0.15;
                }
                else if (v1 <= 11.0)
                {
                  return 0.12;
                }
                else
                {
                  return dbl_1CAB7BA80[v1 > 12.0];
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)eventNameRecordsForClient:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v5 dateByAddingTimeInterval:-7200.0];
  long long v39 = v5;
  id v7 = [v5 dateByAddingTimeInterval:43200.0];
  double v43 = self;
  double v8 = [(PPLocalEventStore *)self eventsFromDate:v6 toDate:v7];

  id v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  uint64_t v45 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v45)
  {
    uint64_t v42 = *(void *)v51;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v51 != v42) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1CB79D060]();
        id v12 = v10;
        if (v43)
        {
          uint64_t v48 = v11;
          uint64_t v49 = v9;
          uint64_t v13 = objc_opt_new();
          uint64_t v14 = [v12 startDate];
          int v46 = (void *)v13;
          [v14 timeIntervalSinceDate:v13];
          double v16 = -[PPLocalEventStore _scoreForSecondsRelativeToNow:](v15);

          id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v18 = [v12 attendees];
          id v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v47 = v12;
          uint64_t v20 = [v12 attendees];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v59 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v55;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v55 != v23) {
                  objc_enumerationMutation(v20);
                }
                long long v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                v26 = (void *)MEMORY[0x1CB79D060]();
                uint64_t v27 = [v25 name];
                if (v27)
                {
                  double v28 = (void *)v27;
                  uint64_t v29 = [v25 name];
                  uint64_t v30 = [v29 length];

                  if (v30)
                  {
                    unint64_t v31 = [v25 name];
                    [v19 addObject:v31];
                  }
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v59 count:16];
            }
            while (v22);
          }

          uint64_t v32 = (void *)MEMORY[0x1E4F89E10];
          id v12 = v47;
          uint64_t v33 = [v47 eventIdentifier];
          uint64_t v34 = [v47 title];
          id v35 = [v47 location];
          uint64_t v36 = [v32 eventNameRecordWithScore:v33 eventIdentifier:0 changeType:v34 title:v35 location:v19 participantNames:v16];

          uint64_t v11 = v48;
          uint64_t v9 = v49;
        }
        else
        {
          uint64_t v36 = 0;
        }

        [v44 addObject:v36];
        ++v9;
      }
      while (v9 != v45);
      uint64_t v37 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v45 = v37;
    }
    while (v37);
  }

  return v44;
}

- (BOOL)iterEventNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v8 = (void (**)(id, uint64_t, char *))a5;
  uint64_t v9 = [(PPLocalEventStore *)self eventNameRecordsForClient:a3 error:a4];
  id v10 = v9;
  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        char v18 = 0;
        v8[2](v8, v16, &v18);
        if (v18) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  return v10 != 0;
}

- (void)runBlockWithPurgerDisabled:(id)a3
{
}

- (PPLocalEventStore)init
{
  uint64_t v3 = +[PPTrialWrapper sharedInstance];
  uint64_t v4 = +[PPEventStorage defaultStorage];
  id v5 = [(PPLocalEventStore *)self initWithTrialWrapper:v3 eventStorage:v4];

  return v5;
}

- (PPLocalEventStore)initWithTrialWrapper:(id)a3 eventStorage:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)PPLocalEventStore;
  id v10 = [(PPLocalEventStore *)&v42 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_storage, a4);
    uint64_t v12 = [[PPEventCache alloc] initWithEventStorage:v11->_storage];
    eventCache = v11->_eventCache;
    v11->_eventCache = v12;

    objc_storeStrong((id *)&v11->_trialWrapper, a3);
    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = [v14 initWithGuardedData:v15];
    lock = v11->_lock;
    v11->_lock = (_PASLock *)v16;

    char v18 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPLocalEventStore-bufferedChanges" qosClass:9];
    id location = 0;
    objc_initWeak(&location, v11);
    id v19 = objc_alloc(MEMORY[0x1E4F93AD8]);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke;
    v38[3] = &unk_1E65D8778;
    SEL v40 = a2;
    long long v20 = v11;
    long long v39 = v20;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    id v35 = __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke_2;
    uint64_t v36 = &unk_1E65D87C0;
    objc_copyWeak(&v37, &location);
    uint64_t v21 = [v19 initWithQueue:v18 leewaySeconds:v38 coalesceData:&v33 operation:10.0];
    id v22 = v20[6];
    void v20[6] = (id)v21;

    id from = 0;
    objc_initWeak(&from, v20);
    uint64_t v23 = (void *)MEMORY[0x1E4F89EC0];
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    int v46 = __52__PPLocalEventStore__setupCalendarVisibilityManager__block_invoke;
    uint64_t v47 = &unk_1E65D8860;
    objc_copyWeak((id *)&v48, &from);
    uint64_t v24 = objc_msgSend(v23, "addCalendarVisibilityObserverForLifetimeOfObject:block:", v20, &v44, v33, v34, v35, v36);
    [(PPEventStorage *)v11->_storage setInvisibleCalendarIdentifiers:v24];
    objc_destroyWeak((id *)&v48);

    objc_destroyWeak(&from);
    id v25 = v20[6];
    v26 = v11->_lock;
    uint64_t v27 = (void *)MEMORY[0x1E4F89EC0];
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    int v46 = __46__PPLocalEventStore__registerForNotifications__block_invoke;
    uint64_t v47 = &unk_1E65D8838;
    uint64_t v48 = v26;
    id v49 = v25;
    id v28 = v25;
    uint64_t v29 = v26;
    [v27 addEventKitObserverForLifetimeOfObject:v20 block:&v44];
    uint64_t v30 = +[PPTrialWrapper sharedInstance];
    id v31 = (id)[v30 addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_EVENTS" block:&__block_literal_global_136_16431];

    -[PPLocalEventStore _preloadEvents](v20);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&location);
  }

  return v11;
}

id __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 count])
    {
      if ([v6 count])
      {
        [v5 removeObjectsInArray:v6];
        [v5 addObjectsFromArray:v6];
      }
      else
      {
        [v5 removeAllObjects];
      }
    }
  }
  else
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v6];
    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PPLocalEventStore.m", 179, @"Invalid parameter not satisfying: %@", @"accumulatedData" object file lineNumber description];

      id v5 = 0;
    }
  }

  return v5;
}

void __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      [*((id *)WeakRetained + 5) runWithLockAcquired:&__block_literal_global_16441];
      id v6 = pp_events_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134217984;
        uint64_t v20 = [v3 count];
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: processing %tu EventKit changes", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v7 = [v3 count];
      id v8 = (void *)MEMORY[0x1CB79D060]();
      if (v7)
      {
        id v9 = (void *)v5[1];
        id v10 = [v3 array];
        id v11 = [v9 refreshCacheWithChanges:v10];

        uint64_t v12 = pp_events_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v11 first];
          uint64_t v14 = [v13 count];
          int v19 = 134217984;
          uint64_t v20 = v14;
          _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: changed event count is %tu", (uint8_t *)&v19, 0xCu);
        }
        uint64_t v15 = +[PPEventKitImporter defaultInstance];
        [v15 importChangedEvents:v11];
      }
      else
      {
        -[PPLocalEventStore _clearAndReloadAllCachesAndData](v5);
      }
      id v17 = pp_events_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v3 count];
        int v19 = 134217984;
        uint64_t v20 = v18;
        _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: finished processing %tu EventKit changes", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = pp_events_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v19) = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, "accumulatedData was unexpectedly nil", (uint8_t *)&v19, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
}

- (void)_preloadEvents
{
  uint64_t v2 = pp_events_signpost_handle();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = pp_events_signpost_handle();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPLocalEventStore.preloadEvents", "", buf, 2u);
  }

  id v6 = objc_opt_new();
  uint64_t v7 = [v6 dateByAddingTimeInterval:-600.0];
  id v8 = [v6 dateByAddingTimeInterval:176400.0];
  id v9 = (id)[a1 eventsFromDate:v7 toDate:v8];

  id v10 = pp_events_signpost_handle();
  id v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPLocalEventStore.preloadEvents", "", v12, 2u);
  }
}

void __46__PPLocalEventStore__registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__16377;
  uint64_t v16 = __Block_byref_object_dispose__16378;
  id v17 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PPLocalEventStore__registerForNotifications__block_invoke_2;
  v11[3] = &unk_1E65D8810;
  v11[4] = &v12;
  [v4 runWithLockAcquired:v11];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSinceDate:v13[5]];
  double v7 = v6;

  BOOL v8 = [v3 count] != 0;
  BOOL v9 = v7 <= 300.0;
  double v10 = 120.0;
  if (!v8 || !v9) {
    double v10 = 1.0;
  }
  [*(id *)(a1 + 40) processData:v3 afterDelaySeconds:v8 & v9 coalescingBehavior:v10];
  _Block_object_dispose(&v12, 8);
}

uint64_t __46__PPLocalEventStore__registerForNotifications__block_invoke_3()
{
  return +[PPEventScorer clearAssetCache];
}

void __46__PPLocalEventStore__registerForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)v5[1];
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v4);
  if (!v3) {
}
  }

void __52__PPLocalEventStore__setupCalendarVisibilityManager__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = pp_events_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      uint64_t v7 = [v3 count];
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: reloading events due to EKCalendarVisibilityManager visibilityChanged (%tu invisible calendars)", (uint8_t *)&v6, 0xCu);
    }

    [WeakRetained[2] setInvisibleCalendarIdentifiers:v3];
    -[PPLocalEventStore _clearAndReloadAllCachesAndData](WeakRetained);
  }
}

- (void)_clearAndReloadAllCachesAndData
{
  [a1 clearCaches];
  -[PPLocalEventStore _preloadEvents](a1);
  id v2 = +[PPEventKitImporter defaultInstance];
  [v2 deleteAndReimportAllData];
}

void __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke_114(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  uint64_t v4 = [v2 now];
  id v5 = (id)v3[1];
  v3[1] = v4;
}

void __33__PPLocalEventStore_defaultStore__block_invoke()
{
  id v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)defaultStore__pasExprOnceResult_16460;
  defaultStore__pasExprOnceResult_16460 = v1;
}

- (void)clearCaches
{
  [(PPEventCache *)self->_eventCache removeAllObjects];
  storage = self->_storage;
  [(PPEventStorage *)storage clearCaches];
}

@end