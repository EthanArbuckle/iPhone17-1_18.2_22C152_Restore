@interface PBUIPosterLockViewController
- (BOOL)updatePresentation;
- (id)portalSourceForReplicaView:(id)a3;
- (id)registerPortalSourceObserver:(id)a3;
- (int64_t)variant;
- (void)_updateFloatingLayer;
- (void)invalidate;
- (void)legibilitySettingsDidChange;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)validateSnapshottingPreconditionsForSettings:(id)a3 result:(id)a4;
@end

@implementation PBUIPosterLockViewController

- (int64_t)variant
{
  return 0;
}

- (void)validateSnapshottingPreconditionsForSettings:(id)a3 result:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_msgSend(v11, "pr_unlockProgress");
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    v7 = [v6 externalDisplayConfiguration];
    v8 = [(PBUIPosterVariantViewController *)self _externalDisplayConfiguration];
    [v6 appendPreconditionResultFailureWithFormat:@"Lock variant needs to be fully locked (%@/%@)", v7, v8];
  }
  if (([v6 isSnapshottingForExternalDisplayHostedWallpaper] & 1) == 0
    && objc_msgSend(v11, "pr_adjustedLuminance") != 2)
  {
    uint64_t v9 = soft_PF_IS_PAD_DEVICE();
    v10 = MEMORY[0x1C1871860](v9);
    [v6 appendPreconditionResultFailureWithFormat:@"Lock variant needs screen to be on (IS_PAD %@)", v10];
  }
}

- (BOOL)updatePresentation
{
  sceneView = self->super._sceneView;
  if (!sceneView)
  {
    v4 = self->super._contentContainer;
    v5 = [(UIScenePresenter *)self->super._presenter presentationView];
    id v6 = self->super._sceneView;
    self->super._sceneView = v5;

    v7 = self->super._sceneView;
    [(UIView *)v4 bounds];
    -[UIScenePresentation setFrame:](v7, "setFrame:");
    [(UIScenePresentation *)self->super._sceneView setAutoresizingMask:18];
    [(UIView *)v4 insertSubview:self->super._sceneView atIndex:0];
    v8 = [PBUIPosterFloatingView alloc];
    [(UIView *)v4 bounds];
    uint64_t v9 = -[PBUIPosterFloatingView initWithFrame:](v8, "initWithFrame:");
    realFloatingView = self->_realFloatingView;
    self->_realFloatingView = v9;

    [(PBUIPosterFloatingView *)self->_realFloatingView setAutoresizingMask:18];
    id v11 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(UIView *)v4 bounds];
    v12 = objc_msgSend(v11, "initWithFrame:");
    [v12 setAutoresizingMask:18];
    [v12 addSubview:self->_realFloatingView];
    [(UIView *)v4 insertSubview:v12 atIndex:1];
    v13 = [PBUIPosterFloatingLayerReplica alloc];
    [(UIView *)v4 bounds];
    v14 = -[PBUIPosterFloatingLayerReplica initWithFrame:](v13, "initWithFrame:");
    floatingLayerStandIn = self->_floatingLayerStandIn;
    self->_floatingLayerStandIn = v14;

    [(PBUIPosterFloatingLayerReplica *)self->_floatingLayerStandIn setFloatingLayerStandin:0];
    if (soft_PUIFeatureEnabled(1) && (soft_PUIDynamicRotationIsActive() & 1) == 0) {
      [(PBUIPosterFloatingLayerReplica *)self->_floatingLayerStandIn setAutoresizingMask:18];
    }
    [(UIView *)v4 insertSubview:self->_floatingLayerStandIn atIndex:2];
    [(PBUIPosterFloatingView *)self->_realFloatingView setDefaultFloatingLayerStandin:self->_floatingLayerStandIn];
    [(PBUIPortalReplicaView *)self->_floatingLayerStandIn setProvider:self];
    v16 = [(PBUIPortalReplicaView *)self->_floatingLayerStandIn debugView];

    if (v16)
    {
      v17 = [(PBUIPortalReplicaView *)self->_floatingLayerStandIn debugView];
      v18 = [MEMORY[0x1E4F428B8] whiteColor];
      v19 = [v18 colorWithAlphaComponent:0.35];
      [v17 setColor:v19];
    }
    [(PBUIPortalReplicaView *)self->_floatingLayerStandIn setReason:@"FloatingLayer default standin"];
  }
  return sceneView == 0;
}

- (void)invalidate
{
  [(UIScenePresenter *)self->_floatingPresenter invalidate];
  floatingPresenter = self->_floatingPresenter;
  self->_floatingPresenter = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBUIPosterLockViewController;
  [(PBUIPosterVariantViewController *)&v4 invalidate];
}

- (void)_updateFloatingLayer
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(FBScene *)self->super._scene layerManager];
  objc_super v4 = [v3 layers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v8 level];
        double v10 = v9;
        if ([v8 type] == 1 && v10 == 1000.0)
        {
          LODWORD(v5) = [v8 contextID];
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (v5 != self->_floatingContextID)
  {
    self->_floatingContextID = v5;
    [(UIScenePresenter *)self->_floatingPresenter invalidate];
    floatingPresenter = self->_floatingPresenter;
    self->_floatingPresenter = 0;

    if (self->_floatingContextID)
    {
      v12 = NSString;
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [v12 stringWithFormat:@"%@-floating", v14];

      v16 = [MEMORY[0x1E4F42D70] targetForContextID:self->_floatingContextID];
      v17 = [(FBScene *)self->super._scene uiPresentationManager];
      v18 = [v17 createPresenterForLayerTarget:v16 identifier:v15 priority:100];
      v19 = self->_floatingPresenter;
      self->_floatingPresenter = v18;

      [(UIScenePresenter *)self->_floatingPresenter modifyPresentationContext:&__block_literal_global_149];
      [(UIScenePresenter *)self->_floatingPresenter activate];
      realFloatingView = self->_realFloatingView;
      v21 = [(UIScenePresenter *)self->_floatingPresenter presentationView];
      [(PBUIPosterFloatingView *)realFloatingView addSubview:v21];
    }
  }
}

void __52__PBUIPosterLockViewController__updateFloatingLayer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setClippingDisabled:1];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)PBUIPosterLockViewController;
  id v10 = a4;
  id v11 = a3;
  [(PBUIPosterVariantViewController *)&v15 scene:v11 didUpdateClientSettingsWithDiff:v10 oldClientSettings:a5 transitionContext:a6];
  id v12 = objc_alloc_init(MEMORY[0x1E4F62478]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__PBUIPosterLockViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
  v14[3] = &unk_1E62B2848;
  v14[4] = self;
  [v12 observeLayersWithBlock:v14];
  uint64_t v13 = [v11 clientSettings];

  [v12 inspectDiff:v10 withContext:v13];
  [v12 removeAllObservers];
}

uint64_t __106__PBUIPosterLockViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFloatingLayer];
}

- (id)registerPortalSourceObserver:(id)a3
{
  return [(PBUIFixedReplicaSourceProvider *)self->super._portalProvider registerPortalSourceObserver:a3];
}

- (void)legibilitySettingsDidChange
{
  realFloatingView = self->_realFloatingView;
  objc_super v4 = [(PBUIPosterVariantViewController *)self legibilitySettings];
  [(PBUIPosterFloatingView *)realFloatingView setLegibilitySettings:v4];

  v5.receiver = self;
  v5.super_class = (Class)PBUIPosterLockViewController;
  [(PBUIPosterVariantViewController *)&v5 legibilitySettingsDidChange];
}

- (id)portalSourceForReplicaView:(id)a3
{
  objc_super v4 = (PBUIPosterFloatingLayerReplica *)a3;
  if (self->_floatingLayerStandIn == v4
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([(FBScene *)self->super._scene settings],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_msgSend(v5, "pr_isDepthEffectDisallowed"),
        v5,
        (v6 & 1) == 0))
  {
    v7 = self->_realFloatingView;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingLayerStandIn, 0);
  objc_storeStrong((id *)&self->_realFloatingView, 0);
  objc_storeStrong((id *)&self->_floatingPresenter, 0);
}

@end