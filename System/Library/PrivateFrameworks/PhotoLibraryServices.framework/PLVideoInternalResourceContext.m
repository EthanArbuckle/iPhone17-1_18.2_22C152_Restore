@interface PLVideoInternalResourceContext
- (BOOL)hasAdjustments;
- (BOOL)isOriginalSlomo;
- (BOOL)isPhotoIris;
- (BOOL)isWalrusEnabled;
- (BOOL)shouldUseNonAdjustedVersion;
- (BOOL)validateResource:(id)a3;
- (PLVideoInternalResourceContext)initWithManagedObjectContext:(id)a3 asset:(id)a4;
- (double)sizeThresholdForHighQuality;
- (id)backingResourceForVideoResource:(id)a3;
- (id)onDemandInstallAdjustedFullSizeVideoComplementResourceIfPresent;
- (id)uuid;
- (id)videoResourcesMatchingVersions:(id)a3;
- (void)repairResource:(id)a3;
@end

@implementation PLVideoInternalResourceContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_moc, 0);
}

- (BOOL)isWalrusEnabled
{
  return self->_isWalrusEnabled;
}

- (BOOL)validateResource:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isLocallyAvailable])
    {
      v5 = [v4 fileURLIfLocal];
      v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      v7 = [v5 path];
      char v8 = [v6 fileExistsAtPath:v7];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)repairResource:(id)a3
{
  id v8 = a3;
  id v3 = [v8 backingResource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = v8;
  if (isKindOfClass)
  {
    v6 = [v8 backingResource];
    v7 = [v6 fileSystemBookmark];

    if (!v7) {
      [v6 markAsNotLocallyAvailable];
    }

    v5 = v8;
  }
}

- (id)onDemandInstallAdjustedFullSizeVideoComplementResourceIfPresent
{
  v2 = +[PLResourceInstaller onDemand_installAdjustedFullSizeVideoComplementResourceIfPresentForAsset:self->_asset];
  if (v2) {
    id v3 = [[PLVideoInternalResource alloc] initWithBackingResource:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)videoResourcesMatchingVersions:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"utiConformanceHint == %d AND resourceType IN %@", 3, &unk_1EEBF21E0];
  BOOL isWalrusEnabled = self->_isWalrusEnabled;
  v7 = [(PLManagedAsset *)self->_asset objectID];
  id v8 = [(PLManagedAsset *)self->_asset managedObjectContext];
  v30 = (void *)v5;
  v31 = v4;
  v9 = +[PLManagedAsset fetchResourcesForAssetWithObjectID:v7 inContext:v8 versions:v4 includeVirtualResources:1 allowDerivatives:1 excludeDynamicCPLResources:isWalrusEnabled additionalPredicate:v5 relationshipKeyPathsForPrefetching:0 error:0];

  v10 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (![v16 isVirtual])
        {
          v24 = v16;
          goto LABEL_17;
        }
        int v17 = [v16 recipeID];
        BOOL v18 = v17 == 65938 || v17 == 131272;
        if (v18 || v17 == 0x20000)
        {
          BOOL v19 = [(PLManagedAsset *)self->_asset hasAdjustments];
          v20 = PLImageManagerGetLog();
          v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              PLResourceRecipeIDDescription([v16 recipeID], 0);
              v22 = (PLVideoInternalResource *)objc_claimAutoreleasedReturnValue();
              v23 = [(PLManagedAsset *)self->_asset uuid];
              *(_DWORD *)buf = 138543618;
              v37 = v22;
              __int16 v38 = 2114;
              v39 = v23;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[RM] installing full size render %{public}@ video resource because a persisted resource was not found for adjusted asset: %{public}@", buf, 0x16u);
            }
            v24 = +[PLResourceInstaller onDemand_installResourceWithResourceIdentity:v16 forAsset:self->_asset];
LABEL_17:
            v21 = v24;
            if (!v24) {
              continue;
            }
            v25 = [[PLVideoInternalResource alloc] initWithBackingResource:v24];
            [v10 addObject:v25];
            goto LABEL_24;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            PLResourceRecipeIDDescription([v16 recipeID], 0);
            v25 = (PLVideoInternalResource *)objc_claimAutoreleasedReturnValue();
            v26 = [(PLManagedAsset *)self->_asset uuid];
            *(_DWORD *)buf = 138543618;
            v37 = v25;
            __int16 v38 = 2114;
            v39 = v26;
            v27 = v21;
            v28 = "[RM] found virtual full size render %{public}@ video resource on unadjusted asset: %{public}@";
            goto LABEL_23;
          }
        }
        else
        {
          v21 = PLImageManagerGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            PLResourceRecipeIDDescription([v16 recipeID], 0);
            v25 = (PLVideoInternalResource *)objc_claimAutoreleasedReturnValue();
            v26 = [(PLManagedAsset *)self->_asset uuid];
            *(_DWORD *)buf = 138543618;
            v37 = v25;
            __int16 v38 = 2114;
            v39 = v26;
            v27 = v21;
            v28 = "[RM] invalid virtual %{public}@ video resource found on asset: %{public}@";
LABEL_23:
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

LABEL_24:
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v13);
  }

  return v10;
}

- (double)sizeThresholdForHighQuality
{
  return 1600.0;
}

- (BOOL)isOriginalSlomo
{
  return [(PLManagedAsset *)self->_asset highFrameRateState] & 1;
}

- (BOOL)shouldUseNonAdjustedVersion
{
  return [(PLManagedAsset *)self->_asset shouldUseNonAdjustedVideo];
}

- (BOOL)isPhotoIris
{
  return [(PLManagedAsset *)self->_asset kindSubtype] == 2;
}

- (BOOL)hasAdjustments
{
  return [(PLManagedAsset *)self->_asset hasAdjustments];
}

- (id)uuid
{
  return (id)[(PLManagedAsset *)self->_asset uuid];
}

- (id)backingResourceForVideoResource:(id)a3
{
  return (id)[a3 backingResource];
}

- (PLVideoInternalResourceContext)initWithManagedObjectContext:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLVideoInternalResourceContext;
  v9 = [(PLVideoInternalResourceContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_moc, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    id v11 = [v8 photoLibrary];
    v10->_BOOL isWalrusEnabled = [v11 isWalrusEnabled];
  }
  return v10;
}

@end