@interface PLInterLibraryTransfer
- (BOOL)_copyFileFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)_copyFilesFromSourceAsset:(id)a3 toDestinationAsset:(id)a4 objectMap:(id)a5 filesCopied:(id)a6 error:(id *)a7;
- (BOOL)_copyMasterThumbnailFrom:(id)a3 toDestinationAsset:(id)a4 filesCopied:(id)a5 error:(id *)a6;
- (BOOL)_deleteAsset:(id)a3;
- (BOOL)_loadLibrariesWithError:(id *)a3;
- (BOOL)_shouldSkipRelationship:(id)a3;
- (BOOL)_shouldSkipTransferWithSourceAsset:(id)a3 destinationAsset:(id)a4;
- (BOOL)transferAssetWithUuid:(id)a3 error:(id *)a4;
- (BOOL)transferFaceCropWithUuid:(id)a3 error:(id *)a4;
- (BOOL)transferPersonWithUuid:(id)a3 error:(id *)a4;
- (NSFileManager)fileManager;
- (PLInterLibraryTransfer)initWithSourceBundle:(id)a3 destinationBundle:(id)a4 options:(id)a5;
- (PLInterLibraryTransfer)initWithSourceLibrary:(id)a3 destinationLibrary:(id)a4 options:(id)a5;
- (PLInterLibraryTransferOptions)options;
- (PLPhotoLibrary)destinationLibrary;
- (PLPhotoLibrary)sourceLibrary;
- (PLPhotoLibraryBundle)destinationBundle;
- (PLPhotoLibraryBundle)sourceBundle;
- (id)_copyObject:(id)a3 toDestinationObject:(id)a4 toLibrary:(id)a5 objectMap:(id)a6;
- (id)_createNewObjectWithEntity:(id)a3 attributes:(id)a4 inLibrary:(id)a5;
- (id)_dedupedDestinationAssetWithSourceAsset:(id)a3 destinationLibrary:(id)a4;
- (id)_loadAssetWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5;
- (id)_loadDestinationLibraryWithError:(id *)a3;
- (id)_loadFaceCropWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5;
- (id)_loadObjectWithEntityName:(id)a3 withValues:(id)a4 forKeyPaths:(id)a5 fromLibrary:(id)a6 error:(id *)a7;
- (id)_loadPersonWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5;
- (id)_loadSourceLibraryWithError:(id *)a3;
- (id)_sourceAttributesFromObject:(id)a3;
- (void)_copyRelationship:(id)a3 fromObject:(id)a4 toObject:(id)a5 inLibrary:(id)a6 objectMap:(id)a7;
- (void)_initFileManager;
- (void)_setAttributes:(id)a3 onObject:(id)a4;
- (void)_setRelationship:(id)a3 origin:(id)a4 target:(id)a5;
- (void)_transferThumbnailsForSourceAsset:(id)a3 toDestinationAsset:(id)a4 filesCopied:(id)a5;
- (void)_validateSourceAsset:(id)a3 destinationAsset:(id)a4;
- (void)_validateSourceFaceCrop:(id)a3 destinationFaceCrop:(id)a4;
- (void)_validateSourcePerson:(id)a3 destinationPerson:(id)a4;
- (void)setDestinationBundle:(id)a3;
- (void)setDestinationLibrary:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSourceBundle:(id)a3;
- (void)setSourceLibrary:(id)a3;
@end

@implementation PLInterLibraryTransfer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationLibrary, 0);
  objc_storeStrong((id *)&self->_sourceLibrary, 0);
  objc_storeStrong((id *)&self->_destinationBundle, 0);
  objc_storeStrong((id *)&self->_sourceBundle, 0);
}

- (void)setFileManager:(id)a3
{
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOptions:(id)a3
{
}

- (PLInterLibraryTransferOptions)options
{
  return (PLInterLibraryTransferOptions *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDestinationLibrary:(id)a3
{
}

- (PLPhotoLibrary)destinationLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceLibrary:(id)a3
{
}

- (PLPhotoLibrary)sourceLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDestinationBundle:(id)a3
{
}

- (PLPhotoLibraryBundle)destinationBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourceBundle:(id)a3
{
}

- (PLPhotoLibraryBundle)sourceBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void)_validateSourceFaceCrop:(id)a3 destinationFaceCrop:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 918, @"Invalid parameter not satisfying: %@", @"sourceFaceCrop" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 919, @"Invalid parameter not satisfying: %@", @"destinationFaceCrop" object file lineNumber description];

LABEL_3:
}

- (void)_validateSourcePerson:(id)a3 destinationPerson:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 912, @"Invalid parameter not satisfying: %@", @"sourcePerson" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 913, @"Invalid parameter not satisfying: %@", @"destinationPerson" object file lineNumber description];

LABEL_3:
}

- (void)_validateSourceAsset:(id)a3 destinationAsset:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 888, @"Invalid parameter not satisfying: %@", @"sourceAsset" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 889, @"Invalid parameter not satisfying: %@", @"destinationAsset" object file lineNumber description];

LABEL_3:
  id v10 = [v9 mainFileURL];

  if (!v10)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__79963;
    v33 = __Block_byref_object_dispose__79964;
    id v34 = 0;
    v11 = [v7 photoLibrary];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __64__PLInterLibraryTransfer__validateSourceAsset_destinationAsset___block_invoke;
    v26 = &unk_1E5875E68;
    v28 = &v29;
    id v27 = v7;
    [v11 performBlockAndWait:&v23];

    v12 = NSString;
    v13 = [v9 objectID];
    v14 = [v9 uuid];
    v15 = [v9 directory];
    v16 = [v9 filename];
    v17 = [v12 stringWithFormat:@"Destination objectID: %@, UUID: %@, directory: %@, filename: %@", v13, v14, v15, v16, v23, v24, v25, v26];

    v18 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      uint64_t v19 = v30[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v19;
      __int16 v37 = 2114;
      v38 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_FAULT, "Unexpected nil destination mainFileURL when transferring assets. %{public}@ %{public}@", buf, 0x16u);
    }

    v20 = [NSString stringWithFormat:@"Unexpected nil destination mainFileURL when transferring assets. %@ %@", v30[5], v17];
    +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Photo Library state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: Unexpected nil destination mainFileURL when transferring assets" radarDescription:v20];

    _Block_object_dispose(&v29, 8);
  }
}

void __64__PLInterLibraryTransfer__validateSourceAsset_destinationAsset___block_invoke(uint64_t a1)
{
  v2 = NSString;
  id v11 = [*(id *)(a1 + 32) objectID];
  v3 = [*(id *)(a1 + 32) uuid];
  v4 = [*(id *)(a1 + 32) directory];
  v5 = [*(id *)(a1 + 32) filename];
  int v6 = [*(id *)(a1 + 32) isDeleted];
  id v7 = @"NO";
  if (v6) {
    id v7 = @"YES";
  }
  uint64_t v8 = [v2 stringWithFormat:@"Source objectID: %@, UUID: %@, directory: %@, filename: %@, isDeleted: isDeleted %@", v11, v3, v4, v5, v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)_transferThumbnailsForSourceAsset:(id)a3 toDestinationAsset:(id)a4 filesCopied:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  int v8 = [v6 hasMasterThumb];
  int v9 = [v6 hasTableThumbs];
  uint64_t v10 = [v7 count];

  id v11 = [v6 uuid];
  v12 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v25 = 138544386;
    v26 = v11;
    __int16 v27 = 1024;
    int v28 = v8;
    __int16 v29 = 1024;
    int v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = [v6 effectiveThumbnailIndex];
    __int16 v33 = 1024;
    BOOL v34 = v10 == 1;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Asset %{public}@ hasMasterThumb:%d, hasTableThumbs:%d effectiveThumbnailIndex:%tu hasSourceMasterThumbOnly:%d", (uint8_t *)&v25, 0x28u);
  }

  if ((v9 | v8) == 1)
  {
    if (v9) {
      [v6 setEffectiveThumbnailIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    if (v10 == 1)
    {
      v13 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v25 = 138543362;
        v26 = v11;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Building table thumbs for asset %{public}@", (uint8_t *)&v25, 0xCu);
      }

      v14 = objc_alloc_init(PLTableThumbnailMigrator);
      v15 = (void *)MEMORY[0x1E4F8B9F8];
      v16 = [v6 photoLibrary];
      v17 = [v16 pathManager];
      v18 = [v15 tableThumbnailFormatsForConfigPhase:1 withPathManager:v17];

      uint64_t v19 = [v6 photoLibrary];
      [(PLTableThumbnailMigrator *)v14 rebuildTableThumbForAsset:v6 inLibrary:v19 toTableFormats:v18];
    }
    else
    {
      [v6 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
    }
    v20 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = [v6 hasMasterThumb];
      int v22 = [v6 hasTableThumbs];
      uint64_t v23 = [v6 effectiveThumbnailIndex];
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = @"NSNotFound";
      }
      else
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "effectiveThumbnailIndex"));
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      int v25 = 138544130;
      v26 = v11;
      __int16 v27 = 1024;
      int v28 = v21;
      __int16 v29 = 1024;
      int v30 = v22;
      __int16 v31 = 2114;
      uint64_t v32 = (uint64_t)v24;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "DONE  rebuilding thumbnails for asset %{public}@: hasMasterThumb:%d hasTableThumbs:%d effectiveThumbnailIndex:%{public}@", (uint8_t *)&v25, 0x22u);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
    }
      }
  }
}

- (BOOL)_copyFileFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [v8 path];
    v12 = [v9 path];
    *(_DWORD *)buf = 138412546;
    id v53 = v11;
    __int16 v54 = 2112;
    id v55 = v12;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "BEGIN copying file from %@ to %@", buf, 0x16u);
  }
  fileManager = self->_fileManager;
  v14 = [v9 path];
  v15 = [v14 stringByDeletingLastPathComponent];
  id v51 = 0;
  BOOL v16 = [(NSFileManager *)fileManager createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v51];
  id v17 = v51;

  if (!v16)
  {
    __int16 v31 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v17;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "ERROR creating intermediate directories: %@", buf, 0xCu);
    }

    if (a5)
    {
      id v20 = 0;
      BOOL v32 = 0;
      *a5 = v17;
      goto LABEL_33;
    }
    id v20 = 0;
    goto LABEL_21;
  }
  v18 = self->_fileManager;
  id v50 = 0;
  BOOL v19 = [(NSFileManager *)v18 copyItemAtURL:v8 toURL:v9 error:&v50];
  id v20 = v50;
  if (!v19)
  {
    if (PLErrorOrUnderlyingErrorHasDomainAndCode())
    {
      v59[0] = *MEMORY[0x1E4F1C5F8];
      uint64_t v21 = v59[0];
      int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
      uint64_t v23 = [v9 resourceValuesForKeys:v22 error:0];
      uint64_t v24 = [v23 objectForKey:v21];

      uint64_t v58 = v21;
      int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
      v26 = [v8 resourceValuesForKeys:v25 error:0];
      __int16 v27 = [v26 objectForKey:v21];

      LODWORD(v26) = [v24 isEqualToNumber:v27];
      int v28 = PLInterLibraryTransferGetLog();
      __int16 v29 = v28;
      if (v26)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          int v30 = [v9 path];
          *(_DWORD *)buf = 138412290;
          id v53 = v30;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "File already exists at destination path %@", buf, 0xCu);
        }
        goto LABEL_30;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v53 = v27;
        __int16 v54 = 2114;
        id v55 = v24;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_INFO, "File sizes don't match source=%{public}@ dest=%{public}@. Will overwrite.", buf, 0x16u);
      }

      __int16 v37 = self->_fileManager;
      id v49 = 0;
      BOOL v38 = [(NSFileManager *)v37 removeItemAtURL:v9 error:&v49];
      id v39 = v49;
      if (v38)
      {

        v40 = self->_fileManager;
        id v48 = 0;
        BOOL v41 = [(NSFileManager *)v40 copyItemAtURL:v8 toURL:v9 error:&v48];
        id v20 = v48;
      }
      else
      {
        v42 = PLInterLibraryTransferGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = [v9 path];
          *(_DWORD *)buf = 138412546;
          id v53 = v43;
          __int16 v54 = 2112;
          id v55 = v39;
          _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "Unable to remove file for overwrite at path %@ error %@", buf, 0x16u);
        }
        BOOL v41 = 0;
      }

      BOOL v33 = v41;
      if (v41) {
        goto LABEL_30;
      }
    }
    else
    {
      BOOL v33 = 0;
    }
    BOOL v34 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = [v8 path];
      uint64_t v36 = [v9 path];
      *(_DWORD *)buf = 138412802;
      id v53 = v35;
      __int16 v54 = 2112;
      id v55 = v36;
      __int16 v56 = 2112;
      id v57 = v20;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "ERROR copying file from %@ to %@: %@", buf, 0x20u);
    }
    if (a5) {
      *a5 = v20;
    }
    if (v33) {
      goto LABEL_30;
    }
LABEL_21:
    BOOL v32 = 0;
    goto LABEL_33;
  }
LABEL_30:
  v44 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    v45 = [v8 path];
    v46 = [v9 path];
    *(_DWORD *)buf = 138412546;
    id v53 = v45;
    __int16 v54 = 2112;
    id v55 = v46;
    _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEBUG, "DONE  copying file from %@ to %@", buf, 0x16u);
  }
  BOOL v32 = 1;
LABEL_33:

  return v32;
}

- (BOOL)_copyMasterThumbnailFrom:(id)a3 toDestinationAsset:(id)a4 filesCopied:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  BOOL v41 = __Block_byref_object_copy__79963;
  v42 = __Block_byref_object_dispose__79964;
  id v43 = 0;
  uint64_t v32 = 0;
  BOOL v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__79963;
  uint64_t v36 = __Block_byref_object_dispose__79964;
  id v37 = 0;
  v13 = [v10 photoLibrary];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __88__PLInterLibraryTransfer__copyMasterThumbnailFrom_toDestinationAsset_filesCopied_error___block_invoke;
  v28[3] = &unk_1E5875A90;
  int v30 = &v32;
  id v14 = v10;
  id v29 = v14;
  __int16 v31 = &v38;
  [v13 performBlockAndWait:v28];

  if (v39[5])
  {
    v15 = [v11 masterThumbnailFileURLIfLocal];
    uint64_t v16 = v39[5];
    id v27 = 0;
    BOOL v17 = [(PLInterLibraryTransfer *)self _copyFileFrom:v16 to:v15 error:&v27];
    id v18 = v27;
    if (v17)
    {
      [v12 addObject:v15];
      BOOL v19 = 1;
      goto LABEL_10;
    }
    uint64_t v24 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = v39[5];
      *(_DWORD *)buf = 138412802;
      uint64_t v47 = v25;
      __int16 v48 = 2112;
      id v49 = v15;
      __int16 v50 = 2112;
      id v51 = v18;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "ERROR copy master thumbnail file from %@ to %@ failed: %@", buf, 0x20u);
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28228];
    uint64_t v21 = [NSString stringWithFormat:@"Master thumbnail file URL missing for asset %@", v33[5]];
    v45 = v21;
    int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v18 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:70002 userInfo:v22];

    v15 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v33[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v23;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "ERROR missing master thumbnail URL from source asset %{public}@", buf, 0xCu);
    }
  }
  BOOL v19 = 0;
LABEL_10:

  if (a6) {
    *a6 = v18;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v19;
}

void __88__PLInterLibraryTransfer__copyMasterThumbnailFrom_toDestinationAsset_filesCopied_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) masterThumbnailFileURLIfLocal];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)_copyFilesFromSourceAsset:(id)a3 toDestinationAsset:(id)a4 objectMap:(id)a5 filesCopied:(id)a6 error:(id *)a7
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v61 = a4;
  id v12 = a5;
  id v62 = a6;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__79963;
  v80 = __Block_byref_object_dispose__79964;
  id v81 = 0;
  v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v14 = [v11 photoLibrary];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __99__PLInterLibraryTransfer__copyFilesFromSourceAsset_toDestinationAsset_objectMap_filesCopied_error___block_invoke;
  v71[3] = &unk_1E5875368;
  v75 = &v76;
  id v59 = v11;
  id v72 = v59;
  id v58 = v12;
  id v73 = v58;
  id v64 = v13;
  id v74 = v64;
  [v14 performBlockAndWait:v71];

  [v61 modernResources];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v90 count:16];
  if (!v15) {
    goto LABEL_31;
  }
  uint64_t v16 = *(void *)v68;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v68 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      uint64_t v19 = [v64 objectForKey:v18];
      uint64_t v20 = [v18 fileURL];
      uint64_t v21 = v20;
      if (v19) {
        BOOL v22 = v20 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        if (!(v19 | v20))
        {
          uint64_t v25 = PLInterLibraryTransferGetLog();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_29;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v85 = (uint64_t)v18;
          id v27 = v25;
          os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
          id v29 = "skipping resource: both source and dest file URLs are nil for %@";
          uint32_t v30 = 12;
          goto LABEL_22;
        }
        if (!v20
          || ([(PLInterLibraryTransfer *)self options],
              uint64_t v23 = objc_claimAutoreleasedReturnValue(),
              int v24 = [v23 ignoreMissingSourceFileURLs],
              v23,
              !v24))
        {
          v46 = PLInterLibraryTransferGetLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            uint64_t v47 = v77[5];
            *(_DWORD *)buf = 138543874;
            uint64_t v85 = v47;
            __int16 v86 = 2112;
            uint64_t v87 = v19;
            __int16 v88 = 2112;
            v89 = v21;
            _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "copy file URL missing for asset %{public}@: source %@ dest %@", buf, 0x20u);
          }

          __int16 v48 = @"destination";
          if (!v19) {
            __int16 v48 = @"source";
          }
          uint64_t v25 = [NSString stringWithFormat:@"%@ file URL missing for asset %@", v48, v77[5], v58];
          id v49 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v82 = *MEMORY[0x1E4F28228];
          v83 = v25;
          __int16 v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          id v51 = [v49 errorWithDomain:*MEMORY[0x1E4F8C500] code:70002 userInfo:v50];
          uint64_t v52 = v51;
          if (a7) {
            *a7 = v51;
          }

          goto LABEL_49;
        }
        uint64_t v25 = PLInterLibraryTransferGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = v77[5];
          *(_DWORD *)buf = 138543618;
          uint64_t v85 = v26;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v21;
          id v27 = v25;
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          id v29 = "ignoring sourceFileURL missing for asset %{public}@, dest %@";
          uint32_t v30 = 22;
LABEL_22:
          _os_log_impl(&dword_19B3C7000, v27, v28, v29, buf, v30);
        }
      }
      else
      {
        id v66 = 0;
        BOOL v31 = [(PLInterLibraryTransfer *)self _copyFileFrom:v19 to:v20 error:&v66];
        uint64_t v32 = v66;
        uint64_t v25 = v32;
        if (v31)
        {
          [v62 addObject:v21];
          if ([v18 copyPurgeabilityFromFileURL:v19]) {
            goto LABEL_29;
          }
          BOOL v33 = PLInterLibraryTransferGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = [v18 fileURL];
            uint64_t v35 = [v34 path];
            *(_DWORD *)buf = 138412290;
            uint64_t v85 = (uint64_t)v35;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Failed to update purgeability of resource at %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v36 = [(PLInterLibraryTransfer *)self options];
          if (![v36 ignoreMissingSourceFiles])
          {

LABEL_45:
            id v53 = PLInterLibraryTransferGetLog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v85 = v19;
              __int16 v86 = 2112;
              uint64_t v87 = (uint64_t)v21;
              __int16 v88 = 2112;
              v89 = v25;
              _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "copy file from %@ to %@ failed: %@", buf, 0x20u);
            }

            if (a7) {
              *a7 = v25;
            }
LABEL_49:

            goto LABEL_50;
          }
          int HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();

          if (!HasDomainAndCode) {
            goto LABEL_45;
          }
          uint64_t v38 = PLInterLibraryTransferGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            uint64_t v39 = v77[5];
            *(_DWORD *)buf = 138543618;
            uint64_t v85 = v39;
            __int16 v86 = 2112;
            uint64_t v87 = v19;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_INFO, "      skipped missing source file for asset %{public}@ URL: %@", buf, 0x16u);
          }

          BOOL v33 = v25;
          uint64_t v25 = 0;
        }
      }
LABEL_29:
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v90 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_31:

  id v65 = 0;
  BOOL v40 = [(PLInterLibraryTransfer *)self _copyMasterThumbnailFrom:v59 toDestinationAsset:v61 filesCopied:v62 error:&v65];
  id v41 = v65;
  v42 = v41;
  if (a7) {
    *a7 = v41;
  }

  if (v40)
  {
    [v61 persistMetadataToFilesystem];
    id v43 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = v77[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v85 = v44;
      _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEBUG, "DONE  copying files from source asset %{public}@", buf, 0xCu);
    }
    BOOL v45 = 1;
  }
  else
  {
LABEL_50:
    id v43 = PLInterLibraryTransferGetLog();
    BOOL v54 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    id v55 = a7;
    if (v54)
    {
      uint64_t v56 = v77[5];
      if (a7) {
        id v55 = *a7;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v85 = v56;
      __int16 v86 = 2112;
      uint64_t v87 = (uint64_t)v55;
      _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "ERROR copying files from source asset %{public}@ %@", buf, 0x16u);
    }
    BOOL v45 = 0;
  }

  _Block_object_dispose(&v76, 8);
  return v45;
}

void __99__PLInterLibraryTransfer__copyFilesFromSourceAsset_toDestinationAsset_objectMap_filesCopied_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "BEGIN copying files from source asset %{public}@", buf, 0xCu);
  }

  id v7 = [*(id *)(a1 + 32) modernResources];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 fileURL];
        if (v13)
        {
          id v14 = [*(id *)(a1 + 40) objectForKey:v12];
          [*(id *)(a1 + 48) setObject:v13 forKey:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_setAttributes:(id)a3 onObject:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [v5 objectForKey:v11];
        if (v12) {
          [v6 setValue:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_setRelationship:(id)a3 origin:(id)a4 target:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  int v9 = [v13 isToMany];
  uint64_t v10 = [v13 name];
  if (v9)
  {
    uint64_t v11 = [v7 valueForKey:v10];

    if (v11)
    {
      [v11 addObject:v8];
      uint64_t v10 = v11;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
      id v12 = [v13 name];
      [v7 setValue:v10 forKey:v12];
    }
  }
  else
  {
    [v7 setValue:v8 forKey:v10];
  }
}

- (void)_copyRelationship:(id)a3 fromObject:(id)a4 toObject:(id)a5 inLibrary:(id)a6 objectMap:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v42 = a4;
  id v51 = a5;
  id v44 = a6;
  id v50 = a7;
  id v43 = v12;
  BOOL v13 = [(PLInterLibraryTransfer *)self _shouldSkipRelationship:v12];
  long long v14 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    long long v15 = @"BEGIN";
    if (v13) {
      long long v15 = @" SKIP";
    }
    id obj = v15;
    uint64_t v47 = [v43 name];
    __int16 v48 = [v43 inverseRelationship];
    if ([v48 isToMany]) {
      long long v16 = @"many";
    }
    else {
      long long v16 = @"1";
    }
    if ([v43 isToMany]) {
      long long v17 = @"many";
    }
    else {
      long long v17 = @"1";
    }
    uint64_t v18 = [v43 destinationEntity];
    uint64_t v19 = [v18 name];
    uint64_t v20 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v42];
    uint64_t v21 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v51];
    *(_DWORD *)buf = 138544898;
    *(void *)&uint8_t buf[4] = obj;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2114;
    id v72 = (uint64_t (*)(uint64_t, uint64_t))v16;
    *(_WORD *)id v73 = 2114;
    *(void *)&v73[2] = v17;
    *(_WORD *)&v73[10] = 2114;
    *(void *)&v73[12] = v19;
    __int16 v74 = 2112;
    v75 = v20;
    __int16 v76 = 2112;
    v77 = v21;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ copying relationship %{public}@ (%{public}@:%{public}@ %{public}@) from source %@ to dest %@", buf, 0x48u);
  }
  if (!v13)
  {
    uint64_t v64 = 0;
    id v65 = &v64;
    uint64_t v66 = 0x3032000000;
    long long v67 = __Block_byref_object_copy__79963;
    long long v68 = __Block_byref_object_dispose__79964;
    id v69 = 0;
    uint64_t v22 = [v42 managedObjectContext];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke;
    v60[3] = &unk_1E5875340;
    id v23 = v42;
    id v61 = v23;
    id v24 = v43;
    id v62 = v24;
    v63 = &v64;
    [v22 performBlockAndWait:v60];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obja = (id)v65[5];
    uint64_t v25 = [obja countByEnumeratingWithState:&v56 objects:v70 count:16];
    if (v25)
    {
      uint64_t v49 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v57 != v49) {
            objc_enumerationMutation(obja);
          }
          uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v72 = __Block_byref_object_copy__79963;
          *(void *)id v73 = __Block_byref_object_dispose__79964;
          *(void *)&v73[8] = 0;
          os_log_type_t v28 = [v23 managedObjectContext];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke_117;
          v52[3] = &unk_1E5875340;
          id v55 = buf;
          id v53 = v23;
          uint64_t v54 = v27;
          [v28 performBlockAndWait:v52];

          id v29 = [v50 objectForKey:*(void *)(*(void *)&buf[8] + 40)];
          if (v29) {
            goto LABEL_22;
          }
          if ([v24 isToMany])
          {
            uint32_t v30 = 0;
          }
          else
          {
            BOOL v31 = [v24 name];
            uint32_t v30 = [v51 valueForKey:v31];
          }
          id v29 = [(PLInterLibraryTransfer *)self _copyObject:*(void *)(*(void *)&buf[8] + 40) toDestinationObject:v30 toLibrary:v44 objectMap:v50];

          if (v29)
          {
LABEL_22:
            [(PLInterLibraryTransfer *)self _setRelationship:v24 origin:v51 target:v29];
            uint64_t v32 = [v24 inverseRelationship];
            [(PLInterLibraryTransfer *)self _setRelationship:v32 origin:v29 target:v51];
          }
          _Block_object_dispose(buf, 8);
        }
        uint64_t v25 = [obja countByEnumeratingWithState:&v56 objects:v70 count:16];
      }
      while (v25);
    }

    BOOL v33 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = [v24 name];
      uint64_t v35 = [v24 inverseRelationship];
      uint64_t v36 = @"many";
      if ([v35 isToMany]) {
        id v37 = @"many";
      }
      else {
        id v37 = @"1";
      }
      if (![v24 isToMany]) {
        uint64_t v36 = @"1";
      }
      uint64_t v38 = [v24 destinationEntity];
      uint64_t v39 = [v38 name];
      id v40 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v23];
      id v41 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v51];
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2114;
      id v72 = (uint64_t (*)(uint64_t, uint64_t))v36;
      *(_WORD *)id v73 = 2114;
      *(void *)&v73[2] = v39;
      *(_WORD *)&v73[10] = 2112;
      *(void *)&v73[12] = v40;
      __int16 v74 = 2112;
      v75 = v41;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEBUG, "DONE  copying relationship %{public}@ (%{public}@:%{public}@ %{public}@) from source %@ to dest %@", buf, 0x3Eu);
    }
    _Block_object_dispose(&v64, 8);
  }
}

void __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) name];
  v4 = [v2 valueForKey:v3];

  if ([*(id *)(a1 + 40) isToMany])
  {
    id v5 = [v4 allObjects];
    uint64_t v6 = [v5 valueForKey:@"objectID"];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v5 = [v4 objectID];
    v17[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

LABEL_6:
  int v9 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [*(id *)(a1 + 40) destinationEntity];
    uint64_t v11 = [v10 name];
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    int v13 = 138543618;
    long long v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = v12;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "        %{public}@: %tu", (uint8_t *)&v13, 0x16u);
  }
}

void __84__PLInterLibraryTransfer__copyRelationship_fromObject_toObject_inLibrary_objectMap___block_invoke_117(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v2 = [v5 objectWithID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_shouldSkipRelationship:(id)a3
{
  id v5 = a3;
  int v6 = [v5 isToMany];
  if (v6)
  {
    uint64_t v3 = [v5 inverseRelationship];
    if ([v3 isToMany])
    {
      char v7 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  id v8 = [(PLInterLibraryTransfer *)self options];
  int v9 = [v8 excludedEntityNames];
  uint64_t v10 = [v5 destinationEntity];
  uint64_t v11 = [v10 name];
  char v7 = [v9 containsObject:v11];

  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)_createNewObjectWithEntity:(id)a3 attributes:(id)a4 inLibrary:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v8 name];
    int v19 = 138543362;
    uint64_t v20 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "BEGIN creating new object with entity name %{public}@", (uint8_t *)&v19, 0xCu);
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1C108]);
  long long v14 = [v9 managedObjectContext];

  __int16 v15 = (void *)[v13 initWithEntity:v8 insertIntoManagedObjectContext:v14];
  [(PLInterLibraryTransfer *)self _setAttributes:v10 onObject:v15];

  uint64_t v16 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v17 = [v8 name];
    int v19 = 138543618;
    uint64_t v20 = v17;
    __int16 v21 = 2048;
    uint64_t v22 = v15;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "DONE  creating new object with entity name %{public}@: %p", (uint8_t *)&v19, 0x16u);
  }
  return v15;
}

- (id)_copyObject:(id)a3 toDestinationObject:(id)a4 toLibrary:(id)a5 objectMap:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v10];
    uint64_t v16 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v11];
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v15;
    __int16 v37 = 2114;
    uint64_t v38 = v16;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "BEGIN copying source obj %{public}@ to dest %{public}@", buf, 0x16u);
  }
  long long v17 = [(PLInterLibraryTransfer *)self _sourceAttributesFromObject:v10];
  uint64_t v18 = (void *)MEMORY[0x1E4F1C0A8];
  int v19 = [v10 entity];
  uint64_t v20 = [v19 name];
  __int16 v21 = [v12 managedObjectContext];
  uint64_t v22 = [v18 entityForName:v20 inManagedObjectContext:v21];

  if (v11)
  {
    [(PLInterLibraryTransfer *)self _setAttributes:v17 onObject:v11];
LABEL_6:
    [v13 setObject:v11 forKey:v10];
    uint64_t v23 = [v10 entity];
    id v24 = [v23 relationshipsByName];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __78__PLInterLibraryTransfer__copyObject_toDestinationObject_toLibrary_objectMap___block_invoke;
    v30[3] = &unk_1E586FCC8;
    v30[4] = self;
    id v31 = v10;
    id v25 = v11;
    id v32 = v25;
    id v33 = v12;
    id v34 = v13;
    [v24 enumerateKeysAndObjectsUsingBlock:v30];

    goto LABEL_7;
  }
  id v11 = [(PLInterLibraryTransfer *)self _createNewObjectWithEntity:v22 attributes:v17 inLibrary:v12];
  if (v11) {
    goto LABEL_6;
  }
  id v25 = 0;
LABEL_7:
  uint64_t v26 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v10];
    os_log_type_t v28 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), v25];
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v27;
    __int16 v37 = 2114;
    uint64_t v38 = v28;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "DONE  copying source obj %{public}@ to dest %{public}@", buf, 0x16u);
  }
  return v25;
}

uint64_t __78__PLInterLibraryTransfer__copyObject_toDestinationObject_toLibrary_objectMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _copyRelationship:a3 fromObject:*(void *)(a1 + 40) toObject:*(void *)(a1 + 48) inLibrary:*(void *)(a1 + 56) objectMap:*(void *)(a1 + 64)];
}

- (id)_sourceAttributesFromObject:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  int v6 = [v4 managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke;
  v12[3] = &unk_1E5873A50;
  id v13 = v4;
  long long v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [v6 performBlockAndWait:v12];

  id v9 = v15;
  id v10 = v7;

  return v10;
}

void __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entity];
  uint64_t v3 = [v2 attributesByName];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke_2;
  v5[3] = &unk_1E586FCA0;
  id v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __54__PLInterLibraryTransfer__sourceAttributesFromObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) options];
  id v4 = [v3 excludedAttributeNames];
  char v5 = [v4 containsObject:v8];

  if ((v5 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) valueForKey:v8];
    [v6 setObject:v7 forKey:v8];
  }
}

- (BOOL)_shouldSkipTransferWithSourceAsset:(id)a3 destinationAsset:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7
    || ([(PLInterLibraryTransfer *)self options],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 updateExistingObjects],
        v8,
        (v9 & 1) != 0))
  {
    *(void *)id v62 = 0;
    v63 = v62;
    uint64_t v64 = 0x3032000000;
    id v65 = __Block_byref_object_copy__79963;
    uint64_t v66 = __Block_byref_object_dispose__79964;
    id v67 = 0;
    uint64_t v58 = 0;
    long long v59 = &v58;
    uint64_t v60 = 0x2020000000;
    __int16 v61 = 0;
    uint64_t v52 = 0;
    id v53 = &v52;
    uint64_t v54 = 0x3032000000;
    id v55 = __Block_byref_object_copy__79963;
    long long v56 = __Block_byref_object_dispose__79964;
    id v57 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x2020000000;
    __int16 v51 = 0;
    id v10 = [v6 photoLibrary];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke;
    v42[3] = &unk_1E5874340;
    id v44 = &v52;
    id v43 = v6;
    BOOL v45 = v62;
    v46 = &v58;
    uint64_t v47 = &v48;
    [v10 performBlockAndWait:v42];

    if (*((_WORD *)v49 + 12) != 3)
    {
      long long v14 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        uint64_t v15 = v53[5];
        int v16 = *((unsigned __int16 *)v49 + 12);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v16;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = 3;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_FAULT, "Skipping sync of asset %{public}@ because bundleScope=%hu but only %hu is supported.", buf, 0x18u);
      }

      goto LABEL_13;
    }
    if (!v7)
    {
LABEL_19:
      BOOL v17 = 0;
      goto LABEL_20;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v74 = __Block_byref_object_copy__79963;
    v75 = __Block_byref_object_dispose__79964;
    id v76 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2020000000;
    __int16 v41 = 0;
    id v11 = [v7 photoLibrary];
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    id v33 = __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke_94;
    id v34 = &unk_1E5875A90;
    uint64_t v36 = buf;
    id v35 = v7;
    __int16 v37 = &v38;
    [v11 performBlockAndWait:&v31];

    id v12 = (void *)*((void *)v63 + 5);
    if (v12 && *(void *)(*(void *)&buf[8] + 40) && objc_msgSend(v12, "compare:", v31, v32, v33, v34) != 1)
    {
      __int16 v21 = PLInterLibraryTransferGetLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_27:

        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(buf, 8);

LABEL_13:
        BOOL v17 = 1;
LABEL_20:

        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);

        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(v62, 8);

        goto LABEL_21;
      }
      uint64_t v28 = v53[5];
      uint64_t v29 = *((void *)v63 + 5);
      uint64_t v30 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)long long v68 = 138543874;
      uint64_t v69 = v28;
      __int16 v70 = 2114;
      *(void *)v71 = v29;
      *(_WORD *)&v71[8] = 2114;
      uint64_t v72 = v30;
      id v25 = "Skipping sync of asset %{public}@ because sourceModDate=%{public}@ and destModDate=%{public}@";
      uint64_t v26 = v21;
      uint32_t v27 = 32;
    }
    else
    {
      id v13 = [(PLInterLibraryTransfer *)self options];
      if ([v13 allowSavedAssetTypeChanges])
      {

LABEL_18:
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_19;
      }
      BOOL v19 = *((unsigned __int16 *)v59 + 12) == *((unsigned __int16 *)v39 + 12);

      if (v19) {
        goto LABEL_18;
      }
      __int16 v21 = PLInterLibraryTransferGetLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_27;
      }
      uint64_t v22 = v53[5];
      int v23 = *((__int16 *)v59 + 12);
      int v24 = *((__int16 *)v39 + 12);
      *(_DWORD *)long long v68 = 138543874;
      uint64_t v69 = v22;
      __int16 v70 = 1024;
      *(_DWORD *)v71 = v23;
      *(_WORD *)&void v71[4] = 1024;
      *(_DWORD *)&v71[6] = v24;
      id v25 = "Skipping sync of asset %{public}@ because sourceSavedAssetType=%hd and destSavedAssetType=%hd";
      uint64_t v26 = v21;
      uint32_t v27 = 24;
    }
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, v25, v68, v27);
    goto LABEL_27;
  }
  uint64_t v18 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v62 = 0;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "updateExistingObjects is NO and destination asset already exists", v62, 2u);
  }

  BOOL v17 = 1;
LABEL_21:

  return v17;
}

uint64_t __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) modificationDate];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(_WORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) savedAssetType];
  uint64_t result = [*(id *)(a1 + 32) bundleScope];
  *(_WORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __78__PLInterLibraryTransfer__shouldSkipTransferWithSourceAsset_destinationAsset___block_invoke_94(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modificationDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1 + 32) savedAssetType];
  *(_WORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_dedupedDestinationAssetWithSourceAsset:(id)a3 destinationLibrary:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v26 = self;
  id v7 = [(PLInterLibraryTransfer *)self options];
  id v8 = [v7 keysForDeDupe];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v14 = objc_msgSend(v6, "photoLibrary", v25);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __85__PLInterLibraryTransfer__dedupedDestinationAssetWithSourceAsset_destinationLibrary___block_invoke;
        v28[3] = &unk_1E5873A50;
        id v29 = v6;
        uint64_t v30 = v13;
        id v31 = v27;
        [v14 performBlockAndWait:v28];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v10);
  }

  uint64_t v15 = v25;
  if ([v27 count])
  {
    int v16 = 0;
    while (1)
    {
      BOOL v17 = v16;
      uint64_t v18 = +[PLManagedAsset entityName];
      BOOL v19 = [(PLInterLibraryTransfer *)v26 options];
      uint64_t v20 = [v19 keysForDeDupe];
      int v16 = [(PLInterLibraryTransfer *)v26 _loadObjectWithEntityName:v18 withValues:v27 forKeyPaths:v20 fromLibrary:v15 error:0];

      if (!v16) {
        break;
      }
      __int16 v21 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = [(PLInterLibraryTransfer *)v26 options];
        int v23 = [v22 keysForDeDupe];
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v23;
        __int16 v38 = 2114;
        id v39 = v27;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "Found existing asset with %{public}@ %{public}@ but different uuid", buf, 0x16u);
      }
      if (![(PLInterLibraryTransfer *)v26 _deleteAsset:v16])
      {

        break;
      }
    }
  }

  return 0;
}

void __85__PLInterLibraryTransfer__dedupedDestinationAssetWithSourceAsset_destinationLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueForKeyPath:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 48);
  id v5 = (id)v2;
  if (v2)
  {
    [v3 addObject:v2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    [v3 addObject:v4];
  }
}

- (BOOL)_deleteAsset:(id)a3
{
  id v5 = a3;
  id v6 = [v5 photoLibrary];

  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 470, @"Invalid parameter not satisfying: %@", @"asset.photoLibrary" object file lineNumber description];
  }
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [v5 photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__PLInterLibraryTransfer__deleteAsset___block_invoke;
  v12[3] = &unk_1E5875340;
  void v12[4] = self;
  id v8 = v5;
  id v13 = v8;
  long long v14 = &v15;
  [v7 performTransactionAndWait:v12];

  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __39__PLInterLibraryTransfer__deleteAsset___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) options];
  [v2 allowDeleteOfSavedAssetTypes];
  [*(id *)(a1 + 40) savedAssetType];
  int v3 = PLValidatedSavedAssetTypeApplies();

  if (v3)
  {
    id v4 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 40) uuid];
      id v6 = [*(id *)(a1 + 40) photoLibrary];
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Deleting asset %{public}@ from %@", (uint8_t *)&v9, 0x16u);
    }
    id v7 = *(void **)(a1 + 40);
    id v8 = +[PLAssetTransactionReason transactionReason:@"InterLibraryTransfer: Delete existing duplicate asset"];
    [v7 deleteWithReason:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)_loadObjectWithEntityName:(id)a3 withValues:(id)a4 forKeyPaths:(id)a5 fromLibrary:(id)a6 error:(id *)a7
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v37 = 0;
  __int16 v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__79963;
  uint64_t v41 = __Block_byref_object_dispose__79964;
  id v42 = 0;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  uint64_t v30 = __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke;
  id v31 = &unk_1E5875BD0;
  id v15 = v12;
  id v32 = v15;
  id v16 = v11;
  id v33 = v16;
  id v17 = v13;
  id v34 = v17;
  id v18 = v14;
  id v35 = v18;
  uint64_t v36 = &v37;
  [v18 performBlockAndWait:&v28];
  BOOL v19 = (void *)v38[5];
  if (a7 && !v19)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Unable to load %@ with %@ %@", v16, v17, v15, v28, v29, v30, v31, v32, v33, v34];
    __int16 v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    v46[0] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    int v23 = [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v22];

    id v24 = v23;
    *a7 = v24;
    id v25 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v24;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    BOOL v19 = (void *)v38[5];
  }
  id v26 = v19;

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
    int v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 40)];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke_2;
    v15[3] = &unk_1E586FC78;
    id v16 = *(id *)(a1 + 32);
    id v6 = v4;
    id v17 = v6;
    [v5 enumerateObjectsUsingBlock:v15];
    id v7 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
    [v3 setPredicate:v7];
    [v3 setFetchLimit:1];
    id v8 = [*(id *)(a1 + 56) managedObjectContext];
    id v14 = 0;
    int v9 = [v8 executeFetchRequest:v3 error:&v14];
    id v10 = v14;

    if ([v9 count])
    {
      uint64_t v11 = [v9 objectAtIndex:0];
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
}

void __93__PLInterLibraryTransfer__loadObjectWithEntityName_withValues_forKeyPaths_fromLibrary_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", v6, v8];

  [*(id *)(a1 + 40) addObject:v7];
}

- (id)_loadAssetWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PLManagedAsset entityName];
  v16[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = @"uuid";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  id v13 = [(PLInterLibraryTransfer *)self _loadObjectWithEntityName:v10 withValues:v11 forKeyPaths:v12 fromLibrary:v8 error:a5];

  return v13;
}

- (id)_loadPersonWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PLPerson entityName];
  v16[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = @"personUUID";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  id v13 = [(PLInterLibraryTransfer *)self _loadObjectWithEntityName:v10 withValues:v11 forKeyPaths:v12 fromLibrary:v8 error:a5];

  return v13;
}

- (id)_loadFaceCropWithUuid:(id)a3 fromLibrary:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = +[PLFaceCrop entityName];
  v16[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = @"uuid";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  id v13 = [(PLInterLibraryTransfer *)self _loadObjectWithEntityName:v10 withValues:v11 forKeyPaths:v12 fromLibrary:v8 error:a5];

  return v13;
}

- (id)_loadDestinationLibraryWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v5 setAutomaticallyMergesContext:0];
  [(PLPhotoLibraryOptions *)v5 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v5 setRequiredState:7];
  id v6 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(PLInterLibraryTransfer *)self destinationBundle];
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Loading destination library from bundle %@", buf, 0xCu);
  }
  id v8 = [(PLInterLibraryTransfer *)self destinationBundle];
  id v13 = 0;
  id v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLInterLibraryTransfer _loadDestinationLibraryWithError:]", v8, v5, &v13);
  id v10 = v13;

  if (!v9)
  {
    uint64_t v11 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Inter-library transfer failed. Unable to load destination library: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v10;
    }
  }

  return v9;
}

- (id)_loadSourceLibraryWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v5 setAutomaticallyMergesContext:0];
  [(PLPhotoLibraryOptions *)v5 setRefreshesAfterSave:0];
  [(PLPhotoLibraryOptions *)v5 setRequiredState:7];
  id v6 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(PLInterLibraryTransfer *)self sourceBundle];
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "Loading source library from bundle %@", buf, 0xCu);
  }
  id v8 = [(PLInterLibraryTransfer *)self sourceBundle];
  id v13 = 0;
  id v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLInterLibraryTransfer _loadSourceLibraryWithError:]", v8, v5, &v13);
  id v10 = v13;

  if (!v9)
  {
    uint64_t v11 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Inter-library transfer failed. Unable to load source library: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v10;
    }
  }

  return v9;
}

- (BOOL)transferFaceCropWithUuid:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__79963;
  uint64_t v49 = __Block_byref_object_dispose__79964;
  id v50 = 0;
  id obj = 0;
  BOOL v7 = [(PLInterLibraryTransfer *)self _loadLibrariesWithError:&obj];
  objc_storeStrong(&v50, obj);
  if (v7)
  {
    sourceLibrary = self->_sourceLibrary;
    id v9 = (id *)(v46 + 5);
    id v43 = (id)v46[5];
    id v10 = [(PLInterLibraryTransfer *)self _loadFaceCropWithUuid:v6 fromLibrary:sourceLibrary error:&v43];
    objc_storeStrong(v9, v43);
    if (!v10)
    {
      id v13 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Load source face crop failed", v37, 2u);
      }

      if (a4) {
        *a4 = (id) v46[5];
      }
      BOOL v12 = *((unsigned char *)v52 + 24) != 0;
      goto LABEL_29;
    }
    *(void *)uint64_t v37 = 0;
    __int16 v38 = v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__79963;
    uint64_t v41 = __Block_byref_object_dispose__79964;
    id v42 = [(PLInterLibraryTransfer *)self _loadFaceCropWithUuid:v6 fromLibrary:self->_destinationLibrary error:0];
    if (*((void *)v38 + 5))
    {
      uint64_t v11 = PLInterLibraryTransferGetLog();
      BOOL v12 = 1;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v56 = v6;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Skipping transfer of face crop %{public}@ because destination already exists", buf, 0xCu);
      }
      goto LABEL_28;
    }
    id v14 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v56 = v6;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "transferFaceCropWithUuid:%{public}@ begin", buf, 0xCu);
    }

    id v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke;
    v29[3] = &unk_1E586FC50;
    id v16 = v6;
    id v30 = v16;
    id v31 = self;
    id v34 = v37;
    id v32 = v10;
    uint64_t v11 = v15;
    id v33 = v11;
    id v35 = &v51;
    uint64_t v36 = &v45;
    id v17 = (void *)MEMORY[0x19F38D650](v29);
    id v18 = [(PLInterLibraryTransfer *)self options];
    int v19 = [v18 skipContextSave];

    destinationLibrary = self->_destinationLibrary;
    if (v19) {
      [(PLPhotoLibrary *)destinationLibrary performBlockAndWait:v17];
    }
    else {
      [(PLPhotoLibrary *)destinationLibrary performTransactionAndWait:v17];
    }
    if (*((unsigned char *)v52 + 24))
    {
      __int16 v21 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v56 = v16;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Verifying face crop transfer for uuid %{public}@", buf, 0xCu);
      }

      uint64_t v22 = self->_destinationLibrary;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_63;
      v26[3] = &unk_1E5875340;
      uint64_t v28 = &v51;
      v26[4] = self;
      id v27 = v16;
      [(PLPhotoLibrary *)v22 performBlockAndWait:v26];

      int v23 = *((unsigned __int8 *)v52 + 24);
      id v24 = (id)v46[5];
      if (v23 || !a4) {
        goto LABEL_27;
      }
    }
    else
    {
      id v24 = (id)v46[5];
      if (!a4)
      {
LABEL_27:

        BOOL v12 = *((unsigned char *)v52 + 24) != 0;
LABEL_28:

        _Block_object_dispose(v37, 8);
LABEL_29:

        goto LABEL_30;
      }
    }
    id v24 = v24;
    *a4 = v24;
    goto LABEL_27;
  }
  if (a4) {
    *a4 = (id) v46[5];
  }
  BOOL v12 = *((unsigned char *)v52 + 24) != 0;
LABEL_30:
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v12;
}

void __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke(uint64_t a1)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Starting copyObject phase for face crop %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:v4];

  uint64_t v5 = [*(id *)(a1 + 40) _copyObject:*(void *)(a1 + 48) toDestinationObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) toLibrary:*(void *)(*(void *)(a1 + 40) + 32) objectMap:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28228];
    v57[0] = @"_copyObject failed for face crop";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    uint64_t v10 = [v8 errorWithDomain:*MEMORY[0x1E4F8C500] code:70001 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    BOOL v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Finished copyObject phase for face crop %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__79963;
  char v54 = __Block_byref_object_dispose__79964;
  id v55 = 0;
  id v15 = *(void **)(*(void *)(a1 + 40) + 24);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_56;
  v42[3] = &unk_1E5875E68;
  id v43 = *(id *)(a1 + 48);
  p_long long buf = &buf;
  [v15 performBlockAndWait:v42];
  uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
  id v17 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
  id v18 = +[PLPerson personWithUUID:v16 inManagedObjectContext:v17];

  if (v18)
  {
    int v19 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      __int16 v21 = [v18 personUUID];
      *(_DWORD *)uint64_t v47 = 138543618;
      uint64_t v48 = v20;
      __int16 v49 = 2114;
      id v50 = v21;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "transferFaceCropWithUuid:%{public}@ associating with person %{public}@", v47, 0x16u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setPerson:v18];
    uint64_t v22 = [*(id *)(*(void *)(a1 + 40) + 40) excludedEntityNames];
    int v23 = +[PLDetectedFace entityName];
    int v24 = [v22 containsObject:v23];

    if (v24)
    {
      id v25 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v47 = 138543362;
        uint64_t v48 = v26;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEBUG, "transferFaceCropWithUuid:%{public}@ marking face crop dirty", v47, 0xCu);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setState:0];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v27 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(void **)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v47 = 138543618;
      uint64_t v48 = v28;
      __int16 v49 = 2114;
      id v50 = v29;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "transferFaceCropWithUuid:%{public}@ no destPerson found with uuid %{public}@", v47, 0x16u);
    }

    id v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    id v31 = [NSString stringWithFormat:@"no destPerson found with uuid %@", *(void *)(*((void *)&buf + 1) + 40)];
    v46 = v31;
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    uint64_t v33 = [v30 errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v32];
    uint64_t v34 = *(void *)(*(void *)(a1 + 80) + 8);
    id v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;
  }
  uint64_t v36 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [v36 _validateSourceFaceCrop:*(void *)(a1 + 48) destinationFaceCrop:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  else
  {
    uint64_t v37 = [v36 options];
    char v38 = [v37 skipContextSave];

    if ((v38 & 1) == 0)
    {
      uint64_t v39 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v47 = 138543362;
        uint64_t v48 = v40;
        _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "transferFaceCropWithUuid:%{public}@ failed, rolling back destination library", v47, 0xCu);
      }

      uint64_t v41 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
      [v41 rollback];
    }
  }

  _Block_object_dispose(&buf, 8);
}

void __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_63(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = v2[4];
  id v8 = 0;
  uint64_t v5 = [v2 _loadFaceCropWithUuid:v3 fromLibrary:v4 error:&v8];
  id v6 = v8;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    BOOL v7 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Transfer verification failed with error: %@", buf, 0xCu);
    }
  }
}

void __57__PLInterLibraryTransfer_transferFaceCropWithUuid_error___block_invoke_56(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) person];
  uint64_t v2 = [v5 personUUID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)transferPersonWithUuid:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__79963;
  uint64_t v48 = __Block_byref_object_dispose__79964;
  id v49 = 0;
  id obj = 0;
  BOOL v7 = [(PLInterLibraryTransfer *)self _loadLibrariesWithError:&obj];
  objc_storeStrong(&v49, obj);
  if (v7)
  {
    sourceLibrary = self->_sourceLibrary;
    id v9 = (id *)(v45 + 5);
    id v42 = (id)v45[5];
    id v10 = [(PLInterLibraryTransfer *)self _loadPersonWithUuid:v6 fromLibrary:sourceLibrary error:&v42];
    objc_storeStrong(v9, v42);
    if (v10)
    {
      *(void *)uint64_t v36 = 0;
      uint64_t v37 = v36;
      uint64_t v38 = 0x3032000000;
      uint64_t v39 = __Block_byref_object_copy__79963;
      uint64_t v40 = __Block_byref_object_dispose__79964;
      id v41 = [(PLInterLibraryTransfer *)self _loadPersonWithUuid:v6 fromLibrary:self->_destinationLibrary error:0];
      uint64_t v11 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v55 = v6;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "transferPersonWithUuid:%{public}@ begin", buf, 0xCu);
      }

      BOOL v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke;
      v28[3] = &unk_1E586FC50;
      id v13 = v6;
      id v29 = v13;
      id v30 = self;
      uint64_t v33 = v36;
      id v31 = v10;
      id v14 = v12;
      id v32 = v14;
      uint64_t v34 = &v50;
      id v35 = &v44;
      id v15 = (void *)MEMORY[0x19F38D650](v28);
      uint64_t v16 = [(PLInterLibraryTransfer *)self options];
      int v17 = [v16 skipContextSave];

      destinationLibrary = self->_destinationLibrary;
      if (v17) {
        [(PLPhotoLibrary *)destinationLibrary performBlockAndWait:v15];
      }
      else {
        [(PLPhotoLibrary *)destinationLibrary performTransactionAndWait:v15];
      }
      __int16 v21 = v51;
      if (!*((unsigned char *)v51 + 24)) {
        goto LABEL_21;
      }
      uint64_t v22 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        id v55 = v13;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "Verifying person transfer for uuid %{public}@", buf, 0xCu);
      }

      int v23 = self->_destinationLibrary;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_52;
      v25[3] = &unk_1E5875340;
      id v27 = &v50;
      v25[4] = self;
      id v26 = v13;
      [(PLPhotoLibrary *)v23 performBlockAndWait:v25];

      __int16 v21 = v51;
      if (*((unsigned char *)v51 + 24))
      {
        int v19 = 1;
      }
      else
      {
LABEL_21:
        if (a4)
        {
          *a4 = (id) v45[5];
          __int16 v21 = v51;
        }
        int v19 = *((unsigned __int8 *)v21 + 24);
      }

      _Block_object_dispose(v36, 8);
    }
    else
    {
      uint64_t v20 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Load source person failed", v36, 2u);
      }

      if (a4) {
        *a4 = (id) v45[5];
      }
      int v19 = *((unsigned __int8 *)v51 + 24);
    }
  }
  else
  {
    if (a4) {
      *a4 = (id) v45[5];
    }
    int v19 = *((unsigned __int8 *)v51 + 24);
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v19 != 0;
}

void __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke(uint64_t a1)
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Starting copyObject phase for person %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:v4];

  uint64_t v5 = [*(id *)(a1 + 40) _copyObject:*(void *)(a1 + 48) toDestinationObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) toLibrary:*(void *)(*(void *)(a1 + 40) + 32) objectMap:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28228];
    v55[0] = @"_copyObject failed";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    uint64_t v10 = [v8 errorWithDomain:*MEMORY[0x1E4F8C500] code:70001 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    BOOL v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  id v13 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Finished copyObject phase for person %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) verifiedType] == -2)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v50 = 0x3032000000;
    uint64_t v51 = __Block_byref_object_copy__79963;
    uint64_t v52 = __Block_byref_object_dispose__79964;
    id v53 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__79963;
    id v41 = __Block_byref_object_dispose__79964;
    id v42 = 0;
    id v15 = *(void **)(*(void *)(a1 + 40) + 24);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_48;
    v33[3] = &unk_1E5875A90;
    p_long long buf = &buf;
    id v34 = *(id *)(a1 + 48);
    uint64_t v36 = &v37;
    [v15 performBlockAndWait:v33];
    uint64_t v16 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = v38[5];
      *(_DWORD *)uint64_t v45 = 138543618;
      uint64_t v46 = v17;
      __int16 v47 = 2114;
      uint64_t v48 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Person %{public}@ is a tombstone. Will copy merge target person %{public}@", v45, 0x16u);
    }

    uint64_t v19 = v38[5];
    if (v19)
    {
      uint64_t v20 = [*(id *)(a1 + 40) _loadPersonWithUuid:v19 fromLibrary:*(void *)(*(void *)(a1 + 40) + 32) error:0];
      __int16 v21 = (void *)[*(id *)(a1 + 40) _copyObject:*(void *)(*((void *)&buf + 1) + 40) toDestinationObject:v20 toLibrary:*(void *)(*(void *)(a1 + 40) + 32) objectMap:*(void *)(a1 + 56)];

      if (v21)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setMergeTargetPerson:v21];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v43 = *MEMORY[0x1E4F28228];
        uint64_t v44 = @"_copyObject failed for merge target person";
        int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F8C500] code:70001 userInfo:v23];
        uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
        id v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&buf, 8);
  }
  id v27 = *(void **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [v27 _validateSourcePerson:*(void *)(a1 + 48) destinationPerson:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  else
  {
    uint64_t v28 = [v27 options];
    char v29 = [v28 skipContextSave];

    if ((v29 & 1) == 0)
    {
      id v30 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "transferPersonWithUuid:%{public}@ failed, rolling back destination library asset", (uint8_t *)&buf, 0xCu);
      }

      id v32 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
      [v32 rollback];
    }
  }
}

void __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_52(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = v2[4];
  id v8 = 0;
  uint64_t v5 = [v2 _loadPersonWithUuid:v3 fromLibrary:v4 error:&v8];
  id v6 = v8;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    BOOL v7 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Transfer verification failed with error: %@", buf, 0xCu);
    }
  }
}

void __55__PLInterLibraryTransfer_transferPersonWithUuid_error___block_invoke_48(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mergeTargetPerson];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) personUUID];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)transferAssetWithUuid:(id)a3 error:(id *)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__79963;
  uint64_t v72 = __Block_byref_object_dispose__79964;
  id v73 = 0;
  id obj = 0;
  BOOL v6 = [(PLInterLibraryTransfer *)self _loadLibrariesWithError:&obj];
  objc_storeStrong(&v73, obj);
  if (v6)
  {
    [(PLInterLibraryTransfer *)self _initFileManager];
    sourceLibrary = self->_sourceLibrary;
    id v8 = (id *)(v69 + 5);
    id v66 = (id)v69[5];
    uint64_t v39 = [(PLInterLibraryTransfer *)self _loadAssetWithUuid:v41 fromLibrary:sourceLibrary error:&v66];
    objc_storeStrong(v8, v66);
    if (v39)
    {
      *(void *)long long buf = 0;
      __int16 v61 = buf;
      uint64_t v62 = 0x3032000000;
      v63 = __Block_byref_object_copy__79963;
      uint64_t v64 = __Block_byref_object_dispose__79964;
      id v65 = [(PLInterLibraryTransfer *)self _loadAssetWithUuid:v41 fromLibrary:self->_destinationLibrary error:0];
      uint64_t v9 = *((void *)v61 + 5);
      if (!v9)
      {
        uint64_t v10 = [(PLInterLibraryTransfer *)self _dedupedDestinationAssetWithSourceAsset:v39 destinationLibrary:self->_destinationLibrary];
        uint64_t v11 = (void *)*((void *)v61 + 5);
        *((void *)v61 + 5) = v10;

        uint64_t v9 = *((void *)v61 + 5);
      }
      if ([(PLInterLibraryTransfer *)self _shouldSkipTransferWithSourceAsset:v39 destinationAsset:v9])
      {
        BOOL v12 = 1;
      }
      else
      {
        uint64_t v14 = PLInterLibraryTransferGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v79 = 138543362;
          id v80 = v41;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "transferAssetWithUuid:%{public}@ begin", v79, 0xCu);
        }

        id v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke;
        v50[3] = &unk_1E586FC28;
        id v17 = v41;
        id v51 = v17;
        uint64_t v52 = self;
        uint64_t v56 = buf;
        id v53 = v39;
        id v35 = v15;
        id v54 = v35;
        uint64_t v57 = &v74;
        uint64_t v58 = &v68;
        SEL v59 = a2;
        id v37 = v16;
        id v55 = v37;
        uint64_t v38 = (void *)MEMORY[0x19F38D650](v50);
        uint64_t v18 = [(PLInterLibraryTransfer *)self options];
        int v19 = [v18 skipContextSave];

        destinationLibrary = self->_destinationLibrary;
        if (v19) {
          -[PLPhotoLibrary performBlockAndWait:](destinationLibrary, "performBlockAndWait:", v38, v35);
        }
        else {
          -[PLPhotoLibrary performTransactionAndWait:](destinationLibrary, "performTransactionAndWait:", v38, v35);
        }
        if (!*((unsigned char *)v75 + 24)) {
          goto LABEL_25;
        }
        __int16 v21 = PLInterLibraryTransferGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v79 = 138543362;
          id v80 = v17;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Verifying asset transfer for uuid %{public}@", v79, 0xCu);
        }

        uint64_t v22 = self->_destinationLibrary;
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke_47;
        v47[3] = &unk_1E5875340;
        id v49 = &v74;
        uint8_t v47[4] = self;
        id v48 = v17;
        [(PLPhotoLibrary *)v22 performBlockAndWait:v47];

        if (*((unsigned char *)v75 + 24))
        {
          BOOL v12 = 1;
        }
        else
        {
LABEL_25:
          int v23 = PLInterLibraryTransferGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = [v37 count];
            *(_DWORD *)v79 = 138543618;
            id v80 = v17;
            __int16 v81 = 2048;
            uint64_t v82 = v24;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "transferAssetWithUuid:%{public}@ failed, removing %tu copied files", v79, 0x16u);
          }

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v25 = v37;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v78 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v44 != v27) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                fileManager = self->_fileManager;
                id v42 = 0;
                BOOL v31 = [(NSFileManager *)fileManager removeItemAtURL:v29 error:&v42];
                id v32 = v42;
                if (!v31)
                {
                  uint64_t v33 = PLInterLibraryTransferGetLog();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v79 = 138412290;
                    id v80 = v32;
                    _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Remove file failed with error %@", v79, 0xCu);
                  }
                }
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v78 count:16];
            }
            while (v26);
          }

          if (a4) {
            *a4 = (id) v69[5];
          }
          BOOL v12 = *((unsigned char *)v75 + 24) != 0;
        }
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v13 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Load source asset failed", buf, 2u);
      }

      if (a4) {
        *a4 = (id) v69[5];
      }
      BOOL v12 = *((unsigned char *)v75 + 24) != 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = (id) v69[5];
    }
    BOOL v12 = *((unsigned char *)v75 + 24) != 0;
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v12;
}

void __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v37 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "Starting copyObject phase for asset %{public}@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
  +[PLMomentGenerationDataManager setManagedObjectContextMomentarilyBlessed:v4];

  uint64_t v5 = [*(id *)(a1 + 40) _copyObject:*(void *)(a1 + 48) toDestinationObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) toLibrary:*(void *)(*(void *)(a1 + 40) + 32) objectMap:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8C500];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    id v35 = @"_copyObject failed";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:70001 userInfo:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  uint64_t v14 = PLInterLibraryTransferGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v37 = v15;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Finished copyObject phase for asset %{public}@", buf, 0xCu);
  }

  uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 24) pathManager];
  if ((objc_msgSend(v16, "shouldUseFileIdentifierForBundleScope:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "bundleScope")) & 1) == 0)
  {

    goto LABEL_9;
  }
  id v17 = [*(id *)(*(void *)(a1 + 40) + 32) pathManager];
  char v18 = objc_msgSend(v17, "shouldUseFileIdentifierForBundleScope:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "bundleScope"));

  if ((v18 & 1) == 0)
  {
LABEL_9:
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 40) file:@"PLInterLibraryTransfer.m" lineNumber:138 description:@"Can only perform inter library transfer for asset that is located in a UBF based bundle scope in both source and destination library"];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    goto LABEL_15;
  }
  uint64_t v20 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 64);
  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v24 = *(void *)(a1 + 56);
  id v33 = 0;
  char v25 = [v20 _copyFilesFromSourceAsset:v21 toDestinationAsset:v23 objectMap:v24 filesCopied:v22 error:&v33];
  id v26 = v33;
  id v27 = v33;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v25;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v26);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    [*(id *)(a1 + 40) _validateSourceAsset:*(void *)(a1 + 48) destinationAsset:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [*(id *)(a1 + 40) _transferThumbnailsForSourceAsset:*(void *)(a1 + 48) toDestinationAsset:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) filesCopied:*(void *)(a1 + 64)];
  }
  else
  {
LABEL_15:
    uint64_t v28 = [*(id *)(a1 + 40) options];
    char v29 = [v28 skipContextSave];

    if ((v29 & 1) == 0)
    {
      id v30 = PLInterLibraryTransferGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v37 = v31;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "transferAssetWithUuid:%{public}@ failed, rolling back destination library asset", buf, 0xCu);
      }

      id v32 = [*(id *)(*(void *)(a1 + 40) + 32) managedObjectContext];
      [v32 rollback];
    }
  }
}

void __54__PLInterLibraryTransfer_transferAssetWithUuid_error___block_invoke_47(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = v2[4];
  id v8 = 0;
  uint64_t v5 = [v2 _loadAssetWithUuid:v3 fromLibrary:v4 error:&v8];
  id v6 = v8;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5 != 0;

  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    BOOL v7 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Transfer verification failed with error: %@", buf, 0xCu);
    }
  }
}

- (void)_initFileManager
{
  if (!self->_fileManager)
  {
    uint64_t v3 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    fileManager = self->_fileManager;
    self->_fileManager = v3;
  }
}

- (BOOL)_loadLibrariesWithError:(id *)a3
{
  if (self->_sourceLibrary && self->_destinationLibrary) {
    return 1;
  }
  id v15 = 0;
  id v6 = [(PLInterLibraryTransfer *)self _loadSourceLibraryWithError:&v15];
  id v7 = v15;
  sourceLibrary = self->_sourceLibrary;
  self->_sourceLibrary = v6;

  if (self->_sourceLibrary)
  {
    id v14 = v7;
    uint64_t v9 = [(PLInterLibraryTransfer *)self _loadDestinationLibraryWithError:&v14];
    id v10 = v14;

    p_destinationLibrary = &self->_destinationLibrary;
    destinationLibrary = self->_destinationLibrary;
    self->_destinationLibrary = v9;
    id v7 = v10;
  }
  else
  {
    p_destinationLibrary = &self->_destinationLibrary;
    destinationLibrary = self->_destinationLibrary;
    self->_destinationLibrary = 0;
  }

  if (self->_sourceLibrary && *p_destinationLibrary)
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v5;
}

- (PLInterLibraryTransfer)initWithSourceLibrary:(id)a3 destinationLibrary:(id)a4 options:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLInterLibraryTransfer;
  uint64_t v12 = [(PLInterLibraryTransfer *)&v16 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceLibrary, a3);
    objc_storeStrong((id *)&v13->_destinationLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    id v14 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Initialized inter-library transfer with sourceLibrary %@ destinationLibrary %@", buf, 0x16u);
    }
  }
  return v13;
}

- (PLInterLibraryTransfer)initWithSourceBundle:(id)a3 destinationBundle:(id)a4 options:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 skipContextSave])
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLInterLibraryTransfer.m", 45, @"Invalid parameter not satisfying: %@", @"options.skipContextSave == NO" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PLInterLibraryTransfer;
  id v13 = [(PLInterLibraryTransfer *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceBundle, a3);
    objc_storeStrong((id *)&v14->_destinationBundle, a4);
    objc_storeStrong((id *)&v14->_options, a5);
    id v15 = PLInterLibraryTransferGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Initialized inter-library transfer with sourceBundle %@ destinationBundle %@", buf, 0x16u);
    }
  }
  return v14;
}

@end