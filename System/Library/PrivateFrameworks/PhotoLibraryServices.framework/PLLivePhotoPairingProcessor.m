@interface PLLivePhotoPairingProcessor
- (id)combinePair:(id)a3 error:(id *)a4;
- (id)fetchRequestForLibrary;
- (id)fetchRequestForSortedGroupIDs:(id)a3;
- (id)firstGroupFromAssets:(id)a3;
- (id)groupIDForAsset:(id)a3;
- (id)livePhotoFetchRequestWithPredicate:(id)a3;
@end

@implementation PLLivePhotoPairingProcessor

- (id)livePhotoFetchRequestWithPredicate:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F28BA0];
    v15[0] = v4;
    v7 = [(PLPairingProcessor *)self locatedInUsersPhotoLibrary];
    v15[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v9 = [v6 andPredicateWithSubpredicates:v8];

    v10 = (void *)MEMORY[0x1E4F1C0D0];
    v11 = +[PLManagedAsset entityName];
    v5 = [v10 fetchRequestWithEntityName:v11];

    [v5 setPredicate:v9];
    [v5 setResultType:0];
    v14[0] = @"additionalAttributes";
    v14[1] = @"albums";
    v14[2] = @"modernResources";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [v5 setRelationshipKeyPathsForPrefetching:v12];
  }
  else
  {
    v9 = 0;
  }

  return v5;
}

- (id)fetchRequestForSortedGroupIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  v6 = [v4 predicateWithFormat:@"%K in %@ and noindex:(%K) == %d and SUBQUERY(modernResources, $r, $r.resourceType == %d).@count == 0", @"mediaGroupUUID", v5, @"trashedState", 0, 3];
  v7 = [(PLLivePhotoPairingProcessor *)self livePhotoFetchRequestWithPredicate:v6];
  unint64_t v8 = [v5 count];

  if (v8 >= 0x65) {
    [v7 setFetchBatchSize:100];
  }

  return v7;
}

- (id)fetchRequestForLibrary
{
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil and %K != '' and noindex:(%K) == %d and SUBQUERY(modernResources, $r, $r.resourceType == %d).@count == 0", @"mediaGroupUUID", @"mediaGroupUUID", @"trashedState", 0, 3];
  id v4 = [(PLLivePhotoPairingProcessor *)self livePhotoFetchRequestWithPredicate:v3];
  [v4 setFetchBatchSize:100];

  return v4;
}

- (id)combinePair:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:&unk_1EEBEEFD0];
  unint64_t v8 = [v6 objectForKeyedSubscript:&unk_1EEBEEFE8];

  [MEMORY[0x1E4F8BA10] maskForReferencedAsset];
  [v7 savedAssetType];
  int v9 = PLValidatedSavedAssetTypeApplies();
  v10 = _originalResourceOfType(v8, 10);
  if (!v10) {
    goto LABEL_4;
  }
  if (v9)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    v12 = [v10 referenceMediaFileURL];
    [v11 setObject:v12 forKeyedSubscript:&unk_1EEBEF000];

    id v13 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:v7 referencedResourceURLs:v11];
    goto LABEL_4;
  }
  id v44 = 0;
  BOOL v19 = [(PLPairingProcessor *)self _copyResourceOfType:10 onAsset:v8 toType:11 onAsset:v7 error:&v44];
  id v20 = v44;
  v21 = v20;
  if (v19)
  {
    id v22 = +[PLResourceInstaller onDemand_installOriginalSOCVideoComplementPresentForAsset:v7 referencedResourceURLs:0];
    if (!v21)
    {
LABEL_4:
      v14 = [v8 mainFileURL];
      v15 = [v14 path];
      v16 = PFVideoComplementMetadataForVideoAtPath();

      v17 = [v7 mediaGroupUUID];
      v18 = [v8 mainFileURL];
      if (v16)
      {
        [v16 videoDuration];
        [v16 imageDisplayTime];
      }
      else
      {
        memset(v43, 0, sizeof(v43));
        memset(v42, 0, sizeof(v42));
      }
      if (v9) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 0;
      }
      int v24 = [v7 becomePhotoIrisWithMediaGroupUUID:v17 mainFileMetadata:0 videoURL:v18 videoDuration:v43 stillDisplayTime:v42 options:v23];

      if (v24)
      {
      }
      else
      {
        v40 = self;
        v41 = a4;
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F8C500];
        uint64_t v45 = *MEMORY[0x1E4F28228];
        v27 = NSString;
        v28 = [v7 uuid];
        v29 = [v8 uuid];
        v30 = [v27 stringWithFormat:@"Failed to combine asset '%@' (prim_img) and asset '%@' (vidcomp) as a LivePhoto", v28, v29];
        v46 = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v21 = [v25 errorWithDomain:v26 code:41003 userInfo:v31];

        v32 = PLBackendGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v48 = v21;
          _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        self = v40;
        [(PLPairingProcessor *)v40 _deleteResourceOfType:11 forAsset:v7 verifyInserted:0 deleteFile:1];

        int v33 = 0;
        a4 = v41;
        if (v21)
        {
LABEL_19:
          if (!a4) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
      [(PLPairingProcessor *)self updatePrimaryAsset:v7 andRemoveAssetIfPossible:v8];
      v21 = 0;
      int v33 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    if (!v20) {
      goto LABEL_4;
    }
    v37 = PLBackendGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = [v8 uuid];
      v39 = [v7 uuid];
      *(_DWORD *)buf = 138412802;
      v48 = v38;
      __int16 v49 = 2112;
      v50 = v39;
      __int16 v51 = 2112;
      v52 = v21;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to combine resource from asset '%@' (vidcomp) with asset '%@' (pri_img) as a CTM (soc) resource: %@", buf, 0x20u);
    }
  }
  int v33 = 0;
  if (a4) {
LABEL_20:
  }
    *a4 = v21;
LABEL_21:
  if (v33) {
    v34 = v7;
  }
  else {
    v34 = 0;
  }
  id v35 = v34;

  return v35;
}

- (id)firstGroupFromAssets:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = a3;
  id v4 = (void *)[v3 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (!v4)
  {
    id v6 = 0;
    id v5 = 0;
    goto LABEL_31;
  }
  id v5 = 0;
  id v6 = 0;
  uint64_t v7 = *(void *)v23;
  do
  {
    unint64_t v8 = 0;
    do
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v3);
      }
      int v9 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v8);
      v10 = (void *)MEMORY[0x19F38D3B0]();
      if (![v9 isVideo])
      {
        if ([v9 isPhoto])
        {
          if (!v6)
          {
            if (v5)
            {
              id v14 = v9;
              int v15 = [v5 savedAssetType];
              int v16 = [v14 savedAssetType];

              if (v15 != v16)
              {
                id v6 = 0;
                goto LABEL_23;
              }
            }
            id v6 = v9;
          }
LABEL_17:
          if (!v6) {
            goto LABEL_23;
          }
        }
        else
        {
          v17 = PLBackendGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v18 = [v9 kind];
            BOOL v19 = [v9 uuid];
            *(_DWORD *)buf = 67240450;
            int v29 = v18;
            __int16 v30 = 2114;
            v31 = v19;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unexpected asset kind (%{public}d) for asset %{public}@", buf, 0x12u);
          }
          if (!v6) {
            goto LABEL_23;
          }
        }
LABEL_22:
        if (v5)
        {
          v26[0] = &unk_1EEBEEFD0;
          v26[1] = &unk_1EEBEEFE8;
          v27[0] = v6;
          v27[1] = v5;
          id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
          goto LABEL_31;
        }
        goto LABEL_23;
      }
      if (v5) {
        goto LABEL_17;
      }
      if (v6)
      {
        id v11 = v9;
        int v12 = [v6 savedAssetType];
        int v13 = [v11 savedAssetType];

        if (v12 != v13)
        {
          id v5 = 0;
          goto LABEL_23;
        }
      }
      id v5 = v9;
      if (v6) {
        goto LABEL_22;
      }
LABEL_23:
      unint64_t v8 = (char *)v8 + 1;
    }
    while (v4 != v8);
    uint64_t v20 = [v3 countByEnumeratingWithState:&v22 objects:v32 count:16];
    id v4 = (void *)v20;
  }
  while (v20);
LABEL_31:

  return v4;
}

- (id)groupIDForAsset:(id)a3
{
  return (id)[a3 mediaGroupUUID];
}

@end