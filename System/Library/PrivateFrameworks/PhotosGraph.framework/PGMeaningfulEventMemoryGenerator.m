@interface PGMeaningfulEventMemoryGenerator
+ (id)_invalidMeaningLabelsForMemories;
- (BOOL)skipsCollectionTitle;
- (NSDate)lowerBoundLocalDate;
- (NSString)meaningfulEventUUID;
- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4;
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
- (unint64_t)eventType;
- (unint64_t)meaning;
- (unint64_t)memoryCategory;
- (void)setEventType:(unint64_t)a3;
- (void)setLowerBoundLocalDate:(id)a3;
- (void)setMeaning:(unint64_t)a3;
- (void)setMeaningfulEventUUID:(id)a3;
- (void)setMemoryCategory:(unint64_t)a3;
- (void)setSkipsCollectionTitle:(BOOL)a3;
@end

@implementation PGMeaningfulEventMemoryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningfulEventUUID, 0);
  objc_storeStrong((id *)&self->_lowerBoundLocalDate, 0);
}

- (void)setMemoryCategory:(unint64_t)a3
{
  self->_memoryCategory = a3;
}

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (void)setSkipsCollectionTitle:(BOOL)a3
{
  self->_skipsCollectionTitle = a3;
}

- (BOOL)skipsCollectionTitle
{
  return self->_skipsCollectionTitle;
}

- (void)setMeaningfulEventUUID:(id)a3
{
}

- (NSString)meaningfulEventUUID
{
  return self->_meaningfulEventUUID;
}

- (void)setMeaning:(unint64_t)a3
{
  self->_meaning = a3;
}

- (unint64_t)meaning
{
  return self->_meaning;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setLowerBoundLocalDate:(id)a3
{
}

- (NSDate)lowerBoundLocalDate
{
  return self->_lowerBoundLocalDate;
}

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  v12 = [v10 memoryMomentNodes];
  if ([v12 count] == 1)
  {
    v13 = [v10 memoryFeatureNodes];
    v14 = +[PGGraphNodeCollection subsetInCollection:v13];

    if ([v14 count] == 1)
    {
      v26 = +[PGGraphEdgeCollection edgesFromNodes:v12 toNodes:v14];
      v15 = [v26 anyEdge];
      v16 = [PGMeaningfulEventTitleGenerator alloc];
      v17 = [v12 anyNode];
      v18 = [v15 meaningLabel];
      id v19 = v11;
      uint64_t v20 = [v15 isReliable];
      v21 = [v10 memoryFeatureNodes];
      uint64_t v22 = v20;
      id v11 = v19;
      v23 = [(PGMeaningfulEventTitleGenerator *)v16 initWithCollection:v17 meaningLabel:v18 meaningIsReliable:v22 titleGenerationContext:v19 featureNodes:v21];

      goto LABEL_10;
    }
    v24 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = [v14 count];
      _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[PGMeaningfulEventMemoryGenerator] One meaning node expected, found %d", buf, 8u);
    }
  }
  else
  {
    v14 = [(PGMemoryGenerator *)self loggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = [v12 count];
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGMeaningfulEventMemoryGenerator] One moment node expected, found %d", buf, 8u);
    }
  }
  v23 = 0;
LABEL_10:

  return v23;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 memoryMomentNodes];
  v9 = [v6 memoryFeatureNodes];
  id v10 = +[PGGraphNodeCollection subsetInCollection:v9];
  id v11 = [v10 childMeaningNodes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = [v10 childMeaningNodes];

    id v10 = (void *)v13;
  }
  v14 = [v10 labels];
  v15 = [v14 anyObject];

  int v16 = [v15 isEqualToString:@"HolidayEvent"];
  v27 = self;
  v17 = [(PGMemoryGenerator *)self memoryCurationSession];
  v18 = [v17 curationManager];
  id v19 = [v18 curationCriteriaFactory];
  uint64_t v20 = v19;
  if (v16)
  {
    v21 = [v19 curationCriteriaWithMeaningLabel:v15 featureNodes:v9 inGraph:v7 client:1];
  }
  else
  {
    [v8 anyNode];
    v26 = v9;
    v23 = uint64_t v22 = v8;
    v21 = [v20 curationCriteriaWithCollection:v23 meaningLabel:v15 inGraph:v7 client:1];

    v8 = v22;
    v9 = v26;
  }

  v28.receiver = v27;
  v28.super_class = (Class)PGMeaningfulEventMemoryGenerator;
  v24 = [(PGMemoryGenerator *)&v28 keyAssetCurationOptionsWithTriggeredMemory:v6 inGraph:v7];

  [v24 setCurationCriteria:v21];
  return v24;
}

- (id)generateAllPotentialMemoriesWithGraph:(id)a3 progressBlock:(id)a4
{
  v90[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v7];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 0;
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = +[PGGraphNodeCollection nodesInGraph:v6];
  if ([v9 count])
  {
    v61 = [(id)objc_opt_class() _invalidMeaningLabelsForMemories];
    id v10 = [v61 allObjects];
    id v11 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v10 inGraph:v6];

    uint64_t v12 = [v9 collectionBySubtracting:v11];

    if (![v12 count])
    {
      if (*((unsigned char *)v77 + 24))
      {
        *((unsigned char *)v77 + 24) = 1;
      }
      else
      {
        char v38 = [v8 isCancelledWithProgress:1.0];
        *((unsigned char *)v77 + 24) = v38;
        if ((v38 & 1) == 0)
        {
          id v37 = v62;
LABEL_49:

          v9 = v12;
          goto LABEL_50;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 57;
        LOWORD(v86) = 2080;
        *(void *)((char *)&v86 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemo"
                                        "ryGenerators/PGMeaningfulEventMemoryGenerator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v37 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_49;
    }
    uint64_t v13 = [v12 reliableMeaningEdges];
    v14 = [v13 momentNodes];
    v15 = [v14 momentNodesWithContentScoreAbove:0.5];

    if (![v15 count])
    {
      if (*((unsigned char *)v77 + 24))
      {
        *((unsigned char *)v77 + 24) = 1;
      }
      else
      {
        char v39 = [v8 isCancelledWithProgress:1.0];
        *((unsigned char *)v77 + 24) = v39;
        if ((v39 & 1) == 0)
        {
          id v37 = v62;
          goto LABEL_48;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 64;
        LOWORD(v86) = 2080;
        *(void *)((char *)&v86 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemo"
                                        "ryGenerators/PGMeaningfulEventMemoryGenerator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v37 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_48;
    }
    int v16 = [v15 momentNodesWithMinimumNumberOfExtendedCuratedAssets:13];

    if ([v16 count])
    {
      v17 = [(PGMemoryGenerator *)self momentNodesWithBlockedFeatureCache];
      v60 = [v17 momentNodesWithBlockedFeature];

      v15 = [v16 collectionBySubtracting:v60];

      if (![v15 count])
      {
        if (*((unsigned char *)v77 + 24))
        {
          *((unsigned char *)v77 + 24) = 1;
        }
        else
        {
          char v42 = [v8 isCancelledWithProgress:1.0];
          *((unsigned char *)v77 + 24) = v42;
          if ((v42 & 1) == 0)
          {
            id v37 = v62;
            goto LABEL_47;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 76;
          LOWORD(v86) = 2080;
          *(void *)((char *)&v86 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/Meaning"
                                          "MemoryGenerators/PGMeaningfulEventMemoryGenerator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v37 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_47;
      }
      v18 = [(PGMemoryGenerator *)self memoryGenerationContext];
      v58 = [v18 momentNodesAtSensitiveLocationsInGraph:v6];

      v59 = [v15 collectionBySubtracting:v58];

      v53 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaning:12 inGraph:v6];
      v51 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaning:13 inGraph:v6];
      v90[0] = @"Concert";
      v90[1] = @"Performance";
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
      v50 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v19 inGraph:v6];

      uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
      v21 = [MEMORY[0x1E4F76D68] musicConcerts];
      v89[0] = v21;
      uint64_t v22 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
      v89[1] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
      v57 = [v20 setWithArray:v23];

      uint64_t v24 = +[PGGraphPublicEventNodeCollection publicEventNodesWithCategories:v57 inGraph:v6];
      v88[0] = @"Lunch";
      v88[1] = @"Dinner";
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
      v26 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v25 inGraph:v6];
      v48 = +[PGGraphBusinessNodeCollection restaurantBusinessNodesInGraph:v6];
      v47 = (void *)v24;
      v44 = (void *)v25;
      *(void *)buf = 0;
      *(void *)&long long v86 = buf;
      *((void *)&v86 + 1) = 0x2020000000;
      uint64_t v87 = 0;
      unint64_t v45 = [v59 count];
      v27 = (void *)MEMORY[0x1E4F71F18];
      objc_super v28 = +[PGGraphMomentNode dateOfMoment];
      v84[0] = v28;
      uint64_t v29 = +[PGGraphDateNode monthDayOfDate];
      v84[1] = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
      v56 = [v27 chain:v30];

      v55 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v59 relation:v56 targetsClass:objc_opt_class()];
      double v31 = 1.0 / (double)v45;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke;
      v63[3] = &unk_1E68EEBE0;
      id v64 = v12;
      v73 = &v76;
      id v32 = v8;
      id v65 = v32;
      v74 = buf;
      id v46 = v26;
      id v66 = v46;
      id v33 = v48;
      id v67 = v33;
      id v49 = v53;
      id v68 = v49;
      id v52 = v51;
      id v69 = v52;
      id v54 = v50;
      id v70 = v54;
      id v34 = v47;
      id v71 = v34;
      id v35 = v62;
      id v72 = v35;
      double v75 = v31;
      [v55 enumerateTargetsBySourceWithBlock:v63];
      if (*((unsigned char *)v77 + 24))
      {
        *((unsigned char *)v77 + 24) = 1;
      }
      else
      {
        char v40 = [v32 isCancelledWithProgress:1.0];
        *((unsigned char *)v77 + 24) = v40;
        if ((v40 & 1) == 0)
        {
          id v37 = v35;
LABEL_36:

          _Block_object_dispose(buf, 8);
          v15 = v59;
LABEL_47:

          goto LABEL_48;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v80 = 67109378;
        int v81 = 142;
        __int16 v82 = 2080;
        v83 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenerators/PGMeaningfulEventMemoryGenerator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v80, 0x12u);
      }
      id v37 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_36;
    }
    if (*((unsigned char *)v77 + 24))
    {
      *((unsigned char *)v77 + 24) = 1;
    }
    else
    {
      char v41 = [v8 isCancelledWithProgress:1.0];
      *((unsigned char *)v77 + 24) = v41;
      if ((v41 & 1) == 0)
      {
        id v37 = v62;
LABEL_41:
        v15 = v16;
LABEL_48:

        goto LABEL_49;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 70;
      LOWORD(v86) = 2080;
      *(void *)((char *)&v86 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGe"
                                      "nerators/PGMeaningfulEventMemoryGenerator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v37 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_41;
  }
  if (*((unsigned char *)v77 + 24))
  {
    *((unsigned char *)v77 + 24) = 1;
  }
  else
  {
    char v36 = [v8 isCancelledWithProgress:1.0];
    *((unsigned char *)v77 + 24) = v36;
    if ((v36 & 1) == 0)
    {
      id v37 = v62;
      goto LABEL_50;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 49;
    LOWORD(v86) = 2080;
    *(void *)((char *)&v86 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/Memory Generators/CurrentMemoryGenerators/MeaningMemoryGenera"
                                    "tors/PGMeaningfulEventMemoryGenerator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v37 = (id)MEMORY[0x1E4F1CBF0];
LABEL_50:

  _Block_object_dispose(&v76, 8);
  return v37;
}

void __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = [v7 reliableMeaningNodes];
  id v10 = [v9 collectionByIntersecting:*(void *)(a1 + 32)];

  id v11 = [v10 distinctMeaningNodesSubset];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2;
  v16[3] = &unk_1E68EEBB8;
  uint64_t v27 = *(void *)(a1 + 104);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 112);
  id v17 = v12;
  uint64_t v28 = v13;
  id v18 = *(id *)(a1 + 48);
  id v14 = v7;
  id v19 = v14;
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  id v22 = *(id *)(a1 + 72);
  id v23 = *(id *)(a1 + 80);
  id v24 = *(id *)(a1 + 88);
  id v15 = v8;
  id v25 = v15;
  id v26 = *(id *)(a1 + 96);
  [v11 enumerateIdentifiersAsCollectionsWithBlock:v16];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
    *a4 = 1;
  }
  else {
    *(double *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = *(double *)(a1 + 120)
  }
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 112) + 8)
                                                                             + 24);
}

void __88__PGMeaningfulEventMemoryGenerator_generateAllPotentialMemoriesWithGraph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 112) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    id v23 = v6;
    char v8 = [*(id *)(a1 + 32) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)];
    id v6 = v23;
    uint64_t v7 = *(void *)(*(void *)(a1 + 112) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    *a4 = 1;
    goto LABEL_15;
  }
  id v24 = v6;
  int v9 = [v6 intersectsCollection:*(void *)(a1 + 40)];
  id v6 = v24;
  if (!v9
    || ([*(id *)(a1 + 48) businessNodes],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 intersectsCollection:*(void *)(a1 + 56)],
        v10,
        id v6 = v24,
        v11))
  {
    id v12 = [v6 featureNodeCollection];
    uint64_t v13 = [*(id *)(a1 + 48) featureNodeCollection];
    id v14 = [v12 collectionByFormingUnionWith:v13];

    if ([v24 isEqual:*(void *)(a1 + 64)])
    {
      uint64_t v15 = [*(id *)(a1 + 48) birthdayPersonNodes];
    }
    else
    {
      if (![v24 isEqual:*(void *)(a1 + 72)])
      {
        if (![*(id *)(a1 + 80) containsCollection:v24]) {
          goto LABEL_14;
        }
        id v21 = [*(id *)(a1 + 48) publicEventNodes];
        int v16 = [v21 collectionByIntersecting:*(void *)(a1 + 88)];

        uint64_t v22 = [v16 performerNodes];
        uint64_t v17 = [v14 collectionByFormingUnionWith:v22];

        id v14 = (void *)v22;
LABEL_13:

        id v14 = (void *)v17;
LABEL_14:
        id v18 = [*(id *)(a1 + 96) featureNodeCollection];
        id v19 = [v14 collectionByFormingUnionWith:v18];

        id v20 = [[PGGraphMemory alloc] initWithMemoryCategory:16 memoryCategorySubcategory:11001 momentNodes:*(void *)(a1 + 48) featureNodes:v19];
        [*(id *)(a1 + 104) addObject:v20];

        id v6 = v24;
        goto LABEL_15;
      }
      uint64_t v15 = [*(id *)(a1 + 48) celebratedHolidayNodes];
    }
    int v16 = (void *)v15;
    uint64_t v17 = [v14 collectionByFormingUnionWith:v15];
    goto LABEL_13;
  }
LABEL_15:
}

+ (id)_invalidMeaningLabelsForMemories
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObject:@"Gathering"];
  [v2 addObject:@"Restaurant"];
  [v2 addObject:@"Breakfast"];
  return v2;
}

@end