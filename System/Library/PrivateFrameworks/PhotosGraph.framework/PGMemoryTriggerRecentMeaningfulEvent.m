@interface PGMemoryTriggerRecentMeaningfulEvent
- (id)meaningNodesSupportedForTriggerInGraph:(id)a3;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentMeaningfulEvent

- (id)meaningNodesSupportedForTriggerInGraph:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PGGraphNodeCollection nodesInGraph:v3];
  v9[0] = @"HolidayEvent";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v5 inGraph:v3];

  v7 = [v4 collectionBySubtracting:v6];

  return v7;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v36 = 31;
      __int16 v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentMeaningfulEvent.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v12 = [v8 localDate];
    v13 = [v8 timeZone];
    v14 = +[PGMemoryTrigger dateNodesInGraph:v9 startDayOffset:-8 endDayOffset:-1 fromLocalDate:v12 inTimeZone:v13];

    v28 = v14;
    v15 = [v14 momentNodes];
    v26 = [(PGMemoryTriggerRecentMeaningfulEvent *)self meaningNodesSupportedForTriggerInGraph:v9];
    [v26 momentNodes];
    v25 = v27 = v15;
    v16 = objc_msgSend(v15, "collectionByIntersecting:");
    v17 = [v16 memoryNodes];
    v18 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:16 inGraph:v9];
    v19 = [v17 collectionByIntersecting:v18];
    v20 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:17 inGraph:v9];
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v29[3] = &unk_1E68EDFA8;
    id v30 = v20;
    id v31 = v9;
    v32 = self;
    id v33 = v8;
    id v22 = v21;
    id v34 = v22;
    id v23 = v20;
    [v19 enumerateIdentifiersAsCollectionsWithBlock:v29];
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v36 = 90;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentMeaningfulEvent.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v22;
    }
  }
  return v11;
}

void __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 featureNodes];
  v6 = +[PGGraphNodeCollection subsetInCollection:v5];

  v7 = [v6 featureNodeCollection];
  id v8 = [v7 memoryNodes];
  id v9 = [v8 collectionByIntersecting:*(void *)(a1 + 32)];

  if ([v9 count])
  {
    id v10 = [v6 meaningLabels];
    id v11 = [v10 anyObject];
    v12 = +[PGMeaningAggregationMemoryGenerator featureRelationWithMeaningLabel:v11];

    if (v12)
    {
      v13 = [v4 momentNodes];
      v14 = +[MANodeCollection nodesRelatedToNodes:v13 withRelation:v12];
    }
    else
    {
      v14 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:*(void *)(a1 + 40)];
    }
    v15 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:*(void *)(a1 + 40)];
    if ([(MAElementCollection *)v14 count])
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
      v30[3] = &unk_1E68EDF60;
      id v31 = v14;
      uint64_t v16 = [v9 filteredCollectionUsingBlock:v30];

      v15 = (PGGraphMemoryNodeCollection *)v16;
    }
    if ([(MAElementCollection *)v15 count])
    {
      v17 = v15;
    }
    else
    {
      v17 = [v9 filteredCollectionUsingBlock:&__block_literal_global_61615];
    }
    v18 = v17;

    id v9 = v18;
  }
  v19 = [v4 momentNodes];
  v20 = [v19 dateNodes];
  id v21 = [v20 localDateInterval];
  id v22 = [v21 endDate];

  id v23 = [v22 dateByAddingTimeInterval:691200.0];
  v24 = objc_opt_class();
  v25 = [*(id *)(a1 + 56) timeZone];
  v26 = [v24 validityIntervalForLocalStartDate:v22 localEndDate:v23 timeZone:v25];

  v27 = [v4 collectionByFormingUnionWith:v9];
  v28 = *(void **)(a1 + 64);
  v29 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v27 withValidityInterval:v26];
  [v28 addObjectsFromArray:v29];
}

uint64_t __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 featureNodes];
  if ([v3 count] == 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) intersectsCollection:v3];
  }

  return v4;
}

BOOL __93__PGMemoryTriggerRecentMeaningfulEvent_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 featureNodes];
  BOOL v3 = [v2 count] == 2;

  return v3;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  BOOL v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  uint64_t v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 19;
}

@end