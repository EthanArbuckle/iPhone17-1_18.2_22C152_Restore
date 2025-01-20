@interface PLLockedResourceTransferRecovery
+ (BOOL)isStaleResourceURL:(id)a3 asset:(id)a4 resource:(id)a5 pathManager:(id)a6;
+ (BOOL)updateAssetPropertiesAndSaveForAsset:(id)a3 moveToDestinationScope:(unsigned __int16)a4 library:(id)a5 error:(id *)a6;
+ (id)assetDirectoryForAsset:(id)a3 bundleScope:(unsigned __int16)a4 pathManager:(id)a5;
+ (id)assetMainScopeDirectoryFromMarkerFilePathRelativeToBundle:(id)a3 pathManager:(id)a4;
+ (id)dcimDirectoryForAssetDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6;
+ (id)dcimFileURLForAsset:(id)a3 cplResourceType:(unint64_t)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 resourceType:(unsigned int)a7 utiString:(id)a8 bundleScope:(unsigned __int16)a9 pathManager:(id)a10;
+ (id)dcimFileURLForAsset:(id)a3 resource:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6;
+ (id)destinationURLForResource:(id)a3 asset:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6;
+ (id)dontImportMarkerFileURLForAsset:(id)a3 bundleScope:(unsigned __int16)a4 pathManager:(id)a5;
+ (id)lockedTransferRecoveryMarkerFileExtension;
+ (id)pathToResourceDirectoryForPhotoDirectoryType:(unsigned __int8)a3 fromMarkerFilePathRelativeToBundle:(id)a4 pathManager:(id)a5;
+ (unsigned)oppositeBundleScope:(unsigned __int16)a3;
+ (void)_validateAsset:(id)a3 pathManager:(id)a4;
+ (void)enumerateFilesInDirectoryWithType:(unsigned __int8)a3 forMarkerFilePathRelativeToBundle:(id)a4 pathManager:(id)a5 block:(id)a6;
+ (void)validateAssetWithUUID:(id)a3 inLibrary:(id)a4;
- (BOOL)recoverFromInProgressLockedTransferForImportAsset:(id)a3 pathManager:(id)a4;
- (NSURL)destinationDirectoryURL;
- (PLFileSystemImportAsset)transferAsset;
- (PLLockedResourceTransferRecovery)initWithTransferImportAsset:(id)a3 destinationDirectoryURL:(id)a4;
@end

@implementation PLLockedResourceTransferRecovery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationDirectoryURL, 0);
  objc_storeStrong((id *)&self->_transferAsset, 0);
}

- (NSURL)destinationDirectoryURL
{
  return self->_destinationDirectoryURL;
}

- (PLFileSystemImportAsset)transferAsset
{
  return self->_transferAsset;
}

- (BOOL)recoverFromInProgressLockedTransferForImportAsset:(id)a3 pathManager:(id)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v71 = a4;
  v68 = v5;
  v6 = [v5 urls];
  v7 = [v6 anyObject];
  v69 = [v7 URLByDeletingLastPathComponent];

  if (!v69
    || (v8 = (void *)MEMORY[0x1E4F8B908],
        [(PLLockedResourceTransferRecovery *)self destinationDirectoryURL],
        v9 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = [v8 fileURL:v69 isEqualToFileURL:v9],
        v9,
        (v8 & 1) != 0))
  {
    *(void *)v93 = 0;
    *(void *)&v93[8] = v93;
    *(void *)&v93[16] = 0x2020000000;
    char v94 = 1;
    if ([v5 isInterruptedLockedResourceTransfer])
    {
      v10 = [v5 lockedResourceTransferMarkerFileURL];
      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v86 = 0;
      char v12 = [v11 removeItemAtURL:v10 error:&v86];
      v13 = v86;

      if ((v12 & 1) == 0)
      {
        *(unsigned char *)(*(void *)&v93[8] + 24) = 0;
        v14 = PLMigrationGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v10 path];
          *(_DWORD *)buf = 138412546;
          v90 = v15;
          __int16 v91 = 2112;
          v92 = v13;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] Unable to remove marker file in valid directory (fatal error, bailing out of recovery) at '%@': %@", buf, 0x16u);
        }
      }
    }
    if (*(unsigned char *)(*(void *)&v93[8] + 24))
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v16 = [(PLLockedResourceTransferRecovery *)self transferAsset];
      v17 = [v16 urls];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v82 objects:v88 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v83 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            v22 = PLMigrationGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = [v21 path];
              *(_DWORD *)buf = 138412290;
              v90 = v23;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] recovering from interrupted locked asset transfer, attempting to remove transfer file: '%@'", buf, 0xCu);
            }
            v24 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v81 = 0;
            char v25 = [v24 removeItemAtURL:v21 error:&v81];
            v26 = v81;

            if ((v25 & 1) == 0)
            {
              *(unsigned char *)(*(void *)&v93[8] + 24) = 0;
              v27 = PLMigrationGetLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v28 = [v21 path];
                *(_DWORD *)buf = 138412546;
                v90 = v28;
                __int16 v91 = 2112;
                v92 = v26;
                _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] error removing in-progress transfer file at: '%@', '%@'", buf, 0x16u);
              }
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v82 objects:v88 count:16];
        }
        while (v18);
      }
    }
    v29 = [(PLLockedResourceTransferRecovery *)self transferAsset];
    v30 = [v29 lockedResourceTransferMarkerFileURL];
    v31 = [v30 path];
    v70 = [v71 assetAbbreviatedMetadataDirectoryForDirectory:v31 type:1 bundleScope:0];

    if (!*(unsigned char *)(*(void *)&v93[8] + 24)) {
      goto LABEL_41;
    }
    if (![v71 isDCIM])
    {
      v46 = objc_opt_class();
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke;
      v79[3] = &unk_1E586AE20;
      v79[4] = v93;
      [v46 enumerateFilesInDirectoryWithType:9 forMarkerFilePathRelativeToBundle:v70 pathManager:v71 block:v79];
LABEL_41:
      if (*(unsigned char *)(*(void *)&v93[8] + 24))
      {
        if ([v71 isDCIM])
        {
          v47 = [&unk_1EEBF1BF8 arrayByAddingObject:&unk_1EEBEE268];
        }
        else
        {
          v47 = &unk_1EEBF1BF8;
        }
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v48 = v47;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v75 objects:v87 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v49; ++j)
            {
              if (*(void *)v76 != v50) {
                objc_enumerationMutation(v48);
              }
              v52 = *(void **)(*((void *)&v75 + 1) + 8 * j);
              v53 = objc_opt_class();
              unsigned __int8 v54 = [v52 integerValue];
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke_70;
              v74[3] = &unk_1E586AE20;
              v74[4] = v93;
              [v53 enumerateFilesInDirectoryWithType:v54 forMarkerFilePathRelativeToBundle:v70 pathManager:v71 block:v74];
            }
            uint64_t v49 = [v48 countByEnumeratingWithState:&v75 objects:v87 count:16];
          }
          while (v49);
        }
      }
      v55 = [(PLLockedResourceTransferRecovery *)self transferAsset];
      v56 = [v55 lockedResourceTransferMarkerFileURL];

      if (!*(unsigned char *)(*(void *)&v93[8] + 24)) {
        goto LABEL_65;
      }
      if (v56)
      {
        v57 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v73 = 0;
        char v58 = [v57 removeItemAtURL:v56 error:&v73];
        v59 = v73;

        if ((v58 & 1) == 0)
        {
          *(unsigned char *)(*(void *)&v93[8] + 24) = 0;
          v60 = PLMigrationGetLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = [v56 path];
            *(_DWORD *)buf = 138412546;
            v90 = v61;
            __int16 v91 = 2112;
            v92 = v59;
            _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] Unable to remove marker file at '%@': %@", buf, 0x16u);
          }
        }
      }
      else
      {
        v59 = PLMigrationGetLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v62 = [0 path];
          *(_DWORD *)buf = 138412290;
          v90 = v62;
          _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] Did not find marker file at '%@'", buf, 0xCu);
        }
      }

      if (*(unsigned char *)(*(void *)&v93[8] + 24))
      {
        v63 = PLMigrationGetLog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [(PLLockedResourceTransferRecovery *)self destinationDirectoryURL];
          v65 = [v64 path];
          v66 = [v56 path];
          *(_DWORD *)buf = 138412546;
          v90 = v65;
          __int16 v91 = 2112;
          v92 = v66;
          _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] successfully recovered from locked resource transfer for asset files in directory: '%@', based on marker file: '%@'", buf, 0x16u);
        }
        BOOL v45 = *(unsigned char *)(*(void *)&v93[8] + 24) != 0;
      }
      else
      {
LABEL_65:
        BOOL v45 = 0;
      }

      _Block_object_dispose(v93, 8);
      goto LABEL_67;
    }
    v32 = [(id)objc_opt_class() pathToResourceDirectoryForPhotoDirectoryType:9 fromMarkerFilePathRelativeToBundle:v70 pathManager:v71];
    if (!v32)
    {
LABEL_40:

      goto LABEL_41;
    }
    v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v80 = 0;
    char v34 = [v33 removeItemAtPath:v32 error:&v80];
    v35 = v80;

    if (v34)
    {
      v36 = PLMigrationGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v32;
        v37 = "[lockedResourceTransfer] recovering from interrupted locked asset transfer, removed renders directory: '%@'";
        v38 = v36;
        os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
        uint32_t v40 = 12;
LABEL_37:
        _os_log_impl(&dword_19B3C7000, v38, v39, v37, buf, v40);
      }
    }
    else
    {
      if (PLIsErrorFileNotFound())
      {
LABEL_39:

        goto LABEL_40;
      }
      *(unsigned char *)(*(void *)&v93[8] + 24) = 0;
      v36 = PLMigrationGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v90 = v32;
        __int16 v91 = 2112;
        v92 = v35;
        v37 = "[lockedResourceTransfer] Unable to remove marker file in valid directory (fatal error, bailing out of reco"
              "very) at '%@': %@";
        v38 = v36;
        os_log_type_t v39 = OS_LOG_TYPE_ERROR;
        uint32_t v40 = 22;
        goto LABEL_37;
      }
    }

    goto LABEL_39;
  }
  v41 = PLMigrationGetLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = [(PLLockedResourceTransferRecovery *)self destinationDirectoryURL];
    v43 = [v42 path];
    v44 = [v69 path];
    *(_DWORD *)v93 = 138412546;
    *(void *)&v93[4] = v43;
    *(_WORD *)&v93[12] = 2112;
    *(void *)&v93[14] = v44;
    _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] recovery destination directory: '%@' is not the same as recovery asset directory: '%@'", v93, 0x16u);
  }
  BOOL v45 = 0;
LABEL_67:

  return v45;
}

void __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLMigrationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] recovering from interrupted locked asset transfer, attempting to remove transfer render file: '%@'", buf, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v6 = [v5 removeItemAtPath:v3 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] error removing in-progress transfer render file at: '%@', '%@'", buf, 0x16u);
    }
  }
}

void __98__PLLockedResourceTransferRecovery_recoverFromInProgressLockedTransferForImportAsset_pathManager___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLMigrationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "[lockedResourceTransfer] recovering from interrupted locked asset transfer, attempting to remove transfer derivative file: '%@'", buf, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v6 = [v5 removeItemAtPath:v3 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "[lockedResourceTransfer] error removing in-progress transfer derivative file at: '%@', '%@'", buf, 0x16u);
    }
  }
}

- (PLLockedResourceTransferRecovery)initWithTransferImportAsset:(id)a3 destinationDirectoryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLLockedResourceTransferRecovery;
  id v9 = [(PLLockedResourceTransferRecovery *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transferAsset, a3);
    objc_storeStrong((id *)&v10->_destinationDirectoryURL, a4);
  }

  return v10;
}

+ (void)validateAssetWithUUID:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PLLockedResourceTransferRecovery_validateAssetWithUUID_inLibrary___block_invoke;
  v10[3] = &unk_1E5875E40;
  id v11 = v6;
  id v12 = v7;
  id v13 = a1;
  id v8 = v7;
  id v9 = v6;
  [v8 performBlockAndWait:v10];
}

void __68__PLLockedResourceTransferRecovery_validateAssetWithUUID_inLibrary___block_invoke(uint64_t a1)
{
  id v4 = +[PLManagedAsset assetWithUUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (v4)
  {
    v2 = *(void **)(a1 + 48);
    id v3 = [*(id *)(a1 + 40) pathManager];
    [v2 _validateAsset:v4 pathManager:v3];
  }
}

+ (id)destinationURLForResource:(id)a3 asset:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v12 shouldUseFileIdentifierForBundleScope:v7])
  {
    id v22 = objc_alloc(MEMORY[0x1E4F8B978]);
    id v13 = [v11 uuid];
    v23 = [v10 uniformTypeIdentifier];
    uint64_t v14 = [v23 identifier];
    uint64_t v15 = [v10 version];
    uint64_t v16 = [v10 resourceType];
    uint64_t v17 = [v10 recipeID];
    uint64_t v18 = [v11 originalFilename];
    uint64_t v19 = (void *)[v22 initWithAssetUuid:v13 bundleScope:v7 uti:v14 resourceVersion:v15 resourceType:v16 recipeID:v17 originalFilename:v18];

    v20 = [v12 readOnlyUrlWithIdentifier:v19];
  }
  else
  {
    v20 = [a1 dcimFileURLForAsset:v11 resource:v10 bundleScope:v7 pathManager:v12];
  }

  return v20;
}

+ (id)dcimFileURLForAsset:(id)a3 resource:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 cplType];
  uint64_t v14 = [v11 version];
  uint64_t v15 = [v11 recipeID];
  uint64_t v16 = [v11 resourceType];
  uint64_t v17 = [v11 uniformTypeIdentifier];

  uint64_t v18 = [v17 identifier];
  LOWORD(v21) = a5;
  uint64_t v19 = [a1 dcimFileURLForAsset:v12 cplResourceType:v13 version:v14 recipeID:v15 resourceType:v16 utiString:v18 bundleScope:v21 pathManager:v10];

  return v19;
}

+ (id)dcimFileURLForAsset:(id)a3 cplResourceType:(unint64_t)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 resourceType:(unsigned int)a7 utiString:(id)a8 bundleScope:(unsigned __int16)a9 pathManager:(id)a10
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a10;
  if (![v15 isDCIM])
  {
    uint64_t v19 = 0;
    goto LABEL_13;
  }
  uint64_t v16 = [v13 directory];
  uint64_t v17 = [v13 filename];
  uint64_t v18 = +[PLLockedResourceTransferRecovery dcimDirectoryForAssetDirectory:v16 filename:v17 bundleScope:a9 pathManager:v15];

  if (!a4) {
    goto LABEL_9;
  }
  if (a4 != 1)
  {
    v23 = [v13 pathForCPLResourceType:a4 adjusted:a5 == 2];
    v24 = [v23 pathExtension];

    if (v24)
    {
LABEL_10:
      id v21 = v24;
      [v21 UTF8String];
      id v22 = [v13 filename];
      id v25 = +[PLThumbnailManager masterThumbFilename];
      [v25 UTF8String];
      uint64_t v19 = PLDCIMURLForResourcePropertiesAndPathManager();

      goto LABEL_11;
    }
LABEL_9:
    v24 = +[PLManagedAsset preferredFileExtensionForType:v14];
    goto LABEL_10;
  }
  if (!v18)
  {
    uint64_t v19 = 0;
    goto LABEL_12;
  }
  uint64_t v19 = [v13 filename];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4F1CB10];
    id v21 = [v13 filename];
    id v22 = [v15 assetMainFilePathWithDirectory:v18 filename:v21 bundleScope:a9];
    uint64_t v19 = [v20 fileURLWithPath:v22 isDirectory:0];
LABEL_11:
  }
LABEL_12:

LABEL_13:
  return v19;
}

+ (void)enumerateFilesInDirectoryWithType:(unsigned __int8)a3 forMarkerFilePathRelativeToBundle:(id)a4 pathManager:(id)a5 block:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v38 = (void (**)(id, void *))a6;
  if (!v38)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"PLLockedResourceTransferRecovery.m", 316, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];
  }
  if (v8 > 0x1E
    || ((1 << v8) & 0x1610) == 0 && (v8 != 30 || ([v12 isDCIM] & 1) == 0))
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"PLLockedResourceTransferRecovery.m" lineNumber:321 description:@"Unsupported type"];
  }
  os_log_type_t v39 = [a1 pathToResourceDirectoryForPhotoDirectoryType:v8 fromMarkerFilePathRelativeToBundle:v11 pathManager:v12];
  if (v39)
  {
    id v14 = [v11 lastPathComponent];
    uint32_t v40 = [v14 stringByDeletingPathExtension];

    if ([v12 isDCIM] && (v8 == 30 || v8 == 12))
    {
      id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v16 = [v15 contentsOfDirectoryAtPath:v39 error:0];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      obuint64_t j = v16;
      uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v19 = v12;
        uint64_t v20 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v47 != v20) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if ([v22 hasPrefix:v40])
            {
              uint64_t v23 = [v39 stringByAppendingPathComponent:v22];

              os_log_type_t v39 = (void *)v23;
              id v12 = v19;
              goto LABEL_22;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v18) {
            continue;
          }
          break;
        }
        id v12 = v19;
      }
    }
    else
    {
LABEL_22:
      char v24 = 0;
      if ([v12 isDCIM] && v8 <= 0x1E) {
        char v24 = (0x40001200u >> v8) & 1;
      }
      id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      v26 = [v25 contentsOfDirectoryAtPath:v39 error:0];

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      obuint64_t j = v26;
      uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(obj);
            }
            v31 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            if ((v24 & 1) != 0 || [*(id *)(*((void *)&v42 + 1) + 8 * j) hasPrefix:v40])
            {
              v32 = [v31 lastPathComponent];
              [v11 lastPathComponent];
              char v34 = v33 = v11;
              char v35 = [v32 isEqualToString:v34];

              id v11 = v33;
              if ((v35 & 1) == 0)
              {
                v36 = [v39 stringByAppendingPathComponent:v31];
                v38[2](v38, v36);
              }
            }
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v28);
      }
    }
  }
}

+ (id)pathToResourceDirectoryForPhotoDirectoryType:(unsigned __int8)a3 fromMarkerFilePathRelativeToBundle:(id)a4 pathManager:(id)a5
{
  uint64_t v6 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v6 == 4)
  {
    id v12 = [v10 photoDirectoryWithType:1];
    id v13 = [v9 stringByDeletingLastPathComponent];
    id v14 = [v12 stringByAppendingPathComponent:v13];

    goto LABEL_19;
  }
  if ((v6 - 9) >= 2
    && v6 != 12
    && (v6 != 30 || ![v10 isDCIM]))
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:a1 file:@"PLLockedResourceTransferRecovery.m" lineNumber:310 description:@"Unsupported type"];

    id v14 = 0;
    goto LABEL_19;
  }
  if (![v11 isDCIM])
  {
    uint64_t v34 = 0;
    char v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__28616;
    v38 = __Block_byref_object_dispose__28617;
    id v39 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __128__PLLockedResourceTransferRecovery_pathToResourceDirectoryForPhotoDirectoryType_fromMarkerFilePathRelativeToBundle_pathManager___block_invoke;
    v33[3] = &unk_1E5867EB0;
    v33[4] = &v34;
    [v11 enumerateBundleScopesWithBlock:v33];
    char v21 = [v11 pathRelativeToBundle:v9 isSubpathOfPhotoDirectoryWithType:4];
    id v22 = v11;
    if ((v21 & 1) == 0)
    {
      uint64_t v23 = (void *)v35[5];
      char v24 = [v11 photoDirectoryWithType:1];
      id v25 = [v24 stringByAppendingPathComponent:v9];
      LODWORD(v23) = [v23 path:v25 isSubpathOfPhotoDirectoryWithType:4];

      if (!v23) {
        goto LABEL_17;
      }
      id v22 = (void *)v35[5];
    }
    id v26 = v22;
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = [v9 stringByDeletingLastPathComponent];
      uint64_t v29 = [v28 lastPathComponent];

      v30 = [v27 photoDirectoryWithType:v6];
      id v14 = [v30 stringByAppendingPathComponent:v29];

LABEL_18:
      _Block_object_dispose(&v34, 8);

      goto LABEL_19;
    }
LABEL_17:
    id v14 = 0;
    goto LABEL_18;
  }
  id v15 = [v9 stringByDeletingLastPathComponent];
  uint64_t v16 = [v11 photoDirectoryWithType:v6];
  id v14 = [v16 stringByAppendingPathComponent:v15];

  if (v6 == 9)
  {
    uint64_t v17 = [v9 lastPathComponent];
    uint64_t v18 = [v17 stringByDeletingPathExtension];
    id v19 = [v14 stringByAppendingPathComponent:v18];
    uint64_t v20 = [v19 stringByAppendingPathComponent:*MEMORY[0x1E4F8C4E0]];

    id v14 = (void *)v20;
  }

LABEL_19:
  return v14;
}

void __128__PLLockedResourceTransferRecovery_pathToResourceDirectoryForPhotoDirectoryType_fromMarkerFilePathRelativeToBundle_pathManager___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2 == 4)
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
    id v7 = v8;
  }
}

+ (id)assetMainScopeDirectoryFromMarkerFilePathRelativeToBundle:(id)a3 pathManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isDCIM])
  {
    id v7 = [v6 photoDirectoryWithType:27];
    id v8 = [v6 assetAbbreviatedMetadataDirectoryForDirectory:v7 type:31 bundleScope:0];
    if (_PLPathContainsPath(v8, v5))
    {
      id v9 = [v8 pathComponents];
      unint64_t v10 = [v9 count];

      id v11 = [v5 pathComponents];
      if ([v11 count] == 1)
      {
        id v12 = &stru_1EEB2EB80;
      }
      else
      {
        unint64_t v13 = 0;
        id v12 = &stru_1EEB2EB80;
        do
        {
          if (v13 >= v10)
          {
            id v14 = [v11 objectAtIndexedSubscript:v13];
            uint64_t v15 = [(__CFString *)v12 stringByAppendingPathComponent:v14];

            id v12 = (__CFString *)v15;
          }
          ++v13;
        }
        while (v13 < [v11 count] - 1);
      }
    }
    else
    {
      id v12 = [v5 stringByDeletingLastPathComponent];
    }
  }
  else
  {
    id v7 = [v5 stringByDeletingLastPathComponent];
    id v12 = [v7 lastPathComponent];
  }

  return v12;
}

+ (BOOL)updateAssetPropertiesAndSaveForAsset:(id)a3 moveToDestinationScope:(unsigned __int16)a4 library:(id)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [v8 setBundleScope:v7];
  unint64_t v10 = [v8 pathManager];
  int v11 = [v10 isDCIM];

  if (v11)
  {
    id v12 = [v9 pathManager];
    unint64_t v13 = +[PLLockedResourceTransferRecovery assetDirectoryForAsset:v8 bundleScope:v7 pathManager:v12];

    [v8 setDirectory:v13];
  }
  id v14 = [v8 modernResources];
  uint64_t v15 = (void *)[v14 copy];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        char v21 = [v9 pathManager];
        id v22 = +[PLLockedResourceTransferRecovery destinationURLForResource:v20 asset:v8 bundleScope:v7 pathManager:v21];

        uint64_t v23 = [v22 path];
        [v20 markAsLocallyAvailableWithFilePath:v23];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }

  if (!v7) {
    [v8 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
  }
  char v24 = [v9 managedObjectContext];
  int v25 = [v24 hasChanges];

  if (v25)
  {
    id v26 = [v9 managedObjectContext];
    id v34 = 0;
    char v27 = [v26 save:&v34];
    id v28 = v34;

    if ((v27 & 1) == 0)
    {
      id v29 = v28;
      v30 = v29;
      if (a6) {
        *a6 = v29;
      }
    }
  }
  else
  {
    char v27 = 1;
  }

  return v27;
}

+ (id)assetDirectoryForAsset:(id)a3 bundleScope:(unsigned __int16)a4 pathManager:(id)a5
{
  int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  int v9 = [v8 isDCIM];
  unint64_t v10 = [v7 directory];
  if (v9)
  {
    int v11 = [v8 photoDirectoryWithType:27];
    id v12 = [v8 assetAbbreviatedMetadataDirectoryForDirectory:v11 type:31 bundleScope:0];
    unint64_t v13 = [v7 directory];
    int v14 = _PLPathContainsPath(v12, v13);

    if (v6 == 4)
    {
      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [v7 directory];
        uint64_t v16 = [v12 stringByAppendingPathComponent:v15];
LABEL_7:
        uint64_t v20 = (void *)v16;

        unint64_t v10 = v20;
      }
    }
    else if (v14)
    {
      uint64_t v17 = [v7 directory];
      uint64_t v18 = [v7 filename];
      id v19 = [v8 assetMainFilePathWithDirectory:v17 filename:v18 bundleScope:4];
      uint64_t v15 = [v19 stringByDeletingLastPathComponent];

      uint64_t v16 = [v8 assetAbbreviatedMetadataDirectoryForDirectory:v15 type:27 bundleScope:0];
      goto LABEL_7;
    }
  }
  return v10;
}

+ (id)dontImportMarkerFileURLForAsset:(id)a3 bundleScope:(unsigned __int16)a4 pathManager:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = +[PLLockedResourceTransferRecovery lockedTransferRecoveryMarkerFileExtension];
  if ([v9 shouldUseFileIdentifierForBundleScope:v6])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F8B978]);
    id v12 = [v8 uuid];
    unint64_t v13 = [v8 uniformTypeIdentifier];
    int v14 = [v8 originalFilename];
    uint64_t v15 = (void *)[v11 initWithAssetUuid:v12 bundleScope:v6 uti:v13 resourceVersion:0 resourceType:0 recipeID:0 originalFilename:v14];

    uint64_t v16 = [v9 readOnlyUrlWithIdentifier:v15];
    uint64_t v17 = [v16 URLByDeletingPathExtension];
    uint64_t v18 = [v17 URLByAppendingPathExtension:v10];
LABEL_5:
    uint64_t v23 = (void *)v18;

    goto LABEL_7;
  }
  id v19 = [v8 directory];
  uint64_t v20 = [v8 filename];
  uint64_t v15 = [a1 dcimDirectoryForAssetDirectory:v19 filename:v20 bundleScope:v6 pathManager:v9];

  if (v15)
  {
    char v21 = [v8 filename];
    uint64_t v16 = [v9 assetMainFilePathWithDirectory:v15 filename:v21 bundleScope:v6];

    id v22 = [v16 stringByDeletingPathExtension];
    uint64_t v17 = [v22 stringByAppendingPathExtension:v10];

    uint64_t v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:0];
    goto LABEL_5;
  }
  uint64_t v23 = 0;
LABEL_7:

  return v23;
}

+ (id)dcimDirectoryForAssetDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5 pathManager:(id)a6
{
  int v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = [v11 isDCIM];
  unint64_t v13 = 0;
  if (v9 && v12)
  {
    int v14 = [v11 photoDirectoryWithType:27];
    uint64_t v15 = [v11 assetAbbreviatedMetadataDirectoryForDirectory:v14 type:31 bundleScope:0];
    int v16 = _PLPathContainsPath(v15, v9);
    if (v7 == 4)
    {
      if (!v16)
      {
        id v17 = [v15 stringByAppendingPathComponent:v9];
LABEL_9:
        unint64_t v13 = v17;
        goto LABEL_10;
      }
    }
    else if (v16)
    {
      uint64_t v18 = [v11 assetMainFilePathWithDirectory:v9 filename:v10 bundleScope:4];
      id v19 = [v18 stringByDeletingLastPathComponent];

      unint64_t v13 = [v11 assetAbbreviatedMetadataDirectoryForDirectory:v19 type:27 bundleScope:0];

LABEL_10:
      goto LABEL_11;
    }
    id v17 = v9;
    goto LABEL_9;
  }
LABEL_11:

  return v13;
}

+ (id)lockedTransferRecoveryMarkerFileExtension
{
  return @"lockedresourcetransfer";
}

+ (BOOL)isStaleResourceURL:(id)a3 asset:(id)a4 resource:(id)a5 pathManager:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[PLLockedResourceTransferRecovery oppositeBundleScope:](PLLockedResourceTransferRecovery, "oppositeBundleScope:", [v10 bundleScope]);
  if (v13 == 5)
  {
    char v14 = 0;
  }
  else
  {
    uint64_t v15 = +[PLLockedResourceTransferRecovery destinationURLForResource:v11 asset:v10 bundleScope:v13 pathManager:v12];
    char v14 = [MEMORY[0x1E4F8B908] fileURL:v15 isEqualToFileURL:v9];
  }
  return v14;
}

+ (unsigned)oppositeBundleScope:(unsigned __int16)a3
{
  if (a3 == 4) {
    unsigned __int16 v3 = 0;
  }
  else {
    unsigned __int16 v3 = 5;
  }
  if (a3) {
    return v3;
  }
  else {
    return 4;
  }
}

+ (void)_validateAsset:(id)a3 pathManager:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v6 deferredProcessingNeeded] == 11)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v49 = *MEMORY[0x1E4F28228];
    v50[0] = @"asset in resource transfer failure state";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v12 = [v9 errorWithDomain:v10 code:46309 userInfo:v11];

    [v8 addObject:v12];
  }
  uint64_t v13 = [v6 bundleScope];
  if (v13)
  {
    if (v13 == 4)
    {
      char v14 = 0;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = 5;
      char v14 = 1;
    }
  }
  else
  {
    char v14 = 0;
    uint64_t v15 = 4;
  }
  int v16 = [a1 dontImportMarkerFileURLForAsset:v6 bundleScope:v13 pathManager:v7];
  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v18 = [v16 path];
  int v19 = [v17 fileExistsAtPath:v18];

  if (v19)
  {
    uint64_t v20 = NSString;
    char v21 = [v16 path];
    long long v44 = [v20 stringWithFormat:@"marker file exists in current bundle scope at path: %@", v21];

    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F8C500];
    uint64_t v47 = *MEMORY[0x1E4F28228];
    long long v48 = v44;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v24 = v6;
    int v25 = v16;
    char v26 = v14;
    id v27 = a1;
    id v28 = v7;
    uint64_t v29 = v15;
    v31 = id v30 = v8;
    v32 = [v22 errorWithDomain:v23 code:46309 userInfo:v31];

    id v8 = v30;
    uint64_t v15 = v29;
    id v7 = v28;
    a1 = v27;
    char v14 = v26;
    int v16 = v25;
    id v6 = v24;
    [v8 addObject:v32];
  }
  if ((v14 & 1) == 0)
  {
    id v33 = [a1 dontImportMarkerFileURLForAsset:v6 bundleScope:v15 pathManager:v7];
    id v34 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v35 = [v33 path];
    int v36 = [v34 fileExistsAtPath:v35];

    if (v36)
    {
      long long v37 = NSString;
      long long v38 = [v33 path];
      id v39 = [v37 stringWithFormat:@"marker file exists in orphaned bundle scope at path: %@", v38];

      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F8C500];
      uint64_t v45 = *MEMORY[0x1E4F28228];
      long long v46 = v39;
      long long v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      long long v43 = [v40 errorWithDomain:v41 code:46309 userInfo:v42];

      [v8 addObject:v43];
    }
  }
}

@end