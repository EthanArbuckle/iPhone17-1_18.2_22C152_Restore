@interface PLThumbnailResourceDataStoreTableRecipe
- (PLThumbnailResourceDataStoreTableRecipe)initWithRecipeID:(unsigned int)a3;
- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4;
- (id)codecFourCharCodeName;
- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4;
- (id)description;
- (id)supportedVersionsForLocalResourceGeneration;
- (id)uti;
- (unsigned)recipeID;
- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11;
- (void)setRecipeID:(unsigned int)a3;
@end

@implementation PLThumbnailResourceDataStoreTableRecipe

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
  return +[PLAssetFormats descriptionForImageFormat:LOWORD(self->_recipeID) >> 1];
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v11 = *(void *)&a4;
  v23[3] = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F8C500];
  v22[0] = *MEMORY[0x1E4F28568];
  id v15 = a11;
  v16 = NSStringFromPLErrorCode();
  v23[0] = v16;
  v23[1] = self;
  v22[1] = @"recipe";
  v22[2] = @"version";
  v17 = [NSNumber numberWithUnsignedInt:v11];
  v23[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v19 = [v13 errorWithDomain:v14 code:47005 userInfo:v18];

  v20 = [MEMORY[0x1E4F1CAD0] set];
  v21 = [MEMORY[0x1E4F1CAA0] orderedSet];
  (*((void (**)(id, void, void *, void *, void *, void))v15 + 2))(v15, 0, v19, v20, v21, 0);
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  return 0;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)uti
{
  v2 = [[PLUniformTypeIdentifier alloc] initWithIdentifier:@"public.image" conformanceHint:1];
  return v2;
}

- (id)codecFourCharCodeName
{
  return 0;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return +[PLColorSpace commonColorSpace_sRGB];
}

- (PLThumbnailResourceDataStoreTableRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLThumbnailResourceDataStoreTableRecipe;
  v5 = [(PLThumbnailResourceDataStoreTableRecipe *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() classFromRecipeID:v3];
    if (v6 != objc_opt_class())
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:v5 file:@"PLThumbnailResourceDataStoreTableRecipe.m" lineNumber:36 description:@"wrong recipe class passed to recipe initializer."];
    }
    v5->_recipeID = v3;
  }
  return v5;
}

@end