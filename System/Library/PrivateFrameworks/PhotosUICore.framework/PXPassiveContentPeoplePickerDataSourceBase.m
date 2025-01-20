@interface PXPassiveContentPeoplePickerDataSourceBase
- (NSArray)nonVIPPersons;
- (NSArray)vipPersons;
- (NSHashTable)changeObservers;
- (OS_dispatch_queue)workQueue;
- (OS_os_log)log;
- (PHFetchResult)nonVIPPersonsFetchResult;
- (PHFetchResult)peopleSuggestions;
- (PHFetchResult)vipPersonsFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PHUserFeedbackCalculator)userFeedbackCalculator;
- (PXPassiveContentPeoplePickerDataSourceBase)initWithPhotoLibrary:(id)a3;
- (id)peopleSuggestionSubtypes;
- (unint64_t)requiredFeature;
- (void)_fetchPeople;
- (void)_fetchPeopleWallpaperSuggestions;
- (void)addChangeObserver:(id)a3;
- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3;
- (void)notifyChanges;
- (void)photoLibraryDidChange:(id)a3;
- (void)removeChangeObserver:(id)a3;
- (void)setNonVIPPersons:(id)a3;
- (void)setNonVIPPersonsFetchResult:(id)a3;
- (void)setPeopleSuggestions:(id)a3;
- (void)setVipPersons:(id)a3;
- (void)setVipPersonsFetchResult:(id)a3;
- (void)startBackgroundFetch;
@end

@implementation PXPassiveContentPeoplePickerDataSourceBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVIPPersonsFetchResult, 0);
  objc_storeStrong((id *)&self->_vipPersonsFetchResult, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_nonVIPPersons, 0);
  objc_storeStrong((id *)&self->_vipPersons, 0);
}

- (void)setNonVIPPersonsFetchResult:(id)a3
{
}

- (PHFetchResult)nonVIPPersonsFetchResult
{
  return self->_nonVIPPersonsFetchResult;
}

- (void)setVipPersonsFetchResult:(id)a3
{
}

- (PHFetchResult)vipPersonsFetchResult
{
  return self->_vipPersonsFetchResult;
}

- (void)setPeopleSuggestions:(id)a3
{
}

- (PHFetchResult)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (PHUserFeedbackCalculator)userFeedbackCalculator
{
  return self->_userFeedbackCalculator;
}

- (OS_os_log)log
{
  return self->_log;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setNonVIPPersons:(id)a3
{
}

- (NSArray)nonVIPPersons
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVipPersons:(id)a3
{
}

- (NSArray)vipPersons
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PXPassiveContentPeoplePickerDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PXPassiveContentPeoplePickerDataSourceBase_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__PXPassiveContentPeoplePickerDataSourceBase_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) peopleSuggestions];
  id v4 = [v2 changeDetailsForFetchResult:v3];

  BOOL v5 = v4 != 0;
  if (v4)
  {
    id v6 = [v4 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setPeopleSuggestions:v6];
    [*(id *)(a1 + 40) _fetchPeople];
  }
  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) vipPersonsFetchResult];
  v9 = [v7 changeDetailsForFetchResult:v8];

  if (v9)
  {
    v10 = [v9 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setVipPersonsFetchResult:v10];
    v11 = [*(id *)(a1 + 40) vipPersonsFetchResult];
    v12 = [v11 fetchedObjects];
    v13 = (void *)[v12 copy];
    [*(id *)(a1 + 40) setVipPersons:v13];

    BOOL v5 = 1;
  }
  v14 = *(void **)(a1 + 32);
  v15 = [*(id *)(a1 + 40) nonVIPPersonsFetchResult];
  id v20 = [v14 changeDetailsForFetchResult:v15];

  if (v20)
  {
    v16 = [v20 fetchResultAfterChanges];
    [*(id *)(a1 + 40) setNonVIPPersonsFetchResult:v16];
    v17 = [*(id *)(a1 + 40) nonVIPPersonsFetchResult];
    v18 = [v17 fetchedObjects];
    v19 = (void *)[v18 copy];
    [*(id *)(a1 + 40) setNonVIPPersons:v19];
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) notifyChanges];
LABEL_9:
}

- (void)removeChangeObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPassiveContentPeoplePickerDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PXPassiveContentPeoplePickerDataSourceBase_removeChangeObserver___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__PXPassiveContentPeoplePickerDataSourceBase_removeChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changeObservers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)addChangeObserver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPassiveContentPeoplePickerDataSourceBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PXPassiveContentPeoplePickerDataSourceBase_addChangeObserver___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__PXPassiveContentPeoplePickerDataSourceBase_addChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changeObservers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)notifyChanges
{
  v3 = [(PXPassiveContentPeoplePickerDataSourceBase *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXPassiveContentPeoplePickerDataSourceBase_notifyChanges__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__PXPassiveContentPeoplePickerDataSourceBase_notifyChanges__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "changeObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) passiveContentPeoplePickerDataSourceChanged:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_fetchPeople
{
  uint64_t v3 = [(PXPassiveContentPeoplePickerDataSourceBase *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PXPassiveContentPeoplePickerDataSourceBase__fetchPeople__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __58__PXPassiveContentPeoplePickerDataSourceBase__fetchPeople__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) log];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  uint64_t v4 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "fetchPeople", "", buf, 2u);
  }
  os_signpost_id_t spid = v3;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v23 = mach_absolute_time();
  long long v7 = [*(id *)(a1 + 32) userFeedbackCalculator];
  long long v8 = [v7 personUUIDsWithNegativeFeedback];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(MEMORY[0x1E4F391F0], "localIdentifierWithUUID:", *(void *)(*((void *)&v24 + 1) + 8 * v14), spid);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  v16 = PLWallpaperGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v30 = (const char *)v10;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] Avoid Person with negative feedback %{public}@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:v9];
  uint64_t v17 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v20 = v5;
  v21 = v20;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v21, OS_SIGNPOST_INTERVAL_END, spid, "fetchPeople", "", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "fetchPeople";
    __int16 v31 = 2048;
    double v32 = (float)((float)((float)((float)(v17 - v23) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A9AE7000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (void)_fetchPeopleWallpaperSuggestions
{
  uint64_t v4 = [(PXPassiveContentPeoplePickerDataSourceBase *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__PXPassiveContentPeoplePickerDataSourceBase__fetchPeopleWallpaperSuggestions__block_invoke;
  v5[3] = &unk_1E5DD08D8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __78__PXPassiveContentPeoplePickerDataSourceBase__fetchPeopleWallpaperSuggestions__block_invoke(uint64_t a1)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) log];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  uint64_t v4 = v2;
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FetchTopPeopleWallpaperSuggestions", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v31 = mach_absolute_time();
  unint64_t v6 = [*(id *)(a1 + 32) photoLibrary];
  long long v7 = [v6 librarySpecificFetchOptions];

  long long v8 = (void *)MEMORY[0x1E4F28BA0];
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v38[0] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = [*(id *)(a1 + 32) peopleSuggestionSubtypes];
  uint64_t v12 = [v10 predicateWithFormat:@"%K IN %@", @"subtype", v11];
  v38[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  uint64_t v14 = [v8 andPredicateWithSubpredicates:v13];
  [v7 setPredicate:v14];

  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v37[0] = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v37[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  [v7 setSortDescriptors:v17];

  v18 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v7];
  int8x8_t v19 = (int8x8_t)[*(id *)(a1 + 32) requiredFeature];
  if (v19)
  {
    int8x8_t v20 = v19;
    uint8x8_t v21 = (uint8x8_t)vcnt_s8(v19);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] != 1)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"PXPassiveContentPeoplePickerDataSourceBase.m", 79, @"Invalid parameter not satisfying: %@", @"__builtin_popcountll(requiredFeature) == 1" object file lineNumber description];
    }
    uint64_t v22 = [MEMORY[0x1E4F8E858] filterSuggestions:v18 includingSingleFeature:*(void *)&v20];

    v18 = (void *)v22;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v18);
  uint64_t v23 = PLWallpaperGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = [v18 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = (const char *)v24;
    _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] found %lu TopPeople/People suggestions", buf, 0xCu);
  }

  uint64_t v25 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v28 = v5;
  v29 = v28;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v29, OS_SIGNPOST_INTERVAL_END, v3, "FetchTopPeopleWallpaperSuggestions", "", buf, 2u);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "FetchTopPeopleWallpaperSuggestions";
    __int16 v35 = 2048;
    double v36 = (float)((float)((float)((float)(v25 - v31) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (unint64_t)requiredFeature
{
  return 0;
}

- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v7 = (objc_class *)objc_opt_class();
  long long v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXPassiveContentPeoplePickerDataSourceBase.m", 53, @"Method %s is a responsibility of subclass %@", "-[PXPassiveContentPeoplePickerDataSourceBase computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:]", v8 object file lineNumber description];

  abort();
}

- (id)peopleSuggestionSubtypes
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXPassiveContentPeoplePickerDataSourceBase.m", 49, @"Method %s is a responsibility of subclass %@", "-[PXPassiveContentPeoplePickerDataSourceBase peopleSuggestionSubtypes]", v6 object file lineNumber description];

  abort();
}

- (void)startBackgroundFetch
{
  [(PXPassiveContentPeoplePickerDataSourceBase *)self _fetchPeopleWallpaperSuggestions];
  [(PXPassiveContentPeoplePickerDataSourceBase *)self _fetchPeople];
  [(PXPassiveContentPeoplePickerDataSourceBase *)self notifyChanges];
}

- (PXPassiveContentPeoplePickerDataSourceBase)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPassiveContentPeoplePickerDataSourceBase;
  unint64_t v6 = [(PXPassiveContentPeoplePickerDataSourceBase *)&v9 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    [v5 registerChangeObserver:v7];
    px_dispatch_queue_create_serial();
  }

  return 0;
}

@end