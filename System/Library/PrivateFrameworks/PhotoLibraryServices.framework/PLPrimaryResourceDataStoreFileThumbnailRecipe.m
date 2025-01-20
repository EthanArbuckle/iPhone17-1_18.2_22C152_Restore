@interface PLPrimaryResourceDataStoreFileThumbnailRecipe
- (BOOL)_isAspectShortSizing;
- (CGSize)sizeForAssetWidth:(int64_t)a3 height:(int64_t)a4;
- (PLPrimaryResourceDataStoreFileThumbnailRecipe)initWithRecipeID:(unsigned int)a3;
- (double)_longSideTargetLength;
- (double)_shortSideTargetLength;
- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (id)description;
- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4;
- (id)supportedVersionsForLocalResourceGeneration;
- (id)uti;
- (unsigned)recipeID;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)setRecipeID:(unsigned int)a3;
@end

@implementation PLPrimaryResourceDataStoreFileThumbnailRecipe

- (void)setRecipeID:(unsigned int)a3
{
  *(&self->super._recipeID + 1) = a3;
}

- (unsigned)recipeID
{
  return *(&self->super._recipeID + 1);
}

- (id)description
{
  return PLResourceRecipeIDDescription(*(&self->super._recipeID + 1), 1);
}

- (CGSize)sizeForAssetWidth:(int64_t)a3 height:(int64_t)a4
{
  double v5 = (double)a3;
  double v6 = (double)a4;
  if ([(PLPrimaryResourceDataStoreFileThumbnailRecipe *)self _isAspectShortSizing])
  {
    [(PLPrimaryResourceDataStoreFileThumbnailRecipe *)self _shortSideTargetLength];
    double v8 = v7;
    v9 = objc_opt_class();
    objc_msgSend(v9, "scaleOriginalSize:toShortSideTarget:maxLongSideLength:", v5, v6, v8, v8 * 5.0);
  }
  else
  {
    [(PLPrimaryResourceDataStoreFileThumbnailRecipe *)self _longSideTargetLength];
    double v13 = v12;
    v14 = objc_opt_class();
    objc_msgSend(v14, "scaleOriginalSize:toLongSideTarget:", v5, v6, v13);
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v11 = *(void *)&a4;
  v49[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v14 = (void *)MEMORY[0x1E4F1CA80];
  v15 = (void (**)(id, void *, void *, void *, void *, void))a11;
  uint64_t v16 = [v14 set];
  v17 = [v13 assetID];
  uint64_t v18 = [v17 libraryID];

  v19 = [(PLPrimaryResourceDataStoreFileThumbnailRecipe *)self supportedVersionsForLocalResourceGeneration];
  v20 = [NSNumber numberWithUnsignedInt:v11];
  int v21 = [v19 containsObject:v20];

  uint64_t v42 = v18;
  v44 = (void *)v16;
  if (v21)
  {
    if (PLIsAssetsd())
    {
      v22 = -[PLPrimaryResourceDataStoreFileThumbnailRecipe chooseIngredientsFrom:version:](self, "chooseIngredientsFrom:version:", v13, v11, v18);
      v23 = [v22 objectForKeyedSubscript:@"Image"];

      if (v23)
      {
        v24 = [v23 dataStoreKey];
        v25 = [v13 assetID];
        v26 = [v24 fileURLForAssetID:v25];

        if (v26)
        {
          id v45 = 0;
          v27 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v26 options:1 error:&v45];
        }
        else
        {
          v27 = 0;
        }
      }
      else
      {
        v27 = 0;
      }
      [v13 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:v27 forceSRGBConversion:0];
      if ([v13 hasAllThumbs])
      {
        v31 = +[PLResourceGenerator fileAndTableBackedThumbnailManagerRecipesForLibraryID:v18];
        v33 = [v31 set];
        [v44 unionSet:v33];

        if ([v13 hasAdjustments]) {
          uint64_t v34 = 2;
        }
        else {
          uint64_t v34 = 0;
        }
        v35 = +[PLResourceRecipe recipeFromID:65737];
        v36 = +[PLResourceInstaller onDemand_installPrimaryImageResourceWithRecipe:v35 version:v34 forAsset:v13];
        if (v36) {
          [v44 addObject:v35];
        }

        v29 = +[PLResourceRecipe recipeFromID:65741];
        v37 = +[PLResourceInstaller onDemand_installPrimaryImageResourceWithRecipe:v29 version:v34 forAsset:v13];
        if (v37) {
          [v44 addObject:v29];
        }
        uint64_t v32 = 0;
      }
      else
      {
        v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v39 = *MEMORY[0x1E4F8C500];
        v46[0] = *MEMORY[0x1E4F28568];
        v31 = NSStringFromPLErrorCode();
        v47[0] = v31;
        v47[1] = self;
        v46[1] = @"recipe";
        v46[2] = @"version";
        v29 = [NSNumber numberWithUnsignedInt:v11];
        v47[2] = v29;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:3];
        uint64_t v32 = [v38 errorWithDomain:v39 code:47008 userInfo:v37];
      }

      goto LABEL_24;
    }
    v29 = 0;
    uint64_t v28 = *MEMORY[0x1E4F8C500];
  }
  else
  {
    uint64_t v28 = *MEMORY[0x1E4F8C500];
    v29 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F8C500], 47004, 0, v18);
    if (PLIsAssetsd()) {
      goto LABEL_25;
    }
  }
  v30 = (void *)MEMORY[0x1E4F28C58];
  v48[0] = *MEMORY[0x1E4F28568];
  v27 = NSStringFromPLErrorCode();
  v49[0] = v27;
  v49[1] = self;
  v48[1] = @"recipe";
  v48[2] = @"version";
  v23 = [NSNumber numberWithUnsignedInt:v11];
  v49[2] = v23;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
  uint64_t v32 = [v30 errorWithDomain:v28 code:47008 userInfo:v31];
LABEL_24:

  v29 = (void *)v32;
LABEL_25:
  v40 = objc_msgSend(v13, "managedObjectContext", v42);
  v41 = [MEMORY[0x1E4F1CAA0] orderedSet];
  v15[2](v15, v40, v29, v44, v41, 0);
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F8B9F0];
  id v6 = a4;
  double v7 = [v6 thumbnailIdentifier];
  double v8 = [v6 pathManager];

  v9 = objc_msgSend(v5, "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v7, v8, -[PLPrimaryResourceDataStoreFileThumbnailRecipe recipeID](self, "recipeID"), 0);

  if (v9)
  {
    double v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(PLPrimaryResourceDataStoreFileThumbnailRecipe *)self supportedVersionsForLocalResourceGeneration];
  double v8 = [NSNumber numberWithUnsignedInt:v4];
  int v9 = [v7 containsObject:v8];

  if (!v9)
  {
    v24 = 0;
    goto LABEL_39;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v10 addIndex:0];
  if ([v6 isRAWPlusJPEGWithRAWOnTop]) {
    [v10 addIndex:4];
  }
  if ([v6 hasAdjustments]) {
    int v11 = 2;
  }
  else {
    int v11 = 0;
  }
  [v6 resourcesSortedByQuality];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (!v13)
  {

LABEL_35:
    uint64_t v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Resource generation failed to find image for thumbnail recipe", buf, 2u);
    }

    v26 = 0;
    v24 = 0;
    goto LABEL_38;
  }
  uint64_t v14 = v13;
  v30 = 0;
  uint64_t v15 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v32 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if (objc_msgSend(v10, "containsIndex:", objc_msgSend(v17, "resourceType"))
        && [v17 version] == v11
        && (int)[v17 localAvailability] >= 1)
      {
        id v18 = v6;
        if ([v6 isRAWPlusJPEGWithRAWOnTop]
          && ([v17 isDerivative] & 1) == 0
          && ([v17 uniformTypeIdentifier],
              v19 = objc_claimAutoreleasedReturnValue(),
              char v20 = [v19 isPrimaryImageFormat],
              v19,
              (v20 & 1) != 0))
        {
          id v6 = v18;
        }
        else
        {
          if (([v17 isDerivative] & 1) == 0)
          {
            id v25 = v17;

            v30 = v25;
            id v6 = v18;
            goto LABEL_31;
          }
          int v21 = [v17 recipeID];
          int v22 = v21;
          if (v21 == 65938 || v21 == 65737)
          {
            id v23 = v17;

            v30 = v23;
          }
          id v6 = v18;
          if (v22 == 65737 || v22 == 65938) {
            goto LABEL_31;
          }
        }
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_31:

  v26 = v30;
  if (!v30) {
    goto LABEL_35;
  }
  v27 = PLBackendGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v30;
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Resource generation selected image resource for thumbnail recipe: %@", buf, 0xCu);
  }

  v35 = @"Image";
  v36 = v30;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
LABEL_38:

LABEL_39:
  return v24;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  return &unk_1EEBF1C70;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return a3;
}

- (id)uti
{
  return +[PLUniformTypeIdentifier jpegUniformTypeIdentifier];
}

- (PLPrimaryResourceDataStoreFileThumbnailRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreFileThumbnailRecipe;
  double v5 = [(PLPrimaryResourceDataStoreFileThumbnailRecipe *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() classFromRecipeID:v3];
    if (v6 != objc_opt_class())
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:v5 file:@"PLPrimaryResourceDataStoreFileThumbnailRecipe.m" lineNumber:84 description:@"wrong recipe class passed to recipe initializer."];
    }
    *(&v5->super._recipeID + 1) = v3;
  }
  return v5;
}

- (double)_longSideTargetLength
{
  uint64_t v2 = *(&self->super._recipeID + 1);
  if (v2 == 269159) {
    return 360.0;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Long side length called on a non-long side recipe ID: %ld", v2);
  return -1.0;
}

- (double)_shortSideTargetLength
{
  uint64_t v2 = *(&self->super._recipeID + 1);
  if (v2 == 272151) {
    return 256.0;
  }
  if (v2 == 272155) {
    return 360.0;
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Short side length called on a non-short side recipe ID: %ld", v2);
  return -1.0;
}

- (BOOL)_isAspectShortSizing
{
  return ((*(&self->super._recipeID + 1) - 272151) & 0xFFFFFFFB) == 0;
}

@end