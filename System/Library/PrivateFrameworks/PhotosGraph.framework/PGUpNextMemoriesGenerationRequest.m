@interface PGUpNextMemoriesGenerationRequest
+ (id)_baseMemoryFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)_memoryNodesWithSignificantOverlapWithMomentNodes:(id)a3;
+ (id)_requestErrorWithCode:(int64_t)a3 description:(id)a4;
+ (id)requestWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)wantsVerboseDebugInfo;
- (NSArray)customVectors;
- (NSArray)momentUUIDs;
- (NSSet)memoryLocalIdentifiersToAvoid;
- (NSString)rootMemoryLocalIdentifier;
- (PGUpNextMemoriesGenerationRequest)initWithRootMemoryLocalIdentifier:(id)a3 momentUUIDs:(id)a4 memoryLocalIdentifiersToAvoid:(id)a5 targetUpNextMemoryCount:(unint64_t)a6 customVectors:(id)a7 wantsVerboseDebugInfo:(BOOL)a8 sharingFilter:(unsigned __int16)a9;
- (PGUpNextMemoriesGenerationRequest)initWithRootMemoryLocalIdentifier:(id)a3 momentUUIDs:(id)a4 memoryLocalIdentifiersToAvoid:(id)a5 targetUpNextMemoryCount:(unint64_t)a6 sharingFilter:(unsigned __int16)a7;
- (id)_fetchRootMemoryWithPhotoLibrary:(id)a3;
- (id)_momentUUIDsForMemory:(id)a3;
- (id)fetchMemoryLocalIdentifiersWithWorkingContext:(id)a3 musicCurationOptions:(id)a4 error:(id *)a5;
- (id)localMemoriesByUniqueMemoryIdentifiersWithWorkingContext:(id)a3;
- (id)upNextMemoryLocalIdentifiersWithWorkingContext:(id)a3 rootMemory:(id)a4 localMemoriesByUniqueMemoryIdentifiers:(id)a5 uniqueMemoryIdentifiersOfMemoriesToAvoid:(id)a6 aggregator:(id)a7 debugInfo:(id *)a8 error:(id *)a9;
- (unint64_t)targetUpNextMemoryCount;
- (unsigned)sharingFilter;
- (void)_enumerateMemoriesToAvoidWithWorkingContext:(id)a3 usingBlock:(id)a4;
@end

@implementation PGUpNextMemoriesGenerationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customVectors, 0);
  objc_storeStrong((id *)&self->_memoryLocalIdentifiersToAvoid, 0);
  objc_storeStrong((id *)&self->_momentUUIDs, 0);
  objc_storeStrong((id *)&self->_rootMemoryLocalIdentifier, 0);
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (BOOL)wantsVerboseDebugInfo
{
  return self->_wantsVerboseDebugInfo;
}

- (NSArray)customVectors
{
  return self->_customVectors;
}

- (unint64_t)targetUpNextMemoryCount
{
  return self->_targetUpNextMemoryCount;
}

- (NSSet)memoryLocalIdentifiersToAvoid
{
  return self->_memoryLocalIdentifiersToAvoid;
}

- (NSArray)momentUUIDs
{
  return self->_momentUUIDs;
}

- (NSString)rootMemoryLocalIdentifier
{
  return self->_rootMemoryLocalIdentifier;
}

- (id)_momentUUIDsForMemory:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v5 = (void *)MEMORY[0x1E4F38EE8];
  v6 = [v4 librarySpecificFetchOptions];
  v7 = [v5 fetchMomentsBackingMemory:v3 options:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v7 objectAtIndexedSubscript:v9];
      v11 = [v10 uuid];
      [v8 addObject:v11];

      ++v9;
    }
    while (v9 < [v7 count]);
  }

  return v8;
}

- (id)_fetchRootMemoryWithPhotoLibrary:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() _baseMemoryFetchOptionsWithPhotoLibrary:v4];

  v6 = (void *)MEMORY[0x1E4F38EE8];
  v11[0] = self->_rootMemoryLocalIdentifier;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v8 = [v6 fetchAssetCollectionsWithLocalIdentifiers:v7 options:v5];

  unint64_t v9 = [v8 firstObject];

  return v9;
}

- (void)_enumerateMemoriesToAvoidWithWorkingContext:(id)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = objc_opt_class();
  unint64_t v9 = [v6 photoLibrary];
  v10 = [v8 _baseMemoryFetchOptionsWithPhotoLibrary:v9];

  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier IN %@", self->_memoryLocalIdentifiersToAvoid];
  [v10 setPredicate:v11];

  v12 = [MEMORY[0x1E4F39160] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v10];
  v13 = [v6 loggingConnection];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v12 count];
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[UpNext] Found %lu memories to avoid", buf, 0xCu);
  }

  if ([v12 count])
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [v12 objectAtIndexedSubscript:v14];
      v7[2](v7, v15);

      ++v14;
    }
    while (v14 < [v12 count]);
  }
}

- (id)localMemoriesByUniqueMemoryIdentifiersWithWorkingContext:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  v29 = v4;
  id v6 = [v4 photoLibrary];
  v7 = [v5 _baseMemoryFetchOptionsWithPhotoLibrary:v6];

  objc_msgSend(v7, "setSharingFilter:", -[PGUpNextMemoriesGenerationRequest sharingFilter](self, "sharingFilter"));
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"pendingState", 2);
  objc_msgSend(v8, "addObject:");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D4128];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "unsignedIntegerValue"));
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v11);
  }

  v15 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v8];
  [v7 setPredicate:v15];

  v16 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v7];
  uint64_t v17 = [v29 loggingConnection];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v16 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v18;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_DEFAULT, "[UpNext] Found %lu eligible local memories", buf, 0xCu);
  }

  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v26 = [v25 graphMemoryIdentifier];
        if (v26) {
          [v19 setObject:v25 forKeyedSubscript:v26];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v22);
  }

  return v19;
}

- (id)upNextMemoryLocalIdentifiersWithWorkingContext:(id)a3 rootMemory:(id)a4 localMemoriesByUniqueMemoryIdentifiers:(id)a5 uniqueMemoryIdentifiersOfMemoriesToAvoid:(id)a6 aggregator:(id)a7 debugInfo:(id *)a8 error:(id *)a9
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  v16 = v14;
  id v17 = v15;
  id v44 = a5;
  id v46 = a6;
  id v48 = a7;
  v56 = [v14 photoLibrary];
  uint64_t v18 = [v14 loggingConnection];
  v55 = [v17 title];
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E4F38EB8];
    id v20 = [v56 librarySpecificFetchOptions];
    uint64_t v21 = [v19 fetchKeyCuratedAssetInAssetCollection:v17 referenceAsset:0 options:v20];
    uint64_t v22 = [v21 firstObject];
    v54 = [v22 localIdentifier];
  }
  else
  {
    v54 = 0;
  }
  uint64_t v23 = [v17 graphMemoryIdentifier];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEFAULT, "[UpNext] Up Next RootMemory MemoryNodeUniqueIdentifier:(%@)", (uint8_t *)&buf, 0xCu);
  }
  v24 = self->_momentUUIDs;
  v25 = v24;
  if (v17 && !v24)
  {
    v25 = [(PGUpNextMemoriesGenerationRequest *)self _momentUUIDsForMemory:v17];
  }
  if (a9 && !v25)
  {
    *a9 = [(id)objc_opt_class() _requestErrorWithCode:0 description:@"[UpNext] Neither rootMemory nor starting moments were provided for UpNext generation"];
  }
  v43 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:v56];
  v26 = [(PGUpNextMemoriesGenerationRequest *)self customVectors];
  v27 = objc_alloc_init(_TtC11PhotosGraph24PGUpNextDebugInfoBuilder);
  [(PGUpNextDebugInfoBuilder *)v27 setWantsVerboseDebugInfo:self->_wantsVerboseDebugInfo];
  [(PGUpNextDebugInfoBuilder *)v27 setRootMemoryNodeUniqueIdentifier:v23];
  [(PGUpNextDebugInfoBuilder *)v27 setMomentUUIDs:v25];
  [(PGUpNextDebugInfoBuilder *)v27 setFeatureWeightVectors:v26];
  -[PGUpNextDebugInfoBuilder setRootMemoryIsAggregation:](v27, "setRootMemoryIsAggregation:", (unint64_t)(PGMemorySourceTypeFromCategory([v17 category]) - 3) < 2);
  v28 = [v17 uuid];
  v53 = [v28 substringToIndex:8];

  v52 = [v55 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
  v29 = [v17 subtitle];
  v51 = [v29 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

  v50 = [v54 substringToIndex:8];
  long long v30 = [NSString stringWithFormat:@"Root memory: %@\n\t%@ - %@\n\tkeyAsset: %@", v53, v52, v51, v50];
  [(PGUpNextDebugInfoBuilder *)v27 addSuggestionFilteringLog:v30];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__40063;
  v81 = __Block_byref_object_dispose__40064;
  id v82 = 0;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__40063;
  v76 = __Block_byref_object_dispose__40064;
  id v77 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke;
  v57[3] = &unk_1E68E9ED8;
  uint64_t v42 = v18;
  v58 = v42;
  id v45 = v44;
  id v59 = v45;
  id v47 = v46;
  id v60 = v47;
  id v31 = v23;
  id v61 = v31;
  id v41 = v17;
  id v62 = v41;
  id v32 = v25;
  id v63 = v32;
  long long v33 = v27;
  v64 = v33;
  v65 = self;
  id v34 = v26;
  id v66 = v34;
  id v35 = v56;
  id v67 = v35;
  id v36 = v43;
  id v68 = v36;
  id v37 = v48;
  id v69 = v37;
  p_long long buf = &buf;
  v71 = &v72;
  [v16 performSynchronousConcurrentGraphReadUsingBlock:v57];
  if (a8)
  {
    *a8 = [(PGUpNextDebugInfoBuilder *)v33 debugInfo];
  }
  uint64_t v38 = *((void *)&buf + 1);
  if (a9 && !*(void *)(*((void *)&buf + 1) + 40))
  {
    *a9 = (id) v73[5];
    uint64_t v38 = *((void *)&buf + 1);
  }
  id v39 = *(id *)(v38 + 40);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&buf, 8);

  return v39;
}

void __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v69 = a2;
  id v3 = *(id *)(a1 + 32);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGUpNextMemoriesEligibleMemories", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v65 = mach_absolute_time();
  uint64_t v74 = [v69 graph];
  v7 = [*(id *)(a1 + 40) allKeys];
  id v8 = +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifierArray:v7 inGraph:v74];

  id v68 = +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifiers:*(void *)(a1 + 48) inGraph:v74];
  unint64_t v9 = [v8 collectionBySubtracting:v68];

  uint64_t v10 = +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:v74];
  uint64_t v11 = [v10 highlightNodes];
  uint64_t v12 = [v11 momentNodes];
  v13 = [v12 memoryNodes];

  id v14 = [v13 subsetWithMemoryCategory:1];
  id v15 = [v9 collectionBySubtracting:v14];

  v16 = +[PGMemoryTriggerHandler personMemoryNodesFeaturingMeNodeInGraph:v74];
  id v17 = [v15 collectionBySubtracting:v16];

  uint64_t v18 = *(void *)(a1 + 56);
  if (!v18) {
    goto LABEL_11;
  }
  v19 = +[PGGraphMemoryNodeCollection memoryNodeAsCollectionWithUniqueIdentifier:v18 inGraph:v74];
  if ([v19 count] != 1)
  {

LABEL_11:
    uint64_t v22 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:*(void *)(a1 + 72) inGraph:v74];
    v73 = [[PGUpNextMomentCollectionBasedMatchingInfo alloc] initWithMomentNodes:v22];

    goto LABEL_12;
  }
  uint64_t v20 = [*(id *)(a1 + 64) category];
  uint64_t v21 = off_1E68E3240;
  if (v20 != 27) {
    uint64_t v21 = off_1E68E3238;
  }
  v73 = (PGUpNextMomentCollectionBasedMatchingInfo *)[objc_alloc(*v21) initWithMemoryNodeAsCollection:v19];

  if (!v73) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v23 = [(PGUpNextMomentCollectionBasedMatchingInfo *)v73 debugInfo];
  [*(id *)(a1 + 80) setInputDebugInfo:v23];

  v70 = [(PGUpNextMomentCollectionBasedMatchingInfo *)v73 momentNodes];
  if (v70)
  {
    v24 = [(id)objc_opt_class() _memoryNodesWithSignificantOverlapWithMomentNodes:v70];
    uint64_t v25 = [v17 collectionBySubtracting:v24];

    id v17 = (void *)v25;
  }
  v71 = [v17 subsetWithMemoryCategory:27];
  id v67 = [v17 collectionBySubtracting:v71];

  uint64_t v26 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v29 = v6;
  long long v30 = v29;
  log = v29;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v31 = os_signpost_enabled(v29);
    long long v30 = log;
    if (v31)
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, log, OS_SIGNPOST_INTERVAL_END, v4, "PGUpNextMemoriesEligibleMemories", "", buf, 2u);
      long long v30 = log;
    }
  }

  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "PGUpNextMemoriesEligibleMemories";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v26 - v65) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v32 = *(id *)(a1 + 32);
  os_signpost_id_t v33 = os_signpost_id_generate(v32);
  id v34 = v32;
  id v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PGUpNextMemoriesTargets", "", buf, 2u);
  }

  mach_timebase_info v89 = 0;
  mach_timebase_info(&v89);
  uint64_t v36 = mach_absolute_time();
  id v66 = +[PGUpNextMemoryFeatureBasedMatchingInfo matchingInfosWithMemoryNodes:v71];
  v64 = +[PGUpNextMemoryBasedMatchingInfo matchingInfosWithMemoryNodes:v67];
  id v63 = [v66 arrayByAddingObjectsFromArray:v64];
  id v62 = [[_TtC11PhotosGraph16PGUpNextComputer alloc] initWithTargets:v63];
  uint64_t v37 = mach_absolute_time();
  mach_timebase_info v38 = v89;
  id v39 = v35;
  uint64_t v40 = v39;
  if (v33 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v39))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v40, OS_SIGNPOST_INTERVAL_END, v33, "PGUpNextMemoriesTargets", "", buf, 2u);
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "PGUpNextMemoriesTargets";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v37 - v36) * (float)v38.numer) / (float)v38.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v41 = *(id *)(a1 + 32);
  os_signpost_id_t v42 = os_signpost_id_generate(v41);
  v43 = v41;
  id v44 = v43;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "PGUpNextMemoriesGenerationEnumeration", "", buf, 2u);
  }

  mach_timebase_info v88 = 0;
  mach_timebase_info(&v88);
  uint64_t v61 = mach_absolute_time();
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v96 = 0;
  uint64_t v96 = [*(id *)(a1 + 88) targetUpNextMemoryCount];
  id v46 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  uint64_t v47 = *(void *)(a1 + 96);
  id v87 = 0;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke_303;
  v76[3] = &unk_1E68E9EB0;
  id v48 = v46;
  id v77 = v48;
  id v75 = v74;
  id v78 = v75;
  id v79 = *(id *)(a1 + 80);
  id v80 = *(id *)(a1 + 32);
  id v81 = *(id *)(a1 + 40);
  id v82 = *(id *)(a1 + 104);
  id v83 = *(id *)(a1 + 112);
  id v84 = *(id *)(a1 + 120);
  id v49 = v45;
  id v85 = v49;
  v86 = buf;
  BOOL v50 = [(PGUpNextComputer *)v62 enumerateSuggestionsWith:v73 featureWeightVectors:v47 error:&v87 block:v76];
  id v51 = v87;
  uint64_t v52 = mach_absolute_time();
  mach_timebase_info v53 = v88;
  v54 = v44;
  v55 = v54;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)v91 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v55, OS_SIGNPOST_INTERVAL_END, v42, "PGUpNextMemoriesGenerationEnumeration", "", v91, 2u);
  }

  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v91 = 136315394;
    v92 = "PGUpNextMemoriesGenerationEnumeration";
    __int16 v93 = 2048;
    double v94 = (float)((float)((float)((float)(v52 - v61) * (float)v53.numer) / (float)v53.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v55, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v91, 0x16u);
  }
  uint64_t v56 = 136;
  if (v50)
  {
    uint64_t v56 = 128;
    v57 = v49;
  }
  else
  {
    v57 = v51;
  }
  uint64_t v58 = *(void *)(*(void *)(a1 + v56) + 8);
  id v59 = v57;
  id v60 = *(void **)(v58 + 40);
  *(void *)(v58 + 40) = v59;

  _Block_object_dispose(buf, 8);
}

uint64_t __202__PGUpNextMemoriesGenerationRequest_upNextMemoryLocalIdentifiersWithWorkingContext_rootMemory_localMemoriesByUniqueMemoryIdentifiers_uniqueMemoryIdentifiersOfMemoriesToAvoid_aggregator_debugInfo_error___block_invoke_303(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  if ([*(id *)(a1 + 32) containsIdentifier:a2])
  {
    uint64_t v8 = 0;
  }
  else
  {
    unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
    uint64_t v10 = [(MAElementCollection *)[PGGraphMemoryNodeCollection alloc] initWithGraph:*(void *)(a1 + 40) elementIdentifiers:v9];
    uint64_t v11 = [(PGGraphMemoryNodeCollection *)v10 uniqueMemoryIdentifiers];
    uint64_t v12 = [v11 anyObject];

    if (v12)
    {
      v13 = [*(id *)(a1 + 64) objectForKeyedSubscript:v12];
      if (v13)
      {
        id v14 = [[PGPotentialUpNextMemory alloc] initWithMemory:v13 photoLibrary:*(void *)(a1 + 72) userFeedbackCalculator:*(void *)(a1 + 80)];
        id v15 = *(void **)(a1 + 88);
        id v32 = @"No debug info assigned by aggregator";
        uint64_t v8 = [v15 addUpNextMemory:v14 debugInfo:&v32];
        v16 = v32;
        [*(id *)(a1 + 48) addSuggestionFilteringLog:v16];
        if (v8)
        {
          v29 = a4;
          long long v30 = v16;
          BOOL v31 = v9;
          id v17 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v34 = v7;
            _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[UpNext] Accepted memory debug info: %@", buf, 0xCu);
          }
          [*(id *)(a1 + 48) addSuggestionFilteringLog:v7];
          uint64_t v18 = *(void **)(a1 + 96);
          v19 = [(PGPotentialUpNextMemory *)v13 localIdentifier];
          [v18 addObject:v19];

          uint64_t v20 = [(PGGraphMemoryNodeCollection *)v10 momentNodes];
          uint64_t v21 = +[PGUpNextMemoriesGenerationRequest _memoryNodesWithSignificantOverlapWithMomentNodes:v20];

          uint64_t v22 = *(void **)(a1 + 32);
          uint64_t v23 = [v21 elementIdentifiers];
          [v22 unionWithIdentifierSet:v23];

          if ((uint64_t)--*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) <= 0) {
            unsigned char *v29 = 1;
          }

          v16 = v30;
          unint64_t v9 = v31;
        }
      }
      else
      {
        id v14 = (PGPotentialUpNextMemory *)[[NSString alloc] initWithFormat:@"No local memory found for unique identifier (%@)", v12];
        [*(id *)(a1 + 48) addSuggestionFilteringLog:v14];
        v27 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v34 = v14;
          _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
        }
        uint64_t v8 = 0;
      }
    }
    else
    {
      id v24 = [NSString alloc];
      uint64_t v25 = [NSNumber numberWithUnsignedInteger:a2];
      v13 = (PGPotentialUpNextMemory *)[v24 initWithFormat:@"No unique identifier found for memoryNodeIdentifier (%@)", v25];

      [*(id *)(a1 + 48) addSuggestionFilteringLog:v13];
      uint64_t v26 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v34 = v13;
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
      }
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (id)fetchMemoryLocalIdentifiersWithWorkingContext:(id)a3 musicCurationOptions:(id)a4 error:(id *)a5
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self->_rootMemoryLocalIdentifier;
  uint64_t v11 = self->_memoryLocalIdentifiersToAvoid;
  uint64_t v12 = [v8 loggingConnection];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    id v87 = [(PGUpNextMemoriesGenerationRequest *)self targetUpNextMemoryCount];
    __int16 v88 = 2112;
    double v89 = *(double *)&v10;
    __int16 v90 = 2112;
    v91 = v11;
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEFAULT, "[UpNext] Requesting %lu Up Next memories for memory:(%@), memories to avoid:%@", buf, 0x20u);
  }
  v13 = [v8 loggingConnection];
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  id v15 = v13;
  v16 = v15;
  unint64_t v70 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PGUpNextMemoriesGenerationRequest", "", buf, 2u);
  }
  os_signpost_id_t v68 = v14;
  oslog = v12;
  uint64_t v74 = v16;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v69 = mach_absolute_time();
  id v17 = [v8 loggingConnection];
  os_signpost_id_t v18 = os_signpost_id_generate(v17);
  v19 = v17;
  uint64_t v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PGUpNextMemoriesGenerationSetup", "", buf, 2u);
  }
  id v75 = v20;

  mach_timebase_info v84 = 0;
  mach_timebase_info(&v84);
  uint64_t v21 = mach_absolute_time();
  uint64_t v22 = [v8 photoLibrary];
  if (!v10)
  {
    v76 = 0;
LABEL_14:
    v73 = [(PGUpNextMemoriesGenerationRequest *)self localMemoriesByUniqueMemoryIdentifiersWithWorkingContext:v8];
    if (![v73 count])
    {
      if (a5)
      {
        [(id)objc_opt_class() _requestErrorWithCode:1 description:@"[UpNext] Could not find any local memories"];
        id v24 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v24 = 0;
      }
      uint64_t v25 = oslog;
      uint64_t v26 = v74;
      goto LABEL_58;
    }
    uint64_t v65 = v11;
    id v66 = v10;
    id v67 = v9;
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __110__PGUpNextMemoriesGenerationRequest_fetchMemoryLocalIdentifiersWithWorkingContext_musicCurationOptions_error___block_invoke;
    v80[3] = &unk_1E68E9E88;
    id v29 = v27;
    id v81 = v29;
    v71 = v22;
    id v61 = v22;
    id v82 = v61;
    id v30 = v28;
    id v83 = v30;
    [(PGUpNextMemoriesGenerationRequest *)self _enumerateMemoriesToAvoidWithWorkingContext:v8 usingBlock:v80];
    BOOL v31 = [PGUpNextMemoriesAggregator alloc];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v63 = v30;
    uint64_t v72 = [(PGUpNextMemoriesAggregator *)v31 initWithLowercaseTitles:v32 keyAssetLocalIdentifiers:v30 gateOnUserFeedback:1 loggingConnection:oslog];

    uint64_t v33 = mach_absolute_time();
    uint32_t numer = v84.numer;
    uint32_t denom = v84.denom;
    uint64_t v36 = v75;
    uint64_t v37 = v36;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, v18, "PGUpNextMemoriesGenerationSetup", "", buf, 2u);
    }

    uint64_t v26 = v74;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v87 = "PGUpNextMemoriesGenerationSetup";
      __int16 v88 = 2048;
      double v89 = (float)((float)((float)((float)(v33 - v21) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v79 = 0;
    v64 = v29;
    mach_timebase_info v38 = [(PGUpNextMemoriesGenerationRequest *)self upNextMemoryLocalIdentifiersWithWorkingContext:v8 rootMemory:v76 localMemoriesByUniqueMemoryIdentifiers:v73 uniqueMemoryIdentifiersOfMemoriesToAvoid:v29 aggregator:v72 debugInfo:&v79 error:a5];
    id v62 = v79;
    id v9 = v67;
    if (v38)
    {
      uint64_t v11 = v65;
      uint64_t v10 = v66;
      uint64_t v25 = oslog;
      uint64_t v22 = v71;
      if ([v38 count])
      {
        if ([v67 shouldCurateUpNextMemories])
        {
          id v39 = [v8 loggingConnection];
          os_signpost_id_t v40 = os_signpost_id_generate(v39);
          id v41 = v39;
          os_signpost_id_t v42 = v41;
          unint64_t v43 = v40 - 1;
          if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "PGUpNextMemoriesGenerationMusicCuration", "", buf, 2u);
          }
          os_signpost_id_t spid = v40;

          mach_timebase_info v78 = 0;
          mach_timebase_info(&v78);
          uint64_t v60 = mach_absolute_time();
          id v44 = [[PGUpNextMusicCurator alloc] initWithLoggingConnection:oslog];
          if (![(PGUpNextMusicCurator *)v44 curateMusicForUpNextMemoriesWithLocalIdentifiers:v38 musicCurationOptions:v67 photoLibrary:v61 managerContext:v8 error:a5])
          {
            if (a5)
            {
              id v45 = [*a5 description];
            }
            else
            {
              id v45 = @"no error";
            }
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              id v87 = (const char *)v45;
              __int16 v88 = 2112;
              double v89 = *(double *)&v38;
              _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "[UpNext] Music curation failed (%@) for Up Next memories: %@", buf, 0x16u);
            }
          }
          uint64_t v48 = mach_absolute_time();
          uint32_t v50 = v78.numer;
          uint32_t v49 = v78.denom;
          id v51 = v42;
          uint64_t v52 = v51;
          if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v52, OS_SIGNPOST_INTERVAL_END, spid, "PGUpNextMemoriesGenerationMusicCuration", "", buf, 2u);
          }

          uint64_t v26 = v74;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315394;
            id v87 = "PGUpNextMemoriesGenerationMusicCuration";
            __int16 v88 = 2048;
            double v89 = (float)((float)((float)((float)(v48 - v60) * (float)v50) / (float)v49) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }

          uint64_t v25 = oslog;
        }
        uint64_t v53 = mach_absolute_time();
        uint32_t v55 = info.numer;
        uint32_t v54 = info.denom;
        uint64_t v56 = v26;
        v57 = v56;
        if (v70 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v57, OS_SIGNPOST_INTERVAL_END, v68, "PGUpNextMemoriesGenerationRequest", "", buf, 2u);
        }

        id v46 = v62;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          id v87 = "PGUpNextMemoriesGenerationRequest";
          __int16 v88 = 2048;
          double v89 = (float)((float)((float)((float)(v53 - v69) * (float)v55) / (float)v54) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v87 = v38;
          _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_DEFAULT, "[UpNext] Result Up Next memories: %@", buf, 0xCu);
        }
        id v24 = [[PGUpNextMemoriesGenerationResult alloc] initWithMemoryLocalIdentifiers:v38 debugInfo:v62];
        uint64_t v22 = v71;
        goto LABEL_57;
      }
      if (a5)
      {
        uint64_t v47 = [NSString stringWithFormat:@"[UpNext] Could not find up next memories for memory with local identifier (%@), debug info (%@)", v66, v62];
        *a5 = [(id)objc_opt_class() _requestErrorWithCode:2 description:v47];
        id v46 = v62;
        id v9 = v67;

        uint64_t v22 = v71;
        id v24 = 0;
        goto LABEL_57;
      }
      id v24 = 0;
    }
    else
    {
      id v24 = 0;
      uint64_t v11 = v65;
      uint64_t v10 = v66;
      uint64_t v25 = oslog;
      uint64_t v22 = v71;
    }
    id v46 = v62;
LABEL_57:

LABEL_58:
    goto LABEL_59;
  }
  v76 = [(PGUpNextMemoriesGenerationRequest *)self _fetchRootMemoryWithPhotoLibrary:v22];
  if (v76) {
    goto LABEL_14;
  }
  if (a5)
  {
    uint64_t v23 = [NSString stringWithFormat:@"[UpNext] Could not find root memory with local identifier (%@)", v10];
    [(id)objc_opt_class() _requestErrorWithCode:1 description:v23];
    id v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = oslog;
    uint64_t v26 = v74;
  }
  else
  {
    id v24 = 0;
    uint64_t v25 = oslog;
    uint64_t v26 = v74;
  }
LABEL_59:

  return v24;
}

void __110__PGUpNextMemoriesGenerationRequest_fetchMemoryLocalIdentifiersWithWorkingContext_musicCurationOptions_error___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 graphMemoryIdentifier];
  if (v9) {
    [a1[4] addObject:v9];
  }
  os_signpost_id_t v4 = (void *)MEMORY[0x1E4F38EB8];
  v5 = [a1[5] librarySpecificFetchOptions];
  id v6 = [v4 fetchKeyCuratedAssetInAssetCollection:v3 referenceAsset:0 options:v5];

  v7 = [v6 firstObject];
  id v8 = [v7 localIdentifier];

  if (v8) {
    [a1[6] addObject:v8];
  }
}

- (PGUpNextMemoriesGenerationRequest)initWithRootMemoryLocalIdentifier:(id)a3 momentUUIDs:(id)a4 memoryLocalIdentifiersToAvoid:(id)a5 targetUpNextMemoryCount:(unint64_t)a6 customVectors:(id)a7 wantsVerboseDebugInfo:(BOOL)a8 sharingFilter:(unsigned __int16)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PGUpNextMemoriesGenerationRequest;
  v19 = [(PGUpNextMemoriesGenerationRequest *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    rootMemoryLocalIdentifier = v19->_rootMemoryLocalIdentifier;
    v19->_rootMemoryLocalIdentifier = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    momentUUIDs = v19->_momentUUIDs;
    v19->_momentUUIDs = (NSArray *)v22;

    uint64_t v24 = [v17 copy];
    memoryLocalIdentifiersToAvoid = v19->_memoryLocalIdentifiersToAvoid;
    v19->_memoryLocalIdentifiersToAvoid = (NSSet *)v24;

    v19->_targetUpNextMemoryCount = a6;
    uint64_t v26 = [v18 copy];
    customVectors = v19->_customVectors;
    v19->_customVectors = (NSArray *)v26;

    v19->_wantsVerboseDebugInfo = a8;
    v19->_sharingFilter = a9;
  }

  return v19;
}

- (PGUpNextMemoriesGenerationRequest)initWithRootMemoryLocalIdentifier:(id)a3 momentUUIDs:(id)a4 memoryLocalIdentifiersToAvoid:(id)a5 targetUpNextMemoryCount:(unint64_t)a6 sharingFilter:(unsigned __int16)a7
{
  LOWORD(v8) = a7;
  return [(PGUpNextMemoriesGenerationRequest *)self initWithRootMemoryLocalIdentifier:a3 momentUUIDs:a4 memoryLocalIdentifiersToAvoid:a5 targetUpNextMemoryCount:a6 customVectors:0 wantsVerboseDebugInfo:0 sharingFilter:v8];
}

+ (id)_baseMemoryFetchOptionsWithPhotoLibrary:(id)a3
{
  id v3 = [a3 librarySpecificFetchOptions];
  [v3 setWantsIncrementalChangeDetails:0];
  [v3 setIncludeLocalMemories:1];
  [v3 setIncludePendingMemories:1];
  return v3;
}

+ (id)_memoryNodesWithSignificantOverlapWithMomentNodes:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = (void *)MEMORY[0x1E4F71E88];
  v5 = [v3 memoryNodes];
  id v6 = +[PGGraphMemoryNode momentOfMemory];
  v7 = [v4 adjacencyWithSources:v5 relation:v6 targetsClass:objc_opt_class()];

  id v8 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __87__PGUpNextMemoriesGenerationRequest__memoryNodesWithSignificantOverlapWithMomentNodes___block_invoke;
  id v18 = &unk_1E68E9F00;
  id v19 = v3;
  id v20 = v8;
  id v9 = v8;
  id v10 = v3;
  [v7 enumerateTargetsBySourceWithBlock:&v15];
  uint64_t v11 = [PGGraphMemoryNodeCollection alloc];
  uint64_t v12 = objc_msgSend(v10, "graph", v15, v16, v17, v18);
  v13 = [(MAElementCollection *)v11 initWithGraph:v12 elementIdentifiers:v9];

  return v13;
}

void __87__PGUpNextMemoriesGenerationRequest__memoryNodesWithSignificantOverlapWithMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if ((v6 - 1) / 3uLL >= 2) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = (v6 - 1) / 3uLL;
  }
  id v8 = [v5 collectionByIntersecting:*(void *)(a1 + 32)];

  unint64_t v9 = [v8 count];
  if (v9 > v7)
  {
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = [v12 elementIdentifiers];
    objc_msgSend(v10, "addIdentifier:", objc_msgSend(v11, "firstElement"));
  }
}

+ (id)_requestErrorWithCode:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  unint64_t v9 = [v5 errorWithDomain:@"com.apple.PhotosGraph.PGUpNextErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)requestWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F8B188];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B188]];
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x1E4F8B178];
    id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B178]];
    if (!v10)
    {
      if (a4)
      {
        uint64_t v25 = [NSString stringWithFormat:@"%@ is nil", v9];
        *a4 = [(id)objc_opt_class() _requestErrorWithCode:0 description:v25];
      }
      uint64_t v24 = 0;
      goto LABEL_38;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B190]];
    if (!v11)
    {
      if (a4)
      {
        uint64_t v26 = [NSString stringWithFormat:@"[UpNext] %@ is nil", v9];
        *a4 = [(id)objc_opt_class() _requestErrorWithCode:0 description:v26];
      }
      uint64_t v24 = 0;
      goto LABEL_37;
    }
    id v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B170]];
    if (v12)
    {
      mach_timebase_info v38 = v8;
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
      uint64_t v14 = [v12 count];
      if (v14 != *MEMORY[0x1E4F8B140])
      {
        if (a4)
        {
          BOOL v31 = objc_msgSend(NSString, "stringWithFormat:", @"[UpNext] Custom vector count mismatch. (Expecting:%lu Received:%lu)", *MEMORY[0x1E4F8B140], objc_msgSend(v12, "count"));
          *a4 = [(id)objc_opt_class() _requestErrorWithCode:3 description:v31];
        }
        uint64_t v24 = 0;
LABEL_36:

LABEL_37:
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v37 = v10;
      os_signpost_id_t v40 = v11;
      id v41 = v12;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v43;
        uint64_t v19 = *MEMORY[0x1E4F8B138];
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v43 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if ([v21 count] != v19)
            {
              if (a4)
              {
                id v32 = objc_msgSend(NSString, "stringWithFormat:", @"[UpNext] Vector feature count mismatch. (Expecting:%lu Received:%lu)", v19, objc_msgSend(v21, "count"));
                *a4 = [(id)objc_opt_class() _requestErrorWithCode:3 description:v32];
              }
              uint64_t v24 = 0;
              id v10 = v37;
              id v8 = v38;
              uint64_t v11 = v40;
              goto LABEL_35;
            }
            uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:v21];
            [v13 addObject:v22];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v10 = v37;
      id v8 = v38;
      id v12 = v41;
    }
    else
    {
      os_signpost_id_t v40 = v11;
      v13 = 0;
    }
    id v27 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F8B198]];
    uint64_t v28 = *MEMORY[0x1E4F8B180];
    objc_super v29 = [v6 objectForKey:*MEMORY[0x1E4F8B180]];

    id v41 = v12;
    if (v29)
    {
      id v30 = [v6 objectForKeyedSubscript:v28];
    }
    else
    {
      id v30 = &unk_1F28D2178;
    }
    __int16 v39 = [v30 unsignedShortValue];
    id v33 = objc_alloc((Class)a1);
    id v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    uint64_t v11 = v40;
    LOWORD(v36) = v39;
    uint64_t v24 = objc_msgSend(v33, "initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:customVectors:wantsVerboseDebugInfo:sharingFilter:", v8, 0, v34, objc_msgSend(v40, "unsignedIntegerValue"), v13, objc_msgSend(v27, "BOOLValue"), v36);

LABEL_35:
    id v12 = v41;
    goto LABEL_36;
  }
  if (a4)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%@ is nil", v7];
    *a4 = [(id)objc_opt_class() _requestErrorWithCode:0 description:v23];
  }
  uint64_t v24 = 0;
LABEL_39:

  return v24;
}

@end