@interface SBSUIWallpaperPreviewViewController
- (BOOL)colorSamplingEnabled;
- (BOOL)irisEnabled;
- (BOOL)motionEnabled;
- (BOOL)prefersStatusBarHidden;
- (CGRect)cropRect;
- (SBFLegibilitySettingsProviderDelegate)delegate;
- (SBFWallpaperOptions)wallpaperOptions;
- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3;
- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 name:(id)a4;
- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 name:(id)a4 video:(id)a5 time:(double)a6;
- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 video:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9;
- (SBSUIWallpaperPreviewViewController)initWithImages:(id)a3 videos:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9;
- (SBSUIWallpaperPreviewViewController)initWithImages:(id)a3 videos:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9 disableParallax:(BOOL)a10;
- (SBSUIWallpaperPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBSUIWallpaperPreviewViewController)initWithProceduralWallpaper:(id)a3 options:(id)a4;
- (SBSUIWallpaperPreviewViewController)initWithProceduralWallpaper:(id)a3 options:(id)a4 variant:(int64_t)a5 disableSegmentedControl:(BOOL)a6 enableButtons:(BOOL)a7 disableContents:(BOOL)a8;
- (SBSUIWallpaperPreviewViewController)initWithScrollableImage:(id)a3;
- (SBSUIWallpaperPreviewViewController)initWithScrollableImage:(id)a3 video:(id)a4 time:(double)a5;
- (SBSUIWallpaperPreviewViewController)initWithWallpaperVariant:(int64_t)a3;
- (SBSUIWallpaperPreviewViewControllerDelegate)previewDelegate;
- (UIImage)wallpaperImage;
- (_UILegibilitySettings)legibilitySettings;
- (double)_parallaxFactor;
- (double)parallaxFactor;
- (double)zoomScale;
- (id)_colorWallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 configuration:(id)a5;
- (id)_dateView;
- (id)_proceduralWallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 configuration:(id)a5;
- (id)_wallpaperConfigurationManager;
- (id)_wallpaperTypeDescription;
- (id)_wallpaperView;
- (id)_wallpaperViewIfLoaded;
- (id)_wallpaperViewWithFrame:(CGRect)a3;
- (id)_wallpaperViewWithFrame:(CGRect)a3 image:(id)a4 video:(id)a5 videoURL:(id)a6 stillTimeInVideo:(double)a7 supportsCropping:(BOOL)a8 variant:(int64_t)a9 needsWallpaperDimming:(BOOL)a10;
- (id)_wallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 options:(id)a5;
- (int64_t)_wallpaperType;
- (void)_applyHomeScreenPreview;
- (void)_displaySettingWallpaperHUD;
- (void)_enableIrisOrParallaxIfEligible;
- (void)_logWallpaperChangeForLocations:(int64_t)a3;
- (void)_setImageWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4;
- (void)_setProceduralWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4;
- (void)_setWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4;
- (void)_setWallpaperImagesOnMainThread:(id)a3 options:(id)a4 locations:(int64_t)a5 completionHandler:(id)a6;
- (void)_startDateTimer;
- (void)_stopDateTimer;
- (void)_updateDateView;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)providerLegibilitySettingsChanged:(id)a3;
- (void)setColorSamplingEnabled:(BOOL)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setImageWallpaperForLocations:(int64_t)a3 completionHandler:(id)a4;
- (void)setIrisEnabled:(BOOL)a3;
- (void)setMotionEnabled:(BOOL)a3;
- (void)setMotionEnabled:(BOOL)a3 updateParallaxOnWallpaperView:(BOOL)a4;
- (void)setParallaxFactor:(double)a3;
- (void)setPreviewDelegate:(id)a3;
- (void)setWallpaperForLocations:(int64_t)a3;
- (void)setWallpaperForLocations:(int64_t)a3 completionHandler:(id)a4;
- (void)setWallpaperImages:(id)a3 options:(id)a4 locations:(int64_t)a5;
- (void)setWallpaperImages:(id)a3 options:(id)a4 locations:(int64_t)a5 completionHandler:(id)a6;
- (void)setZoomScale:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)userDidTapOnCancelButton:(id)a3;
- (void)userDidTapOnIrisButton:(id)a3;
- (void)userDidTapOnParallaxButton:(id)a3;
- (void)userDidTapOnSetButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBSUIWallpaperPreviewViewController

- (SBSUIWallpaperPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBSUIWallpaperPreviewViewController;
  result = [(SBSUIWallpaperPreviewViewController *)&v5 initWithNibName:0 bundle:0];
  if (result)
  {
    result->_motionEnabled = 1;
    result->_variant = -1;
  }
  return result;
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBSUIWallpaperPreviewViewController *)self initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F83BD8]) initWithVariant:-1 type:1];
    initialConfiguration = v5->_initialConfiguration;
    v5->_initialConfiguration = (PBUIWallpaperConfiguration *)v6;

    if ([v4 imageOrientation])
    {
      v8 = [MEMORY[0x1E4F42A60] defaultFormat];
      v9 = (void *)[v8 copy];

      [v4 scale];
      objc_msgSend(v9, "setScale:");
      [v4 size];
      double v11 = v10;
      double v13 = v12;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v9, v10, v12);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __53__SBSUIWallpaperPreviewViewController_initWithImage___block_invoke;
      v23[3] = &unk_1E5CCDD68;
      id v24 = v4;
      double v25 = v11;
      double v26 = v13;
      id v4 = [v14 imageWithActions:v23];
    }
    id v15 = objc_alloc(MEMORY[0x1E4F83C08]);
    id v4 = v4;
    uint64_t v16 = [v4 CGImage];
    v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 scale];
    v19 = (UIImage *)objc_msgSend(v15, "initWithCGImage:scale:orientation:wallpaperFileURL:", v16, objc_msgSend(v4, "imageOrientation"), 0, v18);

    wallpaperImage = v5->_wallpaperImage;
    v5->_wallpaperImage = v19;
    v21 = v19;

    [(PBUIWallpaperConfiguration *)v5->_initialConfiguration setWallpaperImage:v21];
  }

  return v5;
}

uint64_t __53__SBSUIWallpaperPreviewViewController_initWithImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (SBSUIWallpaperPreviewViewController)initWithWallpaperVariant:(int64_t)a3
{
  id v4 = [(SBSUIWallpaperPreviewViewController *)self initWithNibName:0 bundle:0];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F83BD8]) initWithVariant:-1 type:1];
    initialConfiguration = v4->_initialConfiguration;
    v4->_initialConfiguration = (PBUIWallpaperConfiguration *)v5;

    v4->_variant = a3;
  }
  return v4;
}

- (SBSUIWallpaperPreviewViewController)initWithProceduralWallpaper:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(SBSUIWallpaperPreviewViewController *)self initWithNibName:0 bundle:0];
  if (v9)
  {
    double v10 = (void *)[v7 mutableCopy];
    double v11 = v10;
    if (v8) {
      [v10 setObject:v8 forKey:*MEMORY[0x1E4F83C48]];
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F83BD8]) initWithVariant:-1 type:2];
    initialConfiguration = v9->_initialConfiguration;
    v9->_initialConfiguration = (PBUIWallpaperConfiguration *)v12;

    [(PBUIWallpaperConfiguration *)v9->_initialConfiguration setProceduralWallpaperInfo:v11];
    objc_storeStrong((id *)&v9->_proceduralWallpaper, a3);
    objc_storeStrong((id *)&v9->_proceduralWallpaperOptions, a4);
  }
  return v9;
}

- (SBSUIWallpaperPreviewViewController)initWithProceduralWallpaper:(id)a3 options:(id)a4 variant:(int64_t)a5 disableSegmentedControl:(BOOL)a6 enableButtons:(BOOL)a7 disableContents:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = [(SBSUIWallpaperPreviewViewController *)self initWithNibName:0 bundle:0];
  if (v16)
  {
    v17 = (void *)[v14 mutableCopy];
    double v18 = v17;
    if (v15) {
      [v17 setObject:v15 forKey:*MEMORY[0x1E4F83C48]];
    }
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F83BD8]) initWithVariant:-1 type:2];
    initialConfiguration = v16->_initialConfiguration;
    v16->_initialConfiguration = (PBUIWallpaperConfiguration *)v19;

    [(PBUIWallpaperConfiguration *)v16->_initialConfiguration setProceduralWallpaperInfo:v18];
    objc_storeStrong((id *)&v16->_proceduralWallpaper, a3);
    objc_storeStrong((id *)&v16->_proceduralWallpaperOptions, a4);
    v16->_variant = a5;
    v16->_enableButtons = a7;
    v16->_disableContents = a8;
  }
  return v16;
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 name:(id)a4
{
  return [(SBSUIWallpaperPreviewViewController *)self initWithImage:a3 name:a4 video:0 time:0.0];
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 name:(id)a4 video:(id)a5 time:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(SBSUIWallpaperPreviewViewController *)self initWithImage:a3];
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F83C10]);
    [v13 setName:v10];
    [v13 setStillTimeInVideo:a6];
    [(PBUIWallpaperConfiguration *)v12->_initialConfiguration setWallpaperOptions:v13];
    uint64_t v14 = [v10 copy];
    name = v12->_name;
    v12->_name = (NSString *)v14;

    objc_storeStrong((id *)&v12->_video, a5);
    if (v11) {
      v12->_stillTimeInVideo = a6;
    }
    uint64_t v16 = v12;
  }
  return v12;
}

- (SBSUIWallpaperPreviewViewController)initWithImage:(id)a3 video:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9
{
  BOOL v26 = a7;
  BOOL v27 = a8;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = SBLogWallpaper();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = PBUIStringForWallpaperVariant();
    *(_DWORD *)buf = 67240706;
    BOOL v29 = v15 != 0;
    __int16 v30 = 2114;
    id v31 = v13;
    __int16 v32 = 2114;
    v33 = v17;
    _os_log_impl(&dword_1A7607000, v16, OS_LOG_TYPE_DEFAULT, "Initializing full screen preview with given image: %{public}d and options: %{public}@ for variant: %{public}@", buf, 0x1Cu);
  }
  double v18 = PBUIStringForWallpaperMode();
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v15, v18, 0);
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v14, v18, 0);

  id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v13, v18, 0);
  LOWORD(v25) = a9;
  v23 = -[SBSUIWallpaperPreviewViewController initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:](self, "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:", v19, v20, a5, v22, v26, v27, v25);

  return v23;
}

- (SBSUIWallpaperPreviewViewController)initWithImages:(id)a3 videos:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9
{
  LOWORD(v10) = a9;
  return -[SBSUIWallpaperPreviewViewController initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:](self, "initWithImages:videos:variant:options:disableSegmentedControl:enableButtons:disableContents:disableParallax:", a3, a4, a5, a6, a7, a8, v10);
}

- (SBSUIWallpaperPreviewViewController)initWithImages:(id)a3 videos:(id)a4 variant:(int64_t)a5 options:(id)a6 disableSegmentedControl:(BOOL)a7 enableButtons:(BOOL)a8 disableContents:(BOOL)a9 disableParallax:(BOOL)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v17 = SBLogWallpaper();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = PBUIStringForWallpaperVariant();
    *(_DWORD *)buf = 67240706;
    BOOL v37 = v14 != 0;
    __int16 v38 = 2114;
    id v39 = v16;
    __int16 v40 = 2114;
    v41 = v18;
    _os_log_impl(&dword_1A7607000, v17, OS_LOG_TYPE_DEFAULT, "Initializing full screen preview with given image: %{public}d and options: %{public}@ for variant: %{public}@", buf, 0x1Cu);
  }
  uint64_t v19 = [(SBSUIWallpaperPreviewViewController *)self init];
  if ((unint64_t)[v14 count] >= 2)
  {
    v20 = [(SBSUIWallpaperPreviewViewController *)v19 traitCollection];
    [v20 userInterfaceStyle];
  }
  id v21 = PBUIStringForWallpaperMode();
  v22 = [v14 objectForKeyedSubscript:v21];
  uint64_t v23 = [(SBSUIWallpaperPreviewViewController *)v19 initWithImage:v22];

  if (v23)
  {
    objc_storeStrong((id *)(v23 + 1016), a3);
    objc_storeStrong((id *)(v23 + 1080), a4);
    objc_storeStrong((id *)(v23 + 1104), a6);
    uint64_t v24 = [v16 objectForKeyedSubscript:v21];
    uint64_t v25 = *(void **)(v23 + 1096);
    *(void *)(v23 + 1096) = v24;

    [*(id *)(v23 + 1000) setWallpaperOptions:*(void *)(v23 + 1096)];
    BOOL v26 = [*(id *)(v23 + 1096) name];
    uint64_t v27 = [v26 copy];
    v28 = *(void **)(v23 + 1056);
    *(void *)(v23 + 1056) = v27;

    uint64_t v29 = [v15 objectForKeyedSubscript:v21];
    __int16 v30 = *(void **)(v23 + 1072);
    *(void *)(v23 + 1072) = v29;

    *(void *)(v23 + 1048) = a5;
    *(unsigned char *)(v23 + 1040) = [*(id *)(v23 + 1096) supportsCropping];
    *(unsigned char *)(v23 + 1112) = a8;
    *(unsigned char *)(v23 + 1113) = a9;
    *(unsigned char *)(v23 + 1114) = a10;
    if (*(void *)(v23 + 1072))
    {
      [*(id *)(v23 + 1096) stillTimeInVideo];
      *(void *)(v23 + 1088) = v31;
    }
    id v32 = (id)v23;
  }

  return (SBSUIWallpaperPreviewViewController *)v23;
}

- (SBSUIWallpaperPreviewViewController)initWithScrollableImage:(id)a3
{
  return [(SBSUIWallpaperPreviewViewController *)self initWithScrollableImage:a3 video:0 time:0.0];
}

- (SBSUIWallpaperPreviewViewController)initWithScrollableImage:(id)a3 video:(id)a4 time:(double)a5
{
  id v9 = a4;
  uint64_t v10 = [(SBSUIWallpaperPreviewViewController *)self initWithImage:a3];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F83C10]);
    [v11 setStillTimeInVideo:a5];
    [(PBUIWallpaperConfiguration *)v10->_initialConfiguration setWallpaperOptions:v11];
    v10->_allowScrolling = 1;
    objc_storeStrong((id *)&v10->_video, a4);
    if (v9) {
      v10->_stillTimeInVideo = a5;
    }
    uint64_t v12 = v10;
  }
  return v10;
}

- (void)dealloc
{
  if ([(SBSUIWallpaperPreviewViewController *)self isViewLoaded])
  {
    v3 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
    [v3 removeObserver:self forKeyPath:@"parallaxEnabled"];
    [v3 setDelegate:0];
    if (_os_feature_enabled_impl())
    {
      id v4 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
      [v4 setDateView:0];

      [(SBFLockScreenDateViewController *)self->_dateViewController removeFromParentViewController];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SBSUIWallpaperPreviewViewController;
  [(SBSUIWallpaperPreviewViewController *)&v5 dealloc];
}

- (void)loadView
{
  v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:](self, "_wallpaperViewWithFrame:", v5, v7, v9, v11);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v32 parallaxEnabled];
  id v13 = -[SBSUIWallpaperPreviewView initWithFrame:wallpaperView:disableParallax:]([SBSUIWallpaperPreviewView alloc], "initWithFrame:wallpaperView:disableParallax:", v32, self->_disableParallax, v5, v7, v9, v11);
  [(SBSUIWallpaperPreviewView *)v13 setDelegate:self];
  [(SBSUIWallpaperPreviewViewController *)self setView:v13];
  [v32 addObserver:self forKeyPath:@"parallaxEnabled" options:0 context:&SBParallaxEnabledChanged];
  [(SBSUIWallpaperPreviewViewController *)self setMotionEnabled:v12];
  if (!self->_enableButtons)
  {
    [(SBSUIWallpaperPreviewView *)v13 setIrisButton:0];
    [(SBSUIWallpaperPreviewView *)v13 setParallaxButton:0];
    [(SBSUIWallpaperPreviewView *)v13 setCancelButton:0];
    [(SBSUIWallpaperPreviewView *)v13 setSetButton:0];
  }
  if (self->_variant == 1) {
    goto LABEL_24;
  }
  if (!self->_disableContents)
  {
    v34.origin.x = v5;
    v34.origin.y = v7;
    v34.size.width = v9;
    v34.size.height = v11;
    double Width = CGRectGetWidth(v34);
    v35.origin.x = v5;
    v35.origin.y = v7;
    v35.size.width = v9;
    v35.size.height = v11;
    double Height = CGRectGetHeight(v35);
    if (Width >= Height) {
      double Width = Height;
    }
    v36.origin.x = v5;
    v36.origin.y = v7;
    v36.size.width = v9;
    v36.size.height = v11;
    double v19 = CGRectGetWidth(v36);
    v37.origin.x = v5;
    v37.origin.y = v7;
    v37.size.width = v9;
    v37.size.height = v11;
    double v20 = CGRectGetHeight(v37);
    if (v19 < v20) {
      double v19 = v20;
    }
    id v21 = SBSUIWallpaperGetPreview(0, 250, Width);
    v22 = SBSUIWallpaperGetPreview(0, 378, v19);
    uint64_t v23 = -[_SBSUIOrientedImageView initWithFrame:]([_SBSUIOrientedImageView alloc], "initWithFrame:", v5, v7, v9, v11);
    [(_SBSUIOrientedImageView *)v23 setAutoresizingMask:18];
    [(_SBSUIOrientedImageView *)v23 setPortraitImage:v21];
    [(_SBSUIOrientedImageView *)v23 setLandscapeImage:v22];
    uint64_t v24 = [(SBSUIWallpaperPreviewViewController *)self view];
    [v24 addSubview:v23];

    if (_os_feature_enabled_impl())
    {
      uint64_t v25 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E4FA5F60]);
      dateViewController = self->_dateViewController;
      self->_dateViewController = v25;

      uint64_t v27 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
      v28 = [MEMORY[0x1E4FA5F58] timeFont];
      [v27 setCustomTimeFont:v28];

      uint64_t v29 = [(SBSUIWallpaperPreviewViewController *)self legibilitySettings];
      [v27 setLegibilitySettings:v29];

      [(SBSUIWallpaperPreviewViewController *)self addChildViewController:self->_dateViewController];
      __int16 v30 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
      [v30 setDateView:v27];
    }
    if (self->_variant == 1)
    {
LABEL_24:
      if (!self->_disableContents)
      {
        id v14 = -[_SBSUIOrientedImageView initWithFrame:]([_SBSUIOrientedImageView alloc], "initWithFrame:", v5, v7, v9, v11);
        homeScreenPreviewView = self->_homeScreenPreviewView;
        self->_homeScreenPreviewView = v14;

        [(_SBSUIOrientedImageView *)self->_homeScreenPreviewView setAutoresizingMask:18];
        id v16 = [(SBSUIWallpaperPreviewViewController *)self view];
        [v16 addSubview:self->_homeScreenPreviewView];

        [(SBSUIWallpaperPreviewViewController *)self _applyHomeScreenPreview];
      }
    }
  }
  [(SBSUIWallpaperPreviewViewController *)self _enableIrisOrParallaxIfEligible];
  if ([v32 parallaxEnabled] & 1) == 0 && (objc_opt_respondsToSelector()) {
    [v32 setAutomaticallyEnablesParallax:0];
  }
  uint64_t v31 = [v32 legibilitySettings];
  if (v31) {
    [(SBSUIWallpaperPreviewViewController *)self providerLegibilitySettingsChanged:v32];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSUIWallpaperPreviewViewController;
  [(SBSUIWallpaperPreviewViewController *)&v4 viewWillAppear:a3];
  [(SBSUIWallpaperPreviewViewController *)self _updateDateView];
  [(SBSUIWallpaperPreviewViewController *)self _enableIrisOrParallaxIfEligible];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSUIWallpaperPreviewViewController;
  [(SBSUIWallpaperPreviewViewController *)&v4 viewWillDisappear:a3];
  [(SBSUIWallpaperPreviewViewController *)self _stopDateTimer];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBSUIWallpaperPreviewViewController;
  [(SBSUIWallpaperPreviewViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = SBLogWallpaper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperTypeDescription];
    *(_DWORD *)buf = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "PRESENTING Wallpaper Preview View Controller: %{public}@", buf, 0xCu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)SBSUIWallpaperPreviewViewController;
  [(SBSUIWallpaperPreviewViewController *)&v6 viewDidDisappear:a3];
  objc_super v4 = SBLogWallpaper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperTypeDescription];
    *(_DWORD *)buf = 138543362;
    double v8 = v5;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "DISMISSING Wallpaper Preview View Controller: %{public}@", buf, 0xCu);
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = [(SBSUIWallpaperPreviewViewController *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (!v6) {
    return;
  }
  if ([(NSDictionary *)self->_wallpaperImageDict count] >= 2)
  {
    double v7 = [(SBSUIWallpaperPreviewViewController *)self traitCollection];
    [v7 userInterfaceStyle];

    double v8 = PBUIStringForWallpaperMode();
    uint64_t v9 = [(NSDictionary *)self->_wallpaperImageDict objectForKeyedSubscript:v8];
    wallpaperImage = self->_wallpaperImage;
    self->_wallpaperImage = v9;

    if ([(NSDictionary *)self->_videoDict count] >= 2)
    {
      double v11 = [(NSDictionary *)self->_videoDict objectForKeyedSubscript:v8];
      video = self->_video;
      self->_video = v11;
    }
    if ([(NSDictionary *)self->_optionsDict count] >= 2)
    {
      id v13 = [(NSDictionary *)self->_optionsDict objectForKeyedSubscript:v8];
      options = self->_options;
      self->_options = v13;
    }
  }
  if ([(NSDictionary *)self->_wallpaperImageDict count] > 1) {
    goto LABEL_11;
  }
  id v15 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperConfigurationManager];
  if (![v15 enableWallpaperDimming])
  {
LABEL_18:

    goto LABEL_19;
  }
  NSUInteger v16 = [(NSDictionary *)self->_wallpaperImageDict count];

  if (v16 == 1)
  {
LABEL_11:
    v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    BOOL v26 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:](self, "_wallpaperViewWithFrame:", v19, v21, v23, v25);
    id v15 = v26;
    if (v26)
    {
      [v26 setDelegate:self];
      [v15 addObserver:self forKeyPath:@"parallaxEnabled" options:0 context:&SBParallaxEnabledChanged];
      objc_msgSend(v15, "setParallaxEnabled:", -[SBSUIWallpaperPreviewViewController motionEnabled](self, "motionEnabled"));
      if (self->_video)
      {
        id v27 = v15;
        if (objc_opt_respondsToSelector()) {
          v28 = v27;
        }
        else {
          v28 = 0;
        }
        id v29 = v28;

        __int16 v30 = [v29 irisGestureRecognizer];

        uint64_t v31 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
        id v32 = [v31 irisButton];
        objc_msgSend(v30, "setEnabled:", objc_msgSend(v32, "isSelected"));
      }
      v33 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
      [v33 setWallpaperView:v15];
    }
    goto LABEL_18;
  }
LABEL_19:
  if (self->_variant == 1 && !self->_disableContents)
  {
    [(SBSUIWallpaperPreviewViewController *)self _applyHomeScreenPreview];
  }
}

- (id)_wallpaperConfigurationManager
{
  wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  if (!wallpaperConfigurationManager)
  {
    id v4 = (PBUIWallpaperConfigurationManager *)objc_alloc_init(MEMORY[0x1E4F83BE0]);
    double v5 = self->_wallpaperConfigurationManager;
    self->_wallpaperConfigurationManager = v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F83BE8]);
    -[PBUIWallpaperConfigurationManager setEnableWallpaperDimming:](self->_wallpaperConfigurationManager, "setEnableWallpaperDimming:", [v6 enableWallpaperDimming]);

    wallpaperConfigurationManager = self->_wallpaperConfigurationManager;
  }
  return wallpaperConfigurationManager;
}

- (id)_wallpaperTypeDescription
{
  v14[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperType];
  switch(v3)
  {
    case 1:
      uint64_t v8 = 1008;
LABEL_11:
      double v7 = [*(id *)((char *)&self->super.super.super.isa + v8) description];
      break;
    case 3:
      uint64_t v8 = 1072;
      goto LABEL_11;
    case 2:
      proceduralWallpaperOptions = self->_proceduralWallpaperOptions;
      v13[0] = @"proceduralWallpaperOptions";
      v13[1] = @"proceduralWallpaper";
      proceduralWallpaper = self->_proceduralWallpaper;
      if (!proceduralWallpaperOptions) {
        proceduralWallpaperOptions = (NSDictionary *)MEMORY[0x1E4F1CC08];
      }
      if (!proceduralWallpaper) {
        proceduralWallpaper = (NSDictionary *)MEMORY[0x1E4F1CC08];
      }
      v14[0] = proceduralWallpaperOptions;
      v14[1] = proceduralWallpaper;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      double v7 = [v6 description];

      break;
    default:
      double v7 = @"(NO CONTEXT)";
      break;
  }
  uint64_t v9 = NSString;
  double v10 = PBUIStringForWallpaperType();
  double v11 = [v9 stringWithFormat:@"%@ : %@", v10, v7];

  return v11;
}

- (int64_t)_wallpaperType
{
  if (self->_proceduralWallpaper) {
    return 2;
  }
  if (self->_video) {
    return 3;
  }
  return self->_wallpaperImage != 0;
}

- (double)_parallaxFactor
{
  v2 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  double v3 = 0.0;
  if ([v2 parallaxEnabled])
  {
    [v2 parallaxFactor];
    double v3 = v4;
  }

  return v3;
}

- (void)setWallpaperForLocations:(int64_t)a3
{
}

- (void)setWallpaperForLocations:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(SBSUIWallpaperPreviewViewController *)self _setWallpaperForLocationsOnMainThread:a3 completionHandler:v6];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SBSUIWallpaperPreviewViewController_setWallpaperForLocations_completionHandler___block_invoke;
    block[3] = &unk_1E5CCDD90;
    block[4] = self;
    int64_t v9 = a3;
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__SBSUIWallpaperPreviewViewController_setWallpaperForLocations_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWallpaperForLocationsOnMainThread:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_setWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4
{
  id v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(SBSUIWallpaperPreviewViewController *)self _logWallpaperChangeForLocations:a3];
  id v6 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  unint64_t v7 = [v6 wallpaperType];
  if (v7 <= 5)
  {
    if (((1 << v7) & 0xB) != 0)
    {
      [(SBSUIWallpaperPreviewViewController *)self setImageWallpaperForLocations:a3 completionHandler:v8];
    }
    else if (((1 << v7) & 0x30) != 0)
    {
      if (v8) {
        v8[2](v8, v8);
      }
    }
    else
    {
      [(SBSUIWallpaperPreviewViewController *)self _setProceduralWallpaperForLocationsOnMainThread:a3 completionHandler:v8];
    }
  }
}

- (void)setWallpaperImages:(id)a3 options:(id)a4 locations:(int64_t)a5
{
}

- (void)setWallpaperImages:(id)a3 options:(id)a4 locations:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = (void *)[a3 copy];
  id v13 = (void *)[v11 copy];

  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(SBSUIWallpaperPreviewViewController *)self _setWallpaperImagesOnMainThread:v12 options:v13 locations:a5 completionHandler:v10];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__SBSUIWallpaperPreviewViewController_setWallpaperImages_options_locations_completionHandler___block_invoke;
    block[3] = &unk_1E5CCDDB8;
    block[4] = self;
    id v15 = v12;
    id v16 = v13;
    int64_t v18 = a5;
    id v17 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __94__SBSUIWallpaperPreviewViewController_setWallpaperImages_options_locations_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWallpaperImagesOnMainThread:*(void *)(a1 + 40) options:*(void *)(a1 + 48) locations:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

- (void)_setWallpaperImagesOnMainThread:(id)a3 options:(id)a4 locations:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(SBSUIWallpaperPreviewViewController *)self _displaySettingWallpaperHUD];
  id v13 = [(SBSUIWallpaperPreviewViewController *)self traitCollection];
  uint64_t v14 = [v13 userInterfaceStyle];

  if (v14 == 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2 * (v14 == 2);
  }
  BOOL v16 = [(SBSUIWallpaperPreviewViewController *)self irisEnabled];
  if (![(NSDictionary *)self->_videoDict count]) {
    BOOL v16 = 0;
  }
  id v17 = dispatch_get_global_queue(0, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __107__SBSUIWallpaperPreviewViewController__setWallpaperImagesOnMainThread_options_locations_completionHandler___block_invoke;
  v21[3] = &unk_1E5CCDDE0;
  BOOL v27 = v16;
  id v22 = v10;
  id v23 = v11;
  int64_t v25 = a5;
  uint64_t v26 = v15;
  id v24 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v17, v21);
}

uint64_t __107__SBSUIWallpaperPreviewViewController__setWallpaperImagesOnMainThread_options_locations_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if ((v2 & 1) != 0 && !*(unsigned char *)(a1 + 72))
  {
    SBSUIWallpaperClearVideo();
    uint64_t v2 = *(void *)(a1 + 56);
  }
  SBSUIWallpaperSetImages(*(void **)(a1 + 32), *(void **)(a1 + 40), v2, *(void *)(a1 + 64));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setImageWallpaperForLocations:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(SBSUIWallpaperPreviewViewController *)self _setImageWallpaperForLocationsOnMainThread:a3 completionHandler:v6];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__SBSUIWallpaperPreviewViewController_setImageWallpaperForLocations_completionHandler___block_invoke;
    block[3] = &unk_1E5CCDD90;
    block[4] = self;
    int64_t v9 = a3;
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __87__SBSUIWallpaperPreviewViewController_setImageWallpaperForLocations_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setImageWallpaperForLocationsOnMainThread:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_setImageWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4
{
  id v88 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v6 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  uint64_t v7 = [(SBSUIWallpaperPreviewViewController *)self wallpaperImage];
  id v8 = (void *)v7;
  [(SBSUIWallpaperPreviewViewController *)self _parallaxFactor];
  double v10 = v9;
  [v6 cropZoomScale];
  double v12 = v11;
  [v6 cropRect];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v6 supportsCropping];
  uint64_t v22 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  double stillTimeInVideo = 0.0;
  if ((a3 & 1) == 0 || ![(SBSUIWallpaperPreviewViewController *)self irisEnabled])
  {
LABEL_12:
    BOOL v86 = 0;
    BOOL v27 = 0;
    goto LABEL_13;
  }
  if (self->_variant == -1)
  {
    video = self->_video;
    id v32 = video;
    if (video)
    {
      BOOL v27 = v32;
      double stillTimeInVideo = self->_stillTimeInVideo;
      BOOL v86 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v24 = v6;
  if (objc_opt_respondsToSelector()) {
    int64_t v25 = v24;
  }
  else {
    int64_t v25 = 0;
  }
  id v26 = v25;

  BOOL v27 = [v26 videoFileURL];
  BOOL v86 = v27 != 0;

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E4F166C8];
    id v29 = [v26 videoFileURL];
    BOOL v27 = [v28 assetWithURL:v29];

    [v26 stillTimeInVideo];
    double stillTimeInVideo = v30;
  }

LABEL_13:
  if (!v7)
  {
    id v8 = [v6 untreatedWallpaperImage];
  }
  if ([(SBSUIWallpaperPreviewViewController *)self irisEnabled])
  {
    NSUInteger v33 = [(NSDictionary *)self->_videoDict count];
    if ((a3 & 1) != 0 && v33 >= 2)
    {
      CGRect v34 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke;
      block[3] = &unk_1E5CCDE08;
      double v105 = v14;
      double v106 = v16;
      double v107 = v18;
      double v108 = v20;
      id v103 = v8;
      v104 = self;
      char v109 = v21;
      dispatch_async(v34, block);
    }
  }
  unint64_t v35 = v22 - 1;
  int64_t v87 = a3;
  if ([(NSDictionary *)self->_wallpaperImageDict count] < 2)
  {
    BOOL v85 = v7 == 0;
    [(SBSUIWallpaperPreviewViewController *)self _displaySettingWallpaperHUD];
    v66 = v6;
    v67 = (void *)MEMORY[0x1E4F83C10];
    v68 = (void *)[(NSString *)self->_name copy];
    v69 = v8;
    optionsDict = self->_optionsDict;
    PBUIStringForWallpaperMode();
    uint64_t v71 = v21;
    v73 = v72 = v27;
    v74 = [(NSDictionary *)optionsDict objectForKeyedSubscript:v73];
    v75 = [v74 wallpaperKitData];
    v76 = v67;
    v65 = v66;
    v77 = objc_msgSend(v76, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v68, v71, v35 < 2, v86, 0, 1, v10, v12, v14, v16, v18, v20, stillTimeInVideo, v75);

    v64 = v69;
    v59 = v72;

    v78 = dispatch_get_global_queue(0, 0);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke_2;
    v89[3] = &unk_1E5CCDE30;
    BOOL v99 = v86;
    int64_t v94 = v87;
    BOOL v100 = v85;
    double v95 = v14;
    double v96 = v16;
    double v97 = v18;
    double v98 = v20;
    id v90 = v69;
    char v101 = v71;
    id v91 = v72;
    id v92 = v77;
    id v93 = v88;
    id v58 = v77;
    dispatch_async(v78, v89);

    v57 = v90;
  }
  else
  {
    BOOL v36 = v35 < 2;
    BOOL v79 = v35 < 2;
    CGRect v37 = (void *)MEMORY[0x1E4F83C10];
    v84 = v6;
    v82 = v27;
    __int16 v38 = self->_optionsDict;
    id v39 = PBUIStringForWallpaperMode();
    __int16 v40 = [(NSDictionary *)v38 objectForKeyedSubscript:v39];
    v41 = [v40 name];
    v83 = v8;
    uint64_t v42 = self->_optionsDict;
    v43 = PBUIStringForWallpaperMode();
    v44 = [(NSDictionary *)v42 objectForKeyedSubscript:v43];
    uint64_t v45 = [v44 wallpaperKitData];
    uint64_t v46 = v21;
    unsigned int v80 = v21;
    v47 = (void *)v45;
    uint64_t v81 = objc_msgSend(v37, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v41, v46, v36, v86, 1, 0, v10, v12, v14, v16, v18, v20, stillTimeInVideo, v45);

    v48 = (void *)MEMORY[0x1E4F83C10];
    v49 = self->_optionsDict;
    v50 = PBUIStringForWallpaperMode();
    v51 = [(NSDictionary *)v49 objectForKeyedSubscript:v50];
    v52 = [v51 name];
    v53 = self->_optionsDict;
    v54 = PBUIStringForWallpaperMode();
    v55 = [(NSDictionary *)v53 objectForKeyedSubscript:v54];
    v56 = [v55 wallpaperKitData];
    v57 = objc_msgSend(v48, "optionsWithName:parallaxFactor:zoomScale:supportsCropping:cropRect:portrait:hasVideo:stillTimeInVideo:wallpaperMode:wallpaperStatus:wallpaperKitData:", v52, v80, v79, v86, 2, 0, v10, v12, v14, v16, v18, v20, stillTimeInVideo, v56);

    id v58 = (id)v81;
    v59 = v82;

    id v60 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v61 = PBUIStringForWallpaperMode();
    v62 = PBUIStringForWallpaperMode();
    v63 = objc_msgSend(v60, "initWithObjectsAndKeys:", v81, v61, v57, v62, 0);

    v64 = v83;
    v65 = v84;
    [(SBSUIWallpaperPreviewViewController *)self setWallpaperImages:self->_wallpaperImageDict options:v63 locations:v87 completionHandler:v88];
  }
}

void __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) size];
  CGFloat v3 = 1.0 / v2;
  [*(id *)(a1 + 32) size];
  CGAffineTransformMakeScale(&v15, v3, 1.0 / v4);
  CGRect v16 = CGRectApplyAffineTransform(*(CGRect *)(a1 + 48), &v15);
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v9 = *(void **)(*(void *)(a1 + 40) + 1080);
  double v10 = PBUIStringForWallpaperMode();
  double v11 = [v9 objectForKeyedSubscript:v10];
  SBSUIWallpaperSetVideoWithWallpaperMode(v11, *(unsigned __int8 *)(a1 + 80), 1, x, y, width, height);

  double v12 = *(void **)(*(void *)(a1 + 40) + 1080);
  double v13 = PBUIStringForWallpaperMode();
  double v14 = [v12 objectForKeyedSubscript:v13];
  SBSUIWallpaperSetVideoWithWallpaperMode(v14, *(unsigned __int8 *)(a1 + 80), 2, x, y, width, height);
}

uint64_t __100__SBSUIWallpaperPreviewViewController__setImageWallpaperForLocationsOnMainThread_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(unsigned char *)(a1 + 104))
  {
    if (v2)
    {
      if (!*(unsigned char *)(a1 + 105)) {
        SBSUIWallpaperClearVideo();
      }
      [*(id *)(a1 + 32) size];
      CGFloat v4 = 1.0 / v3;
      [*(id *)(a1 + 32) size];
      CGAffineTransformMakeScale(&v7, v4, 1.0 / v5);
      CGRect v8 = CGRectApplyAffineTransform(*(CGRect *)(a1 + 72), &v7);
      SBSUIWallpaperSetVideo(*(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 106), v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
    }
  }
  else if (v2)
  {
    SBSUIWallpaperClearVideo();
  }
  SBSUIWallpaperSetImage(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void *)(a1 + 64));
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setProceduralWallpaperForLocationsOnMainThread:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(SBSUIWallpaperPreviewViewController *)self _displaySettingWallpaperHUD];
  CGAffineTransform v7 = (void *)[(NSDictionary *)self->_proceduralWallpaper copy];
  CGRect v8 = (void *)[(NSDictionary *)self->_proceduralWallpaperOptions copy];
  double v9 = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __105__SBSUIWallpaperPreviewViewController__setProceduralWallpaperForLocationsOnMainThread_completionHandler___block_invoke;
  v13[3] = &unk_1E5CCDE58;
  id v14 = v7;
  id v15 = v8;
  id v16 = v6;
  int64_t v17 = a3;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __105__SBSUIWallpaperPreviewViewController__setProceduralWallpaperForLocationsOnMainThread_completionHandler___block_invoke(uint64_t a1)
{
  SBSUIMagicWallpaperSetWithOptions(*(void **)(a1 + 32), *(void *)(a1 + 56), *(void **)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_applyHomeScreenPreview
{
  if (self->_homeScreenPreviewView)
  {
    double v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v20.origin.CGFloat x = v5;
    v20.origin.CGFloat y = v7;
    v20.size.CGFloat width = v9;
    v20.size.CGFloat height = v11;
    double Width = CGRectGetWidth(v20);
    v21.origin.CGFloat x = v5;
    v21.origin.CGFloat y = v7;
    v21.size.CGFloat width = v9;
    v21.size.CGFloat height = v11;
    double Height = CGRectGetHeight(v21);
    if (Width >= Height) {
      double Width = Height;
    }
    v22.origin.CGFloat x = v5;
    v22.origin.CGFloat y = v7;
    v22.size.CGFloat width = v9;
    v22.size.CGFloat height = v11;
    double v14 = CGRectGetWidth(v22);
    v23.origin.CGFloat x = v5;
    v23.origin.CGFloat y = v7;
    v23.size.CGFloat width = v9;
    v23.size.CGFloat height = v11;
    double v15 = CGRectGetHeight(v23);
    if (v14 >= v15) {
      double v16 = v14;
    }
    else {
      double v16 = v15;
    }
    SBSUIWallpaperGetPreview(1u, 704, Width);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v17 = SBSUIWallpaperGetPreview(1u, 832, v16);
    [(_SBSUIOrientedImageView *)self->_homeScreenPreviewView setPortraitImage:v18];
    [(_SBSUIOrientedImageView *)self->_homeScreenPreviewView setLandscapeImage:v17];
  }
}

- (SBFWallpaperOptions)wallpaperOptions
{
  double v3 = (void *)[(PBUIWallpaperOptions *)self->_options copy];
  double v4 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperViewIfLoaded];

  if (v4)
  {
    CGFloat v5 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
    [v5 cropRect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    double v14 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
    [v14 cropZoomScale];
    double v16 = v15;

    int64_t v17 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
    int v18 = [v17 parallaxEnabled];

    double v19 = 0.0;
    if (v18)
    {
      CGRect v20 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
      [v20 parallaxFactor];
      double v19 = v21;
    }
    objc_msgSend(v3, "setCropRect:", v7, v9, v11, v13);
    [v3 setZoomScale:v16];
    [v3 setParallaxFactor:v19];
  }
  return (SBFWallpaperOptions *)v3;
}

- (void)setIrisEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_irisEnabled != a3)
  {
    [(SBSUIWallpaperPreviewViewController *)self willChangeValueForKey:@"irisEnabled"];
    self->_irisEnabled = v3;
    [(SBSUIWallpaperPreviewViewController *)self didChangeValueForKey:@"irisEnabled"];
  }
  CGFloat v5 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  double v6 = [v5 irisButton];
  [v6 setSelected:v3];

  double v7 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  if (objc_opt_respondsToSelector()) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  double v10 = [v9 irisGestureRecognizer];

  [v10 setEnabled:v3];
  if (v3) {
    [(SBSUIWallpaperPreviewViewController *)self setMotionEnabled:0];
  }
  id v11 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  [v11 displayInstructionsForEffect:1 enabled:v3 animated:1];
}

- (void)setMotionEnabled:(BOOL)a3
{
}

- (void)setMotionEnabled:(BOOL)a3 updateParallaxOnWallpaperView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_motionEnabled != a3)
  {
    [(SBSUIWallpaperPreviewViewController *)self willChangeValueForKey:@"motionEnabled"];
    self->_motionEnabled = v5;
    [(SBSUIWallpaperPreviewViewController *)self didChangeValueForKey:@"motionEnabled"];
  }
  double v7 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  double v8 = [v7 parallaxButton];
  [v8 setSelected:v5];

  if (v5) {
    [(SBSUIWallpaperPreviewViewController *)self setIrisEnabled:0];
  }
  if (v4)
  {
    id v9 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
    [v9 setParallaxEnabled:v5];
  }
  id v10 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  [v10 displayInstructionsForEffect:0 enabled:v5 animated:1];
}

- (_UILegibilitySettings)legibilitySettings
{
  uint64_t v2 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  BOOL v3 = [v2 legibilitySettings];

  return (_UILegibilitySettings *)v3;
}

- (void)providerLegibilitySettingsChanged:(id)a3
{
  id v7 = [a3 legibilitySettings];
  BOOL v4 = [(SBSUIWallpaperPreviewViewController *)self _dateView];
  [v4 setLegibilitySettings:v7];

  BOOL v5 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  [v5 updateForChangedSettings:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained providerLegibilitySettingsChanged:self];
}

- (void)userDidTapOnIrisButton:(id)a3
{
  uint64_t v4 = [(SBSUIWallpaperPreviewViewController *)self irisEnabled] ^ 1;
  [(SBSUIWallpaperPreviewViewController *)self setIrisEnabled:v4];
}

- (void)userDidTapOnParallaxButton:(id)a3
{
  uint64_t v4 = [(SBSUIWallpaperPreviewViewController *)self motionEnabled] ^ 1;
  [(SBSUIWallpaperPreviewViewController *)self setMotionEnabled:v4];
}

- (void)userDidTapOnCancelButton:(id)a3
{
  id v4 = [(SBSUIWallpaperPreviewViewController *)self previewDelegate];
  [v4 wallpaperPreviewViewControllerCancelButtonPressed:self];
}

- (void)userDidTapOnSetButton:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogWallpaper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    optionsDict = self->_optionsDict;
    int v10 = 138543362;
    id v11 = optionsDict;
    _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "This is what we believe the wallpaper options are when the user tapped on the set button: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  double v6 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  [v6 cropRect];
  -[SBSUIWallpaperPreviewViewController setCropRect:](self, "setCropRect:");

  id v7 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  [v7 cropZoomScale];
  -[SBSUIWallpaperPreviewViewController setZoomScale:](self, "setZoomScale:");

  double v8 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  [v8 parallaxFactor];
  -[SBSUIWallpaperPreviewViewController setParallaxFactor:](self, "setParallaxFactor:");

  id v9 = [(SBSUIWallpaperPreviewViewController *)self previewDelegate];
  [v9 wallpaperPreviewViewControllerSetButtonPressed:self];
}

- (id)_wallpaperViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  options = self->_options;
  if (options)
  {
    [(PBUIWallpaperOptions *)options cropRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v40 = v15;
    [(PBUIWallpaperOptions *)self->_options zoomScale];
    double v17 = v16;
    uint64_t v18 = [(PBUIWallpaperOptions *)self->_options parallaxEnabled];
    double v19 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperConfigurationManager];
    if ([v19 enableWallpaperDimming])
    {
      CGRect v20 = [(SBSUIWallpaperPreviewViewController *)self traitCollection];
      BOOL v21 = [v20 userInterfaceStyle] == 2
         && [(NSDictionary *)self->_wallpaperImageDict count] == 1;
    }
    else
    {
      BOOL v21 = 0;
    }

    wallpaperImage = self->_wallpaperImage;
    video = self->_video;
    int64_t v25 = [(AVURLAsset *)video URL];
    CGRect v22 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", wallpaperImage, video, v25, self->_allowScrolling, self->_variant, v21, x, y, width, height, self->_stillTimeInVideo);

    goto LABEL_12;
  }
  double v10 = *MEMORY[0x1E4F1DB20];
  double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v40 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (self->_proceduralWallpaper)
  {
    CGRect v22 = -[SBSUIWallpaperPreviewViewController _proceduralWallpaperViewWithFrame:variant:configuration:](self, "_proceduralWallpaperViewWithFrame:variant:configuration:", 0, self->_initialConfiguration, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
LABEL_7:
    uint64_t v18 = 1;
    double v17 = 1.0;
    goto LABEL_12;
  }
  BOOL v27 = self->_video;
  v28 = self->_wallpaperImage;
  if (v27)
  {
    id v29 = [(AVURLAsset *)self->_video URL];
    CGRect v22 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", v28, v27, v29, self->_allowScrolling, 0, 0, x, y, width, height, self->_stillTimeInVideo);

LABEL_19:
    double v30 = [MEMORY[0x1E4FA5F70] currentMagnifyMode];
    uint64_t v31 = v30;
    if (v30)
    {
      [v30 zoomFactor];
      double v17 = 1.0 / v32;
    }
    else
    {
      double v17 = 1.0;
    }

    uint64_t v18 = 1;
    goto LABEL_12;
  }
  if (v28)
  {
    CGRect v22 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", self->_wallpaperImage, 0, 0, self->_allowScrolling, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
    goto LABEL_19;
  }
  if (self->_variant == -1)
  {
    id v39 = (void *)[objc_alloc(MEMORY[0x1E4F83BD8]) initWithVariant:self->_variant type:0];
    CGRect v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F83C28]), "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v39, self->_variant, 0, 0, 0, x, y, width, height);

    goto LABEL_7;
  }
  NSUInteger v33 = SBSUIWallpaperGetOptions();
  double v17 = 1.0;
  if ([v33 supportsCropping])
  {
    [v33 cropRect];
    double v10 = v34;
    double v12 = v35;
    double v14 = v36;
    double v40 = v37;
    [v33 zoomScale];
    double v17 = v38;
  }
  uint64_t v18 = [v33 parallaxEnabled];
  CGRect v22 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:variant:options:](self, "_wallpaperViewWithFrame:variant:options:", self->_variant, v33, x, y, width, height);

LABEL_12:
  [v22 setDelegate:self];
  [v22 setParallaxEnabled:v18];
  objc_msgSend(v22, "setCropRect:zoomScale:", v10, v12, v14, v40, v17);
  return v22;
}

- (id)_wallpaperViewWithFrame:(CGRect)a3 image:(id)a4 video:(id)a5 videoURL:(id)a6 stillTimeInVideo:(double)a7 supportsCropping:(BOOL)a8 variant:(int64_t)a9 needsWallpaperDimming:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v12 = a8;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v20 = (unint64_t)a5;
  unint64_t v21 = (unint64_t)a6;
  id v51 = (id)v20;
  BOOL v22 = (v20 | v21) == 0;
  BOOL v23 = (v20 | v21) != 0;
  if (v22) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 3;
  }
  int64_t v25 = (objc_class *)MEMORY[0x1E4F83BD8];
  id v26 = a4;
  BOOL v27 = (void *)[[v25 alloc] initWithVariant:a9 type:v24];
  id v28 = objc_alloc(MEMORY[0x1E4F83C08]);
  id v29 = v26;
  uint64_t v30 = [v29 CGImage];
  [v29 scale];
  double v32 = v31;
  uint64_t v33 = [v29 imageOrientation];

  double v34 = (void *)[v28 initWithCGImage:v30 scale:v33 orientation:0 wallpaperFileURL:v32];
  [v27 setWallpaperImage:v34];

  [v27 setVideoURL:v21];
  id v35 = objc_alloc_init(MEMORY[0x1E4F83C10]);
  [v35 setStillTimeInVideo:a7];
  [v35 setSupportsCropping:v12];
  [v27 setWallpaperOptions:v35];
  [v27 setNeedsWallpaperDimmingTreatment:v10];
  if (!v12)
  {
    if (v23)
    {
      id v40 = objc_alloc(MEMORY[0x1E4F83BA8]);
      double v41 = x;
      double v42 = y;
      double v43 = width;
      double v44 = height;
      uint64_t v45 = v27;
      int64_t v46 = a9;
      uint64_t v47 = 16;
LABEL_13:
      id v39 = objc_msgSend(v40, "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v45, v46, 0, 0, v47, v41, v42, v43, v44);
      double v38 = v51;
      goto LABEL_14;
    }
    v48 = (objc_class *)MEMORY[0x1E4F83BC8];
LABEL_12:
    id v40 = [v48 alloc];
    double v41 = x;
    double v42 = y;
    double v43 = width;
    double v44 = height;
    uint64_t v45 = v27;
    int64_t v46 = a9;
    uint64_t v47 = 0;
    goto LABEL_13;
  }
  if (!v23)
  {
    v48 = (objc_class *)MEMORY[0x1E4F83BC0];
    goto LABEL_12;
  }
  id v36 = objc_alloc(MEMORY[0x1E4F83BB8]);
  double v37 = v36;
  double v38 = v51;
  if (v51)
  {
    id v39 = objc_msgSend(v36, "initWithFrame:configuration:wallpaperVideo:variant:", v27, v51, a9, x, y, width, height);
  }
  else
  {
    v50 = [MEMORY[0x1E4F16330] assetWithURL:v21];
    id v39 = objc_msgSend(v37, "initWithFrame:configuration:wallpaperVideo:variant:", v27, v50, a9, x, y, width, height);
  }
LABEL_14:

  return v39;
}

- (id)_wallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 options:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  BOOL v12 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperConfigurationManager];
  double v13 = [v12 wallpaperConfigurationForVariant:a4 includingValuesForTypes:51 wallpaperMode:0];

  objc_storeStrong((id *)&self->_wallpaperConfiguration, v13);
  double v14 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperConfigurationManager];
  int v15 = [v14 hasWallpaperImageForVariant:a4 wallpaperMode:2];

  int v16 = 0;
  if (a4 == 1 && (v15 & 1) == 0)
  {
    double v17 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperConfigurationManager];
    int v16 = [v17 hasWallpaperImageForVariant:1 wallpaperMode:0] ^ 1;
  }
  if ((v15 | v16) == 1)
  {
    uint64_t v18 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperConfigurationManager];
    double v19 = [v18 wallpaperConfigurationForVariant:a4 includingValuesForTypes:51 wallpaperMode:2];
  }
  else
  {
    double v19 = 0;
  }
  unint64_t v20 = [v13 proceduralWallpaperInfo];
  if (v20)
  {
    objc_storeStrong((id *)&self->_proceduralWallpaper, v20);
    uint64_t v21 = -[SBSUIWallpaperPreviewViewController _proceduralWallpaperViewWithFrame:variant:configuration:](self, "_proceduralWallpaperViewWithFrame:variant:configuration:", a4, v13, x, y, width, height);
LABEL_11:
    BOOL v22 = (void *)v21;
    goto LABEL_12;
  }
  if ([v13 wallpaperType] == 4)
  {
    uint64_t v21 = -[SBSUIWallpaperPreviewViewController _colorWallpaperViewWithFrame:variant:configuration:](self, "_colorWallpaperViewWithFrame:variant:configuration:", a4, v13, x, y, width, height);
    goto LABEL_11;
  }
  uint64_t v24 = [v13 wallpaperOriginalImage];
  if (!v24)
  {
    uint64_t v24 = [v13 wallpaperImage];
  }
  uint64_t v68 = [v13 videoURL];
  if (v19)
  {
    int64_t v25 = v24;
    v65 = v11;
    uint64_t v26 = [v19 wallpaperOriginalImage];
    if (!v26)
    {
      uint64_t v26 = [v19 wallpaperImage];
    }
    v67 = (void *)v26;
    v64 = [v19 videoURL];
    id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v28 = PBUIStringForWallpaperMode();
    id v29 = PBUIStringForWallpaperMode();
    v66 = v25;
    uint64_t v30 = (NSDictionary *)objc_msgSend(v27, "initWithObjectsAndKeys:", v25, v28, v26, v29, 0);
    wallpaperImageDict = self->_wallpaperImageDict;
    self->_wallpaperImageDict = v30;

    id v32 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v33 = [v13 wallpaperOptions];
    double v34 = PBUIStringForWallpaperMode();
    id v35 = [v19 wallpaperOptions];
    id v36 = PBUIStringForWallpaperMode();
    double v37 = (NSDictionary *)objc_msgSend(v32, "initWithObjectsAndKeys:", v33, v34, v35, v36, 0);
    optionsDict = self->_optionsDict;
    self->_optionsDict = v37;

    id v39 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v40 = [MEMORY[0x1E4F16330] assetWithURL:v68];
    double v41 = PBUIStringForWallpaperMode();
    double v42 = [MEMORY[0x1E4F16330] assetWithURL:v64];
    double v43 = PBUIStringForWallpaperMode();
    double v44 = (NSDictionary *)objc_msgSend(v39, "initWithObjectsAndKeys:", v40, v41, v42, v43, 0);
    videoDict = self->_videoDict;
    self->_videoDict = v44;

    int64_t v46 = [(SBSUIWallpaperPreviewViewController *)self traitCollection];
    uint64_t v47 = [v46 userInterfaceStyle];

    v48 = v67;
    if (v47 == 2)
    {
      v49 = v64;
    }
    else
    {
      v48 = v66;
      v49 = (void *)v68;
    }
    id v50 = v48;
    id v51 = v49;
    id v11 = v65;
    [v65 stillTimeInVideo];
    BOOL v22 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", v50, 0, v51, [v65 supportsCropping], a4, objc_msgSend(v13, "needsWallpaperDimmingTreatment"), x, y, width, height, v52);

    v53 = (void *)v68;
    uint64_t v24 = v66;
  }
  else
  {
    id v54 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v55 = PBUIStringForWallpaperMode();
    v56 = (NSDictionary *)objc_msgSend(v54, "initWithObjectsAndKeys:", v24, v55, 0);
    v57 = self->_wallpaperImageDict;
    self->_wallpaperImageDict = v56;

    id v58 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v59 = [v13 wallpaperOptions];
    id v60 = PBUIStringForWallpaperMode();
    v61 = (NSDictionary *)objc_msgSend(v58, "initWithObjectsAndKeys:", v59, v60, 0);
    v62 = self->_optionsDict;
    self->_optionsDict = v61;

    v53 = (void *)v68;
    [v11 stillTimeInVideo];
    BOOL v22 = -[SBSUIWallpaperPreviewViewController _wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:](self, "_wallpaperViewWithFrame:image:video:videoURL:stillTimeInVideo:supportsCropping:variant:needsWallpaperDimming:", v24, 0, v68, [v11 supportsCropping], a4, objc_msgSend(v13, "needsWallpaperDimmingTreatment"), x, y, width, height, v63);
  }
  [v11 parallaxFactor];
  objc_msgSend(v22, "setParallaxFactor:");

LABEL_12:
  return v22;
}

- (id)_proceduralWallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 configuration:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v10 = (objc_class *)MEMORY[0x1E4F83B88];
  id v11 = a5;
  BOOL v12 = objc_msgSend([v10 alloc], "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v11, a4, 0, 0, 0, x, y, width, height);

  [v12 prepareToAppear];
  return v12;
}

- (id)_colorWallpaperViewWithFrame:(CGRect)a3 variant:(int64_t)a4 configuration:(id)a5
{
  double v6 = (objc_class *)MEMORY[0x1E4F83B98];
  id v7 = a5;
  id v8 = [v6 alloc];
  double v9 = objc_msgSend(v8, "initWithFrame:configuration:variant:cacheGroup:delegate:options:", v7, a4, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v9 prepareToAppear];
  return v9;
}

- (id)_wallpaperView
{
  uint64_t v2 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  BOOL v3 = [v2 wallpaperView];

  return v3;
}

- (id)_wallpaperViewIfLoaded
{
  uint64_t v2 = [(SBSUIWallpaperPreviewViewController *)self _previewViewIfLoaded];
  BOOL v3 = [v2 wallpaperView];

  return v3;
}

- (void)_displaySettingWallpaperHUD
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v3 = objc_alloc_init(SBSUIWallpaperProgressHUD);
  hud = self->_hud;
  self->_hud = v3;

  BOOL v5 = self->_hud;
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v6 = [v8 localizedStringForKey:@"SETTING_WALLPAPER" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];
  id v7 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  [(SBSUIWallpaperProgressHUD *)v5 showMessage:v6 inView:v7];
}

- (void)_enableIrisOrParallaxIfEligible
{
  BOOL v3 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  char v4 = objc_opt_respondsToSelector();

  BOOL v5 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  int v6 = [v5 parallaxEnabled];

  if ((v4 & 1) != 0 && v3)
  {
    [(SBSUIWallpaperPreviewViewController *)self setIrisEnabled:1];
  }
  else if (v6)
  {
    [(SBSUIWallpaperPreviewViewController *)self setMotionEnabled:1];
  }
}

- (void)_logWallpaperChangeForLocations:(int64_t)a3
{
  char v4 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
  uint64_t v5 = [v4 wallpaperType];
  int v6 = (SBFWallpaperCoreAnalyticsLogger *)objc_alloc_init(MEMORY[0x1E4FA6070]);
  wallpaperCoreAnalyticsLogger = self->_wallpaperCoreAnalyticsLogger;
  self->_wallpaperCoreAnalyticsLogger = v6;

  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 1 && [(SBSUIWallpaperPreviewViewController *)self irisEnabled])
  {
    id v8 = v4;
    objc_opt_respondsToSelector();
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F83BE8]);
  BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
  [v9 setDateWallpaperLastChanged:v10];

  id v11 = v4;
  AnalyticsSendEventLazy();
}

id __71__SBSUIWallpaperPreviewViewController__logWallpaperChangeForLocations___block_invoke(uint64_t a1)
{
  v23[5] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) parallaxEnabled]) {
    uint64_t v2 = [(id)objc_opt_class() allowsParallax];
  }
  else {
    uint64_t v2 = 0;
  }
  v22[0] = @"bundleID";
  BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
  char v4 = [v3 bundleIdentifier];
  v23[0] = v4;
  v22[1] = @"age";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1144), "ageOfWallpaper"));
  v23[1] = v5;
  v22[2] = @"type";
  int v6 = PBUIStringForWallpaperType();
  v23[2] = v6;
  v22[3] = @"locations";
  id v7 = PBUIStringForWallpaperLocations();
  v23[3] = v7;
  v22[4] = @"parallax";
  id v8 = [NSNumber numberWithBool:v2];
  void v23[4] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
  BOOL v10 = (void *)[v9 mutableCopy];

  unint64_t v11 = *(void *)(a1 + 64);
  if (v11 < 2)
  {
LABEL_7:
    BOOL v12 = *(void **)(*(void *)(a1 + 40) + 1104);
    double v13 = PBUIStringForWallpaperMode();
    double v14 = [v12 objectForKeyedSubscript:v13];
    int v15 = [v14 name];
    int v16 = v15;
    if (!v15) {
      int v16 = *(void **)(*(void *)(a1 + 40) + 1056);
    }
    id v17 = v16;

    if (![v17 length]) {
      goto LABEL_14;
    }
    uint64_t v18 = (void *)[v17 copy];
    double v19 = @"name";
    goto LABEL_13;
  }
  if (v11 != 2)
  {
    if (v11 != 3) {
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  unint64_t v20 = [*(id *)(*(void *)(a1 + 40) + 1024) objectForKeyedSubscript:*MEMORY[0x1E4F83C48]];
  id v17 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F83C40]];

  if ([v17 length])
  {
    uint64_t v18 = (void *)[v17 copy];
    double v19 = @"bokehVariant";
LABEL_13:
    [v10 setObject:v18 forKeyedSubscript:v19];
  }
LABEL_14:

LABEL_15:
  return v10;
}

- (id)_dateView
{
  uint64_t v2 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  BOOL v3 = [v2 dateView];

  return v3;
}

- (void)_updateDateView
{
  [(SBSUIWallpaperPreviewViewController *)self _stopDateTimer];
  BOOL v3 = [(SBSUIWallpaperPreviewViewController *)self _previewView];
  char v4 = [v3 dateView];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setDate:v5];

  [(SBSUIWallpaperPreviewViewController *)self _startDateTimer];
}

- (void)_stopDateTimer
{
  [(NSTimer *)self->_dateTimer invalidate];
  dateTimer = self->_dateTimer;
  self->_dateTimer = 0;
}

- (void)_startDateTimer
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
  BSTimeUntilNextClockMinute();
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateDateView, 0, 0);
  char v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  dateTimer = self->_dateTimer;
  self->_dateTimer = v4;
  MEMORY[0x1F41817F8](v4, dateTimer);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &SBParallaxEnabledChanged)
  {
    id v7 = [(SBSUIWallpaperPreviewViewController *)self _wallpaperView];
    -[SBSUIWallpaperPreviewViewController setMotionEnabled:updateParallaxOnWallpaperView:](self, "setMotionEnabled:updateParallaxOnWallpaperView:", [v7 parallaxEnabled], 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSUIWallpaperPreviewViewController;
    -[SBSUIWallpaperPreviewViewController observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setColorSamplingEnabled:(BOOL)a3
{
  self->_colorSamplingEnabled = a3;
}

- (BOOL)colorSamplingEnabled
{
  return self->_colorSamplingEnabled;
}

- (SBFLegibilitySettingsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFLegibilitySettingsProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSUIWallpaperPreviewViewControllerDelegate)previewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewDelegate);
  return (SBSUIWallpaperPreviewViewControllerDelegate *)WeakRetained;
}

- (void)setPreviewDelegate:(id)a3
{
}

- (UIImage)wallpaperImage
{
  return (UIImage *)objc_getProperty(self, a2, 1008, 1);
}

- (BOOL)motionEnabled
{
  return self->_motionEnabled;
}

- (BOOL)irisEnabled
{
  return self->_irisEnabled;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wallpaperCoreAnalyticsLogger, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_homeScreenPreviewView, 0);
  objc_storeStrong((id *)&self->_hud, 0);
  objc_storeStrong((id *)&self->_optionsDict, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_videoDict, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperOptions, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaper, 0);
  objc_storeStrong((id *)&self->_wallpaperImageDict, 0);
  objc_storeStrong((id *)&self->_wallpaperImage, 0);
  objc_storeStrong((id *)&self->_initialConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperConfigurationManager, 0);
  objc_storeStrong((id *)&self->_dateTimer, 0);
}

@end