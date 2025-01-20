@interface SBWallpaperIconStyleCoordinator
- (BOOL)_issueUpdates:(id)a3;
- (BOOL)isWallpaperDimmed;
- (BOOL)shouldUseLargeHomeScreenIcons;
- (BSColor)currentTintColor;
- (PUIStylePickerHomeScreenConfiguration)currentStyleConfiguration;
- (SBHomeScreenDefaults)homeScreenDefaults;
- (SBWallpaperController)wallpaperController;
- (SBWallpaperIconStyleCoordinator)initWithWallpaperController:(id)a3 homeScreenDefaults:(id)a4;
- (id)_fetchPosterStyleState;
- (id)_fetchStyleConfiguration;
- (id)posterStyleState;
- (void)_fetchPosterStyleState;
- (void)_notifyObserversOfUpdatedPostersStyleState;
- (void)_postersStyleStateDidChange;
- (void)_resetStateExpectingUpdates;
- (void)_setupObservers;
- (void)_setupStateCapture;
- (void)addIconStyleObserver:(id)a3;
- (void)dealloc;
- (void)fetchWallpaperProminentColor:(id)a3;
- (void)removeIconStyleObserver:(id)a3;
- (void)setCurrentStyleConfiguration:(id)a3;
- (void)setCurrentTintColor:(id)a3;
- (void)setShouldUseLargeHomeScreenIcons:(BOOL)a3;
- (void)setWallpaperDimmed:(BOOL)a3;
- (void)shouldUseLargeHomeScreenIcons;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
- (void)wallpaperWillChangeForVariant:(int64_t)a3;
@end

@implementation SBWallpaperIconStyleCoordinator

- (PUIStylePickerHomeScreenConfiguration)currentStyleConfiguration
{
  currentStyleConfiguration = self->_currentStyleConfiguration;
  if (currentStyleConfiguration) {
    goto LABEL_5;
  }
  if (self->_posterStyleState
    || ([(SBWallpaperIconStyleCoordinator *)self _postersStyleStateDidChange],
        self->_posterStyleState))
  {
    v4 = [(SBWallpaperIconStyleCoordinator *)self _fetchStyleConfiguration];
    v5 = self->_currentStyleConfiguration;
    self->_currentStyleConfiguration = v4;

    currentStyleConfiguration = self->_currentStyleConfiguration;
LABEL_5:
    v6 = currentStyleConfiguration;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_6:
  return v6;
}

- (SBWallpaperIconStyleCoordinator)initWithWallpaperController:(id)a3 homeScreenDefaults:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBWallpaperIconStyleCoordinator.m", 77, @"Invalid parameter not satisfying: %@", @"wallpaperController" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SBWallpaperIconStyleCoordinator.m", 78, @"Invalid parameter not satisfying: %@", @"homeScreenDefaults" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SBWallpaperIconStyleCoordinator;
  v11 = [(SBWallpaperIconStyleCoordinator *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_wallpaperController, a3);
    objc_storeStrong((id *)&v12->_homeScreenDefaults, a4);
    [(SBWallpaperIconStyleCoordinator *)v12 _setupObservers];
    v13 = SBLogIconStyle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "[SBWallpaperIconStyleCoordinator init] setting up state updater...", buf, 2u);
    }

    [(SBWallpaperIconStyleCoordinator *)v12 _postersStyleStateDidChange];
    v14 = SBLogIconStyle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[SBWallpaperIconStyleCoordinator init] state updater is running", buf, 2u);
    }

    [(SBWallpaperIconStyleCoordinator *)v12 _setupStateCapture];
  }

  return v12;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCapturer invalidate];
  stateCapturer = self->_stateCapturer;
  self->_stateCapturer = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBWallpaperIconStyleCoordinator;
  [(SBWallpaperIconStyleCoordinator *)&v4 dealloc];
}

- (id)posterStyleState
{
  posterStyleState = self->_posterStyleState;
  if (!posterStyleState)
  {
    objc_super v4 = [(SBWallpaperIconStyleCoordinator *)self _fetchPosterStyleState];
    v5 = self->_posterStyleState;
    self->_posterStyleState = v4;

    posterStyleState = self->_posterStyleState;
  }
  v6 = posterStyleState;
  return v6;
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  objc_super v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v5 = [(SBWallpaperIconStyleCoordinator *)self currentStyleConfiguration];
    v6 = [v5 suggestedAccentColor];

    if (v6)
    {
      v7 = SBLogIconStyle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[fetchWallpaperProminentColor] returning suggestedAccentColor w/o PaperBoardUI fetch...", buf, 2u);
      }

      id v8 = [v5 suggestedAccentColor];
      v4[2](v4, v8);
    }
    else
    {
      wallpaperController = self->_wallpaperController;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__SBWallpaperIconStyleCoordinator_fetchWallpaperProminentColor___block_invoke;
      v10[3] = &unk_1E6B071E0;
      v10[4] = self;
      v11 = v4;
      [(SBWallpaperController *)wallpaperController fetchWallpaperProminentColor:v10];
      id v8 = v11;
    }
  }
}

void __64__SBWallpaperIconStyleCoordinator_fetchWallpaperProminentColor___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = SBLogIconStyle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[fetchWallpaperProminentColor] fetched from PaperBoardUI a suggestedAccentColor", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v5 = SBLogIconStyle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[fetchWallpaperProminentColor] updating suggested tint color from paperboard UI...", v11, 2u);
  }

  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E4F92328];
  id v8 = [v3 BSColor];
  id v9 = [v7 posterUpdateHomeScreenSuggestedTintColor:v8];
  v12[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 _issueUpdates:v10];
}

- (BSColor)currentTintColor
{
  v2 = [(SBWallpaperIconStyleCoordinator *)self currentStyleConfiguration];
  id v3 = [v2 accentStyle];
  objc_super v4 = [v3 luminanceAppliedColor];
  v5 = [v4 BSColor];

  return (BSColor *)v5;
}

- (void)setCurrentTintColor:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogIconStyle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[setCurrentTintColor] updating to tint color %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(SBWallpaperIconStyleCoordinator *)self currentStyleConfiguration];
  v7 = (void *)[v6 mutableCopy];

  id v8 = [v4 UIColor];
  [v7 setAccentColor:v8];

  [(SBWallpaperIconStyleCoordinator *)self setCurrentStyleConfiguration:v7];
}

- (BOOL)isWallpaperDimmed
{
  v2 = [(SBWallpaperIconStyleCoordinator *)self posterStyleState];
  char v3 = [v2 isHomeScreenDimmed];

  return v3;
}

- (void)setWallpaperDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(SBWallpaperIconStyleCoordinator *)self isWallpaperDimmed] != a3)
  {
    v5 = SBLogIconStyle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v10 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[setWallpaperDimmed] updating wallpaper dim to %{BOOL}u", buf, 8u);
    }

    v6 = [MEMORY[0x1E4F92328] posterUpdateHomeScreenAppearanceDimWithValue:v3];
    id v8 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [(SBWallpaperIconStyleCoordinator *)self _issueUpdates:v7];
  }
}

- (BOOL)shouldUseLargeHomeScreenIcons
{
  v2 = [(SBWallpaperIconStyleCoordinator *)self posterStyleState];
  BOOL v3 = [v2 iconSize];
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (void *)getPRIconUserInterfaceSizeLargeSymbolLoc_ptr;
  uint64_t v11 = getPRIconUserInterfaceSizeLargeSymbolLoc_ptr;
  if (!getPRIconUserInterfaceSizeLargeSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getPRIconUserInterfaceSizeLargeSymbolLoc_block_invoke;
    v7[3] = &unk_1E6AF56B0;
    v7[4] = &v8;
    __getPRIconUserInterfaceSizeLargeSymbolLoc_block_invoke((uint64_t)v7);
    id v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    -[SBWallpaperIconStyleCoordinator shouldUseLargeHomeScreenIcons]();
  }
  char v5 = [v3 isEqualToString:*v4];

  return v5;
}

- (void)setShouldUseLargeHomeScreenIcons:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(SBWallpaperIconStyleCoordinator *)self shouldUseLargeHomeScreenIcons] != a3)
  {
    char v5 = SBLogIconStyle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v12 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[setshouldUseLargeHomeScreenIcons] updating shouldUseLargeHomeScreenIcons to %{BOOL}u", buf, 8u);
    }

    v6 = (void *)MEMORY[0x1E4F92328];
    v7 = [NSNumber numberWithBool:v3];
    uint64_t v8 = [v6 posterUpdateShouldUseLargeHomeScreenIcons:v7];

    uint64_t v10 = v8;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [(SBWallpaperIconStyleCoordinator *)self _issueUpdates:v9];
  }
}

- (void)setCurrentStyleConfiguration:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    char v5 = SBLogIconStyle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543362;
      id v27 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating to style configuration %{public}@", (uint8_t *)&v26, 0xCu);
    }

    uint64_t v6 = [(PUIStylePickerHomeScreenConfiguration *)self->_currentStyleConfiguration styleType];
    uint64_t v7 = [v4 styleType];
    uint64_t v8 = [(PUIStylePickerHomeScreenConfiguration *)self->_currentStyleConfiguration accentStyle];
    if (v7 == 3)
    {
      int v9 = SBLogIconStyle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating to a style type of accent", (uint8_t *)&v26, 2u);
      }

      uint64_t v10 = [v4 accentStyle];
    }
    else
    {
      if (v6 == 3)
      {
        uint64_t v11 = SBLogIconStyle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating AWAY a style type of accent; clearing out target style",
            (uint8_t *)&v26,
            2u);
        }
      }
      uint64_t v10 = 0;
    }
    BOOL v12 = objc_opt_new();
    if (v6 != v7)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F92328];
      v14 = __SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(v7);
      v15 = [v13 posterUpdateHomeScreenIconUserInterfaceStyle:v14];
      [v12 addObject:v15];
    }
    if ((BSEqualObjects() & 1) == 0)
    {
      v16 = SBLogIconStyle();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v17)
        {
          int v26 = 138543362;
          id v27 = v10;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] updating poster style to %{public}@ ON POSTER", (uint8_t *)&v26, 0xCu);
        }

        v18 = (void *)MEMORY[0x1E4F92328];
        objc_super v19 = NSNumber;
        [v10 variation];
        v20 = objc_msgSend(v19, "numberWithDouble:");
        v21 = NSNumber;
        [v10 saturation];
        v22 = objc_msgSend(v21, "numberWithDouble:");
        v23 = NSNumber;
        [v10 luminance];
        v24 = objc_msgSend(v23, "numberWithDouble:");
        v25 = [v18 posterUpdateHomeScreenTintWithVariation:v20 saturation:v22 luminance:v24];
        [v12 addObject:v25];
      }
      else
      {
        if (v17)
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[setCurrentStyleConfiguration] unsetting poster style on POSTER", (uint8_t *)&v26, 2u);
        }

        v20 = [MEMORY[0x1E4F92328] posterUpdateHomeScreenTintWithVariation:0 saturation:0 luminance:0];
        [v12 addObject:v20];
      }
    }
    [(SBWallpaperIconStyleCoordinator *)self _issueUpdates:v12];
  }
}

- (void)addIconStyleObserver:(id)a3
{
  id v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    char v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
}

- (void)removeIconStyleObserver:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  [(NSHashTable *)self->_observers removeObject:v4];
}

- (void)_postersStyleStateDidChange
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[_postersStyleStateDidChange] still nil; bailing",
    v1,
    2u);
}

- (BOOL)_issueUpdates:(id)a3
{
  wallpaperController = self->_wallpaperController;
  id v11 = 0;
  BOOL v5 = [(SBWallpaperController *)wallpaperController updateCurrentPosterWithUpdates:a3 error:&v11];
  id v6 = v11;
  id v7 = SBLogIconStyle();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBWallpaperIconStyleCoordinator _issueUpdates:]((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[_issueUpdates] Updated current poster", v10, 2u);
    }

    [(SBWallpaperIconStyleCoordinator *)self _resetStateExpectingUpdates];
    [(SBWallpaperIconStyleCoordinator *)self _notifyObserversOfUpdatedPostersStyleState];
  }

  return v5;
}

- (void)_resetStateExpectingUpdates
{
  *(void *)&v15[5] = *MEMORY[0x1E4F143B8];
  p_posterStyleState = &self->_posterStyleState;
  id v4 = self->_posterStyleState;
  BOOL v5 = [(SBWallpaperIconStyleCoordinator *)self _fetchPosterStyleState];
  int v6 = BSEqualObjects();
  if ((v6 & 1) == 0) {
    objc_storeStrong((id *)p_posterStyleState, v5);
  }
  p_currentStyleConfiguration = &self->_currentStyleConfiguration;
  uint64_t v8 = self->_currentStyleConfiguration;
  int v9 = [(SBWallpaperIconStyleCoordinator *)self _fetchStyleConfiguration];
  int v10 = BSEqualObjects();
  if ((v10 & 1) == 0) {
    objc_storeStrong((id *)p_currentStyleConfiguration, v9);
  }
  id v11 = SBLogIconStyle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109376;
    v15[0] = v6 ^ 1;
    LOWORD(v15[1]) = 1024;
    *(_DWORD *)((char *)&v15[1] + 2) = v10 ^ 1;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[_resetStateExpectingUpdates] didUpdatePosterStyleState: %{BOOL}u didUpdateStyleConfiguration: %{BOOL}u", (uint8_t *)&v14, 0xEu);
  }

  if ((v10 & 1) == 0)
  {
    BOOL v12 = SBLogIconStyle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      *(void *)v15 = v9;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "[_resetStateExpectingUpdates] updatedStyleConfiguration: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  if ((v6 & 1) == 0)
  {
    uint64_t v13 = SBLogIconStyle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      *(void *)v15 = v5;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "[_resetStateExpectingUpdates] updatedPosterStyleState: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)_fetchPosterStyleState
{
  v2 = [(SBWallpaperController *)self->_wallpaperController currentHomeVariantStyleState];
  BOOL v3 = SBLogIconStyle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(SBWallpaperIconStyleCoordinator *)(uint64_t)v2 _fetchPosterStyleState];
  }

  return v2;
}

- (id)_fetchStyleConfiguration
{
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2050000000;
  BOOL v3 = (void *)getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  uint64_t v28 = getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  if (!getPUIMutableStylePickerHomeScreenConfigurationClass_softClass)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke;
    v24[3] = &unk_1E6AF56B0;
    v24[4] = &v25;
    __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke((uint64_t)v24);
    BOOL v3 = (void *)v26[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v25, 8);
  id v5 = objc_alloc_init(v4);
  int v6 = [(SBWallpaperIconStyleCoordinator *)self posterStyleState];
  uint64_t v7 = [v6 iconStyle];
  uint64_t v8 = (void *)v7;
  int v9 = (void *)*MEMORY[0x1E4FA6150];
  if (v7) {
    int v9 = (void *)v7;
  }
  id v10 = v9;

  [v5 setStyleType:__PUIHomeScreenStyleTypeFromSBIconUserInterfaceStyleType(v10)];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4FA6158]];

  if (v11)
  {
    BOOL v12 = [v6 tintColorStyle];

    if (v12)
    {
      uint64_t v13 = [v6 tintColorStyle];
      [v5 setAccentStyle:v13];
    }
    else
    {
      uint64_t v13 = [(SBHomeScreenDefaults *)self->_homeScreenDefaults iconTintColor];
      [(SBHomeScreenDefaults *)self->_homeScreenDefaults iconUserInterfaceStyleVariation];
      double v15 = v14;
      [(SBHomeScreenDefaults *)self->_homeScreenDefaults iconUserInterfaceStyleLuminance];
      double v17 = v16;
      [(SBHomeScreenDefaults *)self->_homeScreenDefaults iconUserInterfaceStyleSaturation];
      double v19 = v18;
      [v5 setVariation:v15];
      [v5 setLuminance:v17];
      [v5 setSaturation:v19];
      [v5 setAccentColor:v13];
    }
  }
  v20 = [v6 suggestedTintColor];

  if (v20)
  {
    v21 = [v6 suggestedTintColor];
    [v5 setSuggestedAccentColor:v21];
  }
  v22 = (void *)[v5 copy];

  return v22;
}

- (void)_setupStateCapture
{
  if (!self->_stateCapturer)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    id v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCapturer = self->_stateCapturer;
    self->_stateCapturer = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

__CFString *__53__SBWallpaperIconStyleCoordinator__setupStateCapture__block_invoke(uint64_t a1)
{
  v22[4] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[1];
    id v4 = [v2 _fetchPosterStyleState];
    id v5 = v2[6];
    id v6 = [v2 _fetchStyleConfiguration];
    v21[0] = @"posterStyleState";
    uint64_t v7 = [v3 description];
    uint64_t v8 = (void *)v7;
    int v9 = @"(null posterStyleState)";
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    v22[0] = v9;
    v21[1] = @"fetchedPostersStyleState";
    uint64_t v10 = [v4 description];
    int v11 = (void *)v10;
    BOOL v12 = @"(null fetchedPostersStyleState)";
    if (v10) {
      BOOL v12 = (__CFString *)v10;
    }
    v22[1] = v12;
    v21[2] = @"currentStyleConfiguration";
    uint64_t v13 = [v5 description];
    double v14 = (void *)v13;
    double v15 = @"(null currentStyleConfiguration)";
    if (v13) {
      double v15 = (__CFString *)v13;
    }
    v22[2] = v15;
    v21[3] = @"fetchedStyleConfiguration";
    uint64_t v16 = [v6 description];
    double v17 = (void *)v16;
    double v18 = @"(null fetchedStyleConfiguration)";
    if (v16) {
      double v18 = (__CFString *)v16;
    }
    v22[3] = v18;
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  }
  else
  {
    double v19 = &stru_1F3084718;
  }

  return v19;
}

- (void)_setupObservers
{
}

- (void)_notifyObserversOfUpdatedPostersStyleState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_posterStyleState)
  {
    id v3 = [(SBWallpaperIconStyleCoordinator *)self _fetchPosterStyleState];
    posterStyleState = self->_posterStyleState;
    self->_posterStyleState = v3;
  }
  if (!self->_currentStyleConfiguration)
  {
    id v5 = [(SBWallpaperIconStyleCoordinator *)self _fetchStyleConfiguration];
    currentStyleConfiguration = self->_currentStyleConfiguration;
    self->_currentStyleConfiguration = v5;
  }
  if (BSEqualObjects() && BSEqualObjects())
  {
    uint64_t v7 = SBLogIconStyle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[_notifyObserversOfUpdatedPostersStyleState] posters style state is same; bailing",
        buf,
        2u);
    }
  }
  else
  {
    uint64_t v8 = SBLogIconStyle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[_notifyObserversOfUpdatedPostersStyleState] updating last notified posters style state", buf, 2u);
    }

    objc_storeStrong((id *)&self->_lastNotifiedStyleConfiguration, self->_currentStyleConfiguration);
    objc_storeStrong((id *)&self->_lastNotifiedPosterStyleState, self->_posterStyleState);
    [(SBWallpaperController *)self->_wallpaperController noteHomeVariantStyleStateMayHaveUpdated];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v9 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v7 = [v9 allObjects];

    uint64_t v10 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) iconStyleCoordinatorDidUpdate:self];
        }
        while (v11 != v13);
        uint64_t v11 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)wallpaperWillChangeForVariant:(int64_t)a3
{
  id v4 = SBLogIconStyle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "wallpaperWillChangeForVariant", v7, 2u);
  }

  posterStyleState = self->_posterStyleState;
  self->_posterStyleState = 0;

  currentStyleConfiguration = self->_currentStyleConfiguration;
  self->_currentStyleConfiguration = 0;
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  id v4 = SBLogIconStyle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "wallpaperDidChangeForVariant", v5, 2u);
  }

  [(SBWallpaperIconStyleCoordinator *)self _postersStyleStateDidChange];
}

- (SBWallpaperController)wallpaperController
{
  return self->_wallpaperController;
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_currentStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_lastNotifiedStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_lastNotifiedPosterStyleState, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_posterStyleState, 0);
}

- (void)shouldUseLargeHomeScreenIcons
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getPRIconUserInterfaceSizeLarge(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBWallpaperIconStyleCoordinator.m", 29, @"%s", dlerror());

  __break(1u);
}

- (void)_issueUpdates:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "[_issueUpdates] Failed to update current poster: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_fetchPosterStyleState
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[_fetchPosterStyleState] %{public}@", (uint8_t *)&v2, 0xCu);
}

@end