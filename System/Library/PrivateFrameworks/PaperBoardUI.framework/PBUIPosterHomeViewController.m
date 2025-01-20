@interface PBUIPosterHomeViewController
+ (int64_t)presentationModeForHomeConfiguration:(id)a3;
- (BOOL)_shouldHomeScreenWallpaperBeDimmed;
- (BOOL)canShowSnapshot;
- (BOOL)isBlurred;
- (BOOL)isHomeScreenWallpaperDimmed;
- (BOOL)isSettledPosition;
- (BOOL)reflectsLock;
- (BOOL)showsSnapshotWhenIdleForMode:(int64_t)a3;
- (BOOL)updateGradientViewWithGradient:(id)a3;
- (BOOL)updateHomeVariantStyleState;
- (BOOL)updatePresentation;
- (PBUIHomeVariantStyleState)currentHomeVariantStyleState;
- (double)averageContrast;
- (double)unlockProgress;
- (double)weightingForEffectView;
- (id)_descriptorIdentity;
- (id)_fetchPosterPreferredProminentColor;
- (id)_fetchStyleState;
- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3;
- (id)averageColor;
- (id)contentColorStatistics;
- (id)homeScreenConfiguration;
- (int64_t)variant;
- (void)_duckHomeScreenWallpaperDimAssertionDidInvalidate:(id)a3;
- (void)_updateDimHomeScreenWallpaperViewForUnlockProgress:(double)a3 animated:(BOOL)a4;
- (void)_updateEnableHomeScreenWallpaperDimming;
- (void)_updateRotationForOrientation:(int64_t)a3;
- (void)applyFauxExternalSceneSettings:(id)a3;
- (void)configureEffectViewForMode;
- (void)configureForZOrder;
- (void)dealloc;
- (void)effectTrackingReplicaViewHasValidSnapshot:(id)a3;
- (void)homeScreenConfiguration;
- (void)loadView;
- (void)noteDidRotateToInterfaceOrientation:(int64_t)a3;
- (void)noteHomeVariantStyleStateMayHaveUpdated;
- (void)noteWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)performSnapshotOnQueue:(id)a3 scene:(id)a4 completion:(id)a5;
- (void)setActiveStyle:(int64_t)a3;
- (void)setCounterpart:(id)a3;
- (void)setFixedAverageColor:(id)a3;
- (void)updatePresentation;
- (void)updateViewControllerVisibilityForUnlockProgress:(double)a3;
- (void)validateSnapshottingPreconditionsForSettings:(id)a3 result:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PBUIPosterHomeViewController

- (id)contentColorStatistics
{
  fixedColorStatistics = self->_fixedColorStatistics;
  if (fixedColorStatistics)
  {
    v3 = fixedColorStatistics;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PBUIPosterHomeViewController;
    v3 = [(PBUIPosterVariantViewController *)&v5 contentColorStatistics];
  }
  return v3;
}

- (BOOL)reflectsLock
{
  return !self->_fixedColorStatistics && !self->super._scene && (unint64_t)(self->_currentMode - 1) < 2;
}

- (BOOL)isBlurred
{
  return self->_currentMode == 2;
}

- (int64_t)variant
{
  return 1;
}

- (BOOL)showsSnapshotWhenIdleForMode:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  if (a3 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
    objc_super v5 = [WeakRetained scene];
    v6 = [v5 settings];
    v7 = objc_msgSend(v6, "pui_provider");

    if ([v7 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"])
    {

      return 1;
    }
    int v9 = [v7 isEqualToString:@"com.apple.WallpaperKit.CollectionsPoster"];
    v10 = [(PBUIPosterHomeViewController *)self _descriptorIdentity];
    v11 = v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      char v13 = _PRCollectionsPosterDescriptorNeedsSnapshotReplacement(v10);

      return v13;
    }
  }
  return 0;
}

- (id)_descriptorIdentity
{
  scene = self->super._scene;
  v4 = scene;
  if (!scene)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
    v4 = [WeakRetained scene];
  }
  objc_super v5 = objc_msgSend(v4, "pui_posterPath");
  v6 = [v5 descriptorIdentifier];

  if (!scene)
  {
  }
  return v6;
}

- (void)setActiveStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterVariantViewController *)&v4 setActiveStyle:a3];
  [(PBUIPosterHomeViewController *)self configureForZOrder];
}

- (void)configureForZOrder
{
  v3 = [(PBUIPosterHomeViewController *)self view];
  [v3 bringSubviewToFront:self->_dimView];

  objc_super v4 = [(BSUIOrientationTransformWrapperView *)self->_dynamicWrapperView superview];

  if (v4)
  {
    if ([(PBUIPosterHomeViewController *)self canShowSnapshot]
      && ![(PBUIPosterHomeViewController *)self reflectsLock])
    {
      p_contentContainer = &self->super._contentContainer;
      contentContainer = self->super._contentContainer;
      p_snapshotView = &self->super._snapshotView;
      snapshotView = self->super._snapshotView;
      dynamicWrapperView = self->_dynamicWrapperView;
    }
    else
    {
      p_contentContainer = &self->super._contentContainer;
      snapshotView = self->_dynamicWrapperView;
      contentContainer = self->super._contentContainer;
      p_snapshotView = &self->super._snapshotView;
      dynamicWrapperView = self->super._snapshotView;
    }
    [(UIView *)contentContainer insertSubview:snapshotView aboveSubview:dynamicWrapperView];
    v10 = *p_contentContainer;
    effectView = self->_effectView;
    BOOL v12 = *p_snapshotView;
    [(UIView *)v10 insertSubview:effectView aboveSubview:v12];
  }
}

- (BOOL)canShowSnapshot
{
  if ([(PBUIPosterVariantViewController *)self needsSnapshot]
    || ![(PBUIPosterVariantViewController *)self isSnapshotInCorrectOrientation]
    || ![(PBUIPosterHomeViewController *)self showsSnapshotWhenIdleForMode:self->_currentMode])
  {
    return 0;
  }
  return [(PBUIPosterHomeViewController *)self isSettledPosition];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_duckHomeScreenWallpaperDimAssertions;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  duckHomeScreenWallpaperDimAssertions = self->_duckHomeScreenWallpaperDimAssertions;
  self->_duckHomeScreenWallpaperDimAssertions = 0;

  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterVariantViewController *)&v9 dealloc];
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterHomeViewController *)&v9 loadView];
  v3 = (BSUIOrientationTransformWrapperView *)objc_alloc_init(MEMORY[0x1E4F4F8D0]);
  dynamicWrapperView = self->_dynamicWrapperView;
  self->_dynamicWrapperView = v3;

  uint64_t v5 = (UIView *)objc_opt_new();
  dimView = self->_dimView;
  self->_dimView = v5;

  uint64_t v7 = self->_dimView;
  v8 = [MEMORY[0x1E4F428B8] blackColor];
  [(UIView *)v7 setBackgroundColor:v8];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterVariantViewController *)&v19 viewDidLoad];
  dynamicWrapperView = self->_dynamicWrapperView;
  [(UIView *)self->super._contentContainer bounds];
  -[BSUIOrientationTransformWrapperView setFrame:](dynamicWrapperView, "setFrame:");
  int64_t initialOrientation = 1;
  [(BSUIOrientationTransformWrapperView *)self->_dynamicWrapperView setCounterTransformView:1];
  self->_int64_t initialOrientation = 1;
  uint64_t v5 = self->_dynamicWrapperView;
  if (soft_PUIDynamicRotationIsActive()) {
    int64_t initialOrientation = self->_initialOrientation;
  }
  [(BSUIOrientationTransformWrapperView *)v5 setContainerOrientation:initialOrientation];
  [(UIView *)self->super._contentContainer addSubview:self->_dynamicWrapperView];
  [(PBUIPosterHomeViewController *)self _updateRotationForOrientation:self->_initialOrientation];
  if (_PRNeedsWallpaperCaptureView_onceToken != -1) {
    dispatch_once(&_PRNeedsWallpaperCaptureView_onceToken, &__block_literal_global_15);
  }
  if (_PRNeedsWallpaperCaptureView_needsWallpaperCaptureView)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v6 = (void *)getMTMaterialViewClass_softClass_0;
    uint64_t v24 = getMTMaterialViewClass_softClass_0;
    if (!getMTMaterialViewClass_softClass_0)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __getMTMaterialViewClass_block_invoke_0;
      v20[3] = &unk_1E62B2890;
      v20[4] = &v21;
      __getMTMaterialViewClass_block_invoke_0((uint64_t)v20);
      uint64_t v6 = (void *)v22[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v21, 8);
    v8 = [v7 materialViewWithRecipe:19 options:4];
    wallpaperCaptureView = self->_wallpaperCaptureView;
    self->_wallpaperCaptureView = v8;

    [(MTMaterialView *)self->_wallpaperCaptureView setGroupName:@"WallpaperCaptureGroup"];
    long long v10 = [(MTMaterialView *)self->_wallpaperCaptureView layer];
    uint64_t v11 = objc_opt_class();
    id v12 = v10;
    if (v11)
    {
      if (objc_opt_isKindOfClass()) {
        long long v13 = v12;
      }
      else {
        long long v13 = 0;
      }
    }
    else
    {
      long long v13 = 0;
    }
    id v14 = v13;

    [v14 setGroupNamespace:*MEMORY[0x1E4F39DA0]];
    [v12 setName:@"WallpaperCaptureLayer"];
    [(MTMaterialView *)self->_wallpaperCaptureView setAutoresizingMask:18];
    uint64_t v15 = [(PBUIPosterHomeViewController *)self view];
    [v15 addSubview:self->_wallpaperCaptureView];

    v16 = [(PBUIPosterHomeViewController *)self view];
    [v16 bringSubviewToFront:self->_wallpaperCaptureView];
  }
  [(PBUIPosterHomeViewController *)self configureForZOrder];
  [(PBUIPosterHomeViewController *)self unlockProgress];
  -[PBUIPosterHomeViewController _updateDimHomeScreenWallpaperViewForUnlockProgress:animated:](self, "_updateDimHomeScreenWallpaperViewForUnlockProgress:animated:", 0);
  v17 = [(PBUIPosterHomeViewController *)self view];
  [v17 addSubview:self->_dimView];

  v18 = [(PBUIPosterHomeViewController *)self view];
  [v18 bringSubviewToFront:self->_dimView];

  [(PBUIPosterHomeViewController *)self _updateEnableHomeScreenWallpaperDimming];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterHomeViewController *)&v8 viewDidLayoutSubviews];
  dynamicWrapperView = self->_dynamicWrapperView;
  [(UIView *)self->super._contentContainer bounds];
  -[BSUIOrientationTransformWrapperView setFrame:](dynamicWrapperView, "setFrame:");
  wallpaperCaptureView = self->_wallpaperCaptureView;
  if (wallpaperCaptureView)
  {
    uint64_t v5 = [(PBUIPosterHomeViewController *)self view];
    [v5 bounds];
    -[MTMaterialView setFrame:](wallpaperCaptureView, "setFrame:");
  }
  dimView = self->_dimView;
  id v7 = [(PBUIPosterHomeViewController *)self view];
  [v7 bounds];
  -[UIView setFrame:](dimView, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterHomeViewController *)&v4 viewWillAppear:a3];
  [(PBUIPosterHomeViewController *)self unlockProgress];
  -[PBUIPosterHomeViewController _updateDimHomeScreenWallpaperViewForUnlockProgress:animated:](self, "_updateDimHomeScreenWallpaperViewForUnlockProgress:animated:", 0);
}

- (PBUIHomeVariantStyleState)currentHomeVariantStyleState
{
  currentHomeVariantStyleState = self->_currentHomeVariantStyleState;
  if (!currentHomeVariantStyleState)
  {
    objc_super v4 = [(PBUIPosterHomeViewController *)self _fetchStyleState];
    uint64_t v5 = self->_currentHomeVariantStyleState;
    self->_currentHomeVariantStyleState = v4;

    currentHomeVariantStyleState = self->_currentHomeVariantStyleState;
  }
  uint64_t v6 = currentHomeVariantStyleState;
  return v6;
}

- (id)homeScreenConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
  v3 = [WeakRetained lockScreenConfiguration];
  id v8 = 0;
  objc_super v4 = objc_msgSend(v3, "pr_loadHomeScreenConfigurationWithError:", &v8);
  id v5 = v8;

  if (v5)
  {
    uint64_t v6 = PBUILogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PBUIPosterHomeViewController *)(uint64_t)v5 homeScreenConfiguration];
    }
  }
  return v4;
}

- (id)averageColor
{
  if (self->_fixedColorStatistics)
  {
    v2 = [(PUIColorStatistics *)self->_fixedColorStatistics averageColor];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PBUIPosterHomeViewController;
    v2 = [(PBUIPosterVariantViewController *)&v4 averageColor];
  }
  return v2;
}

- (double)averageContrast
{
  if (self->_fixedColorStatistics)
  {
    fixedColorStatistics = self->_fixedColorStatistics;
    [(PUIColorStatistics *)fixedColorStatistics averageContrast];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PBUIPosterHomeViewController;
    [(PBUIPosterVariantViewController *)&v4 averageContrast];
  }
  return result;
}

- (void)noteWillRotateToInterfaceOrientation:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIPosterHomeViewController;
  -[PBUIPosterVariantViewController noteWillRotateToInterfaceOrientation:](&v6, sel_noteWillRotateToInterfaceOrientation_);
  self->_mostRecentOrientation = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PBUIPosterHomeViewController_noteWillRotateToInterfaceOrientation___block_invoke;
  v5[3] = &unk_1E62B31E0;
  v5[4] = self;
  v5[5] = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:0.4];
  self->_isUpdatingOrientation = 1;
}

uint64_t __69__PBUIPosterHomeViewController_noteWillRotateToInterfaceOrientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRotationForOrientation:*(void *)(a1 + 40)];
}

- (void)noteDidRotateToInterfaceOrientation:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterVariantViewController *)&v4 noteDidRotateToInterfaceOrientation:a3];
  self->_isUpdatingOrientation = 0;
}

- (void)_updateRotationForOrientation:(int64_t)a3
{
  dynamicWrapperView = self->_dynamicWrapperView;
  if (self->_gradientView)
  {
    if (soft_PUIDynamicRotationIsActive()) {
      int64_t v5 = a3;
    }
    else {
      int64_t v5 = 1;
    }
    [(BSUIOrientationTransformWrapperView *)dynamicWrapperView setContentOrientation:v5];
  }
  else
  {
    [(BSUIOrientationTransformWrapperView *)self->_dynamicWrapperView setContentOrientation:1];
    scene = self->super._scene;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PBUIPosterHomeViewController__updateRotationForOrientation___block_invoke;
    v8[3] = &unk_1E62B3598;
    v8[4] = self;
    [(FBScene *)scene pb_update:v8];
  }
}

void __62__PBUIPosterHomeViewController__updateRotationForOrientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  if (soft_PUIDynamicRotationIsActive()) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 1280);
  }
  [v6 setInterfaceOrientation:v7];
  objc_msgSend(v6, "pui_setDeviceOrientation:", *(void *)(*(void *)(a1 + 32) + 1280));

  id v8 = [*(id *)(a1 + 32) view];
  objc_super v9 = [v8 window];
  id v13 = [v9 windowScene];

  [v13 _synchronizeDrawing];
  long long v10 = [v13 _synchronizedDrawingFence];
  [v5 setAnimationFence:v10];

  uint64_t v11 = (void *)MEMORY[0x1E4F4F680];
  [MEMORY[0x1E4F42FF0] inheritedAnimationDuration];
  id v12 = objc_msgSend(v11, "settingsWithDuration:");
  [v5 setAnimationSettings:v12];
}

- (void)performSnapshotOnQueue:(id)a3 scene:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(location, self);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke;
  v41[3] = &unk_1E62B3EA0;
  id v11 = v9;
  id v42 = v11;
  id v12 = (void *)MEMORY[0x1C1872570](v41);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2;
  v38[3] = &unk_1E62B3F18;
  objc_copyWeak(&v40, location);
  id v13 = v8;
  id v39 = v13;
  id v14 = (void (**)(void, void))MEMORY[0x1C1872570](v38);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_5;
  v32[3] = &unk_1E62B3FB8;
  id v15 = v11;
  id v33 = v15;
  v34 = self;
  id v16 = v10;
  id v36 = v16;
  id v17 = v13;
  id v35 = v17;
  id v18 = v12;
  id v37 = v18;
  objc_super v19 = (void *)MEMORY[0x1C1872570](v32);
  v20 = v19;
  int64_t currentMode = self->_currentMode;
  if (currentMode == 2)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_5_91;
    v26[3] = &unk_1E62B4008;
    v27[0] = v17;
    v27[1] = self;
    id v28 = v20;
    v25.receiver = self;
    v25.super_class = (Class)PBUIPosterHomeViewController;
    [(PBUIPosterVariantViewController *)&v25 performSnapshotOnQueue:v27[0] scene:v15 completion:v26];
    v22 = (id *)v27;
  }
  else if (currentMode == 1)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4_87;
    v30[3] = &unk_1E62B3FE0;
    id v31 = v19;
    v29.receiver = self;
    v29.super_class = (Class)PBUIPosterHomeViewController;
    [(PBUIPosterVariantViewController *)&v29 performSnapshotOnQueue:v17 scene:v15 completion:v30];
    v22 = &v31;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_6_101;
    v23[3] = &unk_1E62B3FE0;
    id v24 = v19;
    ((void (**)(void, void *))v14)[2](v14, v23);
    v22 = &v24;
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
}

id __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)[a2 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  id v10 = (void *)MEMORY[0x1E4F28DB0];
  id v11 = [v5 BSColor];

  id v12 = [v10 archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

  if (v12) {
    [v9 setObject:v12 forKeyedSubscript:@"kDerivedProminentPosterColorMetadataKey"];
  }

  id v13 = (void *)MEMORY[0x1E4F28DB0];
  id v14 = [*(id *)(a1 + 32) clientSettings];
  id v15 = objc_msgSend(v14, "pr_preferredProminentColor");
  id v16 = [v13 archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];

  if (v16) {
    [v9 setObject:v16 forKeyedSubscript:@"kPosterPreferredProminentPosterColorMetadataKey"];
  }

  return v9;
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = v3;
  id v4 = *(id *)(a1 + 32);
  BSDispatchMain();

  objc_destroyWeak(&v6);
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_3(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained view];
    id v5 = [v3 view];
    [v5 bounds];
    uint64_t v6 = objc_msgSend(v4, "newSnapshotWithRect:");

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4;
    v13[3] = &unk_1E62B3EC8;
    uint64_t v15 = v6;
    uint64_t v7 = *(NSObject **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    v13[4] = v3;
    id v14 = v8;
    dispatch_async(v7, v13);
    id v9 = v14;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17[0] = @"calling object was deallocated before we could access";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v12 = [v11 errorWithDomain:@"com.apple.PaperBoardUI" code:-2 userInfo:v9];
    (*(void (**)(uint64_t, void, void, void, void *))(v10 + 16))(v10, 0, 0, 0, v12);
  }
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42A80] imageWithCGImage:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  CGImageRelease(*(CGImageRef *)(a1 + 48));
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_6;
  v24[3] = &unk_1E62B3F90;
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  id v25 = v16;
  uint64_t v26 = v17;
  id v27 = v15;
  id v28 = v11;
  id v18 = *(id *)(a1 + 56);
  id v29 = v13;
  id v30 = v14;
  id v33 = v18;
  id v31 = v12;
  id v32 = *(id *)(a1 + 48);
  id v34 = *(id *)(a1 + 64);
  id v19 = v12;
  id v20 = v14;
  id v21 = v13;
  id v22 = v11;
  id v23 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v24);
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) clientSettings];
  id v3 = objc_msgSend(v2, "pr_preferredProminentColor");
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) derivedProminentColor];
    BOOL v4 = v5 == 0;
  }
  uint64_t v6 = PBUILogSnapshot();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = PBUIStringForWallpaperVariant([*(id *)(a1 + 40) variant]);
    *(_DWORD *)buf = 138543618;
    id v20 = v7;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] needsPosterDerivedProminentColorDetermination: %{BOOL}u", buf, 0x12u);
  }
  if (!*(void *)(a1 + 48) && *(void *)(a1 + 56) && v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_82;
    v11[3] = &unk_1E62B3F68;
    id v8 = *(void **)(a1 + 80);
    id v12 = *(id *)(a1 + 88);
    id v17 = *(id *)(a1 + 96);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 72);
    id v18 = *(id *)(a1 + 104);
    objc_msgSend(v8, "pruis_determineProminentColorWithCompletion:", v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  BSDispatchQueueAssertMain();
  BOOL v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2_83;
  block[3] = &unk_1E62B3F40;
  id v10 = v3;
  id v15 = *(id *)(a1 + 72);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v14 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 80);
  id v8 = v3;
  dispatch_async(v4, block);
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_2_83(void *a1)
{
  if (a1[4])
  {
    id v2 = (*(void (**)(void))(a1[10] + 16))();
    uint64_t v3 = *(void *)(a1[6] + 1256);
    if (!v3) {
      uint64_t v3 = a1[7];
    }
    (*(void (**)(void, void, uint64_t, void *, void))(a1[9] + 16))(a1[9], a1[5], v3, v2, 0);
  }
  else
  {
    uint64_t v4 = a1[9];
    uint64_t v5 = *(void *)(a1[6] + 1256);
    if (!v5) {
      uint64_t v5 = a1[7];
    }
    (*(void (**)(uint64_t, void, uint64_t, void, void))(v4 + 16))(v4, a1[5], v5, a1[8], 0);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_3_84;
  block[3] = &unk_1E62B2798;
  void block[4] = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_3_84(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHomeVariantStyleState];
}

uint64_t __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_4_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_5_91(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BSDispatchQueueAssert();
  if (!v9 || v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v13 = objc_alloc_init(PBUIMaterialCompositor);
    [(PBUIMaterialCompositor *)v13 setDownsampleFactor:1.0];
    id v14 = [PBUIWallpaperEffectConfiguration alloc];
    id v15 = [MEMORY[0x1E4F428B8] blackColor];
    id v16 = [*(id *)(a1 + 40) traitCollection];
    id v17 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:](v14, 0x1EuLL, v15, [v16 userInterfaceStyle]);

    id v18 = (void *)[v11 mutableCopy];
    id v19 = v18;
    id v20 = v17;
    if (v18) {
      id v21 = v18;
    }
    else {
      id v21 = (id)objc_opt_new();
    }
    BOOL v22 = v21;

    uint64_t v23 = [v22 objectForKey:@"AppliedEffects"];
    id v24 = (void *)[v23 mutableCopy];
    id v25 = v24;
    id v35 = v11;
    id v36 = v10;
    if (v24) {
      id v26 = v24;
    }
    else {
      id v26 = (id)objc_opt_new();
    }
    id v27 = v26;

    [v27 addObject:@"HomeLegibilityBlur"];
    id v28 = (void *)[v27 copy];
    [v22 setObject:v28 forKeyedSubscript:@"AppliedEffects"];

    id v37 = 0;
    id v29 = v9;
    id v30 = [(PBUIMaterialCompositor *)v13 applyEffect:v20 toImage:v29 error:&v37];
    uint64_t v31 = *(void *)(a1 + 48);
    id v32 = v13;
    id v33 = v37;
    id v34 = (void *)[v22 copy];
    (*(void (**)(uint64_t, void *, id, void, void *, id))(v31 + 16))(v31, v30, v29, 0, v34, v33);

    id v11 = v35;
    id v10 = v36;
    id v12 = 0;
  }
}

uint64_t __72__PBUIPosterHomeViewController_performSnapshotOnQueue_scene_completion___block_invoke_6_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (int64_t)presentationModeForHomeConfiguration:(id)a3
{
  id v3 = a3;
  switch([v3 selectedAppearanceType])
  {
    case 0:
      uint64_t v4 = [v3 lockPosterAppearance];
      goto LABEL_9;
    case 1:
      uint64_t v5 = [v3 solidColorAppearance];
      uint64_t v6 = [v5 effectiveColor];

      if (!v6) {
        goto LABEL_11;
      }
      int64_t v7 = 3;
      break;
    case 2:
      id v8 = [v3 gradientAppearance];

      if (v8) {
        int64_t v7 = 4;
      }
      else {
        int64_t v7 = 1;
      }
      break;
    case 3:
      uint64_t v4 = [v3 homePosterAppearance];
LABEL_9:
      id v9 = v4;
      char v10 = [v4 isLegibilityBlurEnabled];

      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
      int64_t v7 = 2;
      break;
    default:
LABEL_11:
      int64_t v7 = 1;
      break;
  }

  return v7;
}

- (id)_fetchPosterPreferredProminentColor
{
  id v3 = [(PBUIPosterHomeViewController *)self homeScreenConfiguration];
  if ((unint64_t)(+[PBUIPosterHomeViewController presentationModeForHomeConfiguration:v3]- 3) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)PBUIPosterHomeViewController;
    uint64_t v6 = [(PBUIPosterVariantViewController *)&v8 _fetchPosterPreferredProminentColor];
  }
  else
  {
    uint64_t v4 = [v3 solidColorAppearance];
    uint64_t v5 = [v4 effectiveColor];
    uint64_t v6 = [v5 color];
  }
  return v6;
}

- (BOOL)updatePresentation
{
  v33[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PBUIPosterHomeViewController *)self homeScreenConfiguration];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __50__PBUIPosterHomeViewController_updatePresentation__block_invoke;
  v32[3] = &unk_1E62B2798;
  void v32[4] = self;
  uint64_t v5 = (void (**)(void))MEMORY[0x1C1872570](v32);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_homeConfiguration, v4);
    int64_t v8 = +[PBUIPosterHomeViewController presentationModeForHomeConfiguration:v4];
    goto LABEL_6;
  }
  int64_t v6 = +[PBUIPosterHomeViewController presentationModeForHomeConfiguration:v4];
  if (self->_currentMode != v6)
  {
    int64_t v8 = v6;
LABEL_6:
    self->_int64_t currentMode = v8;
    id v9 = self->super._contentContainer;
    if ((unint64_t)(v8 - 1) <= 1)
    {
      [(PBUIPosterHomeViewController *)self setFixedAverageColor:0];
      [(PBUIGradientView *)self->_gradientView removeFromSuperview];
      gradientView = self->_gradientView;
      self->_gradientView = 0;

      [(PBUIPosterHomeViewController *)self setFixedAverageColor:0];
      presenter = self->super._presenter;
      if (self->super._scene)
      {
        if (!presenter)
        {
          uint64_t v31 = [NSString stringWithFormat:@"presenter is nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            [(PBUIPosterHomeViewController *)a2 updatePresentation];
          }
          [v31 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1BC502970);
        }
        [(UIScenePresenter *)presenter activate];
        id v12 = [(UIScenePresenter *)self->super._presenter presentationView];
        sceneView = self->super._sceneView;
        self->super._sceneView = v12;

        id v14 = self->super._sceneView;
        [(UIView *)v9 bounds];
        -[UIScenePresentation setFrame:](v14, "setFrame:");
        [(UIScenePresentation *)self->super._sceneView setAutoresizingMask:18];
        [(BSUIOrientationTransformWrapperView *)self->_dynamicWrapperView addContentView:self->super._sceneView];
      }
      else
      {
        [(UIScenePresenter *)presenter deactivate];
        [(UIScenePresentation *)self->super._sceneView removeFromSuperview];
        uint64_t v23 = self->super._sceneView;
        self->super._sceneView = 0;
      }
      if ([(PBUIPosterHomeViewController *)self showsSnapshotWhenIdleForMode:v8]
        || !self->super._scene)
      {
        if (self->_effectView)
        {
          -[UIView bringSubviewToFront:](v9, "bringSubviewToFront:");
        }
        else
        {
          id v27 = [PBUIEffectTrackingReplicaView alloc];
          [(UIView *)v9 bounds];
          id v28 = -[PBUIEffectTrackingReplicaView initWithFrame:](v27, "initWithFrame:");
          effectView = self->_effectView;
          self->_effectView = v28;

          [(PBUIEffectTrackingReplicaView *)self->_effectView setReason:@"HomeVC blurs"];
          [(PBUIEffectTrackingReplicaView *)self->_effectView setRequiresSnapshotTreatment:0];
          [(PBUIEffectTrackingReplicaView *)self->_effectView setAutoresizingMask:18];
          [(PBUIEffectTrackingReplicaView *)self->_effectView setDelegate:self];
          [(UIView *)v9 addSubview:self->_effectView];
        }
        [(PBUIPosterHomeViewController *)self configureEffectViewForMode];
      }
      else
      {
        [(PBUIEffectTrackingReplicaView *)self->_effectView invalidate];
        [(PBUIEffectTrackingReplicaView *)self->_effectView removeFromSuperview];
        id v24 = self->_effectView;
        self->_effectView = 0;
      }
      v5[2](v5);
      LOBYTE(v7) = 1;
LABEL_27:

      goto LABEL_28;
    }
    [(UIScenePresenter *)self->super._presenter deactivate];
    [(UIScenePresentation *)self->super._sceneView removeFromSuperview];
    id v15 = self->super._sceneView;
    self->super._sceneView = 0;

    [(PBUIEffectTrackingReplicaView *)self->_effectView invalidate];
    [(PBUIEffectTrackingReplicaView *)self->_effectView removeFromSuperview];
    id v16 = self->_effectView;
    self->_effectView = 0;

    id v17 = objc_alloc_init(PBUIWallpaperGradient);
    if (v8 == 3)
    {
      id v25 = [v4 solidColorAppearance];
      id v19 = [v25 effectiveColor];

      id v20 = [v19 color];
      v33[0] = v20;
      v33[1] = v20;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [(PBUIWallpaperGradient *)v17 setColors:v26];

      [(PBUIPosterHomeViewController *)self setFixedAverageColor:v20];
    }
    else
    {
      if (v8 != 4)
      {
LABEL_21:
        BOOL v7 = [(PBUIPosterHomeViewController *)self updateGradientViewWithGradient:v17];
        if (v7) {
          v5[2](v5);
        }

        goto LABEL_27;
      }
      id v18 = [v4 gradientAppearance];
      id v19 = [v18 effectiveColor];

      id v20 = [v19 color];
      id v21 = [v4 gradientAppearance];
      BOOL v22 = [v21 gradientColors];

      [(PBUIWallpaperGradient *)v17 setColors:v22];
      [(PBUIPosterHomeViewController *)self setFixedAverageColor:v20];
    }
    goto LABEL_21;
  }
  v5[2](v5);
  LOBYTE(v7) = 0;
LABEL_28:

  return v7;
}

uint64_t __50__PBUIPosterHomeViewController_updatePresentation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateHomeVariantStyleState];
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[155];
  [v2 weightingForEffectView];
  objc_msgSend(v3, "setEffectWeight:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1240), "setShowsSnapshot:", objc_msgSend(*(id *)(a1 + 32), "canShowSnapshot"));
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 configureForZOrder];
}

- (void)setFixedAverageColor:(id)a3
{
  id v4 = a3;
  fixedColorStatistics = self->_fixedColorStatistics;
  id v10 = v4;
  if (v4)
  {
    id v6 = v4;
    if (!fixedColorStatistics)
    {
      BOOL v7 = (PUIColorStatistics *)[objc_alloc((Class)getPUIColorStatisticsClass()) initWithDelegate:self];
      int64_t v8 = self->_fixedColorStatistics;
      self->_fixedColorStatistics = v7;

      id v6 = v10;
      fixedColorStatistics = self->_fixedColorStatistics;
    }
    [(PUIColorStatistics *)fixedColorStatistics resetWithColor:v6];
  }
  else
  {
    self->_fixedColorStatistics = 0;

    if (fixedColorStatistics)
    {
      id v9 = [(PBUIPosterHomeViewController *)self contentColorStatistics];
      [(PBUIPosterVariantViewController *)self colorStatisticsDidChange:v9];
    }
  }
}

- (BOOL)updateGradientViewWithGradient:(id)a3
{
  id v4 = a3;
  gradientView = self->_gradientView;
  if (!gradientView)
  {
    id v6 = [PBUIGradientView alloc];
    [(UIView *)self->super._contentContainer bounds];
    BOOL v7 = -[PBUIGradientView initWithFrame:](v6, "initWithFrame:");
    int64_t v8 = self->_gradientView;
    self->_gradientView = v7;

    [(PBUIGradientView *)self->_gradientView setAutoresizingMask:18];
    [(BSUIOrientationTransformWrapperView *)self->_dynamicWrapperView addContentView:self->_gradientView];
    id v9 = [(PBUIPosterVariantViewController *)self counterpart];
    id v10 = [v9 scene];
    id v11 = [v10 settings];
    -[PBUIPosterHomeViewController _updateRotationForOrientation:](self, "_updateRotationForOrientation:", objc_msgSend(v11, "pui_deviceOrientation"));

    gradientView = self->_gradientView;
  }
  id v12 = [(PBUIGradientView *)gradientView gradient];
  char v13 = BSEqualObjects() ^ 1;

  [(PBUIGradientView *)self->_gradientView setGradient:v4];
  return v13;
}

- (void)validateSnapshottingPreconditionsForSettings:(id)a3 result:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  int64_t currentMode = self->_currentMode;
  if ((unint64_t)(currentMode - 3) <= 1)
  {
    int64_t v8 = [(PBUIPosterHomeViewController *)self viewIfLoaded];
    if (!v8) {
      [v6 appendPreconditionResultFailureWithFormat:@"poster scene view has not been created"];
    }
    if ([v8 isHidden]) {
      [v6 appendPreconditionResultFailureWithFormat:@"poster scene view is hidden"];
    }
    gradientView = self->_gradientView;
    if (!gradientView)
    {
      [v6 appendPreconditionResultFailureWithFormat:@"poster scene view's gradient view has not been created"];
      gradientView = self->_gradientView;
    }
    if ([(PBUIGradientView *)gradientView isHidden]) {
      [v6 appendPreconditionResultFailureWithFormat:@"poster scene view's gradient view is hidden"];
    }
    id v10 = [(PBUIGradientView *)self->_gradientView superview];

    if (!v10) {
      [v6 appendPreconditionResultFailureWithFormat:@"poster scene view's gradient view has not been added to a superview"];
    }
  }
  id v11 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v12 = [v11 deviceClass];

  if (v12 != 2
    && objc_msgSend(v24, "pr_adjustedLuminance") != 2
    && ([v6 isSnapshottingForExternalDisplayHostedWallpaper] & 1) == 0)
  {
    uint64_t v13 = objc_msgSend(v24, "pr_adjustedLuminance");
    id v14 = MEMORY[0x1C1871860](0);
    objc_msgSend(v6, "appendPreconditionResultFailureWithFormat:", @"screen is off; Backlight mode: %lu; isPad: %@",
      v13,
      v14);
  }
  BOOL v15 = [(PBUIPosterHomeViewController *)self reflectsLock];
  id v16 = [v6 externalDisplayConfiguration];
  if (v16)
  {
    id v17 = [v6 externalDisplayConfiguration];
    int v18 = [v17 mirrorsEmbeddedDisplay];
  }
  else
  {
    int v18 = 1;
  }

  if (v15)
  {
    if ((unint64_t)(currentMode - 5) < 0xFFFFFFFFFFFFFFFELL) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    BOOL v20 = [(PBUIPosterHomeViewController *)self isSettledPosition];
    if (v19 == 1 && !v20) {
      [v6 appendPreconditionResultFailure:@"poster is not in settled position"];
    }
  }
  else
  {
    [(PBUIPosterHomeViewController *)self isSettledPosition];
  }
  id v21 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];
  BOOL v22 = [v6 externalDisplayConfiguration];
  int v23 = BSEqualObjects();

  if (v23 && self->_isUpdatingOrientation) {
    [v6 appendPreconditionResultFailure:@"poster is updating orientation"];
  }
}

- (void)applyFauxExternalSceneSettings:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterVariantViewController *)&v8 applyFauxExternalSceneSettings:v4];
  uint64_t v5 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];

  if (v5)
  {
    id v6 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];
    char v7 = [v6 mirrorsEmbeddedDisplay];

    if ((v7 & 1) == 0) {
      objc_msgSend(v4, "pr_setUnlockProgress:", 1.0);
    }
  }
}

- (void)setCounterpart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterHomeViewController;
  [(PBUIPosterVariantViewController *)&v4 setCounterpart:a3];
  [(PBUIPosterHomeViewController *)self updatePresentation];
  [(PBUIPosterHomeViewController *)self configureForZOrder];
}

- (void)updateViewControllerVisibilityForUnlockProgress:(double)a3
{
}

- (id)acquireDuckHomeScreenWallpaperDimAssertionWithReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_duckHomeScreenWallpaperDimAssertions)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    duckHomeScreenWallpaperDimAssertions = self->_duckHomeScreenWallpaperDimAssertions;
    self->_duckHomeScreenWallpaperDimAssertions = v5;
  }
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int v12 = __85__PBUIPosterHomeViewController_acquireDuckHomeScreenWallpaperDimAssertionWithReason___block_invoke;
  uint64_t v13 = &unk_1E62B3778;
  objc_copyWeak(&v14, &location);
  objc_super v8 = (void *)[v7 initWithIdentifier:@"duck_home_screen_wallpaper_dimming" forReason:v4 invalidationBlock:&v10];
  -[NSHashTable addObject:](self->_duckHomeScreenWallpaperDimAssertions, "addObject:", v8, v10, v11, v12, v13);
  [(PBUIPosterHomeViewController *)self _updateEnableHomeScreenWallpaperDimming];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __85__PBUIPosterHomeViewController_acquireDuckHomeScreenWallpaperDimAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __85__PBUIPosterHomeViewController_acquireDuckHomeScreenWallpaperDimAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _duckHomeScreenWallpaperDimAssertionDidInvalidate:*(void *)(a1 + 32)];
}

- (BOOL)isHomeScreenWallpaperDimmed
{
  id v2 = [(PBUIPosterVariantViewController *)self lockScreenConfiguration];
  id v3 = objc_msgSend(v2, "pr_loadHomeScreenConfigurationWithError:", 0);
  id v4 = [v3 customizationConfiguration];
  char v5 = [v4 isDimmed];

  return v5;
}

- (BOOL)_shouldHomeScreenWallpaperBeDimmed
{
  BOOL v3 = [(PBUIPosterHomeViewController *)self isHomeScreenWallpaperDimmed];
  return ![(NSHashTable *)self->_duckHomeScreenWallpaperDimAssertions count] && v3;
}

- (void)_updateEnableHomeScreenWallpaperDimming
{
  int isHomeScreenWallpaperCurrentlyDimmed = self->_isHomeScreenWallpaperCurrentlyDimmed;
  int v4 = [(PBUIPosterHomeViewController *)self _shouldHomeScreenWallpaperBeDimmed];
  if (isHomeScreenWallpaperCurrentlyDimmed != v4)
  {
    self->_int isHomeScreenWallpaperCurrentlyDimmed = v4;
    [(PBUIPosterHomeViewController *)self unlockProgress];
    double v6 = v5;
    BOOL v7 = [(PBUIPosterHomeViewController *)self isSettledPosition];
    [(PBUIPosterHomeViewController *)self _updateDimHomeScreenWallpaperViewForUnlockProgress:v7 animated:v6];
  }
}

- (void)_duckHomeScreenWallpaperDimAssertionDidInvalidate:(id)a3
{
  [(NSHashTable *)self->_duckHomeScreenWallpaperDimAssertions removeObject:a3];
  if (![(NSHashTable *)self->_duckHomeScreenWallpaperDimAssertions count])
  {
    duckHomeScreenWallpaperDimAssertions = self->_duckHomeScreenWallpaperDimAssertions;
    self->_duckHomeScreenWallpaperDimAssertions = 0;
  }
  [(PBUIPosterHomeViewController *)self _updateEnableHomeScreenWallpaperDimming];
}

- (void)_updateDimHomeScreenWallpaperViewForUnlockProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = a3 * 0.4 + 0.0;
  if (self->_isHomeScreenWallpaperCurrentlyDimmed) {
    double v6 = v5;
  }
  else {
    double v6 = 0.0;
  }
  id v15 = [(UIView *)self->_dimView layer];
  BOOL v7 = [v15 animationForKey:@"DIM_ANIMATION"];

  if (v7) {
    [v15 removeAnimationForKey:@"DIM_ANIMATION"];
  }
  if (v4)
  {
    id v9 = [v15 presentationLayer];
    [v9 opacity];
    double v11 = v10;

    int v12 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
    [v12 setDuration:0.3388];
    [v12 setMass:1.0];
    [v12 setStiffness:343.985];
    [v12 setDamping:37.0937];
    [v12 setInitialVelocity:0.0];
    uint64_t v13 = [NSNumber numberWithDouble:v11];
    [v12 setFromValue:v13];

    id v14 = [NSNumber numberWithDouble:v6];
    [v12 setToValue:v14];

    [v12 setRemovedOnCompletion:0];
    [v12 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v15 addAnimation:v12 forKey:@"DIM_ANIMATION"];
  }
  else
  {
    *(float *)&double v8 = v6;
    [v15 setOpacity:v8];
  }
}

- (void)noteHomeVariantStyleStateMayHaveUpdated
{
  BSDispatchQueueAssertMain();
  [(PBUIPosterHomeViewController *)self _updateEnableHomeScreenWallpaperDimming];
  [(PBUIPosterHomeViewController *)self updateHomeVariantStyleState];
}

- (BOOL)updateHomeVariantStyleState
{
  p_currentHomeVariantStyleState = &self->_currentHomeVariantStyleState;
  BOOL v4 = self->_currentHomeVariantStyleState;
  double v5 = [(PBUIPosterHomeViewController *)self _fetchStyleState];
  BOOL v6 = [(PBUIHomeVariantStyleState *)v4 isEqualToState:v5];
  if (!v6) {
    objc_storeStrong((id *)p_currentHomeVariantStyleState, v5);
  }

  return !v6;
}

- (id)_fetchStyleState
{
  BOOL v3 = [(PBUIPosterHomeViewController *)self homeScreenConfiguration];
  BOOL v4 = PBUIHomeVariantStyleStateFromPRPosterHomeScreenConfiguration(v3);
  uint64_t v5 = [v4 suggestedTintColor];
  if (v5)
  {
    BOOL v6 = (void *)v5;
  }
  else
  {
    BOOL v6 = [(PBUIPosterVariantViewController *)self _posterPreferredProminentColor:1];
    uint64_t v7 = [v4 styleStateByUpdatingSuggestedTintColor:v6];

    BOOL v4 = (void *)v7;
  }

  return v4;
}

- (void)effectTrackingReplicaViewHasValidSnapshot:(id)a3
{
  effectView = self->_effectView;
  BOOL v4 = [(PBUIPosterHomeViewController *)self canShowSnapshot];
  [(PBUIEffectTrackingReplicaView *)effectView setShowsSnapshot:v4];
}

- (void)configureEffectViewForMode
{
  BOOL v3 = [(PBUIPosterHomeViewController *)self reflectsLock];
  effectView = self->_effectView;
  uint64_t v5 = [(PBUIPosterVariantViewController *)self snapshotSourceProvider];
  [(PBUIEffectTrackingReplicaView *)effectView setSnapshotProvider:v5];

  BOOL v6 = self->_effectView;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
    double v8 = [WeakRetained portalSourceProvider];
    [(PBUIEffectTrackingReplicaView *)v6 setPortalProvider:v8];
  }
  else
  {
    [(PBUIEffectTrackingReplicaView *)self->_effectView setPortalProvider:0];
  }
  if ([(PBUIPosterHomeViewController *)self isBlurred]) {
    uint64_t v9 = 30;
  }
  else {
    uint64_t v9 = 0;
  }
  [(PBUIEffectTrackingReplicaView *)self->_effectView requestStyle:v9];
  [(PBUIPosterHomeViewController *)self configureForZOrder];
}

- (BOOL)isSettledPosition
{
  if (![(PBUIPosterHomeViewController *)self reflectsLock]
    || ([(PBUIPosterHomeViewController *)self unlockProgress], (int IsOne = BSFloatIsOne()) != 0))
  {
    LOBYTE(IsOne) = !self->_isUpdatingOrientation;
  }
  return IsOne;
}

- (double)weightingForEffectView
{
  BOOL v3 = [(PBUIPosterHomeViewController *)self isBlurred];
  double result = 1.0;
  if (v3)
  {
    [(PBUIPosterHomeViewController *)self unlockProgress];
    return fmin(fmax((v5 + -0.2) / 0.8 + 0.0, 0.0), 1.0);
  }
  return result;
}

- (double)unlockProgress
{
  if (![(PBUIPosterHomeViewController *)self reflectsLock]) {
    return 1.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._counterpart);
  BOOL v4 = [WeakRetained scene];
  double v5 = [v4 settings];
  objc_msgSend(v5, "pr_unlockProgress");
  double v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHomeVariantStyleState, 0);
  objc_storeStrong((id *)&self->_duckHomeScreenWallpaperDimAssertions, 0);
  objc_storeStrong((id *)&self->_dimView, 0);
  objc_storeStrong((id *)&self->_dynamicWrapperView, 0);
  objc_storeStrong((id *)&self->_wallpaperCaptureView, 0);
  objc_storeStrong((id *)&self->_fixedColorStatistics, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_homeConfiguration, 0);
}

- (void)homeScreenConfiguration
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_ERROR, "Unable to load home screen configuration: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)updatePresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"PBUIPosterHomeViewController.m";
  __int16 v16 = 1024;
  int v17 = 454;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end