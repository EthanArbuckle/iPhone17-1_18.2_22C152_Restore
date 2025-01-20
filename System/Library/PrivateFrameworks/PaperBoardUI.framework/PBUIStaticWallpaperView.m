@interface PBUIStaticWallpaperView
+ (BOOL)_allowsRasterization;
+ (BOOL)_canCacheImages;
+ (BOOL)_canDownscaleSampleImage;
+ (BOOL)allowsParallax;
+ (BOOL)isRunningInPreferencesApp;
- (BOOL)handlesInactiveAppearanceTreatment;
- (BOOL)hasContentOutsideVisibleBounds;
- (BOOL)imageRequiresLuminanceTreatment;
- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4;
- (BOOL)needsInactiveAppearanceTreatment;
- (BOOL)workaround_alwaysForceNoTreatment;
- (CGSize)_imageSize;
- (NSData)displayedImageHashData;
- (NSString)displayedImageHashString;
- (NSURL)_displayedImageURL;
- (PBUIStaticWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (PUIColorBoxes)colorBoxes;
- (UIImage)_displayedImage;
- (UIImage)_sampleImage;
- (double)_contrastInContentViewRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5;
- (double)contrast;
- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5;
- (float)_zoomScale;
- (id)_averageColorInContentViewRect:(CGRect)a3 smudgeRadius:(double)a4;
- (id)_computeAverageColor;
- (id)_createColorBoxes;
- (id)cacheUniqueIdentifier;
- (int64_t)wallpaperType;
- (void)_displayImage:(id)a3;
- (void)_generateImageForImage:(id)a3 cacheKey:(id)a4 options:(unint64_t)a5 downsampleFactor:(double)a6 needsDimmingTreatment:(BOOL)a7 needsInactiveAppearanceTreatment:(BOOL)a8 averageColorProvider:(id)a9 generationHandler:(id)a10;
- (void)_setDisplayedImage:(id)a3;
- (void)_setDisplayedImageURL:(id)a3;
- (void)_setSampleImage:(id)a3;
- (void)_setupContentViewWithOptions:(unint64_t)a3;
- (void)_setupWallpaperImageFromConfiguration:(id)a3 options:(unint64_t)a4;
- (void)_updateColorBoxesWithKey:(id)a3 image:(id)a4;
- (void)preheatImageData;
- (void)setColorBoxes:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCropRect:(CGRect)a3 zoomScale:(double)a4;
- (void)setDisplayedImageHashData:(id)a3;
- (void)setDisplayedImageHashString:(id)a3;
- (void)setNeedsInactiveAppearanceTreatment:(BOOL)a3;
@end

@implementation PBUIStaticWallpaperView

- (int64_t)wallpaperType
{
  return 1;
}

+ (BOOL)_canCacheImages
{
  return 1;
}

+ (BOOL)_canDownscaleSampleImage
{
  return 1;
}

- (void)_setupWallpaperImageFromConfiguration:(id)a3 options:(unint64_t)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v42 = [v5 wallpaperOptions];
  v47 = [v5 wallpaperImageHashData];
  v46 = [v47 base64EncodedStringWithOptions:0];
  [(PBUIStaticWallpaperView *)self setDisplayedImageHashData:v47];
  [(PBUIStaticWallpaperView *)self setDisplayedImageHashString:v46];
  v6 = [v5 wallpaperImage];
  v7 = v6;
  if (v6)
  {
    [v6 size];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    [v42 cropRect];
    double v9 = v12;
    double v11 = v13;
  }
  int v14 = [(id)objc_opt_class() _canDownscaleSampleImage];
  double v15 = 16.0;
  BOOL v16 = v9 >= 16.0;
  if (v11 >= 16.0) {
    BOOL v16 = 1;
  }
  if (!v16) {
    double v15 = 1.0;
  }
  if (v14) {
    BOOL v17 = !v16;
  }
  else {
    BOOL v17 = 1;
  }
  BOOL v41 = v17;
  if (v14) {
    BOOL v18 = v16;
  }
  else {
    BOOL v18 = 0;
  }
  if (v14) {
    double v19 = v15;
  }
  else {
    double v19 = 1.0;
  }
  -[PBUIStaticWallpaperView _setSampleImage:](self, "_setSampleImage:", v7, 1.0, v15);
  [(PBUIStaticWallpaperView *)self _setDisplayedImage:v7];
  v20 = PBUILogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = PBUIStringForWallpaperVariant([(PBUIWallpaperView *)self variant]);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v21;
    _os_log_impl(&dword_1BC4B3000, v20, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] configuration wallpaper image for display image %{public}@ for variant %{public}@", buf, 0x16u);
  }
  [(PBUIStaticWallpaperView *)self _setDisplayedImageURL:0];
  v45 = [(PBUIWallpaperView *)self cacheGroup];
  uint64_t v22 = [v45 length];
  BOOL v23 = v22 != 0;
  if (v22)
  {
    int v24 = [(id)objc_opt_class() _canCacheImages];
    v44 = [(PBUIStaticWallpaperView *)self traitCollection];
    if (v24)
    {
      PBUIWallpaperBackdropParametersMakeIdentity((uint64_t)v56);
      v25 = [(PBUIWallpaperView *)self _cacheKeyForParameters:v56 includingTint:0 downsampleFactor:v44 traitCollection:v19];
    }
    else
    {
      v25 = 0;
      BOOL v23 = 0;
    }
  }
  else
  {
    v44 = [(PBUIStaticWallpaperView *)self traitCollection];
    v25 = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  id v62 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke;
  v55[3] = &unk_1E62B2910;
  v55[4] = self;
  v55[5] = buf;
  v26 = (void *)MEMORY[0x1C1872570](v55);
  uint64_t v27 = [v5 needsWallpaperDimmingTreatment];
  uint64_t v28 = [v5 needsInactiveAppearanceTreatment];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke_2;
  v51[3] = &unk_1E62B2938;
  double v53 = v19;
  BOOL v54 = v41;
  v51[4] = self;
  id v29 = v25;
  id v52 = v29;
  [(PBUIStaticWallpaperView *)self _generateImageForImage:v7 cacheKey:v29 options:a4 downsampleFactor:v27 needsDimmingTreatment:v28 needsInactiveAppearanceTreatment:v26 averageColorProvider:v19 generationHandler:v51];
  if (v18)
  {
    if (v23)
    {
      PBUIWallpaperBackdropParametersMakeIdentity((uint64_t)v50);
      v30 = [(PBUIWallpaperView *)self _cacheKeyForParameters:v50 includingTint:0 downsampleFactor:v44 traitCollection:1.0];
    }
    else
    {
      v30 = 0;
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke_2;
    v48[3] = &unk_1E62B2960;
    v48[4] = self;
    id v31 = v30;
    id v49 = v31;
    [(PBUIStaticWallpaperView *)self _generateImageForImage:v7 cacheKey:v31 options:a4 downsampleFactor:v27 needsDimmingTreatment:v28 needsInactiveAppearanceTreatment:v26 averageColorProvider:1.0 generationHandler:v48];
  }
  v32 = [(PBUIStaticWallpaperView *)self _computeAverageColor];
  [(PBUIWallpaperView *)self resetLegibilitySettingsForAverageColor:v32];

  v33 = (void *)[objc_alloc((Class)getPUIColorStatisticsClass()) initWithDelegate:0];
  v34 = [(PBUIStaticWallpaperView *)self colorBoxes];
  [v33 updateWithColorBoxes:v34];

  v35 = [v33 averageColor];
  if (!v35) {
    goto LABEL_31;
  }
  v36 = [v33 averageColor];
  v37 = [MEMORY[0x1E4F428B8] blackColor];
  int v38 = [v36 _isSimilarToColor:v37 withinPercentage:0.00000011920929];

  if (v38)
  {
LABEL_31:
    v39 = PBUILogCommon();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = PBUIStringForWallpaperVariant([(PBUIWallpaperView *)self variant]);
      *(_DWORD *)v57 = 138543362;
      v58 = v40;
      _os_log_impl(&dword_1BC4B3000, v39, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] displayed image similar to black color for variant %{public}@!!", v57, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
}

id __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _computeAverageColor];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

void __73__PBUIStaticWallpaperView__setupWallpaperImageFromConfiguration_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PBUILogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = *(unsigned __int8 *)(a1 + 56);
    v7 = PBUIStringForWallpaperVariant([*(id *)(a1 + 32) variant]);
    int v11 = 138544130;
    id v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 2114;
    BOOL v18 = v7;
    _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] generated sample image %{public}@ at scale factor %f (same as display: %{BOOL}u) for variant %{public}@", (uint8_t *)&v11, 0x26u);
  }
  if (v3)
  {
    [*(id *)(a1 + 32) _setSampleImage:v3];
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 32) _setDisplayedImage:v3];
      double v8 = *(void **)(a1 + 32);
      double v9 = +[PBUIWallpaperCache wallpaperCache];
      double v10 = [v9 imageURLForKey:*(void *)(a1 + 40)];
      [v8 _setDisplayedImageURL:v10];

      [*(id *)(a1 + 32) _displayImage:v3];
      [*(id *)(a1 + 32) _updateColorBoxesWithKey:*(void *)(a1 + 40) image:v3];
    }
  }
}

{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  __int16 v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PBUILogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = PBUIStringForWallpaperVariant([*(id *)(a1 + 32) variant]);
    double v9 = 138543618;
    double v10 = v3;
    int v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1BC4B3000, v4, OS_LOG_TYPE_DEFAULT, "[LegacyPoster displayedImage] generated display image %{public}@ for variant %{public}@", (uint8_t *)&v9, 0x16u);
  }
  if (v3)
  {
    [*(id *)(a1 + 32) _setDisplayedImage:v3];
    int v6 = *(void **)(a1 + 32);
    v7 = +[PBUIWallpaperCache wallpaperCache];
    double v8 = [v7 imageURLForKey:*(void *)(a1 + 40)];
    [v6 _setDisplayedImageURL:v8];

    [*(id *)(a1 + 32) _displayImage:v3];
    [*(id *)(a1 + 32) _updateColorBoxesWithKey:*(void *)(a1 + 40) image:v3];
  }
}

+ (BOOL)isRunningInPreferencesApp
{
  if (isRunningInPreferencesApp_onceToken != -1) {
    dispatch_once(&isRunningInPreferencesApp_onceToken, &__block_literal_global_1);
  }
  return isRunningInPreferencesApp___result;
}

void __52__PBUIStaticWallpaperView_isRunningInPreferencesApp__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  isRunningInPreferencesApp___result = [v0 isEqualToString:@"com.apple.Preferences"];
}

- (BOOL)workaround_alwaysForceNoTreatment
{
  if (!+[PBUIStaticWallpaperView isRunningInPreferencesApp])return 0; {
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  }
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (void)_generateImageForImage:(id)a3 cacheKey:(id)a4 options:(unint64_t)a5 downsampleFactor:(double)a6 needsDimmingTreatment:(BOOL)a7 needsInactiveAppearanceTreatment:(BOOL)a8 averageColorProvider:(id)a9 generationHandler:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = a10;
  objc_initWeak(location, self);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke;
  v38[3] = &unk_1E62B2988;
  objc_copyWeak(v41, location);
  v41[1] = (id)a5;
  v38[4] = self;
  id v21 = v17;
  id v39 = v21;
  BOOL v42 = a8;
  v41[2] = *(id *)&a6;
  BOOL v43 = a7;
  id v22 = v19;
  id v40 = v22;
  BOOL v23 = (void (**)(void))MEMORY[0x1C1872570](v38);
  int v24 = v23;
  if (v18)
  {
    unint64_t v25 = a5 & 2;
    unint64_t v26 = v25 >> 1;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_2;
    v35[3] = &unk_1E62B29B0;
    char v37 = v26;
    v36 = v23;
    uint64_t v27 = (void *)MEMORY[0x1C1872570](v35);
    uint64_t v28 = +[PBUIWallpaperCache wallpaperCache];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_3;
    v32[3] = &unk_1E62B2A00;
    char v34 = v26;
    id v29 = v20;
    id v33 = v29;
    v30 = [v28 imageForKey:v18 generatingIfNecessaryWithBlock:v27 completion:v32];

    (*((void (**)(id, void *, BOOL))v29 + 2))(v29, v30, v25 != 0);
    id v31 = v36;
  }
  else
  {
    id v31 = v23[2](v23);
    (*((void (**)(id, void *, uint64_t))v20 + 2))(v20, v31, 1);
  }

  objc_destroyWeak(v41);
  objc_destroyWeak(location);
}

id __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v3 = [WeakRetained wallpaperDelegate];
  uint64_t v4 = *(void *)(a1 + 64);
  char v5 = objc_msgSend(*(id *)(a1 + 32), "workaround_alwaysForceNoTreatment");
  uint64_t v6 = 0;
  if ((v5 & 1) == 0 && (v4 & 4) == 0) {
    uint64_t v6 = [WeakRetained imageRequiresLuminanceTreatment];
  }
  id v7 = *(id *)(a1 + 40);
  if (!v7)
  {
    double v8 = [v3 wallpaperView:WeakRetained wallpaperConfigurationIncludingValueTypes:1];
    id v7 = [v8 wallpaperImage];
  }
  [*(id *)(a1 + 32) setUntreatedWallpaperImage:v7];
  if (*(unsigned char *)(a1 + 80))
  {
    double v9 = (PBUIWallpaperLegibilityTreatment *)objc_opt_new();
    if (v9)
    {
LABEL_8:
      double v10 = [[PBUICodableImage alloc] initWithUIImage:v7 error:0];
      int v11 = [[PBUITreatImageRequest alloc] initWithImage:v10 downscaleFactor:v9 treatment:*(double *)(a1 + 72)];
      id v12 = +[PBUICARemoteRenderer remoteRendererIfPossible];
      __int16 v13 = [v12 renderRequest:v11 error:0];

      id v14 = objc_alloc(MEMORY[0x1E4F42A80]);
      [(PBUICodableImage *)v10 scale];
      __int16 v15 = objc_msgSend(v14, "_initWithIOSurface:scale:orientation:", v13, 0);
      objc_msgSend(v15, "pbui_CGImageBackedImageUsingDataProvider");
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  else if ((v5 & 1) == 0 && ((v6 & 1) != 0 || *(double *)(a1 + 72) > 1.0 || (v4 & 4) == 0 && *(unsigned char *)(a1 + 81)))
  {
    id v17 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    double v9 = objc_alloc_init(PBUIWallpaperLegibilityTreatment);
    [(PBUIWallpaperLegibilityTreatment *)v9 setAverageColor:v17];
    [(PBUIWallpaperLegibilityTreatment *)v9 setNeedsDimmingTreatment:*(unsigned __int8 *)(a1 + 81)];
    [(PBUIWallpaperLegibilityTreatment *)v9 setNeedsLuminanceTreatment:v6];

    if (v9) {
      goto LABEL_8;
    }
  }
  id v16 = v7;
LABEL_16:
  id v18 = objc_msgSend(v16, "pbui_CGImageBackedImage");

  return v18;
}

uint64_t __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  int v4 = MGGetBoolAnswer();
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *a2 | v5;
  *a2 = v6;
  if (!*(unsigned char *)(a1 + 40)) {
    *a2 = v6 | 1;
  }
  if (MGGetBoolAnswer()) {
    *a2 |= 2uLL;
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v7();
}

void __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!*(unsigned char *)(a1 + 40))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_4;
    v5[3] = &unk_1E62B29D8;
    id v7 = *(id *)(a1 + 32);
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __178__PBUIStaticWallpaperView__generateImageForImage_cacheKey_options_downsampleFactor_needsDimmingTreatment_needsInactiveAppearanceTreatment_averageColorProvider_generationHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

- (id)cacheUniqueIdentifier
{
  v2 = [(PBUIStaticWallpaperView *)self displayedImageHashString];
  BOOL v3 = [v2 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  return v3;
}

- (PBUIStaticWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PBUIStaticWallpaperView;
  id v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v21, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  id v19 = v18;
  if (v18)
  {
    *(void *)&v18->_overallContrast = PBUIWallpaperViewUnknownContrast;
    v18->_needsInactiveAppearanceTreatment = [v17 needsInactiveAppearanceTreatment];
    [(PBUIStaticWallpaperView *)v19 _setupWallpaperImageFromConfiguration:v17 options:a8];
    [(PBUIStaticWallpaperView *)v19 _setupContentViewWithOptions:a8];
  }

  return v19;
}

- (void)preheatImageData
{
  BOOL v3 = [(PBUIStaticWallpaperView *)self traitCollection];
  id v4 = [(PBUIWallpaperView *)self _cacheKeyForParameters:v6 includingTint:0 downsampleFactor:v3 traitCollection:1.0];

  uint64_t v5 = +[PBUIWallpaperCache wallpaperCache];
  [v5 warmupForKey:v4];
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 wallpaperImageHashData];
  uint64_t v7 = [(PBUIStaticWallpaperView *)self displayedImageHashData];
  int64_t v8 = [(PBUIWallpaperView *)self wallpaperMode];
  double v9 = [v5 wallpaperOptions];
  uint64_t v10 = [v9 wallpaperMode];

  if (v8 == v10
    && (int v11 = [(PBUIWallpaperView *)self needsWallpaperDimmingTreatment],
        v11 == [v5 needsWallpaperDimmingTreatment])
    && (int v12 = [(PBUIStaticWallpaperView *)self needsInactiveAppearanceTreatment],
        v12 == [v5 needsInactiveAppearanceTreatment])
    && v6 | v7)
  {
    char v13 = BSEqualObjects();
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)allowsParallax
{
  return 1;
}

+ (BOOL)_allowsRasterization
{
  return 0;
}

- (id)_computeAverageColor
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PBUIStaticWallpaperView *)self _imageSize];
  return -[PBUIStaticWallpaperView _averageColorInContentViewRect:smudgeRadius:](self, "_averageColorInContentViewRect:smudgeRadius:", v3, v4, v5, v6, 0.0);
}

- (BOOL)hasContentOutsideVisibleBounds
{
  double v3 = [(PBUIStaticWallpaperView *)self _displayedImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  [(PBUIStaticWallpaperView *)self bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  if (round(v5) <= round(CGRectGetWidth(v13))) {
    return 0;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  return round(v7) > round(CGRectGetHeight(v14));
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__PBUIStaticWallpaperView_setContentsRect___block_invoke;
    v11[3] = &unk_1E62B2A28;
    v11[4] = self;
    *(double *)&v11[5] = x;
    *(double *)&v11[6] = y;
    *(double *)&v11[7] = width;
    *(double *)&v11[8] = height;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__PBUIStaticWallpaperView_setContentsRect___block_invoke_2;
    v10[3] = &unk_1E62B2A50;
    v10[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:v10 completion:0.0];
  }
  else
  {
    id v9 = [(PBUIWallpaperView *)self contentView];
    int64_t v8 = [v9 layer];
    objc_msgSend(v8, "setContentsRect:", x, y, width, height);
  }
}

void __43__PBUIStaticWallpaperView_setContentsRect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _beginDisallowRasterizationBlock];
  id v3 = [*(id *)(a1 + 32) contentView];
  v2 = [v3 layer];
  objc_msgSend(v2, "setContentsRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __43__PBUIStaticWallpaperView_setContentsRect___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDisallowRasterizationBlock];
}

- (BOOL)imageRequiresLuminanceTreatment
{
  v2 = [(PBUIWallpaperView *)self legibilitySettings];
  uint64_t v3 = [v2 style];

  return v3 != 2;
}

- (double)contrast
{
  uint64_t v3 = [(PBUIStaticWallpaperView *)self _wallpaperImageForAnalysis];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  int64_t v8 = [(PBUIStaticWallpaperView *)self colorBoxes];
  double v9 = soft_PUICalculateContrastFromColorBoxes(v8, 0, 0, 0.0, 0.0, v5, v7);

  return v9;
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v12 = [(PBUIWallpaperView *)self contentView];

  if (v12)
  {
    v14.receiver = self;
    v14.super_class = (Class)PBUIStaticWallpaperView;
    -[PBUIWallpaperView contrastInRect:contrastWithinBoxes:contrastBetweenBoxes:](&v14, sel_contrastInRect_contrastWithinBoxes_contrastBetweenBoxes_, a4, a5, x, y, width, height);
  }
  else
  {
    -[PBUIStaticWallpaperView _contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:](self, "_contrastInContentViewRect:contrastWithinBoxes:contrastBetweenBoxes:", a4, a5, x, y, width, height);
  }
  return result;
}

- (double)_contrastInContentViewRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v11 = [(PBUIStaticWallpaperView *)self colorBoxes];
  double v12 = soft_PUICalculateContrastFromColorBoxes(v11, (uint64_t)a4, (uint64_t)a5, x, y, width, height);

  return v12;
}

- (id)_averageColorInContentViewRect:(CGRect)a3 smudgeRadius:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [(PBUIStaticWallpaperView *)self colorBoxes];
  uint64_t v10 = soft_PUIAverageColorFromColorBoxes(v9, x, y, width, height, a4);

  return v10;
}

- (void)setCropRect:(CGRect)a3 zoomScale:(double)a4
{
}

- (BOOL)handlesInactiveAppearanceTreatment
{
  return 1;
}

- (void)_setupContentViewWithOptions:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v4 = [PBUIStaticWallpaperImageView alloc];
  double v5 = [(PBUIStaticWallpaperView *)self _displayedImage];
  double v6 = [(PBUIStaticWallpaperImageView *)v4 initWithImage:v5];

  [(PBUIStaticWallpaperImageView *)v6 setOpaque:1];
  double v7 = [(PBUIStaticWallpaperImageView *)v6 layer];
  [v7 setContentsOpaque:1];

  int64_t v8 = PBUILogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [(PBUIStaticWallpaperView *)self _displayedImage];
    int v10 = 138543618;
    int v11 = v6;
    __int16 v12 = 2114;
    CGRect v13 = v9;
    _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_INFO, "set up content view %{public}@ with image %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(PBUIStaticWallpaperView *)self _setUpStaticImageContentView:v6];
  [(PBUIWallpaperView *)self setContentView:v6];
}

- (void)_displayImage:(id)a3
{
  id v9 = a3;
  double v4 = [(PBUIWallpaperView *)self contentView];
  double v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [v4 setImage:v9];
    [v9 size];
    objc_msgSend(v4, "setBounds:", 0.0, 0.0, v7, v8);
  }
}

- (float)_zoomScale
{
  return 1.0;
}

- (CGSize)_imageSize
{
  v2 = [(PBUIStaticWallpaperView *)self wallpaperImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)_createColorBoxes
{
  double v3 = 0;
  if ((soft_PUIFeatureEnabled(0) & 1) == 0)
  {
    double v4 = [(PBUIStaticWallpaperView *)self _wallpaperImageForAnalysis];
    double v3 = [getPUIColorBoxesClass() colorBoxesForImage:v4];
  }
  return v3;
}

- (void)_updateColorBoxesWithKey:(id)a3 image:(id)a4
{
  id v9 = a3;
  if (v9)
  {
    double v6 = objc_msgSend(a4, "pbui_CGImageBackedImage");
    double v7 = +[PBUIWallpaperCache wallpaperCache];
    double v8 = [v7 colorBoxesForKey:v9 generatingIfNeceesaryFromImage:v6];

    [(PBUIStaticWallpaperView *)self setColorBoxes:v8];
  }
  else
  {
    double v6 = [(PBUIStaticWallpaperView *)self _createColorBoxes];
    [(PBUIStaticWallpaperView *)self setColorBoxes:v6];
  }
}

- (void)setColorBoxes:(id)a3
{
  double v6 = (PUIColorBoxes *)a3;
  if (self->_colorBoxes != v6)
  {
    objc_storeStrong((id *)&self->_colorBoxes, a3);
    [(PUIColorBoxes *)v6 contrast];
    self->_overallContrast = v5;
  }
}

- (PUIColorBoxes)colorBoxes
{
  colorBoxes = self->_colorBoxes;
  if (!colorBoxes)
  {
    double v4 = [(PBUIStaticWallpaperView *)self _createColorBoxes];
    [(PBUIStaticWallpaperView *)self setColorBoxes:v4];

    colorBoxes = self->_colorBoxes;
  }
  return colorBoxes;
}

- (UIImage)_displayedImage
{
  return self->_displayedImage;
}

- (void)_setDisplayedImage:(id)a3
{
}

- (NSURL)_displayedImageURL
{
  return self->_displayedImageURL;
}

- (void)_setDisplayedImageURL:(id)a3
{
}

- (UIImage)_sampleImage
{
  return self->_sampleImage;
}

- (void)_setSampleImage:(id)a3
{
}

- (NSData)displayedImageHashData
{
  return self->_displayedImageHashData;
}

- (void)setDisplayedImageHashData:(id)a3
{
}

- (NSString)displayedImageHashString
{
  return self->_displayedImageHashString;
}

- (void)setDisplayedImageHashString:(id)a3
{
}

- (BOOL)needsInactiveAppearanceTreatment
{
  return self->_needsInactiveAppearanceTreatment;
}

- (void)setNeedsInactiveAppearanceTreatment:(BOOL)a3
{
  self->_needsInactiveAppearanceTreatment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedImageHashString, 0);
  objc_storeStrong((id *)&self->_displayedImageHashData, 0);
  objc_storeStrong((id *)&self->_sampleImage, 0);
  objc_storeStrong((id *)&self->_displayedImageURL, 0);
  objc_storeStrong((id *)&self->_displayedImage, 0);
  objc_storeStrong((id *)&self->_colorBoxes, 0);
}

@end