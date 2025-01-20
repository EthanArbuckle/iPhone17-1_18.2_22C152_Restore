@interface PGMemoryFeatureBlocking
+ (id)_bestAddressNodeAsCollectionInMomentNodeAsCollection:(id)a3;
+ (id)_momentNodesWithBlockedFeatureInGraph:(id)a3 areaNamesWithNegativeFeedback:(id)a4 holidayNamesWithNegativeFeedback:(id)a5 datesWithNegativeFeedback:(id)a6 personUUIDsWithNegativeFeedback:(id)a7 locationsWithNegativeFeedback:(id)a8 loggingConnection:(id)a9 progressReporter:(id)a10;
+ (id)_prominentPersonNodeAsCollectionInMomentNodeAsCollection:(id)a3 withPersonNodes:(id)a4 maximumNumberOfPersonsAllowed:(unint64_t)a5 minimumPresenceThreshold:(double)a6 maximumOthersPresenceThreshold:(double)a7;
+ (id)blockableFeaturesForFeatureNodes:(id)a3 momentNodes:(id)a4 memoryCategory:(unint64_t)a5;
+ (id)momentNodesWithBlockedFeatureInGraph:(id)a3 userFeedbackCalculator:(id)a4 loggingConnection:(id)a5 progressReporter:(id)a6;
@end

@implementation PGMemoryFeatureBlocking

+ (id)_momentNodesWithBlockedFeatureInGraph:(id)a3 areaNamesWithNegativeFeedback:(id)a4 holidayNamesWithNegativeFeedback:(id)a5 datesWithNegativeFeedback:(id)a6 personUUIDsWithNegativeFeedback:(id)a7 locationsWithNegativeFeedback:(id)a8 loggingConnection:(id)a9 progressReporter:(id)a10
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v86 = a4;
  id v85 = a5;
  id v84 = a6;
  id v83 = a7;
  id v81 = a8;
  id v16 = a9;
  id v17 = a10;
  v18 = v16;
  os_signpost_id_t v19 = os_signpost_id_generate(v18);
  v20 = v18;
  v21 = v20;
  unint64_t v79 = v19 - 1;
  os_signpost_id_t spid = v19;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "MomentNodesWithBlockedFeature", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v78 = mach_absolute_time();
  *(void *)buf = 0;
  v103 = buf;
  uint64_t v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__50095;
  v106 = __Block_byref_object_dispose__50096;
  v107 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithGraph:v15];
  id v22 = v17;
  id v82 = *((id *)v103 + 5);
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  char v101 = 0;
  if ([v86 count])
  {
    v23 = +[PGGraphAreaNodeCollection areaNodesForNames:v86 inGraph:v15];
    v24 = (void *)*((void *)v103 + 5);
    v25 = [v23 addressNodes];
    v26 = [v25 momentNodes];
    uint64_t v27 = [v24 collectionByFormingUnionWith:v26];
    v28 = (void *)*((void *)v103 + 5);
    *((void *)v103 + 5) = v27;
  }
  if (*((unsigned char *)v99 + 24))
  {
    *((unsigned char *)v99 + 24) = 1;
LABEL_9:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
LABEL_12:
      v31 = v82;
      id v32 = v82;
      goto LABEL_13;
    }
    *(_DWORD *)v113 = 67109378;
    *(_DWORD *)&v113[4] = 254;
    *(_WORD *)&v113[8] = 2080;
    *(void *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Conveniences/PGMemoryFeatureBlocking.m";
    v30 = MEMORY[0x1E4F14500];
LABEL_11:
    _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v113, 0x12u);
    goto LABEL_12;
  }
  char v29 = [v22 isCancelledWithProgress:0.2];
  *((unsigned char *)v99 + 24) = v29;
  if (v29) {
    goto LABEL_9;
  }
  if ([v85 count])
  {
    v34 = [v85 allObjects];
    v35 = +[PGGraphHolidayNodeCollection holidayNodesWithNames:v34 inGraph:v15];

    v36 = (void *)*((void *)v103 + 5);
    v37 = [v35 dateNodes];
    v38 = [v37 momentNodes];
    uint64_t v39 = [v36 collectionByFormingUnionWith:v38];
    v40 = (void *)*((void *)v103 + 5);
    *((void *)v103 + 5) = v39;
  }
  if (*((unsigned char *)v99 + 24))
  {
    *((unsigned char *)v99 + 24) = 1;
LABEL_21:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)v113 = 67109378;
    *(_DWORD *)&v113[4] = 261;
    *(_WORD *)&v113[8] = 2080;
    *(void *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Conveniences/PGMemoryFeatureBlocking.m";
    v30 = MEMORY[0x1E4F14500];
    goto LABEL_11;
  }
  char v41 = [v22 isCancelledWithProgress:0.4];
  *((unsigned char *)v99 + 24) = v41;
  if (v41) {
    goto LABEL_21;
  }
  if ([v84 count])
  {
    v42 = [v84 allObjects];
    v43 = +[PGGraphDateNodeCollection dateNodesForLocalDates:v42 inGraph:v15];

    v44 = (void *)*((void *)v103 + 5);
    v45 = [v43 momentNodes];
    uint64_t v46 = [v44 collectionByFormingUnionWith:v45];
    v47 = (void *)*((void *)v103 + 5);
    *((void *)v103 + 5) = v46;
  }
  if (*((unsigned char *)v99 + 24))
  {
    *((unsigned char *)v99 + 24) = 1;
LABEL_28:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)v113 = 67109378;
    *(_DWORD *)&v113[4] = 268;
    *(_WORD *)&v113[8] = 2080;
    *(void *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Conveniences/PGMemoryFeatureBlocking.m";
    v30 = MEMORY[0x1E4F14500];
    goto LABEL_11;
  }
  char v48 = [v22 isCancelledWithProgress:0.5];
  *((unsigned char *)v99 + 24) = v48;
  if (v48) {
    goto LABEL_28;
  }
  if ([v83 count])
  {
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v50 = v83;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v94 objects:v115 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v95 != v52) {
            objc_enumerationMutation(v50);
          }
          v54 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:*(void *)(*((void *)&v94 + 1) + 8 * i)];
          [v49 addObject:v54];
        }
        uint64_t v51 = [v50 countByEnumeratingWithState:&v94 objects:v115 count:16];
      }
      while (v51);
    }

    v55 = +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:v49 inGraph:v15];
    v56 = +[PGGraphNodeCollection nodesInGraph:v15];
    v57 = (void *)MEMORY[0x1E4F71E88];
    v58 = +[PGGraphMomentNode personInMoment];
    v59 = [v57 adjacencyWithSources:v56 relation:v58 targetsClass:objc_opt_class()];

    if (*((unsigned char *)v99 + 24))
    {
      *((unsigned char *)v99 + 24) = 1;
LABEL_41:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v113 = 67109378;
        *(_DWORD *)&v113[4] = 281;
        *(_WORD *)&v113[8] = 2080;
        *(void *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/Conveniences/PGMemoryFeatureBlocking.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v113, 0x12u);
      }
      id v61 = v82;
LABEL_44:

      v31 = v82;
      id v32 = v82;
      goto LABEL_13;
    }
    char v60 = [v22 isCancelledWithProgress:0.6];
    *((unsigned char *)v99 + 24) = v60;
    if (v60) {
      goto LABEL_41;
    }
    unint64_t v62 = [v59 sourcesCount];
    if (v62)
    {
      *(void *)v113 = 0;
      *(void *)&v113[8] = v113;
      *(void *)&v113[16] = 0x2020000000;
      uint64_t v114 = 0x3FE3333333333333;
      double v63 = 0.2 / (double)v62;
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __251__PGMemoryFeatureBlocking__momentNodesWithBlockedFeatureInGraph_areaNamesWithNegativeFeedback_holidayNamesWithNegativeFeedback_datesWithNegativeFeedback_personUUIDsWithNegativeFeedback_locationsWithNegativeFeedback_loggingConnection_progressReporter___block_invoke;
      v87[3] = &unk_1E68EB1E8;
      id v88 = v55;
      v90 = buf;
      v91 = v113;
      double v93 = v63;
      v92 = &v98;
      id v89 = v22;
      [v59 enumerateTargetsBySourceWithBlock:v87];
      if (*((unsigned char *)v99 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v109 = 67109378;
          int v110 = 294;
          __int16 v111 = 2080;
          v112 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memor"
                 "ies/Conveniences/PGMemoryFeatureBlocking.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v109, 0x12u);
        }
        id v64 = v82;

        _Block_object_dispose(v113, 8);
        goto LABEL_44;
      }

      _Block_object_dispose(v113, 8);
    }
  }
  v65 = +[PGGraphAddressNodeCollection addressNodesWithinDistance:v81 ofLocations:v15 inGraph:100.0];
  v66 = (void *)*((void *)v103 + 5);
  v67 = [v65 momentNodes];
  uint64_t v68 = [v66 collectionByFormingUnionWith:v67];
  v69 = (void *)*((void *)v103 + 5);
  *((void *)v103 + 5) = v68;

  if (*((unsigned char *)v99 + 24))
  {
    *((unsigned char *)v99 + 24) = 1;
  }
  else
  {
    char v70 = [v22 isCancelledWithProgress:1.0];
    *((unsigned char *)v99 + 24) = v70;
    if ((v70 & 1) == 0)
    {
      uint64_t v73 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v76 = v21;
      v77 = v76;
      if (v79 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
      {
        *(_WORD *)v113 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v77, OS_SIGNPOST_INTERVAL_END, spid, "MomentNodesWithBlockedFeature", "", v113, 2u);
      }

      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v113 = 136315394;
        *(void *)&v113[4] = "MomentNodesWithBlockedFeature";
        *(_WORD *)&v113[12] = 2048;
        *(double *)&v113[14] = (float)((float)((float)((float)(v73 - v78) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v77, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v113, 0x16u);
      }
      v72 = (void *)*((void *)v103 + 5);
      goto LABEL_63;
    }
  }
  BOOL v71 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  v72 = v82;
  if (v71)
  {
    *(_DWORD *)v113 = 67109378;
    *(_DWORD *)&v113[4] = 301;
    *(_WORD *)&v113[8] = 2080;
    *(void *)&v113[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/Conveniences/PGMemoryFeatureBlocking.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v113, 0x12u);
    v72 = v82;
  }
LABEL_63:
  id v32 = v72;

  v31 = v82;
LABEL_13:
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(buf, 8);
  return v32;
}

void __251__PGMemoryFeatureBlocking__momentNodesWithBlockedFeatureInGraph_areaNamesWithNegativeFeedback_holidayNamesWithNegativeFeedback_datesWithNegativeFeedback_personUUIDsWithNegativeFeedback_locationsWithNegativeFeedback_loggingConnection_progressReporter___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  v6 = +[PGMemoryFeatureBlocking _prominentPersonNodeAsCollectionInMomentNodeAsCollection:withPersonNodes:maximumNumberOfPersonsAllowed:minimumPresenceThreshold:maximumOthersPresenceThreshold:](PGMemoryFeatureBlocking, "_prominentPersonNodeAsCollectionInMomentNodeAsCollection:withPersonNodes:maximumNumberOfPersonsAllowed:minimumPresenceThreshold:maximumOthersPresenceThreshold:", 0.45, 0.15);
  if (v6 && [*(id *)(a1 + 32) intersectsCollection:v6])
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) collectionByFormingUnionWith:v12];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    char v11 = 1;
  }
  else
  {
    char v11 = [*(id *)(a1 + 40) isCancelledWithProgress:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  }
  *(unsigned char *)(v10 + 24) = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *a4 = 1;
  }
}

+ (id)momentNodesWithBlockedFeatureInGraph:(id)a3 userFeedbackCalculator:(id)a4 loggingConnection:(id)a5 progressReporter:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v12 dataCache];
  id v15 = [v14 areaNamesWithNegativeFeedback];
  id v16 = [v14 holidayNamesWithNegativeFeedback];
  id v17 = [v14 datesWithNegativeFeedback];
  v18 = [v12 personUUIDsWithNegativeFeedback];

  os_signpost_id_t v19 = [v14 locationsWithNegativeFeedback];
  v20 = [a1 _momentNodesWithBlockedFeatureInGraph:v13 areaNamesWithNegativeFeedback:v15 holidayNamesWithNegativeFeedback:v16 datesWithNegativeFeedback:v17 personUUIDsWithNegativeFeedback:v18 locationsWithNegativeFeedback:v19 loggingConnection:v11 progressReporter:v10];

  return v20;
}

+ (id)_prominentPersonNodeAsCollectionInMomentNodeAsCollection:(id)a3 withPersonNodes:(id)a4 maximumNumberOfPersonsAllowed:(unint64_t)a5 minimumPresenceThreshold:(double)a6 maximumOthersPresenceThreshold:(double)a7
{
  id v11 = a3;
  id v12 = a4;
  unint64_t v13 = [v12 count];
  if (v13)
  {
    v14 = 0;
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__50095;
    v28 = __Block_byref_object_dispose__50096;
    id v29 = 0;
    if (v13 <= a5)
    {
      uint64_t v15 = [v11 numberOfAssets];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __186__PGMemoryFeatureBlocking__prominentPersonNodeAsCollectionInMomentNodeAsCollection_withPersonNodes_maximumNumberOfPersonsAllowed_minimumPresenceThreshold_maximumOthersPresenceThreshold___block_invoke;
      v18[3] = &unk_1E68EB1C0;
      id v19 = v11;
      v20 = &v24;
      uint64_t v21 = v15;
      double v22 = a6;
      double v23 = a7;
      [v12 enumerateIdentifiersAsCollectionsWithBlock:v18];

      v14 = (void *)v25[5];
    }
    id v16 = v14;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void __186__PGMemoryFeatureBlocking__prominentPersonNodeAsCollectionInMomentNodeAsCollection_withPersonNodes_maximumNumberOfPersonsAllowed_minimumPresenceThreshold_maximumOthersPresenceThreshold___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  uint64_t v7 = +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPersonPresentEdgeCollection, "edgesFromNodes:toNodes:");
  uint64_t v8 = [v7 anyEdge];

  double v9 = (double)(unint64_t)[v8 numberOfAssets] / (double)*(unint64_t *)(a1 + 48);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v13 = *(void **)(v10 + 40);
  id v11 = (id *)(v10 + 40);
  id v12 = v13;
  if (v13 || v9 < *(double *)(a1 + 56))
  {
    if (v9 > *(double *)(a1 + 64))
    {
      *id v11 = 0;

      *a4 = 1;
    }
  }
  else
  {
    objc_storeStrong(v11, a3);
  }
}

+ (id)_bestAddressNodeAsCollectionInMomentNodeAsCollection:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__50095;
  id v17 = __Block_byref_object_dispose__50096;
  id v18 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v4 = [v3 preciseAddressNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PGMemoryFeatureBlocking__bestAddressNodeAsCollectionInMomentNodeAsCollection___block_invoke;
  v8[3] = &unk_1E68EB198;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = v12;
  id v11 = &v13;
  [v4 enumerateIdentifiersAsCollectionsWithBlock:v8];
  id v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void __80__PGMemoryFeatureBlocking__bestAddressNodeAsCollectionInMomentNodeAsCollection___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v5 = +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:toNodes:", a1[4]);
  id v6 = [v5 anyEdge];
  [v6 relevance];
  double v8 = v7;

  if (v8 >= 0.8)
  {
    uint64_t v9 = *(void *)(a1[5] + 8);
    if (v8 > *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    }
  }
}

+ (id)blockableFeaturesForFeatureNodes:(id)a3 momentNodes:(id)a4 memoryCategory:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [a1 _blockableHolidayFeatureForFeatureNodes:v8 momentNodes:v9];
  if (v11) {
    [v10 addObject:v11];
  }
  id v12 = [a1 _blockableDateFeatureForFeatureNodes:v8 momentNodes:v9];
  if (v12)
  {
    [v10 addObject:v12];
  }
  else
  {
    uint64_t v13 = [a1 _blockableDateIntervalFeatureForFeatureNodes:v8 momentNodes:v9 memoryCategory:a5];
    if (v13) {
      [v10 addObject:v13];
    }
  }
  id v14 = [a1 _blockableLocationFeatureForFeatureNodes:v8 momentNodes:v9];
  if (v14) {
    [v10 addObject:v14];
  }
  uint64_t v15 = [a1 _blockablePersonFeatureForFeatureNodes:v8 momentNodes:v9];
  if (v15) {
    [v10 addObject:v15];
  }

  return v10;
}

@end