@interface PBUIWallpaperInactiveTreatment
+ (BOOL)supportsSecureCoding;
- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5;
- (PBUIWallpaperInactiveTreatment)initWithCoder:(id)a3;
- (id)applyToImage:(id)a3 options:(id)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PBUIWallpaperInactiveTreatment

- (id)applyToImage:(id)a3 options:(id)a4 error:(id *)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v10 = (void *)getPIParallaxLegacyPosterStyleClass_softClass;
  uint64_t v23 = getPIParallaxLegacyPosterStyleClass_softClass;
  if (!getPIParallaxLegacyPosterStyleClass_softClass)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __getPIParallaxLegacyPosterStyleClass_block_invoke;
    v19[3] = &unk_1E62B2890;
    v19[4] = &v20;
    __getPIParallaxLegacyPosterStyleClass_block_invoke((uint64_t)v19);
    v10 = (void *)v21[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v20, 8);
  if (v11)
  {
    id v18 = 0;
    v12 = [v11 applyInactiveStyleToImage:v9 error:&v18];
    id v13 = v18;

    if (v13 || !v12)
    {
      if (a5)
      {
        id v13 = v13;
        id v14 = 0;
        *a5 = v13;
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = v12;
      v12 = v14;
    }
  }
  else
  {
    if (!a5)
    {
      id v14 = 0;
      v12 = v9;
      goto LABEL_14;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v24[0] = *MEMORY[0x1E4F28578];
    v24[1] = v16;
    v25[0] = @"<PIParallaxLegacyPosterStyle> could not be loaded.";
    v25[1] = @"Check that it should exist on this platform and that you are able to link it.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v15 errorWithDomain:@"com.apple.PaperBoardUI.PBUIRenderer" code:1 userInfo:v13];
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v9;
  }

LABEL_14:
  return v14;
}

- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F285A0];
    v10[0] = *MEMORY[0x1E4F28578];
    v10[1] = v7;
    v11[0] = @"PBUIWallpaperInactiveTreatment does not support CoreAnimation rendering.";
    v11[1] = @"Use a PBUIRenderer that support CoreImage.";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    *a5 = [v6 errorWithDomain:@"com.apple.PaperBoardUI.PBUIRenderer" code:1 userInfo:v8];
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[PBUIWallpaperInactiveTreatment allocWithZone:a3];
  return [(PBUIWallpaperInactiveTreatment *)v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUIWallpaperInactiveTreatment)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(PBUIWallpaperInactiveTreatment);

  return v4;
}

@end