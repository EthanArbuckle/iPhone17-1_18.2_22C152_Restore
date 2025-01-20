@interface PBUIPosterVariantViewController
+ (id)_determinePreferredProminentColorFromDerivedProminentColor:(id)a3 posterPreferredProminentColor:(id)a4 timeColor:(id)a5 fallbackColor:(id)a6 outChosenColor:(id *)a7;
+ (id)defaultCacheManager;
+ (id)snapshotFormat;
- (BOOL)_canShowWhileLocked;
- (BOOL)isSnapshotInCorrectOrientation;
- (BOOL)needsSnapshot;
- (BOOL)updateHomeVariantStyleState;
- (BOOL)updatePresentation;
- (FBScene)scene;
- (NSString)description;
- (PBUIPosterComponentDelegate)delegate;
- (PBUIPosterVariantViewController)counterpart;
- (PBUIPosterVariantViewController)initWithScene:(id)a3 counterpart:(id)a4;
- (PRPosterLegibilitySettings)desiredLegibilitySettings;
- (PRSPosterConfiguration)lockScreenConfiguration;
- (PUIColorStatistics)contentColorStatistics;
- (PUIManagedCacheIdentifying)cache;
- (UIColor)averageColor;
- (UIColor)derivedProminentColor;
- (UIColor)fallbackColor;
- (UIColor)posterPreferredProminentColor;
- (UIColor)preferredProminentColor;
- (UIColor)timeColor;
- (UIImage)snapshot;
- (UIScenePresenter)presenter;
- (_UILegibilitySettings)legibilitySettings;
- (double)averageContrast;
- (id)_applicableScene;
- (id)_externalDisplayConfiguration;
- (id)_fetchDerivedProminentColor;
- (id)_fetchPosterPreferredProminentColor;
- (id)_fetchTimeColor;
- (id)_homeVariantScene;
- (id)_lockVariantScene;
- (id)_posterPreferredProminentColor:(BOOL)a3;
- (id)_preferredProminentColor:(BOOL)a3 source:(id *)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)evaluateSnapshotPreconditions;
- (id)makePortalSourceWithLegibilitySettings:(id)a3;
- (id)portalSourceProvider;
- (id)snapshotSourceProvider;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)activeStyle;
- (int64_t)variant;
- (void)_fetchPosterPreferredProminentColor;
- (void)_handleUpdateProminentPosterDerivedColor:(id)a3 posterPreferredProminentColor:(id)a4 timeColor:(id)a5 fallbackColor:(id)a6;
- (void)_invalidateSnapshots:(id)a3;
- (void)_monitorScene:(id)a3;
- (void)_prepareFauxExternalScene;
- (void)_prepareFauxExternalSceneFromScene:(id)a3 completion:(id)a4;
- (void)_scheduleSnapshotIfNeeded:(id)a3;
- (void)_setupCachesIfNeeded;
- (void)_snapshotNow:(id)a3;
- (void)_snapshotScene:(id)a3 completion:(id)a4;
- (void)_updateInterfaceStyle;
- (void)_updateParallax;
- (void)_updatePosterAverageColor:(id)a3 desiredLegibilitySettings:(id)a4;
- (void)_updatePosterPreferredProminentColor;
- (void)_updatePresentation;
- (void)applyFauxExternalSceneSettings:(id)a3;
- (void)colorStatisticsDidChange:(id)a3;
- (void)dealloc;
- (void)fetchWallpaperProminentColor:(id)a3;
- (void)invalidate;
- (void)invalidateSnapshotPreconditions:(id)a3;
- (void)legibilitySettingsDidChange;
- (void)noteDidRotateToInterfaceOrientation:(int64_t)a3;
- (void)noteWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)performSnapshotOnQueue:(id)a3 scene:(id)a4 completion:(id)a5;
- (void)postprocessNewSnapshot:(id)a3 colorStatistics:(id)a4 metadata:(id)a5 completion:(id)a6;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)setActiveStyle:(int64_t)a3;
- (void)setBlurEnabled:(BOOL)a3;
- (void)setCounterpart:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDerivedProminentColor:(id)a3;
- (void)setDesiredLegibilitySettings:(id)a3;
- (void)setFallbackColor:(id)a3;
- (void)setNeedsNewSnapshot:(id)a3;
- (void)setPosterPreferredProminentColor:(id)a3;
- (void)setPreferredProminentColor:(id)a3;
- (void)setPreferredProminentColor:(id)a3 chosenColorSource:(id)a4 notifyObservers:(BOOL)a5;
- (void)setTimeColor:(id)a3;
- (void)snapshotIfNeeded:(BOOL)a3;
- (void)snapshotSource:(id)a3 failedToReadColorStatisticsAtURL:(id)a4 error:(id)a5;
- (void)snapshotSource:(id)a3 failedToReadSnapshotAtURL:(id)a4 error:(id)a5;
- (void)viewDidLoad;
@end

@implementation PBUIPosterVariantViewController

uint64_t __61__PBUIPosterVariantViewController__scheduleSnapshotIfNeeded___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) snapshotIfNeeded:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1104);
  return [v2 setFlag:0];
}

- (_UILegibilitySettings)legibilitySettings
{
  v3 = [(PBUIPosterVariantViewController *)self desiredLegibilitySettings];

  if (v3)
  {
    v4 = [(PBUIPosterVariantViewController *)self desiredLegibilitySettings];
    [v4 convertToUILegibility];
  }
  else
  {
    v4 = [(PBUIPosterVariantViewController *)self contentColorStatistics];
    [v4 legibilitySettings];
  v5 = };

  return (_UILegibilitySettings *)v5;
}

- (PRPosterLegibilitySettings)desiredLegibilitySettings
{
  return (PRPosterLegibilitySettings *)objc_getProperty(self, a2, 1144, 1);
}

- (PUIColorStatistics)contentColorStatistics
{
  posterColorStatistics = self->_posterColorStatistics;
  if (posterColorStatistics)
  {
    v3 = posterColorStatistics;
  }
  else
  {
    v3 = [(PBUIURLBackedSnapshotSource *)self->_snapshotSource contentColorStatistics];
  }
  return v3;
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_isBlurEnabled = 1;
    if (!self->_blurView)
    {
      v4 = [MEMORY[0x1E4F427D8] effectWithStyle:19];
      v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v4];
      blurView = self->_blurView;
      self->_blurView = v5;

      [(UIVisualEffectView *)self->_blurView setAutoresizingMask:18];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke;
      v14[3] = &unk_1E62B2798;
      v14[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v14];
      [(UIView *)self->_contentContainer addSubview:self->_blurView];
      [(UIVisualEffectView *)self->_blurView setAlpha:1.0];
    }
  }
  else
  {
    self->_isBlurEnabled = 0;
    if (self->_blurView)
    {
      if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
      {
        objc_initWeak(&location, self);
        v7 = (void *)MEMORY[0x1E4F42FF0];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_2;
        v11[3] = &unk_1E62B39F0;
        objc_copyWeak(&v12, &location);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_3;
        v9[3] = &unk_1E62B3920;
        objc_copyWeak(&v10, &location);
        [v7 animateWithDuration:v11 animations:v9 completion:0.0];
        objc_destroyWeak(&v10);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      else
      {
        [(UIVisualEffectView *)self->_blurView removeFromSuperview];
        v8 = self->_blurView;
        self->_blurView = 0;
      }
    }
  }
}

- (void)snapshotIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke;
  v22[3] = &unk_1E62B44A8;
  v22[4] = self;
  v5 = (void (**)(void, void))MEMORY[0x1C1872570](v22);
  if (([(BSAtomicFlag *)self->_snapshotNeeded getFlag] & 1) != 0 || v3)
  {
    v6 = [(PBUIPosterVariantViewController *)self evaluateSnapshotPreconditions];
    if (([v6 canSnapshot] & 1) != 0 || v3)
    {
      ((void (**)(void, void *))v5)[2](v5, v6);
    }
    else
    {
      v17 = v5;
      v7 = PBUILogSnapshot();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PBUIPosterVariantViewController snapshotIfNeeded:](self);
      }

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v16 = v6;
      v8 = [v6 reasonsToNotSnapshot];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
            v14 = PBUILogSnapshot();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
              *(_DWORD *)buf = 138543618;
              v24 = v15;
              __int16 v25 = 2114;
              uint64_t v26 = v13;
              _os_log_error_impl(&dword_1BC4B3000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]\t--> '%{public}@'", buf, 0x16u);
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
        }
        while (v10);
      }

      v6 = v16;
      v5 = v17;
    }
  }
}

- (void)invalidateSnapshotPreconditions:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_snapshotNeeded getFlag])
  {
    v5 = PBUILogSnapshot();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
      *(_DWORD *)buf = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_1BC4B3000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidateSnapshotPreconditions for reason: %{public}@", buf, 0x16u);
    }
    objc_msgSend(NSString, "stringWithFormat:", @"snapshot preconditions invalidated for reason '%@'; so scheduling a new snapshot",
    v7 = v4);
    [(PBUIPosterVariantViewController *)self _scheduleSnapshotIfNeeded:v7];
  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  self->_unint64_t lastExtantUpdate = [v5 transactionID];
  v6 = PBUILogSnapshot();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
    unint64_t lastExtantUpdate = self->_lastExtantUpdate;
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v7;
    __int16 v27 = 2048;
    unint64_t v28 = lastExtantUpdate;
    _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Poster Extact update changed %lu", buf, 0x16u);
  }
  uint64_t v9 = [v5 settingsDiff];
  __int16 v10 = [v5 transitionContext];
  uint64_t v11 = objc_msgSend(v9, "pui_posterContentDidChange");
  if (v11) {
    goto LABEL_9;
  }
  uint64_t v12 = [v5 settings];
  uint64_t v13 = objc_msgSend(v12, "pui_userInterfaceStyle");

  if (v13 != self->_mostRecentSnapshotInterfaceStyle)
  {
    v14 = [(PBUIPosterVariantViewController *)self _applicableScene];
    v15 = [v14 settings];
    v16 = objc_msgSend(v15, "pui_provider");

    if ([v16 isEqualToString:@"com.apple.WallpaperKit.CollectionsPoster"])
    {
      v17 = PBUILogSnapshot();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
        *(_DWORD *)buf = 138543362;
        uint64_t v26 = v18;
        _os_log_impl(&dword_1BC4B3000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] catching undetected system appearance change for collections poster", buf, 0xCu);
      }
LABEL_9:
      uint64_t v19 = v11 ^ 1;
      [(PBUIPosterVariantViewController *)self _setupCachesIfNeeded];
      if ([(PBUIPosterVariantViewController *)self variant] == 1)
      {
        [(PBUIURLBackedSnapshotSource *)self->_snapshotSource clearDerivedProminentColor];
        derivedProminentColor = self->_derivedProminentColor;
        self->_derivedProminentColor = 0;

        [(PBUIURLBackedSnapshotSource *)self->_snapshotSource invalidateCurrentSnapshot];
      }
      long long v21 = NSString;
      v22 = MEMORY[0x1C1871860](v11);
      v23 = MEMORY[0x1C1871860](v19);
      v24 = [v21 stringWithFormat:@"contentDidChange:%@ needsUpdateForInterfaceStyle:%@", v22, v23];
      [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:v24];

      [(PBUIPosterVariantViewController *)self _updateParallax];
      goto LABEL_16;
    }
  }
  if ((objc_msgSend(v9, "pr_posterPropertiesDidChange") & 1) != 0
    || (objc_msgSend(v9, "pr_unlockProgressDidChange") & 1) != 0
    || objc_msgSend(v10, "pb_homeAppearanceChanged"))
  {
LABEL_16:
    [(PBUIPosterVariantViewController *)self _updatePresentation];
  }
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = PBUILogSnapshot();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
    unint64_t lastExtantUpdate = self->_lastExtantUpdate;
    int v13 = 138543874;
    v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = lastExtantUpdate;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 transactionID];
    _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Poster Extact update COULD change %lu (%lu)", (uint8_t *)&v13, 0x20u);
  }
  unint64_t v10 = self->_lastExtantUpdate;
  if (v10 == [v6 transactionID])
  {
    uint64_t v11 = PBUILogSnapshot();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
      int v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1BC4B3000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Poster Extact update DID change", (uint8_t *)&v13, 0xCu);
    }
    self->_unint64_t lastExtantUpdate = 0;
    [(PBUIPosterVariantViewController *)self invalidateSnapshotPreconditions:@"Poster Extact update DID change"];
  }
}

- (void)_scheduleSnapshotIfNeeded:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BSAtomicFlag *)self->_snapshotScheduled setFlag:1])
  {
    dispatch_time_t v5 = dispatch_time(0, 250000000);
    id v6 = PBUILogSnapshot();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
      v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.25];
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      int v13 = v8;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_1BC4B3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Snapshot scheduled for %{public}@ for reason: %{public}@", buf, 0x20u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PBUIPosterVariantViewController__scheduleSnapshotIfNeeded___block_invoke;
    block[3] = &unk_1E62B2798;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
}

- (void)snapshotIfNeeded:(void *)a1 .cold.1(void *a1)
{
  v1 = PBUIStringForWallpaperVariant([a1 variant]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v2, v3, "[%{public}@]\tSnapshot attempt failed because preconditions failed: ", v4, v5, v6, v7, v8);
}

- (id)evaluateSnapshotPreconditions
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [(PBUIPosterVariantViewController *)self _applicableScene];
  uint64_t v4 = [PBUISnapshotPreconditionResult alloc];
  uint64_t v5 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];
  uint64_t v6 = [(PBUISnapshotPreconditionResult *)v4 initWithExternalDisplayConfiguration:v5 variant:[(PBUIPosterVariantViewController *)self variant]];

  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot]) {
    BOOL v7 = v3 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    [(PBUISnapshotPreconditionResult *)v6 appendPreconditionResultFailureWithFormat:@"Poster scene is nil"];
  }
  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot])
  {
    uint8_t v8 = [v3 settings];

    if (!v8) {
      [(PBUISnapshotPreconditionResult *)v6 appendPreconditionResultFailureWithFormat:@"Poster scene is in a transitory state (no scene settings)"];
    }
  }
  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot] && self->_lastExtantUpdate) {
    [(PBUISnapshotPreconditionResult *)v6 appendPreconditionResultFailureWithFormat:@"Poster scene is not ready for snapshotting (mid-update)."];
  }
  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot])
  {
    uint64_t v9 = [v3 settings];
    int v10 = [v9 activityMode];

    if (v10 != -3) {
      [(PBUISnapshotPreconditionResult *)v6 appendPreconditionResultFailureWithFormat:@"Poster scene is not ready for snapshotting (not suspended)."];
    }
  }
  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot])
  {
    id v16 = 0;
    char v11 = objc_msgSend(v3, "pui_sceneIsReadyToSnapshot:", &v16);
    id v12 = v16;
    int v13 = v12;
    if ((v11 & 1) == 0) {
      [(PBUISnapshotPreconditionResult *)v6 appendPreconditionResultFailureWithFormat:@"Poster scene is not ready: %@", v12];
    }
  }
  else
  {
    int v13 = 0;
  }
  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot]
    && [(BSAtomicFlag *)self->_isRotating getFlag])
  {
    [(PBUISnapshotPreconditionResult *)v6 appendPreconditionResultFailureWithFormat:@"Poster scene is currently rotating"];
  }
  if ([(PBUISnapshotPreconditionResult *)v6 canSnapshot])
  {
    __int16 v14 = [v3 settings];
    [(PBUIPosterVariantViewController *)self validateSnapshottingPreconditionsForSettings:v14 result:v6];
  }
  return v6;
}

- (id)_externalDisplayConfiguration
{
  uint64_t v3 = [(PBUIPosterVariantViewController *)self delegate];
  uint64_t v4 = [v3 posterComponentExternalDisplayConfiguration:self];

  return v4;
}

- (PBUIPosterComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBUIPosterComponentDelegate *)WeakRetained;
}

- (id)_applicableScene
{
  scene = self->_scene;
  if (scene)
  {
    uint64_t v3 = scene;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
    uint64_t v3 = [WeakRetained scene];
  }
  return v3;
}

- (int64_t)activeStyle
{
  return self->_activeStyle;
}

- (FBScene)scene
{
  return self->_scene;
}

- (id)snapshotSourceProvider
{
  return self->_snapshotProvider;
}

- (void)setActiveStyle:(int64_t)a3
{
  if (self->_activeStyle != a3)
  {
    self->_activeStyle = a3;
    BOOL IsHidden = PBUIWallpaperStyleIsHidden(a3);
    if (a3 == 2)
    {
      id v7 = [MEMORY[0x1E4F428B8] blackColor];
    }
    else
    {
      id v7 = 0;
    }
    [(UIView *)self->_contentContainer setHidden:IsHidden];
    [(PBUISnapshotReplicaView *)self->_snapshotView setHidden:IsHidden];
    uint64_t v6 = [(PBUIPosterVariantViewController *)self view];
    [v6 setBackgroundColor:v7];
  }
}

- (BOOL)needsSnapshot
{
  return [(BSAtomicFlag *)self->_snapshotNeeded getFlag];
}

- (BOOL)isSnapshotInCorrectOrientation
{
  uint64_t v3 = [(PBUIPosterVariantViewController *)self _applicableScene];
  uint64_t v4 = [v3 settings];
  uint64_t v5 = objc_msgSend(v4, "pui_deviceOrientation");
  uint64_t v6 = [v4 interfaceOrientation];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [(PBUIURLBackedSnapshotSource *)self->_snapshotSource currentSnapshotInterfaceOrientation:&v10 outDeviceOrientation:&v11];
  BOOL v8 = v5 == v11 || v6 == v10;

  return v8;
}

- (PBUIPosterVariantViewController)initWithScene:(id)a3 counterpart:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (v10 && (NSClassFromString(&cfstr_Fbscene.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterVariantViewController initWithScene:counterpart:](a2);
    }
    [v26 UTF8String];
    result = (PBUIPosterVariantViewController *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v27.receiver = self;
    v27.super_class = (Class)PBUIPosterVariantViewController;
    uint64_t v11 = [(PBUIPosterVariantViewController *)&v27 initWithNibName:0 bundle:0];
    id v12 = v11;
    if (v11)
    {
      v11->_isBlurEnabled = 0;
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
      snapshotNeeded = v12->_snapshotNeeded;
      v12->_snapshotNeeded = (BSAtomicFlag *)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
      snapshotScheduled = v12->_snapshotScheduled;
      v12->_snapshotScheduled = (BSAtomicFlag *)v15;

      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
      isRotating = v12->_isRotating;
      v12->_isRotating = (BSAtomicFlag *)v17;

      objc_storeStrong((id *)&v12->_scene, a3);
      if (v12->_scene)
      {
        uint64_t v19 = [(FBScene *)v12->_scene uiPresentationManager];
        long long v20 = (objc_class *)objc_opt_class();
        long long v21 = NSStringFromClass(v20);
        uint64_t v22 = [v19 createPresenterWithIdentifier:v21 priority:-100];
        presenter = v12->_presenter;
        v12->_presenter = (UIScenePresenter *)v22;

        [(UIScenePresenter *)v12->_presenter modifyPresentationContext:&__block_literal_global_18];
        [(UIScenePresenter *)v12->_presenter activate];
        [(PBUIPosterVariantViewController *)v12 _monitorScene:v12->_scene];
        [(PBUIPosterVariantViewController *)v12 _updateInterfaceStyle];
      }
      if (v9) {
        [(PBUIPosterVariantViewController *)v12 setCounterpart:v9];
      }
      else {
        [(PBUIPosterVariantViewController *)v12 _setupCachesIfNeeded];
      }
      v24 = [MEMORY[0x1E4F28C40] notificationCenterForType:@"POSTERBOARD"];
      [v24 addObserver:v12 selector:sel__invalidateSnapshots_ name:@"POSTERBOARD_CLEAR_ALL_CACHED_SNAPSHOTS" object:0];
    }
    return v12;
  }
  return result;
}

void __61__PBUIPosterVariantViewController_initWithScene_counterpart___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:1];
}

- (void)noteWillRotateToInterfaceOrientation:(int64_t)a3
{
  [(BSAtomicFlag *)self->_isRotating setFlag:1];
  snapshotSource = self->_snapshotSource;
  [(PBUIURLBackedSnapshotSource *)snapshotSource invalidateCurrentSnapshot];
}

- (void)noteDidRotateToInterfaceOrientation:(int64_t)a3
{
  [(BSAtomicFlag *)self->_isRotating setFlag:0];
  [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"did rotate to new interface orientation"];
}

- (void)_invalidateSnapshots:(id)a3
{
  [(PBUIURLBackedSnapshotSource *)self->_snapshotSource invalidateCurrentSnapshot];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [(PBUIPosterVariantPathProvider *)self->_pathProvider snapshotURL];
  [v4 removeItemAtURL:v5 error:0];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [(PBUIPosterVariantPathProvider *)self->_pathProvider snapshotMetadataURL];
  [v6 removeItemAtURL:v7 error:0];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [(PBUIPosterVariantPathProvider *)self->_pathProvider snapshotColorStatisticsURL];
  [v8 removeItemAtURL:v9 error:0];

  [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"snapshots were invalidate"];
}

- (void)dealloc
{
  [(PBUIFixedReplicaSourceProvider *)self->_portalProvider invalidate];
  [(PBUICachedSnapshotEffectProvider *)self->_snapshotProvider invalidate];
  [(FBScene *)self->_fauxExternalScene invalidate];
  snapshotProvider = self->_snapshotProvider;
  self->_snapshotProvider = 0;

  fauxExternalScene = self->_fauxExternalScene;
  self->_fauxExternalScene = 0;

  cache = self->_cache;
  self->_cache = 0;

  v6.receiver = self;
  v6.super_class = (Class)PBUIPosterVariantViewController;
  [(PBUIPosterVariantViewController *)&v6 dealloc];
}

- (void)_setupCachesIfNeeded
{
  uint64_t v3 = [(PBUIPosterVariantViewController *)self _applicableScene];
  objc_msgSend(v3, "pui_posterPath");
  id v38 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = v38;
  if (v38)
  {
    int v5 = [v38 isServerPosterPath];
    uint64_t v6 = [(PBUIPosterVariantViewController *)self variant];
    if (v5)
    {
      id v7 = [v38 instanceURL];
      id v8 = [v38 serverIdentity];
      id v9 = [v8 stablePersistenceIdentifier];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v11 = [v10 UUIDString];
      id v9 = [@"Non-serverposterpath-" stringByAppendingString:v11];

      id v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_temporaryDirectoryURL");
      id v7 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];
    }

    id v12 = [@"[" stringByAppendingString:v9];
    uint64_t v13 = PBUIStringForWallpaperVariant(v6);
    __int16 v14 = [v12 stringByAppendingFormat:@"]-[%@]", v13];

    uint64_t v15 = [[PBUIPosterVariantPathProvider alloc] initWithInstanceURL:v7 variant:v6];
    p_pathProvider = &self->_pathProvider;
    BOOL v17 = [(PBUIPosterVariantPathProvider *)v15 isEqualToPosterVariantPathProvider:self->_pathProvider];
    if (!v17) {
      objc_storeStrong((id *)&self->_pathProvider, v15);
    }
    uint64_t v18 = [(PUIManagedCacheIdentifying *)self->_cache pui_cacheIdentifier];
    int v19 = [v18 isEqualToString:v14];

    if ((v17 & v19 & 1) == 0)
    {
      long long v20 = [(id)objc_opt_class() defaultCacheManager];
      long long v21 = [v20 checkoutImageCache:v14];
      cache = self->_cache;
      self->_cache = v21;

      snapshotSource = self->_snapshotSource;
      if (snapshotSource)
      {
        [(PBUIURLBackedSnapshotSource *)snapshotSource updateFromPathProvider:*p_pathProvider];
      }
      else
      {
        v24 = [PBUIURLBackedSnapshotSource alloc];
        __int16 v25 = *p_pathProvider;
        uint64_t v26 = [(id)objc_opt_class() snapshotFormat];
        objc_super v27 = [(PBUIURLBackedSnapshotSource *)v24 initWithPathProvider:v25 format:v26 delegate:self];
        unint64_t v28 = self->_snapshotSource;
        self->_snapshotSource = v27;
      }
      snapshotProvider = self->_snapshotProvider;
      if (snapshotProvider)
      {
        -[PBUICachedSnapshotEffectProvider setCacheIdentifier:]((uint64_t)snapshotProvider, v14);
        [(PBUICachedSnapshotEffectProvider *)self->_snapshotProvider setSnapshotProvider:self->_snapshotSource];
      }
      else
      {
        v30 = [[PBUICachedSnapshotEffectProvider alloc] initForSnapshotProvider:self->_snapshotSource cacheIdentifier:v14];
        v31 = self->_snapshotProvider;
        self->_snapshotProvider = v30;
      }
      portalProvider = self->_portalProvider;
      if (!portalProvider)
      {
        v33 = objc_alloc_init(PBUIFixedReplicaSourceProvider);
        v34 = self->_portalProvider;
        self->_portalProvider = v33;

        portalProvider = self->_portalProvider;
      }
      [(PBUIFixedReplicaSourceProvider *)portalProvider setIdentifier:v14];
      v35 = self->_portalProvider;
      v36 = [(PBUIPosterVariantViewController *)self legibilitySettings];
      v37 = [(PBUIPosterVariantViewController *)self makePortalSourceWithLegibilitySettings:v36];
      [(PBUIFixedReplicaSourceProvider *)v35 setPortalSource:v37];

      [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"caches were updated"];
    }

    uint64_t v4 = v38;
  }
}

- (void)setCounterpart:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_counterpart);
    objc_storeWeak((id *)&self->_counterpart, v4);
    if (!self->_scene)
    {
      if (v6)
      {
        id v7 = PBUILogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[PBUIPosterVariantViewController setCounterpart:]();
        }

        id v8 = [v6 scene];
        id v9 = [v8 layerManager];
        [v9 removeObserver:self];

        id v10 = [v6 scene];
        [v10 removeObserver:self];
      }
      uint64_t v11 = [v4 scene];

      if (v11)
      {
        id v12 = [v4 scene];
        [(PBUIPosterVariantViewController *)self _monitorScene:v12];
      }
      else
      {
        id v12 = PBUILogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
          __int16 v14 = PBUIStringForWallpaperVariant([v4 variant]);
          int v15 = 138412546;
          id v16 = v13;
          __int16 v17 = 2112;
          uint64_t v18 = v14;
          _os_log_impl(&dword_1BC4B3000, v12, OS_LOG_TYPE_DEFAULT, "Neither %@ nor counterpart: %@ has a scene.", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    [(PBUIPosterVariantViewController *)self _setupCachesIfNeeded];
    [(PBUIPosterVariantViewController *)self _updateInterfaceStyle];
  }
}

- (UIColor)averageColor
{
  id v2 = [(PBUIPosterVariantViewController *)self contentColorStatistics];
  uint64_t v3 = [v2 averageColor];

  return (UIColor *)v3;
}

- (double)averageContrast
{
  id v2 = [(PBUIPosterVariantViewController *)self contentColorStatistics];
  [v2 averageContrast];
  double v4 = v3;

  return v4;
}

- (id)portalSourceProvider
{
  return self->_portalProvider;
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = PBUILogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
    int v14 = 138543362;
    int v15 = v4;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated.", (uint8_t *)&v14, 0xCu);
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  [(UIScenePresenter *)self->_presenter invalidate];
  presenter = self->_presenter;
  self->_presenter = 0;

  id v6 = [(FBScene *)self->_scene layerManager];
  [v6 removeObserver:self];

  [(FBScene *)self->_scene removeObserver:self];
  scene = self->_scene;
  self->_scene = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
  id v9 = [WeakRetained scene];
  id v10 = [v9 layerManager];
  [v10 removeObserver:self];

  id v11 = objc_loadWeakRetained((id *)&self->_counterpart);
  id v12 = [v11 scene];
  [v12 removeObserver:self];

  objc_storeWeak((id *)&self->_counterpart, 0);
  [(PBUIFixedReplicaSourceProvider *)self->_portalProvider invalidate];
  [(PBUICachedSnapshotEffectProvider *)self->_snapshotProvider invalidate];
  snapshotProvider = self->_snapshotProvider;
  self->_snapshotProvider = 0;
}

- (void)fetchWallpaperProminentColor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(PBUIPosterVariantViewController *)self variant];
    if (v5 == 1)
    {
      id v11 = v4;
      BSDispatchMain();
    }
    else
    {
      uint64_t v6 = v5;
      id v7 = [(PBUIPosterVariantViewController *)self counterpart];

      id v8 = PBUILogSnapshot();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (v9) {
          -[PBUIPosterVariantViewController fetchWallpaperProminentColor:](v6);
        }

        id v10 = [(PBUIPosterVariantViewController *)self counterpart];
        [v10 fetchWallpaperProminentColor:v4];
      }
      else
      {
        if (v9) {
          -[PBUIPosterVariantViewController fetchWallpaperProminentColor:](v6);
        }

        id v10 = [MEMORY[0x1E4F428B8] magentaColor];
        (*((void (**)(id, void *))v4 + 2))(v4, v10);
      }
    }
  }
}

void __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = PBUILogSnapshot();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = PBUIStringForWallpaperVariant(*(void *)(a1 + 48));
    *(_DWORD *)buf = 138543362;
    v24 = v3;
    _os_log_impl(&dword_1BC4B3000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking preferred prominent color...", buf, 0xCu);
  }
  id v4 = *(void **)(a1 + 32);
  id v22 = 0;
  int64_t v5 = [v4 _preferredProminentColor:0 source:&v22];
  id v6 = v22;
  if (v5)
  {
    id v7 = PBUILogSnapshot();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = PBUIStringForWallpaperVariant(*(void *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v24 = v8;
      __int16 v25 = 2114;
      uint64_t v26 = v5;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found preferred prominent color: %{public}@/%{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    BOOL v9 = *(void **)(*(void *)(a1 + 32) + 1136);
    if (!v9)
    {
      uint64_t v10 = objc_opt_new();
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 1136);
      *(void *)(v11 + 1136) = v10;

      BOOL v9 = *(void **)(*(void *)(a1 + 32) + 1136);
    }
    uint64_t v13 = (void *)[*(id *)(a1 + 40) copy];
    [v9 addObject:v13];

    int v14 = [*(id *)(*(void *)(a1 + 32) + 1032) snapshot];
    int v15 = objc_msgSend(v14, "pui_canDetermineProminentColor");
    uint64_t v16 = PBUILogSnapshot();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        uint64_t v18 = PBUIStringForWallpaperVariant(*(void *)(a1 + 48));
        *(_DWORD *)buf = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1BC4B3000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] using last snapshot taken to determine prominent color...", buf, 0xCu);
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_53;
      v21[3] = &unk_1E62B4480;
      uint64_t v19 = *(void *)(a1 + 48);
      v21[4] = *(void *)(a1 + 32);
      v21[5] = v19;
      objc_msgSend(v14, "pruis_determineProminentColorWithCompletion:", v21);
    }
    else
    {
      if (v17)
      {
        long long v20 = PBUIStringForWallpaperVariant(*(void *)(a1 + 48));
        *(_DWORD *)buf = 138543362;
        v24 = v20;
        _os_log_impl(&dword_1BC4B3000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling prominent color snapshot for *NOW*...", buf, 0xCu);
      }
      [*(id *)(a1 + 32) _snapshotNow:@"prominent color fetch"];
    }
  }
}

void __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PBUILogSnapshot();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_53_cold_1();
    }
  }
  id v8 = PBUILogSnapshot();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = PBUIStringForWallpaperVariant(*(void *)(a1 + 40));
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] using last snapshot determined a color: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 32) _handleUpdateProminentPosterDerivedColor:v5 posterPreferredProminentColor:0 timeColor:0 fallbackColor:0];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = PBUIStringForWallpaperVariant(*(void *)(a1 + 40));
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] last snapshot prominent color determination failed; scheduling prominent color snapshot for *NOW*...",
        (uint8_t *)&v12,
        0xCu);
    }
    [*(id *)(a1 + 32) _snapshotNow:@"prominent color fetch after failing to use last snapshot taken"];
  }
}

- (BOOL)updatePresentation
{
  return 0;
}

uint64_t __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 1056);
  [*(id *)(v2 + 976) bounds];
  objc_msgSend(v3, "setFrame:");
  id v4 = *(void **)(*(void *)(a1 + 32) + 1056);
  return [v4 setAlpha:0.0];
}

void __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[132] setAlpha:0.0];
    id WeakRetained = v2;
  }
}

void __50__PBUIPosterVariantViewController_setBlurEnabled___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 1121))
  {
    double v3 = WeakRetained;
    [WeakRetained[132] removeFromSuperview];
    id v2 = v3[132];
    v3[132] = 0;

    id WeakRetained = v3;
  }
}

+ (id)defaultCacheManager
{
  id PUIMappedImageCacheManagerClass = getPUIMappedImageCacheManagerClass();
  return (id)[PUIMappedImageCacheManagerClass defaultCacheManager];
}

- (void)_monitorScene:(id)a3
{
  int v12 = (FBScene *)a3;
  if (!v12)
  {
    uint64_t v10 = [NSString stringWithFormat:@"can't monitor a scene that doesn't exist"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterVariantViewController _monitorScene:](a2);
    }
LABEL_18:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC51CC64);
  }
  scene = self->_scene;
  if (scene != v12 && scene != 0)
  {
    uint64_t v10 = [NSString stringWithFormat:@"only one scene should be monitored"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterVariantViewController _monitorScene:](a2);
    }
    goto LABEL_18;
  }
  [(FBScene *)v12 addObserver:self];
  id v7 = [(FBScene *)v12 layerManager];
  [v7 addObserver:self];

  if ([(FBScene *)v12 isActive])
  {
    [(PBUIPosterVariantViewController *)self sceneDidActivate:v12];
    id v8 = [(FBScene *)v12 clientHandle];

    if (v8)
    {
      BOOL v9 = [(FBScene *)v12 clientHandle];
      [(PBUIPosterVariantViewController *)self scene:v12 clientDidConnect:v9];
    }
  }
}

- (id)makePortalSourceWithLegibilitySettings:(id)a3
{
  pathProvider = self->_pathProvider;
  id v5 = a3;
  id v6 = [(PBUIPosterVariantPathProvider *)pathProvider instanceURL];
  uint64_t v7 = [v6 path];
  id v8 = (void *)v7;
  BOOL v9 = @"UnknownURL";
  if (v7) {
    BOOL v9 = (__CFString *)v7;
  }
  uint64_t v10 = v9;

  uint64_t v11 = [PBUISimpleReplicaPortalSource alloc];
  int v12 = [(PBUIPosterVariantViewController *)self view];
  uint64_t v13 = [(PBUISimpleReplicaPortalSource *)v11 initWithTargetView:v12 cacheIdentifier:v10 legibilitySettings:v5 effectsAreBakedIn:0];

  return v13;
}

+ (id)snapshotFormat
{
  id PUIImageOnDiskFormatClass = getPUIImageOnDiskFormatClass();
  return (id)[PUIImageOnDiskFormatClass defaultATX];
}

- (void)_updatePresentation
{
  BSDispatchQueueAssertMain();
  if ([(PBUIPosterVariantViewController *)self updatePresentation])
  {
    [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"presentation was updated"];
  }
}

- (void)_updateParallax
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_scene)
  {
    double v3 = self->_contentContainer;
    id v4 = [(FBScene *)self->_scene settings];
    int v5 = objc_msgSend(v4, "pr_isParallaxEffectivelyEnabled");

    if (v5)
    {
      id v6 = [(FBScene *)self->_scene clientSettings];
      objc_msgSend(v6, "pr_contentSize");
      CGFloat v8 = v7;
      CGFloat v10 = v9;

      +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForCurrentDevice];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      if (BSSizeGreaterThanOrEqualToSize())
      {
        if (!self->_parallaxApplied)
        {
          self->_parallaxApplied = 1;
          id v15 = PBUILogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [(FBScene *)self->_scene pui_shortDescription];
            v37.width = v8;
            v37.height = v10;
            BOOL v17 = NSStringFromCGSize(v37);
            v38.width = v12;
            v38.height = v14;
            uint64_t v18 = NSStringFromCGSize(v38);
            *(_DWORD *)buf = 138412802;
            v31 = v16;
            __int16 v32 = 2112;
            v33 = v17;
            __int16 v34 = 2112;
            v35 = v18;
            _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_DEFAULT, "Parallax is enabled, %@ provided content size %@ and %@ is needed.", buf, 0x20u);
          }
          uint64_t v19 = +[PBUIWallpaperDomain rootSettings];
          long long v20 = objc_msgSend(v19, "parallaxSettingsForVariant:", -[PBUIPosterVariantViewController variant](self, "variant"));
          long long v21 = (void *)MEMORY[0x1E4F42FF0];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __50__PBUIPosterVariantViewController__updateParallax__block_invoke;
          v27[3] = &unk_1E62B2C38;
          id v28 = v20;
          uint64_t v29 = v3;
          id v22 = v20;
          [v21 animateWithDuration:251658240 delay:v27 options:0 animations:0.3 completion:0.0];
        }
        goto LABEL_12;
      }
      v23 = PBUILogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [(FBScene *)self->_scene pui_shortDescription];
        v39.width = v8;
        v39.height = v10;
        __int16 v25 = NSStringFromCGSize(v39);
        v40.width = v12;
        v40.height = v14;
        uint64_t v26 = NSStringFromCGSize(v40);
        *(_DWORD *)buf = 138412802;
        v31 = v24;
        __int16 v32 = 2112;
        v33 = v25;
        __int16 v34 = 2112;
        v35 = v26;
        _os_log_error_impl(&dword_1BC4B3000, v23, OS_LOG_TYPE_ERROR, "Parallax is enabled, but %@ provided content size %@ when %@ is needed. Parallax will be disabled.", buf, 0x20u);
      }
    }
    PBUIApplyParallaxSettingsToViewWithFactor(0, v3, 1.0);
    self->_parallaxApplied = 0;
LABEL_12:
  }
}

void __50__PBUIPosterVariantViewController__updateParallax__block_invoke(uint64_t a1)
{
}

- (void)_updateInterfaceStyle
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v3 = [(PBUIPosterVariantViewController *)self _applicableScene];
  id v4 = [v3 settings];
  uint64_t v5 = objc_msgSend(v4, "pui_userInterfaceStyle");

  if (v5 != self->_mostRecentSnapshotInterfaceStyle)
  {
    id v6 = [(PBUIPosterVariantViewController *)self _applicableScene];
    double v7 = [v6 settings];
    self->_int64_t mostRecentSnapshotInterfaceStyle = objc_msgSend(v7, "pui_userInterfaceStyle");

    CGFloat v8 = PBUILogSnapshot();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t mostRecentSnapshotInterfaceStyle = self->_mostRecentSnapshotInterfaceStyle;
      int v10 = 134217984;
      int64_t v11 = mostRecentSnapshotInterfaceStyle;
      _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_DEFAULT, "Updating most recent snapshot interface style: %lu", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setNeedsNewSnapshot:(id)a3
{
  snapshotNeeded = self->_snapshotNeeded;
  id v5 = a3;
  [(BSAtomicFlag *)snapshotNeeded setFlag:1];
  [(PBUIPosterVariantViewController *)self _scheduleSnapshotIfNeeded:v5];
}

- (void)_snapshotNow:(id)a3
{
  id v3 = a3;
  id v4 = PBUILogSnapshot();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PBUIPosterVariantViewController _snapshotNow:]();
  }

  BSDispatchMain();
}

uint64_t __48__PBUIPosterVariantViewController__snapshotNow___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) snapshotIfNeeded:1];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1104);
  return [v2 setFlag:0];
}

void __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  int v3 = [a2 isSnapshottingForExternalDisplayHostedWallpaper];
  id v4 = *(void **)(a1 + 32);
  if (!v3)
  {
    id v8 = [v4 _applicableScene];
    double v9 = 0;
    if (!v8) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [v4 _prepareFauxExternalScene];
  id v5 = *(void **)(*(void *)(a1 + 32) + 1064);
  id v18 = 0;
  int v6 = objc_msgSend(v5, "pui_sceneIsReadyToSnapshot:", &v18);
  id v7 = v18;
  if (v6)
  {
    id v8 = *(id *)(*(void *)(a1 + 32) + 1064);
    objc_initWeak(location, *(id *)(a1 + 32));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke_2;
    v16[3] = &unk_1E62B3920;
    objc_copyWeak(&v17, location);
    double v9 = (void *)MEMORY[0x1C1872570](v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
  else
  {
    int v10 = PBUILogSnapshot();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = PBUIStringForWallpaperVariant([*(id *)(a1 + 32) variant]);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v11;
      _os_log_impl(&dword_1BC4B3000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Faux external scene is not ready for snapshot. Scheduling a new snapshot.", (uint8_t *)location, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 1104) setFlag:0];
    uint64_t v12 = *(void **)(a1 + 32);
    double v13 = NSString;
    CGFloat v14 = PBUIStringForWallpaperVariant([v12 variant]);
    id v15 = [v13 stringWithFormat:@"scheduling new snapshot because faux %@ external scene is not ready", v14];
    [v12 _scheduleSnapshotIfNeeded:v15];

    double v9 = 0;
    id v8 = 0;
  }

  if (v8)
  {
LABEL_10:
    [*(id *)(a1 + 32) _snapshotScene:v8 completion:v9];
    [*(id *)(a1 + 32) _updateInterfaceStyle];
  }
LABEL_11:
}

void __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v1);
}

void __52__PBUIPosterVariantViewController_snapshotIfNeeded___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = WeakRetained;
    [WeakRetained[133] invalidate];
    id v2 = v3[133];
    v3[133] = 0;

    id WeakRetained = v3;
  }
}

- (void)_prepareFauxExternalScene
{
  if (!self->_fauxExternalScene)
  {
    int v3 = PBUILogSnapshot();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "Preparing a new scene for external display tailored snapshot", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v4 = [(PBUIPosterVariantViewController *)self _applicableScene];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke;
    v5[3] = &unk_1E62B44D0;
    objc_copyWeak(&v6, buf);
    [(PBUIPosterVariantViewController *)self _prepareFauxExternalSceneFromScene:v4 completion:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      objc_storeStrong(WeakRetained + 133, a2);
    }
    else
    {
      id v7 = PBUILogSnapshot();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke_cold_1();
      }
    }
  }
}

- (void)_prepareFauxExternalSceneFromScene:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 settings];
  id v8 = objc_msgSend(v7, "pui_posterContents");
  if (v8)
  {
    double v9 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];
    int v10 = [v9 identifier];

    if (v10)
    {
      int64_t v11 = [getPFPosterExtensionInstanceClass() extensionInstanceForPath:v8 instanceIdentifier:v10];
      if (v11)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke;
        v15[3] = &unk_1E62B4548;
        id v16 = v8;
        id v17 = v11;
        id v18 = v7;
        uint64_t v19 = self;
        id v20 = v6;
        [v17 bootupExtensionInstance:v15];
      }
      else
      {
        CGFloat v14 = PBUILogSnapshot();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:]();
        }

        (*((void (**)(id, void))v6 + 2))(v6, 0);
      }
    }
    else
    {
      double v13 = PBUILogSnapshot();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:]();
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
  else
  {
    uint64_t v12 = PBUILogSnapshot();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PBUIPosterVariantViewController _prepareFauxExternalSceneFromScene:completion:]();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PBUILogSnapshot();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_cold_1(v4);
    }

    (*((void (**)(void))a1[8] + 2))();
  }
  else
  {
    id v6 = a1[4];
    id v7 = a1[5];
    id v8 = a1[6];
    id v9 = a1[8];
    BSDispatchMain();
  }
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F62488];
  int v3 = getPUISceneRoleRendering();
  id v4 = objc_msgSend(v2, "pr_createPosterSceneWithRole:path:instance:", v3, *(void *)(a1 + 32), *(void *)(a1 + 40));

  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_3;
  int v10 = &unk_1E62B4520;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  [v4 configureParameters:&v7];
  objc_msgSend(v4, "activate:", 0, v7, v8, v9, v10);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_4;
  v6[3] = &unk_1E62B44F8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 updateSettingsWithBlock:v6];
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "pui_applyToMutableSceneSettings:", v3);
  [*(id *)(a1 + 40) applyFauxExternalSceneSettings:v4];
}

- (void)applyFauxExternalSceneSettings:(id)a3
{
  id v5 = a3;
  id v4 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v5, "pr_setAdjustedLuminance:", 2);
  }
}

- (void)_snapshotScene:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PBUILogSnapshot();
  id v9 = (char *)os_signpost_id_generate(v8);

  int v10 = PBUILogSnapshot();
  id v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BC4B3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "SnapshotUpdating", (const char *)&unk_1BC5491D9, (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if (PBUIColorSamplingQueue_onceToken != -1) {
    dispatch_once(&PBUIColorSamplingQueue_onceToken, &__block_literal_global_479);
  }
  id v12 = (id)PBUIColorSamplingQueue_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke;
  v14[3] = &unk_1E62B4598;
  objc_copyWeak(v16, buf);
  id v13 = v7;
  id v15 = v13;
  v16[1] = v9;
  [(PBUIPosterVariantViewController *)self performSnapshotOnQueue:v12 scene:v6 completion:v14];

  objc_destroyWeak(v16);
  objc_destroyWeak(buf);
}

void __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGFloat v14 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      if ([WeakRetained variant] == 1)
      {
        id v15 = (void *)MEMORY[0x1E4F28DC0];
        id v16 = self;
        id v17 = [v11 objectForKeyedSubscript:@"kDerivedProminentPosterColorMetadataKey"];
        id v18 = [v15 unarchivedObjectOfClass:v16 fromData:v17 error:0];
        v33 = [v18 UIColor];

        uint64_t v19 = (void *)MEMORY[0x1E4F28DC0];
        id v20 = self;
        long long v21 = [v11 objectForKeyedSubscript:@"kPosterPreferredProminentPosterColorMetadataKey"];
        id v22 = [v19 unarchivedObjectOfClass:v20 fromData:v21 error:0];
        v23 = [v22 UIColor];

        v24 = [v10 averageColor];
        __int16 v25 = objc_msgSend(v24, "pui_invertColor");
        uint64_t v26 = [v25 colorWithAlphaComponent:1.0];

        [v14 _handleUpdateProminentPosterDerivedColor:v33 posterPreferredProminentColor:v23 timeColor:0 fallbackColor:v26];
      }
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_4;
      v34[3] = &unk_1E62B4570;
      __int16 v27 = (id *)v35;
      id v28 = v9;
      v35[0] = v28;
      v35[1] = v14;
      id v36 = v12;
      id v29 = *(id *)(a1 + 32);
      uint64_t v30 = *(void *)(a1 + 48);
      id v37 = v29;
      uint64_t v38 = v30;
      [v14 postprocessNewSnapshot:v28 colorStatistics:v10 metadata:v11 completion:v34];

      goto LABEL_11;
    }
    __int16 v32 = *(void **)(a1 + 32);
    if (v32)
    {
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      v41 = __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_3;
      v42 = &unk_1E62B2EF0;
      __int16 v27 = (id *)v43;
      v43[0] = v32;
      goto LABEL_10;
    }
  }
  else
  {
    v31 = *(void **)(a1 + 32);
    if (v31)
    {
      v43[1] = MEMORY[0x1E4F143A8];
      v43[2] = 3221225472;
      v43[3] = __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_2;
      v43[4] = &unk_1E62B2EF0;
      __int16 v27 = &v44;
      id v44 = v31;
LABEL_10:
      BSDispatchMain();
LABEL_11:
    }
  }
}

uint64_t __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(void *)(a1 + 32) == 0;
  }
  uint64_t v7 = !v6;
  uint64_t v8 = PBUILogSnapshot();
  id v9 = v8;
  if (v7 == 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = PBUIStringForWallpaperVariant([*(id *)(a1 + 40) variant]);
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 1024;
      int v19 = a2;
      _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Snapshotted poster; didUpdate? %{BOOL}u",
        (uint8_t *)&v16,
        0x12u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_4_cold_1(a1);
  }

  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v7);
  }
  id v12 = PBUILogSnapshot();
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 64);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v15 = MEMORY[0x1C1871860](v7);
    int v16 = 138543362;
    id v17 = v15;
    _os_signpost_emit_with_name_impl(&dword_1BC4B3000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SnapshotUpdating", "wasSnapshotUpdated=%{public, name=wasSnapshotUpdated}@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)postprocessNewSnapshot:(id)a3 colorStatistics:(id)a4 metadata:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(BSAtomicFlag *)self->_snapshotNeeded setFlag:0];
  if (!v11)
  {
    os_signpost_id_t v14 = [getPUIColorBoxesClass() colorBoxesForImage:v10];
    id v11 = (id)[objc_alloc((Class)getPUIColorStatisticsClass()) initWithDelegate:0];
    [v11 updateWithColorBoxes:v14];
  }
  if (![v12 count])
  {

    id v12 = &unk_1F162C620;
  }
  snapshotSource = self->_snapshotSource;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PBUIPosterVariantViewController_postprocessNewSnapshot_colorStatistics_metadata_completion___block_invoke;
  v18[3] = &unk_1E62B45C0;
  v18[4] = self;
  id v19 = v11;
  id v20 = v13;
  id v16 = v13;
  id v17 = v11;
  [(PBUIURLBackedSnapshotSource *)snapshotSource updateWithImage:v10 contentColorStatistics:v17 metadata:v12 completion:v18];
}

uint64_t __94__PBUIPosterVariantViewController_postprocessNewSnapshot_colorStatistics_metadata_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  BSDispatchQueueAssertMain();
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    BOOL v6 = [*(id *)(a1 + 40) averageColor];
    uint64_t v7 = [*(id *)(a1 + 32) _applicableScene];
    uint64_t v8 = [v7 clientSettings];
    id v9 = objc_msgSend(v8, "pr_desiredLegibilitySettings");
    [v5 _updatePosterAverageColor:v6 desiredLegibilitySettings:v9];
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v12);
  }
  return MEMORY[0x1F4181820]();
}

- (PRSPosterConfiguration)lockScreenConfiguration
{
  if ([(PBUIPosterVariantViewController *)self variant])
  {
    uint64_t v3 = [(PBUIPosterVariantViewController *)self counterpart];
    uint64_t v4 = [v3 lockScreenConfiguration];
LABEL_5:
    BOOL v6 = (void *)v4;
    goto LABEL_6;
  }
  id v5 = [(PBUIPosterVariantViewController *)self scene];
  uint64_t v3 = objc_msgSend(v5, "pui_posterPath");

  if (v3)
  {
    uint64_t v4 = [objc_alloc((Class)getPRSPosterConfigurationClass()) initWithPath:v3];
    goto LABEL_5;
  }
  BOOL v6 = 0;
LABEL_6:

  return (PRSPosterConfiguration *)v6;
}

- (id)_lockVariantScene
{
  if ([(PBUIPosterVariantViewController *)self variant])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
    uint64_t v4 = [WeakRetained scene];
  }
  else
  {
    uint64_t v4 = self->_scene;
  }
  return v4;
}

- (id)_homeVariantScene
{
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    uint64_t v3 = self->_scene;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
    uint64_t v3 = [WeakRetained scene];
  }
  return v3;
}

- (void)performSnapshotOnQueue:(id)a3 scene:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = v7;
  id v13 = a5;
  id v8 = v13;
  id v9 = v7;
  id v10 = v11;
  BSDispatchMain();
}

void __75__PBUIPosterVariantViewController_performSnapshotOnQueue_scene_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PBUIPosterVariantViewController_performSnapshotOnQueue_scene_completion___block_invoke_2;
  v4[3] = &unk_1E62B45E8;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "pui_executeSnapshotForLevelSets:determineColorStatistics:onQueue:completion:", MEMORY[0x1E4F1CBF0], 1, v3, v4);
}

void __75__PBUIPosterVariantViewController_performSnapshotOnQueue_scene_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v16 = v6;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [v6 infoDictionary];
    id v8 = [*(id *)(a1 + 32) identifier];
    [v7 setObject:v8 forKey:@"SNAPSHOT_SOURCE"];

    id v9 = [v16 capturedSnapshotLevelSets];
    id v10 = [v9 anyObject];
    id v11 = [v16 capturedSnapshotForLevelSet:v10];

    id v12 = [v16 capturedColorStatistics];
    uint64_t v13 = *(void *)(a1 + 40);
    os_signpost_id_t v14 = [v16 infoDictionary];
    id v15 = (void *)[v14 copy];
    (*(void (**)(uint64_t, void *, void *, void *, void))(v13 + 16))(v13, v11, v12, v15, 0);
  }
}

- (UIImage)snapshot
{
  if ([(PBUIPosterVariantViewController *)self isSnapshotInCorrectOrientation])
  {
    uint64_t v3 = [(PBUIURLBackedSnapshotSource *)self->_snapshotSource snapshot];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (UIImage *)v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PBUIPosterVariantViewController;
  [(PBUIPosterVariantViewController *)&v12 viewDidLoad];
  uint64_t v3 = [(PBUIPosterVariantViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v3 bounds];
  id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  contentContainer = self->_contentContainer;
  self->_contentContainer = v5;

  [(UIView *)self->_contentContainer setAutoresizingMask:18];
  [v3 addSubview:self->_contentContainer];
  id v7 = [PBUISnapshotReplicaView alloc];
  [v3 bounds];
  id v8 = -[PBUISnapshotReplicaView initWithFrame:](v7, "initWithFrame:");
  snapshotView = self->_snapshotView;
  self->_snapshotView = v8;

  id v10 = self->_snapshotView;
  id v11 = [(PBUIPosterVariantViewController *)self snapshotSourceProvider];
  [(PBUISnapshotReplicaView *)v10 setProvider:v11];

  [v3 addSubview:self->_snapshotView];
  [v3 sendSubviewToBack:self->_snapshotView];
  [(PBUIPosterVariantViewController *)self _updatePresentation];
}

- (void)sceneDidActivate:(id)a3
{
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  self->_unint64_t lastExtantUpdate = 0;
}

- (void)sceneContentStateDidChange:(id)a3
{
  if ([a3 contentState] == 2)
  {
    [(PBUIPosterVariantViewController *)self invalidateSnapshotPreconditions:@"scene content state did change to ready"];
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v25 = a3;
  id v9 = a4;
  if (objc_msgSend(a6, "pr_updateSnapshot"))
  {
    [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"transition context requested new snapshot"];
  }
  else if (objc_msgSend(v9, "pui_extendedRenderSessionDidChange"))
  {
    id v10 = [v25 clientSettings];
    char v11 = objc_msgSend(v10, "pui_inExtendedRenderSession");

    if ((v11 & 1) == 0)
    {
      objc_super v12 = NSString;
      uint64_t v13 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
      os_signpost_id_t v14 = MEMORY[0x1C1871860](objc_msgSend(v9, "pui_extendedRenderSessionDidChange"));
      id v15 = [v25 clientSettings];
      id v16 = MEMORY[0x1C1871860](objc_msgSend(v15, "pui_inExtendedRenderSession"));
      objc_msgSend(v12, "stringWithFormat:", @"didUpdateClientSettings with diff for variant %@; extendedRenderSessionDidChange %@ inExtendedRenderSession %@",
        v13,
        v14,
      id v17 = v16);
      [(PBUIPosterVariantViewController *)self invalidateSnapshotPreconditions:v17];
    }
  }
  if (objc_msgSend(v9, "pr_hideDimmingLayerDidChange"))
  {
    __int16 v18 = [(PBUIPosterVariantViewController *)self delegate];
    id v19 = [v25 clientSettings];
    objc_msgSend(v18, "posterComponent:didUpdateHideDimmingLayer:", self, objc_msgSend(v19, "pr_hideDimmingLayer"));
  }
  if ((objc_msgSend(v9, "pr_averageColorDidChange") & 1) != 0
    || objc_msgSend(v9, "pr_desiredLegibilitySettingsDidChange"))
  {
    id v20 = [v25 clientSettings];
    long long v21 = objc_msgSend(v20, "pr_averageColor");
    id v22 = [v21 UIColor];

    v23 = [v25 clientSettings];
    v24 = objc_msgSend(v23, "pr_desiredLegibilitySettings");
    [(PBUIPosterVariantViewController *)self _updatePosterAverageColor:v22 desiredLegibilitySettings:v24];
  }
  if (objc_msgSend(v9, "pr_prominentColorDidChange")) {
    [(PBUIPosterVariantViewController *)self _updatePosterPreferredProminentColor];
  }
  if (objc_msgSend(v9, "pr_contentSizeDidChange")) {
    [(PBUIPosterVariantViewController *)self _updateParallax];
  }
}

- (UIColor)derivedProminentColor
{
  derivedProminentColor = self->_derivedProminentColor;
  if (derivedProminentColor) {
    goto LABEL_2;
  }
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    id v6 = [(PBUIPosterVariantViewController *)self _fetchDerivedProminentColor];
    id v7 = self->_derivedProminentColor;
    self->_derivedProminentColor = v6;

    derivedProminentColor = self->_derivedProminentColor;
    if (derivedProminentColor)
    {
LABEL_2:
      uint64_t v3 = derivedProminentColor;
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [(PBUIPosterVariantViewController *)self counterpart];

    if (v8)
    {
      id v9 = [(PBUIPosterVariantViewController *)self counterpart];
      uint64_t v3 = [v9 derivedProminentColor];

      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
LABEL_3:
  return v3;
}

- (UIColor)posterPreferredProminentColor
{
  return (UIColor *)[(PBUIPosterVariantViewController *)self _posterPreferredProminentColor:1];
}

- (id)_posterPreferredProminentColor:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    if (!v3)
    {
      id v8 = [(PBUIPosterVariantViewController *)self _fetchPosterPreferredProminentColor];
      goto LABEL_9;
    }
    posterPreferredProminentColor = self->_posterPreferredProminentColor;
    if (posterPreferredProminentColor
      || ([(PBUIPosterVariantViewController *)self _fetchPosterPreferredProminentColor], id v6 = (UIColor *)objc_claimAutoreleasedReturnValue(), v7 = self->_posterPreferredProminentColor, self->_posterPreferredProminentColor = v6, v7, (posterPreferredProminentColor = self->_posterPreferredProminentColor) != 0))
    {
      id v8 = posterPreferredProminentColor;
LABEL_9:
      char v11 = v8;
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = [(PBUIPosterVariantViewController *)self counterpart];

    if (v9)
    {
      id v10 = [(PBUIPosterVariantViewController *)self counterpart];
      char v11 = [v10 _posterPreferredProminentColor:v3];

      goto LABEL_11;
    }
  }
  char v11 = 0;
LABEL_11:
  return v11;
}

- (UIColor)timeColor
{
  if ([(PBUIPosterVariantViewController *)self variant] == 1
    && ([(PBUIPosterVariantViewController *)self counterpart],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(PBUIPosterVariantViewController *)self counterpart];
    id v5 = [v4 timeColor];
  }
  else
  {
    timeColor = self->_timeColor;
    if (!timeColor)
    {
      id v7 = [(PBUIPosterVariantViewController *)self _fetchTimeColor];
      id v8 = self->_timeColor;
      self->_timeColor = v7;

      timeColor = self->_timeColor;
    }
    id v5 = timeColor;
  }
  return v5;
}

- (UIColor)preferredProminentColor
{
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    BOOL v3 = [(PBUIPosterVariantViewController *)self _preferredProminentColor:1 source:0];
  }
  else
  {
    id v4 = [(PBUIPosterVariantViewController *)self counterpart];
    BOOL v3 = [v4 preferredProminentColor];
  }
  return (UIColor *)v3;
}

- (id)_preferredProminentColor:(BOOL)a3 source:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(PBUIPosterVariantViewController *)self variant])
  {
    if (v5)
    {
      preferredProminentColor = self->_preferredProminentColor;
      if (preferredProminentColor)
      {
        id v8 = preferredProminentColor;
        goto LABEL_14;
      }
    }
    id v9 = [(PBUIPosterVariantViewController *)self derivedProminentColor];
    id v10 = [(PBUIPosterVariantViewController *)self _posterPreferredProminentColor:v5];
    char v11 = [(PBUIPosterVariantViewController *)self timeColor];
    objc_super v12 = [(PBUIPosterVariantViewController *)self fallbackColor];
    id v17 = 0;
    id v8 = [(id)objc_opt_class() _determinePreferredProminentColorFromDerivedProminentColor:v9 posterPreferredProminentColor:v10 timeColor:v11 fallbackColor:v12 outChosenColor:&v17];
    id v13 = v17;
    if (v8)
    {
      [(PBUIPosterVariantViewController *)self setPreferredProminentColor:v8 chosenColorSource:v13 notifyObservers:1];
      os_signpost_id_t v14 = PBUILogSnapshot();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
        *(_DWORD *)buf = 138543874;
        id v19 = v15;
        __int16 v20 = 2114;
        long long v21 = v8;
        __int16 v22 = 2114;
        id v23 = v13;
        _os_log_impl(&dword_1BC4B3000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded preferred prominent color %{public}@/%{public}@", buf, 0x20u);
      }
    }
    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
    id v9 = [(PBUIPosterVariantViewController *)self counterpart];
    id v8 = [v9 _preferredProminentColor:v5 source:a4];
  }

LABEL_14:
  return v8;
}

- (void)setPreferredProminentColor:(id)a3 chosenColorSource:(id)a4 notifyObservers:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if (([(UIColor *)self->_preferredProminentColor isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredProminentColor, a3);
    uint64_t v11 = [v10 copy];
    objc_super v12 = (void *)v11;
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    else {
      id v13 = @"UNKNOWN";
    }
    objc_storeStrong((id *)&self->_preferredProminentColorSource, v13);

    [(PBUIPosterVariantViewController *)self updateHomeVariantStyleState];
    if (v5)
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v15, &location);
      id v14 = v9;
      BSDispatchMain();

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __96__PBUIPosterVariantViewController_setPreferredProminentColor_chosenColorSource_notifyObservers___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained + 146;
    id v7 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 146);
    char v5 = objc_opt_respondsToSelector();

    id WeakRetained = v7;
    if (v5)
    {
      id v6 = objc_loadWeakRetained(v3);
      [v6 posterComponent:v7 didUpdatePreferredProminentColor:*(void *)(a1 + 32)];

      id WeakRetained = v7;
    }
  }
}

- (BOOL)updateHomeVariantStyleState
{
  return 0;
}

- (void)snapshotSource:(id)a3 failedToReadSnapshotAtURL:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = PBUILogSnapshot();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[PBUIPosterVariantViewController snapshotSource:failedToReadSnapshotAtURL:error:]();
  }

  [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"failed to read snapshot; requesting new one"];
}

- (void)snapshotSource:(id)a3 failedToReadColorStatisticsAtURL:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = PBUILogSnapshot();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[PBUIPosterVariantViewController snapshotSource:failedToReadColorStatisticsAtURL:error:]();
  }

  [(PBUIPosterVariantViewController *)self setNeedsNewSnapshot:@"failed to read color statistics; requesting new snapshot for new color statistics"];
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
}

- (void)colorStatisticsDidChange:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PBUIPosterVariantViewController *)self contentColorStatistics];

  if (v5 == v4)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      id v6 = [(PBUIPosterVariantViewController *)self desiredLegibilitySettings];
      if (v6)
      {
        id v7 = PBUILogSnapshot();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
          *(_DWORD *)buf = 138543362;
          __int16 v27 = v8;
          _os_log_impl(&dword_1BC4B3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Legibility settings did change", buf, 0xCu);
        }
        id v9 = PBUILogSnapshot();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v27 = v6;
          _os_log_impl(&dword_1BC4B3000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Legibility settings will use desired legibility:", buf, 0xCu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v11 = [v6 convertToUILegibility];
        [WeakRetained posterComponent:self didUpdateLegibilitySettings:v11];
      }
      else
      {
        objc_super v12 = [v4 averageColor];
        id WeakRetained = [v12 BSColor];

        id v13 = PBUILogSnapshot();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
          *(_DWORD *)buf = 138543362;
          __int16 v27 = v14;
          _os_log_impl(&dword_1BC4B3000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Legibility settings did change", buf, 0xCu);
        }
        id v15 = PBUILogSnapshot();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = PBUIStringForWallpaperVariant([(PBUIPosterVariantViewController *)self variant]);
          [WeakRetained red];
          int v18 = (int)(v17 * 255.0);
          [WeakRetained green];
          int v20 = (int)(v19 * 255.0);
          [WeakRetained blue];
          int v22 = (int)(v21 * 255.0);
          [WeakRetained alpha];
          *(_DWORD *)buf = 138544386;
          __int16 v27 = v16;
          __int16 v28 = 1024;
          int v29 = v18;
          __int16 v30 = 1024;
          int v31 = v20;
          __int16 v32 = 1024;
          int v33 = v22;
          __int16 v34 = 2048;
          uint64_t v35 = v23;
          _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated average color to: #%02X%02X%02X (%.1f)", buf, 0x28u);
        }
        uint64_t v11 = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v24 = [v4 legibilitySettings];
        [v11 posterComponent:self didUpdateLegibilitySettings:v24];
      }
      [(PBUIPosterVariantViewController *)self legibilitySettingsDidChange];
    }
    else
    {
      id v25 = v4;
      BSDispatchMain();
    }
  }
}

uint64_t __60__PBUIPosterVariantViewController_colorStatisticsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) colorStatisticsDidChange:*(void *)(a1 + 40)];
}

- (void)legibilitySettingsDidChange
{
  portalProvider = self->_portalProvider;
  id v5 = [(PBUIPosterVariantViewController *)self legibilitySettings];
  id v4 = [(PBUIPosterVariantViewController *)self makePortalSourceWithLegibilitySettings:v5];
  [(PBUIFixedReplicaSourceProvider *)portalProvider setPortalSource:v4];
}

- (id)_fetchPosterPreferredProminentColor
{
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    BOOL v3 = [(PBUIPosterVariantViewController *)self _applicableScene];
    id v4 = [v3 clientSettings];
    id v5 = objc_msgSend(v4, "pr_preferredProminentColor");
    id v6 = [v5 UIColor];

    if (!v6)
    {
      id v6 = [(PBUIURLBackedSnapshotSource *)self->_snapshotSource posterPreferredProminentColor];
      if (!v6)
      {
        id v7 = [(PBUIPosterVariantViewController *)self lockScreenConfiguration];
        id v13 = 0;
        id v8 = objc_msgSend(v7, "pr_loadHomeScreenConfigurationWithError:", &v13);
        id v9 = v13;

        id v10 = [v8 customizationConfiguration];
        id v6 = [v10 suggestedTintColor];

        if (v9)
        {
          uint64_t v11 = PBUILogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[PBUIPosterVariantViewController _fetchPosterPreferredProminentColor]();
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_fetchDerivedProminentColor
{
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    BOOL v3 = [(PBUIURLBackedSnapshotSource *)self->_snapshotSource derivedProminentPosterColor];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)_fetchTimeColor
{
  if ([(PBUIPosterVariantViewController *)self variant])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(PBUIPosterVariantViewController *)self _applicableScene];
    id v5 = [v4 settings];
    id v6 = objc_msgSend(v5, "pr_posterConfiguredProperties");
    id v7 = [v6 titleStyleConfiguration];
    id v8 = [v7 effectiveTitleColor];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
      }
      else
      {
        id v9 = [v8 color];
      }
      id v10 = v9;
      BOOL v3 = [v9 colorWithAlphaComponent:1.0];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

- (void)_handleUpdateProminentPosterDerivedColor:(id)a3 posterPreferredProminentColor:(id)a4 timeColor:(id)a5 fallbackColor:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = (UIColor *)a3;
  uint64_t v11 = (UIColor *)a4;
  objc_super v12 = (UIColor *)a5;
  id v13 = a6;
  if ([(PBUIPosterVariantViewController *)self variant] == 1)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      id v14 = self->_preferredProminentColor;
      if (v12 || v10 || v11 || v13)
      {
        int v18 = PBUILogSnapshot();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          double v19 = PBUIStringForWallpaperVariant(1);
          *(_DWORD *)buf = 138544386;
          v73 = v19;
          __int16 v74 = 2114;
          v75 = v10;
          __int16 v76 = 2114;
          v77 = v11;
          __int16 v78 = 2114;
          v79 = v12;
          __int16 v80 = 2114;
          id v81 = v13;
          _os_log_impl(&dword_1BC4B3000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] running _handleUpdateProminentPosterDerivedColor; derivedProminentColor %{public}@ posterPrefer"
            "redProminentColor %{public}@ timeColor %{public}@ fallbackColor: %{public}@",
            buf,
            0x34u);
        }
        if (v10)
        {
          if (!v11) {
            goto LABEL_73;
          }
          goto LABEL_16;
        }
      }
      else
      {
        id v15 = PBUILogSnapshot();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            double v17 = PBUIStringForWallpaperVariant(1);
            *(_DWORD *)buf = 138543618;
            v73 = v17;
            __int16 v74 = 2114;
            v75 = v14;
            _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping _handleUpdateProminentPosterDerivedColor; no colors specified and currentPreferredPr"
              "ominentColor is populated %{public}@",
              buf,
              0x16u);
          }
          objc_super v12 = 0;
          uint64_t v11 = 0;
          id v10 = 0;
          goto LABEL_67;
        }
        if (v16)
        {
          v51 = PBUIStringForWallpaperVariant(1);
          *(_DWORD *)buf = 138543362;
          v73 = v51;
          _os_log_impl(&dword_1BC4B3000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] running _handleUpdateProminentPosterDerivedColor; no currentPreferredProminentColor is populated",
            buf,
            0xCu);
        }
      }
      id v10 = [(PBUIPosterVariantViewController *)self _fetchDerivedProminentColor];
      if (!v11)
      {
LABEL_73:
        uint64_t v11 = [(PBUIPosterVariantViewController *)self _fetchPosterPreferredProminentColor];
        if (v12) {
          goto LABEL_17;
        }
        goto LABEL_74;
      }
LABEL_16:
      if (v12) {
        goto LABEL_17;
      }
LABEL_74:
      objc_super v12 = [(PBUIPosterVariantViewController *)self timeColor];
LABEL_17:
      id v15 = [(PBUIPosterVariantViewController *)self timeColor];
      v59 = [(PBUIPosterVariantViewController *)self posterPreferredProminentColor];
      int v20 = [(PBUIPosterVariantViewController *)self derivedProminentColor];
      [(PBUIPosterVariantViewController *)self fallbackColor];
      v58 = v57 = v20;
      if (v20)
      {
        if ([v20 isEqual:v10]) {
          goto LABEL_19;
        }
      }
      else if (!v10)
      {
LABEL_19:
        if (v15) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
      [(PBUIPosterVariantViewController *)self setDerivedProminentColor:v10];
      double v21 = PBUILogSnapshot();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = PBUIStringForWallpaperVariant(1);
        *(_DWORD *)buf = 138543618;
        v73 = v22;
        __int16 v74 = 2114;
        v75 = v10;
        _os_log_impl(&dword_1BC4B3000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating DERIVED PROMINENT COLOR: %{public}@", buf, 0x16u);
      }
      if (v15)
      {
LABEL_20:
        if ([v15 isEqual:v12]) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
LABEL_26:
      if (!v12) {
        goto LABEL_30;
      }
LABEL_27:
      [(PBUIPosterVariantViewController *)self setTimeColor:v12];
      uint64_t v23 = PBUILogSnapshot();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = PBUIStringForWallpaperVariant(1);
        *(_DWORD *)buf = 138543618;
        v73 = v24;
        __int16 v74 = 2114;
        v75 = v12;
        _os_log_impl(&dword_1BC4B3000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating TIME COLOR: %{public}@", buf, 0x16u);
      }
LABEL_30:
      if (v59)
      {
        if ([v59 isEqual:v11]) {
          goto LABEL_42;
        }
      }
      else if (!v11)
      {
        goto LABEL_42;
      }
      v53 = v15;
      v55 = v14;
      [(PBUIPosterVariantViewController *)self setPosterPreferredProminentColor:v11];
      [(PBUIURLBackedSnapshotSource *)self->_snapshotSource updatePosterPreferredProminentColor:v11 error:0];
      id PRSPosterUpdateClass = getPRSPosterUpdateClass();
      uint64_t v26 = [(UIColor *)v11 BSColor];
      __int16 v27 = [PRSPosterUpdateClass posterUpdateHomeScreenSuggestedTintColor:v26];

      id PRSPosterUpdaterClass = getPRSPosterUpdaterClass();
      int v29 = [(PBUIPosterVariantViewController *)self _lockVariantScene];
      __int16 v30 = objc_msgSend(v29, "pui_posterPath");
      int v31 = [PRSPosterUpdaterClass updaterForPath:v30];

      id v65 = 0;
      LODWORD(PRSPosterUpdaterClass) = [v31 applyUpdateLocally:v27 error:&v65];
      id v32 = v65;
      int v33 = v32;
      if (!PRSPosterUpdaterClass || v32)
      {
        __int16 v34 = PBUILogSnapshot();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[PBUIPosterVariantViewController _handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:]();
        }
      }
      uint64_t v35 = PBUILogSnapshot();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = PBUIStringForWallpaperVariant(1);
        *(_DWORD *)buf = 138543618;
        v73 = v36;
        __int16 v74 = 2114;
        v75 = v11;
        _os_log_impl(&dword_1BC4B3000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating POSTER PREFERRED PROMINENT COLOR color: %{public}@", buf, 0x16u);
      }
      id v15 = v53;
      id v14 = v55;
LABEL_42:
      if (v58)
      {
        if ([v58 isEqual:v13]) {
          goto LABEL_49;
        }
      }
      else if (!v13)
      {
        goto LABEL_49;
      }
      [(PBUIPosterVariantViewController *)self setFallbackColor:v13];
      id v37 = PBUILogSnapshot();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        PBUIStringForWallpaperVariant(1);
        v39 = uint64_t v38 = v15;
        *(_DWORD *)buf = 138543618;
        v73 = v39;
        __int16 v74 = 2114;
        v75 = v11;
        _os_log_impl(&dword_1BC4B3000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating POSTER FALLBACK COLOR: %{public}@", buf, 0x16u);

        id v15 = v38;
      }

LABEL_49:
      id v64 = 0;
      uint64_t v40 = [(id)objc_opt_class() _determinePreferredProminentColorFromDerivedProminentColor:v10 posterPreferredProminentColor:v11 timeColor:v12 fallbackColor:v13 outChosenColor:&v64];
      v41 = (UIColor *)v64;
      if (v14)
      {
        if ([(UIColor *)v14 isEqual:v40]) {
          goto LABEL_66;
        }
      }
      else if (!v40)
      {
LABEL_66:

LABEL_67:
        goto LABEL_68;
      }
      v52 = v41;
      [(PBUIPosterVariantViewController *)self setPreferredProminentColor:v40 chosenColorSource:v41 notifyObservers:v40 != 0];
      v42 = PBUILogSnapshot();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = PBUIStringForWallpaperVariant(1);
        *(_DWORD *)buf = 138543874;
        v73 = v43;
        __int16 v74 = 2114;
        v75 = v40;
        __int16 v76 = 2114;
        v77 = v52;
        _os_log_impl(&dword_1BC4B3000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] preferred prominent color WAS UPDATED: %{public}@/%{public}@", buf, 0x20u);
      }
      id v44 = (void *)[(NSMutableArray *)self->_fetchBlocks copy];
      v45 = v44;
      if (v40 && [v44 count])
      {
        v54 = v15;
        v56 = v14;
        [(NSMutableArray *)self->_fetchBlocks removeAllObjects];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v46 = v45;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v60 objects:v71 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v61 != v49) {
                objc_enumerationMutation(v46);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v60 + 1) + 8 * i) + 16))();
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v60 objects:v71 count:16];
          }
          while (v48);
        }

        id v15 = v54;
        id v14 = v56;
      }

      v41 = v52;
      goto LABEL_66;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __130__PBUIPosterVariantViewController__handleUpdateProminentPosterDerivedColor_posterPreferredProminentColor_timeColor_fallbackColor___block_invoke;
    block[3] = &unk_1E62B4610;
    block[4] = self;
    id v10 = v10;
    v67 = v10;
    uint64_t v11 = v11;
    v68 = v11;
    objc_super v12 = v12;
    v69 = v12;
    id v70 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_68:
}

uint64_t __130__PBUIPosterVariantViewController__handleUpdateProminentPosterDerivedColor_posterPreferredProminentColor_timeColor_fallbackColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdateProminentPosterDerivedColor:*(void *)(a1 + 40) posterPreferredProminentColor:*(void *)(a1 + 48) timeColor:*(void *)(a1 + 56) fallbackColor:*(void *)(a1 + 64)];
}

- (void)_updatePosterAverageColor:(id)a3 desiredLegibilitySettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [(PBUIPosterVariantViewController *)self desiredLegibilitySettings];
  if (!v8) {
    goto LABEL_5;
  }
  id v9 = (void *)v8;
  id v10 = [(PBUIPosterVariantViewController *)self desiredLegibilitySettings];
  char v11 = [v10 isEqual:v7];

  if (v11)
  {
LABEL_4:
    int v12 = 0;
  }
  else
  {
LABEL_5:
    [(PBUIPosterVariantViewController *)self setDesiredLegibilitySettings:v7];
    int v12 = 1;
  }
  posterColorStatistics = self->_posterColorStatistics;
  if (v6)
  {
    if (!posterColorStatistics)
    {
      id v14 = (PUIColorStatistics *)[objc_alloc((Class)getPUIColorStatisticsClass()) initWithDelegate:self];
      id v15 = self->_posterColorStatistics;
      self->_posterColorStatistics = v14;

      posterColorStatistics = self->_posterColorStatistics;
    }
    BOOL v16 = [(PUIColorStatistics *)posterColorStatistics averageColor];
    char v17 = [v16 _isSimilarToColor:v6 withinPercentage:0.00000011920929];

    if ((v17 & 1) == 0)
    {
      [(PUIColorStatistics *)self->_posterColorStatistics resetWithColor:v6];
      goto LABEL_13;
    }
  }
  else if (posterColorStatistics)
  {
    self->_posterColorStatistics = 0;

LABEL_13:
    char v18 = 0;
    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  char v18 = 1;
  if (!v12) {
    goto LABEL_18;
  }
LABEL_16:
  [(PBUIPosterVariantViewController *)self legibilitySettingsDidChange];
  double v19 = [(PBUIPosterVariantViewController *)self desiredLegibilitySettings];

  if (v19)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v22, &location);
    id v21 = v7;
    BSDispatchMain();

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    goto LABEL_20;
  }
LABEL_18:
  if ((v18 & 1) == 0)
  {
    int v20 = [(PBUIPosterVariantViewController *)self contentColorStatistics];
    [(PBUIPosterVariantViewController *)self colorStatisticsDidChange:v20];
  }
LABEL_20:
}

void __87__PBUIPosterVariantViewController__updatePosterAverageColor_desiredLegibilitySettings___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 146);
    id v4 = [*(id *)(a1 + 32) convertToUILegibility];
    [v3 posterComponent:v5 didUpdateLegibilitySettings:v4];

    id WeakRetained = v5;
  }
}

- (void)_updatePosterPreferredProminentColor
{
  id v3 = [(PBUIPosterVariantViewController *)self _fetchPosterPreferredProminentColor];
  [(PBUIPosterVariantViewController *)self _handleUpdateProminentPosterDerivedColor:0 posterPreferredProminentColor:v3 timeColor:0 fallbackColor:0];
}

+ (id)_determinePreferredProminentColorFromDerivedProminentColor:(id)a3 posterPreferredProminentColor:(id)a4 timeColor:(id)a5 fallbackColor:(id)a6 outChosenColor:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v12;
  BOOL v16 = v15;
  if (v15 && a7)
  {
    char v17 = @"posterPreferredProminentColor";
    id v18 = v15;
  }
  else if (!v11 || v15)
  {
    if (v15 || !v13)
    {
      id v18 = v15;
      if (v15) {
        goto LABEL_19;
      }
      if (v14)
      {
        id v19 = v14;
      }
      else
      {
        id v19 = [MEMORY[0x1E4F428B8] purpleColor];
      }
      id v18 = v19;
      if (!a7) {
        goto LABEL_19;
      }
      char v17 = @"fallbackColor";
    }
    else
    {
      id v18 = v13;
      if (!a7) {
        goto LABEL_19;
      }
      char v17 = @"timeColor";
    }
  }
  else
  {
    id v18 = v11;
    if (!a7) {
      goto LABEL_19;
    }
    char v17 = @"derivedPreferredProminentColor";
  }
  *a7 = v17;
LABEL_19:

  return v18;
}

- (NSString)description
{
  return (NSString *)[(PBUIPosterVariantViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(PBUIPosterVariantViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PBUIPosterVariantViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIPosterVariantViewController *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PBUIPosterVariantViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E62B2C38;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __73__PBUIPosterVariantViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 984) withName:@"scene"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 992) withName:@"presenter" skipIfNil:1];
  id v4 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) contentColorStatistics];
  id v5 = (id)[v4 appendObject:v6 withName:@"colorStats" skipIfNil:1];
}

- (void)setDesiredLegibilitySettings:(id)a3
{
}

- (void)setPosterPreferredProminentColor:(id)a3
{
}

- (void)setTimeColor:(id)a3
{
}

- (PBUIPosterVariantViewController)counterpart
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_counterpart);
  return (PBUIPosterVariantViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setDerivedProminentColor:(id)a3
{
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void)setFallbackColor:(id)a3
{
}

- (void)setPreferredProminentColor:(id)a3
{
}

- (PUIManagedCacheIdentifying)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_preferredProminentColor, 0);
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_derivedProminentColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_posterPreferredProminentColor, 0);
  objc_storeStrong((id *)&self->_desiredLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_fetchBlocks, 0);
  objc_storeStrong((id *)&self->_preferredProminentColorSource, 0);
  objc_storeStrong((id *)&self->_isRotating, 0);
  objc_storeStrong((id *)&self->_snapshotScheduled, 0);
  objc_storeStrong((id *)&self->_snapshotNeeded, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_pathProvider, 0);
  objc_storeStrong((id *)&self->_fauxExternalScene, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_portalProvider, 0);
  objc_storeStrong((id *)&self->_snapshotSource, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_posterColorStatistics, 0);
  objc_destroyWeak((id *)&self->_counterpart);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
}

- (void)initWithScene:(const char *)a1 counterpart:.cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setCounterpart:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1BC4B3000, v1, OS_LOG_TYPE_FAULT, "oldCounterpart exists w/o scene attached. (old counterpart %@; new counterpart %@)",
    v2,
    0x16u);
}

- (void)fetchWallpaperProminentColor:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1 = PBUIStringForWallpaperVariant(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v2, v3, "[%{public}@] no counter part on a non-lockscreen variant... returning magenta", v4, v5, v6, v7, v8);
}

- (void)fetchWallpaperProminentColor:(uint64_t)a1 .cold.2(uint64_t a1)
{
  os_log_t v1 = PBUIStringForWallpaperVariant(a1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v2, v3, "[%{public}@] non-lock screen variant, calling through to counterpart", v4, v5, v6, v7, v8);
}

void __64__PBUIPosterVariantViewController_fetchWallpaperProminentColor___block_invoke_53_cold_1()
{
  OUTLINED_FUNCTION_11();
  os_log_t v1 = PBUIStringForWallpaperVariant(*(void *)(v0 + 40));
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4(&dword_1BC4B3000, v2, v3, "[%{public}@] error determining prominent color determination from last snapshot taken:  %{public}@", v4, v5, v6, v7, v8);
}

- (void)_monitorScene:(const char *)a1 .cold.1(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_monitorScene:(const char *)a1 .cold.2(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_1(&dword_1BC4B3000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_snapshotNow:.cold.1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PBUIStringForWallpaperVariant([v2 variant]);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.25];
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v1;
  _os_log_debug_impl(&dword_1BC4B3000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Snapshot scheduled for (now) %{public}@ for reason %{public}@", (uint8_t *)&v5, 0x20u);
}

void __60__PBUIPosterVariantViewController__prepareFauxExternalScene__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "Error preparing faux external scene", v2, v3, v4, v5, v6);
}

- (void)_prepareFauxExternalSceneFromScene:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "Cannot prepare faux external scene. Path is nil.", v2, v3, v4, v5, v6);
}

- (void)_prepareFauxExternalSceneFromScene:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "Cannot prepare faux external scene. No external display configuration identifier.", v2, v3, v4, v5, v6);
}

- (void)_prepareFauxExternalSceneFromScene:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_1BC4B3000, v0, v1, "Cannot prepare faux external scene. Extension instance is nil.", v2, v3, v4, v5, v6);
}

void __81__PBUIPosterVariantViewController__prepareFauxExternalSceneFromScene_completion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_1BC4B3000, v2, v3, "Failed to boot up extension instance for faux external scene preparation: %@", v4, v5, v6, v7, v8);
}

void __61__PBUIPosterVariantViewController__snapshotScene_completion___block_invoke_4_cold_1(uint64_t a1)
{
  PBUIStringForWallpaperVariant([*(id *)(a1 + 40) variant]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v9 = *(void **)(a1 + 48);
  if (v9)
  {
    uint64_t v10 = [v9 descriptionWithMultilinePrefix:0];
  }
  else
  {
    uint64_t v10 = @"None";
  }
  OUTLINED_FUNCTION_1_4(&dword_1BC4B3000, v2, v3, "[%{public}@] Snapshot capture failed. Error=%@", v4, v5, v6, v7, 2u);
  if (v9) {
}
  }

- (void)snapshotSource:failedToReadSnapshotAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = PBUIStringForWallpaperVariant([v1 variant]);
  uint64_t v3 = [v0 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_4(&dword_1BC4B3000, v4, v5, "[%{public}@] Existing snapshot failed to be read. Requesting new one. error=%@", v6, v7, v8, v9, v10);
}

- (void)snapshotSource:failedToReadColorStatisticsAtURL:error:.cold.1()
{
  OUTLINED_FUNCTION_11();
  uint64_t v2 = PBUIStringForWallpaperVariant([v1 variant]);
  uint64_t v3 = [v0 descriptionWithMultilinePrefix:0];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_4(&dword_1BC4B3000, v4, v5, "[%{public}@] Existing snapshot color attributes failed to be read. Requesting a new one. error=%@", v6, v7, v8, v9, v10);
}

- (void)_fetchPosterPreferredProminentColor
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1BC4B3000, v0, OS_LOG_TYPE_ERROR, "Unable to load  home screen configuration: %{public}@", v1, 0xCu);
}

- (void)_handleUpdateProminentPosterDerivedColor:posterPreferredProminentColor:timeColor:fallbackColor:.cold.1()
{
  os_log_t v0 = PBUIStringForWallpaperVariant(1);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_4(&dword_1BC4B3000, v1, v2, "[%{public}@] error updating POSTER PREFERRED PROMINENT COLOR: %{public}@", v3, v4, v5, v6, v7);
}

@end