@interface TISKMetricCollector
+ (BOOL)isSensorKitSupported:(id)a3;
+ (id)makeMetricCollector:(id)a3 wordsThreshold:(unint64_t)a4 isTesting:(BOOL)a5;
- (BOOL)isLoaded;
- (BOOL)publishIfSessionStatsHasWordCountMoreThanThreshold:(id)a3 withSessionStartTime:(BOOL)a4;
- (NSMutableArray)currentSessionStatsArray;
- (NSMutableArray)savedSessionStatsArray;
- (TISensorWriterWrapper)dataWriter;
- (TITypingSession)typingSession;
- (double)totalTimeSpan;
- (double)totalTimeSpanFromLastTap;
- (id)_consumeTypingSession:(id)a3;
- (id)_insertEmojiSwitchEvents:(id)a3;
- (id)_mapIDToLayout:(unint64_t)a3;
- (id)_retrieveSavedSessionSampleArray;
- (id)eventsDescription;
- (id)eventsDescription:(BOOL)a3;
- (id)getWordBucketCategoryForWord:(id)a3;
- (id)init:(id)a3;
- (id)init:(id)a3 wordsThreshold:(unint64_t)a4;
- (id)init:(id)a3 wordsThreshold:(unint64_t)a4 accentedLanguage:(BOOL)a5;
- (id)init:(id)a3 wordsThreshold:(unint64_t)a4 accentedLanguage:(BOOL)a5 skipTCCAuthorization:(BOOL)a6;
- (id)lemmatizeWord:(id)a3;
- (id)loadDataWithFilename:(id)a3;
- (id)privateEventsDescription;
- (int64_t)findIndexSessionStatsFromArray:(id)a3 thatHasLayout:(id)a4;
- (unint64_t)wordAccumulationThreshold;
- (void)_clear;
- (void)_coalesceTaps;
- (void)_consumeDeleteWordEvent:(id)a3;
- (void)_consumeInputsAndTouches:(id)a3 occurenceTime:(double)a4 emojiSearchMode:(BOOL)a5;
- (void)_consumePathsAndPredictions:(id)a3 emojiSearchMode:(BOOL)a4;
- (void)_consumeUserAction:(id)a3;
- (void)_consumeWordEntry:(id)a3;
- (void)_haltSessionTypingTimer:(id)a3 event:(id)a4;
- (void)_loadStatsFromDataStore;
- (void)_mapTapsToEvents;
- (void)_metricWalk;
- (void)_persistSavedSessionStatsArray;
- (void)_processEvents;
- (void)_resetConsumeState;
- (void)_setupTCCAuthNotification;
- (void)dealloc;
- (void)handleTypingSession:(id)a3;
- (void)loadEmojiBucketDictionaryIfNecessary;
- (void)loadWordBucketDictionaryIfNecessary;
- (void)placeTaskOnWorkQueue:(id)a3;
- (void)processNewSessionStatsArray:(id)a3;
- (void)removeSessionStatsWithNegativeDurationFromArray:(id)a3 ForTypingSession:(id)a4;
- (void)sessionDidEnd:(id)a3 aligned:(id)a4;
- (void)setCurrentSessionStatsArray:(id)a3;
- (void)setDataWriter:(id)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setSavedSessionStatsArray:(id)a3;
- (void)setTypingSession:(id)a3;
- (void)setWordAccumulationThreshold:(unint64_t)a3;
- (void)setupSessionStatsForLayouts;
- (void)testTCCAuthorization;
@end

@implementation TISKMetricCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingSession, 0);
  objc_storeStrong((id *)&self->_savedSessionStatsArray, 0);
  objc_storeStrong((id *)&self->_dataWriter, 0);
  objc_storeStrong((id *)&self->_previousWord, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_emojiBuckets, 0);
  objc_storeStrong((id *)&self->_wordBucketDictionary, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accentedLayoutsMap, 0);
  objc_storeStrong((id *)&self->_userModelDataStore, 0);
  objc_storeStrong((id *)&self->_currentSessionStatsArray, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_taps, 0);
  objc_storeStrong((id *)&self->_layoutIDs, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_sortedEvents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_touchToEventMap, 0);

  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setTypingSession:(id)a3
{
}

- (TITypingSession)typingSession
{
  return self->_typingSession;
}

- (void)setCurrentSessionStatsArray:(id)a3
{
}

- (NSMutableArray)currentSessionStatsArray
{
  return self->_currentSessionStatsArray;
}

- (void)setSavedSessionStatsArray:(id)a3
{
}

- (NSMutableArray)savedSessionStatsArray
{
  return self->_savedSessionStatsArray;
}

- (void)setDataWriter:(id)a3
{
}

- (TISensorWriterWrapper)dataWriter
{
  return self->_dataWriter;
}

- (void)setWordAccumulationThreshold:(unint64_t)a3
{
  self->_wordAccumulationThreshold = a3;
}

- (unint64_t)wordAccumulationThreshold
{
  return self->_wordAccumulationThreshold;
}

- (void)removeSessionStatsWithNegativeDurationFromArray:(id)a3 ForTypingSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__TISKMetricCollector_removeSessionStatsWithNegativeDurationFromArray_ForTypingSession___block_invoke;
  v11[3] = &unk_1E6E29298;
  id v12 = v6;
  v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v11];
  [v7 removeObjectsAtIndexes:v9];
}

void __88__TISKMetricCollector_removeSessionStatsWithNegativeDurationFromArray_ForTypingSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 keyedMetrics];
  id v7 = [v6 objectForKey:kTISKTotalSessionTypingDuration];

  if (v7)
  {
    [v7 doubleValue];
    if (v8 < 0.0)
    {
      double v9 = v8;
      if (*(void *)(a1 + 32))
      {
        uint64_t v37 = a3;
        v38 = v5;
        id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v11 = [*(id *)(a1 + 32) userActionHistory];
        os_log_t log = (os_log_t)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v36 = a1;
        id v12 = [*(id *)(a1 + 32) userActionHistory];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              unsigned int v18 = [v17 actionType];
              v19 = @"ot";
              if (v18 <= 5) {
                v19 = off_1E6E292D0[v18];
              }
              v20 = NSString;
              [v17 startTime];
              uint64_t v22 = v21;
              [v17 endTime];
              v24 = [v20 stringWithFormat:@"%@:%f:%f", v19, v22, v23];
              [log addObject:v24];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v14);
        }

        v25 = [log componentsJoinedByString:@"|"];
        v26 = IXADefaultLogFacility();
        id v5 = v38;
        a1 = v36;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = NSString;
          v28 = [v38 startTime];
          v29 = [v38 endTime];
          v30 = [*(id *)(v36 + 40) privateEventsDescription];
          v31 = [v27 stringWithFormat:@"%s [SK TypingTimer][SK Duration] Removing negative duration sessionStats found while reporting: %f %@ %@\n%@\n%@", "-[TISKMetricCollector removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:]_block_invoke", *(void *)&v9, v28, v29, v25, v30];
          *(_DWORD *)buf = 138412290;
          v46 = v31;
          _os_log_error_impl(&dword_1E3F0E000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        a3 = v37;
      }
      else
      {
        IXADefaultLogFacility();
        os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          v32 = NSString;
          v33 = [v5 startTime];
          v34 = [v5 endTime];
          v35 = [v32 stringWithFormat:@"%s [SK TypingTimer][SK Duration] Removing negative duration sessionStats found while loading: %f %@ %@", "-[TISKMetricCollector removeSessionStatsWithNegativeDurationFromArray:ForTypingSession:]_block_invoke", *(void *)&v9, v33, v34];
          *(_DWORD *)buf = 138412290;
          v46 = v35;
          _os_log_error_impl(&dword_1E3F0E000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }

      [*(id *)(a1 + 48) addIndex:a3];
    }
  }
}

- (void)_persistSavedSessionStatsArray
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  userModelDataStore = self->_userModelDataStore;
  id v5 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
  [(TIUserModelDataStore *)userModelDataStore purgeDataForKey:@"SensorKitDataKey" forInputMode:v5 beforeDate:v3];

  if ([(NSMutableArray *)self->_savedSessionStatsArray count])
  {
    savedSessionStatsArray = self->_savedSessionStatsArray;
    id v14 = 0;
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:savedSessionStatsArray requiringSecureCoding:1 error:&v14];
    id v8 = v14;
    if (v8)
    {
      double v9 = IXADefaultLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = NSString;
        v11 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
        id v12 = [v10 stringWithFormat:@"%s [SensorKit] failed to archive stats for input mode %@", "-[TISKMetricCollector _persistSavedSessionStatsArray]", v11];
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = self->_userModelDataStore;
      double v9 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
      [(TIUserModelDataStore *)v13 addValue:&unk_1F3FA79E8 andSecondaryValue:&unk_1F3FA79E8 andRealValue:&unk_1F3FA79E8 andProperties:v7 forKey:@"SensorKitDataKey" forInputMode:v9 forDate:v3];
    }
  }
}

- (id)_retrieveSavedSessionSampleArray
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  userModelDataStore = self->_userModelDataStore;
  v4 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  id v6 = [(TIUserModelDataStore *)userModelDataStore getAllValuesForKey:@"SensorKitDataKey" forInputMode:v4 sinceDate:v5];

  if (v6 && [v6 count])
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = (void *)MEMORY[0x1E4F28DC0];
    double v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    id v12 = [v7 properties];
    id v27 = 0;
    uint64_t v13 = [v8 unarchivedObjectOfClasses:v11 fromData:v12 error:&v27];
    id v14 = v27;

    if (v14)
    {
      uint64_t v15 = IXADefaultLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v24 = NSString;
        v25 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
        v26 = [v24 stringWithFormat:@"%s [SensorKit] failed to unarchive stats for input mode %@", "-[TISKMetricCollector _retrieveSavedSessionSampleArray]", v25];
        *(_DWORD *)buf = 138412290;
        v29 = v26;
        _os_log_debug_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v16 = [MEMORY[0x1E4F28E60] indexSet];
    if ([v13 count])
    {
      unint64_t v17 = 0;
      do
      {
        unsigned int v18 = [v13 objectAtIndexedSubscript:v17];
        v19 = [v18 startTime];
        [v19 timeIntervalSinceNow];
        double v21 = fabs(v20);

        if (v21 > 86400.0) {
          [v16 addIndex:v17];
        }
        ++v17;
      }
      while (v17 < [v13 count]);
    }
    [v13 removeObjectsAtIndexes:v16];
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v22 = (void *)[v13 copy];

  return v22;
}

- (void)_loadStatsFromDataStore
{
  if (!self->_isLoaded)
  {
    self->_isLoaded = 1;
    uint64_t v3 = [(TISKMetricCollector *)self _retrieveSavedSessionSampleArray];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
      savedSessionStatsArray = self->_savedSessionStatsArray;
      self->_savedSessionStatsArray = v4;

      [(TISKMetricCollector *)self removeSessionStatsWithNegativeDurationFromArray:self->_savedSessionStatsArray ForTypingSession:0];
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)handleTypingSession:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isTCCAuthorized)
  {
    v16 = IXADefaultLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] failed TCC authorization - dropping session", "-[TISKMetricCollector handleTypingSession:]");
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      goto LABEL_20;
    }
LABEL_17:

    unsigned int v18 = [MEMORY[0x1E4F1CA48] array];
    savedSessionStatsArray = self->_savedSessionStatsArray;
    self->_savedSessionStatsArray = v18;
    goto LABEL_18;
  }
  uint64_t v5 = [(TISKMetricCollector *)self dataWriter];
  if (!v5
    || (id v6 = (void *)v5,
        [(TISKMetricCollector *)self dataWriter],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isReady],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v16 = IXADefaultLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] writer is not ready - dropping session", "-[TISKMetricCollector handleTypingSession:]");
      *(_DWORD *)buf = 138412290;
      v25 = v17;
LABEL_20:
      _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  savedSessionStatsArray = [v4 userActionHistory];
  uint64_t v10 = [savedSessionStatsArray countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(savedSessionStatsArray);
      }
      [*(id *)(*((void *)&v19 + 1) + 8 * v13) occurenceTime];
      if (v14 < 0.0) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [savedSessionStatsArray countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    id v15 = +[TISKMetricDefinition metricDefinitions];
    [(TISKMetricCollector *)self _loadStatsFromDataStore];
    savedSessionStatsArray = [(TISKMetricCollector *)self consumeTypingSession:v4];
    if (savedSessionStatsArray)
    {
      [(TISKMetricCollector *)self removeSessionStatsWithNegativeDurationFromArray:self->_savedSessionStatsArray ForTypingSession:v4];
      [(TISKMetricCollector *)self processNewSessionStatsArray:savedSessionStatsArray];
      [(TISKMetricCollector *)self _persistSavedSessionStatsArray];
      [(TISKMetricCollector *)self _clear];
    }
  }
LABEL_18:
}

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = IXADefaultLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] enqueue session", "-[TISKMetricCollector sessionDidEnd:aligned:]");
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v9;
    _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
  }
  id v7 = v5;
  objc_initWeak(location, self);
  objc_copyWeak(&v11, location);
  uint64_t v10 = v7;
  id v8 = v7;
  TIDispatchAsync();

  objc_destroyWeak(&v11);
  objc_destroyWeak(location);
}

void __45__TISKMetricCollector_sessionDidEnd_aligned___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = IXADefaultLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] dequeue session", "-[TISKMetricCollector sessionDidEnd:aligned:]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v6 = v4;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    [WeakRetained handleTypingSession:*(void *)(a1 + 32)];
  }
}

- (BOOL)publishIfSessionStatsHasWordCountMoreThanThreshold:(id)a3 withSessionStartTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 counter:kTISKNumberOfWordsCounter];
  unint64_t v8 = [v7 integerValue];

  unint64_t v9 = [(TISKMetricCollector *)self wordAccumulationThreshold];
  if (v8 >= v9)
  {
    uint64_t v10 = [(TISKMetricCollector *)self dataWriter];
    [v10 publishSessionStats:v6 withSessionStartTime:v4];
  }
  return v8 >= v9;
}

- (void)processNewSessionStatsArray:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v9 isEmpty] & 1) == 0
          && ![(TISKMetricCollector *)self publishIfSessionStatsHasWordCountMoreThanThreshold:v9 withSessionStartTime:1])
        {
          savedSessionStatsArray = self->_savedSessionStatsArray;
          id v11 = [v9 layout];
          int64_t v12 = [(TISKMetricCollector *)self findIndexSessionStatsFromArray:savedSessionStatsArray thatHasLayout:v11];

          if (v12 == -1)
          {
            v16 = IXADefaultLogFacility();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] savedSessionStats is nil", "-[TISKMetricCollector processNewSessionStatsArray:]");
              *(_DWORD *)buf = 138412290;
              v24 = v18;
              _os_log_debug_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            [(NSMutableArray *)self->_savedSessionStatsArray addObject:v9];
          }
          else
          {
            uint64_t v13 = [(NSMutableArray *)self->_savedSessionStatsArray objectAtIndex:v12];
            double v14 = IXADefaultLogFacility();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v17 = [NSString stringWithFormat:@"%s [SensorKit] savedSessionStats not nil, savedSessionStats class %@", "-[TISKMetricCollector processNewSessionStatsArray:]", objc_opt_class()];
              *(_DWORD *)buf = 138412290;
              v24 = v17;
              _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            id v15 = [v13 sessionIds];

            if (v15)
            {
              [v13 merge:v9];
              if ([(TISKMetricCollector *)self publishIfSessionStatsHasWordCountMoreThanThreshold:v13 withSessionStartTime:0])
              {
                [(NSMutableArray *)self->_savedSessionStatsArray removeObjectAtIndex:v12];
              }
            }
            else
            {
              [(NSMutableArray *)self->_savedSessionStatsArray removeObjectAtIndex:v12];
              [(NSMutableArray *)self->_savedSessionStatsArray addObject:v9];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
}

- (double)totalTimeSpanFromLastTap
{
  NSUInteger v3 = [(NSArray *)self->_sortedEvents count];
  double v4 = 0.0;
  if ((uint64_t)(v3 - 1) >= 0)
  {
    uint64_t v5 = v3;
    do
    {
      uint64_t v6 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:--v5];
      uint64_t v7 = [v6 tap];
      if (v7)
      {
        unint64_t v8 = (void *)v7;
        unint64_t v9 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v5];
        uint64_t v10 = [v9 tap];
        id v11 = [v10 lastTouch];

        if (v11)
        {
          int64_t v12 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v5];
          uint64_t v13 = [v12 tap];

          double v14 = [v13 lastTouch];
          [v14 timestamp];
          double v16 = v15;
          unint64_t v17 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:0];
          [v17 touchDownTimestamp];
          double v4 = v16 - v18;

          return v4;
        }
      }
      else
      {
      }
    }
    while (v5 > 0);
  }
  return v4;
}

- (double)totalTimeSpan
{
  double v3 = 0.0;
  if (![(NSArray *)self->_sortedEvents count])
  {
LABEL_5:
    uint64_t v7 = 0;
LABEL_6:
    unint64_t v8 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v4];
    char v6 = [v5 hasTimestamp];

    if (v6) {
      break;
    }
    if (++v4 >= [(NSArray *)self->_sortedEvents count]) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v4];
  if (!v7) {
    goto LABEL_6;
  }
  NSUInteger v10 = [(NSArray *)self->_sortedEvents count];
  while ((--v10 & 0x8000000000000000) == 0)
  {
    id v11 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v10];
    int v12 = [v11 hasTimestamp];

    if (v12)
    {
      unint64_t v8 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v10];
      goto LABEL_14;
    }
  }
  unint64_t v8 = 0;
LABEL_14:
  if (v7 == v8)
  {
    unint64_t v8 = v7;
  }
  else
  {
    [v8 touchUpTimestamp];
    double v14 = v13;
    [v7 touchDownTimestamp];
    double v3 = v14 - v15;
  }
LABEL_7:

  return v3;
}

- (id)privateEventsDescription
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_sortedEvents;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "privateDescription", (void)v11);
        [v3 appendString:v9];

        [v3 appendString:@"|"];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)eventsDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = self->_sortedEvents;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = [v11 description];
        [v5 appendString:v12];

        if (v3
          && [v11 type] != 13
          && [v11 type] != 14
          && [v11 type] != 7
          && [v11 type] != 11)
        {
          long long v13 = NSString;
          [v11 touchDownTimestamp];
          uint64_t v15 = v14;
          [v11 touchUpTimestamp];
          unint64_t v17 = objc_msgSend(v13, "stringWithFormat:", @":%lf->%lf", v15, v16, (void)v19);
          [v5 appendString:v17];
        }
        [v5 appendString:@"|"];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)eventsDescription
{
  return [(TISKMetricCollector *)self eventsDescription:0];
}

- (void)_coalesceTaps
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  taps = self->_taps;
  self->_taps = v3;

  if (![(NSMutableArray *)self->_touches count]) {
    goto LABEL_69;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = v7;
    uint64_t v36 = [(NSMutableArray *)self->_touches objectAtIndex:0];

    [(NSMutableArray *)self->_touches removeObjectAtIndex:0];
    uint64_t v9 = [(NSMutableArray *)self->_layoutIDs objectAtIndex:0];
    uint64_t v10 = [v9 integerValue];

    [(NSMutableArray *)self->_layoutIDs removeObjectAtIndex:0];
    uint64_t v11 = [v36 pathIndex];
    long long v12 = [TISKTap alloc];
    long long v13 = [(TISKMetricCollector *)self _mapIDToLayout:v10];
    id v14 = [(TISKTap *)v12 init:v36 layout:v13];

    [v14 setPathIndex:v11];
    if (![(NSMutableArray *)self->_touches count])
    {
      long long v22 = v5;
      goto LABEL_63;
    }
    unint64_t v15 = 0;
    uint64_t v16 = v5;
    while (1)
    {
      unint64_t v17 = v36;
      uint64_t v36 = [(NSMutableArray *)self->_touches objectAtIndex:v15];

      if ([v36 pathIndex] == v11) {
        break;
      }
LABEL_22:
      long long v22 = v16;
LABEL_42:
      ++v15;
      uint64_t v16 = v22;
      if ([(NSMutableArray *)self->_touches count] <= v15) {
        goto LABEL_63;
      }
    }
    if ([v36 stage] == 1)
    {
      [v14 addDragTouch:v36];
      if ((unint64_t)v16 >= v6)
      {
        uint64_t v18 = v16 - v5;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          goto LABEL_72;
        }
        if ((uint64_t)(v6 - (void)v5) >> 2 > v19) {
          unint64_t v19 = (uint64_t)(v6 - (void)v5) >> 2;
        }
        if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v19;
        }
        if (v20) {
          unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v20);
        }
        else {
          uint64_t v21 = 0;
        }
        v25 = (unint64_t *)(v20 + 8 * v18);
        unint64_t *v25 = v15;
        long long v22 = v25 + 1;
        while (v16 != v5)
        {
          unint64_t v26 = *--v16;
          *--v25 = v26;
        }
LABEL_39:
        unint64_t v6 = v20 + 8 * v21;
        if (v5) {
          operator delete(v5);
        }
        uint64_t v5 = v25;
        goto LABEL_42;
      }
LABEL_21:
      *v16++ = v15;
      goto LABEL_22;
    }
    if ([v36 stage] != 2
      && [v36 stage] != 3
      && [v36 stage] != 5)
    {
      if (![v36 stage]) {
        goto LABEL_47;
      }
      if ((unint64_t)v16 >= v6)
      {
        uint64_t v23 = v16 - v5;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61) {
          goto LABEL_72;
        }
        if ((uint64_t)(v6 - (void)v5) >> 2 > v24) {
          unint64_t v24 = (uint64_t)(v6 - (void)v5) >> 2;
        }
        if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v24;
        }
        if (v20) {
          unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v20);
        }
        else {
          uint64_t v21 = 0;
        }
        v25 = (unint64_t *)(v20 + 8 * v23);
        unint64_t *v25 = v15;
        long long v22 = v25 + 1;
        while (v16 != v5)
        {
          unint64_t v27 = *--v16;
          *--v25 = v27;
        }
        goto LABEL_39;
      }
      goto LABEL_21;
    }
    [v14 setLastTouch:v36];
    if ((unint64_t)v16 >= v6)
    {
      uint64_t v28 = v16 - v5;
      unint64_t v29 = v28 + 1;
      if ((unint64_t)(v28 + 1) >> 61) {
LABEL_72:
      }
        abort();
      if ((uint64_t)(v6 - (void)v5) >> 2 > v29) {
        unint64_t v29 = (uint64_t)(v6 - (void)v5) >> 2;
      }
      if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v30 = v29;
      }
      if (v30) {
        unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v30);
      }
      else {
        uint64_t v31 = 0;
      }
      v32 = (unint64_t *)(v30 + 8 * v28);
      unint64_t *v32 = v15;
      long long v22 = v32 + 1;
      while (v16 != v5)
      {
        unint64_t v33 = *--v16;
        *--v32 = v33;
      }
      unint64_t v6 = v30 + 8 * v31;
      if (v5) {
        operator delete(v5);
      }
      uint64_t v5 = v32;
    }
    else
    {
      *v16++ = v15;
LABEL_47:
      long long v22 = v16;
    }
LABEL_63:
    [(NSMutableArray *)self->_taps addObject:v14];
    if ((int)(((unint64_t)((char *)v22 - (char *)v5) >> 3) - 1) >= 0)
    {
      uint64_t v34 = ((unint64_t)((char *)v22 - (char *)v5) >> 3) - 1;
      do
      {
        [(NSMutableArray *)self->_touches removeObjectAtIndex:v5[v34]];
        [(NSMutableArray *)self->_layoutIDs removeObjectAtIndex:v5[v34--]];
      }
      while (v34 != -1);
    }

    uint64_t v35 = [(NSMutableArray *)self->_touches count];
    uint64_t v7 = v36;
  }
  while (v35);
  if (v5) {
    operator delete(v5);
  }
LABEL_69:

  MEMORY[0x1F41817F8]();
}

- (id)_mapIDToLayout:(unint64_t)a3
{
  accentedLayoutsMap = self->_accentedLayoutsMap;
  if (accentedLayoutsMap)
  {
    unint64_t v6 = [(NSMutableArray *)accentedLayoutsMap objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v7 = [(TITypingSession *)self->_typingSession layouts];
    unint64_t v6 = [v7 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)_insertEmojiSwitchEvents:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    id v42 = v3;
    goto LABEL_55;
  }
  uint64_t v4 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v62 = v3;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v67 objects:v71 count:16];
  v65 = v5;
  v66 = v4;
  if (!v6)
  {
    uint64_t v11 = 0;
    id v10 = 0;
    id v41 = v5;
    goto LABEL_37;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  char v9 = 0;
  id v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v68;
  do
  {
    uint64_t v13 = 0;
    id v14 = v10;
    do
    {
      if (*(void *)v68 != v12) {
        objc_enumerationMutation(v5);
      }
      unint64_t v15 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
      unsigned int v16 = [v15 type];
      if (v16 <= 0x11)
      {
        if (((1 << v16) & 0x1ABFD) != 0)
        {
          int v17 = [v15 emojiSearchMode];
          if (v8)
          {
            if (v17) {
              goto LABEL_11;
            }
            if (v9)
            {
              v25 = [TISKEmojiSearchEvent alloc];
              [v11 touchUpTimestamp];
              id v27 = -[TISKEmojiSearchEvent init:engaged:order:](v25, "init:engaged:order:", 0, [v14 order] + 1, v26);
              [v66 addObject:v27];
            }
            uint64_t v28 = [TISKEmojiSwitchEvent alloc];
            [v11 touchUpTimestamp];
            id v24 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v28, "init:emojiSearchMode:order:", 0, [v14 order] + 2, v29);
            char v8 = 0;
            char v9 = 0;
            goto LABEL_25;
          }
          if (!v17)
          {
            char v8 = 0;
            goto LABEL_27;
          }
          uint64_t v18 = [TISKEmojiSwitchEvent alloc];
          [v15 touchDownTimestamp];
          char v8 = 1;
          id v20 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v18, "init:emojiSearchMode:order:", 1, [v15 order] - 2, v19);
          uint64_t v21 = v66;
          [v66 addObject:v20];

          long long v22 = [TISKEmojiSearchEvent alloc];
          [v15 touchDownTimestamp];
          id v24 = -[TISKEmojiSearchEvent init:engaged:order:](v22, "init:engaged:order:", 1, [v15 order] - 1, v23);
          char v9 = 1;
        }
        else
        {
          if (v16 == 12)
          {
            if (v9 & 1 | ((v8 & 1) == 0)) {
              goto LABEL_27;
            }
            unint64_t v33 = [TISKEmojiSearchEvent alloc];
            [v15 touchDownTimestamp];
            char v9 = 1;
            uint64_t v32 = -[TISKEmojiSearchEvent init:engaged:order:](v33, "init:engaged:order:", 1, [v15 order] - 1, v34);
          }
          else
          {
            if (v16 != 17) {
              goto LABEL_27;
            }
            if (v8)
            {
LABEL_11:
              char v8 = 1;
              goto LABEL_27;
            }
            unint64_t v30 = [TISKEmojiSwitchEvent alloc];
            [v15 touchDownTimestamp];
            char v8 = 1;
            uint64_t v32 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v30, "init:emojiSearchMode:order:", 1, [v15 order] - 1, v31);
          }
          id v24 = (id)v32;
LABEL_25:
          uint64_t v21 = v66;
        }
        [v21 addObject:v24];

        id v5 = v65;
      }
LABEL_27:
      id v10 = v15;

      if ([v10 hasTimestamp])
      {
        id v35 = v10;

        uint64_t v11 = v35;
      }
      ++v13;
      id v14 = v10;
    }
    while (v7 != v13);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v67 objects:v71 count:16];
  }
  while (v7);

  if (v8)
  {
    uint64_t v4 = v66;
    if (v9)
    {
      uint64_t v36 = [TISKEmojiSearchEvent alloc];
      [v11 touchUpTimestamp];
      id v38 = -[TISKEmojiSearchEvent init:engaged:order:](v36, "init:engaged:order:", 0, [v10 order] + 1, v37);
      [v66 addObject:v38];
    }
    v39 = [TISKEmojiSwitchEvent alloc];
    [v11 touchUpTimestamp];
    id v41 = -[TISKEmojiSwitchEvent init:emojiSearchMode:order:](v39, "init:emojiSearchMode:order:", 0, [v10 order] + 2, v40);
    [v66 addObject:v41];
LABEL_37:
  }
  else
  {
    uint64_t v4 = v66;
  }
  id v42 = (id)objc_opt_new();
  if ([v5 count])
  {
    uint64_t v43 = 0;
    int v44 = 0;
    uint64_t v45 = 0;
    v63 = v42;
    do
    {
      if ([v4 count] <= (unint64_t)v44) {
        break;
      }
      uint64_t v46 = v44;
      v64 = [v65 objectAtIndexedSubscript:v43];
      unint64_t v47 = [v64 order];
      v48 = [v4 objectAtIndexedSubscript:v44];
      if (v47 >= [v48 order])
      {
        ++v44;
        v50 = [v4 objectAtIndexedSubscript:v46];
        uint64_t v49 = v45;
      }
      else
      {
        uint64_t v49 = (v45 + 1);
        v50 = [v65 objectAtIndexedSubscript:v43];
      }
      id v42 = v63;
      [v63 addObject:v50];

      uint64_t v43 = (int)v49;
      uint64_t v45 = v49;
      BOOL v51 = [v65 count] > (unint64_t)(int)v49;
      uint64_t v4 = v66;
    }
    while (v51);
  }
  else
  {
    LODWORD(v45) = 0;
    int v44 = 0;
  }
  int v52 = v44;
  if ([v65 count] > (unint64_t)(int)v45)
  {
    unint64_t v53 = (int)v45;
    do
    {
      unint64_t v54 = v53 + 1;
      v55 = objc_msgSend(v65, "objectAtIndexedSubscript:");
      [v42 addObject:v55];

      unint64_t v56 = [v65 count];
      unint64_t v53 = v54;
    }
    while (v56 > v54);
  }
  if ([v4 count] > (unint64_t)v52)
  {
    unint64_t v57 = v52;
    do
    {
      unint64_t v58 = v57 + 1;
      v59 = objc_msgSend(v4, "objectAtIndexedSubscript:");
      [v42 addObject:v59];

      unint64_t v60 = [v4 count];
      unint64_t v57 = v58;
    }
    while (v60 > v58);
  }

  id v3 = v62;
LABEL_55:

  return v42;
}

- (void)_mapTapsToEvents
{
  v2 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = [(TITypingSession *)self->_typingSession layouts];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obj = v2->_taps;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_30;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v55;
  uint64_t v50 = *(void *)v55;
  do
  {
    uint64_t v9 = 0;
    uint64_t v51 = v6;
    do
    {
      if (*(void *)v55 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v54 + 1) + 8 * v9);
      if (objc_msgSend(v10, "isDownUpTap", v50))
      {
        if (v7)
        {
          uint64_t v11 = [v7 emojiSearchMode];
          uint64_t v12 = [v7 order] + 10;
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
        }
        uint64_t v13 = [v10 layout];

        unsigned int v53 = v11;
        if (v7 && v4 != v13)
        {
          [v4 frame];
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          long long v22 = [v10 layout];
          [v22 frame];
          v61.origin.x = v23;
          v61.origin.y = v24;
          v61.size.width = v25;
          v61.size.height = v26;
          v60.origin.x = v15;
          v60.origin.y = v17;
          v60.size.width = v19;
          v60.size.height = v21;
          BOOL v27 = CGRectEqualToRect(v60, v61);

          if (v27)
          {
            uint64_t v28 = [TISKLayoutSwitchEvent alloc];
            [v7 touchUpTimestamp];
            double v30 = v29;
            double v31 = [v10 layout];
            id v32 = [(TISKLayoutSwitchEvent *)v28 init:v31 layout:v11 emojiSearchMode:v12 order:v30];
          }
          else
          {
            currentSessionStatsArray = v2->_currentSessionStatsArray;
            double v34 = [v10 layout];
            uint64_t v35 = [(TISKMetricCollector *)v2 findIndexSessionStatsFromArray:currentSessionStatsArray thatHasLayout:v34];

            double v31 = [(NSMutableArray *)v2->_currentSessionStatsArray objectAtIndex:v35];
            id v32 = [[TISKBucketSwitchEvent alloc] init:v31 emojiSearchMode:v11 order:v12];
          }
          uint64_t v36 = v32;

          ++v12;
          [(NSMutableArray *)v2->_events addObject:v36];
          uint64_t v37 = [v10 layout];

          uint64_t v4 = (void *)v37;
        }
        id v38 = v2;
        touchToEventMap = v2->_touchToEventMap;
        double v40 = NSNumber;
        id v41 = [v10 lastTouch];
        id v42 = [v40 numberWithLong:v41];
        uint64_t v43 = [(NSMutableDictionary *)touchToEventMap objectForKey:v42];

        if (v43)
        {
          [v43 setTap:v10];
          v2 = v38;
          goto LABEL_22;
        }
        int v44 = [v10 stringForIntendedKey];
        id v45 = v44;
        if (v44)
        {
          char v46 = [v44 isEqualToString:@"shift"];
          unint64_t v47 = off_1E6E28110;
          v2 = v38;
          if ((v46 & 1) != 0 || (v48 = [v45 isEqualToString:@"more"], unint64_t v47 = off_1E6E28070, v48))
          {
            uint64_t v43 = (void *)[objc_alloc(*v47) init:v10 emojiSearchMode:v53 order:v12];
            [(NSMutableArray *)v38->_events addObject:v43];

LABEL_22:
            id v45 = v43;

            uint64_t v7 = v45;
          }
        }
        else
        {
          v2 = v38;
        }
        uint64_t v8 = v50;
        uint64_t v6 = v51;
      }
      ++v9;
    }
    while (v6 != v9);
    uint64_t v49 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    uint64_t v6 = v49;
  }
  while (v49);
LABEL_30:
}

- (void)_metricWalk
{
  currentSessionStatsArray = self->_currentSessionStatsArray;
  uint64_t v4 = [(TITypingSession *)self->_typingSession layouts];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  int64_t v6 = [(TISKMetricCollector *)self findIndexSessionStatsFromArray:currentSessionStatsArray thatHasLayout:v5];

  uint64_t v7 = [(NSMutableArray *)self->_currentSessionStatsArray objectAtIndex:v6];
  if (![(NSArray *)self->_sortedEvents count]) {
    goto LABEL_23;
  }
  unint64_t v8 = 0;
  id v13 = 0;
  do
  {
    if (!v8) {
      [v7 addSample:&unk_1F3FA79D0 forKey:kTISKEpisodeCount];
    }
    uint64_t v9 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v8];
    switch([v9 type])
    {
      case 7u:
      case 0xBu:
        [v9 reportToSession:v7];
        break;
      case 0xAu:
        [v9 reportToSession:v7];
        if (!v13) {
          goto LABEL_7;
        }
        if ([v13 type] == 5 || objc_msgSend(v13, "type") == 2)
        {
          id v10 = [v13 tap];
          [v9 setTap:v10];

          goto LABEL_16;
        }
        break;
      case 0xDu:
      case 0xFu:
      case 0x10u:
        [(TISKMetricCollector *)self _haltSessionTypingTimer:v7 event:v13];

LABEL_7:
        id v13 = 0;
        break;
      case 0xEu:
        [(TISKMetricCollector *)self _haltSessionTypingTimer:v7 event:v13];

        [v9 reportToSession:v7];
        uint64_t v12 = [v9 sessionStats];

        id v13 = 0;
        uint64_t v7 = (void *)v12;
        break;
      default:
        if (!v13) {
          [v7 startTypingTimerWithEvent:v9];
        }
        [v9 reportToSession:v7];
        [v9 reportInterKeyTiming:v7 previousEvent:v13];
LABEL_16:
        if ([v9 hasTimestamp])
        {
          id v11 = v9;

          id v13 = v11;
        }
        break;
    }

    ++v8;
  }
  while ([(NSArray *)self->_sortedEvents count] > v8);
  if (v13)
  {
    if ([v13 type] != 14)
    {
      [v7 haltTypingTimerWithEvent:v13];
      goto LABEL_25;
    }
  }
  else
  {
LABEL_23:
    id v13 = 0;
  }
  [v7 haltTypingTimer];
LABEL_25:
}

- (id)getWordBucketCategoryForWord:(id)a3
{
  id v4 = a3;
  [(TISKMetricCollector *)self loadWordBucketDictionaryIfNecessary];
  uint64_t v5 = [v4 lowercaseString];

  int64_t v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  unint64_t v8 = [MEMORY[0x1E4FAE268] createStringByReplacingStylizedQuotesToStraightQuotes:v7];

  uint64_t v9 = [(NSDictionary *)self->_wordBucketDictionary objectForKey:v8];
  if (!v9)
  {
    id v10 = [(TISKMetricCollector *)self lemmatizeWord:v8];
    uint64_t v9 = [(NSDictionary *)self->_wordBucketDictionary objectForKey:v10];

    if (!v9)
    {
      if (self->_previousWord)
      {
        id v11 = [NSString stringWithFormat:@"%@ %@", self->_previousWord, v8];
        uint64_t v9 = [(NSDictionary *)self->_wordBucketDictionary objectForKey:v11];
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
  }
  previousWord = self->_previousWord;
  self->_previousWord = v8;

  return v9;
}

- (id)lemmatizeWord:(id)a3
{
  [(NLTagger *)self->_tagger setString:a3];
  tagger = self->_tagger;
  uint64_t v5 = *MEMORY[0x1E4F38858];

  return [(NLTagger *)tagger tagAtIndex:0 unit:0 scheme:v5 tokenRange:0];
}

- (void)loadEmojiBucketDictionaryIfNecessary
{
  if (!self->_emojiBuckets)
  {
    self->_emojiBuckets = [(TISKMetricCollector *)self loadDataWithFilename:@"emojiBuckets"];
    MEMORY[0x1F41817F8]();
  }
}

- (void)loadWordBucketDictionaryIfNecessary
{
  if (!self->_wordBucketDictionary)
  {
    self->_wordBucketDictionary = [(TISKMetricCollector *)self loadDataWithFilename:@"wordBuckets"];
    MEMORY[0x1F41817F8]();
  }
}

- (void)_haltSessionTypingTimer:(id)a3 event:(id)a4
{
  if (a4) {
    [a3 haltTypingTimerWithEvent:a4];
  }
  else {
    [a3 haltTypingTimer];
  }
}

- (void)_processEvents
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_events count])
  {
    if ([(NSMutableArray *)self->_events count])
    {
      unint64_t v3 = 0;
      do
      {
        id v4 = [(NSMutableArray *)self->_events objectAtIndexedSubscript:v3];
        if ([v4 isMissingATouch])
        {
          id v5 = -[TISKTouchlessInputEvent init:order:]([TISKTouchlessInputEvent alloc], "init:order:", [v4 emojiSearchMode], objc_msgSend(v4, "order"));
          [(NSMutableArray *)self->_events setObject:v5 atIndexedSubscript:v3];
        }
        ++v3;
      }
      while (v3 < [(NSMutableArray *)self->_events count]);
    }
    int64_t v6 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v7 = [(NSMutableArray *)self->_events sortedArrayUsingComparator:&__block_literal_global_224];
    unint64_t v8 = [v6 arrayWithArray:v7];

    uint64_t v9 = [(TISKMetricCollector *)self _insertEmojiSwitchEvents:v8];
    sortedEvents = self->_sortedEvents;
    self->_sortedEvents = v9;

    uint64_t v30 = 0;
    double v31 = &v30;
    uint64_t v32 = 0x3032000000;
    unint64_t v33 = __Block_byref_object_copy_;
    double v34 = __Block_byref_object_dispose_;
    id v35 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__TISKMetricCollector__processEvents__block_invoke_225;
    aBlock[3] = &unk_1E6E2E248;
    aBlock[4] = &v30;
    id v11 = (void (**)(void))_Block_copy(aBlock);
    if ([(NSArray *)self->_sortedEvents count])
    {
      unint64_t v12 = 0;
      uint64_t v13 = 0;
      while (1)
      {
        double v14 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v13];
        if ([v14 type] == 3) {
          break;
        }
        if ([v14 type] != 11)
        {
          v11[2](v11);
          if (![v14 type])
          {
            [v14 setWordPosition:v12];
            if (v12 == 4)
            {
              for (uint64_t i = 0; i != -5; --i)
              {
                double v16 = [(NSArray *)self->_sortedEvents objectAtIndexedSubscript:v13 + i];
                [v16 setIsShortWord:0];
              }
            }
            else if (v12 >= 5)
            {
              [v14 setIsShortWord:0];
            }
            ++v12;
            goto LABEL_14;
          }
          goto LABEL_13;
        }
LABEL_14:

        if (++v13 >= [(NSArray *)self->_sortedEvents count]) {
          goto LABEL_23;
        }
      }
      [(id)v31[5] addObject:v14];
LABEL_13:
      unint64_t v12 = 0;
      goto LABEL_14;
    }
LABEL_23:
    v11[2](v11);
    [(TISKMetricCollector *)self _metricWalk];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    CGFloat v17 = self->_currentSessionStatsArray;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          CGFloat v23 = objc_msgSend(v22, "startTime", (void)v25);
          [(TISKMetricCollector *)self totalTimeSpan];
          CGFloat v24 = objc_msgSend(v23, "dateByAddingTimeInterval:");
          [v22 setEndTime:v24];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v25 objects:v36 count:16];
      }
      while (v19);
    }

    _Block_object_dispose(&v30, 8);
  }
}

uint64_t __37__TISKMetricCollector__processEvents__block_invoke_225(uint64_t a1)
{
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] >= 2)
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] - 1;
    if (v2 >= 0)
    {
      uint64_t v3 = 0;
      do
      {
        id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:v2];
        [v4 setDeletePostion:v3];

        --v2;
        ++v3;
      }
      while (v2 != -1);
    }
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v5 removeAllObjects];
}

uint64_t __37__TISKMetricCollector__processEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 order];
  uint64_t v6 = [v4 order];

  if (v5 > v6) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)_consumePathsAndPredictions:(id)a3 emojiSearchMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v41 = a3;
  uint64_t v6 = [v41 acceptedCandidate];
  uint64_t v7 = v41;
  if (v6)
  {
    uint64_t v8 = [v41 acceptedString];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v10 = [v41 acceptedString];
      uint64_t v11 = [v10 length];

      uint64_t v7 = v41;
      if (!v11) {
        goto LABEL_21;
      }
      unint64_t v12 = [v41 acceptedCandidate];
      int v13 = [v12 isContinuousPathConversion];

      if (v13)
      {
        double v14 = [v41 allTouchesM];
        CGFloat v15 = [v14 lastObject];

        if (v15)
        {
          double v16 = [TISKPathEvent alloc];
          CGFloat v17 = [v41 acceptedCandidate];
          uint64_t v18 = [v41 allTouchesM];
          id v19 = [(TISKPathEvent *)v16 init:v15 candidate:v17 allTouches:v18 emojiSearchMode:v4 order:self->_eventOrder];

          touchToEventMap = self->_touchToEventMap;
          CGFloat v21 = [NSNumber numberWithLong:v15];
          [(NSMutableDictionary *)touchToEventMap setObject:v19 forKey:v21];
        }
        else
        {
          id v19 = [[TISKTouchlessInputEvent alloc] init:v4 order:self->_eventOrder];
        }
        [(NSMutableArray *)self->_events addObject:v19];
        self->_eventOrder += 100;
      }
      else
      {
        uint64_t v7 = v41;
        if (v4) {
          goto LABEL_21;
        }
        if ([(NSMutableArray *)self->_events count])
        {
          long long v22 = [(NSMutableArray *)self->_events lastObject];
          int64_t eventOrder = [v22 order];
        }
        else
        {
          int64_t eventOrder = self->_eventOrder;
        }
        int64_t v24 = eventOrder + 1;
        if (([v41 wordEntryType] & 4) != 0)
        {
          long long v25 = [v41 acceptedCandidate];
          long long v26 = [v25 candidate];
          uint64_t v27 = [v26 _containsEmoji];

          if (v27)
          {
            [(TISKMetricCollector *)self loadEmojiBucketDictionaryIfNecessary];
            emojiBuckets = self->_emojiBuckets;
            double v29 = [v41 acceptedString];
            uint64_t v30 = [(NSDictionary *)emojiBuckets objectForKey:v29];
          }
          else
          {
            uint64_t v30 = 0;
          }
          double v31 = [TISKPredictionBarEvent alloc];
          [v41 occurenceTime];
          id v32 = -[TISKPredictionBarEvent init:emojiPrediction:emojiSearchMode:order:emojiBucketCategory:](v31, "init:emojiPrediction:emojiSearchMode:order:emojiBucketCategory:", v27, 0, eventOrder + 1, v30);
          [(NSMutableArray *)self->_events addObject:v32];
          int64_t v24 = eventOrder + 2;
        }
        uint64_t v33 = [v41 wordEntryType] & 1;
        events = self->_events;
        id v35 = [TISKCandidateAcceptEvent alloc];
        uint64_t v36 = [v41 acceptedCandidate];
        uint64_t v37 = [v41 acceptedCandidate];
        id v38 = [v37 candidate];
        v39 = [(TISKMetricCollector *)self getWordBucketCategoryForWord:v38];
        id v40 = [(TISKCandidateAcceptEvent *)v35 init:v36 emojiSearchMode:0 order:v24 wordBucketCategory:v39 isAutocorrection:v33];
        [(NSMutableArray *)events addObject:v40];

        self->_eventOrder += 100;
      }
    }
    else
    {
    }
    uint64_t v7 = v41;
  }
LABEL_21:
}

- (void)_consumeInputsAndTouches:(id)a3 occurenceTime:(double)a4 emojiSearchMode:(BOOL)a5
{
  BOOL v32 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = a3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        unint64_t v12 = [v11 touchEvent];

        if (v12)
        {
          int64_t eventOrder = self->_eventOrder;
          double v14 = [(TITypingSession *)self->_typingSession sessionParams];
          CGFloat v15 = [v14 wordSeparator];
          id v16 = +[TISKInputEvent makeInputEvent:v11 emojiSearchMode:v32 order:eventOrder wordSeparator:v15 accentedLanguage:self->_accentedLanguage];

          touchToEventMap = self->_touchToEventMap;
          uint64_t v18 = NSNumber;
          id v19 = [v11 touchEvent];
          uint64_t v20 = [v18 numberWithLong:v19];
          [(NSMutableDictionary *)touchToEventMap setObject:v16 forKey:v20];
          goto LABEL_8;
        }
        id v16 = [v11 string];
        if (![v16 length]) {
          goto LABEL_10;
        }
        CGFloat v21 = [v11 string];
        long long v22 = [(TITypingSession *)self->_typingSession sessionParams];
        CGFloat v23 = [v22 wordSeparator];
        char v24 = [v21 isEqualToString:v23];

        if ((v24 & 1) == 0)
        {
          long long v25 = [v11 string];
          int v26 = [v25 _containsEmoji];

          if (v26)
          {
            [(TISKMetricCollector *)self loadEmojiBucketDictionaryIfNecessary];
            uint64_t v27 = [TISKEmojiInputEvent alloc];
            int64_t v28 = self->_eventOrder;
            emojiBuckets = self->_emojiBuckets;
            id v19 = [v11 string];
            uint64_t v20 = [(NSDictionary *)emojiBuckets objectForKey:v19];
            id v16 = [(TISKEmojiInputEvent *)v27 init:v32 emojiSearchMode:v28 order:v20 emojiBucketCategory:a4];
LABEL_8:
          }
          else
          {
            id v16 = [[TISKTouchlessInputEvent alloc] init:v32 order:self->_eventOrder];
          }
          self->_eventOrder += 100;
          [(NSMutableArray *)self->_events addObject:v16];
LABEL_10:
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v30 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v8 = v30;
    }
    while (v30);
  }
}

- (void)_consumeDeleteWordEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keyboardState];
  uint64_t v6 = [v5 emojiSearchMode];

  uint64_t v7 = [v4 allKeyboardInputs];
  [v4 occurenceTime];
  -[TISKMetricCollector _consumeInputsAndTouches:occurenceTime:emojiSearchMode:](self, "_consumeInputsAndTouches:occurenceTime:emojiSearchMode:", v7, v6);

  touches = self->_touches;
  uint64_t v9 = [v4 allTouches];
  [(NSMutableArray *)touches addObjectsFromArray:v9];

  layoutIDs = self->_layoutIDs;
  uint64_t v11 = [v4 touchLayoutsM];

  [(NSMutableArray *)layoutIDs addObjectsFromArray:v11];
  events = self->_events;
  int v13 = [[TISKWordDeleteEvent alloc] initWithEmojiSearchMode:v6 order:self->_eventOrder];
  [(NSMutableArray *)events addObject:v13];
}

- (void)_consumeWordEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 keyboardState];
  uint64_t v6 = [v5 emojiSearchMode];

  uint64_t v7 = [v4 allKeyboardInputs];
  [v4 occurenceTime];
  -[TISKMetricCollector _consumeInputsAndTouches:occurenceTime:emojiSearchMode:](self, "_consumeInputsAndTouches:occurenceTime:emojiSearchMode:", v7, v6);

  [(TISKMetricCollector *)self _consumePathsAndPredictions:v4 emojiSearchMode:v6];
  touches = self->_touches;
  uint64_t v9 = [v4 allTouches];
  [(NSMutableArray *)touches addObjectsFromArray:v9];

  layoutIDs = self->_layoutIDs;
  id v11 = [v4 touchLayoutsM];

  [(NSMutableArray *)layoutIDs addObjectsFromArray:v11];
}

- (void)_consumeUserAction:(id)a3
{
  id v10 = a3;
  if ([v10 actionType] == 2 && -[NSMutableArray count](self->_events, "count"))
  {
    events = self->_events;
    uint64_t v5 = [TISKCursorMoveEvent alloc];
    [v10 occurenceTime];
    double v7 = v6;
    uint64_t v8 = [v10 keyboardState];
    id v9 = -[TISKCursorMoveEvent init:emojiSearchMode:order:](v5, "init:emojiSearchMode:order:", [v8 emojiSearchMode], self->_eventOrder, v7);
    [(NSMutableArray *)events addObject:v9];

    self->_eventOrder += 100;
  }
}

- (id)_consumeTypingSession:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(TISKMetricCollector *)self _resetConsumeState];
  objc_storeStrong((id *)&self->_typingSession, a3);
  [(TISKMetricCollector *)self setupSessionStatsForLayouts];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CGFloat v21 = v5;
  double v6 = [v5 userActionHistory];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v12 = [v11 keyboardState];
        int v13 = [v12 textInputTraits];
        if ([v13 autocorrectionType] == 1)
        {
          double v14 = [v11 keyboardState];
          int v15 = [v14 emojiSearchMode];

          if (!v15) {
            continue;
          }
        }
        else
        {
        }
        int v16 = [v11 actionType];
        if (v16 == 1)
        {
          [(TISKMetricCollector *)self _consumeDeleteWordEvent:v11];
        }
        else if (v16)
        {
          [(TISKMetricCollector *)self _consumeUserAction:v11];
        }
        else
        {
          [(TISKMetricCollector *)self _consumeWordEntry:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  while (1)
  {
    CGFloat v17 = [(NSMutableArray *)self->_events lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      break;
    }
    [(NSMutableArray *)self->_events removeLastObject];
  }
  if ([(NSMutableArray *)self->_touches count])
  {
    [(TISKMetricCollector *)self _coalesceTaps];
    [(TISKMetricCollector *)self _mapTapsToEvents];
    [(TISKMetricCollector *)self _processEvents];
    id v19 = self->_currentSessionStatsArray;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)setupSessionStatsForLayouts
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = [(TITypingSession *)self->_typingSession layouts];
  uint64_t v3 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    uint64_t v29 = *(void *)v35;
    do
    {
      uint64_t v6 = 0;
      uint64_t v30 = v4;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v34 + 1) + 8 * v6);
        if ([(TISKMetricCollector *)self findIndexSessionStatsFromArray:self->_currentSessionStatsArray thatHasLayout:v7] == -1)
        {
          long long v33 = [TISKSessionStats alloc];
          uint64_t v8 = [(TITypingSession *)self->_typingSession startTime];
          uint64_t v9 = [(TITypingSession *)self->_typingSession endTime];
          identifier = self->_identifier;
          id v10 = [(TITypingSession *)self->_typingSession locale];
          id v11 = [v10 localeIdentifier];
          unint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
          int v13 = [(TITypingSession *)self->_typingSession sessionId];
          double v14 = [v13 UUIDString];
          int v15 = [v12 arrayWithObject:v14];
          id v16 = [(TISKSessionStats *)v33 init:v8 endDate:v9 identifier:identifier version:@"v.1.0" inputMode:v11 sessionIds:v15 layout:v7];

          uint64_t v5 = v29;
          uint64_t v4 = v30;

          [(NSMutableArray *)self->_currentSessionStatsArray addObject:v16];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v4);
  }

  if (self->_accentedLanguage)
  {
    CGFloat v17 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    accentedLayoutsMap = self->_accentedLayoutsMap;
    self->_accentedLayoutsMap = v18;

    uint64_t v20 = [(TITypingSession *)self->_typingSession layouts];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      unint64_t v22 = 0;
      do
      {
        long long v23 = [(TITypingSession *)self->_typingSession layouts];
        long long v24 = [v23 objectAtIndexedSubscript:v22];

        long long v25 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v24, "firstKeyString"));
        id v26 = [v17 objectForKey:v25];
        if (!v26)
        {
          [v17 setObject:v24 forKey:v25];
          id v26 = v24;
        }
        [(NSMutableArray *)self->_accentedLayoutsMap setObject:v26 atIndexedSubscript:v22];

        ++v22;
        uint64_t v27 = [(TITypingSession *)self->_typingSession layouts];
        unint64_t v28 = [v27 count];
      }
      while (v22 < v28);
    }
  }
}

- (int64_t)findIndexSessionStatsFromArray:(id)a3 thatHasLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v5 objectAtIndex:v7];
      uint64_t v9 = [v8 layout];
      [v9 frame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v6 frame];
      v25.origin.x = v18;
      v25.origin.y = v19;
      v25.size.width = v20;
      v25.size.height = v21;
      v24.origin.x = v11;
      v24.origin.y = v13;
      v24.size.width = v15;
      v24.size.height = v17;
      BOOL v22 = CGRectEqualToRect(v24, v25);

      if (v22) {
        break;
      }
      if (++v7 >= (unint64_t)[v5 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v7 = -1;
  }

  return v7;
}

- (void)_clear
{
  events = self->_events;
  self->_events = 0;

  touches = self->_touches;
  self->_touches = 0;

  layoutIDs = self->_layoutIDs;
  self->_layoutIDs = 0;

  touchToEventMap = self->_touchToEventMap;
  self->_touchToEventMap = 0;

  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = 0;

  currentSessionStatsArray = self->_currentSessionStatsArray;
  self->_currentSessionStatsArray = 0;

  accentedLayoutsMap = self->_accentedLayoutsMap;
  self->_accentedLayoutsMap = 0;
}

- (void)_resetConsumeState
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  currentSessionStatsArray = self->_currentSessionStatsArray;
  self->_currentSessionStatsArray = v3;

  id v5 = [MEMORY[0x1E4F1CA48] array];
  events = self->_events;
  self->_events = v5;

  int64_t v7 = [MEMORY[0x1E4F1CA48] array];
  touches = self->_touches;
  self->_touches = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  layoutIDs = self->_layoutIDs;
  self->_layoutIDs = v9;

  CGFloat v11 = [MEMORY[0x1E4F1CA60] dictionary];
  touchToEventMap = self->_touchToEventMap;
  self->_touchToEventMap = v11;

  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = 0;

  self->_int64_t eventOrder = 100;
}

- (void)_setupTCCAuthNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  p_tccNotifyToken = &self->_tccNotifyToken;
  workQueue = self->_workQueue;
  uint64_t handler = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  CGFloat v11 = __48__TISKMetricCollector__setupTCCAuthNotification__block_invoke;
  double v12 = &unk_1E6E29270;
  objc_copyWeak(&v13, &location);
  if (notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccNotifyToken, workQueue, &handler))
  {
    id v5 = IXADefaultLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSString;
      int64_t v7 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
      uint64_t v8 = [v6 stringWithFormat:@"%s [SensorKit] failed to setup notification with TCC for input mode %@", "-[TISKMetricCollector _setupTCCAuthNotification]", v7, handler, v10, v11, v12];
      *(_DWORD *)buf = 138412290;
      double v16 = v8;
      _os_log_error_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    int *p_tccNotifyToken = -1;
  }
  else
  {
    [(TISKMetricCollector *)self testTCCAuthorization];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __48__TISKMetricCollector__setupTCCAuthNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained testTCCAuthorization];
}

- (void)testTCCAuthorization
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  uint64_t v4 = v3;
  if (!self->_skipTCCAuthorization && ![v3 count])
  {
    dataWriter = IXADefaultLogFacility();
    if (os_log_type_enabled(dataWriter, OS_LOG_TYPE_DEBUG))
    {
      id v13 = NSString;
      double v14 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
      CGFloat v15 = [v13 stringWithFormat:@"%s [SensorKit] TCC is not authorized for input mode %@", "-[TISKMetricCollector testTCCAuthorization]", v14];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, dataWriter, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    BOOL v6 = 0;
    goto LABEL_11;
  }
  id v5 = IXADefaultLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = NSString;
    CGFloat v11 = [(TIInputMode *)self->_inputMode normalizedIdentifier];
    double v12 = [v10 stringWithFormat:@"%s [SensorKit] Got TCC authorization for input mode %@", "-[TISKMetricCollector testTCCAuthorization]", v11];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v12;
    _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  if (!self->_dataWriter)
  {
    id v7 = +[SRSensorWriterWrapper writerInstance];
    uint64_t v8 = objc_alloc_init(SRSensorWriterWrapper);
    dataWriter = self->_dataWriter;
    self->_dataWriter = (TISensorWriterWrapper *)v8;
    BOOL v6 = 1;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v6 = 1;
LABEL_12:
  self->_isTCCAuthorized = v6;
}

- (void)dealloc
{
  int tccNotifyToken = self->_tccNotifyToken;
  if (tccNotifyToken != -1) {
    notify_cancel(tccNotifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)TISKMetricCollector;
  [(TISKMetricCollector *)&v4 dealloc];
}

- (id)loadDataWithFilename:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  BOOL v6 = [v5 URLForResource:v4 withExtension:@"plist"];

  uint64_t v9 = 0;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6 error:&v9];

  return v7;
}

- (id)init:(id)a3 wordsThreshold:(unint64_t)a4 accentedLanguage:(BOOL)a5 skipTCCAuthorization:(BOOL)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TISKMetricCollector;
  double v12 = [(TISKMetricCollector *)&v39 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_inputMode, a3);
    currentSessionStatsArray = v13->_currentSessionStatsArray;
    v13->_currentSessionStatsArray = 0;

    v13->_wordPosition = -1;
    dataWriter = v13->_dataWriter;
    v13->_dataWriter = 0;

    v13->_wordAccumulationThreshold = 8;
    if (os_variant_has_internal_ui()) {
      v13->_wordAccumulationThreshold = a4;
    }
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    savedSessionStatsArray = v13->_savedSessionStatsArray;
    v13->_savedSessionStatsArray = (NSMutableArray *)v16;

    v13->_isLoaded = 0;
    uint64_t v18 = [MEMORY[0x1E4FAE4F0] sharedUserModelDataStore];
    userModelDataStore = v13->_userModelDataStore;
    v13->_userModelDataStore = (TIUserModelDataStore *)v18;

    v13->_accentedLanguage = a5;
    accentedLayoutsMap = v13->_accentedLayoutsMap;
    v13->_accentedLayoutsMap = 0;

    CGFloat v21 = +[TICryptographer sharedCryptographer];
    uint64_t v22 = [(TIInputMode *)v13->_inputMode normalizedIdentifier];
    long long v23 = (void *)v22;
    if (v22) {
      CGRect v24 = (__CFString *)v22;
    }
    else {
      CGRect v24 = @"KEYBOARD";
    }
    uint64_t v25 = [v21 stringDigestForName:v24];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v25;

    if (!v13->_identifier)
    {
      v13->_identifier = (NSString *)@"KEYBOARD-digest";
      uint64_t v27 = IXADefaultLogFacility();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] _identifier is nil", "-[TISKMetricCollector init:wordsThreshold:accentedLanguage:skipTCCAuthorization:]");
        *(_DWORD *)buf = 138412290;
        id v41 = v38;
        _os_log_error_impl(&dword_1E3F0E000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    unint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v30 = dispatch_queue_create("com.apple.textInput.TCCNotification", v29);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v30;

    v13->_int tccNotifyToken = -1;
    v13->_isTCCAuthorized = 0;
    v13->_skipTCCAuthorization = a6;
    id v32 = objc_alloc(MEMORY[0x1E4F388F0]);
    long long v33 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F38858], 0);
    uint64_t v34 = [v32 initWithTagSchemes:v33];
    tagger = v13->_tagger;
    v13->_tagger = (NLTagger *)v34;

    previousWord = v13->_previousWord;
    v13->_previousWord = 0;
  }
  [(TISKMetricCollector *)v13 _setupTCCAuthNotification];

  return v13;
}

- (id)init:(id)a3 wordsThreshold:(unint64_t)a4 accentedLanguage:(BOOL)a5
{
  return [(TISKMetricCollector *)self init:a3 wordsThreshold:a4 accentedLanguage:a5 skipTCCAuthorization:0];
}

- (id)init:(id)a3 wordsThreshold:(unint64_t)a4
{
  return [(TISKMetricCollector *)self init:a3 wordsThreshold:a4 accentedLanguage:0 skipTCCAuthorization:0];
}

- (id)init:(id)a3
{
  return [(TISKMetricCollector *)self init:a3 wordsThreshold:20 accentedLanguage:0];
}

+ (BOOL)isSensorKitSupported:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 normalizedIdentifier];
  id v4 = TIInputModeGetLanguage();

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [&unk_1F3FA7658 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&unk_1F3FA7658);
        }
        if ([v4 isEqualToString:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [&unk_1F3FA7658 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

+ (id)makeMetricCollector:(id)a3 wordsThreshold:(unint64_t)a4 isTesting:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (+[TISKMetricCollector isSensorKitSupported:v7])
  {
    uint64_t v8 = [v7 normalizedIdentifier];
    BOOL v9 = TIInputModeGetLanguage();

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [&unk_1F3FA7670 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(&unk_1F3FA7670);
          }
          if ([v9 isEqualToString:*(void *)(*((void *)&v17 + 1) + 8 * i)])
          {
            uint64_t v14 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [&unk_1F3FA7670 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 0;
LABEL_13:
    id v15 = [[TISKMetricCollector alloc] init:v7 wordsThreshold:a4 accentedLanguage:v14 skipTCCAuthorization:v5];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)placeTaskOnWorkQueue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __66__TISKMetricCollector_TISKSessionStatsTest__placeTaskOnWorkQueue___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IXADefaultLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] dequeue session", "-[TISKMetricCollector(TISKSessionStatsTest) placeTaskOnWorkQueue:]_block_invoke");
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end