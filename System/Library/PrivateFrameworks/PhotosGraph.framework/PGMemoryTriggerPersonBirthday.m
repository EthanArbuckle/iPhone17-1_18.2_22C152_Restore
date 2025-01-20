@interface PGMemoryTriggerPersonBirthday
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerPersonBirthday

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v34 = 33;
      __int16 v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerPersonBirthday.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v11 = [v7 localDate];
    v12 = +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:v11 inGraph:v8];

    v13 = [v12 birthdayPersonNodes];
    v14 = (void *)MEMORY[0x1E4F71E88];
    v15 = +[PGGraphFeatureNodeCollection memoryOfFeature];
    v16 = [v14 adjacencyWithSources:v13 relation:v15 targetsClass:objc_opt_class()];

    if ([v16 sourcesCount])
    {
      v17 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:3 inGraph:v8];
      v18 = [v16 intersectingTargetsWith:v17];

      if ([v18 sourcesCount])
      {
        v29 = v17;
        v28 = +[PGGraphNodeCollection nodesInGraph:v8];
        v19 = [v28 featureNodeCollection];
        v20 = [v19 memoryNodes];

        id v21 = objc_alloc_init(MEMORY[0x1E4F71E60]);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __86__PGMemoryTriggerPersonBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
        v30[3] = &unk_1E68EA9E0;
        id v27 = v20;
        id v31 = v27;
        id v22 = v21;
        id v32 = v22;
        [v18 enumerateTargetsBySourceWithBlock:v30];
        if ([v22 count])
        {
          v26 = v12;
          v23 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v7];
          v24 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:v8 elementIdentifiers:v22];
          if ([v9 isCancelledWithProgress:1.0])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v34 = 71;
              __int16 v35 = 2080;
              v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v10 = (void *)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            v10 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v24 withValidityInterval:v23];
          }

          v17 = v29;
          v12 = v26;
        }
        else if ([v9 isCancelledWithProgress:1.0])
        {
          v17 = v29;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v34 = 65;
            __int16 v35 = 2080;
            v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memo"
                  "ries/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v10 = (void *)MEMORY[0x1E4F1CBF0];
          v17 = v29;
        }
      }
      else
      {
        if ([v9 isCancelledWithProgress:1.0]
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v34 = 46;
          __int16 v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      if ([v9 isCancelledWithProgress:1.0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v34 = 39;
        __int16 v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E4F1CBF0];
      v18 = v16;
    }
  }
  return v10;
}

void __86__PGMemoryTriggerPersonBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  v4 = [v10 collectionByIntersecting:*(void *)(a1 + 32)];
  uint64_t v5 = [v4 count];
  v6 = *(void **)(a1 + 40);
  BOOL v7 = v5 == 0;
  id v8 = v10;
  if (!v7) {
    id v8 = v4;
  }
  id v9 = [v8 elementIdentifiers];
  [v6 unionWithIdentifierSet:v9];
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  v4 = [v3 featureNodeCollection];

  return v4;
}

- (unint64_t)triggerType
{
  return 2;
}

@end