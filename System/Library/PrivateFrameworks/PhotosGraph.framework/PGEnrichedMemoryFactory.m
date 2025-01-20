@interface PGEnrichedMemoryFactory
+ (double)notificationScoreForNotificationLevel:(int64_t)a3 electionScore:(double)a4;
+ (int64_t)notificationLevelForTriggeredMemory:(id)a3 withLocalDate:(id)a4 graph:(id)a5;
+ (void)requestFlexMusicCurationForEnrichedMemories:(id)a3 context:(id)a4 photoLibrary:(id)a5 graph:(id)a6 progressReporter:(id)a7 resultHandler:(id)a8;
+ (void)requestMusicCurationForEnrichedMemories:(id)a3 context:(id)a4 graph:(id)a5 progressReporter:(id)a6 resultHandler:(id)a7;
- (PGEnrichedMemoryFactory)initWithMemoryCurationSession:(id)a3 graph:(id)a4 serviceManager:(id)a5;
- (id)_curatedAssetsWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)_extendedCuratedAssetsWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)_keyAssetWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)_memoryEnricherFromTriggeredMemory:(id)a3;
- (id)curatedAssetUUIDsWithTriggeredMemory:(id)a3 keyAsset:(id)a4 extendedCuratedAssetUUIDs:(id)a5 targetCurationDuration:(double)a6 allowGuestAsset:(BOOL)a7 progressReporter:(id)a8;
- (id)debugEnrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5;
- (id)enrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5;
- (id)enrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5 debug:(BOOL)a6;
- (unint64_t)_numberOfGuestAssetInAssets:(id)a3;
@end

@implementation PGEnrichedMemoryFactory

+ (double)notificationScoreForNotificationLevel:(int64_t)a3 electionScore:(double)a4
{
  if ((unint64_t)(a3 - 2) > 2) {
    v4 = (double *)MEMORY[0x1E4F397A8];
  }
  else {
    v4 = (double *)qword_1E68EAD48[a3 - 2];
  }
  double v5 = fmax(a4, 0.0);
  if (v5 > 1.0) {
    double v5 = 1.0;
  }
  return v5 * *MEMORY[0x1E4F397C0] + *v4;
}

+ (int64_t)notificationLevelForTriggeredMemory:(id)a3 withLocalDate:(id)a4 graph:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 1;
  v10 = [v7 memoryFeatureNodes];
  v11 = [v7 memoryMomentNodes];
  v12 = +[PGGraphNodeCollection subsetInCollection:v10];
  v13 = [v12 labels];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v15 = +[PGGraph stellarMeanings];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke;
  v37[3] = &unk_1E68F0470;
  id v16 = v14;
  id v38 = v16;
  [v15 enumerateIndexesUsingBlock:v37];

  v17 = [v7 triggerTypes];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke_2;
  v31[3] = &unk_1E68EAD28;
  v36 = &v39;
  id v18 = v7;
  id v32 = v18;
  id v19 = v13;
  id v33 = v19;
  id v20 = v16;
  id v34 = v20;
  id v21 = v11;
  id v35 = v21;
  [v17 enumerateIndexesUsingBlock:v31];

  if (v40[3] != 4)
  {
    switch([v18 memoryCategory])
    {
      case 0:
      case 7:
      case 12:
      case 13:
      case 14:
      case 15:
      case 20:
      case 24:
        v22 = v40;
        uint64_t v23 = v40[3];
        if (v23 <= 1) {
          uint64_t v23 = 1;
        }
        goto LABEL_6;
      case 2:
      case 3:
      case 4:
        goto LABEL_7;
      case 5:
      case 6:
        v27 = [v18 memoryFeatureNodes];
        v28 = +[PGGraphNodeCollection subsetInCollection:v27];
        v24 = [v28 anyNode];

        if ((unint64_t)[v24 rankInGraph:v9] > 1) {
          goto LABEL_9;
        }
        goto LABEL_8;
      case 9:
      case 27:
        v22 = v40;
        uint64_t v23 = v40[3];
        if (v23 <= 2) {
          uint64_t v23 = 2;
        }
        goto LABEL_6;
      case 10:
      case 11:
      case 17:
      case 18:
      case 19:
      case 25:
      case 26:
      case 28:
      case 29:
      case 30:
        goto LABEL_3;
      case 16:
        if ([v19 containsObject:@"Birthday"])
        {
LABEL_7:
          v24 = +[PGGraphNodeCollection subsetInCollection:v10];
          if (+[PGPeopleInferencesConveniences anyPersonNodes:v24 belongToBestSocialGroupsInGraph:v9])
          {
LABEL_8:
            v40[3] = 3;
          }
LABEL_9:
        }
        else
        {
          v29 = +[PGGraphNodeCollection subsetInCollection:v10];
          uint64_t v30 = [v29 count];

          if (v30)
          {
LABEL_3:
            v22 = v40;
            uint64_t v23 = 3;
LABEL_6:
            v22[3] = v23;
          }
        }
        break;
      default:
        break;
    }
  }
  int64_t v25 = v40[3];

  _Block_object_dispose(&v39, 8);
  return v25;
}

void __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  PGMeaningLabelForMeaning(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __97__PGEnrichedMemoryFactory_Notification__notificationLevelForTriggeredMemory_withLocalDate_graph___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  switch(a2)
  {
    case 0:
    case 7:
    case 16:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6 <= 1) {
        uint64_t v6 = 1;
      }
      goto LABEL_13;
    case 1:
    case 3:
    case 12:
    case 17:
      goto LABEL_7;
    case 2:
    case 15:
      goto LABEL_9;
    case 4:
      if ([*(id *)(a1 + 40) containsObject:@"Anniversary"]) {
        goto LABEL_9;
      }
      if ([*(id *)(a1 + 40) intersectsSet:*(void *)(a1 + 48)])
      {
LABEL_7:
        uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v6 = 3;
      }
      else
      {
        id v7 = [*(id *)(a1 + 56) personNodes];
        uint64_t v8 = [v7 count];

        if (!v8) {
          goto LABEL_14;
        }
LABEL_11:
        uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v6 = *(void *)(v5 + 24);
        if (v6 <= 2) {
          uint64_t v6 = 2;
        }
      }
LABEL_13:
      *(void *)(v5 + 24) = v6;
LABEL_14:
      *a3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 4;
      return;
    case 5:
      if ([*(id *)(a1 + 32) memoryCategory] != 8) {
        goto LABEL_14;
      }
LABEL_9:
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v6 = 4;
      goto LABEL_13;
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 14:
    case 18:
    case 19:
    case 27:
      goto LABEL_11;
    default:
      goto LABEL_14;
  }
}

+ (void)requestMusicCurationForEnrichedMemories:(id)a3 context:(id)a4 graph:(id)a5 progressReporter:(id)a6 resultHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(void))a7;
  id v16 = v13;
  v44 = v15;
  v37 = [MEMORY[0x1E4F1C9C8] date];
  v40 = v11;
  unint64_t v39 = [v11 count];
  if (v39)
  {
    unint64_t v17 = 0;
    double v18 = (double)v39;
    id v38 = v14;
    id v19 = (char *)&unk_1EBD3A000;
    id v36 = v13;
    while (1)
    {
      id v20 = (void *)MEMORY[0x1D25FED50]();
      if ([v14 isCancelled]) {
        break;
      }
      double v21 = ((double)v17 + 0.5) / v18;
      v22 = [v40 objectAtIndexedSubscript:v17];
      uint64_t v23 = [v14 childProgressReporterFromStart:(double)v17 / v18 toEnd:v21];
      v24 = [(id)objc_opt_class() appleMusicFeatureExtractionContextWithCuratorContext:v12];
      id v46 = 0;
      int64_t v25 = [v19 + 280 extractMusicCurationFeaturesForEnrichedMemory:v22 graph:v16 context:v24 progressReporter:v23 error:&v46];
      id v26 = v46;
      if (v25)
      {
        uint64_t v41 = v26;
        uint64_t v42 = v23;
        context = v20;
        uint64_t v27 = [v14 childProgressReporterFromStart:v21 toEnd:(double)++v17 / v18];
        v28 = v19;
        v29 = (void *)v27;
        id v45 = 0;
        uint64_t v30 = [v28 + 280 curateMusicForFeatures:v25 context:v12 progressReporter:v27 error:&v45];
        id v31 = v45;
        if (v30)
        {
          id v32 = [v12 recentlyUsedSongs];
          [v32 addMusicCuration:v30 date:v37];

          id v16 = v36;
        }
        v44[2]();

        id v14 = v38;
        id v19 = (unsigned char *)&unk_1EBD3A000;
      }
      else
      {
        id v33 = v26;
        ((void (*)(void (**)(void), void *, void, id))v44[2])(v44, v22, 0, v26);

        ++v17;
      }
      if (v17 == v39) {
        goto LABEL_14;
      }
    }
    id v34 = +[PGLogging sharedLogging];
    id v35 = [v34 loggingConnection];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v35, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] (MemoriesMusic) Cancelling Apple Music curation for enriched memories.", buf, 2u);
    }

    id v16 = v36;
  }
LABEL_14:
}

+ (void)requestFlexMusicCurationForEnrichedMemories:(id)a3 context:(id)a4 photoLibrary:(id)a5 graph:(id)a6 progressReporter:(id)a7 resultHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v50 = a6;
  id v16 = a7;
  v54 = (void (**)(void))a8;
  v52 = v13;
  unint64_t v17 = [v13 count];
  id v45 = v16;
  v53 = [v16 progressReportersForParallelOperationsWithCount:v17];
  id v46 = v15;
  double v18 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:v15];
  v47 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v51 = v17;
  if (!v17) {
    goto LABEL_21;
  }
  unint64_t v19 = 0;
  double v20 = (double)v17;
  v48 = v18;
  id v49 = v14;
  while (1)
  {
    double v21 = (void *)MEMORY[0x1D25FED50]();
    v22 = [v53 objectAtIndexedSubscript:v19];
    if ([v22 isCancelled]) {
      break;
    }
    uint64_t v23 = [v52 objectAtIndexedSubscript:v19];
    double v24 = (double)v19 / v20;
    double v25 = (double)v19++ + 0.5;
    double v26 = v25 / v20;
    uint64_t v27 = [v22 childProgressReporterFromStart:v24 toEnd:v25 / v20];
    v28 = v27;
    if (!v14)
    {
      if ([v27 isCancelledWithProgress:1.0])
      {
        v43 = +[PGLogging sharedLogging];
        v44 = [v43 loggingConnection];

        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1805000, v44, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] (MemoriesMusic) Cancelling Flex Music curation for enriched memories.", buf, 2u);
        }

        goto LABEL_20;
      }
      v55 = v28;
      v57 = v21;
      v29 = 0;
      goto LABEL_9;
    }
    v29 = [(id)objc_opt_class() flexMusicFeatureExtractionContextWithCuratorContext:v14];
    id v59 = 0;
    uint64_t v30 = +[PGMusicCurator extractMusicCurationFeaturesForEnrichedMemory:v23 graph:v50 context:v29 progressReporter:v28 error:&v59];
    id v31 = v59;
    id v32 = v31;
    if (v30)
    {
      v55 = v28;
      v57 = v21;

      v29 = (void *)v30;
LABEL_9:
      v56 = v22;
      id v32 = [v22 childProgressReporterFromStart:v26 toEnd:(double)v19 / v20];
      id v33 = [PGFlexMusicCurationParameters alloc];
      uint64_t v34 = [v23 suggestedMood];
      id v35 = [v23 legacyMoodKeywords];
      [v23 uniqueMemoryIdentifier];
      v37 = id v36 = v23;
      id v38 = [(PGFlexMusicCurationParameters *)v33 initWithMood:v34 moodKeywords:v35 recentlyUsedSongs:v48 entityUUID:v37 useMoodKeywords:0 features:v29 musicCuratorContext:v14];

      id v58 = 0;
      unint64_t v39 = +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:v38 progressReporter:v32 error:&v58];
      id v40 = v58;
      if (v39) {
        [v48 addFlexMusicCuration:v39 date:v47];
      }
      v54[2]();
      double v18 = v48;
      uint64_t v23 = v36;

      id v14 = v49;
      v22 = v56;
      double v21 = v57;
      v28 = v55;
      goto LABEL_13;
    }
    ((void (*)(void (**)(void), void *, void, id))v54[2])(v54, v23, 0, v31);
LABEL_13:

    if (v51 == v19) {
      goto LABEL_21;
    }
  }
  uint64_t v41 = +[PGLogging sharedLogging];
  uint64_t v42 = [v41 loggingConnection];

  uint64_t v23 = v42;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v42, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] (MemoriesMusic) Cancelling Flex Music curation for enriched memories.", buf, 2u);
  }
LABEL_20:

LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_memoryCurationSession, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_moodKeywordComputer, 0);
}

- (id)_extendedCuratedAssetsWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v9 = a5;
  v10 = _Block_copy(v9);
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  if (!v10
    || (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v48[3] < 0.01)
    || (v48[3] = v11,
        char v46 = 0,
        (*((void (**)(void *, char *, double))v10 + 2))(v10, &v46, 0.0),
        char v12 = *((unsigned char *)v52 + 24) | v46,
        (*((unsigned char *)v52 + 24) = v12) == 0))
  {
    id v14 = [v8 allItems];
    if (![v14 count])
    {
      id v13 = v14;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v34 = [(PGMemoryCurationSession *)self->_memoryCurationSession photoLibrary];
    id v15 = [[PGDejunkerDeduper_PHAsset alloc] initWithSimilarityModelClass:objc_opt_class()];
    [(PGDejunkerDeduper *)v15 setLoggingConnection:self->_loggingConnection];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke;
    v41[3] = &unk_1E68F03F8;
    id v33 = v10;
    id v42 = v33;
    v43 = &v47;
    v44 = &v51;
    uint64_t v45 = 0x3F847AE147AE147BLL;
    id v16 = [(PGDejunkerDeduper_PHAsset *)v15 dejunkedDedupedAssetsInAssets:v14 options:v35 debugInfo:0 progressBlock:v41];
    if (*((unsigned char *)v52 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v56 = 607;
        __int16 v57 = 2080;
        id v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/PGEnrichedMemoryFactory.m";
        unint64_t v17 = MEMORY[0x1E4F14500];
LABEL_11:
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      unint64_t v18 = +[PGCurationManager maximumNumberOfItemsForDuration:10 withTotalNumberOfItems:-1];
      if ([v16 count] > v18)
      {
        id v32 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", [v35 duration]);
        [(PGCurationOptions *)v32 setLastPassMovieAdditionEnabled:0];
        unint64_t v19 = [v35 identifiersOfRequiredItems];
        [(PGCurationOptions *)v32 setUuidsOfRequiredAssets:v19];

        id v20 = objc_alloc(MEMORY[0x1E4F39150]);
        double v21 = (void *)MEMORY[0x1E4F1CAD0];
        v22 = +[PGCurationManager assetPropertySetsForCuration];
        uint64_t v23 = [v21 setWithArray:v22];
        id v31 = (void *)[v20 initWithObjects:v16 photoLibrary:v34 fetchType:0 fetchPropertySets:v23 identifier:0 registerIfNeeded:0];

        id v24 = objc_alloc(MEMORY[0x1E4F76CF0]);
        double v25 = [(PGMemoryCurationSession *)self->_memoryCurationSession curationContext];
        double v26 = (void *)[v24 initWithAssetFetchResult:v31 curationContext:v25];

        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke_304;
        v36[3] = &unk_1E68F03F8;
        id v37 = v33;
        id v38 = &v47;
        unint64_t v39 = &v51;
        uint64_t v40 = 0x3F847AE147AE147BLL;
        uint64_t v27 = [(PGEnrichedMemoryFactory *)self _curatedAssetsWithFeeder:v26 options:v32 progressBlock:v36];

        if (*((unsigned char *)v52 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v56 = 621;
            __int16 v57 = 2080;
            id v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memo"
                  "ries/PGEnrichedMemoryFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          id v13 = (id)MEMORY[0x1E4F1CBF0];
          id v16 = (id)v27;
          goto LABEL_26;
        }

        id v16 = (id)v27;
      }
      if (!v10
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v48[3] < 0.01)
        || (v48[3] = Current,
            char v46 = 0,
            (*((void (**)(id, char *, double))v33 + 2))(v33, &v46, 1.0),
            char v29 = *((unsigned char *)v52 + 24) | v46,
            (*((unsigned char *)v52 + 24) = v29) == 0))
      {
        id v16 = v16;
        id v13 = v16;
        goto LABEL_26;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v56 = 624;
        __int16 v57 = 2080;
        id v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/PGEnrichedMemoryFactory.m";
        unint64_t v17 = MEMORY[0x1E4F14500];
        goto LABEL_11;
      }
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_26:

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v56 = 593;
    __int16 v57 = 2080;
    id v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/PGE"
          "nrichedMemoryFactory.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_28:
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v13;
}

void __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __82__PGEnrichedMemoryFactory__extendedCuratedAssetsWithFeeder_options_progressBlock___block_invoke_304(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)_curatedAssetsWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = objc_alloc_init(PGCurator_PHAsset);
  [(PGCurator *)v11 setLoggingConnection:self->_loggingConnection];
  char v12 = [(PGCurator_PHAsset *)v11 bestAssetsForFeeder:v10 options:v9 debugInfo:0 progressBlock:v8];

  return v12;
}

- (id)_keyAssetWithFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(PGMemoryCurationSession *)self->_memoryCurationSession curationManager];
  char v12 = [v9 referencePersonLocalIdentifiers];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    id v14 = [v8 allItems];
    id v15 = [v9 referencePersonLocalIdentifiers];
    uint64_t v16 = [v9 minimumNumberOfReferencePersons];
    uint64_t v17 = [v9 allowGuestAsset];
    LOBYTE(v22) = [v9 wantsGoodSquareCropScore];
    [v11 bestAssetInAssets:v14 forReferencePersonLocalIdentifiers:v15 requiredMinimumNumberOfReferencePersons:v16 forMemories:1 forSocialGroup:0 allowGuestAsset:v17 wantsGoodSquareCropScore:v22];
  }
  else
  {
    unint64_t v18 = [PGKeyCurator_PHAsset alloc];
    unint64_t v19 = [v11 curationCriteriaFactory];
    id v14 = [(PGKeyCurator *)v18 initWithCurationCriteriaFactory:v19];

    id v15 = [v9 curationCriteria];
    [(PGKeyCurator_PHAsset *)v14 keyAssetWithFeeder:v8 options:v9 criteria:v15 debugInfo:0 progressBlock:v10];
  id v20 = };

  return v20;
}

- (unint64_t)_numberOfGuestAssetInAssets:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) sourceType] == 32) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)curatedAssetUUIDsWithTriggeredMemory:(id)a3 keyAsset:(id)a4 extendedCuratedAssetUUIDs:(id)a5 targetCurationDuration:(double)a6 allowGuestAsset:(BOOL)a7 progressReporter:(id)a8
{
  BOOL v9 = a7;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v74 = a4;
  id v75 = a5;
  id v15 = a8;
  uint64_t v16 = self->_loggingConnection;
  os_signpost_id_t v17 = os_signpost_id_generate((os_log_t)v16);
  unint64_t v18 = v16;
  unint64_t v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MemoryCurationForLength", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v20 = mach_absolute_time();
  double v21 = [(PGEnrichedMemoryFactory *)self _memoryEnricherFromTriggeredMemory:v14];
  if (!v21)
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  uint64_t v22 = (objc_class *)objc_opt_class();
  v73 = NSStringFromClass(v22);
  id v23 = v15;
  *(void *)buf = 0;
  v83 = buf;
  uint64_t v84 = 0x2020000000;
  char v85 = 0;
  int v24 = [v23 isCancelledWithProgress:0.0];
  v83[24] = v24;
  if (v24)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v87 = 67109378;
      *(_DWORD *)v88 = 509;
      *(_WORD *)&v88[4] = 2080;
      *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
    }
    id v25 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_24;
  }
  v72 = [v21 relevantFeederForTriggeredMemory:v14 inGraph:self->_graph allowGuestAsset:v9 progressReporter:v23];
  if (v72)
  {
    if (v83[24])
    {
      v83[24] = 1;
      goto LABEL_16;
    }
    uint8_t v26 = [v23 isCancelledWithProgress:0.05];
    v83[24] = v26;
    if (v26)
    {
LABEL_16:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 518;
        *(_WORD *)&v88[4] = 2080;
        *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        uint64_t v27 = MEMORY[0x1E4F14500];
LABEL_21:
        _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    id v71 = [v21 relevantCurationFeederForTriggeredMemory:v14 relevantFeeder:v72 inGraph:self->_graph allowGuestAsset:v9 progressReporter:v23];
    if (!v71) {
      id v71 = v72;
    }
    if (v83[24])
    {
      v83[24] = 1;
LABEL_36:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 526;
        *(_WORD *)&v88[4] = 2080;
        *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      id v25 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_39;
    }
    uint8_t v33 = [v23 isCancelledWithProgress:0.3];
    v83[24] = v33;
    if (v33) {
      goto LABEL_36;
    }
    v68 = [v21 uuidsOfRequiredAssetsWithKeyAsset:v74 triggeredMemory:v14 inGraph:self->_graph progressReporter:v23];
    uint64_t v34 = (void *)MEMORY[0x1E4F28F60];
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke;
    v80[3] = &unk_1E68EBE78;
    id v65 = v75;
    id v81 = v65;
    id v35 = [v34 predicateWithBlock:v80];
    v67 = [v68 filteredSetUsingPredicate:v35];

    v69 = self->_loggingConnection;
    os_signpost_id_t v36 = os_signpost_id_generate((os_log_t)v69);
    id v37 = v69;
    id v38 = v37;
    unint64_t v61 = v36 - 1;
    os_signpost_id_t spid = v36;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v39 = v37;
      BOOL v40 = os_signpost_enabled(v37);
      id v38 = v39;
      if (v40)
      {
        *(_WORD *)v87 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CuratedAsset", "", v87, 2u);
        id v38 = v39;
      }
    }
    v70 = v38;

    mach_timebase_info v79 = 0;
    mach_timebase_info(&v79);
    uint64_t v60 = mach_absolute_time();
    uint64_t v41 = [v21 curationOptionsWithRequiredAssetUUIDs:v67 eligibleAssetUUIDs:v65 triggeredMemory:v14];
    [v41 setUseDurationBasedCuration:1];
    [v41 setMinimumDuration:0.0];
    [v41 setTargetDuration:a6];
    [v41 setFailIfMinimumDurationNotReached:0];
    if (v83[24])
    {
      v83[24] = 1;
LABEL_46:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 543;
        *(_WORD *)&v88[4] = 2080;
        *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      id v25 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_49;
    }
    uint8_t v42 = [v23 isCancelledWithProgress:0.35];
    v83[24] = v42;
    if (v42) {
      goto LABEL_46;
    }
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke_294;
    v76[3] = &unk_1E68EBE50;
    v78 = buf;
    id v59 = v23;
    id v77 = v59;
    v66 = [(PGEnrichedMemoryFactory *)self _curatedAssetsWithFeeder:v71 options:v41 progressBlock:v76];
    if (v83[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v87 = 67109378;
        *(_DWORD *)v88 = 548;
        *(_WORD *)&v88[4] = 2080;
        *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
      }
      id v25 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_71;
    }
    v43 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:v66];
    id v58 = [v43 allObjects];

    uint64_t v57 = mach_absolute_time();
    uint32_t numer = v79.numer;
    uint32_t denom = v79.denom;
    char v46 = v70;
    uint64_t v47 = v46;
    if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_DWORD *)v87 = 138412290;
      *(void *)v88 = v73;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v47, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAsset", "%@", v87, 0xCu);
    }

    v48 = v47;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      uint64_t v49 = [NSString stringWithFormat:@"%@", v73];
      *(_DWORD *)v87 = 136315650;
      *(void *)v88 = "CuratedAsset";
      *(_WORD *)&v88[8] = 2112;
      *(void *)&v88[10] = v49;
      __int16 v89 = 2048;
      double v90 = (float)((float)((float)((float)(v57 - v60) * (float)numer) / (float)denom) / 1000000.0);
      spidb = (void *)v49;
      _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v87, 0x20u);
    }
    os_signpost_id_t spida = mach_absolute_time();
    uint32_t v51 = info.numer;
    uint32_t v50 = info.denom;
    v52 = v19;
    uint64_t v53 = v52;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_DWORD *)v87 = 138412290;
      *(void *)v88 = v73;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v53, OS_SIGNPOST_INTERVAL_END, v17, "MemoryCurationForLength", "%@", v87, 0xCu);
    }

    char v54 = v53;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = [NSString stringWithFormat:@"%@", v73];
      *(_DWORD *)v87 = 136315650;
      *(void *)v88 = "MemoryCurationForLength";
      *(_WORD *)&v88[8] = 2112;
      *(void *)&v88[10] = v55;
      __int16 v89 = 2048;
      double v90 = (float)((float)((float)((float)(spida - v20) * (float)v51) / (float)v50) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v87, 0x20u);
    }
    if (v83[24])
    {
      v83[24] = 1;
    }
    else
    {
      uint8_t v56 = [v59 isCancelledWithProgress:1.0];
      v83[24] = v56;
      if ((v56 & 1) == 0)
      {
        id v25 = v58;
LABEL_70:

LABEL_71:
LABEL_49:

LABEL_39:
        goto LABEL_23;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v87 = 67109378;
      *(_DWORD *)v88 = 555;
      *(_WORD *)&v88[4] = 2080;
      *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
    }
    id v25 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_70;
  }
  if (v83[24])
  {
    v83[24] = 1;
  }
  else
  {
    uint8_t v28 = [v23 isCancelledWithProgress:1.0];
    v83[24] = v28;
    if ((v28 & 1) == 0)
    {
      uint64_t v30 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = (objc_class *)objc_opt_class();
        id v32 = NSStringFromClass(v31);
        *(_DWORD *)v87 = 138412290;
        *(void *)v88 = v32;
        _os_log_impl(&dword_1D1805000, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] nil feeder for triggered memory from enricher %@", v87, 0xCu);
      }
      goto LABEL_22;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v87 = 67109378;
    *(_DWORD *)v88 = 513;
    *(_WORD *)&v88[4] = 2080;
    *(void *)&v88[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Memories/PGEnrichedMemoryFactory.m";
    uint64_t v27 = MEMORY[0x1E4F14500];
    goto LABEL_21;
  }
LABEL_22:
  id v25 = (id)MEMORY[0x1E4F1CBF0];
LABEL_23:

LABEL_24:
  _Block_object_dispose(buf, 8);

LABEL_25:
  return v25;
}

uint64_t __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __155__PGEnrichedMemoryFactory_curatedAssetUUIDsWithTriggeredMemory_keyAsset_extendedCuratedAssetUUIDs_targetCurationDuration_allowGuestAsset_progressReporter___block_invoke_294(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.05 + 0.25];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (id)enrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5 debug:(BOOL)a6
{
  BOOL v275 = a6;
  uint64_t v313 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v280 = a5;
  long long v11 = self->_loggingConnection;
  os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)v11);
  long long v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MemoryElectionEnrichment", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v273 = mach_absolute_time();
  id v15 = [[PGEnrichedMemory alloc] initWithTriggeredMemory:v9];
  if ([v10 skipEnrichment])
  {
    uint64_t v16 = v15;
    goto LABEL_29;
  }
  unsigned int log = [v10 allowGuestAsset];
  v279 = [(PGEnrichedMemoryFactory *)self _memoryEnricherFromTriggeredMemory:v9];
  os_signpost_id_t v17 = (objc_class *)objc_opt_class();
  v274 = NSStringFromClass(v17);
  id v18 = v280;
  *(void *)buf = 0;
  v306 = buf;
  uint64_t v307 = 0x2020000000;
  char v308 = 0;
  id v278 = v18;
  int v19 = [v18 isCancelledWithProgress:0.0];
  v306[24] = v19;
  if (v19)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v310 = 67109378;
      *(_DWORD *)v311 = 242;
      *(_WORD *)&v311[4] = 2080;
      *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
    }
    uint64_t v16 = 0;
    goto LABEL_28;
  }
  uint64_t v20 = self->_loggingConnection;
  os_signpost_id_t v21 = os_signpost_id_generate((os_log_t)v20);
  uint64_t v22 = v20;
  id v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)v310 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Feeder", "", v310, 2u);
  }
  v269 = v23;

  mach_timebase_info v304 = 0;
  mach_timebase_info(&v304);
  uint64_t v24 = mach_absolute_time();
  id v25 = [v279 relevantFeederForTriggeredMemory:v9 inGraph:self->_graph allowGuestAsset:log progressReporter:v278];
  v272 = v25;
  if (v25)
  {
    -[PGEnrichedMemory setNumberOfRelevantAssets:](v15, "setNumberOfRelevantAssets:", [v25 numberOfItems]);
    if (v306[24])
    {
      v306[24] = 1;
      goto LABEL_19;
    }
    uint8_t v26 = [v278 isCancelledWithProgress:0.05];
    v306[24] = v26;
    if (v26)
    {
LABEL_19:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 259;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      goto LABEL_21;
    }
    id v268 = [v279 relevantCurationFeederForTriggeredMemory:v9 relevantFeeder:v272 inGraph:self->_graph allowGuestAsset:log progressReporter:v278];
    if (!v268) {
      id v268 = v272;
    }
    if (v306[24])
    {
      v306[24] = 1;
LABEL_41:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 267;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      uint64_t v16 = 0;
      goto LABEL_44;
    }
    uint8_t v33 = [v278 isCancelledWithProgress:0.1];
    v306[24] = v33;
    if (v33) {
      goto LABEL_41;
    }
    id v267 = [v279 relevantKeyCurationFeederForTriggeredMemory:v9 inGraph:self->_graph allowGuestAsset:log progressReporter:v278];
    if (!v267) {
      id v267 = v268;
    }
    if (v306[24])
    {
      v306[24] = 1;
LABEL_50:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 275;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      uint64_t v16 = 0;
      goto LABEL_53;
    }
    uint8_t v34 = [v278 isCancelledWithProgress:0.15];
    v306[24] = v34;
    if (v34) {
      goto LABEL_50;
    }
    uint64_t v265 = mach_absolute_time();
    uint32_t numer = v304.numer;
    uint32_t denom = v304.denom;
    id v37 = v269;
    id v38 = v37;
    unint64_t v39 = v37;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v40 = os_signpost_enabled(v37);
      id v38 = v39;
      if (v40)
      {
        *(_DWORD *)v310 = 138412290;
        *(void *)v311 = v274;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_END, v21, "Feeder", "%@", v310, 0xCu);
        id v38 = v39;
      }
    }

    uint64_t v41 = v39;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      [NSString stringWithFormat:@"%@", v274];
      float v42 = (float)((float)((float)(v265 - v24) * (float)numer) / (float)denom) / 1000000.0;
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(void *)v311 = "Feeder";
      *(_WORD *)&v311[8] = 2112;
      *(void *)&v311[10] = v43;
      *(_WORD *)&v311[18] = 2048;
      double v312 = v42;
      _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
    }
    v44 = self->_loggingConnection;
    os_signpost_id_t v45 = os_signpost_id_generate((os_log_t)v44);
    char v46 = v44;
    uint64_t v47 = v46;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "KeyAsset", "", v310, 2u);
    }
    v264 = v47;

    mach_timebase_info v303 = 0;
    mach_timebase_info(&v303);
    uint64_t v259 = mach_absolute_time();
    v48 = [v279 keyAssetCurationOptionsWithTriggeredMemory:v9 inGraph:self->_graph];
    [v48 setAllowGuestAsset:log];
    v300[0] = MEMORY[0x1E4F143A8];
    v300[1] = 3221225472;
    v300[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke;
    v300[3] = &unk_1E68EBE50;
    v302 = buf;
    id v261 = v278;
    v263 = v48;
    id v301 = v261;
    v266 = [(PGEnrichedMemoryFactory *)self _keyAssetWithFeeder:v267 options:v48 progressBlock:v300];
    if (v306[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 288;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        uint64_t v49 = MEMORY[0x1E4F14500];
LABEL_72:
        _os_log_impl(&dword_1D1805000, v49, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
        goto LABEL_73;
      }
      goto LABEL_73;
    }
    if (!v266) {
      goto LABEL_69;
    }
    if ([v266 clsAvoidIfPossibleAsKeyItemForMemories:1 allowGuestAsset:log])
    {
      if (v306[24])
      {
        v306[24] = 1;
LABEL_70:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 290;
          *(_WORD *)&v311[4] = 2080;
          *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
          uint64_t v49 = MEMORY[0x1E4F14500];
          goto LABEL_72;
        }
LABEL_73:
        uint64_t v16 = 0;
LABEL_74:

LABEL_53:
LABEL_44:

        goto LABEL_22;
      }
LABEL_69:
      uint8_t v50 = [v261 isCancelledWithProgress:1.0];
      v306[24] = v50;
      if ((v50 & 1) == 0)
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v310 = 138412290;
          *(void *)v311 = v9;
          _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] No viable key asset found, returning nil enrichedMemory for %@", v310, 0xCu);
        }
        if (v275)
        {
          [(PGEnrichedMemory *)v15 setFailureReason:3];
          uint64_t v16 = v15;
          goto LABEL_74;
        }
        goto LABEL_73;
      }
      goto LABEL_70;
    }
    uint32_t v51 = [v266 uuid];
    [(PGEnrichedMemory *)v15 setKeyAssetUUID:v51];

    uint64_t v257 = mach_absolute_time();
    uint32_t v53 = v303.numer;
    uint32_t v52 = v303.denom;
    char v54 = v264;
    v55 = v54;
    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
    {
      *(_DWORD *)v310 = 138412290;
      *(void *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v55, OS_SIGNPOST_INTERVAL_END, v45, "KeyAsset", "%@", v310, 0xCu);
    }

    uint8_t v56 = v55;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      id v57 = [NSString stringWithFormat:@"%@", v274];
      *(_DWORD *)v310 = 136315650;
      *(void *)v311 = "KeyAsset";
      *(_WORD *)&v311[8] = 2112;
      *(void *)&v311[10] = v57;
      *(_WORD *)&v311[18] = 2048;
      double v312 = (float)((float)((float)((float)(v257 - v259) * (float)v53) / (float)v52) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
    }
    v260 = [v279 uuidsOfRequiredAssetsWithKeyAsset:v266 triggeredMemory:v9 inGraph:self->_graph progressReporter:v261];
    id v58 = self->_loggingConnection;
    os_signpost_id_t v59 = os_signpost_id_generate((os_log_t)v58);
    uint64_t v60 = v58;
    unint64_t v61 = v60;
    os_signpost_id_t spid = v59;
    unint64_t v246 = v59 - 1;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "ExtendedCuratedAsset", "", v310, 2u);
    }
    v258 = v61;

    mach_timebase_info v299 = 0;
    mach_timebase_info(&v299);
    os_signpost_id_t v243 = mach_absolute_time();
    context = (void *)MEMORY[0x1D25FED50]();
    uint64_t v62 = [v279 extendedCurationOptionsWithRequiredAssetUUIDs:v260 triggeredMemory:v9];
    v296[0] = MEMORY[0x1E4F143A8];
    v296[1] = 3221225472;
    v296[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_268;
    v296[3] = &unk_1E68EBE50;
    v298 = buf;
    id v248 = v261;
    id v297 = v248;
    v253 = (void *)v62;
    v63 = [(PGEnrichedMemoryFactory *)self _extendedCuratedAssetsWithFeeder:v268 options:v62 progressBlock:v296];
    int v64 = v306[24];
    if (v306[24])
    {
      id v65 = MEMORY[0x1E4F14500];
      id v66 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 319;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, v65, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      v262 = 0;
    }
    else
    {
      id v65 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:v63];
      v262 = [v279 extendedCurationOptionsWithRequiredAssetUUIDs:v65 triggeredMemory:v9];
    }

    if (v64) {
      goto LABEL_93;
    }
    if (v306[24])
    {
      v306[24] = 1;
      goto LABEL_98;
    }
    uint8_t v68 = [v248 isCancelledWithProgress:0.3];
    v306[24] = v68;
    if (v68)
    {
LABEL_98:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 326;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
LABEL_93:
      uint64_t v16 = 0;
LABEL_94:

      goto LABEL_74;
    }
    v69 = (void *)MEMORY[0x1D25FED50]();
    v293[0] = MEMORY[0x1E4F143A8];
    v293[1] = 3221225472;
    v293[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_270;
    v293[3] = &unk_1E68EBE50;
    v295 = buf;
    id v249 = v248;
    id v294 = v249;
    contexta = [(PGEnrichedMemoryFactory *)self _extendedCuratedAssetsWithFeeder:v272 options:v262 progressBlock:v293];
    int v70 = v306[24];
    if (v306[24])
    {
      id v71 = MEMORY[0x1E4F14500];
      id v72 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 334;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
    }
    if (v70)
    {
      uint64_t v16 = 0;
LABEL_121:

      goto LABEL_94;
    }
    v254 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:contexta];
    v73 = [v254 allObjects];
    [(PGEnrichedMemory *)v15 setExtendedCuratedAssetUUIDs:v73];

    uint64_t v74 = mach_absolute_time();
    uint32_t v75 = v299.numer;
    uint32_t v76 = v299.denom;
    id v77 = v258;
    v78 = v77;
    if (v246 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
    {
      *(_DWORD *)v310 = 138412290;
      *(void *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v78, OS_SIGNPOST_INTERVAL_END, spid, "ExtendedCuratedAsset", "%@", v310, 0xCu);
    }

    mach_timebase_info v79 = v78;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      [NSString stringWithFormat:@"%@", v274];
      float v80 = (float)((float)((float)(v74 - v243) * (float)v75) / (float)v76) / 1000000.0;
      id v81 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(void *)v311 = "ExtendedCuratedAsset";
      *(_WORD *)&v311[8] = 2112;
      *(void *)&v311[10] = v81;
      *(_WORD *)&v311[18] = 2048;
      double v312 = v80;
      _os_log_impl(&dword_1D1805000, v79, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
    }
    v82 = self->_loggingConnection;
    os_signpost_id_t v83 = os_signpost_id_generate((os_log_t)v82);
    os_signpost_id_t spida = v82;
    os_signpost_id_t v244 = v83;
    unint64_t v84 = v83 - 1;
    if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(spida))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, spida, OS_SIGNPOST_INTERVAL_BEGIN, v83, "CuratedAsset", "", v310, 2u);
    }

    mach_timebase_info v292 = 0;
    mach_timebase_info(&v292);
    os_signpost_id_t v240 = mach_absolute_time();
    v247 = [v279 curationOptionsWithRequiredAssetUUIDs:v260 eligibleAssetUUIDs:v254 triggeredMemory:v9];
    if (v306[24])
    {
      v306[24] = 1;
LABEL_117:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 347;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      uint64_t v16 = 0;
      goto LABEL_120;
    }
    uint8_t v85 = [v249 isCancelledWithProgress:0.3];
    v306[24] = v85;
    if (v85) {
      goto LABEL_117;
    }
    os_log_t v237 = (os_log_t)MEMORY[0x1D25FED50]();
    v289[0] = MEMORY[0x1E4F143A8];
    v289[1] = 3221225472;
    v289[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_272;
    v289[3] = &unk_1E68EBE50;
    v291 = buf;
    id v235 = v249;
    id v290 = v235;
    v250 = [(PGEnrichedMemoryFactory *)self _curatedAssetsWithFeeder:v268 options:v247 progressBlock:v289];
    int v86 = v306[24];
    if (v306[24])
    {
      v87 = MEMORY[0x1E4F14500];
      id v88 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 356;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
    }
    if (v86) {
      goto LABEL_127;
    }
    __int16 v89 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:v250];
    double v90 = [v89 allObjects];
    [(PGEnrichedMemory *)v15 setCuratedAssetUUIDs:v90];

    uint64_t v91 = mach_absolute_time();
    uint32_t v92 = v292.numer;
    uint32_t v93 = v292.denom;
    v94 = spida;
    v95 = v94;
    if (v84 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
    {
      *(_DWORD *)v310 = 138412290;
      *(void *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v95, OS_SIGNPOST_INTERVAL_END, v244, "CuratedAsset", "%@", v310, 0xCu);
    }

    v96 = v95;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      id v97 = [NSString stringWithFormat:@"%@", v274];
      *(_DWORD *)v310 = 136315650;
      *(void *)v311 = "CuratedAsset";
      *(_WORD *)&v311[8] = 2112;
      *(void *)&v311[10] = v97;
      *(_WORD *)&v311[18] = 2048;
      double v312 = (float)((float)((float)((float)(v91 - v240) * (float)v92) / (float)v93) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v96, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
    }
    unint64_t v98 = [v250 count];
    unint64_t v99 = [v10 minimumNumberOfCuratedAssets];
    int v100 = v99;
    if (v98 < v99)
    {
      if (v306[24])
      {
        v306[24] = 1;
LABEL_149:
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
LABEL_127:
          uint64_t v16 = 0;
LABEL_128:

LABEL_120:
          goto LABEL_121;
        }
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 366;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        v109 = MEMORY[0x1E4F14500];
LABEL_151:
        _os_log_impl(&dword_1D1805000, v109, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
        goto LABEL_127;
      }
      uint8_t v108 = [v235 isCancelledWithProgress:1.0];
      v306[24] = v108;
      if (v108) {
        goto LABEL_149;
      }
      v133 = self->_loggingConnection;
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v310 = 67109634;
        *(_DWORD *)v311 = v98;
        *(_WORD *)&v311[4] = 1024;
        *(_DWORD *)&v311[6] = v100;
        *(_WORD *)&v311[10] = 2112;
        *(void *)&v311[12] = v9;
        _os_log_impl(&dword_1D1805000, v133, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] Not enough curated assets, found %d but require at least %d, returning nil enrichedMemory for %@", v310, 0x18u);
      }
      if (!v275) {
        goto LABEL_127;
      }
      [(PGEnrichedMemory *)v15 setFailureReason:4];
LABEL_176:
      uint64_t v16 = v15;
      goto LABEL_128;
    }
    if (log)
    {
      unint64_t v101 = [(PGEnrichedMemoryFactory *)self _numberOfGuestAssetInAssets:v250];
      [v10 maximumRatioOfGuestAssets];
      double v102 = (double)v101 / (double)v98;
      if (v102 > v103)
      {
        if (v306[24])
        {
          v306[24] = 1;
        }
        else
        {
          uint8_t v134 = [v235 isCancelledWithProgress:1.0];
          v306[24] = v134;
          if ((v134 & 1) == 0)
          {
            v135 = self->_loggingConnection;
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v310 = 138412802;
              *(void *)v311 = v9;
              *(_WORD *)&v311[8] = 2048;
              *(void *)&v311[10] = v101;
              *(_WORD *)&v311[18] = 2048;
              *(void *)&double v312 = (unint64_t)(v102 * (double)v98);
              _os_log_impl(&dword_1D1805000, v135, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] Too many guest assets featured for %@: %lu > %lu", v310, 0x20u);
            }
            if (!v275) {
              goto LABEL_127;
            }
            [(PGEnrichedMemory *)v15 setFailureReason:5];
            goto LABEL_176;
          }
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_127;
        }
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 381;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        v109 = MEMORY[0x1E4F14500];
        goto LABEL_151;
      }
      [(PGEnrichedMemory *)v15 setFeaturesGuestAssets:v101 != 0];
    }
    else
    {
      [(PGEnrichedMemory *)v15 setFeaturesGuestAssets:0];
    }
    v104 = self->_loggingConnection;
    os_signpost_id_t v105 = os_signpost_id_generate((os_log_t)v104);
    loga = v104;
    os_signpost_id_t v241 = v105;
    unint64_t v106 = v105 - 1;
    if (v106 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(loga))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, loga, OS_SIGNPOST_INTERVAL_BEGIN, v241, "RepresentativeAssets", "", v310, 2u);
    }

    mach_timebase_info v288 = 0;
    mach_timebase_info(&v288);
    os_log_t v238 = (os_log_t)mach_absolute_time();
    v107 = [v272 allItems];
    v285[0] = MEMORY[0x1E4F143A8];
    v285[1] = 3221225472;
    v285[2] = __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_275;
    v285[3] = &unk_1E68EBE50;
    v287 = buf;
    id v236 = v235;
    id v286 = v236;
    v245 = +[PGCurationManager representativeAssetsForAssets:v107 extendedCuratedAssets:contexta progressBlock:v285];

    if (v306[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 402;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }
      uint64_t v16 = 0;
      goto LABEL_216;
    }
    v110 = +[PGMemoryGenerationHelper assetUUIDsFromAssets:v245];
    v111 = [v110 allObjects];
    [(PGEnrichedMemory *)v15 setRepresentativeAssetUUIDs:v111];

    uint64_t v112 = mach_absolute_time();
    uint32_t v113 = v288.numer;
    uint32_t v114 = v288.denom;
    v115 = loga;
    v116 = v115;
    if (v106 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
    {
      *(_DWORD *)v310 = 138412290;
      *(void *)v311 = v274;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v116, OS_SIGNPOST_INTERVAL_END, v241, "RepresentativeAssets", "%@", v310, 0xCu);
    }

    v117 = v116;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
    {
      [NSString stringWithFormat:@"%@", v274];
      float v118 = (float)((float)((float)(v112 - (unint64_t)v238) * (float)v113) / (float)v114) / 1000000.0;
      id v119 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v310 = 136315650;
      *(void *)v311 = "RepresentativeAssets";
      *(_WORD *)&v311[8] = 2112;
      *(void *)&v311[10] = v119;
      *(_WORD *)&v311[18] = 2048;
      double v312 = v118;
      _os_log_impl(&dword_1D1805000, v117, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
    }
    v120 = self->_loggingConnection;
    os_signpost_id_t v121 = os_signpost_id_generate((os_log_t)v120);
    v239 = v120;
    os_signpost_id_t v230 = v121;
    unint64_t v122 = v121 - 1;
    if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v239))
    {
      *(_WORD *)v310 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v239, OS_SIGNPOST_INTERVAL_BEGIN, v121, "TitleGeneration", "", v310, 2u);
    }

    mach_timebase_info v284 = 0;
    mach_timebase_info(&v284);
    uint64_t v225 = mach_absolute_time();
    v242 = [v279 titleGeneratorForTriggeredMemory:v9 withKeyAsset:v266 curatedAssets:v250 extendedCuratedAssets:contexta titleGenerationContext:self->_titleGenerationContext inGraph:self->_graph];
    if (v242)
    {
      v233 = [v242 title];
      v123 = [v233 stringValue];
      v234 = [v123 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

      if ([v234 length])
      {
        [(PGEnrichedMemory *)v15 setTitle:v234];
        v229 = [v242 subtitle];
        v124 = [v229 stringValue];
        [(PGEnrichedMemory *)v15 setSubtitle:v124];

        v125 = [(PGEnrichedMemory *)v15 subtitle];
        BOOL v126 = [v125 length] == 0;

        if (v126)
        {
          if (v306[24])
          {
            v306[24] = 1;
          }
          else
          {
            uint8_t v146 = [v236 isCancelledWithProgress:1.0];
            v306[24] = v146;
            if ((v146 & 1) == 0)
            {
              v163 = self->_loggingConnection;
              if (os_log_type_enabled((os_log_t)v163, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v310 = 138412290;
                *(void *)v311 = v9;
                _os_log_error_impl(&dword_1D1805000, (os_log_t)v163, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] No subtitle generated, returning nil enrichedMemory for %@", v310, 0xCu);
              }

              if (v275)
              {
                [(PGEnrichedMemory *)v15 setFailureReason:8];
                uint64_t v16 = v15;
                goto LABEL_213;
              }
LABEL_212:
              uint64_t v16 = 0;
LABEL_213:

              goto LABEL_214;
            }
          }
          v147 = MEMORY[0x1E4F14500];
          id v148 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v310 = 67109378;
            *(_DWORD *)v311 = 440;
            *(_WORD *)&v311[4] = 2080;
            *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Memories/PGEnrichedMemoryFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          }
LABEL_211:

          goto LABEL_212;
        }
        -[PGEnrichedMemory setTitleCategory:](v15, "setTitleCategory:", [v233 category]);
        uint64_t v276 = mach_absolute_time();
        uint32_t v127 = v284.numer;
        uint32_t v128 = v284.denom;
        v129 = v239;
        v130 = v129;
        if (v122 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v129))
        {
          *(_DWORD *)v310 = 138412290;
          *(void *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v130, OS_SIGNPOST_INTERVAL_END, v230, "TitleGeneration", "%@", v310, 0xCu);
        }

        v131 = v130;
        if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
        {
          id v132 = [NSString stringWithFormat:@"%@", v274];
          *(_DWORD *)v310 = 136315650;
          *(void *)v311 = "TitleGeneration";
          *(_WORD *)&v311[8] = 2112;
          *(void *)&v311[10] = v132;
          *(_WORD *)&v311[18] = 2048;
          double v312 = (float)((float)((float)((float)(v276 - v225) * (float)v127) / (float)v128) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v131, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
        }
        if (v306[24])
        {
          v306[24] = 1;
          goto LABEL_196;
        }
        uint8_t v139 = [v236 isCancelledWithProgress:0.5];
        v306[24] = v139;
        if (v139)
        {
LABEL_196:
          v140 = MEMORY[0x1E4F14500];
          id v141 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v310 = 67109378;
            *(_DWORD *)v311 = 451;
            *(_WORD *)&v311[4] = 2080;
            *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Memories/PGEnrichedMemoryFactory.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          }
          goto LABEL_211;
        }
        v149 = self->_loggingConnection;
        os_signpost_id_t v150 = os_signpost_id_generate((os_log_t)v149);
        v151 = v149;
        v152 = v151;
        os_signpost_id_t v231 = v150;
        unint64_t v153 = v150 - 1;
        if (v153 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
        {
          *(_WORD *)v310 = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v152, OS_SIGNPOST_INTERVAL_BEGIN, v231, "ChapterTitleGeneration", "", v310, 2u);
        }

        mach_timebase_info v283 = 0;
        mach_timebase_info(&v283);
        uint64_t v226 = mach_absolute_time();
        v277 = [v279 chapterTitleGeneratorForTriggeredMemory:v9 curatedAssets:v250 extendedCuratedAssets:contexta titleGenerationContext:self->_titleGenerationContext inGraph:self->_graph];
        if (v277)
        {
          v154 = [v277 generateChapterTitles];
          [(PGEnrichedMemory *)v15 setChapterTitles:v154];
        }
        uint64_t v155 = mach_absolute_time();
        uint32_t v156 = v283.numer;
        uint32_t v157 = v283.denom;
        v158 = v152;
        v159 = v158;
        if (v153 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v158))
        {
          *(_DWORD *)v310 = 138412290;
          *(void *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v159, OS_SIGNPOST_INTERVAL_END, v231, "ChapterTitleGeneration", "%@", v310, 0xCu);
        }

        v160 = v159;
        if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
        {
          id v161 = [NSString stringWithFormat:@"%@", v274];
          *(_DWORD *)v310 = 136315650;
          *(void *)v311 = "ChapterTitleGeneration";
          *(_WORD *)&v311[8] = 2112;
          *(void *)&v311[10] = v161;
          *(_WORD *)&v311[18] = 2048;
          double v312 = (float)((float)((float)((float)(v155 - v226) * (float)v156) / (float)v157) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v160, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
        }
        if (v306[24])
        {
          v306[24] = 1;
LABEL_238:
          v165 = MEMORY[0x1E4F14500];
          id v166 = MEMORY[0x1E4F14500];
          if (!os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
          {
LABEL_241:
            uint64_t v16 = 0;
LABEL_242:

            goto LABEL_213;
          }
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 460;
          *(_WORD *)&v311[4] = 2080;
          *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
LABEL_240:
          _os_log_impl(&dword_1D1805000, v165, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          goto LABEL_241;
        }
        uint8_t v164 = [v236 isCancelledWithProgress:0.55];
        v306[24] = v164;
        if (v164) {
          goto LABEL_238;
        }
        v167 = objc_opt_class();
        v168 = [v10 localDate];
        -[PGEnrichedMemory setNotificationLevel:](v15, "setNotificationLevel:", [v167 notificationLevelForTriggeredMemory:v9 withLocalDate:v168 graph:self->_graph]);

        v169 = objc_opt_class();
        uint64_t v170 = [(PGEnrichedMemory *)v15 notificationLevel];
        [(PGEnrichedMemory *)v15 electionScore];
        objc_msgSend(v169, "notificationScoreForNotificationLevel:electionScore:", v170);
        -[PGEnrichedMemory setScore:](v15, "setScore:");
        if (v306[24])
        {
          v306[24] = 1;
LABEL_246:
          v165 = MEMORY[0x1E4F14500];
          id v172 = MEMORY[0x1E4F14500];
          if (!os_log_type_enabled(v165, OS_LOG_TYPE_INFO)) {
            goto LABEL_241;
          }
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 466;
          *(_WORD *)&v311[4] = 2080;
          *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
          goto LABEL_240;
        }
        uint8_t v171 = [v236 isCancelledWithProgress:0.6];
        v306[24] = v171;
        if (v171) {
          goto LABEL_246;
        }
        v173 = self->_loggingConnection;
        os_signpost_id_t v217 = os_signpost_id_generate((os_log_t)v173);
        v220 = v173;
        if (v217 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v220))
        {
          *(_WORD *)v310 = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v220, OS_SIGNPOST_INTERVAL_BEGIN, v217, "MoodGenerator", "", v310, 2u);
        }

        mach_timebase_info v282 = 0;
        mach_timebase_info(&v282);
        uint64_t v215 = mach_absolute_time();
        v232 = objc_alloc_init(PGMoodGeneratorOptions);
        [(PGMoodGeneratorOptions *)v232 setPrefetchedAssets:contexta];
        v174 = [v10 moodHistory];
        [(PGMoodGeneratorOptions *)v232 setMoodHistory:v174];

        v227 = (void *)MEMORY[0x1E4F76C68];
        v175 = [v10 localDate];
        v176 = [v10 timeZone];
        v224 = [v227 universalDateFromLocalDate:v175 inTimeZone:v176];

        [(PGMoodGeneratorOptions *)v232 setReferenceDate:v224];
        v177 = [[PGMoodGenerationContext alloc] initWithReferenceDate:v224];
        [(PGMoodGeneratorOptions *)v232 setMoodGenerationContext:v177];

        v178 = [PGMoodGenerator alloc];
        v179 = [(PGMemoryCurationSession *)self->_memoryCurationSession photoLibrary];
        v228 = [(PGMoodGenerator *)v178 initWithEnrichedMemory:v15 photoLibrary:v179 options:v232];

        [(PGEnrichedMemory *)v15 setSuggestedMood:[(PGMoodGenerator *)v228 suggestedMoodWithGraph:self->_graph]];
        [(PGEnrichedMemory *)v15 setForbiddenMoods:[(PGMoodGenerator *)v228 forbiddenMoodsWithGraph:self->_graph]];
        [(PGEnrichedMemory *)v15 setRecommendedMoods:[(PGMoodGenerator *)v228 recommendedMoodsWithGraph:self->_graph]];
        v180 = [(PGMoodGenerator *)v228 positiveMoodVectorWithGraph:self->_graph];
        [(PGEnrichedMemory *)v15 setPositiveMoodVector:v180];

        uint64_t v181 = mach_absolute_time();
        mach_timebase_info v182 = v282;
        v183 = v220;
        v184 = v183;
        if (v217 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v183))
        {
          *(_DWORD *)v310 = 138412290;
          *(void *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v184, OS_SIGNPOST_INTERVAL_END, v217, "MoodGenerator", "%@", v310, 0xCu);
        }

        v165 = v184;
        if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
        {
          [NSString stringWithFormat:@"%@", v274];
          float v185 = (float)((float)((float)(v181 - v215) * (float)v182.numer) / (float)v182.denom) / 1000000.0;
          id v186 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v310 = 136315650;
          *(void *)v311 = "MoodGenerator";
          *(_WORD *)&v311[8] = 2112;
          *(void *)&v311[10] = v186;
          *(_WORD *)&v311[18] = 2048;
          double v312 = v185;
          _os_log_impl(&dword_1D1805000, v165, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
        }
        if (v306[24])
        {
          v306[24] = 1;
          goto LABEL_259;
        }
        uint8_t v187 = [v236 isCancelledWithProgress:0.7];
        v306[24] = v187;
        if (v187)
        {
LABEL_259:
          v188 = MEMORY[0x1E4F14500];
          id v189 = MEMORY[0x1E4F14500];
          v190 = v188;
          if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v310 = 67109378;
            *(_DWORD *)v311 = 485;
            *(_WORD *)&v311[4] = 2080;
            *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Memories/PGEnrichedMemoryFactory.m";
            v190 = MEMORY[0x1E4F14500];
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
          }
          goto LABEL_275;
        }
        v221 = self->_loggingConnection;
        os_signpost_id_t v191 = os_signpost_id_generate((os_log_t)v221);
        v222 = v221;
        os_signpost_id_t v214 = v191;
        unint64_t v216 = v191 - 1;
        if (v191 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v222))
        {
          *(_WORD *)v310 = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v222, OS_SIGNPOST_INTERVAL_BEGIN, v191, "MoodKeywordComputer", "", v310, 2u);
        }

        mach_timebase_info v281 = 0;
        mach_timebase_info(&v281);
        uint64_t v213 = mach_absolute_time();
        moodKeywordComputer = self->_moodKeywordComputer;
        os_signpost_id_t v218 = [(PGEnrichedMemory *)v15 suggestedMood];
        graph = self->_graph;
        v193 = [(PGMemoryCurationSession *)self->_memoryCurationSession locationHelper];
        v194 = [(PGMoodKeywordComputer *)moodKeywordComputer moodKeywordsForTriggeredMemory:v9 suggestedMood:v218 inGraph:graph locationHelper:v193];
        [(PGEnrichedMemory *)v15 setLegacyMoodKeywords:v194];

        uint64_t v195 = mach_absolute_time();
        mach_timebase_info v196 = v281;
        v197 = v222;
        v198 = v197;
        if (v216 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v197))
        {
          *(_DWORD *)v310 = 138412290;
          *(void *)v311 = v274;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v198, OS_SIGNPOST_INTERVAL_END, v214, "MoodKeywordComputer", "%@", v310, 0xCu);
        }

        v190 = v198;
        if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
        {
          [NSString stringWithFormat:@"%@", v274];
          float v199 = (float)((float)((float)(v195 - v213) * (float)v196.numer) / (float)v196.denom) / 1000000.0;
          id v200 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v310 = 136315650;
          *(void *)v311 = "MoodKeywordComputer";
          *(_WORD *)&v311[8] = 2112;
          *(void *)&v311[10] = v200;
          *(_WORD *)&v311[18] = 2048;
          double v312 = v199;
          _os_log_impl(&dword_1D1805000, v190, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
        }
        if (v306[24])
        {
          v306[24] = 1;
        }
        else
        {
          uint8_t v201 = [v236 isCancelledWithProgress:0.8];
          v306[24] = v201;
          if ((v201 & 1) == 0)
          {
            os_log_t v223 = (os_log_t)mach_absolute_time();
            uint32_t v205 = info.numer;
            uint32_t v204 = info.denom;
            v206 = v14;
            v207 = v206;
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v206))
            {
              *(_DWORD *)v310 = 138412290;
              *(void *)v311 = v274;
              _os_signpost_emit_with_name_impl(&dword_1D1805000, v207, OS_SIGNPOST_INTERVAL_END, v12, "MemoryElectionEnrichment", "%@", v310, 0xCu);
            }

            v208 = v207;
            if (os_log_type_enabled(v208, OS_LOG_TYPE_INFO))
            {
              id v209 = [NSString stringWithFormat:@"%@", v274];
              *(_DWORD *)v310 = 136315650;
              *(void *)v311 = "MemoryElectionEnrichment";
              *(_WORD *)&v311[8] = 2112;
              *(void *)&v311[10] = v209;
              *(_WORD *)&v311[18] = 2048;
              double v312 = (float)((float)((float)((float)((unint64_t)v223 - v273) * (float)v205) / (float)v204)
                           / 1000000.0);
              _os_log_impl(&dword_1D1805000, v208, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v310, 0x20u);
            }
            if (v306[24])
            {
              v306[24] = 1;
            }
            else
            {
              uint8_t v210 = [v236 isCancelledWithProgress:1.0];
              v306[24] = v210;
              if ((v210 & 1) == 0)
              {
                uint64_t v16 = v15;
                goto LABEL_276;
              }
            }
            v211 = MEMORY[0x1E4F14500];
            id v212 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v310 = 67109378;
              *(_DWORD *)v311 = 495;
              *(_WORD *)&v311[4] = 2080;
              *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/PGEnrichedMemoryFactory.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
            }
            goto LABEL_274;
          }
        }
        v202 = MEMORY[0x1E4F14500];
        id v203 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v310 = 67109378;
          *(_DWORD *)v311 = 492;
          *(_WORD *)&v311[4] = 2080;
          *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGEnrichedMemoryFactory.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
        }
LABEL_274:

LABEL_275:
        uint64_t v16 = 0;
LABEL_276:

        goto LABEL_242;
      }
      if (v306[24])
      {
        v306[24] = 1;
      }
      else
      {
        uint8_t v142 = [v236 isCancelledWithProgress:1.0];
        v306[24] = v142;
        if ((v142 & 1) == 0)
        {
          v162 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v162, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v310 = 138412290;
            *(void *)v311 = v9;
            _os_log_error_impl(&dword_1D1805000, (os_log_t)v162, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] No title generated, returning nil enrichedMemory for %@", v310, 0xCu);
          }

          if (v275)
          {
            [(PGEnrichedMemory *)v15 setFailureReason:7];
            uint64_t v16 = v15;
            goto LABEL_214;
          }
          goto LABEL_203;
        }
      }
      v143 = MEMORY[0x1E4F14500];
      id v144 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v310 = 67109378;
        *(_DWORD *)v311 = 426;
        *(_WORD *)&v311[4] = 2080;
        *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGEnrichedMemoryFactory.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
      }

LABEL_203:
      uint64_t v16 = 0;
LABEL_214:

      goto LABEL_215;
    }
    if (v306[24])
    {
      v306[24] = 1;
    }
    else
    {
      uint8_t v136 = [v236 isCancelledWithProgress:1.0];
      v306[24] = v136;
      if ((v136 & 1) == 0)
      {
        v145 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v145, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v310 = 138412290;
          *(void *)v311 = v9;
          _os_log_impl(&dword_1D1805000, (os_log_t)v145, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] Nil titleGenerator, returning nil enrichedMemory for %@", v310, 0xCu);
        }

        if (v275)
        {
          [(PGEnrichedMemory *)v15 setFailureReason:6];
          uint64_t v16 = v15;
          goto LABEL_215;
        }
LABEL_194:
        uint64_t v16 = 0;
LABEL_215:

LABEL_216:
        goto LABEL_128;
      }
    }
    v137 = MEMORY[0x1E4F14500];
    id v138 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v310 = 67109378;
      *(_DWORD *)v311 = 412;
      *(_WORD *)&v311[4] = 2080;
      *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
    }

    goto LABEL_194;
  }
  if (v306[24])
  {
    v306[24] = 1;
LABEL_24:
    uint64_t v27 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v310 = 67109378;
      *(_DWORD *)v311 = 248;
      *(_WORD *)&v311[4] = 2080;
      *(void *)&v311[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Memories/PGEnrichedMemoryFactory.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v310, 0x12u);
    }
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  uint8_t v28 = [v278 isCancelledWithProgress:1.0];
  v306[24] = v28;
  if (v28) {
    goto LABEL_24;
  }
  uint64_t v30 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = (objc_class *)objc_opt_class();
    id v32 = NSStringFromClass(v31);
    *(_DWORD *)v310 = 138412290;
    *(void *)v311 = v32;
    _os_log_impl(&dword_1D1805000, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "[PGEnrichedMemoryFactory] nil feeder for triggered memory from enricher %@", v310, 0xCu);
  }
  if (v275)
  {
    [(PGEnrichedMemory *)v15 setFailureReason:2];
    uint64_t v16 = v15;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v16 = 0;
LABEL_22:
  uint64_t v27 = v272;
LABEL_27:

LABEL_28:
  _Block_object_dispose(buf, 8);

LABEL_29:
  return v16;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.05 + 0.15];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_268(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.05 + 0.2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_270(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.05 + 0.25];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_272(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.05 + 0.3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

uint64_t __102__PGEnrichedMemoryFactory_enrichedMemoryWithTriggeredMemory_withConfiguration_progressReporter_debug___block_invoke_275(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:a3 * 0.1 + 0.4];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (id)enrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5
{
  return [(PGEnrichedMemoryFactory *)self enrichedMemoryWithTriggeredMemory:a3 withConfiguration:a4 progressReporter:a5 debug:0];
}

- (id)debugEnrichedMemoryWithTriggeredMemory:(id)a3 withConfiguration:(id)a4 progressReporter:(id)a5
{
  id v8 = a3;
  id v9 = [(PGEnrichedMemoryFactory *)self enrichedMemoryWithTriggeredMemory:v8 withConfiguration:a4 progressReporter:a5 debug:1];
  if (!v9)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)os_signpost_id_t v12 = 0;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGEnrichedMemoryFactory] A non nil enrichedMemory with a failure reason should be specified when enriching triggered memory if debug = YES", v12, 2u);
    }
    id v9 = [[PGEnrichedMemory alloc] initWithTriggeredMemory:v8];
    [(PGEnrichedMemory *)v9 setFailureReason:1];
  }

  return v9;
}

- (id)_memoryEnricherFromTriggeredMemory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[PGMemoryGenerator alloc] initWithMemoryCurationSession:self->_memoryCurationSession loggingConnection:self->_loggingConnection];
  uint64_t v6 = [v4 memoryCategory];
  if (v6 > 200)
  {
    if ((unint64_t)(v6 - 201) < 0x15 || (unint64_t)(v6 - 301) < 2 || v6 == 401)
    {
LABEL_5:
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        id v9 = loggingConnection;
        int v12 = 134217984;
        uint64_t v13 = [v4 memoryCategory];
        _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "+[PGEnrichedMemoryFactory memoryGeneratorClassFromTriggeredMemory:] is not compatible with legacy category: %lu", (uint8_t *)&v12, 0xCu);
      }
      uint64_t v5 = 0;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        uint64_t v7 = PGSingleMomentMemoryGenerator;
        goto LABEL_38;
      case 2:
      case 5:
      case 11:
        goto LABEL_5;
      case 3:
        uint64_t v7 = PGPersonMemoryGenerator;
        goto LABEL_38;
      case 4:
        uint64_t v7 = PGEarlyMomentsWithPeopleMemoryGenerator;
        goto LABEL_38;
      case 6:
        uint64_t v7 = PGSocialGroupMemoryGenerator;
        goto LABEL_38;
      case 7:
        uint64_t v7 = PGLastMonthAtHomeMemoryGenerator;
        goto LABEL_38;
      case 8:
        uint64_t v7 = PGYearInReviewMemoryGenerator;
        goto LABEL_38;
      case 9:
        uint64_t v7 = PGFoodieMemoryGenerator;
        goto LABEL_38;
      case 10:
        uint64_t v7 = PGMyPetMemoryGenerator;
        goto LABEL_38;
      case 12:
        uint64_t v7 = PGPlaceLocationMemoryGenerator;
        goto LABEL_38;
      case 13:
        uint64_t v7 = PGPlaceRegionMemoryGenerator;
        goto LABEL_38;
      case 14:
        uint64_t v7 = PGPlaceAreaMemoryGenerator;
        goto LABEL_38;
      case 15:
      case 22:
        break;
      case 16:
        uint64_t v7 = PGMeaningfulEventMemoryGenerator;
        goto LABEL_38;
      case 17:
        uint64_t v7 = PGMeaningAggregationMemoryGenerator;
        goto LABEL_38;
      case 18:
        uint64_t v7 = PGRecurrentTripMemoryGenerator;
        goto LABEL_38;
      case 19:
        uint64_t v7 = PGTripMemoryGenerator;
        goto LABEL_38;
      case 20:
        uint64_t v7 = PGPastSupersetMemoryGenerator;
        goto LABEL_38;
      case 21:
        uint64_t v7 = PGSeasonMemoryGenerator;
        goto LABEL_38;
      case 23:
        uint64_t v7 = PGDayInHistoryAggregationMemoryGenerator;
        goto LABEL_38;
      case 24:
        uint64_t v7 = PGRecentHighlightsMemoryGenerator;
        goto LABEL_38;
      case 25:
        uint64_t v7 = PGChildActivityMemoryGenerator;
        goto LABEL_38;
      case 26:
        uint64_t v7 = PGExcitingMomentsMemoryGenerator;
        goto LABEL_38;
      case 27:
        uint64_t v7 = PGTrendsMemoryGenerator;
        goto LABEL_38;
      case 28:
        uint64_t v7 = PGMyPetOutdoorMemoryGenerator;
        goto LABEL_38;
      case 29:
        uint64_t v7 = PGChildAndPersonMemoryGenerator;
        goto LABEL_38;
      case 30:
        uint64_t v7 = PGChildOutdoorMemoryGenerator;
        goto LABEL_38;
      case 31:
        uint64_t v7 = PGOngoingTripMemoryGenerator;
LABEL_38:
        uint64_t v10 = [[v7 alloc] initWithMemoryCurationSession:self->_memoryCurationSession loggingConnection:self->_loggingConnection];

        uint64_t v5 = (PGMemoryGenerator *)v10;
        break;
      default:
        if ((unint64_t)(v6 - 101) < 2) {
          goto LABEL_5;
        }
        break;
    }
  }

  return v5;
}

- (PGEnrichedMemoryFactory)initWithMemoryCurationSession:(id)a3 graph:(id)a4 serviceManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PGEnrichedMemoryFactory;
  int v12 = [(PGEnrichedMemoryFactory *)&v20 init];
  if (v12)
  {
    os_log_t v13 = os_log_create("com.apple.PhotosGraph", "EnrichedMemoryFactory");
    loggingConnection = v12->_loggingConnection;
    v12->_loggingConnection = (OS_os_log *)v13;

    objc_storeStrong((id *)&v12->_memoryCurationSession, a3);
    id v15 = objc_alloc_init(PGMoodKeywordComputer);
    moodKeywordComputer = v12->_moodKeywordComputer;
    v12->_moodKeywordComputer = v15;

    os_signpost_id_t v17 = [[PGTitleGenerationContext alloc] initWithGraph:v10 serviceManager:v11];
    titleGenerationContext = v12->_titleGenerationContext;
    v12->_titleGenerationContext = v17;

    objc_storeStrong((id *)&v12->_graph, a4);
  }

  return v12;
}

@end