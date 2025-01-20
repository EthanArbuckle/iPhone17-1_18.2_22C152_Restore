@interface PLCTMPairingProcessor
- (BOOL)_copyResourcesFromSoc:(id)a3 toPrimary:(id)a4 error:(id *)a5;
- (BOOL)deferredProcessingNeeded;
- (id)_mapResourcesFromSoc:(id)a3 toPrimary:(id)a4 error:(id *)a5;
- (id)combinePair:(id)a3 error:(id *)a4;
- (id)ctmFetchRequestWithPredicate:(id)a3;
- (id)fetchRequestForLibrary;
- (id)fetchRequestForSortedGroupIDs:(id)a3;
- (id)firstGroupFromAssets:(id)a3;
- (id)groupIDForAsset:(id)a3;
- (void)_installSocResourcesFromSoc:(id)a3 toPrimary:(id)a4 referencedResourceURLs:(id)a5;
- (void)setDeferredProcessingIfNescessaryForAsset:(id)a3;
- (void)setDeferredProcessingNeeded:(BOOL)a3;
@end

@implementation PLCTMPairingProcessor

- (void)setDeferredProcessingNeeded:(BOOL)a3
{
  self->_deferredProcessingNeeded = a3;
}

- (BOOL)deferredProcessingNeeded
{
  return self->_deferredProcessingNeeded;
}

- (void)_installSocResourcesFromSoc:(id)a3 toPrimary:(id)a4 referencedResourceURLs:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v12 isPhoto])
  {
    id v9 = +[PLResourceInstaller onDemand_installOriginalSOCImagePresentForAsset:v7 referencedResourceURLs:v8];
    if ([v12 isPhotoIris]) {
      id v10 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:v7 referencedResourceURLs:v8];
    }
  }
  else
  {
    id v11 = +[PLResourceInstaller onDemand_installOriginalSOCVideoPresentForAsset:v7 referencedResourceURLs:v8];
  }
}

- (BOOL)_copyResourcesFromSoc:(id)a3 toPrimary:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v23 = 0;
  BOOL v10 = -[PLPairingProcessor _copyResourceOfType:onAsset:toType:onAsset:error:](self, "_copyResourceOfType:onAsset:toType:onAsset:error:", [v9 isPhoto] ^ 1, v8, 10, v9, &v23);
  id v11 = v23;
  if (v10 && [v8 isPhotoIris])
  {
    id v22 = v11;
    BOOL v12 = [(PLPairingProcessor *)self _copyResourceOfType:3 onAsset:v8 toType:11 onAsset:v9 error:&v22];
    id v13 = v22;

    if (!v12)
    {
      v14 = _pathForResourceType(v9, 10);
      if (v14)
      {
        v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
        v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v21 = 0;
        char v17 = [v16 removeItemAtURL:v15 error:&v21];
        id v18 = v21;

        if ((v17 & 1) == 0)
        {
          v19 = PLBackendGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v15;
            __int16 v26 = 2112;
            id v27 = v18;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error trying to clean up copy at %@: %@", buf, 0x16u);
          }
        }
      }
    }
  }
  else
  {
    id v13 = v11;
  }
  if (a5) {
    *a5 = v13;
  }

  return v13 == 0;
}

- (id)_mapResourcesFromSoc:(id)a3 toPrimary:(id)a4 error:(id *)a5
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [v6 primaryStoreOriginalResource];
  id v9 = [v8 referenceMediaFileURL];

  if (!v9)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v28[0] = @"Couldn't get file URL.";
    v27[0] = v17;
    v27[1] = @"Resource Object Id";
    id v11 = [v6 primaryStoreOriginalResource];
    id v13 = [v11 objectID];
    v28[1] = v13;
    v27[2] = @"Asset UUID";
    id v18 = [v6 uuid];
    v28[2] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    v14 = [v15 errorWithDomain:v16 code:41003 userInfo:v19];

    goto LABEL_7;
  }
  [v7 setObject:v9 forKeyedSubscript:&unk_1EEBEF030];
  if ([v6 isPhotoIris])
  {
    BOOL v10 = _originalResourceOfType(v6, 3);
    id v11 = v10;
    if (!v10)
    {
      v14 = 0;
LABEL_8:

      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v12 = [v10 referenceMediaFileURL];
    if (v12)
    {
      id v13 = (void *)v12;
      [v7 setObject:v12 forKeyedSubscript:&unk_1EEBEF000];
      v14 = 0;
    }
    else
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F8C500];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      v30[0] = @"Couldn't get file URL.";
      v29[0] = v23;
      v29[1] = @"Resource Object Id";
      v24 = [v11 objectID];
      v30[1] = v24;
      v29[2] = @"Asset UUID";
      v25 = [v6 uuid];
      v30[2] = v25;
      __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
      v14 = [v21 errorWithDomain:v22 code:41003 userInfo:v26];

      id v13 = 0;
    }
LABEL_7:

    goto LABEL_8;
  }
  v14 = 0;
  if (a5) {
LABEL_9:
  }
    *a5 = v14;
LABEL_10:

  return v7;
}

- (void)setDeferredProcessingIfNescessaryForAsset:(id)a3
{
  id v7 = a3;
  v4 = [v7 additionalAttributes];
  v5 = [v4 unmanagedAdjustment];
  char v6 = [v5 adjustmentRenderTypes];

  if ((v6 & 0x30) != 0)
  {
    [v7 setDeferredProcessingNeeded:2];
    [(PLCTMPairingProcessor *)self setDeferredProcessingNeeded:1];
  }
}

- (id)ctmFetchRequestWithPredicate:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    char v6 = (void *)MEMORY[0x1E4F28BA0];
    v15[0] = v4;
    id v7 = [(PLPairingProcessor *)self locatedInUsersPhotoLibrary];
    v15[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v9 = [v6 andPredicateWithSubpredicates:v8];

    BOOL v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = +[PLManagedAsset entityName];
    v5 = [v10 fetchRequestWithEntityName:v11];

    [v5 setPredicate:v9];
    [v5 setResultType:0];
    v14[0] = @"additionalAttributes";
    v14[1] = @"albums";
    v14[2] = @"modernResources";
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [v5 setRelationshipKeyPathsForPrefetching:v12];
  }
  else
  {
    id v9 = 0;
  }

  return v5;
}

- (id)fetchRequestForSortedGroupIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  char v6 = [v4 predicateWithFormat:@"%K in %@ and noindex:(%K) == %d", @"additionalAttributes.spatialOverCaptureGroupIdentifier", v5, @"trashedState", 0];
  id v7 = [(PLCTMPairingProcessor *)self ctmFetchRequestWithPredicate:v6];
  unint64_t v8 = [v5 count];

  if (v8 >= 0x65) {
    [v7 setFetchBatchSize:100];
  }

  return v7;
}

- (id)fetchRequestForLibrary
{
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil and %K != '' and noindex:(%K) == %d", @"additionalAttributes.spatialOverCaptureGroupIdentifier", @"additionalAttributes.spatialOverCaptureGroupIdentifier", @"trashedState", 0);
  id v4 = [(PLCTMPairingProcessor *)self ctmFetchRequestWithPredicate:v3];
  [v4 setFetchBatchSize:100];

  return v4;
}

- (id)combinePair:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  char v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = [v7 objectForKeyedSubscript:&unk_1EEBEEFA0];
  id v10 = [v7 objectForKeyedSubscript:&unk_1EEBEEFB8];
  id v11 = [v7 objectForKeyedSubscript:&unk_1EEBEF018];

  [MEMORY[0x1E4F8BA10] maskForReferencedAsset];
  [v9 savedAssetType];
  if (PLValidatedSavedAssetTypeApplies())
  {
    if (v10)
    {
      id v39 = 0;
      uint64_t v12 = [(PLCTMPairingProcessor *)self _mapResourcesFromSoc:v10 toPrimary:v9 error:&v39];
      id v13 = v39;
      [v8 addEntriesFromDictionary:v12];

      if (v13)
      {
        v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v10 uuid];
          uint64_t v16 = [v9 uuid];
          *(_DWORD *)buf = 138412802;
          v43 = v15;
          __int16 v44 = 2112;
          v45 = v16;
          __int16 v46 = 2112;
          id v47 = v13;
          uint64_t v17 = "Failed to map resources from asset '%@' (soc) to asset '%@' (primary): %@";
LABEL_25:
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);

          goto LABEL_26;
        }
        goto LABEL_26;
      }
      [(PLCTMPairingProcessor *)self _installSocResourcesFromSoc:v10 toPrimary:v9 referencedResourceURLs:v8];
      goto LABEL_30;
    }
    if (v11)
    {
      id v10 = v11;
      v20 = [v10 primaryStoreOriginalResource];
      id v21 = [v20 referenceMediaFileURL];

      if (v21)
      {
        [v8 setObject:v21 forKeyedSubscript:&unk_1EEBEF000];
        id v22 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:v9 referencedResourceURLs:v8];
        id v13 = 0;
      }
      else
      {
        id v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F8C500];
        uint64_t v28 = *MEMORY[0x1E4F28228];
        v41[0] = @"Couldn't get file URL.";
        v40[0] = v28;
        v40[1] = @"Resource Object Id";
        v36 = [v10 primaryStoreOriginalResource];
        v34 = [v36 objectID];
        v41[1] = v34;
        v40[2] = @"Asset UUID";
        v29 = [v10 uuid];
        v41[2] = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
        id v13 = [v27 errorWithDomain:v35 code:41003 userInfo:v30];
      }
      if (v13) {
        goto LABEL_27;
      }
      goto LABEL_30;
    }
LABEL_20:
    id v10 = 0;
    goto LABEL_30;
  }
  if (!v10)
  {
    if (!v11) {
      goto LABEL_20;
    }
    id v10 = v11;
    id v37 = 0;
    BOOL v23 = [(PLPairingProcessor *)self _copyResourceOfType:1 onAsset:v10 toType:11 onAsset:v9 error:&v37];
    id v24 = v37;
    id v13 = v24;
    if (!v23)
    {
      if (v24)
      {
        v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v10 uuid];
          uint64_t v16 = [v9 uuid];
          *(_DWORD *)buf = 138412802;
          v43 = v15;
          __int16 v44 = 2112;
          v45 = v16;
          __int16 v46 = 2112;
          id v47 = v13;
          uint64_t v17 = "Failed to combine resource from asset '%@' (vidcomp) with asset '%@' (pri_img) as a CTM (vidcomp_soc) resource: %@";
          goto LABEL_25;
        }
        goto LABEL_26;
      }
      goto LABEL_30;
    }
    id v25 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:v9 referencedResourceURLs:0];
    if (!v13) {
      goto LABEL_30;
    }
LABEL_27:
    int v26 = 0;
    goto LABEL_31;
  }
  id v38 = 0;
  BOOL v18 = [(PLCTMPairingProcessor *)self _copyResourcesFromSoc:v10 toPrimary:v9 error:&v38];
  id v19 = v38;
  id v13 = v19;
  if (v18)
  {
    [(PLCTMPairingProcessor *)self _installSocResourcesFromSoc:v10 toPrimary:v9 referencedResourceURLs:0];
    if (!v13) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
  if (v19)
  {
    v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [v10 uuid];
      uint64_t v16 = [v9 uuid];
      *(_DWORD *)buf = 138412802;
      v43 = v15;
      __int16 v44 = 2112;
      v45 = v16;
      __int16 v46 = 2112;
      id v47 = v13;
      uint64_t v17 = "Failed to copy resources from asset '%@' (soc) to asset '%@' (primary): %@";
      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_30:
  [(PLPairingProcessor *)self updatePrimaryAsset:v9 andRemoveAssetIfPossible:v10];
  id v13 = 0;
  int v26 = 1;
LABEL_31:
  _updateCameraProcessingAdjustmentState(v9);
  if (a4) {
    *a4 = v13;
  }
  if (v26) {
    v31 = v9;
  }
  else {
    v31 = 0;
  }
  id v32 = v31;

  return v32;
}

- (id)firstGroupFromAssets:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v30;
    id v26 = v5;
    id v27 = v4;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x19F38D3B0]();
        v14 = [v12 metadataFromMediaPropertiesOrOriginalResource];
        v15 = v14;
        unsigned __int8 v28 = 0;
        if (!v14)
        {
          [v4 addObject:v12];
          if (!v9) {
            goto LABEL_30;
          }
          goto LABEL_19;
        }
        if ([v14 isSpatialOverCapture])
        {
          if (v8) {
            goto LABEL_18;
          }
          if (v9)
          {
            if (!_arePairableCTMAssetKinds(v9, v12, &v28)
              || (id v16 = v12,
                  int v17 = [v9 savedAssetType],
                  int v18 = [v16 savedAssetType],
                  v16,
                  BOOL v19 = v17 == v18,
                  id v5 = v26,
                  id v4 = v27,
                  !v19))
            {
              id v20 = 0;
LABEL_29:
              id v8 = v20;
              id v4 = v27;
              goto LABEL_30;
            }
          }
          id v8 = v12;
          if (v9) {
            goto LABEL_19;
          }
        }
        else
        {
          if (v9)
          {
LABEL_18:
            if (!v9) {
              goto LABEL_30;
            }
LABEL_19:
            if (v8)
            {
              v33[0] = &unk_1EEBEEFA0;
              v34[0] = v9;
              id v22 = [NSNumber numberWithUnsignedChar:v28];
              v33[1] = v22;
              v34[1] = v8;
              BOOL v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

              goto LABEL_37;
            }
            goto LABEL_30;
          }
          if (v8)
          {
            if (!_arePairableCTMAssetKinds(v12, v8, &v28))
            {
              id v20 = v8;
              goto LABEL_29;
            }
            id v20 = v8;
            int v25 = [v12 savedAssetType];
            int v21 = [v20 savedAssetType];

            BOOL v19 = v25 == v21;
            id v5 = v26;
            if (!v19) {
              goto LABEL_29;
            }
          }
          id v9 = v12;
          id v4 = v27;
          if (v9) {
            goto LABEL_19;
          }
        }
LABEL_30:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (!v7) {
        goto LABEL_34;
      }
    }
  }
  id v8 = 0;
  id v9 = 0;
LABEL_34:

  if ([v4 count]) {
    [v5 removeObjectsInArray:v4];
  }
  BOOL v23 = 0;
LABEL_37:

  return v23;
}

- (id)groupIDForAsset:(id)a3
{
  id v3 = [a3 additionalAttributes];
  id v4 = [v3 spatialOverCaptureGroupIdentifier];

  return v4;
}

@end