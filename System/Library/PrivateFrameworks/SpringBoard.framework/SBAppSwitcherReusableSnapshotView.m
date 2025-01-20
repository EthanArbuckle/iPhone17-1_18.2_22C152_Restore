@interface SBAppSwitcherReusableSnapshotView
- (BOOL)_doNonUniformScalingForApplication:(id)a3;
- (BOOL)_isAnimatingTransitionForRole:(int64_t)a3;
- (BOOL)_isSnapshotSuspendSnapshot:(id)a3;
- (BOOL)contentRequiresGroupOpacity;
- (BOOL)hasSceneOverlayView;
- (BOOL)isActive;
- (BOOL)isVisible;
- (BOOL)shouldUseBrightMaterial;
- (CGRect)_frameForBackstopLayer;
- (CGRect)_frameInLayoutSpaceForRole:(int64_t)a3 inAppLayout:(id)a4 inOrientation:(int64_t)a5;
- (CGRect)_snapshotImageFrameForCacheEntry:(id)a3;
- (NSString)description;
- (SBAppLayout)appLayout;
- (SBAppSwitcherReusableSnapshotView)initWithDelegate:(id)a3 snapshotCache:(id)a4 lockoutVCProvider:(id)a5 appClipOverlayCoordinator:(id)a6 containerViewController:(id)a7;
- (id)_allImageViews;
- (id)_applicationForRole:(int64_t)a3;
- (id)_cacheEntryForRole:(int64_t)a3;
- (id)_imageViewForRole:(int64_t)a3;
- (id)_orientationWrapperForRole:(int64_t)a3;
- (id)_sceneHandleForRole:(int64_t)a3;
- (id)_separatorViewBezierPathWithWidth:(double)a3 height:(double)a4;
- (int64_t)_contentOrientationForSnapshotCacheEntry:(id)a3;
- (void)_addAppClipOverlayForRole:(int64_t)a3 bundleIdentifier:(id)a4 sceneIdentifier:(id)a5;
- (void)_addAppLockoutOverlayIfNecessaryForRole:(int64_t)a3;
- (void)_addAppProtectionShieldIfNeededForRole:(int64_t)a3;
- (void)_addOrRemoveAppProtectionShieldForApplication:(id)a3 role:(int64_t)a4;
- (void)_addOverlayViewController:(id)a3 toOrientationWrapperForRole:(int64_t)a4;
- (void)_configureSnapshotImageView:(id)a3 cacheEntry:(id)a4;
- (void)_handleInstalledAppsChanged:(id)a3;
- (void)_performDeferredSnapshotUpdatesIfNecessaryForRole:(int64_t)a3;
- (void)_removeAppClipOverlayForRole:(int64_t)a3;
- (void)_removeAppLockoutOverlayForRole:(int64_t)a3;
- (void)_removeAppProtectionShieldForRole:(int64_t)a3;
- (void)_requestFreshImages;
- (void)_setAnimatingTransition:(BOOL)a3 forRole:(int64_t)a4;
- (void)_setCacheEntry:(id)a3 forRole:(int64_t)a4;
- (void)_setSceneHandle:(id)a3 forRole:(int64_t)a4;
- (void)_updateContentOrientationForRole:(int64_t)a3;
- (void)_updateCornerRadius;
- (void)_updateCornerRadiusIfNecessaryForOverlayView:(id)a3 matchingSnapshotImage:(id)a4;
- (void)_updateCornerRadiusIfNecessaryForSnapshotImageView:(id)a3 cacheEntry:(id)a4;
- (void)_updateDivider;
- (void)_updateSceneHandleForRole:(int64_t)a3;
- (void)_updateToNewSnapshotImageUsingCacheEntry:(id)a3;
- (void)_updateTranslucency;
- (void)_windowManagementStyleDidChange:(id)a3;
- (void)appProtectionAssistantShouldShieldDidChange:(id)a3;
- (void)dealloc;
- (void)didUpdateCacheEntry:(id)a3;
- (void)invalidate;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActive:(BOOL)a3;
- (void)setAppLayout:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setShouldStretchToBounds:(BOOL)a3;
- (void)setShouldUseBrightMaterial:(BOOL)a3;
- (void)setShowingIconOverlayView:(BOOL)a3;
- (void)setUsesNonuniformScaling:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWallpaperStyle:(int64_t)a3;
@end

@implementation SBAppSwitcherReusableSnapshotView

void __51__SBAppSwitcherReusableSnapshotView__allImageViews__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _imageViewForRole:a2];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    v3 = v4;
  }
}

- (void)setShouldUseBrightMaterial:(BOOL)a3
{
  if (self->_shouldUseBrightMaterial != a3)
  {
    self->_shouldUseBrightMaterial = a3;
    [(SBAppSwitcherReusableSnapshotView *)self _updateTranslucency];
  }
}

- (void)setUsesNonuniformScaling:(BOOL)a3
{
  if (self->_usesNonuniformScaling != a3)
  {
    BOOL v3 = a3;
    self->_usesNonuniformScaling = a3;
    -[SBSwitcherSnapshotImageView setUsesNonuniformScaling:](self->_firstImageView, "setUsesNonuniformScaling:");
    [(SBSwitcherSnapshotImageView *)self->_secondImageView setUsesNonuniformScaling:v3];
    thirdImageView = self->_thirdImageView;
    [(SBSwitcherSnapshotImageView *)thirdImageView setUsesNonuniformScaling:v3];
  }
}

- (void)setShouldStretchToBounds:(BOOL)a3
{
  if (self->_shouldStretchToBounds != a3)
  {
    self->_BOOL shouldStretchToBounds = a3;
    -[SBSwitcherSnapshotImageView setStretchToFillBounds:](self->_firstImageView, "setStretchToFillBounds:");
    [(SBSwitcherSnapshotImageView *)self->_secondImageView setStretchToFillBounds:self->_shouldStretchToBounds];
    thirdImageView = self->_thirdImageView;
    BOOL shouldStretchToBounds = self->_shouldStretchToBounds;
    [(SBSwitcherSnapshotImageView *)thirdImageView setStretchToFillBounds:shouldStretchToBounds];
  }
}

void __56__SBAppSwitcherReusableSnapshotView__requestFreshImages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (SBLayoutRoleIsValidForSplitView(a2) || a2 == 4)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 576));
    [v6 addSnapshotUpdateObserver:WeakRetained forDisplayItem:v7 inAppLayout:*(void *)(a1 + 40)];
  }
}

- (void)setAppLayout:(id)a3
{
  id v6 = a3;
  p_appLayout = &self->_appLayout;
  if (([v6 isEqual:self->_appLayout] & 1) == 0)
  {
    if (v6)
    {
      if (*p_appLayout)
      {
        v8 = [v6 allItems];
        v9 = [(SBAppLayout *)*p_appLayout allItems];
        char v10 = [v8 isEqualToArray:v9];

        if ((v10 & 1) == 0)
        {
          v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherReusableSnapshotView.m" lineNumber:217 description:@"Does not support setting new appLayout without recycling first (unless both app layouts have the same items)."];
        }
      }
    }
    objc_storeStrong((id *)&self->_appLayout, a3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__SBAppSwitcherReusableSnapshotView_setAppLayout___block_invoke;
    v12[3] = &unk_1E6AF8788;
    v12[4] = self;
    SBSnapshotViewEnumerateSupportedRoles(v12);
    [(SBAppSwitcherReusableSnapshotView *)self _requestFreshImages];
  }
}

- (void)_requestFreshImages
{
  objc_initWeak(&location, self);
  BOOL v3 = self->_appLayout;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SBAppSwitcherReusableSnapshotView__requestFreshImages__block_invoke;
  v5[3] = &unk_1E6B0CCA8;
  objc_copyWeak(&v7, &location);
  v5[4] = self;
  v4 = v3;
  id v6 = v4;
  [(SBAppLayout *)v4 enumerate:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    BOOL v3 = a3;
    self->_visible = a3;
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (v3)
    {
      [(SBAppSwitcherReusableSnapshotView *)self _updateTranslucency];
      [v5 addObserver:self selector:sel__handleInstalledAppsChanged_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__SBAppSwitcherReusableSnapshotView_setVisible___block_invoke;
    v7[3] = &unk_1E6B0CC80;
    BOOL v8 = v3;
    v7[4] = self;
    SBSnapshotViewEnumerateSupportedRoles(v7);
  }
}

void __51__SBAppSwitcherReusableSnapshotView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  id v32 = [*(id *)(a1 + 32) _cacheEntryForRole:a2];
  objc_msgSend(*(id *)(a1 + 32), "_snapshotImageFrameForCacheEntry:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [*(id *)(a1 + 32) _orientationWrapperForRole:a2];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  v13 = [*(id *)(a1 + 32) _sceneHandleForRole:a2];
  if ([v13 _supportsMixedOrientation])
  {
    v14 = [v32 snapshot];
    uint64_t v15 = [v14 interfaceOrientation];
    uint64_t v16 = [*(id *)(a1 + 32) orientation];

    if (v15 != v16)
    {
      [*(id *)(a1 + 32) center];
      objc_msgSend(v12, "setCenter:");
    }
  }
  else
  {
  }
  v17 = [*(id *)(a1 + 32) _imageViewForRole:a2];
  if (a2 != 1) {
    [v17 setHidden:v32 == 0];
  }
  v18 = *(void **)(a1 + 32);
  v19 = [v18 _applicationForRole:a2];
  LODWORD(v18) = [v18 _doNonUniformScalingForApplication:v19];

  if (v18)
  {
    [v17 setStretchToFillBounds:1];
    [v17 setUsesNonuniformScaling:1];
  }
  [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForSnapshotImageView:v17 cacheEntry:v32];
  v20 = *(void **)(*(void *)(a1 + 32) + 600);
  v21 = [NSNumber numberWithInteger:a2];
  v22 = [v20 objectForKeyedSubscript:v21];
  v23 = [v22 view];

  [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForOverlayView:v23 matchingSnapshotImage:v17];
  v24 = *(void **)(*(void *)(a1 + 32) + 544);
  v25 = [NSNumber numberWithInteger:a2];
  v26 = [v24 objectForKeyedSubscript:v25];
  v27 = [v26 view];

  if (v27)
  {
    [v12 bringContentSubviewToFront:v27];
    [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForOverlayView:v27 matchingSnapshotImage:v17];
  }
  v28 = *(void **)(*(void *)(a1 + 32) + 552);
  v29 = [NSNumber numberWithInteger:a2];
  v30 = [v28 objectForKeyedSubscript:v29];
  v31 = [v30 view];

  [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForOverlayView:v31 matchingSnapshotImage:v17];
}

- (id)_applicationForRole:(int64_t)a3
{
  BOOL v3 = [(SBAppSwitcherReusableSnapshotView *)self _sceneHandleForRole:a3];
  double v4 = [v3 application];

  return v4;
}

- (id)_sceneHandleForRole:(int64_t)a3
{
  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  double v4 = [NSNumber numberWithInteger:a3];
  double v5 = [(NSMutableDictionary *)snapshotViewStateByRole objectForKey:v4];
  double v6 = v5;
  if (v5) {
    double v5 = (void *)v5[2];
  }
  double v7 = v5;

  return v7;
}

void __56__SBAppSwitcherReusableSnapshotView__updateCornerRadius__block_invoke(uint64_t a1, uint64_t a2)
{
  id v18 = [*(id *)(a1 + 32) _imageViewForRole:a2];
  double v4 = *(void **)(*(void *)(a1 + 32) + 544);
  double v5 = [NSNumber numberWithInteger:a2];
  double v6 = [v4 objectForKeyedSubscript:v5];
  double v7 = [v6 view];

  double v8 = *(void **)(a1 + 32);
  double v9 = [v8 _cacheEntryForRole:a2];
  [v8 _updateCornerRadiusIfNecessaryForSnapshotImageView:v18 cacheEntry:v9];

  [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForOverlayView:v7 matchingSnapshotImage:v18];
  double v10 = *(void **)(*(void *)(a1 + 32) + 600);
  double v11 = [NSNumber numberWithInteger:a2];
  v12 = [v10 objectForKeyedSubscript:v11];
  v13 = [v12 view];

  [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForOverlayView:v13 matchingSnapshotImage:v18];
  v14 = *(void **)(*(void *)(a1 + 32) + 552);
  uint64_t v15 = [NSNumber numberWithInteger:a2];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];
  v17 = [v16 view];

  [*(id *)(a1 + 32) _updateCornerRadiusIfNecessaryForOverlayView:v17 matchingSnapshotImage:v18];
}

- (id)_imageViewForRole:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      BOOL v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__firstImageView;
LABEL_7:
      id v4 = *(id *)((char *)&self->super.super.super.super.isa + *v3);
      goto LABEL_8;
    case 2:
      BOOL v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__secondImageView;
      goto LABEL_7;
    case 4:
      BOOL v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__thirdImageView;
      goto LABEL_7;
  }
  id v4 = 0;
LABEL_8:
  return v4;
}

- (void)_updateCornerRadiusIfNecessaryForSnapshotImageView:(id)a3 cacheEntry:(id)a4
{
  id v26 = a3;
  id v7 = a4;
  if (v26 && v7)
  {
    double v8 = -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", [v7 role]);
    double v9 = [v7 snapshot];
    BOOL v10 = [(SBAppSwitcherReusableSnapshotView *)self _isSnapshotSuspendSnapshot:v9];

    if (![v8 isClassic]
      || ([v8 classicAppFullScreen] & 1) != 0
      || self->_isChamoisWindowingEnabled)
    {
      [(SBSwitcherWallpaperPageContentView *)self cornerRadius];
LABEL_7:
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    if (v10)
    {
      uint64_t v11 = 0;
    }
    else
    {
      if ([v8 classicAppNonFullScreenWithHomeAffordance]
        && [v8 classicAppWithRoundedCorners])
      {
        SBScreenDisplayCornerRadius();
        goto LABEL_7;
      }
      if ([v8 classicAppNonFullScreenWithHomeAffordance]
        && ([v8 classicAppPhoneAppRunningOnPad] & 1) == 0)
      {
        v23 = [v7 snapshot];
        uint64_t v11 = [v23 interfaceOrientation];
      }
      else
      {
        uint64_t v11 = 0;
        [v8 classicAppPhoneAppRunningOnPad];
      }
    }
LABEL_8:
    objc_msgSend(v26, "setCornerRadius:");
    v12 = [v7 appLayout];
    uint64_t v13 = 2;
    v14 = [v12 itemForLayoutRole:2];

    if (!v14)
    {
      uint64_t v18 = 15;
LABEL_25:
      [v26 setMaskedCorners:v18];
      objc_msgSend(v26, "setAllowStatusBarToOverlap:", objc_msgSend(v8, "includesStatusBarInClassicJailForInterfaceOrientation:", v11));
      [v26 setOrientationForClassicLayout:v11];

      goto LABEL_26;
    }
    uint64_t v15 = (id *)MEMORY[0x1E4F43630];
    uint64_t v16 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v16 == 1)
    {
      v17 = [v7 displayItem];
      id v4 = [v7 appLayout];
      uint64_t v13 = [v4 itemForLayoutRole:2];
      if ([v17 isEqual:v13])
      {

LABEL_24:
        uint64_t v18 = 5;
        goto LABEL_25;
      }
      if ([*v15 userInterfaceLayoutDirection] == 1)
      {

LABEL_22:
        uint64_t v18 = 10;
        goto LABEL_25;
      }
      v24 = v17;
    }
    else if ([*v15 userInterfaceLayoutDirection] == 1)
    {
      goto LABEL_22;
    }
    v19 = objc_msgSend(v7, "displayItem", v24);
    v20 = [v7 appLayout];
    v21 = [v20 itemForLayoutRole:1];
    int v22 = [v19 isEqual:v21];

    if (v16 == 1)
    {

      if (v22) {
        goto LABEL_24;
      }
    }
    else if (v22)
    {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
LABEL_26:
}

- (BOOL)_doNonUniformScalingForApplication:(id)a3
{
  id v3 = a3;
  char v4 = 0;
  uint64_t v5 = SBFEffectiveArtworkSubtype();
  if (v5 <= 2795)
  {
    if (v5 != 2556 && v5 != 2622) {
      goto LABEL_10;
    }
LABEL_7:
    if ([v3 classicAppScaled]) {
      char v4 = [v3 classicAppFullScreen];
    }
    else {
      char v4 = 0;
    }
    goto LABEL_10;
  }
  if (v5 == 2868 || v5 == 2796) {
    goto LABEL_7;
  }
LABEL_10:

  return v4;
}

- (void)_updateCornerRadiusIfNecessaryForOverlayView:(id)a3 matchingSnapshotImage:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (v9)
  {
    [v5 cornerRadius];
    objc_msgSend(v9, "_setContinuousCornerRadius:");
    double v6 = [v9 layer];
    uint64_t v7 = [v5 maskedCorners];
    double v8 = v6;
  }
  else
  {
    [0 _setContinuousCornerRadius:0.0];
    double v8 = [0 layer];
    double v6 = v8;
    uint64_t v7 = 0;
  }
  [v8 setMaskedCorners:v7];
}

- (void)_updateCornerRadius
{
  v7.receiver = self;
  v7.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  [(SBSwitcherWallpaperPageContentView *)&v7 _updateCornerRadius];
  [(SBSwitcherWallpaperPageContentView *)self cornerRadius];
  -[SBAppSwitcherReusableSnapshotView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  id v3 = [(SBAppSwitcherReusableSnapshotView *)self layer];
  objc_msgSend(v3, "setMaskedCorners:", -[SBSwitcherWallpaperPageContentView maskedCorners](self, "maskedCorners"));

  char v4 = [(UIView *)self->_solidColorBackstopView layer];
  [(SBSwitcherWallpaperPageContentView *)self cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");

  id v5 = [(UIView *)self->_solidColorBackstopView layer];
  objc_msgSend(v5, "setMaskedCorners:", -[SBSwitcherWallpaperPageContentView maskedCorners](self, "maskedCorners"));

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SBAppSwitcherReusableSnapshotView__updateCornerRadius__block_invoke;
  v6[3] = &unk_1E6AF8788;
  v6[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v6);
}

- (CGRect)_snapshotImageFrameForCacheEntry:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4F42D90];
  id v5 = a3;
  double v6 = [v4 mainScreen];
  [v6 _referenceBounds];
  double v68 = v7;
  double v9 = v8;
  double v11 = v10;
  double v70 = v12;

  uint64_t v13 = [v5 snapshot];
  [v13 contentFrame];
  double v15 = v14;
  double v17 = v16;
  int64_t v18 = [(SBSwitcherWallpaperPageContentView *)self orientation];
  uint64_t v19 = [v13 interfaceOrientation];
  v20 = -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:", [v5 role]);
  BOOL v21 = [(SBAppSwitcherReusableSnapshotView *)self _isSnapshotSuspendSnapshot:v13];
  int v22 = [v20 classicAppPhoneAppRunningOnPad];
  v23 = [v5 appLayout];
  v24 = [v5 displayItem];

  -[SBAppSwitcherReusableSnapshotView _frameInLayoutSpaceForRole:inAppLayout:inOrientation:](self, "_frameInLayoutSpaceForRole:inAppLayout:inOrientation:", [v23 layoutRoleForItem:v24], v23, -[SBSwitcherWallpaperPageContentView orientation](self, "orientation"));
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  BOOL isChamoisWindowingEnabled = self->_isChamoisWindowingEnabled;
  BOOL v34 = [(SBAppSwitcherReusableSnapshotView *)self _doNonUniformScalingForApplication:v20];
  if (v21 || isChamoisWindowingEnabled || v34 || ![v20 isClassic]) {
    goto LABEL_24;
  }
  double v65 = v28;
  double v66 = v30;
  double v67 = v32;
  long long v71 = SBUICUnitScaleFactor;
  objc_msgSend(v20, "snapshotFrameForClassicInsideBounds:forOrientation:scaleFactor:inReferenceSpace:", v18, &v71, 1, v68, v9, v11, v70);
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  if (v22 && [v20 classicAppZoomedInOrRequiresHiDPI])
  {
    *(void *)&long long v71 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(v19, v15, v17);
    *((void *)&v71 + 1) = v71;
  }
  SBUICScaledRectWithOffset();
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v69 = v49;
  v72.origin.x = v36;
  v72.origin.y = v38;
  v72.size.width = v40;
  v72.size.height = v42;
  double v50 = CGRectGetMinX(v72) + v44;
  v73.origin.x = v36;
  v73.origin.y = v38;
  v73.size.width = v40;
  v73.size.height = v42;
  double v51 = v46 + CGRectGetMinY(v73);
  if (v18 == 1)
  {
    if ((unint64_t)(v19 - 3) < 2) {
      char v52 = v22;
    }
    else {
      char v52 = 0;
    }
    double v53 = v65;
    if ((v52 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_16:
    _UIWindowConvertRectFromOrientationToOrientation();
    double v50 = v54;
    double v51 = v55;
    double v48 = v56;
    double v58 = v57;
    double v60 = v66;
    double v59 = v67;
    goto LABEL_18;
  }
  double v53 = v65;
  if (!v22 || (unint64_t)(v19 - 3) <= 1) {
    goto LABEL_16;
  }
LABEL_17:
  double v60 = v66;
  double v59 = v67;
  double v58 = v69;
LABEL_18:
  if (!CGFloatIsValid()
    || !CGFloatIsValid()
    || !CGFloatIsValid()
    || (CGFloatIsValid() & 1) == 0)
  {
    double v58 = v59;
    double v48 = v60;
    double v51 = v53;
    double v50 = v26;
  }
  double v32 = v58;
  double v30 = v48;
  double v28 = v51;
  double v26 = v50;
LABEL_24:

  double v61 = v26;
  double v62 = v28;
  double v63 = v30;
  double v64 = v32;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (id)_orientationWrapperForRole:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__firstOrientationWrapper;
LABEL_7:
      id v4 = *(id *)((char *)&self->super.super.super.super.isa + *v3);
      goto LABEL_8;
    case 2:
      id v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__secondOrientationWrapper;
      goto LABEL_7;
    case 4:
      id v3 = &OBJC_IVAR___SBAppSwitcherReusableSnapshotView__thirdOrientationWrapper;
      goto LABEL_7;
  }
  id v4 = 0;
LABEL_8:
  return v4;
}

- (BOOL)_isSnapshotSuspendSnapshot:(id)a3
{
  id v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"SBSuspendSnapshot"];

  return v4;
}

- (CGRect)_frameInLayoutSpaceForRole:(int64_t)a3 inAppLayout:(id)a4 inOrientation:(int64_t)a5
{
  p_delegate = &self->_delegate;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained layoutFrameForItemWithRole:a3 inAppLayout:v9 interfaceOrientation:a5 forSnapshotView:self];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_updateTranslucency
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBAppSwitcherReusableSnapshotView *)self _imageViewForRole:1];
  char v4 = [v3 image];

  id v5 = [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:2];
  if (v5)
  {
    double v6 = [(SBAppSwitcherReusableSnapshotView *)self _imageViewForRole:2];
    double v7 = [v6 image];
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  id v9 = [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:4];
  if (v9)
  {
    double v10 = [(SBAppSwitcherReusableSnapshotView *)self _imageViewForRole:4];
    double v11 = [v10 image];
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  BOOL v13 = [(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:128];
  uint64_t v14 = [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:1];
  if (!v14) {
    goto LABEL_62;
  }
  double v15 = (void *)v14;
  [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:1];
  double v45 = v4;
  v17 = BOOL v16 = v8;
  [v17 snapshot];
  v19 = BOOL v18 = v12;
  double v20 = (void *)[v19 backgroundStyle];

  BOOL v12 = v18;
  BOOL v8 = v16;
  char v4 = v45;

  if (!v20)
  {
LABEL_62:
    double v20 = [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:2];

    if (v20)
    {
      double v21 = [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:2];
      double v22 = [v21 snapshot];
      double v20 = (void *)[v22 backgroundStyle];
    }
  }
  v23 = [(SBAppSwitcherReusableSnapshotView *)self _applicationForRole:1];
  int v24 = [v23 isClassic];
  if (v4) {
    int v25 = v8;
  }
  else {
    int v25 = 1;
  }
  int v26 = (v20 != 0) & ~(v25 | v12) & !v13;
  if (v4) {
    int v27 = v13;
  }
  else {
    int v27 = 1;
  }
  if (v27 == 1)
  {
    if ([v23 classicAppPhoneAppRunningOnPad]) {
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else {
    double v29 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    }
    goto LABEL_31;
  }
  if ((v26 ^ 1 | v24) != 1 || (v24 | v8 | v12) == 0)
  {
LABEL_34:
    [(UIView *)self->_solidColorBackstopView setHidden:1];
    if (!v26) {
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  double v29 = [MEMORY[0x1E4F428B8] blackColor];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_31;
    }
LABEL_56:
    if (self->_shouldUseBrightMaterial) {
      [MEMORY[0x1E4F428B8] systemMidGrayColor];
    }
    else {
    uint64_t v44 = [MEMORY[0x1E4F428B8] blackColor];
    }

    double v29 = (void *)v44;
    goto LABEL_31;
  }
  CGFloat v42 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v42 userInterfaceIdiom])
  {

    goto LABEL_31;
  }
  uint64_t v43 = SBFEffectiveHomeButtonType();

  if (v43 == 2) {
    goto LABEL_56;
  }
LABEL_31:
  if (!v29) {
    goto LABEL_34;
  }
  [(UIView *)self->_solidColorBackstopView setHidden:0];
  [(UIView *)self->_solidColorBackstopView setBackgroundColor:v29];

  if (!v26)
  {
LABEL_33:
    uint64_t v30 = 1;
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v30 = _WallpaperStyleForBackgroundStyle();
LABEL_36:
  [(SBAppSwitcherReusableSnapshotView *)self setWallpaperStyle:v30];
  BOOL v31 = [(SBAppSwitcherReusableSnapshotView *)self contentRequiresGroupOpacity];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  double v32 = [(SBAppSwitcherReusableSnapshotView *)self _allImageViews];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(v32);
        }
        double v37 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v37 setHasOpaqueContents:v31 ^ 1];
        if (__sb__runningInSpringBoard())
        {
          if (SBFEffectiveDeviceClass() == 2)
          {
            CGFloat v38 = v37;
            BOOL v39 = 0;
          }
          else
          {
            CGFloat v38 = v37;
            BOOL v39 = v31;
          }
          [v38 setAllowsEdgeAntialiasing:v39];
        }
        else
        {
          CGFloat v40 = [MEMORY[0x1E4F42948] currentDevice];
          BOOL v41 = [v40 userInterfaceIdiom] != 1 && v31;
          [v37 setAllowsEdgeAntialiasing:v41];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v34);
  }
}

- (id)_cacheEntryForRole:(int64_t)a3
{
  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  char v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)snapshotViewStateByRole objectForKey:v4];
  double v6 = v5;
  if (v5) {
    id v5 = (void *)v5[3];
  }
  double v7 = v5;

  return v7;
}

- (void)_configureSnapshotImageView:(id)a3 cacheEntry:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    id v7 = a4;
    BOOL v8 = -[SBAppSwitcherReusableSnapshotView _sceneHandleForRole:](self, "_sceneHandleForRole:", [v7 role]);
    [(SBAppSwitcherReusableSnapshotView *)self _updateCornerRadiusIfNecessaryForSnapshotImageView:v10 cacheEntry:v7];

    if ([(SBSwitcherWallpaperPageContentView *)self wallpaperStyle] == 1) {
      uint64_t v9 = [v8 isTranslucent] ^ 1;
    }
    else {
      uint64_t v9 = 0;
    }
    [v10 setHasOpaqueContents:v9];

    id v6 = v10;
  }
}

- (void)setWallpaperStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  [(SBSwitcherWallpaperPageContentView *)&v5 setWallpaperStyle:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SBAppSwitcherReusableSnapshotView_setWallpaperStyle___block_invoke;
  v4[3] = &unk_1E6AF8788;
  v4[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v4);
}

- (BOOL)contentRequiresGroupOpacity
{
  if ([(SBSwitcherWallpaperPageContentView *)self wallpaperStyle] == 1) {
    return ![(UIView *)self->_solidColorBackstopView isHidden];
  }
  else {
    return 1;
  }
}

- (id)_allImageViews
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBAppSwitcherReusableSnapshotView__allImageViews__block_invoke;
  v8[3] = &unk_1E6B002B8;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  SBSnapshotViewEnumerateSupportedRoles(v8);
  objc_super v5 = v9;
  id v6 = v4;

  return v6;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  [(SBSwitcherWallpaperPageContentView *)&v5 layoutSubviews];
  solidColorBackstopView = self->_solidColorBackstopView;
  [(SBAppSwitcherReusableSnapshotView *)self _frameForBackstopLayer];
  -[UIView setFrame:](solidColorBackstopView, "setFrame:");
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SBAppSwitcherReusableSnapshotView_layoutSubviews__block_invoke;
  v4[3] = &unk_1E6AF8788;
  v4[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v4);
  [(SBAppSwitcherReusableSnapshotView *)self _updateDivider];
}

- (void)_updateDivider
{
  id v38 = [(SBAppSwitcherReusableSnapshotView *)self appLayout];
  id v3 = [v38 itemForLayoutRole:2];

  [(CAShapeLayer *)self->_medusaDividerLayer setHidden:v3 == 0];
  if (v3)
  {
    [(SBAppSwitcherReusableSnapshotView *)self _frameInLayoutSpaceForRole:1 inAppLayout:v38 inOrientation:[(SBSwitcherWallpaperPageContentView *)self orientation]];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(SBAppSwitcherReusableSnapshotView *)self _frameInLayoutSpaceForRole:2 inAppLayout:v38 inOrientation:[(SBSwitcherWallpaperPageContentView *)self orientation]];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = (id *)MEMORY[0x1E4F43630];
    uint64_t v21 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    if (v21 == 1) {
      CGFloat v22 = v13;
    }
    else {
      CGFloat v22 = v5;
    }
    if (v21 == 1) {
      double v23 = v15;
    }
    else {
      double v23 = v7;
    }
    if (v21 == 1) {
      double v24 = v17;
    }
    else {
      double v24 = v9;
    }
    if (v21 == 1) {
      double v25 = v19;
    }
    else {
      double v25 = v11;
    }
    double MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    if ([*v20 userInterfaceLayoutDirection] == 1)
    {
      CGFloat v26 = v5;
      CGFloat v27 = v7;
      CGFloat v28 = v9;
      CGFloat v29 = v11;
    }
    else
    {
      CGFloat v26 = v13;
      CGFloat v27 = v15;
      CGFloat v28 = v17;
      CGFloat v29 = v19;
    }
    double MinX = CGRectGetMinX(*(CGRect *)&v26);
    v40.origin.x = v5;
    v40.origin.y = v7;
    v40.size.width = v9;
    v40.size.height = v11;
    double Height = CGRectGetHeight(v40);
    v41.origin.x = v5;
    v41.origin.y = v7;
    v41.size.width = v9;
    v41.size.height = v11;
    double MinY = CGRectGetMinY(v41);
    uint64_t v33 = [(SBAppSwitcherReusableSnapshotView *)self _separatorViewBezierPathWithWidth:MinX - MaxX height:Height];
    medusaDividerLayer = self->_medusaDividerLayer;
    id v35 = v33;
    -[CAShapeLayer setPath:](medusaDividerLayer, "setPath:", [v35 CGPath]);
    CGFloat v36 = self->_medusaDividerLayer;
    [v35 bounds];
    -[CAShapeLayer setBounds:](v36, "setBounds:");
    -[CAShapeLayer setPosition:](self->_medusaDividerLayer, "setPosition:", (MaxX + MinX) * 0.5, MinY + Height * 0.5);
  }
}

- (CGRect)_frameForBackstopLayer
{
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];

  [(SBAppSwitcherReusableSnapshotView *)self bounds];
  UIRectInset();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

void __48__SBAppSwitcherReusableSnapshotView_setVisible___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 40);
  double v5 = *(void **)(a1 + 32);
  if (v4)
  {
    double v6 = [v5 appLayout];
    double v17 = [v6 itemForLayoutRole:a2];

    double v7 = v17;
    if (v17)
    {
      uint64_t v8 = [v17 type];
      double v7 = v17;
      if (!v8)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 528));
        double v10 = *(void **)(a1 + 32);
        CGFloat v11 = [v10 appLayout];
        LODWORD(v10) = [WeakRetained snapshotView:v10 shouldShowAppClipOverlayForLayout:v11];

        double v7 = v17;
        if (v10)
        {
          double v12 = [v17 bundleIdentifier];
          double v13 = [v17 uniqueIdentifier];
          double v14 = [MEMORY[0x1E4F628D8] storeForApplication:v12];
          double v15 = [v14 sceneStoreForIdentifier:v13 creatingIfNecessary:0];
          double v16 = [v15 objectForKey:@"appClipIdentifier"];
          if ([v16 length]) {
            [*(id *)(a1 + 32) _addAppClipOverlayForRole:a2 bundleIdentifier:v12 sceneIdentifier:v13];
          }

          double v7 = v17;
        }
      }
    }
  }
  else
  {
    [v5 _removeAppClipOverlayForRole:a2];
  }
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setShowingIconOverlayView:(BOOL)a3
{
  if (self->_showingIconOverlayView != a3)
  {
    self->_showingIconOverlayView = a3;
    -[SBAppSwitcherReusableSnapshotView setClipsToBounds:](self, "setClipsToBounds:");
  }
}

void __50__SBAppSwitcherReusableSnapshotView_setAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateSceneHandleForRole:a2];
  id v11 = [*(id *)(a1 + 32) _sceneHandleForRole:a2];
  int v4 = [*(id *)(a1 + 32) _imageViewForRole:a2];
  double v5 = *(void **)(a1 + 32);
  double v6 = [v5 _cacheEntryForRole:a2];
  [v5 _configureSnapshotImageView:v4 cacheEntry:v6];

  double v7 = [v11 application];
  uint64_t v8 = [v7 info];
  int v9 = [v8 isBlockedForScreenTimeExpiration];

  double v10 = *(void **)(a1 + 32);
  if (v9) {
    [v10 _addAppLockoutOverlayIfNecessaryForRole:a2];
  }
  else {
    [v10 _removeAppLockoutOverlayForRole:a2];
  }
  [*(id *)(a1 + 32) _addOrRemoveAppProtectionShieldForApplication:v7 role:a2];
}

void __55__SBAppSwitcherReusableSnapshotView_setWallpaperStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) _imageViewForRole:a2];
  int v4 = *(void **)(a1 + 32);
  double v5 = [v4 _cacheEntryForRole:a2];
  [v4 _configureSnapshotImageView:v6 cacheEntry:v5];
}

- (void)_updateSceneHandleForRole:(int64_t)a3
{
  double v5 = [(SBAppLayout *)self->_appLayout itemForLayoutRole:"itemForLayoutRole:"];
  id v18 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  if (![v5 type])
  {
    id v6 = +[SBApplicationController sharedInstance];
    uint64_t v8 = [v18 bundleIdentifier];
    double v7 = [v6 applicationWithBundleIdentifier:v8];

    goto LABEL_7;
  }
  if ([v18 type] != 5)
  {
LABEL_5:
    double v7 = 0;
    goto LABEL_8;
  }
  id v6 = +[SBApplicationController sharedInstance];
  double v7 = [v6 webApplication];
LABEL_7:

LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v10 = [WeakRetained sceneHandleProviderForSnapshotView:self];
  id v11 = [WeakRetained displayIdentityForSnapshotView:self];
  if (v7)
  {
    double v12 = [v18 uniqueIdentifier];
    double v13 = [v10 sceneIdentityForApplication:v7 uniqueIdentifier:v12];

    if (v13)
    {
      double v14 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v7 sceneIdentity:v13 displayIdentity:v11];
      uint64_t v15 = objc_opt_class();
      double v16 = [v10 fetchOrCreateApplicationSceneHandleForRequest:v14];
      double v17 = SBSafeCast(v15, v16);

      goto LABEL_13;
    }
  }
  else
  {
    double v13 = 0;
  }
  double v17 = 0;
LABEL_13:
  [(SBAppSwitcherReusableSnapshotView *)self _setSceneHandle:v17 forRole:a3];
}

- (void)_setSceneHandle:(id)a3 forRole:(int64_t)a4
{
  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  id v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithInteger:a4];
  uint64_t v8 = [(NSMutableDictionary *)snapshotViewStateByRole objectForKey:v9];
  -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v8, v7);
}

- (void)_removeAppLockoutOverlayForRole:(int64_t)a3
{
  blockingViewControllerByRole = self->_blockingViewControllerByRole;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)blockingViewControllerByRole objectForKeyedSubscript:v6];

  if (v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__SBAppSwitcherReusableSnapshotView__removeAppLockoutOverlayForRole___block_invoke;
    v8[3] = &unk_1E6AF6FC0;
    id v9 = v7;
    double v10 = self;
    int64_t v11 = a3;
    [v9 hideWithAnimation:0 completionHandler:v8];
  }
}

- (void)_addOrRemoveAppProtectionShieldForApplication:(id)a3 role:(int64_t)a4
{
  id v11 = a3;
  id v6 = [v11 appProtectionAssistant];
  int v7 = [v6 shouldShield];

  if (v7) {
    [(SBAppSwitcherReusableSnapshotView *)self _addAppProtectionShieldIfNeededForRole:a4];
  }
  else {
    [(SBAppSwitcherReusableSnapshotView *)self _removeAppProtectionShieldForRole:a4];
  }
  id v8 = [(SBAppSwitcherReusableSnapshotView *)self _applicationForRole:a4];

  id v9 = v11;
  if (v8 == v11)
  {
    double v10 = [v11 appProtectionAssistant];
    [v10 addObserver:self];

    id v9 = v11;
  }
}

- (void)_removeAppProtectionShieldForRole:(int64_t)a3
{
  appProtectionShieldViewControllerByRole = self->_appProtectionShieldViewControllerByRole;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v12 = [(NSMutableDictionary *)appProtectionShieldViewControllerByRole objectForKeyedSubscript:v6];

  int v7 = v12;
  if (v12)
  {
    id v8 = [v12 view];
    [v12 beginAppearanceTransition:0 animated:0];
    [v12 willMoveToParentViewController:0];
    [v8 removeFromSuperview];
    [v12 removeFromParentViewController];
    [v12 endAppearanceTransition];
    id v9 = self->_appProtectionShieldViewControllerByRole;
    double v10 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    if (![(NSMutableDictionary *)self->_appProtectionShieldViewControllerByRole count])
    {
      id v11 = self->_appProtectionShieldViewControllerByRole;
      self->_appProtectionShieldViewControllerByRole = 0;
    }
    int v7 = v12;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(SBAppSwitcherReusableSnapshotView *)self _updateTranslucency];
    }
  }
}

- (SBAppSwitcherReusableSnapshotView)initWithDelegate:(id)a3 snapshotCache:(id)a4 lockoutVCProvider:(id)a5 appClipOverlayCoordinator:(id)a6 containerViewController:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v14)
  {
    double v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"SBAppSwitcherReusableSnapshotView.m", 131, @"Invalid parameter not satisfying: %@", @"snapshotCache != nil" object file lineNumber description];
  }
  v69.receiver = self;
  v69.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  id v18 = [(SBAppSwitcherReusableSnapshotView *)&v69 init];
  double v19 = v18;
  if (v18)
  {
    id v68 = v13;
    objc_storeWeak((id *)&v18->_delegate, v13);
    objc_storeWeak((id *)&v19->_snapshotCache, v14);
    objc_storeStrong((id *)&v19->_lockoutVCProvider, a5);
    objc_storeStrong((id *)&v19->_appClipOverlayCoordinator, a6);
    objc_storeWeak((id *)&v19->_containerViewController, v17);
    double v20 = [v17 _sbWindowScene];
    uint64_t v21 = [v20 switcherController];
    uint64_t v22 = [v21 windowManagementStyle];

    uint64_t v23 = +[SBAppSwitcherDomain rootSettings];
    settings = v19->_settings;
    v19->_settings = (SBAppSwitcherSettings *)v23;

    uint64_t v25 = +[SBMedusaDomain rootSettings];
    medusaSettings = v19->_medusaSettings;
    v19->_medusaSettings = (SBMedusaSettings *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    deferredSnapshotCrossfadeQueue = v19->_deferredSnapshotCrossfadeQueue;
    v19->_deferredSnapshotCrossfadeQueue = (NSMutableArray *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    snapshotViewStateByRole = v19->_snapshotViewStateByRole;
    v19->_snapshotViewStateByRole = (NSMutableDictionary *)v29;

    BOOL v31 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    solidColorBackstopView = v19->_solidColorBackstopView;
    v19->_solidColorBackstopView = v31;

    uint64_t v33 = [(UIView *)v19->_solidColorBackstopView layer];
    [v33 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    [(SBAppSwitcherReusableSnapshotView *)v19 insertSubview:v19->_solidColorBackstopView atIndex:0];
    id v34 = objc_alloc(MEMORY[0x1E4F4F8D0]);
    [(SBAppSwitcherReusableSnapshotView *)v19 bounds];
    uint64_t v35 = objc_msgSend(v34, "initWithFrame:");
    firstOrientationWrapper = v19->_firstOrientationWrapper;
    v19->_firstOrientationWrapper = (BSUIOrientationTransformWrapperView *)v35;

    [(SBAppSwitcherReusableSnapshotView *)v19 addSubview:v19->_firstOrientationWrapper];
    double v37 = [[SBSwitcherSnapshotImageView alloc] initWithImage:0];
    firstImageView = v19->_firstImageView;
    v19->_firstImageView = v37;

    [(BSUIOrientationTransformWrapperView *)v19->_firstOrientationWrapper addContentView:v19->_firstImageView];
    BOOL v39 = v19->_snapshotViewStateByRole;
    CGRect v40 = objc_alloc_init(SBAppSwitcherSnapshotViewState);
    CGRect v41 = [NSNumber numberWithInteger:1];
    [(NSMutableDictionary *)v39 setObject:v40 forKey:v41];

    if (v22)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F4F8D0]);
      [(SBAppSwitcherReusableSnapshotView *)v19 bounds];
      uint64_t v43 = objc_msgSend(v42, "initWithFrame:");
      secondOrientationWrapper = v19->_secondOrientationWrapper;
      v19->_secondOrientationWrapper = (BSUIOrientationTransformWrapperView *)v43;

      [(SBAppSwitcherReusableSnapshotView *)v19 addSubview:v19->_secondOrientationWrapper];
      double v45 = [[SBSwitcherSnapshotImageView alloc] initWithImage:0];
      secondImageView = v19->_secondImageView;
      v19->_secondImageView = v45;

      [(BSUIOrientationTransformWrapperView *)v19->_secondOrientationWrapper addContentView:v19->_secondImageView];
      uint64_t v47 = [MEMORY[0x1E4F39C88] layer];
      medusaDividerLayer = v19->_medusaDividerLayer;
      v19->_medusaDividerLayer = (CAShapeLayer *)v47;

      long long v49 = v19->_medusaDividerLayer;
      id v50 = [MEMORY[0x1E4F428B8] blackColor];
      -[CAShapeLayer setFillColor:](v49, "setFillColor:", [v50 CGColor]);

      [(CAShapeLayer *)v19->_medusaDividerLayer setHidden:1];
      uint64_t v51 = [(SBAppSwitcherReusableSnapshotView *)v19 layer];
      [v51 addSublayer:v19->_medusaDividerLayer];

      char v52 = v19->_snapshotViewStateByRole;
      double v53 = objc_alloc_init(SBAppSwitcherSnapshotViewState);
      double v54 = [NSNumber numberWithInteger:2];
      [(NSMutableDictionary *)v52 setObject:v53 forKey:v54];

      id v55 = objc_alloc(MEMORY[0x1E4F4F8D0]);
      [(SBAppSwitcherReusableSnapshotView *)v19 bounds];
      uint64_t v56 = objc_msgSend(v55, "initWithFrame:");
      thirdOrientationWrapper = v19->_thirdOrientationWrapper;
      v19->_thirdOrientationWrapper = (BSUIOrientationTransformWrapperView *)v56;

      [(SBAppSwitcherReusableSnapshotView *)v19 addSubview:v19->_thirdOrientationWrapper];
      double v58 = [[SBSwitcherSnapshotImageView alloc] initWithImage:0];
      thirdImageView = v19->_thirdImageView;
      v19->_thirdImageView = v58;

      [(BSUIOrientationTransformWrapperView *)v19->_thirdOrientationWrapper addContentView:v19->_thirdImageView];
      double v60 = v19->_snapshotViewStateByRole;
      double v61 = objc_alloc_init(SBAppSwitcherSnapshotViewState);
      double v62 = [NSNumber numberWithInteger:4];
      [(NSMutableDictionary *)v60 setObject:v61 forKey:v62];
    }
    uint64_t v63 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    blockingViewControllerByRole = v19->_blockingViewControllerByRole;
    v19->_blockingViewControllerByRole = (NSMutableDictionary *)v63;

    [(SBAppSwitcherReusableSnapshotView *)v19 setClipsToBounds:0];
    v19->_BOOL isChamoisWindowingEnabled = v22 == 2;
    double v65 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v65 addObserver:v19 selector:sel__windowManagementStyleDidChange_ name:@"SBSwitcherControllerWindowManagementStyleDidChangeNotification" object:0];

    id v13 = v68;
  }

  return v19;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  [(SBAppSwitcherReusableSnapshotView *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  objc_super v4 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v5 = (id)[v3 appendObject:v4 withName:@"App Layout"];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __48__SBAppSwitcherReusableSnapshotView_description__block_invoke;
  id v13 = &unk_1E6B002B8;
  id v14 = v3;
  id v15 = self;
  id v6 = v3;
  SBSnapshotViewEnumerateSupportedRoles(&v10);
  id v7 = (id)objc_msgSend(v6, "appendSuper", v10, v11, v12, v13);
  id v8 = [v6 build];

  return (NSString *)v8;
}

void __48__SBAppSwitcherReusableSnapshotView_description__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    objc_super v4 = @"Cache Entry for Role Primary";
  }
  else {
    objc_super v4 = @"Cache Entry for Role Side";
  }
  id v8 = v4;
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) _cacheEntryForRole:a2];
  id v7 = (id)[v5 appendObject:v6 withName:v8];
}

- (void)setOrientation:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  id v5 = [(SBSwitcherWallpaperPageContentView *)&v8 orientation];
  v7.receiver = self;
  v7.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  [(SBSwitcherWallpaperPageContentView *)&v7 setOrientation:a3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SBAppSwitcherReusableSnapshotView_setOrientation___block_invoke;
  v6[3] = &unk_1E6AF4AE8;
  v6[4] = self;
  void v6[5] = a3;
  v6[6] = v5;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v6];
}

uint64_t __52__SBAppSwitcherReusableSnapshotView_setOrientation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 472) setContainerOrientation:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 480) setContainerOrientation:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 488) setContainerOrientation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateContentOrientationForRole:1];
  [*(id *)(a1 + 32) _updateContentOrientationForRole:2];
  uint64_t result = [*(id *)(a1 + 32) _updateContentOrientationForRole:4];
  if (*(void *)(a1 + 48) != *(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setNeedsLayout];
    id v3 = *(void **)(a1 + 32);
    return [v3 layoutIfNeeded];
  }
  return result;
}

- (void)prepareForReuse
{
  if (self->_active)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBAppSwitcherReusableSnapshotView.m" lineNumber:314 description:@"Can't recycle active view"];
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__116;
  id v15 = __Block_byref_object_dispose__116;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke;
  v10[3] = &unk_1E6AFBD78;
  v10[4] = self;
  v10[5] = &v11;
  SBSnapshotViewEnumerateSupportedRoles(v10);
  id v3 = (void *)v12[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke_2;
  v9[3] = &unk_1E6B0CC58;
  v9[4] = self;
  [v3 enumerateObjectsUsingBlock:v9];
  [(UIView *)self->_solidColorBackstopView setBackgroundColor:0];
  [(UIView *)self->_solidColorBackstopView setHidden:1];
  appLayout = self->_appLayout;
  self->_appLayout = 0;

  self->_usesNonuniformScaling = 0;
  self->_BOOL shouldStretchToBounds = 0;
  self->_showingIconOverlayView = 0;
  self->_shouldUseBrightMaterial = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotCache);
  [WeakRetained removeSnapshotObserver:self];

  [(NSMutableArray *)self->_deferredSnapshotCrossfadeQueue removeAllObjects];
  [(SBAppSwitcherReusableSnapshotView *)self setWallpaperStyle:1];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];

  _Block_object_dispose(&v11, 8);
}

void __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [*(id *)(a1 + 32) _imageViewForRole:a2];
  [v4 prepareForReuse];
  [*(id *)(a1 + 32) _setCacheEntry:0 forRole:a2];
  [*(id *)(a1 + 32) _setSceneHandle:0 forRole:a2];
  [*(id *)(a1 + 32) _setAnimatingTransition:0 forRole:a2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "_orientationWrapperForRole:", a2, 0);
  id v6 = [v5 contentViews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        id v12 = [*(id *)(a1 + 32) _imageViewForRole:a2];

        if (v11 != v12) {
          [v11 removeFromSuperview];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 32) _removeAppLockoutOverlayForRole:a2];
  [*(id *)(a1 + 32) _removeAppClipOverlayForRole:a2];
  [*(id *)(a1 + 32) _removeAppProtectionShieldForRole:a2];
  uint64_t v13 = [*(id *)(a1 + 32) _applicationForRole:a2];
  if (v13)
  {
    id v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      id v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v14 addObject:v13];
  }
}

void __52__SBAppSwitcherReusableSnapshotView_prepareForReuse__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 appProtectionAssistant];
  [v3 removeObserver:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SBAppSwitcherReusableSnapshotView;
  [(SBSwitcherWallpaperPageContentView *)&v2 invalidate];
}

- (BOOL)hasSceneOverlayView
{
  return [(NSMutableDictionary *)self->_blockingViewControllerByRole count]
      || [(NSMutableDictionary *)self->_appClipOverlayByRole count]
      || [(NSMutableDictionary *)self->_appProtectionShieldViewControllerByRole count] != 0;
}

- (void)didUpdateCacheEntry:(id)a3
{
  if (a3)
  {
    -[SBAppSwitcherReusableSnapshotView _updateToNewSnapshotImageUsingCacheEntry:](self, "_updateToNewSnapshotImageUsingCacheEntry:");
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "[switcher snapshot view] Got called back with nil cacheEntry", v6, 2u);
    }
  }
}

- (void)appProtectionAssistantShouldShieldDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__SBAppSwitcherReusableSnapshotView_appProtectionAssistantShouldShieldDidChange___block_invoke;
  v3[3] = &unk_1E6AF8788;
  v3[4] = self;
  SBSnapshotViewEnumerateSupportedRoles(v3);
}

void __81__SBAppSwitcherReusableSnapshotView_appProtectionAssistantShouldShieldDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _applicationForRole:a2];
  [*(id *)(a1 + 32) _addOrRemoveAppProtectionShieldForApplication:v4 role:a2];
}

- (void)_handleInstalledAppsChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"SBInstalledApplicationsAddedBundleIDs"];

  if ([v6 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke;
    v11[3] = &unk_1E6AF8788;
    v11[4] = self;
    SBSnapshotViewEnumerateSupportedRoles(v11);
  }
  uint64_t v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKey:@"SBInstalledApplicationsUpdatedBundleIDs"];

  if ([v8 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke_2;
    v9[3] = &unk_1E6B002B8;
    v9[4] = self;
    id v10 = v8;
    SBSnapshotViewEnumerateSupportedRoles(v9);
  }
}

void __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _applicationForRole:a2];
  if (!v4)
  {
    [*(id *)(a1 + 32) _updateSceneHandleForRole:a2];
    id v4 = 0;
  }
}

void __65__SBAppSwitcherReusableSnapshotView__handleInstalledAppsChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v11 = [*(id *)(a1 + 32) _applicationForRole:a2];
  id v4 = [v11 bundleIdentifier];
  id v5 = [v11 info];
  int v6 = [v5 isBlockedForScreenTimeExpiration];

  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 544);
  uint64_t v8 = [NSNumber numberWithInteger:a2];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  int v10 = [*(id *)(a1 + 40) containsObject:v4];
  if (v9)
  {
    if (((v10 ^ 1 | v6) & 1) == 0) {
      [*(id *)(a1 + 32) _removeAppLockoutOverlayForRole:a2];
    }
  }
  else if ((v10 & v6) == 1)
  {
    [*(id *)(a1 + 32) _addAppLockoutOverlayIfNecessaryForRole:a2];
  }
  [*(id *)(a1 + 32) _addOrRemoveAppProtectionShieldForApplication:v11 role:a2];
}

- (void)_setCacheEntry:(id)a3 forRole:(int64_t)a4
{
  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  int v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithInteger:a4];
  uint64_t v8 = [(NSMutableDictionary *)snapshotViewStateByRole objectForKey:v9];
  -[SBCameraHardwareButton setDispatchingRuleAssertion:]((uint64_t)v8, v7);
}

- (BOOL)_isAnimatingTransitionForRole:(int64_t)a3
{
  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)snapshotViewStateByRole objectForKey:v4];
  if (v5) {
    BOOL v6 = v5[8] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setAnimatingTransition:(BOOL)a3 forRole:(int64_t)a4
{
  snapshotViewStateByRole = self->_snapshotViewStateByRole;
  id v7 = [NSNumber numberWithInteger:a4];
  -[NSMutableDictionary objectForKey:](snapshotViewStateByRole, "objectForKey:");
  BOOL v6 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    v6[8] = a3;
  }
}

- (void)_updateToNewSnapshotImageUsingCacheEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 role];
  BOOL v39 = [(SBAppSwitcherReusableSnapshotView *)self _imageViewForRole:v5];
  BOOL v6 = [(SBAppSwitcherReusableSnapshotView *)self _cacheEntryForRole:v5];
  if (v6)
  {
    id v7 = [v4 snapshot];
    if ([(SBAppSwitcherReusableSnapshotView *)self _isSnapshotSuspendSnapshot:v7]
      || [(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:2])
    {
      BOOL v8 = 1;
    }
    else
    {
      blockingViewControllerByRole = self->_blockingViewControllerByRole;
      int v10 = [NSNumber numberWithInteger:v5];
      id v11 = [(NSMutableDictionary *)blockingViewControllerByRole objectForKeyedSubscript:v10];
      if (v11)
      {
        BOOL v8 = 1;
      }
      else
      {
        appProtectionShieldViewControllerByRole = self->_appProtectionShieldViewControllerByRole;
        uint64_t v13 = [NSNumber numberWithInteger:v5];
        id v14 = [(NSMutableDictionary *)appProtectionShieldViewControllerByRole objectForKeyedSubscript:v13];
        BOOL v8 = v14 != 0;
      }
    }
  }
  else
  {
    BOOL v8 = 1;
  }
  uint64_t v15 = [v6 snapshotImage];
  uint64_t v16 = [v4 snapshotImage];
  if (!v8
    && (([v15 size], v18 == 0.0)
     || ([v16 size], v19 == 0.0)
     || ([v15 size],
         [v15 size],
         [v16 size],
         [v16 size],
         BSFloatApproximatelyEqualToFloat())))
  {
    BOOL shouldStretchToBounds = self->_shouldStretchToBounds;
    if (!self->_shouldStretchToBounds)
    {
      int64_t v20 = [(SBAppSwitcherReusableSnapshotView *)self _contentOrientationForSnapshotCacheEntry:v6];
      BOOL shouldStretchToBounds = v20 != [(SBAppSwitcherReusableSnapshotView *)self _contentOrientationForSnapshotCacheEntry:v4];
    }
  }
  else
  {
    BOOL shouldStretchToBounds = 1;
  }
  deferredSnapshotCrossfadeQueue = self->_deferredSnapshotCrossfadeQueue;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke;
  v76[3] = &unk_1E6B0CCD0;
  id v22 = v4;
  id v77 = v22;
  uint64_t v23 = [(NSMutableArray *)deferredSnapshotCrossfadeQueue bs_filter:v76];
  [(NSMutableArray *)deferredSnapshotCrossfadeQueue removeObjectsInArray:v23];

  double v24 = v39;
  if (self->_active)
  {
    int v25 = !self->_visible || shouldStretchToBounds;
    if (v25 == 1)
    {
      [(SBAppSwitcherReusableSnapshotView *)self _setCacheEntry:v22 forRole:v5];
      CGFloat v26 = [v39 layer];
      [v26 removeAllAnimations];

      [v39 setImage:v16];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_2;
      v75[3] = &unk_1E6AF4AC0;
      v75[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v75];
      uint64_t v27 = (void *)MEMORY[0x1E4F42FF0];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_3;
      v71[3] = &unk_1E6AF6FC0;
      id v72 = v39;
      CGRect v73 = self;
      uint64_t v74 = v5;
      [v27 performWithoutAnimation:v71];
      CGFloat v28 = v72;
    }
    else
    {
      if ([(SBAppSwitcherReusableSnapshotView *)self _isAnimatingTransitionForRole:v5])
      {
        [(NSMutableArray *)self->_deferredSnapshotCrossfadeQueue _sb_enqueue:v22];
        goto LABEL_29;
      }
      [(SBAppSwitcherReusableSnapshotView *)self _setCacheEntry:v22 forRole:v5];
      [(SBAppSwitcherReusableSnapshotView *)self setNeedsLayout];
      uint64_t v29 = [v39 image];

      if (v29)
      {
        v62[0] = 0;
        v62[1] = v62;
        v62[2] = 0x3032000000;
        v62[3] = __Block_byref_object_copy__116;
        v62[4] = __Block_byref_object_dispose__116;
        id v63 = 0;
        v60[0] = 0;
        v60[1] = v60;
        v60[2] = 0x3032000000;
        v60[3] = __Block_byref_object_copy__116;
        v60[4] = __Block_byref_object_dispose__116;
        id v61 = 0;
        uint64_t v54 = 0;
        id v55 = &v54;
        uint64_t v56 = 0x3032000000;
        double v57 = __Block_byref_object_copy__116;
        double v58 = __Block_byref_object_dispose__116;
        id v59 = 0;
        uint64_t v30 = (void *)MEMORY[0x1E4F42FF0];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_8;
        v44[3] = &unk_1E6B0CCF8;
        uint64_t v53 = v5;
        v44[4] = self;
        id v50 = v62;
        id v45 = v15;
        id v46 = v6;
        uint64_t v51 = v60;
        id v47 = v16;
        id v48 = v22;
        id v31 = v39;
        id v49 = v31;
        char v52 = &v54;
        [v30 _performWithoutRetargetingAnimations:v44];
        double v32 = (void *)v55[5];
        uint64_t v33 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.35];
        [v32 setAnimationFactory:v33];

        id v34 = (void *)v55[5];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_9;
        v40[3] = &unk_1E6AF63D0;
        id v42 = &v54;
        v40[4] = self;
        id v41 = v31;
        uint64_t v43 = v5;
        [v34 crossfadeWithCompletion:v40];

        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(v60, 8);

        _Block_object_dispose(v62, 8);
        double v24 = v39;
        goto LABEL_29;
      }
      [(SBAppSwitcherReusableSnapshotView *)self _setAnimatingTransition:1 forRole:v5];
      uint64_t v35 = (void *)MEMORY[0x1E4F42FF0];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_4;
      v68[3] = &unk_1E6AF6FC0;
      v68[4] = self;
      uint64_t v70 = v5;
      id v36 = v39;
      id v69 = v36;
      [v35 performWithoutAnimation:v68];
      [v36 setImage:v16];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_5;
      v67[3] = &unk_1E6AF4AC0;
      v67[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v67];
      double v37 = (void *)MEMORY[0x1E4F42FF0];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_6;
      v65[3] = &unk_1E6AF4AC0;
      id v38 = v36;
      double v24 = v39;
      id v66 = v38;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_7;
      v64[3] = &unk_1E6AFF1A8;
      v64[4] = self;
      v64[5] = v5;
      [v37 animateWithDuration:v65 animations:v64 completion:0.1];

      CGFloat v28 = v69;
    }
  }
LABEL_29:
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 displayItem];
  id v4 = [*(id *)(a1 + 32) displayItem];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) _updateTranslucency];
  objc_super v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _updateContentOrientationForRole:v3];
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContentOrientationForRole:*(void *)(a1 + 48)];
  objc_super v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTranslucency];
  [*(id *)(a1 + 32) _setAnimatingTransition:0 forRole:*(void *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _performDeferredSnapshotUpdatesIfNecessaryForRole:v3];
}

void __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAnimatingTransition:1 forRole:*(void *)(a1 + 104)];
  objc_super v2 = [[SBSwitcherSnapshotImageView alloc] initWithImage:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) _configureSnapshotImageView:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) cacheEntry:*(void *)(a1 + 48)];
  uint64_t v5 = [[SBSwitcherSnapshotImageView alloc] initWithImage:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) _configureSnapshotImageView:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) cacheEntry:*(void *)(a1 + 64)];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setUsesNonuniformScaling:", objc_msgSend(*(id *)(a1 + 72), "usesNonuniformScaling"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setStretchToFillBounds:", objc_msgSend(*(id *)(a1 + 72), "stretchToFillBounds"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "setUsesNonuniformScaling:", objc_msgSend(*(id *)(a1 + 72), "usesNonuniformScaling"));
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "setStretchToFillBounds:", objc_msgSend(*(id *)(a1 + 72), "stretchToFillBounds"));
  BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  [*(id *)(a1 + 72) frame];
  objc_msgSend(v8, "setFrame:");
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  [*(id *)(a1 + 72) frame];
  objc_msgSend(v9, "setFrame:");
  int v10 = [*(id *)(a1 + 32) _sceneHandleForRole:*(void *)(a1 + 104)];
  uint64_t v11 = [v10 isTranslucent];

  uint64_t v12 = [MEMORY[0x1E4FA7940] crossfadeViewWithStartView:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) endView:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) translucent:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 96) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) layoutIfNeeded];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) layoutIfNeeded];
  [*(id *)(a1 + 72) setHidden:1];
  [*(id *)(a1 + 72) _removeAllRetargetableAnimations:1];
  [*(id *)(a1 + 72) setImage:*(void *)(a1 + 56)];
  id v15 = [*(id *)(a1 + 32) _orientationWrapperForRole:*(void *)(a1 + 104)];
  [v15 addContentView:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
}

void __78__SBAppSwitcherReusableSnapshotView__updateToNewSnapshotImageUsingCacheEntry___block_invoke_9(uint64_t a1)
{
  objc_super v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) superview];

  if (v2)
  {
    [*(id *)(a1 + 32) _updateTranslucency];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeFromSuperview];
    [*(id *)(a1 + 40) setHidden:0];
    [*(id *)(a1 + 32) _setAnimatingTransition:0 forRole:*(void *)(a1 + 56)];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    [v3 _performDeferredSnapshotUpdatesIfNecessaryForRole:v4];
  }
}

- (void)_performDeferredSnapshotUpdatesIfNecessaryForRole:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!-[SBAppSwitcherReusableSnapshotView _isAnimatingTransitionForRole:](self, "_isAnimatingTransitionForRole:"))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_deferredSnapshotCrossfadeQueue;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_msgSend(v10, "role", (void)v12) == a3) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      uint64_t v11 = v10;

      if (!v11) {
        return;
      }
      [(SBAppSwitcherReusableSnapshotView *)self _updateToNewSnapshotImageUsingCacheEntry:v11];
      [(NSMutableArray *)self->_deferredSnapshotCrossfadeQueue removeObject:v11];
      uint64_t v5 = v11;
    }
LABEL_13:
  }
}

- (int64_t)_contentOrientationForSnapshotCacheEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SBAppSwitcherReusableSnapshotView _sceneHandleForRole:](self, "_sceneHandleForRole:", [v4 role]);
  int v6 = [v5 _supportsMixedOrientation];

  uint64_t v7 = [v4 snapshot];
  uint64_t v8 = [v7 interfaceOrientation];

  int64_t v9 = [(SBSwitcherWallpaperPageContentView *)self orientation];
  if (v9 == XBOppositeInterfaceOrientation()) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = v8;
  }
  if (v6)
  {
    if (self->_isChamoisWindowingEnabled)
    {
      uint64_t v11 = [v4 appLayout];
      long long v12 = objc_msgSend(v11, "layoutAttributesForItemInRole:", objc_msgSend(v4, "role"));
      uint64_t v13 = [v12 contentOrientation];

      if (v13 != v9 && v13 == v8) {
        int64_t v10 = v9;
      }
    }
    else
    {
      int64_t v10 = v9;
    }
  }

  return v10;
}

- (id)_separatorViewBezierPathWithWidth:(double)a3 height:(double)a4
{
  SBScreenDisplayCornerRadius();
  if (BSFloatIsZero())
  {
    int v6 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 0.0, a3, a4);
  }
  else
  {
    uint64_t v7 = +[SBMedusaDomain rootSettings];
    [v7 cornerRadiusForInnerCorners];
    double v9 = v8;

    int v6 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", 0.0, 0.0, a3 + v9 * 4.0 * 2.0, a4);
    int64_t v10 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 10, 0.0, 0.0, v9 * 4.0, a4, v9, v9);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 5, v9 * 4.0 + a3, 0.0, v9 * 4.0, a4, v9, v9);
    long long v12 = [v10 bezierPathByReversingPath];
    [v6 appendPath:v12];

    uint64_t v13 = [v11 bezierPathByReversingPath];
    [v6 appendPath:v13];
  }
  return v6;
}

- (void)_updateContentOrientationForRole:(int64_t)a3
{
  -[SBAppSwitcherReusableSnapshotView _cacheEntryForRole:](self, "_cacheEntryForRole:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v12 snapshot];
  if (v5
    && (int v6 = (void *)v5,
        int64_t v7 = [(SBSwitcherWallpaperPageContentView *)self orientation],
        v6,
        v7))
  {
    int64_t v8 = [(SBAppSwitcherReusableSnapshotView *)self _contentOrientationForSnapshotCacheEntry:v12];
    double v9 = [(SBAppSwitcherReusableSnapshotView *)self _orientationWrapperForRole:a3];
    if ([v9 contentOrientation] != v8) {
      [(SBAppSwitcherReusableSnapshotView *)self setNeedsLayout];
    }
    int64_t v10 = v9;
    int64_t v11 = v8;
  }
  else
  {
    double v9 = [(SBAppSwitcherReusableSnapshotView *)self _orientationWrapperForRole:a3];
    int64_t v11 = [(SBSwitcherWallpaperPageContentView *)self orientation];
    int64_t v10 = v9;
  }
  [v10 setContentOrientation:v11];
}

- (void)_addOverlayViewController:(id)a3 toOrientationWrapperForRole:(int64_t)a4
{
  id v6 = a3;
  id v10 = [v6 view];
  [v10 setClipsToBounds:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v6 beginAppearanceTransition:1 animated:0];
  [WeakRetained addChildViewController:v6];
  int64_t v8 = [(SBAppSwitcherReusableSnapshotView *)self _orientationWrapperForRole:a4];
  [v8 addContentView:v10];

  [v10 layoutIfNeeded];
  [v6 didMoveToParentViewController:WeakRetained];
  [v6 endAppearanceTransition];

  double v9 = [(SBAppSwitcherReusableSnapshotView *)self _imageViewForRole:a4];
  [(SBAppSwitcherReusableSnapshotView *)self _updateCornerRadiusIfNecessaryForOverlayView:v10 matchingSnapshotImage:v9];
}

- (void)_addAppLockoutOverlayIfNecessaryForRole:(int64_t)a3
{
  blockingViewControllerByRole = self->_blockingViewControllerByRole;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  int64_t v7 = [(NSMutableDictionary *)blockingViewControllerByRole objectForKeyedSubscript:v6];

  if (!v7)
  {
    int64_t v8 = [(SBAppSwitcherReusableSnapshotView *)self _applicationForRole:a3];
    double v9 = [v8 info];
    uint64_t v10 = [v9 screenTimePolicy];

    lockoutVCProvider = self->_lockoutVCProvider;
    id v12 = [v8 bundleIdentifier];
    uint64_t v13 = [(SBAppSwitcherSnapshotLockoutViewControllerProvider *)lockoutVCProvider blockingViewControllerForBundleIdentifier:v12 screenTimePolicy:v10];

    long long v14 = self->_blockingViewControllerByRole;
    long long v15 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

    uint64_t v16 = [v13 view];
    [v16 setClipsToBounds:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v13 beginAppearanceTransition:1 animated:0];
    [WeakRetained addChildViewController:v13];
    double v18 = [(SBAppSwitcherReusableSnapshotView *)self _orientationWrapperForRole:a3];
    [v18 addContentView:v16];

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    double v24 = __77__SBAppSwitcherReusableSnapshotView__addAppLockoutOverlayIfNecessaryForRole___block_invoke;
    int v25 = &unk_1E6AF5290;
    id v26 = v13;
    id v27 = WeakRetained;
    id v19 = WeakRetained;
    id v20 = v13;
    [v20 showWithAnimation:0 completionHandler:&v22];
    long long v21 = -[SBAppSwitcherReusableSnapshotView _imageViewForRole:](self, "_imageViewForRole:", a3, v22, v23, v24, v25);
    [(SBAppSwitcherReusableSnapshotView *)self _updateCornerRadiusIfNecessaryForOverlayView:v16 matchingSnapshotImage:v21];
  }
}

uint64_t __77__SBAppSwitcherReusableSnapshotView__addAppLockoutOverlayIfNecessaryForRole___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didMoveToParentViewController:*(void *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 endAppearanceTransition];
}

uint64_t __69__SBAppSwitcherReusableSnapshotView__removeAppLockoutOverlayForRole___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginAppearanceTransition:0 animated:0];
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  objc_super v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  [*(id *)(a1 + 32) endAppearanceTransition];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 544);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v3 removeObjectForKey:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(*(void *)(a1 + 40) + 584);
  return [v6 recycleBlockingViewController:v5];
}

- (void)_addAppClipOverlayForRole:(int64_t)a3 bundleIdentifier:(id)a4 sceneIdentifier:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  appClipOverlayByRole = self->_appClipOverlayByRole;
  uint64_t v10 = [NSNumber numberWithInteger:a3];
  int64_t v11 = [(NSMutableDictionary *)appClipOverlayByRole objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v12 = [[SBAppClipOverlayViewController alloc] initWithCoordinator:self->_appClipOverlayCoordinator bundleIdentifier:v20 sceneIdentifier:v8];
    uint64_t v13 = [(SBAppSwitcherReusableSnapshotView *)self _applicationForRole:a3];

    BOOL v14 = v13 == 0;
    if (v13) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = -1;
    }
    [(SBAppClipOverlayViewController *)v12 setDisplayedOverPlaceholder:v14 animated:0];
    [(SBAppClipOverlayViewController *)v12 setSceneActivationState:v15 animated:0];
    uint64_t v16 = self->_appClipOverlayByRole;
    if (!v16)
    {
      uint64_t v17 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      double v18 = self->_appClipOverlayByRole;
      self->_appClipOverlayByRole = v17;

      uint64_t v16 = self->_appClipOverlayByRole;
    }
    id v19 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v16 setObject:v12 forKeyedSubscript:v19];

    [(SBAppSwitcherReusableSnapshotView *)self _addOverlayViewController:v12 toOrientationWrapperForRole:a3];
  }
}

- (void)_removeAppClipOverlayForRole:(int64_t)a3
{
  appClipOverlayByRole = self->_appClipOverlayByRole;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v12 = [(NSMutableDictionary *)appClipOverlayByRole objectForKeyedSubscript:v6];

  int64_t v7 = v12;
  if (v12)
  {
    id v8 = [v12 view];
    [(SBAppSwitcherReusableSnapshotView *)self _updateCornerRadiusIfNecessaryForOverlayView:v8 matchingSnapshotImage:0];
    [v12 beginAppearanceTransition:0 animated:0];
    [v12 willMoveToParentViewController:0];
    [v8 removeFromSuperview];
    [v12 removeFromParentViewController];
    [v12 endAppearanceTransition];
    double v9 = self->_appClipOverlayByRole;
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    if (![(NSMutableDictionary *)self->_appClipOverlayByRole count])
    {
      int64_t v11 = self->_appClipOverlayByRole;
      self->_appClipOverlayByRole = 0;
    }
    int64_t v7 = v12;
  }
}

- (void)_addAppProtectionShieldIfNeededForRole:(int64_t)a3
{
  uint64_t v5 = -[SBAppSwitcherReusableSnapshotView _applicationForRole:](self, "_applicationForRole:");
  if (v5)
  {
    appProtectionShieldViewControllerByRole = self->_appProtectionShieldViewControllerByRole;
    id v15 = v5;
    int64_t v7 = [NSNumber numberWithInteger:a3];
    id v8 = [(NSMutableDictionary *)appProtectionShieldViewControllerByRole objectForKeyedSubscript:v7];

    uint64_t v5 = v15;
    if (!v8)
    {
      double v9 = [v15 appProtectionAssistant];
      uint64_t v10 = [v9 createShieldUIViewController];

      int64_t v11 = self->_appProtectionShieldViewControllerByRole;
      if (!v11)
      {
        id v12 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        uint64_t v13 = self->_appProtectionShieldViewControllerByRole;
        self->_appProtectionShieldViewControllerByRole = v12;

        int64_t v11 = self->_appProtectionShieldViewControllerByRole;
      }
      BOOL v14 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v14];

      [(SBAppSwitcherReusableSnapshotView *)self _addOverlayViewController:v10 toOrientationWrapperForRole:a3];
      uint64_t v5 = v15;
    }
  }
}

- (void)_windowManagementStyleDidChange:(id)a3
{
  id v4 = [(UIView *)self _sbWindowScene];
  uint64_t v5 = [v4 switcherController];
  int v6 = [v5 isChamoisWindowingUIEnabled];

  if (self->_isChamoisWindowingEnabled != v6)
  {
    self->_BOOL isChamoisWindowingEnabled = v6;
    [(SBAppSwitcherReusableSnapshotView *)self setNeedsLayout];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)shouldUseBrightMaterial
{
  return self->_shouldUseBrightMaterial;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_deferredSnapshotCrossfadeQueue, 0);
  objc_storeStrong((id *)&self->_chamoisWindowingUIEnabledObserver, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_appClipOverlayByRole, 0);
  objc_storeStrong((id *)&self->_appClipOverlayCoordinator, 0);
  objc_storeStrong((id *)&self->_lockoutVCProvider, 0);
  objc_destroyWeak((id *)&self->_snapshotCache);
  objc_storeStrong((id *)&self->_solidColorBackstopView, 0);
  objc_storeStrong((id *)&self->_medusaDividerLayer, 0);
  objc_storeStrong((id *)&self->_appProtectionShieldViewControllerByRole, 0);
  objc_storeStrong((id *)&self->_blockingViewControllerByRole, 0);
  objc_storeStrong((id *)&self->_snapshotViewStateByRole, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_thirdImageView, 0);
  objc_storeStrong((id *)&self->_secondImageView, 0);
  objc_storeStrong((id *)&self->_firstImageView, 0);
  objc_storeStrong((id *)&self->_thirdOrientationWrapper, 0);
  objc_storeStrong((id *)&self->_secondOrientationWrapper, 0);
  objc_storeStrong((id *)&self->_firstOrientationWrapper, 0);
}

@end