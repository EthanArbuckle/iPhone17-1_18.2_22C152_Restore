@interface PLResourceGenerator
+ (id)expectedLocalResourceRecipesForAsset:(id)a3 versions:(id)a4;
+ (id)expectedLocalResourceRecipesForAssetWithLibraryID:(id)a3 versions:(id)a4 assetHasAdjustments:(BOOL)a5 isDefaultAdjustedSlomo:(BOOL)a6 assetIsRAWOrRawPlugJPEGWithRawOnTop:(BOOL)a7 assetWidth:(int64_t)a8 assetHeight:(int64_t)a9 assetKind:(signed __int16)a10 assetkindSubtype:(signed __int16)a11 deferredProcessingNeeded:(unsigned __int16)a12 videoDeferredProcessingNeeded:(unsigned __int16)a13;
+ (id)fileAndTableBackedThumbnailManagerRecipesForLibraryID:(id)a3;
+ (id)generateAndStoreMissingExpectedLocalResourcesForAsset:(id)a3 versions:(id)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 reason:(id)a8 completion:(id)a9;
+ (id)locallyUnavailableRecipesFromRecipes:(id)a3 versions:(id)a4 asset:(id)a5;
+ (void)_continueGeneratingResourcesForAsset:(id)a3 versions:(id)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 remainingRecipes:(id)a8 storedRecipes:(id)a9 attemptedRecipes:(id)a10 errorsEncountered:(id)a11 progress:(id)a12 reason:(id)a13 completion:(id)a14;
@end

@implementation PLResourceGenerator

+ (id)generateAndStoreMissingExpectedLocalResourcesForAsset:(id)a3 versions:(id)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 reason:(id)a8 completion:(id)a9
{
  id v16 = a3;
  id v54 = a5;
  id v17 = a6;
  id v18 = a7;
  id v52 = a8;
  id v19 = a9;
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  id v21 = a4;
  v22 = [v20 setWithArray:v21];
  if ([v22 containsObject:&unk_1EEBF0A88])
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2 object:a1 file:@"PLResourceGenerator.m" lineNumber:291 description:@"Generating adjusted versions is not currently supported"];
  }
  id v53 = v18;
  id v51 = v17;
  if ([v22 count] != 1
    && ([v22 count] != 2 || (objc_msgSend(v22, "containsObject:", &unk_1EEBF0A58) & 1) == 0))
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:a1 file:@"PLResourceGenerator.m" lineNumber:292 description:@"Generating adjusted & unadjusted at the same time is not currently supported."];
  }
  v50 = v22;
  uint64_t v24 = [(id)objc_opt_class() expectedLocalResourceRecipesForAsset:v16 versions:v21];
  v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];

  v49 = (void *)v24;
  v26 = [a1 locallyUnavailableRecipesFromRecipes:v24 versions:v25 asset:v16];
  v27 = (void *)[v26 mutableCopy];

  v28 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v27, "count"));
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v27, "count"));
  v30 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v27, "count"));
  v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v27, "count"));
  v47 = v16;
  id v48 = v28;
  if ([v27 count])
  {
    id v46 = v19;
    v32 = v19;
    v33 = v51;
    v34 = v52;
    v45 = v28;
    uint64_t v44 = v29;
    id v35 = a1;
    id v36 = v16;
    v37 = (void *)v29;
    v38 = v50;
    v39 = v54;
    v40 = v53;
    objc_msgSend(v35, "_continueGeneratingResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:remainingRecipes:storedRecipes:attemptedRecipes:errorsEncountered:progress:reason:completion:", v36, v50, v54, v51, v53, v27, v44, v30, v31, v45, v52, v46, v47);
  }
  else
  {
    [v28 setTotalUnitCount:1];
    objc_msgSend(v28, "setCompletedUnitCount:", objc_msgSend(v28, "totalUnitCount"));
    v41 = [MEMORY[0x1E4F1CAD0] set];
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v41);

    v39 = v54;
    v40 = v53;
    v32 = v19;
    v33 = v51;
    v34 = v52;
    v37 = (void *)v29;
    v38 = v50;
  }

  return v48;
}

+ (id)locallyUnavailableRecipesFromRecipes:(id)a3 versions:(id)a4 asset:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [a5 resourcesSortedByQuality];
  v10 = (void *)MEMORY[0x1E4F28F60];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__PLResourceGenerator_locallyUnavailableRecipesFromRecipes_versions_asset___block_invoke;
  v27[3] = &unk_1E5874048;
  id v11 = v8;
  id v28 = v11;
  v12 = [v10 predicateWithBlock:v27];
  v13 = [v9 filteredArrayUsingPredicate:v12];

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = objc_msgSend(v13, "reverseObjectEnumerator", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", [*(id *)(*((void *)&v23 + 1) + 8 * i) recipeID]);
        if (v20) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v17);
  }

  id v21 = (void *)[v7 mutableCopy];
  [v21 minusOrderedSet:v14];

  return v21;
}

uint64_t __75__PLResourceGenerator_locallyUnavailableRecipesFromRecipes_versions_asset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)[v3 localAvailability] >= 1 && objc_msgSend(v3, "recipeID"))
  {
    v4 = +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", [v3 recipeID]);
    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "version"));
      uint64_t v7 = [v5 containsObject:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)expectedLocalResourceRecipesForAsset:(id)a3 versions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 assetID];
  id v8 = [v7 libraryID];

  unsigned int v19 = [v5 hasAdjustments];
  uint64_t v9 = [v5 isDefaultAdjustedSlomo];
  if ([v5 isRAWOnly]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v5 isRAWPlusJPEGWithRAWOnTop];
  }
  uint64_t v11 = [v5 width];
  uint64_t v12 = [v5 height];
  __int16 v13 = [v5 kind];
  __int16 v14 = [v5 kindSubtype];
  __int16 v15 = [v5 deferredProcessingNeeded];
  HIWORD(v18) = [v5 videoDeferredProcessingNeeded];
  WORD2(v18) = v15;
  WORD1(v18) = v14;
  LOWORD(v18) = v13;
  uint64_t v16 = objc_msgSend(a1, "expectedLocalResourceRecipesForAssetWithLibraryID:versions:assetHasAdjustments:isDefaultAdjustedSlomo:assetIsRAWOrRawPlugJPEGWithRawOnTop:assetWidth:assetHeight:assetKind:assetkindSubtype:deferredProcessingNeeded:videoDeferredProcessingNeeded:", v8, v6, v19, v9, v10, v11, v12, v18);

  return v16;
}

+ (id)expectedLocalResourceRecipesForAssetWithLibraryID:(id)a3 versions:(id)a4 assetHasAdjustments:(BOOL)a5 isDefaultAdjustedSlomo:(BOOL)a6 assetIsRAWOrRawPlugJPEGWithRawOnTop:(BOOL)a7 assetWidth:(int64_t)a8 assetHeight:(int64_t)a9 assetKind:(signed __int16)a10 assetkindSubtype:(signed __int16)a11 deferredProcessingNeeded:(unsigned __int16)a12 videoDeferredProcessingNeeded:(unsigned __int16)a13
{
  BOOL v13 = a7;
  LODWORD(v30) = a6;
  BOOL v14 = a5;
  HIDWORD(v30) = a11;
  id v17 = a3;
  id v18 = a4;
  unsigned int v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
  if ([v19 count] != 1
    && ([v19 count] != 2 || (objc_msgSend(v19, "containsObject:", &unk_1EEBF0A58) & 1) == 0))
  {
    v20 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v30);
    [v20 handleFailureInMethod:a2, a1, @"PLResourceGenerator.m", 178, @"Valid versions include: ([(empty)], [current], [current, original], [current, adjusted])" object file lineNumber description];
  }
  id v21 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", 10, v30);
  if ([v18 containsObject:&unk_1EEBF0A70])
  {
    if (v13 && !v14)
    {
      v22 = +[PLResourceRecipe recipeFromID:65737];
      [v21 addObject:v22];
    }
    if (a13)
    {
      long long v23 = +[PLResourceRecipe recipeFromID:131280];
      [v21 addObject:v23];
    }
    if (a12 == 10 || a12 == 1)
    {
      long long v24 = +[PLResourceRecipe recipeFromID:65944];
      [v21 addObject:v24];
    }
  }
  if ([v18 containsObject:&unk_1EEBF0A88] && v14)
  {
    if (a10 == 1)
    {
      if (v31) {
        goto LABEL_23;
      }
      uint64_t v26 = 0x20000;
      goto LABEL_22;
    }
    if (!a10)
    {
      long long v25 = +[PLResourceRecipe recipeFromID:65938];
      [v21 addObject:v25];

      if (v32 == 2)
      {
        uint64_t v26 = 131272;
LABEL_22:
        v27 = +[PLResourceRecipe recipeFromID:v26];
        [v21 addObject:v27];
      }
    }
  }
LABEL_23:
  if ([v18 containsObject:&unk_1EEBF0A58])
  {
    id v28 = [a1 fileAndTableBackedThumbnailManagerRecipesForLibraryID:v17];
    [v21 unionOrderedSet:v28];
  }
  return v21;
}

+ (id)fileAndTableBackedThumbnailManagerRecipesForLibraryID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = PLDataStoreForClassIDAndLibraryID(1, a3);
  v4 = [v3 thumbnailFormats];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v11 isTable] & 1) == 0)
        {
          uint64_t v12 = +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (2 * [v11 formatID]) | 0x40001);
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v18, "isTable", (void)v21))
        {
          unsigned int v19 = +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", (2 * [v18 formatID]) | 0x30001);
          if (v19) {
            [v5 addObject:v19];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  return v5;
}

+ (void)_continueGeneratingResourcesForAsset:(id)a3 versions:(id)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 remainingRecipes:(id)a8 storedRecipes:(id)a9 attemptedRecipes:(id)a10 errorsEncountered:(id)a11 progress:(id)a12 reason:(id)a13 completion:(id)a14
{
  v74[3] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v19 = a4;
  id v20 = a5;
  id v56 = a6;
  id v55 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  long long v27 = (void (**)(id, id, id))a14;
  uint64_t v28 = [v21 firstObject];
  id v54 = (void *)v28;
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    id v53 = v20;
    if ([v25 isCancelled])
    {
      uint64_t v30 = v25;
      uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:47002 userInfo:0];
      [v24 addObject:v31];
      v27[2](v27, v24, v22);

      int v32 = v57;
      id v20 = v53;
    }
    else
    {
      v50 = v26;
      [v21 removeObjectAtIndex:0];
      [v23 addObject:v29];
      v33 = (void *)[v19 mutableCopy];
      v34 = (void *)MEMORY[0x1E4F1CAD0];
      [v29 supportedVersionsForLocalResourceGeneration];
      id v35 = v51 = v21;
      id v36 = [v34 setWithArray:v35];
      [v33 intersectSet:v36];

      id v49 = v22;
      id v48 = v33;
      if ([v33 count] == 1)
      {
        v37 = [v33 anyObject];
        uint64_t v46 = [v37 integerValue];

        id v72 = 0;
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __231__PLResourceGenerator__continueGeneratingResourcesForAsset_versions_imageConversionClient_videoConversionClient_conversionServiceOptions_remainingRecipes_storedRecipes_attemptedRecipes_errorsEncountered_progress_reason_completion___block_invoke;
        v58[3] = &unk_1E5874020;
        id v59 = v22;
        id v60 = v23;
        id v61 = v51;
        id v45 = v25;
        id v62 = v45;
        id v63 = v24;
        id v71 = a1;
        id v64 = v57;
        id v65 = v19;
        id v66 = v53;
        id v67 = v56;
        id v68 = v55;
        id v69 = v50;
        v70 = v27;
        [v29 generateAndStoreForAsset:v64 version:v46 imageConversionClient:v66 videoConversionClient:v67 conversionServiceOptions:v68 deferredPhotoFinalizer:0 progress:&v72 reason:v69 completion:v58];
        id v38 = v72;
        if (v38) {
          [v45 addChild:v38 withPendingUnitCount:1];
        }
        uint64_t v30 = v25;

        id v21 = v51;
        id v26 = v50;
      }
      else
      {
        objc_msgSend(v25, "setCompletedUnitCount:", objc_msgSend(v25, "completedUnitCount") + 1);
        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v47 = *MEMORY[0x1E4F8C500];
        v73[0] = *MEMORY[0x1E4F28568];
        v40 = NSStringFromPLErrorCode();
        v74[0] = v40;
        v74[1] = v29;
        v73[1] = @"recipe";
        v73[2] = @"versions";
        v41 = [v19 allObjects];
        v74[2] = v41;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
        v43 = id v42 = v19;
        id v38 = [v39 errorWithDomain:v47 code:47004 userInfo:v43];

        id v22 = v49;
        [v24 addObject:v38];
        id v26 = v50;
        uint64_t v30 = v25;
        id v19 = v42;
        id v44 = v42;
        id v21 = v51;
        [a1 _continueGeneratingResourcesForAsset:v57 versions:v44 imageConversionClient:v53 videoConversionClient:v56 conversionServiceOptions:v55 remainingRecipes:v51 storedRecipes:v49 attemptedRecipes:v23 errorsEncountered:v24 progress:v25 reason:v50 completion:v27];
      }

      id v20 = v53;
      int v32 = v57;
    }
  }
  else
  {
    uint64_t v30 = v25;
    v27[2](v27, v24, v22);
    int v32 = v57;
  }
}

void __231__PLResourceGenerator__continueGeneratingResourcesForAsset_versions_imageConversionClient_videoConversionClient_conversionServiceOptions_remainingRecipes_storedRecipes_attemptedRecipes_errorsEncountered_progress_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v14 = a3;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a5;
  id v10 = a4;
  [v8 unionSet:v10];
  [*(id *)(a1 + 40) unionSet:v10];
  uint64_t v11 = [*(id *)(a1 + 48) count];
  [*(id *)(a1 + 48) minusSet:v10];

  uint64_t v12 = v11 - [*(id *)(a1 + 48) count];
  id v13 = (void *)[v9 mutableCopy];

  [v13 minusSet:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) unionOrderedSet:v13];
  objc_msgSend(*(id *)(a1 + 56), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 56), "totalUnitCount") + objc_msgSend(v13, "count"));
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", v12 + objc_msgSend(*(id *)(a1 + 56), "completedUnitCount"));
  if (v14) {
    [*(id *)(a1 + 64) addObject:v14];
  }
  [*(id *)(a1 + 128) _continueGeneratingResourcesForAsset:*(void *)(a1 + 72) versions:*(void *)(a1 + 80) imageConversionClient:*(void *)(a1 + 88) videoConversionClient:*(void *)(a1 + 96) conversionServiceOptions:*(void *)(a1 + 104) remainingRecipes:*(void *)(a1 + 48) storedRecipes:*(void *)(a1 + 32) attemptedRecipes:*(void *)(a1 + 40) errorsEncountered:*(void *)(a1 + 64) progress:*(void *)(a1 + 56) reason:*(void *)(a1 + 112) completion:*(void *)(a1 + 120)];
}

@end