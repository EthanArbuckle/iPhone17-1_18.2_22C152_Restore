@interface PGGraphPetIdentityProcessor
+ (id)fetchInterestingEligiblePetsForWallpaperWithWorkingContext:(id)a3 curationContext:(id)a4;
+ (id)fetchPetPersonsWithDetectionType:(signed __int16)a3 photoLibrary:(id)a4;
+ (id)fetchPetPersonsWithNoKeyFaceAndDetectionType:(signed __int16)a3 photoLibrary:(id)a4;
- (OS_os_log)loggingConnection;
- (PGGraph)graph;
- (PGGraphPetIdentityProcessor)initWithDetectionType:(signed __int16)a3 photoLibrary:(id)a4 graph:(id)a5 loggingConnection:(id)a6 cache:(id)a7;
- (PGGraphPetIdentityProcessorCache)cache;
- (PHPhotoLibrary)photoLibrary;
- (id)fetchPetPersons;
- (signed)detectionType;
- (void)setDetectionType:(signed __int16)a3;
- (void)setGraph:(id)a3;
- (void)setLoggingConnection:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PGGraphPetIdentityProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_destroyWeak((id *)&self->_graph);
}

- (PGGraphPetIdentityProcessorCache)cache
{
  return self->_cache;
}

- (void)setLoggingConnection:(id)a3
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)setGraph:(id)a3
{
}

- (PGGraph)graph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
  return (PGGraph *)WeakRetained;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (id)fetchPetPersons
{
  v3 = objc_opt_class();
  uint64_t v4 = [(PGGraphPetIdentityProcessor *)self detectionType];
  v5 = [(PGGraphPetIdentityProcessor *)self photoLibrary];
  v6 = [v3 fetchPetPersonsWithDetectionType:v4 photoLibrary:v5];

  return v6;
}

- (PGGraphPetIdentityProcessor)initWithDetectionType:(signed __int16)a3 photoLibrary:(id)a4 graph:(id)a5 loggingConnection:(id)a6 cache:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PGGraphPetIdentityProcessor;
  v16 = [(PGGraphPetIdentityProcessor *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_detectionType = a3;
    objc_storeWeak((id *)&v16->_graph, v13);
    objc_storeWeak((id *)&v17->_photoLibrary, v12);
    objc_storeStrong((id *)&v17->_loggingConnection, a6);
    objc_storeStrong((id *)&v17->_cache, a7);
  }

  return v17;
}

+ (id)fetchInterestingEligiblePetsForWallpaperWithWorkingContext:(id)a3 curationContext:(id)a4
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4718;
  v42 = __Block_byref_object_dispose__4719;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke;
  v37[3] = &unk_1E68F0A78;
  v37[4] = &v38;
  [v5 performSynchronousConcurrentGraphReadUsingBlock:v37];
  v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"localIdentifier", v39[5]];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 1);
  v9 = [v5 photoLibrary];
  v10 = [v9 librarySpecificFetchOptions];
  [v10 setIncludedDetectionTypes:&unk_1F28D39A8];
  if ([(id)v39[5] count])
  {
    v11 = (void *)MEMORY[0x1E4F28BA0];
    v44[0] = v7;
    v44[1] = v8;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    id v13 = [v11 orPredicateWithSubpredicates:v12];
    [v10 setPredicate:v13];
  }
  else
  {
    [v10 setPredicate:v8];
  }
  id v14 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v10];
  if ([v14 count])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4718;
    v35 = __Block_byref_object_dispose__4719;
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_275;
    v30[3] = &unk_1E68E5DF8;
    v30[4] = &v31;
    [v14 enumerateObjectsUsingBlock:v30];
    id v15 = [v6 userFeedbackCalculator];
    v16 = [(id)v32[5] allKeys];
    v17 = [v15 userFeedbackTypeByPersonUUIDForPersonUUIDs:v16];

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__4718;
    v28 = __Block_byref_object_dispose__4719;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_2;
    v23[3] = &unk_1E68E5450;
    v23[4] = &v31;
    v23[5] = &v24;
    [v17 enumerateKeysAndObjectsUsingBlock:v23];
    uint64_t v18 = [(id)v25[5] count];
    if (v18 == [v14 count])
    {
      id v19 = v14;
    }
    else
    {
      id v21 = objc_alloc(MEMORY[0x1E4F390B0]);
      id v19 = (id)[v21 initWithExistingFetchResult:v14 filteredObjectIDs:v25[5]];
    }
    id v20 = v19;
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    id v20 = v14;
  }

  _Block_object_dispose(&v38, 8);
  return v20;
}

void __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 graph];
  uint64_t v4 = [v3 meNode];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 collection];
    v7 = [v6 ownedPetNodes];
    v8 = [v7 localIdentifiers];
    uint64_t v9 = [v8 allObjects];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    id v15 = +[PGLogging sharedLogging];
    v16 = [v15 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_DEFAULT, "[PetIdentityProcessor] No me node in graph, cannot find user's inferred pets for wallpaper suggestions! Still searching for favorited pets...", v17, 2u);
    }
  }
}

void __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_275(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v4 = [v3 uuid];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 unsignedIntValue] - 4 <= 0xFFFFFFFD)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v5];
    v7 = v6;
    if (v6)
    {
      v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v9 = [v6 objectID];
      [v8 addObject:v9];
    }
    else
    {
      uint64_t v10 = +[PGLogging sharedLogging];
      v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Unable to find pet for UUID %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

+ (id)fetchPetPersonsWithNoKeyFaceAndDetectionType:(signed __int16)a3 photoLibrary:(id)a4
{
  uint64_t v4 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a4 librarySpecificFetchOptions];
  id v6 = [NSNumber numberWithShort:v4];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v5 setIncludedDetectionTypes:v7];

  [v5 setMinimumVerifiedFaceCount:0];
  [v5 setMinimumUnverifiedFaceCount:0];
  [v5 setIncludeTorsoOnlyPerson:1];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = nil", @"keyFace");
  [v5 setInternalPredicate:v8];

  uint64_t v9 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v5];

  return v9;
}

+ (id)fetchPetPersonsWithDetectionType:(signed __int16)a3 photoLibrary:(id)a4
{
  uint64_t v4 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a4 librarySpecificFetchOptions];
  id v6 = [NSNumber numberWithShort:v4];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 setIncludedDetectionTypes:v7];

  [v5 setMinimumVerifiedFaceCount:0];
  [v5 setMinimumUnverifiedFaceCount:0];
  [v5 setIncludeTorsoOnlyPerson:1];
  v8 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v5];

  return v8;
}

@end