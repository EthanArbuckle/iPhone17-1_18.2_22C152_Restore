@interface PLThumbnailIndexes
+ (id)occupiedThumbnailIndexesWithLibrary:(id)a3 fetchTimestampToUpdate:(unint64_t *)a4;
+ (id)occupiedThumbnailIndexesWithLibrary:(id)a3 fetchTimestampToUpdate:(unint64_t *)a4 outFetchCount:(unint64_t *)a5;
+ (unint64_t)nextAvailableThumbnailIndexInLibrary:(id)a3;
+ (void)getAvailableThumbnailIndexInLibrary:(id)a3 withHandler:(id)a4;
+ (void)getAvailableThumbnailIndexesInLibrary:(id)a3 withCount:(unint64_t)a4 handler:(id)a5;
+ (void)recycleThumbnailIndexes:(id)a3 inLibrary:(id)a4;
+ (void)recycleThumbnailIndexes:(id)a3 inLibrary:(id)a4 timestamp:(unint64_t)a5;
- (PLThumbnailIndexes)init;
- (id)getAvailableThumbnailIndexesWithCount:(unint64_t)a3 inLibrary:(id)a4;
- (void)getAvailableThumbnailIndexesFromLibrary:(id)a3;
- (void)getAvailableThumbnailIndexesWithCount:(unint64_t)a3 inLibrary:(id)a4 handler:(id)a5;
- (void)recycleThumbnailIndexes:(id)a3 timestamp:(unint64_t)a4;
@end

@implementation PLThumbnailIndexes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unusedIndexes, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (PLThumbnailIndexes)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLThumbnailIndexes;
  v2 = [(PLThumbnailIndexes *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.assetsd.thumbnailindexes", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)occupiedThumbnailIndexesWithLibrary:(id)a3 fetchTimestampToUpdate:(unint64_t *)a4 outFetchCount:(unint64_t *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [MEMORY[0x1E4F28E60] indexSet];
  v9 = (void *)MEMORY[0x19F38D3B0]();
  v10 = +[PLManagedAsset entityName];
  v11 = +[PLFetchRequest fetchRequestWithEntityName:v10];

  [v11 setResultType:2];
  v27[0] = @"thumbnailIndex";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v11 setPropertiesToFetch:v12];

  objc_msgSend(v11, "setPl_importantFetchName:", @"fetchOccupiedThumbnailIndexes");
  v13 = [v7 managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__PLThumbnailIndexes_occupiedThumbnailIndexesWithLibrary_fetchTimestampToUpdate_outFetchCount___block_invoke;
  v19[3] = &unk_1E5867848;
  id v20 = v13;
  id v21 = v11;
  v25 = a4;
  v22 = @"thumbnailIndex";
  id v14 = v8;
  id v23 = v14;
  id v15 = v7;
  id v24 = v15;
  v26 = a5;
  id v16 = v11;
  id v17 = v13;
  [v15 performBlockAndWait:v19];

  return v14;
}

void __95__PLThumbnailIndexes_occupiedThumbnailIndexesWithLibrary_fetchTimestampToUpdate_outFetchCount___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  dispatch_queue_t v3 = PLThumbnailsGetLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FetchAndBuildAvailableThumbnailIndexSet", "", buf, 2u);
  }
  log = v3;
  v4 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40) error:0];
  uint64_t v26 = [v4 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      uint64_t v28 = v8;
      uint64_t v12 = -v8;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        id v14 = (void *)MEMORY[0x19F38D3B0]();
        if (v12 == v11)
        {
          uint64_t v15 = mach_absolute_time();
          uint64_t v9 = v15;
          id v16 = *(uint64_t **)(a1 + 72);
          if (v16) {
            *id v16 = v15;
          }
        }
        id v17 = [v13 objectForKey:*(void *)(a1 + 48)];
        v18 = v17;
        if (v17)
        {
          unint64_t v19 = [v17 integerValue];
          if (v19 < 0xFFFFFFFFFFFFFFFDLL && v19 != 0x7FFFFFFFFFFFFFFFLL) {
            [*(id *)(a1 + 56) addIndex:v19];
          }
        }

        ++v11;
      }
      while (v7 != v11);
      uint64_t v8 = v28 + v7;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  if (os_signpost_enabled(log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, log, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FetchAndBuildAvailableThumbnailIndexSet", "", buf, 2u);
  }
  double v21 = CFAbsoluteTimeGetCurrent();
  v22 = [*(id *)(a1 + 64) libraryServicesManager];
  [v22 wellKnownPhotoLibraryIdentifier];
  id v23 = PLStringFromWellKnownPhotoLibraryIdentifier();

  id v24 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v34 = v26;
    __int16 v35 = 2048;
    uint64_t v36 = v9;
    __int16 v37 = 2048;
    double v38 = v21 - Current;
    __int16 v39 = 2112;
    v40 = v23;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "All indexes (count = %lu), fetched at %llu, duration: %.4fs, library type: %@", buf, 0x2Au);
  }

  v25 = *(uint64_t **)(a1 + 80);
  if (v25) {
    uint64_t *v25 = v26;
  }
}

+ (id)occupiedThumbnailIndexesWithLibrary:(id)a3 fetchTimestampToUpdate:(unint64_t *)a4
{
  return (id)[a1 occupiedThumbnailIndexesWithLibrary:a3 fetchTimestampToUpdate:a4 outFetchCount:0];
}

+ (void)recycleThumbnailIndexes:(id)a3 inLibrary:(id)a4 timestamp:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [a4 thumbnailIndexes];
  [v8 recycleThumbnailIndexes:v7 timestamp:a5];
}

+ (void)recycleThumbnailIndexes:(id)a3 inLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 recycleThumbnailIndexes:v7 inLibrary:v6 timestamp:mach_absolute_time()];
}

+ (unint64_t)nextAvailableThumbnailIndexInLibrary:(id)a3
{
  id v3 = a3;
  v4 = [v3 thumbnailIndexes];
  id v5 = [v4 getAvailableThumbnailIndexesWithCount:1 inLibrary:v3];

  unint64_t v6 = [v5 firstIndex];
  return v6;
}

+ (void)getAvailableThumbnailIndexInLibrary:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 thumbnailIndexes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__PLThumbnailIndexes_getAvailableThumbnailIndexInLibrary_withHandler___block_invoke;
  v9[3] = &unk_1E5867820;
  id v10 = v5;
  id v8 = v5;
  [v7 getAvailableThumbnailIndexesWithCount:1 inLibrary:v6 handler:v9];
}

uint64_t __70__PLThumbnailIndexes_getAvailableThumbnailIndexInLibrary_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 firstIndex];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

+ (void)getAvailableThumbnailIndexesInLibrary:(id)a3 withCount:(unint64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 thumbnailIndexes];
  [v9 getAvailableThumbnailIndexesWithCount:a4 inLibrary:v8 handler:v7];
}

- (void)recycleThumbnailIndexes:(id)a3 timestamp:(unint64_t)a4
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = v4;
    pl_dispatch_async();
  }
}

void __65__PLThumbnailIndexes_Private__recycleThumbnailIndexes_timestamp___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Recycling thumbnail indexes %@ with timestamp %llu", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = a1[5];
  if (a1[6] >= *(void *)(v5 + 32)) {
    [*(id *)(v5 + 16) addIndexes:a1[4]];
  }
}

- (void)getAvailableThumbnailIndexesFromLibrary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F38D3B0]();
  int v6 = [(id)objc_opt_class() occupiedThumbnailIndexesWithLibrary:v4 fetchTimestampToUpdate:&self->_fetchTimestamp];
  int64_t v7 = [(NSMutableIndexSet *)v6 lastIndex];
  self->_int64_t usedMax = v7;
  if ((v7 | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
  {
    __int16 v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    unusedIndexes = self->_unusedIndexes;
    self->_unusedIndexes = v8;

    int64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, self->_usedMax);
    uint64_t v12 = self->_unusedIndexes;
    self->_unusedIndexes = v11;

    [(NSMutableIndexSet *)self->_unusedIndexes removeIndexes:v6];
    int64_t v10 = self->_usedMax + 1;
  }
  self->_int64_t usedMax = v10;
  v13 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Thumbnail indexes in use: %@", (uint8_t *)&v17, 0xCu);
  }

  id v14 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = self->_unusedIndexes;
    int64_t usedMax = self->_usedMax;
    int v17 = 138412546;
    v18 = v15;
    __int16 v19 = 2048;
    int64_t v20 = usedMax;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Available thumbnail indexes in use: %@ (used max = %ld)", (uint8_t *)&v17, 0x16u);
  }
}

- (void)getAvailableThumbnailIndexesWithCount:(unint64_t)a3 inLibrary:(id)a4 handler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  pl_dispatch_async();
}

void __87__PLThumbnailIndexes_Private__getAvailableThumbnailIndexesWithCount_inLibrary_handler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2[2]) {
    [v2 getAvailableThumbnailIndexesFromLibrary:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  if (*(void *)(a1 + 56))
  {
    unint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) firstIndex];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v6 = v5;
      [*(id *)(*(void *)(a1 + 32) + 16) removeIndex:v5];
      [v3 addIndex:v6];
      ++v4;
      unint64_t v7 = *(void *)(a1 + 56);
      if (v4 >= v7) {
        goto LABEL_10;
      }
    }
    unint64_t v7 = *(void *)(a1 + 56);
LABEL_10:
    uint64_t v8 = v7 - v4;
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_msgSend(v3, "addIndexesInRange:", *(void *)(*(void *)(a1 + 32) + 24), v8);
  *(void *)(*(void *)(a1 + 32) + 24) += v8;
  id v9 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    int v17 = v3;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Handing out thumbnail indexes %@", buf, 0xCu);
  }

  int64_t v10 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v13 = *(void **)(v11 + 16);
    uint64_t v12 = *(void *)(v11 + 24);
    *(_DWORD *)buf = 138412546;
    int v17 = v13;
    __int16 v18 = 2048;
    uint64_t v19 = v12;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Available thumbnail indexes in use: %@ (used max = %ld)", buf, 0x16u);
  }

  id v15 = *(id *)(a1 + 48);
  id v14 = v3;
  pl_dispatch_async();
}

uint64_t __87__PLThumbnailIndexes_Private__getAvailableThumbnailIndexesWithCount_inLibrary_handler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)getAvailableThumbnailIndexesWithCount:(unint64_t)a3 inLibrary:(id)a4
{
  id v4 = a4;
  id v8 = [MEMORY[0x1E4F28E60] indexSet];
  id v5 = v4;
  pl_dispatch_sync();
  id v6 = v8;

  return v6;
}

void __79__PLThumbnailIndexes_Private__getAvailableThumbnailIndexesWithCount_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2[2]) {
    [v2 getAvailableThumbnailIndexesFromLibrary:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 56))
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) firstIndex];
      if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v5 = v4;
      [*(id *)(*(void *)(a1 + 32) + 16) removeIndex:v4];
      [*(id *)(a1 + 48) addIndex:v5];
      ++v3;
      unint64_t v6 = *(void *)(a1 + 56);
      if (v3 >= v6) {
        goto LABEL_10;
      }
    }
    unint64_t v6 = *(void *)(a1 + 56);
LABEL_10:
    uint64_t v7 = v6 - v3;
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "addIndexesInRange:", *(void *)(*(void *)(a1 + 32) + 24), v7);
  *(void *)(*(void *)(a1 + 32) + 24) += v7;
  id v8 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    int v14 = 138412290;
    uint64_t v15 = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Handing out thumbnail indexes %@", (uint8_t *)&v14, 0xCu);
  }

  int64_t v10 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(v11 + 16);
    uint64_t v12 = *(void *)(v11 + 24);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2048;
    uint64_t v17 = v12;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Available thumbnail indexes in use: %@ (used max = %ld)", (uint8_t *)&v14, 0x16u);
  }
}

@end