@interface PLResourceInstaller
+ (BOOL)_installInternalResourcesForExistingAsset:(id)a3 assumeNoExistingResources:(BOOL)a4 referencedResourceURLs:(id)a5 includeLegacyCloudResources:(BOOL)a6 outResourcesStoreCount:(unint64_t *)a7 error:(id *)a8;
+ (BOOL)_isPenultimateVersionFromCPLType:(unint64_t)a3;
+ (BOOL)createInternalResourcesForExistingAssetsWithNoExistingResourcesInStore:(id)a3 migrator:(id)a4;
+ (BOOL)installInternalResourcesForExistingAsset:(id)a3 assumeNoExistingResources:(BOOL)a4 referencedResourceURLs:(id)a5 error:(id *)a6;
+ (BOOL)installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:(id)a3 migrator:(id)a4;
+ (BOOL)installSupplementalResourceForExistingFileAtURL:(id)a3 ptpTrashedState:(int64_t)a4 index:(id)a5 forAsset:(id)a6 imageOrientation:(id)a7 resultingResource:(id *)a8 error:(id *)a9;
+ (BOOL)isValidCPLResourceTypeForPersistence:(unint64_t)a3;
+ (BOOL)reconsiderSavedAssetTypeInStore:(id)a3 migrator:(id)a4;
+ (BOOL)recoverSupplementalResourcesForAsset:(id)a3 usingSidecarFinder:(id)a4 outResourcesStoreCount:(unint64_t *)a5 error:(id *)a6;
+ (BOOL)removeLegacyCloudResourcesInStore:(id)a3 migrator:(id)a4;
+ (BOOL)resetImageRequestHintsInContext:(id)a3;
+ (BOOL)resetImageRequestHintsInContext:(id)a3 allowOneTimeThumbRebuild:(BOOL)a4;
+ (BOOL)resetInternalResourcesInStore:(id)a3 resetUTIs:(BOOL)a4 resetCodecs:(BOOL)a5 resetMasters:(BOOL)a6 migrator:(id)a7;
+ (id)_predicateForUnrecoverableResources;
+ (id)_speculativePathForPenultimateFullsizeRenderImageFileForAsset:(id)a3;
+ (id)_storeValidatedLocalExternalResource:(id)a3 forAsset:(id)a4;
+ (id)_validatedExternalResourceAtPath:(id)a3 recipe:(id)a4 type:(unsigned int)a5 version:(unsigned int)a6 identifier:(id)a7;
+ (id)_validatedExternalResourceForComputeResourceAtPath:(id)a3 recipe:(id)a4;
+ (id)_validatedExternalResourceForComputeResourceWithRecipe:(id)a3;
+ (id)_validatedExternalResourceFromSupplementalFileURL:(id)a3 withUTI:(id)a4 ptpTrashedState:(int64_t)a5 index:(id)a6 asset:(id)a7;
+ (id)_validatedExternalResourceIfPresentForAudioOrUnknownAsset:(id)a3;
+ (id)_validatedExternalResourcesFromLocalImageOrVideoAsset:(id)a3 referencedResourceURLs:(id)a4;
+ (id)_validatedExternalResourcesFromSharedStreamAsset:(id)a3;
+ (id)externalResourcesForExistingAsset:(id)a3 referencedResourceURLs:(id)a4;
+ (id)generateAdjustedFullSizeRenderResourceForFilePath:(id)a3 requireFileToBePresent:(BOOL)a4 basedOnFullSizeWidth:(int64_t)a5 andHeight:(int64_t)a6;
+ (id)generateExternalResourceFromCPLResource:(id)a3 asset:(id)a4 fromAdjustedSet:(BOOL)a5;
+ (id)generateExternalResourceFromCPLResource:(id)a3 cloudMaster:(id)a4 masterResources:(id)a5;
+ (id)generateValidatedExternalImageResourceOfType:(unsigned int)a3 forFilePath:(id)a4 requireFileToBePresent:(BOOL)a5 version:(unsigned int)a6 basedOnFullSizeWidth:(int64_t)a7 andHeight:(int64_t)a8 recipe:(id)a9 assetKind:(signed __int16)a10 error:(id *)a11;
+ (id)generateValidatedExternalOtherResourceOfType:(unsigned int)a3 forFilePath:(id)a4 uti:(id)a5 requireFileToBePresent:(BOOL)a6 version:(unsigned int)a7;
+ (id)generateVideoResourcesFromVideoAsset:(id)a3 referencedVideoPath:(id)a4;
+ (id)generatedValidatedExternalSyndicationResourceOfType:(unsigned int)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 fileURL:(id)a6 requireFileToBePresent:(BOOL)a7 uniformTypeIdentifier:(id)a8;
+ (id)onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:(id)a3;
+ (id)onDemand_installAdjustedFullSizeRenderResourceAtFilePath:(id)a3 forAsset:(id)a4;
+ (id)onDemand_installAdjustedFullSizeVideoComplementResourceIfPresentForAsset:(id)a3;
+ (id)onDemand_installEmptyComputeResourceWithRecipe:(id)a3 forAsset:(id)a4 error:(id *)a5;
+ (id)onDemand_installExistingAdjustedResourceAtFilePath:(id)a3 withType:(unsigned int)a4 recipe:(id)a5 forAsset:(id)a6 error:(id *)a7;
+ (id)onDemand_installExistingAdjustmentSuggestionResourceAtFilePath:(id)a3 recipe:(id)a4 forAsset:(id)a5;
+ (id)onDemand_installExistingComputeResourceAtFilePath:(id)a3 recipe:(id)a4 forAsset:(id)a5;
+ (id)onDemand_installLocalVideoKeyFrameForAsset:(id)a3;
+ (id)onDemand_installOriginalAdjustmentResourceIfPresentForAsset:(id)a3;
+ (id)onDemand_installOriginalResourceForSyndicationAsset:(id)a3;
+ (id)onDemand_installOriginalSOCImagePresentForAsset:(id)a3 referencedResourceURLs:(id)a4;
+ (id)onDemand_installOriginalSOCVideoComplementPresentForAsset:(id)a3 referencedResourceURLs:(id)a4;
+ (id)onDemand_installOriginalSOCVideoPresentForAsset:(id)a3 referencedResourceURLs:(id)a4;
+ (id)onDemand_installOriginalVideoComplementForSyndicationAsset:(id)a3 contentType:(id)a4;
+ (id)onDemand_installOriginalVideoComplementResourceIfPresentForAsset:(id)a3;
+ (id)onDemand_installPrimaryImageResourceWithRecipe:(id)a3 version:(unsigned int)a4 forAsset:(id)a5;
+ (id)onDemand_installPrimaryImageResourceWithRecipe:(id)a3 version:(unsigned int)a4 forAsset:(id)a5 requireFileToBePresent:(BOOL)a6;
+ (id)onDemand_installResourceWithResourceIdentity:(id)a3 forAsset:(id)a4;
+ (id)validatedExternalResourceForLocalVideoIfPresentAtPath:(id)a3 context:(id)a4;
+ (id)validatedExternalResourceFromExternalResourceCloudAttributes:(id)a3 cplType:(unint64_t)a4 assetType:(signed __int16)a5 uti:(id)a6 resourceWidth:(unint64_t)a7 resourceHeight:(unint64_t)a8 resourceFingerprint:(id)a9 resourceStableHash:(id)a10 resourceSize:(unint64_t)a11 isAvailable:(BOOL)a12 fromAdjustedSet:(BOOL)a13 resourceURL:(id)a14 cloudMaster:(id)a15 isForMigration:(BOOL)a16 context:(id)a17;
+ (unint64_t)_getURLDataLength:(id)a3;
+ (unint64_t)derivativeCPLTypeFromRecipeID:(unsigned int)a3 version:(unsigned int)a4;
+ (unint64_t)nonDerivativeCPLTypeFromResourceType:(unsigned int)a3 version:(unsigned int)a4 uniformTypeIdentifier:(id)a5;
+ (unsigned)recipeIDFromCPLResourceType:(unint64_t)a3 assetType:(signed __int16)a4 fromAdjustedSet:(BOOL)a5;
+ (unsigned)resourceTypeFromCPLType:(unint64_t)a3 assetType:(signed __int16)a4;
+ (unsigned)resourceVersionFromCPLType:(unint64_t)a3 fromAdjustedSet:(BOOL)a4;
+ (void)_applyCodecToNonDerivativeExternalResource:(id)a3 fromCloudMaster:(id)a4;
+ (void)_applyColorSpaceAndCodecUsingFileToExternalResource:(id)a3 managedObjectContext:(id)a4;
+ (void)_applyImageIOMetadataToExternalResource:(id)a3 fromFileURL:(id)a4 fileExists:(BOOL)a5 assumedWidth:(int64_t)a6 assumedHeight:(int64_t)a7 recipe:(id)a8 assetKind:(signed __int16)a9;
+ (void)_recipeAndDerivativeStateFromCPLResourceType:(unint64_t)a3 fromAdjustedSet:(BOOL)a4 assetType:(signed __int16)a5 recipeID:(unsigned int *)a6;
@end

@implementation PLResourceInstaller

+ (id)generateExternalResourceFromCPLResource:(id)a3 asset:(id)a4 fromAdjustedSet:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PLResourceInstaller+CPL.m", 616, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, a1, @"PLResourceInstaller+CPL.m", 617, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

LABEL_3:
  v12 = objc_alloc_init(PLValidatedExternalCloudResource);
  v13 = [v11 master];
  v14 = [v13 creationDate];
  v44 = v12;
  [(PLValidatedExternalCloudResource *)v12 setMasterDateCreated:v14];

  v15 = [v9 identity];
  [v15 imageDimensions];
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [v15 fileUTI];
  if (!v20)
  {
    v21 = (void *)MEMORY[0x1E4F8CDF8];
    v22 = [v15 fileURL];
    v23 = [v22 pathExtension];
    v24 = [v21 resourceModelTypeForFilenameExtension:v23];
    uint64_t v20 = [v24 identifier];
  }
  uint64_t v25 = objc_msgSend(v11, "pathForCPLResourceType:adjusted:", objc_msgSend(v9, "resourceType"), v5);
  id v46 = a1;
  BOOL v45 = v5;
  v43 = (void *)v20;
  v41 = (void *)v25;
  if (v25)
  {
    v42 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v25 isDirectory:0];
  }
  else
  {
    v42 = 0;
  }
  uint64_t v39 = [v9 resourceType];
  uint64_t v26 = [v11 kind];
  v27 = [v15 fingerPrint];
  v28 = [v15 stableHash];
  uint64_t v29 = [v15 fileSize];
  char v30 = [v15 isAvailable];
  v31 = [v11 master];
  [v11 managedObjectContext];
  v32 = v40 = v9;
  LOBYTE(v38) = 0;
  BYTE1(v37) = v45;
  LOBYTE(v37) = v30;
  v33 = objc_msgSend(v46, "validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:", v44, v39, v26, v43, (unint64_t)v17, (unint64_t)v19, v27, v28, v29, v37, v42, v31, v38, v32);

  return v33;
}

+ (id)generateExternalResourceFromCPLResource:(id)a3 cloudMaster:(id)a4 masterResources:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, a1, @"PLResourceInstaller+CPL.m", 565, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_34:
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, a1, @"PLResourceInstaller+CPL.m", 566, @"Invalid parameter not satisfying: %@", @"cloudMaster" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_34;
  }
LABEL_3:
  id v56 = a1;
  v12 = objc_alloc_init(PLValidatedExternalCloudResource);
  v13 = [v10 creationDate];
  [(PLValidatedExternalCloudResource *)v12 setMasterDateCreated:v13];

  v55 = v12;
  [(PLValidatedExternalCloudResource *)v12 setCloudLocalState:3];
  id v14 = [v10 uniformTypeIdentifier];
  if (v14) {
    goto LABEL_5;
  }
  v15 = (void *)MEMORY[0x1E4F8CDF8];
  double v16 = [v10 originalFilename];
  double v17 = [v16 pathExtension];
  double v18 = [v15 resourceModelTypeForFilenameExtension:v17];
  id v14 = [v18 identifier];

  if (v14)
  {
LABEL_5:
    double v19 = +[PLUniformTypeIdentifier utiWithIdentifier:v14];
    if ([v19 conformsToImage])
    {
      __int16 v52 = 0;
    }
    else
    {
      if ([v19 conformsToMovie])
      {
        __int16 v20 = 1;
      }
      else if ([v19 conformsToAudio])
      {
        __int16 v20 = 2;
      }
      else
      {
        __int16 v20 = 3;
      }
      __int16 v52 = v20;
    }

    goto LABEL_14;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v14 = v11;
  uint64_t v35 = [v14 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (!v35) {
    goto LABEL_32;
  }
  uint64_t v36 = v35;
  id v37 = v10;
  uint64_t v38 = *(void *)v58;
LABEL_20:
  uint64_t v39 = 0;
  while (1)
  {
    if (*(void *)v58 != v38) {
      objc_enumerationMutation(v14);
    }
    v40 = *(void **)(*((void *)&v57 + 1) + 8 * v39);
    if ([v40 resourceType] == 1) {
      break;
    }
    if (v36 == ++v39)
    {
      uint64_t v36 = [v14 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v36) {
        goto LABEL_20;
      }
      __int16 v52 = 0;
      id v10 = v37;
      goto LABEL_14;
    }
  }
  v41 = [v40 identity];
  uint64_t v42 = [v41 fileUTI];

  if (v42)
  {

    id v14 = (id)v42;
    id v10 = v37;
    goto LABEL_5;
  }
  v43 = [v40 identity];
  v44 = [v43 fileURL];
  BOOL v45 = [v44 pathExtension];

  id v10 = v37;
  if (!v45)
  {
LABEL_32:
    __int16 v52 = 0;
LABEL_14:

    goto LABEL_15;
  }
  id v46 = [MEMORY[0x1E4F8CDF8] resourceModelTypeForFilenameExtension:v45];
  uint64_t v47 = [v46 identifier];

  id v14 = (id)v47;
  if (v47) {
    goto LABEL_5;
  }
  __int16 v52 = 0;
LABEL_15:
  v21 = [v9 identity];
  [v21 imageDimensions];
  double v23 = v22;
  double v25 = v24;
  uint64_t v53 = [v9 resourceType];
  uint64_t v26 = [v21 fileUTI];
  v54 = v9;
  v27 = [v21 fingerPrint];
  v28 = [v21 stableHash];
  uint64_t v29 = [v21 fileSize];
  unsigned __int8 v30 = [v21 isAvailable];
  [v10 managedObjectContext];
  v32 = v31 = v10;
  LOBYTE(v51) = 0;
  LOWORD(v50) = v30;
  v33 = objc_msgSend(v56, "validatedExternalResourceFromExternalResourceCloudAttributes:cplType:assetType:uti:resourceWidth:resourceHeight:resourceFingerprint:resourceStableHash:resourceSize:isAvailable:fromAdjustedSet:resourceURL:cloudMaster:isForMigration:context:", v55, v53, v52, v26, (unint64_t)v23, (unint64_t)v25, v27, v28, v29, v50, 0, v31, v51, v32);

  return v33;
}

+ (unsigned)resourceVersionFromCPLType:(unint64_t)a3 fromAdjustedSet:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = [a1 _isPenultimateVersionFromCPLType:a3];
  if (v4) {
    unsigned int v6 = 2;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v5) {
    return 1;
  }
  else {
    return v6;
  }
}

+ (BOOL)isValidCPLResourceTypeForPersistence:(unint64_t)a3
{
  return a3 != 1000;
}

+ (id)validatedExternalResourceFromExternalResourceCloudAttributes:(id)a3 cplType:(unint64_t)a4 assetType:(signed __int16)a5 uti:(id)a6 resourceWidth:(unint64_t)a7 resourceHeight:(unint64_t)a8 resourceFingerprint:(id)a9 resourceStableHash:(id)a10 resourceSize:(unint64_t)a11 isAvailable:(BOOL)a12 fromAdjustedSet:(BOOL)a13 resourceURL:(id)a14 cloudMaster:(id)a15 isForMigration:(BOOL)a16 context:(id)a17
{
  unsigned int v44 = a5;
  id v20 = a3;
  id v21 = a6;
  id v22 = a9;
  id v23 = a10;
  id v24 = a14;
  id v25 = a15;
  id v26 = a17;
  if (!v20)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, a1, @"PLResourceInstaller+CPL.m", 487, @"Invalid parameter not satisfying: %@", @"externalResourceCloudAttributes" object file lineNumber description];
  }
  id v27 = v20;
  objc_msgSend(v27, "setVersion:", objc_msgSend((id)objc_opt_class(), "resourceVersionFromCPLType:fromAdjustedSet:", a4, a13));
  objc_msgSend(v27, "setResourceType:", objc_msgSend((id)objc_opt_class(), "resourceTypeFromCPLType:assetType:", a4, v44));
  [v27 setCplType:a4];
  if (v21)
  {
    +[PLUniformTypeIdentifier utiWithIdentifier:v21];
    id v28 = v21;
    id v29 = v24;
    id v30 = v23;
    id v31 = v22;
    id v32 = v26;
    v34 = id v33 = v25;
    [v27 setUniformTypeIdentifier:v34];

    id v25 = v33;
    id v26 = v32;
    id v22 = v31;
    id v23 = v30;
    id v24 = v29;
    id v21 = v28;
  }
  unsigned int v45 = 0;
  [a1 _recipeAndDerivativeStateFromCPLResourceType:a4 fromAdjustedSet:a13 assetType:v44 recipeID:&v45];
  [v27 setRecipeID:v45];
  [v27 setUnorientedWidth:a7];
  [v27 setUnorientedHeight:a8];
  [v27 setFileURL:v24];
  [v27 setFingerprint:v22];
  [v27 setStableHash:v23];
  [v27 setDataLength:a11];
  [v27 setRemoteAvailability:a12];
  if ([v27 hasRecipe])
  {
    if (a16)
    {
      if ([v27 hasRecipe])
      {
        uint64_t v35 = +[PLResourceRecipe recipeFromID:v45];
        [v35 codecFourCharCodeName];
        id v36 = v26;
        v38 = id v37 = v25;
        [v27 setCodecFourCharCode:v38];

        id v25 = v37;
        id v26 = v36;
      }
    }
    else
    {
      [a1 _applyColorSpaceAndCodecUsingFileToExternalResource:v27 managedObjectContext:v26];
    }
  }
  else
  {
    [a1 _applyCodecToNonDerivativeExternalResource:v27 fromCloudMaster:v25];
  }

  return v27;
}

+ (void)_applyCodecToNonDerivativeExternalResource:(id)a3 fromCloudMaster:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__2673;
  id v25 = __Block_byref_object_dispose__2674;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  double v17 = __87__PLResourceInstaller_CPL___applyCodecToNonDerivativeExternalResource_fromCloudMaster___block_invoke;
  double v18 = &unk_1E5875E68;
  id v20 = &v21;
  id v7 = v6;
  id v19 = v7;
  v8 = (void (**)(void))MEMORY[0x19F38D650](&v15);
  if (objc_msgSend(v5, "resourceType", v15, v16, v17, v18) == 1)
  {
    v8[2](v8);
    id v9 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v22[5]];
    id v10 = [v9 plVideoCodecFourCharCodeString];
    if (v10) {
      [v5 setCodecFourCharCode:v10];
    }
  }
  else
  {
    if ([v5 resourceType] != 3) {
      goto LABEL_10;
    }
    id v11 = (void *)MEMORY[0x1E4F8CDF8];
    v12 = [v7 uniformTypeIdentifier];
    v13 = [v11 typeWithIdentifier:v12];
    int v14 = [v13 conformsToType:*MEMORY[0x1E4F443E0]];

    if (v14) {
      +[PLCodec HEVCfourCharCode];
    }
    else {
    id v9 = +[PLCodec H264fourCharCode];
    }
    [v5 setCodecFourCharCode:v9];
  }

LABEL_10:
  _Block_object_dispose(&v21, 8);
}

void __87__PLResourceInstaller_CPL___applyCodecToNonDerivativeExternalResource_fromCloudMaster___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) mediaMetadata];
    v3 = [v2 valueForKey:@"data"];

    if (v3)
    {
      uint64_t v7 = 0;
      uint64_t v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v7];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }
}

+ (void)_applyColorSpaceAndCodecUsingFileToExternalResource:(id)a3 managedObjectContext:(id)a4
{
  id v10 = a3;
  uint64_t v4 = [v10 fileURL];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

    if (v7)
    {
      if ([v10 resourceType] == 1 || objc_msgSend(v10, "resourceType") == 3)
      {
        v8 = [MEMORY[0x1E4F16330] assetWithURL:v4];
        id v9 = [v8 plVideoCodecFourCharCodeString];
        if (v9) {
          [v10 setCodecFourCharCode:v9];
        }
      }
    }
  }
}

+ (unsigned)resourceTypeFromCPLType:(unint64_t)a3 assetType:(signed __int16)a4
{
  unsigned int result = 31;
  switch(a3)
  {
    case 1uLL:
      if (a4 >= 3) {
        unsigned __int16 v8 = 31;
      }
      else {
        unsigned __int16 v8 = a4;
      }
      unsigned int result = v8;
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 0xFuLL:
      unsigned int result = 0;
      break;
    case 6uLL:
    case 7uLL:
    case 0x10uLL:
    case 0x15uLL:
    case 0x19uLL:
    case 0x1CuLL:
      if (a4) {
        unsigned int result = 1;
      }
      else {
        unsigned int result = 3;
      }
      break;
    case 8uLL:
      unsigned int result = 2;
      break;
    case 9uLL:
    case 0x16uLL:
      unsigned int result = 5;
      break;
    case 0xAuLL:
    case 0x1BuLL:
      unsigned int result = 9;
      break;
    case 0xBuLL:
    case 0xCuLL:
      return result;
    case 0xDuLL:
      unsigned int result = 6;
      break;
    case 0xEuLL:
      unsigned int result = 7;
      break;
    case 0x11uLL:
      unsigned int result = 4;
      break;
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
      unsigned int result = 3;
      break;
    case 0x17uLL:
      unsigned int result = 10;
      break;
    case 0x18uLL:
      unsigned int result = 11;
      break;
    case 0x1AuLL:
      unsigned int result = 13;
      break;
    default:
      if (a3 == 1000)
      {
        int v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1000, a4);
        [v7 handleFailureInMethod:a2 object:a1 file:@"PLResourceInstaller+CPL.m" lineNumber:417 description:@"Unexpected CPL type: CPLResourceTypeAdjustmentOriginalResource"];

        unsigned int result = 31;
      }
      break;
  }
  return result;
}

+ (void)_recipeAndDerivativeStateFromCPLResourceType:(unint64_t)a3 fromAdjustedSet:(BOOL)a4 assetType:(signed __int16)a5 recipeID:(unsigned int *)a6
{
  uint64_t v7 = a5;
  BOOL v8 = a4;
  if (!a6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLResourceInstaller+CPL.m", 335, @"Invalid parameter not satisfying: %@", @"outRecipeID" object file lineNumber description];
  }
  *a6 = [(id)objc_opt_class() recipeIDFromCPLResourceType:a3 assetType:v7 fromAdjustedSet:v8];
}

+ (BOOL)_isPenultimateVersionFromCPLType:(unint64_t)a3
{
  return a3 == 15 || a3 == 25 || a3 == 20;
}

+ (unsigned)recipeIDFromCPLResourceType:(unint64_t)a3 assetType:(signed __int16)a4 fromAdjustedSet:(BOOL)a5
{
  unsigned int result = 0;
  switch(a3)
  {
    case 2uLL:
      unsigned int v9 = 65737;
      unsigned int v10 = 65938;
      BOOL v11 = !a5;
      goto LABEL_15;
    case 3uLL:
      return 65739;
    case 4uLL:
      return 65741;
    case 5uLL:
      return 65743;
    case 6uLL:
      unsigned int v12 = 131079;
      unsigned int v13 = 131275;
      goto LABEL_11;
    case 7uLL:
      unsigned int v12 = 131081;
      unsigned int v13 = 131277;
LABEL_11:
      if (a4) {
        unsigned int result = v12;
      }
      else {
        unsigned int result = v13;
      }
      break;
    case 8uLL:
    case 9uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
      return result;
    case 0xAuLL:
    case 0x1BuLL:
      unsigned int result = 327683;
      break;
    case 0x10uLL:
      BOOL v11 = !a5;
      unsigned int v9 = 131075;
      unsigned int v10 = 0x20000;
LABEL_15:
      if (v11) {
        unsigned int result = v9;
      }
      else {
        unsigned int result = v10;
      }
      break;
    case 0x13uLL:
      unsigned int result = 131272;
      break;
    case 0x15uLL:
      unsigned int result = 131077;
      break;
    case 0x1CuLL:
      unsigned int result = 131475;
      break;
    default:
      if (a3 == 1000)
      {
        BOOL v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 1000, a4, a5);
        [v8 handleFailureInMethod:a2 object:a1 file:@"PLResourceInstaller+CPL.m" lineNumber:289 description:@"Unexpected CPL type: CPLResourceTypeAdjustmentOriginalResource"];

        unsigned int result = 0;
      }
      break;
  }
  return result;
}

+ (unint64_t)nonDerivativeCPLTypeFromResourceType:(unsigned int)a3 version:(unsigned int)a4 uniformTypeIdentifier:(id)a5
{
  id v7 = a5;
  BOOL v8 = v7;
  if (a4 == 2)
  {
    if (a3 >= 8) {
      goto LABEL_11;
    }
    unsigned int v10 = &unk_19BA9A190;
LABEL_10:
    unint64_t v9 = v10[a3];
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    if (a3 >= 4) {
      goto LABEL_11;
    }
    unsigned int v10 = &unk_19BA9A1D0;
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_11:
    unint64_t v9 = 0;
    goto LABEL_12;
  }
  unint64_t v9 = 0;
  switch(a3)
  {
    case 0u:
    case 1u:
      unint64_t v9 = 1;
      break;
    case 2u:
      unint64_t v9 = 8;
      break;
    case 3u:
      unint64_t v9 = 18;
      break;
    case 4u:
      unint64_t v9 = 17;
      break;
    case 5u:
      unsigned int v12 = [v7 identifier];
      unsigned int v13 = [MEMORY[0x1E4F8CDF8] supplementalResourceXMPType];
      int v14 = [v13 identifier];
      char v15 = [v12 isEqualToString:v14];

      if (v15)
      {
        unint64_t v9 = 9;
      }
      else
      {
        uint64_t v16 = [v8 identifier];
        double v17 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
        double v18 = [v17 identifier];
        int v19 = [v16 isEqualToString:v18];

        if (v19) {
          unint64_t v9 = 22;
        }
        else {
          unint64_t v9 = 0;
        }
      }
      break;
    case 0xAu:
      unint64_t v9 = 23;
      break;
    case 0xBu:
      unint64_t v9 = 24;
      break;
    default:
      break;
  }
LABEL_12:

  return v9;
}

+ (unint64_t)derivativeCPLTypeFromRecipeID:(unsigned int)a3 version:(unsigned int)a4
{
  BOOL v8 = +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:");
  char v9 = [v8 isDerivative];

  if ((v9 & 1) == 0)
  {
    unsigned int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"PLResourceInstaller+CPL.m" lineNumber:50 description:@"only derivative recipes support mapping to CPL type."];
  }
  if ((int)a3 <= 131274)
  {
    if (a3 <= 0x200CA)
    {
      unint64_t result = 2;
      switch(a3)
      {
        case 0x100C9u:
          return result;
        case 0x100CAu:
        case 0x100CCu:
        case 0x100CEu:
          return 0;
        case 0x100CBu:
          return 3;
        case 0x100CDu:
          return 4;
        case 0x100CFu:
          return 5;
        default:
          JUMPOUT(0);
      }
    }
    switch(a3)
    {
      case 0x20003u:
        unint64_t result = 16;
        break;
      case 0x20005u:
        unint64_t result = 21;
        break;
      case 0x20007u:
        return 6;
      case 0x20009u:
        return 7;
      default:
        return 0;
    }
    return result;
  }
  if ((int)a3 <= 131474)
  {
    if (a3 == 131275) {
      return 6;
    }
    if (a3 == 131277) {
      return 7;
    }
    return 0;
  }
  if (a3 == 131475) {
    return 28;
  }
  if (a3 != 327683) {
    return 0;
  }
  unint64_t v11 = 27;
  if (a4 != 2) {
    unint64_t v11 = 0;
  }
  if (a4) {
    return v11;
  }
  else {
    return 10;
  }
}

+ (id)generatedValidatedExternalSyndicationResourceOfType:(unsigned int)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 fileURL:(id)a6 requireFileToBePresent:(BOOL)a7 uniformTypeIdentifier:(id)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  id v15 = a8;
  uint64_t v16 = objc_alloc_init(PLSyndicationValidatedExternalResource);
  [(PLValidatedExternalResource *)v16 setResourceType:v12];
  [(PLValidatedExternalResource *)v16 setVersion:v11];
  [(PLValidatedExternalResource *)v16 setRecipeID:v10];
  [(PLValidatedExternalResource *)v16 setUniformTypeIdentifier:v15];

  if (v14
    && ([(PLValidatedExternalResource *)v16 setFileURL:v14],
        (uint64_t v17 = [a1 _getURLDataLength:v14]) != 0))
  {
    [(PLValidatedExternalResource *)v16 setDataLength:v17];
  }
  else if (v9)
  {

    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)generateValidatedExternalOtherResourceOfType:(unsigned int)a3 forFilePath:(id)a4 uti:(id)a5 requireFileToBePresent:(BOOL)a6 version:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
    uint64_t v15 = [a1 _getURLDataLength:v14];
    BOOL v16 = v15 != 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v14 = 0;
    BOOL v16 = 0;
    uint64_t v15 = 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (!v16)
  {
    uint64_t v17 = 0;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v17 = objc_alloc_init(PLValidatedExternalResource);
  [(PLValidatedExternalResource *)v17 setResourceType:v10];
  [(PLValidatedExternalResource *)v17 setVersion:v7];
  [(PLValidatedExternalResource *)v17 setUniformTypeIdentifier:v13];
  [(PLValidatedExternalResource *)v17 setDataLength:v15];
  [(PLValidatedExternalResource *)v17 setFileURL:v14];
LABEL_8:

  return v17;
}

+ (id)generateValidatedExternalImageResourceOfType:(unsigned int)a3 forFilePath:(id)a4 requireFileToBePresent:(BOOL)a5 version:(unsigned int)a6 basedOnFullSizeWidth:(int64_t)a7 andHeight:(int64_t)a8 recipe:(id)a9 assetKind:(signed __int16)a10 error:(id *)a11
{
  uint64_t v11 = *(void *)&a6;
  BOOL v12 = a5;
  uint64_t v13 = *(void *)&a3;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a9;
  if (v15)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
    uint64_t v18 = [a1 _getURLDataLength:v17];
    BOOL v19 = v18 != 0;
    if (!v12) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v19 = 0;
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    if (!v12)
    {
LABEL_9:
      id v25 = objc_alloc_init(PLValidatedExternalResource);
      [(PLValidatedExternalResource *)v25 setResourceType:v13];
      [(PLValidatedExternalResource *)v25 setVersion:v11];
      -[PLValidatedExternalResource setRecipeID:](v25, "setRecipeID:", [v16 recipeID]);
      if (v19)
      {
        [(PLValidatedExternalResource *)v25 setFileURL:v17];
        [(PLValidatedExternalResource *)v25 setDataLength:v18];
      }
      LOWORD(v27) = a10;
      [(id)objc_opt_class() _applyImageIOMetadataToExternalResource:v25 fromFileURL:v17 fileExists:v19 assumedWidth:a7 assumedHeight:a8 recipe:v16 assetKind:v27];
      [(PLValidatedExternalResource *)v25 setTrashedStateFromURL];
      goto LABEL_12;
    }
  }
  if (v19) {
    goto LABEL_9;
  }
  id v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F281F8];
  uint64_t v30 = *MEMORY[0x1E4F28228];
  id v22 = [NSString stringWithFormat:@"file does not exist at path: %@", v15];
  v31[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  id v24 = [v20 errorWithDomain:v21 code:4 userInfo:v23];

  if (a11) {
    *a11 = v24;
  }

  id v25 = 0;
LABEL_12:

  return v25;
}

+ (id)externalResourcesForExistingAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 1466, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  BOOL v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 isCloudSharedAsset])
  {
    uint64_t v10 = [a1 _validatedExternalResourcesFromSharedStreamAsset:v7];
LABEL_8:
    uint64_t v11 = (void *)v10;
    [v9 addObjectsFromArray:v10];
    goto LABEL_9;
  }
  if (![v7 kind] || objc_msgSend(v7, "kind") == 1)
  {
    uint64_t v10 = [a1 _validatedExternalResourcesFromLocalImageOrVideoAsset:v7 referencedResourceURLs:v8];
    goto LABEL_8;
  }
  uint64_t v11 = [a1 _validatedExternalResourceIfPresentForAudioOrUnknownAsset:v7];
  if (v11) {
    [v9 addObject:v11];
  }
LABEL_9:

  return v9;
}

+ (BOOL)installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:(id)a3 migrator:(id)a4
{
  v44[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = PLImageManagerGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  BOOL v9 = v7;
  uint64_t v10 = v9;
  unint64_t v33 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LibraryMigration", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;

  context = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v12 = +[PLManagedAsset entityName];
  uint64_t v13 = [v11 fetchRequestWithEntityName:v12];

  v44[0] = @"modernResources";
  v44[1] = @"additionalAttributes";
  v44[2] = @"master";
  v44[3] = @"master.resources";
  v44[4] = @"master.mediaMetadata";
  v44[5] = @"resources";
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:6];
  [v13 setRelationshipKeyPathsForPrefetching:v14];

  id v15 = objc_alloc_init(PLSidecarFinder);
  id v16 = [NSString stringWithUTF8String:"+[PLResourceInstaller installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:migrator:]"];
  uint64_t v17 = [PLEnumerateAndSaveController alloc];
  uint64_t v18 = [v6 pathManager];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke;
  v38[3] = &unk_1E5871B18;
  id v19 = v6;
  id v39 = v19;
  id v20 = v16;
  id v40 = v20;
  id v21 = v5;
  id v41 = v21;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke_2;
  v35[3] = &unk_1E5869EA8;
  id v37 = a1;
  id v22 = v15;
  id v36 = v22;
  uint64_t v23 = [(PLEnumerateAndSaveController *)v17 initWithName:v20 fetchRequest:v13 context:v21 pathManager:v18 concurrent:1 refreshAllAfterSave:1 generateContextBlock:v38 didFetchObjectIDsBlock:0 processResultBlock:v35];

  id v34 = 0;
  BOOL v24 = [(PLEnumerateAndSaveController *)v23 processObjectsWithError:&v34];
  id v25 = v34;
  if (!v24)
  {
    id v26 = PLMigrationGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v25;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Failed to finish batch processing to migrate resources with error: %@", buf, 0xCu);
    }
  }
  uint64_t v27 = v10;
  id v28 = v27;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, spid, "LibraryMigration", "", buf, 2u);
  }

  return v24;
}

id __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) UTF8String];
  uint64_t v4 = [*(id *)(a1 + 48) persistentStoreCoordinator];
  id v5 = [v2 managedObjectContextForMigrationWithName:v3 persistentStoreCoordinator:v4 concurrencyType:1];

  id v6 = [*(id *)(a1 + 48) transactionAuthor];
  [v5 setTransactionAuthor:v6];

  return v5;
}

void __119__PLResourceInstaller_installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext_migrator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  id v7 = *(void **)(a1 + 40);
  id v17 = 0;
  int v8 = [v7 _installInternalResourcesForExistingAsset:v6 assumeNoExistingResources:1 referencedResourceURLs:0 includeLegacyCloudResources:1 outResourcesStoreCount:&v19 error:&v17];
  id v9 = v17;
  if (!v8
    || (uint64_t v11 = *(void *)(a1 + 32),
        uint64_t v10 = *(void **)(a1 + 40),
        id v16 = v9,
        v12 = [v10 recoverSupplementalResourcesForAsset:v6 usingSidecarFinder:v11 outResourcesStoreCount:&v18 error:&v16], v13 = v16, v9, id v9 = v13, (v12 & 1) == 0))
  {
    id v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v6 uuid];
      *(_DWORD *)buf = 138412546;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Error creating internal resources for asset during migration for UUID: %@, reason: %@", buf, 0x16u);
    }
    *a4 = 1;
  }
}

+ (BOOL)installInternalResourcesForExistingAsset:(id)a3 assumeNoExistingResources:(BOOL)a4 referencedResourceURLs:(id)a5 error:(id *)a6
{
  return [a1 _installInternalResourcesForExistingAsset:a3 assumeNoExistingResources:a4 referencedResourceURLs:a5 includeLegacyCloudResources:0 outResourcesStoreCount:0 error:a6];
}

+ (BOOL)removeLegacyCloudResourcesInStore:(id)a3 migrator:(id)a4
{
  uint64_t v4 = [a4 managedObjectContextForMigrationInStore:a3 name:"+[PLResourceInstaller removeLegacyCloudResourcesInStore:migrator:]" concurrencyType:*MEMORY[0x1E4F1C1C0]];
  id v5 = +[PLCloudResource entityName];
  BOOL v6 = +[PLModelMigrator executeBatchDeleteWithEntityName:v5 predicate:0 managedObjectContext:v4 error:0];

  return v6;
}

+ (BOOL)createInternalResourcesForExistingAssetsWithNoExistingResourcesInStore:(id)a3 migrator:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F1C1C0];
  id v7 = a4;
  int v8 = [v7 managedObjectContextForMigrationInStore:a3 name:"+[PLResourceInstaller createInternalResourcesForExistingAssetsWithNoExistingResourcesInStore:migrator:]" concurrencyType:v6];
  LOBYTE(a1) = [a1 installInternalResourcesForExistingAssetsWithNoExistingResourcesInManagedObjectContext:v8 migrator:v7];

  return (char)a1;
}

+ (BOOL)resetInternalResourcesInStore:(id)a3 resetUTIs:(BOOL)a4 resetCodecs:(BOOL)a5 resetMasters:(BOOL)a6 migrator:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = (void *)MEMORY[0x19F38D3B0]();
  id v14 = [v12 managedObjectContextForMigrationInStore:v11 name:"+[PLResourceInstaller resetInternalResourcesInStore:resetUTIs:resetCodecs:resetMasters:migrator:]" concurrencyType:*MEMORY[0x1E4F1C1C0]];
  if (a4)
  {
    id v15 = 0;
  }
  else
  {
    id v15 = [a1 _predicateForUnrecoverableResources];
  }
  id v16 = +[PLInternalResource entityName];
  BOOL v17 = +[PLModelMigrator executeBatchDeleteWithEntityName:v16 predicate:v15 managedObjectContext:v14 error:0];

  BOOL v18 = !a6;
  LOBYTE(v19) = !a6 && v17;
  if (!v18 && v17)
  {
    id v20 = +[PLCloudResource entityName];
    BOOL v19 = +[PLModelMigrator executeBatchDeleteWithEntityName:v20 predicate:0 managedObjectContext:v14 error:0];

    if (v19)
    {
      id v21 = +[PLCloudMaster entityName];
      LOBYTE(v19) = +[PLModelMigrator executeBatchDeleteWithEntityName:v21 predicate:0 managedObjectContext:v14 error:0];
    }
  }

  return v19;
}

+ (BOOL)reconsiderSavedAssetTypeInStore:(id)a3 migrator:(id)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isCloudPhotoLibraryEnabled])
  {
    BOOL v7 = 1;
  }
  else
  {
    context = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v8 = [NSString stringWithFormat:@"%@/%@", @"PhotoData", @"CPLAssets"];
    id v9 = [v6 managedObjectContextForMigrationInStore:v5 name:"+[PLResourceInstaller reconsiderSavedAssetTypeInStore:migrator:]" concurrencyType:*MEMORY[0x1E4F1C1C0]];
    uint64_t v10 = (void *)MEMORY[0x1E4F1C038];
    id v11 = +[PLManagedAsset entityName];
    id v12 = [v10 batchUpdateRequestWithEntityName:v11];

    id v13 = (void *)MEMORY[0x1E4F28BA0];
    id v14 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCameraAsset"), 1);
    v35[0] = v14;
    id v15 = (void *)MEMORY[0x1E4F28F60];
    id v28 = (void *)v8;
    id v16 = [NSString stringWithFormat:@"%@*", v8];
    BOOL v17 = [v15 predicateWithFormat:@"%K LIKE %@", @"directory", v16];
    v35[1] = v17;
    BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    BOOL v19 = [v13 andPredicateWithSubpredicates:v18];

    [v12 setPredicate:v19];
    unint64_t v33 = @"savedAssetType";
    id v20 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForCloudPhotoLibraryAsset"));
    id v34 = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v12 setPropertiesToUpdate:v21];

    [v12 setResultType:2];
    id v30 = 0;
    __int16 v22 = [v9 executeRequest:v12 error:&v30];
    id v23 = v30;
    BOOL v7 = v22 != 0;
    uint64_t v24 = PLMigrationGetLog();
    id v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v22 result];
        *(_DWORD *)buf = 138412290;
        id v32 = v26;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Fixing savedAssetType successful with result %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v23;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Batch update request failed, reconsidering savedAssetType, error: %@", buf, 0xCu);
    }

    [v9 reset];
  }

  return v7;
}

+ (BOOL)resetImageRequestHintsInContext:(id)a3 allowOneTimeThumbRebuild:(BOOL)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  context = (void *)MEMORY[0x19F38D3B0]();
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v7 = +[PLManagedAsset entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  v44[0] = @"modernResources";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  uint64_t v38 = 0;
  id v39 = (unsigned int *)&v38;
  uint64_t v40 = 0x3020000000;
  int v41 = 0;
  uint64_t v10 = [NSString stringWithUTF8String:"+[PLResourceInstaller resetImageRequestHintsInContext:allowOneTimeThumbRebuild:]"];
  id v11 = [v5 pathManager];
  id v12 = [v5 persistentStoreCoordinator];
  id v13 = [v5 transactionAuthor];
  id v14 = [PLEnumerateAndSaveController alloc];
  id v15 = [v5 pathManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke;
  v33[3] = &unk_1E5869E58;
  id v16 = v10;
  id v34 = v16;
  id v17 = v12;
  id v35 = v17;
  id v18 = v13;
  id v36 = v18;
  id v19 = v11;
  id v37 = v19;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_3;
  v31[3] = &unk_1E5869E80;
  BOOL v32 = a4;
  v31[4] = &v38;
  id v20 = [(PLEnumerateAndSaveController *)v14 initWithName:v16 fetchRequest:v8 context:v5 pathManager:v15 concurrent:1 refreshAllAfterSave:1 generateContextBlock:v33 didFetchObjectIDsBlock:0 processResultBlock:v31];

  id v30 = 0;
  BOOL v21 = [(PLEnumerateAndSaveController *)v20 processObjectsWithError:&v30];
  id v22 = v30;
  if (v21)
  {
    id v23 = PLMigrationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      signed int v24 = atomic_load(v39 + 10);
      *(_DWORD *)buf = 134217984;
      id v43 = (id)v24;
      id v25 = "Reset %ld asset image request hints.";
      id v26 = v23;
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v26, v27, v25, buf, 0xCu);
    }
  }
  else
  {
    id v23 = PLMigrationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v22;
      id v25 = "Error resetting image request hints, %@";
      id v26 = v23;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }

  _Block_object_dispose(&v38, 8);

  return v21;
}

id __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  [v2 setName:*(void *)(a1 + 32)];
  [v2 setPersistentStoreCoordinator:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_2;
  v7[3] = &unk_1E5873A50;
  id v3 = v2;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [v3 performBlockAndWait:v7];
  uint64_t v4 = v10;
  id v5 = v3;

  return v5;
}

void __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)(a1 + 40))
  {
    [v4 setThumbnailIndex:4294967293];
    id v4 = v5;
  }
  [v4 setImageRequestHints:0];
  [v5 recalculateImageRequestHints];
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 32) + 8) + 40), 1u);
}

void __80__PLResourceInstaller_resetImageRequestHintsInContext_allowOneTimeThumbRebuild___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransactionAuthor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) userInfo];
  [v3 setObject:v2 forKeyedSubscript:@"com.apple.photos.PLModelMigratorPathManagerKey"];
}

+ (BOOL)resetImageRequestHintsInContext:(id)a3
{
  return [a1 resetImageRequestHintsInContext:a3 allowOneTimeThumbRebuild:0];
}

+ (id)_validatedExternalResourcesFromSharedStreamAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 assetID];
  id v5 = [v4 libraryID];
  id v6 = PLDataStoreForClassIDAndLibraryID(2, v5);

  BOOL v7 = [v6 requiredExternalResourcesForMigratingOrImportingAsset:v3];

  return v7;
}

+ (id)generateVideoResourcesFromVideoAsset:(id)a3 referencedVideoPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [v6 managedObjectContext];
  id v10 = v7;
  id v11 = v10;
  if (!v10)
  {
    id v11 = [v6 pathForOriginalFile];
  }
  id v12 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v11 context:v9];
  id v13 = v12;
  if (v12)
  {
    [v12 setResourceType:1];
    [v13 setVersion:0];
    [v8 addObject:v13];
  }

  id v14 = [v6 pathForNonAdjustedLargeVideoFile];
  id v15 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v14 context:v9];
  id v16 = v15;
  if (v15)
  {
    [v15 setResourceType:1];
    [v16 setVersion:0];
    [v16 setRecipeID:131077];
    [v8 addObject:v16];
  }

  id v17 = [v6 pathForNonAdjustedMediumVideoFile];
  id v18 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v17 context:v9];
  id v19 = v18;
  if (v18)
  {
    [v18 setResourceType:1];
    [v19 setVersion:0];
    [v19 setRecipeID:131079];
    [v8 addObject:v19];
  }

  id v20 = [v6 pathForNonAdjustedMediumHDRVideoFile];
  BOOL v21 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v20 context:v9];
  id v22 = v21;
  if (v21)
  {
    [v21 setResourceType:1];
    [v22 setVersion:0];
    [v22 setRecipeID:131475];
    [v8 addObject:v22];
  }

  id v23 = [v6 pathForNonAdjustedSmallVideoFile];
  signed int v24 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v23 context:v9];
  id v25 = v24;
  if (v24)
  {
    [v24 setResourceType:1];
    [v25 setVersion:0];
    [v25 setRecipeID:131081];
    [v8 addObject:v25];
  }

  if ([v6 hasAdjustments])
  {
    int v26 = [v6 hasUnrenderedAsyncAdjustments];
    os_log_type_t v27 = [v6 pathForFullsizeRenderVideoFile];
    id v28 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v27 context:v9];
    if (!v28 && v26)
    {
      id v29 = +[PLResourceRecipe recipeFromID:0x20000];
      id v28 = objc_alloc_init(PLValidatedExternalResource);
      id v30 = [v29 codecFourCharCodeName];
      [(PLValidatedExternalResource *)v28 setCodecFourCharCode:v30];

      id v31 = [v29 uti];
      [(PLValidatedExternalResource *)v28 setUniformTypeIdentifier:v31];
    }
    if (v28)
    {
      [(PLValidatedExternalResource *)v28 setResourceType:1];
      [(PLValidatedExternalResource *)v28 setVersion:2];
      [(PLValidatedExternalResource *)v28 setRecipeID:0x20000];
      [v8 addObject:v28];
    }

    BOOL v32 = [v6 pathForPenultimateFullsizeRenderVideoFile];
    unint64_t v33 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v32 context:v9];
    id v34 = v33;
    if (v33)
    {
      [v33 setResourceType:1];
      [v34 setVersion:1];
      [v8 addObject:v34];
    }

    id v35 = [v6 pathForAdjustedLargeVideoFile];
    id v36 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v35 context:v9];
    id v37 = v36;
    if (v36)
    {
      [v36 setResourceType:1];
      [v37 setVersion:2];
      [v37 setRecipeID:131077];
      [v8 addObject:v37];
    }

    uint64_t v38 = [v6 pathForAdjustedMediumVideoFile];
    id v39 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v38 context:v9];
    uint64_t v40 = v39;
    if (v39)
    {
      [v39 setResourceType:1];
      [v40 setVersion:2];
      [v40 setRecipeID:131079];
      [v8 addObject:v40];
    }

    int v41 = [v6 pathForAdjustedMediumHDRVideoFile];
    uint64_t v42 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v41 context:v9];
    id v43 = v42;
    if (v42)
    {
      [v42 setResourceType:1];
      [v43 setVersion:2];
      [v43 setRecipeID:131475];
      [v8 addObject:v43];
    }

    unsigned int v44 = [v6 pathForAdjustedSmallVideoFile];
    unsigned int v45 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v44 context:v9];
    id v46 = v45;
    if (v45)
    {
      [v45 setResourceType:1];
      [v46 setVersion:2];
      [v46 setRecipeID:131081];
      [v8 addObject:v46];
    }
  }
  return v8;
}

+ (id)validatedExternalResourceForLocalVideoIfPresentAtPath:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [a1 _getURLDataLength:v8];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = [MEMORY[0x1E4F16330] assetWithURL:v8];
    if (v11)
    {
      id v12 = objc_alloc_init(PLValidatedExternalResource);
      id v13 = [v11 plVideoCodecFourCharCodeString];
      if (v13) {
        [(PLValidatedExternalResource *)v12 setCodecFourCharCode:v13];
      }
      +[PLManagedAsset dimensionsForAVAsset:v11];
      double v15 = v14;
      [(PLValidatedExternalResource *)v12 setUnorientedWidth:(uint64_t)v16];
      [(PLValidatedExternalResource *)v12 setUnorientedHeight:(uint64_t)v15];
      [(PLValidatedExternalResource *)v12 setFileURL:v8];
      [(PLValidatedExternalResource *)v12 setDataLength:v10];
      id v17 = (void *)MEMORY[0x1E4F8CDF8];
      id v18 = [v6 pathExtension];
      id v19 = [v17 resourceModelTypeForFilenameExtension:v18];
      id v20 = [v19 identifier];

      if (v20)
      {
        BOOL v21 = +[PLUniformTypeIdentifier utiWithIdentifier:v20];
        [(PLValidatedExternalResource *)v12 setUniformTypeIdentifier:v21];
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_storeValidatedLocalExternalResource:(id)a3 forAsset:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20[0] = v5;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = [v6 arrayWithObjects:v20 count:1];
  id v17 = 0;
  uint64_t v9 = +[PLResourceDataStoreManager storeExternalResources:v8 forAsset:v7 forLifecycleEvent:2 error:&v17];

  id v10 = v17;
  if (v9)
  {
    id v11 = [v9 anyObject];
    id v12 = [MEMORY[0x1E4F8B9B8] successWithResult:v11];
  }
  else
  {
    if (!v10)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F8C520];
      uint64_t v18 = *MEMORY[0x1E4F28228];
      id v19 = @"resource was not stored";
      double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v10 = [v13 errorWithDomain:v14 code:1 userInfo:v15];
    }
    id v12 = [MEMORY[0x1E4F8B9B8] failureWithError:v10];
  }

  return v12;
}

+ (id)_validatedExternalResourcesFromLocalImageOrVideoAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v6 = a3;
  id v108 = a4;
  v107 = [MEMORY[0x1E4F1CA48] array];
  v106 = [v6 managedObjectContext];
  int v105 = [v6 hasAdjustments];
  uint64_t v7 = [v6 width];
  uint64_t v8 = [v6 height];
  if (![v6 kind])
  {
    uint64_t v9 = [v108 objectForKeyedSubscript:&unk_1EEBEE520];
    if (!v9)
    {
      uint64_t v9 = [v6 mainFileURL];
    }
    uint64_t v10 = [a1 _getURLDataLength:v9];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = objc_alloc_init(PLValidatedExternalResource);
      [(PLValidatedExternalResource *)v12 setResourceType:0];
      [(PLValidatedExternalResource *)v12 setVersion:0];
      [(PLValidatedExternalResource *)v12 setFileURL:v9];
      [(PLValidatedExternalResource *)v12 setDataLength:v11];
      id v13 = [v6 originalUniformTypeIdentifier];
      uint64_t v14 = +[PLUniformTypeIdentifier utiWithIdentifier:v13];

      [(PLValidatedExternalResource *)v12 setUniformTypeIdentifier:v14];
      -[PLValidatedExternalResource setUnorientedWidth:](v12, "setUnorientedWidth:", [v6 originalWidth]);
      -[PLValidatedExternalResource setUnorientedHeight:](v12, "setUnorientedHeight:", [v6 originalHeight]);
      [v107 addObject:v12];
    }
    else
    {
      v89 = [v6 additionalAttributes];
      v90 = [v89 deferredPhotoIdentifier];
      if (v90) {
        BOOL v91 = [v6 deferredProcessingNeeded] == 1
      }
           || [v6 deferredProcessingNeeded] == 5;
      else {
        BOOL v91 = 0;
      }

      int v95 = [v6 deferredProcessingNeeded];
      if (!v91 && v95 != 10) {
        goto LABEL_8;
      }
      id v12 = [v6 pathForDeferredProcessingPreviewFile];
      if (!v12)
      {
LABEL_7:

LABEL_8:
        goto LABEL_9;
      }
      if (v91) {
        int v96 = 202;
      }
      else {
        int v96 = 210;
      }
      v97 = +[PLResourceRecipe recipeFromID:(v96 + 65741)];
      uint64_t v98 = [v6 originalWidth];
      uint64_t v99 = [v6 originalHeight];
      LOWORD(v100) = [v6 kind];
      uint64_t v14 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v12 requireFileToBePresent:1 version:0 basedOnFullSizeWidth:v98 andHeight:v99 recipe:v97 assetKind:v100 error:0];
      if (v14) {
        [v107 addObject:v14];
      }
    }
    goto LABEL_7;
  }
LABEL_9:
  if (([v6 cameraProcessingAdjustmentState] & 1) == 0) {
    goto LABEL_21;
  }
  if ([v6 kind])
  {
    if ([v6 kind] != 1) {
      goto LABEL_21;
    }
    double v15 = [v108 objectForKeyedSubscript:&unk_1EEBEE4F0];
    double v16 = [v15 path];

    if (!v16)
    {
      double v16 = [v6 pathForSpatialOverCaptureContentFile];
    }
    id v17 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v16 context:v106];
    uint64_t v18 = v17;
    if (!v17) {
      goto LABEL_20;
    }
    [v17 setResourceType:10];
    [v18 setVersion:0];
    [v18 setTrashedStateFromURL];
    goto LABEL_19;
  }
  if ([v6 deferredProcessingNeeded] == 1
    || [v6 deferredProcessingNeeded] == 6)
  {
    double v16 = +[PLResourceRecipe recipeFromID:65946];
    id v19 = [v6 pathForSpatialOverCaptureContentFile];
    uint64_t v20 = [v6 originalHeight];
    uint64_t v21 = [v6 originalWidth];
    LOWORD(v100) = [v6 kind];
    uint64_t v18 = [a1 generateValidatedExternalImageResourceOfType:10 forFilePath:v19 requireFileToBePresent:0 version:0 basedOnFullSizeWidth:v20 andHeight:v21 recipe:v16 assetKind:v100 error:0];

    if (!v18)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    [v107 addObject:v18];
    goto LABEL_20;
  }
  v92 = [v108 objectForKeyedSubscript:&unk_1EEBEE4F0];
  double v16 = [v92 path];

  if (v16
    || ([v6 pathForSpatialOverCaptureContentFile],
        (double v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v93 = [v6 originalWidth];
    uint64_t v94 = [v6 originalHeight];
    LOWORD(v100) = [v6 kind];
    uint64_t v18 = [a1 generateValidatedExternalImageResourceOfType:10 forFilePath:v16 requireFileToBePresent:1 version:0 basedOnFullSizeWidth:v93 andHeight:v94 recipe:0 assetKind:v100 error:0];
    if (!v18) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_21:
  id v22 = +[PLResourceRecipe recipeFromID:65737];
  id v23 = [v6 pathForNonAdjustedFullsizeImageFile];
  uint64_t v24 = [v6 originalWidth];
  uint64_t v25 = [v6 originalHeight];
  LOWORD(v100) = [v6 kind];
  int v26 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v23 requireFileToBePresent:1 version:0 basedOnFullSizeWidth:v24 andHeight:v25 recipe:v22 assetKind:v100 error:0];

  if (v26) {
    [v107 addObject:v26];
  }

  os_log_type_t v27 = +[PLResourceRecipe recipeFromID:65741];
  id v28 = [v6 pathForNonAdjustedLargeThumbnailFile];
  uint64_t v29 = [v6 originalWidth];
  uint64_t v30 = [v6 originalHeight];
  LOWORD(v101) = [v6 kind];
  id v31 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v28 requireFileToBePresent:1 version:0 basedOnFullSizeWidth:v29 andHeight:v30 recipe:v27 assetKind:v101 error:0];

  BOOL v32 = v107;
  if (v31) {
    [v107 addObject:v31];
  }

  if ([v6 kindSubtype] == 2)
  {
    unint64_t v33 = [v108 objectForKeyedSubscript:&unk_1EEBEE538];
    id v34 = [v33 path];

    if (!v34)
    {
      id v34 = [v6 pathForVideoComplementFile];
    }
    id v35 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v34 context:v106];
    id v36 = v35;
    if (v35)
    {
      [v35 setResourceType:3];
      [v36 setVersion:0];
      [v107 addObject:v36];
    }

    if ([v6 cameraProcessingAdjustmentState])
    {
      id v37 = [v108 objectForKeyedSubscript:&unk_1EEBEE508];
      uint64_t v38 = [v37 path];

      if (!v38)
      {
        uint64_t v38 = [v6 pathForVideoComplementSpatialOverCaptureContentFile];
      }
      id v39 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v38 context:v106];
      uint64_t v40 = v39;
      if (v39)
      {
        [v39 setResourceType:11];
        [v40 setVersion:0];
        [v40 setTrashedStateFromURL];
        [v107 addObject:v40];
      }
    }
  }
  if (v105)
  {
    int v41 = +[PLResourceRecipe recipeFromID:65937];
    uint64_t v42 = [v6 pathForSubstandardFullsizeRenderImageFile];
    LOWORD(v102) = [v6 kind];
    id v43 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v42 requireFileToBePresent:1 version:2 basedOnFullSizeWidth:v7 andHeight:v8 recipe:v41 assetKind:v102 error:0];

    if (v43) {
      [v107 addObject:v43];
    }

    if ([v6 hasUnrenderedAsyncAdjustments])
    {
      unsigned int v44 = +[PLResourceRecipe recipeFromID:65941];
      unsigned int v45 = [v6 pathForAsyncAdjustedRenderPreviewImageFile];
      LOWORD(v103) = [v6 kind];
      id v46 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v45 requireFileToBePresent:1 version:2 basedOnFullSizeWidth:v7 andHeight:v8 recipe:v44 assetKind:v103 error:0];

      BOOL v32 = v107;
      if (v46) {
        [v107 addObject:v46];
      }
    }
    BOOL v47 = !v43 && ![v6 hasUnrenderedAsyncAdjustments]
       || [v6 kind] != 0;
    v48 = [v6 pathForAdjustedFullsizeImageFile];
    v49 = [a1 generateAdjustedFullSizeRenderResourceForFilePath:v48 requireFileToBePresent:v47 basedOnFullSizeWidth:v7 andHeight:v8];

    if (v49) {
      [v32 addObject:v49];
    }

    uint64_t v50 = [a1 _speculativePathForPenultimateFullsizeRenderImageFileForAsset:v6];
    LOWORD(v103) = [v6 kind];
    uint64_t v51 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v50 requireFileToBePresent:1 version:1 basedOnFullSizeWidth:v7 andHeight:v8 recipe:0 assetKind:v103 error:0];

    if (v51) {
      [v32 addObject:v51];
    }

    __int16 v52 = +[PLResourceRecipe recipeFromID:65741];
    uint64_t v53 = [v6 pathForAdjustedLargeThumbnailFile];
    LOWORD(v104) = [v6 kind];
    v54 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v53 requireFileToBePresent:1 version:2 basedOnFullSizeWidth:v7 andHeight:v8 recipe:v52 assetKind:v104 error:0];

    if (v54) {
      [v32 addObject:v54];
    }

    v55 = [(id)*MEMORY[0x1E4F44378] identifier];
    id v56 = +[PLUniformTypeIdentifier utiWithIdentifier:v55];

    long long v57 = [v6 pathForAdjustmentSecondaryDataFile];
    long long v58 = [a1 generateValidatedExternalOtherResourceOfType:7 forFilePath:v57 uti:v56 requireFileToBePresent:1 version:2];

    if (v58) {
      [v32 addObject:v58];
    }

    if ([v6 kindSubtype] == 2)
    {
      int v59 = [v6 hasUnrenderedAsyncAdjustments];
      long long v60 = [v6 pathForFullsizeRenderVideoFile];
      v61 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v60 context:v106];
      if (!v61 && v59)
      {
        uint64_t v62 = +[PLResourceRecipe recipeFromID:131272];
        v61 = objc_alloc_init(PLValidatedExternalResource);
        v63 = [v62 codecFourCharCodeName];
        [(PLValidatedExternalResource *)v61 setCodecFourCharCode:v63];

        v64 = [v62 uti];
        [(PLValidatedExternalResource *)v61 setUniformTypeIdentifier:v64];
      }
      if (v61)
      {
        [(PLValidatedExternalResource *)v61 setResourceType:3];
        [(PLValidatedExternalResource *)v61 setVersion:2];
        [(PLValidatedExternalResource *)v61 setRecipeID:131272];
        [v32 addObject:v61];
      }

      v65 = [v6 pathForPenultimateFullsizeRenderVideoFile];
      v66 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v65 context:v106];
      v67 = v66;
      if (v66)
      {
        [v66 setResourceType:3];
        [v67 setVersion:1];
        [v32 addObject:v67];
      }
    }
  }
  if ([v6 kind] == 1)
  {
    v68 = [v108 objectForKeyedSubscript:&unk_1EEBEE550];
    v69 = [v68 path];
    v70 = [a1 generateVideoResourcesFromVideoAsset:v6 referencedVideoPath:v69];
    [v32 addObjectsFromArray:v70];

    v71 = +[PLResourceRecipe recipeFromID:65948];
    v72 = [v6 pathForTransientVideoPosterFramePreview];
    uint64_t v73 = [v6 width];
    uint64_t v74 = [v6 height];
    LOWORD(v102) = [v6 kind];
    v75 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v72 requireFileToBePresent:1 version:2 basedOnFullSizeWidth:v73 andHeight:v74 recipe:v71 assetKind:v102 error:0];

    if (v75) {
      [v32 addObject:v75];
    }
  }
  v76 = [v108 objectForKeyedSubscript:&unk_1EEBEE568];
  v77 = [v76 path];

  if (!v77)
  {
    v77 = [v6 pathForOriginalAdjustmentFile];
  }
  v78 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
  v79 = [v78 identifier];
  v80 = +[PLUniformTypeIdentifier utiWithIdentifier:v79];

  v81 = [a1 generateValidatedExternalOtherResourceOfType:5 forFilePath:v77 uti:v80 requireFileToBePresent:1 version:0];
  v82 = v81;
  if (v81)
  {
    [v81 setRecipeID:0];
    [v32 addObject:v82];
  }
  v83 = [v6 pathForXMPFile];
  v84 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v83];
  v85 = [MEMORY[0x1E4F8CDF8] supplementalResourceXMPType];
  v86 = [v85 identifier];
  v87 = [a1 _validatedExternalResourceFromSupplementalFileURL:v84 withUTI:v86 ptpTrashedState:0 index:0 asset:v6];

  if (v87)
  {
    [v82 setRecipeID:0];
    [v107 addObject:v87];
  }

  return v107;
}

+ (id)_speculativePathForPenultimateFullsizeRenderImageFileForAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathForPenultimateFullsizeRenderImageFileWithUTI:@"public.heic"];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    id v7 = [v3 pathForPenultimateFullsizeRenderImageFile];
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)generateAdjustedFullSizeRenderResourceForFilePath:(id)a3 requireFileToBePresent:(BOOL)a4 basedOnFullSizeWidth:(int64_t)a5 andHeight:(int64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = +[PLResourceRecipe recipeFromID:65938];
  LOWORD(v14) = 0;
  id v12 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v10 requireFileToBePresent:v8 version:2 basedOnFullSizeWidth:a5 andHeight:a6 recipe:v11 assetKind:v14 error:0];

  return v12;
}

+ (id)onDemand_installResourceWithResourceIdentity:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 707, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 708, @"Invalid parameter not satisfying: %@", @"nonPersistedResource" object file lineNumber description];

LABEL_3:
  uint64_t v9 = objc_alloc_init(PLValidatedExternalResource);
  if (v9)
  {
    uint64_t v10 = [v7 recipeID];
    uint64_t v11 = +[PLResourceRecipe recipeFromID:v10];
    -[PLValidatedExternalResource setResourceType:](v9, "setResourceType:", [v7 resourceType]);
    -[PLValidatedExternalResource setVersion:](v9, "setVersion:", [v7 version]);
    [(PLValidatedExternalResource *)v9 setRecipeID:v10];
    id v12 = [v11 codecFourCharCodeName];
    [(PLValidatedExternalResource *)v9 setCodecFourCharCode:v12];

    id v13 = [v11 uti];
    [(PLValidatedExternalResource *)v9 setUniformTypeIdentifier:v13];

    uint64_t v14 = [v8 assetID];
    double v15 = [v14 libraryID];
    double v16 = +[PLResourceDataStoreManager storeForExternalResource:v9 inLibraryWithID:v15];

    if (v16)
    {
      id v21 = 0;
      [v16 storeExternalResource:v9 forAsset:v8 options:0 error:0 resultingResource:&v21];
      id v17 = v21;
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installExistingAdjustmentSuggestionResourceAtFilePath:(id)a3 recipe:(id)a4 forAsset:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)*MEMORY[0x1E4F443E0];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 identifier];
  id v13 = [a1 _validatedExternalResourceAtPath:v11 recipe:v10 type:15 version:3 identifier:v12];

  if ([v13 isSuccess])
  {
    uint64_t v14 = [v13 result];
    [a1 _storeValidatedLocalExternalResource:v14 forAsset:v8];
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v14 = [v13 error];
    [v15 failureWithError:v14];
  double v16 = };

  return v16;
}

+ (id)onDemand_installExistingComputeResourceAtFilePath:(id)a3 recipe:(id)a4 forAsset:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)*MEMORY[0x1E4F44378];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 identifier];
  id v13 = [a1 _validatedExternalResourceAtPath:v11 recipe:v10 type:14 version:3 identifier:v12];

  if ([v13 isSuccess])
  {
    uint64_t v14 = [v13 result];
    [a1 _storeValidatedLocalExternalResource:v14 forAsset:v8];
  }
  else
  {
    double v15 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v14 = [v13 error];
    [v15 failureWithError:v14];
  double v16 = };

  return v16;
}

+ (id)onDemand_installEmptyComputeResourceWithRecipe:(id)a3 forAsset:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [a1 _validatedExternalResourceForComputeResourceWithRecipe:a3];
  id v10 = (void *)v9;
  if (v9)
  {
    v22[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v19 = 0;
    id v12 = +[PLResourceDataStoreManager storeExternalResources:v11 forAsset:v8 forLifecycleEvent:2 error:&v19];
    id v13 = v19;

    if (v12)
    {
      uint64_t v14 = [v12 anyObject];
    }
    else
    {
      if (!v13)
      {
        double v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F8C520];
        uint64_t v20 = *MEMORY[0x1E4F28228];
        id v21 = @"resource was not stored";
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        id v13 = [v15 errorWithDomain:v16 code:1 userInfo:v17];
      }
      uint64_t v14 = 0;
    }

    if (a5) {
      goto LABEL_10;
    }
  }
  else
  {
    id v13 = 0;
    uint64_t v14 = 0;
    if (a5) {
LABEL_10:
    }
      *a5 = v13;
  }

  return v14;
}

+ (id)onDemand_installExistingAdjustedResourceAtFilePath:(id)a3 withType:(unsigned int)a4 recipe:(id)a5 forAsset:(id)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = v15;
  if (!v13)
  {
    uint64_t v24 = 0;
    goto LABEL_16;
  }
  if (!v15)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 648, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v17 = [v16 width];
  uint64_t v18 = [v16 height];
  id v32 = 0;
  LOWORD(v30) = [v16 kind];
  id v19 = [a1 generateValidatedExternalImageResourceOfType:v10 forFilePath:v13 requireFileToBePresent:1 version:2 basedOnFullSizeWidth:v17 andHeight:v18 recipe:v14 assetKind:v30 error:&v32];
  id v20 = v32;
  if (v19)
  {
    v35[0] = v19;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    id v31 = v20;
    id v22 = +[PLResourceDataStoreManager storeExternalResources:v21 forAsset:v16 forLifecycleEvent:2 error:&v31];
    id v23 = v31;

    if (v22)
    {
      uint64_t v24 = [v22 anyObject];
    }
    else
    {
      if (!v23)
      {
        uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = *MEMORY[0x1E4F8C520];
        uint64_t v33 = *MEMORY[0x1E4F28228];
        id v34 = @"resource was not stored";
        os_log_type_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        id v23 = [v25 errorWithDomain:v26 code:1 userInfo:v27];
      }
      uint64_t v24 = 0;
    }

    id v20 = v23;
    if (!a7) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if (!a7) {
      goto LABEL_15;
    }
  }
  *a7 = v20;
LABEL_15:

LABEL_16:
  return v24;
}

+ (id)onDemand_installOriginalVideoComplementForSyndicationAsset:(id)a3 contentType:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 additionalAttributes];
  uint64_t v9 = [v8 syndicationIdentifier];

  if (!v9)
  {
    uint64_t v10 = PLBackendGetLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    id v11 = [v6 uuid];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v11;
    id v12 = "Cannot install syndication resource on asset that is missing syndication identifier, uuid: %{public}@";
LABEL_10:
    id v13 = v10;
    uint32_t v14 = 12;
    goto LABEL_11;
  }
  if ([v6 bundleScope] != 3)
  {
    uint64_t v10 = PLBackendGetLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    id v11 = [v6 uuid];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v11;
    id v12 = "Cannot install syndication resource on asset that is not in syndication bundle scope, uuid: %{public}@";
    goto LABEL_10;
  }
  if ([v6 kind] - 1 <= 2)
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v6 uuid];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v11;
      __int16 v27 = 2050;
      uint64_t v28 = (int)[v6 kind];
      id v12 = "Only images can be live photos, cannot install syndication video complement, uuid: %{public}@, type: %{public}ld";
      id v13 = v10;
      uint32_t v14 = 22;
LABEL_11:
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_12:
    id v15 = 0;
    goto LABEL_13;
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v18 = [v6 pathForVideoComplementFile];
  id v19 = [v17 fileURLWithPath:v18];
  id v20 = [v7 identifier];
  id v21 = +[PLUniformTypeIdentifier utiWithIdentifier:v20];
  uint64_t v10 = [a1 generatedValidatedExternalSyndicationResourceOfType:3 version:0 recipeID:0 fileURL:v19 requireFileToBePresent:0 uniformTypeIdentifier:v21];

  uint64_t v24 = v10;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v23 = +[PLResourceDataStoreManager storeExternalResources:v22 forAsset:v6 forLifecycleEvent:0 error:0];

  id v15 = [v23 anyObject];

LABEL_13:
  return v15;
}

+ (id)onDemand_installOriginalResourceForSyndicationAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 additionalAttributes];
  id v6 = [v5 syndicationIdentifier];

  if (!v6)
  {
    id v12 = PLSyndicationGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v16 = [v4 uuid];
    *(_DWORD *)buf = 138543362;
    id v21 = v16;
    uint64_t v17 = "[sync] cannot install resource on asset missing syndication identifier, uuid: %{public}@";
LABEL_12:
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    goto LABEL_13;
  }
  if ([v4 bundleScope] != 3)
  {
    id v12 = PLSyndicationGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v16 = [v4 uuid];
    *(_DWORD *)buf = 138543362;
    id v21 = v16;
    uint64_t v17 = "[sync] cannot install resource on asset that is not in syndication bundle scope, uuid: %{public}@";
    goto LABEL_12;
  }
  int v7 = [v4 kind];
  if (v7 != 3)
  {
    if (v7 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7 == 1;
    }
    uint64_t v9 = [v4 mainFileURL];
    uint64_t v10 = [v4 uniformTypeIdentifier];
    id v11 = +[PLUniformTypeIdentifier utiWithIdentifier:v10];
    id v12 = [a1 generatedValidatedExternalSyndicationResourceOfType:v8 version:0 recipeID:0 fileURL:v9 requireFileToBePresent:0 uniformTypeIdentifier:v11];

    id v19 = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    uint32_t v14 = +[PLResourceDataStoreManager storeExternalResources:v13 forAsset:v4 forLifecycleEvent:0 error:0];

    id v15 = [v14 anyObject];

    goto LABEL_14;
  }
  id v12 = PLSyndicationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = [v4 uuid];
    *(_DWORD *)buf = 138543362;
    id v21 = v16;
    uint64_t v17 = "[sync] cannot install resource on asset with unknown type, uuid: %{public}@";
    goto LABEL_12;
  }
LABEL_13:
  id v15 = 0;
LABEL_14:

  return v15;
}

+ (id)onDemand_installLocalVideoKeyFrameForAsset:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLResourceRecipe recipeFromID:65749];
  uint64_t v6 = [v4 width];
  uint64_t v7 = [v4 height];
  LOWORD(v14) = [v4 kind];
  uint64_t v8 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:0 requireFileToBePresent:0 version:3 basedOnFullSizeWidth:v6 andHeight:v7 recipe:v5 assetKind:v14 error:0];
  uint64_t v9 = +[PLUniformTypeIdentifier jpegUniformTypeIdentifier];
  [v8 setUniformTypeIdentifier:v9];

  v15[0] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = +[PLResourceDataStoreManager storeExternalResources:v10 forAsset:v4 forLifecycleEvent:2 error:0];

  id v12 = [v11 anyObject];

  return v12;
}

+ (id)onDemand_installOriginalSOCVideoComplementPresentForAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 managedObjectContext];
  if (!v7)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 560, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:&unk_1EEBEE508];
  id v11 = [v10 path];

  if (!v11)
  {
    id v11 = [v7 pathForVideoComplementSpatialOverCaptureContentFile];
  }
  id v12 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v11 context:v9];
  id v13 = v12;
  if (v12)
  {
    [v12 setResourceType:11];
    [v13 setVersion:0];
    [v13 setTrashedStateFromURL];
    uint64_t v14 = [v7 assetID];
    id v15 = [v14 libraryID];
    uint64_t v16 = +[PLResourceDataStoreManager storeForExternalResource:v13 inLibraryWithID:v15];

    if (v16)
    {
      id v20 = 0;
      [v16 storeExternalResource:v13 forAsset:v7 options:0 error:0 resultingResource:&v20];
      id v17 = v20;
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installOriginalSOCVideoPresentForAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 managedObjectContext];
  if (!v7)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 537, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:&unk_1EEBEE4F0];
  id v11 = [v10 path];

  if (v11
    || ([v7 pathForSpatialOverCaptureContentFile],
        (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v11 context:v9];
    id v13 = v12;
    if (v12)
    {
      [v12 setResourceType:10];
      [v13 setVersion:0];
      [v13 setTrashedStateFromURL];
      uint64_t v14 = [v7 assetID];
      id v15 = [v14 libraryID];
      uint64_t v16 = +[PLResourceDataStoreManager storeForExternalResource:v13 inLibraryWithID:v15];

      if (v16)
      {
        id v20 = 0;
        [v16 storeExternalResource:v13 forAsset:v7 options:0 error:0 resultingResource:&v20];
        id v17 = v20;
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installOriginalSOCImagePresentForAsset:(id)a3 referencedResourceURLs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 517, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:&unk_1EEBEE4F0];
  uint64_t v10 = [v9 path];

  if (v10
    || ([v7 pathForSpatialOverCaptureContentFile],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = [v7 originalWidth];
    uint64_t v12 = [v7 originalHeight];
    LOWORD(v20) = [v7 kind];
    id v13 = [a1 generateValidatedExternalImageResourceOfType:10 forFilePath:v10 requireFileToBePresent:1 version:0 basedOnFullSizeWidth:v11 andHeight:v12 recipe:0 assetKind:v20 error:0];
    if (v13)
    {
      uint64_t v14 = [v7 assetID];
      id v15 = [v14 libraryID];
      uint64_t v16 = +[PLResourceDataStoreManager storeForExternalResource:v13 inLibraryWithID:v15];

      if (v16)
      {
        id v21 = 0;
        [v16 storeExternalResource:v13 forAsset:v7 options:0 error:0 resultingResource:&v21];
        id v17 = v21;
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)onDemand_installOriginalAdjustmentResourceIfPresentForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 496, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v6 = [v5 pathForOriginalAdjustmentFile];
  id v7 = [MEMORY[0x1E4F8CDF8] supplementalResourceAAEType];
  id v8 = [v7 identifier];
  uint64_t v9 = +[PLUniformTypeIdentifier utiWithIdentifier:v8];

  uint64_t v10 = [a1 generateValidatedExternalOtherResourceOfType:5 forFilePath:v6 uti:v9 requireFileToBePresent:1 version:0];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 setRecipeID:0];
    uint64_t v12 = [v5 assetID];
    id v13 = [v12 libraryID];
    uint64_t v14 = +[PLResourceDataStoreManager storeForExternalResource:v11 inLibraryWithID:v13];

    if (v14)
    {
      id v18 = 0;
      [v14 storeExternalResource:v11 forAsset:v5 options:0 error:0 resultingResource:&v18];
      id v15 = v18;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 471, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  uint64_t v6 = objc_alloc_init(PLValidatedExternalResource);
  if (v6)
  {
    id v7 = +[PLResourceRecipe recipeFromID:131272];
    [(PLValidatedExternalResource *)v6 setResourceType:3];
    [(PLValidatedExternalResource *)v6 setVersion:2];
    [(PLValidatedExternalResource *)v6 setRecipeID:131272];
    id v8 = [v7 codecFourCharCodeName];
    [(PLValidatedExternalResource *)v6 setCodecFourCharCode:v8];

    uint64_t v9 = [v7 uti];
    [(PLValidatedExternalResource *)v6 setUniformTypeIdentifier:v9];

    uint64_t v10 = [v5 assetID];
    uint64_t v11 = [v10 libraryID];
    uint64_t v12 = +[PLResourceDataStoreManager storeForExternalResource:v6 inLibraryWithID:v11];

    if (v12)
    {
      id v16 = 0;
      [v12 storeExternalResource:v6 forAsset:v5 options:0 error:0 resultingResource:&v16];
      id v13 = v16;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)onDemand_installAdjustedFullSizeVideoComplementResourceIfPresentForAsset:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 managedObjectContext];
  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 449, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v7 = [v5 pathForFullsizeRenderVideoFile];
  id v8 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v7 context:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setResourceType:3];
    [v9 setVersion:2];
    [v9 setRecipeID:131272];
    uint64_t v10 = [v5 assetID];
    uint64_t v11 = [v10 libraryID];
    uint64_t v12 = +[PLResourceDataStoreManager storeForExternalResource:v9 inLibraryWithID:v11];

    if (v12)
    {
      id v16 = 0;
      [v12 storeExternalResource:v9 forAsset:v5 options:0 error:0 resultingResource:&v16];
      id v13 = v16;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)onDemand_installOriginalVideoComplementResourceIfPresentForAsset:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 managedObjectContext];
  if (!v5)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 427, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v7 = [v5 pathForVideoComplementFile];
  id v8 = [a1 validatedExternalResourceForLocalVideoIfPresentAtPath:v7 context:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setResourceType:3];
    [v9 setVersion:0];
    uint64_t v10 = [v5 assetID];
    uint64_t v11 = [v10 libraryID];
    uint64_t v12 = +[PLResourceDataStoreManager storeForExternalResource:v9 inLibraryWithID:v11];

    if (v12)
    {
      id v16 = 0;
      [v12 storeExternalResource:v9 forAsset:v5 options:0 error:0 resultingResource:&v16];
      id v13 = v16;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)onDemand_installAdjustedFullSizeRenderResourceAtFilePath:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 408, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
    }
    uint64_t v10 = objc_msgSend(a1, "generateAdjustedFullSizeRenderResourceForFilePath:requireFileToBePresent:basedOnFullSizeWidth:andHeight:", v7, 0, objc_msgSend(v9, "width"), objc_msgSend(v9, "height"));
    if (v10)
    {
      uint64_t v11 = [v9 assetID];
      uint64_t v12 = [v11 libraryID];
      id v13 = +[PLResourceDataStoreManager storeForExternalResource:v10 inLibraryWithID:v12];

      if (v13)
      {
        id v17 = 0;
        [v13 storeExternalResource:v10 forAsset:v9 options:0 error:0 resultingResource:&v17];
        id v14 = v17;
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)onDemand_installPrimaryImageResourceWithRecipe:(id)a3 version:(unsigned int)a4 forAsset:(id)a5 requireFileToBePresent:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    __int16 v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 386, @"Invalid parameter not satisfying: %@", @"recipe" object file lineNumber description];
  }
  id v13 = [v11 expectedFileURLForVersion:v8 asset:v12];
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 path];
    uint64_t v16 = [v12 width];
    uint64_t v17 = [v12 height];
    LOWORD(v28) = [v12 kind];
    id v18 = [a1 generateValidatedExternalImageResourceOfType:0 forFilePath:v15 requireFileToBePresent:v6 version:v8 basedOnFullSizeWidth:v16 andHeight:v17 recipe:v11 assetKind:v28 error:0];

    if (v18)
    {
      id v19 = [v12 assetID];
      uint64_t v20 = [v19 libraryID];
      id v21 = +[PLResourceDataStoreManager storeForExternalResource:v18 inLibraryWithID:v20];

      if (v21)
      {
        id v29 = 0;
        [v21 storeExternalResource:v18 forAsset:v12 options:0 error:0 resultingResource:&v29];
        id v22 = v29;
      }
      else
      {
        id v22 = 0;
      }

      goto LABEL_15;
    }
  }
  else
  {
    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v12 uuid];
      if (v8 > 2) {
        uint64_t v24 = @"cur";
      }
      else {
        uint64_t v24 = off_1E58642E0[v8];
      }
      uint64_t v25 = v24;
      *(_DWORD *)buf = 138543874;
      id v31 = v23;
      __int16 v32 = 2114;
      id v33 = v11;
      __int16 v34 = 2114;
      id v35 = v25;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unable to resolve expected file url for asset %{public}@, recipe: %{public}@, version: %{public}@", buf, 0x20u);
    }
  }
  id v22 = 0;
LABEL_15:

  return v22;
}

+ (id)onDemand_installPrimaryImageResourceWithRecipe:(id)a3 version:(unsigned int)a4 forAsset:(id)a5
{
  return (id)objc_msgSend(a1, "onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:requireFileToBePresent:", a3, *(void *)&a4, a5, 1);
}

+ (id)_predicateForUnrecoverableResources
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"fileSystemBookmark");
}

+ (void)_applyImageIOMetadataToExternalResource:(id)a3 fromFileURL:(id)a4 fileExists:(BOOL)a5 assumedWidth:(int64_t)a6 assumedHeight:(int64_t)a7 recipe:(id)a8 assetKind:(signed __int16)a9
{
  BOOL v12 = a5;
  v40[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  CFURLRef v15 = (const __CFURL *)a4;
  id v16 = a8;
  if (v15 && v12 && (uint64_t v17 = CGImageSourceCreateWithURL(v15, 0)) != 0)
  {
    id v18 = v17;
    id v19 = CGImageSourceGetType(v17);
    uint64_t v20 = *MEMORY[0x1E4F2FF40];
    v39[0] = *MEMORY[0x1E4F2FF08];
    v39[1] = v20;
    v40[0] = MEMORY[0x1E4F1CC28];
    v40[1] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    CFDictionaryRef v22 = CGImageSourceCopyPropertiesAtIndex(v18, 0, v21);
    if (v22)
    {
      id v23 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v19];
      int v24 = [v23 conformsToType:*MEMORY[0x1E4F44498]];

      uint64_t v25 = [(__CFDictionary *)v22 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
      objc_msgSend(v14, "setUnorientedWidth:", objc_msgSend(v25, "integerValue"));

      uint64_t v26 = [(__CFDictionary *)v22 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
      objc_msgSend(v14, "setUnorientedHeight:", objc_msgSend(v26, "integerValue"));

      if (v24)
      {
        __int16 v27 = PLExifPixelXDimensionFromImageProperties(v22);
        uint64_t v28 = [v27 integerValue];

        id v29 = PLExifPixelYDimensionFromImageProperties(v22);
        uint64_t v30 = [v29 integerValue];

        if (v28 > [v14 unorientedWidth] && v30 > objc_msgSend(v14, "unorientedHeight"))
        {
          [v14 setUnorientedWidth:v28];
          [v14 setUnorientedHeight:v30];
        }
      }
    }
    CFRelease(v18);

    if (v19) {
      goto LABEL_18;
    }
  }
  else if (v16)
  {
    uint64_t v31 = [v16 expectedSizeFromWidth:a6 height:a7];
    __int16 v32 = (void *)v31;
    if (v31)
    {
      double v33 = MEMORY[0x19F38B360](v31);
      double v35 = v34;
      [v14 setUnorientedWidth:(uint64_t)v33];
      a7 = (uint64_t)v35;
    }
    else
    {
      [v14 setUnorientedWidth:a6];
    }
    [v14 setUnorientedHeight:a7];
  }
  else
  {
    [v14 setUnorientedWidth:a6];
    [v14 setUnorientedHeight:a7];
  }
  uint64_t v36 = [(__CFURL *)v15 pathExtension];
  id v37 = [MEMORY[0x1E4F8CDF8] resourceModelTypeForFilenameExtension:v36];
  id v19 = [v37 identifier];

  if (!v19)
  {
    uint64_t v38 = [v16 uti];
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v38 = +[PLUniformTypeIdentifier utiWithIdentifier:v19];

LABEL_20:
  [v14 setUniformTypeIdentifier:v38];
}

+ (BOOL)_installInternalResourcesForExistingAsset:(id)a3 assumeNoExistingResources:(BOOL)a4 referencedResourceURLs:(id)a5 includeLegacyCloudResources:(BOOL)a6 outResourcesStoreCount:(unint64_t *)a7 error:(id *)a8
{
  BOOL v9 = a6;
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = a5;
  CFURLRef v15 = PLImageManagerGetLog();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v13);
  uint64_t v17 = v15;
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "ResourceModel", "InstallResources", buf, 2u);
  }

  if (v9 && ([v13 master], id v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    uint64_t v20 = +[PLCloudResource validatedExternalResourcesUsingLegacyCloudResourcesFromAssetWithCloudMaster:v13];
  }
  else
  {
    uint64_t v20 = [a1 externalResourcesForExistingAsset:v13 referencedResourceURLs:v14];
  }
  CFDictionaryRef v21 = (void *)v20;
  if (v11) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2;
  }
  id v30 = 0;
  id v23 = +[PLResourceDataStoreManager storeExternalResources:v20 forAsset:v13 forLifecycleEvent:v22 error:&v30];
  id v24 = v30;
  uint64_t v25 = v18;
  uint64_t v26 = v25;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)id v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v16, "ResourceModel", "InstallResources", v29, 2u);
  }

  if (a7) {
    *a7 = [v23 count];
  }
  if (a8 && v24) {
    *a8 = v24;
  }

  return v24 == 0;
}

+ (BOOL)installSupplementalResourceForExistingFileAtURL:(id)a3 ptpTrashedState:(int64_t)a4 index:(id)a5 forAsset:(id)a6 imageOrientation:(id)a7 resultingResource:(id *)a8 error:(id *)a9
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  os_signpost_id_t v16 = (void *)MEMORY[0x1E4F8CDF8];
  id v17 = a5;
  id v18 = [v14 pathExtension];
  id v19 = [v16 resourceModelTypeForFilenameExtension:v18];
  uint64_t v20 = [v19 identifier];

  CFDictionaryRef v21 = [a1 _validatedExternalResourceFromSupplementalFileURL:v14 withUTI:v20 ptpTrashedState:a4 index:v17 asset:v15];

  if (!v21)
  {
    id v23 = [NSString stringWithFormat:@"Unable to generate a supplemental resource from fileURL: %@", v14];
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F8C520];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = v23;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v24 = [v26 errorWithDomain:v27 code:1 userInfo:v25];
    goto LABEL_5;
  }
  v32[0] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v29 = 0;
  id v23 = +[PLResourceDataStoreManager storeExternalResources:v22 forAsset:v15 forLifecycleEvent:2 error:&v29];
  id v24 = v29;

  if (a8)
  {
    id v25 = [v23 anyObject];
    *a8 = v25;
LABEL_5:
  }
  if (a9 && v24) {
    *a9 = v24;
  }

  return v24 == 0;
}

+ (BOOL)recoverSupplementalResourcesForAsset:(id)a3 usingSidecarFinder:(id)a4 outResourcesStoreCount:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v11)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 173, @"Invalid parameter not satisfying: %@", @"finder" object file lineNumber description];
  }
  BOOL v12 = PLImageManagerGetLog();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v10);
  id v14 = v12;
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ResourceModel", "RecoverSupplementalResources", buf, 2u);
  }

  if (([v10 isPhotoIris] & 1) == 0
    && (([MEMORY[0x1E4F8BA10] maskForRecoverSupplementalResourcesForAsset],
         [v10 savedAssetType],
         (PLValidatedSavedAssetTypeApplies() & 1) != 0)
     || [v10 isCloudPhotoLibraryAsset]
     && ([v10 master], __int16 v32 = objc_claimAutoreleasedReturnValue(), v32, !v32)))
  {
    unint64_t v42 = v13 - 1;
    id v43 = a5;
    os_signpost_id_t spid = v13;
    os_signpost_id_t v16 = [v10 mainFileURL];
    uint64_t v17 = [v16 URLByDeletingLastPathComponent];

    id v18 = [v10 filename];
    id v19 = [v10 managedObjectContext];
    BOOL v20 = 1;
    int v41 = (void *)v17;
    CFDictionaryRef v21 = [v11 collectSidecarURLsForAssetFilename:v18 inDirectory:v17 context:v19 removeWhenDone:1];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v21;
    uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      id v37 = v11;
      unint64_t v24 = 0;
      uint64_t v25 = *(void *)v47;
      while (2)
      {
        uint64_t v26 = 0;
        unint64_t v39 = v24 + v23;
        unint64_t v40 = v24;
        do
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 8 * v26);
          uint64_t v28 = (void *)MEMORY[0x19F38D3B0]();
          id v29 = [v10 additionalAttributes];
          uint64_t v30 = [v29 originalOrientation];
          uint64_t v45 = 0;
          LODWORD(v27) = [a1 installSupplementalResourceForExistingFileAtURL:v27 ptpTrashedState:0 index:0 forAsset:v10 imageOrientation:v30 resultingResource:0 error:&v45];

          if (!v27)
          {
            BOOL v20 = 0;
            unint64_t v31 = v40 + v26;
            goto LABEL_21;
          }
          ++v26;
        }
        while (v23 != v26);
        uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        unint64_t v31 = v39;
        unint64_t v24 = v39;
        if (v23) {
          continue;
        }
        break;
      }
      BOOL v20 = 1;
LABEL_21:
      id v11 = v37;
    }
    else
    {
      unint64_t v31 = 0;
    }

    double v33 = v15;
    double v34 = v33;
    if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v34, OS_SIGNPOST_INTERVAL_END, spid, "ResourceModel", "RecoverSupplementalResources", buf, 2u);
    }

    if (v43) {
      unint64_t *v43 = v31;
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

+ (id)_validatedExternalResourceAtPath:(id)a3 recipe:(id)a4 type:(unsigned int)a5 version:(unsigned int)a6 identifier:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12)
  {
    char v35 = 0;
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v16 = [v15 fileExistsAtPath:v12 isDirectory:&v35];

    if (v16) {
      BOOL v17 = v35 == 0;
    }
    else {
      BOOL v17 = 0;
    }
    if (v17)
    {
      id v19 = objc_alloc_init(PLValidatedExternalResource);
      [(PLValidatedExternalResource *)v19 setVersion:v8];
      -[PLValidatedExternalResource setRecipeID:](v19, "setRecipeID:", [v13 recipeID]);
      unint64_t v31 = +[PLUniformTypeIdentifier utiWithIdentifier:v14];
      [(PLValidatedExternalResource *)v19 setUniformTypeIdentifier:v31];

      [(PLValidatedExternalResource *)v19 setResourceType:v9];
      __int16 v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
      [(PLValidatedExternalResource *)v19 setFileURL:v32];

      double v33 = [(PLValidatedExternalResource *)v19 fileURL];
      -[PLValidatedExternalResource setDataLength:](v19, "setDataLength:", [a1 _getURLDataLength:v33]);

      uint64_t v25 = [MEMORY[0x1E4F8B9B8] successWithResult:v19];
    }
    else
    {
      if (v35) {
        id v18 = @"is directory";
      }
      else {
        id v18 = @"does not exist";
      }
      id v19 = [NSString stringWithFormat:@"file %@ at path: %@", v18, v12];
      BOOL v20 = (void *)MEMORY[0x1E4F8B9B8];
      CFDictionaryRef v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F8C500];
      uint64_t v38 = *MEMORY[0x1E4F28228];
      v39[0] = v19;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      unint64_t v24 = [v21 errorWithDomain:v22 code:47001 userInfo:v23];
      uint64_t v25 = [v20 failureWithError:v24];
    }
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F8C500];
    uint64_t v36 = *MEMORY[0x1E4F28228];
    id v37 = @"nil path";
    id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    uint64_t v30 = [v27 errorWithDomain:v28 code:47006 userInfo:v29];
    uint64_t v25 = [v26 failureWithError:v30];
  }
  return v25;
}

+ (id)_validatedExternalResourceForComputeResourceWithRecipe:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PLValidatedExternalResource);
  [(PLValidatedExternalResource *)v4 setVersion:3];
  uint64_t v5 = [v3 recipeID];

  [(PLValidatedExternalResource *)v4 setRecipeID:v5];
  BOOL v6 = [(id)*MEMORY[0x1E4F44378] identifier];
  id v7 = +[PLUniformTypeIdentifier utiWithIdentifier:v6];
  [(PLValidatedExternalResource *)v4 setUniformTypeIdentifier:v7];

  [(PLValidatedExternalResource *)v4 setResourceType:14];
  return v4;
}

+ (id)_validatedExternalResourceForComputeResourceAtPath:(id)a3 recipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ((char v14 = 0,
         [MEMORY[0x1E4F28CB8] defaultManager],
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         int v9 = [v8 fileExistsAtPath:v6 isDirectory:&v14],
         v8,
         v9)
      ? (BOOL v10 = v14 == 0)
      : (BOOL v10 = 0),
        v10))
  {
    id v11 = [a1 _validatedExternalResourceForComputeResourceWithRecipe:v7];
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    [v11 setFileURL:v12];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_validatedExternalResourceIfPresentForAudioOrUnknownAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLResourceInstaller.m", 99, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v6 = [v5 uniformTypeIdentifier];
  uint64_t v7 = [v5 mainFileURL];
  uint64_t v8 = (void *)v7;
  int v9 = 0;
  if (v6 && v7)
  {
    if ([a1 _getURLDataLength:v7])
    {
      BOOL v10 = +[PLUniformTypeIdentifier utiWithIdentifier:v6];
      int v9 = objc_alloc_init(PLValidatedExternalResource);
      [(PLValidatedExternalResource *)v9 setVersion:0];
      [(PLValidatedExternalResource *)v9 setRecipeID:0];
      [(PLValidatedExternalResource *)v9 setFileURL:v8];
      [(PLValidatedExternalResource *)v9 setUniformTypeIdentifier:v10];
      if ([v10 conformsToAudio])
      {
        id v11 = v9;
        uint64_t v12 = 2;
      }
      else
      {
        id v13 = PLMigrationGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          char v14 = [v5 uuid];
          *(_DWORD *)buf = 138543874;
          id v18 = v14;
          __int16 v19 = 2048;
          uint64_t v20 = (int)[v5 kind];
          __int16 v21 = 2114;
          uint64_t v22 = v8;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Inserting resource with PLResourceTypeUnknown on asset uuid: %{public}@, kind: %ld, from URL: %{public}@", buf, 0x20u);
        }
        id v11 = v9;
        uint64_t v12 = 31;
      }
      [(PLValidatedExternalResource *)v11 setResourceType:v12];
    }
    else
    {
      int v9 = 0;
    }
  }

  return v9;
}

+ (id)_validatedExternalResourceFromSupplementalFileURL:(id)a3 withUTI:(id)a4 ptpTrashedState:(int64_t)a5 index:(id)a6 asset:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  char v14 = 0;
  if (v11 && a4)
  {
    id v15 = +[PLUniformTypeIdentifier utiWithIdentifier:a4];
    if ([v15 conformsToImage])
    {
      int v16 = [v11 path];
      uint64_t v17 = [v13 width];
      uint64_t v18 = [v13 height];
      LOWORD(v25) = [v13 kind];
      char v14 = [a1 generateValidatedExternalImageResourceOfType:4 forFilePath:v16 requireFileToBePresent:1 version:0 basedOnFullSizeWidth:v17 andHeight:v18 recipe:0 assetKind:v25 error:0];
    }
    else
    {
      __int16 v19 = (void *)MEMORY[0x1E4F8B908];
      uint64_t v20 = [v11 path];
      uint64_t v21 = [v19 fileLengthForFilePath:v20];

      if (v21 < 1)
      {
        char v14 = 0;
      }
      else
      {
        char v14 = objc_alloc_init(PLValidatedExternalResource);
        [(PLValidatedExternalResource *)v14 setVersion:0];
        [(PLValidatedExternalResource *)v14 setRecipeID:0];
        [(PLValidatedExternalResource *)v14 setFileURL:v11];
        [(PLValidatedExternalResource *)v14 setDataLength:v21];
        [(PLValidatedExternalResource *)v14 setUniformTypeIdentifier:v15];
        if ([v15 conformsToAudio])
        {
          uint64_t v22 = v14;
          uint64_t v23 = 2;
        }
        else
        {
          uint64_t v22 = v14;
          uint64_t v23 = 5;
        }
        [(PLValidatedExternalResource *)v22 setResourceType:v23];
      }
    }
    [(PLValidatedExternalResource *)v14 setSidecarIndex:v12];
  }
  return v14;
}

+ (unint64_t)_getURLDataLength:(id)a3
{
  unint64_t result = (unint64_t)a3;
  if (a3)
  {
    id v5 = 0;
    int v4 = [a3 getResourceValue:&v5 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    unint64_t result = 0;
    if (v4) {
      return [v5 longLongValue];
    }
  }
  return result;
}

@end