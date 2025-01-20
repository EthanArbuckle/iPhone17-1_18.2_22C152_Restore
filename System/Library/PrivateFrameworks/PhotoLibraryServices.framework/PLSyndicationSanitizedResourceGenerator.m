@interface PLSyndicationSanitizedResourceGenerator
- (BOOL)_handleGenerateCompletionWithGenerateError:(id)a3 storedRecipes:(id)a4 sourceMetadata:(id)a5 targetRecipe:(id)a6 assetObjectID:(id)a7 managedObjectContext:(id)a8 timeZoneLookup:(id)a9 error:(id *)a10;
- (PLSyndicationSanitizedResourceGenerator)initWithDelegate:(id)a3;
- (PLSyndicationSanitizedResourceGeneratorDelegate)delegate;
- (void)_generateAndStoreDerivativeResourcesForSyndicationResource:(id)a3 completion:(id)a4;
- (void)generateAndStoreDerivativeResourcesForSyndicationResource:(id)a3 completion:(id)a4;
@end

@implementation PLSyndicationSanitizedResourceGenerator

- (void).cxx_destruct
{
}

- (PLSyndicationSanitizedResourceGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSyndicationSanitizedResourceGeneratorDelegate *)WeakRetained;
}

- (void)generateAndStoreDerivativeResourcesForSyndicationResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__PLSyndicationSanitizedResourceGenerator_generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke;
  v8[3] = &unk_1E5863F70;
  id v9 = v6;
  id v7 = v6;
  [(PLSyndicationSanitizedResourceGenerator *)self _generateAndStoreDerivativeResourcesForSyndicationResource:a3 completion:v8];
}

uint64_t __112__PLSyndicationSanitizedResourceGenerator_generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_generateAndStoreDerivativeResourcesForSyndicationResource:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  v8 = [v6 asset];
  id v9 = [v8 firstPersistedResourceMatching:&__block_literal_global_8459];
  if ([v9 isLocallyAvailable]
    && [v8 effectiveThumbnailIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = PLSyndicationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "[sync] medium image is already locally available", buf, 2u);
    }

    v29 = [v6 managedObjectContext];
    v7[2](v7, 1);
  }
  else
  {
    v27 = [v8 objectID];
    v26 = [v9 objectID];
    v10 = PLSyndicationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 uuid];
      *(_DWORD *)buf = 138543362;
      v39 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "[sync] generating medium image for %{public}@", buf, 0xCu);
    }
    v28 = v7;
    v12 = v6;
    if (PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v8))
    {
      uint64_t v36 = *MEMORY[0x1E4F74A28];
      uint64_t v37 = MEMORY[0x1E4F1CC38];
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    }
    else
    {
      v29 = 0;
    }
    int v13 = PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v8);
    v14 = @"Syndication sans Blast Door";
    if (v13) {
      v14 = @"Blast Door";
    }
    v24 = v14;
    v15 = +[PLResourceRecipe recipeFromID:65741];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = [WeakRetained imageConversionClientForResourceGenerator:self];
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = [v17 videoConversionClientForResourceGenerator:self];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __113__PLSyndicationSanitizedResourceGenerator__generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke_67;
    v30[3] = &unk_1E5864398;
    v30[4] = self;
    id v31 = v15;
    id v32 = v27;
    v19 = v12;
    id v33 = v12;
    id v34 = v26;
    id v7 = v28;
    v35 = v28;
    id v20 = v26;
    id v21 = v27;
    id v22 = v15;
    [v22 generateAndStoreForAsset:v8 version:0 imageConversionClient:v16 videoConversionClient:v18 conversionServiceOptions:v29 deferredPhotoFinalizer:0 progress:0 reason:v24 completion:v30];

    id v6 = v19;
  }
}

void __113__PLSyndicationSanitizedResourceGenerator__generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke_67(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  v11 = (void *)a1[4];
  uint64_t v26 = a1[5];
  uint64_t v12 = a1[6];
  int v13 = (void *)a1[7];
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v13 photoLibrary];
  v18 = [v17 libraryBundle];
  v19 = [v18 timeZoneLookup];
  id v28 = 0;
  [v11 _handleGenerateCompletionWithGenerateError:v16 storedRecipes:v15 sourceMetadata:v14 targetRecipe:v26 assetObjectID:v12 managedObjectContext:v10 timeZoneLookup:v19 error:&v28];

  id v20 = v28;
  uint64_t v21 = a1[8];
  id v27 = 0;
  id v22 = [v10 existingObjectWithID:v21 error:&v27];
  id v23 = v27;
  if (!v22)
  {
    v24 = PLSyndicationGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = a1[8];
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v25;
      __int16 v31 = 2112;
      id v32 = v23;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "[sync] failed to fetch resource to clear sanitization flag with objectID: %{public}@, error %@", buf, 0x16u);
    }

    if (!v20) {
      id v20 = v23;
    }
  }
  (*(void (**)(void))(a1[9] + 16))();
}

BOOL __113__PLSyndicationSanitizedResourceGenerator__generateAndStoreDerivativeResourcesForSyndicationResource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 recipeID] == 65741
    && ![v2 version]
    && [v2 resourceType] == 0;

  return v3;
}

- (BOOL)_handleGenerateCompletionWithGenerateError:(id)a3 storedRecipes:(id)a4 sourceMetadata:(id)a5 targetRecipe:(id)a6 assetObjectID:(id)a7 managedObjectContext:(id)a8 timeZoneLookup:(id)a9 error:(id *)a10
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16)
  {
    id v104 = v16;
    id v23 = PLSyndicationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v104;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "[sync.resource] conversion service returned error: %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (([v17 containsObject:v19] & 1) == 0)
  {
    id v23 = [NSString stringWithFormat:@"requested recipe %@ was not stored", v19];
    id v104 = (id)PLErrorCreate();
LABEL_7:

    int v24 = 0;
    goto LABEL_8;
  }
  id v104 = 0;
  int v24 = 1;
LABEL_8:
  id v113 = 0;
  uint64_t v25 = [v21 existingObjectWithID:v20 error:&v113];
  id v103 = v113;
  v107 = v25;
  v101 = v18;
  v99 = v20;
  v100 = v19;
  v97 = v22;
  v98 = v21;
  if (!v24 || v25)
  {
    if (!v24) {
      goto LABEL_17;
    }
    id v28 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v29 = [v28 BOOLForKey:@"PADisablePhotosBlastDoorProcessing"];

    if ((v29 & 1) == 0)
    {
      int v30 = PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v25);
      if (!v18)
      {
        if (v30)
        {
          uint64_t v26 = [NSString stringWithFormat:@"missing blastdoor source metadata"];
          goto LABEL_11;
        }
      }
    }
    v47 = [v25 syndicationOriginalResource];
    if (v47)
    {
      v48 = v47;
      uint64_t v49 = [v47 fileURL];
      v102 = v48;
      if (v49)
      {
        v50 = (void *)v49;
        int v51 = [v107 isPhotoIris];
        if (!v51)
        {
          v105 = 0;
LABEL_54:
          v65 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          char v66 = [v65 BOOLForKey:@"PADisablePhotosBlastDoorProcessing"];

          if ((v66 & 1) != 0 || !PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v107))
          {
            v75 = PLSyndicationGetLog();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              v76 = [v107 uuid];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v76;
              _os_log_impl(&dword_19B3C7000, v75, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting properties via direct access to the original file: %{public}@", buf, 0xCu);
            }
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v78 = [WeakRetained metadataForResourceGenerator:self fromFileURL:v50];

            id v74 = v78;
            v71 = v74;
          }
          else
          {
            v67 = PLSyndicationGetLog();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              v68 = [v107 uuid];
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v68;
              _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting properties via blastdoor metadata: %{public}@", buf, 0xCu);
            }
            id v69 = objc_alloc(MEMORY[0x1E4F8CC48]);
            v70 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F74938]];
            v71 = (void *)[v69 initWithSyndicationProperties:v70];

            id v72 = objc_alloc(MEMORY[0x1E4F8CC48]);
            v73 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F74940]];
            id v74 = (id)[v72 initWithSyndicationProperties:v73];
          }
          [v107 setSyndicationAttributesFromMainFileURL:v50 metadata:v71];
          if (v51) {
            [v107 setSyndicationLivePhotoAttributesFromMainFileURL:v50 metadata:v74 videoComplementFileURL:v105];
          }
          [v71 exifPixelSize];
          [v102 setUnorientedWidth:(uint64_t)v79];
          [v71 exifPixelSize];
          [v102 setUnorientedHeight:(uint64_t)v80];
          objc_msgSend(v102, "setDataLength:", objc_msgSend(v71, "fileSize"));
          v81 = PLSyndicationGetLog();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v82 = [v102 unorientedWidth];
            uint64_t v83 = [v102 unorientedHeight];
            uint64_t v84 = [v102 orientation];
            uint64_t v85 = [v102 dataLength];
            *(_DWORD *)buf = 134349824;
            *(void *)&uint8_t buf[4] = v82;
            __int16 v116 = 2050;
            uint64_t v117 = v83;
            __int16 v118 = 2050;
            uint64_t v119 = v84;
            __int16 v120 = 2050;
            uint64_t v121 = v85;
            _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting original resource dimensions (%{public}lu, %{public}lu), orientation: %{public}lu, filesize: %{public}lu", buf, 0x2Au);
          }

          [v107 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
          __int16 v31 = v107;

          BOOL v96 = 1;
          goto LABEL_19;
        }
        v52 = [v107 syndicationOriginalVideoComplementResource];
        if (v52)
        {
          v53 = v52;
          v105 = [v52 fileURL];
          if (v105)
          {

            goto LABEL_54;
          }
          v106 = v53;
          [v53 setSyndicationLocalAvailabilityWithAvailable:0];
          v93 = NSString;
          v94 = [v107 uuid];
          v95 = [v93 stringWithFormat:@"missing video complement file url for live photo asset: %@", v94];
          uint64_t v89 = PLErrorCreate();

          v90 = PLSyndicationGetLog();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v91 = [v107 uuid];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v91;
            v92 = "[sync.resource] missing video complement file url for live photo asset: %{public}@";
            goto LABEL_71;
          }
        }
        else
        {
          v106 = 0;
          v86 = NSString;
          v87 = [v107 uuid];
          v88 = [v86 stringWithFormat:@"missing video complement resource for asset: %@", v87];
          uint64_t v89 = PLErrorCreate();

          v90 = PLSyndicationGetLog();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v91 = [v107 uuid];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v91;
            v92 = "[sync.resource] missing video complement resource for asset: %{public}@";
LABEL_71:
            _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_ERROR, v92, buf, 0xCu);
          }
        }

        BOOL v96 = 0;
        id v104 = (id)v89;
        __int16 v31 = v107;
        goto LABEL_19;
      }
      [v48 setSyndicationLocalAvailabilityWithAvailable:0];
      v60 = NSString;
      v61 = [v25 uuid];
      v62 = [v60 stringWithFormat:@"missing original file url for asset: %@", v61];
      uint64_t v57 = PLErrorCreate();

      v63 = PLSyndicationGetLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v64 = [v25 uuid];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v64;
        _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_ERROR, "[sync.resource] missing original file url for asset: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v54 = NSString;
      v55 = [v25 uuid];
      v56 = [v54 stringWithFormat:@"missing original resource for asset: %@", v55];
      uint64_t v57 = PLErrorCreate();

      v58 = PLSyndicationGetLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = [v25 uuid];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v59;
        _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "[sync.resource] missing original resource for asset: %{public}@", buf, 0xCu);
      }
      v102 = 0;
    }
    id v104 = (id)v57;
    __int16 v31 = v25;
    goto LABEL_18;
  }
  uint64_t v26 = [NSString stringWithFormat:@"did not find existing asset with object ID: %@", v20];
LABEL_11:
  uint64_t v27 = PLErrorCreate();

  id v104 = (id)v27;
LABEL_17:
  __int16 v31 = v25;
  v102 = [v25 syndicationOriginalResource];
LABEL_18:
  [v31 isPhotoIris];
  BOOL v96 = 0;
LABEL_19:
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v32 = v17;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v109 objects:v114 count:16];
  if (!v33) {
    goto LABEL_37;
  }
  uint64_t v34 = v33;
  uint64_t v35 = *(void *)v110;
  do
  {
    for (uint64_t i = 0; i != v34; ++i)
    {
      if (*(void *)v110 != v35) {
        objc_enumerationMutation(v32);
      }
      uint64_t v37 = *(void *)(*((void *)&v109 + 1) + 8 * i);
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __184__PLSyndicationSanitizedResourceGenerator__handleGenerateCompletionWithGenerateError_storedRecipes_sourceMetadata_targetRecipe_assetObjectID_managedObjectContext_timeZoneLookup_error___block_invoke;
      v108[3] = &unk_1E586B230;
      v108[4] = v37;
      v38 = [v31 firstPersistedResourceMatching:v108];
      v39 = v38;
      if (!v38)
      {
        v42 = PLSyndicationGetLog();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_35;
        }
        v44 = [v31 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v37;
        __int16 v116 = 2114;
        uint64_t v117 = (uint64_t)v44;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "[sync.resource] generated and stored recipe %{public}@ for asset %{public}@, but no stored resource found", buf, 0x16u);

LABEL_34:
        __int16 v31 = v107;
        goto LABEL_35;
      }
      uint64_t v40 = [v38 fileURL];

      v41 = PLSyndicationGetLog();
      v42 = v41;
      if (!v40)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v45 = [v107 uuid];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v37;
          __int16 v116 = 2114;
          uint64_t v117 = (uint64_t)v45;
          _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "[sync.resource] generated and stored recipe %{public}@ for asset %{public}@, but resource missing file url", buf, 0x16u);

          __int16 v31 = v107;
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [v107 uuid];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v37;
        __int16 v116 = 2114;
        uint64_t v117 = (uint64_t)v43;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "[sync.resource] setting cache delete flags on generated derivative resource with recipe: %{public}@ for asset %{public}@", buf, 0x16u);
      }
      v42 = [v39 fileURL];
      *(void *)buf = 0;
      __int16 v31 = v107;
      if (+[PLCacheDeleteSupport markPurgeableForFileAtURL:v42 withUrgency:0 outInode:buf])
      {
        [v39 setFileID:*(void *)buf];
      }
LABEL_35:
    }
    uint64_t v34 = [v32 countByEnumeratingWithState:&v109 objects:v114 count:16];
  }
  while (v34);
LABEL_37:

  if (a10) {
    *a10 = v104;
  }

  return v96;
}

BOOL __184__PLSyndicationSanitizedResourceGenerator__handleGenerateCompletionWithGenerateError_storedRecipes_sourceMetadata_targetRecipe_assetObjectID_managedObjectContext_timeZoneLookup_error___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 recipeID];
  return v3 == [*(id *)(a1 + 32) recipeID];
}

- (PLSyndicationSanitizedResourceGenerator)initWithDelegate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLSyndicationSanitizedResourceGenerator.m", 38, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PLSyndicationSanitizedResourceGenerator;
  id v6 = [(PLSyndicationSanitizedResourceGenerator *)&v10 init];
  id v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_delegate, v5);
  }

  return v7;
}

@end