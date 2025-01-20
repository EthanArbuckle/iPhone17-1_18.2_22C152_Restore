@interface PLPrimaryResourceDataStoreImageRecipe
+ (CGSize)scaleOriginalSize:(CGSize)result toLongSideTarget:(double)a4;
+ (CGSize)scaleOriginalSize:(CGSize)result toShortSideTarget:(double)a4 maxLongSideLength:(double)a5;
- (BOOL)_storeResourceWithType:(unsigned int)a3 version:(unsigned int)a4 asset:(id)a5 destURL:(id)a6 error:(id *)a7;
- (BOOL)colorSpaceIsNativeForDisplay;
- (BOOL)isMarkedFullSize;
- (PLPrimaryResourceDataStoreImageRecipe)initWithRecipeID:(unsigned int)a3;
- (id)_mediaConversionServiceOptionsForAsset:(id)a3 url:(id)a4 conversionServiceOptions:(id)a5 adjustmentData:(id)a6 largeAdjustmentData:(id)a7 isHighPriority:(BOOL)a8 reason:(id)a9;
- (id)_resourceGenerationAffectsRecipesForLibraryID:(id)a3;
- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4;
- (id)codecFourCharCodeName;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (id)description;
- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4;
- (id)expectedSizeFromWidth:(int64_t)a3 height:(int64_t)a4;
- (id)maxPixelCountForAssetWidth:(int64_t)a3 height:(int64_t)a4;
- (id)supportedVersionsForLocalResourceGeneration;
- (id)uti;
- (unsigned)recipeID;
- (void)_generateAndStoreUsingMediaConversionServicesForAsset:(id)a3 version:(unsigned int)a4 conversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 isHighPriority:(BOOL)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)generateAndStoreForAssetWithPriority:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8 progress:(id *)a9 completion:(id)a10;
- (void)setRecipeID:(unsigned int)a3;
@end

@implementation PLPrimaryResourceDataStoreImageRecipe

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

- (id)expectedSizeFromWidth:(int64_t)a3 height:(int64_t)a4
{
  if ([(PLPrimaryResourceDataStoreImageRecipe *)self recipeID] == 65747)
  {
    PFScaleFactorForMaximumPixelCount();
    v4 = DCIM_NSValueFromCGSize();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)generateAndStoreForAssetWithPriority:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 isHighPriority:(BOOL)a7 reason:(id)a8 progress:(id *)a9 completion:(id)a10
{
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  signed int recipeID = self->_recipeID;
  if (recipeID <= 65748)
  {
    if (recipeID == 65737)
    {
      uint64_t v11 = [v6 pathForNonAdjustedFullsizeImageFile];
    }
    else
    {
      v10 = 0;
      if (recipeID != 65741) {
        goto LABEL_18;
      }
      if (a3 == 2) {
        [v6 pathForAdjustedLargeThumbnailFile];
      }
      else {
      uint64_t v11 = [v6 pathForNonAdjustedLargeThumbnailFile];
      }
    }
  }
  else if (recipeID == 65749)
  {
    uint64_t v11 = [v6 pathForLocalVideoKeyFrame];
  }
  else if (recipeID == 65938)
  {
    uint64_t v11 = [v6 pathForAdjustedFullsizeImageFile];
  }
  else
  {
    v10 = 0;
    if (recipeID != 66137) {
      goto LABEL_18;
    }
    uint64_t v11 = [v6 pathForAlchemistImage];
  }
  v8 = (void *)v11;
  if (v11)
  {
    v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
  }
  else
  {
    v10 = 0;
  }
LABEL_18:

  return v10;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLPrimaryResourceDataStoreImageRecipe *)self supportedVersionsForLocalResourceGeneration];
  v8 = [NSNumber numberWithUnsignedInt:v4];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    signed int recipeID = self->_recipeID;
    if (recipeID <= 65746)
    {
      if (recipeID != 65737)
      {
        if (recipeID != 65741 || [v6 bundleScope] != 3) {
          goto LABEL_60;
        }
        if ([v6 kind])
        {
          if ([v6 kind] == 1)
          {
            v12 = [v6 syndicationOriginalResource];
            int v13 = [v12 isLocallyAvailable];

            if (v13)
            {
              v14 = [v6 syndicationOriginalResource];
              v15 = @"Video";
LABEL_22:
              [v10 setObject:v14 forKeyedSubscript:v15];
LABEL_59:

              goto LABEL_60;
            }
            v14 = PLSyndicationGetLog();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_59;
            }
            v19 = [v6 uuid];
            *(_DWORD *)buf = 138543362;
            v56 = v19;
            v28 = "[resource.recipe] syndication video (%{public}@) missing local video resource for derivative generation";
            goto LABEL_56;
          }
LABEL_60:
          if ([v10 count]) {
            v43 = v10;
          }
          else {
            v43 = 0;
          }
          id v16 = v43;

          goto LABEL_64;
        }
        int v32 = [v6 isPhotoIris];
        v33 = [v6 syndicationOriginalResource];
        int v34 = [v33 isLocallyAvailable];
        int v35 = v34;
        if (v32)
        {
          if (v34)
          {
            v36 = [v6 syndicationOriginalVideoComplementResource];
            int v37 = [v36 isLocallyAvailable];

            if (v37)
            {
              v38 = [v6 syndicationOriginalResource];
              [v10 setObject:v38 forKeyedSubscript:@"Image"];

              v14 = [v6 syndicationOriginalVideoComplementResource];
              v15 = @"VideoComplement";
              goto LABEL_22;
            }
          }
          else
          {
          }
          v39 = [v6 syndicationOriginalResource];
          char v40 = [v39 isLocallyAvailable];

          if (v40)
          {
            v41 = [v6 syndicationOriginalVideoComplementResource];
            char v42 = [v41 isLocallyAvailable];

            if (v42) {
              goto LABEL_60;
            }
            v14 = PLSyndicationGetLog();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_59;
            }
            v19 = [v6 uuid];
            *(_DWORD *)buf = 138543362;
            v56 = v19;
            v28 = "[resource.recipe] syndication live photo (%{public}@) missing local video complement resource for deri"
                  "vative generation";
          }
          else
          {
            v14 = PLSyndicationGetLog();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_59;
            }
            v19 = [v6 uuid];
            *(_DWORD *)buf = 138543362;
            v56 = v19;
            v28 = "[resource.recipe] syndication live photo (%{public}@) missing local image resource for derivative generation";
          }
LABEL_56:
          v29 = v14;
          os_log_type_t v30 = OS_LOG_TYPE_ERROR;
          uint32_t v31 = 12;
          goto LABEL_57;
        }

        if (!v35)
        {
          v14 = PLSyndicationGetLog();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_59;
          }
          v19 = [v6 uuid];
          *(_DWORD *)buf = 138543362;
          v56 = v19;
          v28 = "[resource.recipe] syndication photo (%{public}@) missing local image resource for derivative generation";
          goto LABEL_56;
        }
        v14 = [v6 syndicationOriginalResource];
LABEL_21:
        v15 = @"Image";
        goto LABEL_22;
      }
      int v17 = [v6 isRAWPlusJPEGWithRAWOnTop];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke;
      v52[3] = &__block_descriptor_40_e28_B16__0__PLInternalResource_8l;
      if (v17) {
        int v18 = 4;
      }
      else {
        int v18 = 0;
      }
      int v53 = v18;
      int v54 = v4;
      v14 = [v6 firstPersistedResourceMatching:v52];
      v19 = PLBackendGetLog();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v14)
      {
        if (v20)
        {
          *(_DWORD *)buf = 138412290;
          v56 = v14;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEBUG, "Resource generation selected image resource for primary image recipe: %@", buf, 0xCu);
        }

        goto LABEL_21;
      }
      if (v20)
      {
        *(_WORD *)buf = 0;
        v28 = "Resource generation failed to find image for primary image recipe";
        v29 = v19;
        os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
        uint32_t v31 = 2;
LABEL_57:
        _os_log_impl(&dword_19B3C7000, v29, v30, v28, buf, v31);
      }
LABEL_58:

      goto LABEL_59;
    }
    if (recipeID != 65747)
    {
      if (recipeID == 65938) {
        [(PLResourceRecipe *)self populateAdjustedRecipeIngredients:v10 asset:v6 version:v4];
      }
      goto LABEL_60;
    }
    v14 = -[PLPrimaryResourceDataStoreImageRecipe maxPixelCountForAssetWidth:height:](self, "maxPixelCountForAssetWidth:height:", [v6 width], objc_msgSend(v6, "height"));
    if (!v14) {
      goto LABEL_59;
    }
    if ([v6 isVideo]
      && [v6 isVideoKeyFrameSet]
      && [v6 isLocalVideoKeyFrameValid])
    {
      v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Media analysis video detected, choosing local video key frame for 1K generation", buf, 2u);
      }

      v22 = [v6 localVideoKeyFrameResource];
      if (([v22 isLocallyAvailable] & 1) == 0)
      {

        v19 = 0;
        goto LABEL_58;
      }
      v19 = [v6 localVideoKeyFrameResource];
    }
    else
    {
      v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Choosing source image for 1K generation", buf, 2u);
      }

      v24 = [v6 resourcesSortedByQuality];
      v25 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      v47 = __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke_101;
      v48 = &unk_1E5862650;
      v49 = v14;
      id v50 = v6;
      v51 = self;
      v26 = [v25 predicateWithBlock:&v45];
      v27 = objc_msgSend(v24, "filteredArrayUsingPredicate:", v26, v45, v46, v47, v48);
      v19 = [v27 firstObject];

      v22 = v49;
    }

    if (v19) {
      [v10 setObject:v19 forKeyedSubscript:@"Image"];
    }
    goto LABEL_58;
  }
  id v16 = 0;
LABEL_64:

  return v16;
}

uint64_t __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isLocallyAvailable]
    && [v3 resourceType] == *(_DWORD *)(a1 + 32)
    && [v3 version] == *(_DWORD *)(a1 + 36))
  {
    uint64_t v4 = [v3 isDerivative] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL __71__PLPrimaryResourceDataStoreImageRecipe_chooseIngredientsFrom_version___block_invoke_101(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 unorientedWidth];
  uint64_t v5 = [v3 unorientedHeight];
  uint64_t v6 = [a1[4] longLongValue];
  if ([a1[5] hasAdjustments]) {
    int v7 = 2;
  }
  else {
    int v7 = 0;
  }
  BOOL v8 = ![a1[5] isRAWPlusJPEGWithRAWOnTop]
    || ([v3 isDerivative] & 1) != 0
    || [v3 resourceType] != 0;
  if ((int)[v3 localAvailability] < 1
    || [v3 resourceType]
    || [v3 version] != v7)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v9 = v5 * v4;
    int v10 = [v3 recipeID];
    BOOL v12 = v10 != [a1[6] recipeID] && v9 > v6 && v8;
  }

  return v12;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  unsigned int recipeID = self->_recipeID;
  switch(recipeID)
  {
    case 0x10192u:
      return &unk_1EEBF1490;
    case 0x100CDu:
      return &unk_1EEBF14A8;
    case 0x100C9u:
      return &unk_1EEBF1478;
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)maxPixelCountForAssetWidth:(int64_t)a3 height:(int64_t)a4
{
  uint64_t v5 = 0;
  signed int recipeID = self->_recipeID;
  if (recipeID > 65748)
  {
    if (recipeID != 65749 && recipeID != 65944 && recipeID != 65938) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  switch(recipeID)
  {
    case 65737:
LABEL_14:
      uint64_t v5 = [NSNumber numberWithLongLong:a4 * a3];
      break;
    case 65741:
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F59940], "maxPixelSizeForResourceType:", 4, a4));
      break;
    case 65747:
      uint64_t v5 = &unk_1EEBECE28;
      break;
  }
LABEL_16:
  return v5;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int recipeID = self->_recipeID;
  if (recipeID - 65937 <= 0xE && ((1 << (recipeID + 111)) & 0x4AD3) != 0) {
    goto LABEL_8;
  }
  if (recipeID - 65737 <= 0xC)
  {
    if (((1 << (recipeID + 55)) & 0x1455) != 0)
    {
LABEL_8:
      id v10 = v6;
LABEL_9:
      uint64_t v11 = v10;
      goto LABEL_10;
    }
    if (recipeID == 65745)
    {
      id v10 = +[PLColorSpace commonColorSpace_sRGB];
      goto LABEL_9;
    }
  }
  if (recipeID == 66137) {
    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (id)codecFourCharCodeName
{
  return 0;
}

- (BOOL)isMarkedFullSize
{
  BOOL result = 0;
  signed int recipeID = self->_recipeID;
  if (recipeID <= 65937)
  {
    BOOL v5 = recipeID == 65737;
    unsigned __int16 v6 = 213;
  }
  else
  {
    BOOL v5 = recipeID == 65938 || recipeID == 66137;
    unsigned __int16 v6 = 408;
  }
  int v7 = v6 | 0x10000;
  if (v5 || recipeID == v7) {
    return 1;
  }
  return result;
}

- (BOOL)colorSpaceIsNativeForDisplay
{
  return 1;
}

- (id)uti
{
  return +[PLUniformTypeIdentifier jpegUniformTypeIdentifier];
}

- (PLPrimaryResourceDataStoreImageRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreImageRecipe;
  BOOL v5 = [(PLPrimaryResourceDataStoreImageRecipe *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() classFromRecipeID:v3];
    if (v6 != objc_opt_class())
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:v5 file:@"PLPrimaryResourceDataStoreImageRecipe.m" lineNumber:494 description:@"wrong recipe class passed to recipe initializer."];
    }
    v5->_signed int recipeID = v3;
  }
  return v5;
}

- (void)_generateAndStoreUsingMediaConversionServicesForAsset:(id)a3 version:(unsigned int)a4 conversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 isHighPriority:(BOOL)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  BOOL v73 = a8;
  uint64_t v14 = *(void *)&a4;
  v112[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v81 = a5;
  id v78 = a6;
  id v17 = a7;
  id v86 = a10;
  id v77 = a11;
  int v18 = [v16 assetID];
  v84 = [v18 libraryID];

  v19 = [(PLPrimaryResourceDataStoreImageRecipe *)self supportedVersionsForLocalResourceGeneration];
  BOOL v20 = [NSNumber numberWithUnsignedInt:v14];
  LODWORD(a5) = [v19 containsObject:v20];

  if (!a5)
  {
    id v24 = v17;
    v76 = 0;
    v85 = 0;
    v88 = 0;
    v89 = 0;
    uint64_t v25 = 47004;
LABEL_11:
    v26 = [(PLResourceRecipe *)self recipeErrorWithCode:v25 version:v14 underlyingError:0 debugDescription:0];
    uint64_t v23 = 0;
    uint64_t v22 = 0;
    int v27 = 0;
    goto LABEL_12;
  }
  v21 = [(PLPrimaryResourceDataStoreImageRecipe *)self chooseIngredientsFrom:v16 version:v14];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"Image"];
  v89 = [v21 objectForKeyedSubscript:@"VideoComplement"];
  uint64_t v23 = [v21 objectForKeyedSubscript:@"Video"];
  if (v14 == 2 || v14 == 3 && [v16 hasAdjustments])
  {
    v88 = [v21 objectForKeyedSubscript:@"Adjustment"];
    v85 = [v21 objectForKeyedSubscript:@"LargeAdjustment"];
  }
  else
  {
    v85 = 0;
    v88 = 0;
  }
  v76 = v21;
  id v24 = v17;
  if (!(v22 | v23))
  {
    uint64_t v25 = 47003;
    goto LABEL_11;
  }
  v26 = 0;
  int v27 = 1;
LABEL_12:
  uint64_t v28 = [(PLPrimaryResourceDataStoreImageRecipe *)self uti];
  v80 = (void *)v22;
  v29 = [(id)v22 dataStoreKey];
  os_log_type_t v30 = [v16 assetID];
  uint64_t v90 = [v29 fileURLForAssetID:v30];

  uint32_t v31 = [v89 dataStoreKey];
  int v32 = [v16 assetID];
  v82 = [v31 fileURLForAssetID:v32];

  v79 = (void *)v23;
  v33 = [(id)v23 dataStoreKey];
  int v34 = [v16 assetID];
  uint64_t v35 = [v33 fileURLForAssetID:v34];

  uint64_t v36 = [(PLPrimaryResourceDataStoreImageRecipe *)self expectedFileURLForVersion:v14 asset:v16];
  v75 = (void *)v28;
  v83 = (void *)v36;
  if (!v28 || !(v90 | v35) || !v36)
  {
    uint64_t v37 = [(PLResourceRecipe *)self recipeErrorWithCode:47006 version:v14 underlyingError:0 debugDescription:0];

    int v27 = 0;
    v26 = (void *)v37;
  }
  int v38 = [v16 hasAdjustments];
  v87 = (void *)v35;
  if (v14 == 2)
  {
    if (v38)
    {
      v39 = [NSNumber numberWithUnsignedInt:self->_recipeID];
      int v40 = [&unk_1EEBF1460 containsObject:v39];

      if (v40)
      {
        if (!v88)
        {
          uint64_t v41 = [(PLResourceRecipe *)self recipeErrorWithCode:47015 version:2 underlyingError:0 debugDescription:0];

          v26 = (void *)v41;
          char v42 = v81;
          if (!v81) {
            goto LABEL_28;
          }
          goto LABEL_29;
        }
      }
    }
  }
  char v42 = v81;
  if (!v81)
  {
LABEL_28:
    id v50 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F8C500];
    uint64_t v111 = *MEMORY[0x1E4F28568];
    v112[0] = @"conversionClient is nil";
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:&v111 count:1];
    uint64_t v53 = [v50 errorWithDomain:v51 code:47001 userInfo:v52];

    v26 = (void *)v53;
    goto LABEL_29;
  }
  if (v27)
  {
    v43 = [v16 managedObjectContext];
    v44 = v24;
    uint64_t v45 = [(PLPrimaryResourceDataStoreImageRecipe *)self _mediaConversionServiceOptionsForAsset:v16 url:v90 conversionServiceOptions:v24 adjustmentData:v88 largeAdjustmentData:v85 isHighPriority:v73 reason:v86];
    uint64_t v46 = v45;
    if (!v45)
    {
      uint64_t v57 = PLBackendGetLog();
      v56 = v76;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Failed to run the conversion service because options were nil.", buf, 2u);
      }

      uint64_t v58 = [(PLResourceRecipe *)self recipeErrorWithCode:47007 version:v14 underlyingError:0 debugDescription:0];

      uint64_t v59 = [MEMORY[0x1E4F1CAD0] set];
      v60 = [MEMORY[0x1E4F1CAA0] orderedSet];
      int v54 = v77;
      (*((void (**)(id, void, uint64_t, uint64_t, void *, void))v77 + 2))(v77, 0, v58, v59, v60, 0);

      v61 = (void *)v59;
      v26 = (void *)v58;
      v55 = v78;
      goto LABEL_42;
    }
    v71 = v43;
    v47 = [v45 objectForKeyedSubscript:*MEMORY[0x1E4F74A28]];
    int v48 = [v47 BOOLValue];

    v49 = (void *)v90;
    int v74 = v48;
    if (!v48 || v90)
    {
      if (v87)
      {
        v43 = v71;
        if (!v90)
        {
          v103[0] = MEMORY[0x1E4F143A8];
          v103[1] = 3221225472;
          v103[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke;
          v103[3] = &unk_1E58625D8;
          id v104 = v16;
          id v109 = v77;
          v105 = self;
          int v54 = v77;
          int v110 = v14;
          id v106 = v71;
          id v107 = v83;
          id v108 = v84;
          v55 = v78;
          [v78 extractStillImageFromVideoAtSourceURL:v87 toDestinationURL:v107 options:v46 completionHandler:v103];

          uint64_t v90 = 0;
          v61 = v104;
LABEL_41:
          v56 = v76;
LABEL_42:

          goto LABEL_43;
        }
LABEL_37:
        v72 = v44;
        v62 = objc_opt_new();
        uint64_t v90 = (uint64_t)v49;
        uint64_t v69 = *MEMORY[0x1E4F74910];
        objc_msgSend(v62, "setResourceURL:forRole:", v49);
        if (v74 && v82) {
          [v62 setResourceURL:v82 forRole:*MEMORY[0x1E4F74918]];
        }
        [v16 pathManager];
        v63 = v70 = v62;
        v64 = [v83 pathExtension];
        v65 = [v63 temporaryRenderContentURLForInternalRendersWithExtension:v64];

        v66 = objc_opt_new();
        [v66 setResourceURL:v65 forRole:v69 deleteOnDeallocation:1];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2;
        v92[3] = &unk_1E5862628;
        id v93 = v43;
        id v100 = v77;
        int v101 = v14;
        v94 = self;
        id v95 = v66;
        int v54 = v77;
        id v96 = v83;
        id v97 = v65;
        id v98 = v16;
        id v99 = v84;
        char v102 = v74;
        id v67 = v65;
        id v68 = v66;
        char v42 = v81;
        [v81 convertImageAtSourceURLCollection:v70 toDestinationURLCollection:v68 options:v46 completionHandler:v92];

        v61 = v70;
        v55 = v78;
        v44 = v72;
        goto LABEL_41;
      }
    }
    else
    {
      v49 = v87;
      v87 = 0;
    }
    v43 = v71;
    goto LABEL_37;
  }
LABEL_29:
  v43 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v46 = [MEMORY[0x1E4F1CAA0] orderedSet];
  int v54 = v77;
  (*((void (**)(id, void, void *, void *, void *, void))v77 + 2))(v77, 0, v26, v43, v46, 0);
  v55 = v78;
  v44 = v24;
  v56 = v76;
LABEL_43:
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  int v7 = [*(id *)(a1 + 32) managedObjectContext];

  if (v7)
  {
    BOOL v8 = +[PLConcurrencyLimiter sharedLimiter];
    uint64_t v9 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_64;
    v17[3] = &unk_1E58625B0;
    uint64_t v24 = a2;
    int v25 = *(_DWORD *)(a1 + 80);
    int8x16_t v16 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v16.i64[0];
    int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    id v21 = v6;
    id v23 = *(id *)(a1 + 72);
    id v22 = *(id *)(a1 + 48);
    [v8 asyncPerformOnContext:v9 identifyingBlock:0 block:v17];
  }
  else
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "asset managed object context is nil, cannot complete storing generated resource", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 72);
    int v13 = [*(id *)(a1 + 40) recipeErrorWithCode:47001 version:*(unsigned int *)(a1 + 80) underlyingError:0 debugDescription:@"asset managed object context is nil"];
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
    v15 = [MEMORY[0x1E4F1CAA0] orderedSet];
    (*(void (**)(uint64_t, void, void *, void *, void *, void))(v12 + 16))(v12, 0, v13, v14, v15, 0);
  }
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 32))
  {
    uint64_t v9 = +[PLConcurrencyLimiter sharedLimiter];
    uint64_t v10 = *(void *)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_69;
    v18[3] = &unk_1E5862600;
    id v19 = *(id *)(a1 + 48);
    uint64_t v29 = a2;
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 40);
    id v20 = v11;
    uint64_t v21 = v12;
    int v30 = *(_DWORD *)(a1 + 96);
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 64);
    id v24 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 80);
    char v31 = *(unsigned char *)(a1 + 100);
    id v26 = v7;
    id v28 = *(id *)(a1 + 88);
    id v27 = *(id *)(a1 + 32);
    [v9 asyncPerformOnContext:v10 identifyingBlock:0 block:v18];

    int v13 = v19;
  }
  else
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "asset managed object context is nil, cannot complete storing generated resource", buf, 2u);
    }

    uint64_t v15 = *(void *)(a1 + 88);
    int v13 = [*(id *)(a1 + 40) recipeErrorWithCode:47001 version:*(unsigned int *)(a1 + 96) underlyingError:0 debugDescription:@"asset managed object context is nil"];
    int8x16_t v16 = [MEMORY[0x1E4F1CAD0] set];
    id v17 = [MEMORY[0x1E4F1CAA0] orderedSet];
    (*(void (**)(uint64_t, void, void *, void *, void *, void))(v15 + 16))(v15, 0, v13, v16, v17, 0);
  }
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_69(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  if (*(void *)(a1 + 112) == 1)
  {
    uint64_t v4 = [*(id *)(a1 + 56) path];
    BOOL v5 = [v4 stringByDeletingLastPathComponent];

    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v63 = 0;
    char v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v63];
    id v8 = v63;

    if ((v7 & 1) == 0)
    {
      uint64_t v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v65 = v5;
        __int16 v66 = 2112;
        id v67 = v8;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset finished but failed to ensure dest dir exists %@ with error: %@", buf, 0x16u);
      }

      id v17 = [*(id *)(a1 + 48) recipeErrorWithCode:47007 version:*(unsigned int *)(a1 + 120) underlyingError:v8 debugDescription:0];

      goto LABEL_38;
    }

    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    id v62 = 0;
    char v12 = [v9 moveItemAtURL:v10 toURL:v11 error:&v62];
    id v13 = v62;

    if (v12)
    {
      uint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = [*(id *)(a1 + 64) path];
        int8x16_t v16 = [*(id *)(a1 + 56) path];
        *(_DWORD *)buf = 138412546;
        id v65 = v15;
        __int16 v66 = 2112;
        id v67 = v16;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "_generateAndStoreUsingMediaConversionServicesForAsset moved render from temporary path %@ to dest path %@", buf, 0x16u);
      }
      id v17 = 0;
LABEL_29:
      v43 = v17;
      uint64_t v44 = *(unsigned int *)(a1 + 120);
      uint64_t v45 = *(void *)(a1 + 72);
      uint64_t v46 = *(void **)(a1 + 48);
      uint64_t v47 = *(void *)(a1 + 56);
      id v58 = v17;
      int v48 = [v46 _storeResourceWithType:0 version:v44 asset:v45 destURL:v47 error:&v58];
      id v17 = v58;

      if (v48)
      {
        [v2 addObject:*(void *)(a1 + 48)];
        v49 = [*(id *)(a1 + 48) _resourceGenerationAffectsRecipesForLibraryID:*(void *)(a1 + 80)];
        [v3 unionOrderedSet:v49];

        if (*(unsigned char *)(a1 + 124))
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v50 = *MEMORY[0x1E4F74938];
          uint64_t v51 = [*(id *)(a1 + 88) objectForKeyedSubscript:*MEMORY[0x1E4F74938]];
          v52 = (void *)v51;
          if (v50 && v51) {
            [v20 setObject:v51 forKey:v50];
          }

          uint64_t v53 = *MEMORY[0x1E4F74940];
          uint64_t v54 = [*(id *)(a1 + 88) objectForKeyedSubscript:*MEMORY[0x1E4F74940]];
          v55 = (void *)v54;
          if (v53 && v54) {
            [v20 setObject:v54 forKey:v53];
          }
        }
        else
        {
          id v20 = 0;
        }
      }
      else
      {
        v56 = PLBackendGetLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset store resource failed", buf, 2u);
        }

        uint64_t v57 = [*(id *)(a1 + 48) recipeErrorWithCode:47007 version:*(unsigned int *)(a1 + 120) underlyingError:0 debugDescription:@"Store failed"];

        id v20 = 0;
        id v17 = (id)v57;
      }
      goto LABEL_43;
    }
    int v22 = PLIsErrorOrUnderlyingErrorFileExists();
    if (!v22)
    {
      int v34 = PLBackendGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [*(id *)(a1 + 64) path];
        uint64_t v36 = [*(id *)(a1 + 56) path];
        *(_DWORD *)buf = 138412802;
        id v65 = v35;
        __int16 v66 = 2112;
        id v67 = v36;
        __int16 v68 = 2112;
        id v69 = v13;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset finished but failed to move render from temporary path %@ to dest path %@ with error: %@", buf, 0x20u);
      }
      id v17 = [*(id *)(a1 + 48) recipeErrorWithCode:47007 version:*(unsigned int *)(a1 + 120) underlyingError:v13 debugDescription:0];
LABEL_24:
      uint64_t v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v38 = *(void *)(a1 + 64);
      id v59 = 0;
      char v39 = [v37 removeItemAtURL:v38 error:&v59];
      id v40 = v59;

      if ((v39 & 1) == 0)
      {
        uint64_t v41 = PLBackendGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          char v42 = [*(id *)(a1 + 64) path];
          *(_DWORD *)buf = 138412546;
          id v65 = v42;
          __int16 v66 = 2112;
          id v67 = v13;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "_generateAndStoreUsingMediaConversionServicesForAsset failed to remove file at temporary path %@ with error: %@", buf, 0x16u);
        }
      }

      if (v22) {
        goto LABEL_29;
      }
LABEL_38:
      id v20 = 0;
      goto LABEL_43;
    }
    id v23 = *(void **)(a1 + 56);
    id v61 = 0;
    uint64_t v24 = *MEMORY[0x1E4F1C5F8];
    id v60 = 0;
    char v25 = [v23 getResourceValue:&v61 forKey:v24 error:&v60];
    id v26 = v61;
    id v27 = v60;
    id v28 = PLBackendGetLog();
    uint64_t v29 = v28;
    if (v25)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v30 = [*(id *)(a1 + 56) path];
        *(_DWORD *)buf = 138412546;
        id v65 = v30;
        __int16 v66 = 2112;
        id v67 = v27;
        char v31 = "_generateAndStoreUsingMediaConversionServicesForAsset finished but file already exists at dest path %@, er"
              "ror retrieving file size: %@";
        int v32 = v29;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
LABEL_22:
        _os_log_impl(&dword_19B3C7000, v32, v33, v31, buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      int v30 = [*(id *)(a1 + 56) path];
      *(_DWORD *)buf = 138543618;
      id v65 = v26;
      __int16 v66 = 2112;
      id v67 = v30;
      char v31 = "_generateAndStoreUsingMediaConversionServicesForAsset finished but file of size %{public}@ already exists at dest path %@";
      int v32 = v29;
      os_log_type_t v33 = OS_LOG_TYPE_INFO;
      goto LABEL_22;
    }

    id v17 = 0;
    goto LABEL_24;
  }
  int8x16_t v18 = PLBackendGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    id v65 = v19;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "conversion job failed with error: %@", buf, 0xCu);
  }

  id v17 = [*(id *)(a1 + 48) recipeErrorWithCode:47007 version:*(unsigned int *)(a1 + 120) underlyingError:*(void *)(a1 + 40) debugDescription:0];
  id v20 = 0;
LABEL_43:
  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
}

void __209__PLPrimaryResourceDataStoreImageRecipe__generateAndStoreUsingMediaConversionServicesForAsset_version_conversionClient_videoConversionClient_conversionServiceOptions_isHighPriority_progress_reason_completion___block_invoke_64(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 96);
  if (*(void *)(a1 + 88) == 1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = 0;
    int v8 = [v4 _storeResourceWithType:0 version:v5 asset:v6 destURL:v7 error:&v11];
    id v9 = v11;
    if (v8)
    {
      [v2 addObject:*(void *)(a1 + 32)];
      uint64_t v10 = [*(id *)(a1 + 32) _resourceGenerationAffectsRecipesForLibraryID:*(void *)(a1 + 56)];
      [v3 unionOrderedSet:v10];
    }
  }
  else
  {
    id v9 = [v4 recipeErrorWithCode:47007 version:v5 underlyingError:*(void *)(a1 + 64) debugDescription:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (BOOL)_storeResourceWithType:(unsigned int)a3 version:(unsigned int)a4 asset:(id)a5 destURL:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = [a6 path];
  uint64_t v14 = [v12 width];
  uint64_t v15 = [v12 height];
  LOWORD(v27) = [v12 kind];
  int8x16_t v16 = +[PLResourceInstaller generateValidatedExternalImageResourceOfType:v10 forFilePath:v13 requireFileToBePresent:1 version:v9 basedOnFullSizeWidth:v14 andHeight:v15 recipe:self assetKind:v27 error:0];

  if (!v16)
  {
    id v19 = [(PLResourceRecipe *)self recipeErrorWithCode:47010 version:v9 underlyingError:0 debugDescription:0];
    LOBYTE(v20) = 0;
    if (!a7) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ([v12 bundleScope] == 3)
  {
    uint64_t v17 = +[PLValidatedExternalResource resourceWithExternalResource:v16];

    uint64_t v18 = 3;
    int8x16_t v16 = (void *)v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v21 = [v12 assetID];
  int v22 = [v21 libraryID];
  id v23 = PLDataStoreForClassIDAndLibraryID(v18, v22);

  id v28 = 0;
  id v29 = 0;
  int v20 = [v23 storeExternalResource:v16 forAsset:v12 options:0 error:&v29 resultingResource:&v28];
  id v24 = v29;
  id v25 = v28;
  if (v20)
  {
    [v12 recalculateImageRequestHints];
    id v19 = 0;
  }
  else
  {
    id v19 = [(PLResourceRecipe *)self recipeErrorWithCode:47009 version:v9 underlyingError:v24 debugDescription:0];
  }

  if (a7) {
LABEL_11:
  }
    *a7 = v19;
LABEL_12:

  return v20;
}

- (id)_mediaConversionServiceOptionsForAsset:(id)a3 url:(id)a4 conversionServiceOptions:(id)a5 adjustmentData:(id)a6 largeAdjustmentData:(id)a7 isHighPriority:(BOOL)a8 reason:(id)a9
{
  BOOL v78 = a8;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = (PLPrimaryResourceDataStoreImageRecipe *)a3;
  int8x16_t v16 = (PLPrimaryResourceDataStoreImageRecipe *)a4;
  id v17 = a5;
  id v80 = a6;
  id v79 = a7;
  uint64_t v18 = (void *)MEMORY[0x1E4F1CA60];
  id v19 = a9;
  int v20 = [v18 dictionary];
  uint64_t v21 = v20;
  if (v17) {
    [v20 addEntriesFromDictionary:v17];
  }
  [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74988]];
  [v21 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F74A20]];

  int v22 = [(PLPrimaryResourceDataStoreImageRecipe *)v15 uniformTypeIdentifier];
  if (!v22)
  {
    id v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v87 = v15;
      __int16 v88 = 2112;
      v89 = v16;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Unable to determine type identifier for asset %{public}@, URL = %@", buf, 0x16u);
    }
  }
  id v24 = [MEMORY[0x1E4F8CDF8] typeWithIdentifier:v22];
  if ([MEMORY[0x1E4F8CC38] typeRequiresRasterizationDPI:v24])
  {
    id v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F8CC38], "defaultRasterizationDPI"));
    [v21 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F74A18]];
  }
  if (v16
    && [(PLPrimaryResourceDataStoreImageRecipe *)v15 isRAW]
    && (PLSyndicationAssetRequiresBlastDoorToAccessOriginals(v15) & 1) == 0)
  {
    id v26 = (void *)MEMORY[0x1E4F8CC38];
    uint64_t v27 = [(PLPrimaryResourceDataStoreImageRecipe *)v15 metadataFromMediaPropertiesOrOriginalResource];
    id v81 = 0;
    v76 = v16;
    id v28 = [v26 hasEmbeddedJPEGSuitableForDerivativesInImageAtURL:v16 metadata:v27 error:&v81];
    id v29 = (PLPrimaryResourceDataStoreImageRecipe *)v81;

    if (v28)
    {
      if ([v28 BOOLValue]) {
        [v21 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F74A38]];
      }
    }
    else
    {
      int v30 = PLBackendGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v87 = v76;
        __int16 v88 = 2112;
        v89 = v29;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Failed to query image properties of input URL %@. Error: %@", buf, 0x16u);
      }
    }
    int8x16_t v16 = v76;
  }
  unsigned int recipeID = self->_recipeID;
  if (recipeID - 65937 > 0xE) {
    goto LABEL_27;
  }
  if (((1 << (recipeID + 111)) & 0x4AD1) != 0)
  {
LABEL_28:
    uint64_t v41 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v42 = *MEMORY[0x1E4F1C3B8];
    v43 = NSStringFromSelector(a2);
    [v41 raise:v42, @"%@ not yet implemented for recipe: %@", v43, self format];
LABEL_29:

    goto LABEL_30;
  }
  if (recipeID != 65938)
  {
LABEL_27:
    switch(recipeID)
    {
      case 0x100C9u:
        [v21 setObject:&unk_1EEBECDE0 forKeyedSubscript:*MEMORY[0x1E4F749A0]];
        if (v78) {
          uint64_t v49 = 4;
        }
        else {
          uint64_t v49 = 2;
        }
        uint64_t v50 = [NSNumber numberWithInteger:v49];
        [v21 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F749D8]];

        uint64_t v51 = [MEMORY[0x1E4F748B0] standardPolicy];
        [v21 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F749F0]];

        [v21 setObject:&unk_1EEBF2660 forKeyedSubscript:*MEMORY[0x1E4F74A30]];
        break;
      case 0x100CAu:
      case 0x100CCu:
      case 0x100CEu:
      case 0x100D0u:
      case 0x100D2u:
      case 0x100D4u:
        goto LABEL_30;
      case 0x100CBu:
      case 0x100CFu:
      case 0x100D1u:
      case 0x100D5u:
        goto LABEL_28;
      case 0x100CDu:
        [v21 setObject:&unk_1EEBECDE0 forKeyedSubscript:*MEMORY[0x1E4F749A0]];
        if (v78) {
          uint64_t v52 = 4;
        }
        else {
          uint64_t v52 = 2;
        }
        uint64_t v53 = [NSNumber numberWithInteger:v52];
        [v21 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F749D8]];

        uint64_t v54 = [MEMORY[0x1E4F748D8] standardPolicy];
        [v21 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F749F0]];

        v55 = [(PLPrimaryResourceDataStoreImageRecipe *)self maxPixelCountForAssetWidth:[(PLPrimaryResourceDataStoreImageRecipe *)v15 width] height:[(PLPrimaryResourceDataStoreImageRecipe *)v15 height]];
        [v21 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F749E8]];

        break;
      case 0x100D3u:
        [v21 setObject:&unk_1EEBECDE0 forKeyedSubscript:*MEMORY[0x1E4F749A0]];
        v56 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v57 = *MEMORY[0x1E4F1C3B8];
        v43 = NSStringFromSelector(a2);
        [v56 raise:v57, @"%@ not supported for generation on this platform for recipe: %@", v43, self format];
        goto LABEL_29;
      default:
        if (recipeID == 66137) {
          goto LABEL_28;
        }
        break;
    }
    goto LABEL_30;
  }
  int v32 = [v80 adjustmentDictionary];
  os_log_type_t v33 = v32;
  if (!v32)
  {
    int v74 = 0;
    uint64_t v37 = 0;
    char v39 = 0;
    BOOL v40 = v78;
    goto LABEL_48;
  }
  uint64_t v34 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
  BOOL v73 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
  uint64_t v35 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
  if (([v35 isEqual:@"com.apple.photos"] & 1) == 0)
  {
    v75 = v34;
    id v61 = v35;
    id v62 = v33;
    id v63 = PLBackendGetLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v87 = self;
      _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_ERROR, "This adjustment data cannot be processed by Photos. Recipe: %@", buf, 0xCu);
    }

    os_log_type_t v33 = v62;
    uint64_t v35 = v61;
    v64 = v75;
    goto LABEL_57;
  }
  if (!v34)
  {
    if (v79)
    {
      id v65 = v35;
      v72 = v33;
      id v77 = v16;
      __int16 v66 = (void *)MEMORY[0x1E4F1C9B8];
      id v67 = [v79 fileURL];
      __int16 v68 = [v67 path];
      uint64_t v69 = [v66 dataWithContentsOfFile:v68];

      if (v69)
      {
        uint64_t v70 = *MEMORY[0x1E4F74928];
        v82[0] = *MEMORY[0x1E4F74920];
        v82[1] = v70;
        int v74 = (void *)v69;
        v83[0] = v69;
        v83[1] = v65;
        uint64_t v35 = v65;
        v82[2] = *MEMORY[0x1E4F74930];
        uint64_t v37 = v73;
        v83[2] = v73;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
        int8x16_t v16 = v77;
        goto LABEL_26;
      }
      v71 = PLBackendGetLog();
      int8x16_t v16 = v77;
      uint64_t v35 = v65;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v87 = self;
        _os_log_impl(&dword_19B3C7000, v71, OS_LOG_TYPE_ERROR, "AdjustmentDataBlob could not be retrieved for recipe: %@", buf, 0xCu);
      }
      v64 = v71;
      os_log_type_t v33 = v72;
    }
    else
    {
      v64 = PLBackendGetLog();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v87 = self;
        _os_log_impl(&dword_19B3C7000, v64, OS_LOG_TYPE_ERROR, "Cannot retrieve any adjustment data for recipe: %@", buf, 0xCu);
      }
    }
LABEL_57:

    id v47 = 0;
    goto LABEL_33;
  }
  v72 = v33;
  uint64_t v36 = *MEMORY[0x1E4F74928];
  v84[0] = *MEMORY[0x1E4F74920];
  v84[1] = v36;
  int v74 = (void *)v34;
  v85[0] = v34;
  v85[1] = v35;
  v84[2] = *MEMORY[0x1E4F74930];
  uint64_t v37 = v73;
  v85[2] = v73;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3];
LABEL_26:
  char v39 = v35;
  [v21 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F74978]];

  BOOL v40 = v78;
  os_log_type_t v33 = v72;
LABEL_48:
  if (v40) {
    uint64_t v58 = 4;
  }
  else {
    uint64_t v58 = 2;
  }
  id v59 = [NSNumber numberWithInteger:v58];
  [v21 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F749D8]];

  if (![(PLPrimaryResourceDataStoreImageRecipe *)v15 kind])
  {
    [v21 setObject:&unk_1EEBECDF8 forKeyedSubscript:*MEMORY[0x1E4F74A30]];
    id v60 = [MEMORY[0x1E4F748B8] standardPolicy];
    [v21 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F749F0]];
  }
LABEL_30:
  uint64_t v44 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F74A28]];
  int v45 = [v44 BOOLValue];

  if (v45)
  {
    uint64_t v46 = objc_msgSend(NSNumber, "numberWithBool:", -[PLPrimaryResourceDataStoreImageRecipe isPhoto](v15, "isPhoto"));
    [v21 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F74998]];
  }
  id v47 = v21;
LABEL_33:

  return v47;
}

- (id)_resourceGenerationAffectsRecipesForLibraryID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  unsigned int recipeID = self->_recipeID;
  BOOL v7 = recipeID - 65937 > 0xE || ((1 << (recipeID + 111)) & 0x4AD3) == 0;
  if (!v7 || ((v8 = recipeID - 65737, v9 = v8 > 8, v10 = (1 << v8) & 0x155, !v9) ? (BOOL v11 = v10 == 0) : (BOOL v11 = 1), !v11))
  {
    id v12 = +[PLResourceGenerator fileAndTableBackedThumbnailManagerRecipesForLibraryID:v4];
    [v5 unionOrderedSet:v12];
  }
  return v5;
}

+ (CGSize)scaleOriginalSize:(CGSize)result toLongSideTarget:(double)a4
{
  if (result.width >= result.height) {
    double width = result.width;
  }
  else {
    double width = result.height;
  }
  if (width > a4)
  {
    double v5 = a4 / width;
    result.double width = result.width * v5;
    result.height = result.height * v5;
  }
  return result;
}

+ (CGSize)scaleOriginalSize:(CGSize)result toShortSideTarget:(double)a4 maxLongSideLength:(double)a5
{
  if (result.width >= result.height) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  if (height > a4)
  {
    double v6 = a4 / height;
    result.double width = round(result.width * v6);
    result.double height = round(result.height * v6);
  }
  if (a5 != 0.0)
  {
    if (result.width >= result.height) {
      double width = result.width;
    }
    else {
      double width = result.height;
    }
    if (width > a5)
    {
      double v8 = a5 / width;
      result.double width = round(result.width * v8);
      result.double height = round(result.height * v8);
    }
  }
  return result;
}

@end