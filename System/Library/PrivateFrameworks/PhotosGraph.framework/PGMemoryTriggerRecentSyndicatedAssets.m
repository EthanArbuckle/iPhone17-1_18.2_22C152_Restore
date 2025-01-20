@interface PGMemoryTriggerRecentSyndicatedAssets
- (BOOL)supportsFutureLookup;
- (PGMemoryTriggerRecentSyndicatedAssets)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 momentNodesWithBlockedFeatureCache:(id)a5;
- (id)relevantFeatureNodesInFeatureNodes:(id)a3;
- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5;
- (unint64_t)triggerType;
@end

@implementation PGMemoryTriggerRecentSyndicatedAssets

- (void).cxx_destruct
{
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  int v11 = [v10 isCancelledWithProgress:0.0];
  *((unsigned char *)v76 + 24) = v11;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v81 = 56;
      *(_WORD *)&v81[4] = 2080;
      *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
      v12 = MEMORY[0x1E4F14500];
LABEL_29:
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  v13 = [(PGPhotoKitMemoryTrigger *)self photoLibrary];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    v36 = [(PGMemoryTrigger *)self loggingConnection];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v36, OS_LOG_TYPE_ERROR, "[PGMemoryTriggerRecentSyndicatedAssets]: Trigger not available without a photo library.", buf, 2u);
    }

    if (*((unsigned char *)v76 + 24))
    {
      *((unsigned char *)v76 + 24) = 1;
    }
    else
    {
      char v39 = [v10 isCancelledWithProgress:1.0];
      *((unsigned char *)v76 + 24) = v39;
      if ((v39 & 1) == 0) {
        goto LABEL_30;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v81 = 59;
      *(_WORD *)&v81[4] = 2080;
      *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
      v12 = MEMORY[0x1E4F14500];
      goto LABEL_29;
    }
LABEL_30:
    v35 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_58;
  }
  v62 = [v8 localDate];
  v15 = (void *)MEMORY[0x1E4F76C68];
  v16 = [v8 timeZone];
  v63 = [v15 universalDateFromLocalDate:v62 inTimeZone:v16];

  v61 = [MEMORY[0x1E4F76C68] dateByAddingDays:-7 toDate:v63];
  v17 = [(PGPhotoKitMemoryTrigger *)self photoLibrary];
  v18 = [v17 librarySpecificFetchOptions];

  v60 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
  v59 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated > %@ && dateCreated <= %@", v61, v63];
  v19 = (void *)MEMORY[0x1E4F28BA0];
  v79[0] = v60;
  v79[1] = v59;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  v21 = [v19 andPredicateWithSubpredicates:v20];
  [v18 setInternalPredicate:v21];

  [v18 setIncludeGuestAssets:1];
  v22 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v18];
  uint64_t v23 = [v22 count];
  if (v23)
  {
    v24 = [(PGMemoryTrigger *)self loggingConnection];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v81 = v23;
      _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[PGMemoryTriggerRecentSyndicatedAssets]: Found %tu recent guest", buf, 0xCu);
    }

    v25 = [(PGPhotoKitMemoryTrigger *)self photoLibrary];
    v58 = [v25 librarySpecificFetchOptions];

    v55 = [MEMORY[0x1E4F391A0] fetchMomentUUIDByAssetUUIDForAssets:v22 options:v58];
    v57 = [v55 allValues];
    if ([v57 count])
    {
      v56 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v57 inGraph:v9];
      if ([v56 count])
      {
        v26 = [MEMORY[0x1E4F28E60] indexSetWithIndex:1];
        [v26 addIndex:19];
        [v26 addIndex:16];
        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v28 = (void *)MEMORY[0x1E4F71E88];
        v29 = +[PGGraphMomentNode memoryOfMoment];
        v30 = [v28 adjacencyWithSources:v56 relation:v29 targetsClass:objc_opt_class()];

        v31 = (void *)MEMORY[0x1E4F71F08];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
        v72[3] = &unk_1E68EBE50;
        v74 = &v75;
        id v52 = v10;
        id v73 = v52;
        v32 = [v31 progressReporterWithProgressBlock:v72];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
        v64[3] = &unk_1E68E9518;
        id v54 = v30;
        id v65 = v54;
        id v53 = v26;
        id v66 = v53;
        v67 = self;
        id v68 = v9;
        id v33 = v32;
        id v69 = v33;
        v71 = &v75;
        id v34 = v27;
        id v70 = v34;
        [v56 enumerateIdentifiersAsCollectionsWithBlock:v64];
        if (*((unsigned char *)v76 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v81 = 161;
            *(_WORD *)&v81[4] = 2080;
            *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v35 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_54;
        }
        v51 = [MEMORY[0x1E4F76C68] dateByAddingDays:5 toDate:v62];
        v42 = objc_opt_class();
        v43 = [v8 timeZone];
        v44 = [v42 validityIntervalForLocalStartDate:v62 localEndDate:v51 timeZone:v43];

        if (*((unsigned char *)v76 + 24))
        {
          *((unsigned char *)v76 + 24) = 1;
        }
        else
        {
          char v47 = [v52 isCancelledWithProgress:1.0];
          *((unsigned char *)v76 + 24) = v47;
          if ((v47 & 1) == 0)
          {
            v49 = objc_opt_class();
            v50 = [v34 allObjects];
            v35 = [v49 memoryTriggerResultsForMemoryNodesArray:v50 withValidityInterval:v44];

LABEL_53:
LABEL_54:

            goto LABEL_55;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v81 = 165;
          *(_WORD *)&v81[4] = 2080;
          *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v35 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_53;
      }
      v40 = [(PGMemoryTrigger *)self loggingConnection];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v81 = v57;
        _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: Couldn't find moment node for moment UUIDs: %@", buf, 0xCu);
      }

      if (*((unsigned char *)v76 + 24))
      {
        *((unsigned char *)v76 + 24) = 1;
      }
      else
      {
        char v46 = [v10 isCancelledWithProgress:1.0];
        *((unsigned char *)v76 + 24) = v46;
        if ((v46 & 1) == 0)
        {
LABEL_48:
          v35 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_55:

          goto LABEL_56;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v81 = 103;
        *(_WORD *)&v81[4] = 2080;
        *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_48;
    }
    v38 = [(PGMemoryTrigger *)self loggingConnection];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v38, OS_LOG_TYPE_ERROR, "[PGMemoryTriggerRecentSyndicatedAssets]: Cannot find moments featuring the guest assets available", buf, 2u);
    }

    if (*((unsigned char *)v76 + 24))
    {
      *((unsigned char *)v76 + 24) = 1;
    }
    else
    {
      char v45 = [v10 isCancelledWithProgress:1.0];
      *((unsigned char *)v76 + 24) = v45;
      if ((v45 & 1) == 0)
      {
LABEL_44:
        v35 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_56:

        goto LABEL_57;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v81 = 94;
      *(_WORD *)&v81[4] = 2080;
      *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_44;
  }
  v37 = [(PGMemoryTrigger *)self loggingConnection];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: No recent guest assets available", buf, 2u);
  }

  if (*((unsigned char *)v76 + 24))
  {
    *((unsigned char *)v76 + 24) = 1;
    goto LABEL_36;
  }
  char v41 = [v10 isCancelledWithProgress:1.0];
  *((unsigned char *)v76 + 24) = v41;
  if (v41)
  {
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v81 = 79;
      *(_WORD *)&v81[4] = 2080;
      *(void *)&v81[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  v35 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_57:

LABEL_58:
  _Block_object_dispose(&v75, 8);

  return v35;
}

uint64_t __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:0.5];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v4 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

void __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) targetsForSources:v6];
  id v8 = [v7 subsetWithMemoryCategories:*(void *)(a1 + 40)];

  if (![(PGGraphMemory *)v8 count])
  {
    int v11 = [v6 momentNodesWithMinimumNumberOfExtendedCuratedAssets:13];
    if ([v11 count])
    {
      v13 = [v11 interestingWithAlternateJunkingSubset];

      if (![v13 count])
      {
        v12 = [*(id *)(a1 + 48) loggingConnection];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v19 = [v6 anyNode];
          int v29 = 138412290;
          v30 = v19;
          _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "[PGMemoryTriggerRecentSyndicatedAssets]: interestingWithAlternateJunking failed for moment %@", (uint8_t *)&v29, 0xCu);
        }
        int v11 = v13;
        goto LABEL_18;
      }
      int v11 = [v13 subsetWithEnoughScenesProcessed];

      uint64_t v14 = [v11 count];
      v15 = *(id **)(a1 + 48);
      if (v14)
      {
        v16 = [v15[3] momentNodesWithBlockedFeatureInGraph:*(void *)(a1 + 56) progressReporter:*(void *)(a1 + 64)];
        v12 = v16;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_18;
        }
        if (![v16 containsCollection:v6])
        {
          v21 = [v6 featureNodeCollection];
          v22 = [v6 dateNodes];
          uint64_t v23 = [v22 monthDayNodes];
          v24 = [v23 featureNodeCollection];
          v25 = [v21 collectionByFormingUnionWith:v24];

          v26 = [[PGGraphMemory alloc] initWithMemoryCategory:1 memoryCategorySubcategory:1001 momentNodes:v11 featureNodes:v25];
          [*(id *)(a1 + 72) addObject:v26];
          id v27 = [*(id *)(a1 + 48) loggingConnection];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v6 anyNode];
            int v29 = 138412546;
            v30 = v26;
            __int16 v31 = 2112;
            v32 = v28;
            _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: Created Memory %@ for %@", (uint8_t *)&v29, 0x16u);
          }
          goto LABEL_18;
        }
        v17 = [*(id *)(a1 + 48) loggingConnection];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v20 = [v6 anyNode];
          int v29 = 138412290;
          v30 = v20;
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[PGMemoryTriggerRecentSyndicatedAssets]: Moment has blocked feature %@", (uint8_t *)&v29, 0xCu);
        }
LABEL_17:

        goto LABEL_18;
      }
      v12 = [v15 loggingConnection];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      v17 = [v6 anyNode];
      int v29 = 138412290;
      v30 = (PGGraphMemory *)v17;
      v18 = "[PGMemoryTriggerRecentSyndicatedAssets]: Not enough scene processed assets for moment %@";
    }
    else
    {
      v12 = [*(id *)(a1 + 48) loggingConnection];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      v17 = [v6 anyNode];
      int v29 = 138412290;
      v30 = (PGGraphMemory *)v17;
      v18 = "[PGMemoryTriggerRecentSyndicatedAssets]: Not enough assets for moment %@";
    }
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v29, 0xCu);
    goto LABEL_17;
  }
  id v9 = *(void **)(a1 + 72);
  id v10 = [(PGGraphMemory *)v8 set];
  [v9 unionSet:v10];

  int v11 = [*(id *)(a1 + 48) loggingConnection];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v6 anyNode];
    int v29 = 138412546;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: Found Memories %@ for %@", (uint8_t *)&v29, 0x16u);
LABEL_18:
  }
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return a3;
}

- (unint64_t)triggerType
{
  return 18;
}

- (BOOL)supportsFutureLookup
{
  return 0;
}

- (PGMemoryTriggerRecentSyndicatedAssets)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 momentNodesWithBlockedFeatureCache:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGMemoryTriggerRecentSyndicatedAssets;
  id v10 = [(PGPhotoKitMemoryTrigger *)&v13 initWithLoggingConnection:a3 photoLibrary:a4];
  int v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_momentNodesWithBlockedFeatureCache, a5);
  }

  return v11;
}

@end