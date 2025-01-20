@interface PLThumbnailManager
+ (BOOL)hasRebuildingThumbnailsIndicatorAndRebuildingWithPathManager:(id)a3;
+ (id)_thumbnailRebuildIndicatorPathWithPathManager:(id)a3;
+ (id)masterThumbFilename;
+ (id)thumbnailIdentifierWithAssetUUID:(id)a3 directory:(id)a4 filename:(id)a5 bundleScope:(unsigned __int16)a6 pathManager:(id)a7;
- (BOOL)_downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 image:(id)a5 assetUUID:(id)a6;
- (BOOL)_performUncompressedTableDownscaleIntoDatas:(id)a3 image:(id)a4 assetUUID:(id)a5;
- (BOOL)_thumbnailLoadingAssetIsHiddenOrTrashed:(id)a3;
- (BOOL)hasExceededRebuildThumbnailRequestLimit;
- (BOOL)hasMissingThumbnailsInLibrary:(id)a3;
- (BOOL)hasRebuildThumbnailsRequest;
- (BOOL)isRebuildingThumbnails;
- (BOOL)resetThumbnailsForced:(BOOL)a3 isMissingTables:(BOOL)a4 inContext:(id)a5;
- (BOOL)resetThumbnailsWithResetType:(int64_t)a3 deferHintChanges:(BOOL)a4 inContext:(id)a5;
- (BOOL)setThumbnailsForThumbIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 assetUUID:(id)a5 kind:(signed __int16)a6 extension:(id)a7 withImage:(id)a8;
- (BOOL)wantsTableOnlyRebuild;
- (CGImage)newImageForAsset:(id)a3 format:(id)a4;
- (PLThumbnailManager)initWithPhotoLibraryPathManager:(id)a3 storeFromMigration:(id)a4;
- (id)_contextForConfigurationChanges;
- (id)_dataForAsset:(id)a3 format:(unsigned __int16)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10 imageDataFormat:(unsigned __int16 *)a11;
- (id)_missingThumbnailPredicate;
- (id)_rebuildThumbnailsQueue;
- (id)_tableDescriptions;
- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3;
- (id)dataForPhoto:(id)a3 format:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 width:(int *)a6 height:(int *)a7 bytesPerRow:(int *)a8 dataWidth:(int *)a9 dataHeight:(int *)a10 imageDataOffset:(int *)a11;
- (id)imageTableForFormat:(unsigned __int16)a3;
- (id)imageTableForFormat:(unsigned __int16)a3 readOnly:(BOOL)a4;
- (id)indexStatisticsForLibrary:(id)a3;
- (id)newSlowPersistenceManagers;
- (id)observerToken;
- (id)placeholderDataForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10;
- (id)thumbManagerForFormatID:(unsigned __int16)a3;
- (id)thumbManagerForFormatID:(unsigned __int16)a3 readOnly:(BOOL)a4;
- (id)thumbnailJPEGPathForPhoto:(id)a3;
- (int64_t)_diskFootprintOfTableThumbnailTables;
- (int64_t)_rebuildAssetThumbnailsWithLimit:(int)a3 library:(id)a4 error:(id *)a5;
- (int64_t)removeAllThumbnailsInContextForUrgentCacheDeleteRequest:(id)a3 dryRun:(BOOL)a4 count:(unint64_t *)a5;
- (unsigned)_supportedThumbnailFormatIDFromGeneralFormatID:(unsigned __int16)a3;
- (void)_discardAlreadyFailedAssetObjectIDsForRebuild;
- (void)_recordRebuildThumbnailsAttempt;
- (void)_removeMasterThumbDirectoriesWithFileManagerDelegate:(id)a3;
- (void)addRebuildThumbnailsRequest;
- (void)continueRebuildingTableThumbsInLibrary:(id)a3;
- (void)dealloc;
- (void)deleteThumbnailsWithIdentifier:(id)a3 orIndex:(unint64_t)a4 uuid:(id)a5;
- (void)discardCachedThumbnailDownscalerContexts;
- (void)endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3 withToken:(id)a4;
- (void)handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:(id)a3;
- (void)preheatThumbnailDataWithFormat:(unsigned __int16)a3 thumbnailIndexes:(id)a4;
- (void)reStampConfigAsNeedingTableThumbMigration;
- (void)rebuildAllMissingThumbnailsInLibrary:(id)a3;
- (void)removeObsoleteMetadata;
- (void)removeRebuildThumbnailsRequest:(const char *)a3;
- (void)setObserverToken:(id)a3;
- (void)setThumbnailsForAsset:(id)a3 withImage:(id)a4;
@end

@implementation PLThumbnailManager

+ (id)masterThumbFilename
{
  if (masterThumbFilename_s_onceToken != -1) {
    dispatch_once(&masterThumbFilename_s_onceToken, &__block_literal_global_196);
  }
  v2 = (void *)masterThumbFilename_s_string;
  return v2;
}

- (id)dataForPhoto:(id)a3 format:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 width:(int *)a6 height:(int *)a7 bytesPerRow:(int *)a8 dataWidth:(int *)a9 dataHeight:(int *)a10 imageDataOffset:(int *)a11
{
  BOOL v23 = a5;
  uint64_t v14 = a4;
  id v16 = a3;
  unsigned __int16 v24 = v14;
  BOOL v17 = +[PLImageLoadingUtilities canAccessImageForAsset:v16];
  if (v17)
  {
    v18 = [(PLThumbnailManager *)self _dataForAsset:v16 format:v14 width:a6 height:a7 bytesPerRow:a8 dataWidth:a9 dataHeight:a10 imageDataOffset:a11 imageDataFormat:&v24];
  }
  else
  {
    v18 = 0;
  }
  if (v23 && !v18)
  {
    BOOL v19 = [v16 effectiveThumbnailIndex] != 0x7FFFFFFFFFFFFFFFLL && v17;
    if (v19 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v18 = 0;
    }
    else
    {
      v20 = +[PLPlaceholderThumbnailManager sharedManager];
      uint64_t v21 = v24;
      [v16 imageSize];
      v18 = objc_msgSend(v20, "placeholderDataForFormat:photoImageSize:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v21, a6, a7, a8, a9, a10, a11);
    }
  }

  return v18;
}

- (id)_dataForAsset:(id)a3 format:(unsigned __int16)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10 imageDataFormat:(unsigned __int16 *)a11
{
  uint64_t v15 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  if (v17)
  {
    uint64_t v18 = [(PLThumbnailManager *)self _supportedThumbnailFormatIDFromGeneralFormatID:v15];
    BOOL v19 = [(PLThumbnailManager *)self thumbManagerForFormatID:v18];
    char v20 = [v19 usesThumbIdentifiers];
    if (!v19)
    {
      BOOL v23 = 0;
      if (!a11) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    char v21 = v20;
    uint64_t v57 = [v17 effectiveThumbnailIndex];
    char v56 = v21;
    if [v19 usesThumbIdentifiers] && (objc_opt_respondsToSelector())
    {
      v22 = [v17 thumbnailIdentifier];
    }
    else
    {
      v22 = 0;
    }
    v53 = a5;
    v54 = a6;
    v55 = a7;
    BOOL v23 = [v19 imageDataWithIdentifier:v22 orIndex:v57 width:a5 height:a6 bytesPerRow:a7 dataWidth:a8 dataHeight:a9 dataOffset:a10];
    if (![v19 isReadOnly] || v23 || objc_msgSend(v17, "cloudPlaceholderKind") == 2) {
      goto LABEL_26;
    }
    if (!self->_previouslyRequestedThumbnailFixOIDs)
    {
      unsigned __int16 v24 = (NSMutableSet *)objc_opt_new();
      previouslyRequestedThumbnailFixOIDs = self->_previouslyRequestedThumbnailFixOIDs;
      self->_previouslyRequestedThumbnailFixOIDs = v24;
    }
    if ((v56 & 1) == 0
      && -[PLThumbnailManager _thumbnailLoadingAssetIsHiddenOrTrashed:](self, "_thumbnailLoadingAssetIsHiddenOrTrashed:", v17)|| (v26 = self->_previouslyRequestedThumbnailFixOIDs, [v17 objectID], v52 = a8, v27 = objc_claimAutoreleasedReturnValue(), LOBYTE(v26) = -[NSMutableSet containsObject:](v26, "containsObject:", v27), v27, a8 = v52, (v26 & 1) != 0))
    {
LABEL_26:
      if ([v19 isReadOnly]) {
        goto LABEL_43;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v44 = [v17 uuid];
        v45 = (void *)v44;
        if (v23 && (!v44 || ([v19 validateData:v23 withToken:v44] & 1) != 0)) {
          goto LABEL_42;
        }
      }
      else
      {
        v45 = 0;
        if (v23)
        {
LABEL_42:

LABEL_43:
          if (!a11)
          {
LABEL_45:

            goto LABEL_46;
          }
LABEL_44:
          *a11 = v18;
          goto LABEL_45;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v46 = v17;
        v47 = v46;
        uint64_t v48 = v57;
        if (v57 == 0x7FFFFFFFFFFFFFFFLL) {
          char v49 = 1;
        }
        else {
          char v49 = v56;
        }
        if ((v49 & 1) != 0
          || ([v46 hidden] & 1) == 0 && (uint64_t v48 = v57, !objc_msgSend(v47, "trashedState")))
        {
          [v47 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
          uint64_t v50 = [v19 imageDataWithIdentifier:v22 orIndex:v48 width:v53 height:v54 bytesPerRow:v55 dataWidth:a8 dataHeight:a9 dataOffset:a10];

          BOOL v23 = (void *)v50;
        }
      }
      goto LABEL_42;
    }
    v28 = self->_previouslyRequestedThumbnailFixOIDs;
    v29 = [v17 objectID];
    [(NSMutableSet *)v28 addObject:v29];

    v30 = NSString;
    v31 = [v17 objectID];
    v32 = [v30 stringWithFormat:@"%@", v31];

    v33 = PLThumbnailsGetLog();
    v34 = v33;
    if (v57 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v60 = v32;
        v35 = "Requesting thumbnail for %{public}@";
        v36 = v34;
        os_log_type_t v37 = OS_LOG_TYPE_ERROR;
        uint32_t v38 = 12;
LABEL_22:
        _os_log_impl(&dword_19B3C7000, v36, v37, v35, buf, v38);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v60 = v32;
      __int16 v61 = 2048;
      uint64_t v62 = v57;
      v35 = "Fixing thumbnail for %{public}@ at index %lu";
      v36 = v34;
      os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
      uint32_t v38 = 22;
      goto LABEL_22;
    }

    [(NSLock *)self->_fixLock lock];
    requestedThumbnailFixAssets = self->_requestedThumbnailFixAssets;
    if (!requestedThumbnailFixAssets)
    {
      v40 = (NSMutableSet *)objc_opt_new();
      v41 = self->_requestedThumbnailFixAssets;
      self->_requestedThumbnailFixAssets = v40;

      requestedThumbnailFixAssets = self->_requestedThumbnailFixAssets;
    }
    [(NSMutableSet *)requestedThumbnailFixAssets addObject:v17];
    [(NSLock *)self->_fixLock unlock];
    v42 = objc_msgSend(v17, "pl_photoLibrary");
    dispatch_time(0, 1000000000);
    v58 = v42;
    id v43 = v42;
    pl_dispatch_after();

    a8 = v52;
    goto LABEL_26;
  }
  BOOL v23 = 0;
LABEL_46:

  return v23;
}

- (id)thumbManagerForFormatID:(unsigned __int16)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v7 = objc_opt_class();
  return [(PLThumbnailManagerCore *)self thumbManagerForFormatID:v5 thumbFileManagerClass:v7 readOnly:v4];
}

- (id)thumbManagerForFormatID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = PLIsAssetsd() ^ 1;
  return [(PLThumbnailManager *)self thumbManagerForFormatID:v3 readOnly:v5];
}

- (unsigned)_supportedThumbnailFormatIDFromGeneralFormatID:(unsigned __int16)a3
{
  unsigned __int16 v3 = a3;
  if (a3 == 3039)
  {
    BOOL v4 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Low res full screen format is unsupported, clients should use the image manager and specifiy an image size", v8, 2u);
    }

    uint64_t v5 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
    v6 = [v5 masterThumbnailFormat];
    unsigned __int16 v3 = [v6 formatID];
  }
  return v3;
}

+ (id)_thumbnailRebuildIndicatorPathWithPathManager:(id)a3
{
  unsigned __int16 v3 = [a3 photoDirectoryWithType:11 createIfNeeded:1 error:0];
  BOOL v4 = [v3 stringByAppendingPathComponent:@"rebuild"];

  return v4;
}

+ (BOOL)hasRebuildingThumbnailsIndicatorAndRebuildingWithPathManager:(id)a3
{
  id v4 = a3;
  PLIsAssetsd();
  uint64_t v5 = [a1 _thumbnailRebuildIndicatorPathWithPathManager:v4];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  BOOL v11 = 0;
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v5];
    v9 = [v8 objectForKey:PLThumbnailRequestRetriesLeftKey];
    int v10 = [v9 intValue];

    if (v10 > 0) {
      BOOL v11 = 1;
    }
  }

  return v11;
}

void __41__PLThumbnailManager_masterThumbFilename__block_invoke()
{
  v0 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  id v5 = [v0 masterThumbnailFormat];

  v1 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v5, "formatID"));
  v2 = [v1 stringValue];
  uint64_t v3 = [v2 stringByAppendingString:@".JPG"];
  id v4 = (void *)masterThumbFilename_s_string;
  masterThumbFilename_s_string = v3;
}

- (PLThumbnailManager)initWithPhotoLibraryPathManager:(id)a3 storeFromMigration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLThumbnailManager.m", 262, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)PLThumbnailManager;
  v9 = [(PLThumbnailManagerCore *)&v31 initWithPhotoLibraryPathManager:v7];
  int v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_migrationStore, v8);
    if (!v8)
    {
      uint64_t v11 = [(id)objc_opt_class() requiredThumbnailResetTypeWithPathManager:v7 comparedToConfigPhase:1];
      if (PLIsAssetsd() & 1) != 0 || (MEMORY[0x19F38C0C0]())
      {
        v12 = [(PLThumbnailManager *)v10 _contextForConfigurationChanges];
        [(PLThumbnailManager *)v10 resetThumbnailsWithResetType:v11 deferHintChanges:0 inContext:v12];
      }
      else
      {
        [(PLThumbnailManager *)v10 resetThumbnailsWithResetType:v11 deferHintChanges:0 inContext:0];
      }
    }
    if ((PLIsAssetsd() & 1) == 0)
    {
      objc_initWeak(&location, v10);
      v13 = DCIM_applicationBackgroundedNotificationName();
      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke;
      v28[3] = &unk_1E5864720;
      objc_copyWeak(&v29, &location);
      uint64_t v15 = [v14 addObserverForName:v13 object:0 queue:0 usingBlock:v28];
      [(PLThumbnailManager *)v10 setObserverToken:v15];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    id v16 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    fixLock = v10->_fixLock;
    v10->_fixLock = v16;

    id v18 = objc_initWeak(&location, v10);
    id v19 = objc_alloc(MEMORY[0x1E4F8B948]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke_2;
    v26[3] = &unk_1E5874070;
    objc_copyWeak(&v27, &location);
    uint64_t v20 = [v19 initWithBlock:v26];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    slowPersistenceManagers = v10->_slowPersistenceManagers;
    v10->_slowPersistenceManagers = (PLLazyObject *)v20;

    v22 = objc_alloc_init(PLThumbnailCascadingDownscaleContext);
    downscaleContext = v10->_downscaleContext;
    v10->_downscaleContext = v22;
  }
  return v10;
}

- (void)setObserverToken:(id)a3
{
}

- (BOOL)resetThumbnailsWithResetType:(int64_t)a3 deferHintChanges:(BOOL)a4 inContext:(id)a5
{
  BOOL v5 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = objc_opt_class();
  int v10 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v11 = [v9 thumbnailConfigurationDictWithPathManager:v10];

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 == 3)
    {
      id v16 = objc_opt_class();
      id v17 = [(PLThumbnailManagerCore *)self pathManager];
      [v16 stampThumbnailConfiguration:v11 toFile:0 withPathManager:v17];
    }
    BOOL v18 = 1;
  }
  else if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]())
  {
    v12 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v26[0] = 67109120;
      v26[1] = a3 != 2;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Removing unwanted thumbnail tables (unsupportedOnly: %d)...", (uint8_t *)v26, 8u);
    }

    v13 = objc_opt_class();
    uint64_t v14 = [(PLThumbnailManagerCore *)self pathManager];
    [v13 removeThumbnailTablesUnsupportedOnly:a3 != 2 withPathManager:v14];

    if (a3 == 2)
    {
      uint64_t v15 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Deleting master thumbs...", (uint8_t *)v26, 2u);
      }

      [(PLThumbnailManager *)self _removeMasterThumbDirectoriesWithFileManagerDelegate:0];
    }
    else
    {
      [(id)objc_opt_class() markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:v11];
    }
    id v19 = objc_opt_class();
    uint64_t v20 = [(PLThumbnailManagerCore *)self pathManager];
    [v19 stampThumbnailConfiguration:v11 toFile:1 withPathManager:v20];

    char v21 = PLThumbnailsGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a3 == 2)
    {
      if (v22)
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Resetting all thumbnail indexes for full rebuild...", (uint8_t *)v26, 2u);
      }

      BOOL v23 = +[PLModelMigrator resetThumbnailIndexesAndInitiateThumbnailRebuildRequestIfSuccessfulForForThumbnailManager:self deferHintChanges:v5 inContext:v8];
    }
    else
    {
      if (v22)
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Marking assets with thumbs for table rebuild...", (uint8_t *)v26, 2u);
      }

      BOOL v23 = +[PLModelMigrator markAssetsWithThumbsForTableRebuildInContext:v8];
    }
    BOOL v18 = v23;
  }
  else
  {
    unsigned __int16 v24 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26[0]) = 0;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Only assetsd can reset thumbnails", (uint8_t *)v26, 2u);
    }

    BOOL v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_slowPersistenceManagers, 0);
  objc_destroyWeak((id *)&self->_migrationStore);
  objc_storeStrong((id *)&self->_downscaleContext, 0);
  objc_storeStrong((id *)&self->_fixLock, 0);
  objc_storeStrong((id *)&self->_alreadyFailedAssetObjectIDsForRebuild, 0);
  objc_storeStrong((id *)&self->_requestedThumbnailFixAssets, 0);
  objc_storeStrong((id *)&self->_previouslyRequestedThumbnailFixOIDs, 0);
}

- (id)observerToken
{
  return self->_observerToken;
}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke(int8x16_t *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_2;
  v2[3] = &unk_1E5875E18;
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  [(id)v1.i64[0] performBlock:v2];
}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) lock];
  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 80) allObjects];
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 96) unlock];
  uint64_t v2 = [v15 count];
  int8x16_t v3 = v15;
  if (v2)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = v5;
      unint64_t v7 = v5 - v4;
      if (v7 < 0x14)
      {
        uint64_t v11 = v15;
      }
      else
      {
        id v8 = [*(id *)(a1 + 40) assetsdClient];
        v9 = [v8 libraryClient];
        int v10 = objc_msgSend(v15, "subarrayWithRange:", v4, v7);
        [v9 updateThumbnailsForPhotos:v10 assignNewIndex:1 forceRefresh:0 completionHandler:&__block_literal_global_212];

        uint64_t v11 = v15;
        unint64_t v4 = v6;
      }
      unint64_t v5 = v6 + 1;
    }
    while (v6 + 1 < [v11 count]);
    int8x16_t v3 = v15;
    if (v6 >= v4)
    {
      v12 = [*(id *)(a1 + 40) assetsdClient];
      v13 = [v12 libraryClient];
      uint64_t v14 = objc_msgSend(v15, "subarrayWithRange:", v4, v5 - v4);
      [v13 updateThumbnailsForPhotos:v14 assignNewIndex:1 forceRefresh:0 completionHandler:&__block_literal_global_215];

      int8x16_t v3 = v15;
    }
  }
}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_213(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    int8x16_t v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Failed to update thumbnails for photos, error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __121__PLThumbnailManager__dataForAsset_format_width_height_bytesPerRow_dataWidth_dataHeight_imageDataOffset_imageDataFormat___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    int8x16_t v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Failed to update thumbnails for photos, error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)_thumbnailLoadingAssetIsHiddenOrTrashed:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v3 isHidden])
  {
    char v4 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 isTrashed];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)thumbnailJPEGPathForPhoto:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  uint64_t v6 = [v5 masterThumbnailFormat];
  uint64_t v7 = [v6 formatID];

  id v8 = [(PLThumbnailManager *)self thumbManagerForFormatID:v7];
  if ([v8 usesThumbIdentifiers])
  {
    v9 = [v4 thumbnailIdentifier];
    int v10 = [v8 thumbnailPathForThumbIdentifier:v9];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (id)indexStatisticsForLibrary:(id)a3
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLThumbnailIndexes occupiedThumbnailIndexesWithLibrary:v4 fetchTimestampToUpdate:0];
  unint64_t v6 = [v5 rangeCount];
  unint64_t v7 = [v5 count];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  id v8 = +[PLManagedAsset entityName];
  v9 = +[PLFetchRequest fetchRequestWithEntityName:v8];

  [v9 setResultType:2];
  v37[0] = @"objectID";
  v37[1] = @"dateCreated";
  v37[2] = @"thumbnailIndex";
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
  [v9 setPropertiesToFetch:v10];

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"thumbnailIndex", 0);
  [v9 setPredicate:v11];

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
  v36 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  [v9 setSortDescriptors:v13];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke;
  v28[3] = &unk_1E5875340;
  id v14 = v4;
  id v29 = v14;
  id v15 = v9;
  id v30 = v15;
  objc_super v31 = &v32;
  [v14 performBlockAndWait:v28];
  unint64_t v16 = [v5 count];
  unint64_t v17 = v33[3];
  unint64_t v18 = [v5 count];
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v20 = (float)v6 / (float)v7;
  char v21 = [NSNumber numberWithFloat:v20];
  [v19 setObject:v21 forKeyedSubscript:@"fragmentation"];

  *(float *)&double v22 = (float)((float)v16 - (float)v17) / (float)v18;
  BOOL v23 = [NSNumber numberWithFloat:v22];
  [v19 setObject:v23 forKeyedSubscript:@"orderedness"];

  unsigned __int16 v24 = [(PLThumbnailManagerCore *)self fastThumbPersistenceManagers];
  v25 = [v24 firstObject];

  if (v25)
  {
    v26 = [v25 fileStatistics];
    [v19 addEntriesFromDictionary:v26];
  }
  _Block_object_dispose(&v32, 8);

  return v19;
}

void __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke_2;
  v6[3] = &unk_1E58646D0;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = v7;
  v6[5] = v4;
  id v5 = (id)[v2 enumerateObjectsFromFetchRequest:v3 count:&v9 batchSize:10000 usingBlock:v6];

  _Block_object_dispose(v7, 8);
}

void __48__PLThumbnailManager_indexStatisticsForLibrary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 objectForKeyedSubscript:@"thumbnailIndex"];
  int v6 = [v5 intValue];

  if (a3 && v6 < *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
}

- (int64_t)_diskFootprintOfTableThumbnailTables
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v4 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v3];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = (unsigned __int16)[*(id *)(*((void *)&v14 + 1) + 8 * i) intValue];
        uint64_t v11 = [MEMORY[0x1E4F8B938] formatWithID:v10];
        if ([v11 isTable])
        {
          v12 = [(PLThumbnailManager *)self thumbManagerForFormatID:v10];
          v7 += [v12 fileLength];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_tableDescriptions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v5 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)[*(id *)(*((void *)&v13 + 1) + 8 * i) intValue]);
        uint64_t v11 = [v10 _debugDescription];
        if (v11) {
          [v3 appendString:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)placeholderDataForFormat:(unsigned __int16)a3 photoImageSize:(CGSize)a4 width:(int *)a5 height:(int *)a6 bytesPerRow:(int *)a7 dataWidth:(int *)a8 dataHeight:(int *)a9 imageDataOffset:(int *)a10
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v17 = a3;
  uint64_t v18 = +[PLPlaceholderThumbnailManager sharedManager];
  uint64_t v19 = objc_msgSend(v18, "placeholderDataForFormat:photoImageSize:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v17, a5, a6, a7, a8, a9, width, height, a10);

  return v19;
}

- (void)preheatThumbnailDataWithFormat:(unsigned __int16)a3 thumbnailIndexes:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [(PLThumbnailManager *)self thumbManagerForFormatID:[(PLThumbnailManager *)self _supportedThumbnailFormatIDFromGeneralFormatID:v4]];
  [v7 preheatDataForThumbnailIndexes:v6];
}

- (void)deleteThumbnailsWithIdentifier:(id)a3 orIndex:(unint64_t)a4 uuid:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v11 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v10];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)[*(id *)(*((void *)&v17 + 1) + 8 * v15) intValue]);
        if (objc_opt_respondsToSelector())
        {
          [v16 deleteEntryWithIdentifier:v8 orIndex:a4 uuid:v9];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v16 deleteEntryWithIdentifier:v8];
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (BOOL)setThumbnailsForThumbIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 assetUUID:(id)a5 kind:(signed __int16)a6 extension:(id)a7 withImage:(id)a8
{
  unsigned int v10 = a6;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ((PLIsAssetsd() & 1) == 0)
  {
    __int16 v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2 object:self file:@"PLThumbnailManager.m" lineNumber:1326 description:@"Can only set thumbnails from assetsd"];
  }
  [v18 pixelSize];
  if (v20 <= 0.0 || v19 <= 0.0)
  {
    if (v10 < 2)
    {
      char v21 = 0;
      goto LABEL_36;
    }
    unint64_t v65 = a4;
    uint64_t v22 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Writing generic thumbnails for non image/video asset uuid: %{public}@...", buf, 0xCu);
    }

    BOOL v23 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
    unsigned __int16 v24 = [v23 masterThumbnailFormat];
    uint64_t v25 = [v24 formatID];

    v64 = [MEMORY[0x1E4F8B938] formatWithID:v25];
    [v64 size];
    double v27 = v26;
    double v29 = v28;
    id v66 = 0;
    *(void *)buf = 0;
    PLGenericImageNameForExtension(v17, (__CFString **)buf, &v66);
    id v30 = *(id *)buf;
    id v31 = v66;
    id v32 = v30;
    v33 = PLPhotoLibraryServicesFrameworkBundle();
    uint64_t v34 = [v33 pathForResource:v32 ofType:@"png"];
    uint64_t v62 = v32;

    uint64_t v35 = DCIM_newPLImageWithContentsOfFile();
    v36 = (CGImage *)DCIM_CGImageRefFromPLImage();
    os_log_type_t v37 = CGImageRetain(v36);

    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (v31)
    {
      PLPhysicalScreenScale();
      v40 = DCIM_boldSystemFontOfSize();
      v41 = DCIM_blackColor();
      v42 = DCIM_labelAttributesWithFontAndColor();

      CFAttributedStringRef v43 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v31 attributes:v42];
      uint64_t v44 = CTLineCreateWithAttributedString(v43);
      v45 = v44;
      if (v44)
      {
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v44, 0x10uLL);
        double width = BoundsWithOptions.size.width;
        double height = BoundsWithOptions.size.height;
      }

      if (v37) {
        goto LABEL_14;
      }
    }
    else
    {
      v45 = 0;
      if (v37)
      {
LABEL_14:
        double v46 = (double)CGImageGetWidth(v37);
        double v47 = (double)CGImageGetHeight(v37);
LABEL_21:
        uint64_t v63 = self;
        BOOL v49 = v46 <= v27 && v47 <= v29;
        uint64_t v50 = v31;
        if (!v49)
        {
          PLSizeFromCGSize();
          PLSizeFromCGSize();
          PLCGSizeScaledToFitSize();
          double v46 = v51;
          double v47 = v52;
        }
        double v53 = (v29 - (height + v47)) * 0.5;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v55 = CGBitmapContextCreate(0, (unint64_t)v27, (unint64_t)v29, 8uLL, 0, DeviceRGB, 5u);
        char v56 = CGColorCreate(DeviceRGB, kGenericImageBackgroundColor);
        CGContextSetFillColorWithColor(v55, v56);
        CGColorRelease(v56);
        CGColorSpaceRelease(DeviceRGB);
        v72.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
        v72.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
        v72.size.double width = v27;
        v72.size.double height = v29;
        CGContextFillRect(v55, v72);
        if (v37)
        {
          CGContextSetBlendMode(v55, kCGBlendModeMultiply);
          CGContextSetAlpha(v55, 0.25);
          v73.origin.x = round((v27 - v46) * 0.5);
          v73.origin.y = height + v53;
          v73.size.double width = v46;
          v73.size.double height = v47;
          CGContextDrawImage(v55, v73, v37);
          CGImageRelease(v37);
        }
        if (v45)
        {
          CGContextSetTextPosition(v55, round((v27 - width) * 0.5), v53);
          CTLineDraw(v45, v55);
          CFRelease(v45);
        }
        Image = CGBitmapContextCreateImage(v55);
        CGContextRelease(v55);

        v58 = [[PLImageContainer alloc] initWithCGImage:Image];
        CGImageRelease(Image);
        char v21 = [(PLThumbnailManager *)v63 _downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:v15 thumbnailIndex:v65 image:v58 assetUUID:v16];
        if ((v21 & 1) == 0)
        {
          v59 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v16;
            _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_ERROR, "Error writing generic thumbnails for asset uuid: %{public}@.", buf, 0xCu);
          }
        }
        uint64_t v48 = v64;
        goto LABEL_35;
      }
    }
    double v46 = *MEMORY[0x1E4F1DB30];
    double v47 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_21;
  }
  if (![(PLThumbnailManager *)self _downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:v15 thumbnailIndex:a4 image:v18 assetUUID:v16])
  {
    uint64_t v48 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v16;
      __int16 v68 = 2114;
      id v69 = v18;
      _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Error writing thumbnails for asset uuid: %{public}@ from image container: %{public}@.", buf, 0x16u);
    }
    char v21 = 0;
LABEL_35:

    goto LABEL_36;
  }
  char v21 = 1;
LABEL_36:

  return v21;
}

- (void)setThumbnailsForAsset:(id)a3 withImage:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 effectiveThumbnailIndex];
  id v9 = [v6 thumbnailIdentifier];
  unsigned int v10 = [v6 uuid];
  uint64_t v11 = [v6 kind];
  uint64_t v12 = [v6 pathForOriginalFile];
  uint64_t v13 = [v12 pathExtension];
  uint64_t v14 = [v13 uppercaseString];
  BOOL v15 = [(PLThumbnailManager *)self setThumbnailsForThumbIdentifier:v9 thumbnailIndex:v8 assetUUID:v10 kind:v11 extension:v14 withImage:v7];

  id v16 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v6 uuid];
    int v25 = 138412546;
    double v26 = v17;
    __int16 v27 = 1024;
    BOOL v28 = v15;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Wrote thumbnails for asset %@ with success: %d", (uint8_t *)&v25, 0x12u);
  }
  char v18 = v8 == 0x7FFFFFFFFFFFFFFFLL || v15;
  if ((v18 & 1) == 0)
  {
    double v19 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = [v6 uuid];
      int v25 = 138543362;
      double v26 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Removing existing thumbnailIndex for asset uuid: %{public}@...", (uint8_t *)&v25, 0xCu);
    }
    char v21 = [v6 thumbnailIdentifier];
    uint64_t v22 = [v6 uuid];
    [(PLThumbnailManager *)self deleteThumbnailsWithIdentifier:v21 orIndex:v8 uuid:v22];

    [v6 setEffectiveThumbnailIndex:0x7FFFFFFFFFFFFFFFLL];
    BOOL v23 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v8];
    unsigned __int16 v24 = [v6 photoLibrary];
    +[PLThumbnailIndexes recycleThumbnailIndexes:v23 inLibrary:v24];
  }
}

- (BOOL)_downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 image:(id)a5 assetUUID:(id)a6
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v9 = a5;
  id v72 = a6;
  uint64_t v70 = v9;
  [v9 pixelSize];
  double v11 = v10;
  double v13 = v12;
  id v66 = self;
  uint64_t v14 = [(PLThumbnailManagerCore *)self fastThumbPersistenceManagers];
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  char v95 = 1;
  BOOL v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v88 objects:v106 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v89 != v18) {
          objc_enumerationMutation(v16);
        }
        double v20 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        char v21 = [v20 format];
        BOOL v22 = [v21 thumbnailKind] == 1;

        if (v22)
        {
          BOOL v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v20, "entryLength"));
          [v15 addObject:v23];
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v88 objects:v106 count:16];
    }
    while (v17);
  }

  if ([v16 count])
  {
    if ([v15 count])
    {
      BOOL v24 = [(PLThumbnailManager *)v66 _performUncompressedTableDownscaleIntoDatas:v15 image:v70 assetUUID:v72];
      *((unsigned char *)v93 + 24) = v24;
      if (v24)
      {
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        int v25 = v16;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v84 objects:v105 count:16];
        if (v26)
        {
          uint64_t v27 = 0;
          uint64_t v67 = *(void *)v85;
          while (2)
          {
            uint64_t v68 = v26;
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v85 != v67) {
                objc_enumerationMutation(v25);
              }
              uint64_t v29 = *(void **)(*((void *)&v84 + 1) + 8 * j);
              id v30 = [v29 format];
              BOOL v31 = [v30 thumbnailKind] == 1;

              if (v31)
              {
                id v32 = [v15 objectAtIndex:v27];
                int v33 = [v29 formatSideLen];
                objc_msgSend(MEMORY[0x1E4F8B860], "centeredRectForSourceSize:destinationSize:", v11, v13, (double)v33, (double)v33);
                double v35 = v34;
                double v37 = v36;
                uint64_t v38 = PLUUIDBytesFromString();
                uint64_t v40 = v39;
                id v41 = v32;
                uint64_t v42 = [v41 mutableBytes];
                uint64_t v43 = [v41 length] + v42;
                *(void *)(v43 - 28) = v38;
                *(void *)(v43 - 20) = v40;
                *(_DWORD *)(v43 - 12) = v35;
                *(void *)(v43 - 8) = v37;
                int v44 = [v29 writeEntryData:v41 toIndex:a4];
                *((unsigned char *)v93 + 24) = v44;
                if (!v44)
                {
                  v45 = PLThumbnailsGetLog();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v46 = [v41 length];
                    int v47 = [v29 formatSideLen];
                    *(_DWORD *)buf = 134218754;
                    uint64_t v98 = v46;
                    __int16 v99 = 2048;
                    id v100 = (id)MEMORY[0x1E4F148E0];
                    __int16 v101 = 2114;
                    id v102 = v72;
                    __int16 v103 = 1024;
                    int v104 = v47;
                    _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "Failed to write table entry data (len: %lu), to index: %lu for asset uuid %{public}@ in format with side len: %d", buf, 0x26u);
                  }

                  goto LABEL_29;
                }

                ++v27;
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v84 objects:v105 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        int v25 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v98 = (uint64_t)v72;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to downscale thumbnail image container into table datas for asset uuid: %{public}@", buf, 0xCu);
        }
      }
LABEL_29:
    }
    uint64_t v48 = objc_opt_class();
    BOOL v49 = [(PLThumbnailManagerCore *)v66 pathManager];
    uint64_t v50 = [v48 tableThumbnailFormatsForConfigPhase:1 withPathManager:v49];

    double v51 = objc_msgSend(v50, "_pl_filter:", &__block_literal_global_158);
    if (![v51 count]) {
      goto LABEL_49;
    }
    double v52 = [v70 data];

    if (v52)
    {
      CFDataRef v53 = [v70 data];
      CGImageSourceRef v54 = CGImageSourceCreateWithData(v53, 0);

      if (v54)
      {
        id v83 = 0;
        v55 = +[PLTableThumbnailEncoder encodeThumbnailSource:v54 toFormats:v51 withUUID:v72 error:&v83];
        id v56 = v83;
        CFRelease(v54);
        if (!v55)
        {
          uint64_t v57 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v98 = (uint64_t)v72;
            __int16 v99 = 2112;
            id v100 = v56;
            v58 = "Failed to encode thumbnail image data source into compressed tables for asset uuid: %{public}@, error: %@";
LABEL_40:
            _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);
            goto LABEL_45;
          }
          goto LABEL_45;
        }
      }
      else
      {
        v55 = 0;
        id v56 = 0;
      }
    }
    else
    {
      if (![v70 CGImage])
      {
        uint64_t v57 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v98 = (uint64_t)v72;
          _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Failed to downscale thumbnail image container into compressed table datas for asset uuid: %{public}@, image container missing data or imageRef", buf, 0xCu);
        }
        id v56 = 0;
        goto LABEL_45;
      }
      id v82 = 0;
      v55 = +[PLTableThumbnailEncoder encodeThumbnailImage:toFormats:withUUID:error:](PLTableThumbnailEncoder, "encodeThumbnailImage:toFormats:withUUID:error:", [v70 CGImage], v51, v72, &v82);
      id v56 = v82;
      if (!v55)
      {
        uint64_t v57 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v98 = (uint64_t)v72;
          __int16 v99 = 2112;
          id v100 = v56;
          v58 = "Failed to encode thumbnail image into compressed table datas for asset uuid: %{public}@, error: %@";
          goto LABEL_40;
        }
LABEL_45:

        v55 = 0;
        *((unsigned char *)v93 + 24) = 0;
      }
    }
    if (*((unsigned char *)v93 + 24))
    {
      v59 = objc_msgSend(v16, "_pl_filter:", &__block_literal_global_163);
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_2;
      v77[3] = &unk_1E58646A8;
      id v78 = v55;
      unint64_t v81 = a4;
      id v79 = v72;
      v80 = &v92;
      [v59 enumerateObjectsUsingBlock:v77];
    }
LABEL_49:
  }
  if (*((unsigned char *)v93 + 24))
  {
    [(PLLazyObject *)v66->_slowPersistenceManagers objectValue];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v61 = [v60 countByEnumeratingWithState:&v73 objects:v96 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v74;
      while (2)
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(void *)v74 != v62) {
            objc_enumerationMutation(v60);
          }
          if (([*(id *)(*((void *)&v73 + 1) + 8 * k) setImageForEntry:v70 withIdentifier:v69 orIndex:a4 photoUUID:v72 options:0] & 1) == 0)
          {
            *((unsigned char *)v93 + 24) = 0;
            goto LABEL_61;
          }
        }
        uint64_t v61 = [v60 countByEnumeratingWithState:&v73 objects:v96 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }
LABEL_61:

    BOOL v64 = *((unsigned char *)v93 + 24) != 0;
  }
  else
  {
    BOOL v64 = 0;
  }

  _Block_object_dispose(&v92, 8);
  return v64;
}

void __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 format];
  uint64_t v8 = (void *)a1[4];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_3;
  v19[3] = &unk_1E5871390;
  id v9 = v7;
  id v20 = v9;
  double v10 = objc_msgSend(v8, "_pl_filter:", v19);
  double v11 = [v10 firstObject];

  if (v11)
  {
    double v12 = objc_msgSend(v11, "entryDataForEntryLength:", objc_msgSend(v6, "entryLength"));
    if (([v6 writeEntryData:v12 toIndex:a1[7]] & 1) == 0)
    {
      double v13 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v12 length];
        uint64_t v15 = a1[5];
        unsigned int v16 = [v9 formatID];
        *(_DWORD *)buf = 134218498;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        uint64_t v24 = v15;
        __int16 v25 = 2048;
        uint64_t v26 = v16;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to write compressed thumbnail image of len: %ld, for asset uuid: %{public}@, to table format: %ld", buf, 0x20u);
      }

      *a4 = 1;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v17 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = (uint64_t)v6;
      __int16 v23 = 2114;
      uint64_t v24 = v18;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Can't match a PLPositionalImageTable: %{public}@ to a PLTableThumbnailEncoderResult for asset uuid: %{public}@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

uint64_t __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 imageFormat];
  uint64_t v4 = [v3 isEqualToFormat:*(void *)(a1 + 32)];

  return v4;
}

BOOL __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke_160(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 format];
  if ([v3 thumbnailKind] == 4)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 format];
    BOOL v4 = [v5 thumbnailKind] == 3;
  }
  return v4;
}

BOOL __114__PLThumbnailManager__downscaleAndWriteTableAndFileBackedThumbnailsWithIdentifier_thumbnailIndex_image_assetUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 thumbnailKind] == 4 || objc_msgSend(v2, "thumbnailKind") == 3;

  return v3;
}

- (BOOL)_performUncompressedTableDownscaleIntoDatas:(id)a3 image:(id)a4 assetUUID:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = objc_opt_class();
  double v12 = [(PLThumbnailManagerCore *)self pathManager];
  double v13 = [v11 uncompressedImageTableSpecificationsWithPathManager:v12];

  uint64_t v14 = [v9 ioSurface];
  uint64_t v15 = PLThumbnailsGetLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (!v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v10;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Unable to extract io surface for HW downscale for asset %@", buf, 0xCu);
    }
    id v18 = v8;
LABEL_13:

    char v21 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v10;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Attempting SW downscale to generate table thumbs for asset %@", buf, 0xCu);
    }

    uint64_t v22 = [v9 CGImage];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = [v9 data];

      if (!v15) {
        goto LABEL_26;
      }
      BOOL v28 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v10;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Decoding PLImageContainer data to image in order to attempt SW downscale to generate table thumbs for asset %@", buf, 0xCu);
      }

      uint64_t v29 = [v9 data];
      uint64_t v15 = DCIM_newPLImageWithData();

      if (!v15 || (uint64_t v23 = DCIM_CGImageRefFromPLImage()) == 0)
      {
LABEL_26:
        uint64_t v27 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v10;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "SW downscale failed for asset %@, unable to resolve a source image.", buf, 0xCu);
        }
        BOOL v20 = 0;
        id v25 = v18;
        goto LABEL_32;
      }
    }
    id v31 = v18;
    BOOL v24 = +[PLThumbnailUtilities performSWCascadingDownscaleTo5551OnImage:v23 withSpecifications:v13 destinationData:&v31];
    id v25 = v31;

    uint64_t v26 = PLThumbnailsGetLog();
    uint64_t v27 = v26;
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v10;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "SW downscale succeeded for asset %@", buf, 0xCu);
      }
      BOOL v20 = 1;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v10;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "SW downscale failed for asset %@", buf, 0xCu);
      }
      BOOL v20 = 0;
    }
LABEL_32:

    id v18 = v25;
    goto LABEL_33;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v10;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Attempting HW downscale to generate table thumbs for asset %@", buf, 0xCu);
  }

  id v32 = v8;
  BOOL v17 = +[PLThumbnailUtilities performHWCascadingDownscaleTo5551OnIOSurface:v14 withSpecifications:v13 destinationData:&v32 usingContext:self->_downscaleContext];
  id v18 = v32;

  double v19 = PLThumbnailsGetLog();
  uint64_t v15 = v19;
  if (!v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v10;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "HW downscale failed for asset %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v10;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "HW downscale succeeded for asset %@", buf, 0xCu);
  }
  BOOL v20 = 1;
LABEL_33:

  return v20;
}

- (void)discardCachedThumbnailDownscalerContexts
{
}

- (id)newSlowPersistenceManagers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v4 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v5 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (unsigned __int16)[*(id *)(*((void *)&v15 + 1) + 8 * v9) intValue];
        double v11 = [MEMORY[0x1E4F8B938] formatWithID:v10];
        if (([v11 isTable] & 1) == 0)
        {
          double v12 = [(PLThumbnailManager *)self thumbManagerForFormatID:v10];
          [v3 addObject:v12];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  double v13 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v20 = v3;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "#### slowThumbPersistenceManagers %@", buf, 0xCu);
  }

  return v3;
}

- (void)endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3 withToken:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v9 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v8];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)[v14 intValue]);
        long long v16 = [v7 objectForKey:v14];
        [v15 endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:v6 withToken:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(PLThumbnailManagerCore *)self pathManager];
  id v7 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:1 withPathManager:v6];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v13 = -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", (unsigned __int16)[v12 intValue]);
        uint64_t v14 = [v13 beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:v4];
        if (v14) {
          [v5 setObject:v14 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (CGImage)newImageForAsset:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = -[PLThumbnailManager thumbManagerForFormatID:](self, "thumbManagerForFormatID:", -[PLThumbnailManager _supportedThumbnailFormatIDFromGeneralFormatID:](self, "_supportedThumbnailFormatIDFromGeneralFormatID:", [a4 formatID]));
  if ([v7 usesThumbIdentifiers])
  {
    uint64_t v8 = [v6 thumbnailIdentifier];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (CGImage *)objc_msgSend(v7, "createImageWithIdentifier:orIndex:", v8, objc_msgSend(v6, "effectiveThumbnailIndex"));

  return v9;
}

- (void)handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:(id)a3
{
  id v4 = a3;
  PLIsAssetsd();
  [(PLThumbnailManager *)self _recordRebuildThumbnailsAttempt];
  -[PLThumbnailManager removeRebuildThumbnailsRequest:](self, "removeRebuildThumbnailsRequest:", "-[PLThumbnailManager handleRebuildThumbnailRequestPersistentFailureInPhotoLibrary:]");
  uint64_t v5 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Rebuilding thumbs has failed too many time, possible an asset is crashing assetsd when we attempt to generate thumbs.  Trigger rebuilding the database by marking the database as corrupt via sqlite error file.", v7, 2u);
  }

  id v6 = [v4 pathManager];

  [v6 setSqliteErrorForRebuildReason:9 allowsExit:1];
}

- (BOOL)hasExceededRebuildThumbnailRequestLimit
{
  return ![(PLThumbnailManager *)self hasRebuildThumbnailsRequest]
      && self->_hasExceededThumbnailRebuildRequestLimit;
}

- (BOOL)isRebuildingThumbnails
{
  return self->_isRebuildingThumbnails;
}

- (void)rebuildAllMissingThumbnailsInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLIsAssetsd();
  id v6 = (void *)MEMORY[0x19F38D3B0](v5);
  id v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLThumbnailManager rebuildAllMissingThumbnailsInLibrary:]"];
  uint64_t v8 = [(PLThumbnailManager *)self _rebuildThumbnailsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PLThumbnailManager_rebuildAllMissingThumbnailsInLibrary___block_invoke;
  block[3] = &unk_1E5873A50;
  block[4] = self;
  id v9 = v4;
  id v12 = v9;
  id v13 = v7;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __59__PLThumbnailManager_rebuildAllMissingThumbnailsInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  +[PLModelMigrator waitForDataMigratorToExit];
  id v2 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Starting rebuild all missing thumbnails", buf, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 115) = 1;
  unsigned int v3 = 10;
  *(void *)&long long v4 = 67109634;
  long long v19 = v4;
  while (1)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    int v7 = 10;
    do
    {
      int v8 = v6;
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v20 = v5;
      uint64_t v11 = objc_msgSend(v9, "_rebuildAssetThumbnailsWithLimit:library:error:", 23, v10, &v20, v19);
      id v12 = v20;

      int v13 = v8 + v11;
      if (v11 >= 0) {
        int v6 = v8 + v11;
      }
      else {
        int v6 = v8;
      }
      v7 += v11 >> 63;
      if (v11) {
        BOOL v14 = v7 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      uint64_t v5 = v12;
    }
    while (!v14);
    if ((v11 & 0x8000000000000000) == 0) {
      break;
    }
    long long v15 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v19;
      int v22 = v8;
      __int16 v23 = 1024;
      unsigned int v24 = v3;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to complete thumbnail rebuild (%d rebuilt, %d tries left) %@", buf, 0x18u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 115) = 1;
    if (v3 < 2)
    {
      [*(id *)(a1 + 32) _discardAlreadyFailedAssetObjectIDsForRebuild];
      goto LABEL_25;
    }
    if (v3 <= 8) {
      unsigned int v16 = 42;
    }
    else {
      unsigned int v16 = 2;
    }
    sleep(v16);

    --v3;
  }
  long long v17 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = v13;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Rebuilt %d thumbnails", buf, 8u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 115) = 1;
LABEL_25:

  *(unsigned char *)(*(void *)(a1 + 32) + 115) = 0;
  [*(id *)(a1 + 32) _recordRebuildThumbnailsAttempt];
  [*(id *)(a1 + 32) removeRebuildThumbnailsRequest:"-[PLThumbnailManager rebuildAllMissingThumbnailsInLibrary:]_block_invoke"];
  PFSharedFigDecodeSessionDiscardCachedBuffers();
  return [*(id *)(a1 + 48) stillAlive];
}

- (void)continueRebuildingTableThumbsInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Continuing table only thumbnail rebuild...", buf, 2u);
  }

  int v6 = [MEMORY[0x1E4F8BA48] transaction:"-[PLThumbnailManager continueRebuildingTableThumbsInLibrary:]"];
  int v7 = [(PLThumbnailManager *)self _rebuildThumbnailsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PLThumbnailManager_continueRebuildingTableThumbsInLibrary___block_invoke;
  block[3] = &unk_1E5873A50;
  block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(v7, block);
}

void __61__PLThumbnailManager_continueRebuildingTableThumbsInLibrary___block_invoke(uint64_t a1)
{
  +[PLModelMigrator waitForDataMigratorToExit];
  uint64_t v10 = objc_alloc_init(PLTableThumbnailMigrator);
  id v2 = (void *)MEMORY[0x1E4F8B9F8];
  unsigned int v3 = [*(id *)(a1 + 32) pathManager];
  id v4 = [v2 tableThumbnailFormatsForConfigPhase:2 withPathManager:v3];

  [(PLTableThumbnailMigrator *)v10 migrateAllAssetsPendingTableThumbRebuildInLibrary:*(void *)(a1 + 40) toTableFormats:v4 limit:0];
  if (!+[PLTableThumbnailMigrator countOfAssetsPendingTableThumbRebuildInLibrary:*(void *)(a1 + 40)])
  {
    uint64_t v5 = objc_opt_class();
    int v6 = [*(id *)(a1 + 32) pathManager];
    int v7 = [v5 thumbnailConfigurationDictWithPathManager:v6];

    [(id)objc_opt_class() markThumbnailConfigurationTableOnlyRebuildFinishedForThumbnailConfigDict:v7];
    id v8 = objc_opt_class();
    id v9 = [*(id *)(a1 + 32) pathManager];
    [v8 stampThumbnailConfiguration:v7 toFile:1 withPathManager:v9];
  }
  [*(id *)(a1 + 48) stillAlive];
}

- (id)_rebuildThumbnailsQueue
{
  if (_rebuildThumbnailsQueue_onceToken != -1) {
    dispatch_once(&_rebuildThumbnailsQueue_onceToken, &__block_literal_global_122);
  }
  id v2 = (void *)_rebuildThumbnailsQueue_rebuildThumbsQueue;
  return v2;
}

void __45__PLThumbnailManager__rebuildThumbnailsQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.assetsd.RebuildThumbnailQueue", attr);
  id v2 = (void *)_rebuildThumbnailsQueue_rebuildThumbsQueue;
  _rebuildThumbnailsQueue_rebuildThumbsQueue = (uint64_t)v1;
}

- (BOOL)hasMissingThumbnailsInLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 managedObjectContext];
  int v6 = (void *)MEMORY[0x1E4F1C0D0];
  int v7 = +[PLManagedAsset entityName];
  id v8 = [v6 fetchRequestWithEntityName:v7];

  [v8 setFetchLimit:1];
  id v9 = [(PLThumbnailManager *)self _missingThumbnailPredicate];
  [v8 setPredicate:v9];

  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__PLThumbnailManager_hasMissingThumbnailsInLibrary___block_invoke;
  v13[3] = &unk_1E5875340;
  unsigned int v16 = &v17;
  id v10 = v5;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  [v4 performBlockAndWait:v13];
  LOBYTE(v9) = v18[3] != 0;

  _Block_object_dispose(&v17, 8);
  return (char)v9;
}

void __52__PLThumbnailManager_hasMissingThumbnailsInLibrary___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 countForFetchRequest:v3 error:&v7];
  id v5 = v7;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v6 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to get missing thumbnail count: %@", buf, 0xCu);
    }
  }
}

- (int64_t)_rebuildAssetThumbnailsWithLimit:(int)a3 library:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((unint64_t)[(NSMutableArray *)self->_alreadyFailedAssetObjectIDsForRebuild count] < 0x2711)
  {
    uint64_t v32 = 0;
    int v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    *(void *)buf = 0;
    __int16 v23 = buf;
    uint64_t v24 = 0x3032000000;
    __int16 v25 = __Block_byref_object_copy__11605;
    id v26 = __Block_byref_object_dispose__11606;
    id v27 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PLThumbnailManager__rebuildAssetThumbnailsWithLimit_library_error___block_invoke;
    v15[3] = &unk_1E5864640;
    int v21 = a3;
    id v16 = v8;
    uint64_t v17 = self;
    long long v18 = &v32;
    uint64_t v19 = &v28;
    uint64_t v20 = buf;
    [v16 performTransactionAndWait:v15];
    id v11 = (void *)*((void *)v23 + 5);
    if (v11)
    {
      if (a5) {
        *a5 = v11;
      }
      id v12 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *((void *)v23 + 5);
        *(_DWORD *)double v36 = 138412290;
        uint64_t v37 = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error rebuilding thumbnails: %@", v36, 0xCu);
      }
    }
    if (*((unsigned char *)v29 + 24)) {
      int64_t v10 = -1;
    }
    else {
      int64_t v10 = v33[3];
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v9 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to rebuild thumbnails for too many assets. Ending thumbnail rebuild now", buf, 2u);
    }

    int64_t v10 = 0;
  }

  return v10;
}

void __69__PLThumbnailManager__rebuildAssetThumbnailsWithLimit_library_error___block_invoke(uint64_t a1)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = [*(id *)(a1 + 32) managedObjectContext];
  id v30 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v30 setFetchLimit:*(int *)(a1 + 72)];
  id v2 = [(id)objc_opt_class() entityInManagedObjectContext:v29];
  [v30 setEntity:v2];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 88) count];
  uint64_t v4 = *(id **)(a1 + 40);
  if (v3)
  {
    [v4[12] lock];
    id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (self IN %@)", *(void *)(*(void *)(a1 + 40) + 88)];
    int v6 = (void *)MEMORY[0x1E4F28BA0];
    id v7 = [*(id *)(a1 + 40) _missingThumbnailPredicate];
    v40[0] = v7;
    v40[1] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v28 = [v6 andPredicateWithSubpredicates:v8];

    [*(id *)(*(void *)(a1 + 40) + 96) unlock];
  }
  else
  {
    uint64_t v28 = [v4 _missingThumbnailPredicate];
  }
  [v30 setPredicate:v28];
  id v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
  uint64_t v39 = v27;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  [v30 setSortDescriptors:v9];

  id v35 = 0;
  int64_t v10 = [v29 executeFetchRequest:v30 error:&v35];
  id v11 = v35;
  id v26 = v35;
  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 count];
    id v12 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v37) = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Rebuilding thumbs for batch of %d assets", buf, 8u);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v19 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [v18 uuid];
            *(_DWORD *)buf = 138543362;
            uint64_t v37 = v20;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Rebuilding thumbs for asset uuid: %{public}@", buf, 0xCu);
          }
          [v18 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
          if (([v18 hasAllThumbs] & 1) == 0)
          {
            [*(id *)(*(void *)(a1 + 40) + 96) lock];
            int v21 = *(void **)(*(void *)(a1 + 40) + 88);
            if (!v21)
            {
              id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v23 = *(void *)(a1 + 40);
              uint64_t v24 = *(void **)(v23 + 88);
              *(void *)(v23 + 88) = v22;

              int v21 = *(void **)(*(void *)(a1 + 40) + 88);
            }
            __int16 v25 = [v18 objectID];
            [v21 addObject:v25];

            [*(id *)(*(void *)(a1 + 40) + 96) unlock];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v15);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v11);
  }
}

- (id)_missingThumbnailPredicate
{
  pl_dispatch_once();
  id v2 = (void *)_missingThumbnailPredicate_pl_once_object_37;
  return v2;
}

void __48__PLThumbnailManager__missingThumbnailPredicate__block_invoke()
{
  id v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K == %d || %K == %d) && %K != %d && %K != %d", @"thumbnailIndex", 0xFFFFFFFFLL, @"thumbnailIndex", 4294967293, @"complete", 0, @"cloudPlaceholderKind", 2);
  uint64_t v0 = [v2 copy];
  dispatch_queue_t v1 = (void *)_missingThumbnailPredicate_pl_once_object_37;
  _missingThumbnailPredicate_pl_once_object_37 = v0;
}

- (void)_discardAlreadyFailedAssetObjectIDsForRebuild
{
  [(NSLock *)self->_fixLock lock];
  alreadyFailedAssetObjectIDsForRebuild = self->_alreadyFailedAssetObjectIDsForRebuild;
  self->_alreadyFailedAssetObjectIDsForRebuild = 0;

  fixLocuint64_t k = self->_fixLock;
  [(NSLock *)fixLock unlock];
}

- (void)_recordRebuildThumbnailsAttempt
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLThumbnailManagerCore *)self pathManager];
  objc_sync_enter(v3);
  uint64_t v4 = objc_opt_class();
  id v5 = [(PLThumbnailManagerCore *)self pathManager];
  int v6 = [v4 _thumbnailRebuildIndicatorPathWithPathManager:v5];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [(PLThumbnailManagerCore *)self pathManager];
    int64_t v10 = [v9 photoDirectoryWithType:6];

    [v19 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v11 setDateFormat:@"yyyyMMdd-HHmmssZZZZZ"];
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [v11 stringFromDate:v12];

    id v14 = [@"RebuildThumbnails_" stringByAppendingString:v13];
    uint64_t v15 = [v10 stringByAppendingPathComponent:v14];
    uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v20 = 0;
    LOBYTE(v12) = [v16 copyItemAtPath:v6 toPath:v15 error:&v20];
    id v17 = v20;

    if ((v12 & 1) == 0)
    {
      long long v18 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to copy thumbnail rebuild indicator file to the caches directory, error (%@)", buf, 0xCu);
      }
    }
  }

  objc_sync_exit(v3);
}

- (void)removeRebuildThumbnailsRequest:(const char *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0) {
    MEMORY[0x19F38C0C0]();
  }
  self->_shouldRebuildThumbnails = 0;
  id v5 = objc_opt_class();
  int v6 = [(PLThumbnailManagerCore *)self pathManager];
  id v7 = [v5 _thumbnailRebuildIndicatorPathWithPathManager:v6];

  int v8 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v7];
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = 0;
  char v10 = [v9 removeItemAtPath:v7 error:&v18];
  id v11 = (char *)v18;

  uint64_t v12 = PLThumbnailsGetLog();
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = v8;
      id v14 = "Removed thumbnail rebuild indicator file (%s): %@";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 22;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v15, v16, v14, buf, v17);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v11;
    __int16 v21 = 2080;
    id v22 = a3;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    id v14 = "Failed to remove thumbnail rebuild indicator file %@ (%s): %@";
    uint64_t v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
    goto LABEL_8;
  }

  notify_post("PLThumbnailRebuildDidStop");
}

- (BOOL)hasRebuildThumbnailsRequest
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  PLIsAssetsd();
  if (self->_shouldRebuildThumbnails) {
    return 1;
  }
  if (self->_didCheckShouldRebuildThumbnails) {
    return 0;
  }
  uint64_t v4 = objc_opt_class();
  id v5 = [(PLThumbnailManagerCore *)self pathManager];
  int v6 = [v4 _thumbnailRebuildIndicatorPathWithPathManager:v5];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (v8)
  {
    id v9 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Found thumbnail rebuild indicator file on disk at %@, indicates an incomplete thumbnail rebuild on a previous run of assetsd.", buf, 0xCu);
    }

    char v10 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v6];
    id v11 = [v10 objectForKey:PLThumbnailRequestRetriesLeftKey];
    uint64_t v12 = [v11 intValue];

    uint64_t v13 = (v12 - 1);
    if ((int)v12 < 1)
    {
      uint64_t v25 = objc_msgSend(v10, "count", v13);
      id v26 = PLThumbnailsGetLog();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (v25)
      {
        if (v27)
        {
          *(_DWORD *)buf = 138543362;
          id v31 = v10;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Thumbnail rebuild indicator file on disk has no retries left.  Will not attempt thumbnail rebuild: %{public}@", buf, 0xCu);
        }

        self->_hasExceededThumbnailRebuildRequestLimit = 1;
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Thumbnail rebuild indicator file on disk is corrupt.  Will not attempt thumbnail rebuild", buf, 2u);
        }
      }
      self->_BOOL shouldRebuildThumbnails = 0;
      notify_post("PLThumbnailRebuildDidStop");
    }
    else
    {
      id v14 = [NSNumber numberWithInt:v13];
      [v10 setObject:v14 forKey:PLThumbnailRequestRetriesLeftKey];

      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      os_log_type_t v16 = [v15 description];
      uint32_t v17 = objc_msgSend((id)PLThumbnailRequestDateKey, "stringByAppendingFormat:", @"(%d retries left)", v12);
      [v10 setObject:v16 forKey:v17];

      id v18 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v10;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Updating thumbnail rebuild request indicator file:\n%{public}@", buf, 0xCu);
      }

      uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v29 = 0;
      char v20 = [v19 removeItemAtPath:v6 error:&v29];
      id v21 = v29;

      if ((v20 & 1) == 0)
      {
        id v22 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v21;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to remove previous thumbnail rebuild indicator file %@", buf, 0xCu);
        }
      }
      __int16 v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:0];
      if (([v23 writeToFile:v6 options:1073741825 error:0] & 1) == 0)
      {
        uint64_t v24 = PLThumbnailsGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v6;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to write updated thumbnail rebuild indicator file %@", buf, 0xCu);
        }
      }
      self->_BOOL shouldRebuildThumbnails = 1;
    }
  }
  self->_didCheckShouldRebuildThumbnails = 1;
  BOOL shouldRebuildThumbnails = self->_shouldRebuildThumbnails;

  return shouldRebuildThumbnails;
}

- (void)addRebuildThumbnailsRequest
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0) {
    MEMORY[0x19F38C0C0]();
  }
  uint64_t v3 = [(PLThumbnailManagerCore *)self pathManager];
  objc_sync_enter(v3);
  if (!self->_shouldRebuildThumbnails)
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [(PLThumbnailManagerCore *)self pathManager];
    int v6 = [v4 _thumbnailRebuildIndicatorPathWithPathManager:v5];

    v26[0] = PLThumbnailRequestDateKey;
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    int v8 = [v7 description];
    v26[1] = PLThumbnailRequestRetriesLeftKey;
    v27[0] = v8;
    uint64_t v9 = [NSNumber numberWithInt:10];
    v27[1] = v9;
    char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    LOBYTE(v9) = [v11 removeItemAtPath:v6 error:&v21];
    id v12 = v21;

    if (v9) {
      goto LABEL_13;
    }
    uint64_t v13 = [v12 userInfo];
    id v14 = [v13 objectForKey:*MEMORY[0x1E4F28A50]];

    uint64_t v15 = [v14 domain];
    if ([v15 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      BOOL v16 = [v14 code] == 2;

      if (v16)
      {
LABEL_12:

LABEL_13:
        id v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:0];
        if ([v18 writeToFile:v6 options:1073741825 error:0])
        {
          uint64_t v19 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v6;
            char v20 = "Wrote thumbnail rebuild indicator file %@";
LABEL_18:
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
          }
        }
        else
        {
          uint64_t v19 = PLThumbnailsGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v6;
            char v20 = "Failed to write thumbnail rebuild indicator file %@";
            goto LABEL_18;
          }
        }

        self->_BOOL shouldRebuildThumbnails = 1;
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint32_t v17 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to remove previous thumbnail rebuild indicator file %@ %@", buf, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_20:
  objc_sync_exit(v3);
}

- (int64_t)removeAllThumbnailsInContextForUrgentCacheDeleteRequest:(id)a3 dryRun:(BOOL)a4 count:(unint64_t *)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v6)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v10 = [(PLThumbnailManagerCore *)self pathManager];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke;
    v29[3] = &unk_1E58645C8;
    id v11 = v9;
    id v30 = v11;
    [v10 enumerateBundleScopesWithBlock:v29];

    id v12 = [(PLThumbnailManagerCore *)self pathManager];
    int v13 = [v12 isDCIM];

    if (v13)
    {
      id v14 = [(PLThumbnailManagerCore *)self pathManager];
      uint64_t v15 = [v14 photoDirectoryWithType:12 createIfNeeded:1 error:0];
      [v11 addObject:v15];
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    BOOL v16 = objc_opt_class();
    uint32_t v17 = [(PLThumbnailManagerCore *)self pathManager];
    uint64_t v18 = [v16 allocatedFileSizeOfThumbnailTablesWithPathManager:v17];

    uint64_t v33 = v18;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_2;
    v28[3] = &unk_1E5864618;
    void v28[4] = &buf;
    [v11 enumerateObjectsUsingBlock:v28];
    int64_t v19 = *(void *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    char v20 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Reset image request hints and thumbnail indexes...", (uint8_t *)&buf, 2u);
    }

    if (!+[PLResourceInstaller resetImageRequestHintsInContext:v8 allowOneTimeThumbRebuild:1])
    {
      int64_t v19 = 0;
      goto LABEL_18;
    }
    [(PLThumbnailManager *)self addRebuildThumbnailsRequest];
    id v11 = objc_alloc_init(MEMORY[0x1E4F8B8E8]);
    id v21 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Deleting thumbnail tables ...", (uint8_t *)&buf, 2u);
    }

    id v22 = objc_opt_class();
    id v23 = [(PLThumbnailManagerCore *)self pathManager];
    [v22 removeThumbnailTablesUnsupportedOnly:0 withPathManager:v23 fileManagerDelegate:v11];

    __int16 v24 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Deleting master thumbs...", (uint8_t *)&buf, 2u);
    }

    [(PLThumbnailManager *)self _removeMasterThumbDirectoriesWithFileManagerDelegate:v11];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)PLPhotoLibraryForceClientExitNotification, 0, 0, 0);
    int64_t v19 = [v11 totalFileAllocatedSize];
    id v26 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "thumbnail tables and master thumbnail allocated size removed: %lld", (uint8_t *)&buf, 0xCu);
    }

    if (a5) {
      *a5 = [v11 count];
    }
  }

LABEL_18:
  return v19;
}

void __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [a4 photoDirectoryWithType:12];
  [v4 addObject:v5];
}

uint64_t __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_3;
  v3[3] = &unk_1E58645F0;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F8B908] calculateTotalSizeOfFilesAtPath:a2 calculatePurgeable:0 allocatedSize:1 result:v3];
}

uint64_t __91__PLThumbnailManager_removeAllThumbnailsInContextForUrgentCacheDeleteRequest_dryRun_count___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a6) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  }
  return result;
}

- (BOOL)resetThumbnailsForced:(BOOL)a3 isMissingTables:(BOOL)a4 inContext:(id)a5
{
  id v8 = a5;
  id v9 = [(PLThumbnailManagerCore *)self pathManager];
  objc_sync_enter(v9);
  if (a3)
  {
    uint64_t v10 = 2;
  }
  else
  {
    id v11 = objc_opt_class();
    id v12 = [(PLThumbnailManagerCore *)self pathManager];
    uint64_t v13 = [v11 requiredThumbnailResetTypeWithPathManager:v12 comparedToConfigPhase:1];

    if (v13 < 1 && a4) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v13;
    }
  }
  BOOL v14 = [(PLThumbnailManager *)self resetThumbnailsWithResetType:v10 deferHintChanges:0 inContext:v8];
  objc_sync_exit(v9);

  return v14;
}

- (void)_removeMasterThumbDirectoriesWithFileManagerDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLThumbnailManagerCore *)self pathManager];
  objc_sync_enter(v5);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v6 setDelegate:v4];
  id v7 = [(PLThumbnailManagerCore *)self pathManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PLThumbnailManager__removeMasterThumbDirectoriesWithFileManagerDelegate___block_invoke;
  v13[3] = &unk_1E58645C8;
  id v8 = v6;
  id v14 = v8;
  [v7 enumerateBundleScopesWithBlock:v13];

  id v9 = [(PLThumbnailManagerCore *)self pathManager];
  int v10 = [v9 isDCIM];

  if (v10)
  {
    id v11 = [(PLThumbnailManagerCore *)self pathManager];
    id v12 = [v11 photoDirectoryWithType:12 createIfNeeded:1 error:0];
    [v8 removeItemAtPath:v12 error:0];
  }
  objc_sync_exit(v5);
}

void __75__PLThumbnailManager__removeMasterThumbDirectoriesWithFileManagerDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [a4 photoDirectoryWithType:12];
  [v4 removeItemAtPath:v5 error:0];
}

- (void)reStampConfigAsNeedingTableThumbMigration
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PLThumbnailManagerCore *)self pathManager];
  id v7 = [v3 thumbnailConfigurationDictWithPathManager:v4];

  [(id)objc_opt_class() markThumbnailConfigurationForTableOnlyRebuildForThumbnailConfigDict:v7];
  id v5 = objc_opt_class();
  id v6 = [(PLThumbnailManagerCore *)self pathManager];
  [v5 stampThumbnailConfiguration:v7 toFile:1 withPathManager:v6];
}

- (BOOL)wantsTableOnlyRebuild
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PLThumbnailManagerCore *)self pathManager];
  id v5 = [v3 thumbnailConfigurationDictWithPathManager:v4];

  LOBYTE(self) = [(id)objc_opt_class() wantsTableOnlyRebuildForThumbnailConfigDict:v5];
  return (char)self;
}

- (void)removeObsoleteMetadata
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = [(PLThumbnailManagerCore *)self pathManager];
  objc_sync_enter(v2);
  obuint64_t j = v2;
  uint64_t v32 = [v2 photoDirectoryWithType:11 createIfNeeded:1 error:0];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = PLAssetFormatsAllKnownFormatIDs();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v39;
    uint64_t v7 = *MEMORY[0x1E4F8C590];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned __int16 v9 = [*(id *)(*((void *)&v38 + 1) + 8 * i) intValue];
        int v10 = NSString;
        uint64_t v11 = v9;
        id v12 = obj;
        uint64_t v13 = [v10 stringWithFormat:@"%d.%@", v11, v7];
        id v14 = [v12 photoDirectoryWithType:11 createIfNeeded:1 error:0];

        uint64_t v15 = [v14 stringByAppendingPathComponent:v13];

        BOOL v16 = [v15 lastPathComponent];
        [v3 addObject:v16];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v5);
  }

  uint32_t v17 = [(PLThumbnailManagerCore *)self pathManager];
  uint64_t v18 = [v17 photoDirectoryWithType:12 createIfNeeded:1 error:0];
  int64_t v19 = [v18 lastPathComponent];
  [v3 addObject:v19];

  char v20 = [(id)objc_opt_class() thumbnailConfigurationPathWithPathManager:obj];
  id v21 = [v20 lastPathComponent];
  [v3 addObject:v21];

  id v22 = [(id)objc_opt_class() _thumbnailRebuildIndicatorPathWithPathManager:obj];
  id v23 = [v22 lastPathComponent];
  [v3 addObject:v23];

  id v24 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v24 contentsOfDirectoryAtPath:v32 error:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        if (([v3 containsObject:v29] & 1) == 0)
        {
          id v30 = [v32 stringByAppendingPathComponent:v29];
          [v24 removeItemAtPath:v30 error:0];
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v26);
  }

  objc_sync_exit(obj);
}

- (id)imageTableForFormat:(unsigned __int16)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F8B938], "formatWithID:");
  if ([v7 isTable])
  {
    id v8 = [(PLThumbnailManager *)self thumbManagerForFormatID:v5 readOnly:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)imageTableForFormat:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = PLIsAssetsd() ^ 1;
  return [(PLThumbnailManager *)self imageTableForFormat:v3 readOnly:v5];
}

- (void)dealloc
{
  uint64_t v3 = [(PLThumbnailManager *)self observerToken];

  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = [(PLThumbnailManager *)self observerToken];
    [v4 removeObserver:v5];
  }
  previouslyRequestedThumbnailFixOIDs = self->_previouslyRequestedThumbnailFixOIDs;
  self->_previouslyRequestedThumbnailFixOIDs = 0;

  requestedThumbnailFixAssets = self->_requestedThumbnailFixAssets;
  self->_requestedThumbnailFixAssets = 0;

  fixLocuint64_t k = self->_fixLock;
  self->_fixLocuint64_t k = 0;

  downscaleContext = self->_downscaleContext;
  self->_downscaleContext = 0;

  v10.receiver = self;
  v10.super_class = (Class)PLThumbnailManager;
  [(PLThumbnailManagerCore *)&v10 dealloc];
}

void __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[9] removeAllObjects];
    WeakRetained = v2;
  }
}

id __73__PLThumbnailManager_initWithPhotoLibraryPathManager_storeFromMigration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newSlowPersistenceManagers];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_contextForConfigurationChanges
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrationStore);
  if (WeakRetained)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLThumbnailManager _contextForConfigurationChanges]");
    [v4 setName:v5];

    uint64_t v6 = [WeakRetained persistentStoreCoordinator];
    [v4 setPersistentStoreCoordinator:v6];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__PLThumbnailManager__contextForConfigurationChanges__block_invoke;
    v17[3] = &unk_1E5875E18;
    id v7 = v4;
    id v18 = v7;
    int64_t v19 = self;
    [v7 performBlockAndWait:v17];
    id v8 = v18;
  }
  else
  {
    unsigned __int16 v9 = [(PLThumbnailManagerCore *)self pathManager];
    id v8 = [v9 libraryURL];

    objc_super v10 = +[PLPhotoLibraryBundleController sharedBundleController];
    uint64_t v11 = [v10 lookupOrCreateBundleForLibraryURL:v8];

    id v12 = [v11 libraryServicesManager];
    if ([v12 state] > 5
      || PLIsAssetsdProxyService() && !PLIsMigrationService()
      || MEMORY[0x19F38C0C0]())
    {
      id v13 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLThumbnailManager _contextForConfigurationChanges]", v11);
      id v7 = [v13 managedObjectContext];
    }
    else
    {
      uint64_t v15 = PLThumbnailsGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_FAULT, "thumbnailManager must be initialized with a migrationStore when being used before library is opened.", buf, 2u);
      }

      id v7 = 0;
    }
  }
  return v7;
}

void __53__PLThumbnailManager__contextForConfigurationChanges__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) pathManager];
  id v2 = [*(id *)(a1 + 32) userInfo];
  [v2 setObject:v3 forKeyedSubscript:@"com.apple.photos.PLModelMigratorPathManagerKey"];
}

+ (id)thumbnailIdentifierWithAssetUUID:(id)a3 directory:(id)a4 filename:(id)a5 bundleScope:(unsigned __int16)a6 pathManager:(id)a7
{
  uint64_t v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([a7 shouldUseFileIdentifierForBundleScope:v8])
  {
    id v14 = [MEMORY[0x1E4F8B9F0] thumbnailIdentifierURLComponentsForUBFWithAssetUUID:v11 bundleScope:v8];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v14 setScheme:*MEMORY[0x1E4F8C588]];
    if ([v12 length] && objc_msgSend(v13, "length"))
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@/%@", v12, v13];
      [v14 setPath:v15];
    }
  }
  BOOL v16 = [v14 path];
  if ([v16 length])
  {
    uint32_t v17 = [v14 string];
  }
  else
  {
    uint32_t v17 = 0;
  }

  return v17;
}

@end