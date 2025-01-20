@interface PBUIMaterialCompositor
- (PBUIMaterialCompositor)init;
- (PBUIRenderer)renderer;
- (double)downsampleFactor;
- (id)applyEffect:(id)a3 toImage:(id)a4 error:(id *)a5;
- (void)setDownsampleFactor:(double)a3;
- (void)setRenderer:(id)a3;
@end

@implementation PBUIMaterialCompositor

- (PBUIMaterialCompositor)init
{
  v7.receiver = self;
  v7.super_class = (Class)PBUIMaterialCompositor;
  v2 = [(PBUIMaterialCompositor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_downsampleFactor = 8.0;
    uint64_t v4 = +[PBUICARemoteRenderer remoteRendererIfPossible];
    renderer = v3->_renderer;
    v3->_renderer = (PBUIRenderer *)v4;
  }
  return v3;
}

- (id)applyEffect:(id)a3 toImage:(id)a4 error:(id *)a5
{
  v8 = (uint64_t *)a3;
  id v9 = a4;
  if (v8)
  {
    double downsampleFactor = self->_downsampleFactor;
    switch(v8[11])
    {
      case 0:
        goto LABEL_5;
      case 1:
      case 2:
        soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(v8[3]);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        goto LABEL_6;
      case 3:
        v11 = @"homeScreenLegibility";
        v12 = PBUIHomeScreenLegibilityMaterialRecipeBundle();
        v22 = (void *)MEMORY[0x1C1872570](PBUIHomeScreenLegibilityMaterialRecipeScaleAdjustment);
        break;
      default:
        v12 = 0;
        v11 = 0;
        goto LABEL_6;
    }
  }
  else
  {
LABEL_5:
    soft_MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    double downsampleFactor = 1.0;
LABEL_6:
    v22 = &__block_literal_global_10;
  }
  v13 = [[PBUIMaterialTreatment alloc] initWithRecipeName:v11 fromBundle:v12];
  v14 = [[PBUICodableImage alloc] initWithUIImage:v9 error:0];
  v15 = [[PBUITreatImageRequest alloc] initWithImage:v14 downscaleFactor:v13 treatment:downsampleFactor];
  v16 = [(PBUIRenderer *)self->_renderer renderRequest:v15 error:a5];
  v17 = (void *)MEMORY[0x1E4F42A80];
  [v9 scale];
  v19 = objc_msgSend(v17, "pbui_imageWithIOSurface:scale:orientation:", v16, objc_msgSend(v9, "imageOrientation"), v18);
  v20 = objc_msgSend(v19, "pbui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", 8, 1);

  return v20;
}

double __52__PBUIMaterialCompositor_applyEffect_toImage_error___block_invoke()
{
  return 0.7;
}

- (double)downsampleFactor
{
  return self->_downsampleFactor;
}

- (void)setDownsampleFactor:(double)a3
{
  self->_double downsampleFactor = a3;
}

- (PBUIRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end