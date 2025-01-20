@interface PGMemoryTriggerFeatureCentricHoliday
+ (id)_relationshipForHolidayName:(id)a3;
- (id)personNodesForRelationship:(id)a3 inGraph:(id)a4;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerFeatureCentricHoliday

+ (id)_relationshipForHolidayName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Mother’s Day"])
  {
    v4 = kPGGraphEdgePeopleMother;
LABEL_7:
    v5 = *v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"Father’s Day"])
  {
    v4 = kPGGraphEdgePeopleFather;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Valentine’s Day"])
  {
    v4 = kPGGraphEdgePeoplePartner;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)personNodesForRelationship:(id)a3 inGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithGraph:v6];
  if ([v5 isEqualToString:@"MOTHER"])
  {
    v8 = [v6 meNodeCollection];
    uint64_t v9 = [v8 motherPersonNodes];
  }
  else if ([v5 isEqualToString:@"FATHER"])
  {
    v8 = [v6 meNodeCollection];
    uint64_t v9 = [v8 fatherPersonNodes];
  }
  else
  {
    if (![v5 isEqualToString:@"PARTNER"]) {
      goto LABEL_8;
    }
    v8 = [v6 meNodeCollection];
    uint64_t v9 = [v8 partnerPersonNodes];
  }
  v10 = (PGGraphPersonNodeCollection *)v9;

  v7 = v10;
LABEL_8:

  return v7;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isCancelledWithProgress:0.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v30 = 36;
      __int16 v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerFeatureCentricHoliday.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v12 = [v9 infoNode];
    v13 = [v12 locale];

    if (!v13)
    {
      v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v15 = [(PGHolidayMemoryTrigger *)self holidayService];
    v16 = [v8 localDate];
    v17 = [v8 localDate];
    v18 = [v13 countryCode];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__PGMemoryTriggerFeatureCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v25[3] = &unk_1E68E8868;
    id v24 = v9;
    id v19 = v9;
    id v26 = v19;
    id v20 = v14;
    id v27 = v20;
    v28 = self;
    [v15 enumerateEventRulesBetweenLocalDate:v16 andLocalDate:v17 supportedCountryCode:v18 usingBlock:v25];

    v21 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:v19 elementIdentifiers:v20];
    v22 = [(id)objc_opt_class() singleDayValidityIntervalWithContext:v8];
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v30 = 67;
        __int16 v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerFeatureCentricHoliday.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v11 = [(id)objc_opt_class() memoryTriggerResultsForMemoryNodes:v21 withValidityInterval:v22];
    }
    id v9 = v24;
  }
  return v11;
}

void __93__PGMemoryTriggerFeatureCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = [v21 name];
  int v4 = [v3 isEqualToString:@"National Dog Day"];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 2;
LABEL_5:
    id v9 = +[PGGraphPetNodeCollection petNodesForSpecies:v6 inGraph:v5];
LABEL_6:
    id v10 = v9;
    v11 = *(void **)(a1 + 40);
    v12 = [v9 featureNodeCollection];
    v13 = [v12 memoryNodes];
    id v14 = [v13 elementIdentifiers];
    [v11 unionWithIdentifierSet:v14];
LABEL_7:

    goto LABEL_8;
  }
  v7 = [v21 name];
  int v8 = [v7 isEqualToString:@"National Cat Day"];

  if (v8)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 1;
    goto LABEL_5;
  }
  v15 = [v21 name];
  int v16 = [v15 isEqualToString:@"Earth Day"];

  if (v16)
  {
    id v9 = +[PGGraphROINodeCollection roiNodesOfType:4 inGraph:*(void *)(a1 + 32)];
    goto LABEL_6;
  }
  v17 = objc_opt_class();
  v18 = [v21 name];
  id v10 = [v17 _relationshipForHolidayName:v18];

  if (v10)
  {
    v12 = [*(id *)(a1 + 48) personNodesForRelationship:v10 inGraph:*(void *)(a1 + 32)];
    id v19 = *(void **)(a1 + 40);
    v13 = [v12 featureNodeCollection];
    id v14 = [v13 memoryNodes];
    id v20 = [v14 elementIdentifiers];
    [v19 unionWithIdentifierSet:v20];

    goto LABEL_7;
  }
LABEL_8:
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (unint64_t)triggerType
{
  return 3;
}

@end