@interface REDuetKnowledgeStore
- (id)_createActionsFromDuetEvents:(id)a3;
- (id)_createEventsFromDuetEvents:(id)a3;
- (id)_createTimelineFromPredictionTimeline:(id)a3 filterEmptyData:(BOOL)a4;
- (id)_createTombstonesFromDuetEvents:(id)a3;
- (id)_duetChargingEventStream;
- (id)_duetDonationsStreams;
- (id)_duetQueryForDonatedActionsAfterDate:(id)a3 onStreams:(id)a4 withPredicate:(id)a5;
- (id)_init;
- (id)_queryForDonatedActionsAfterDate:(id)a3 streams:(id)a4;
- (id)_queryForUnfilteredDonationsForStream:(id)a3;
- (id)queryForAllDonatedActions;
- (id)queryForAllDonatedActionsWithIdentifier:(id)a3;
- (id)queryForAllRelevantShortcuts;
- (id)queryForDeletedActionsAfterDate:(id)a3;
- (id)queryForDonatedActionsAfterDate:(id)a3;
- (id)queryForDuetEventWithIdentifier:(id)a3;
- (id)queryForHistoricChargingEventsWithMinimumDuration:(double)a3 inThePastDays:(unint64_t)a4;
- (id)queryForPredictedChargingEventsWithMinimumDuration:(double)a3;
- (id)queryForTopNApplications:(int64_t)a3 withLikelihoodGreaterThan:(double)a4 withTemporalResolution:(int)a5;
- (id)queryForUnfilteredIntentDonations;
- (id)queryForUnfilteredRelevantShortcutDonations;
- (id)queryForUnfilteredUserActivityDonations;
- (id)sleepInterval;
- (void)_executeQuery:(id)a3 responseQueue:(id)a4 synchronouslyWithBatching:(BOOL)a5 completion:(id)a6;
- (void)executeQuery:(id)a3 responseQueue:(id)a4 completion:(id)a5;
- (void)executeQuerySynchronouslyWithBatching:(id)a3 completion:(id)a4;
@end

@implementation REDuetKnowledgeStore

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)REDuetKnowledgeStore;
  v2 = [(RESingleton *)&v8 _init];
  if (v2 && CoreDuetLibraryCore_0())
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)get_DKKnowledgeStoreClass_softClass;
    uint64_t v13 = get_DKKnowledgeStoreClass_softClass;
    if (!get_DKKnowledgeStoreClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __get_DKKnowledgeStoreClass_block_invoke;
      v9[3] = &unk_2644BC768;
      v9[4] = &v10;
      __get_DKKnowledgeStoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 knowledgeStoreWithDirectReadOnlyAccess];
    v6 = (void *)v2[1];
    v2[1] = v5;
  }
  return v2;
}

- (id)queryForTopNApplications:(int64_t)a3 withLikelihoodGreaterThan:(double)a4 withTemporalResolution:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v35[3] = *MEMORY[0x263EF8340];
  if (CoreDuetLibraryCore_0())
  {
    v9 = [get_DKEventQueryClass() predicateForEventsOfMinimumDuration:5.0];
    id DKQueryClass = get_DKQueryClass();
    v11 = [MEMORY[0x263EFF910] distantPast];
    uint64_t v12 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = [DKQueryClass predicateForEventsWithStartInDateRangeFrom:v11 to:v12];

    v14 = (void *)MEMORY[0x263F08730];
    id v15 = get_DKQueryClass();
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v16 = (void *)get_DKApplicationMetadataKeyClass_softClass;
    uint64_t v34 = get_DKApplicationMetadataKeyClass_softClass;
    if (!get_DKApplicationMetadataKeyClass_softClass)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __get_DKApplicationMetadataKeyClass_block_invoke;
      v30[3] = &unk_2644BC768;
      v30[4] = &v31;
      __get_DKApplicationMetadataKeyClass_block_invoke((uint64_t)v30);
      v16 = (void *)v32[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v31, 8);
    v18 = [v17 extensionHostIdentifier];
    v19 = [v15 predicateForObjectsWithMetadataKey:v18];
    v20 = [v14 notPredicateWithSubpredicate:v19];

    v21 = (void *)MEMORY[0x263F08730];
    v35[0] = v9;
    v35[1] = v13;
    v35[2] = v20;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
    v23 = [v21 andPredicateWithSubpredicates:v22];

    id DKPredictionQueryClass = get_DKPredictionQueryClass();
    v25 = [get_DKSystemEventStreamsClass_0() appInFocusStream];
    v26 = [DKPredictionQueryClass topNPredictionQueryForStream:v25 withPredicate:v23 withTopN:a3 withMinLikelihood:a4];

    [v26 setReadMetadata:1];
    [v26 setSlotDuration:v5];
    v27 = objc_alloc_init(REDuetQuery);
    [(REDuetQuery *)v27 setQuery:v26];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __98__REDuetKnowledgeStore_queryForTopNApplications_withLikelihoodGreaterThan_withTemporalResolution___block_invoke;
    v29[3] = &unk_2644BFE60;
    v29[4] = self;
    [(REDuetQuery *)v27 setTransformBlock:v29];
  }
  else
  {
    v27 = 0;
  }
  return v27;
}

RETimeline *__98__REDuetKnowledgeStore_queryForTopNApplications_withLikelihoodGreaterThan_withTemporalResolution___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v4 = (void *)get_DKPredictionTimelineClass_softClass;
  uint64_t v13 = get_DKPredictionTimelineClass_softClass;
  if (!get_DKPredictionTimelineClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __get_DKPredictionTimelineClass_block_invoke;
    v9[3] = &unk_2644BC768;
    v9[4] = &v10;
    __get_DKPredictionTimelineClass_block_invoke((uint64_t)v9);
    id v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  if (objc_opt_isKindOfClass())
  {
    v6 = [*(id *)(a1 + 32) _createTimelineFromPredictionTimeline:v3 filterEmptyData:1];
  }
  else
  {
    v6 = objc_alloc_init(RETimeline);
  }
  v7 = v6;

  return v7;
}

- (id)_createTimelineFromPredictionTimeline:(id)a3 filterEmptyData:(BOOL)a4
{
  BOOL v24 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v4 = [v25 startDate];
  v23 = [MEMORY[0x263EFF980] array];
  v22 = [MEMORY[0x263EFF980] array];
  uint64_t v31 = 0;
  v32 = (id *)&v31;
  uint64_t v33 = 0x3042000000;
  uint64_t v34 = __Block_byref_object_copy__27;
  v35 = __Block_byref_object_dispose__27;
  id v36 = 0;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke;
  v30[3] = &unk_2644BFEB0;
  v30[4] = &v31;
  id v5 = (void (**)(void, void))MEMORY[0x223C31700](v30);
  objc_storeWeak(v32 + 5, v5);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = [v25 transitionDates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v4;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        [v11 timeIntervalSinceDate:v10];
        double v13 = v12;
        v14 = [v10 dateByAddingTimeInterval:v12 * 0.5];
        id v15 = [v25 valueAtDate:v14];
        if (v24)
        {
          uint64_t v16 = ((void (**)(void, void *))v5)[2](v5, v15);

          id v15 = (void *)v16;
        }
        if (v15)
        {
          [v23 addObject:v15];
          id v17 = [NSNumber numberWithDouble:v13];
          [v22 addObject:v17];
        }
        id v4 = v11;

        ++v9;
        uint64_t v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v7);
  }

  v18 = [RETimeline alloc];
  v19 = [v25 startDate];
  v20 = [(RETimeline *)v18 initWithStartDate:v19 values:v23 durations:v22];

  _Block_object_dispose(&v31, 8);
  objc_destroyWeak(&v36);

  return v20;
}

id __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    if (fabs(v4) < 0.00000011920929)
    {
      id v5 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      double v12 = __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke_2;
      double v13 = &unk_2644BFE88;
      uint64_t v7 = *(void *)(a1 + 32);
      id v14 = v6;
      uint64_t v15 = v7;
      id v8 = v6;
      [v3 enumerateKeysAndObjectsUsingBlock:&v10];
      id v5 = (id)objc_msgSend(v8, "copy", v10, v11, v12, v13);

      goto LABEL_7;
    }
  }
  id v5 = v3;
LABEL_7:

  return v5;
}

void __78__REDuetKnowledgeStore__createTimelineFromPredictionTimeline_filterEmptyData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = a3;
  WeakRetained = (void (**)(id, id))objc_loadWeakRetained(v5);
  id v8 = WeakRetained[2](WeakRetained, v6);

  if (v8) {
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)sleepInterval
{
  if (CoreDuetLibraryCore_0())
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v3 = (void *)get_DKPredictorClass_softClass;
    uint64_t v17 = get_DKPredictorClass_softClass;
    if (!get_DKPredictorClass_softClass)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __get_DKPredictorClass_block_invoke;
      v13[3] = &unk_2644BC768;
      v13[4] = &v14;
      __get_DKPredictorClass_block_invoke((uint64_t)v13);
      id v3 = (void *)v15[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v14, 8);
    id v5 = [v4 predictorWithKnowledgeStore:self->_knowledgeStore];
    id v6 = [v5 expectedInBedPeriod];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [v6 startDate];

      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x263F08798]);
        uint64_t v10 = [v7 startDate];
        uint64_t v11 = [v7 endDate];
        id v8 = (void *)[v9 initWithStartDate:v10 endDate:v11];
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)queryForPredictedChargingEventsWithMinimumDuration:(double)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  if (CoreDuetLibraryCore_0())
  {
    id v5 = [get_DKQueryClass() predicateForEventsWithIntegerValue:1];
    id v6 = [get_DKEventQueryClass() predicateForEventsOfMinimumDuration:a3];
    id DKQueryClass = get_DKQueryClass();
    id v8 = [MEMORY[0x263EFF910] distantPast];
    id v9 = [MEMORY[0x263EFF910] date];
    uint64_t v10 = [DKQueryClass predicateForEventsWithStartInDateRangeFrom:v8 to:v9];

    uint64_t v11 = (void *)MEMORY[0x263F08730];
    v20[0] = v5;
    v20[1] = v6;
    v20[2] = v10;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
    double v13 = [v11 andPredicateWithSubpredicates:v12];

    id DKPredictionQueryClass = get_DKPredictionQueryClass();
    uint64_t v15 = [(REDuetKnowledgeStore *)self _duetChargingEventStream];
    uint64_t v16 = [DKPredictionQueryClass predictionQueryForStream:v15 withPredicate:v13 withPredictionType:1];

    uint64_t v17 = objc_alloc_init(REDuetQuery);
    [(REDuetQuery *)v17 setQuery:v16];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __75__REDuetKnowledgeStore_queryForPredictedChargingEventsWithMinimumDuration___block_invoke;
    v19[3] = &unk_2644BFE60;
    v19[4] = self;
    [(REDuetQuery *)v17 setTransformBlock:v19];
  }
  else
  {
    uint64_t v17 = 0;
  }
  return v17;
}

uint64_t __75__REDuetKnowledgeStore_queryForPredictedChargingEventsWithMinimumDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createEventsFromDuetEvents:a2];
}

- (id)queryForHistoricChargingEventsWithMinimumDuration:(double)a3 inThePastDays:(unint64_t)a4
{
  v27[3] = *MEMORY[0x263EF8340];
  if (CoreDuetLibraryCore_0())
  {
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    v23 = [v8 dateByAddingUnit:16 value:-(uint64_t)a4 toDate:v7 options:0];

    v22 = [get_DKQueryClass() predicateForEventsWithIntegerValue:1];
    v21 = [get_DKEventQueryClass() predicateForEventsOfMinimumDuration:a3];
    id v9 = [get_DKQueryClass() predicateForEventsWithStartInDateRangeFrom:v23 to:v7];
    uint64_t v10 = (void *)MEMORY[0x263F08730];
    v27[0] = v22;
    v27[1] = v21;
    v27[2] = v9;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    double v12 = [v10 andPredicateWithSubpredicates:v11];

    double v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
    id DKEventQueryClass = get_DKEventQueryClass();
    uint64_t v15 = [(REDuetKnowledgeStore *)self _duetChargingEventStream];
    long long v26 = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    id v25 = v13;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v18 = [DKEventQueryClass eventQueryWithPredicate:v12 eventStreams:v16 offset:0 limit:1000 sortDescriptors:v17];

    [v18 setDeduplicateValues:1];
    v19 = objc_alloc_init(REDuetQuery);
    [(REDuetQuery *)v19 setQuery:v18];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __88__REDuetKnowledgeStore_queryForHistoricChargingEventsWithMinimumDuration_inThePastDays___block_invoke;
    v24[3] = &unk_2644BFE60;
    v24[4] = self;
    [(REDuetQuery *)v19 setTransformBlock:v24];
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

uint64_t __88__REDuetKnowledgeStore_queryForHistoricChargingEventsWithMinimumDuration_inThePastDays___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createEventsFromDuetEvents:a2];
}

- (id)_duetChargingEventStream
{
  id DKSystemEventStreamsClass_0 = get_DKSystemEventStreamsClass_0();
  return (id)[DKSystemEventStreamsClass_0 deviceIsPluggedInStream];
}

- (id)_createEventsFromDuetEvents:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x263F08798]);
        uint64_t v10 = [v8 startDate];
        uint64_t v11 = [v8 endDate];
        double v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

        [v8 confidence];
        double v14 = v13;
        uint64_t v15 = +[REFeatureValue featureValueWithBool:1];
        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x2050000000;
        uint64_t v16 = (void *)get_DKIdentifierClass_softClass;
        uint64_t v41 = get_DKIdentifierClass_softClass;
        if (!get_DKIdentifierClass_softClass)
        {
          uint64_t v33 = MEMORY[0x263EF8330];
          uint64_t v34 = 3221225472;
          v35 = __get_DKIdentifierClass_block_invoke;
          id v36 = &unk_2644BC768;
          v37 = &v38;
          __get_DKIdentifierClass_block_invoke((uint64_t)&v33);
          uint64_t v16 = (void *)v39[3];
        }
        id v17 = v16;
        _Block_object_dispose(&v38, 8);
        if (objc_opt_isKindOfClass())
        {
          v18 = [v8 stringValue];
          uint64_t v19 = +[REFeatureValue featureValueWithString:v18];

          uint64_t v15 = (void *)v19;
          goto LABEL_19;
        }
        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x2050000000;
        v20 = (void *)get_DKCategoryClass_softClass;
        uint64_t v41 = get_DKCategoryClass_softClass;
        if (!get_DKCategoryClass_softClass)
        {
          uint64_t v33 = MEMORY[0x263EF8330];
          uint64_t v34 = 3221225472;
          v35 = __get_DKCategoryClass_block_invoke;
          id v36 = &unk_2644BC768;
          v37 = &v38;
          __get_DKCategoryClass_block_invoke((uint64_t)&v33);
          v20 = (void *)v39[3];
        }
        id v21 = v20;
        _Block_object_dispose(&v38, 8);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v8 integerValue]);
          goto LABEL_18;
        }
        uint64_t v38 = 0;
        v39 = &v38;
        uint64_t v40 = 0x2050000000;
        v23 = (void *)get_DKQuantityClass_softClass;
        uint64_t v41 = get_DKQuantityClass_softClass;
        if (!get_DKQuantityClass_softClass)
        {
          uint64_t v33 = MEMORY[0x263EF8330];
          uint64_t v34 = 3221225472;
          v35 = __get_DKQuantityClass_block_invoke;
          id v36 = &unk_2644BC768;
          v37 = &v38;
          __get_DKQuantityClass_block_invoke((uint64_t)&v33);
          v23 = (void *)v39[3];
        }
        id v24 = v23;
        _Block_object_dispose(&v38, 8);
        if (objc_opt_isKindOfClass())
        {
          [v8 doubleValue];
          uint64_t v22 = +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
LABEL_18:
          v18 = v15;
          uint64_t v15 = (void *)v22;
LABEL_19:
        }
        id v25 = +[REDuetEvent eventWithInterval:v12 value:v15 confidence:v14];
        [v4 addObject:v25];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v5);
  }

  long long v26 = (void *)[v4 copy];
  return v26;
}

- (id)queryForAllDonatedActions
{
  id v3 = [MEMORY[0x263EFF910] distantPast];
  id v4 = [(REDuetKnowledgeStore *)self queryForDonatedActionsAfterDate:v3];

  return v4;
}

- (id)queryForAllDonatedActionsWithIdentifier:(id)a3
{
  v28[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [get_DKSystemEventStreamsClass_0() appRelevantShortcutsStream];
  uint64_t v5 = [get_DKSystemEventStreamsClass_0() appIntentsStream];
  v28[0] = v5;
  uint64_t v6 = [get_DKSystemEventStreamsClass_0() appActivityStream];
  v28[1] = v6;
  v28[2] = v4;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];

  uint64_t v7 = (void *)MEMORY[0x263F08730];
  id DKEventQueryClass = get_DKEventQueryClass();
  id v9 = [v4 name];
  uint64_t v10 = [DKEventQueryClass predicateForEventsWithStreamName:v9];
  v27[0] = v10;
  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"valueString == %@", v3];
  v27[1] = v11;
  double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  double v13 = [v7 andPredicateWithSubpredicates:v12];

  double v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bundleID == %@", v3];

  uint64_t v15 = (void *)MEMORY[0x263F08730];
  v26[0] = v14;
  v26[1] = v13;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  id v17 = [v15 orPredicateWithSubpredicates:v16];

  v18 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v19 = (void *)[v23 copy];
  v20 = [(REDuetKnowledgeStore *)self _duetQueryForDonatedActionsAfterDate:v18 onStreams:v19 withPredicate:v17];

  id v21 = objc_alloc_init(REDuetQuery);
  [(REDuetQuery *)v21 setQuery:v20];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __64__REDuetKnowledgeStore_queryForAllDonatedActionsWithIdentifier___block_invoke;
  v25[3] = &unk_2644BFE60;
  v25[4] = self;
  [(REDuetQuery *)v21 setTransformBlock:v25];

  return v21;
}

uint64_t __64__REDuetKnowledgeStore_queryForAllDonatedActionsWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createActionsFromDuetEvents:a2];
}

- (id)queryForDonatedActionsAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REDuetKnowledgeStore *)self _duetDonationsStreams];
  uint64_t v6 = [(REDuetKnowledgeStore *)self _queryForDonatedActionsAfterDate:v4 streams:v5];

  return v6;
}

- (id)_queryForDonatedActionsAfterDate:(id)a3 streams:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [get_DKSystemEventStreamsClass_0() appRelevantShortcutsStream];
  id DKEventQueryClass = get_DKEventQueryClass();
  uint64_t v10 = [v8 name];
  uint64_t v11 = [DKEventQueryClass predicateForEventsWithStreamName:v10];

  double v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT source.bundleID IN {'com.apple.MobileSMS', 'com.apple.InCallService', 'com.apple.mobilesafari', 'com.apple.weather', 'com.apple.mobilephone', 'com.apple.news', 'com.apple.Maps'}"];
  double v13 = (void *)MEMORY[0x263F08730];
  v20[0] = v11;
  v20[1] = v12;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v15 = [v13 orPredicateWithSubpredicates:v14];

  uint64_t v16 = [(REDuetKnowledgeStore *)self _duetQueryForDonatedActionsAfterDate:v7 onStreams:v6 withPredicate:v15];

  id v17 = objc_alloc_init(REDuetQuery);
  [(REDuetQuery *)v17 setQuery:v16];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__REDuetKnowledgeStore__queryForDonatedActionsAfterDate_streams___block_invoke;
  v19[3] = &unk_2644BFE60;
  v19[4] = self;
  [(REDuetQuery *)v17 setTransformBlock:v19];

  return v17;
}

uint64_t __65__REDuetKnowledgeStore__queryForDonatedActionsAfterDate_streams___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createActionsFromDuetEvents:a2];
}

- (id)queryForAllRelevantShortcuts
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] distantPast];
  id v4 = [get_DKSystemEventStreamsClass_0() appRelevantShortcutsStream];
  v10[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v6 = [(REDuetKnowledgeStore *)self _duetQueryForDonatedActionsAfterDate:v3 onStreams:v5 withPredicate:0];

  id v7 = objc_alloc_init(REDuetQuery);
  [(REDuetQuery *)v7 setQuery:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__REDuetKnowledgeStore_queryForAllRelevantShortcuts__block_invoke;
  v9[3] = &unk_2644BFE60;
  v9[4] = self;
  [(REDuetQuery *)v7 setTransformBlock:v9];

  return v7;
}

uint64_t __52__REDuetKnowledgeStore_queryForAllRelevantShortcuts__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createActionsFromDuetEvents:a2];
}

- (id)queryForDeletedActionsAfterDate:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [(REDuetKnowledgeStore *)self _duetDonationsStreams];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id DKQueryClass = get_DKQueryClass();
        double v13 = [get_DKTombstoneMetadataKeyClass() eventStreamName];
        double v14 = [v11 name];
        uint64_t v15 = [DKQueryClass predicateForObjectsWithMetadataKey:v13 andStringValue:v14];
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v5];
  id v17 = [get_DKSystemEventStreamsClass_0() tombstoneStream];
  long long v27 = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  uint64_t v19 = [(REDuetKnowledgeStore *)self _duetQueryForDonatedActionsAfterDate:v4 onStreams:v18 withPredicate:v16];

  v20 = objc_alloc_init(REDuetQuery);
  [(REDuetQuery *)v20 setQuery:v19];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__REDuetKnowledgeStore_queryForDeletedActionsAfterDate___block_invoke;
  v22[3] = &unk_2644BFE60;
  v22[4] = self;
  [(REDuetQuery *)v20 setTransformBlock:v22];

  return v20;
}

uint64_t __56__REDuetKnowledgeStore_queryForDeletedActionsAfterDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _createTombstonesFromDuetEvents:a2];
}

- (id)_duetDonationsStreams
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = [get_DKSystemEventStreamsClass_0() appIntentsStream];
  id v3 = objc_msgSend(get_DKSystemEventStreamsClass_0(), "appActivityStream", v2);
  v7[1] = v3;
  id v4 = [get_DKSystemEventStreamsClass_0() appRelevantShortcutsStream];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

- (id)_duetQueryForDonatedActionsAfterDate:(id)a3 onStreams:(id)a4 withPredicate:(id)a5
{
  v43[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (CoreDuetLibraryCore_0())
  {
    if (v7)
    {
      id v31 = v7;
    }
    else
    {
      id v31 = [MEMORY[0x263EFF910] distantPast];
    }
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"((localCreationDate > %@) AND (localCreationDate <= %@))", v31, v11];
    double v13 = (void *)v12;
    if (v9)
    {
      double v14 = (void *)MEMORY[0x263F08730];
      v43[0] = v12;
      v43[1] = v9;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
      uint64_t v16 = [v14 andPredicateWithSubpredicates:v15];

      double v13 = (void *)v16;
    }
    id v17 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localCreationDate" ascending:1];
    id DKEventQueryClass = get_DKEventQueryClass();
    v42 = v17;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
    v20 = [DKEventQueryClass eventQueryWithPredicate:v13 eventStreams:v8 offset:0 limit:10 sortDescriptors:v19];

    [v20 setDeduplicateValues:0];
    if (REProcessIsRelevanced())
    {
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x2050000000;
      id v21 = (void *)get_DKIntentMetadataKeyClass_softClass;
      uint64_t v40 = get_DKIntentMetadataKeyClass_softClass;
      if (!get_DKIntentMetadataKeyClass_softClass)
      {
        uint64_t v32 = MEMORY[0x263EF8330];
        uint64_t v33 = 3221225472;
        uint64_t v34 = __get_DKIntentMetadataKeyClass_block_invoke;
        v35 = &unk_2644BC768;
        id v36 = &v37;
        __get_DKIntentMetadataKeyClass_block_invoke((uint64_t)&v32);
        id v21 = (void *)v38[3];
      }
      id v22 = v21;
      _Block_object_dispose(&v37, 8);
      long long v23 = [v22 serializedKeyImage];
      v41[0] = v23;
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x2050000000;
      long long v24 = (void *)get_DKRelevantShortcutMetadataKeyClass_softClass;
      uint64_t v40 = get_DKRelevantShortcutMetadataKeyClass_softClass;
      if (!get_DKRelevantShortcutMetadataKeyClass_softClass)
      {
        uint64_t v32 = MEMORY[0x263EF8330];
        uint64_t v33 = 3221225472;
        uint64_t v34 = __get_DKRelevantShortcutMetadataKeyClass_block_invoke;
        v35 = &unk_2644BC768;
        id v36 = &v37;
        __get_DKRelevantShortcutMetadataKeyClass_block_invoke((uint64_t)&v32);
        long long v24 = (void *)v38[3];
      }
      id v25 = v24;
      _Block_object_dispose(&v37, 8);
      long long v26 = [v25 serializedKeyImage];
      v41[1] = v26;
      long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
      [v20 setExcludedMetadataKeys:v27];
    }
    id v10 = v20;
    if (v10)
    {
      get_DKEventQueryClass();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v10;
        uint64_t v29 = [get_DKEventQueryClass() allDevices];
        [v28 setDeviceIDs:v29];
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_createActionsFromDuetEvents:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x223C31460](v6);
        uint64_t v12 = [REDonatedAction alloc];
        double v13 = -[REDonatedAction initWithEvent:filtered:](v12, "initWithEvent:filtered:", v10, 1, (void)v15);
        if (v13) {
          [v4 addObject:v13];
        }
        [MEMORY[0x263F0FE40] _resetCache];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)_createTombstonesFromDuetEvents:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x223C31460]();
        uint64_t v11 = [v9 value];
        uint64_t v12 = [v11 stringValue];

        double v13 = [v9 metadata];
        double v14 = [get_DKTombstoneMetadataKeyClass() eventStreamName];
        long long v15 = [v13 objectForKeyedSubscript:v14];

        uint64_t v16 = [v9 localCreationDate];
        long long v17 = (void *)v16;
        if (v12) {
          BOOL v18 = v15 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18 && v16 != 0)
        {
          v27[0] = @"uuid";
          v27[1] = @"streamName";
          v28[0] = v12;
          v28[1] = v15;
          void v27[2] = @"localSaveDate";
          v28[2] = v16;
          uint64_t v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
          [v22 addObject:v20];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v6);
  }

  return v22;
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 completion:(id)a5
{
}

- (void)executeQuerySynchronouslyWithBatching:(id)a3 completion:(id)a4
{
}

- (void)_executeQuery:(id)a3 responseQueue:(id)a4 synchronouslyWithBatching:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  uint64_t v11 = a4;
  id v12 = a6;
  uint64_t v13 = CoreDuetLibraryCore_0();
  if (v12 && v13)
  {
    if (!v11)
    {
      uint64_t v11 = MEMORY[0x263EF83A0];
      id v14 = MEMORY[0x263EF83A0];
    }
    long long v15 = [v10 query];
    if (v15)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2;
      v29[3] = &unk_2644BFED8;
      uint64_t v16 = &v30;
      id v17 = v10;
      id v30 = v17;
      id v31 = v12;
      BOOL v18 = (void (**)(void, void, void))MEMORY[0x223C31700](v29);
      if (a5)
      {
        long long v26 = v11;
        id v27 = v10;
        id v19 = v17;
        uint64_t v20 = 10;
        do
        {
          id v21 = (void *)MEMORY[0x223C31460]();
          knowledgeStore = self->_knowledgeStore;
          id v28 = 0;
          long long v23 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v15 error:&v28];
          id v24 = v28;
          uint64_t v25 = [v23 count];
          ((void (**)(void, void *, id))v18)[2](v18, v23, v24);
          [v19 setOffset:v20];

          if (v24) {
            break;
          }
          v20 += 10;
        }
        while (v25 == 10);

        uint64_t v11 = v26;
        id v10 = v27;
        uint64_t v16 = &v30;
      }
      else
      {
        [(_DKKnowledgeQuerying *)self->_knowledgeStore executeQuery:v15 responseQueue:v11 withCompletion:v18];
      }
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke;
      block[3] = &unk_2644BCBC0;
      uint64_t v16 = &v33;
      id v33 = v12;
      dispatch_async(v11, block);
    }
  }
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C31460]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x223C31460]();
  if (v6)
  {
    uint64_t v8 = RELogForDomain(14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_2((uint64_t)v6, v8);
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) transformBlock];

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) transformBlock];
      uint64_t v9 = ((void (**)(void, id))v11)[2](v11, v5);

      goto LABEL_7;
    }
    uint64_t v8 = RELogForDomain(14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_1(v8);
    }
  }

  uint64_t v9 = 0;
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

- (id)queryForDuetEventWithIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (CoreDuetLibraryCore_0())
  {
    id DKQueryClass = get_DKQueryClass();
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v4];
    uint64_t v7 = [DKQueryClass predicateForObjectWithUUID:v6];

    uint64_t v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
    id DKEventQueryClass = get_DKEventQueryClass();
    id v10 = [(REDuetKnowledgeStore *)self _duetDonationsStreams];
    v18[0] = v8;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v12 = [DKEventQueryClass eventQueryWithPredicate:v7 eventStreams:v10 offset:0 limit:1 sortDescriptors:v11];

    [v12 setReadMetadata:1];
    id v13 = v12;
    if (v13)
    {
      get_DKEventQueryClass();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        long long v15 = [get_DKEventQueryClass() allDevices];
        [v14 setDeviceIDs:v15];
      }
    }

    uint64_t v16 = objc_opt_new();
    [v16 setQuery:v13];
    [v16 setTransformBlock:&__block_literal_global_65];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

id __72__REDuetKnowledgeStore_PrivateQueries__queryForDuetEventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 firstObject];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)queryForUnfilteredUserActivityDonations
{
  id v3 = [get_DKSystemEventStreamsClass_0() appActivityStream];
  id v4 = [(REDuetKnowledgeStore *)self _queryForUnfilteredDonationsForStream:v3];

  return v4;
}

- (id)queryForUnfilteredIntentDonations
{
  id v3 = [get_DKSystemEventStreamsClass_0() appIntentsStream];
  id v4 = [(REDuetKnowledgeStore *)self _queryForUnfilteredDonationsForStream:v3];

  return v4;
}

- (id)queryForUnfilteredRelevantShortcutDonations
{
  id v3 = [get_DKSystemEventStreamsClass_0() appRelevantShortcutsStream];
  id v4 = [(REDuetKnowledgeStore *)self _queryForUnfilteredDonationsForStream:v3];

  return v4;
}

- (id)_queryForUnfilteredDonationsForStream:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 distantPast];
  v14[0] = v5;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  uint64_t v8 = [(REDuetKnowledgeStore *)self _queryForDonatedActionsAfterDate:v6 streams:v7];

  uint64_t v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localCreationDate" ascending:0];
  id v10 = [v8 query];
  id v13 = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];

  [v10 setSortDescriptors:v11];
  [v8 setTransformBlock:&__block_literal_global_106_0];

  return v8;
}

id __78__REDuetKnowledgeStore_PrivateQueries___queryForUnfilteredDonationsForStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x223C31460](v5);
        uint64_t v11 = [REDonatedAction alloc];
        id v12 = -[REDonatedAction initWithEvent:filtered:](v11, "initWithEvent:filtered:", v9, 0, (void)v14);
        if (v12) {
          [v3 addObject:v12];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }

  return v3;
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Empty transform block!", v1, 2u);
}

void __89__REDuetKnowledgeStore__executeQuery_responseQueue_synchronouslyWithBatching_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Error executing query: %@", (uint8_t *)&v2, 0xCu);
}

@end