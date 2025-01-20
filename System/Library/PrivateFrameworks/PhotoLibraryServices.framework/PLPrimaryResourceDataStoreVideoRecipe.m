@interface PLPrimaryResourceDataStoreVideoRecipe
- (BOOL)isMarkedFullSize;
- (PLPrimaryResourceDataStoreVideoRecipe)initWithRecipeID:(unsigned int)a3;
- (id)_mediaConversionServiceOptionsForAsset:(id)a3 conversionServiceOptions:(id)a4 adjustmentData:(id)a5 largeAdjustmentData:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8;
- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4;
- (id)codecFourCharCodeName;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (id)description;
- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4;
- (id)supportedVersionsForLocalResourceGeneration;
- (id)uti;
- (unsigned)recipeID;
- (void)_generateAndStoreUsingMediaConversionServicesForAsset:(id)a3 version:(unsigned int)a4 conversionClient:(id)a5 conversionServiceOptions:(id)a6 isHighPriority:(BOOL)a7 progress:(id *)a8 reason:(id)a9 completion:(id)a10;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)generateAndStoreForAssetWithPriority:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8 progress:(id *)a9 completion:(id)a10;
- (void)setRecipeID:(unsigned int)a3;
@end

@implementation PLPrimaryResourceDataStoreVideoRecipe

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

- (void)generateAndStoreForAssetWithPriority:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8 progress:(id *)a9 completion:(id)a10
{
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  id v5 = a4;
  v6 = v5;
  unsigned int recipeID = self->_recipeID;
  if (recipeID == 131272 || recipeID == 0x20000)
  {
    v8 = [v5 pathForFullsizeRenderVideoFile];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
      goto LABEL_7;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (void)_generateAndStoreUsingMediaConversionServicesForAsset:(id)a3 version:(unsigned int)a4 conversionClient:(id)a5 conversionServiceOptions:(id)a6 isHighPriority:(BOOL)a7 progress:(id *)a8 reason:(id)a9 completion:(id)a10
{
  BOOL v82 = a7;
  uint64_t v12 = *(void *)&a4;
  v121[3] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v91 = a6;
  id v88 = a9;
  id v83 = a10;
  v16 = [(PLPrimaryResourceDataStoreVideoRecipe *)self supportedVersionsForLocalResourceGeneration];
  v17 = [NSNumber numberWithUnsignedInt:v12];
  char v18 = [v16 containsObject:v17];

  v95 = v14;
  v89 = v15;
  if ((v18 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    v120[0] = *MEMORY[0x1E4F28568];
    v23 = NSStringFromPLErrorCode();
    v121[0] = v23;
    v121[1] = self;
    v120[1] = @"recipe";
    v120[2] = @"version";
    v24 = [NSNumber numberWithUnsignedInt:v12];
    v121[2] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:3];
    uint64_t v26 = [v21 errorWithDomain:v22 code:47004 userInfo:v25];
    v85 = 0;
    v87 = 0;
    v93 = 0;
LABEL_14:

    uint64_t v27 = 0;
    uint64_t v20 = 0;
    int v28 = 0;
    goto LABEL_15;
  }
  v19 = [(PLPrimaryResourceDataStoreVideoRecipe *)self chooseIngredientsFrom:v14 version:v12];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"Video"];
  if (v12 == 2 || v12 == 3 && [v14 hasAdjustments])
  {
    v93 = [v19 objectForKeyedSubscript:@"Adjustment"];
    v87 = [v19 objectForKeyedSubscript:@"LargeAdjustment"];
  }
  else
  {
    v87 = 0;
    v93 = 0;
  }
  if ([v14 isPhotoIris])
  {
    uint64_t v27 = [v19 objectForKeyedSubscript:@"VideoComplement"];
  }
  else
  {
    uint64_t v27 = 0;
  }
  v85 = v19;
  if (!(v20 | v27))
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F8C500];
    v118[0] = *MEMORY[0x1E4F28568];
    v23 = NSStringFromPLErrorCode();
    v119[0] = v23;
    v119[1] = self;
    v118[1] = @"recipe";
    v118[2] = @"version";
    v24 = [NSNumber numberWithUnsignedInt:v12];
    v119[2] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:3];
    uint64_t v26 = [v29 errorWithDomain:v30 code:47003 userInfo:v25];
    goto LABEL_14;
  }
  uint64_t v26 = 0;
  int v28 = 1;
LABEL_15:
  uint64_t v31 = [(PLPrimaryResourceDataStoreVideoRecipe *)self uti];
  v86 = (void *)v20;
  v32 = [(id)v20 dataStoreKey];
  v33 = [v95 assetID];
  *((void *)&v94 + 1) = [v32 fileURLForAssetID:v33];

  v34 = [(id)v27 dataStoreKey];
  v35 = [v95 assetID];
  *(void *)&long long v94 = [v34 fileURLForAssetID:v35];

  uint64_t v36 = [(PLPrimaryResourceDataStoreVideoRecipe *)self expectedFileURLForVersion:v12 asset:v95];
  v90 = (void *)v31;
  v92 = (void *)v36;
  v84 = (void *)v27;
  if (v31 && v94 != 0 && v36)
  {
    v37 = (void *)v26;
    v38 = v89;
  }
  else
  {
    v39 = PLBackendGetLog();
    v40 = (void *)v26;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v111 = (PLPrimaryResourceDataStoreVideoRecipe *)v31;
      __int16 v112 = 2112;
      uint64_t v113 = *((void *)&v94 + 1);
      __int16 v114 = 2112;
      uint64_t v115 = v94;
      __int16 v116 = 2112;
      v117 = v92;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "Unable to generate local resources, targetUTI = %@, sourceURLVideo = %@, sourceURLVideoComplement = %@, destURL = %@", buf, 0x2Au);
    }

    v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F8C500];
    v108[0] = *MEMORY[0x1E4F28568];
    v43 = NSStringFromPLErrorCode();
    v109[0] = v43;
    v109[1] = self;
    v108[1] = @"recipe";
    v108[2] = @"version";
    v44 = [NSNumber numberWithUnsignedInt:v12];
    v109[2] = v44;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:3];
    uint64_t v46 = [v41 errorWithDomain:v42 code:47006 userInfo:v45];

    int v28 = 0;
    v37 = (void *)v46;
    v38 = v89;
  }
  v47 = v95;
  int v48 = [v95 hasAdjustments];
  if (v12 == 2)
  {
    if (v48)
    {
      v49 = [NSNumber numberWithUnsignedInt:self->_recipeID];
      int v50 = [&unk_1EEBF2288 containsObject:v49];

      if (v50)
      {
        if (!v93)
        {
          v51 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v52 = *MEMORY[0x1E4F8C500];
          uint64_t v53 = *MEMORY[0x1E4F28568];
          v106[0] = *MEMORY[0x1E4F28568];
          v54 = NSStringFromPLErrorCode();
          v107[0] = v54;
          v107[1] = self;
          v106[1] = @"recipe";
          v106[2] = @"version";
          v55 = [NSNumber numberWithUnsignedInt:2];
          v107[2] = v55;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:3];
          v57 = v56 = v38;
          uint64_t v58 = [v51 errorWithDomain:v52 code:47015 userInfo:v57];

          v38 = v56;
          v37 = (void *)v58;
          if (v56)
          {
            v59 = v91;
            v60 = (void (**)(void, void, void, void, void, void))v83;
LABEL_36:
            v68 = v84;
            v47 = v95;
LABEL_38:
            v61 = [MEMORY[0x1E4F1CAD0] set];
            id v63 = [MEMORY[0x1E4F1CAA0] orderedSet];
            ((void (**)(void, void, void *, void *, id, void))v60)[2](v60, 0, v37, v61, v63, 0);
            goto LABEL_48;
          }
LABEL_35:
          v59 = v91;
          v60 = (void (**)(void, void, void, void, void, void))v83;
          v65 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v104 = v53;
          v105 = @"conversionClient is nil";
          v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
          uint64_t v67 = [v65 errorWithDomain:v52 code:47001 userInfo:v66];

          v37 = (void *)v67;
          goto LABEL_36;
        }
      }
    }
  }
  if (!v38)
  {
    uint64_t v52 = *MEMORY[0x1E4F8C500];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    goto LABEL_35;
  }
  v59 = v91;
  if (!v28)
  {
    v60 = (void (**)(void, void, void, void, void, void))v83;
    v68 = v84;
    goto LABEL_38;
  }
  v61 = objc_opt_new();
  v62 = (void *)*((void *)&v94 + 1);
  if (!v86) {
    v62 = (void *)v94;
  }
  id v63 = v62;
  if (v63)
  {
    uint64_t v64 = *MEMORY[0x1E4F74910];
    [v61 setResourceURL:v63 forRole:*MEMORY[0x1E4F74910]];
  }
  else
  {
    v69 = PLBackendGetLog();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v111 = self;
      _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "Unable to retrieve sourceURL for recipe: %@", buf, 0xCu);
    }

    uint64_t v64 = *MEMORY[0x1E4F74910];
  }
  v70 = objc_opt_new();
  [v70 setResourceURL:v92 forRole:v64];
  v71 = [(PLPrimaryResourceDataStoreVideoRecipe *)self _mediaConversionServiceOptionsForAsset:v95 conversionServiceOptions:v91 adjustmentData:v93 largeAdjustmentData:v87 isHighPriority:v82 reason:v88];
  if (v71)
  {
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke;
    v96[3] = &unk_1E58722A0;
    id v97 = v95;
    int v101 = v12;
    id v98 = v92;
    v99 = self;
    v60 = (void (**)(void, void, void, void, void, void))v83;
    id v100 = v83;
    v38 = v89;
    *a8 = [v89 convertVideoAtSourceURLCollection:v61 toDestinationURLCollection:v70 options:v71 completionHandler:v96];

    v72 = v97;
  }
  else
  {
    v73 = PLBackendGetLog();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v73, OS_LOG_TYPE_ERROR, "Failed to run the conversion service because options were nil.", buf, 2u);
    }

    v74 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v75 = *MEMORY[0x1E4F8C500];
    v102[0] = *MEMORY[0x1E4F28568];
    v76 = NSStringFromPLErrorCode();
    v103[0] = v76;
    v103[1] = self;
    v102[1] = @"recipe";
    v102[2] = @"version";
    v77 = [NSNumber numberWithUnsignedInt:v12];
    v103[2] = v77;
    v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:3];
    uint64_t v79 = [v74 errorWithDomain:v75 code:47007 userInfo:v78];

    v72 = [MEMORY[0x1E4F1CAD0] set];
    v80 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v60 = (void (**)(void, void, void, void, void, void))v83;
    (*((void (**)(id, void, uint64_t, void *, void *, void))v83 + 2))(v83, 0, v79, v72, v80, 0);

    v37 = (void *)v79;
    v38 = v89;
    v47 = v95;
    v71 = 0;
  }

  v68 = v84;
  v59 = v91;
LABEL_48:
}

void __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = +[PLConcurrencyLimiter sharedLimiter];
  v8 = [*(id *)(a1 + 32) managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2;
  v13[3] = &unk_1E5872278;
  uint64_t v19 = a2;
  id v14 = *(id *)(a1 + 40);
  int v20 = *(_DWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v6;
  id v18 = v11;
  id v12 = v6;
  [v7 asyncPerformOnContext:v8 identifyingBlock:0 block:v13];
}

void __187__PLPrimaryResourceDataStoreVideoRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  if (*(void *)(a1 + 72) == 1)
  {
    v4 = [*(id *)(a1 + 32) path];
    uint64_t v5 = *(unsigned int *)(a1 + 80);
    uint64_t v6 = [*(id *)(a1 + 40) width];
    uint64_t v7 = [*(id *)(a1 + 40) height];
    uint64_t v8 = *(void *)(a1 + 48);
    LOWORD(v19) = [*(id *)(a1 + 40) kind];
    id v9 = +[PLResourceInstaller generateValidatedExternalImageResourceOfType:1 forFilePath:v4 requireFileToBePresent:1 version:v5 basedOnFullSizeWidth:v6 andHeight:v7 recipe:v8 assetKind:v19 error:0];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 40) assetID];
      v11 = [v10 libraryID];
      id v12 = PLDataStoreForClassIDAndLibraryID(0, v11);

      uint64_t v13 = *(void *)(a1 + 40);
      id v20 = 0;
      id v21 = 0;
      LODWORD(v10) = [v12 storeExternalResource:v9 forAsset:v13 options:0 error:&v21 resultingResource:&v20];
      id v14 = v21;
      id v15 = v20;
      if (v10)
      {
        [v2 addObject:*(void *)(a1 + 48)];
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v16 = [*(id *)(a1 + 48) recipeErrorWithCode:47009 version:*(unsigned int *)(a1 + 80) underlyingError:v14 debugDescription:0];
      }
    }
    else
    {
      uint64_t v16 = [*(id *)(a1 + 48) recipeErrorWithCode:47010 version:*(unsigned int *)(a1 + 80) underlyingError:0 debugDescription:0];
    }
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 48) recipeErrorWithCode:47007 version:*(unsigned int *)(a1 + 80) underlyingError:*(void *)(a1 + 56) debugDescription:0];
  }
  uint64_t v17 = *(void *)(a1 + 64);
  id v18 = [*(id *)(a1 + 40) managedObjectContext];
  (*(void (**)(uint64_t, void *, void *, void *, void *, void))(v17 + 16))(v17, v18, v16, v2, v3, 0);
}

- (id)_mediaConversionServiceOptionsForAsset:(id)a3 conversionServiceOptions:(id)a4 adjustmentData:(id)a5 largeAdjustmentData:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8
{
  BOOL v9 = a7;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = v18;
  if (v14) {
    [v18 addEntriesFromDictionary:v14];
  }
  [v19 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F74A20]];
  unsigned int recipeID = self->_recipeID;
  if (recipeID - 0x20000 <= 9)
  {
    if (((1 << self->_recipeID) & 0x2A8) != 0) {
      goto LABEL_10;
    }
    if (recipeID == 0x20000) {
      goto LABEL_17;
    }
  }
  if (recipeID - 131272 > 8) {
    goto LABEL_7;
  }
  if (((1 << (recipeID + 56)) & 0x1A8) != 0)
  {
LABEL_10:
    id v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3B8];
    v23 = NSStringFromSelector(a2);
    [v21 raise:v22, @"%@ not yet implemented for recipe: %@", v23, self format];
LABEL_11:

LABEL_12:
    id v24 = v19;
    goto LABEL_13;
  }
  if (recipeID != 131272)
  {
LABEL_7:
    if (recipeID != 131475) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
LABEL_17:
  uint64_t v26 = [v15 adjustmentDictionary];
  v23 = v26;
  if (!v26) {
    goto LABEL_11;
  }
  uint64_t v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
  v43 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
  int v28 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
  if (([v28 isEqual:@"com.apple.photos"] & 1) == 0)
  {
    v37 = PLBackendGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = self;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "This adjustment data cannot be processed by Photos. Recipe: %@", buf, 0xCu);
    }

    goto LABEL_28;
  }
  if (v9) {
    uint64_t v29 = 4;
  }
  else {
    uint64_t v29 = 2;
  }
  uint64_t v30 = [NSNumber numberWithInteger:v29];
  [v19 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F749D8]];

  [v19 setObject:&unk_1EEBEFF60 forKeyedSubscript:*MEMORY[0x1E4F74A30]];
  if (v27)
  {
    uint64_t v31 = *MEMORY[0x1E4F74928];
    v46[0] = *MEMORY[0x1E4F74920];
    v46[1] = v31;
    v47[0] = v27;
    v47[1] = v28;
    v46[2] = *MEMORY[0x1E4F74930];
    v32 = v43;
    v47[2] = v43;
    v33 = (void *)MEMORY[0x1E4F1C9E8];
    v34 = v47;
    v35 = v46;
LABEL_24:
    uint64_t v36 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:3];
    [v19 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F74978]];

    goto LABEL_11;
  }
  if (v16)
  {
    v38 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v42 = [v16 fileURL];
    v39 = [v42 path];
    uint64_t v27 = [v38 dataWithContentsOfFile:v39];

    if (v27)
    {
      uint64_t v40 = *MEMORY[0x1E4F74928];
      v44[0] = *MEMORY[0x1E4F74920];
      v44[1] = v40;
      v45[0] = v27;
      v45[1] = v28;
      v44[2] = *MEMORY[0x1E4F74930];
      v32 = v43;
      v45[2] = v43;
      v33 = (void *)MEMORY[0x1E4F1C9E8];
      v34 = v45;
      v35 = v44;
      goto LABEL_24;
    }
    uint64_t v27 = PLBackendGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = self;
      v41 = "Adjustment datablob could not be retrieved for recipe: %@";
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v27 = PLBackendGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = self;
      v41 = "Cannot retrieve any adjustment data for recipe: %@";
LABEL_36:
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
    }
  }
LABEL_28:

  id v24 = 0;
LABEL_13:

  return v24;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(PLPrimaryResourceDataStoreVideoRecipe *)self supportedVersionsForLocalResourceGeneration];
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    unsigned int recipeID = self->_recipeID;
    if (recipeID == 131272 || recipeID == 0x20000)
    {
      v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(PLResourceRecipe *)self populateAdjustedRecipeIngredients:v11 asset:v6 version:v4];
    }
    else
    {
      v11 = 0;
    }
    if ([v11 count]) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = 0;
    }
    id v12 = v13;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isMarkedFullSize
{
  BOOL result = 0;
  signed int recipeID = self->_recipeID;
  if (recipeID > 131271)
  {
    BOOL v5 = recipeID == 131280;
    unsigned __int16 v6 = 200;
  }
  else
  {
    BOOL v5 = recipeID == 0x20000;
    unsigned __int16 v6 = 3;
  }
  int v7 = v6 | 0x20000;
  if (v5 || recipeID == v7) {
    return 1;
  }
  return result;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  unsigned int recipeID = self->_recipeID;
  if (recipeID == 131272 || recipeID == 0x20000) {
    return &unk_1EEBF2270;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)uti
{
  uint64_t v4 = 0;
  unsigned int recipeID = self->_recipeID;
  unsigned int v6 = recipeID - 0x20000;
  if (!(!v3 & v2))
  {
    uint64_t v8 = (id *)MEMORY[0x1E4F44438];
    switch(v6)
    {
      case 0u:
      case 5u:
        goto LABEL_11;
      case 1u:
      case 2u:
      case 4u:
      case 6u:
      case 8u:
        goto LABEL_13;
      case 3u:
      case 7u:
      case 9u:
        goto LABEL_12;
      default:
        JUMPOUT(0);
    }
  }
  BOOL v7 = recipeID - 131272 > 8 || ((1 << (recipeID + 56)) & 0x1A9) == 0;
  if (!v7 || recipeID == 131475)
  {
LABEL_11:
    uint64_t v8 = (id *)MEMORY[0x1E4F44490];
LABEL_12:
    uint64_t v4 = [*v8 identifier];
  }
LABEL_13:
  int v9 = +[PLUniformTypeIdentifier utiWithIdentifier:v4];

  return v9;
}

- (id)codecFourCharCodeName
{
  unsigned int recipeID = self->_recipeID;
  if (recipeID - 0x20000 > 9) {
    goto LABEL_2;
  }
  if (((1 << self->_recipeID) & 0x289) != 0)
  {
LABEL_10:
    uint64_t v4 = +[PLCodec H264fourCharCode];
    goto LABEL_11;
  }
  if (recipeID != 131077)
  {
LABEL_2:
    if (recipeID - 131272 <= 8 && ((1 << (recipeID + 56)) & 0x1A9) != 0) {
      goto LABEL_10;
    }
    if (recipeID != 131475)
    {
      uint64_t v4 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v4 = +[PLCodec HEVCfourCharCode];
LABEL_11:
  return v4;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return 0;
}

- (PLPrimaryResourceDataStoreVideoRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreVideoRecipe;
  BOOL v5 = [(PLPrimaryResourceDataStoreVideoRecipe *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() classFromRecipeID:v3];
    if (v6 != objc_opt_class())
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:v5 file:@"PLPrimaryResourceDataStoreVideoRecipe.m" lineNumber:48 description:@"wrong recipe class passed to recipe initializer."];
    }
    v5->_unsigned int recipeID = v3;
  }
  return v5;
}

@end