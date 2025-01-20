@interface PLTableThumbnailMigrator
+ (BOOL)_writeCompressedTableThumbsFromMasterThumb:(CGImageSource *)a3 uuid:(id)a4 formats:(id)a5 toIndex:(unint64_t)a6 thumbnailManager:(id)a7;
+ (id)_fetchRequstForAssetsPendingTableRebuildWithLimit:(int64_t)a3 excludingAssetIDs:(id)a4;
+ (id)_nextBatchOfItemsPendingTableRebuildInLibrary:(id)a3 excludingAssetIDs:(id)a4 sourceObjects:(id *)a5;
+ (id)_predicateForAssetsPendingTableRebuild;
+ (id)_workItemForAsset:(id)a3 library:(id)a4 thumbnailManager:(id)a5;
+ (unint64_t)countOfAssetsPendingTableThumbRebuildInLibrary:(id)a3;
- (PLTableThumbnailMigrator)init;
- (id)_bulkMigratorQueue;
- (void)_rebuildTablesForBatch:(id)a3 inLibrary:(id)a4 toFormats:(id)a5;
- (void)migrateAllAssetsPendingTableThumbRebuildInLibrary:(id)a3 toTableFormats:(id)a4 limit:(unint64_t)a5;
- (void)rebuildTableThumbForAsset:(id)a3 inLibrary:(id)a4 toTableFormats:(id)a5;
@end

@implementation PLTableThumbnailMigrator

- (void).cxx_destruct
{
}

- (void)migrateAllAssetsPendingTableThumbRebuildInLibrary:(id)a3 toTableFormats:(id)a4 limit:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 297, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  v11 = [v9 thumbnailManager];

  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 298, @"Invalid parameter not satisfying: %@", @"library.thumbnailManager" object file lineNumber description];

    if (v10) {
      goto LABEL_5;
    }
LABEL_7:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 299, @"Invalid parameter not satisfying: %@", @"tableFormats" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v10) {
    goto LABEL_7;
  }
LABEL_5:
  v12 = [(PLTableThumbnailMigrator *)self _bulkMigratorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PLTableThumbnailMigrator_migrateAllAssetsPendingTableThumbRebuildInLibrary_toTableFormats_limit___block_invoke;
  block[3] = &unk_1E58735D8;
  id v19 = v10;
  v20 = self;
  id v21 = v9;
  unint64_t v22 = a5;
  id v13 = v9;
  id v14 = v10;
  dispatch_sync(v12, block);
}

void __99__PLTableThumbnailMigrator_migrateAllAssetsPendingTableThumbRebuildInLibrary_toTableFormats_limit___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v26 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_114];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  unint64_t v5 = 0;
  if (*(void *)(a1 + 56)) {
    unint64_t v6 = *(unint64_t *)(a1 + 56);
  }
  else {
    *(double *)&unint64_t v6 = NAN;
  }
  while (v5 <= v6)
  {
    v7 = (void *)MEMORY[0x19F38D3B0](v2);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 16) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    id v9 = [*(id *)(a1 + 48) libraryBundle];
    id v10 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLTableThumbnailMigrator migrateAllAssetsPendingTableThumbRebuildInLibrary:toTableFormats:limit:]_block_invoke", v9);

    v11 = objc_opt_class();
    id v27 = 0;
    v12 = [v11 _nextBatchOfItemsPendingTableRebuildInLibrary:v10 excludingAssetIDs:v8 sourceObjects:&v27];
    id v13 = v27;
    uint64_t v14 = [v12 count];
    v15 = PLThumbnailsGetLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(double *)&uint64_t v17 = COERCE_DOUBLE([v12 count]);
        *(_DWORD *)buf = 134217984;
        double v29 = *(double *)&v17;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Processing batch of %ld assets for table thumb migration...", buf, 0xCu);
      }

      [*(id *)(a1 + 40) _rebuildTablesForBatch:v12 inLibrary:v10 toFormats:v26];
      v5 += [v12 count];
      v15 = PLThumbnailsGetLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(double *)&uint64_t v18 = COERCE_DOUBLE([v12 count]);
      *(_DWORD *)buf = 134218496;
      double v29 = *(double *)&v18;
      __int16 v30 = 2048;
      unint64_t v31 = v5;
      __int16 v32 = 2048;
      unint64_t v33 = v6;
      id v19 = v15;
      v20 = "Processed batch of %ld assets for table thumb migration.  Total processed in session: %ld (limit: %ld).";
      uint32_t v21 = 32;
      goto LABEL_12;
    }
    if (v16)
    {
      *(_WORD *)buf = 0;
      id v19 = v15;
      v20 = "Done migrating table thumbs, no more assets remaining.";
      uint32_t v21 = 2;
LABEL_12:
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
    }
LABEL_13:

    if (!v14) {
      break;
    }
  }
  if (v5 > v6)
  {
    unint64_t v22 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v29 = *(double *)&v6;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Reached limit of %ld assets to process for table thumb migration.", buf, 0xCu);
    }
  }
  v23 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [MEMORY[0x1E4F1C9C8] date];
    [v24 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    double v29 = v25 - v4;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Table thumb migration ended. (duration: %.3fs)", buf, 0xCu);
  }
}

uint64_t __99__PLTableThumbnailMigrator_migrateAllAssetsPendingTableThumbRebuildInLibrary_toTableFormats_limit___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)rebuildTableThumbForAsset:(id)a3 inLibrary:(id)a4 toTableFormats:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint32_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 274, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  unint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 275, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

LABEL_3:
  v12 = [v10 thumbnailManager];

  if (v12)
  {
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 276, @"Invalid parameter not satisfying: %@", @"library.thumbnailManager" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PLTableThumbnailMigrator.m", 277, @"Invalid parameter not satisfying: %@", @"tableFormats" object file lineNumber description];

LABEL_5:
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = __Block_byref_object_copy__91777;
  unint64_t v33 = __Block_byref_object_dispose__91778;
  id v34 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__PLTableThumbnailMigrator_rebuildTableThumbForAsset_inLibrary_toTableFormats___block_invoke;
  v25[3] = &unk_1E5875368;
  v28 = &v29;
  v25[4] = self;
  id v13 = v9;
  id v26 = v13;
  id v14 = v10;
  id v27 = v14;
  [v14 performBlockAndWait:v25];
  v15 = [v11 sortedArrayUsingComparator:&__block_literal_global_112];
  BOOL v16 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [(id)v30[5] uuid];
    *(_DWORD *)buf = 138412290;
    v37 = v17;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Processing asset %@ for table thumb migration...", buf, 0xCu);
  }
  uint64_t v35 = v30[5];
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  [(PLTableThumbnailMigrator *)self _rebuildTablesForBatch:v18 inLibrary:v14 toFormats:v15];

  id v19 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(id)v30[5] uuid];
    *(_DWORD *)buf = 138412290;
    v37 = v20;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Completed asset %@ for table thumb migration", buf, 0xCu);
  }
  _Block_object_dispose(&v29, 8);
}

void __79__PLTableThumbnailMigrator_rebuildTableThumbForAsset_inLibrary_toTableFormats___block_invoke(void *a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = a1[5];
  double v4 = (void *)a1[6];
  id v8 = [v4 thumbnailManager];
  uint64_t v5 = [v2 _workItemForAsset:v3 library:v4 thumbnailManager:v8];
  uint64_t v6 = *(void *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __79__PLTableThumbnailMigrator_rebuildTableThumbForAsset_inLibrary_toTableFormats___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)_rebuildTablesForBatch:(id)a3 inLibrary:(id)a4 toFormats:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint32_t v21 = v9;
    os_unfair_lock_lock(&self->_pendingAssetObjectIDsLock);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = [*(id *)(*((void *)&v32 + 1) + 8 * v15) asset];
          uint64_t v17 = [v16 objectID];

          if (v17) {
            [(NSMutableSet *)self->_pendingAssetObjectIDs addObject:v17];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v13);
    }

    os_unfair_lock_unlock(&self->_pendingAssetObjectIDsLock);
    size_t v18 = [v11 count];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke;
    block[3] = &unk_1E5871408;
    id v19 = v11;
    id v28 = v19;
    uint64_t v29 = self;
    id v30 = v10;
    id v9 = v21;
    id v20 = v21;
    id v31 = v20;
    dispatch_apply(v18, 0, block);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_89;
    v24[3] = &unk_1E5875E18;
    id v25 = v19;
    id v26 = v20;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_2;
    v22[3] = &unk_1E5875E18;
    v22[4] = self;
    id v23 = v25;
    [v26 performTransaction:v24 completionHandler:v22 withPriority:0];
  }
}

void __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  double v4 = [v3 masterThumbFilePath];

  if (v4
    && (uint64_t v5 = (void *)MEMORY[0x1E4F1CB10],
        [v3 masterThumbFilePath],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v5 fileURLWithPath:v6],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v6,
        v4)
    && (CGImageSourceRef v7 = CGImageSourceCreateWithURL((CFURLRef)v4, 0)) != 0)
  {
    CGImageSourceRef v8 = v7;
    id v9 = objc_opt_class();
    id v10 = [v3 uuid];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = [v3 destinationThumbnailIndex];
    uint64_t v13 = [*(id *)(a1 + 56) thumbnailManager];
    uint64_t v14 = [v9 _writeCompressedTableThumbsFromMasterThumb:v8 uuid:v10 formats:v11 toIndex:v12 thumbnailManager:v13];

    [v3 setSucceeded:v14];
    CFRelease(v8);
  }
  else
  {
    uint64_t v15 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = [v3 uuid];
      int v17 = 138543362;
      size_t v18 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unable to open image source for masterThumb for asset uuid: %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }
}

void __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_89(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28E60] indexSet];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        CGImageSourceRef v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "asset", (void)v12);
        if (v9)
        {
          char v10 = [v8 succeeded];
          uint64_t v11 = [v8 destinationThumbnailIndex];
          if ((v10 & 1) == 0)
          {
            [v2 addIndex:v11];
            uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
          }
          [v9 setEffectiveThumbnailIndex:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    +[PLThumbnailIndexes recycleThumbnailIndexes:v2 inLibrary:*(void *)(a1 + 40)];
  }
}

void __71__PLTableThumbnailMigrator__rebuildTablesForBatch_inLibrary_toFormats___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        CGImageSourceRef v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "asset", (void)v9);
        CGImageSourceRef v8 = [v7 objectID];

        if (v8) {
          [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v8];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

- (id)_bulkMigratorQueue
{
  if (_bulkMigratorQueue_s_onceToken != -1) {
    dispatch_once(&_bulkMigratorQueue_s_onceToken, &__block_literal_global_91789);
  }
  id v2 = (void *)_bulkMigratorQueue_s_bulkMigratorQueue;
  return v2;
}

void __46__PLTableThumbnailMigrator__bulkMigratorQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("-[PLTableThumbnailMigrator _bulkMigratorQueue]_block_invoke", attr);
  id v2 = (void *)_bulkMigratorQueue_s_bulkMigratorQueue;
  _bulkMigratorQueue_s_bulkMigratorQueue = (uint64_t)v1;
}

- (PLTableThumbnailMigrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLTableThumbnailMigrator;
  id v2 = [(PLTableThumbnailMigrator *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_pendingAssetObjectIDsLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    pendingAssetObjectIDs = v3->_pendingAssetObjectIDs;
    v3->_pendingAssetObjectIDs = (NSMutableSet *)v4;
  }
  return v3;
}

+ (unint64_t)countOfAssetsPendingTableThumbRebuildInLibrary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PLTableThumbnailMigrator.m", 342, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PLTableThumbnailMigrator_countOfAssetsPendingTableThumbRebuildInLibrary___block_invoke;
  v10[3] = &unk_1E5873ED8;
  long long v12 = &v14;
  id v13 = a1;
  id v6 = v5;
  id v11 = v6;
  [v6 performBlockAndWait:v10];
  unint64_t v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

void __75__PLTableThumbnailMigrator_countOfAssetsPendingTableThumbRebuildInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 48) _fetchRequstForAssetsPendingTableRebuildWithLimit:500 excludingAssetIDs:0];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v7 = 0;
  uint64_t v4 = [v3 countForFetchRequest:v2 error:&v7];
  id v5 = v7;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to determine count of assets pending table thumb rebuild: %@", buf, 0xCu);
    }
  }
}

+ (id)_nextBatchOfItemsPendingTableRebuildInLibrary:(id)a3 excludingAssetIDs:(id)a4 sourceObjects:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 thumbnailManager];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__91777;
  long long v33 = __Block_byref_object_dispose__91778;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__91777;
  id v27 = __Block_byref_object_dispose__91778;
  id v28 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke;
  v16[3] = &unk_1E58713E0;
  id v11 = v8;
  id v17 = v11;
  id v22 = a1;
  id v12 = v9;
  id v18 = v12;
  id v20 = &v23;
  uint32_t v21 = &v29;
  id v13 = v10;
  id v19 = v13;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v16];
  if (a5) {
    *a5 = (id) v24[5];
  }
  id v14 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_2;
  v7[3] = &unk_1E58713E0;
  uint64_t v13 = *(void *)(a1 + 72);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v8 = v3;
  uint64_t v11 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  id v9 = v5;
  uint64_t v12 = v6;
  id v10 = *(id *)(a1 + 48);
  [v2 performBlockAndWait:v7];
}

void __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 72) _fetchRequstForAssetsPendingTableRebuildWithLimit:500 excludingAssetIDs:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v16 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v16];
  id v5 = v16;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_3;
  v12[3] = &unk_1E58713B8;
  uint64_t v15 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  uint64_t v9 = objc_msgSend(v8, "_pl_map:", v12);
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __106__PLTableThumbnailMigrator__nextBatchOfItemsPendingTableRebuildInLibrary_excludingAssetIDs_sourceObjects___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) _workItemForAsset:a2 library:*(void *)(a1 + 32) thumbnailManager:*(void *)(a1 + 40)];
}

+ (id)_workItemForAsset:(id)a3 library:(id)a4 thumbnailManager:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(PLThumbnailMigratorWorkItem);
  uint64_t v11 = [v9 uuid];
  [(PLThumbnailMigratorWorkItem *)v10 setUuid:v11];

  unint64_t v12 = +[PLThumbnailIndexes nextAvailableThumbnailIndexInLibrary:v8];
  [(PLThumbnailMigratorWorkItem *)v10 setDestinationThumbnailIndex:v12];
  id v13 = [v7 thumbnailJPEGPathForPhoto:v9];

  [(PLThumbnailMigratorWorkItem *)v10 setMasterThumbFilePath:v13];
  [(PLThumbnailMigratorWorkItem *)v10 setAsset:v9];

  return v10;
}

+ (BOOL)_writeCompressedTableThumbsFromMasterThumb:(CGImageSource *)a3 uuid:(id)a4 formats:(id)a5 toIndex:(unint64_t)a6 thumbnailManager:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  id v41 = 0;
  uint64_t v13 = +[PLTableThumbnailEncoder encodeThumbnailSource:a3 toFormats:v11 withUUID:v10 error:&v41];
  id v14 = v41;
  long long v35 = (void *)v13;
  if (v13)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (!v16)
    {
      BOOL v25 = 1;
      goto LABEL_25;
    }
    uint64_t v17 = v16;
    id v31 = v14;
    id v32 = v11;
    id v33 = v10;
    uint64_t v18 = *(void *)v38;
LABEL_4:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v38 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
      uint32_t v21 = objc_msgSend(v12, "thumbManagerForFormatID:", objc_msgSend(v20, "formatID", v31, v32));
      if ([v20 isTable])
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __109__PLTableThumbnailMigrator__writeCompressedTableThumbsFromMasterThumb_uuid_formats_toIndex_thumbnailManager___block_invoke;
        v36[3] = &unk_1E5871390;
        v36[4] = v20;
        id v22 = objc_msgSend(v35, "_pl_filter:", v36);
        uint64_t v23 = [v22 firstObject];

        if (!v23)
        {
          uint64_t v23 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v26 = [v20 formatID];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v43 = v26;
            *(_WORD *)&v43[4] = 2114;
            id v10 = v33;
            *(void *)&v43[6] = v33;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to find result for format: %hu, asset uuid: %{public}@", buf, 0x12u);
          }
          else
          {
            id v10 = v33;
          }
LABEL_23:
          id v14 = v31;
          id v11 = v32;

          goto LABEL_24;
        }
        v24 = -[NSObject entryDataForEntryLength:](v23, "entryDataForEntryLength:", [v21 entryLength]);
        if (([v21 writeEntryData:v24 toIndex:a6] & 1) == 0)
        {
          id v27 = PLThumbnailsGetLog();
          id v10 = v33;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v24 length];
            unsigned int v29 = [v20 formatID];
            *(_DWORD *)buf = 134218498;
            *(void *)v43 = v28;
            *(_WORD *)&v43[8] = 2114;
            *(void *)&v43[10] = v33;
            __int16 v44 = 2048;
            uint64_t v45 = v29;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to write compressed thumbnail image of len: %ld, for asset uuid: %{public}@, to table format: %ld", buf, 0x20u);
          }

          goto LABEL_23;
        }
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
        BOOL v25 = 1;
        if (v17) {
          goto LABEL_4;
        }
        id v11 = v32;
        id v10 = v33;
        id v14 = v31;
        goto LABEL_25;
      }
    }
  }
  uint64_t v15 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v43 = v10;
    *(_WORD *)&v43[8] = 2112;
    *(void *)&v43[10] = v14;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to generate compressed thumbnails for asset uuid: %{public}@, error:%@", buf, 0x16u);
  }
LABEL_24:
  BOOL v25 = 0;
LABEL_25:

  return v25;
}

uint64_t __109__PLTableThumbnailMigrator__writeCompressedTableThumbsFromMasterThumb_uuid_formats_toIndex_thumbnailManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 imageFormat];
  uint64_t v4 = [v3 isEqualToFormat:*(void *)(a1 + 32)];

  return v4;
}

+ (id)_fetchRequstForAssetsPendingTableRebuildWithLimit:(int64_t)a3 excludingAssetIDs:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1C0D0];
  id v8 = +[PLManagedAsset entityName];
  id v9 = [v7 fetchRequestWithEntityName:v8];

  if (a3) {
    [v9 setFetchLimit:a3];
  }
  id v10 = [a1 _predicateForAssetsPendingTableRebuild];
  [v9 setPredicate:v10];

  if ([v6 count])
  {
    id v11 = (void *)MEMORY[0x1E4F28BA0];
    id v12 = [v9 predicate];
    v20[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT self IN %@", v6];
    v20[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    uint64_t v15 = [v11 andPredicateWithSubpredicates:v14];
    [v9 setPredicate:v15];
  }
  [v9 setIncludesPropertyValues:1];
  [v9 setReturnsObjectsAsFaults:0];
  uint64_t v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  uint64_t v19 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  [v9 setSortDescriptors:v17];

  return v9;
}

+ (id)_predicateForAssetsPendingTableRebuild
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"thumbnailIndex", 4294967294);
}

@end