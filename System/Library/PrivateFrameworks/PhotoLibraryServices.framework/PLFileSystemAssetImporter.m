@interface PLFileSystemAssetImporter
- (BOOL)_setupAdjustmentsFromAdjustmentFileForAsset:(id)a3;
- (BOOL)_setupPhotoAsset:(id)a3 withURL:(id)a4 isPlaceholder:(BOOL)a5 hasVideoComplementResource:(BOOL)a6;
- (BOOL)_setupPhotoAsset:(id)a3 withURL:(id)a4 unknownType:(BOOL)a5 isPlaceholder:(BOOL)a6 hasVideoComplementResource:(BOOL)a7;
- (BOOL)_setupPhotoAssetAsPhotoIrisIfNeeded:(id)a3 hasVideoComplementResource:(BOOL)a4;
- (BOOL)_setupUnknownAsset:(id)a3 withURL:(id)a4;
- (BOOL)_setupVideoAsset:(id)a3 withURL:(id)a4;
- (NSMutableDictionary)existingOIDsByUUID;
- (NSMutableDictionary)existingUUIDsByUppercasePath;
- (NSMutableSet)existingUUIDs;
- (PLFileSystemAssetImporter)initWithPhotoLibrary:(id)a3 libraryServicesManager:(id)a4;
- (id)_addAssetWithURL:(id)a3 existingOID:(id)a4 assetUUID:(id)a5 isPlaceholder:(BOOL)a6;
- (id)_assetAdjustmentsIfExistsForAsset:(id)a3;
- (id)addAssetWithURLs:(id)a3 assetPayload:(id)a4 forceInsert:(BOOL)a5 forceUpdate:(BOOL)a6 fixAddedDate:(BOOL)a7;
- (id)assetURLisInDatabase:(id)a3 deferredPreviewURL:(id)a4;
- (id)libraryBundlePathWithPhotoLibrary:(id)a3;
- (unint64_t)nextThumbnailIndex;
- (unint64_t)thumbnailBatchFetchSize;
- (void)addAvailableThumbnailIndex:(unint64_t)a3;
- (void)dealloc;
- (void)setExistingOIDsByUUID:(id)a3;
- (void)setExistingUUIDs:(id)a3;
- (void)setExistingUUIDsByUppercasePath:(id)a3;
- (void)setModificationAndCreationDateOnAsset:(id)a3 withURL:(id)a4;
- (void)setThumbnailBatchFetchSize:(unint64_t)a3;
@end

@implementation PLFileSystemAssetImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingOIDsByUUID, 0);
  objc_storeStrong((id *)&self->_existingUUIDsByUppercasePath, 0);
  objc_storeStrong((id *)&self->_existingUUIDs, 0);
  objc_storeStrong((id *)&self->_thumbIndexes, 0);
  objc_storeStrong((id *)&self->_photoLibraryStoreUUID, 0);
  objc_storeStrong((id *)&self->_libraryBundlePath, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setThumbnailBatchFetchSize:(unint64_t)a3
{
  self->_thumbnailBatchFetchSize = a3;
}

- (unint64_t)thumbnailBatchFetchSize
{
  return self->_thumbnailBatchFetchSize;
}

- (void)setExistingOIDsByUUID:(id)a3
{
}

- (NSMutableDictionary)existingOIDsByUUID
{
  return self->_existingOIDsByUUID;
}

- (void)setExistingUUIDsByUppercasePath:(id)a3
{
}

- (NSMutableDictionary)existingUUIDsByUppercasePath
{
  return self->_existingUUIDsByUppercasePath;
}

- (void)setExistingUUIDs:(id)a3
{
}

- (NSMutableSet)existingUUIDs
{
  return self->_existingUUIDs;
}

- (unint64_t)nextThumbnailIndex
{
  thumbIndexes = self->_thumbIndexes;
  if (!thumbIndexes)
  {
    v4 = [MEMORY[0x1E4F28E60] indexSet];
    v5 = self->_thumbIndexes;
    self->_thumbIndexes = v4;

    thumbIndexes = self->_thumbIndexes;
  }
  if ([(NSMutableIndexSet *)thumbIndexes count]) {
    goto LABEL_7;
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__PLFileSystemAssetImporter_nextThumbnailIndex__block_invoke;
  v13[3] = &unk_1E58679C0;
  v13[4] = self;
  v7 = v6;
  v14 = v7;
  v8 = (void *)MEMORY[0x19F38D650](v13);
  +[PLThumbnailIndexes getAvailableThumbnailIndexesInLibrary:self->_photoLibrary withCount:[(PLFileSystemAssetImporter *)self thumbnailBatchFetchSize] handler:v8];
  while (dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL))
    ;

  if ([(NSMutableIndexSet *)self->_thumbIndexes count])
  {
LABEL_7:
    unint64_t v9 = [(NSMutableIndexSet *)self->_thumbIndexes firstIndex];
    [(NSMutableIndexSet *)self->_thumbIndexes removeIndex:v9];
  }
  else
  {
    v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to get thumbnail index. This is bad.", v12, 2u);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

intptr_t __47__PLFileSystemAssetImporter_nextThumbnailIndex__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 40) addIndexes:a2];
  }
  v3 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v3);
}

- (void)addAvailableThumbnailIndex:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    thumbIndexes = self->_thumbIndexes;
    if (!thumbIndexes)
    {
      v7 = [MEMORY[0x1E4F28E60] indexSet];
      v8 = self->_thumbIndexes;
      self->_thumbIndexes = v7;

      thumbIndexes = self->_thumbIndexes;
    }
    [(NSMutableIndexSet *)thumbIndexes addIndex:a3];
  }
}

- (BOOL)_setupVideoAsset:(id)a3 withURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 setVideoInfoFromFileAtURL:v7 mainFileMetadata:0 fullSizeRenderURL:0 overwriteOriginalProperties:1];
  if (v8)
  {
    int v9 = [v6 migrateLegacyVideoAdjustments];
    if (v9) {
      int v10 = 1;
    }
    else {
      int v10 = [v6 setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:0];
    }
    v11 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v7];
    v12 = [v11 dataForKey:*MEMORY[0x1E4F8C3B0]];
    v13 = [v11 stringForKey:*MEMORY[0x1E4F8C3C0]];
    v14 = [MEMORY[0x1E4F8B908] fileManager];
    if (v12)
    {
      v15 = PLMigrationGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v6 uuid];
        int v22 = 138412290;
        v23 = v16;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "setupVideoAsset: Setting up adjustment from extended attributes for asset: %@", (uint8_t *)&v22, 0xCu);
      }
      +[PLImageWriter setAdjustmentsForNewVideo:mainFileMetadata:withAdjustmentsDictionary:cameraAdjustments:renderedContentPath:renderedPosterFramePreviewPath:finalAssetSize:](PLImageWriter, "setAdjustmentsForNewVideo:mainFileMetadata:withAdjustmentsDictionary:cameraAdjustments:renderedContentPath:renderedPosterFramePreviewPath:finalAssetSize:", v6, 0, 0, v12, v13, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      goto LABEL_21;
    }
    if (v10)
    {
      v17 = [v6 pathForAdjustmentFile];
      if (([v14 fileExistsAtPath:v17] & 1) == 0)
      {
        v18 = PLMigrationGetLog();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if (v9)
        {
          if (v19)
          {
            v20 = [v6 pathForLegacySlalomRegionsArchive];
            int v22 = 138412546;
            v23 = v20;
            __int16 v24 = 2112;
            v25 = v17;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "setupVideoAsset: failed to migrate %@ to %@", (uint8_t *)&v22, 0x16u);
          }
        }
        else if (v19)
        {
          int v22 = 138412290;
          v23 = v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "setupVideoAsset: failed to create default adjustments at %@", (uint8_t *)&v22, 0xCu);
        }
      }
    }
    else if ([(PLFileSystemAssetImporter *)self _setupAdjustmentsFromAdjustmentFileForAsset:v6])
    {
      goto LABEL_21;
    }
    [v6 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
LABEL_21:
  }
  return v8;
}

- (BOOL)_setupPhotoAsset:(id)a3 withURL:(id)a4 unknownType:(BOOL)a5 isPlaceholder:(BOOL)a6 hasVideoComplementResource:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = (void *)MEMORY[0x19F38D3B0]();
  if (a5)
  {
    v14 = 0;
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F8CC48]);
    v16 = [v11 photoLibrary];
    v17 = [v16 libraryBundle];
    v18 = [v17 timeZoneLookup];
    v14 = (void *)[v15 initWithImageURL:v12 contentType:0 options:12 timeZoneLookup:v18 cacheImageSource:1 cacheImageData:0];

    if ([v11 setImageInfoFromImageMetadata:v14 overwriteOriginalProperties:1])
    {
      [(PLFileSystemAssetImporter *)self _setupPhotoAssetAsPhotoIrisIfNeeded:v11 hasVideoComplementResource:v7];
      if ([v14 cgImageMetadata]) {
        objc_msgSend(v11, "setFaceRegionsFromImageMetadata:", objc_msgSend(v14, "cgImageMetadata"));
      }
    }
  }
  if (!-[PLFileSystemAssetImporter _setupAdjustmentsFromAdjustmentFileForAsset:](self, "_setupAdjustmentsFromAdjustmentFileForAsset:", v11)|| ([v11 additionalAttributes], BOOL v19 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v19, "unmanagedAdjustment"), v20 = objc_claimAutoreleasedReturnValue(), v20, v19, !v20))
  {
    v21 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v12];
    int v22 = [v21 dataForKey:*MEMORY[0x1E4F8C3B0]];
    v23 = [v21 stringForKey:*MEMORY[0x1E4F8C3C0]];
    __int16 v24 = v23;
    if (v22)
    {
      v25 = PLMigrationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v24;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "PLFileSystemAssetImporter: setting adjustments, preview image file %@", buf, 0xCu);
      }

      LOBYTE(v27) = 1;
      +[PLImageWriter setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:](PLImageWriter, "setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:", v11, v14, v22, 0, v24, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v27);
    }
    else
    {

      *(_WORD *)buf = 0;
      v21 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v12];
      [v21 getUInt16:buf forKey:*MEMORY[0x1E4F8C318]];
    }
  }
  if (!a5) {
    [v11 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
  }

  return 1;
}

- (BOOL)_setupAdjustmentsFromAdjustmentFileForAsset:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLFileSystemAssetImporter *)self _assetAdjustmentsIfExistsForAsset:v4];
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 adjustmentTimestamp];

    if (!v7)
    {
      int v8 = [v4 dateCreated];
      [v6 setAdjustmentTimestamp:v8];
    }
    int v9 = [MEMORY[0x1E4F8B908] fileManager];
    unsigned __int8 v37 = 0;
    if ([v4 isPhoto])
    {
      int v10 = [v4 pathForBestAvailableFullsizeRenderImageFileOutIsSubstandard:&v37];
      if (v10)
      {
        uint64_t v35 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];
      }
      else
      {
        uint64_t v35 = 0;
      }
      id v20 = [v4 pathForPenultimateFullsizeRenderImageFile];
      if (v20 && [v9 fileExistsAtPath:v20])
      {
        v21 = v9;
        id v36 = 0;
        int v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v20 options:1 error:&v36];
        id v23 = v36;
        if ([v22 length])
        {
          id v18 = v22;
        }
        else
        {
          uint64_t v26 = PLMigrationGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v39 = v20;
            __int16 v40 = 2112;
            id v41 = v23;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "PLFileSystemAssetImporter: Unable to read data from file '%@'. %@", buf, 0x16u);
          }

          id v18 = 0;
        }

        int v9 = v21;
      }
      else
      {
        id v18 = 0;
      }
      if ([v4 isPhotoIris])
      {
        id v27 = [v4 pathForFullsizeRenderVideoFile];
        v14 = v9;
        id v28 = v9;
        v29 = v28;
        buf[0] = 0;
        if (v27)
        {
          id v15 = 0;
          if ([v28 fileExistsAtPath:v27 isDirectory:buf] && !buf[0])
          {
            id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27 isDirectory:0];
          }
        }
        else
        {
          id v15 = 0;
        }

        id v30 = [v4 pathForPenultimateFullsizeRenderVideoFile];
        id v31 = v29;
        v32 = v31;
        buf[0] = 0;
        if (v30)
        {
          v16 = 0;
          if ([v31 fileExistsAtPath:v30 isDirectory:buf] && !buf[0])
          {
            v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v30 isDirectory:0];
          }
        }
        else
        {
          v16 = 0;
        }

        [v4 setPlaybackStyle:3];
        objc_msgSend(v4, "setPlaybackVariationAndLoopingStyleFromAdjustmentRenderTypes:", objc_msgSend(v6, "adjustmentRenderTypes"));
      }
      else
      {
        v14 = v9;
        id v15 = 0;
        v16 = 0;
      }
      v17 = 0;
    }
    else
    {
      if (![v4 isVideo])
      {
        v14 = v9;
        id v15 = 0;
        v16 = 0;
        v17 = 0;
        id v18 = 0;
        BOOL v19 = 0;
LABEL_45:
        v33 = +[PLMutableAssetAdjustmentOptions assetAdjustmentOptionsForFileSystemImport];
        [v33 setRenderedContentURL:v19];
        [v33 setPenultimateRenderedJPEGData:v18];
        [v33 setPenultimateRenderedVideoContentURL:v17];
        [v33 setSubstandardRender:v37];
        [v33 setRenderedVideoComplementContentURL:v15];
        [v33 setPenultimateRenderedVideoComplementContentURL:v16];
        [v33 setShouldCheckForLegacyCameraAutoAdjustment:1];
        [v4 setAdjustments:v6 options:v33];

        goto LABEL_46;
      }
      id v11 = [v4 pathForFullsizeRenderVideoFile];
      id v12 = v9;
      v13 = v12;
      buf[0] = 0;
      if (v11)
      {
        uint64_t v35 = 0;
        if ([v12 fileExistsAtPath:v11 isDirectory:buf] && !buf[0])
        {
          uint64_t v35 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
        }
      }
      else
      {
        uint64_t v35 = 0;
      }

      id v20 = [v4 pathForPenultimateFullsizeRenderVideoFile];
      id v24 = v13;
      v25 = v24;
      buf[0] = 0;
      if (v20)
      {
        v17 = 0;
        v14 = v9;
        if ([v24 fileExistsAtPath:v20 isDirectory:buf] && !buf[0])
        {
          v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v20 isDirectory:0];
        }
      }
      else
      {
        v14 = v9;
        v17 = 0;
      }

      id v15 = 0;
      v16 = 0;
      id v18 = 0;
      int v10 = v20;
    }

    BOOL v19 = (void *)v35;
    goto LABEL_45;
  }
LABEL_46:

  return v6 != 0;
}

- (id)_assetAdjustmentsIfExistsForAsset:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 pathForAdjustmentFile];
  v5 = [MEMORY[0x1E4F8B908] fileManager];
  id v6 = v4;
  id v7 = v5;
  int v8 = v7;
  buf[0] = 0;
  if (v6
    && ([v7 fileExistsAtPath:v6 isDirectory:buf] ? (BOOL v9 = buf[0] == 0) : (BOOL v9 = 0), v9))
  {
    int v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
  }
  else
  {
    int v10 = 0;
  }

  if (v10)
  {
    id v33 = 0;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v10 error:&v33];
    id v12 = v33;
    if (!v11) {
      goto LABEL_18;
    }
    v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CE80]];
    if (!v13)
    {
      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = [v3 pathForAdjustmentDataFile];
      int v16 = [v14 fileExistsAtPath:v15];

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E4F1C9B8];
        id v18 = [v3 pathForAdjustmentDataFile];
        v13 = [v17 dataWithContentsOfFile:v18 options:1 error:0];
      }
      else
      {
        v13 = 0;
      }
    }
    id v30 = v10;
    id v31 = v12;
    id v32 = v3;
    id v20 = objc_alloc(MEMORY[0x1E4F8CBB8]);
    v21 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CE90]];
    int v22 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CEA0]];
    id v23 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CE78]];
    uint64_t v24 = [v23 integerValue];
    v25 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CE88]];
    uint64_t v26 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CEA8]];
    BOOL v19 = objc_msgSend(v20, "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v21, v22, v13, v24, v25, objc_msgSend(v26, "unsignedIntValue"));

    id v27 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F8CEB0]];
    if (v27) {
      [v19 setAdjustmentTimestamp:v27];
    }

    id v12 = v31;
    id v3 = v32;
    int v10 = v30;
    if (!v19)
    {
LABEL_18:
      id v28 = PLMigrationGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v6;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "PLFileSystemAssetImporter: Failed to create PFAssetAdjustments from '%@'", buf, 0xCu);
      }

      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_setupUnknownAsset:(id)a3 withURL:(id)a4
{
  return [(PLFileSystemAssetImporter *)self _setupPhotoAsset:a3 withURL:a4 unknownType:1 isPlaceholder:0 hasVideoComplementResource:0];
}

- (BOOL)_setupPhotoAsset:(id)a3 withURL:(id)a4 isPlaceholder:(BOOL)a5 hasVideoComplementResource:(BOOL)a6
{
  return [(PLFileSystemAssetImporter *)self _setupPhotoAsset:a3 withURL:a4 unknownType:0 isPlaceholder:a5 hasVideoComplementResource:a6];
}

- (BOOL)_setupPhotoAssetAsPhotoIrisIfNeeded:(id)a3 hasVideoComplementResource:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([v7 isPhoto] & 1) == 0)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PLFileSystemAssetImporter.m" lineNumber:722 description:@"expect photo asset"];
  }
  if (([v7 isPhotoIris] & 1) == 0)
  {
    if ([v7 videoCpDurationValue])
    {
      [v7 setKindSubtype:2];
      if ([v7 canPlayPhotoIris]) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 1;
      }
      if ([v7 playbackStyle] != v9) {
        [v7 setPlaybackStyle:v9];
      }
      goto LABEL_17;
    }
    if (!v4)
    {
LABEL_17:
      char v8 = 0;
      goto LABEL_18;
    }
    int v10 = [v7 pathForVideoComplementFile];
    id v11 = [v7 mainFileURL];
    char v8 = 0;
    if (!v11 || !v10)
    {
LABEL_24:

      goto LABEL_18;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F8CE20]);
    v13 = [v11 path];
    v14 = (void *)[v12 initWithPathToVideo:v10 pathToImage:v13];

    uint64_t v15 = [v14 pairingIdentifier];
    int v16 = (void *)v15;
    long long v26 = 0uLL;
    uint64_t v27 = 0;
    if (v14)
    {
      [v14 imageDisplayTime];
      long long v24 = 0uLL;
      uint64_t v25 = 0;
      [v14 originalVideoDuration];
      if (!v16) {
        goto LABEL_21;
      }
    }
    else
    {
      long long v24 = 0uLL;
      uint64_t v25 = 0;
      if (!v15) {
        goto LABEL_21;
      }
    }
    if (BYTE12(v24))
    {
      id v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
      long long v22 = v24;
      uint64_t v23 = v25;
      long long v20 = v26;
      uint64_t v21 = v27;
      char v8 = [v7 becomePhotoIrisWithMediaGroupUUID:v16 mainFileMetadata:0 videoURL:v18 videoDuration:&v22 stillDisplayTime:&v20 options:0];

      goto LABEL_23;
    }
LABEL_21:
    char v8 = 0;
LABEL_23:

    goto LABEL_24;
  }
  char v8 = 1;
LABEL_18:

  return v8;
}

- (void)setModificationAndCreationDateOnAsset:(id)a3 withURL:(id)a4
{
  id v31 = a3;
  id v5 = a4;
  id v6 = [v31 modificationDate];

  id v7 = [v31 dateCreated];

  char v8 = [v31 additionalAttributes];
  uint64_t v9 = [v8 exifTimestampString];

  int v10 = [v31 additionalAttributes];
  id v11 = [v10 timeZoneName];
  if (v11)
  {
    id v12 = [v31 additionalAttributes];
    v13 = [v12 timeZoneOffset];
    BOOL v14 = v13 == 0;
  }
  else
  {
    BOOL v14 = 1;
  }

  if (!v6 || !v7 || !v9 || v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F8CC48]);
    int v16 = [v31 photoLibrary];
    v17 = [v16 libraryBundle];
    id v18 = [v17 timeZoneLookup];
    BOOL v19 = (void *)[v15 initWithMediaURL:v5 timeZoneLookup:v18];

    if (v6)
    {
      if (v7) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v25 = [v19 fileSystemProperties];
      long long v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F28310]];
      [v31 setModificationDate:v26];

      if (v7)
      {
LABEL_10:
        if (v9) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
    uint64_t v27 = [v19 utcCreationDate];
    [v31 setDateCreated:v27];

    LOWORD(v27) = [v19 creationDateSource];
    id v28 = [v31 additionalAttributes];
    [v28 setDateCreatedSource:(__int16)v27];

    if (v9)
    {
LABEL_11:
      if (!v14)
      {
LABEL_13:
        long long v24 = [v31 dateCreated];
        [v24 timeIntervalSinceReferenceDate];
        objc_msgSend(v31, "setSortToken:");

        goto LABEL_14;
      }
LABEL_12:
      long long v20 = [v19 timeZoneName];
      uint64_t v21 = [v31 additionalAttributes];
      [v21 setTimeZoneName:v20];

      long long v22 = [v19 timeZoneOffset];
      uint64_t v23 = [v31 additionalAttributes];
      [v23 setTimeZoneOffset:v22];

      goto LABEL_13;
    }
LABEL_19:
    v29 = [v19 creationDateString];
    id v30 = [v31 additionalAttributes];
    [v30 setExifTimestampString:v29];

    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_14:
}

- (id)addAssetWithURLs:(id)a3 assetPayload:(id)a4 forceInsert:(BOOL)a5 forceUpdate:(BOOL)a6 fixAddedDate:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v157 = a3;
  id v11 = a4;
  if (v8 && v7)
  {
    id v126 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot call addAssetWithURLs with both forceInsert and forceUpdate" userInfo:0];
    objc_exception_throw(v126);
  }
  v152 = v11;
  id v12 = [v11 payloadID];
  v13 = [v12 payloadIDString];

  if (v13) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v7;
  }
  BOOL v150 = v14;
  if (v13) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v8;
  }
  uint64_t v187 = 0;
  v188 = &v187;
  uint64_t v189 = 0x3032000000;
  v190 = __Block_byref_object_copy__25980;
  v191 = __Block_byref_object_dispose__25981;
  id v192 = 0;
  int v16 = +[PLPhotoLibrary masterURLFromSidecarURLs:v157];
  unsigned __int8 v186 = 0;
  v156 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:v16 exists:&v186 includeUnknownAttributes:0];
  id v17 = objc_initWeak((id *)&location, self);

  id v18 = objc_alloc(MEMORY[0x1E4F8B948]);
  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke;
  v183[3] = &unk_1E5870860;
  objc_copyWeak(&v185, (id *)&location);
  id v19 = v16;
  id v184 = v19;
  v155 = (void *)[v18 initWithBlock:v183];

  objc_destroyWeak(&v185);
  objc_destroyWeak((id *)&location);
  int v182 = 0;
  long long v20 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
  int v21 = [v20 isUBF];

  int v147 = v15 || v150;
  if (v21)
  {
    long long v22 = [MEMORY[0x1E4F8B978] fileIdentifierForValidOriginalURL:v19];
    uint64_t v23 = [v22 uuid];
    [v22 resourceType];
    [v22 resourceVersion];
    [v22 recipeId];
    if (PLResourceTypeIsAllowedForUseInFilename())
    {
      long long v24 = PLMigrationGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = [v22 resourceType];
        long long v26 = [v19 path];
        int location = 67109378;
        *(_DWORD *)location_4 = v25;
        *(_WORD *)&location_4[4] = 2114;
        *(void *)&location_4[6] = v26;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "addAssetWithURLs: cannot import white-listed resource with type %d as asset primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0x12u);
      }
      v153 = 0;
      v154 = 0;
LABEL_43:

LABEL_44:
LABEL_45:
      v46 = [v157 allObjects];
      v47 = objc_msgSend(v46, "_pl_map:", &__block_literal_global_26014);

      if (v186)
      {
        v48 = PLMigrationGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = [v19 path];
          int location = 138543618;
          *(void *)location_4 = v49;
          *(_WORD *)&location_4[8] = 2114;
          *(void *)&location_4[10] = v47;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "addAssetWithURLs: asset couldn't be added (invalid file resources): %{public}@, skipping files: %{public}@", (uint8_t *)&location, 0x16u);
        }
      }
      else
      {
        v48 = PLMigrationGetLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v50 = [v19 path];
          int location = 138543618;
          *(void *)location_4 = v50;
          *(_WORD *)&location_4[8] = 2114;
          *(void *)&location_4[10] = v47;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "addAssetWithURLs: file couldn't be opened (deleted or read failed): %{public}@, skipping files: %{public}@", (uint8_t *)&location, 0x16u);
        }
      }

      goto LABEL_51;
    }
    v153 = 0;
    v154 = 0;
    LOBYTE(v145) = 0;
    int v143 = 0;
    LOBYTE(v32) = 0;
    goto LABEL_87;
  }
  uint64_t v23 = [v156 UUIDStringForKey:*MEMORY[0x1E4F8C470]];
  if (v13)
  {
    uint64_t v27 = v13;

    uint64_t v23 = v27;
  }
  [v156 getInt32:&v182 forKey:*MEMORY[0x1E4F8C3D0]];
  BOOL v145 = +[PLImageWriter semanticEnhanceSceneIsValid:v182];
  if (+[PLImageWriter isDeferredPhotoPreviewURL:v19])
  {
    id v28 = [v155 objectValue];
    int v29 = [v28 isDeferredPhotoProxy];

    if (v29)
    {
      id v30 = [v155 objectValue];
      uint64_t v31 = [v30 deferredPhotoProcessingIdentifier];
    }
    else
    {
      uint64_t v31 = 0;
    }
    v153 = (void *)v31;
    if (v31) {
      int v33 = 1;
    }
    else {
      int v33 = v145;
    }
    int v143 = v33;
    if (v33 == 1)
    {
      v34 = [v19 pathExtension];
      v154 = +[PLImageWriter finalizedAssetURLForDeferredPhotoPreviewURL:v19 extension:v34];

      id v35 = PLMigrationGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = [v19 path];
        unsigned __int8 v37 = [v154 path];
        int location = 138412802;
        *(void *)location_4 = v36;
        *(_WORD *)&location_4[8] = 2114;
        *(void *)&location_4[10] = v153;
        __int16 v195 = 2112;
        v196 = v37;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: Found deferred photo preview: %@ with identifier %{public}@ for base asset %@", (uint8_t *)&location, 0x20u);
      }
    }
    else
    {
      v38 = PLMigrationGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = [v19 path];
        __int16 v40 = (void *)v39;
        id v41 = @"missing";
        if (v29) {
          id v41 = @"has";
        }
        int location = 138412546;
        *(void *)location_4 = v39;
        *(_WORD *)&location_4[8] = 2112;
        *(void *)&location_4[10] = v41;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "addAssetWithURLs: Found unsupported deferred photo preview: %@ %@ proxy flag, missing identifier. Adding as regular asset", (uint8_t *)&location, 0x16u);
      }
      id v35 = PLMigrationGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = [v19 path];
        int location = 138412290;
        *(void *)location_4 = v42;
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "addAssetWithURLs: Found unsupported deferred photo preview: %@ adding as regular asset", (uint8_t *)&location, 0xCu);
      }
      v153 = 0;
      v154 = 0;
    }
  }
  else
  {
    v153 = 0;
    v154 = 0;
    int v143 = 0;
  }
  LODWORD(v32) = +[PLImageWriter isSpatialOverCaptureURL:v19];
  if (v32)
  {
    v43 = PLMigrationGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = [v19 path];
      int location = 138543362;
      *(void *)location_4 = v44;
      _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "addAssetWithURLs: spatial over capture cannot be imported without original asset resource: %{public}@, skipping", (uint8_t *)&location, 0xCu);
    }
    int v147 = 0;
  }
  long long v22 = [v19 pathExtension];
  if (+[PLPhotoLibrary isAdjustmentEnvelopeExtension:v22])
  {
    long long v24 = PLMigrationGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v45 = [v19 path];
      int location = 138543362;
      *(void *)location_4 = v45;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "addAssetWithURLs: cannot import adjustment envelope as asset primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0xCu);
    }
    goto LABEL_43;
  }
  if (v186)
  {
    if (!+[PLPhotoLibrary isVideoFileExtension:v22])
    {
      int v177 = 31;
      [v156 getUInt16:&v177 forKey:*MEMORY[0x1E4F8C418]];
      if (v177 == 4)
      {
        uint64_t v32 = PLMigrationGetLog();
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          v60 = [v19 path];
          int location = 138543362;
          *(void *)location_4 = v60;
          _os_log_impl(&dword_19B3C7000, (os_log_t)v32, OS_LOG_TYPE_ERROR, "addAssetWithURLs: cannot import alternate image as asset primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0xCu);
        }
        int v147 = 0;
        LOBYTE(v32) = 1;
      }
      goto LABEL_87;
    }
    id v54 = [v152 mediaGroupUUID];
    if (v54) {
      goto LABEL_82;
    }
    id v54 = [v156 stringForKey:*MEMORY[0x1E4F8C3E8]];
    if (v54) {
      goto LABEL_82;
    }
    uint64_t v55 = [MEMORY[0x1E4F16330] assetWithURL:v19];
    v56 = PFVideoComplementMetadataForVideoAVAssetPreloadingValues();
    v139 = [v56 pairingIdentifier];
    v141 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithAVAsset:v55 timeZoneLookup:0];
    v135 = (void *)v55;
    v137 = v56;
    if (!v141)
    {
      v57 = PLMigrationGetLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location) = 0;
        _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Failed to check for existence of variation identifier", (uint8_t *)&location, 2u);
      }
    }
    if (v139)
    {
      if (v56)
      {
        [v56 videoDuration];
        if ((v180 & 0x100000000) != 0)
        {
          [v56 imageDisplayTime];
          if ((v178 & 1) == 0)
          {
            v58 = PLMigrationGetLog();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v59 = [v19 path];
              int location = 138543362;
              *(void *)location_4 = v59;
              _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Found invalid still display time on video complement: %{public}@", (uint8_t *)&location, 0xCu);
            }
          }
          id v54 = v139;
LABEL_81:

          if (!v54)
          {
LABEL_86:

            goto LABEL_87;
          }
LABEL_82:
          if (!+[PLManagedAsset isOrphanedMediaGroupUUID:v54])
          {
            uint64_t v32 = PLMigrationGetLog();
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
              v65 = [v19 path];
              int location = 138412546;
              *(void *)location_4 = v54;
              *(_WORD *)&location_4[8] = 2114;
              *(void *)&location_4[10] = v65;
              _os_log_impl(&dword_19B3C7000, (os_log_t)v32, OS_LOG_TYPE_ERROR, "addAssetWithURLs: video with identifier %{mediaGroupUUID}@ appears to be compliment resources of an iris asset: %{public}@, skipping", (uint8_t *)&location, 0x16u);
            }
            int v147 = 0;
            LOBYTE(v32) = 1;
          }
          goto LABEL_86;
        }
      }
      else
      {
        uint64_t v179 = 0;
        uint64_t v180 = 0;
        uint64_t v181 = 0;
      }
      v61 = [v141 playbackVariation];
      BOOL v62 = [v61 unsignedIntegerValue] == 0;

      if (v62)
      {
        v63 = PLMigrationGetLog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [v19 path];
          int location = 138543618;
          *(void *)location_4 = v139;
          *(_WORD *)&location_4[8] = 2114;
          *(void *)&location_4[10] = v64;
          _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_DEFAULT, "Video with media group ID %{public}@ does not have playback variation, nor valid still & video duration %{public}@", (uint8_t *)&location, 0x16u);
        }
      }
    }
    id v54 = 0;
    goto LABEL_81;
  }
LABEL_87:

  int v66 = v186;
  if (v186) {
    char v67 = v32;
  }
  else {
    char v67 = 1;
  }
  if ((v67 & 1) == 0)
  {
    v68 = (void *)MEMORY[0x1E4F8B908];
    v69 = [v19 path];
    BOOL v70 = [v68 fileLengthForFilePath:v69] == 0;

    if (v70)
    {
      long long v22 = PLMigrationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v91 = [v19 path];
        int location = 138543362;
        *(void *)location_4 = v91;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_FAULT, "addAssetWithURLs: attempting to import zero size primary assetURL: %{public}@, skipping", (uint8_t *)&location, 0xCu);
      }
      goto LABEL_44;
    }
    LOBYTE(v32) = 0;
    int v66 = v186;
  }
  if ((v32 & 1) != 0 || !v66) {
    goto LABEL_45;
  }
  if (!+[PLManagedAsset hasRequiredExtendedAttributesForPersistanceAttributes:v156])
  {
    v71 = PLMigrationGetLog();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      v72 = [v19 path];
      int location = 138543362;
      *(void *)location_4 = v72;
      _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_ERROR, "addAssetWithURLs: ERROR - missing required extended attributes for file at URL: %{public}@", (uint8_t *)&location, 0xCu);
    }
  }
  LOWORD(v177) = 0;
  uint64_t v129 = *MEMORY[0x1E4F8C358];
  objc_msgSend(v156, "getUInt16:forKey:", &v177);
  uint64_t v128 = *MEMORY[0x1E4F8C360];
  v130 = objc_msgSend(v156, "stringForKey:");
  BOOL v73 = -[NSString isEqualToString:](self->_photoLibraryStoreUUID, "isEqualToString:");
  BOOL v131 = v73;
  int v74 = (unsigned __int16)v177 > 2u && v73;
  if (v74 == 1)
  {
    v75 = PLMigrationGetLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = [v19 path];
      int location = 138543618;
      *(void *)location_4 = v76;
      *(_WORD *)&location_4[8] = 2114;
      *(void *)&location_4[10] = v23;
      _os_log_impl(&dword_19B3C7000, v75, OS_LOG_TYPE_ERROR, "addAssetWithURLs: ERROR - previously tried this URL and failed: %{public}@ [%{public}@])", (uint8_t *)&location, 0x16u);
    }
    int v147 = 0;
  }
  v140 = [v19 lastPathComponent];
  v77 = [v19 URLByDeletingLastPathComponent];
  v138 = [v77 path];

  v78 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
  v142 = +[PLManagedAsset pathForAdjustmentFileWithPathManager:v78 uuid:v23 directory:v138 filename:v140];

  v79 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v80 = [v79 fileExistsAtPath:v142];

  if (v80)
  {
    v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v142];
    v82 = v81;
    if (v81)
    {
      v83 = [v81 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
      int v84 = v83 == 0;

      if (v84)
      {
        v85 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
        v86 = +[PLManagedAsset pathForAdjustmentDataFileWithPathManager:v85 uuid:v23 directory:v138 filename:v140];

        v87 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v88 = [v87 fileExistsAtPath:v86];

        if ((v88 & 1) == 0)
        {
          v89 = PLMigrationGetLog();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            v90 = [v19 path];
            int location = 138543618;
            *(void *)location_4 = v90;
            *(_WORD *)&location_4[8] = 2114;
            *(void *)&location_4[10] = v23;
            _os_log_impl(&dword_19B3C7000, v89, OS_LOG_TYPE_ERROR, "addAssetWithURLs: ERROR - missing adjustment data blob for adjusted asset: %{public}@ [%{public}@])", (uint8_t *)&location, 0x16u);
          }
          int v147 = 0;
          int v74 = 1;
        }

        int v84 = v88 ^ 1;
      }
    }
    else
    {
      int v84 = 0;
    }

    int v80 = v84;
  }
  v92 = v23;
  v93 = v154;
  if (v143)
  {
    v94 = v19;
  }
  else
  {
    v93 = v19;
    v94 = 0;
  }
  id v136 = v93;
  id v134 = v94;
  int v127 = v80;
  if (((v80 | v15) & 1) == 0)
  {
    v95 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    int v96 = [v95 isUBF];

    if (v96)
    {
      if (v74)
      {
        v133 = 0;
        int v74 = 1;
        goto LABEL_123;
      }
      v133 = [(NSMutableDictionary *)self->_existingOIDsByUUID objectForKey:v92];
      if (!v133)
      {
        v133 = 0;
        int v74 = 0;
        goto LABEL_123;
      }
      v98 = PLMigrationGetLog();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
      {
        v100 = [v136 path];
        int location = 138543618;
        *(void *)location_4 = v100;
        *(_WORD *)&location_4[8] = 2114;
        *(void *)&location_4[10] = v92;
        _os_log_impl(&dword_19B3C7000, v98, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: EXISTING ASSET (%{public}@ [%{public}@]) (UUID matches existing asset)", (uint8_t *)&location, 0x16u);
      }
    }
    else
    {
      v97 = [(PLFileSystemAssetImporter *)self assetURLisInDatabase:v136 deferredPreviewURL:v134];
      v98 = v97;
      if (v97) {
        char v99 = v74;
      }
      else {
        char v99 = 1;
      }
      if (v99)
      {
        if ((v74 & 1) == 0)
        {
          if ([(NSMutableSet *)self->_existingUUIDs containsObject:v92])
          {
            uint64_t v23 = [MEMORY[0x1E4F8BA08] UUIDString];
            [MEMORY[0x1E4F8B900] persistUUIDString:v23 forKey:*MEMORY[0x1E4F8C470] fileURL:v19];
            v103 = PLMigrationGetLog();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              v104 = [v136 path];
              int location = 138543874;
              *(void *)location_4 = v104;
              *(_WORD *)&location_4[8] = 2114;
              *(void *)&location_4[10] = v92;
              __int16 v195 = 2114;
              v196 = v23;
              _os_log_impl(&dword_19B3C7000, v103, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: DUPLICATE UUID (%{public}@ [%{public}@] -> new UUID %{public}@)", (uint8_t *)&location, 0x20u);
            }
            v133 = 0;
            int v74 = 0;
            goto LABEL_150;
          }
          v133 = 0;
          int v74 = 0;
LABEL_149:
          uint64_t v23 = v92;
LABEL_150:

          goto LABEL_151;
        }
        v133 = 0;
      }
      else
      {
        if ([v97 isEqual:v92])
        {
          v101 = PLMigrationGetLog();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            v102 = [v136 path];
            int location = 138543618;
            *(void *)location_4 = v102;
            *(_WORD *)&location_4[8] = 2114;
            *(void *)&location_4[10] = v92;
            _os_log_impl(&dword_19B3C7000, v101, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: DUPLICATE PATH (%{public}@ [%{public}@]) (URL and UUID match database entry)", (uint8_t *)&location, 0x16u);
          }
        }
        else
        {
          v105 = PLMigrationGetLog();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            v106 = [v136 path];
            int location = 138543874;
            *(void *)location_4 = v106;
            *(_WORD *)&location_4[8] = 2114;
            *(void *)&location_4[10] = v92;
            __int16 v195 = 2114;
            v196 = v98;
            _os_log_impl(&dword_19B3C7000, v105, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: DUPLICATE PATH (%{public}@ [%{public}@] -> new UUID %{public}@)", (uint8_t *)&location, 0x20u);
          }
          [MEMORY[0x1E4F8B900] persistUUIDString:v98 forKey:*MEMORY[0x1E4F8C470] fileURL:v19];
        }
        v133 = [(NSMutableDictionary *)self->_existingOIDsByUUID objectForKey:v98];
      }
    }
    int v74 = 1;
    goto LABEL_149;
  }
  v133 = 0;
LABEL_123:
  uint64_t v23 = v92;
LABEL_151:
  int v107 = v74 ^ 1 | v147;
  if (!v131)
  {
    if (v107)
    {
      [MEMORY[0x1E4F8B900] persistString:self->_photoLibraryStoreUUID forKey:v128 fileURL:v19];
      if ((_WORD)v177) {
        [MEMORY[0x1E4F8B900] persistUInt16:0 forKey:v129 fileURL:v19];
      }
    }
  }
  +[PLDelayedFiledSystemDeletions waitForAllDelayedDeletionsToFinish];
  id v108 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v109 = [v19 path];
  int v110 = [v108 fileExistsAtPath:v109];

  if (!v110)
  {
    v124 = PLMigrationGetLog();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      v125 = [v19 path];
      int location = 138543362;
      *(void *)location_4 = v125;
      _os_log_impl(&dword_19B3C7000, v124, OS_LOG_TYPE_ERROR, "addAssetWithURLs: delayed file deletion in-flight during import, previously found file no longer exists: %{public}@, skipping", (uint8_t *)&location, 0xCu);
    }
    goto LABEL_171;
  }
  if ((v107 & ~v127) != 1) {
    goto LABEL_167;
  }
  v111 = PLMigrationGetLog();
  if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
  {
    id v112 = [v136 path];
    photoLibraryStoreUUID = self->_photoLibraryStoreUUID;
    int v148 = [(NSMutableSet *)self->_existingUUIDs containsObject:v92];
    v114 = [(PLFileSystemAssetImporter *)self assetURLisInDatabase:v136 deferredPreviewURL:v134];
    int location = 138544898;
    *(void *)location_4 = v112;
    *(_WORD *)&location_4[8] = 2114;
    *(void *)&location_4[10] = v92;
    __int16 v195 = 2114;
    v196 = v130;
    __int16 v197 = 2114;
    v198 = photoLibraryStoreUUID;
    __int16 v199 = 1024;
    BOOL v200 = v131;
    __int16 v201 = 1024;
    int v202 = v148;
    __int16 v203 = 1024;
    BOOL v204 = v114 != 0;
    _os_log_impl(&dword_19B3C7000, v111, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: (%{public}@ [%{public}@], rebuild %{public}@ database %{public}@, same? %d, exists %d, url dupe %d)", (uint8_t *)&location, 0x3Cu);
  }
  v115 = PLMigrationGetLog();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    int v116 = (unsigned __int16)v177;
    v117 = [v19 path];
    int location = 67109378;
    *(_DWORD *)location_4 = v116 + 1;
    *(_WORD *)&location_4[4] = 2114;
    *(void *)&location_4[6] = v117;
    _os_log_impl(&dword_19B3C7000, v115, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: PROGRESS - Setting progress flag %d for master URL: %{public}@", (uint8_t *)&location, 0x12u);
  }
  [MEMORY[0x1E4F8B900] persistUInt16:(unsigned __int16)(v177 + 1) forKey:v129 fileURL:v19];
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_64;
  v160[3] = &unk_1E5867978;
  v171 = &v187;
  v160[4] = self;
  id v149 = v136;
  id v161 = v149;
  BOOL v173 = v150;
  id v151 = v133;
  id v162 = v151;
  v132 = v23;
  v163 = v132;
  char v174 = v143;
  id v164 = v19;
  id v165 = v13;
  id v166 = v152;
  id v167 = v157;
  id v168 = v155;
  id v144 = v153;
  id v169 = v144;
  BOOL v175 = v145;
  int v172 = v182;
  id v170 = v156;
  BOOL v176 = a7;
  v118 = (void *)MEMORY[0x19F38D650](v160);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_66;
  v158[3] = &unk_1E5875198;
  id v120 = v118;
  id v159 = v120;
  [WeakRetained performBlockWithImportMutex:v158];

  uint64_t v121 = v188[5];
  if (v121)
  {
    if (+[PLAvalanche shouldOnlyShowAvalanchePicks])
    {
      v122 = [(id)v188[5] avalancheUUID];
      if (v122)
      {
        char v123 = [(id)v188[5] avalanchePickTypeIsVisible];

        if ((v123 & 1) == 0) {
          [(id)v188[5] setVisibilityState:2];
        }
      }
    }
  }

  if (v121)
  {
LABEL_167:
    self->_hasProcessedAnyAssets = 1;
LABEL_171:

LABEL_51:
    id v51 = (id)v188[5];
    v52 = v153;
    goto LABEL_52;
  }

  id v51 = 0;
  v52 = v144;
  uint64_t v23 = v132;
LABEL_52:

  _Block_object_dispose(&v187, 8);
  return v51;
}

id __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F8CC48]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [WeakRetained[1] libraryBundle];
    id v6 = [v5 timeZoneLookup];
    BOOL v7 = (void *)[v3 initWithImageURL:v4 contentType:0 timeZoneLookup:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_64(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(v1 + 132)) {
    uint64_t v3 = *(void *)(v1 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [v2 _addAssetWithURL:*(void *)(v1 + 40) existingOID:v3 assetUUID:*(void *)(v1 + 56) isPlaceholder:*(unsigned __int8 *)(v1 + 133)];
  uint64_t v5 = *(void *)(*(void *)(v1 + 120) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  BOOL v7 = *(void **)(*(void *)(*(void *)(v1 + 120) + 8) + 40);
  if (!v7) {
    return;
  }
  if (![v7 isInserted])
  {
    id v19 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) addedDate];

    if (!v19)
    {
      long long v20 = *(void **)(*(void *)(*(void *)(v1 + 120) + 8) + 40);
      int v21 = [v20 dateCreated];
      [v20 setAddedDate:v21];
    }
    goto LABEL_27;
  }
  BOOL v8 = [MEMORY[0x1E4F8B900] persistedAttributesForFileAtURL:*(void *)(v1 + 64)];
  uint64_t v9 = *MEMORY[0x1E4F8C470];
  int v10 = [v8 UUIDStringForKey:*MEMORY[0x1E4F8C470]];

  if (v10)
  {
    id v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(v1 + 64) path];
      *(_DWORD *)buf = 138543618;
      int v110 = v10;
      __int16 v111 = 2114;
      id v112 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: asset uuid: %{public}@ found in file attribute of master with URL: %{public}@", buf, 0x16u);
    }
    if ([*(id *)(v1 + 56) isEqualToString:v10]) {
      goto LABEL_26;
    }
    [MEMORY[0x1E4F8B900] persistUUIDString:*(void *)(v1 + 56) forKey:v9 fileURL:*(void *)(v1 + 64)];
    v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [*(id *)(v1 + 64) path];
      uint64_t v15 = *(void *)(v1 + 56);
      *(_DWORD *)buf = 138543874;
      int v110 = v14;
      __int16 v111 = 2114;
      id v112 = v10;
      __int16 v113 = 2114;
      uint64_t v114 = v15;
      int v16 = "addAssetWithURLs: updated asset UUID attribute on path from filename asset uuid (%{public}@ [%{public}@] -> "
            "new UUID %{public}@)";
      id v17 = v13;
      uint32_t v18 = 32;
LABEL_17:
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    }
  }
  else
  {
    uint64_t v22 = *(void *)(v1 + 56);
    if (!v22)
    {
      long long v24 = [*(id *)(*(void *)(v1 + 32) + 8) libraryServicesManager];
      int v25 = [v24 modelMigrator];
      v13 = [v25 archivedAssetUUIDForURL:*(void *)(v1 + 40)];

      if (v13)
      {
        [MEMORY[0x1E4F8B900] persistUUIDString:v13 forKey:v9 fileURL:*(void *)(v1 + 64)];
        BOOL v14 = PLMigrationGetLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        long long v26 = [*(id *)(v1 + 64) path];
        *(_DWORD *)buf = 138543618;
        int v110 = v13;
        __int16 v111 = 2114;
        id v112 = v26;
        uint64_t v27 = "addAssetWithURLs: forcing uuid: %{public}@ for master URL: %{public}@";
        id v28 = v14;
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
        uint32_t v30 = 22;
      }
      else
      {
        BOOL v14 = PLMigrationGetLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
        long long v26 = [*(id *)(v1 + 64) path];
        *(_DWORD *)buf = 138543362;
        int v110 = v26;
        uint64_t v27 = "addAssetWithURLs: unable to find uuid for master URL: %{public}@";
        id v28 = v14;
        os_log_type_t v29 = OS_LOG_TYPE_ERROR;
        uint32_t v30 = 12;
      }
      _os_log_impl(&dword_19B3C7000, v28, v29, v27, buf, v30);

      goto LABEL_24;
    }
    [MEMORY[0x1E4F8B900] persistUUIDString:v22 forKey:v9 fileURL:*(void *)(v1 + 64)];
    v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(NSObject **)(v1 + 56);
      BOOL v14 = [*(id *)(v1 + 64) path];
      *(_DWORD *)buf = 138543618;
      int v110 = v23;
      __int16 v111 = 2114;
      id v112 = v14;
      int v16 = "addAssetWithURLs: setting uuid (was nil): %{public}@ for master URL: %{public}@";
      id v17 = v13;
      uint32_t v18 = 22;
      goto LABEL_17;
    }
  }

LABEL_26:
LABEL_27:
  if (*(void *)(v1 + 72))
  {
    if (*(void *)(v1 + 56)) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40), "setUuid:");
    }
    uint64_t v31 = PLMigrationGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v32 = *(NSObject **)(v1 + 56);
      int v33 = *(NSObject **)(v1 + 80);
      *(_DWORD *)buf = 138543618;
      int v110 = v32;
      __int16 v111 = 2114;
      id v112 = v33;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: applying asset metadata from journal payload, uuid: %{public}@, payload: %{public}@", buf, 0x16u);
    }

    [*(id *)(v1 + 80) applyPayloadToManagedObject:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) payloadAttributesToUpdate:0];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) synchronizeWithPersistedFileSystemAttributes];
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v34 = *(id *)(v1 + 88);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v104 objects:v108 count:16];
  if (!v35)
  {

    char v73 = 0;
    char v72 = 0;
    if (*(unsigned char *)(v1 + 133)) {
      goto LABEL_74;
    }
    goto LABEL_85;
  }
  uint64_t v36 = v35;
  char v98 = 0;
  char v95 = 0;
  char v100 = 0;
  int v37 = 0;
  int v97 = 0;
  uint64_t v38 = *(void *)v105;
  uint64_t v94 = *MEMORY[0x1E4F2F800];
  uint64_t v39 = off_1E585E000;
  uint64_t v99 = v1;
  id v101 = v34;
  uint64_t v102 = *(void *)v105;
  do
  {
    uint64_t v40 = 0;
    do
    {
      if (*(void *)v105 != v38) {
        objc_enumerationMutation(v34);
      }
      id v41 = *(void **)(*((void *)&v104 + 1) + 8 * v40);
      uint64_t v42 = v39[401];
      v43 = [v41 pathExtension];
      LODWORD(v42) = [(__objc2_class *)v42 isValidFileExtensionForImport:v43];

      if (v42 && ([v41 isEqual:*(void *)(v1 + 64)] & 1) == 0)
      {
        v44 = [v41 lastPathComponent];
        v45 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) pathForSpatialOverCaptureContentFile];
        v46 = [v45 lastPathComponent];
        if ([v44 isEqualToString:v46])
        {
          int v37 = 1;
          goto LABEL_43;
        }
        int v103 = v37;
        [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) pathForVideoComplementSpatialOverCaptureContentFile];
        v48 = uint64_t v47 = v1;
        v49 = [v48 lastPathComponent];
        char v50 = [v44 isEqualToString:v49];

        if (v50)
        {
          int v37 = 1;
          uint64_t v1 = v47;
          id v34 = v101;
          uint64_t v38 = v102;
          goto LABEL_53;
        }
        id v51 = [*(id *)(*(void *)(*(void *)(v47 + 120) + 8) + 40) pathForDeferredProcessingPreviewFile];
        v52 = [v51 lastPathComponent];
        char v53 = [v44 isEqualToString:v52];

        uint64_t v1 = v47;
        uint64_t v38 = v102;
        if (v53)
        {
          char v100 = 1;
          id v34 = v101;
        }
        else
        {
          id v54 = [*(id *)(*(void *)(*(void *)(v47 + 120) + 8) + 40) pathForVideoComplementFile];
          uint64_t v55 = [v54 lastPathComponent];
          char v56 = [v44 isEqualToString:v55];

          id v34 = v101;
          if (v56)
          {
            char v98 = 1;
          }
          else
          {
            v57 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) pathForDeferredVideoComplementFile];
            v58 = [v57 lastPathComponent];
            char v59 = [v44 isEqualToString:v58];

            if ((v59 & 1) == 0)
            {
              v60 = CGImageSourceCreateWithURL((CFURLRef)v41, 0);
              if (v60)
              {
                v61 = v60;
                CFDictionaryRef v62 = CGImageSourceCopyProperties(v60, 0);
                v63 = [(__CFDictionary *)v62 objectForKey:v94];
                v64 = v63;
                if (v63)
                {
                  v45 = DateCreatedFromExifDictionary(v63);
                }
                else
                {
                  v45 = 0;
                }
                CFRelease(v61);

                uint64_t v1 = v99;
              }
              else
              {
                v45 = 0;
              }
              int v96 = *(void **)(*(void *)(*(void *)(v1 + 120) + 8) + 40);
              v46 = [*(id *)(v99 + 96) objectValue];
              int v65 = [v46 orientation];
              int v66 = [*(id *)(*(void *)(v99 + 32) + 8) pathManager];
              LODWORD(v93) = v65;
              uint64_t v1 = v99;
              [v96 addSidecarFileAtIndex:v97 sidecarURL:v41 withFilename:0 compressedSize:0 captureDate:v45 modificationDate:0 uniformTypeIdentifier:0 imageOrientation:v93 pathManager:v66];

              ++v97;
              int v37 = v103;
              uint64_t v38 = v102;
LABEL_43:

LABEL_53:
              uint64_t v39 = off_1E585E000;
              goto LABEL_54;
            }
            char v98 = 1;
            char v95 = 1;
          }
        }
        int v37 = v103;
        goto LABEL_53;
      }
LABEL_54:
      ++v40;
    }
    while (v36 != v40);
    uint64_t v67 = [v34 countByEnumeratingWithState:&v104 objects:v108 count:16];
    uint64_t v36 = v67;
  }
  while (v67);

  if (v37)
  {
    [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) setCameraProcessingAdjustmentState:1];
    v68 = [*(id *)(v1 + 32) _assetAdjustmentsIfExistsForAsset:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40)];
    v69 = [*(id *)(v1 + 96) objectValue];
    BOOL v70 = [v69 spatialOverCaptureIdentifier];
    v71 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) additionalAttributes];
    [v71 setSpatialOverCaptureGroupIdentifier:v70];

    if (v68) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40), "setCameraProcessingAdjustmentStateFromAdjustmentRenderTypes:", objc_msgSend(v68, "adjustmentRenderTypes"));
    }
  }
  char v72 = v98;
  char v73 = v95;
  if (v100)
  {
    if (!*(unsigned char *)(v1 + 133)) {
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  if (*(unsigned char *)(v1 + 133))
  {
LABEL_74:
    if (*(void *)(v1 + 104))
    {
      [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) setDeferredProcessingNeeded:1];
      int v74 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) additionalAttributes];
      [v74 setDeferredPhotoIdentifier:*(void *)(v1 + 104)];
    }
LABEL_76:
    if (*(unsigned char *)(v1 + 134))
    {
      v75 = PLMigrationGetLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        int v76 = *(_DWORD *)(v1 + 128);
        *(_DWORD *)buf = 67109120;
        LODWORD(v110) = v76;
        _os_log_impl(&dword_19B3C7000, v75, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: asset is SemDev scene %d", buf, 8u);
      }

      v77 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) additionalAttributes];
      objc_msgSend(v77, "setDeferredProcessingCandidateOptions:", objc_msgSend(v77, "deferredProcessingCandidateOptions") | 8);

      if (*(unsigned char *)(v1 + 134) && !*(void *)(v1 + 104)) {
        [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) setDeferredProcessingNeeded:10];
      }
    }
    [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) synchronizeWithPersistedFileSystemAttributes];
  }
  if (v73) {
    [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) setVideoDeferredProcessingNeeded:1];
  }
LABEL_85:
  if ([*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) isPhoto])
  {
    if ([*(id *)(v1 + 32) _setupPhotoAsset:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) withURL:*(void *)(v1 + 64) isPlaceholder:*(unsigned __int8 *)(v1 + 133) hasVideoComplementResource:v72 & 1])goto LABEL_95; {
LABEL_102:
    }
    v90 = PLMigrationGetLog();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      v91 = [*(id *)(v1 + 64) path];
      *(_DWORD *)buf = 138543362;
      int v110 = v91;
      _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_ERROR, "Unable to add \"%{public}@\".", buf, 0xCu);
    }
    [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) deleteFromDatabaseOnly];
    uint64_t v92 = *(void *)(*(void *)(v1 + 120) + 8);
    int v88 = *(NSObject **)(v92 + 40);
    *(void *)(v92 + 40) = 0;
  }
  else
  {
    if ([*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) isVideo])
    {
      if ([*(id *)(v1 + 32) _setupVideoAsset:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) withURL:*(void *)(v1 + 64)])goto LABEL_95; {
      goto LABEL_102;
      }
    }
    v78 = [*(id *)(v1 + 64) pathExtension];
    BOOL v79 = +[PLManagedAsset isValidFileExtensionForImport:v78];

    if (!v79) {
      goto LABEL_102;
    }
    int v80 = PLMigrationGetLog();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v81 = [*(id *)(v1 + 64) path];
      *(_DWORD *)buf = 138543362;
      int v110 = v81;
      _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_ERROR, "Unknown asset, importing as an unknown type:\"%{public}@\"", buf, 0xCu);
    }
    if (([*(id *)(v1 + 32) _setupUnknownAsset:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) withURL:*(void *)(v1 + 64)] & 1) == 0)goto LABEL_102; {
LABEL_95:
    }
    [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) setLocationFromPersistedAttributes:*(void *)(v1 + 112)];
    [*(id *)(v1 + 32) setModificationAndCreationDateOnAsset:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) withURL:*(void *)(v1 + 64)];
    if (*(unsigned char *)(v1 + 135))
    {
      v82 = [*(id *)(*(void *)(v1 + 32) + 8) libraryServicesManager];
      v83 = [v82 modelMigrator];
      [v83 fixPossiblyIncorrectAddedDateForAsset:*(void *)(*(void *)(*(void *)(v1 + 120) + 8) + 40)];
    }
    if ([*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) deferredProcessingNeeded]|| objc_msgSend(*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40), "videoDeferredProcessingNeeded"))
    {
      int v84 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) photoLibrary];
      v85 = [v84 libraryServicesManager];
      v86 = [v85 backgroundJobService];
      v87 = [*(id *)(*(void *)(*(void *)(v1 + 120) + 8) + 40) photoLibrary];
      [v86 signalBackgroundProcessingNeededOnLibrary:v87];
    }
    [MEMORY[0x1E4F8B900] persistUInt16:0 forKey:*MEMORY[0x1E4F8C358] fileURL:*(void *)(v1 + 64)];
    int v88 = PLMigrationGetLog();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v89 = [*(id *)(v1 + 64) path];
      *(_DWORD *)buf = 138543362;
      int v110 = v89;
      _os_log_impl(&dword_19B3C7000, v88, OS_LOG_TYPE_DEFAULT, "addAssetWithURLs: DONE - remove progress flag: %{public}@", buf, 0xCu);
    }
  }
}

void __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_66(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __96__PLFileSystemAssetImporter_addAssetWithURLs_assetPayload_forceInsert_forceUpdate_fixAddedDate___block_invoke_68(uint64_t a1, void *a2)
{
  v2 = [a2 path];
  uint64_t v3 = [v2 lastPathComponent];

  return v3;
}

- (id)assetURLisInDatabase:(id)a3 deferredPreviewURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableDictionary *)self->_existingUUIDsByUppercasePath count])
  {
    unint64_t v8 = [(NSString *)self->_libraryBundlePath length];
    uint64_t v9 = [v6 path];
    int v10 = v9;
    if (v7)
    {
      id v11 = [v7 path];
    }
    else
    {
      id v11 = v9;
    }
    v13 = v11;
    BOOL v14 = [v11 stringByResolvingSymlinksInPath];

    int v15 = [v14 hasPrefix:self->_libraryBundlePath];
    id v12 = 0;
    if ([v10 length] > v8 && v15)
    {
      if (v7)
      {
        int v16 = [v10 lastPathComponent];
        id v17 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
        uint32_t v18 = [v6 URLByDeletingLastPathComponent];
        id v19 = [v18 path];
        long long v20 = [v17 assetAbbreviatedMetadataDirectoryForDirectory:v19 type:31 bundleScope:0];

        int v21 = [v20 stringByAppendingPathComponent:v16];
      }
      else
      {
        int v21 = [v14 substringFromIndex:v8 + 1];
      }
      uint64_t v22 = [v21 uppercaseString];

      id v12 = [(NSMutableDictionary *)self->_existingUUIDsByUppercasePath objectForKey:v22];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_addAssetWithURL:(id)a3 existingOID:(id)a4 assetUUID:(id)a5 isPlaceholder:(BOOL)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x19F38D3B0]();
  photoLibrary = self->_photoLibrary;
  if (v11)
  {
    id v15 = +[PLManagedAsset assetWithObjectID:v11 inLibrary:photoLibrary];
    if (v15) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v16 = +[PLManagedAsset assetWithUUID:v12 inLibrary:photoLibrary];
    if (v16)
    {
      id v15 = (id)v16;
      id v17 = PLMigrationGetLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
LABEL_29:

        goto LABEL_30;
      }
      id v18 = [v10 path];
      *(_DWORD *)buf = 138543618;
      id v56 = v18;
      __int16 v57 = 2114;
      v58 = v12;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "addAssetWithURLs: EXISTING ASSET (%{public}@ [%{public}@]) (UUID already inserted by asset creation request?)", buf, 0x16u);
LABEL_28:

      goto LABEL_29;
    }
  }
  id v19 = [(PLPhotoLibrary *)self->_photoLibrary managedObjectContext];
  id v15 = +[PLManagedObject insertInManagedObjectContext:v19];

  if (!v15)
  {
LABEL_30:
    uint64_t v47 = 0;
    goto LABEL_31;
  }
LABEL_8:
  BOOL v51 = a6;
  v52 = v13;
  long long v20 = v12;
  int v21 = [v10 lastPathComponent];
  [v15 setFilename:v21];

  uint64_t v22 = [v15 filename];
  [v15 setOriginalFilename:v22];

  uint64_t v23 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
  int v24 = [v23 isDCIM];

  if (v24)
  {
    int v25 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    long long v26 = [v10 URLByDeletingLastPathComponent];
    uint64_t v27 = [v26 path];
    id v28 = [v25 assetAbbreviatedMetadataDirectoryForDirectory:v27 type:31 bundleScope:0];
    [v15 setDirectory:v28];

    os_log_type_t v29 = (void *)MEMORY[0x1E4F8B908];
    uint32_t v30 = [v10 path];
    uint64_t v31 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    uint64_t v32 = [v31 photoDirectoryWithType:27];
    LOBYTE(v29) = [v29 filePath:v30 hasPrefix:v32];

    id v12 = v20;
    v13 = v52;
    if ((v29 & 1) == 0) {
      goto LABEL_16;
    }
    uint64_t v33 = 4;
  }
  else
  {
    id v34 = (void *)MEMORY[0x1E4F8B908];
    uint64_t v35 = [v10 path];
    uint64_t v36 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    int v37 = [v36 photoDirectoryWithType:27];
    if ([v34 filePath:v35 hasPrefix:v37]) {
      uint64_t v33 = 4;
    }
    else {
      uint64_t v33 = 0;
    }

    uint64_t v38 = [(PLPhotoLibrary *)self->_photoLibrary pathManager];
    uint64_t v39 = [v10 URLByDeletingLastPathComponent];
    uint64_t v40 = [v39 path];
    id v41 = [v38 assetAbbreviatedMetadataDirectoryForDirectory:v40 type:31 bundleScope:v33];
    [v15 setDirectory:v41];

    id v12 = v20;
    v13 = v52;
  }
  [v15 setBundleScope:v33];
LABEL_16:
  if (!v51)
  {
    id v54 = 0;
    uint64_t v42 = *MEMORY[0x1E4F1C5F8];
    id v53 = 0;
    int v43 = [v10 getResourceValue:&v54 forKey:v42 error:&v53];
    id v18 = v54;
    id v17 = v53;
    if (v43)
    {
      if (v18)
      {
        objc_msgSend(v15, "setOriginalFilesize:", objc_msgSend(v18, "unsignedLongLongValue"));

        goto LABEL_20;
      }
      v48 = PLMigrationGetLog();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
    }
    else
    {
      v48 = PLMigrationGetLog();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
LABEL_27:

        [v15 deleteFromDatabaseOnly];
        goto LABEL_28;
      }
    }
    v49 = [v10 path];
    *(_DWORD *)buf = 138412546;
    id v56 = v49;
    __int16 v57 = 2112;
    v58 = v17;
    _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Unable to get file size for \"%@\": %@", buf, 0x16u);

    goto LABEL_27;
  }
LABEL_20:
  v44 = [v10 pathExtension];
  BOOL v45 = +[PLManagedAsset isKnownFileExtension:v44];

  if (v45)
  {
    v46 = [v10 pathExtension];
    [v15 setUniformTypeIdentifierFromPathExtension:v46];
  }
  [v15 updateAssetKindFromUniformTypeIdentifier];
  id v15 = v15;
  uint64_t v47 = v15;
LABEL_31:

  return v47;
}

- (void)dealloc
{
  if ([(NSMutableIndexSet *)self->_thumbIndexes count]) {
    +[PLThumbnailIndexes recycleThumbnailIndexes:self->_thumbIndexes inLibrary:self->_photoLibrary];
  }
  v3.receiver = self;
  v3.super_class = (Class)PLFileSystemAssetImporter;
  [(PLFileSystemAssetImporter *)&v3 dealloc];
}

- (id)libraryBundlePathWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 pathManager];
  int v5 = [v4 isUBF];

  if (v5)
  {
    id v6 = [v3 pathManager];
    id v7 = v6;
    uint64_t v8 = 4;
  }
  else
  {
    if (PLIsEDUMode())
    {
      id v7 = NSHomeDirectory();
      uint64_t v9 = [v7 stringByAppendingPathComponent:@"Media"];
      goto LABEL_7;
    }
    id v6 = [v3 pathManager];
    id v7 = v6;
    uint64_t v8 = 1;
  }
  uint64_t v9 = [v6 photoDirectoryWithType:v8];
LABEL_7:
  id v10 = (void *)v9;

  return v10;
}

- (PLFileSystemAssetImporter)initWithPhotoLibrary:(id)a3 libraryServicesManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLFileSystemAssetImporter;
  id v10 = [(PLFileSystemAssetImporter *)&v18 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    if (!v9)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v11, @"PLFileSystemAssetImporter.m", 70, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];
    }
    objc_storeWeak((id *)&v11->_libraryServicesManager, v9);
    uint64_t v12 = [(PLFileSystemAssetImporter *)v11 libraryBundlePathWithPhotoLibrary:v8];
    libraryBundlePath = v11->_libraryBundlePath;
    v11->_libraryBundlePath = (NSString *)v12;

    uint64_t v14 = [v8 managedObjectContextStoreUUID];
    photoLibraryStoreUUID = v11->_photoLibraryStoreUUID;
    v11->_photoLibraryStoreUUID = (NSString *)v14;

    v11->_thumbnailBatchFetchSize = 50;
  }

  return v11;
}

@end