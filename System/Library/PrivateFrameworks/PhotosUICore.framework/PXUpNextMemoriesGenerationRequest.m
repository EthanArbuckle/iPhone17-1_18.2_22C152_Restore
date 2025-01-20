@interface PXUpNextMemoriesGenerationRequest
- (BOOL)wantsVerboseDebugInfo;
- (NSArray)recentlyUsedAppleMusicSongIDs;
- (NSArray)recentlyUsedFlexSongIDs;
- (NSSet)memoryLocalIdentifiersToAvoid;
- (OS_dispatch_queue)workQueue;
- (PHMemory)rootMemory;
- (PHPhotoLibrary)photoLibrary;
- (PLPhotoAnalysisServiceClient)photoAnalysisServiceClient;
- (PXUpNextMemoriesGenerationRequest)init;
- (PXUpNextMemoriesGenerationRequest)initWithRootMemory:(id)a3 avoidMemoriesWithLocalIdentifiers:(id)a4 targetUpNextMemoryCount:(unint64_t)a5 musicCurationParameters:(id)a6;
- (id)_fetchLocalMemoriesWithLocalIdentifiers:(id)a3;
- (id)_fetchOverrideMemories;
- (id)fetchUpNextMemoriesWithError:(id *)a3;
- (id)fetchUpNextMemoriesWithError:(id *)a3 sharingFilter:(unsigned __int16)a4;
- (unint64_t)targetUpNextMemoryCount;
- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3;
- (void)setRecentlyUsedFlexSongIDs:(id)a3;
- (void)setWantsVerboseDebugInfo:(BOOL)a3;
- (void)startGenerationWithCompletionHandler:(id)a3;
@end

@implementation PXUpNextMemoriesGenerationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_rootMemory, 0);
  objc_storeStrong((id *)&self->_photoAnalysisServiceClient, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_memoryLocalIdentifiersToAvoid, 0);
}

- (void)setRecentlyUsedAppleMusicSongIDs:(id)a3
{
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (void)setRecentlyUsedFlexSongIDs:(id)a3
{
}

- (NSArray)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHMemory)rootMemory
{
  return self->_rootMemory;
}

- (PLPhotoAnalysisServiceClient)photoAnalysisServiceClient
{
  return self->_photoAnalysisServiceClient;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setWantsVerboseDebugInfo:(BOOL)a3
{
  self->_wantsVerboseDebugInfo = a3;
}

- (BOOL)wantsVerboseDebugInfo
{
  return self->_wantsVerboseDebugInfo;
}

- (unint64_t)targetUpNextMemoryCount
{
  return self->_targetUpNextMemoryCount;
}

- (NSSet)memoryLocalIdentifiersToAvoid
{
  return self->_memoryLocalIdentifiersToAvoid;
}

- (id)_fetchLocalMemoriesWithLocalIdentifiers:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(PXUpNextMemoriesGenerationRequest *)self photoLibrary];
    v6 = [v5 librarySpecificFetchOptions];

    [v6 setWantsIncrementalChangeDetails:0];
    [v6 setIncludeLocalMemories:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier IN %@", v4];
    [v7 addObject:v8];

    v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"pendingState = %d", 2);
    [v7 addObject:v9];

    v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];
    [v6 setPredicate:v10];

    v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
    v12 = [v11 fetchedObjects];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__PXUpNextMemoriesGenerationRequest__fetchLocalMemoriesWithLocalIdentifiers___block_invoke;
    v28[3] = &unk_1E5DC00D8;
    id v13 = v4;
    id v29 = v13;
    v14 = [v12 sortedArrayUsingComparator:v28];

    id v15 = objc_alloc(MEMORY[0x1E4F39150]);
    v16 = [v11 photoLibrary];
    v17 = [v11 fetchType];
    v18 = [v11 fetchPropertySets];
    v19 = (void *)[v15 initWithObjects:v14 photoLibrary:v16 fetchType:v17 fetchPropertySets:v18 identifier:0 registerIfNeeded:0];

    v20 = PLMemoriesGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v19 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v31 = v21;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v19;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "[UpNext] Fetched %lu UpNext Memories:%@", buf, 0x16u);
    }

    uint64_t v22 = [v19 count];
    if (v22 != [v13 count])
    {
      v23 = PLMemoriesGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v13 count];
        uint64_t v25 = [v19 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v31 = v24;
        __int16 v32 = 2048;
        uint64_t v33 = v25;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "[UpNext] Failed fetching local memories. Expecting:%lu Got:%lu", buf, 0x16u);
      }
    }
    id v26 = v19;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

uint64_t __77__PXUpNextMemoriesGenerationRequest__fetchLocalMemoriesWithLocalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSNumber;
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  v8 = [a2 localIdentifier];
  v9 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v10 = NSNumber;
  v11 = *(void **)(a1 + 32);
  v12 = [v7 localIdentifier];

  id v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  uint64_t v14 = [v9 compare:v13];

  return v14;
}

- (id)fetchUpNextMemoriesWithError:(id *)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v7 = PLMemoriesGetLog();
  v91 = self;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(PXUpNextMemoriesGenerationRequest *)self targetUpNextMemoryCount];
    v9 = [(PXUpNextMemoriesGenerationRequest *)self rootMemory];
    double v10 = [v9 localIdentifier];
    v11 = [(PXUpNextMemoriesGenerationRequest *)self rootMemory];
    v12 = [v11 title];
    *(_DWORD *)buf = 134218498;
    v99 = (const char *)v8;
    __int16 v100 = 2112;
    double v101 = v10;
    __int16 v102 = 2112;
    v103 = v12;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "[UpNext] Fetch %lu suggestions for memory:%@ - %@", buf, 0x20u);

    self = v91;
  }

  id v13 = +[PXUpNextSettings sharedInstance];
  if (![v13 overrideMemoriesResult]
    || ([(PXUpNextMemoriesGenerationRequest *)self _fetchOverrideMemories],
        (uint64_t v14 = (PXUpNextMemoriesGenerationResult *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v89 = a3;
    v90 = v13;
    id v15 = PLUpNextGetLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);
    v17 = v15;
    v18 = v17;
    unint64_t v87 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PXUpNextMemoriesGenerationRequest", "", buf, 2u);
    }
    os_signpost_id_t spid = v16;
    v86 = v18;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v78 = mach_absolute_time();
    v19 = +[PXMemoriesRelatedSettings sharedInstance];
    uint64_t v20 = [v19 useOnlyMusicForTopicInTopPickSuggestions];
    uint64_t v21 = [v19 includeChillMixInMusicForYou];
    v88 = v19;
    uint64_t v22 = [v19 includeGetUpMixInMusicForYou];
    id v84 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v96[0] = *MEMORY[0x1E4F8B188];
    v83 = [(PXUpNextMemoriesGenerationRequest *)self rootMemory];
    v82 = [v83 localIdentifier];
    v97[0] = v82;
    v96[1] = *MEMORY[0x1E4F8B178];
    v81 = [(PXUpNextMemoriesGenerationRequest *)self memoryLocalIdentifiersToAvoid];
    v80 = [v81 allObjects];
    v97[1] = v80;
    v96[2] = *MEMORY[0x1E4F8B190];
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXUpNextMemoriesGenerationRequest targetUpNextMemoryCount](self, "targetUpNextMemoryCount"));
    v97[2] = v23;
    v96[3] = *MEMORY[0x1E4F8B198];
    uint64_t v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PXUpNextMemoriesGenerationRequest wantsVerboseDebugInfo](self, "wantsVerboseDebugInfo"));
    v97[3] = v24;
    v96[4] = *MEMORY[0x1E4F8B180];
    unsigned int v79 = v4;
    uint64_t v25 = [NSNumber numberWithUnsignedShort:v4];
    v97[4] = v25;
    v96[5] = *MEMORY[0x1E4F8B290];
    id v26 = [NSNumber numberWithBool:v20];
    v97[5] = v26;
    v96[6] = *MEMORY[0x1E4F8B228];
    v27 = [NSNumber numberWithBool:v21];
    v97[6] = v27;
    v96[7] = *MEMORY[0x1E4F8B230];
    v28 = [NSNumber numberWithBool:v22];
    v97[7] = v28;
    v96[8] = *MEMORY[0x1E4F8B030];
    uint64_t v29 = [(PXUpNextMemoriesGenerationRequest *)self recentlyUsedFlexSongIDs];
    v30 = (void *)v29;
    uint64_t v31 = MEMORY[0x1E4F1CBF0];
    if (v29) {
      uint64_t v32 = v29;
    }
    else {
      uint64_t v32 = MEMORY[0x1E4F1CBF0];
    }
    v97[8] = v32;
    v96[9] = *MEMORY[0x1E4F8B038];
    uint64_t v33 = [(PXUpNextMemoriesGenerationRequest *)self recentlyUsedAppleMusicSongIDs];
    uint64_t v34 = (void *)v33;
    if (v33) {
      uint64_t v35 = v33;
    }
    else {
      uint64_t v35 = v31;
    }
    v97[9] = v35;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:10];
    v37 = (void *)[v84 initWithDictionary:v36];

    if ([v90 enableCustomVectors])
    {
      v38 = [v90 featureWeightVectors];
      v39 = PLMemoriesGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v38;
        _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_DEFAULT, "[UpNext] custom vector:%@", buf, 0xCu);
      }

      [v37 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F8B170]];
    }
    v40 = [(PXUpNextMemoriesGenerationRequest *)v91 photoAnalysisServiceClient];
    id v93 = 0;
    v41 = [v40 requestUpNextMemoryLocalIdentifiersWithOptions:v37 error:&v93];
    v42 = (char *)v93;

    v85 = v37;
    if (v41 && ([v90 forceFallbackMemories] & 1) == 0)
    {
      double v47 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F8B1A8]];
      v44 = v89;
      if (v47 == 0.0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v52 = PLMemoriesGetLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v99 = *(const char **)&v47;
          _os_log_impl(&dword_1A9AE7000, v52, OS_LOG_TYPE_ERROR, "[UpNext] memoryLocalIdentifiers: %@, is nil or not a NSArray object", buf, 0xCu);
        }
      }
      v45 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F8B1A0]];
      if (!v45 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v53 = PLMemoriesGetLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v99 = v45;
          _os_log_impl(&dword_1A9AE7000, v53, OS_LOG_TYPE_ERROR, "[UpNext] debugInfo: %@, is nil or not a NSString object", buf, 0xCu);
        }

        uint64_t v54 = [NSString stringWithFormat:@"UpNext debugInfo: %@, is nil or not a NSString object", v45];

        v45 = (char *)v54;
      }
      v55 = PLMemoriesGetLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v56 = [*(id *)&v47 count];
        *(_DWORD *)buf = 134218242;
        v99 = (const char *)v56;
        __int16 v100 = 2112;
        double v101 = v47;
        _os_log_impl(&dword_1A9AE7000, v55, OS_LOG_TYPE_DEFAULT, "[UpNext] Found %lu UpNext Memories from PhotoAnalysis:%@", buf, 0x16u);
      }

      v51 = [(PXUpNextMemoriesGenerationRequest *)v91 _fetchLocalMemoriesWithLocalIdentifiers:*(void *)&v47];
    }
    else
    {
      v43 = PLMemoriesGetLog();
      v44 = v89;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v42;
        _os_log_impl(&dword_1A9AE7000, v43, OS_LOG_TYPE_ERROR, "[UpNext] generation error:%@", buf, 0xCu);
      }

      v45 = [NSString stringWithFormat:@"[UpNext] generation error:%@. Using Fallback Memory.", v42];

      v46 = (void *)MEMORY[0x1E4F39190];
      double v47 = [(PXUpNextMemoriesGenerationRequest *)v91 rootMemory];
      unint64_t targetUpNextMemoryCount = v91->_targetUpNextMemoryCount;
      v49 = [(PXUpNextMemoriesGenerationRequest *)v91 memoryLocalIdentifiersToAvoid];
      v50 = [v49 allObjects];
      id v92 = 0;
      v51 = [v46 fetchFallbackMemoriesForMemory:*(void *)&v47 targetCount:targetUpNextMemoryCount memoryLocalIdentifiersToAvoid:v50 sharingFilter:v79 error:&v92];
      v42 = (char *)v92;
    }
    unint64_t v57 = [v51 count];
    if (v57)
    {
      double v58 = *(double *)&v57;
      v59 = v91;
      if (v57 < v91->_targetUpNextMemoryCount)
      {
        v60 = PLMemoriesGetLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = (const char *)v91->_targetUpNextMemoryCount;
          *(_DWORD *)buf = 134218240;
          v99 = v61;
          __int16 v100 = 2048;
          double v101 = v58;
          _os_log_impl(&dword_1A9AE7000, v60, OS_LOG_TYPE_DEFAULT, "[UpNext] Insufficient number of suggestions. Need %lu, got %lu; returning 1.",
            buf,
            0x16u);
        }

        id v62 = objc_alloc(MEMORY[0x1E4F39150]);
        v63 = [v51 firstObject];
        v95 = v63;
        v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
        v65 = [v51 photoLibrary];
        v66 = [v51 fetchType];
        v67 = [v51 fetchPropertySets];
        uint64_t v68 = [v62 initWithObjects:v64 photoLibrary:v65 fetchType:v66 fetchPropertySets:v67 identifier:0 registerIfNeeded:0];

        v59 = v91;
        v51 = (void *)v68;
        v44 = v89;
      }
    }
    else
    {
      v59 = v91;
    }
    v69 = objc_msgSend(v45, "stringByAppendingFormat:", @" Requested Count: %li.", v59->_targetUpNextMemoryCount);

    uint64_t v14 = [[PXUpNextMemoriesGenerationResult alloc] initWithMemories:v51 debugInfo:v69];
    uint64_t v70 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v73 = v86;
    v74 = v73;
    id v13 = v90;
    if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v74, OS_SIGNPOST_INTERVAL_END, spid, "PXUpNextMemoriesGenerationRequest", "", buf, 2u);
    }

    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "PXUpNextMemoriesGenerationRequest";
      __int16 v100 = 2048;
      double v101 = (float)((float)((float)((float)(v70 - v78) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1A9AE7000, v74, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v42)
    {
      v75 = PLMemoriesGetLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v42;
        _os_log_impl(&dword_1A9AE7000, v75, OS_LOG_TYPE_ERROR, "[UpNext] Generation error:%@", buf, 0xCu);
      }
    }
    if (v44) {
      id *v44 = v42;
    }
  }
  return v14;
}

- (id)fetchUpNextMemoriesWithError:(id *)a3
{
  v5 = [(PXUpNextMemoriesGenerationRequest *)self photoLibrary];
  v6 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v5];

  id v7 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v6];
  unint64_t v8 = [(PXUpNextMemoriesGenerationRequest *)self fetchUpNextMemoriesWithError:a3 sharingFilter:[(PXLibraryFilterState *)v7 sharingFilter]];

  return v8;
}

- (id)_fetchOverrideMemories
{
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Media/PhotoData/Caches/GraphService/upNextMemoriesResultOverride.plist"];
  uint64_t v4 = [(PXUpNextMemoriesGenerationRequest *)self rootMemory];
  v5 = [v4 localIdentifier];
  v6 = [v3 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [(PXUpNextMemoriesGenerationRequest *)self _fetchLocalMemoriesWithLocalIdentifiers:v6];
    unint64_t v8 = [[PXUpNextMemoriesGenerationResult alloc] initWithMemories:v7 debugInfo:&stru_1F00B0030];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)startGenerationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PXUpNextMemoriesGenerationRequest_startGenerationWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  id v7 = [(PXUpNextMemoriesGenerationRequest *)self workQueue];
  dispatch_async(v7, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __74__PXUpNextMemoriesGenerationRequest_startGenerationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = 0;
  v3 = [WeakRetained fetchUpNextMemoriesWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXUpNextMemoriesGenerationRequest)initWithRootMemory:(id)a3 avoidMemoriesWithLocalIdentifiers:(id)a4 targetUpNextMemoryCount:(unint64_t)a5 musicCurationParameters:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PXUpNextMemoriesGenerationRequest;
  uint64_t v14 = [(PXUpNextMemoriesGenerationRequest *)&v30 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rootMemory, a3);
    uint64_t v16 = [v11 photoLibrary];
    photoLibrary = v15->_photoLibrary;
    v15->_photoLibrary = (PHPhotoLibrary *)v16;

    uint64_t v18 = [(PHPhotoLibrary *)v15->_photoLibrary photoAnalysisClient];
    photoAnalysisServiceClient = v15->_photoAnalysisServiceClient;
    v15->_photoAnalysisServiceClient = (PLPhotoAnalysisServiceClient *)v18;

    uint64_t v20 = [v11 localIdentifier];
    uint64_t v21 = [v12 setByAddingObject:v20];
    memoryLocalIdentifiersToAvoid = v15->_memoryLocalIdentifiersToAvoid;
    v15->_memoryLocalIdentifiersToAvoid = (NSSet *)v21;

    v15->_unint64_t targetUpNextMemoryCount = a5;
    v23 = [v13 recentlyUsedFlexSongIDs];
    uint64_t v24 = [v23 allObjects];
    recentlyUsedFlexSongIDs = v15->_recentlyUsedFlexSongIDs;
    v15->_recentlyUsedFlexSongIDs = (NSArray *)v24;

    id v26 = [v13 recentlyUsedAppleMusicSongIDs];
    uint64_t v27 = [v26 allObjects];
    recentlyUsedAppleMusicSongIDs = v15->_recentlyUsedAppleMusicSongIDs;
    v15->_recentlyUsedAppleMusicSongIDs = (NSArray *)v27;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_claimAutoreleasedReturnValue();
    px_dispatch_queue_create();
  }

  return 0;
}

- (PXUpNextMemoriesGenerationRequest)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUpNextMemoriesGenerationRequest.m", 42, @"%s is not available as initializer", "-[PXUpNextMemoriesGenerationRequest init]");

  abort();
}

@end