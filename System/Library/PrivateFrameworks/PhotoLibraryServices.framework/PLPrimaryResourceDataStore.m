@interface PLPrimaryResourceDataStore
+ (BOOL)bailOutOfVideoFinalizationForAsset:(id)a3 taskIdentifier:(id)a4 error:(id *)a5;
+ (id)supportedRecipes;
+ (unsigned)currentDeviceMasterThumbRecipeID;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
+ (unsigned)storeClassID;
- (BOOL)_lock_taskIsPendingDownloadWithIdentifier:(id)a3;
- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3;
- (BOOL)canStoreExternalResource:(id)a3;
- (BOOL)canStreamResource:(id)a3;
- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3;
- (BOOL)isCPLSyncableLibraryStore;
- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7;
- (BOOL)supportsTimeRange;
- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4;
- (NSDictionary)keyHelperByBundleScope;
- (PLCloudPhotoLibraryManager)_cplManager;
- (PLPrimaryResourceDataStore)initWithPathManager:(id)a3;
- (PLPrimaryResourceDataStoreKeyHelper)mainScopeKeyHelper;
- (id)_cplResourceIfDownloadIsAvailableForResource:(id)a3 asset:(id)a4 options:(id)a5;
- (id)_deferredPhotoFinalizer;
- (id)_expectedFileURLForMasterThumbnailForAsset:(id)a3;
- (id)_finalizeDeferredResource:(id)a3 asset:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (id)_imageConversionServiceClient;
- (id)_makeResourceLocallyAvailable:(id)a3 options:(id)a4 completion:(id)a5;
- (id)_masterThumbnailVirtualResourceForAsset:(id)a3;
- (id)_newProgressForTaskWithIdentifier:(id)a3 type:(int64_t)a4;
- (id)_videoConversionServiceClient;
- (id)descriptionForSubtype:(int64_t)a3;
- (id)expectedFileURLForResource:(id)a3 asset:(id)a4;
- (id)getClosestResourceMatchingCPLResourceType:(unint64_t)a3 version:(unsigned int)a4 asset:(id)a5;
- (id)keyFromKeyStruct:(const void *)a3;
- (id)keyHelperForBundleScope:(unsigned __int16)a3;
- (id)name;
- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6;
- (id)resourceDataForKey:(id)a3 assetID:(id)a4;
- (id)resourceURLForKey:(id)a3 assetID:(id)a4;
- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4;
- (id)virtualResourcesForAsset:(id)a3;
- (unsigned)masterThumbRecipeID;
- (void)_cancelAvailabilityRequestWithTaskIdentifier:(id)a3;
- (void)_downloadCPLResource:(id)a3 options:(id)a4 taskDidBeginHandler:(id)a5 completionHandler:(id)a6;
- (void)_lock_transitionTaskToInflightWithIdentifier:(id)a3;
- (void)_verifyResourceLocalAvailability:(id)a3 localResourceFileURL:(id *)a4 resourceReapirNeeded:(int64_t *)a5;
- (void)dealloc;
- (void)generateDeferredAdjustmentForAsset:(id)a3 imageConversionServiceClient:(id)a4 videoConversionServiceClient:(id)a5 reason:(id)a6 taskIdentifier:(id)a7 cplResourceType:(unint64_t)a8 version:(unsigned int)a9 completion:(id)a10;
- (void)markAsynchronousLocalRenderAsOptionalForProgress:(id)a3;
- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10;
- (void)setKeyHelperByBundleScope:(id)a3;
- (void)setMainScopeKeyHelper:(id)a3;
- (void)setMasterThumbRecipeID:(unsigned int)a3;
- (void)transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResource:(id)a3 givenFilePath:(id)a4;
@end

@implementation PLPrimaryResourceDataStore

+ (unsigned)storeClassID
{
  return 0;
}

- (id)keyHelperForBundleScope:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [(PLPrimaryResourceDataStore *)self keyHelperByBundleScope];
  v6 = [NSNumber numberWithUnsignedShort:v3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = [(PLPrimaryResourceDataStore *)self mainScopeKeyHelper];
  }
  return v7;
}

- (PLPrimaryResourceDataStoreKeyHelper)mainScopeKeyHelper
{
  return self->_mainScopeKeyHelper;
}

- (NSDictionary)keyHelperByBundleScope
{
  return self->_keyHelperByBundleScope;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  if (a3 >= 0x10u) {
    int v4 = 16;
  }
  else {
    int v4 = a3;
  }
  if (v4 == 3 || v4 == 4 || v4 == 16) {
    v5 = objc_opt_class();
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  return [v6 keyLengthWithDataPreview:v3];
}

- (PLPrimaryResourceDataStore)initWithPathManager:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPrimaryResourceDataStore;
  v5 = [(PLResourceDataStore *)&v17 initWithPathManager:v4];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_makeAvailableProgressByTaskIdentifier = v5->_lock_makeAvailableProgressByTaskIdentifier;
    v5->_lock_makeAvailableProgressByTaskIdentifier = v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_masterThumbRecipeID = 0;
    v8 = [[PLPrimaryResourceDataStoreKeyHelper alloc] initWithPathManager:v4];
    mainScopeKeyHelper = v5->_mainScopeKeyHelper;
    v5->_mainScopeKeyHelper = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__PLPrimaryResourceDataStore_initWithPathManager___block_invoke;
    v15[3] = &unk_1E58645C8;
    id v16 = v10;
    id v11 = v10;
    [v4 enumerateBundleScopesWithBlock:v15];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v11];
    keyHelperByBundleScope = v5->_keyHelperByBundleScope;
    v5->_keyHelperByBundleScope = (NSDictionary *)v12;
  }
  return v5;
}

void __50__PLPrimaryResourceDataStore_initWithPathManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2)
  {
    id v6 = a4;
    v9 = [[PLPrimaryResourceDataStoreKeyHelper alloc] initWithPathManager:v6];

    v7 = *(void **)(a1 + 32);
    v8 = [NSNumber numberWithUnsignedShort:a2];
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHelperByBundleScope, 0);
  objc_storeStrong((id *)&self->_mainScopeKeyHelper, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_deferredPhotoFinalizer, 0);
  objc_storeStrong((id *)&self->_lock_makeAvailableProgressByTaskIdentifier, 0);
}

- (void)setKeyHelperByBundleScope:(id)a3
{
}

- (void)setMainScopeKeyHelper:(id)a3
{
}

- (void)setMasterThumbRecipeID:(unsigned int)a3
{
  self->_masterThumbRecipeID = a3;
}

- (void)transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResource:(id)a3 givenFilePath:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    v8 = [v13 validatedExternalResourceRepresentationUsingFileURL:v7];

    v9 = [PLPrimaryResourceDataStoreKey alloc];
    id v10 = [v13 asset];
    id v11 = [(PLPrimaryResourceDataStoreKey *)v9 initFromExistingLocationOfExternalResource:v8 asset:v10];

    if (v11)
    {
      uint64_t v12 = [v11 keyData];
      [v13 setDataStoreKeyData:v12];

      [v13 setLocalAvailability:1];
    }
    else
    {
      [v13 markAsNotLocallyAvailable];
    }
  }
  else
  {
    [v13 markAsNotLocallyAvailable];
  }
}

- (unsigned)masterThumbRecipeID
{
  unsigned int result = self->_masterThumbRecipeID;
  if (!result)
  {
    unsigned int result = [(id)objc_opt_class() currentDeviceMasterThumbRecipeID];
    self->_masterThumbRecipeID = result;
  }
  return result;
}

- (BOOL)supportsTimeRange
{
  return 1;
}

- (void)markAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPrimaryResourceDataStore *)self _videoConversionServiceClient];
  [v5 markPendingRequestAsOptionalForProgress:v4];
}

- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPrimaryResourceDataStore *)self _videoConversionServiceClient];
  char v6 = [v5 canMarkPendingRequestAsOptionalForProgress:v4];

  return v6;
}

- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  id v18 = a10;
  uint64_t v19 = [a3 cplType];
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = [(PLPrimaryResourceDataStore *)self _cplManager];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __135__PLPrimaryResourceDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke;
    v28[3] = &unk_1E5862880;
    id v29 = v18;
    long long v22 = *(_OWORD *)&a6->var0.var3;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0.var0;
    long long v33 = v22;
    long long v34 = *(_OWORD *)&a6->var1.var1;
    [v21 getStreamingURLForAsset:v15 resourceType:v20 intent:a5 hints:v16 timeRange:buf clientBundleID:v17 completionHandler:v28];

    v23 = v29;
  }
  else
  {
    v24 = PLBackendGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"Requesting a streaming URL for an unknown CPL type is not supported";
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F8C520];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31 = @"Requesting a streaming URL for an unknown CPL type is not supported";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v23 = [v25 errorWithDomain:v26 code:4 userInfo:v27];

    (*((void (**)(id, void, void, void, void, void *))v18 + 2))(v18, 0, 0, 0, 0, v23);
  }
}

uint64_t __135__PLPrimaryResourceDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)canStreamResource:(id)a3
{
  id v3 = a3;
  if ([v3 isInCloud])
  {
    id v4 = [v3 uniformTypeIdentifier];
    char v5 = [v4 conformsToMovie];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  id v5 = a3;
  char v6 = v5;
  switch(a4)
  {
    case 0u:
      int v7 = [v5 isDerivative] ^ 1;
      break;
    case 1u:
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "recipeID"));
      if ([&unk_1EEBF14F0 containsObject:v8])
      {
        LOBYTE(v7) = 1;
        goto LABEL_10;
      }
      char v9 = [v6 isDerivative];
      goto LABEL_9;
    case 2u:
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "recipeID"));
      char v9 = [&unk_1EEBF14D8 containsObject:v8];
LABEL_9:
      LOBYTE(v7) = v9 ^ 1;
LABEL_10:

      break;
    case 3u:
      LOBYTE(v7) = 1;
      break;
    default:
      LOBYTE(v7) = 0;
      break;
  }

  return v7;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return a3 != 0;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  int v8 = a3;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(void, void, void, void))v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1510, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1511, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v15 = [v11 dataStore];

  if (v15 != self)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"PLPrimaryResourceDataStore.m" lineNumber:1512 description:@"resource does not belong to this data store."];
  }
  if (v8 == -1)
  {
    id v40 = 0;
    uint64_t v20 = [v11 purgeIfPossibleReturningError:&v40];
    id v19 = v40;
    ((void (**)(void, id, void, void *))v14)[2](v14, v19, 0, v20);

LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  if (v8 == -32768)
  {
    id v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = @"Setting availability to not possible by request is not permitted";
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48[0] = @"Setting availability to not possible by request is not permitted";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v19 = [v17 errorWithDomain:*MEMORY[0x1E4F8C520] code:4 userInfo:v18];

    ((void (**)(void, id, void, void))v14)[2](v14, v19, 0, 0);
    goto LABEL_19;
  }
  if (v8 < 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid local availability value requested: %ld", v8);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v29 = PLBackendGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v28;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42 = v28;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v19 = [v30 errorWithDomain:*MEMORY[0x1E4F8C520] code:4 userInfo:v31];

    ((void (**)(void, id, void, void))v14)[2](v14, v19, 0, 0);
    goto LABEL_19;
  }
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", [v11 recipeID]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  PLImageManagerGetLog();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);

  v23 = v21;
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v25 = [v12 taskIdentifier];
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    __int16 v45 = 2114;
    id v46 = v19;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MakeResourceLocallyAvailable", "taskIdentifier = %{public}@, resource %{public}@", buf, 0x16u);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3254779904;
  v36[2] = __92__PLPrimaryResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke;
  v36[3] = &unk_1EEB29A58;
  v38 = v24;
  os_signpost_id_t v39 = v22;
  v37 = v14;
  uint64_t v26 = v24;
  v27 = [(PLPrimaryResourceDataStore *)self _makeResourceLocallyAvailable:v11 options:v12 completion:v36];

LABEL_20:
  return v27;
}

void __92__PLPrimaryResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  char v9 = *(id *)(a1 + 40);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "MakeResourceLocallyAvailable", "", v12, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1331, @"Invalid parameter not satisfying: %@", @"externalResource" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v63 = [MEMORY[0x1E4F28B00] currentHandler];
  [v63 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1332, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

LABEL_3:
  id v15 = [v13 managedObjectContext];
  if (v15)
  {
    uint64_t v67 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v66 = [v13 assetID];
    uint64_t v16 = objc_msgSend(v12, "cplTypeWithAssetID:");
    id v17 = [v12 uniformTypeIdentifier];

    if (v17)
    {
      if (v16) {
        goto LABEL_6;
      }
    }
    else
    {
      v28 = -[PLResourceDataStore guessUTIForExternalResource:forAssetKind:](self, "guessUTIForExternalResource:forAssetKind:", v12, [v13 kind]);
      [v12 setUniformTypeIdentifier:v28];

      id v29 = PLImageManagerGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [v13 uuid];
        *(_DWORD *)buf = 138543618;
        id v70 = v12;
        __int16 v71 = 2114;
        v72 = v30;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "[RM] guessed UTI for external resource: %{public}@ for asset uuid: %{public}@", buf, 0x16u);
      }
      if (v16)
      {
LABEL_6:
        int v18 = [v12 resourceType];
        id v19 = (void *)v67;
        if (([v14 assumeNoExistingResources] & 1) == 0)
        {
          uint64_t v20 = v16;
          if (v18 != 5)
          {
            v21 = objc_msgSend(v13, "resourceForCPLType:version:", v16, objc_msgSend(v12, "version"));
            if ([v21 resourceType] == 4 && (PLResourceIdentityIsEqual(v12, v21) & 1) == 0)
            {

              [v12 setResourceType:5];
              uint64_t v20 = [v12 cplTypeWithAssetID:v66];
              v21 = 0;
            }
            else
            {
              uint64_t v20 = v16;
            }
            [v21 setResourceIdentity:v12 managedObjectContext:v15];
            if (v21)
            {
LABEL_26:
              v65 = v15;
              id v32 = v14;
              long long v33 = [v12 fileURL];

              if (v33)
              {
                long long v34 = [v12 fileURL];
                uint64_t v35 = [v34 path];
                int v36 = [v19 fileExistsAtPath:v35];
              }
              else
              {
                int v36 = 0;
              }
              if ([v21 isInserted])
              {
                [v21 setDataStoreClassID:0];
                if (v16) {
                  [v21 setDataStoreSubtype:v20];
                }
              }
              v37 = [v12 codecFourCharCode];

              id v14 = v32;
              if (v37)
              {
                v38 = [v12 codecFourCharCode];
                [v21 setCodecFourCharCodeName:v38];
              }
              objc_msgSend(v21, "setUnorientedWidth:", objc_msgSend(v12, "unorientedWidth"));
              objc_msgSend(v21, "setUnorientedHeight:", objc_msgSend(v12, "unorientedHeight"));
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v64 = v36;
                id v39 = v12;
                objc_msgSend(v21, "setRemoteAvailability:", objc_msgSend(v39, "remoteAvailability"));
                uint64_t v40 = [v21 fingerprint];
                if (v40)
                {
                  uint64_t v41 = (void *)v40;
                  uint64_t v42 = [v39 fingerprint];
                  if (v42)
                  {
                    v43 = (void *)v42;
                    v44 = [v21 fingerprint];
                    __int16 v45 = [v39 fingerprint];
                    char v46 = [v44 isEqualToString:v45];

                    id v19 = (void *)v67;
                    id v14 = v32;

                    if ((v46 & 1) == 0) {
                      [v21 resetPrefetchState];
                    }
                  }
                  else
                  {
                  }
                }
                [v21 setCloudAttributesWithExternalResource:v39];

                int v36 = v64;
              }
              uint64_t v47 = [v12 sidecarIndex];
              [v21 setSidecarIndex:v47];

              v48 = [v21 fileSystemBookmark];

              if (v48)
              {
                v49 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", [v12 resourceType]);
                id v15 = v65;
                if (!v49) {
                  goto LABEL_50;
                }
LABEL_46:
                uint64_t v50 = [v21 dataStoreKey];
                if (v50
                  && (v51 = (void *)v50,
                      [v21 dataStoreKey],
                      v52 = objc_claimAutoreleasedReturnValue(),
                      BOOL v53 = [(PLPrimaryResourceDataStoreKey *)v49 isEqualToKey:v52],
                      v52,
                      v51,
                      !v53))
                {
                  v55 = [v21 dataStoreKey];
                  v56 = [v55 fileURLForAssetID:v66];

                  v57 = [(PLPrimaryResourceDataStoreReferenceFileKey *)v49 fileURLForAssetID:v66];
                  if (([MEMORY[0x1E4F8B908] fileURL:v56 isEqualToFileURL:v57] & 1) == 0)
                  {
                    v58 = [NSString stringWithFormat:@"Attempt to overwrite primary store resource with existing key: %@ with new key: %@, on resource: %@.  Store will orphan the previous key."], v56, v57, v21);
                    PLSimulateCrash();
                  }
                  char v54 = 0;
                  id v19 = (void *)v67;
                }
                else
                {
                  char v54 = 0;
                }
                goto LABEL_54;
              }
              id v15 = v65;
              if (v36)
              {
                v49 = [[PLPrimaryResourceDataStoreKey alloc] initFromExistingLocationOfExternalResource:v12 asset:v13];
                if (v49) {
                  goto LABEL_46;
                }
              }
              else
              {
                v49 = 0;
              }
LABEL_50:
              char v54 = 1;
LABEL_54:
              objc_msgSend(v21, "setDataLength:", objc_msgSend(v12, "dataLength"));
              v59 = [(PLPrimaryResourceDataStoreReferenceFileKey *)v49 keyData];
              [v21 setDataStoreKeyData:v59];

              if ((int)[v12 trashedState] >= 1 && !objc_msgSend(v21, "trashedState"))
              {
                objc_msgSend(v21, "setTrashedState:", objc_msgSend(v12, "trashedState"));
                v60 = [v12 trashedDate];
                [v21 setTrashedDate:v60];
              }
              if (v54)
              {
                [v21 setLocalAvailability:0xFFFFFFFFLL];
              }
              else
              {
                [v21 setLocalAvailability:1];
                [v21 setLocalAvailabilityTarget:0];
              }
              BOOL v27 = v21 != 0;
              if (a7 && v21) {
                *a7 = v21;
              }

              id v26 = v66;
              goto LABEL_64;
            }
          }
LABEL_25:
          v21 = [v13 fetchOrCreateResourceWithIdentity:v12];
          goto LABEL_26;
        }
        goto LABEL_19;
      }
    }
    id v19 = (void *)v67;
    if (![v14 assumeNoExistingResources])
    {
      uint64_t v20 = 0;
      goto LABEL_25;
    }
LABEL_19:
    v31 = [v13 objectID];
    v21 = +[PLInternalResource insertResourceForAssetObjectID:v31 resourceIdentity:v12 inManagedObjectContext:v15];

    uint64_t v20 = v16;
    if (v21) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  os_signpost_id_t v22 = PLBackendGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = [v13 uuid];
    *(_DWORD *)buf = 138543362;
    id v70 = v23;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "asset %{public}@ managed object context is nil, cannot complete storing external resource", buf, 0xCu);
  }
  v24 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v25 = *MEMORY[0x1E4F8C500];
  uint64_t v73 = *MEMORY[0x1E4F28228];
  v74[0] = @"asset managed object context is nil";
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
  id v26 = [v24 errorWithDomain:v25 code:47001 userInfo:v19];
  if (a6)
  {
    id v26 = v26;
    BOOL v27 = 0;
    *a6 = v26;
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_64:

  return v27;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1318, @"Invalid parameter not satisfying: %@", @"externalResource" object file lineNumber description];
  }
  char v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  if ([v7 isEqualToString:@"PLSharedStreamsValidatedExternalResource"]) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = [v7 isEqualToString:@"PLSyndicationValidatedExternalResource"] ^ 1;
  }

  return v8;
}

- (id)virtualResourcesForAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([v4 isDeleted] & 1) == 0
    && (([v4 hasMasterThumb] & 1) != 0 || objc_msgSend(v4, "thumbnailIndex") == -3))
  {
    char v6 = [(PLPrimaryResourceDataStore *)self _masterThumbnailVirtualResourceForAsset:v4];
    [v5 addObject:v6];
  }
  if ([v4 hasAdjustments])
  {
    id v7 = [PLAdjustmentVirtualResource alloc];
    int v8 = [v4 pathForAdjustmentFile];
    char v9 = [(PLAdjustmentVirtualResource *)v7 initWithAdjustmentFilePath:v8 forAsset:v4];

    [(PLVirtualResource *)v9 setDataStore:self];
    [v5 addObject:v9];
  }
  id v10 = (void *)[v5 copy];

  return v10;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3, *(void *)&a4);
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 cplType])
  {
    int v8 = objc_msgSend(v7, "pathForCPLResourceType:adjusted:", objc_msgSend(v6, "dataStoreSubtype"), objc_msgSend(v6, "version") == 2);
    if (v8)
    {
      char v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
    }
    else
    {
      v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        int v39 = [v6 resourceType];
        int v37 = [v6 version];
        int v22 = [v6 recipeID];
        v23 = [v6 dataStore];
        int v24 = [(id)objc_opt_class() storeClassID];
        uint64_t v25 = [v6 dataStoreSubtype];
        id v26 = [v6 uniformTypeIdentifier];
        BOOL v27 = [v7 uuid];
        *(_DWORD *)buf = 67110658;
        int v42 = v39;
        __int16 v43 = 1024;
        int v44 = v37;
        __int16 v45 = 1024;
        int v46 = v22;
        __int16 v47 = 1024;
        int v48 = v24;
        __int16 v49 = 2048;
        uint64_t v50 = v25;
        __int16 v51 = 2112;
        v52 = v26;
        __int16 v53 = 2112;
        char v54 = v27;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_FAULT, "Unable to build expectedFileURL for resource type: %d, version: %d, recipeID: %d, store: %d, storeSubType: %lld, UTI: %@ on asset uuid: %@", buf, 0x38u);
      }
      char v9 = 0;
    }
  }
  else
  {
    id v10 = [v7 pathManager];
    int v11 = [v10 isUBF];

    if (v11)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F8B978]);
      id v12 = [v7 uuid];
      unsigned int v36 = [v7 bundleScope];
      id v13 = [v6 uniformTypeIdentifier];
      id v14 = [v13 identifier];
      uint64_t v15 = [v6 version];
      uint64_t v16 = [v6 resourceType];
      uint64_t v17 = [v6 recipeID];
      int v18 = [v7 originalFilename];
      id v19 = (void *)[v38 initWithAssetUuid:v12 bundleScope:v36 uti:v14 resourceVersion:v15 resourceType:v16 recipeID:v17 originalFilename:v18];

      uint64_t v20 = [(PLResourceDataStore *)self pathManager];
      char v9 = [v20 readOnlyUrlWithIdentifier:v19];
    }
    else
    {
      v28 = [v6 uniformTypeIdentifier];
      id v29 = [v28 identifier];
      uint64_t v30 = +[PLManagedAsset preferredFileExtensionForType:v29];

      id v40 = v30;
      [v40 UTF8String];
      [v6 version];
      [v6 recipeID];
      [v6 resourceType];
      v31 = [v7 filename];
      id v32 = [v7 directory];
      long long v33 = [v7 pathManager];
      id v34 = +[PLThumbnailManager masterThumbFilename];
      [v34 UTF8String];
      char v9 = PLDCIMURLForResourcePropertiesAndPathManager();
    }
  }

  return v9;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1250, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  char v9 = [v7 fileURLForAssetID:v8];

  return v9;
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLPrimaryResourceDataStore.m", 1236, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  char v9 = [v7 fileURLForAssetID:v8];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:2 error:0];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  id v3 = [[PLPrimaryResourceDataStoreKey alloc] initWithKeyStruct:a3];
  return v3;
}

- (id)descriptionForSubtype:(int64_t)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F59940], "shortDescriptionForResourceType:");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(not set)";
  }
  return v4;
}

- (id)name
{
  return @"Primary";
}

- (PLCloudPhotoLibraryManager)_cplManager
{
  if (PLIsAssetsd())
  {
    uint64_t v3 = +[PLPhotoLibraryBundleController sharedBundleController];
    id v4 = [(PLResourceDataStore *)self pathManager];
    id v5 = [v4 libraryURL];
    id v6 = [v3 bundleForLibraryURL:v5];

    id v7 = [v6 libraryServicesManager];
    id v8 = [v7 cloudPhotoLibraryManager];
  }
  else
  {
    id v8 = 0;
  }
  return (PLCloudPhotoLibraryManager *)v8;
}

- (void)dealloc
{
  [(PAVideoConversionServiceClient *)self->_videoConversionServiceClient invalidateAfterPendingRequestCompletion];
  v3.receiver = self;
  v3.super_class = (Class)PLPrimaryResourceDataStore;
  [(PLPrimaryResourceDataStore *)&v3 dealloc];
}

- (id)_masterThumbnailVirtualResourceForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPrimaryResourceDataStore *)self masterThumbRecipeID];
  id v6 = +[PLResourceRecipe recipeFromID:v5];
  id v7 = [(PLVirtualResource *)[PLFileBackedThumbnailVirtualResource alloc] initWithRecipe:v6 forAsset:v4];
  objc_msgSend(v6, "sizeForAssetWidth:height:", objc_msgSend(v4, "width"), objc_msgSend(v4, "height"));
  double v9 = v8;
  double v11 = v10;
  [(PLVirtualResource *)v7 setUnorientedWidth:(uint64_t)v8];
  [(PLVirtualResource *)v7 setUnorientedHeight:(uint64_t)v11];
  id v12 = +[PLUniformTypeIdentifier jpegUniformTypeIdentifier];
  [(PLVirtualResource *)v7 setUniformTypeIdentifier:v12];

  id v13 = [v6 codecFourCharCodeName];
  [(PLVirtualResource *)v7 setCodecFourCharCodeName:v13];

  uint64_t v14 = [v4 width];
  if ([v4 height] * v14 < 1)
  {
    double v17 = 0.0;
  }
  else
  {
    uint64_t v16 = [v4 width];
    float v15 = v9 * v11;
    *(float *)&double v17 = v15 / (float)([v4 height] * v16);
  }
  [(PLVirtualResource *)v7 setScale:v17];
  [(PLVirtualResource *)v7 setDataStore:self];
  int v18 = objc_alloc_init(PLValidatedExternalResource);
  [(PLValidatedExternalResource *)v18 setVersion:3];
  [(PLValidatedExternalResource *)v18 setRecipeID:v5];
  [(PLValidatedExternalResource *)v18 setResourceType:0];
  id v19 = [(PLPrimaryResourceDataStore *)self _expectedFileURLForMasterThumbnailForAsset:v4];
  [(PLValidatedExternalResource *)v18 setFileURL:v19];

  id v20 = [[PLPrimaryResourceDataStoreKey alloc] initFromExistingLocationOfExternalResource:v18 asset:v4];
  [(PLVirtualResource *)v7 setDataStoreKey:v20];

  return v7;
}

- (id)_expectedFileURLForMasterThumbnailForAsset:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 thumbnailIdentifier];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F8B9F0];
    id v7 = [v4 thumbnailIdentifier];
    double v8 = [v4 pathManager];
    double v9 = objc_msgSend(v6, "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v7, v8, -[PLPrimaryResourceDataStore masterThumbRecipeID](self, "masterThumbRecipeID"), 0);

    if (v9)
    {
      double v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v4 uuid];
      int v14 = 138543362;
      float v15 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to resolve master thumbnail path for asset %{public}@ due to nil thumbnail identifier", (uint8_t *)&v14, 0xCu);
    }
    double v10 = 0;
  }

  return v10;
}

- (id)_makeResourceLocallyAvailable:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v256 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = PLImageManagerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v9 taskIdentifier];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "[RM] %@ primaryDataStore - making resource available", buf, 0xCu);
  }
  uint64_t v13 = [v8 fileSystemBookmark];
  if (v13)
  {
    int v14 = (void *)v13;
    float v15 = [v8 fileURL];

    if (!v15)
    {
      v21 = PLImageManagerGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [v9 taskIdentifier];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "[RM] %@ reference media resource is missing fileURL, attempting to recreate from bookmark", buf, 0xCu);
      }
      v23 = [v8 fileSystemBookmark];
      int v24 = [v8 fileSystemVolume];
      id v247 = 0;
      int v25 = PLPrimaryResourceDataStoreReferenceFileURL(v23, v24, &v247);
      uint64_t v16 = (__CFString *)v247;

      if (v25)
      {
        if (v25 != 3)
        {
LABEL_52:
          id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v50 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F8C528]];
          __int16 v51 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C520] code:7 userInfo:v50];
          (*((void (**)(id, void *, void, uint64_t, void))v10 + 2))(v10, v51, 0, [v8 cplType], 0);

          goto LABEL_53;
        }
        id v26 = PLImageManagerGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v27 = [v9 taskIdentifier];
          v28 = [v8 asset];
          id v29 = [v28 uuid];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v27;
          __int16 v252 = 2114;
          v253 = v29;
          __int16 v254 = 2112;
          v255 = v16;
          uint64_t v30 = "[RM] %@ No volume URL for referenced resource for asset %{public}@, using artificial volume for URL %@";
          v31 = v26;
          os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
          uint32_t v33 = 32;
LABEL_50:
          _os_log_impl(&dword_19B3C7000, v31, v32, v30, buf, v33);
        }
      }
      else
      {
        id v26 = PLImageManagerGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          BOOL v27 = [v9 taskIdentifier];
          v28 = [v8 asset];
          id v29 = [v28 uuid];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v27;
          __int16 v252 = 2114;
          v253 = v29;
          uint64_t v30 = "[RM] %@ Failed to resolve bookmark URL for asset %{public}@";
          v31 = v26;
          os_log_type_t v32 = OS_LOG_TYPE_ERROR;
          uint32_t v33 = 22;
          goto LABEL_50;
        }
      }

      goto LABEL_52;
    }
  }
  if ([v9 isTransient]) {
    goto LABEL_23;
  }
  *(void *)buf = 0;
  id v246 = 0;
  [(PLPrimaryResourceDataStore *)self _verifyResourceLocalAvailability:v8 localResourceFileURL:&v246 resourceReapirNeeded:buf];
  uint64_t v16 = (__CFString *)v246;
  switch(*(void *)buf)
  {
    case 3:
      id v18 = v10;
      id v34 = [v8 photoLibrary];
      v241[0] = MEMORY[0x1E4F143A8];
      v241[1] = 3221225472;
      v241[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_95;
      v241[3] = &unk_1E5875E18;
      id v20 = &v242;
      id v242 = v9;
      id v243 = v8;
      [v34 performTransactionAndWait:v241];

      id v19 = v243;
      goto LABEL_20;
    case 2:
      uint64_t v35 = [v8 fileSystemBookmark];

      if (v35) {
        break;
      }
      id v18 = v10;
      unsigned int v36 = [v8 photoLibrary];
      v237[0] = MEMORY[0x1E4F143A8];
      v237[1] = 3221225472;
      v237[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_96;
      v237[3] = &unk_1E5873A50;
      id v20 = &v238;
      id v238 = v9;
      id v239 = v8;
      v240 = v16;
      [v36 performTransactionAndWait:v237];

      id v19 = v239;
      goto LABEL_20;
    case 1:
      double v17 = [v8 fileSystemBookmark];

      if (!v17)
      {
        id v18 = v10;
        id v19 = [v8 photoLibrary];
        v244[0] = MEMORY[0x1E4F143A8];
        v244[1] = 3221225472;
        v244[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke;
        v244[3] = &unk_1E5875CE0;
        id v20 = &v245;
        id v245 = v8;
        [v19 performTransactionAndWait:v244];
LABEL_20:

        id v10 = v18;
      }
      break;
  }
  if (v16)
  {
    (*((void (**)(id, void, void, uint64_t, __CFString *))v10 + 2))(v10, 0, 0, [v8 cplType], v16);
LABEL_53:
    v52 = 0;
    goto LABEL_132;
  }
LABEL_23:
  if (objc_msgSend((id)objc_opt_class(), "isMasterThumbRecipeID:", objc_msgSend(v8, "recipeID")))
  {
    int v37 = [v8 asset];
    if ([v37 hasAdjustments]) {
      [v37 assetResourceForCPLType:5];
    }
    else {
    uint64_t v38 = [v37 masterResourceForCPLType:5];
    }

    id v8 = (id)v38;
  }
  int v39 = [v8 recipeID];
  id v40 = [v8 asset];
  int v41 = [v40 deferredProcessingNeeded];
  int v42 = [v8 asset];
  int v43 = [v42 videoDeferredProcessingNeeded];
  int v44 = [v8 localAvailabilityTarget];
  if ((v39 & 0xFFFFFFFD) == 0x10198)
  {
    uint64_t v45 = 1;
    goto LABEL_62;
  }
  if (v39 >= 0x20000)
  {
    switch(v39)
    {
      case 131072:
        goto LABEL_34;
      case 131280:
        uint64_t v45 = v43 != 0;
        goto LABEL_62;
      case 131272:
LABEL_34:
        LOWORD(v46) = v41 - 1;
        if ((v41 - 1) >= 0xA || ((0x303u >> v46) & 1) == 0)
        {
          BOOL v47 = v43 == 0;
          uint64_t v48 = 2;
          uint64_t v49 = 4;
LABEL_37:
          if (v47) {
            uint64_t v45 = v49;
          }
          else {
            uint64_t v45 = v48;
          }
          goto LABEL_62;
        }
        uint64_t v46 = (__int16)v46;
        __int16 v53 = &unk_19BA9F048;
LABEL_61:
        uint64_t v45 = v53[v46];
        goto LABEL_62;
    }
LABEL_56:
    if (v44 != 1 || (unsigned __int16)(v41 - 2) > 7u)
    {
      uint64_t v45 = 0;
      goto LABEL_62;
    }
    uint64_t v46 = (unsigned __int16)(v41 - 2);
    __int16 v53 = &unk_19BA9A150;
    goto LABEL_61;
  }
  if (v39 == 65749)
  {
    uint64_t v45 = 6;
    goto LABEL_62;
  }
  if (v39 != 65938) {
    goto LABEL_56;
  }
  uint64_t v45 = 3;
  if (v41 != 2 && v41 != 9)
  {
    BOOL v47 = v41 == 1 || v41 == 10;
    uint64_t v48 = 4;
    uint64_t v49 = 2;
    goto LABEL_37;
  }
LABEL_62:

  uint64_t v54 = [v8 cplType];
  uint64_t v55 = [v8 asset];
  v56 = [(PLPrimaryResourceDataStore *)self _cplResourceIfDownloadIsAvailableForResource:v8 asset:v55 options:v9];

  if (v56 && (v45 & 3) == 0)
  {
    int v57 = [v9 isNetworkAccessAllowed];
    v58 = PLImageManagerGetLog();
    v59 = v58;
    if (v57)
    {
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v60 = [v9 taskIdentifier];
        v61 = [MEMORY[0x1E4F59940] shortDescriptionForResourceType:v54];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v60;
        __int16 v252 = 2112;
        v253 = v61;
        _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ downloading CPL resource type: %@", buf, 0x16u);
      }
      v62 = [v9 taskIdentifier];
      if (!v62)
      {
        v62 = [MEMORY[0x1E4F8BA08] UUIDString];
        [v9 setTaskIdentifier:v62];
      }
      id v63 = [(PLPrimaryResourceDataStore *)self _newProgressForTaskWithIdentifier:v62 type:1];
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableDictionary *)self->_lock_makeAvailableProgressByTaskIdentifier setObject:v63 forKeyedSubscript:v62];
      os_unfair_lock_unlock(&self->_lock);
      v233[0] = MEMORY[0x1E4F143A8];
      v233[1] = 3221225472;
      v233[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_98;
      v233[3] = &unk_1E58626F0;
      id v234 = v62;
      v235 = self;
      id v236 = v10;
      v228[0] = MEMORY[0x1E4F143A8];
      v228[1] = 3221225472;
      v228[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_101;
      v228[3] = &unk_1E5862718;
      id v229 = v234;
      v230 = self;
      id v231 = v236;
      uint64_t v232 = v54;
      id v64 = v234;
      [(PLPrimaryResourceDataStore *)self _downloadCPLResource:v56 options:v9 taskDidBeginHandler:v233 completionHandler:v228];

      goto LABEL_130;
    }
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v90 = [v9 taskIdentifier];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v90;
      _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ network access permission needed to download resource", buf, 0xCu);
    }
    id v64 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C520] code:6 userInfo:0];
    (*((void (**)(id, id, void, uint64_t, void))v10 + 2))(v10, v64, 0, v54, 0);
LABEL_89:
    id v63 = 0;
    goto LABEL_130;
  }
  if ([v8 recipeID] != 327689)
  {
    switch(v45)
    {
      case 0:
        uint64_t v182 = v54;
        v187 = v56;
        id v190 = v10;
        id v180 = v9;
        if ([v8 recipeID])
        {
          +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", [v8 recipeID]);
          v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v92 = 0;
        }
        v144 = PLBackendGetLog();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
        {
          v145 = NSString;
          v146 = [v8 asset];
          v147 = [v146 uuid];
          v148 = [(__CFString *)v92 description];
          v149 = [v8 asset];
          unsigned int v150 = [v149 deferredProcessingNeeded];
          if (v150 > 0xB) {
            v151 = 0;
          }
          else {
            v151 = off_1E5865890[v150];
          }
          v152 = v151;
          int v153 = [v8 localAvailabilityTarget];
          v154 = @"N";
          if (v153 > 0) {
            v154 = @"Y";
          }
          v155 = [v145 stringWithFormat:@"Unable to download or generate resource for asset: %@, recipe: %@, deferred processing: %@ local availability targeted: %@", v147, v148, v152, v154];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v155;
          _os_log_impl(&dword_19B3C7000, v144, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        v156 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v157 = *MEMORY[0x1E4F8C520];
        uint64_t v248 = *MEMORY[0x1E4F28568];
        v158 = NSString;
        v159 = [v8 asset];
        v160 = [v159 uuid];
        v161 = [(__CFString *)v92 description];
        v162 = [v8 asset];
        unsigned int v163 = [v162 deferredProcessingNeeded];
        v175 = v159;
        v178 = v92;
        if (v163 > 0xB) {
          v164 = 0;
        }
        else {
          v164 = off_1E5865890[v163];
        }
        v165 = v164;
        int v166 = [v8 localAvailabilityTarget];
        v167 = @"N";
        if (v166 > 0) {
          v167 = @"Y";
        }
        v168 = [v158 stringWithFormat:@"Unable to download or generate resource for asset: %@, recipe: %@, deferred processing: %@ local availability targeted: %@", v160, v161, v165, v167];
        v249 = v168;
        v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v249 forKeys:&v248 count:1];
        id v64 = [v156 errorWithDomain:v157 code:4 userInfo:v169];

        id v10 = v190;
        (*((void (**)(id, id, void, uint64_t, void))v190 + 2))(v190, v64, 0, v182, 0);
        id v63 = 0;
        v89 = v178;
        id v9 = v180;
        goto LABEL_128;
      case 1:
      case 2:
        v187 = v56;
        v189 = v10;
        v78 = v9;
        id v64 = [v8 asset];
        int v176 = [v8 version];
        v79 = [v64 uuidDescription];
        v80 = PLImageManagerGetLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v81 = [v78 taskIdentifier];
          v82 = @"N";
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v81;
          __int16 v252 = 2114;
          if (v45 == 2) {
            v82 = @"Y";
          }
          v253 = v79;
          __int16 v254 = 2114;
          v255 = v82;
          _os_log_impl(&dword_19B3C7000, v80, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ finalizing deferred asset %{public}@, with deferred adjustment: %{public}@", buf, 0x20u);
        }
        v83 = [v64 objectID];
        v84 = [v64 photoLibrary];
        v85 = [v84 libraryServicesManager];

        v213[0] = MEMORY[0x1E4F143A8];
        v213[1] = 3221225472;
        v213[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_124;
        v213[3] = &unk_1E5862790;
        id v214 = v85;
        id v215 = v83;
        id v219 = v189;
        uint64_t v220 = v54;
        uint64_t v221 = v45;
        id v216 = v78;
        v217 = self;
        int v222 = v176;
        id v218 = v79;
        id v86 = v79;
        id v9 = v78;
        id v87 = v86;
        id v88 = v83;
        v89 = v85;
        id v10 = v189;
        id v63 = [(PLPrimaryResourceDataStore *)self _finalizeDeferredResource:v8 asset:v64 options:v216 completionHandler:v213];

        goto LABEL_128;
      case 3:
        goto LABEL_96;
      case 4:
        v93 = PLImageManagerGetLog();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          [v9 taskIdentifier];
          uint64_t v183 = v54;
          v94 = v56;
          v96 = id v95 = v10;
          v97 = [v8 asset];
          v98 = [v97 uuid];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v96;
          __int16 v252 = 2114;
          v253 = v98;
          _os_log_impl(&dword_19B3C7000, v93, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Unable to download, attempting optimistic adjustment rendering for asset %{public}@", buf, 0x16u);

          id v10 = v95;
          v56 = v94;
          uint64_t v54 = v183;
        }

LABEL_96:
        v191 = (void (**)(void, void, void, void, void))v10;
        id v64 = [v8 asset];
        v99 = PLImageManagerGetLog();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          v100 = [v9 taskIdentifier];
          v101 = [v64 uuid];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v100;
          __int16 v252 = 2112;
          v253 = v101;
          _os_log_impl(&dword_19B3C7000, v99, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Generating deferred adjustment for asset %@", buf, 0x16u);
        }
        v102 = [v9 taskIdentifier];
        id v212 = 0;
        BOOL v103 = +[PLPrimaryResourceDataStore bailOutOfVideoFinalizationForAsset:v64 taskIdentifier:v102 error:&v212];
        v177 = (__CFString *)v212;

        if (v103)
        {
          int v174 = [v8 version];
          v104 = [v9 downloadOptions];
          uint64_t v105 = [v104 priority];

          v171 = NSString;
          BOOL v173 = (unint64_t)(v105 - 1) < 2;
          v106 = @"undefined";
          if (v45 == 3) {
            v106 = @"generate adjusted";
          }
          if (v45 == 4) {
            v106 = @"none but try generate adjusted anyway";
          }
          v107 = v106;
          [v9 taskIdentifier];
          uint64_t v184 = v54;
          v108 = v188 = v56;
          v172 = [v171 stringWithFormat:@"Deferred adjustment resource generation (%@) for image manager request %@, allow cancellation = %d (transfer priority = %tu)", v107, v108, (unint64_t)(v105 - 1) < 2, v105];

          v109 = [v64 objectID];
          v110 = [v64 photoLibrary];
          [v110 libraryServicesManager];
          v112 = v111 = v9;

          v113 = [(PLPrimaryResourceDataStore *)self _imageConversionServiceClient];
          v114 = [(PLPrimaryResourceDataStore *)self _videoConversionServiceClient];
          v202[0] = MEMORY[0x1E4F143A8];
          v202[1] = 3221225472;
          v202[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_133;
          v202[3] = &unk_1E5862808;
          id v203 = v112;
          id v204 = v109;
          v205 = self;
          uint64_t v209 = v184;
          int v211 = v174;
          v208 = v191;
          uint64_t v210 = v45;
          id v64 = v64;
          id v206 = v64;
          id v207 = v111;
          id v115 = v109;
          v56 = v188;
          id v116 = v115;
          id v117 = v112;
          id v9 = v111;
          id v185 = v117;
          id v63 = [v64 generateDeferredAdjustmentWithImageConversionClient:v113 videoConversionClient:v114 reason:v172 allowCancellationByService:v173 completion:v202];

          id v10 = v191;
          v89 = v177;
        }
        else
        {
          v118 = PLImageManagerGetLog();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            v119 = [v9 taskIdentifier];
            v120 = [v64 uuid];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v119;
            __int16 v252 = 2112;
            v253 = v120;
            __int16 v254 = 2112;
            v255 = v177;
            _os_log_impl(&dword_19B3C7000, v118, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ Error bailing out of video finalization for asset %@: %@", buf, 0x20u);
          }
          id v10 = v191;
          v89 = v177;
          ((void (**)(void, __CFString *, void, uint64_t, void))v191)[2](v191, v177, 0, v54, 0);
LABEL_113:
          id v63 = 0;
        }
LABEL_129:

        break;
      case 5:
        v187 = v56;
        v192 = v10;
        int v121 = [v8 recipeID];
        v122 = [v8 asset];
        v123 = PLImageManagerGetLog();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          v124 = [v9 taskIdentifier];
          v125 = [v122 uuid];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v124;
          __int16 v252 = 2114;
          v253 = v125;
          _os_log_impl(&dword_19B3C7000, v123, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Generating missing derivatives for asset %{public}@", buf, 0x16u);
        }
        id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v126 = [v9 taskIdentifier];
        [v64 setObject:v126 forKeyedSubscript:*MEMORY[0x1E4F74960]];

        v127 = [(PLPrimaryResourceDataStore *)self _imageConversionServiceClient];
        v128 = [(PLPrimaryResourceDataStore *)self _videoConversionServiceClient];
        v196[0] = MEMORY[0x1E4F143A8];
        v196[1] = 3221225472;
        v196[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_146;
        v196[3] = &unk_1E5862830;
        int v201 = v121;
        id v197 = v122;
        id v199 = v192;
        uint64_t v200 = v54;
        id v198 = v8;
        v129 = v122;
        id v10 = v192;
        id v63 = +[PLResourceGenerator generateAndStoreMissingExpectedLocalResourcesForAsset:v129 versions:&unk_1EEBF14C0 imageConversionClient:v127 videoConversionClient:v128 conversionServiceOptions:v64 reason:@"Resource local availability request" completion:v196];

        v89 = v129;
LABEL_128:
        v56 = v187;
        goto LABEL_129;
      case 6:
        v130 = v10;
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", [v8 recipeID]);
        id v64 = (id)objc_claimAutoreleasedReturnValue();
        v131 = PLImageManagerGetLog();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
        {
          v132 = [v9 taskIdentifier];
          v133 = [v8 asset];
          v134 = [v133 uuid];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v132;
          __int16 v252 = 2114;
          v253 = v134;
          _os_log_impl(&dword_19B3C7000, v131, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Generating image from video for asset %{public}@", buf, 0x16u);
        }
        v135 = (void *)MEMORY[0x1E4F1CB10];
        v136 = [v8 asset];
        v137 = [v136 pathForLocalVideoKeyFrame];
        v138 = [v135 fileURLWithPath:v137];

        v139 = [v8 asset];
        uint64_t v140 = [v9 isNetworkAccessAllowed];
        v141 = [v9 clientBundleID];
        v193[0] = MEMORY[0x1E4F143A8];
        v193[1] = 3221225472;
        v193[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_154;
        v193[3] = &unk_1E5862858;
        id v194 = v138;
        id v195 = v130;
        v142 = v138;
        id v10 = v130;
        uint64_t v143 = v140;
        v89 = v142;
        [v64 generateAndStoreForAsset:v139 networkAccessAllowed:v143 clientBundleID:v141 progress:0 completion:v193];

        goto LABEL_113;
      default:
        id v63 = 0;
        goto LABEL_131;
    }
    goto LABEL_130;
  }
  char v65 = [v9 isNetworkAccessAllowed];
  id v66 = PLImageManagerGetLog();
  uint64_t v67 = v66;
  if ((v65 & 1) == 0)
  {
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      v91 = [v9 taskIdentifier];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v91;
      _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEBUG, "[RM][CCSS] %{public}@ network access permission needed to download computesync resource", buf, 0xCu);
    }
    id v64 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C520] code:6 userInfo:0];
    (*((void (**)(id, id, void, void, void))v10 + 2))(v10, v64, 0, 0, 0);
    goto LABEL_89;
  }
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v68 = [v9 taskIdentifier];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v68;
    _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "[RM][CCSS]: %{public}@ downloading computesync resource", buf, 0xCu);
  }
  v186 = v56;

  v69 = [v9 taskIdentifier];
  if (!v69)
  {
    v69 = [MEMORY[0x1E4F8BA08] UUIDString];
    [v9 setTaskIdentifier:v69];
  }
  id v63 = [(PLPrimaryResourceDataStore *)self _newProgressForTaskWithIdentifier:v69 type:1];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_lock_makeAvailableProgressByTaskIdentifier setObject:v63 forKeyedSubscript:v69];
  os_unfair_lock_unlock(&self->_lock);
  id v70 = [v8 photoLibrary];
  __int16 v71 = [v70 libraryServicesManager];

  v72 = [v8 objectID];
  v181 = [(PLPrimaryResourceDataStore *)self _cplManager];
  [v8 asset];
  uint64_t v73 = v179 = v9;
  v74 = [v73 scopedIdentifier];
  v250 = v74;
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v250 count:1];
  v223[0] = MEMORY[0x1E4F143A8];
  v223[1] = 3221225472;
  v223[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_104;
  v223[3] = &unk_1E5862740;
  v223[4] = self;
  id v224 = v69;
  id v226 = v72;
  id v227 = v10;
  id v225 = v71;
  id v76 = v72;
  id v77 = v71;
  id v64 = v69;
  [v181 fetchComputeStatesForRecordsWithScopedIdentifiers:v75 onDemand:1 completionHandler:v223];

  id v9 = v179;
  v56 = v186;
LABEL_130:

LABEL_131:
  uint64_t v16 = (__CFString *)v63;

  v52 = v16;
LABEL_132:

  return v52;
}

uint64_t __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = PLResourceIdentityShortDescription(*(void **)(a1 + 32));
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "[RM]: Data store was wrong, resource %{public}@ was not available, fixing...", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) markAsNotLocallyAvailable];
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_95(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = [*(id *)(a1 + 32) taskIdentifier];
    id v4 = PLResourceIdentityShortDescription(*(void **)(a1 + 40));
    int v5 = [*(id *)(a1 + 40) asset];
    id v6 = [v5 uuid];
    int v8 = 138412802;
    id v9 = v3;
    __int16 v10 = 2114;
    double v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "[RM] %@ Resource is locally available but not in hints, resource: %{public}@, asset: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v7 = [*(id *)(a1 + 40) asset];
  [v7 recalculateImageRequestHints];
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_96(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = [a1[4] taskIdentifier];
    id v4 = PLResourceIdentityShortDescription(a1[5]);
    int v5 = [a1[5] asset];
    id v6 = [v5 uuid];
    uint64_t v7 = [a1[6] path];
    int v10 = 138413058;
    double v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    float v15 = v6;
    __int16 v16 = 2112;
    double v17 = v7;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "[RM] %@ Resource local availability was not local but file exists at expected path, resource: %{public}@, asset %{public}@, path: %@", (uint8_t *)&v10, 0x2Au);
  }
  id v8 = a1[5];
  id v9 = [a1[6] path];
  [v8 markAsLocallyAvailableWithFilePath:v9];
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_98(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (!v6) {
    id v6 = *(id *)(a1 + 32);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  id v8 = *(id **)(a1 + 40);
  if (v7)
  {
    [v8[2] setObject:0 forKeyedSubscript:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
    id v9 = PLImageManagerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v7 code];
      double v11 = [v7 domain];
      *(_DWORD *)buf = 138544130;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Download failed on begin with error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v12 = objc_msgSend(v8, "_lock_taskIsPendingDownloadWithIdentifier:", v6);
    uint64_t v13 = *(os_unfair_lock_s **)(a1 + 40);
    if (v12)
    {
      [(os_unfair_lock_s *)v13 _lock_transitionTaskToInflightWithIdentifier:v6];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
      __int16 v14 = PLImageManagerGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v6;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download began", buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_unlock(v13 + 6);
      float v15 = PLImageManagerGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v6;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download began but has been cancelled, cancelling now", buf, 0xCu);
      }

      __int16 v16 = [*(id *)(a1 + 40) _cplManager];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_99;
      v17[3] = &unk_1E58626C8;
      id v18 = v6;
      [v16 cancelResourceTransferTaskWithIdentifier:v18 completion:v17];
    }
  }
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_101(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    id v8 = *(id *)(a1 + 32);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:v8];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  if (v10)
  {
    double v11 = [v10 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v12 = [v10 code];

      if (v12 == 3072)
      {
        uint64_t v13 = PLImageManagerGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 138543362;
          id v17 = v8;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download was cancelled", (uint8_t *)&v16, 0xCu);
        }
        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v10 code];
      float v15 = [v10 domain];
      int v16 = 138544130;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Download failed with error: %@, code: %ld, domain: %{public}@", (uint8_t *)&v16, 0x2Au);
    }
  }
  else
  {
    uint64_t v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download complete", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_14:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if (v6)
  {
    id v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 3072)
      {
        id v9 = PLImageManagerGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "[RM][CCSS]: %{public}@ Computesync download was cancelled", buf, 0xCu);
        }
LABEL_16:

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v9 = PLImageManagerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = [v6 code];
      __int16 v22 = [v6 domain];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2048;
      int v37 = (uint64_t (*)(uint64_t, uint64_t))v21;
      LOWORD(v38) = 2114;
      *(void *)((char *)&v38 + 2) = v22;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[RM][CCSS]: %{public}@ Computesync download failed with error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);
    }
    goto LABEL_16;
  }
  BOOL v11 = [v5 count] == 1;
  uint64_t v12 = PLImageManagerGetLog();
  id v9 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[RM][CCSS]: %{public}@ Computesync download failed with no error", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "[RM][CCSS]: %{public}@ Computesync download complete", buf, 0xCu);
  }

  uint64_t v14 = [v5 allValues];
  float v15 = [v14 firstObject];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  int v37 = __Block_byref_object_copy__2230;
  *(void *)&long long v38 = __Block_byref_object_dispose__2231;
  *((void *)&v38 + 1) = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__2230;
  v34[4] = __Block_byref_object_dispose__2231;
  id v35 = 0;
  int v16 = [*(id *)(a1 + 48) databaseContext];
  id v17 = (void *)[v16 newShortLivedComputeSyncApplyLibraryWithNameSuffix:"-[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:]_block_invoke"];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2;
  v28[3] = &unk_1E586C518;
  id v18 = v17;
  id v29 = v18;
  id v30 = *(id *)(a1 + 56);
  id v19 = v15;
  id v31 = v19;
  os_log_type_t v32 = buf;
  uint32_t v33 = v34;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_112;
  v24[3] = &unk_1E5873410;
  id v26 = v34;
  id v25 = *(id *)(a1 + 64);
  uint64_t v27 = buf;
  [v18 performTransactionAndWait:v28 completionHandler:v24];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(buf, 8);

LABEL_17:
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLImageManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [*(id *)(a1 + 48) taskIdentifier];
      uint64_t v9 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      id v26 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ deferred finalization failed for asset %{public}@ with error: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) databaseContext];
    BOOL v11 = (void *)[v10 newShortLivedLibraryWithName:"-[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:]_block_invoke"];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v26 = __Block_byref_object_copy__2230;
    uint64_t v27 = __Block_byref_object_dispose__2231;
    id v28 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_125;
    v15[3] = &unk_1E5862768;
    id v12 = v11;
    id v16 = v12;
    id v17 = *(id *)(a1 + 40);
    id v18 = v5;
    id v21 = *(id *)(a1 + 72);
    long long v23 = *(_OWORD *)(a1 + 80);
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    id v19 = v13;
    uint64_t v20 = v14;
    int v24 = *(_DWORD *)(a1 + 96);
    __int16 v22 = buf;
    [v12 performBlockAndWait:v15];

    _Block_object_dispose(buf, 8);
  }
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_133(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__2230;
    v32[4] = __Block_byref_object_dispose__2231;
    uint32_t v33 = 0;
    id v6 = [*(id *)(a1 + 32) databaseContext];
    id v7 = (void *)[v6 newShortLivedLibraryWithName:"-[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:]_block_invoke"];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_134;
    v24[3] = &unk_1E58627B8;
    id v8 = v7;
    id v25 = v8;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v26 = v9;
    uint64_t v27 = v10;
    id v12 = *(void **)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 80);
    uint64_t v29 = v32;
    uint64_t v30 = v11;
    int v31 = *(_DWORD *)(a1 + 96);
    id v28 = v12;
    [v8 performBlockAndWait:v24];

    _Block_object_dispose(v32, 8);
    id v13 = v33;
  }
  else
  {
    if (!PLIsErrorEqualToCode() || *(void *)(a1 + 88) != 3)
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_8;
    }
    uint64_t v14 = [*(id *)(a1 + 56) photoLibrary];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_135;
    v17[3] = &unk_1E58627E0;
    id v15 = *(id *)(a1 + 56);
    uint64_t v22 = *(void *)(a1 + 80);
    int v23 = *(_DWORD *)(a1 + 96);
    uint64_t v16 = *(void *)(a1 + 48);
    id v18 = v15;
    uint64_t v19 = v16;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 72);
    [v14 performBlock:v17];

    id v13 = v18;
  }

LABEL_8:
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(v6);
      }
      v9 |= [*(id *)(*((void *)&v35 + 1) + 8 * i) recipeID] == *(_DWORD *)(a1 + 64);
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
  }
  while (v8);
  if (v9)
  {
    id v12 = [*(id *)(a1 + 32) photoLibrary];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_147;
    v31[3] = &unk_1E5873370;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    id v33 = v13;
    uint64_t v34 = v14;
    id v32 = *(id *)(a1 + 40);
    [v12 performBlock:v31];

    id v15 = v33;
  }
  else
  {
LABEL_10:
    id v15 = [v5 firstObject];
    if (!v15)
    {
      uint64_t v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = NSString;
        id v18 = [*(id *)(a1 + 40) debugDescription];
        uint64_t v19 = [v17 stringWithFormat:@"Unable to generate missing resource: %@", v18];
        *(_DWORD *)buf = 138412290;
        int v42 = v19;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F8C520];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      uint64_t v22 = NSString;
      int v23 = [*(id *)(a1 + 40) debugDescription];
      int v24 = [v22 stringWithFormat:@"Unable to generate missing resource: %@", v23];
      id v40 = v24;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v15 = [v20 errorWithDomain:v21 code:4 userInfo:v25];
    }
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = [v5 firstObject];
    (*(void (**)(uint64_t, void *, void, void, void))(v26 + 16))(v26, v27, 0, *(void *)(a1 + 56), 0);
  }
  id v28 = [*(id *)(a1 + 32) photoLibrary];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_151;
  v29[3] = &unk_1E5875CE0;
  id v30 = *(id *)(a1 + 32);
  [v28 performTransaction:v29];
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_154(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v10;
  if ([v7 hasChanges])
  {
    id v16 = 0;
    char v12 = [v7 save:&v16];
    id v13 = v16;
    id v11 = v10;
    if ((v12 & 1) == 0)
    {
      uint64_t v14 = PLImageManagerGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to save moc with error: %@", buf, 0xCu);
      }

      id v11 = v10;
      if (!v10) {
        id v11 = v13;
      }
    }
  }
  if ([v9 count]) {
    uint64_t v15 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v15 = 0;
  }
  (*(void (**)(void, id, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, 0, 0, v15);
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_147(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) fileURL];
  (*(void (**)(uint64_t, void, void, uint64_t, id))(v2 + 16))(v2, 0, 0, v1, v3);
}

uint64_t __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_151(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeferredProcessingNeeded:0];
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_134(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  id v4 = [v2 existingObjectWithID:v3 error:&v14];
  id v5 = v14;

  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 48) getClosestResourceMatchingCPLResourceType:*(void *)(a1 + 72) version:*(unsigned int *)(a1 + 80) asset:v4];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    if (!v5) {
      goto LABEL_4;
    }
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }
  }

LABEL_4:
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) dataLength];
  uint64_t v11 = *(void *)(a1 + 72);
  char v12 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) fileURL];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t, void *))(v9 + 16))(v9, 0, v10, v11, v12);
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_135(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) resourceForCPLType:*(void *)(a1 + 64) version:*(unsigned int *)(a1 + 72)];
  id v2 = (id)[*(id *)(a1 + 40) _makeResourceLocallyAvailable:v3 options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_125(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v34 = 0;
  id v4 = [v2 existingObjectWithID:v3 error:&v34];
  id v5 = v34;

  if (v4)
  {
    if ([v4 deferredProcessingNeeded] == 2)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      id v33 = 0;
      BOOL v7 = +[PLPrimaryResourceDataStore bailOutOfVideoFinalizationForAsset:v4 taskIdentifier:v6 error:&v33];
      id v8 = v33;
      uint64_t v9 = PLImageManagerGetLog();
      uint64_t v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = *(void *)(a1 + 48);
          char v12 = [v4 uuid];
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v11;
          __int16 v37 = 2112;
          id v38 = v12;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ requesting adjustment render for asset: %@", buf, 0x16u);
        }
        uint64_t v13 = NSString;
        unint64_t v14 = *(void *)(a1 + 96);
        if (v14 > 6) {
          uint64_t v15 = @"undefined";
        }
        else {
          uint64_t v15 = off_1E58628D0[v14];
        }
        uint64_t v27 = [*(id *)(a1 + 56) taskIdentifier];
        id v28 = [v13 stringWithFormat:@"Deferred adjustment resource generation (%@) for image manager request %@", v15, v27];

        uint64_t v29 = *(void **)(a1 + 64);
        id v30 = [v29 _imageConversionServiceClient];
        int v31 = [*(id *)(a1 + 64) _videoConversionServiceClient];
        LODWORD(v32) = *(_DWORD *)(a1 + 104);
        [v29 generateDeferredAdjustmentForAsset:v4 imageConversionServiceClient:v30 videoConversionServiceClient:v31 reason:v28 taskIdentifier:*(void *)(a1 + 48) cplResourceType:*(void *)(a1 + 88) version:v32 completion:*(void *)(a1 + 72)];
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v25 = *(void *)(a1 + 48);
          uint64_t v26 = [v4 uuid];
          *(_DWORD *)buf = 138543874;
          uint64_t v36 = v25;
          __int16 v37 = 2114;
          id v38 = v26;
          __int16 v39 = 2112;
          id v40 = v8;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Error bailing out of video finalization for asset with uuid %{public}@: %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
    }
    else
    {
      uint64_t v18 = [v4 resourceForCPLType:*(void *)(a1 + 88) version:*(unsigned int *)(a1 + 104)];
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) dataLength];
      uint64_t v23 = *(void *)(a1 + 88);
      int v24 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fileURL];
      (*(void (**)(uint64_t, void, uint64_t, uint64_t, void *))(v21 + 16))(v21, 0, v22, v23, v24);
    }
  }
  else if (v5)
  {
    uint64_t v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v17;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [v2 existingObjectWithID:*(void *)(a1 + 40) error:0];

  id v4 = [v3 asset];
  id v5 = [*(id *)(a1 + 48) fileURL];

  uint64_t v6 = [*(id *)(a1 + 48) fileURL];
  BOOL v7 = v6;
  if (v5 && v3)
  {
    id v8 = [v6 path];
    id v43 = 0;
    int v9 = [v4 copyComputeSyncResourceFromCPLFilePath:v8 error:&v43];
    uint64_t v10 = v43;

    if (v9)
    {
      [v4 updateComputeSyncResourceAfterDownloadWithResource:v3 onDemandDownload:1];
      uint64_t v11 = *(void *)(a1 + 48);
      id v42 = 0;
      int v12 = [v4 applyComputeSyncPayloadWithComputeStateRecord:v11 originatedFromPrefetch:0 error:&v42];
      uint64_t v13 = v42;
      unint64_t v14 = PLImageManagerGetLog();
      uint64_t v15 = v14;
      if (v12)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = *(void *)(a1 + 48);
          uint64_t v17 = [v4 scopedIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v49 = v16;
          __int16 v50 = 2114;
          __int16 v51 = v17;
          uint64_t v18 = "[CCSS] Applied compute sync record %@ to asset %{public}@ using payload helper";
          uint64_t v19 = v15;
          os_log_type_t v20 = OS_LOG_TYPE_INFO;
          uint32_t v21 = 22;
LABEL_19:
          _os_log_impl(&dword_19B3C7000, v19, v20, v18, buf, v21);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = *(void *)(a1 + 48);
        uint64_t v17 = [v4 scopedIdentifier];
        *(_DWORD *)buf = 138412802;
        uint64_t v49 = v38;
        __int16 v50 = 2114;
        __int16 v51 = v17;
        __int16 v52 = 2112;
        __int16 v53 = v13;
        uint64_t v18 = "[CCSS] Failed to apply compute sync record %@ to asset %{public}@ using payload helper error: %@";
        uint64_t v19 = v15;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        uint32_t v21 = 32;
        goto LABEL_19;
      }

      uint64_t v39 = [v3 fileURL];
      uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;

      goto LABEL_21;
    }
    uint64_t v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *(void *)(a1 + 48);
      id v33 = [v4 scopedIdentifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = v32;
      __int16 v50 = 2114;
      __int16 v51 = v33;
      __int16 v52 = 2112;
      __int16 v53 = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "[CCSS] Failed to copy compute sync record %@ to asset %{public}@ using payload helper error: %@", buf, 0x20u);
    }
  }
  else
  {

    uint64_t v22 = PLImageManagerGetLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v23)
      {
        uint64_t v24 = *(void *)(a1 + 48);
        uint64_t v25 = [v4 scopedIdentifier];
        uint64_t v26 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v49 = v24;
        __int16 v50 = 2114;
        __int16 v51 = v25;
        __int16 v52 = 2114;
        __int16 v53 = v26;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "[CCSS] No compute sync wrapper resource found %@ for asset: %{public}@, resource: %{public}@", buf, 0x20u);
      }
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F8C500];
      uint64_t v44 = *MEMORY[0x1E4F28228];
      uint64_t v45 = @"Unable to find resource";
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      id v30 = &v45;
      int v31 = &v44;
    }
    else
    {
      if (v23)
      {
        uint64_t v34 = *(void *)(a1 + 48);
        long long v35 = [v4 scopedIdentifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = v34;
        __int16 v50 = 2114;
        __int16 v51 = v35;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "[CCSS] ComputeStateRecord contains nil fileURL unexpectedly %@ for asset %{public}@", buf, 0x16u);
      }
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F8C500];
      uint64_t v46 = *MEMORY[0x1E4F28228];
      BOOL v47 = @"Fetched ComputeStateRecord with nil fileURL";
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      id v30 = &v47;
      int v31 = &v46;
    }
    uint64_t v10 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:1];
    uint64_t v36 = [v27 errorWithDomain:v28 code:47013 userInfo:v10];
    uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(NSObject **)(v37 + 40);
    *(void *)(v37 + 40) = v36;
  }
LABEL_21:
}

uint64_t __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_112(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40);
  if (v4) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, void))(v2 + 16))(v2, v4, 0, 0, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(v2 + 16))(v2, 0, 0, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_99(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLImageManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      id v5 = @"YES";
    }
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Cancel callback, cancel succeeded: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_verifyResourceLocalAvailability:(id)a3 localResourceFileURL:(id *)a4 resourceReapirNeeded:(int64_t *)a5
{
  id v7 = a3;
  if ([v7 isLocallyAvailable])
  {
    char v25 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v9 = [v7 fileURL];
    uint64_t v10 = [v9 path];
    int v11 = [v8 fileExistsAtPath:v10 isDirectory:&v25];

    int64_t v12 = 1;
    if (v11 && !v25)
    {
      uint64_t v13 = [v7 asset];
      if (PLCanIncludeResourceInHints(v7, v13))
      {
        unint64_t v14 = [v7 asset];
        int v15 = [v14 imageRequestHintsContainsResource:v7];

        if (v15) {
          int64_t v12 = 0;
        }
        else {
          int64_t v12 = 3;
        }
      }
      else
      {

        int64_t v12 = 0;
      }
      id v23 = [v7 fileURL];
      if (!a4) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else
  {
    int64_t v12 = 0;
  }
  uint64_t v16 = [v7 fileURL];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v7 expectedFileURL];
  }
  uint64_t v19 = v18;

  char v24 = 0;
  os_log_type_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint32_t v21 = [v19 path];
  int v22 = [v20 fileExistsAtPath:v21 isDirectory:&v24];

  id v23 = 0;
  if (v22 && !v24)
  {
    id v23 = v19;
    int64_t v12 = 2;
  }

  if (a4) {
LABEL_16:
  }
    *a4 = v23;
LABEL_17:
  if (a5) {
    *a5 = v12;
  }
}

- (void)_cancelAvailabilityRequestWithTaskIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_lock_makeAvailableProgressByTaskIdentifier objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"_PLMakeAvailableProgressTypeKey"];
    unint64_t v9 = [v8 integerValue];

    uint64_t v10 = [v6 userInfo];
    int v11 = [v10 objectForKeyedSubscript:@"_PLMakeAvailableProgressStateKey"];
    unint64_t v12 = [v11 integerValue];
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v9 = 0;
  }
  [(NSMutableDictionary *)self->_lock_makeAvailableProgressByTaskIdentifier setObject:0 forKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v13 = PLImageManagerGetLog();
  unint64_t v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      if (v9 > 2) {
        int v15 = @"undefined";
      }
      else {
        int v15 = off_1E58628A0[v9];
      }
      if (v12 > 2) {
        os_log_type_t v20 = @"undefined";
      }
      else {
        os_log_type_t v20 = off_1E58628B8[v12];
      }
      *(_DWORD *)buf = 138543874;
      id v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = v20;
      uint64_t v16 = "[RM]: %{public}@ Will cancel make available request of type %@ in state %@";
      uint64_t v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      uint32_t v19 = 32;
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v4;
    uint64_t v16 = "Attempting to cancel availability request with identifier: %{public}@ that is not being tracked";
    uint64_t v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint32_t v19 = 12;
LABEL_15:
    _os_log_impl(&dword_19B3C7000, v17, v18, v16, buf, v19);
  }

  if (v9 == 1 && v12 == 2)
  {
    uint32_t v21 = [(PLPrimaryResourceDataStore *)self _cplManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__PLPrimaryResourceDataStore__cancelAvailabilityRequestWithTaskIdentifier___block_invoke;
    v22[3] = &unk_1E58626C8;
    id v23 = v4;
    [v21 cancelResourceTransferTaskWithIdentifier:v23 completion:v22];
  }
}

void __75__PLPrimaryResourceDataStore__cancelAvailabilityRequestWithTaskIdentifier___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = PLImageManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      id v5 = @"YES";
    }
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Cancel callback, cancel succeeded: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_videoConversionServiceClient
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_videoConversionServiceClient)
  {
    uint64_t v3 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F748E0]);
    videoConversionServiceClient = v2->_videoConversionServiceClient;
    v2->_videoConversionServiceClient = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_videoConversionServiceClient;
  return v5;
}

- (id)_imageConversionServiceClient
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_imageConversionServiceClient)
  {
    uint64_t v3 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F74898]);
    imageConversionServiceClient = v2->_imageConversionServiceClient;
    v2->_imageConversionServiceClient = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_imageConversionServiceClient;
  return v5;
}

- (id)_deferredPhotoFinalizer
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_deferredPhotoFinalizer)
  {
    uint64_t v3 = [[PLDeferredPhotoFinalizer alloc] initForUseCase:0];
    deferredPhotoFinalizer = v2->_deferredPhotoFinalizer;
    v2->_deferredPhotoFinalizer = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_deferredPhotoFinalizer;
  return v5;
}

- (void)_downloadCPLResource:(id)a3 options:(id)a4 taskDidBeginHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  if ([v10 isTransient])
  {
    unint64_t v14 = [v10 dataHandler];

    if (!v14)
    {
      int v15 = PLImageManagerGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Transient download started without a handler to deliver data, downloaded data will be unused", buf, 2u);
      }
    }
    uint64_t v16 = [(PLPrimaryResourceDataStore *)self _cplManager];
    uint64_t v17 = [v10 clientBundleID];
    os_log_type_t v18 = [v10 taskIdentifier];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke;
    v28[3] = &unk_1E5862678;
    id v29 = v10;
    id v30 = v11;
    [v16 downloadResourceInMemory:v13 clientBundleID:v17 proposedTaskIdentifier:v18 taskDidBeginHandler:v12 completionHandler:v28];
  }
  else
  {
    uint32_t v19 = [(PLPrimaryResourceDataStore *)self _cplManager];
    os_log_type_t v20 = [v10 downloadOptions];
    uint32_t v21 = [v10 clientBundleID];
    int v22 = [v10 taskIdentifier];
    if ([v10 wantsProgress])
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      id v25 = __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke_2;
      __int16 v26 = &unk_1E58626A0;
      uint64_t v27 = self;
    }
    objc_msgSend(v19, "downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v13, v20, v21, v22, v12, v11, v23, v24, v25, v26, v27);
  }
}

void __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [*(id *)(a1 + 32) dataHandler];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) dataHandler];
    ((void (**)(void, id))v10)[2](v10, v7);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, void, void, id))(v11 + 16))(v11, v12, 0, 0, v8);
  }
}

void __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = PLImageManagerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download progress %f", (uint8_t *)&v8, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(v7, "setCompletedUnitCount:", (uint64_t)(float)((float)objc_msgSend(v7, "totalUnitCount") * a3));
}

- (id)_cplResourceIfDownloadIsAvailableForResource:(id)a3 asset:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PLPrimaryResourceDataStore *)self isCPLSyncableLibraryStore]
    && [v8 isCPLResource])
  {
    if ([v10 isTransient])
    {
      uint64_t v11 = objc_msgSend(v9, "rm_cplResourceForResourceType:", objc_msgSend(v8, "cplType"));
    }
    else
    {
      unint64_t v14 = [v10 downloadOptions];
      int v15 = [v14 hasValidTimeRange];

      if (v15)
      {
        uint64_t v16 = [v10 downloadOptions];
        uint64_t v17 = v16;
        if (v16) {
          [v16 timeRange];
        }
        else {
          memset(v18, 0, sizeof(v18));
        }
        uint64_t v12 = [v8 cplResourceForTimeRange:v18];

        goto LABEL_6;
      }
      uint64_t v11 = [v8 cplResourceIncludeFile:1];
    }
    uint64_t v12 = (void *)v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_6:

  return v12;
}

- (BOOL)isCPLSyncableLibraryStore
{
  uint64_t v2 = [(PLResourceDataStore *)self pathManager];
  char v3 = [v2 isCPLSyncablePhotoLibraryPathManager];

  return v3;
}

- (id)_finalizeDeferredResource:(id)a3 asset:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v46 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *, id))a6;
  uint64_t v45 = [v10 taskIdentifier];
  uint64_t v44 = [v46 uuid];
  uint64_t v12 = PLImageManagerGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v44;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ requesting final image from deferred processing demon for asset: %@", buf, 0x16u);
  }

  if (!v45)
  {
    uint64_t v45 = [MEMORY[0x1E4F8BA08] UUIDString];
    [v10 setTaskIdentifier:v45];
  }
  PLSendCTMScheduleAnalytics(v46, 0, 1);
  int v13 = [v9 recipeID];
  int v14 = [v46 deferredProcessingNeeded];
  int v15 = [v46 videoDeferredProcessingNeeded];
  [v9 localAvailabilityTarget];
  if ((v13 & 0xFFFFFFFD) == 0x10198) {
    goto LABEL_6;
  }
  uint64_t v17 = 0;
  if (v13 <= 131271)
  {
    if (v13 != 65938)
    {
      if (v13 != 0x20000) {
        goto LABEL_29;
      }
      goto LABEL_15;
    }
    uint64_t v17 = 0;
    if (v14 == 2 || v14 == 9) {
      goto LABEL_29;
    }
    BOOL v18 = v14 == 1 || v14 == 10;
    uint64_t v19 = 4;
    uint64_t v20 = 2;
LABEL_23:
    if (v18) {
      uint64_t v19 = v20;
    }
LABEL_27:
    if ((unint64_t)(v19 - 1) > 1)
    {
LABEL_28:
      uint64_t v17 = 0;
      goto LABEL_29;
    }
LABEL_6:
    int v16 = [v46 deferredProcessingNeeded];
    if (v16 == 10 || v16 == 1)
    {
      uint64_t v17 = +[PLResourceRecipe recipeFromID:65944];
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v13 == 131280)
  {
    uint64_t v19 = v15 != 0;
    goto LABEL_27;
  }
  if (v13 != 131272) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v17 = 0;
  switch(v14)
  {
    case 1:
    case 10:
      goto LABEL_6;
    case 2:
    case 9:
      break;
    default:
      BOOL v18 = v15 == 0;
      uint64_t v19 = 2;
      uint64_t v20 = 4;
      goto LABEL_23;
  }
LABEL_29:
  id v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  int v21 = [v43 BOOLForKey:@"PLFrameDropRecoveryOnDemandProcessingUserDefaultsKey"];
  if (v21)
  {
    id v42 = 0;
  }
  else
  {
    id v56 = 0;
    BOOL v22 = +[PLPrimaryResourceDataStore bailOutOfVideoFinalizationForAsset:v46 taskIdentifier:v45 error:&v56];
    id v42 = v56;
    if (!v22)
    {
      uint64_t v36 = PLImageManagerGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v45;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2112;
        id v58 = v42;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Error bailing out of video finalization for asset with uuid %@: %@", buf, 0x20u);
      }

      goto LABEL_50;
    }
  }
  if (!v17)
  {
LABEL_50:
    v11[2](v11, v45, v42);
    uint64_t v17 = 0;
    id v35 = 0;
    goto LABEL_51;
  }
  uint64_t v23 = PLImageManagerGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ Generating resource for recipe %@ as it is not available", buf, 0x16u);
  }

  if (v21)
  {
    uint64_t v24 = PLImageManagerGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = @"PLFrameDropRecoveryOnDemandProcessingUserDefaultsKey";
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Requesting on demand frame drop recovery because the user default %@ is set", buf, 0x16u);
    }

    uint64_t v25 = +[PLResourceRecipe recipeFromID:131280];

    uint64_t v17 = (void *)v25;
  }
  PLImageManagerGetLog();
  __int16 v26 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v27 = os_signpost_id_generate(v26);

  __int16 v28 = v26;
  id v29 = v28;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&unsigned char buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "GenerateAndStoreDeferredResource", "taskIdentifier = %{public}@, recipe %{public}@", buf, 0x16u);
  }

  id v39 = v10;
  uint64_t v40 = v29;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v58) = 0;
  id v30 = [(PLPrimaryResourceDataStore *)self _imageConversionServiceClient];
  int v31 = [(PLPrimaryResourceDataStore *)self _videoConversionServiceClient];
  uint64_t v32 = [(PLPrimaryResourceDataStore *)self _deferredPhotoFinalizer];
  id v55 = 0;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3254779904;
  v47[2] = __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke;
  v47[3] = &unk_1EEB29B00;
  id v33 = v40;
  __int16 v53 = v33;
  os_signpost_id_t v54 = v27;
  id v34 = v45;
  id v48 = v34;
  id v49 = v44;
  __int16 v50 = self;
  __int16 v52 = buf;
  __int16 v51 = v11;
  [v17 generateAndStoreForAsset:v46 version:0 imageConversionClient:v30 videoConversionClient:v31 conversionServiceOptions:0 deferredPhotoFinalizer:v32 progress:&v55 reason:@"On demand recipe generation request" completion:v47];
  id v35 = v55;

  id v10 = v39;
  if (v35)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
      [(NSMutableDictionary *)self->_lock_makeAvailableProgressByTaskIdentifier setObject:v35 forKeyedSubscript:v34];
    }
    os_unfair_lock_unlock(&self->_lock);
  }

  _Block_object_dispose(buf, 8);
LABEL_51:
  id v37 = v35;

  return v37;
}

void __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2230;
  void v29[4] = __Block_byref_object_dispose__2231;
  id v16 = v12;
  id v30 = v16;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke_77;
  v25[3] = &unk_1E5875340;
  id v17 = v11;
  id v26 = v17;
  id v18 = v16;
  id v27 = v18;
  __int16 v28 = v29;
  [v17 performBlockAndWait:v25];
  uint64_t v19 = *(id *)(a1 + 72);
  uint64_t v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 80);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "GenerateAndStoreDeferredResource", "", buf, 2u);
  }

  BOOL v22 = PLImageManagerGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v23;
    __int16 v33 = 2112;
    uint64_t v34 = v24;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Generate and store completed for asset: %@", buf, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 24));
  [*(id *)(*(void *)(a1 + 48) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 24));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  _Block_object_dispose(v29, 8);
}

void __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke_77(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v7 = 0;
    char v3 = [v2 save:&v7];
    id v4 = v7;
    id v5 = v7;
    if ((v3 & 1) == 0)
    {
      uint64_t v6 = PLImageManagerGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v5;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to save moc with error: %@", buf, 0xCu);
      }

      if (!*(void *)(a1 + 40)) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
      }
    }
  }
}

- (void)_lock_transitionTaskToInflightWithIdentifier:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "objectForKeyedSubscript:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setUserInfoObject:&unk_1EEBECE88 forKey:@"_PLMakeAvailableProgressStateKey"];
  }
}

- (BOOL)_lock_taskIsPendingDownloadWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_lock_makeAvailableProgressByTaskIdentifier objectForKeyedSubscript:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 userInfo];
      id v8 = [v7 objectForKeyedSubscript:@"_PLMakeAvailableProgressTypeKey"];
      if ([v8 integerValue] == 1)
      {
        id v9 = [v6 userInfo];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"_PLMakeAvailableProgressStateKey"];
        BOOL v11 = [v10 integerValue] == 1;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_newProgressForTaskWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[PLSyncCancellingProgress discreteProgressWithTotalUnitCount:100];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PLPrimaryResourceDataStore__newProgressForTaskWithIdentifier_type___block_invoke;
  v11[3] = &unk_1E5875DA0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  [v7 setCancellationHandler:v11];
  id v9 = [NSNumber numberWithInteger:a4];
  [v7 setUserInfoObject:v9 forKey:@"_PLMakeAvailableProgressTypeKey"];

  [v7 setUserInfoObject:&unk_1EEBECE70 forKey:@"_PLMakeAvailableProgressStateKey"];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __69__PLPrimaryResourceDataStore__newProgressForTaskWithIdentifier_type___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cancelAvailabilityRequestWithTaskIdentifier:*(void *)(a1 + 32)];
}

+ (unsigned)currentDeviceMasterThumbRecipeID
{
  if (currentDeviceMasterThumbRecipeID_s_onceToken != -1) {
    dispatch_once(&currentDeviceMasterThumbRecipeID_s_onceToken, &__block_literal_global_235);
  }
  return currentDeviceMasterThumbRecipeID_s_recipeID;
}

void __62__PLPrimaryResourceDataStore_currentDeviceMasterThumbRecipeID__block_invoke()
{
  v0 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  id v2 = [v0 masterThumbnailFormat];

  if ([v2 formatID] == 5005) {
    int v1 = 272155;
  }
  else {
    int v1 = 272151;
  }
  currentDeviceMasterThumbRecipeID_s_recipeID = v1;
}

+ (id)supportedRecipes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PLPrimaryResourceDataStore_supportedRecipes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedRecipes_s_onceToken != -1) {
    dispatch_once(&supportedRecipes_s_onceToken, block);
  }
  id v2 = (void *)supportedRecipes_s_recipes;
  return v2;
}

void __46__PLPrimaryResourceDataStore_supportedRecipes__block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  [v2 addObjectsFromArray:MEMORY[0x1E4F1CBF0]];
  id v3 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", [*(id *)(a1 + 32) currentDeviceMasterThumbRecipeID]);
  v21[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v2 addObjectsFromArray:v4];

  uint64_t v19 = [[PLPrimaryResourceDataStoreImageRecipe alloc] initWithRecipeID:65737];
  v20[0] = v19;
  id v18 = [[PLPrimaryResourceDataStoreImageRecipe alloc] initWithRecipeID:65938];
  v20[1] = v18;
  id v17 = [[PLPrimaryResourceDataStoreImageRecipe alloc] initWithRecipeID:65739];
  v20[2] = v17;
  id v16 = [[PLPrimaryResourceDataStoreImageRecipe alloc] initWithRecipeID:65741];
  v20[3] = v16;
  id v5 = [[PLPrimaryResourceDataStoreImageRecipe alloc] initWithRecipeID:65743];
  v20[4] = v5;
  id v6 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:0x20000];
  v20[5] = v6;
  id v7 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:131075];
  v20[6] = v7;
  id v8 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:131079];
  v20[7] = v8;
  id v9 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:131081];
  v20[8] = v9;
  uint64_t v10 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:131277];
  v20[9] = v10;
  BOOL v11 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:131275];
  v20[10] = v11;
  id v12 = [[PLPrimaryResourceDataStoreVideoRecipe alloc] initWithRecipeID:131272];
  v20[11] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:12];
  [v2 addObjectsFromArray:v13];

  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];
  id v15 = (void *)supportedRecipes_s_recipes;
  supportedRecipes_s_recipes = v14;
}

- (void)generateDeferredAdjustmentForAsset:(id)a3 imageConversionServiceClient:(id)a4 videoConversionServiceClient:(id)a5 reason:(id)a6 taskIdentifier:(id)a7 cplResourceType:(unint64_t)a8 version:(unsigned int)a9 completion:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  uint64_t v20 = [v14 objectID];
  os_signpost_id_t v21 = [v14 photoLibrary];
  BOOL v22 = [v21 libraryServicesManager];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke;
  v29[3] = &unk_1E586D2F8;
  id v30 = v18;
  id v31 = v22;
  id v33 = v19;
  unint64_t v34 = a8;
  unsigned int v35 = a9;
  id v32 = v20;
  id v23 = v19;
  id v24 = v20;
  id v25 = v22;
  id v26 = v18;
  id v27 = (id)[v14 generateDeferredAdjustmentWithImageConversionClient:v15 videoConversionClient:v16 reason:v17 allowCancellationByService:0 completion:v29];
}

void __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLImageManagerGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Render complete", buf, 0xCu);
    }

    id v9 = [*(id *)(a1 + 40) databaseContext];
    uint64_t v10 = (void *)[v9 newShortLivedLibraryWithName:"-[PLPrimaryResourceDataStore(Finalization) generateDeferredAdjustmentForAsset:imageConversionServiceClient:videoConversionServiceClient:reason:taskIdentifier:cplResourceType:version:completion:]_block_invoke"];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke_2;
    _OWORD v18[3] = &unk_1E586D2D0;
    id v19 = v10;
    id v11 = *(id *)(a1 + 48);
    id v13 = *(void **)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    id v20 = v11;
    uint64_t v22 = v12;
    int v23 = *(_DWORD *)(a1 + 72);
    id v21 = v13;
    id v14 = v10;
    [v14 performBlockAndWait:v18];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = [v5 code];
      id v17 = [v5 domain];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2048;
      uint64_t v29 = v16;
      __int16 v30 = 2114;
      id v31 = v17;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Render failed with error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = 0;
  id v4 = [v2 existingObjectWithID:v3 error:&v13];
  id v5 = v13;

  if (v4)
  {
    id v6 = [v4 resourceForCPLType:*(void *)(a1 + 56) version:*(unsigned int *)(a1 + 64)];
  }
  else
  {
    if (v5)
    {
      id v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
      }
    }
    id v6 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [v6 dataLength];
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = [v6 fileURL];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t, void *))(v9 + 16))(v9, 0, v10, v11, v12);
}

- (id)getClosestResourceMatchingCPLResourceType:(unint64_t)a3 version:(unsigned int)a4 asset:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [v7 resourceForCPLType:a3 version:v5];
  uint64_t v9 = v8;
  if (!v8 || (int)[v8 localAvailability] <= 0)
  {

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = objc_msgSend(v7, "modernResources", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v9 = 0;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v15 version] == v5
            && [v15 localAvailability] == 1)
          {
            if (!v9 || (uint64_t v16 = [v9 unorientedWidth], v16 < objc_msgSend(v15, "unorientedWidth")))
            {
              id v17 = v15;

              uint64_t v9 = v17;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

+ (BOOL)bailOutOfVideoFinalizationForAsset:(id)a3 taskIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 videoDeferredProcessingNeeded])
  {
    id v10 = 0;
    char v9 = 1;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v21 = 0;
  char v9 = [v7 promoteProxyToFinalVideoComplementWithOutError:&v21];
  id v10 = v21;
  uint64_t v11 = PLImageManagerGetLog();
  uint64_t v12 = v11;
  if (v9)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138543362;
    id v23 = v8;
    uint64_t v13 = "[RM]: %{public}@ [FDR] Promoted video complement proxy to final";
    id v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138543618;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v10;
    uint64_t v13 = "[RM]: %{public}@ [FDR] Error on-demand promoting video complement proxy to final: %@";
    id v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 22;
  }
  _os_log_impl(&dword_19B3C7000, v14, v15, v13, buf, v16);
LABEL_10:

  PLSendFRCBailOutAnalytics(v7);
  id v17 = [v7 photoLibrary];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PLPrimaryResourceDataStore_Finalization__bailOutOfVideoFinalizationForAsset_taskIdentifier_error___block_invoke;
  v19[3] = &unk_1E5875CE0;
  id v20 = v7;
  [v17 performTransactionAndWait:v19];

  if (a5) {
LABEL_11:
  }
    *a5 = v10;
LABEL_12:

  return v9;
}

uint64_t __100__PLPrimaryResourceDataStore_Finalization__bailOutOfVideoFinalizationForAsset_taskIdentifier_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVideoDeferredProcessingNeeded:0];
}

@end