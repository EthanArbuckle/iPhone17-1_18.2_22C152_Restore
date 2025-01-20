@interface PFStoryRecipe_PXStoryExtension
+ (BOOL)_recipe:(id)a3 isReferencingPHPhotoLibrary:(id)a4;
+ (BOOL)_recipe:(id)a3 setPHPhotoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)addDisplayAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6;
+ (BOOL)addPHAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6;
+ (BOOL)addSyntheticAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6;
+ (BOOL)recipeContainsAnyDisplayAsset:(id)a3;
+ (NSString)schemeForPHAssets;
+ (NSString)schemeForSyntheticAssets;
+ (id)PHAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5;
+ (id)PHPhotoLibraryForRecipe:(id)a3;
+ (id)displayAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5;
+ (id)flexFetchQueue;
+ (id)recipe:(id)a3 withPHPhotoLibrary:(id)a4 error:(id *)a5;
+ (id)recipeAssetFromAudioAsset:(id)a3 withCategory:(int64_t)a4 subcategory:(int64_t)a5 error:(id *)a6;
+ (id)requestAudioAssetFromRecipeAsset:(id)a3 recipe:(id)a4 resultHandler:(id)a5;
+ (id)syntheticAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5;
+ (void)enumerateDisplayAssetsFromRecipe:(id)a3 usingBlock:(id)a4;
@end

@implementation PFStoryRecipe_PXStoryExtension

+ (id)recipeAssetFromAudioAsset:(id)a3 withCategory:(int64_t)a4 subcategory:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (void *)MEMORY[0x1E4F8CDD8];
    uint64_t v36 = *MEMORY[0x1E4F8D298];
    id v11 = v9;
    v12 = [v11 identifier];
    v13 = [v11 title];
    v14 = [v11 subtitle];
    [v11 colorGradeCategory];
    id v15 = v9;
    v17 = v16 = a6;

    v18 = [v10 createAssetWithCategory:a4 subcategory:a5 catalog:v36 songID:v12 title:v13 subtitle:v14 colorGradeCategory:v17];

    a6 = v16;
    id v9 = v15;

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = a6;
    v19 = (void *)MEMORY[0x1E4F8CDD8];
    v20 = (uint64_t *)MEMORY[0x1E4F8D2A0];
LABEL_7:
    uint64_t v27 = *v20;
    id v28 = v9;
    v29 = [v28 identifier];
    v30 = [v28 title];
    v31 = [v28 subtitle];
    v32 = [v28 colorGradeCategory];

    v33 = v19;
    a6 = v37;
    v18 = [v33 createAssetWithCategory:a4 subcategory:a5 catalog:v27 songID:v29 title:v30 subtitle:v31 colorGradeCategory:v32];

LABEL_8:
    v34 = 0;
    if (!a6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = a6;
    v19 = (void *)MEMORY[0x1E4F8CDD8];
    v20 = (uint64_t *)MEMORY[0x1E4F8D2A8];
    goto LABEL_7;
  }
  v34 = PXStoryErrorCreateWithCodeDebugFormat(3, @"cannot create a recipe song asset from audio asset: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v9);
  v18 = 0;
  if (a6) {
LABEL_9:
  }
    *a6 = v34;
LABEL_10:

  return v18;
}

+ (id)requestAudioAssetFromRecipeAsset:(id)a3 recipe:(id)a4 resultHandler:(id)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  PLAudioPlaybackGetLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, a1);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PFStoryRecipe_PXStoryExtension - requestAudioAssetFromRecipeAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DB35B8;
  id v79 = a1;
  id v14 = v10;
  id v78 = v14;
  id v15 = (void (**)(void *, void, uint64_t, void *))_Block_copy(aBlock);
  if ([v8 kind] != 2)
  {
    v39 = PXStoryErrorCreateWithCodeDebugFormat(1, @"not a song recipe asset: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v8);
    id v40 = 0;
    if (!v39)
    {
LABEL_14:
      v41 = 0;
      goto LABEL_15;
    }
LABEL_13:
    v15[2](v15, 0, 1, v39);
    goto LABEL_14;
  }
  id v22 = v8;
  id v23 = [v22 catalog];
  id v24 = (id)*MEMORY[0x1E4F8D298];
  if (v23 == v24)
  {

    goto LABEL_17;
  }
  uint64_t v25 = v24;
  int v26 = [v23 isEqualToString:v24];

  if (v26)
  {
LABEL_17:
    v50 = [v22 songID];
    if (v50)
    {
      v51 = +[PFStoryRecipe_PXStoryExtension PHPhotoLibraryForRecipe:v9];
      id v66 = v22;
      id v52 = v14;
      id v53 = v9;
      v54 = objc_alloc_init(PXMusicCuratorAudioAssetRequestOptions);
      v81[0] = v50;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_208;
      v75[3] = &unk_1E5DB35E0;
      v76 = v15;
      id v40 = +[PXMusicCurator requestAudioAssetFetchResultForAdamIDs:v55 requestOptions:v54 photoLibrary:v51 completionHandler:v75];

      id v9 = v53;
      id v14 = v52;
      id v22 = v66;

LABEL_23:
      v39 = 0;
LABEL_26:

LABEL_27:
      if (!v39) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    PXStoryErrorCreateWithCodeDebugFormat(1, @"missing Adam ID for Apple Music song: %@", v44, v45, v46, v47, v48, v49, (uint64_t)v22);
    v39 = LABEL_25:;
    id v40 = 0;
    goto LABEL_26;
  }
  id v27 = (id)*MEMORY[0x1E4F8D2A0];
  if (v23 == v27)
  {

    goto LABEL_21;
  }
  id v28 = v27;
  int v29 = [v23 isEqualToString:v27];

  if (v29)
  {
LABEL_21:
    v50 = [v22 songID];
    if (v50)
    {
      v62 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
      v63 = [(id)objc_opt_class() flexFetchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_2;
      block[3] = &unk_1E5DC78D0;
      id v70 = v50;
      id v71 = 0;
      id v72 = v22;
      id v40 = v62;
      id v73 = v40;
      v74 = v15;
      dispatch_async(v63, block);

      goto LABEL_23;
    }
    PXStoryErrorCreateWithCodeDebugFormat(1, @"missing Flex ID for Flex Music song: %@", v56, v57, v58, v59, v60, v61, (uint64_t)v22);
    goto LABEL_25;
  }
  id v30 = (id)*MEMORY[0x1E4F8D2A8];
  if (v23 == v30)
  {
  }
  else
  {
    v31 = v30;
    char v32 = [v23 isEqualToString:v30];

    if ((v32 & 1) == 0)
    {
      v39 = PXStoryErrorCreateWithCodeDebugFormat(1, @"unknown catalog %@ for recipe song: %@", v33, v34, v35, v36, v37, v38, (uint64_t)v23);
      id v40 = 0;
      goto LABEL_27;
    }
  }
  v64 = [PXMockAudioAsset alloc];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_3;
  v67[3] = &unk_1E5DB3608;
  id v68 = v22;
  id v65 = v22;
  v41 = [(PXMockAudioAsset *)v64 initWithConfiguration:v67];

  if (v41) {
    ((void (**)(void *, PXMockAudioAsset *, uint64_t, void *))v15)[2](v15, v41, 1, 0);
  }
  id v40 = 0;
  v39 = 0;
LABEL_15:
  id v42 = v40;

  return v42;
}

+ (id)flexFetchQueue
{
  if (flexFetchQueue_onceToken != -1) {
    dispatch_once(&flexFetchQueue_onceToken, &__block_literal_global_45603);
  }
  v2 = (void *)flexFetchQueue_queue;
  return v2;
}

+ (BOOL)addDisplayAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (![v10 count])
  {
    id v15 = 0;
    char v13 = 1;
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  os_signpost_id_t v12 = [v10 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = 0;
    char v13 = [a1 addPHAssets:v10 toRecipe:v11 withCategory:a5 error:&v21];
    id v14 = v21;
LABEL_8:
    id v15 = v14;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = 0;
    char v13 = [a1 addSyntheticAssets:v10 toRecipe:v11 withCategory:a5 error:&v20];
    id v14 = v20;
    goto LABEL_8;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = *MEMORY[0x1E4F28228];
  uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Unknown display asset fetch result %@ containing %@", v10, v12];
  v23[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v15 = [v16 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v18];

  char v13 = 0;
LABEL_10:

  if (a6) {
LABEL_11:
  }
    *a6 = v15;
LABEL_12:

  return v13;
}

+ (id)displayAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__45614;
  int v29 = __Block_byref_object_dispose__45615;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__PFStoryRecipe_PXStoryExtension_displayAssetsInRecipe_withCategory_error___block_invoke;
  v24[3] = &unk_1E5DB3590;
  v24[4] = &v25;
  [v8 enumerateAssetsWithKind:1 usingBlock:v24];
  id v9 = (void *)v26[5];
  if (!v9) {
    PXDisplayAssetFetchResultEmpty();
  }
  id v10 = [a1 schemeForPHAssets];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    id v23 = 0;
    os_signpost_id_t v12 = [a1 PHAssetsInRecipe:v8 withCategory:a4 error:&v23];
    char v13 = v23;
  }
  else
  {
    id v14 = (void *)v26[5];
    id v15 = [a1 schemeForSyntheticAssets];
    LODWORD(v14) = [v14 isEqualToString:v15];

    if (!v14)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28228];
      id v18 = [NSString alloc];
      uint64_t v19 = (void *)[v18 initWithFormat:@"Unknown asset scheme %@", v26[5]];
      v32[0] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      id v16 = [v17 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v20];

      os_signpost_id_t v12 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v22 = 0;
    os_signpost_id_t v12 = [a1 syntheticAssetsInRecipe:v8 withCategory:a4 error:&v22];
    char v13 = v22;
  }
  id v16 = v13;
  if (a5) {
LABEL_10:
  }
    *a5 = v16;
LABEL_11:

  _Block_object_dispose(&v25, 8);
  return v12;
}

+ (BOOL)recipeContainsAnyDisplayAsset:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PFStoryRecipe_PXStoryExtension_recipeContainsAnyDisplayAsset___block_invoke;
  v6[3] = &unk_1E5DB3590;
  v6[4] = &v7;
  [v3 enumerateAssetsWithKind:1 usingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)enumerateDisplayAssetsFromRecipe:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 PHPhotoLibraryForRecipe:v6];
  if (v8)
  {
    uint64_t v9 = [_PXStoryRecipeEnumerator alloc];
    char v10 = [a1 schemeForPHAssets];
    int v11 = [(_PXStoryRecipeEnumerator *)v9 initWithBatchSize:200 photoLibrary:v8 scheme:v10 block:v7];

    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __88__PFStoryRecipe_PXStoryExtension_PhotoKit__enumerateDisplayAssetsFromRecipe_usingBlock___block_invoke;
    id v16 = &unk_1E5DB61D0;
    id v18 = &v19;
    os_signpost_id_t v12 = v11;
    uint64_t v17 = v12;
    [v6 enumerateAssetsWithKind:1 usingBlock:&v13];
    if (*((unsigned char *)v20 + 24)) {
      [(_PXStoryRecipeEnumerator *)v12 didFinishEnumeratingRecipeDisplayAssets];
    }

    _Block_object_dispose(&v19, 8);
  }
}

+ (id)PHAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__71423;
  id v40 = __Block_byref_object_dispose__71424;
  id v41 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v10 = [a1 schemeForPHAssets];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke;
  v31[3] = &unk_1E5DBC478;
  id v11 = v10;
  id v32 = v11;
  int64_t v35 = a4;
  id v12 = v9;
  id v33 = v12;
  uint64_t v34 = &v36;
  [v8 enumerateAssetsWithKind:1 usingBlock:v31];
  if (v37[5] || ![v12 count])
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = [a1 PHPhotoLibraryForRecipe:v8];
    id v15 = v14;
    if (v14)
    {
      id v16 = [v14 localIdentifierMappingsForCloudIdentifiers:v12];
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      uint64_t v27 = __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke_2;
      id v28 = &unk_1E5DB61A8;
      id v18 = v17;
      id v29 = v18;
      id v30 = &v36;
      [v16 enumerateKeysAndObjectsUsingBlock:&v25];
      if (v37[5])
      {
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v21 = objc_msgSend(v15, "librarySpecificFetchOptions", v25, v26, v27, v28);
        char v22 = (void *)MEMORY[0x1E4F38EB8];
        id v23 = (void *)[v18 copy];
        uint64_t v13 = [v22 fetchAssetsWithLocalIdentifiers:v23 options:v21];
      }
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28228];
      v43[0] = @"Recipe doesn't refer to a PhotoKit library";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      uint64_t v20 = [v19 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v16];
      uint64_t v13 = 0;
      id v18 = (id)v37[5];
      v37[5] = v20;
    }
  }
  if (a5) {
    *a5 = (id) v37[5];
  }

  _Block_object_dispose(&v36, 8);
  return v13;
}

+ (BOOL)addPHAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  int64_t v35 = __Block_byref_object_copy__71423;
  uint64_t v36 = __Block_byref_object_dispose__71424;
  id v37 = 0;
  uint64_t v11 = [v9 count];
  if (!v11)
  {
    BOOL v22 = 1;
    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v24 = [v9 firstObject];
  id v12 = [v24 photoLibrary];
  uint64_t v13 = (id *)(v33 + 5);
  id obj = (id)v33[5];
  int v14 = [a1 _recipe:v10 setPHPhotoLibrary:v12 error:&obj];
  objc_storeStrong(v13, obj);
  if (v14)
  {
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    if (v11 >= 1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v17 = [v9 objectAtIndexedSubscript:i];
        id v18 = [v17 localIdentifier];
        [v15 addObject:v18];
      }
    }
    uint64_t v19 = [a1 schemeForPHAssets];
    uint64_t v20 = [v12 cloudIdentifierMappingsForLocalIdentifiers:v15];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__PFStoryRecipe_PXStoryExtension_PhotoKit__addPHAssets_toRecipe_withCategory_error___block_invoke;
    v26[3] = &unk_1E5DB6180;
    int64_t v30 = a5;
    id v21 = v19;
    id v27 = v21;
    id v28 = v10;
    id v29 = &v32;
    [v20 enumerateKeysAndObjectsUsingBlock:v26];
    BOOL v22 = v33[5] == 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  if (a6) {
LABEL_11:
  }
    *a6 = (id) v33[5];
LABEL_12:
  _Block_object_dispose(&v32, 8);

  return v22;
}

+ (NSString)schemeForPHAssets
{
  return (NSString *)@"photokit";
}

+ (id)PHPhotoLibraryForRecipe:(id)a3
{
  id v3 = [a3 libraryWithKind:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = [v3 photoLibrary];
  }
  else if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F39228]);
    id v6 = [v3 url];
    char v4 = (void *)[v5 initWithPhotoLibraryURL:v6];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (id)recipe:(id)a3 withPHPhotoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 _recipe:v8 isReferencingPHPhotoLibrary:v9])
  {
    id v10 = v8;
    id v11 = 0;
    if (!a5) {
      goto LABEL_8;
    }
LABEL_7:
    *a5 = v11;
    goto LABEL_8;
  }
  id v12 = (void *)[v8 mutableCopyWithZone:0];
  id v15 = 0;
  int v13 = [a1 _recipe:v12 setPHPhotoLibrary:v9 error:&v15];
  id v11 = v15;
  id v10 = 0;
  if (v13) {
    id v10 = (id)[v12 copyWithZone:0];
  }

  if (a5) {
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

+ (BOOL)_recipe:(id)a3 setPHPhotoLibrary:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([a1 _recipe:v8 isReferencingPHPhotoLibrary:v9])
  {
    id v10 = 0;
    BOOL v11 = 1;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v12 = [v8 libraryWithKind:1];
  BOOL v11 = v12 == 0;
  if (v12)
  {
    int v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28228];
    id v14 = [NSString alloc];
    id v15 = [v12 url];
    id v16 = [v9 photoLibraryURL];
    uint64_t v17 = (void *)[v14 initWithFormat:@"Recipe referencing PhotoKit library %@ and cannot be changed to %@", v15, v16];
    v22[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v10 = [v13 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v18];
  }
  else
  {
    uint64_t v19 = [[_PXStoryRecipePhotoKitLibraryReference alloc] initWithPhotoLibrary:v9];
    [v8 addLibrary:v19];

    id v10 = 0;
  }

  if (a5) {
LABEL_8:
  }
    *a5 = v10;
LABEL_9:

  return v11;
}

+ (BOOL)_recipe:(id)a3 isReferencingPHPhotoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 libraryWithKind:1];
  id v7 = [v6 url];
  id v8 = [v5 photoLibraryURL];

  LOBYTE(v5) = [v7 isEqual:v8];
  return (char)v5;
}

+ (id)syntheticAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__121923;
  uint64_t v26 = __Block_byref_object_dispose__121924;
  id v27 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [a1 schemeForSyntheticAssets];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __88__PFStoryRecipe_PXStoryExtension_Synthetic__syntheticAssetsInRecipe_withCategory_error___block_invoke;
  uint64_t v17 = &unk_1E5DBC478;
  id v11 = v10;
  id v18 = v11;
  int64_t v21 = a4;
  id v12 = v9;
  id v19 = v12;
  uint64_t v20 = &v22;
  [v8 enumerateAssetsWithKind:1 usingBlock:&v14];
  if (!v23[5] && objc_msgSend(v12, "count", v14, v15, v16, v17, v18)) {
    PXDisplayAssetFetchResultFromArray();
  }
  if (a5) {
    *a5 = (id) v23[5];
  }

  _Block_object_dispose(&v22, 8);
  return 0;
}

+ (BOOL)addSyntheticAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v25 = a1;
  id v11 = [a1 schemeForSyntheticAssets];
  uint64_t v12 = [v9 count];
  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = [v9 objectAtIndexedSubscript:v14];
      if (!v15) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v19 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v22 = (objc_class *)objc_opt_class();
        int64_t v21 = NSStringFromClass(v22);
        uint64_t v24 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
        [v19 handleFailureInMethod:a2, v25, @"PFStoryRecipe+PXStory+Synthetic.m", 27, @"%@ should be an instance inheriting from %@, but it is %@", @"syntheticAssets[index]", v21, v24 object file lineNumber description];

        goto LABEL_9;
      }
LABEL_5:
      id v16 = (void *)MEMORY[0x1E4F8CDC0];
      uint64_t v17 = [v15 serializableDescription];
      id v18 = [v16 createAssetWithCategory:a5 scheme:v11 cloudIdentifier:v17];
      [v10 addAsset:v18];

      if (v13 == ++v14) {
        goto LABEL_10;
      }
    }
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = (objc_class *)objc_opt_class();
    int64_t v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, v25, @"PFStoryRecipe+PXStory+Synthetic.m", 27, @"%@ should be an instance inheriting from %@, but it is nil", @"syntheticAssets[index]", v21 object file lineNumber description];
LABEL_9:

    goto LABEL_5;
  }
LABEL_10:

  return 1;
}

+ (NSString)schemeForSyntheticAssets
{
  return (NSString *)@"synthetic";
}

@end