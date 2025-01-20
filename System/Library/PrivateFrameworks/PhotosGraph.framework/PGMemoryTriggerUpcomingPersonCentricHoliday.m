@interface PGMemoryTriggerUpcomingPersonCentricHoliday
- (id)allSingleMomentMemoryNodesInGraph:(id)a3;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (id)singleMomentMemoryNodesWithRelevantPersonNodes:(id)a3 inGraph:(id)a4;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerUpcomingPersonCentricHoliday

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleMomentMemoryNodesWithFather, 0);
  objc_storeStrong((id *)&self->_singleMomentMemoryNodesWithMother, 0);
  objc_storeStrong((id *)&self->_singleMomentMemoryNodesWithPartner, 0);
  objc_storeStrong((id *)&self->_allSingleMomentMemoryNodes, 0);
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v49 = 62;
      __int16 v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerUpcomingPersonCentricHoliday.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v39 = v10;
    v12 = [v9 infoNode];
    v13 = [v12 locale];

    if (!v13)
    {
      v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    v14 = +[PGGraphNodeCollection nodesInGraph:v9];
    v15 = [v14 partnerPersonNodes];
    v16 = [v14 motherPersonNodes];
    v17 = [v14 fatherPersonNodes];
    v40 = v15;
    if ([v15 count] || objc_msgSend(v16, "count") || objc_msgSend(v17, "count"))
    {
      v35 = v14;
      uint64_t v18 = [v8 localDate];
      id v38 = v8;
      v19 = [v8 timeZone];
      v34 = (void *)v18;
      uint64_t v20 = [MEMORY[0x1E4F76C68] universalDateFromLocalDate:v18 inTimeZone:v19];
      v33 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v20];
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F76C68], "localDateFromUniversalDate:inTimeZone:");
      v32 = (void *)v20;
      v31 = [MEMORY[0x1E4F76C68] dateByAddingDays:7 toDate:v20];
      v22 = objc_msgSend(MEMORY[0x1E4F76C68], "localDateFromUniversalDate:inTimeZone:");
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v24 = [(PGHolidayMemoryTrigger *)self holidayService];
      v37 = v13;
      v25 = [v13 countryCode];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __100__PGMemoryTriggerUpcomingPersonCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v41[3] = &unk_1E68E9E58;
      v41[4] = self;
      id v42 = v19;
      id v43 = v40;
      id v44 = v9;
      id v26 = v23;
      v27 = (void *)v21;
      id v28 = v26;
      id v45 = v26;
      v36 = v16;
      id v46 = v16;
      id v47 = v17;
      id v29 = v19;
      [v24 enumerateEventRulesBetweenLocalDate:v27 andLocalDate:v22 supportedCountryCode:v25 usingBlock:v41];

      id v10 = v39;
      if ([v39 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v49 = 116;
          __int16 v50 = 2080;
          v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerUpcomingPersonCentricHoliday.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v11 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v11 = v28;
      }
      v13 = v37;

      id v8 = v38;
      v16 = v36;
      v14 = v35;
    }
    else
    {
      id v11 = (id)MEMORY[0x1E4F1CBF0];
      id v10 = v39;
    }
  }
  return v11;
}

void __100__PGMemoryTriggerUpcomingPersonCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 requiredTraits];
  uint64_t v7 = [v6 peopleTrait];

  if ((unint64_t)(v7 - 1) <= 0x3F && ((1 << (v7 - 1)) & 0x8000000080000001) != 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (!v9) {
      goto LABEL_23;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "dateByAddingTimeInterval:", -86400.0, v25);
        v15 = [v13 dateByAddingTimeInterval:-604800.0];
        v16 = [(id)objc_opt_class() validityIntervalForLocalStartDate:v15 localEndDate:v14 timeZone:a1[5]];
        switch(v7)
        {
          case 64:
            v17 = (void *)a1[4];
            uint64_t v18 = 48;
            if (!v17[6])
            {
              uint64_t v19 = a1[10];
              goto LABEL_19;
            }
            break;
          case 32:
            v17 = (void *)a1[4];
            uint64_t v18 = 40;
            if (!v17[5])
            {
              uint64_t v19 = a1[9];
              goto LABEL_19;
            }
            break;
          case 1:
            v17 = (void *)a1[4];
            uint64_t v18 = 32;
            if (!v17[4])
            {
              uint64_t v19 = a1[6];
LABEL_19:
              uint64_t v20 = [v17 singleMomentMemoryNodesWithRelevantPersonNodes:v19 inGraph:a1[7]];
              uint64_t v21 = a1[4];
              v22 = *(void **)(v21 + v18);
              *(void *)(v21 + v18) = v20;
            }
            break;
          default:
            goto LABEL_21;
        }
        id v23 = (void *)a1[8];
        v24 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:*(void *)(a1[4] + v18) withValidityInterval:v16];
        [v23 addObjectsFromArray:v24];

LABEL_21:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v10)
      {
LABEL_23:

        id v5 = v25;
        break;
      }
    }
  }
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 23;
}

- (id)singleMomentMemoryNodesWithRelevantPersonNodes:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PGMemoryTriggerUpcomingPersonCentricHoliday *)self allSingleMomentMemoryNodesInGraph:a4];
  id v8 = [v6 featureNodeCollection];

  uint64_t v9 = [v8 momentNodes];
  uint64_t v10 = [v9 memoryNodes];

  uint64_t v11 = [v7 collectionByIntersecting:v10];

  return v11;
}

- (id)allSingleMomentMemoryNodesInGraph:(id)a3
{
  allSingleMomentMemoryNodes = self->_allSingleMomentMemoryNodes;
  if (!allSingleMomentMemoryNodes)
  {
    id v5 = +[PGGraphMemoryNodeCollection memoryNodesOfCategory:1 inGraph:a3];
    id v6 = self->_allSingleMomentMemoryNodes;
    self->_allSingleMomentMemoryNodes = v5;

    allSingleMomentMemoryNodes = self->_allSingleMomentMemoryNodes;
  }
  return allSingleMomentMemoryNodes;
}

@end