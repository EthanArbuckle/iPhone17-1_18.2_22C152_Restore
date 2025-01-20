@interface PLPrimaryResourceDataStoreDeferredProcessingRecipe
- (BOOL)_needsVideoFinalizationForImageAsset:(id)a3;
- (BOOL)isMarkedFullSize;
- (PLPrimaryResourceDataStoreDeferredProcessingRecipe)initWithRecipeID:(unsigned int)a3;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (id)description;
- (id)supportedVersionsForLocalResourceGeneration;
- (unsigned)recipeID;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)setRecipeID:(unsigned int)a3;
@end

@implementation PLPrimaryResourceDataStoreDeferredProcessingRecipe

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (id)description
{
  return PLResourceRecipeIDDescription(self->_recipeID, 1);
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v12 = *(void *)&a4;
  v64[3] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  id v16 = a11;
  v17 = [(PLPrimaryResourceDataStoreDeferredProcessingRecipe *)self supportedVersionsForLocalResourceGeneration];
  v18 = [NSNumber numberWithUnsignedInt:v12];
  int v19 = [v17 containsObject:v18];

  v50 = (void (**)(void, void, void, void, void, void))v16;
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    v63[0] = *MEMORY[0x1E4F28568];
    v23 = NSStringFromPLErrorCode();
    v64[0] = v23;
    v63[1] = @"recipe";
    id v49 = v14;
    id v24 = v15;
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLPrimaryResourceDataStoreDeferredProcessingRecipe recipeID](self, "recipeID"));
    v64[1] = v25;
    v63[2] = @"version";
    v26 = [NSNumber numberWithUnsignedInt:v12];
    v64[2] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
    v20 = [v21 errorWithDomain:v22 code:47004 userInfo:v27];

    id v15 = v24;
    id v14 = v49;
  }
  v28 = [v14 fileURLForCurrentDeferredProcessingPreviewFile];
  BOOL v30 = v28
     && ((int v29 = [v14 deferredProcessingNeeded], v29 == 10) || v29 == 1)
     && self->_recipeID == 65944;

  BOOL v31 = [(PLPrimaryResourceDataStoreDeferredProcessingRecipe *)self _needsVideoFinalizationForImageAsset:v14];
  BOOL v32 = v31;
  if (!v30 && !v31)
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F8C500];
    v61[0] = *MEMORY[0x1E4F28568];
    v35 = NSStringFromPLErrorCode();
    v62[0] = v35;
    v61[1] = @"recipe";
    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLPrimaryResourceDataStoreDeferredProcessingRecipe recipeID](self, "recipeID"));
    v62[1] = v36;
    v61[2] = @"version";
    v37 = [NSNumber numberWithUnsignedInt:v12];
    v62[2] = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
    uint64_t v39 = [v33 errorWithDomain:v34 code:47006 userInfo:v38];

    v20 = (void *)v39;
LABEL_15:
    v40 = [MEMORY[0x1E4F1CAD0] set];
    v42 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v46 = v50;
    ((void (**)(void, void, void *, void *, void *, void))v50)[2](v50, 0, v20, v40, v42, 0);
    goto LABEL_22;
  }
  if (!v19) {
    goto LABEL_15;
  }
  v40 = [v14 objectID];
  v41 = [v14 photoLibrary];
  v42 = [v41 libraryServicesManager];

  if (v30)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke;
    v56[3] = &unk_1E5865278;
    v43 = &v57;
    id v57 = v42;
    v44 = (id *)v58;
    v58[0] = v40;
    v58[1] = self;
    int v60 = v12;
    v45 = (id *)&v59;
    v46 = v50;
    v59 = v50;
    [v15 requestFinalizationOfAsset:v14 isBackgroundPriority:0 reason:@"generate deferred processing derivatives" completionHandler:v56];
  }
  else
  {
    if (!v32)
    {
      v46 = v50;
      goto LABEL_22;
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_51;
    v51[3] = &unk_1E5865278;
    v43 = &v52;
    id v52 = v42;
    v44 = (id *)v53;
    v53[0] = v40;
    v53[1] = self;
    int v55 = v12;
    v45 = (id *)&v54;
    v54 = v50;
    v47 = [v15 requestFrameDropRecoveryForAsset:v14 completionHandler:v51];
    v48 = v47;
    if (a9) {
      *a9 = v47;
    }

    v46 = v50;
  }

LABEL_22:
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__14063;
  v27[4] = __Block_byref_object_dispose__14064;
  id v28 = 0;
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  v6 = [*(id *)(a1 + 32) libraryBundle];
  id v7 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLPrimaryResourceDataStoreDeferredProcessingRecipe generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:]_block_invoke", v6);

  v8 = [v7 managedObjectContext];
  v9 = +[PLConcurrencyLimiter sharedLimiter];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2;
  v16[3] = &unk_1E58652A0;
  id v10 = v7;
  id v17 = v10;
  id v18 = *(id *)(a1 + 40);
  id v11 = v3;
  v25 = v27;
  uint64_t v12 = *(void *)(a1 + 48);
  id v19 = v11;
  uint64_t v20 = v12;
  int v26 = *(_DWORD *)(a1 + 64);
  id v13 = v4;
  id v21 = v13;
  id v14 = v5;
  id v22 = v14;
  id v24 = *(id *)(a1 + 56);
  id v15 = v8;
  id v23 = v15;
  [v9 asyncPerformOnContext:v15 identifyingBlock:0 block:v16];

  _Block_object_dispose(v27, 8);
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3 = a2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__14063;
  v27[4] = __Block_byref_object_dispose__14064;
  id v28 = 0;
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  v6 = [*(id *)(a1 + 32) libraryBundle];
  id v7 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLPrimaryResourceDataStoreDeferredProcessingRecipe generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:]_block_invoke", v6);

  v8 = [v7 managedObjectContext];
  v9 = +[PLConcurrencyLimiter sharedLimiter];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2_52;
  v16[3] = &unk_1E58652A0;
  id v10 = v7;
  id v17 = v10;
  id v18 = *(id *)(a1 + 40);
  id v11 = v3;
  v25 = v27;
  uint64_t v12 = *(void *)(a1 + 48);
  id v19 = v11;
  uint64_t v20 = v12;
  int v26 = *(_DWORD *)(a1 + 64);
  id v13 = v4;
  id v21 = v13;
  id v24 = *(id *)(a1 + 56);
  id v14 = v8;
  id v22 = v14;
  id v15 = v5;
  id v23 = v15;
  [v9 asyncPerformOnContext:v14 identifyingBlock:0 block:v16];

  _Block_object_dispose(v27, 8);
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2_52(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v16];
  id v5 = v16;

  if (v4)
  {
    if (!*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
      goto LABEL_12;
    }
    v6 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to request frame drop recovery for asset with error %@", buf, 0xCu);
    }

    uint64_t v8 = *(unsigned int *)(a1 + 104);
    id v10 = *(id *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    goto LABEL_10;
  }
  if (v5)
  {
    id v11 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Error fetching object in moc with assetID %@: %@", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 56);
    uint64_t v8 = *(unsigned int *)(a1 + 104);
    id v10 = v5;
LABEL_10:
    uint64_t v13 = [v9 recipeErrorWithCode:47001 version:v8 underlyingError:v10 debugDescription:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v20 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v20];
  id v5 = v20;

  if (v4)
  {
    if (!*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 64) addObject:*(void *)(a1 + 56)];
      id v17 = *(void **)(a1 + 72);
      id v16 = [v4 assetID];
      uint64_t v18 = [v16 libraryID];
      __int16 v19 = +[PLResourceGenerator fileAndTableBackedThumbnailManagerRecipesForLibraryID:v18];
      [v17 unionOrderedSet:v19];

      goto LABEL_12;
    }
    v6 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to finalize asset with error %@", buf, 0xCu);
    }

    uint64_t v8 = *(unsigned int *)(a1 + 104);
    id v10 = *(id *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    uint64_t v11 = 47007;
LABEL_10:
    uint64_t v14 = [v9 recipeErrorWithCode:v11 version:v8 underlyingError:v10 debugDescription:0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
LABEL_12:

    goto LABEL_13;
  }
  if (v5)
  {
    uint64_t v12 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error fetching object in moc with assetID %@: %@", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 56);
    uint64_t v8 = *(unsigned int *)(a1 + 104);
    uint64_t v11 = 47001;
    id v10 = v5;
    goto LABEL_10;
  }
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

- (BOOL)isMarkedFullSize
{
  unsigned int recipeID = self->_recipeID;
  return recipeID == 65944 || recipeID == 131280;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  unsigned int recipeID = self->_recipeID;
  if (recipeID == 131280 || recipeID == 65944) {
    return &unk_1EEBF1688;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return a3;
}

- (PLPrimaryResourceDataStoreDeferredProcessingRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreDeferredProcessingRecipe;
  id v5 = [(PLPrimaryResourceDataStoreDeferredProcessingRecipe *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() classFromRecipeID:v3];
    if (v6 != objc_opt_class())
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:v5 file:@"PLPrimaryResourceDataStoreDeferredProcessingRecipe.m" lineNumber:48 description:@"Wrong recipe class passed to recipe initializer"];
    }
    v5->_unsigned int recipeID = v3;
  }
  return v5;
}

- (BOOL)_needsVideoFinalizationForImageAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pathForDeferredVideoComplementFile];
  BOOL v6 = v5 && [v4 videoDeferredProcessingNeeded] && self->_recipeID == 131280;

  return v6;
}

@end