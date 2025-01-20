@interface SBDeviceApplicationSceneClassicWrapperView
+ (BOOL)shouldUseWrapperViewForSceneHandle:(id)a3;
- (BOOL)_isProbablyScreenSized;
- (BOOL)_shouldRasterizePositioningLayer;
- (BOOL)preparingForUserDrivenClassicRotation;
- (BOOL)suppressLayoutUpdatesForStartOfClassicPhoneAppRotation;
- (BOOL)wantsBlackBackground;
- (CGRect)_effectiveSceneBounds;
- (NSArray)contentViews;
- (SBDeviceApplicationSceneClassicWrapperView)initWithSceneHandle:(id)a3;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (int64_t)orientation;
- (int64_t)startingOrientationForClassicPhoneAppRotation;
- (void)_shouldRasterizePositioningLayer;
- (void)addContentView:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeContentView:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPreparingForUserDrivenClassicRotation:(BOOL)a3;
- (void)setStartingOrientationForClassicPhoneAppRotation:(int64_t)a3;
- (void)setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBDeviceApplicationSceneClassicWrapperView

+ (BOOL)shouldUseWrapperViewForSceneHandle:(id)a3
{
  id v3 = a3;
  v4 = [v3 application];
  if ([v4 isClassic])
  {
    LOBYTE(v5) = 1;
  }
  else if ([v3 isHostedSecureApp])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = [v3 _windowScene];
    v7 = [v6 switcherController];

    v8 = [v4 bundleIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.purplebuddy"];

    if ([v7 isChamoisWindowingUIEnabled]
      && ([v4 supportsChamoisSceneResizing] & 1) == 0)
    {
      v10 = [v7 activeAndVisibleSceneIdentifiersForApplication:v4];
      v11 = [v3 sceneIdentifier];
      int v5 = [v10 containsObject:v11] & (v9 ^ 1);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (SBDeviceApplicationSceneClassicWrapperView)initWithSceneHandle:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SBDeviceApplicationSceneClassicWrapperView;
  v6 = -[SBDeviceApplicationSceneClassicWrapperView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    if (!v7->_positioningView)
    {
      v8 = [_SBDeviceApplicationSceneClassicHostPositioningView alloc];
      [(SBDeviceApplicationSceneClassicWrapperView *)v7 bounds];
      uint64_t v9 = -[_SBDeviceApplicationSceneClassicHostPositioningView initWithFrame:](v8, "initWithFrame:");
      positioningView = v7->_positioningView;
      v7->_positioningView = (_SBDeviceApplicationSceneClassicHostPositioningView *)v9;

      [(SBDeviceApplicationSceneClassicWrapperView *)v7 addSubview:v7->_positioningView];
      v11 = [(_SBDeviceApplicationSceneClassicHostPositioningView *)v7->_positioningView layer];
      [v11 setMinificationFilter:*MEMORY[0x1E4F39FE0]];
      [v11 setMagnificationFilter:*MEMORY[0x1E4F3A258]];
      if (SBFIsChamoisWindowingUIAvailable())
      {
        v12 = +[SBAppSwitcherDomain rootSettings];
        uint64_t v13 = [v12 chamoisSettings];
        chamoisSettings = v7->_chamoisSettings;
        v7->_chamoisSettings = (SBSwitcherChamoisSettings *)v13;

        [(PTSettings *)v7->_chamoisSettings addKeyObserver:v7];
        v7->_canRasterize = [(SBSwitcherChamoisSettings *)v7->_chamoisSettings rasterizeScaledApps];
        v15 = +[SBDefaults localDefaults];
        uint64_t v16 = [v15 appSwitcherDefaults];
        appSwitcherDefaults = v7->_appSwitcherDefaults;
        v7->_appSwitcherDefaults = (SBAppSwitcherDefaults *)v16;

        objc_initWeak(&location, v7);
        v18 = v7->_appSwitcherDefaults;
        v19 = [NSString stringWithUTF8String:"chamoisWindowingEnabled"];
        uint64_t v20 = MEMORY[0x1E4F14428];
        id v21 = MEMORY[0x1E4F14428];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __66__SBDeviceApplicationSceneClassicWrapperView_initWithSceneHandle___block_invoke;
        v25[3] = &unk_1E6AF4B10;
        objc_copyWeak(&v26, &location);
        uint64_t v22 = [(SBAppSwitcherDefaults *)v18 observeDefault:v19 onQueue:v20 withBlock:v25];
        chamoisEnabledObserver = v7->_chamoisEnabledObserver;
        v7->_chamoisEnabledObserver = (BSDefaultObserver *)v22;

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
    }
  }

  return v7;
}

void __66__SBDeviceApplicationSceneClassicWrapperView_initWithSceneHandle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _windowingModeChanged];
}

- (void)dealloc
{
  [(BSDefaultObserver *)self->_chamoisEnabledObserver invalidate];
  [(PTSettings *)self->_chamoisSettings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneClassicWrapperView;
  [(SBDeviceApplicationSceneClassicWrapperView *)&v3 dealloc];
}

- (NSArray)contentViews
{
  return (NSArray *)[(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView subviews];
}

- (void)addContentView:(id)a3
{
  positioningView = self->_positioningView;
  id v5 = a3;
  [(_SBDeviceApplicationSceneClassicHostPositioningView *)positioningView addSubview:v5];
  [(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView bounds];
  objc_msgSend(v5, "setFrame:");
}

- (void)removeContentView:(id)a3
{
  id v6 = a3;
  v4 = [v6 superview];
  positioningView = self->_positioningView;

  if (v4 == positioningView) {
    [v6 removeFromSuperview];
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(SBDeviceApplicationSceneClassicWrapperView *)self setNeedsLayout];
  }
}

- (BOOL)wantsBlackBackground
{
  objc_super v3 = [(SBDeviceApplicationSceneClassicWrapperView *)self sceneHandle];
  v4 = [v3 _windowScene];
  id v5 = [v4 switcherController];
  int v6 = [v5 isChamoisWindowingUIEnabled];

  if (!v6) {
    return 1;
  }
  return [(SBDeviceApplicationSceneClassicWrapperView *)self _isProbablyScreenSized];
}

- (BOOL)_isProbablyScreenSized
{
  objc_super v3 = [(SBDeviceApplicationSceneClassicWrapperView *)self sceneHandle];
  v4 = [v3 _windowScene];
  id v5 = [v4 screen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;
  [(SBDeviceApplicationSceneClassicWrapperView *)self bounds];
  if (v7 >= v9) {
    double v12 = v7;
  }
  else {
    double v12 = v9;
  }
  if (v10 >= v11) {
    double v13 = v10;
  }
  else {
    double v13 = v11;
  }
  if (v7 <= v9) {
    double v14 = v7;
  }
  else {
    double v14 = v9;
  }
  if (v10 > v11) {
    double v10 = v11;
  }
  BOOL v15 = v12 == v13 && v14 == v10;

  return v15;
}

- (void)layoutSubviews
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (self->_suppressLayoutUpdatesForStartOfClassicPhoneAppRotation) {
    return;
  }
  v99.receiver = self;
  v99.super_class = (Class)SBDeviceApplicationSceneClassicWrapperView;
  [(SBDeviceApplicationSceneClassicWrapperView *)&v99 layoutSubviews];
  objc_super v3 = [(SBDeviceApplicationSceneClassicWrapperView *)self sceneHandle];
  v4 = [v3 application];
  [(SBDeviceApplicationSceneClassicWrapperView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBDeviceApplicationSceneClassicWrapperView *)self _effectiveSceneBounds];
  CGFloat width = v102.size.width;
  CGFloat height = v102.size.height;
  CGFloat y = v102.origin.y;
  CGFloat x = v102.origin.x;
  if (!CGRectIsEmpty(v102))
  {
    CGFloat v82 = height;
    CGFloat v83 = width;
    v18 = [v3 _windowScene];
    v19 = [v18 switcherController];
    v81 = v18;
    uint64_t v20 = [v18 screen];
    int64_t startingOrientationForClassicPhoneAppRotation = [(SBDeviceApplicationSceneClassicWrapperView *)self orientation];
    uint64_t v80 = startingOrientationForClassicPhoneAppRotation;
    if (self->_preparingForUserDrivenClassicRotation) {
      int64_t startingOrientationForClassicPhoneAppRotation = self->_startingOrientationForClassicPhoneAppRotation;
    }
    uint64_t v22 = [(SBDeviceApplicationSceneClassicWrapperView *)self sceneHandle];
    v23 = [v22 sceneIfExists];
    v24 = [v23 settings];
    [v24 interfaceOrientation];

    [v4 classicAppPhoneAppRunningOnPad];
    v25 = [v3 sceneIfExists];
    id v26 = [v25 settings];
    [v26 frame];
    double v28 = v27;
    double v30 = v29;

    double v76 = v30;
    double v77 = v28;
    _UIWindowConvertRectFromOrientationToOrientation();
    BSRectWithSize();
    double v88 = v32;
    double v89 = v31;
    double v79 = v33;
    double rect = v34;
    v35 = [v19 layoutState];
    uint64_t v36 = [v35 interfaceOrientation];

    if ((unint64_t)(v36 - 3) <= 1)
    {
      v103.origin.CGFloat x = v6;
      v103.origin.CGFloat y = v8;
      v103.size.CGFloat width = v10;
      v103.size.CGFloat height = v12;
      CGRectGetHeight(v103);
      v104.origin.CGFloat x = v6;
      v104.origin.CGFloat y = v8;
      v104.size.CGFloat width = v10;
      v104.size.CGFloat height = v12;
      CGRectGetWidth(v104);
    }
    _UIWindowConvertRectFromOrientationToOrientation();
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    v84 = v20;
    [v20 _referenceBounds];
    v115.origin.CGFloat x = v38;
    v115.origin.CGFloat y = v40;
    double v74 = v44;
    double v75 = v42;
    v115.size.CGFloat width = v42;
    v115.size.CGFloat height = v44;
    BOOL v45 = CGRectEqualToRect(v105, v115);
    v106.origin.CGFloat y = v88;
    v106.origin.CGFloat x = v89;
    v106.size.CGFloat width = v79;
    double v46 = rect;
    v106.size.CGFloat height = rect;
    v116.origin.CGFloat x = v6;
    v116.origin.CGFloat y = v8;
    v116.size.CGFloat width = v10;
    v116.size.CGFloat height = v12;
    BOOL v47 = CGRectEqualToRect(v106, v116);
    int v48 = [v19 isChamoisWindowingUIEnabled];
    if ([v4 classicAppNonFullScreenWithHomeAffordance])
    {
      int v49 = [v4 classicAppPhoneAppRunningOnPad] ^ 1;
      if (!v48) {
        goto LABEL_10;
      }
    }
    else
    {
      int v49 = 0;
      if (!v48)
      {
LABEL_10:
        if ([v4 classicAppPhoneAppRunningOnPad])
        {
          int v50 = [v4 classicAppZoomedInOrRequiresHiDPI];
          double v51 = 1.0;
          if (v50) {
            double v51 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(startingOrientationForClassicPhoneAppRotation, v77, v76);
          }
          double v52 = 5.0 / v51;
LABEL_33:
          double v78 = v52;
          double v53 = v51;
          goto LABEL_34;
        }
        int v54 = [v4 classicAppScaled];
        double v51 = 1.0;
        double v78 = 0.0;
        if (!v54)
        {
          double v53 = 1.0;
          goto LABEL_34;
        }
        v107.origin.CGFloat x = v6;
        v107.origin.CGFloat y = v8;
        v107.size.CGFloat width = v10;
        v107.size.CGFloat height = v12;
        double v55 = CGRectGetHeight(v107);
        v108.origin.CGFloat x = v89;
        v108.origin.CGFloat y = v88;
        v108.size.CGFloat width = v79;
        v108.size.CGFloat height = rect;
        double v53 = v55 / CGRectGetHeight(v108);
        v109.origin.CGFloat x = v6;
        v109.origin.CGFloat y = v8;
        v109.size.CGFloat width = v10;
        v109.size.CGFloat height = v12;
        double v73 = CGRectGetWidth(v109);
        v110.origin.CGFloat x = v89;
        v110.origin.CGFloat y = v88;
        v110.size.CGFloat width = v79;
        v110.size.CGFloat height = rect;
        double v56 = v73 / CGRectGetWidth(v110);
        double v46 = rect;
        char v57 = [v4 classicAppFullScreen];
        double v51 = v56;
        if (v57) {
          goto LABEL_34;
        }
        goto LABEL_30;
      }
    }
    double v73 = v10 / v79;
    double v53 = v12 / rect;
    if (v47 || !v45)
    {
      double v78 = 0.0;
      if ([v4 classicAppFullScreen]) {
        [v84 _isEmbeddedScreen];
      }
      int v49 = 0;
      double v51 = v10 / v79;
      goto LABEL_34;
    }
    char v58 = [v4 classicAppScaledWithAspectRatioCloseEnoughToBeTreatedAsFullScreen];
    v111.origin.CGFloat x = v89;
    v111.origin.CGFloat y = v88;
    v111.size.CGFloat width = v79;
    v111.size.CGFloat height = rect;
    CGRectGetWidth(v111);
    v112.origin.CGFloat x = v89;
    v112.origin.CGFloat y = v88;
    v112.size.CGFloat width = v79;
    v112.size.CGFloat height = rect;
    CGRectGetHeight(v112);
    v113.origin.CGFloat x = v6;
    v113.origin.CGFloat y = v8;
    v113.size.CGFloat width = v10;
    v113.size.CGFloat height = v12;
    CGRectGetWidth(v113);
    v114.origin.CGFloat x = v6;
    v114.origin.CGFloat y = v8;
    v114.size.CGFloat width = v10;
    v114.size.CGFloat height = v12;
    CGRectGetHeight(v114);
    if (BSFloatApproximatelyEqualToFloat())
    {
      double v53 = v12 / rect;
    }
    else
    {
      double v53 = v12 / rect;
      if ([v4 classicAppPhoneAppRunningOnPad])
      {
        double v53 = SBClassicUtilitiesScaleFactorForPhoneAppZoomedIn(startingOrientationForClassicPhoneAppRotation, v77, v76);
        double v73 = v53;
      }
    }
    if (objc_msgSend(v4, "classicAppFullScreen", *(void *)&v73, *(void *)&v74, *(void *)&v42)) {
      [v84 _isEmbeddedScreen];
    }
    int v49 = 0;
    double v78 = 0.0;
    double v46 = rect;
    double v51 = v73;
    if (v58)
    {
LABEL_34:
      long long v59 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v98.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v98.c = v59;
      *(_OWORD *)&v98.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      memset(&v97, 0, sizeof(v97));
      CGAffineTransformMakeScale(&v97, v51, v53);
      if (self->_preparingForUserDrivenClassicRotation)
      {
        SBFAngleForRotationFromInterfaceOrientationToInterfaceOrientation();
        CGAffineTransformMakeRotation(&v98, v60);
        CGAffineTransform t1 = v97;
        CGAffineTransform t2 = v98;
        CGAffineTransformConcat(&v96, &t1, &t2);
        CGAffineTransform v97 = v96;
      }
      -[_SBDeviceApplicationSceneClassicHostPositioningView setBounds:](self->_positioningView, "setBounds:", v89, v88, v79, v46, *(void *)&v73);
      positioningView = self->_positioningView;
      UIRectGetCenter();
      -[_SBDeviceApplicationSceneClassicHostPositioningView setCenter:](positioningView, "setCenter:");
      v62 = self->_positioningView;
      CGAffineTransform v96 = v97;
      [(_SBDeviceApplicationSceneClassicHostPositioningView *)v62 setTransform:&v96];
      double v10 = v83;
      if (v49)
      {
        if (v48) {
          char v63 = 1;
        }
        else {
          char v63 = [v4 includesStatusBarInClassicJailForInterfaceOrientation:v80];
        }
        v64 = v84;
        v65 = [(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView layer];
        SBClassicUtilitiesInsetAndTranslateLayerForPresentationWithHomeAffordance(v65, v84, 0, v80, 1, v63, [v4 classicAppWithRoundedCorners], v75, v74, v77, v76, v53);

        double v12 = v82;
      }
      else
      {
        double v12 = v82;
        v64 = v84;
        if (v78 <= 0.0)
        {
LABEL_44:

          double v8 = y;
          double v6 = x;
          goto LABEL_45;
        }
        [(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView _setContinuousCornerRadius:v78];
      }
      [(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView setClipsToBounds:1];
      goto LABEL_44;
    }
LABEL_30:
    if (v51 > v53) {
      double v51 = v53;
    }
    double v52 = 0.0;
    goto LABEL_33;
  }
  -[_SBDeviceApplicationSceneClassicHostPositioningView setFrame:](self->_positioningView, "setFrame:", v6, v8, v10, v12);
  BOOL v15 = self->_positioningView;
  UIRectGetCenter();
  -[_SBDeviceApplicationSceneClassicHostPositioningView setCenter:](v15, "setCenter:");
  uint64_t v16 = self->_positioningView;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v98.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v98.c = v17;
  *(_OWORD *)&v98.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(_SBDeviceApplicationSceneClassicHostPositioningView *)v16 setTransform:&v98];
LABEL_45:
  v66 = [(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView layer];
  objc_msgSend(v66, "setShouldRasterize:", -[SBDeviceApplicationSceneClassicWrapperView _shouldRasterizePositioningLayer](self, "_shouldRasterizePositioningLayer"));
  v67 = [(SBDeviceApplicationSceneClassicWrapperView *)self traitCollection];
  [v67 displayScale];
  objc_msgSend(v66, "setRasterizationScale:");

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v68 = [(SBDeviceApplicationSceneClassicWrapperView *)self contentViews];
  uint64_t v69 = [v68 countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v91 != v71) {
          objc_enumerationMutation(v68);
        }
        objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * i), "setFrame:", v6, v8, v10, v12);
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v70);
  }
}

- (CGRect)_effectiveSceneBounds
{
  v2 = [(SBDeviceApplicationSceneClassicWrapperView *)self sceneHandle];
  objc_super v3 = [v2 sceneIfExists];

  if (v3)
  {
    v4 = [v3 settings];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;

    double v9 = [v3 settings];
    unint64_t v10 = [v9 interfaceOrientation] - 3;

    if (v10 > 1)
    {
      BSRectWithSize();
      double v11 = v13;
      double v12 = v14;
      double v8 = v15;
      double v6 = v16;
    }
    else
    {
      double v11 = 0.0;
      double v12 = 0.0;
    }
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v17 = v11;
  double v18 = v12;
  double v19 = v8;
  double v20 = v6;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_chamoisSettings == a3 && [a4 isEqualToString:@"rasterizeScaledApps"])
  {
    self->_canRasterize = [(SBSwitcherChamoisSettings *)self->_chamoisSettings rasterizeScaledApps];
    [(SBDeviceApplicationSceneClassicWrapperView *)self setNeedsLayout];
  }
}

- (BOOL)_shouldRasterizePositioningLayer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_canRasterize)
  {
    v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SBDeviceApplicationSceneClassicWrapperView _shouldRasterizePositioningLayer]();
    }
    goto LABEL_9;
  }
  if (([(SBAppSwitcherDefaults *)self->_appSwitcherDefaults chamoisWindowingEnabled] & 1) == 0)
  {
    v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SBDeviceApplicationSceneClassicWrapperView _shouldRasterizePositioningLayer]();
    }
LABEL_9:
    LOBYTE(v5) = 0;
    goto LABEL_13;
  }
  objc_super v3 = [(_SBDeviceApplicationSceneClassicHostPositioningView *)self->_positioningView layer];
  v4 = v3;
  if (v3) {
    [v3 transform];
  }
  int v5 = BSFloatIsOne() ^ 1;
  double v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double v8 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543618;
    unint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ returning %{BOOL}u", buf, 0x12u);
  }
LABEL_13:

  return v5;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)suppressLayoutUpdatesForStartOfClassicPhoneAppRotation
{
  return self->_suppressLayoutUpdatesForStartOfClassicPhoneAppRotation;
}

- (void)setSuppressLayoutUpdatesForStartOfClassicPhoneAppRotation:(BOOL)a3
{
  self->_suppressLayoutUpdatesForStartOfClassicPhoneAppRotation = a3;
}

- (BOOL)preparingForUserDrivenClassicRotation
{
  return self->_preparingForUserDrivenClassicRotation;
}

- (void)setPreparingForUserDrivenClassicRotation:(BOOL)a3
{
  self->_preparingForUserDrivenClassicRotation = a3;
}

- (int64_t)startingOrientationForClassicPhoneAppRotation
{
  return self->_startingOrientationForClassicPhoneAppRotation;
}

- (void)setStartingOrientationForClassicPhoneAppRotation:(int64_t)a3
{
  self->_int64_t startingOrientationForClassicPhoneAppRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_chamoisSettings, 0);
  objc_storeStrong((id *)&self->_chamoisEnabledObserver, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_positioningView, 0);
}

- (void)_shouldRasterizePositioningLayer
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@ early return NO because we're not in chamois", v3, v4, v5, v6, 2u);
}

@end