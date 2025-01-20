@interface PLDuplicateMerge
+ (BOOL)mergeAssets:(id)a3 targetAssetOID:(id)a4 photolibrary:(id)a5 error:(id *)a6;
- (BOOL)_checkCPLDisabledAssetHasValidOriginalResourcesForAsset:(id)a3;
- (BOOL)_isValidForLocationOverwriteWithSource:(id)a3;
- (BOOL)_mergeAdjustmentsFromSource:(id)a3 error:(id *)a4;
- (BOOL)mergeResourcesFromSource:(id)a3 error:(id *)a4;
- (PLDuplicateAsset)targetAsset;
- (PLDuplicateMerge)initWithSourceAssets:(id)a3 targetAsset:(id)a4 photolibrary:(id)a5;
- (PLDuplicateMerge)mergeWithError:(id *)a3;
- (PLManagedAsset)asset;
- (void)_mergeFaceRelationshipsFromSource:(id)a3;
- (void)_mergeLocationFromSource:(id)a3 forceUpdate:(BOOL)a4;
- (void)_mergeMetadataFromSource:(id)a3;
- (void)_mergeSharedLibraryMetadataFromSource:(id)a3;
- (void)_preFileCloneChecksForURL:(id)a3;
- (void)_resetMediaAnalysisStateWithType:(int64_t)a3;
- (void)_setDCIMFilenameFromSource:(id)a3;
- (void)_setUBFFilenameFromDuplicateSource:(id)a3;
- (void)setTargetAsset:(id)a3;
@end

@implementation PLDuplicateMerge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAsset, 0);
  objc_storeStrong((id *)&self->_mergeModelProperties, 0);
  objc_storeStrong((id *)&self->_mergeCrashRecovery, 0);
  objc_storeStrong((id *)&self->_sourceAssets, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)setTargetAsset:(id)a3
{
}

- (PLDuplicateAsset)targetAsset
{
  return (PLDuplicateAsset *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)_isValidForLocationOverwriteWithSource:(id)a3
{
  id v4 = a3;
  v5 = [(PLDuplicateMerge *)self asset];
  v6 = [v4 asset];
  v7 = [v6 location];

  if (!v7) {
    goto LABEL_6;
  }
  v8 = [v5 location];

  if (!v8)
  {
    LOBYTE(v12) = 1;
    goto LABEL_10;
  }
  int v9 = [v4 hasModifiedUserLocation];
  v10 = [(PLDuplicateMerge *)self targetAsset];
  if (![v10 hasModifiedUserLocation])
  {

    if ((v9 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    [v7 coordinate];
    int v12 = objc_msgSend(v5, "isLocatedAtCoordinates:") ^ 1;
    goto LABEL_10;
  }
  int v11 = [v4 hasModifiedUserLocation];

  if (!v11)
  {
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  if ([(PLDuplicateMergeModelProperties *)self->_mergeModelProperties isRecentlyModifiedSourceAsset:v4])
  {
    goto LABEL_9;
  }
LABEL_6:
  LOBYTE(v12) = 0;
LABEL_10:

  return v12;
}

- (void)_setDCIMFilenameFromSource:(id)a3
{
  id v15 = [a3 asset];
  id v4 = [(PLDuplicateMerge *)self asset];
  v5 = [v4 filename];
  v6 = [v5 pathExtension];
  v7 = [v15 filename];
  v8 = [v7 pathExtension];
  char v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [v15 filename];
    int v11 = [v10 pathExtension];

    if (v11)
    {
      int v12 = [v4 filename];
      v13 = [v12 stringByDeletingPathExtension];

      v14 = [v13 stringByAppendingPathExtension:v11];
      [v4 setFilename:v14];
    }
  }
}

- (void)_resetMediaAnalysisStateWithType:(int64_t)a3
{
  id v4 = [(PLDuplicateMerge *)self asset];
  v6 = v4;
  if (a3 != 1)
  {
    v5 = v4;
    if (a3) {
      goto LABEL_5;
    }
    PLResetMediaProcessingStateOnAsset(2, v4, 1);
    PLResetMediaProcessingStateOnAsset(1, v6, 1);
    PLResetMediaProcessingStateOnAsset(17, v6, 1);
    PLResetMediaProcessingStateOnAsset(12, v6, 0xFFFF);
    PLResetMediaProcessingStateOnAsset(10, v6, 0xFFFF);
  }
  PLResetMediaProcessingStateOnAsset(3, v6, 1);
  v5 = v6;
LABEL_5:
}

- (BOOL)_mergeAdjustmentsFromSource:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PLDuplicateMerge *)self asset];
  v7 = [v5 resourceSwapAssetUUID];
  v8 = [v6 uuid];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v10 = [v5 asset];
    uint64_t v11 = [v10 originalHeight];
    if (v11 != [v6 originalHeight]
      || (uint64_t v12 = -[NSObject originalWidth](v10, "originalWidth"), v12 != [v6 originalWidth]))
    {
      id v15 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v29 = [v5 shortDescription];
        v30 = [(PLDuplicateMerge *)self targetAsset];
        v31 = [v30 shortDescription];
        *(_DWORD *)buf = 138543618;
        v38 = v29;
        __int16 v39 = 2114;
        v40 = v31;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Duplicate Merge: skipping adjustment merge - resource size mismatch [%{public}@ -> %{public}@]", buf, 0x16u);
      }
      BOOL v16 = 1;
      goto LABEL_24;
    }
    if ([v10 hasAdjustments])
    {
      library = self->_library;
      id v36 = 0;
      v14 = +[PLUnmanagedAdjustment copyUnmanagedAdjustmentFromSourceAsset:v10 forPlaceholderAsset:v6 inLibrary:library error:&v36];
      id v15 = v36;
      BOOL v16 = v14 != 0;
      if (v14)
      {
        objc_msgSend(v6, "setAdjustmentsState:", -[NSObject adjustmentsState](v10, "adjustmentsState"));
        v17 = [v10 imageRequestHints];
        [v6 setImageRequestHints:v17];

        objc_msgSend(v6, "setPackedAcceptableCropRect:", -[NSObject packedAcceptableCropRect](v10, "packedAcceptableCropRect"));
        objc_msgSend(v6, "setPackedPreferredCropRect:", -[NSObject packedPreferredCropRect](v10, "packedPreferredCropRect"));
        v18 = [v10 additionalAttributes];
        v19 = [v18 adjustedStableHash];
        v20 = [v6 additionalAttributes];
        [v20 setAdjustedStableHash:v19];

        v21 = [v6 additionalAttributes];
        [v21 setUnmanagedAdjustment:v14];

        v22 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [v5 shortDescription];
          v24 = [(PLDuplicateMerge *)self targetAsset];
          v25 = [v24 shortDescription];
          *(_DWORD *)buf = 138543618;
          v38 = v23;
          __int16 v39 = 2114;
          v40 = v25;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Duplicate Merge: transfer adjustment [%{public}@ -> %{public}@]", buf, 0x16u);
        }
      }
      else
      {
        v22 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v15;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Duplicate Merge: Error copying source adjustment. Error: %@", buf, 0xCu);
        }
      }

      goto LABEL_23;
    }
    if ([v6 hasAdjustments])
    {
      [v6 revertToOriginal];
      id v15 = PLDuplicateDetectionGetLog();
      BOOL v16 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v14 = [v5 shortDescription];
        v32 = [(PLDuplicateMerge *)self targetAsset];
        v33 = [v32 shortDescription];
        *(_DWORD *)buf = 138543618;
        v38 = v14;
        __int16 v39 = 2114;
        v40 = v33;
        v34 = "Duplicate Merge: revert adjustment [%{public}@ -> %{public}@]";
LABEL_19:
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, v34, buf, 0x16u);

LABEL_23:
      }
    }
    else
    {
      id v15 = PLDuplicateDetectionGetLog();
      BOOL v16 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v14 = [v5 shortDescription];
        v32 = [(PLDuplicateMerge *)self targetAsset];
        v33 = [v32 shortDescription];
        *(_DWORD *)buf = 138543618;
        v38 = v14;
        __int16 v39 = 2114;
        v40 = v33;
        v34 = "Duplicate Merge: no adjustment migration [%{public}@ -> %{public}@]";
        goto LABEL_19;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  v10 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v26 = [v5 shortDescription];
    v27 = [(PLDuplicateMerge *)self targetAsset];
    v28 = [v27 shortDescription];
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    __int16 v39 = 2114;
    v40 = v28;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge: skipping adjustment merge - resource swap uuid mismatch [%{public}@ -> %{public}@]", buf, 0x16u);
  }
  BOOL v16 = 1;
LABEL_25:

  return v16;
}

- (void)_setUBFFilenameFromDuplicateSource:(id)a3
{
  id v13 = a3;
  id v4 = [(PLDuplicateMerge *)self asset];
  id v5 = [v4 pathManager];
  int v6 = [v5 isUBF];

  if (v6)
  {
    v7 = [v13 asset];
    v8 = [v7 originalFilename];
    [v4 setOriginalFilename:v8];

    int v9 = [v7 primaryStoreOriginalResource];
    if (v9)
    {
      [v4 setDirectory:0];
      [v4 setFilename:0];
      v10 = [v9 uniformTypeIdentifier];
      uint64_t v11 = [v10 identifier];
      uint64_t v12 = [v4 originalFilename];
      [v4 setUBFFilenameAndDirectoryWithOriginalUniformTypeIdentifier:v11 originalFilename:v12];
    }
  }
}

- (void)_preFileCloneChecksForURL:(id)a3
{
  *(void *)&v31[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v29 = 0;
    char v6 = [v4 checkResourceIsReachableAndReturnError:&v29];
    v7 = v29;
    if (v6)
    {
      id v28 = 0;
      uint64_t v8 = *MEMORY[0x1E4F1C628];
      id v27 = 0;
      int v9 = [v5 getResourceValue:&v28 forKey:v8 error:&v27];
      v10 = v28;
      uint64_t v11 = v27;

      if (!v9)
      {
        v14 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v31 = v11;
          v18 = "Duplicate Merge: Failed to identify if the cloned target is a directory. Error: %@";
          v22 = v14;
          uint32_t v23 = 12;
LABEL_20:
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, v18, buf, v23);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      int v12 = [v10 BOOLValue];
      id v13 = (const char *)[v5 fileSystemRepresentation];
      if (v12)
      {
        if (rmdir(v13))
        {
          v14 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v15 = *__error();
            BOOL v16 = __error();
            v17 = strerror(*v16);
            *(_DWORD *)buf = 67109378;
            v31[0] = v15;
            LOWORD(v31[1]) = 2080;
            *(void *)((char *)&v31[1] + 2) = v17;
            v18 = "Duplicate Merge: Failed to remove a directory on the cloned target location. Error: [%d] %s";
LABEL_19:
            v22 = v14;
            uint32_t v23 = 18;
            goto LABEL_20;
          }
          goto LABEL_21;
        }
      }
      else if (unlink(v13))
      {
        v14 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v24 = *__error();
          v25 = __error();
          v26 = strerror(*v25);
          *(_DWORD *)buf = 67109378;
          v31[0] = v24;
          LOWORD(v31[1]) = 2080;
          *(void *)((char *)&v31[1] + 2) = v26;
          v18 = "Duplicate Merge: Failed to remove a file on the cloned target location. Error: [%d] %s";
          goto LABEL_19;
        }
LABEL_21:
      }
LABEL_22:

      v7 = v11;
      goto LABEL_23;
    }
    if ((PLIsErrorFileNotFound() & 1) == 0)
    {
      v10 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v7;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to check if the cloned target location was reachable. Error: %@", buf, 0xCu);
      }
      uint64_t v11 = v7;
      goto LABEL_22;
    }
  }
  else
  {
    v7 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v19 = [(PLDuplicateMerge *)self targetAsset];
      v20 = [v19 asset];
      v21 = [v20 uuid];
      *(_DWORD *)buf = 138543362;
      *(void *)v31 = v21;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: Skipping pre clone check for asset: %{public}@", buf, 0xCu);
    }
  }
LABEL_23:
}

- (BOOL)_checkCPLDisabledAssetHasValidOriginalResourcesForAsset:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 primaryStoreOriginalResource];
  id v5 = [v3 persistedResourcesMatching:&__block_literal_global_92];
  if (!v4
    || (([v3 isRAWPlusJPEG] & 1) != 0 || objc_msgSend(v3, "isPhotoIris"))
    && (unint64_t)[v5 count] < 2)
  {
    BOOL v6 = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "fileURL", (void)v15);
          int v13 = [v12 checkResourceIsReachableAndReturnError:0];

          if (!v13)
          {
            BOOL v6 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 1;
LABEL_16:
  }
  return v6;
}

BOOL __76__PLDuplicateMerge__checkCPLDisabledAssetHasValidOriginalResourcesForAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 cplType] == 1 || objc_msgSend(v2, "cplType") == 18 || objc_msgSend(v2, "cplType") == 17;

  return v3;
}

- (BOOL)mergeResourcesFromSource:(id)a3 error:(id *)a4
{
  v157[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v105 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v109 = v4;
  v106 = [v4 asset];
  id v5 = [(PLDuplicateMerge *)self asset];
  v112 = [v5 pathManager];
  v100 = [v5 persistedResourcesMatching:&__block_literal_global_75];
  if (([v4 isCPLEnabled] & 1) != 0
    || ([v106 master], BOOL v6 = objc_claimAutoreleasedReturnValue(), v6, !v6)
    || ![(PLDuplicateMerge *)self _checkCPLDisabledAssetHasValidOriginalResourcesForAsset:v5]|| [(PLDuplicateMerge *)self _checkCPLDisabledAssetHasValidOriginalResourcesForAsset:v106])
  {
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v7 = v100;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v138 objects:v155 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v139;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v139 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(id *)(*((void *)&v138 + 1) + 8 * i);
          [v5 removeLocalFileForResource:v11 allowDCIMPath:1];
          [v11 deleteResource];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v138 objects:v155 count:16];
      }
      while (v8);
    }

    if ([v112 isDCIM]) {
      [(PLDuplicateMerge *)self _setDCIMFilenameFromSource:v109];
    }
    else {
      [(PLDuplicateMerge *)self _setUBFFilenameFromDuplicateSource:v109];
    }
    if (![v109 isCPLEnabled]
      || ([v106 master],
          int v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = v12 == 0,
          v12,
          v13))
    {
      int v24 = [v106 master];

      if (v24)
      {
        v25 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [v109 shortDescription];
          id v27 = [(PLDuplicateMerge *)self targetAsset];
          id v28 = [v27 shortDescription];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v26;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v28;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Source asset has a master record, but CPL is not enabled [%{public}@ -> %{public}@]", buf, 0x16u);
        }
      }
      id v29 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = [v109 shortDescription];
        v31 = [(PLDuplicateMerge *)self targetAsset];
        v32 = [v31 shortDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v32;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_INFO, "Duplicate Merge: no master to remap, going to copy all resources manually [%{public}@ -> %{public}@]", buf, 0x16u);
      }
      uint32_t v23 = [v106 persistedResourcesMatching:&__block_literal_global_83];
      BOOL v111 = 0;
    }
    else
    {
      v14 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        long long v15 = [(PLDuplicateMerge *)self targetAsset];
        long long v16 = [v15 shortDescription];
        long long v17 = [v106 master];
        long long v18 = [v17 scopedIdentifier];
        v19 = [v109 shortDescription];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2114;
        v149 = v19;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Duplicate Merge: going to remap master on %{public}@ with master %{public}@ from %{public}@", buf, 0x20u);
      }
      uint64_t v20 = [v106 master];
      +[PLManagedAsset fixupCloudPhotoLibraryAsset:v5 withCloudMaster:v20 inLibrary:self->_library];

      objc_msgSend(v5, "setCloudPlaceholderKind:", objc_msgSend(v106, "cloudPlaceholderKind"));
      v21 = [v106 allAssetCPLResources];
      uint64_t v22 = [v21 count];
      BOOL v111 = v22 != 0;
      if (v22) {
        uint32_t v23 = (void *)[v21 copy];
      }
      else {
        uint32_t v23 = 0;
      }
      mergeCrashRecovery = self->_mergeCrashRecovery;
      v34 = [v5 uuid];
      [(PLDuplicateMergeCrashRecovery *)mergeCrashRecovery writeCrashRecoveryMarkerFileForTargetAssetUUID:v34 error:0];
    }
    v35 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = [v23 count];
      v37 = [v109 shortDescription];
      v38 = [(PLDuplicateMerge *)self targetAsset];
      __int16 v39 = [v38 shortDescription];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2114;
      v149 = v39;
      _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_INFO, "Duplicate Merge: manually installing %lu resources [%{public}@ -> %{public}@]", buf, 0x20u);
    }
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id obj = v23;
    uint64_t v114 = [obj countByEnumeratingWithState:&v134 objects:v154 count:16];
    if (v114)
    {
      v108 = 0;
      uint64_t v113 = *(void *)v135;
      char v104 = 1;
      uint64_t v101 = *MEMORY[0x1E4F8C500];
      uint64_t v102 = *MEMORY[0x1E4F28568];
LABEL_34:
      uint64_t v40 = 0;
      while (1)
      {
        if (*(void *)v135 != v113)
        {
          uint64_t v41 = v40;
          objc_enumerationMutation(obj);
          uint64_t v40 = v41;
        }
        uint64_t v116 = v40;
        id v42 = *(id *)(*((void *)&v134 + 1) + 8 * v40);
        v117 = [v42 validatedExternalResourceRepresentationUsingFileURL:0];
        v119 = [v5 storedResourceForExternalResource:v117 asset:v5];
        if (v119) {
          goto LABEL_95;
        }
        v43 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = [v109 shortDescription];
          v45 = [(PLDuplicateMerge *)self targetAsset];
          v46 = [v45 shortDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2112;
          v149 = v117;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Duplicate Merge: failed to install new resource on target with external source resource: [%{public}@ -> %{public}@] %@", buf, 0x20u);
        }
        if ([v42 isDerivative])
        {
LABEL_95:
          [v119 resetPrefetchState];
          v118 = [v42 fileURL];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v149 = __Block_byref_object_copy__87342;
          v150 = __Block_byref_object_dispose__87343;
          id v151 = 0;
          uint64_t v130 = 0;
          v131 = &v130;
          uint64_t v132 = 0x2020000000;
          char v133 = 0;
          if (!v118) {
            goto LABEL_56;
          }
          if ([v112 isUBF])
          {
            id v47 = objc_alloc(MEMORY[0x1E4F8B978]);
            v110 = [v5 uuid];
            uint64_t v48 = [v5 bundleScope];
            v49 = [v42 uniformTypeIdentifier];
            v50 = [v49 identifier];
            uint64_t v51 = [v42 version];
            uint64_t v52 = [v42 resourceType];
            uint64_t v53 = [v42 recipeID];
            int v54 = [v42 recipeID];
            if (v54)
            {
              v55 = 0;
            }
            else
            {
              v103 = [v106 originalFilename];
              v55 = v103;
            }
            v56 = (void *)[v47 initWithAssetUuid:v110 bundleScope:v48 uti:v50 resourceVersion:v51 resourceType:v52 recipeID:v53 originalFilename:v55];
            if (!v54) {

            }
            v123[0] = MEMORY[0x1E4F143A8];
            v123[1] = 3221225472;
            v123[2] = __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke_88;
            v123[3] = &unk_1E5870920;
            v123[4] = self;
            v128 = &v130;
            id v124 = v118;
            id v125 = v119;
            id v126 = v5;
            id v127 = v105;
            v129 = buf;
            [v112 obtainAccessAndWaitWithFileWithIdentifier:v56 mode:2 toURLWithHandler:v123];
          }
          else
          {
            v56 = [v119 cplFileURL];
            if (v56)
            {
              [(PLDuplicateMerge *)self _preFileCloneChecksForURL:v56];
              v57 = (id *)(*(void *)&buf[8] + 40);
              id v122 = *(id *)(*(void *)&buf[8] + 40);
              BOOL v58 = +[PLManagedAsset cloneResourceFileFromURL:v118 toURL:v56 forDestinationResource:v119 forDestinationAsset:v5 fileManager:v105 error:&v122];
              objc_storeStrong(v57, v122);
              *((unsigned char *)v131 + 24) = v58;
            }
          }

          if (*((unsigned char *)v131 + 24)) {
            goto LABEL_56;
          }
          v66 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = [v109 shortDescription];
            v68 = [(PLDuplicateMerge *)self targetAsset];
            v69 = [v68 shortDescription];
            uint64_t v70 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v142 = 138543874;
            v143 = v67;
            __int16 v144 = 2114;
            v145 = v69;
            __int16 v146 = 2112;
            uint64_t v147 = v70;
            _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_ERROR, "Duplicate Merge: clone resource file failed: [%{public}@ -> %{public}@] Error: %@", v142, 0x20u);
          }
          if ([v42 isDerivative])
          {
LABEL_56:
            if (v111
              && [v42 isCPLAssetResource]
              && [v42 isCPLResource]
              && !*((unsigned char *)v131 + 24)
              && [v42 isRemotelyAvailable])
            {
              v71 = [v5 additionalAttributes];
              v72 = [v106 scopedIdentifier];
              [v71 setSourceAssetForDuplicationCPLScopedIdentifier:v72];

              [v5 setCloudLocalState:0];
              int v65 = 0;
            }
            else
            {
              int v65 = 0;
            }
          }
          else
          {
            id v73 = *(id *)(*(void *)&buf[8] + 40);

            char v104 = 0;
            int v65 = 4;
            v108 = v73;
          }
          _Block_object_dispose(&v130, 8);
          _Block_object_dispose(buf, 8);
        }
        else
        {
          v59 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v152 = v102;
          v60 = NSString;
          v118 = [v106 uuid];
          v61 = [v5 uuid];
          v62 = [v60 stringWithFormat:@"Duplicate Merge: failed to install new resource on target with external source resource: [%@ -> %@] %@", v118, v61, v117];
          v153 = v62;
          v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
          uint64_t v64 = [v59 errorWithDomain:v101 code:47011 userInfo:v63];

          char v104 = 0;
          int v65 = 4;
          v108 = (void *)v64;
        }

        if (v65) {
          break;
        }
        uint64_t v40 = v116 + 1;
        if (v114 == v116 + 1)
        {
          uint64_t v74 = [obj countByEnumeratingWithState:&v134 objects:v154 count:16];
          uint64_t v114 = v74;
          if (v74) {
            goto LABEL_34;
          }
          break;
        }
      }
    }
    else
    {
      v108 = 0;
      char v104 = 1;
    }

    v75 = [v106 master];
    +[PLCloudMaster deleteMasterIfNecessary:v75 inLibrary:self->_library];

    if (v104)
    {
      v76 = [(PLDuplicateMerge *)self asset];
      uint64_t v77 = [v76 uuid];
      [v109 setResourceSwapAssetUUID:v77];

      mergeModelProperties = self->_mergeModelProperties;
      id v121 = 0;
      LOBYTE(v77) = [(PLDuplicateMergeModelProperties *)mergeModelProperties transferPropertiesFromSourceAsset:v109 propertyMergeType:1 error:&v121];
      v79 = (uint64_t (*)(uint64_t, uint64_t))v121;
      if ((v77 & 1) == 0)
      {
        v80 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v81 = [v109 shortDescription];
          v82 = [(PLDuplicateMerge *)self targetAsset];
          v83 = [v82 shortDescription];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v81;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v83;
          *(_WORD *)&buf[22] = 2112;
          v149 = v79;
          _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_ERROR, "Duplicate Merge: update extended attributes failed: [%@ -> %@] Error: %@", buf, 0x20u);
        }
      }
      if ([v109 resourceComparisonPropertyUpdateLocation]) {
        [(PLDuplicateMerge *)self _mergeLocationFromSource:v109 forceUpdate:1];
      }
      v84 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        v85 = [v109 shortDescription];
        v86 = [(PLDuplicateMerge *)self targetAsset];
        v87 = [v86 shortDescription];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v85;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v87;
        _os_log_impl(&dword_19B3C7000, v84, OS_LOG_TYPE_INFO, "Duplicate Merge: resource merge [%{public}@ -> %{public}@]", buf, 0x16u);
      }
      id v120 = v108;
      BOOL v88 = [(PLDuplicateMerge *)self _mergeAdjustmentsFromSource:v109 error:&v120];
      id v89 = v120;

      if (v88)
      {
        if ((MEMORY[0x19F38C0C0]() & 1) == 0)
        {
          [v5 invalidateThumbnailIfNeededAfterMasterResourceChangeInLibrary:self->_library];
          [v5 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
        }
        -[PLDuplicateMerge _resetMediaAnalysisStateWithType:](self, "_resetMediaAnalysisStateWithType:", [v5 originalHeight] * objc_msgSend(v5, "originalWidth") > 89999);
        id v90 = v89;
        BOOL v91 = 1;
        goto LABEL_88;
      }
      v108 = v89;
    }
    id v92 = v108;
    id v90 = v92;
    if (a4)
    {
      id v90 = v92;
      BOOL v91 = 0;
      *a4 = v90;
    }
    else
    {
      BOOL v91 = 0;
    }
LABEL_88:

    goto LABEL_89;
  }
  v94 = NSString;
  v95 = [v106 uuid];
  v96 = [v5 uuid];
  id obj = [v94 stringWithFormat:@"Duplicate Merge: Invalid non-iCPL original resources: [%@ -> %@]", v95, v96];

  v97 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v156 = *MEMORY[0x1E4F28228];
  v157[0] = obj;
  v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:&v156 count:1];
  id v90 = [v97 errorWithDomain:*MEMORY[0x1E4F8C500] code:47011 userInfo:v98];

  if (a4)
  {
    id v90 = v90;
    BOOL v91 = 0;
    *a4 = v90;
  }
  else
  {
    BOOL v91 = 0;
  }
LABEL_89:

  return v91;
}

void __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _preFileCloneChecksForURL:v5];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v11 + 40);
    BOOL v12 = +[PLManagedAsset cloneResourceFileFromURL:v7 toURL:v5 forDestinationResource:v8 forDestinationAsset:v9 fileManager:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v12;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a3);
  }
}

uint64_t __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke_81()
{
  return 1;
}

uint64_t __51__PLDuplicateMerge_mergeResourcesFromSource_error___block_invoke()
{
  return 1;
}

- (void)_mergeFaceRelationshipsFromSource:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 asset];
  id v6 = [(PLDuplicateMerge *)self asset];
  uint64_t v7 = [v6 faceAdjustmentVersion];
  uint64_t v8 = [v5 faceAdjustmentVersion];
  uint64_t v9 = [v5 detectedFaces];
  uint64_t v10 = [v5 temporalDetectedFaces];
  v60 = [v6 detectedFaces];
  v59 = [v6 temporalDetectedFaces];
  BOOL v58 = [v5 legacyFaces];
  uint64_t v11 = [v6 legacyFaces];
  BOOL v12 = [(PLDuplicateMerge *)self targetAsset];
  int v62 = 0;
  v61 = v11;
  if (![v12 facesUpdated] && !v7 && v8)
  {
    uint64_t v13 = [v9 count];
    BOOL v14 = v13 + [v10 count] == 0;
    uint64_t v11 = v61;
    int v15 = !v14;
    int v62 = v15;
  }
  v56 = (void *)v7;

  if ([v11 count]) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = [v58 count] != 0;
  }
  v57 = v9;
  int v54 = v10;
  v55 = v8;
  if (v62)
  {
    [v6 setDetectedFaces:v9];
    [v6 setTemporalDetectedFaces:v10];
    objc_msgSend(v6, "setFaceAreaPoints:", objc_msgSend(v5, "faceAreaPoints"));
    long long v17 = [v5 additionalAttributes];
    long long v18 = [v17 faceRegions];
    v19 = [v6 additionalAttributes];
    [v19 setFaceRegions:v18];

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if ([v60 count])
    {
      v21 = [v60 allObjects];
      [v20 addObjectsFromArray:v21];
    }
    id v52 = v4;
    if ([v59 count])
    {
      uint64_t v22 = [v59 allObjects];
      [v20 addObjectsFromArray:v22];
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v23 = v20;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v68 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          id v29 = [v28 associatedAssetForFaceOrTorso:1 orTemporal:1];

          if (v29)
          {
            v31 = [MEMORY[0x1E4F28B00] currentHandler];
            [v31 handleFailureInMethod:a2, self, @"PLDuplicateMerge.m", 242, @"Invalid parameter not satisfying: %@", @"[face associatedAssetForFaceOrTorso:YES orTemporal:YES] == nil" object file lineNumber description];
          }
          v30 = [v28 managedObjectContext];
          [v30 deleteObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v25);
    }

    PLResetMediaProcessingStateOnAsset(3, v5, 1);
    v32 = [(PLDuplicateMerge *)self targetAsset];
    [v32 setFacesUpdated:1];

    id v4 = v52;
    uint64_t v10 = v54;
    uint64_t v8 = v55;
    uint64_t v9 = v57;
    uint64_t v11 = v61;
  }
  if (v16)
  {
    v33 = [v5 legacyFaces];
    [v6 setLegacyFaces:v33];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v34 = v11;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v64 != v37) {
            objc_enumerationMutation(v34);
          }
          __int16 v39 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          uint64_t v40 = [v39 asset];

          if (v40)
          {
            id v42 = [MEMORY[0x1E4F28B00] currentHandler];
            [v42 handleFailureInMethod:a2, self, @"PLDuplicateMerge.m", 253, @"Invalid parameter not satisfying: %@", @"face.asset == nil" object file lineNumber description];
          }
          uint64_t v41 = [v39 managedObjectContext];
          [v41 deleteObject:v39];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v36);
    }

    v43 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = [v4 shortDescription];
      v45 = [(PLDuplicateMerge *)self targetAsset];
      v46 = [v45 shortDescription];
      *(_DWORD *)buf = 138543618;
      v72 = v44;
      __int16 v73 = 2114;
      uint64_t v74 = v46;
      _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_INFO, "Duplicate Merge: merged over legacy faces: [%{public}@ -> %{public}@]", buf, 0x16u);
    }
    uint64_t v10 = v54;
    uint64_t v8 = v55;
    uint64_t v9 = v57;
    uint64_t v11 = v61;
  }
  if (v62)
  {
    [(PLDuplicateMerge *)self _resetMediaAnalysisStateWithType:1];
    id v47 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      uint64_t v48 = [v4 shortDescription];
      v49 = [(PLDuplicateMerge *)self targetAsset];
      [v49 shortDescription];
      uint64_t v51 = v50 = v10;
      *(_DWORD *)buf = 138543618;
      v72 = v48;
      __int16 v73 = 2114;
      uint64_t v74 = v51;
      _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_INFO, "Duplicate Merge: merged over faces: [%{public}@ -> %{public}@]", buf, 0x16u);

      uint64_t v10 = v50;
      uint64_t v11 = v61;

      uint64_t v9 = v57;
    }
  }
}

- (void)_mergeSharedLibraryMetadataFromSource:(id)a3
{
  id v21 = [a3 asset];
  id v4 = [(PLDuplicateMerge *)self asset];
  uint64_t v5 = [v4 libraryScope];
  if (v5)
  {
    id v6 = (void *)v5;
    int v7 = [v4 libraryScopeShareState];

    if ((v7 & 0x800000) != 0)
    {
      uint64_t v8 = [v4 libraryScope];
      uint64_t v9 = [v4 libraryScopeContributors];
      uint64_t v10 = (void *)[v9 mutableCopy];

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      BOOL v12 = [v21 libraryScope];

      if (v12)
      {
        uint64_t v13 = [v21 libraryScopeContributors];
        uint64_t v14 = [v13 count];

        if (!v14)
        {
LABEL_8:
          [v4 setLibraryScope:v8 withContributors:v10];
          id v20 = [v4 additionalAttributes];
          [v20 appendLibraryScopeAssetContributorsToUpdate:v11];

          goto LABEL_9;
        }
        int v15 = [v21 libraryScopeContributors];
        BOOL v16 = [v15 allObjects];
        [v10 addObjectsFromArray:v16];

        long long v17 = [v21 libraryScopeContributors];
        long long v18 = [v17 allObjects];
        v19 = objc_msgSend(v18, "_pl_map:", &__block_literal_global_65_87370);
        [v11 addObjectsFromArray:v19];
      }
      else
      {
        long long v17 = [v8 currentUserParticipant];
        [v10 addObject:v17];
        long long v18 = [v17 userIdentifier];
        [v11 addObject:v18];
      }

      goto LABEL_8;
    }
  }
LABEL_9:
}

uint64_t __58__PLDuplicateMerge__mergeSharedLibraryMetadataFromSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 userIdentifier];
}

- (void)_mergeLocationFromSource:(id)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(PLDuplicateMerge *)self targetAsset];
  if (([v7 locationUpdated] & 1) != 0
    || ![(PLDuplicateMerge *)self _isValidForLocationOverwriteWithSource:v6])
  {

    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v8 = [(PLDuplicateMerge *)self asset];
  uint64_t v9 = [v6 asset];
  uint64_t v10 = [v9 location];
  [v8 setLocation:v10];

  id v11 = [(PLDuplicateMerge *)self targetAsset];
  [v11 setLocationUpdated:1];

  BOOL v12 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = @"NO";
    if (v4) {
      uint64_t v13 = @"YES";
    }
    uint64_t v14 = v13;
    int v15 = [v8 location];
    BOOL v16 = [v6 shortDescription];
    long long v17 = [(PLDuplicateMerge *)self targetAsset];
    long long v18 = [v17 shortDescription];
    int v19 = 138544130;
    id v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    __int16 v23 = 2114;
    uint64_t v24 = v16;
    __int16 v25 = 2114;
    uint64_t v26 = v18;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Duplicate Merge: location (forced:%{public}@): \"%@\" [%{public}@ -> %{public}@]", (uint8_t *)&v19, 0x2Au);
  }
LABEL_10:
}

- (void)_mergeMetadataFromSource:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  mergeModelProperties = self->_mergeModelProperties;
  id v12 = 0;
  BOOL v6 = [(PLDuplicateMergeModelProperties *)mergeModelProperties transferPropertiesFromSourceAsset:v4 propertyMergeType:0 error:&v12];
  id v7 = v12;
  if (!v6)
  {
    uint64_t v8 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [v4 shortDescription];
      uint64_t v10 = [(PLDuplicateMerge *)self targetAsset];
      id v11 = [v10 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      BOOL v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Duplicate Merge: failed to merge properties for %{public}@, target asset: %{public}@. Error: %@", buf, 0x20u);
    }
  }
  [(PLDuplicateMerge *)self _mergeLocationFromSource:v4 forceUpdate:0];
  [(PLDuplicateMerge *)self _mergeSharedLibraryMetadataFromSource:v4];
  [(PLDuplicateMerge *)self _mergeFaceRelationshipsFromSource:v4];
}

- (PLDuplicateMerge)mergeWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__87342;
  __int16 v15 = __Block_byref_object_dispose__87343;
  id v16 = 0;
  library = self->_library;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__PLDuplicateMerge_mergeWithError___block_invoke;
  v10[3] = &unk_1E5875A90;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  [(PLPhotoLibrary *)library performBlockAndWait:v10];
  int v5 = *((unsigned __int8 *)v18 + 24);
  id v6 = (id)v12[5];
  id v7 = v6;
  if (!v5 && a3) {
    *a3 = v6;
  }

  uint64_t v8 = (PLDuplicateMerge *)*((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __35__PLDuplicateMerge_mergeWithError___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) sortedArrayUsingComparator:&__block_literal_global_87381];
  BOOL v3 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) targetAsset];
    int v5 = [v4 privateDescription];
    id v6 = [v2 valueForKey:@"privateDescription"];
    *(_DWORD *)buf = 138543618;
    id v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: merging assets into target [%{public}@] : %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__PLDuplicateMerge_mergeWithError___block_invoke_59;
  v8[3] = &unk_1E58708D8;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 8) managedObjectContext];
    [v7 rollback];
  }
}

void __35__PLDuplicateMerge_mergeWithError___block_invoke_59(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 shortDescription];
    long long v9 = [*(id *)(a1 + 32) targetAsset];
    uint64_t v10 = [v9 shortDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v8;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: %{public}@ -> %{public}@", buf, 0x16u);
  }
  uint64_t v11 = [v6 asset];
  [v11 trashWithReason:3];

  [*(id *)(a1 + 32) _mergeMetadataFromSource:v6];
  id v12 = [*(id *)(a1 + 32) targetAsset];
  if (([v12 resourceSwapDisabled] & 1) == 0)
  {
    __int16 v13 = [*(id *)(a1 + 32) targetAsset];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v14 + 40);
    uint64_t v15 = [v13 compareResource:v6 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);

    if (v15 != -1) {
      goto LABEL_7;
    }
    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v24 = *(id *)(v17 + 40);
    [v16 mergeResourcesFromSource:v6 error:&v24];
    id v18 = v24;
    id v12 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v18;
  }

LABEL_7:
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v19 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      char v20 = [v6 shortDescription];
      __int16 v21 = [*(id *)(a1 + 32) targetAsset];
      uint64_t v22 = [v21 shortDescription];
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v20;
      __int16 v28 = 2114;
      id v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v23;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Duplicate Merge: terminating merge for source asset %{public}@, target asset: %{public}@. Error: %@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __35__PLDuplicateMerge_mergeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (PLManagedAsset)asset
{
  return [(PLDuplicateAsset *)self->_targetAsset asset];
}

- (PLDuplicateMerge)initWithSourceAssets:(id)a3 targetAsset:(id)a4 photolibrary:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    char v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLDuplicateMerge.m", 96, @"Invalid parameter not satisfying: %@", @"sourceAssets" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PLDuplicateMerge.m", 97, @"Invalid parameter not satisfying: %@", @"targetAsset" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PLDuplicateMerge;
  __int16 v13 = [(PLDuplicateMerge *)&v22 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_library, a5);
    uint64_t v15 = [[PLDuplicateMergeCrashRecovery alloc] initWithPhotoLibrary:v12];
    mergeCrashRecovery = v14->_mergeCrashRecovery;
    v14->_mergeCrashRecovery = v15;

    objc_storeStrong((id *)&v14->_sourceAssets, a3);
    objc_storeStrong((id *)&v14->_targetAsset, a4);
    uint64_t v17 = [[PLDuplicateMergeModelProperties alloc] initWithTargetAsset:v11 photoLibrary:v12];
    mergeModelProperties = v14->_mergeModelProperties;
    v14->_mergeModelProperties = v17;
  }
  return v14;
}

+ (BOOL)mergeAssets:(id)a3 targetAssetOID:(id)a4 photolibrary:(id)a5 error:(id *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_26:
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"PLDuplicateMerge.m", 66, @"Invalid parameter not satisfying: %@", @"targetOID" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_27;
  }
  uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, a1, @"PLDuplicateMerge.m", 65, @"Invalid parameter not satisfying: %@", @"assets" object file lineNumber description];

  if (!v11) {
    goto LABEL_26;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_27:
  uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, a1, @"PLDuplicateMerge.m", 67, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

LABEL_4:
  id v39 = v12;
  uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (([v19 isMergeReady] & 1) == 0)
        {
          id v24 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            __int16 v25 = [v19 shortDescription];
            *(_DWORD *)buf = 138543362;
            uint64_t v48 = v25;
            _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Duplicate Merge: Skipping merge, asset is not merge ready: %{public}@", buf, 0xCu);
          }
          uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F8C500];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          v46 = @"Merge skipped asset failed isMergeReady";
          __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          id v29 = [v26 errorWithDomain:v27 code:49405 userInfo:v28];
          __int16 v30 = v29;
          uint64_t v31 = v39;
          uint64_t v32 = v40;
          if (a6) {
            *a6 = v29;
          }

          char v33 = 0;
          goto LABEL_24;
        }
        char v20 = [v19 asset];
        __int16 v21 = [v20 objectID];
        int v22 = [v21 isEqual:v11];

        if (v22)
        {
          id v23 = v19;

          id v16 = v23;
        }
        else if (v20)
        {
          [v40 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }

  uint64_t v31 = v39;
  uint64_t v32 = v40;
  __int16 v28 = [[PLDuplicateMerge alloc] initWithSourceAssets:v40 targetAsset:v16 photolibrary:v39];
  char v33 = (char)[(PLDuplicateMerge *)v28 mergeWithError:a6];
LABEL_24:

  return v33;
}

@end