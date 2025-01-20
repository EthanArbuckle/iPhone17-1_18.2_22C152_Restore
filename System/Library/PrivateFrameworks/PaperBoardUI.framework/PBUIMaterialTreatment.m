@interface PBUIMaterialTreatment
+ (BOOL)supportsSecureCoding;
- (BOOL)canInterpolateToLowerScales;
- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)usesStaticBackdropScaleFactor;
- (NSBundle)recipeBundle;
- (NSString)description;
- (NSString)recipeName;
- (PBUIMaterialTreatment)initWithCoder:(id)a3;
- (PBUIMaterialTreatment)initWithRecipeName:(id)a3 fromBundle:(id)a4;
- (double)resolvedBackdropScale;
- (double)weighting;
- (id)backdropScaleAdjustment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setBackdropScaleAdjustment:(id)a3;
- (void)setRecipeBundle:(id)a3;
- (void)setRecipeName:(id)a3;
- (void)setWeighting:(double)a3;
@end

@implementation PBUIMaterialTreatment

- (double)resolvedBackdropScale
{
  v3 = [(PBUIMaterialTreatment *)self backdropScaleAdjustment];

  if (!v3) {
    return -1.0;
  }
  v4 = [(PBUIMaterialTreatment *)self backdropScaleAdjustment];
  [(PBUIMaterialTreatment *)self weighting];
  double v5 = v4[2](v4);

  return v5;
}

- (PBUIMaterialTreatment)initWithRecipeName:(id)a3 fromBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PBUIMaterialTreatment *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    recipeName = v8->_recipeName;
    v8->_recipeName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_recipeBundle, a4);
    v8->_weighting = 1.0;
    v8->_usesStaticBackdropScaleFactor = 0;
  }

  return v8;
}

- (BOOL)canInterpolateToLowerScales
{
  return 0;
}

- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v10 = (void *)getMTMaterialLayerClass_softClass;
  uint64_t v31 = getMTMaterialLayerClass_softClass;
  if (!getMTMaterialLayerClass_softClass)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = (uint64_t)__getMTMaterialLayerClass_block_invoke;
    v25 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62B2890;
    v26 = (void (*)(uint64_t))&v28;
    __getMTMaterialLayerClass_block_invoke((uint64_t)&v22);
    v10 = (void *)v29[3];
  }
  v11 = v10;
  _Block_object_dispose(&v28, 8);
  if (v11)
  {
    id v12 = objc_alloc_init(v11);
    [v12 setDelegate:self];
    [v12 setRecipeName:self->_recipeName fromBundle:self->_recipeBundle];
    [v12 setWeighting:self->_weighting];
    if (self->_backdropScaleAdjustment)
    {
      uint64_t v22 = 0;
      uint64_t v23 = (uint64_t)&v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__4;
      v26 = __Block_byref_object_dispose__4;
      id v27 = (id)MEMORY[0x1C1872570]();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke;
      v19[3] = &unk_1E62B3E18;
      v21 = &v22;
      id v20 = v9;
      [v12 setBackdropScaleAdjustment:v19];

      _Block_object_dispose(&v22, 8);
    }
    uint64_t v22 = 0;
    uint64_t v23 = (uint64_t)&v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    id v27 = [v12 blurRadiusTransformer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke_2;
    v16[3] = &unk_1E62B3E40;
    v18 = &v22;
    id v17 = v9;
    [v12 setBlurRadiusTransformer:v16];
    [v8 bounds];
    objc_msgSend(v12, "setFrame:");
    [v8 addSublayer:v12];

    _Block_object_dispose(&v22, 8);
    goto LABEL_9;
  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28588];
    v32[0] = *MEMORY[0x1E4F28578];
    v32[1] = v14;
    v33[0] = @"MTMaterialLayer could not be loaded.";
    v33[1] = @"Check that the current process is able to link CoreMaterial and MaterialKit.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    *a5 = [v13 errorWithDomain:@"com.apple.PaperBoardUI.PBUIRenderer" code:1 userInfo:v12];
LABEL_9:
  }
  return v11 != 0;
}

double __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  [*(id *)(a1 + 32) scaleReductionFactor];
  return v2 / v3;
}

double __61__PBUIMaterialTreatment_commitToRenderingTree_options_error___block_invoke_2(uint64_t a1)
{
  double v2 = (*(double (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
  [*(id *)(a1 + 32) scaleReductionFactor];
  return v2 / v3;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v5 = a3;
  double v3 = [v5 superlayer];
  v4 = v3;
  if (v3)
  {
    [v3 bounds];
    objc_msgSend(v5, "setFrame:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setWeighting:self->_weighting];
  [v4 setBackdropScaleAdjustment:self->_backdropScaleAdjustment];
  [v4 setRecipeBundle:self->_recipeBundle];
  [v4 setRecipeName:self->_recipeName];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUIMaterialTreatment)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PBUIMaterialTreatment *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecipeName"];
    recipeName = v5->_recipeName;
    v5->_recipeName = (NSString *)v6;

    [v4 decodeDoubleForKey:@"Weighting"];
    v5->_weighting = v8;
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecipeBundle_URL"];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithURL:v9];
      recipeBundle = v5->_recipeBundle;
      v5->_recipeBundle = (NSBundle *)v10;

      if (!v5->_recipeBundle)
      {
        id v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F281F8];
        uint64_t v22 = *MEMORY[0x1E4F289D0];
        v23[0] = v9;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        id v20 = [v17 errorWithDomain:v18 code:260 userInfo:v19];

        [v4 failWithError:v20];
        v15 = 0;
        goto LABEL_8;
      }
    }
    [v4 decodeDoubleForKey:@"ResolvedBackdropScaleAdjustment"];
    if (v12 != -1.0)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __39__PBUIMaterialTreatment_initWithCoder___block_invoke;
      v21[3] = &__block_descriptor_40_e8_d16__0d8l;
      *(double *)&v21[4] = v12;
      uint64_t v13 = MEMORY[0x1C1872570](v21);
      id backdropScaleAdjustment = v5->_backdropScaleAdjustment;
      v5->_id backdropScaleAdjustment = (id)v13;
    }
  }
  v15 = v5;
LABEL_8:

  return v15;
}

double __39__PBUIMaterialTreatment_initWithCoder___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_recipeName forKey:@"RecipeName"];
  recipeBundle = self->_recipeBundle;
  if (recipeBundle)
  {
    id v5 = [(NSBundle *)recipeBundle bundleURL];
    [v8 encodeObject:v5 forKey:@"RecipeBundle_URL"];
  }
  else
  {
    [v8 encodeObject:0 forKey:@"RecipeBundle_URL"];
  }
  [v8 encodeDouble:@"Weighting" forKey:self->_weighting];
  id backdropScaleAdjustment = (void (**)(double))self->_backdropScaleAdjustment;
  if (backdropScaleAdjustment) {
    backdropScaleAdjustment[2](self->_weighting);
  }
  else {
    double v7 = -1.0;
  }
  [v8 encodeDouble:@"ResolvedBackdropScaleAdjustment" forKey:v7];
}

- (NSString)description
{
  return (NSString *)[(PBUIMaterialTreatment *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(PBUIMaterialTreatment *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v4 appendString:self->_recipeName withName:@"recipe"];
  id v5 = (id)[v4 appendDouble:@"weighting" withName:3 decimalPrecision:self->_weighting];
  id v6 = (id)[v4 appendObject:self->_recipeBundle withName:@"bundle" skipIfNil:1];
  [(PBUIMaterialTreatment *)self resolvedBackdropScale];
  if (v7 >= 0.0)
  {
    id v8 = NSString;
    [(PBUIMaterialTreatment *)self resolvedBackdropScale];
    uint64_t v10 = v9;
    BOOL v11 = [(PBUIMaterialTreatment *)self usesStaticBackdropScaleFactor];
    double v12 = @"depends-on-weight";
    if (v11) {
      double v12 = @"fixed";
    }
    uint64_t v13 = [v8 stringWithFormat:@"%f (%@)", v10, v12];
    [v4 appendString:v13 withName:@"backdropScale"];
  }
  return v4;
}

- (id)succinctDescription
{
  double v2 = [(PBUIMaterialTreatment *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSString)recipeName
{
  return self->_recipeName;
}

- (void)setRecipeName:(id)a3
{
}

- (NSBundle)recipeBundle
{
  return self->_recipeBundle;
}

- (void)setRecipeBundle:(id)a3
{
}

- (double)weighting
{
  return self->_weighting;
}

- (void)setWeighting:(double)a3
{
  self->_weighting = a3;
}

- (id)backdropScaleAdjustment
{
  return self->_backdropScaleAdjustment;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
}

- (BOOL)usesStaticBackdropScaleFactor
{
  return self->_usesStaticBackdropScaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backdropScaleAdjustment, 0);
  objc_storeStrong((id *)&self->_recipeBundle, 0);
  objc_storeStrong((id *)&self->_recipeName, 0);
}

@end