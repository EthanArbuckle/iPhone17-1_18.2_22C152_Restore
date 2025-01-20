@interface PUWallpaperPlaygroundViewController
- (BOOL)showsControls;
- (BOOL)useLowLuminance;
- (NSArray)assets;
- (NSString)lowLuminanceFilterInputAmountKeyPath;
- (NSString)lowLuminanceFilterInputScaleKeyPath;
- (PUWallpaperPlaygroundViewController)initWithAssets:(id)a3;
- (PUWallpaperPlaygroundViewController)initWithConfiguration:(id)a3 assetDirectory:(id)a4;
- (PUWallpaperPosterController)posterController;
- (PUWallpaperPosterDateView)dateView;
- (UIButton)doneButton;
- (UIButton)settingsButton;
- (UIView)backgroundView;
- (UIView)floatingView;
- (UIView)foregroundView;
- (UIView)hostingView;
- (_PUWallpaperDebugMutablePreferences)preferences;
- (_PUWallpaperDebugRenderingEnvironment)environment;
- (double)px_backlightTransformAnimationDuration;
- (double)px_lowLuminanceAlphaAnimationDuration;
- (double)px_shuffleSleepFadeInAnimationDuration;
- (double)px_shuffleSleepFadeOutAnimationDuration;
- (double)px_shuffleSleepTransformOutAnimationDuration;
- (id)_renderingEnvironmentForAssets:(id)a3;
- (id)px_extendRenderSessionForReason:(id)a3;
- (id)shuffleTriggerObserver;
- (int64_t)preferredStatusBarStyle;
- (void)_commonInit;
- (void)_dismiss;
- (void)_handleShuffleTrigger;
- (void)_handleTap:(id)a3;
- (void)_handleTwoFingerTap:(id)a3;
- (void)_setupControls;
- (void)_setupLowLuminanceFilter;
- (void)_setupPosterController;
- (void)_setupRendererViews;
- (void)_updateLowLuminanceState;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentPlaygroundWithPresentingViewController:(id)a3;
- (void)px_updatePreferences:(id)a3;
- (void)setDateView:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setHostingView:(id)a3;
- (void)setLowLuminanceFilterInputAmountKeyPath:(id)a3;
- (void)setLowLuminanceFilterInputScaleKeyPath:(id)a3;
- (void)setPosterController:(id)a3;
- (void)setSettingsButton:(id)a3;
- (void)setShowsControls:(BOOL)a3;
- (void)setUseLowLuminance:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PUWallpaperPlaygroundViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowLuminanceFilterInputAmountKeyPath, 0);
  objc_storeStrong((id *)&self->_lowLuminanceFilterInputScaleKeyPath, 0);
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong(&self->_shuffleTriggerObserver, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_posterController, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_hostingView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)setLowLuminanceFilterInputAmountKeyPath:(id)a3
{
}

- (NSString)lowLuminanceFilterInputAmountKeyPath
{
  return self->_lowLuminanceFilterInputAmountKeyPath;
}

- (void)setLowLuminanceFilterInputScaleKeyPath:(id)a3
{
}

- (NSString)lowLuminanceFilterInputScaleKeyPath
{
  return self->_lowLuminanceFilterInputScaleKeyPath;
}

- (BOOL)useLowLuminance
{
  return self->_useLowLuminance;
}

- (void)setSettingsButton:(id)a3
{
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (id)shuffleTriggerObserver
{
  return self->_shuffleTriggerObserver;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setDateView:(id)a3
{
}

- (PUWallpaperPosterDateView)dateView
{
  return self->_dateView;
}

- (PUWallpaperPosterController)posterController
{
  return self->_posterController;
}

- (_PUWallpaperDebugMutablePreferences)preferences
{
  return self->_preferences;
}

- (_PUWallpaperDebugRenderingEnvironment)environment
{
  return self->_environment;
}

- (void)setHostingView:(id)a3
{
}

- (UIView)hostingView
{
  return self->_hostingView;
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)presentPlaygroundWithPresentingViewController:(id)a3
{
  v4 = [a3 view];
  id v8 = [v4 window];

  v5 = [v8 windowScene];
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:v5];
  v7 = (void *)wrapperWindow;
  wrapperWindow = v6;

  [(id)wrapperWindow setRootViewController:self];
  [(id)wrapperWindow makeKeyAndVisible];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)ViewModelObservationContext == a6)
  {
    id v6 = [(PUWallpaperPlaygroundViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (id)px_extendRenderSessionForReason:(id)a3
{
  v3 = objc_alloc_init(PUWallpaperPlaygroundInvalidatable);
  return v3;
}

- (void)px_updatePreferences:(id)a3
{
  id v5 = a3;
  id v7 = [(PUWallpaperPlaygroundViewController *)self preferences];
  id v6 = objc_opt_new();
  (*((void (**)(id, id, void *))a3 + 2))(v5, v7, v6);
}

- (double)px_shuffleSleepFadeInAnimationDuration
{
  v2 = +[PUWallpaperPlaygroundSettings sharedInstance];
  [v2 shuffleSleepFadeInAnimationDuration];
  double v4 = v3;

  return v4;
}

- (double)px_shuffleSleepFadeOutAnimationDuration
{
  v2 = +[PUWallpaperPlaygroundSettings sharedInstance];
  [v2 shuffleSleepFadeOutAnimationDuration];
  double v4 = v3;

  return v4;
}

- (double)px_shuffleSleepTransformOutAnimationDuration
{
  v2 = +[PUWallpaperPlaygroundSettings sharedInstance];
  [v2 shuffleSleepTransformOutAnimationDuration];
  double v4 = v3;

  return v4;
}

- (double)px_backlightTransformAnimationDuration
{
  v2 = +[PUWallpaperPlaygroundSettings sharedInstance];
  [v2 lowLuminanceTransformAnimationDuration];
  double v4 = v3;

  return v4;
}

- (double)px_lowLuminanceAlphaAnimationDuration
{
  v2 = +[PUWallpaperPlaygroundSettings sharedInstance];
  [v2 lowLuminanceAlphaAnimationDuration];
  double v4 = v3;

  return v4;
}

- (void)_updateLowLuminanceState
{
  if (PFPosterWantsLowLuminanceContent())
  {
    double v3 = +[PUWallpaperPlaygroundSettings sharedInstance];
    [v3 lowLuminanceAlphaAnimationDuration];
    double v5 = v4;
    id v6 = (void *)MEMORY[0x1E4FB1EB0];
    id v7 = [(PUWallpaperPlaygroundViewController *)self dateView];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__PUWallpaperPlaygroundViewController__updateLowLuminanceState__block_invoke;
    v20[3] = &unk_1E5F2ED10;
    v20[4] = self;
    [v6 transitionWithView:v7 duration:5242880 options:v20 animations:0 completion:v5];

    if ([v3 applyLowAPLFilter])
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      if ([(PUWallpaperPlaygroundViewController *)self useLowLuminance]) {
        id v8 = &unk_1F078D1D0;
      }
      else {
        id v8 = &unk_1F078D1C0;
      }
      v9 = [(PUWallpaperPlaygroundViewController *)self hostingView];
      v10 = [v9 layer];

      v11 = [(PUWallpaperPlaygroundViewController *)self lowLuminanceFilterInputScaleKeyPath];
      v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v11];
      v13 = [v10 presentationLayer];
      v14 = [v13 valueForKeyPath:v11];
      [v12 setFromValue:v14];

      [v12 setToValue:v8];
      [v12 setDuration:v5];
      [v12 setRemovedOnCompletion:0];
      [v12 setFillMode:*MEMORY[0x1E4F39FA8]];
      v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      [v12 setTimingFunction:v15];

      [v10 addAnimation:v12 forKey:@"lowLuminanceIntensity"];
      [v10 setValue:v8 forKeyPath:v11];
      v16 = NSNumber;
      v17 = +[PUWallpaperPlaygroundSettings sharedInstance];
      [v17 lowAPLFilterAmount];
      v18 = objc_msgSend(v16, "numberWithDouble:");
      v19 = [(PUWallpaperPlaygroundViewController *)self lowLuminanceFilterInputAmountKeyPath];
      [v10 setValue:v18 forKeyPath:v19];

      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

void __63__PUWallpaperPlaygroundViewController__updateLowLuminanceState__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) useLowLuminance];
  id v3 = [*(id *)(a1 + 32) dateView];
  [v3 setUseThinnerFontWeightForTime:v2];
}

- (void)setUseLowLuminance:(BOOL)a3
{
  if (self->_useLowLuminance != a3)
  {
    self->_useLowLuminance = a3;
    [(PUWallpaperPlaygroundViewController *)self _updateLowLuminanceState];
    double v5 = [(PUWallpaperPlaygroundViewController *)self posterController];
    id v6 = [v5 viewModel];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PUWallpaperPlaygroundViewController_setUseLowLuminance___block_invoke;
    v7[3] = &__block_descriptor_33_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    BOOL v8 = a3;
    [v6 performChanges:v7];
  }
}

void __58__PUWallpaperPlaygroundViewController_setUseLowLuminance___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = PFPosterWantsLowLuminanceContent();
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 2;
  }
  [v5 setBacklightLuminance:v4];
}

- (void)_setupLowLuminanceFilter
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F3A230];
  uint64_t v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A230]];
  id v5 = NSNumber;
  id v6 = +[PUWallpaperPlaygroundSettings sharedInstance];
  [v6 lowAPLFilterAmount];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v8 = *MEMORY[0x1E4F3A100];
  [v4 setValue:v7 forKey:*MEMORY[0x1E4F3A100]];

  uint64_t v9 = *MEMORY[0x1E4F3A1F0];
  [v4 setValue:&unk_1F078D1C0 forKey:*MEMORY[0x1E4F3A1F0]];
  v15[0] = v4;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v11 = [(PUWallpaperPlaygroundViewController *)self hostingView];
  v12 = [v11 layer];
  [v12 setFilters:v10];

  v13 = [NSString stringWithFormat:@"filters.%@.%@", v3, v9];
  [(PUWallpaperPlaygroundViewController *)self setLowLuminanceFilterInputScaleKeyPath:v13];

  v14 = [NSString stringWithFormat:@"filters.%@.%@", v3, v8];
  [(PUWallpaperPlaygroundViewController *)self setLowLuminanceFilterInputAmountKeyPath:v14];
}

- (void)_handleShuffleTrigger
{
  uint64_t v3 = [(PUWallpaperPlaygroundViewController *)self environment];
  objc_msgSend(v3, "setPx_significantEventsCounter:", objc_msgSend(v3, "px_significantEventsCounter") + 1);

  id v5 = [(PUWallpaperPlaygroundViewController *)self posterController];
  uint64_t v4 = [(PUWallpaperPlaygroundViewController *)self environment];
  [v5 renderer:self didUpdateEnvironment:v4 withTransition:0];
}

- (void)_handleTwoFingerTap:(id)a3
{
  uint64_t v4 = [(PUWallpaperPlaygroundViewController *)self useLowLuminance] ^ 1;
  [(PUWallpaperPlaygroundViewController *)self setUseLowLuminance:v4];
}

- (void)_handleTap:(id)a3
{
  uint64_t v4 = [(PUWallpaperPlaygroundViewController *)self showsControls] ^ 1;
  [(PUWallpaperPlaygroundViewController *)self setShowsControls:v4];
}

- (void)setShowsControls:(BOOL)a3
{
  if (self->_showsControls != a3)
  {
    self->_showsControls = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PUWallpaperPlaygroundViewController_setShowsControls___block_invoke;
    v3[3] = &unk_1E5F2E120;
    v3[4] = self;
    BOOL v4 = a3;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:2 animations:v3 completion:0];
  }
}

uint64_t __56__PUWallpaperPlaygroundViewController_setShowsControls___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  uint64_t v3 = [*(id *)(a1 + 32) doneButton];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) settingsButton];
  [v5 setAlpha:v4];

  id v6 = *(void **)(a1 + 32);
  return [v6 setNeedsStatusBarAppearanceUpdate];
}

- (void)_dismiss
{
  double v2 = [(PUWallpaperPlaygroundViewController *)self view];
  uint64_t v3 = [v2 window];
  [v3 setHidden:1];

  double v4 = (void *)wrapperWindow;
  wrapperWindow = 0;
}

- (void)_setupControls
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v35 = [(PUWallpaperPlaygroundViewController *)self view];
  v34 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v34 setButtonSize:1];
  [v34 setCornerStyle:4];
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v34 setBaseForegroundColor:v3];

  [v34 setTitle:@"Done"];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke;
  v37[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v38, &location);
  id v6 = [v5 actionWithTitle:@"Done" image:0 identifier:0 handler:v37];
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = objc_msgSend(v4, "initWithFrame:primaryAction:", v6, *MEMORY[0x1E4F1DB28], v8, v9, v10);

  [v11 setConfiguration:v34];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v35 addSubview:v11];
  [(PUWallpaperPlaygroundViewController *)self setDoneButton:v11];
  v12 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v12 setButtonSize:3];
  [v12 setCornerStyle:4];
  v13 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v12 setBaseForegroundColor:v13];
  v33 = v12;

  id v14 = objc_alloc(MEMORY[0x1E4FB14D0]);
  v15 = (void *)MEMORY[0x1E4FB13F0];
  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gearshape.fill"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke_2;
  v36[3] = &unk_1E5F2ADC0;
  v36[4] = self;
  v17 = [v15 actionWithTitle:&stru_1F06BE7B8 image:v16 identifier:0 handler:v36];
  v18 = objc_msgSend(v14, "initWithFrame:primaryAction:", v17, v7, v8, v9, v10);

  [v18 setConfiguration:v33];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v35 addSubview:v18];
  [(PUWallpaperPlaygroundViewController *)self setSettingsButton:v18];
  v27 = (void *)MEMORY[0x1E4F28DC8];
  v32 = [v11 trailingAnchor];
  v31 = [v35 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:-20.0];
  v40[0] = v30;
  v29 = [v11 topAnchor];
  v28 = [v35 topAnchor];
  v19 = [v29 constraintEqualToAnchor:v28 constant:20.0];
  v40[1] = v19;
  v20 = [v18 centerXAnchor];
  v21 = [v35 centerXAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v40[2] = v22;
  v23 = [v18 bottomAnchor];
  v24 = [v35 bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:-50.0];
  v40[3] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  [v27 activateConstraints:v26];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismiss];
}

void __53__PUWallpaperPlaygroundViewController__setupControls__block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F94208]);
  uint64_t v3 = +[PUWallpaperPlaygroundSettings sharedInstance];
  id v4 = (void *)[v2 initWithRootSettings:v3];

  id v5 = [MEMORY[0x1E4FB1C30] mediumDetent];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  double v7 = [v4 sheetPresentationController];
  [v7 setDetents:v6];

  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

- (void)setPosterController:(id)a3
{
  double v9 = (PUWallpaperPosterController *)a3;
  p_posterController = &self->_posterController;
  id v6 = self->_posterController;
  if (v6 == v9)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [(PUWallpaperPosterController *)v6 isEqual:v9];

    if ((v8 & 1) == 0)
    {
      [(PUWallpaperPosterController *)*p_posterController removeObserver:self forKeyPath:@"viewModel" context:&ViewModelObservationContext];
      objc_storeStrong((id *)&self->_posterController, a3);
      [(PUWallpaperPosterController *)*p_posterController addObserver:self forKeyPath:@"viewModel" options:0 context:&ViewModelObservationContext];
    }
  }
}

- (void)_setupPosterController
{
  uint64_t v3 = [PUWallpaperPosterController alloc];
  id v4 = [(PUWallpaperPlaygroundViewController *)self assets];
  id v5 = [v4 firstObject];
  id v6 = [v5 photoLibrary];
  char v8 = [(PUWallpaperPosterController *)v3 initWithRenderer:self photoLibrary:v6];

  double v7 = [(PUWallpaperPlaygroundViewController *)self environment];
  [(PUWallpaperPosterController *)v8 renderer:self didInitializeWithEnvironment:v7];

  [(PUWallpaperPlaygroundViewController *)self setPosterController:v8];
}

- (void)_setupRendererViews
{
  id v23 = [(PUWallpaperPlaygroundViewController *)self view];
  [v23 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v3, v5, v7, v9);
  [(UIView *)v11 setAutoresizingMask:18];
  [v23 addSubview:v11];
  hostingView = self->_hostingView;
  self->_hostingView = v11;
  v13 = v11;

  id v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIView *)v14 setAutoresizingMask:18];
  [(UIView *)v13 addSubview:v14];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v14;
  v16 = v14;

  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIView *)v17 setAutoresizingMask:18];
  [(UIView *)v13 addSubview:v17];
  foregroundView = self->_foregroundView;
  self->_foregroundView = v17;
  v19 = v17;

  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGRect v26 = CGRectOffset(v25, 0.0, 100.0);
  v20 = -[PUWallpaperPosterDateView initWithFrame:]([PUWallpaperPosterDateView alloc], "initWithFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  [(UIView *)v13 addSubview:v20];
  [(PUWallpaperPlaygroundViewController *)self setDateView:v20];
  v21 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v6, v8, v10);
  [(UIView *)v21 setAutoresizingMask:18];
  [(UIView *)v13 addSubview:v21];
  floatingView = self->_floatingView;
  self->_floatingView = v21;
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PUWallpaperPlaygroundViewController;
  [(PUWallpaperPlaygroundViewController *)&v17 viewDidLayoutSubviews];
  double v3 = [(PUWallpaperPlaygroundViewController *)self posterController];
  double v4 = [v3 viewModel];
  double v5 = [v4 currentLayerStack];

  double v6 = [v5 layout];
  double v7 = [(PUWallpaperPlaygroundViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if (v6)
  {
    v18.origin.x = v9;
    v18.origin.y = v11;
    v18.size.width = v13;
    v18.size.height = v15;
    if (!CGRectIsEmpty(v18))
    {
      v16 = [(PUWallpaperPlaygroundViewController *)self dateView];
      objc_msgSend(v16, "layoutWithLayout:inContainerFrame:", v6, v9, v11, v13, v15);
    }
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperPlaygroundViewController;
  [(PUWallpaperPlaygroundViewController *)&v7 viewDidLoad];
  double v3 = [(PUWallpaperPlaygroundViewController *)self view];
  double v4 = [MEMORY[0x1E4FB1618] blackColor];
  [v3 setBackgroundColor:v4];

  [(PUWallpaperPlaygroundViewController *)self _setupRendererViews];
  [(PUWallpaperPlaygroundViewController *)self _setupPosterController];
  [(PUWallpaperPlaygroundViewController *)self _setupControls];
  [(PUWallpaperPlaygroundViewController *)self _setupLowLuminanceFilter];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  [v3 addGestureRecognizer:v5];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTwoFingerTap_];
  [v6 setNumberOfTouchesRequired:2];
  [v3 addGestureRecognizer:v6];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (id)_renderingEnvironmentForAssets:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F8CCF8];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initWithConfigurationType:0];
  double v6 = PXMap();

  [v5 setMedia:v6];
  objc_super v7 = [[_PUWallpaperDebugRenderingEnvironment alloc] initWithPosterConfiguration:v5 assetDirectory:0];

  return v7;
}

id __70__PUWallpaperPlaygroundViewController__renderingEnvironmentForAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F8CD18];
  id v3 = a2;
  id v4 = [v2 alloc];
  double v5 = [v3 uuid];

  double v6 = (void *)[v4 initWithAssetUUID:v5];
  return v6;
}

- (void)dealloc
{
  id v3 = [(PUWallpaperPlaygroundViewController *)self posterController];
  [v3 removeObserver:self forKeyPath:@"viewModel" context:&ViewModelObservationContext];

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperPlaygroundViewController;
  [(PUWallpaperPlaygroundViewController *)&v4 dealloc];
}

- (void)_commonInit
{
  self->_showsControls = 1;
  id v3 = objc_alloc_init(_PUWallpaperDebugMutablePreferences);
  preferences = self->_preferences;
  self->_preferences = v3;

  objc_initWeak(&location, self);
  double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__PUWallpaperPlaygroundViewController__commonInit__block_invoke;
  v8[3] = &unk_1E5F23E68;
  objc_copyWeak(&v9, &location);
  double v6 = [v5 addObserverForName:@"PUWallpaperShuffleNotificationName" object:0 queue:0 usingBlock:v8];
  id shuffleTriggerObserver = self->_shuffleTriggerObserver;
  self->_id shuffleTriggerObserver = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__PUWallpaperPlaygroundViewController__commonInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleShuffleTrigger];
}

- (PUWallpaperPlaygroundViewController)initWithConfiguration:(id)a3 assetDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUWallpaperPlaygroundViewController;
  double v8 = [(PUWallpaperPlaygroundViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    id v9 = [[_PUWallpaperDebugRenderingEnvironment alloc] initWithPosterConfiguration:v6 assetDirectory:v7];
    environment = v8->_environment;
    v8->_environment = v9;

    [(PUWallpaperPlaygroundViewController *)v8 _commonInit];
  }

  return v8;
}

- (PUWallpaperPlaygroundViewController)initWithAssets:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUWallpaperPlaygroundViewController;
  double v5 = [(PUWallpaperPlaygroundViewController *)&v11 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

    uint64_t v8 = [(PUWallpaperPlaygroundViewController *)v5 _renderingEnvironmentForAssets:v4];
    environment = v5->_environment;
    v5->_environment = (_PUWallpaperDebugRenderingEnvironment *)v8;

    [(PUWallpaperPlaygroundViewController *)v5 _commonInit];
  }

  return v5;
}

@end