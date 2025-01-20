@interface PLResourceRecipe
+ (Class)classFromRecipeID:(unsigned int)a3;
+ (id)recipeFromID:(unsigned int)a3;
- (BOOL)colorSpaceIsNativeForDisplay;
- (BOOL)isDerivative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMarkedFullSize;
- (PLResourceRecipe)initWithRecipeID:(unsigned int)a3;
- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4;
- (id)codecFourCharCodeName;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4;
- (id)expectedSizeFromWidth:(int64_t)a3 height:(int64_t)a4;
- (id)maxPixelCountForAssetWidth:(int64_t)a3 height:(int64_t)a4;
- (id)recipeErrorWithCode:(int64_t)a3 version:(unsigned int)a4 underlyingError:(id)a5 debugDescription:(id)a6;
- (id)supportedVersionsForLocalResourceGeneration;
- (id)uti;
- (unint64_t)hash;
- (unsigned)orientation;
- (unsigned)recipeClassID;
- (unsigned)recipeID;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)populateAdjustedRecipeIngredients:(id)a3 asset:(id)a4 version:(unsigned int)a5;
@end

@implementation PLResourceRecipe

- (void)populateAdjustedRecipeIngredients:(id)a3 asset:(id)a4 version:(unsigned int)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v8 hasAdjustments];
  if (a5 == 2 && v9)
  {
    v10 = [v8 adjustmentDataResource];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 adjustmentDictionary];
      v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8BA50]];
      v14 = v13;
      if (v13) {
        uint64_t v15 = [v13 integerValue];
      }
      else {
        uint64_t v15 = 0;
      }
      [v7 setObject:v11 forKeyedSubscript:@"Adjustment"];
    }
    else
    {
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Resource generation failed to find video for adjustment data", (uint8_t *)&v31, 2u);
      }

      uint64_t v15 = 0;
    }
    v17 = [v8 overflowAdjustmentDataResource];
    if (v17) {
      [v7 setObject:v17 forKeyedSubscript:@"LargeAdjustment"];
    }
    char v18 = [v8 cameraProcessingAdjustmentState];
    if (![v8 isPhoto])
    {
      if (![v8 isVideo])
      {
LABEL_54:

        goto LABEL_55;
      }
      if (v15) {
        v19 = &__block_literal_global_260;
      }
      else {
        v19 = &__block_literal_global_257_57596;
      }
      v20 = [v8 firstPersistedResourceMatching:v19];
      v21 = PLBackendGetLog();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v20)
      {
        if (v22)
        {
          int v31 = 138412290;
          v32 = v20;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Resource generation selected video resource for primary video recipe: %@", (uint8_t *)&v31, 0xCu);
        }

        [v7 setObject:v20 forKeyedSubscript:@"Video"];
        if ((v18 & 1) == 0) {
          goto LABEL_53;
        }
      }
      else
      {
        if (v22)
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Resource generation failed to find video for primary video recipe", (uint8_t *)&v31, 2u);
        }

        if ((v18 & 1) == 0) {
          goto LABEL_53;
        }
      }
      v27 = [v8 firstPersistedResourceMatching:&__block_literal_global_263];
      [v7 setObject:v27 forKeyedSubscript:@"SpatialOvercapture"];
      goto LABEL_52;
    }
    if (v15) {
      [v8 firstPersistedResourceMatching:&__block_literal_global_244];
    }
    else {
    v20 = [v8 primaryStoreOriginalResource];
    }
    v23 = PLBackendGetLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v24)
      {
        int v31 = 138412290;
        v32 = v20;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Resource generation selected image resource for primary image recipe: %@", (uint8_t *)&v31, 0xCu);
      }

      [v7 setObject:v20 forKeyedSubscript:@"Image"];
      if (v18)
      {
LABEL_30:
        v25 = [v8 firstPersistedResourceMatching:&__block_literal_global_247];
        [v7 setObject:v25 forKeyedSubscript:@"SpatialOvercapture"];
      }
    }
    else
    {
      if (v24)
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Resource generation failed to find image for primary image recipe", (uint8_t *)&v31, 2u);
      }

      if (v18) {
        goto LABEL_30;
      }
    }
    if (![v8 isPhotoIris])
    {
LABEL_53:

      goto LABEL_54;
    }
    if (v15) {
      v26 = &__block_literal_global_251;
    }
    else {
      v26 = &__block_literal_global_249;
    }
    v27 = [v8 firstPersistedResourceMatching:v26];
    v28 = PLBackendGetLog();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
    if (v27)
    {
      if (v29)
      {
        int v31 = 138412290;
        v32 = v27;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Resource generation selected video complement resource: %@", (uint8_t *)&v31, 0xCu);
      }

      [v7 setObject:v27 forKeyedSubscript:@"VideoComplement"];
      if ((v18 & 1) == 0) {
        goto LABEL_52;
      }
    }
    else
    {
      if (v29)
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Resource generation failed to find video complement resource.", (uint8_t *)&v31, 2u);
      }

      if ((v18 & 1) == 0) {
        goto LABEL_52;
      }
    }
    v30 = [v8 firstPersistedResourceMatching:&__block_literal_global_254];
    [v7 setObject:v30 forKeyedSubscript:@"SpatialOvercapture"];

LABEL_52:
    goto LABEL_53;
  }
LABEL_55:
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_261(uint64_t a1, void *a2)
{
  return [a2 cplType] == 23;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_3_258(uint64_t a1, void *a2)
{
  return [a2 cplType] == 25;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_2_255(uint64_t a1, void *a2)
{
  return [a2 cplType] == 1;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_252(uint64_t a1, void *a2)
{
  return [a2 cplType] == 24;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 cplType] == 20;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cplType] == 18;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_245(uint64_t a1, void *a2)
{
  return [a2 cplType] == 23;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cplType] == 15;
}

- (id)recipeErrorWithCode:(int64_t)a3 version:(unsigned int)a4 underlyingError:(id)a5 debugDescription:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  v13 = v12;
  if (v11)
  {
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  else
  {
    v14 = NSStringFromPLErrorCode();
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  }
  uint64_t v15 = [(PLResourceRecipe *)self description];
  [v13 setObject:v15 forKeyedSubscript:@"recipe"];

  v16 = [NSNumber numberWithUnsignedInt:v7];
  [v13 setObject:v16 forKeyedSubscript:@"version"];

  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:a3 userInfo:v13];

  return v17;
}

- (unsigned)orientation
{
  return 1;
}

- (unsigned)recipeClassID
{
  return [(PLResourceRecipe *)self recipeID] >> 16;
}

- (BOOL)isDerivative
{
  return [(PLResourceRecipe *)self recipeID] & 1;
}

- (BOOL)isMarkedFullSize
{
  return 0;
}

- (id)maxPixelCountForAssetWidth:(int64_t)a3 height:(int64_t)a4
{
  return 0;
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  return 0;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)colorSpaceIsNativeForDisplay
{
  return 0;
}

- (id)uti
{
  return 0;
}

- (id)expectedSizeFromWidth:(int64_t)a3 height:(int64_t)a4
{
  return 0;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  id v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v11 raise:v12, @"Subclasses must override %@", v13 format];
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Subclasses must override %@", v6 format];

  return 0;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Subclasses must override %@", v6 format];

  return 0;
}

- (id)codecFourCharCodeName
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses must override %@", v4 format];

  return 0;
}

- (unsigned)recipeID
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses must override %@", v4 format];

  return 0;
}

- (PLResourceRecipe)initWithRecipeID:(unsigned int)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Subclasses must override %@", v6 format];

  return 0;
}

- (unint64_t)hash
{
  return [(PLResourceRecipe *)self recipeID];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLResourceRecipe *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unsigned int v7 = [(PLResourceRecipe *)self recipeID];
    unsigned int v8 = [(PLResourceRecipe *)v6 recipeID];

    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)recipeFromID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (recipeFromID__s_onceToken != -1) {
    dispatch_once(&recipeFromID__s_onceToken, &__block_literal_global_57615);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&recipeFromID__s_lock);
  v4 = (void *)recipeFromID__s_recipesByID;
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    unsigned int v8 = (objc_class *)[(id)objc_opt_class() classFromRecipeID:v3];
    if (v8)
    {
      v6 = (void *)[[v8 alloc] initWithRecipeID:v3];
      if (v6)
      {
        BOOL v9 = (void *)recipeFromID__s_recipesByID;
        id v10 = [NSNumber numberWithUnsignedInt:v3];
        [v9 setObject:v6 forKeyedSubscript:v10];
      }
    }
    else
    {
      v6 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&recipeFromID__s_lock);
  return v6;
}

void __33__PLResourceRecipe_recipeFromID___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)recipeFromID__s_recipesByID;
  recipeFromID__s_recipesByID = (uint64_t)v0;

  recipeFromID__s_lock = 0;
}

+ (Class)classFromRecipeID:(unsigned int)a3
{
  switch(HIWORD(a3))
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
      v4 = objc_opt_class();
      break;
    default:
      v4 = 0;
      break;
  }
  return (Class)v4;
}

@end