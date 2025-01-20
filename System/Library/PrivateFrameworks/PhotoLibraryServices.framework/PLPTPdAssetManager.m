@interface PLPTPdAssetManager
- (BOOL)libraryIsAvailable;
- (BOOL)ptpCanDeleteFiles;
- (BOOL)ptpDeletePhotoForAssetHandle:(id)a3;
- (BOOL)requestedSize:(CGSize)a3 fitsInSourceSize:(CGSize)a4;
- (CGSize)_validateSize:(CGSize)result;
- (CGSize)masterThumbSize;
- (NSFileManager)fileManager;
- (PFMediaCapabilities)peerMediaCapabilities;
- (PLManagedObjectContext)managedObjectContext;
- (PLPTPdAssetManager)init;
- (PLPhotoLibrary)photoLibrary;
- (PhotoLibraryPTPDelegate)delegate;
- (id)_allAssetObjectIDs;
- (id)_createJPEGThumbnailImageDataFromFileWithPath:(id)a3 sourceTypeHint:(id)a4 formatID:(unsigned __int16)a5 shouldTransform:(BOOL)a6 maxPixelSize:(unint64_t)a7;
- (id)_dataByJPEGCompressingCGImage:(CGImage *)a3 orSource:(CGImageSource *)a4 toLengthLimit:(int64_t)a5 initialCompressionQuality:(float)a6 size:(CGSize)a7 orientation:(int64_t)a8;
- (id)_dataForThumbnailImageSource:(CGImageSource *)a3 options:(id)a4 originalOrientation:(int64_t)a5;
- (id)_generateThumbnailForAsset:(id)a3 fromOriginalImagePath:(id)a4 size:(CGSize)a5 compressionQuality:(float)a6;
- (id)_performResultBlockAndWait:(id)a3;
- (id)_performResultTransactionAndWait:(id)a3;
- (id)_ptpAssetEnumeratorAllAssets;
- (id)_ptpAssetsForAssetWithID:(id)a3;
- (id)_ptpThumbnailForFullSizeRenderWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_ptpThumbnailForOriginalVideoWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_ptpThumbnailForOriginalWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_ptpThumbnailForPenultimateImageWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_ptpThumbnailForSpatialOverCaptureImageWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_ptpThumbnailForSpatialOverCaptureVideoWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (id)_sendFinalizationRequestForAssetObjectID:(id)a3 moc:(id)a4;
- (id)adjustmentFilePathForAsset:(id)a3 requiresTemporaryFileCleanup:(BOOL *)a4;
- (id)assetReaderForFormatConvertedPTPAsset:(id)a3 ofManagedAsset:(id)a4 path:(id)a5;
- (id)dataForThumbnailFileAtPath:(id)a3 rotatedToOrientation:(int64_t)a4 size:(CGSize)a5 compressionQuality:(float)a6;
- (id)embeddedThumbnailDataForAsset:(id)a3 requestedSize:(CGSize)a4 shouldScale:(BOOL)a5;
- (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3;
- (id)initForUnitTestSupportWithPhotoLibrary:(id)a3;
- (id)popAnalyticsData;
- (id)ptpAssetReaderForAssetHandle:(id)a3;
- (id)ptpImagePropertiesForAssetHandle:(id)a3;
- (id)ptpThumbnailForAssetHandle:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5;
- (int64_t)cplStorageState;
- (void)_ensureDeferredRenderingIsComplete;
- (void)_expungeAsset:(id)a3 withReason:(id)a4;
- (void)_handleMakeResourceReplyForAssetUUID:(id)a3 assetObjectID:(id)a4 moc:(id)a5 success:(BOOL)a6 error:(id)a7;
- (void)_inverseAffineTransformForExifOrientation:(int64_t)a3 width:(double)a4 height:(double)a5 completion:(id)a6;
- (void)_performBlockAndWait:(id)a3;
- (void)_performTransactionAndWait:(id)a3;
- (void)_registerForFirstUnlockNotification;
- (void)_requestFinalizationOfNextAsset;
- (void)_startAnalyticsCollection;
- (void)_stopAnalyticsCollectionAndReport;
- (void)addAssetsNeedingFinalization:(id)a3;
- (void)beginSignpostForThumbnailGenerationForAsset:(id)a3 inputResourceTypeLabel:(id)a4;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)dealloc;
- (void)endSignpostForThumbnailGenerationForAsset:(id)a3;
- (void)handlePhotoLibraryAvailableNotification;
- (void)managedObjectContext:(id)a3 libraryChangedWithInsertedAssetIDs:(id)a4 deletedAssetIDs:(id)a5 changedAssetIDs:(id)a6 adjustedAssetIDs:(id)a7;
- (void)ptpEnumerateAllAssetsUsingBlock:(id)a3;
- (void)ptpEnumerateAssetsWithPrimaryKeys:(id)a3 usingBlock:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setHostCharacteristics:(id)a3;
- (void)setPeerMediaCapabilities:(id)a3;
@end

@implementation PLPTPdAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fileManager, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_requestInflight, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_assetsRequiringFinalization, 0);
  objc_storeStrong((id *)&self->_analyticsAsyncDataGroup, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
  objc_storeStrong((id *)&self->availableAssetsQueue, 0);
  objc_storeStrong((id *)&self->_ptpDeletedAssets, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_availableAssetIDs, 0);
  objc_storeStrong((id *)&self->_formatConversionManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)setFileManager:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->fileManager;
}

- (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3
{
  id v4 = a3;
  v5 = [(PLPTPdAssetManager *)self photoLibrary];
  if (v5)
  {
    v6 = [(PLPTPdAssetManager *)self photoLibrary];
    v7 = +[PLPTPFetches fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:v4 inLibrary:v6];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (PLManagedObjectContext)managedObjectContext
{
  v2 = [(PLPTPdAssetManager *)self photoLibrary];
  v3 = [v2 managedObjectContext];

  return (PLManagedObjectContext *)v3;
}

- (id)_performResultTransactionAndWait:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__24826;
  v15 = __Block_byref_object_dispose__24827;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLPTPdAssetManager__performResultTransactionAndWait___block_invoke;
  v8[3] = &unk_1E5870D98;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(PLPTPdAssetManager *)self _performTransactionAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __55__PLPTPdAssetManager__performResultTransactionAndWait___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_performTransactionAndWait:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPTPdAssetManager *)self photoLibrary];
  id v6 = [v5 managedObjectContext];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PLPTPdAssetManager__performTransactionAndWait___block_invoke;
  v9[3] = &unk_1E58742F0;
  id v10 = v6;
  id v11 = v4;
  id v7 = v6;
  id v8 = v4;
  [v7 performBlockAndWait:v9];
}

void __49__PLPTPdAssetManager__performTransactionAndWait___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v3 = *(void **)(a1 + 32);
    id v9 = 0;
    char v4 = [v3 save:&v9];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Failed to save context %@: %@", *(void *)(a1 + 32), v5];
      id v7 = PLPTPGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Save failed with error %@", buf, 0xCu);
      }

      id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v6 userInfo:0];
      objc_exception_throw(v8);
    }
  }
}

- (id)_performResultBlockAndWait:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__24826;
  v15 = __Block_byref_object_dispose__24827;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PLPTPdAssetManager__performResultBlockAndWait___block_invoke;
  v8[3] = &unk_1E5870D98;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(PLPTPdAssetManager *)self _performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__PLPTPdAssetManager__performResultBlockAndWait___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_performBlockAndWait:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPTPdAssetManager *)self photoLibrary];
  id v6 = [v5 managedObjectContext];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PLPTPdAssetManager__performBlockAndWait___block_invoke;
  v8[3] = &unk_1E5875198;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

void __43__PLPTPdAssetManager__performBlockAndWait___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)popAnalyticsData
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__24826;
  id v8 = __Block_byref_object_dispose__24827;
  id v9 = 0;
  PLRunWithUnfairLock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __38__PLPTPdAssetManager_popAnalyticsData__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) setTimeDisconnected:(double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;
}

- (void)_stopAnalyticsCollectionAndReport
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__24826;
  v6[4] = __Block_byref_object_dispose__24827;
  id v7 = [(PLPTPdAssetManager *)self popAnalyticsData];
  analyticsAsyncDataGroup = self->_analyticsAsyncDataGroup;
  uint64_t v4 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PLPTPdAssetManager__stopAnalyticsCollectionAndReport__block_invoke;
  block[3] = &unk_1E5875840;
  block[4] = v6;
  dispatch_group_notify(analyticsAsyncDataGroup, v4, block);

  _Block_object_dispose(v6, 8);
}

uint64_t __55__PLPTPdAssetManager__stopAnalyticsCollectionAndReport__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) report];
}

- (void)_startAnalyticsCollection
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__24826;
  v20[4] = __Block_byref_object_dispose__24827;
  id v21 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke;
  v17 = &unk_1E5875E68;
  v18 = self;
  v19 = v20;
  PLRunWithUnfairLock();
  uint64_t v3 = [(PLPTPdAssetManager *)self photoLibrary];
  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_2;
  v10[3] = &unk_1E5875340;
  id v4 = v3;
  id v11 = v4;
  uint64_t v12 = self;
  uint64_t v13 = v20;
  [v4 performBlock:v10 withPriority:0];
  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_214;
  v6[3] = &unk_1E5875340;
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  id v9 = v20;
  [v5 performBlock:v6 withPriority:0];

  _Block_object_dispose(v20, 8);
}

void __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PLPTPAnalyticsData);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  [*(id *)(*(void *)(a1 + 32) + 64) setTimeConnected:(double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setCplState:", objc_msgSend(*(id *)(a1 + 32), "cplStorageState"));
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v5);
}

void __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v9 = 0;
  uint64_t v6 = [v5 countForFetchRequest:v4 error:&v9];
  id v7 = v9;

  if (v6)
  {
    PLRunWithUnfairLock();
  }
  else if (v7)
  {
    id v8 = PLPTPGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error fetching count of library assets: %@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 80));
}

void __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_214(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %d", @"deferredProcessingNeeded", 0);
  [v4 setPredicate:v5];

  uint64_t v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v10 = 0;
  uint64_t v7 = [v6 countForFetchRequest:v4 error:&v10];
  id v8 = v10;

  if (v7)
  {
    PLRunWithUnfairLock();
  }
  else if (v8)
  {
    id v9 = PLPTPGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error fetching count for assets with pending deferred processing: %@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 80));
}

uint64_t __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_2_218(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDeferredRenderCount:*(void *)(a1 + 40)];
}

uint64_t __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setLibraryAssetCount:*(void *)(a1 + 40)];
}

- (void)endSignpostForThumbnailGenerationForAsset:(id)a3
{
  id v3 = a3;
  id v4 = PLPTPGetLog();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, v3);

  uint64_t v6 = PLPTPGetLog();
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v5, "PTP Thumbnail request", "", v8, 2u);
  }
}

- (void)beginSignpostForThumbnailGenerationForAsset:(id)a3 inputResourceTypeLabel:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PLPTPGetLog();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

  id v9 = PLPTPGetLog();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v11 = [v5 uuid];
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PTP Thumbnail request", "Resource type %{public}@ Asset UUID %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

- (id)_dataByJPEGCompressingCGImage:(CGImage *)a3 orSource:(CGImageSource *)a4 toLengthLimit:(int64_t)a5 initialCompressionQuality:(float)a6 size:(CGSize)a7 orientation:(int64_t)a8
{
  double height = a7.height;
  double width = a7.width;
  CGImageSourceRef isrc = a4;
  v46[2] = *MEMORY[0x1E4F143B8];
  __int16 v14 = PLPTPGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[PLPTPdAssetManager _dataByJPEGCompressingCGImage:orSource:toLengthLimit:initialCompressionQuality:size:orientation:]";
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ((unint64_t)a3 | (unint64_t)isrc)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA58] data];
    v38 = (void *)*MEMORY[0x1E4F44410];
    uint64_t v37 = *MEMORY[0x1E4F2F428];
    if (width >= height) {
      double v16 = width;
    }
    else {
      double v16 = height;
    }
    uint64_t v36 = *MEMORY[0x1E4F2F430];
    uint64_t v35 = *MEMORY[0x1E4F2FCA0];
    unint64_t v17 = 0x1E4F28000uLL;
    do
    {
      objc_msgSend(v15, "setLength:", 0, isrc);
      v18 = [v38 identifier];
      v19 = CGImageDestinationCreateWithData((CFMutableDataRef)v15, v18, 1uLL, 0);

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E4F1CA60];
        v45[0] = v37;
        id v21 = [*(id *)(v17 + 3792) numberWithDouble:v16];
        v45[1] = v36;
        v46[0] = v21;
        *(float *)&double v22 = a6;
        [*(id *)(v17 + 3792) numberWithFloat:v22];
        unint64_t v23 = v17;
        v25 = int64_t v24 = a8;
        v46[1] = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
        v27 = [v20 dictionaryWithDictionary:v26];

        a8 = v24;
        unint64_t v17 = v23;

        if (a8)
        {
          v28 = [*(id *)(v23 + 3792) numberWithInteger:a8];
          [v27 setObject:v28 forKeyedSubscript:v35];
        }
        CGImageDestinationSetProperties(v19, (CFDictionaryRef)v27);
        if (a3)
        {
          CGImageDestinationAddImage(v19, a3, (CFDictionaryRef)v27);
        }
        else
        {
          size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(isrc);
          unint64_t v17 = v23;
          CGImageDestinationAddImageFromSource(v19, isrc, PrimaryImageIndex, (CFDictionaryRef)v27);
        }
        CGImageDestinationFinalize(v19);
        CFRelease(v19);
      }
      v30 = PLPTPGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = [v15 length];
        *(_DWORD *)buf = 134218496;
        v40 = (const char *)v15;
        __int16 v41 = 2048;
        uint64_t v42 = v31;
        __int16 v43 = 2048;
        int64_t v44 = a5;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, "Thumbnail: %p, size: %lu, limit: %lu", buf, 0x20u);
      }

      if ([v15 length] > (unint64_t)a5)
      {
        float v32 = a6 / (float)((float)(unint64_t)[v15 length] / (float)a5);
        if ((float)(a6 - v32) < 0.25) {
          float v32 = a6 + -0.25;
        }
        if (v32 >= 0.0) {
          a6 = v32;
        }
        else {
          a6 = 0.0;
        }
      }
    }
    while ([v15 length] > (unint64_t)a5 && a6 >= 0.0 && width == 160.0 && height == 120.0);
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)_createJPEGThumbnailImageDataFromFileWithPath:(id)a3 sourceTypeHint:(id)a4 formatID:(unsigned __int16)a5 shouldTransform:(BOOL)a6 maxPixelSize:(unint64_t)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a5;
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (void *)MEMORY[0x19F38D3B0]();
  if (v11)
  {
    __int16 v14 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v12];
    if (!v14)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F8CDF8];
      double v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
      __int16 v14 = [v15 typeForURL:v16 error:0];
    }
    if (![v14 conformsToType:*MEMORY[0x1E4F44400]])
    {
      int64_t v24 = PLPTPGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = [v14 identifier];
        *(_DWORD *)buf = 138543362;
        id v44 = v25;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Cannot generate a thumbnail usingImageIO for a non-image type (%{public}@)", buf, 0xCu);
      }
      unint64_t v23 = 0;
      goto LABEL_35;
    }
    unint64_t v17 = [MEMORY[0x1E4F8B938] formatWithID:v9];
    char v18 = [v17 isThumbnail];
    v19 = [v14 identifier];
    BOOL v20 = +[PLManagedAsset isPrimaryImageFormatForUTI:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    if (!v20 || (v18 & 1) != 0) {
      double v22 = [v21 initWithContentsOfFile:v11 options:1 error:0];
    }
    else {
      double v22 = [v21 initWithContentsOfFile:v11];
    }
    int64_t v24 = v22;
    if (v22)
    {
      if (!a7)
      {
        a7 = PLMaxPixelSizeForFormatAndData(v17, v22);
        if (!a7)
        {
          float v32 = PLPTPGetLog();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
          *(_WORD *)buf = 0;
          uint64_t v36 = "No max pixel size specified";
          uint64_t v37 = v32;
          uint32_t v38 = 2;
          goto LABEL_28;
        }
      }
      uint64_t v45 = *MEMORY[0x1E4F2FF78];
      v26 = [v14 identifier];
      v46[0] = v26;
      CGImageSourceRef v27 = CGImageSourceCreateWithData((CFDataRef)v24, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1]);

      if (v27)
      {
        CGImageSourceRef isrc = v27;
        uint64_t v42 = v17;
        id v28 = objc_alloc(MEMORY[0x1E4F1CA60]);
        v29 = [NSNumber numberWithUnsignedInteger:a7];
        uint64_t v30 = *MEMORY[0x1E4F2F428];
        uint64_t v31 = [NSNumber numberWithBool:v8];
        float v32 = objc_msgSend(v28, "initWithObjectsAndKeys:", v29, v30, v31, *MEMORY[0x1E4F2FE48], 0);

        if (([v14 conformsToType:*MEMORY[0x1E4F44498]] & 1) == 0) {
          [v32 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F2FE38]];
        }
        unint64_t v23 = [MEMORY[0x1E4F1CA58] data];
        v33 = [(id)*MEMORY[0x1E4F44410] identifier];
        v34 = CGImageDestinationCreateWithData(v23, v33, 1uLL, 0);

        if (v34)
        {
          size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(isrc);
          CGImageDestinationAddImageFromSource(v34, isrc, PrimaryImageIndex, (CFDictionaryRef)v32);
          CGImageDestinationFinalize(v34);
          CFRelease(v34);
          unint64_t v17 = v42;
        }
        else
        {
          v39 = PLPTPGetLog();
          unint64_t v17 = v42;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v11;
            _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Fail to get image dest for path '%@'", buf, 0xCu);
          }
        }
        CFRelease(isrc);
        goto LABEL_34;
      }
      float v32 = PLPTPGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v11;
        uint64_t v36 = "Fail to get image source for path '%@'";
        goto LABEL_27;
      }
    }
    else
    {
      float v32 = PLPTPGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v11;
        uint64_t v36 = "Failed to load file data for path '%@'";
LABEL_27:
        uint64_t v37 = v32;
        uint32_t v38 = 12;
LABEL_28:
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
      }
    }
LABEL_29:
    unint64_t v23 = 0;
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  __int16 v14 = PLPTPGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Cannot generate a thumbnail with nil path", buf, 2u);
  }
  unint64_t v23 = 0;
LABEL_36:

  return v23;
}

- (id)_generateThumbnailForAsset:(id)a3 fromOriginalImagePath:(id)a4 size:(CGSize)a5 compressionQuality:(float)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = PLPTPGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v60 = "-[PLPTPdAssetManager _generateThumbnailForAsset:fromOriginalImagePath:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[PLPTPdAssetManager _validateSize:](self, "_validateSize:", width, height);
  double v15 = v14;
  double v17 = v16;
  [(PLPTPdAssetManager *)self masterThumbSize];
  BOOL v20 = -[PLPTPdAssetManager requestedSize:fitsInSourceSize:](self, "requestedSize:fitsInSourceSize:", v15, v17, v18, v19);
  id v21 = PLGetSourceTypeHintFromFilename(v12);
  double v22 = PLPTPGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v60 = (const char *)v12;
    __int16 v61 = 2112;
    v62 = v21;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Thumbnail path: %@, sourceTypeHint: %@", buf, 0x16u);
  }

  unint64_t v23 = PLPTPGetLog();
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, v12);

  v25 = PLPTPGetLog();
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138412546;
    v60 = (const char *)v12;
    __int16 v61 = 2114;
    v62 = v21;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PTP generate thumbnail from original", "Path %@ source hint %{public}@", buf, 0x16u);
  }

  if ([v11 isVideo] && (objc_msgSend(v11, "isCloudPhotoLibraryAsset") & 1) == 0)
  {
    if (v20) {
      uint64_t v39 = 3039;
    }
    else {
      uint64_t v39 = 9998;
    }
    uint64_t v37 = [MEMORY[0x1E4F8B938] formatWithID:v39];
    uint32_t v38 = +[PLImageLoadingUtilities newSynchronousImageForAsset:v11 withFormat:[v37 formatID] allowPlaceholder:0 outImageProperties:0 outDeliveredPlaceholder:0];
    v40 = PLPTPGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEBUG, "Thumbnail image [1]: %@", buf, 0xCu);
    }

    CFDataRef v36 = 0;
    goto LABEL_31;
  }
  if (![v11 isVideo])
  {
    if (v21
      && ([MEMORY[0x1E4F442D8] typeWithIdentifier:v21],
          uint64_t v30 = objc_claimAutoreleasedReturnValue(),
          int v31 = [v30 isEqual:*MEMORY[0x1E4F44460]],
          v30,
          v31))
    {
      if ([v11 isCloudPhotoLibraryAsset])
      {
        float v32 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
        v33 = v32;
        if (v20) {
          [v32 indexSheetUnbakedFormat];
        }
        else {
        v56 = [v32 fullScreenFormatForCurrentDevice];
        }
        uint64_t v34 = [v56 formatID];
      }
      else if (v20)
      {
        uint64_t v34 = 3039;
      }
      else
      {
        uint64_t v34 = 9998;
      }
    }
    else
    {
      uint64_t v34 = 3039;
    }
    if (v15 >= v17) {
      double v35 = v15;
    }
    else {
      double v35 = v17;
    }
    CFDataRef v36 = [(PLPTPdAssetManager *)self _createJPEGThumbnailImageDataFromFileWithPath:v12 sourceTypeHint:v21 formatID:v34 shouldTransform:0 maxPixelSize:(unint64_t)v35];
    uint64_t v37 = PLPTPGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (const char *)v36;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEBUG, "Thumbnail data [4]: %@", buf, 0xCu);
    }
    uint32_t v38 = 0;
LABEL_31:
    CGImageSourceRef v27 = v12;
    goto LABEL_40;
  }
  CGImageSourceRef v27 = [v11 pathForMediumThumbnailFile];

  id v28 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  v29 = v28;
  if (v20) {
    [v28 indexSheetUnbakedFormat];
  }
  else {
  uint64_t v37 = [v28 fullScreenFormatForCurrentDevice];
  }

  __int16 v41 = +[PLPhotoLibrary fileReservationForFileAtPath:v27 exclusive:0];

  if (v41)
  {
    uint32_t v38 = (char *)PLCreateImageFromFileWithFormat(v27, 1u, v21, [v37 formatID], 0, 0, 0);
    uint64_t v42 = PLPTPGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      __int16 v43 = "Thumbnail image [3]: %@";
LABEL_38:
      _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEBUG, v43, buf, 0xCu);
    }
  }
  else
  {
    uint32_t v38 = +[PLImageLoadingUtilities newSynchronousImageForAsset:v11 withFormat:[v37 formatID] allowPlaceholder:0 outImageProperties:0 outDeliveredPlaceholder:0];
    uint64_t v42 = PLPTPGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      __int16 v43 = "Thumbnail image [2]: %@";
      goto LABEL_38;
    }
  }

  CFDataRef v36 = 0;
LABEL_40:

  if (height == 120.0 && width == 160.0 || a6 < 0.0 || a6 > 1.0) {
    a6 = 0.75;
  }
  if (v21)
  {
    uint64_t v57 = *MEMORY[0x1E4F2FF78];
    v58 = v21;
    CFDictionaryRef v47 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  }
  else
  {
    CFDictionaryRef v47 = 0;
  }
  CGImageSourceRef v48 = CGImageSourceCreateWithData(v36, v47);
  uint64_t v49 = DCIM_CGImageRefFromPLImage();
  *(float *)&double v50 = a6;
  v51 = -[PLPTPdAssetManager _dataByJPEGCompressingCGImage:orSource:toLengthLimit:initialCompressionQuality:size:orientation:](self, "_dataByJPEGCompressingCGImage:orSource:toLengthLimit:initialCompressionQuality:size:orientation:", v49, v48, 0x10000, 0, v50, width, height);
  if (v48) {
    CFRelease(v48);
  }
  v52 = PLPTPGetLog();
  v53 = v52;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    uint64_t v54 = [v51 length];
    *(_DWORD *)buf = 134217984;
    v60 = (const char *)v54;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v53, OS_SIGNPOST_INTERVAL_END, v24, "PTP generate thumbnail from original", "Output data length %lu", buf, 0xCu);
  }

  return v51;
}

- (id)_dataForThumbnailImageSource:(CGImageSource *)a3 options:(id)a4 originalOrientation:(int64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = PLPTPGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[PLPTPdAssetManager _dataForThumbnailImageSource:options:originalOrientation:]";
    __int16 v34 = 2048;
    double v35 = a3;
    __int16 v36 = 2112;
    id v37 = v7;
    __int16 v38 = 2048;
    int64_t v39 = a5;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "[%s] imageSource: %p, inOptions: %@, originalOrientation: %lu", buf, 0x2Au);
  }

  uint64_t v9 = (void *)[v7 mutableCopy];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FD70]];
  unsigned int v11 = [v10 unsignedIntValue];

  uint64_t v12 = MEMORY[0x1E4F1CC38];
  [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FF48]];
  if (v11) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CC28];
  }
  [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2FE48]];
  if (a3)
  {
    double v14 = (__CFData *)objc_opt_new();
    double v15 = (void *)*MEMORY[0x1E4F44410];
    double v16 = [(id)*MEMORY[0x1E4F44410] identifier];
    double v17 = CGImageDestinationCreateWithData(v14, v16, 1uLL, 0);

    if (v17)
    {
      uint64_t v18 = v11;
      size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
      CGImageDestinationAddImageFromSource(v17, a3, PrimaryImageIndex, (CFDictionaryRef)v9);
      CGImageDestinationFinalize(v17);
      a3 = v14;
      [(PLPTPdAssetManager *)self _logData:a3 withPrefix:@"SCALED-ROTATED DATA:" scaledOrientation:v11 originalOrientation:a5];
      CFRelease(v17);
      if (!a3) {
        goto LABEL_19;
      }
      CGImageSourceRef v20 = CGImageSourceCreateWithData(a3, 0);
      if (!v20) {
        goto LABEL_19;
      }
      id v21 = v20;
      double v22 = [MEMORY[0x1E4F1CA58] data];
      unint64_t v23 = [v15 identifier];
      os_signpost_id_t v24 = CGImageDestinationCreateWithData(v22, v23, 1uLL, 0);

      if (v24)
      {
        uint64_t v29 = v18;
        uint64_t v31 = *MEMORY[0x1E4F2F458];
        v25 = [NSNumber numberWithInteger:a5];
        float v32 = v25;
        CFDictionaryRef v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

        *(void *)buf = 0;
        if (CGImageDestinationCopyImageSource(v24, v21, v26, (CFErrorRef *)buf))
        {
          CGImageSourceRef v27 = v22;

          [(PLPTPdAssetManager *)self _logData:v27 withPrefix:@"FINAL DATA:" scaledOrientation:v29 originalOrientation:a5];
          a3 = v27;
        }
        CFRelease(v24);
      }
      CFRelease(v21);
    }
    else
    {
      PLPTPGetLog();
      double v22 = (__CFData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Unable to create image destination for thumbnail", buf, 2u);
      }
      a3 = 0;
    }

LABEL_19:
  }

  return a3;
}

- (id)dataForThumbnailFileAtPath:(id)a3 rotatedToOrientation:(int64_t)a4 size:(CGSize)a5 compressionQuality:(float)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unsigned int v11 = PLPTPGetLog();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v10);

  uint64_t v13 = PLPTPGetLog();
  double v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v31 = 138412290;
    uint64_t v32 = (uint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PTP generate thumbnail data from path", "Path %@", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v16 = CGImageSourceCreateWithFile();
  if (v16)
  {
    double v17 = (const void *)v16;
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    if (width >= height) {
      double v19 = width;
    }
    else {
      double v19 = height;
    }
    CGImageSourceRef v20 = [NSNumber numberWithDouble:v19];
    [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F2F428]];

    if (a4 != 1)
    {
      int64_t v21 = 6;
      if (a4 != 8) {
        int64_t v21 = a4;
      }
      if (a4 == 6) {
        uint64_t v22 = 8;
      }
      else {
        uint64_t v22 = v21;
      }
      unint64_t v23 = [NSNumber numberWithInteger:v22];
      [v18 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2FD70]];
    }
    os_signpost_id_t v24 = [(PLPTPdAssetManager *)self _dataForThumbnailImageSource:v17 options:v18 originalOrientation:a4];
    CFRelease(v17);

    v25 = PLPTPGetLog();
    CFDictionaryRef v26 = v25;
    if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
    {
      uint64_t v27 = [v24 length];
      int v31 = 134217984;
      uint64_t v32 = v27;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v12, "PTP generate thumbnail data from path", "Data length: %lu", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    id v28 = PLPTPGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v31 = 138477827;
      uint64_t v32 = (uint64_t)v10;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Unable to create image source for thumbnail at path %{private}@", (uint8_t *)&v31, 0xCu);
    }

    uint64_t v29 = PLPTPGetLog();
    CFDictionaryRef v26 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      LOWORD(v31) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v12, "PTP generate thumbnail from path", "Failed", (uint8_t *)&v31, 2u);
    }
    os_signpost_id_t v24 = 0;
  }

  return v24;
}

- (void)_inverseAffineTransformForExifOrientation:(int64_t)a3 width:(double)a4 height:(double)a5 completion:(id)a6
{
  switch(a3)
  {
    case 2:
    case 3:
      break;
    case 4:
      a4 = 0.0;
      break;
    case 5:
    case 6:
      a4 = a5;
      break;
    case 7:
    case 8:
      a4 = 0.0;
      break;
    default:
      a4 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
      break;
  }
  (*((void (**)(__n128, __n128))a6 + 2))(*(__n128 *)&a4, *(__n128 *)&a5);
}

- (id)_ptpThumbnailForPenultimateImageWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[PLPTPdAssetManager _ptpThumbnailForPenultimateImageWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__PLPTPdAssetManager__ptpThumbnailForPenultimateImageWithAssetID_size_compressionQuality___block_invoke;
  v15[3] = &unk_1E58676C0;
  v15[4] = self;
  id v16 = v9;
  CGFloat v17 = width;
  CGFloat v18 = height;
  float v20 = a5;
  __uint64_t v19 = v11;
  id v12 = v9;
  uint64_t v13 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v15];

  return v13;
}

id __90__PLPTPdAssetManager__ptpThumbnailForPenultimateImageWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 40) inLibrary:v2];
  if (v3)
  {
    [*(id *)(a1 + 32) beginSignpostForThumbnailGenerationForAsset:v3 inputResourceTypeLabel:@"penultimate"];
    id v4 = [v3 pathForPenultimateFullsizeRenderImageFile];
    id v5 = *(void **)(a1 + 32);
    int v6 = [v3 originalOrientation];
    LODWORD(v7) = *(_DWORD *)(a1 + 72);
    BOOL v8 = objc_msgSend(v5, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v4, v6, *(double *)(a1 + 48), *(double *)(a1 + 56), v7);
    [*(id *)(a1 + 32) endSignpostForThumbnailGenerationForAsset:v3];
  }
  else
  {
    BOOL v8 = 0;
  }
  id v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v10 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 64)) / 1000000000.0;
    int v12 = 134218499;
    double v13 = v10;
    __int16 v14 = 2113;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = [v8 length];
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Generated thumbnail (adjustment base) in %.3fs, name: %{private}@, size: %ld", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (id)_ptpThumbnailForOriginalVideoWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    float v20 = "-[PLPTPdAssetManager _ptpThumbnailForOriginalVideoWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__PLPTPdAssetManager__ptpThumbnailForOriginalVideoWithAssetID_size_compressionQuality___block_invoke;
  v14[3] = &unk_1E58676E8;
  v14[4] = self;
  id v15 = v8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  __uint64_t v18 = v10;
  id v11 = v8;
  int v12 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v14];

  return v12;
}

id __87__PLPTPdAssetManager__ptpThumbnailForOriginalVideoWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 40) inLibrary:v2];
  if (v3)
  {
    [*(id *)(a1 + 32) beginSignpostForThumbnailGenerationForAsset:v3 inputResourceTypeLabel:@"spatial-over-capture"];
    id v4 = [v3 pathForOriginalFile];
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    int v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    id v15 = 0;
    id v16 = 0;
    char v7 = objc_msgSend(v5, "generatePosterFrameExportForVideoURL:outputData:maximumSize:error:", v6, &v16, &v15, *(double *)(a1 + 48), *(double *)(a1 + 56));
    id v8 = v16;
    id v9 = v15;

    if ((v7 & 1) == 0)
    {
      __uint64_t v10 = PLPTPGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v18 = *(double *)&v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Unable to generate video thumbnail (original video): %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) endSignpostForThumbnailGenerationForAsset:v3];
  }
  else
  {
    id v8 = 0;
  }
  id v11 = PLPTPGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v12 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 64)) / 1000000000.0;
    uint64_t v13 = [v8 length];
    *(_DWORD *)buf = 134218499;
    double v18 = v12;
    __int16 v19 = 2113;
    uint64_t v20 = 0;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Generated thumbnail (original video) in %.3fs, name: %{private}@, size: %ld", buf, 0x20u);
  }

  return v8;
}

- (id)_ptpThumbnailForSpatialOverCaptureVideoWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureVideoWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureVideoWithAssetID_size_compressionQuality___block_invoke;
  v14[3] = &unk_1E58676E8;
  v14[4] = self;
  id v15 = v8;
  CGFloat v16 = width;
  CGFloat v17 = height;
  __uint64_t v18 = v10;
  id v11 = v8;
  double v12 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v14];

  return v12;
}

id __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureVideoWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 40) inLibrary:v2];
  if (v3)
  {
    [*(id *)(a1 + 32) beginSignpostForThumbnailGenerationForAsset:v3 inputResourceTypeLabel:@"spatial-over-capture"];
    id v4 = [v3 pathForSpatialOverCaptureContentFile];
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    int v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    id v15 = 0;
    id v16 = 0;
    char v7 = objc_msgSend(v5, "generatePosterFrameExportForVideoURL:outputData:maximumSize:error:", v6, &v16, &v15, *(double *)(a1 + 48), *(double *)(a1 + 56));
    id v8 = v16;
    id v9 = v15;

    if ((v7 & 1) == 0)
    {
      __uint64_t v10 = PLPTPGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v18 = *(double *)&v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Unable to generate video thumbnail (spatial over capture video): %@", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) endSignpostForThumbnailGenerationForAsset:v3];
  }
  else
  {
    id v8 = 0;
  }
  id v11 = PLPTPGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v12 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 64)) / 1000000000.0;
    uint64_t v13 = [v8 length];
    *(_DWORD *)buf = 134218499;
    double v18 = v12;
    __int16 v19 = 2113;
    uint64_t v20 = 0;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Generated thumbnail (spatial over capture video) in %.3fs, name: %{private}@, size: %ld", buf, 0x20u);
  }

  return v8;
}

- (id)_ptpThumbnailForSpatialOverCaptureImageWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __uint64_t v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureImageWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureImageWithAssetID_size_compressionQuality___block_invoke;
  v15[3] = &unk_1E58676C0;
  v15[4] = self;
  id v16 = v9;
  CGFloat v17 = width;
  CGFloat v18 = height;
  float v20 = a5;
  __uint64_t v19 = v11;
  id v12 = v9;
  uint64_t v13 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v15];

  return v13;
}

id __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureImageWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 40) inLibrary:v2];
  if (v3)
  {
    [*(id *)(a1 + 32) beginSignpostForThumbnailGenerationForAsset:v3 inputResourceTypeLabel:@"spatial-over-capture"];
    id v4 = [v3 pathForSpatialOverCaptureContentFile];
    LODWORD(v5) = *(_DWORD *)(a1 + 72);
    int v6 = objc_msgSend(*(id *)(a1 + 32), "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v4, 1, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);
    [*(id *)(a1 + 32) endSignpostForThumbnailGenerationForAsset:v3];
  }
  else
  {
    int v6 = 0;
  }
  char v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v8 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 64)) / 1000000000.0;
    int v10 = 134218499;
    double v11 = v8;
    __int16 v12 = 2113;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 length];
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Generated thumbnail (spatial over capture image) in %.3fs, name: %{private}@, size: %ld", (uint8_t *)&v10, 0x20u);
  }

  return v6;
}

- (id)_ptpThumbnailForFullSizeRenderWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = "-[PLPTPdAssetManager _ptpThumbnailForFullSizeRenderWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__PLPTPdAssetManager__ptpThumbnailForFullSizeRenderWithAssetID_size_compressionQuality___block_invoke;
  v15[3] = &unk_1E58676C0;
  v15[4] = self;
  id v16 = v9;
  CGFloat v17 = width;
  CGFloat v18 = height;
  float v20 = a5;
  __uint64_t v19 = v11;
  id v12 = v9;
  uint64_t v13 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v15];

  return v13;
}

id __88__PLPTPdAssetManager__ptpThumbnailForFullSizeRenderWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 40) inLibrary:v2];
  if (!v3)
  {
    id v12 = 0;
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) beginSignpostForThumbnailGenerationForAsset:v3 inputResourceTypeLabel:@"fullsize-render"];
  id v4 = *(void **)(a1 + 32);
  [v4 masterThumbSize];
  if (!objc_msgSend(v4, "requestedSize:fitsInSourceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56), v5, v6))
  {
    double v8 = 0;
    goto LABEL_9;
  }
  char v7 = [v2 thumbnailManager];
  double v8 = [v7 thumbnailJPEGPathForPhoto:v3];
  if (!v8)
  {

    goto LABEL_9;
  }
  id v9 = *(void **)(a1 + 32);
  int v10 = [v3 originalOrientation];
  LODWORD(v11) = *(_DWORD *)(a1 + 72);
  id v12 = objc_msgSend(v9, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v8, v10, *(double *)(a1 + 48), *(double *)(a1 + 56), v11);

  if (!v12)
  {
LABEL_9:
    uint64_t v13 = [v3 pathForFullsizeImageFile];

    if (v13)
    {
      __int16 v14 = *(void **)(a1 + 32);
      int v15 = [v3 originalOrientation];
      LODWORD(v16) = *(_DWORD *)(a1 + 72);
      id v12 = objc_msgSend(v14, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v13, v15, *(double *)(a1 + 48), *(double *)(a1 + 56), v16);
      double v8 = (void *)v13;
    }
    else
    {
      double v8 = 0;
      id v12 = 0;
    }
  }
  [*(id *)(a1 + 32) endSignpostForThumbnailGenerationForAsset:v3];

LABEL_13:
  CGFloat v17 = PLPTPGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    double v18 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 64)) / 1000000000.0;
    int v20 = 134218499;
    double v21 = v18;
    __int16 v22 = 2113;
    uint64_t v23 = 0;
    __int16 v24 = 2048;
    uint64_t v25 = [v12 length];
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Generated thumbnail (adjusted) in %.3fs, name: %{private}@, size: %ld", (uint8_t *)&v20, 0x20u);
  }

  return v12;
}

- (id)embeddedThumbnailDataForAsset:(id)a3 requestedSize:(CGSize)a4 shouldScale:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315138;
    uint64_t v25 = "-[PLPTPdAssetManager embeddedThumbnailDataForAsset:requestedSize:shouldScale:]";
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v24, 0xCu);
  }

  unsigned int v11 = [v9 embeddedThumbnailLength];
  uint64_t v12 = (int)v11;
  if (v11 > 0x80000)
  {
    if (v5)
    {
      CFDataRef v13 = [v9 embeddedThumbnailData];
      CGImageSourceRef v14 = CGImageSourceCreateWithData(v13, 0);

      if (v14)
      {
        uint64_t v30 = *MEMORY[0x1E4F2F428];
        if (width >= height) {
          double v15 = width;
        }
        else {
          double v15 = height;
        }
        double v16 = [NSNumber numberWithDouble:v15];
        v31[0] = v16;
        CGFloat v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
        double v18 = -[PLPTPdAssetManager _dataForThumbnailImageSource:options:originalOrientation:](self, "_dataForThumbnailImageSource:options:originalOrientation:", v14, v17, (int)[v9 originalOrientation]);

        CFRelease(v14);
        goto LABEL_18;
      }
    }
    else
    {
      double v21 = PLPTPGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = [v9 uuid];
        int v24 = 138412802;
        uint64_t v25 = v22;
        __int16 v26 = 2048;
        uint64_t v27 = v12;
        __int16 v28 = 2048;
        uint64_t v29 = 0x80000;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "Not using embeddedThumbnailData for asset %@ because the thumbnail size (%lu) exceeds the maximum allowed size (%lu)", (uint8_t *)&v24, 0x20u);
      }
    }
    goto LABEL_17;
  }
  if (!v11)
  {
LABEL_17:
    double v18 = 0;
    goto LABEL_18;
  }
  double v18 = [v9 embeddedThumbnailData];
  __uint64_t v19 = PLPTPGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v20 = [v9 uuid];
    int v24 = 138412802;
    uint64_t v25 = v20;
    __int16 v26 = 2048;
    uint64_t v27 = (uint64_t)v18;
    __int16 v28 = 2048;
    uint64_t v29 = v12;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Using embeddedThumbnailData for asset %@: %p %lu", (uint8_t *)&v24, 0x20u);
  }
LABEL_18:

  return v18;
}

- (id)_ptpThumbnailForOriginalWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PLPTPdAssetManager _ptpThumbnailForOriginalWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__24826;
  __int16 v26 = __Block_byref_object_dispose__24827;
  id v27 = 0;
  unsigned int v11 = (void *)MEMORY[0x19F38D3B0]();
  __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__PLPTPdAssetManager__ptpThumbnailForOriginalWithAssetID_size_compressionQuality___block_invoke;
  v16[3] = &unk_1E5867698;
  v16[4] = self;
  id v13 = v9;
  CGFloat v19 = width;
  CGFloat v20 = height;
  id v17 = v13;
  p_long long buf = &buf;
  float v22 = a5;
  __uint64_t v21 = v12;
  [(PLPTPdAssetManager *)self _performBlockAndWait:v16];

  id v14 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v14;
}

void __82__PLPTPdAssetManager__ptpThumbnailForOriginalWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  v103[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibrary];
  id v3 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 40) inLibrary:v2];
  if (v3)
  {
    [*(id *)(a1 + 32) beginSignpostForThumbnailGenerationForAsset:v3 inputResourceTypeLabel:@"original"];
    objc_msgSend(*(id *)(a1 + 32), "_validateSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v5 = v4;
    double v7 = v6;
    double v8 = PLPTPGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = NSStringFromSize(*(NSSize *)(a1 + 56));
      v104.CGFloat width = v5;
      v104.CGFloat height = v7;
      int v10 = NSStringFromSize(v104);
      *(_DWORD *)long long buf = 138412546;
      double v95 = *(double *)&v9;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "requested size: %@, valid size: %@", buf, 0x16u);
    }
    BOOL v11 = v7 == 120.0 && v5 == 160.0;
    if (v11)
    {
      uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "embeddedThumbnailDataForAsset:requestedSize:shouldScale:", v3, objc_msgSend(v3, "hasAdjustments"), 160.0, 120.0);
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        double v15 = PLPTPGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          double v16 = [v3 originalFilename];
          *(_DWORD *)long long buf = 138412290;
          double v95 = *(double *)&v16;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "No data from embedded thumb for %@", buf, 0xCu);
        }
      }
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_61;
    }
    char v17 = [v3 hasAdjustments];
    double v18 = PLPTPGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v19)
      {
        CGFloat v20 = [v3 originalFilename];
        *(_DWORD *)long long buf = 138412290;
        double v95 = *(double *)&v20;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "asset '%@' IS adjusted", buf, 0xCu);
      }
      __uint64_t v21 = [v3 pathForNonAdjustedLargeThumbnailFile];
      uint64_t v22 = *MEMORY[0x1E4F2FF48];
      uint64_t v102 = *MEMORY[0x1E4F2FF48];
      uint64_t v23 = MEMORY[0x1E4F1CC38];
      v103[0] = MEMORY[0x1E4F1CC38];
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:&v102 count:1];
      uint64_t v25 = (CGImageSource *)CGImageSourceCreateWithFile();

      if (!v25)
      {

        goto LABEL_40;
      }
      uint64_t v100 = v22;
      uint64_t v101 = v23;
      CFDictionaryRef v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
      id v27 = CGImageSourceCopyPropertiesAtIndex(v25, 0, v26);

      if (!v27)
      {
        uint64_t v28 = PLPTPGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          double v95 = *(double *)&v21;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "No props for path %@", buf, 0xCu);
        }
      }
      BOOL v93 = v11;
      uint64_t v29 = *(void **)(a1 + 32);
      uint64_t v30 = *MEMORY[0x1E4F2FD00];
      int v31 = -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FD00], v25);
      [v31 floatValue];
      double v33 = v32;
      uint64_t v34 = *MEMORY[0x1E4F2FCE8];
      double v35 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
      [v35 floatValue];
      LODWORD(v29) = objc_msgSend(v29, "requestedSize:fitsInSourceSize:", v5, v7, v33, v36);

      if (v29)
      {
        id v37 = v21;
        __int16 v38 = PLPTPGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          double v95 = *(double *)&v37;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "Thumbnail file path from asset: %@", buf, 0xCu);
        }
      }
      else
      {
        __int16 v38 = PLPTPGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v107.CGFloat width = v5;
          v107.CGFloat height = v7;
          v46 = NSStringFromSize(v107);
          CFDictionaryRef v47 = [v27 objectForKeyedSubscript:v30];
          [v47 floatValue];
          CGFloat v49 = v48;
          double v50 = [v27 objectForKeyedSubscript:v34];
          [v50 floatValue];
          v108.CGFloat height = v51;
          v108.CGFloat width = v49;
          v52 = NSStringFromSize(v108);
          *(_DWORD *)long long buf = 138412546;
          double v95 = *(double *)&v46;
          __int16 v96 = 2112;
          uint64_t v97 = (uint64_t)v52;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEBUG, "valid size %@ does not fit in source size %@", buf, 0x16u);
        }
        id v37 = 0;
      }
      LOBYTE(v11) = v93;

      CFRelease(v92);
    }
    else
    {
      if (v19)
      {
        int64_t v39 = [v3 originalFilename];
        *(_DWORD *)long long buf = 138412290;
        double v95 = *(double *)&v39;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "asset '%@' is NOT adjusted", buf, 0xCu);
      }
      uint64_t v40 = *(void **)(a1 + 32);
      [v40 masterThumbSize];
      if (!objc_msgSend(v40, "requestedSize:fitsInSourceSize:", v5, v7, v41, v42)) {
        goto LABEL_40;
      }
      __int16 v43 = PLPTPGetLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v105.CGFloat width = v5;
        v105.CGFloat height = v7;
        id v44 = NSStringFromSize(v105);
        [*(id *)(a1 + 32) masterThumbSize];
        uint64_t v45 = NSStringFromSize(v106);
        *(_DWORD *)long long buf = 138412546;
        double v95 = *(double *)&v44;
        __int16 v96 = 2112;
        uint64_t v97 = (uint64_t)v45;
        _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "validSize (%@) fits in masterThumbSize (%@)", buf, 0x16u);
      }
      __uint64_t v21 = [v2 thumbnailManager];
      id v37 = [v21 thumbnailJPEGPathForPhoto:v3];
      id v27 = PLPTPGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v95 = *(double *)&v37;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Thumbnail file path from thumbnail manager: %@", buf, 0xCu);
      }
    }

    if (v37)
    {
      v53 = [*(id *)(a1 + 32) fileManager];
      int v54 = [v53 fileExistsAtPath:v37];

      if (v54)
      {
        v55 = *(void **)(a1 + 32);
        int v56 = [v3 originalOrientation];
        LODWORD(v57) = *(_DWORD *)(a1 + 80);
        uint64_t v58 = objc_msgSend(v55, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v37, v56, *(double *)(a1 + 56), *(double *)(a1 + 64), v57);
        uint64_t v59 = *(void *)(*(void *)(a1 + 48) + 8);
        v60 = *(void **)(v59 + 40);
        *(void *)(v59 + 40) = v58;

        __int16 v61 = PLPTPGetLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v62 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v63 = [v62 length];
          *(_DWORD *)long long buf = 134218498;
          double v95 = *(double *)&v62;
          __int16 v96 = 2048;
          uint64_t v97 = v63;
          __int16 v98 = 2112;
          v99 = v37;
          v64 = "Thumbnail file data [1]: %p, %lu, %@";
          v65 = v61;
          uint32_t v66 = 32;
LABEL_44:
          _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEBUG, v64, buf, v66);
        }
      }
      else
      {
        __int16 v61 = PLPTPGetLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          double v95 = *(double *)&v37;
          v65 = v61;
          uint32_t v66 = 12;
          goto LABEL_44;
        }
      }

LABEL_46:
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        v67 = *(void **)(a1 + 32);
        v68 = [v3 pathForOriginalFile];
        LODWORD(v69) = *(_DWORD *)(a1 + 80);
        uint64_t v70 = objc_msgSend(v67, "_generateThumbnailForAsset:fromOriginalImagePath:size:compressionQuality:", v3, v68, *(double *)(a1 + 56), *(double *)(a1 + 64), v69);
        uint64_t v71 = *(void *)(*(void *)(a1 + 48) + 8);
        v72 = *(void **)(v71 + 40);
        *(void *)(v71 + 40) = v70;

        v73 = PLPTPGetLog();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          double v74 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(void *)(a1 + 72)) / 1000000000.0;
          v75 = [v3 pathForOriginalFile];
          v76 = [v75 lastPathComponent];
          v77 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          *(_DWORD *)long long buf = 134218498;
          double v95 = v74;
          __int16 v96 = 2112;
          uint64_t v97 = (uint64_t)v76;
          __int16 v98 = 2048;
          v99 = v77;
          _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_DEBUG, "Generated thumbnail (original) in %.3fs, name: %@, size: %ld", buf, 0x20u);
        }
        if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          v78 = [v3 fileURLForThumbnailFile];
          if (v78)
          {
            uint64_t v79 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v78];
            uint64_t v80 = *(void *)(*(void *)(a1 + 48) + 8);
            v81 = *(void **)(v80 + 40);
            *(void *)(v80 + 40) = v79;

            v82 = PLPTPGetLog();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              v83 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              uint64_t v84 = [v83 length];
              *(_DWORD *)long long buf = 134218498;
              double v95 = *(double *)&v83;
              __int16 v96 = 2048;
              uint64_t v97 = v84;
              __int16 v98 = 2112;
              v99 = v78;
              _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_DEBUG, "Thumbnail file data from [2]: %p, %lu, %@", buf, 0x20u);
            }
          }
          if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
            char v85 = 1;
          }
          else {
            char v85 = v11;
          }
          if ((v85 & 1) == 0)
          {
            uint64_t v86 = objc_msgSend(*(id *)(a1 + 32), "embeddedThumbnailDataForAsset:requestedSize:shouldScale:", v3, objc_msgSend(v3, "hasAdjustments"), v5, v7);
            uint64_t v87 = *(void *)(*(void *)(a1 + 48) + 8);
            v88 = *(void **)(v87 + 40);
            *(void *)(v87 + 40) = v86;

            v89 = PLPTPGetLog();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              v90 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
              uint64_t v91 = [v90 length];
              *(_DWORD *)long long buf = 134218240;
              double v95 = *(double *)&v90;
              __int16 v96 = 2048;
              uint64_t v97 = v91;
              _os_log_impl(&dword_19B3C7000, v89, OS_LOG_TYPE_DEBUG, "Using embeddedThumbnailData fallback: %p %lu", buf, 0x16u);
            }
          }
        }
      }
LABEL_61:
      [*(id *)(a1 + 32) endSignpostForThumbnailGenerationForAsset:v3];
      goto LABEL_62;
    }
LABEL_40:
    id v37 = PLPTPGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEBUG, "Still don't have a thumbnailFilePath", buf, 2u);
    }
    goto LABEL_46;
  }
LABEL_62:
}

- (BOOL)requestedSize:(CGSize)a3 fitsInSourceSize:(CGSize)a4
{
  if (a3.width < a3.height) {
    a3.double width = a3.height;
  }
  if (a4.width >= a4.height) {
    double width = a4.width;
  }
  else {
    double width = a4.height;
  }
  return a3.width <= width;
}

- (CGSize)masterThumbSize
{
  uint64_t v2 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  id v3 = [v2 masterThumbnailFormat];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)_validateSize:(CGSize)result
{
  if (result.height < 120.0) {
    result.CGFloat height = 120.0;
  }
  if (result.width < 160.0) {
    result.double width = 160.0;
  }
  return result;
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  id v4 = a3;
  char v5 = [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher isCameraRunning];
  double v6 = PLPTPGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to running. Canceling inflight request.", buf, 2u);
    }

    *(void *)long long buf = 0;
    int v10 = buf;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__24826;
    uint64_t v13 = __Block_byref_object_dispose__24827;
    id v14 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v10 + 5), "invalidateWithHandler:", &__block_literal_global_24941, v8, 3221225472, __50__PLPTPdAssetManager_cameraWatcherDidChangeState___block_invoke, &unk_1E5875E68, self, buf);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to NOT running.", buf, 2u);
    }

    [(PLPTPdAssetManager *)self _requestFinalizationOfNextAsset];
  }
}

void __50__PLPTPdAssetManager_cameraWatcherDidChangeState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;
}

uint64_t __50__PLPTPdAssetManager_cameraWatcherDidChangeState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)_handleMakeResourceReplyForAssetUUID:(id)a3 assetObjectID:(id)a4 moc:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  double v16 = PLPTPGetLog();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v13, "pl_shortURI");
      double v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138543618;
      int v31 = v12;
      __int16 v32 = 2114;
      double v33 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Finalization successful for asset: %{public}@ (%{public}@)", buf, 0x16u);
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __91__PLPTPdAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke;
    v27[3] = &unk_1E5873A50;
    v27[4] = self;
    id v28 = v14;
    id v29 = v13;
    [v28 performBlock:v27];
  }
  else
  {
    if (v17)
    {
      if ([v15 code] == 3072) {
        BOOL v19 = @"was canceled";
      }
      else {
        BOOL v19 = @"failed";
      }
      CGFloat v20 = objc_msgSend(v13, "pl_shortURI");
      *(_DWORD *)long long buf = 138413058;
      int v31 = v19;
      __int16 v32 = 2114;
      double v33 = v12;
      __int16 v34 = 2112;
      double v35 = v20;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Finalization %@ for asset: %{public}@ (%@) [%@]", buf, 0x2Au);
    }
  }
  uint64_t v24 = v15;
  uint64_t v25 = v13;
  CFDictionaryRef v26 = v12;
  __uint64_t v21 = v12;
  id v22 = v13;
  id v23 = v15;
  PLRunWithUnfairLock();
  [(PLPTPdAssetManager *)self _requestFinalizationOfNextAsset];
}

void __91__PLPTPdAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = a1[6];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 managedObjectContext:v2 libraryChangedWithInsertedAssetIDs:0 deletedAssetIDs:0 changedAssetIDs:v3 adjustedAssetIDs:0];
}

void __91__PLPTPdAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke_185(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) code] == 3072)
  {
    [*(id *)(*(void *)(a1 + 40) + 88) insertObject:*(void *)(a1 + 48) atIndex:0];
    uint64_t v2 = PLPTPGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 56);
      uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 88) count];
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Re-enqueued finalization for asset (uuid: %@, pending: %lu) because it was canceled", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = 0;
}

- (id)_sendFinalizationRequestForAssetObjectID:(id)a3 moc:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLPTPdAssetManager.m", 868, @"Invalid parameter not satisfying: %@", @"assetObjectID" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PLPTPdAssetManager.m", 869, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

LABEL_3:
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__24826;
  uint64_t v25 = __Block_byref_object_dispose__24827;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke;
  v16[3] = &unk_1E5875368;
  id v10 = v7;
  id v17 = v10;
  id v11 = v9;
  BOOL v19 = self;
  CGFloat v20 = &v21;
  id v18 = v11;
  [v11 performBlockAndWait:v16];
  id v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 uuid];
  uint64_t v4 = PLPTPGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "pl_shortURI");
    *(_DWORD *)long long buf = 138543618;
    uint64_t v23 = v3;
    __int16 v24 = 2114;
    uint64_t v25 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Requesting finalization of asset: %{public}@ (%{public}@)", buf, 0x16u);
  }
  double v6 = [PLResourceXPCMakeAvailableRequest alloc];
  id v7 = [NSString stringWithFormat:@"ptp-%@", v3];
  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = [v2 primaryStoreOriginalResource];
  id v10 = [(PLResourceXPCMakeAvailableRequest *)v6 initWithTaskIdentifier:v7 assetObjectID:v8 resource:v9];

  id v11 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v12 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:v11];

  id v13 = [v12 resourceAvailabilityClient];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke_177;
  v18[3] = &unk_1E5867650;
  v18[4] = *(void *)(a1 + 48);
  id v19 = v3;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v14 = v3;
  uint64_t v15 = [v13 sendMakeResourceAvailableRequest:v10 reply:v18];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

uint64_t __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke_177(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) _handleMakeResourceReplyForAssetUUID:*(void *)(a1 + 40) assetObjectID:*(void *)(a1 + 48) moc:*(void *)(a1 + 56) success:a2 error:a6];
}

- (void)_requestFinalizationOfNextAsset
{
  if ([(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher isCameraRunning])
  {
    uint64_t v3 = PLPTPGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Camera view finder is running, skipping finalization requests", buf, 2u);
    }
  }
  else
  {
    *(void *)long long buf = 0;
    double v6 = buf;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__24826;
    __int16 v9 = __Block_byref_object_dispose__24827;
    id v10 = 0;
    uint64_t v4 = MEMORY[0x1E4F143A8];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v6 + 5), "objectValue", v4, 3221225472, __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke, &unk_1E5875E68, self, buf);

    _Block_object_dispose(buf, 8);
  }
}

void __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPTPGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v18 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Camera view finder is NOT running, sending finalization requests (pending:%lu)", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) firstObject];
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = objc_initWeak((id *)buf, v5);

    id v7 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke_165;
    id v14 = &unk_1E5870860;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v4;
    uint64_t v8 = [v7 initWithBlock:&v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "removeObjectAtIndex:", 0, v11, v12, v13, v14);
  }
}

id __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke_165(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [WeakRetained photoLibrary];
    id v6 = [v5 managedObjectContext];
    id v7 = [v3 _sendFinalizationRequestForAssetObjectID:v4 moc:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)addAssetsNeedingFinalization:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  id v7 = v4;
  id v5 = v4;
  PLRunWithUnfairLock();
  [(PLPTPdAssetManager *)self _requestFinalizationOfNextAsset];
}

uint64_t __51__PLPTPdAssetManager_addAssetsNeedingFinalization___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPTPGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Adding %lu assets to pending finalization queue.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 88) addObjectsFromArray:*(void *)(a1 + 32)];
}

- (id)_ptpAssetEnumeratorAllAssets
{
  uint64_t v3 = [(PLPTPdAssetManager *)self _allAssetObjectIDs];
  id v4 = [(PLPTPdAssetManager *)self managedObjectContext];
  int v5 = +[PLPTPdAssetEnumerator enumeratorForAssetManager:self assetObjectIDs:v3 managedObjectContext:v4 conversionSupport:self->_formatConversionManager];

  return v5;
}

- (id)_allAssetObjectIDs
{
  return [(PLPTPdAssetManager *)self fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:0];
}

- (BOOL)libraryIsAvailable
{
  uint64_t v2 = [(PLPTPdAssetManager *)self photoLibrary];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_ptpAssetsForAssetWithID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PLPTPdAssetManager__ptpAssetsForAssetWithID___block_invoke;
  v8[3] = &unk_1E5869F18;
  id v9 = v4;
  id v10 = self;
  id v5 = v4;
  uint64_t v6 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v8];

  return v6;
}

id __47__PLPTPdAssetManager__ptpAssetsForAssetWithID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) photoLibrary];
  id v4 = +[PLManagedAsset assetWithObjectID:v2 inLibrary:v3];

  id v5 = [v4 pictureTransferProtocolAssetsWithConversionSupport:*(void *)(*(void *)(a1 + 40) + 16)];

  return v5;
}

- (void)ptpEnumerateAssetsWithPrimaryKeys:(id)a3 usingBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, uint8_t *))a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
      id v14 = (void *)MEMORY[0x19F38D3B0]();
      id v15 = [(PLPTPdAssetManager *)self _ptpAssetsForAssetWithID:v13];
      id v16 = PLPTPGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [v8 count];
        *(_DWORD *)long long buf = 134218242;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "ptpd is asking for info for %ld primary keys: %@", buf, 0x16u);
      }

      buf[0] = 0;
      v7[2](v7, v15, buf);
      int v18 = buf[0];

      if (v18) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_expungeAsset:(id)a3 withReason:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Expunging asset: %@, reason: %@", buf, 0x16u);
  }

  id v8 = +[PLAssetTransactionReason transactionReason:v6];
  uint64_t v9 = [v5 objectID];
  [v5 deleteWithReason:v8];
  id v10 = v9;
  pl_dispatch_sync();
}

void __47__PLPTPdAssetManager__expungeAsset_withReason___block_invoke(uint64_t a1)
{
  id v9 = (id)[*(id *)(*(void *)(a1 + 32) + 24) mutableCopy];
  [v9 removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v9];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;

    id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  [v5 addObject:*(void *)(a1 + 40)];
}

- (BOOL)ptpDeletePhotoForAssetHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLPTPdAssetManager.m", 685, @"Invalid parameter not satisfying: %@", @"[assetHandle isKindOfClass:[PLPTPAssetHandle class]]" object file lineNumber description];
  }
  id v6 = PLPTPGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v20 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Deleting asset for asset handle: %@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__PLPTPdAssetManager_ptpDeletePhotoForAssetHandle___block_invoke;
  v16[3] = &unk_1E5867628;
  uint64_t v17 = v5;
  int v18 = self;
  uint64_t v7 = v5;
  id v8 = [(PLPTPdAssetManager *)self _performResultTransactionAndWait:v16];
  id v9 = PLPTPGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = [v8 BOOLValue];
    uint64_t v11 = @"NO";
    if (v10) {
      uint64_t v11 = @"YES";
    }
    id v12 = v11;
    *(_DWORD *)long long buf = 138412290;
    long long v20 = v12;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "ptpDeletePhotoForAssetHandle is returning: %@", buf, 0xCu);
  }
  char v13 = [v8 BOOLValue];

  return v13;
}

id __51__PLPTPdAssetManager_ptpDeletePhotoForAssetHandle___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) assetID];
  uint64_t v3 = [*(id *)(a1 + 40) photoLibrary];
  id v4 = +[PLManagedAsset assetWithObjectID:v2 inLibrary:v3];

  id v5 = PLPTPGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 objectID];
    int v31 = 138412290;
    uint64_t v32 = (uint64_t)v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Asset for handle: %@", (uint8_t *)&v31, 0xCu);
  }
  if (!v4)
  {
    char v13 = PLPTPGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v31 = 138412290;
      uint64_t v32 = v14;
      uint64_t v15 = "Unable to find asset for asset handle: %@";
LABEL_15:
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v31, 0xCu);
    }
LABEL_16:

    long long v19 = (void *)MEMORY[0x1E4F1CC28];
    goto LABEL_40;
  }
  uint64_t v7 = [*(id *)(a1 + 32) sidecarID];

  if (!v7)
  {
    id v16 = [v4 additionalAttributes];
    uint64_t v17 = [v16 ptpTrashedState];

    switch([*(id *)(a1 + 32) type])
    {
      case 0:
        v17 |= 1uLL;
        goto LABEL_29;
      case 1:
        v17 |= 2uLL;
        goto LABEL_29;
      case 2:
        v17 |= 0x10000uLL;
        goto LABEL_29;
      case 3:
        long long v20 = PLPTPGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          int v31 = 138412290;
          uint64_t v32 = v21;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Got a sidecar handle but found no sidecar file: %@", (uint8_t *)&v31, 0xCu);
        }

        uint64_t v12 = 0;
        goto LABEL_30;
      case 4:
        v17 |= 4uLL;
        goto LABEL_29;
      case 5:
        v17 |= 8uLL;
        goto LABEL_29;
      case 6:
      case 7:
        v17 |= 0x10uLL;
        goto LABEL_29;
      case 8:
        v17 |= 0x20uLL;
        goto LABEL_29;
      case 9:
        v17 |= 0x40uLL;
        goto LABEL_29;
      case 10:
        v17 |= 0x80uLL;
        goto LABEL_29;
      case 11:
        v17 |= 0x100uLL;
        goto LABEL_29;
      default:
LABEL_29:
        uint64_t v12 = 1;
LABEL_30:
        long long v22 = [v4 additionalAttributes];
        [v22 setPtpTrashedState:v17];

        id v9 = PLPTPGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v31 = 134217984;
          uint64_t v32 = v17;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Updated asset trashed state: 0x%llx", (uint8_t *)&v31, 0xCu);
        }
        break;
    }
    goto LABEL_32;
  }
  id v8 = [*(id *)(a1 + 32) sidecarID];
  id v9 = [v4 sidecarWithResourceObjectID:v8];

  if (!v9)
  {
    char v13 = PLPTPGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v31 = 138412290;
      uint64_t v32 = v18;
      uint64_t v15 = "Unable to find sidecar for asset handle: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  [v9 setPtpTrashedState:1];
  int v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v9 ptpTrashedState];
    int v31 = 134217984;
    uint64_t v32 = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Updated sidecar trashed state: 0x%llx", (uint8_t *)&v31, 0xCu);
  }

  uint64_t v12 = 1;
LABEL_32:

  BOOL v23 = +[PLPTPUtilities shouldExpungeAsset:v4];
  uint64_t v24 = PLPTPGetLog();
  __int16 v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v26 = [v4 uuid];
      uint64_t v27 = *(void *)(a1 + 32);
      int v31 = 138412546;
      uint64_t v32 = (uint64_t)v26;
      __int16 v33 = 2112;
      uint64_t v34 = v27;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "Expunge asset %@ for handle: %@", (uint8_t *)&v31, 0x16u);
    }
    [*(id *)(a1 + 40) _expungeAsset:v4 withReason:@"PTP client deleted the asset"];
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = [v4 uuid];
      uint64_t v29 = *(void *)(a1 + 32);
      int v31 = 138412546;
      uint64_t v32 = (uint64_t)v28;
      __int16 v33 = 2112;
      uint64_t v34 = v29;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "Not expunging asset %@ for handle: %@", (uint8_t *)&v31, 0x16u);
    }
  }
  long long v19 = [NSNumber numberWithBool:v12];
LABEL_40:

  return v19;
}

- (BOOL)ptpCanDeleteFiles
{
  uint64_t v2 = [(PLPTPdAssetManager *)self photoLibrary];
  char v3 = [v2 isCloudPhotoLibraryEnabled] ^ 1;

  return v3;
}

- (int64_t)cplStorageState
{
  char v3 = [(PLPTPdAssetManager *)self photoLibrary];
  int v4 = [v3 isCloudPhotoLibraryEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(PLPTPdAssetManager *)self photoLibrary];
  id v6 = [v5 libraryBundle];
  uint64_t v7 = +[PLCPLSettings settingsWithLibraryBundle:v6];

  if ([v7 isKeepOriginalsEnabled]) {
    int64_t v8 = 2;
  }
  else {
    int64_t v8 = 1;
  }

  return v8;
}

- (id)ptpImagePropertiesForAssetHandle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLPTPdAssetManager_ptpImagePropertiesForAssetHandle___block_invoke;
  v8[3] = &unk_1E5869F18;
  id v9 = v4;
  int v10 = self;
  id v5 = v4;
  id v6 = [(PLPTPdAssetManager *)self _performResultBlockAndWait:v8];

  return v6;
}

id __55__PLPTPdAssetManager_ptpImagePropertiesForAssetHandle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetID];
  char v3 = [*(id *)(a1 + 40) photoLibrary];
  id v4 = +[PLManagedAsset assetWithObjectID:v2 inLibrary:v3];

  if (v4)
  {
    id v5 = [v4 imageProperties];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)assetReaderForFormatConvertedPTPAsset:(id)a3 ofManagedAsset:(id)a4 path:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = PLPTPGetLog();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v8);

  char v13 = PLPTPGetLog();
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v19 = 138412290;
    id v20 = v9;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PTP transcode", "PTP format converted asset reader for %@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v15 = [(PLPTPdFormatConversionManager *)self->_formatConversionManager assetReaderForFormatConvertedPTPAsset:v8 ofManagedAsset:v10 path:v9];

  id v16 = PLPTPGetLog();
  uint64_t v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v12, "PTP transcode", "", (uint8_t *)&v19, 2u);
  }

  return v15;
}

- (id)adjustmentFilePathForAsset:(id)a3 requiresTemporaryFileCleanup:(BOOL *)a4
{
  id v5 = a3;
  id v6 = [v5 pathForAdjustmentFile];
  uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
  if (![MEMORY[0x1E4F8CBB8] adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:v7 predictedSize:0])
  {
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v8 = NSString;
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = [v5 uuid];
  os_signpost_id_t v12 = [v6 lastPathComponent];
  char v13 = [v8 stringWithFormat:@"%@-%@-reassembled-data-%@", v10, v11, v12];

  uint64_t v14 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v15 = NSTemporaryDirectory();
  id v16 = [v15 stringByAppendingPathComponent:v13];
  uint64_t v17 = [v14 fileURLWithPath:v16 isDirectory:0];

  int v18 = [MEMORY[0x1E4F8CBB8] writeReassembleAdjustmentsPropertyListAtURL:v7 toURL:v17 error:0];
  BOOL v19 = v18;
  uint64_t v20 = 0;
  if (v18)
  {
    uint64_t v20 = [v17 path];
  }

  id v6 = (void *)v20;
  if (a4) {
LABEL_7:
  }
    *a4 = v19;
LABEL_8:

  return v6;
}

- (id)ptpAssetReaderForAssetHandle:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLPTPdAssetManager.m", 507, @"Invalid parameter not satisfying: %@", @"[assetHandle isKindOfClass:[PLPTPAssetHandle class]]" object file lineNumber description];
  }
  id v6 = PLPTPGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Requesting asset reader for asset handle: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke;
  BOOL v19 = &unk_1E5875CE0;
  uint64_t v20 = self;
  PLRunWithUnfairLock();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy__24826;
  uint64_t v24 = __Block_byref_object_dispose__24827;
  id v25 = 0;
  uint64_t v7 = [(PLPTPdAssetManager *)self photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_2;
  v12[3] = &unk_1E5875340;
  id v8 = v5;
  id v13 = v8;
  uint64_t v14 = self;
  p_long long buf = &buf;
  [v7 performBlockAndWait:v12];

  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v9;
}

uint64_t __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v2 = [v1 downloadedCount] + 1;
  return [v1 setDownloadedCount:v2];
}

void __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) assetID];
  char v3 = [*(id *)(a1 + 40) photoLibrary];
  id v4 = +[PLManagedAsset assetWithObjectID:v2 inLibrary:v3];

  id v5 = PLPTPGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 objectID];
    *(_DWORD *)long long buf = 138412290;
    double v41 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Asset for reader: %@", buf, 0xCu);
  }
  if (v4)
  {
    uint64_t v7 = [*(id *)(a1 + 32) sidecarID];
    id v8 = [v4 sidecarWithResourceObjectID:v7];
    id v9 = [v4 pictureTransferProtocolAssetsWithConversionSupport:*(void *)(*(void *)(a1 + 40) + 16)];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_138;
    v36[3] = &unk_1E5867600;
    id v10 = v8;
    id v37 = v10;
    uint64_t v11 = v7;
    uint64_t v38 = v11;
    id v39 = *(id *)(a1 + 32);
    os_signpost_id_t v12 = objc_msgSend(v9, "_pl_firstObjectPassingTest:", v36);
    unsigned __int8 v35 = 0;
    if (v10)
    {
      id v13 = +[PLPTPUtilities pathForSidecar:v10 onAsset:v4];
      int v14 = [*(id *)(a1 + 32) requiresConversion];
      uint64_t v15 = PLPTPGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [v10 objectID];
        *(_DWORD *)long long buf = 138412290;
        double v41 = v16;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "Sidecar for reader: %@", buf, 0xCu);
      }
    }
    else
    {
      switch([*(id *)(a1 + 32) type])
      {
        case 0:
          uint64_t v18 = [v4 pathForOriginalFile];
          goto LABEL_22;
        case 1:
          uint64_t v19 = [*(id *)(a1 + 40) adjustmentFilePathForAsset:v4 requiresTemporaryFileCleanup:&v35];
          goto LABEL_26;
        case 2:
          uint64_t v19 = [v4 pathForAdjustmentSecondaryDataFile];
          goto LABEL_26;
        case 3:
          uint64_t v20 = PLPTPGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = *(void **)(a1 + 32);
            *(_DWORD *)long long buf = 138412290;
            double v41 = v21;
            _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Got a sidecar handle but found no sidecar file: %@", buf, 0xCu);
          }

          goto LABEL_18;
        case 4:
          uint64_t v18 = [v4 pathForFullsizeRenderImageFile];
          goto LABEL_22;
        case 5:
          uint64_t v18 = [v4 pathForFullsizeRenderVideoFile];
          goto LABEL_22;
        case 6:
        case 7:
          uint64_t v18 = [v4 pathForSpatialOverCaptureContentFile];
          goto LABEL_22;
        case 8:
          uint64_t v18 = [v4 pathForVideoComplementSpatialOverCaptureContentFile];
LABEL_22:
          id v13 = (void *)v18;
          int v14 = [*(id *)(a1 + 32) requiresConversion];
          break;
        case 9:
          uint64_t v19 = [v4 pathForOriginalAdjustmentFile];
          goto LABEL_26;
        case 10:
          uint64_t v19 = [v4 pathForPenultimateFullsizeRenderImageFile];
          goto LABEL_26;
        case 11:
          uint64_t v19 = [v4 pathForPenultimateFullsizeRenderVideoFile];
LABEL_26:
          id v13 = (void *)v19;
          int v14 = 0;
          break;
        default:
LABEL_18:
          int v14 = 0;
          id v13 = 0;
          break;
      }
    }
    uint64_t v22 = PLPTPGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      BOOL v23 = @"NO";
      if (v14) {
        BOOL v23 = @"YES";
      }
      uint64_t v24 = v23;
      *(_DWORD *)long long buf = 138412546;
      double v41 = v13;
      __int16 v42 = 2112;
      __int16 v43 = v24;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Asset reader path: %@, requiresConversion: %@", buf, 0x16u);
    }
    if (v13)
    {
      if (MEMORY[0x19F38CC90]()
        && [*(id *)(a1 + 32) type] != 1
        && [*(id *)(a1 + 32) type] != 2
        && [*(id *)(a1 + 32) type] != 9)
      {
        id v25 = [v4 location];

        if (v25) {
          plslogGreenTea();
        }
        if (PLIsForegroundApplication()) {
          cpllogGreenTeaTransmittingPhotosOrVideos();
        }
      }
      if (v14)
      {
        uint64_t v26 = [*(id *)(a1 + 40) assetReaderForFormatConvertedPTPAsset:v12 ofManagedAsset:v4 path:v13];
        uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        id v34 = v4;
        PLRunWithUnfairLock();
      }
      else
      {
        int v29 = v35;
        uint64_t v30 = [PLPTPAssetReader alloc];
        if (v29) {
          uint64_t v31 = [(PLPTPAssetReader *)v30 initWithTemporaryFileDeletedOnDeallocPath:v13];
        }
        else {
          uint64_t v31 = [(PLPTPAssetReader *)v30 initWithPath:v13];
        }
        uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
        __int16 v33 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = v31;
      }
    }
  }
  else
  {
    uint64_t v11 = PLPTPGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      double v41 = v17;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to find asset for asset handle: %@", buf, 0xCu);
    }
  }
}

uint64_t __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a2 assetHandle];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 sidecarID];
    uint64_t v7 = [v6 isEqual:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = [v4 type];
    uint64_t v7 = v8 == [*(id *)(a1 + 48) type];
  }

  return v7;
}

uint64_t __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_147(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v2 = [*(id *)(a1 + 40) kind];
  return [v1 incrementConversionCountForAssetType:v2];
}

- (id)ptpThumbnailForAssetHandle:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PLPTPdAssetManager.m", 474, @"Invalid parameter not satisfying: %@", @"[assetHandle isKindOfClass:[PLPTPAssetHandle class]]" object file lineNumber description];
  }
  uint64_t v11 = PLPTPGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v24 = v10;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Requesting thumbnail for asset handle: %@", buf, 0xCu);
  }

  if ([v10 type] == 5) {
    goto LABEL_8;
  }
  if (![v10 type])
  {
    if ([v10 hasSiblingAssetWithAssetHandleType:5]
      && ([v10 hasSiblingAssetWithAssetHandleType:4] & 1) == 0)
    {
      os_signpost_id_t v12 = [v10 assetID];
      *(float *)&double v20 = a5;
      uint64_t v14 = -[PLPTPdAssetManager _ptpThumbnailForOriginalVideoWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForOriginalVideoWithAssetID:size:compressionQuality:", v12, width, height, v20);
    }
    else
    {
      os_signpost_id_t v12 = [v10 assetID];
      *(float *)&double v17 = a5;
      uint64_t v14 = -[PLPTPdAssetManager _ptpThumbnailForOriginalWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForOriginalWithAssetID:size:compressionQuality:", v12, width, height, v17);
    }
    goto LABEL_9;
  }
  if ([v10 type] == 4)
  {
LABEL_8:
    os_signpost_id_t v12 = [v10 assetID];
    *(float *)&double v13 = a5;
    uint64_t v14 = -[PLPTPdAssetManager _ptpThumbnailForFullSizeRenderWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForFullSizeRenderWithAssetID:size:compressionQuality:", v12, width, height, v13);
LABEL_9:
    uint64_t v15 = (void *)v14;
    goto LABEL_10;
  }
  if ([v10 type] == 6)
  {
    os_signpost_id_t v12 = [v10 assetID];
    *(float *)&double v18 = a5;
    uint64_t v14 = -[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureImageWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForSpatialOverCaptureImageWithAssetID:size:compressionQuality:", v12, width, height, v18);
    goto LABEL_9;
  }
  if ([v10 type] == 7)
  {
    os_signpost_id_t v12 = [v10 assetID];
    *(float *)&double v19 = a5;
    uint64_t v14 = -[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureVideoWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForSpatialOverCaptureVideoWithAssetID:size:compressionQuality:", v12, width, height, v19);
    goto LABEL_9;
  }
  if ([v10 type] == 10)
  {
    os_signpost_id_t v12 = [v10 assetID];
    *(float *)&double v21 = a5;
    uint64_t v14 = -[PLPTPdAssetManager _ptpThumbnailForPenultimateImageWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForPenultimateImageWithAssetID:size:compressionQuality:", v12, width, height, v21);
    goto LABEL_9;
  }
  os_signpost_id_t v12 = PLPTPGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v24 = v10;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "No thumbnail for asset handle: %@", buf, 0xCu);
  }
  uint64_t v15 = 0;
LABEL_10:

  return v15;
}

- (void)_ensureDeferredRenderingIsComplete
{
  uint64_t v2 = [(PLPTPdAssetManager *)self photoLibrary];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __56__PLPTPdAssetManager__ensureDeferredRenderingIsComplete__block_invoke;
  v4[3] = &unk_1E5875CE0;
  id v5 = v2;
  id v3 = v2;
  [v3 performBlock:v4];
}

void __56__PLPTPdAssetManager__ensureDeferredRenderingIsComplete__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d AND %K = %d", @"depthType", 2, @"deferredProcessingNeeded", 2);
  [v4 setPredicate:v5];

  [v4 setFetchLimit:1];
  id v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v13 = 0;
  uint64_t v7 = [v6 executeFetchRequest:v4 error:&v13];
  id v8 = v13;

  if ([v7 count])
  {
    id v9 = [*(id *)(a1 + 32) libraryBundle];
    id v10 = [v9 assetsdClient];
    uint64_t v11 = [v10 notificationClient];
    [v11 asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems];
  }
  if (v8)
  {
    os_signpost_id_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Fecth for cinematic video queued for processing failed: %@", buf, 0xCu);
    }
  }
}

- (void)ptpEnumerateAllAssetsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke;
  uint64_t v16 = &unk_1E5875CE0;
  double v17 = self;
  pl_dispatch_sync();
  [(PLPTPdAssetManager *)self _ensureDeferredRenderingIsComplete];
  id v5 = [(PLPTPdAssetManager *)self _ptpAssetEnumeratorAllAssets];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E58675D8;
  id v7 = v6;
  id v11 = v7;
  id v12 = v4;
  id v8 = v4;
  [v5 enumerateAssetsUsingBlock:v10];
  id v9 = v7;
  pl_dispatch_sync();
}

void __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

void __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 valueForKeyPath:@"assetHandle.assetID"];
  [*(id *)(a1 + 32) addObjectsFromArray:v4];
  id v5 = PLPTPGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[PLPTPdAssetManager ptpEnumerateAllAssetsUsingBlock:]_block_invoke_2";
    __int16 v8 = 2048;
    uint64_t v9 = [v4 count];
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%s: Adding %lu assets to PTP", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_115(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) count]) {
    [*(id *)(a1 + 40) unionSet:*(void *)(*(void *)(a1 + 32) + 24)];
  }
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (void)setDelegate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (PFCameraViewfinderSessionWatcher *)a3;
  int v6 = PLPTPGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    double v17 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "setDelegate: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_storeStrong((id *)&self->_delegate, a3);
  if (self->_delegate)
  {
    id v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      cameraWatcher = self->_cameraWatcher;
      int v16 = 134217984;
      double v17 = cameraWatcher;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Starting camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher startWatching];
    [(PLPTPdAssetManager *)self _startAnalyticsCollection];
  }
  else
  {
    uint64_t v9 = [(PLPTPdAssetManager *)self photoLibrary];
    uint64_t v10 = [v9 libraryBundle];
    id v11 = [v10 assetsdClient];
    id v12 = [v11 notificationClient];
    [v12 asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems];

    [(PLPTPdAssetManager *)self _stopAnalyticsCollectionAndReport];
    uint64_t v13 = PLPTPGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = self->_cameraWatcher;
      int v16 = 134217984;
      double v17 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Stopping camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher stopWatching];
    id v15 = self->_cameraWatcher;
    self->_cameraWatcher = 0;
  }
}

- (PhotoLibraryPTPDelegate)delegate
{
  return self->_delegate;
}

- (void)managedObjectContext:(id)a3 libraryChangedWithInsertedAssetIDs:(id)a4 deletedAssetIDs:(id)a5 changedAssetIDs:(id)a6 adjustedAssetIDs:(id)a7
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v80 = a4;
  id v81 = a5;
  id v79 = a6;
  id v78 = a7;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__24826;
  v116 = __Block_byref_object_dispose__24827;
  id v117 = 0;
  uint64_t v106 = MEMORY[0x1E4F143A8];
  uint64_t v107 = 3221225472;
  NSSize v108 = __127__PLPTPdAssetManager_managedObjectContext_libraryChangedWithInsertedAssetIDs_deletedAssetIDs_changedAssetIDs_adjustedAssetIDs___block_invoke;
  v109 = &unk_1E5875E68;
  v110 = self;
  v111 = &v112;
  v82 = self;
  pl_dispatch_sync();
  if (v113[5])
  {
    id v12 = PLPTPGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v80 valueForKey:@"pl_shortURI"];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Inserted IDs: %@", buf, 0xCu);
    }
    uint64_t v14 = PLPTPGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [v81 valueForKey:@"pl_shortURI"];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Deleted IDs: %@", buf, 0xCu);
    }
    int v16 = PLPTPGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v17 = [v79 valueForKey:@"pl_shortURI"];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Changed IDs: %@", buf, 0xCu);
    }
    uint64_t v18 = PLPTPGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      double v19 = [v78 valueForKey:@"pl_shortURI"];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Adjusted IDs: %@", buf, 0xCu);
    }
    v76 = +[PLManagedObject entityInManagedObjectContext:v77];
    unint64_t v20 = 0x1E4F1C000uLL;
    if ([v80 count])
    {
      double v21 = [MEMORY[0x1E4F1CA80] setWithArray:v80];
      [v21 minusSet:v113[5]];
      uint64_t v22 = [v21 allObjects];
      BOOL v23 = objc_msgSend(v77, "pl_fetchObjectsWithIDs:rootEntity:", v22, v76);

      id v24 = PLPTPGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = [v23 valueForKey:@"objectID"];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v80;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "New assets to insert: %@ (%@)", buf, 0x16u);
      }
    }
    else
    {
      BOOL v23 = 0;
    }
    if ([v79 count])
    {
      objc_msgSend(v77, "pl_fetchObjectsWithIDs:rootEntity:", v79, v76);
      id v85 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v85 = 0;
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v23;
    uint64_t v26 = [obj countByEnumeratingWithState:&v102 objects:v125 count:16];
    if (v26)
    {
      v83 = 0;
      uint64_t v27 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v103 != v27) {
            objc_enumerationMutation(obj);
          }
          int v29 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          uint64_t v30 = [v29 pathForOriginalFile];

          if (v30)
          {
            if ([v29 deferredProcessingNeeded] == 1
              || [v29 deferredProcessingNeeded] == 2)
            {
              uint64_t v31 = PLPTPGetLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v32 = [v29 objectID];
                __int16 v33 = objc_msgSend(v32, "pl_shortURI");
                id v34 = [v29 filename];
                int v35 = [v29 savedAssetType];
                *(_DWORD *)long long buf = 138412802;
                *(void *)&uint8_t buf[4] = v33;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v34;
                *(_WORD *)&buf[22] = 2048;
                v119 = (__CFString *)v35;
                _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEBUG, "Requires camera pipeline deferred processing: (asset: %@, filename: %@, savedAssetType: %ld)", buf, 0x20u);

                unint64_t v20 = 0x1E4F1C000;
              }

              __int16 v36 = [v29 objectID];
              v124 = v36;
              id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
              [(PLPTPdAssetManager *)v82 addAssetsNeedingFinalization:v37];
            }
            else
            {
              if (!v83)
              {
                v83 = objc_msgSend(*(id *)(v20 + 2688), "setWithCapacity:", objc_msgSend(v80, "count"));
              }
              __int16 v36 = [v29 objectID];
              [v83 addObject:v36];
            }
          }
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v102 objects:v125 count:16];
      }
      while (v26);
    }
    else
    {
      v83 = 0;
    }

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v86 = v85;
    uint64_t v38 = [v86 countByEnumeratingWithState:&v98 objects:v123 count:16];
    id v39 = 0;
    if (v38)
    {
      uint64_t v40 = *(void *)v99;
      do
      {
        uint64_t v87 = v38;
        for (uint64_t j = 0; j != v87; ++j)
        {
          if (*(void *)v99 != v40) {
            objc_enumerationMutation(v86);
          }
          __int16 v42 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          __int16 v43 = [v42 objectID];
          uint64_t v44 = PLPTPGetLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v45 = [v42 objectID];
            v46 = objc_msgSend(v45, "pl_shortURI");
            if ([v42 isTrashed]) {
              CFDictionaryRef v47 = @"Y";
            }
            else {
              CFDictionaryRef v47 = @"N";
            }
            int v48 = [(id)v113[5] containsObject:v43];
            int v49 = [v42 deferredProcessingNeeded];
            *(_DWORD *)long long buf = 138413058;
            double v50 = @"N";
            if (v48) {
              double v50 = @"Y";
            }
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v47;
            *(_WORD *)&buf[22] = 2112;
            v119 = v50;
            LOWORD(v120) = 1024;
            *(_DWORD *)((char *)&v120 + 2) = v49;
            _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEBUG, "Processing changed asset (%@), isTrashed: %@, vended: %@, deferred processing: %u", buf, 0x26u);

            unint64_t v20 = 0x1E4F1C000uLL;
          }

          if (([v42 isInTrash] & 1) != 0
            || ([(id)v113[5] containsObject:v43] & 1) != 0
            || [v42 deferredProcessingNeeded] == 1
            || [v42 deferredProcessingNeeded] == 2)
          {
            if ([v42 isInTrash]
              && [(id)v113[5] containsObject:v43])
            {
              float v51 = PLPTPGetLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                v52 = [v42 uuid];
                v53 = objc_msgSend(v43, "pl_shortURI");
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = v52;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v53;
                _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEBUG, "Deleting changed asset: %@ (%@)", buf, 0x16u);
              }
              if (!v39)
              {
                id v39 = objc_msgSend(*(id *)(v20 + 2688), "setWithCapacity:", objc_msgSend(v81, "count") + objc_msgSend(v86, "count"));
              }
              [v39 addObject:v43];
            }
            else
            {
              int v54 = PLPTPGetLog();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                v55 = [v42 uuid];
                int v56 = objc_msgSend(v43, "pl_shortURI");
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = v55;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v56;
                _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEBUG, "Ignoring changed asset: %@ (%@)", buf, 0x16u);
              }
            }
          }
          else
          {
            double v57 = PLPTPGetLog();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v58 = [v42 uuid];
              uint64_t v59 = objc_msgSend(v43, "pl_shortURI");
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v58;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v59;
              _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_DEBUG, "Inserting changed asset: %@ (%@)", buf, 0x16u);
            }
            v60 = v83;
            if (!v83)
            {
              v60 = objc_msgSend(*(id *)(v20 + 2688), "setWithCapacity:", objc_msgSend(v79, "count") + objc_msgSend(v80, "count"));
            }
            v83 = v60;
            [v60 addObject:v43];
          }
        }
        uint64_t v38 = [v86 countByEnumeratingWithState:&v98 objects:v123 count:16];
      }
      while (v38);
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v95 = 0u;
    long long v94 = 0u;
    id v61 = v81;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v94 objects:v122 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v95;
      do
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v95 != v63) {
            objc_enumerationMutation(v61);
          }
          uint64_t v65 = *(void *)(*((void *)&v94 + 1) + 8 * k);
          if (!v39)
          {
            id v39 = objc_msgSend(*(id *)(v20 + 2688), "setWithCapacity:", objc_msgSend(v61, "count"));
          }
          if ([(id)v113[5] containsObject:v65]) {
            [v39 addObject:v65];
          }
        }
        uint64_t v62 = [v61 countByEnumeratingWithState:&v94 objects:v122 count:16];
      }
      while (v62);
    }

    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v119 = (__CFString *)__Block_byref_object_copy__24826;
    v120 = __Block_byref_object_dispose__24827;
    id v121 = 0;
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    uint64_t v91 = __Block_byref_object_copy__24826;
    v92 = __Block_byref_object_dispose__24827;
    id v93 = 0;
    id v66 = v83;
    id v67 = v39;
    pl_dispatch_sync();
    uint64_t v68 = [(id)v89[5] count];
    uint64_t v69 = [v67 count];
    if (v69 + v68 + [v78 count])
    {
      uint64_t v70 = [v78 count];
      uint64_t v71 = v78;
      if (!v70) {
        uint64_t v71 = 0;
      }
      id v72 = v71;
      delegate = v82->_delegate;
      uint64_t v74 = v89[5];
      v75 = [v67 allObjects];
      [(PhotoLibraryPTPDelegate *)delegate addedPhotoKeys:v74 deletedPhotoKeys:v75 changedPhotoKeys:v72 changePendingPhotoKeys:0];
    }
    _Block_object_dispose(&v88, 8);

    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v112, 8);
}

void __127__PLPTPdAssetManager_managedObjectContext_libraryChangedWithInsertedAssetIDs_deletedAssetIDs_changedAssetIDs_adjustedAssetIDs___block_invoke(uint64_t a1)
{
}

void __127__PLPTPdAssetManager_managedObjectContext_libraryChangedWithInsertedAssetIDs_deletedAssetIDs_changedAssetIDs_adjustedAssetIDs___block_invoke_109(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 40) fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 24) mutableCopy];
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    __int16 v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v8)
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 24) mutableCopy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      __int16 v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    [v8 minusSet:*(void *)(a1 + 48)];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = v12;
  }
}

- (void)setHostCharacteristics:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyMake"];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F8CF38]];

  id v7 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyOS"];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F8CF10]];

  __int16 v8 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyOSVersion"];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F8CF58]];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"PLPTPHostCharacteristicsKeyTransport"];

  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F8CF30]];
  [v5 setObject:@"YES" forKeyedSubscript:*MEMORY[0x1E4F8CEE8]];
  id v10 = v5;
  PLRunWithUnfairLock();
}

uint64_t __45__PLPTPdAssetManager_setHostCharacteristics___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) updateWithPlatformInformation:*(void *)(a1 + 40)];
}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return [(PLPTPdFormatConversionManager *)self->_formatConversionManager peerMediaCapabilities];
}

- (void)setPeerMediaCapabilities:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPTPGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Set peer media capabilities: %@", buf, 0xCu);
  }

  [(PLPTPdFormatConversionManager *)self->_formatConversionManager setPeerMediaCapabilities:v4];
  id v6 = v4;
  PLRunWithUnfairLock();
}

void __47__PLPTPdAssetManager_setPeerMediaCapabilities___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  id v2 = [*(id *)(a1 + 40) platformInformation];
  [v1 updateWithPlatformInformation:v2];
}

- (PLPhotoLibrary)photoLibrary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_photoLibrary)
  {
    if (+[PLIndicatorFileCoordinator systemLibraryAvailableIndicatorState])
    {
      if (MKBDeviceUnlockedSinceBoot() == 1)
      {
        uint64_t v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
        id v4 = objc_alloc_init(PLPhotoLibraryOptions);
        [(PLPhotoLibraryOptions *)v4 setAutomaticallyMergesContext:1];
        [(PLPhotoLibraryOptions *)v4 setAutomaticallyPinToFirstFetch:0];
        id v17 = 0;
        id v5 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLPTPdAssetManager photoLibrary]", v3, v4, &v17);
        id v6 = v17;
        photoLibrary = self->_photoLibrary;
        self->_photoLibrary = v5;

        id v8 = self->_photoLibrary;
        if (!v8)
        {
          uint64_t v9 = PLPTPGetLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315650;
            double v19 = "-[PLPTPdAssetManager photoLibrary]";
            __int16 v20 = 2112;
            double v21 = v3;
            __int16 v22 = 2112;
            id v23 = v6;
            _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to load photo library %s from %@ error: %@", buf, 0x20u);
          }

          id v8 = self->_photoLibrary;
        }
        self->_libraryStatus = 2;
        id v10 = [(PLPhotoLibrary *)v8 managedObjectContext];
        [v10 setPtpNotificationDelegate:self];
        id v11 = [(PLPhotoLibrary *)self->_photoLibrary libraryBundle];
        [v11 beginObservingChanges];

        uint64_t v12 = PLPTPGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Photo library available", buf, 2u);
        }
      }
      else
      {
        if ((photoLibrary_logNotAvailable & 1) == 0)
        {
          uint64_t v14 = PLPTPGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Photo library is not available because device has not yet been unlocked", buf, 2u);
          }

          photoLibrary_logNotAvailable = 1;
        }
        self->_libraryStatus = 1;
      }
    }
    else
    {
      self->_libraryStatus = 1;
      uint64_t v13 = PLPTPGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Photo library is not yet available", buf, 2u);
      }
    }
  }
  id v15 = self->_photoLibrary;
  return v15;
}

- (void)handlePhotoLibraryAvailableNotification
{
  uint64_t v3 = PLPTPGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Photo library availability changed", buf, 2u);
  }

  if (self->_delegate)
  {
    unsigned int libraryStatus = self->_libraryStatus;
    id v5 = [(PLPTPdAssetManager *)self photoLibrary];

    if (v5)
    {
      id v6 = PLPTPGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Photo library is now available", v7, 2u);
      }

      if (libraryStatus <= 1 && (objc_opt_respondsToSelector() & 1) != 0) {
        [(PhotoLibraryPTPDelegate *)self->_delegate libraryDidBecomeAvailable];
      }
    }
  }
}

- (void)_registerForFirstUnlockNotification
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PLPTPdAssetManager__registerForFirstUnlockNotification__block_invoke;
  v9[3] = &unk_1E5875E68;
  void v9[4] = self;
  v9[5] = v10;
  id v2 = (void *)MEMORY[0x19F38D650](v9, a2);
  uint64_t v3 = PLPTPGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Registering for first unlock", buf, 2u);
  }

  id v4 = MEMORY[0x1E4F14428];
  id v5 = v2;
  int v6 = pl_notify_register_dispatch();

  if (v6)
  {
    id v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unable to wait for first unlock", buf, 2u);
    }
  }
  _Block_object_dispose(v10, 8);
}

uint64_t __57__PLPTPdAssetManager__registerForFirstUnlockNotification__block_invoke(uint64_t a1)
{
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result == 1)
  {
    notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 handlePhotoLibraryAvailableNotification];
  }
  return result;
}

uint64_t __57__PLPTPdAssetManager__registerForFirstUnlockNotification__block_invoke_83(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(PLPTPdFormatConversionManager *)self->_formatConversionManager invalidate];
  id v4 = [(PLPhotoLibrary *)self->_photoLibrary managedObjectContext];
  [v4 setPtpNotificationDelegate:0];

  +[PLManagedAsset ptpResetEventAndFilenameMapping];
  v5.receiver = self;
  v5.super_class = (Class)PLPTPdAssetManager;
  [(PLPTPdAssetManager *)&v5 dealloc];
}

- (id)initForUnitTestSupportWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  int v6 = [(PLPTPdAssetManager *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_unsigned int libraryStatus = 2;
    id v8 = [(PLPhotoLibrary *)v7->_photoLibrary managedObjectContext];
    [v8 setPtpNotificationDelegate:v7];
  }
  return v7;
}

- (PLPTPdAssetManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)PLPTPdAssetManager;
  id v2 = [(PLPTPdAssetManager *)&v20 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    [(PLPTPdAssetManager *)v2 setFileManager:v3];

    uint64_t v4 = objc_opt_new();
    formatConversionManager = v2->_formatConversionManager;
    v2->_formatConversionManager = (PLPTPdFormatConversionManager *)v4;

    int v6 = [MEMORY[0x1E4F8CC30] legacyCapabilities];
    [(PLPTPdAssetManager *)v2 setPeerMediaCapabilities:v6];

    v2->_unsigned int libraryStatus = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)PLPTPdHandleGlobalPhotoLibraryAvailableNotification, (CFStringRef)PLGlobalPhotoLibraryAvailableNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (MKBDeviceUnlockedSinceBoot() != 1) {
      [(PLPTPdAssetManager *)v2 _registerForFirstUnlockNotification];
    }
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.PLPTPDAvailableAssetsQueue", 0);
    availableAssetsQueue = v2->availableAssetsQueue;
    v2->availableAssetsQueue = (OS_dispatch_queue *)v8;

    v2->_analyticsDataLock._os_unfair_lock_opaque = 0;
    dispatch_group_t v10 = dispatch_group_create();
    analyticsAsyncDataGroup = v2->_analyticsAsyncDataGroup;
    v2->_analyticsAsyncDataGroup = (OS_dispatch_group *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    finalizationRequestLock_assetsRequiringFinalization = v2->_finalizationRequestLock_assetsRequiringFinalization;
    v2->_finalizationRequestLock_assetsRequiringFinalization = (NSMutableArray *)v12;

    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.photos.plptpdassetmanager.finalizationrequestqueue", v15);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F8CBE8]) initWithDispatchQueue:v16 delegate:v2];
    cameraWatcher = v2->_cameraWatcher;
    v2->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v17;

    v2->_finalizationRequestLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

@end