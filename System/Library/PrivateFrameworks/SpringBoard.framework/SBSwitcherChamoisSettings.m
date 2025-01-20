@interface SBSwitcherChamoisSettings
+ (id)settingsControllerModule;
- (BOOL)_shouldPreferDockHiddenForWindowScene:(id)a3;
- (BOOL)_shouldPreferStripHiddenForWindowScene:(id)a3 interfaceOrientation:(int64_t)a4;
- (BOOL)allowTrueMaximizeForAllApps;
- (BOOL)blurWallpaperInApps;
- (BOOL)changeFocusOnClickDown;
- (BOOL)rasterizeScaledApps;
- (BOOL)rejectDropsWhenStageIsFull;
- (BOOL)tapWallpaperToGoHome;
- (BOOL)useLeadingWindowEdgeForDropZoneCalculations;
- (BOOL)useLowFatigueStripAnimation;
- (CGSize)_nearestGridSizeForSize:(CGSize)a3 gridWidths:(id)a4 gridHeights:(id)a5 bounds:(CGRect)a6;
- (CGSize)diffuseShadowOffset;
- (SBFFluidBehaviorSettings)appToAppLayoutSettings;
- (SBFFluidBehaviorSettings)appToAppOpacitySettings;
- (SBFFluidBehaviorSettings)liveResizeAfterReleaseLayoutAnimationSettings;
- (SBFFluidBehaviorSettings)liveResizeDuringDragLayoutAnimationSettings;
- (SBFFluidBehaviorSettings)stageFocusChangeSettings;
- (SBFFluidBehaviorSettings)windowDragAnimationSettings;
- (SBSwitcherChamoisSettings)initWithDefaultValues;
- (SBSwitcherChamoisSnapPaddingSettings)embeddedDisplaySnapPaddingSettings;
- (SBSwitcherChamoisSnapPaddingSettings)externalDisplaySnapPaddingSettings;
- (double)_statusBarHeight;
- (double)_stripCardScaleForContainerBounds:(CGRect)a3 screenEdgePadding:(double)a4 stripVerticalEdgeSpacing:(double)a5 stripInterItemSpacing:(double)a6 floatingDockHeight:(double)a7 numberOfRows:(unint64_t)a8;
- (double)_stripWidthForContainerBounds:(CGRect)a3 screenEdgePadding:(double)a4 stripStackDistance:(double)a5 stripCardScale:(double)a6 stripTiltAngle:(double)a7 containerPerspective:(double)a8;
- (double)diffuseShadowOpacity;
- (double)diffuseShadowRadius;
- (double)homeGestureMinimumYDistanceForHomeOrAppSwitcher;
- (double)partiallyOffscreenWindowMargin;
- (double)pinWindowEdgeForResizeMargin;
- (double)rimShadowOpacity;
- (double)rimShadowRadius;
- (double)stageOccludedAppScaleFactor;
- (double)stripDropZoneMultiplier;
- (double)stripsHoverRevealZoneWidthFixed;
- (double)stripsHoverRevealZoneWidthScale;
- (double)switcherCornerRadius;
- (double)switcherHeightForIconAndLabelsUnderEachPile;
- (double)switcherPileCardMinimumPeekAmount;
- (double)switcherPileCompactingFactor;
- (id)_gridHeightsForSafeHeight:(double)a3 minimumHeight:(double)a4 stageInterItemSpacing:(double)a5;
- (id)_gridWidthsForSafeWidth:(double)a3 minimumWidth:(double)a4 stageInterItemSpacing:(double)a5;
- (id)layoutAttributesForContainerBounds:(CGRect)a3 nativeContainerReferencePixelBounds:(CGRect)a4 interfaceOrientation:(int64_t)a5 floatingDockHeight:(double)a6 statusBarHeight:(double)a7 requiresFullScreen:(BOOL)a8 prefersStripHidden:(BOOL)a9 prefersDockHidden:(BOOL)a10 isEmbeddedDisplay:(BOOL)a11 isAutoLayoutEnabled:(BOOL)a12 isAdditiveModelEnabled:(BOOL)a13;
- (id)layoutAttributesForWindowScene:(id)a3 interfaceOrientation:(int64_t)a4 requiresFullScreen:(BOOL)a5 floatingDockHeight:(double)a6;
- (unint64_t)externalDisplayHighResVerticalResolution;
- (unint64_t)maximumNumberOfAppsOnStage;
- (unint64_t)numberOfRowsWhileInAppOnEmbeddedDisplay;
- (unint64_t)numberOfRowsWhileInAppOnExternalDisplay;
- (unint64_t)numberOfRowsWhileInAppOnExternalDisplayHighRes;
- (unint64_t)numberOfVisibleItemsPerGroup;
- (unint64_t)stripsHoverRevealZoneWidthType;
- (void)_observeAppSwitcherDefaults;
- (void)_updateCachedAppSwitcherDefaults;
- (void)dealloc;
- (void)setAllowTrueMaximizeForAllApps:(BOOL)a3;
- (void)setAppToAppLayoutSettings:(id)a3;
- (void)setAppToAppOpacitySettings:(id)a3;
- (void)setBlurWallpaperInApps:(BOOL)a3;
- (void)setChangeFocusOnClickDown:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDiffuseShadowOffset:(CGSize)a3;
- (void)setDiffuseShadowOpacity:(double)a3;
- (void)setDiffuseShadowRadius:(double)a3;
- (void)setEmbeddedDisplaySnapPaddingSettings:(id)a3;
- (void)setExternalDisplayHighResVerticalResolution:(unint64_t)a3;
- (void)setExternalDisplaySnapPaddingSettings:(id)a3;
- (void)setHomeGestureMinimumYDistanceForHomeOrAppSwitcher:(double)a3;
- (void)setLiveResizeAfterReleaseLayoutAnimationSettings:(id)a3;
- (void)setLiveResizeDuringDragLayoutAnimationSettings:(id)a3;
- (void)setMaximumNumberOfAppsOnStage:(unint64_t)a3;
- (void)setNumberOfRowsWhileInAppOnEmbeddedDisplay:(unint64_t)a3;
- (void)setNumberOfRowsWhileInAppOnExternalDisplay:(unint64_t)a3;
- (void)setNumberOfRowsWhileInAppOnExternalDisplayHighRes:(unint64_t)a3;
- (void)setNumberOfVisibleItemsPerGroup:(unint64_t)a3;
- (void)setPartiallyOffscreenWindowMargin:(double)a3;
- (void)setPinWindowEdgeForResizeMargin:(double)a3;
- (void)setRasterizeScaledApps:(BOOL)a3;
- (void)setRejectDropsWhenStageIsFull:(BOOL)a3;
- (void)setRimShadowOpacity:(double)a3;
- (void)setRimShadowRadius:(double)a3;
- (void)setStageFocusChangeSettings:(id)a3;
- (void)setStageOccludedAppScaleFactor:(double)a3;
- (void)setStripDropZoneMultiplier:(double)a3;
- (void)setStripsHoverRevealZoneWidthFixed:(double)a3;
- (void)setStripsHoverRevealZoneWidthScale:(double)a3;
- (void)setStripsHoverRevealZoneWidthType:(unint64_t)a3;
- (void)setSwitcherCornerRadius:(double)a3;
- (void)setSwitcherHeightForIconAndLabelsUnderEachPile:(double)a3;
- (void)setSwitcherPileCardMinimumPeekAmount:(double)a3;
- (void)setSwitcherPileCompactingFactor:(double)a3;
- (void)setTapWallpaperToGoHome:(BOOL)a3;
- (void)setUseLeadingWindowEdgeForDropZoneCalculations:(BOOL)a3;
- (void)setUseLowFatigueStripAnimation:(BOOL)a3;
- (void)setWindowDragAnimationSettings:(id)a3;
@end

@implementation SBSwitcherChamoisSettings

- (id)layoutAttributesForWindowScene:(id)a3 interfaceOrientation:(int64_t)a4 requiresFullScreen:(BOOL)a5 floatingDockHeight:(double)a6
{
  BOOL v48 = a5;
  id v9 = a3;
  v10 = [v9 switcherController];
  int v11 = [v10 isChamoisWindowingUIEnabled];

  if (v11)
  {
    BOOL v47 = [(SBSwitcherChamoisSettings *)self _shouldPreferStripHiddenForWindowScene:v9 interfaceOrientation:a4];
    BOOL v12 = [(SBSwitcherChamoisSettings *)self _shouldPreferDockHiddenForWindowScene:v9];
  }
  else
  {
    BOOL v47 = 0;
    BOOL v12 = 0;
  }
  v13 = [v9 screen];
  v14 = [v13 displayConfiguration];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = *MEMORY[0x1E4F1DAD8];
  double v24 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v11 && ![v9 isMainDisplayWindowScene])
  {
    v52.origin.x = v16;
    v52.origin.y = v18;
    v52.size.width = v20;
    v52.size.height = v22;
    double Width = CGRectGetWidth(v52);
    v53.origin.x = v16;
    v53.origin.y = v18;
    v53.size.width = v20;
    v53.size.height = v22;
    double Height = CGRectGetHeight(v53);
    double v46 = a6;
    if (Width >= Height) {
      double v31 = Width;
    }
    else {
      double v31 = Height;
    }
    v54.origin.x = v16;
    v54.origin.y = v18;
    v54.size.width = v20;
    v54.size.height = v22;
    double v32 = CGRectGetWidth(v54);
    v55.origin.x = v16;
    v55.origin.y = v18;
    v55.size.width = v20;
    v55.size.height = v22;
    double v33 = CGRectGetHeight(v55);
    if (v32 >= v33) {
      double v22 = v33;
    }
    else {
      double v22 = v32;
    }
    [(SBSwitcherChamoisSettings *)self _statusBarHeight];
    uint64_t v27 = v34;
    double v20 = v31;
    a6 = v46;
  }
  else
  {
    if ((unint64_t)(a4 - 1) >= 2)
    {
      v50.origin.x = v16;
      v50.origin.y = v18;
      v50.size.width = v20;
      v50.size.height = v22;
      CGFloat v25 = CGRectGetHeight(v50);
      v51.origin.x = v16;
      v51.origin.y = v18;
      v51.size.width = v20;
      v51.size.height = v22;
      double v22 = CGRectGetWidth(v51);
      double v20 = v25;
    }
    [(SBSwitcherChamoisSettings *)self _statusBarHeight];
    uint64_t v27 = v26;
    if (!v11)
    {
      uint64_t v28 = 1;
      goto LABEL_18;
    }
  }
  uint64_t v28 = [v9 isExternalDisplayWindowScene] ^ 1;
LABEL_18:
  v35 = [v9 switcherController];
  uint64_t v36 = [v35 isAutoLayoutEnabled];

  v37 = [v9 switcherController];
  char v38 = [v37 isAdditiveModelEnabled];

  [v13 nativeBounds];
  LOBYTE(v45) = v38;
  -[SBSwitcherChamoisSettings layoutAttributesForContainerBounds:nativeContainerReferencePixelBounds:interfaceOrientation:floatingDockHeight:statusBarHeight:requiresFullScreen:prefersStripHidden:prefersDockHidden:isEmbeddedDisplay:isAutoLayoutEnabled:isAdditiveModelEnabled:](self, "layoutAttributesForContainerBounds:nativeContainerReferencePixelBounds:interfaceOrientation:floatingDockHeight:statusBarHeight:requiresFullScreen:prefersStripHidden:prefersDockHidden:isEmbeddedDisplay:isAutoLayoutEnabled:isAdditiveModelEnabled:", a4, v48, v47, v12, v28, v36, v23, v24, v20, v22, v39, v40, v41, v42, *(void *)&a6, v27,
  v43 = v45);

  return v43;
}

- (double)_statusBarHeight
{
  if (_statusBarHeight_onceToken != -1) {
    dispatch_once(&_statusBarHeight_onceToken, &__block_literal_global_52_3);
  }
  return *(double *)&_statusBarHeight___statusBarHeight;
}

- (unint64_t)maximumNumberOfAppsOnStage
{
  return self->_maximumNumberOfAppsOnStage;
}

- (SBSwitcherChamoisSettings)initWithDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherChamoisSettings;
  v2 = [(PTSettings *)&v5 initWithDefaultValues];
  v3 = v2;
  if (v2) {
    [(SBSwitcherChamoisSettings *)v2 _observeAppSwitcherDefaults];
  }
  return v3;
}

- (void)dealloc
{
  [(BSDefaultObserver *)self->_appSwitcherDefaultsObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherChamoisSettings;
  [(PTSettings *)&v3 dealloc];
}

- (id)layoutAttributesForContainerBounds:(CGRect)a3 nativeContainerReferencePixelBounds:(CGRect)a4 interfaceOrientation:(int64_t)a5 floatingDockHeight:(double)a6 statusBarHeight:(double)a7 requiresFullScreen:(BOOL)a8 prefersStripHidden:(BOOL)a9 prefersDockHidden:(BOOL)a10 isEmbeddedDisplay:(BOOL)a11 isAutoLayoutEnabled:(BOOL)a12 isAdditiveModelEnabled:(BOOL)a13
{
  BOOL v122 = a12;
  BOOL v123 = a8;
  BOOL v116 = a11;
  BOOL v13 = a10;
  BOOL v113 = a9;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat width = a4.size.width;
  CGFloat x = a4.origin.x;
  double v17 = a3.size.height;
  double v18 = a3.size.width;
  double v19 = a3.origin.y;
  CGFloat v20 = a3.origin.x;
  BOOL v22 = (unint64_t)(a5 - 1) < 2;
  BOOL v23 = (unint64_t)(self->_cachedChamoisLayoutAttributes_interfaceOrientation - 1) < 2;
  unsigned int v24 = SBFIsChamoisStripDisabledWhenHiddenAvailable();
  CGFloat v25 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  uint64_t v26 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  uint64_t v27 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  uint64_t v28 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  v29 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  v30 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  double v31 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  double v125 = v19;
  if (!self->_cachedChamoisLayoutAttributes)
  {
    double v32 = v20;
    BOOL v35 = v13;
    BOOL v34 = v116;
    BOOL v33 = v113;
    goto LABEL_15;
  }
  double v32 = v20;
  v127.origin.CGFloat x = v20;
  v127.origin.CGFloat y = v19;
  v127.size.CGFloat width = v18;
  v127.size.CGFloat height = v17;
  if (!CGRectEqualToRect(self->_cachedChamoisLayoutAttributes_containerBounds, v127)
    || (v128.origin.CGFloat x = x,
        v128.origin.CGFloat y = y,
        v128.size.CGFloat width = width,
        v128.size.CGFloat height = height,
        ((!CGRectEqualToRect(self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds, v128) | v22 ^ v23) & 1) != 0)
    || !BSFloatEqualToFloat()
    || !BSFloatEqualToFloat())
  {
    BOOL v35 = v13;
    BOOL v34 = v116;
    BOOL v33 = v113;
    double v31 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v30 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v29 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    uint64_t v28 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    uint64_t v27 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
LABEL_13:
    uint64_t v26 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    CGFloat v25 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    goto LABEL_15;
  }
  uint64_t v27 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  if (self->_cachedChamoisLayoutAttributes_requiresFullScreen != v123)
  {
    BOOL v35 = v13;
    BOOL v34 = v116;
    BOOL v33 = v113;
    double v31 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v30 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v29 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    uint64_t v28 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    goto LABEL_13;
  }
  uint64_t v28 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  BOOL v33 = v113;
  if (self->_cachedChamoisLayoutAttributes_prefersStripHidden != v113)
  {
    BOOL v35 = v13;
    BOOL v34 = v116;
    double v31 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v30 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v29 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    goto LABEL_13;
  }
  v29 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  if (self->_cachedChamoisLayoutAttributes_prefersDockHidden != v13)
  {
    BOOL v35 = v13;
    BOOL v34 = v116;
    double v31 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    v30 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
    goto LABEL_13;
  }
  v30 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  BOOL v34 = v116;
  BOOL v35 = v13;
  double v31 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  uint64_t v26 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  CGFloat v25 = &OBJC_IVAR___SBFlashlightElement__sensorObstructionHeight;
  if (self->_cachedChamoisLayoutAttributes_isEmbeddedDisplay == v116
    && self->_cachedChamoisLayoutAttributes_stripDisabledWhenHidden == v24)
  {
    goto LABEL_82;
  }
LABEL_15:
  self->_cachedChamoisLayoutAttributes_containerBounds.origin.CGFloat x = v32;
  self->_cachedChamoisLayoutAttributes_containerBounds.origin.CGFloat y = v19;
  self->_cachedChamoisLayoutAttributes_containerBounds.size.CGFloat width = v18;
  self->_cachedChamoisLayoutAttributes_containerBounds.size.CGFloat height = v17;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.origin.CGFloat x = x;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.origin.CGFloat y = y;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.size.CGFloat width = width;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.size.CGFloat height = height;
  self->_cachedChamoisLayoutAttributes_interfaceOrientation = a5;
  *(double *)((char *)&self->super.super.isa + v25[712]) = a6;
  *(double *)((char *)&self->super.super.isa + v26[713]) = a7;
  *((unsigned char *)&self->super.super.isa + v27[714]) = v123;
  *((unsigned char *)&self->super.super.isa + v28[715]) = v33;
  *((unsigned char *)&self->super.super.isa + v29[716]) = v35;
  *((unsigned char *)&self->super.super.isa + v30[717]) = v34;
  *((unsigned char *)&self->super.super.isa + v31[718]) = v24;
  double v36 = dbl_1D8FD30A0[v18 > 1681.0];
  double v37 = fmax(a7, 24.0);
  if (!v122) {
    double v37 = 0.0;
  }
  double v119 = v37;
  if (v34)
  {
    v121 = [(SBSwitcherChamoisSettings *)self embeddedDisplaySnapPaddingSettings];
    unint64_t v38 = [(SBSwitcherChamoisSettings *)self numberOfRowsWhileInAppOnEmbeddedDisplay];
  }
  else
  {
    v121 = [(SBSwitcherChamoisSettings *)self externalDisplaySnapPaddingSettings];
    if (v17 >= (double)[(SBSwitcherChamoisSettings *)self externalDisplayHighResVerticalResolution])unint64_t v38 = [(SBSwitcherChamoisSettings *)self numberOfRowsWhileInAppOnExternalDisplayHighRes]; {
    else
    }
      unint64_t v38 = [(SBSwitcherChamoisSettings *)self numberOfRowsWhileInAppOnExternalDisplay];
  }
  if (v38 <= 4) {
    double v39 = 32.0;
  }
  else {
    double v39 = 64.0;
  }
  if (v38 <= 4) {
    double v40 = 44.0;
  }
  else {
    double v40 = 64.0;
  }
  double v108 = v39;
  double v109 = v40;
  unint64_t v111 = v38;
  [(SBSwitcherChamoisSettings *)self _stripCardScaleForContainerBounds:v38 screenEdgePadding:v32 stripVerticalEdgeSpacing:v19 stripInterItemSpacing:v18 floatingDockHeight:v17 numberOfRows:v119];
  if (v33 & v24) {
    double v42 = 0.0;
  }
  else {
    double v42 = 1.13446401;
  }
  double v110 = v41;
  double v107 = v42;
  -[SBSwitcherChamoisSettings _stripWidthForContainerBounds:screenEdgePadding:stripStackDistance:stripCardScale:stripTiltAngle:containerPerspective:](self, "_stripWidthForContainerBounds:screenEdgePadding:stripStackDistance:stripCardScale:stripTiltAngle:containerPerspective:", v32, v19, v18, v17, v119, 60.0, *(void *)&v36);
  double v44 = v43;
  if (v34)
  {
    double v45 = v18 - v43;
    double v112 = -v119;
    double v46 = v17 - a6 + v119 * -2.0;
    double v106 = v46;
  }
  else
  {
    double v45 = *MEMORY[0x1E4F1DB30];
    double v106 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v112 = -v119;
    double v46 = v17 - a6 + v119 * -2.0;
  }
  if (v18 <= 1920.0) {
    double v47 = 320.0;
  }
  else {
    double v47 = 414.0;
  }
  BOOL v48 = [MEMORY[0x1E4F1CA48] array];
  BOOL v49 = v33 && v35;
  double v117 = v44;
  double v114 = v47;
  if (v33 && v35)
  {
    double v50 = 10.0;
    CGRect v51 = self;
    double v52 = v18;
    double v53 = v47;
LABEL_41:
    CGRect v54 = [(SBSwitcherChamoisSettings *)v51 _gridWidthsForSafeWidth:v52 minimumWidth:v53 stageInterItemSpacing:v50];
    [v48 addObjectsFromArray:v54];
    double v55 = v36;
    goto LABEL_42;
  }
  if (v33)
  {
    double v52 = v18 + v112 * 2.0;
    double v50 = 10.0;
    CGRect v51 = self;
    double v53 = v47;
    goto LABEL_41;
  }
  double v55 = v36;
  if (v34)
  {
    v61 = [(SBSwitcherChamoisSettings *)self _gridWidthsForSafeWidth:v18 + v112 * 2.0 minimumWidth:v114 stageInterItemSpacing:10.0];
    [v48 addObjectsFromArray:v61];
  }
  else
  {
    double v93 = (v18 - v45) * 0.5;
    if (v44 < v93) {
      double v93 = v44;
    }
    v94 = [(SBSwitcherChamoisSettings *)self _gridWidthsForSafeWidth:v18 - v93 - v119 minimumWidth:v114 stageInterItemSpacing:10.0];
    [v48 addObjectsFromArray:v94];

    v61 = [NSNumber numberWithDouble:v18 + v112 * 2.0];
    [v48 addObject:v61];
  }

  if (v45 == 0.0) {
    goto LABEL_43;
  }
  uint64_t v95 = [v48 count];
  if (v95)
  {
    uint64_t v96 = v95;
    double v105 = v36;
    uint64_t v97 = 0;
    uint64_t v98 = -1;
    double v99 = 1.79769313e308;
    do
    {
      v100 = [v48 objectAtIndex:v97];
      [v100 doubleValue];
      double v102 = v101;

      double v103 = vabdd_f64(v102, v45);
      if (v103 < v99)
      {
        double v99 = v103;
        uint64_t v98 = v97;
      }
      ++v97;
    }
    while (v96 != v97);
    BOOL v104 = v98 != -1 && v99 < 44.0;
    BOOL v33 = v113;
    double v55 = v105;
    if (v104) {
      [v48 removeObjectAtIndex:v98];
    }
  }
  CGRect v54 = [NSNumber numberWithDouble:v45];
  [v48 addObject:v54];
LABEL_42:

LABEL_43:
  double v115 = v45;
  double v56 = round(v46);
  [v48 sortUsingSelector:sel_compare_];
  v57 = [MEMORY[0x1E4F1CA48] array];
  double v124 = v56;
  if (v49)
  {
    v58 = [(SBSwitcherChamoisSettings *)self _gridHeightsForSafeHeight:v17 minimumHeight:480.0 stageInterItemSpacing:10.0];
    [v57 addObjectsFromArray:v58];
    BOOL v59 = a13;
    double v60 = v32;
  }
  else
  {
    double v60 = v32;
    if (v35)
    {
      v58 = [(SBSwitcherChamoisSettings *)self _gridHeightsForSafeHeight:v17 + v112 * 2.0 minimumHeight:480.0 stageInterItemSpacing:10.0];
      [v57 addObjectsFromArray:v58];
    }
    else
    {
      v62 = [(SBSwitcherChamoisSettings *)self _gridHeightsForSafeHeight:v56 minimumHeight:480.0 stageInterItemSpacing:10.0];
      [v57 addObjectsFromArray:v62];

      v58 = [NSNumber numberWithDouble:v17 + v112 * 2.0];
      [v57 addObject:v58];
    }
    BOOL v59 = a13;
  }

  [v57 sortUsingSelector:sel_compare_];
  uint64_t v63 = [v57 count];
  if (v35)
  {
    uint64_t v64 = -1;
  }
  else
  {
    uint64_t v65 = [v57 count];
    uint64_t v64 = -2;
    if (v65 == 1) {
      uint64_t v64 = -1;
    }
  }
  v66 = [v57 objectAtIndex:v64 + v63];
  [v66 doubleValue];
  double v68 = v67;

  double v69 = v18 + v117 * -2.0;
  double v70 = 1590.0;
  double v71 = fmax(v18 * 0.65, 1590.0);
  if (v69 >= v71) {
    double v69 = v71;
  }
  if (v115 >= v69) {
    double v69 = v115;
  }
  double v72 = v119 + v119;
  if (v35) {
    double v72 = 0.0;
  }
  double v73 = v18 - v72;
  if (v33 && v34) {
    double v74 = v73;
  }
  else {
    double v74 = v69;
  }
  if (!BSFloatGreaterThanFloat()) {
    double v70 = v74;
  }
  -[SBSwitcherChamoisSettings _nearestGridSizeForSize:gridWidths:gridHeights:bounds:](self, "_nearestGridSizeForSize:gridWidths:gridHeights:bounds:", v48, v57, v70, v68, v60, v125, v18, v17);
  if (v59) {
    double v77 = v18;
  }
  else {
    double v77 = v75;
  }
  if (v59) {
    double v78 = v17;
  }
  else {
    double v78 = v76;
  }
  if (v59 && !v34)
  {
    v79 = [MEMORY[0x1E4F42D90] mainScreen];
    [v79 bounds];
    double v77 = v80;
    double v78 = v81;
  }
  -[SBSwitcherChamoisSettings _nearestGridSizeForSize:gridWidths:gridHeights:bounds:](self, "_nearestGridSizeForSize:gridWidths:gridHeights:bounds:", v48, v57, v70, v17, v60, v125, v18, v17);
  double v83 = v82;
  v84 = (SBSwitcherChamoisLayoutAttributes *)objc_opt_new();
  [(SBSwitcherChamoisLayoutAttributes *)v84 setSettings:self];
  -[SBSwitcherChamoisLayoutAttributes setContainerBounds:](v84, "setContainerBounds:", v60, v125, v18, v17);
  [(SBSwitcherChamoisLayoutAttributes *)v84 setRequiresFullScreen:v123];
  -[SBSwitcherChamoisLayoutAttributes setDefaultWindowSize:](v84, "setDefaultWindowSize:", v77, v78);
  -[SBSwitcherChamoisLayoutAttributes setMinimumDefaultWindowSize:](v84, "setMinimumDefaultWindowSize:", v115, v106);
  [(SBSwitcherChamoisLayoutAttributes *)v84 setMaximumWindowHeightWithDock:v124];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setMaximumWindowWidthForOverlapping:v83];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setMinimumWindowWidth:v114];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setContainerPerspective:v55];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setScreenEdgePadding:v119];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setSnapPaddingSettings:v121];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripWidth:v117];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripVerticalEdgeSpacing:v108];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripInterItemSpacing:v109];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripTiltAngle:v107];
  double v85 = 40.0;
  if (v18 <= 1681.0) {
    double v85 = 30.0;
  }
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripIconLength:v85];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripStackDistance:60.0];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripCardScale:v110];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStripCornerRadii:10.0];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStageCornerRadii:18.0];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStageInterItemSpacing:10.0];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStageOccludedAppScale:-12.0 / v17 + 1.0];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStageStatusBarClearingAppScale:1.0 - (a7 + a7) / v17];
  double v86 = 44.0;
  if (!v122) {
    double v86 = 0.0;
  }
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStageOcclusionDodgingPeekLength:v86];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setStageOcclusionDodgingPeekScale:0.9];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setNumberOfRowsWhileInApp:v111];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setIsAutoLayoutEnabled:v122];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setIsAdditiveModelEnabled:v59];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setPrefersStripHidden:v33];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setPrefersDockHidden:v35];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setUsesStripAreaForOverlapping:v34];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setGridWidths:v48];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setGridHeights:v57];
  double v87 = round(v17 * 0.0625);
  [(SBSwitcherChamoisLayoutAttributes *)v84 setSwitcherHorizontalEdgeSpacing:v87];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setSwitcherVerticalEdgeSpacing:round(v17 * 0.10546875)];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setSwitcherHorizontalInterItemSpacing:v87];
  [(SBSwitcherChamoisLayoutAttributes *)v84 setSwitcherVerticalInterItemSpacing:round(v17 * 0.0859375)];
  if (v18 > 1920.0)
  {
    [(SBSwitcherChamoisLayoutAttributes *)v84 switcherHorizontalEdgeSpacing];
    [(SBSwitcherChamoisLayoutAttributes *)v84 setSwitcherHorizontalEdgeSpacing:round(v88 * 1.5)];
    [(SBSwitcherChamoisLayoutAttributes *)v84 switcherVerticalEdgeSpacing];
    [(SBSwitcherChamoisLayoutAttributes *)v84 setSwitcherVerticalEdgeSpacing:round(v89 * 1.5)];
  }
  [(SBSwitcherChamoisSettings *)self switcherHeightForIconAndLabelsUnderEachPile];
  -[SBSwitcherChamoisLayoutAttributes setSwitcherHeightForIconAndLabelsUnderEachPile:](v84, "setSwitcherHeightForIconAndLabelsUnderEachPile:");
  [(SBSwitcherChamoisSettings *)self switcherPileCardMinimumPeekAmount];
  -[SBSwitcherChamoisLayoutAttributes setSwitcherPileCardMinimumPeekAmount:](v84, "setSwitcherPileCardMinimumPeekAmount:");
  [(SBSwitcherChamoisSettings *)self switcherPileCompactingFactor];
  -[SBSwitcherChamoisLayoutAttributes setSwitcherPileCompactingFactor:](v84, "setSwitcherPileCompactingFactor:");
  cachedChamoisLayoutAttributes = self->_cachedChamoisLayoutAttributes;
  self->_cachedChamoisLayoutAttributes = v84;

LABEL_82:
  v91 = self->_cachedChamoisLayoutAttributes;
  return v91;
}

- (id)_gridWidthsForSafeWidth:(double)a3 minimumWidth:(double)a4 stageInterItemSpacing:(double)a5
{
  v8 = objc_opt_new();
  uint64_t v9 = vcvtmd_s64_f64((a3 + a5) / (a4 + a5));
  double v10 = a3 - a5;
  if (v9 < 1)
  {
LABEL_11:
    double v25 = floor((a4 + a4) * 0.5);
    uint64_t v26 = [NSNumber numberWithDouble:(v25 + v25) * 0.5];
    [v8 addObject:v26];

    double v27 = floor((v10 - a4 + v10 - a4) * 0.5);
    uint64_t v28 = [NSNumber numberWithDouble:(v27 + v27) * 0.5];
    [v8 addObject:v28];

    goto LABEL_12;
  }
  uint64_t v11 = 0;
  double v12 = floor((v10 * 0.5 + v10 * 0.5) * 0.5);
  double v13 = (v12 + v12) * 0.5;
  while (1)
  {
    uint64_t v14 = v9 + v11;
    if (v9 + v11 == 2)
    {
      CGFloat v20 = NSNumber;
      double v22 = v13;
      goto LABEL_8;
    }
    if (v14 == 1) {
      break;
    }
    double v15 = floor((a3 - (double)(v9 + v11 - 1) * a5) / (double)v14);
    double v16 = floor((v15 + v15) * 0.5);
    double v17 = [NSNumber numberWithDouble:(v16 + v16) * 0.5];
    [v8 addObject:v17];

    double v18 = floor((v10 - v15 + v10 - v15) * 0.5);
    double v19 = [NSNumber numberWithDouble:(v18 + v18) * 0.5];
    [v8 addObject:v19];

    if (v11) {
      goto LABEL_9;
    }
    CGFloat v20 = NSNumber;
    double v21 = floor((a3 - v15 * 0.5 + a3 - v15 * 0.5) * 0.5);
    double v22 = (v21 + v21) * 0.5;
LABEL_8:
    BOOL v23 = [v20 numberWithDouble:v22];
    [v8 addObject:v23];

LABEL_9:
    --v11;
  }
  unsigned int v24 = [NSNumber numberWithDouble:a3];
  [v8 addObject:v24];

  if (v9 < 3) {
    goto LABEL_11;
  }
LABEL_12:
  [v8 sortUsingSelector:sel_compare_];
  v29 = objc_opt_new();
  if ([v8 count] >= 3)
  {
    uint64_t v30 = 0;
    double v31 = a4 * 0.75;
    do
    {
      double v32 = [v8 objectAtIndexedSubscript:v30];
      [v32 doubleValue];
      double v34 = v33;

      BOOL v35 = [v8 objectAtIndexedSubscript:++v30];
      [v35 doubleValue];
      double v37 = v36;

      double v38 = v37 - v34;
      if (v37 - v34 > v31)
      {
        double v39 = floor(((v34 + v37) * 0.5 + (v34 + v37) * 0.5) * 0.5);
        double v40 = [NSNumber numberWithDouble:(v39 + v39) * 0.5];
        [v29 addObject:v40];
      }
    }
    while (v30 < objc_msgSend(v8, "count", v38) - 2);
  }
  [v8 addObjectsFromArray:v29];
  [v8 sortUsingSelector:sel_compare_];

  return v8;
}

- (id)_gridHeightsForSafeHeight:(double)a3 minimumHeight:(double)a4 stageInterItemSpacing:(double)a5
{
  v8 = [MEMORY[0x1E4F1CA48] array];
  if (a3 >= a4)
  {
    double v9 = (a3 + (a3 - a5) * -0.5) * 0.25;
    do
    {
      double v10 = floor((a3 + a3) * 0.5);
      uint64_t v11 = [NSNumber numberWithDouble:(v10 + v10) * 0.5];
      [v8 addObject:v11];

      a3 = a3 - v9;
    }
    while (a3 >= a4);
  }
  return v8;
}

- (CGSize)_nearestGridSizeForSize:(CGSize)a3 gridWidths:(id)a4 gridHeights:(id)a5 bounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double v9 = a3.height;
  double v10 = a3.width;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = MEMORY[0x1E4F1DB30];
  double v14 = *MEMORY[0x1E4F1DB30];
  if ([v11 count])
  {
    unint64_t v15 = 0;
    double v16 = 1.79769313e308;
    do
    {
      double v17 = [v11 objectAtIndex:v15];
      [v17 doubleValue];
      double v19 = v18;

      double v20 = vabdd_f64(v19, v10);
      if (v20 < v16)
      {
        double v14 = v19;
        double v16 = v20;
      }
      ++v15;
    }
    while (v15 < [v11 count]);
  }
  double v21 = *(double *)(v13 + 8);
  if ([v12 count])
  {
    unint64_t v22 = 0;
    double v23 = 1.79769313e308;
    do
    {
      unsigned int v24 = [v12 objectAtIndex:v22];
      [v24 doubleValue];
      double v26 = v25;

      double v27 = vabdd_f64(v26, v9);
      if (v27 < v23)
      {
        double v21 = v26;
        double v23 = v27;
      }
      ++v22;
    }
    while (v22 < [v12 count]);
  }
  uint64_t v28 = [v11 lastObject];
  [v28 doubleValue];
  if (BSFloatEqualToFloat())
  {
    v29 = [v12 lastObject];
    [v29 doubleValue];
    int v30 = BSFloatEqualToFloat();

    if (v30)
    {
      double v21 = height;
      double v14 = width;
    }
  }
  else
  {
  }
  double v31 = v14;
  double v32 = v21;
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (double)_stripWidthForContainerBounds:(CGRect)a3 screenEdgePadding:(double)a4 stripStackDistance:(double)a5 stripCardScale:(double)a6 stripTiltAngle:(double)a7 containerPerspective:(double)a8
{
  unint64_t v10 = 0;
  double v11 = a3.size.width * 0.5;
  uint64_t v13 = MEMORY[0x1E4F39B10];
  double v14 = 0.0;
  while (v14 == 0.0 || BSFloatGreaterThanFloat() && v10 <= 9)
  {
    [(SBSwitcherChamoisSettings *)self numberOfVisibleItemsPerGroup];
    memset(&v29, 0, sizeof(v29));
    CATransform3DMakeScale(&v29, a6, a6, 1.0);
    memset(&v28, 0, sizeof(v28));
    CATransform3DMakeRotation(&v28, a7, 0.0, 1.0, 0.0);
    memset(&v27, 0, sizeof(v27));
    CATransform3D a = v29;
    CATransform3D b = v28;
    CATransform3DConcat(&v27, &a, &b);
    CATransform3D a = v27;
    CAPointApplyTransform();
    long long v16 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)&a.m21 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)&a.m23 = v16;
    *(_OWORD *)&a.m31 = *(_OWORD *)(v13 + 64);
    a.m33 = *(CGFloat *)(v13 + 80);
    long long v17 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)&a.m11 = *(_OWORD *)v13;
    *(_OWORD *)&a.m13 = v17;
    long long v18 = *(_OWORD *)(v13 + 112);
    *(_OWORD *)&a.m41 = *(_OWORD *)(v13 + 96);
    *(_OWORD *)&a.m43 = v18;
    a.m34 = -1.0 / a8;
    CAPointApplyTransform();
    double v21 = round(v11 + v19 / v20 + a4);
    double v22 = floor((v21 + v21) * 0.5);
    double v14 = (v22 + v22) * 0.5;
    ++v10;
  }
  return v14;
}

- (double)_stripCardScaleForContainerBounds:(CGRect)a3 screenEdgePadding:(double)a4 stripVerticalEdgeSpacing:(double)a5 stripInterItemSpacing:(double)a6 floatingDockHeight:(double)a7 numberOfRows:(unint64_t)a8
{
  return fmin(a3.size.height - a7 - a4 - a5 - (a4 + a5) - a6 * ((double)a8 + -1.0), 876.0)
       / (a3.size.height
        * (double)a8);
}

uint64_t __45__SBSwitcherChamoisSettings__statusBarHeight__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  _statusBarHeight___statusBardouble Height = v1;
  return result;
}

- (BOOL)_shouldPreferStripHiddenForWindowScene:(id)a3 interfaceOrientation:(int64_t)a4
{
  int v5 = [a3 isMainDisplayWindowScene];
  v6 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideStripsExternal;
  if (v5) {
    v6 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideStrips;
  }
  return *((unsigned char *)&self->super.super.isa + *v6);
}

- (BOOL)_shouldPreferDockHiddenForWindowScene:(id)a3
{
  int v4 = [a3 isMainDisplayWindowScene];
  int v5 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideDockExternal;
  if (v4) {
    int v5 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideDock;
  }
  return *((unsigned char *)&self->super.super.isa + *v5);
}

- (void)_observeAppSwitcherDefaults
{
  v16[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[SBDefaults localDefaults];
  int v4 = [v3 appSwitcherDefaults];

  objc_initWeak(&location, self);
  int v5 = [NSString stringWithUTF8String:"chamoisHideStrips"];
  v16[0] = v5;
  v6 = [NSString stringWithUTF8String:"chamoisHideStripsExternal"];
  v16[1] = v6;
  v7 = [NSString stringWithUTF8String:"chamoisHideDock"];
  v16[2] = v7;
  v8 = [NSString stringWithUTF8String:"chamoisHideDockExternal"];
  v16[3] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v10 = MEMORY[0x1E4F14428];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__SBSwitcherChamoisSettings__observeAppSwitcherDefaults__block_invoke;
  v13[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v14, &location);
  double v11 = [v4 observeDefaults:v9 onQueue:MEMORY[0x1E4F14428] withBlock:v13];
  appSwitcherDefaultsObserver = self->_appSwitcherDefaultsObserver;
  self->_appSwitcherDefaultsObserver = v11;

  [(SBSwitcherChamoisSettings *)self _updateCachedAppSwitcherDefaults];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __56__SBSwitcherChamoisSettings__observeAppSwitcherDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCachedAppSwitcherDefaults];
}

- (void)_updateCachedAppSwitcherDefaults
{
  objc_super v3 = +[SBDefaults localDefaults];
  id v4 = [v3 appSwitcherDefaults];

  self->_cachedChamoisHideStrips = [v4 chamoisHideStrips];
  self->_cachedChamoisHideStripsExternal = [v4 chamoisHideStripsExternal];
  self->_cachedChamoisHideDock = [v4 chamoisHideDock];
  self->_cachedChamoisHideDockExternal = [v4 chamoisHideDockExternal];
}

- (void)setDefaultValues
{
  v20.receiver = self;
  v20.super_class = (Class)SBSwitcherChamoisSettings;
  [(PTSettings *)&v20 setDefaultValues];
  [(SBSwitcherChamoisSettings *)self setNumberOfVisibleItemsPerGroup:3];
  [(SBSwitcherChamoisSettings *)self setNumberOfRowsWhileInAppOnEmbeddedDisplay:4];
  [(SBSwitcherChamoisSettings *)self setNumberOfRowsWhileInAppOnExternalDisplay:4];
  [(SBSwitcherChamoisSettings *)self setNumberOfRowsWhileInAppOnExternalDisplayHighRes:5];
  [(SBSwitcherChamoisSettings *)self setExternalDisplayHighResVerticalResolution:1440];
  [(SBSwitcherChamoisSettings *)self setStripsHoverRevealZoneWidthType:0];
  [(SBSwitcherChamoisSettings *)self setStripsHoverRevealZoneWidthFixed:5.0];
  [(SBSwitcherChamoisSettings *)self setStripsHoverRevealZoneWidthScale:0.15];
  [(SBSwitcherChamoisSettings *)self setPinWindowEdgeForResizeMargin:88.0];
  if (_os_feature_enabled_impl()) {
    uint64_t v3 = 61;
  }
  else {
    uint64_t v3 = 4;
  }
  [(SBSwitcherChamoisSettings *)self setMaximumNumberOfAppsOnStage:v3];
  [(SBSwitcherChamoisSettings *)self setStripDropZoneMultiplier:0.5];
  [(SBSwitcherChamoisSettings *)self setUseLeadingWindowEdgeForDropZoneCalculations:0];
  [(SBSwitcherChamoisSettings *)self setRejectDropsWhenStageIsFull:0];
  [(SBSwitcherChamoisSettings *)self setAllowTrueMaximizeForAllApps:0];
  [(SBSwitcherChamoisSettings *)self setRasterizeScaledApps:0];
  [(SBSwitcherChamoisSettings *)self setChangeFocusOnClickDown:1];
  [(SBSwitcherChamoisSettings *)self setBlurWallpaperInApps:0];
  [(SBSwitcherChamoisSettings *)self setUseLowFatigueStripAnimation:0];
  [(SBSwitcherChamoisSettings *)self setTapWallpaperToGoHome:0];
  [(SBSwitcherChamoisSettings *)self setStageOccludedAppScaleFactor:1.0];
  [(SBSwitcherChamoisSettings *)self setPartiallyOffscreenWindowMargin:44.0];
  id v4 = [[SBSwitcherChamoisSnapPaddingSettings alloc] initWithDefaultValues];
  [(SBSwitcherChamoisSettings *)self setEmbeddedDisplaySnapPaddingSettings:v4];

  int v5 = [[SBSwitcherChamoisSnapPaddingSettings alloc] initWithDefaultValues];
  [(SBSwitcherChamoisSettings *)self setExternalDisplaySnapPaddingSettings:v5];

  [(SBSwitcherChamoisSettings *)self setSwitcherHeightForIconAndLabelsUnderEachPile:60.0];
  [(SBSwitcherChamoisSettings *)self setSwitcherPileCardMinimumPeekAmount:25.0];
  [(SBSwitcherChamoisSettings *)self setSwitcherPileCompactingFactor:0.6];
  [(SBSwitcherChamoisSettings *)self setSwitcherCornerRadius:10.0];
  [(SBSwitcherChamoisSettings *)self setRimShadowOpacity:0.15];
  [(SBSwitcherChamoisSettings *)self setRimShadowRadius:0.5];
  [(SBSwitcherChamoisSettings *)self setDiffuseShadowOpacity:0.35];
  [(SBSwitcherChamoisSettings *)self setDiffuseShadowRadius:70.0];
  -[SBSwitcherChamoisSettings setDiffuseShadowOffset:](self, "setDiffuseShadowOffset:", 0.0, 35.0);
  v6 = [(SBSwitcherChamoisSettings *)self liveResizeDuringDragLayoutAnimationSettings];
  [v6 setTrackingDampingRatio:1.0];

  v7 = [(SBSwitcherChamoisSettings *)self liveResizeDuringDragLayoutAnimationSettings];
  [v7 setTrackingResponse:0.325];

  v8 = [(SBSwitcherChamoisSettings *)self liveResizeDuringDragLayoutAnimationSettings];
  CAFrameRateRange v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);

  double v9 = [(SBSwitcherChamoisSettings *)self liveResizeAfterReleaseLayoutAnimationSettings];
  [v9 setTrackingDampingRatio:0.92];

  id v10 = [(SBSwitcherChamoisSettings *)self liveResizeAfterReleaseLayoutAnimationSettings];
  [v10 setTrackingResponse:0.6];

  double v11 = [(SBSwitcherChamoisSettings *)self liveResizeAfterReleaseLayoutAnimationSettings];
  CAFrameRateRange v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);

  id v12 = [(SBSwitcherChamoisSettings *)self windowDragAnimationSettings];
  [v12 setDefaultValues];

  uint64_t v13 = [(SBSwitcherChamoisSettings *)self windowDragAnimationSettings];
  [v13 setDampingRatio:0.92];

  id v14 = [(SBSwitcherChamoisSettings *)self windowDragAnimationSettings];
  [v14 setResponse:0.457];

  unint64_t v15 = [(SBSwitcherChamoisSettings *)self windowDragAnimationSettings];
  [v15 setTrackingDampingRatio:0.92];

  long long v16 = [(SBSwitcherChamoisSettings *)self windowDragAnimationSettings];
  [v16 setTrackingResponse:0.1];

  long long v17 = [(SBSwitcherChamoisSettings *)self windowDragAnimationSettings];
  CAFrameRateRange v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v17, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);

  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v18 setResponse:0.5];
  [v18 setDampingRatio:1.0];
  CAFrameRateRange v24 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);
  [(SBSwitcherChamoisSettings *)self setAppToAppLayoutSettings:v18];
  double v19 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v19 setResponse:0.25];
  [v19 setDampingRatio:1.1];
  [v19 setRetargetImpulse:0.016];
  CAFrameRateRange v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v19, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
  [(SBSwitcherChamoisSettings *)self setStageFocusChangeSettings:v19];
  [(SBSwitcherChamoisSettings *)self setHomeGestureMinimumYDistanceForHomeOrAppSwitcher:20.0];
}

+ (id)settingsControllerModule
{
  v121[10] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl()) {
    double v2 = 61.0;
  }
  else {
    double v2 = 8.0;
  }
  double v112 = (void *)MEMORY[0x1E4F94168];
  uint64_t v3 = (void *)MEMORY[0x1E4F94140];
  double v109 = NSStringFromSelector(sel_maximumNumberOfAppsOnStage);
  double v105 = [v3 rowWithTitle:@"Maximum Number Of Apps On Stage" valueKeyPath:v109];
  double v101 = [v105 between:4.0 and:v2];
  uint64_t v98 = [v101 precision:0];
  v121[0] = v98;
  id v4 = (void *)MEMORY[0x1E4F94140];
  uint64_t v96 = NSStringFromSelector(sel_stripDropZoneMultiplier);
  uint64_t v95 = [v4 rowWithTitle:@"Drop Into Strip Zone Width Multiplier" valueKeyPath:v96];
  v94 = [v95 between:0.0 and:1.0];
  double v93 = [v94 precision:2];
  v121[1] = v93;
  int v5 = (void *)MEMORY[0x1E4F941E8];
  v92 = NSStringFromSelector(sel_useLeadingWindowEdgeForDropZoneCalculations);
  v91 = [v5 rowWithTitle:@"Use Leading Window Edge For Drop Zone Calculations" valueKeyPath:v92];
  v121[2] = v91;
  v6 = (void *)MEMORY[0x1E4F941E8];
  v90 = NSStringFromSelector(sel_rejectDropsWhenStageIsFull);
  double v89 = [v6 rowWithTitle:@"Reject Drops When Stage Is Full" valueKeyPath:v90];
  v121[3] = v89;
  v7 = (void *)MEMORY[0x1E4F941E8];
  double v88 = NSStringFromSelector(sel_allowTrueMaximizeForAllApps);
  double v87 = [v7 rowWithTitle:@"Allow True Maximize For All Apps" valueKeyPath:v88];
  v121[4] = v87;
  v8 = (void *)MEMORY[0x1E4F941E8];
  double v86 = NSStringFromSelector(sel_rasterizeScaledApps);
  double v9 = [v8 rowWithTitle:@"Rasterize Scaled Apps" valueKeyPath:v86];
  v121[5] = v9;
  id v10 = (void *)MEMORY[0x1E4F941E8];
  double v11 = NSStringFromSelector(sel_changeFocusOnClickDown);
  id v12 = [v10 rowWithTitle:@"Change Focus on Click Down" valueKeyPath:v11];
  v121[6] = v12;
  uint64_t v13 = (void *)MEMORY[0x1E4F941E8];
  id v14 = NSStringFromSelector(sel_blurWallpaperInApps);
  unint64_t v15 = [v13 rowWithTitle:@"Blur Wallpaper In Apps" valueKeyPath:v14];
  v121[7] = v15;
  long long v16 = (void *)MEMORY[0x1E4F941E8];
  long long v17 = NSStringFromSelector(sel_useLowFatigueStripAnimation);
  long long v18 = [v16 rowWithTitle:@"Use Low Fatigue Strip Animation" valueKeyPath:v17];
  v121[8] = v18;
  double v19 = (void *)MEMORY[0x1E4F941E8];
  objc_super v20 = NSStringFromSelector(sel_tapWallpaperToGoHome);
  CAFrameRateRange v21 = [v19 rowWithTitle:@"Tap on Wallpaper to go Home" valueKeyPath:v20];
  v121[9] = v21;
  CAFrameRateRange v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:10];
  BOOL v113 = [v112 sectionWithRows:v22 title:@"Layout and Policy"];

  double v110 = (void *)MEMORY[0x1E4F94168];
  CAFrameRateRange v23 = (void *)MEMORY[0x1E4F94140];
  double v106 = NSStringFromSelector(sel_switcherHeightForIconAndLabelsUnderEachPile);
  double v102 = [v23 rowWithTitle:@"Switcher Height for Icons and Labels Under Each Pile" valueKeyPath:v106];
  double v99 = [v102 between:0.0 and:200.0];
  CAFrameRateRange v24 = [v99 precision:0];
  v120[0] = v24;
  CAFrameRateRange v25 = (void *)MEMORY[0x1E4F94140];
  double v26 = NSStringFromSelector(sel_switcherPileCardMinimumPeekAmount);
  CATransform3D v27 = [v25 rowWithTitle:@"Switcher Pile Card Peek Amount" valueKeyPath:v26];
  CATransform3D v28 = [v27 between:0.0 and:300.0];
  CATransform3D v29 = [v28 precision:0];
  v120[1] = v29;
  int v30 = (void *)MEMORY[0x1E4F94140];
  double v31 = NSStringFromSelector(sel_switcherPileCompactingFactor);
  double v32 = [v30 rowWithTitle:@"Pile Compacting Factor" valueKeyPath:v31];
  double v33 = [v32 between:0.0 and:1.0];
  double v34 = [v33 precision:2];
  v120[2] = v34;
  BOOL v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:3];
  unint64_t v111 = [v110 sectionWithRows:v35 title:@"Swticher Layout"];

  double v107 = (void *)MEMORY[0x1E4F94168];
  double v36 = (void *)MEMORY[0x1E4F94140];
  double v103 = NSStringFromSelector(sel_stageOccludedAppScaleFactor);
  v100 = [v36 rowWithTitle:@"Stage Occluded App Scale Factor" valueKeyPath:v103];
  uint64_t v97 = [v100 between:0.5 and:2.0];
  double v37 = [v97 precision:4];
  v119[0] = v37;
  double v38 = (void *)MEMORY[0x1E4F94140];
  double v39 = NSStringFromSelector(sel_partiallyOffscreenWindowMargin);
  double v40 = [v38 rowWithTitle:@"Partially Offscreen Window Margin" valueKeyPath:v39];
  double v41 = [v40 between:1.0 and:100.0];
  double v42 = [v41 precision:0];
  v119[1] = v42;
  double v43 = (void *)MEMORY[0x1E4F94138];
  double v44 = NSStringFromSelector(sel_embeddedDisplaySnapPaddingSettings);
  double v45 = [v43 rowWithTitle:@"Embedded Display Snap Padding Settings" childSettingsKeyPath:v44];
  v119[2] = v45;
  double v46 = (void *)MEMORY[0x1E4F94138];
  double v47 = NSStringFromSelector(sel_externalDisplaySnapPaddingSettings);
  BOOL v48 = [v46 rowWithTitle:@"External Display Snap Padding Settings" childSettingsKeyPath:v47];
  v119[3] = v48;
  BOOL v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:4];
  double v108 = [v107 sectionWithRows:v49 title:@"Stage Layout"];

  double v50 = (void *)MEMORY[0x1E4F94168];
  CGRect v51 = (void *)MEMORY[0x1E4F94138];
  double v52 = NSStringFromSelector(sel_liveResizeDuringDragLayoutAnimationSettings);
  double v53 = [v51 rowWithTitle:@"Live Resize During Drag Layout Settings" childSettingsKeyPath:v52];
  v118[0] = v53;
  CGRect v54 = (void *)MEMORY[0x1E4F94138];
  double v55 = NSStringFromSelector(sel_liveResizeAfterReleaseLayoutAnimationSettings);
  double v56 = [v54 rowWithTitle:@"Live Resize After Release Layout Settings" childSettingsKeyPath:v55];
  v118[1] = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
  BOOL v104 = [v50 sectionWithRows:v57 title:@"Live Resize Animation Settings"];

  v58 = (void *)MEMORY[0x1E4F94168];
  BOOL v59 = (void *)MEMORY[0x1E4F94138];
  double v60 = NSStringFromSelector(sel_windowDragAnimationSettings);
  v61 = [v59 rowWithTitle:@"Window Drag Settings" childSettingsKeyPath:v60];
  double v117 = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
  uint64_t v63 = [v58 sectionWithRows:v62 title:@"Window Drag Gesture Settings"];

  uint64_t v64 = (void *)MEMORY[0x1E4F94168];
  uint64_t v65 = (void *)MEMORY[0x1E4F94138];
  v66 = NSStringFromSelector(sel_appToAppLayoutSettings);
  double v67 = [v65 rowWithTitle:@"App To App Layout Settings" childSettingsKeyPath:v66];
  v116[0] = v67;
  double v68 = (void *)MEMORY[0x1E4F94138];
  double v69 = NSStringFromSelector(sel_appToAppOpacitySettings);
  double v70 = [v68 rowWithTitle:@"App To App Opacity Settings" childSettingsKeyPath:v69];
  v116[1] = v70;
  double v71 = (void *)MEMORY[0x1E4F94138];
  double v72 = NSStringFromSelector(sel_stageFocusChangeSettings);
  double v73 = [v71 rowWithTitle:@"Stage Focus Change Settings" childSettingsKeyPath:v72];
  v116[2] = v73;
  double v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:3];
  double v75 = [v64 sectionWithRows:v74 title:@"Animation Settings"];

  double v76 = (void *)MEMORY[0x1E4F94168];
  double v77 = (void *)MEMORY[0x1E4F94100];
  double v78 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v79 = [v77 rowWithTitle:@"Restore Defaults" action:v78];
  double v115 = v79;
  double v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
  double v81 = [v76 sectionWithRows:v80];

  double v82 = (void *)MEMORY[0x1E4F94168];
  v114[0] = v113;
  v114[1] = v111;
  v114[2] = v108;
  v114[3] = v104;
  v114[4] = v63;
  v114[5] = v75;
  v114[6] = v81;
  double v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:7];
  v84 = [v82 moduleWithTitle:@"Sydro Windowing" contents:v83];

  return v84;
}

- (unint64_t)numberOfVisibleItemsPerGroup
{
  return self->_numberOfVisibleItemsPerGroup;
}

- (void)setNumberOfVisibleItemsPerGroup:(unint64_t)a3
{
  self->_numberOfVisibleItemsPerGroup = a3;
}

- (unint64_t)numberOfRowsWhileInAppOnEmbeddedDisplay
{
  return self->_numberOfRowsWhileInAppOnEmbeddedDisplay;
}

- (void)setNumberOfRowsWhileInAppOnEmbeddedDisplay:(unint64_t)a3
{
  self->_numberOfRowsWhileInAppOnEmbeddedDisplaCGFloat y = a3;
}

- (unint64_t)numberOfRowsWhileInAppOnExternalDisplay
{
  return self->_numberOfRowsWhileInAppOnExternalDisplay;
}

- (void)setNumberOfRowsWhileInAppOnExternalDisplay:(unint64_t)a3
{
  self->_numberOfRowsWhileInAppOnExternalDisplaCGFloat y = a3;
}

- (unint64_t)numberOfRowsWhileInAppOnExternalDisplayHighRes
{
  return self->_numberOfRowsWhileInAppOnExternalDisplayHighRes;
}

- (void)setNumberOfRowsWhileInAppOnExternalDisplayHighRes:(unint64_t)a3
{
  self->_numberOfRowsWhileInAppOnExternalDisplayHighRes = a3;
}

- (unint64_t)externalDisplayHighResVerticalResolution
{
  return self->_externalDisplayHighResVerticalResolution;
}

- (void)setExternalDisplayHighResVerticalResolution:(unint64_t)a3
{
  self->_externalDisplayHighResVerticalResolution = a3;
}

- (unint64_t)stripsHoverRevealZoneWidthType
{
  return self->_stripsHoverRevealZoneWidthType;
}

- (void)setStripsHoverRevealZoneWidthType:(unint64_t)a3
{
  self->_stripsHoverRevealZoneWidthType = a3;
}

- (double)stripsHoverRevealZoneWidthFixed
{
  return self->_stripsHoverRevealZoneWidthFixed;
}

- (void)setStripsHoverRevealZoneWidthFixed:(double)a3
{
  self->_stripsHoverRevealZoneWidthFixed = a3;
}

- (double)stripsHoverRevealZoneWidthScale
{
  return self->_stripsHoverRevealZoneWidthScale;
}

- (void)setStripsHoverRevealZoneWidthScale:(double)a3
{
  self->_stripsHoverRevealZoneWidthScale = a3;
}

- (double)pinWindowEdgeForResizeMargin
{
  return self->_pinWindowEdgeForResizeMargin;
}

- (void)setPinWindowEdgeForResizeMargin:(double)a3
{
  self->_pinWindowEdgeForResizeMargin = a3;
}

- (void)setMaximumNumberOfAppsOnStage:(unint64_t)a3
{
  self->_maximumNumberOfAppsOnStage = a3;
}

- (double)stripDropZoneMultiplier
{
  return self->_stripDropZoneMultiplier;
}

- (void)setStripDropZoneMultiplier:(double)a3
{
  self->_stripDropZoneMultiplier = a3;
}

- (BOOL)useLeadingWindowEdgeForDropZoneCalculations
{
  return self->_useLeadingWindowEdgeForDropZoneCalculations;
}

- (void)setUseLeadingWindowEdgeForDropZoneCalculations:(BOOL)a3
{
  self->_useLeadingWindowEdgeForDropZoneCalculations = a3;
}

- (BOOL)rejectDropsWhenStageIsFull
{
  return self->_rejectDropsWhenStageIsFull;
}

- (void)setRejectDropsWhenStageIsFull:(BOOL)a3
{
  self->_rejectDropsWhenStageIsFull = a3;
}

- (BOOL)allowTrueMaximizeForAllApps
{
  return self->_allowTrueMaximizeForAllApps;
}

- (void)setAllowTrueMaximizeForAllApps:(BOOL)a3
{
  self->_allowTrueMaximizeForAllApps = a3;
}

- (BOOL)rasterizeScaledApps
{
  return self->_rasterizeScaledApps;
}

- (void)setRasterizeScaledApps:(BOOL)a3
{
  self->_rasterizeScaledApps = a3;
}

- (BOOL)changeFocusOnClickDown
{
  return self->_changeFocusOnClickDown;
}

- (void)setChangeFocusOnClickDown:(BOOL)a3
{
  self->_changeFocusOnClickDown = a3;
}

- (BOOL)blurWallpaperInApps
{
  return self->_blurWallpaperInApps;
}

- (void)setBlurWallpaperInApps:(BOOL)a3
{
  self->_blurWallpaperInApps = a3;
}

- (BOOL)useLowFatigueStripAnimation
{
  return self->_useLowFatigueStripAnimation;
}

- (void)setUseLowFatigueStripAnimation:(BOOL)a3
{
  self->_useLowFatigueStripAnimation = a3;
}

- (BOOL)tapWallpaperToGoHome
{
  return self->_tapWallpaperToGoHome;
}

- (void)setTapWallpaperToGoHome:(BOOL)a3
{
  self->_tapWallpaperToGoHome = a3;
}

- (double)stageOccludedAppScaleFactor
{
  return self->_stageOccludedAppScaleFactor;
}

- (void)setStageOccludedAppScaleFactor:(double)a3
{
  self->_stageOccludedAppScaleFactor = a3;
}

- (double)partiallyOffscreenWindowMargin
{
  return self->_partiallyOffscreenWindowMargin;
}

- (void)setPartiallyOffscreenWindowMargin:(double)a3
{
  self->_partiallyOffscreenWindowMargin = a3;
}

- (SBSwitcherChamoisSnapPaddingSettings)embeddedDisplaySnapPaddingSettings
{
  return (SBSwitcherChamoisSnapPaddingSettings *)objc_getProperty(self, a2, 280, 1);
}

- (void)setEmbeddedDisplaySnapPaddingSettings:(id)a3
{
}

- (SBSwitcherChamoisSnapPaddingSettings)externalDisplaySnapPaddingSettings
{
  return (SBSwitcherChamoisSnapPaddingSettings *)objc_getProperty(self, a2, 288, 1);
}

- (void)setExternalDisplaySnapPaddingSettings:(id)a3
{
}

- (double)switcherHeightForIconAndLabelsUnderEachPile
{
  return self->_switcherHeightForIconAndLabelsUnderEachPile;
}

- (void)setSwitcherHeightForIconAndLabelsUnderEachPile:(double)a3
{
  self->_switcherHeightForIconAndLabelsUnderEachPile = a3;
}

- (double)switcherPileCardMinimumPeekAmount
{
  return self->_switcherPileCardMinimumPeekAmount;
}

- (void)setSwitcherPileCardMinimumPeekAmount:(double)a3
{
  self->_switcherPileCardMinimumPeekAmount = a3;
}

- (double)switcherPileCompactingFactor
{
  return self->_switcherPileCompactingFactor;
}

- (void)setSwitcherPileCompactingFactor:(double)a3
{
  self->_switcherPileCompactingFactor = a3;
}

- (double)switcherCornerRadius
{
  return self->_switcherCornerRadius;
}

- (void)setSwitcherCornerRadius:(double)a3
{
  self->_switcherCornerRadius = a3;
}

- (double)rimShadowOpacity
{
  return self->_rimShadowOpacity;
}

- (void)setRimShadowOpacity:(double)a3
{
  self->_rimShadowOpacitCGFloat y = a3;
}

- (double)rimShadowRadius
{
  return self->_rimShadowRadius;
}

- (void)setRimShadowRadius:(double)a3
{
  self->_rimShadowRadius = a3;
}

- (double)diffuseShadowOpacity
{
  return self->_diffuseShadowOpacity;
}

- (void)setDiffuseShadowOpacity:(double)a3
{
  self->_diffuseShadowOpacitCGFloat y = a3;
}

- (double)diffuseShadowRadius
{
  return self->_diffuseShadowRadius;
}

- (void)setDiffuseShadowRadius:(double)a3
{
  self->_diffuseShadowRadius = a3;
}

- (CGSize)diffuseShadowOffset
{
  objc_copyStruct(v4, &self->_diffuseShadowOffset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setDiffuseShadowOffset:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_diffuseShadowOffset, &v3, 16, 1, 0);
}

- (SBFFluidBehaviorSettings)liveResizeDuringDragLayoutAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 360, 1);
}

- (void)setLiveResizeDuringDragLayoutAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)liveResizeAfterReleaseLayoutAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 368, 1);
}

- (void)setLiveResizeAfterReleaseLayoutAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)windowDragAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 376, 1);
}

- (void)setWindowDragAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)appToAppLayoutSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAppToAppLayoutSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)appToAppOpacitySettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 392, 1);
}

- (void)setAppToAppOpacitySettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)stageFocusChangeSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 400, 1);
}

- (void)setStageFocusChangeSettings:(id)a3
{
}

- (double)homeGestureMinimumYDistanceForHomeOrAppSwitcher
{
  return self->_homeGestureMinimumYDistanceForHomeOrAppSwitcher;
}

- (void)setHomeGestureMinimumYDistanceForHomeOrAppSwitcher:(double)a3
{
  self->_homeGestureMinimumYDistanceForHomeOrAppSwitcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageFocusChangeSettings, 0);
  objc_storeStrong((id *)&self->_appToAppOpacitySettings, 0);
  objc_storeStrong((id *)&self->_appToAppLayoutSettings, 0);
  objc_storeStrong((id *)&self->_windowDragAnimationSettings, 0);
  objc_storeStrong((id *)&self->_liveResizeAfterReleaseLayoutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_liveResizeDuringDragLayoutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_externalDisplaySnapPaddingSettings, 0);
  objc_storeStrong((id *)&self->_embeddedDisplaySnapPaddingSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_cachedChamoisLayoutAttributes, 0);
}

@end