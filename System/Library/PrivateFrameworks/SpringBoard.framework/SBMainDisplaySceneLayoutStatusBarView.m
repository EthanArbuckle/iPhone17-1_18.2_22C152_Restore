@interface SBMainDisplaySceneLayoutStatusBarView
- (BOOL)_allowChangingIndividualStatusBarParts;
- (BOOL)_statusBarNeedsSpecialLayoutForClassic;
- (BOOL)isRequiringStatusBar;
- (BOOL)isStatusBarEffectivelyHidden;
- (CGAffineTransform)_hiddenTransformForAnimation:(SEL)a3;
- (CGRect)_statusBarAvoidanceFrame;
- (CGRect)_statusBarFrameForOrientation:(int64_t)a3;
- (SBMainDisplaySceneLayoutStatusBarView)initWithFrame:(CGRect)a3;
- (SBMainDisplaySceneLayoutStatusBarViewDataSource)dataSource;
- (UIStatusBarStyleDelegate_SpringBoardOnly)realStyleDelegate;
- (double)_hiddenAlphaForAnimation:(int64_t)a3;
- (id)_anyAppViewControllerOwningInterfaceOrientation;
- (id)_currentlyValidStatusBarPartIdentifiers;
- (id)_defaultStatusBarStyleRequest;
- (id)_effectiveBackgroundActivityIdentifiersToSuppress;
- (id)_sceneHandleForClassicApplicationIfAny;
- (id)_statusBarDescriberForPrimaryApplicationIfAny;
- (id)_validStatusBarPartIdentifiersForSceneWithIdentifier:(id)a3;
- (id)allValidStatusBarPartIdentifiers;
- (id)createStatusBarWithFrame:(CGRect)a3 interfaceOrientation:(int64_t)a4 reason:(id)a5;
- (id)statusBarStyleRequestForStatusBarPart:(id)a3;
- (id)statusBarSystemNavigationAction:(id)a3;
- (int64_t)_effectiveStyleForPartIdentifier:(id)a3;
- (int64_t)containerOrientation;
- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3;
- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (unint64_t)_effectiveStatusBarStyleOverridesToSuppress;
- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5;
- (void)_addStatusBarIfNeeded;
- (void)_animateHidden:(BOOL)a3 withAnimation:(int64_t)a4 transitionHandler:(id)a5 applyHandler:(id)a6;
- (void)_applyBackgroundActivitiesToSuppress:(id)a3 toSceneWithIdentifier:(id)a4;
- (void)_applyStatusBarAlpha:(double)a3 toSceneWithIdentifier:(id)a4;
- (void)_applyStatusBarAvoidanceFrame:(CGRect)a3 toSceneWithIdentifier:(id)a4;
- (void)_applyStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4 toSceneWithIdentifier:(id)a5;
- (void)_applyStatusBarStyle:(int64_t)a3 toPartIdentifier:(id)a4 ofSceneWithIdentifier:(id)a5;
- (void)_applyStatusBarStyle:(int64_t)a3 toSceneWithIdentifier:(id)a4;
- (void)_enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:(id)a3 withBlock:(id)a4;
- (void)_layoutStatusBarForOrientation:(int64_t)a3;
- (void)_setDebugBackgroundColor:(id)a3;
- (void)_setDebugOffsetIndex:(unint64_t)a3;
- (void)_setupDebugging;
- (void)_statusBarScrollToTop:(id)a3;
- (void)_statusBarShowDebug:(id)a3;
- (void)_statusBarTapped:(id)a3 type:(int64_t)a4;
- (void)_tearDownStatusBar;
- (void)_updateDebugBackgroundColor;
- (void)_updateDebugOffset;
- (void)_updateHitTestLayers;
- (void)applyStatusBarStylesForDescriber:(id)a3;
- (void)beginRequiringStatusBarForReason:(id)a3;
- (void)dealloc;
- (void)didInvalidateStatusBarDescriptionForSceneWithIdentifier:(id)a3;
- (void)endRequiringStatusBarForReason:(id)a3;
- (void)layoutStatusBarForSpringBoardRotationToOrientation:(int64_t)a3;
- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarOrientationTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setRealStyleDelegate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)statusBar:(id)a3 didAnimateFromHeight:(double)a4 toHeight:(double)a5 animation:(int)a6;
- (void)statusBar:(id)a3 didTriggerButtonType:(int64_t)a4 withAction:(int64_t)a5;
- (void)statusBar:(id)a3 didTriggerButtonType:(int64_t)a4 withAction:(int64_t)a5 context:(id)a6;
- (void)statusBar:(id)a3 willAnimateFromHeight:(double)a4 toHeight:(double)a5 duration:(double)a6 animation:(int)a7;
- (void)updateBreadcrumbActionIfNecessary;
- (void)updateStatusBarOrientationForLegacyApp;
@end

@implementation SBMainDisplaySceneLayoutStatusBarView

- (SBMainDisplaySceneLayoutStatusBarView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBMainDisplaySceneLayoutStatusBarView;
  v3 = -[SBMainDisplaySceneLayoutStatusBarView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 _setupDebugging];
    [(SBMainDisplaySceneLayoutStatusBarView *)v4 setRealStyleDelegate:SBApp];
  }
  return v4;
}

- (void)dealloc
{
  [(SBMainDisplaySceneLayoutStatusBarView *)self _tearDownStatusBar];
  v3.receiver = self;
  v3.super_class = (Class)SBMainDisplaySceneLayoutStatusBarView;
  [(SBMainDisplaySceneLayoutStatusBarView *)&v3 dealloc];
}

- (void)beginRequiringStatusBarForReason:(id)a3
{
  id v10 = a3;
  statusBarRequiringReasons = self->_statusBarRequiringReasons;
  if (!statusBarRequiringReasons)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_super v6 = self->_statusBarRequiringReasons;
    self->_statusBarRequiringReasons = v5;

    statusBarRequiringReasons = self->_statusBarRequiringReasons;
  }
  uint64_t v7 = [(NSMutableSet *)statusBarRequiringReasons count];
  [(NSMutableSet *)self->_statusBarRequiringReasons addObject:v10];
  uint64_t v8 = [(NSMutableSet *)self->_statusBarRequiringReasons count];
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (!v9) {
    [(SBMainDisplaySceneLayoutStatusBarView *)self _addStatusBarIfNeeded];
  }
}

- (void)endRequiringStatusBarForReason:(id)a3
{
  statusBarRequiringReasons = self->_statusBarRequiringReasons;
  id v5 = a3;
  uint64_t v6 = [(NSMutableSet *)statusBarRequiringReasons count];
  [(NSMutableSet *)self->_statusBarRequiringReasons removeObject:v5];

  uint64_t v7 = [(NSMutableSet *)self->_statusBarRequiringReasons count];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [(SBMainDisplaySceneLayoutStatusBarView *)self _tearDownStatusBar];
  }
}

- (id)createStatusBarWithFrame:(CGRect)a3 interfaceOrientation:(int64_t)a4 reason:(id)a5
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  v11 = [(SBMainDisplaySceneLayoutStatusBarView *)self _defaultStatusBarStyleRequest];
  objc_msgSend(MEMORY[0x1E4F42E28], "heightForStyle:orientation:", objc_msgSend(v11, "style"), a4);
  double v13 = v12;
  v14 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
  v15 = [v14 reusePool];
  v16 = objc_msgSend(v15, "getReusableStatusBarWithReason:withFrame:", v10, x, y, width, v13);

  objc_msgSend(v16, "setBounds:", x, y, width, v13);
  UIRectGetCenter();
  objc_msgSend(v16, "setCenter:");
  [v16 setStyleDelegate:self];
  [v16 setAutoresizingMask:34];
  [v16 setOrientation:a4];
  [v16 setLegibilityStyle:0];
  [v16 setForegroundColor:0];

  return v16;
}

- (void)_addStatusBarIfNeeded
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!self->_statusBar)
  {
    objc_super v3 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&v3->_dataSource);
    id v5 = objc_alloc(MEMORY[0x1E4F4F8D0]);
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    statusBarContainerView = v3->_statusBarContainerView;
    v3->_statusBarContainerView = (BSUIOrientationTransformWrapperView *)v6;

    -[BSUIOrientationTransformWrapperView setContentOrientation:](v3->_statusBarContainerView, "setContentOrientation:", [WeakRetained statusBarOrientation]);
    [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 addSubview:v3->_statusBarContainerView];
    BOOL v8 = [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView leftAnchor];
    BOOL v9 = [(SBMainDisplaySceneLayoutStatusBarView *)v3 leftAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView rightAnchor];
    double v12 = [(SBMainDisplaySceneLayoutStatusBarView *)v3 rightAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView topAnchor];
    v15 = [(SBMainDisplaySceneLayoutStatusBarView *)v3 topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView bottomAnchor];
    v18 = [(SBMainDisplaySceneLayoutStatusBarView *)v3 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = v3->_statusBarContainerView;
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 bounds];
    -[BSUIOrientationTransformWrapperView convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:](v20, "convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:");
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v21, v22, v23, v24);
    statusBarWrapperView = v3->_statusBarWrapperView;
    v3->_statusBarWrapperView = (UIView *)v25;

    uint64_t v27 = [WeakRetained statusBarOrientation];
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 _statusBarFrameForOrientation:v27];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v53 = [NSString stringWithFormat:@"%@ - %p", objc_opt_class(), v3];
    -[SBMainDisplaySceneLayoutStatusBarView createStatusBarWithFrame:interfaceOrientation:reason:](v3, "createStatusBarWithFrame:interfaceOrientation:reason:", v27, v29, v31, v33, v35);
    v36 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
    statusBar = self->_statusBar;
    self->_statusBar = v36;

    [(UIStatusBar *)self->_statusBar requestResolvedStyle:0];
    uint64_t v38 = [(UIStatusBar *)self->_statusBar statusBar];
    statusBarUnderlyingViewAccessor = v3->_statusBarUnderlyingViewAccessor;
    v3->_statusBarUnderlyingViewAccessor = (_UIStatusBar *)v38;

    if (![(SBMainDisplaySceneLayoutStatusBarView *)v3 _allowChangingIndividualStatusBarParts])
    {
      v40 = [(UIStatusBar *)self->_statusBar layer];
      [v40 setHitTestsAsOpaque:1];
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v54 = WeakRetained;
    v41 = [WeakRetained statusBarDescribers];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v56;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v56 != v44) {
            objc_enumerationMutation(v41);
          }
          [(SBMainDisplaySceneLayoutStatusBarView *)v3 applyStatusBarStylesForDescriber:*(void *)(*((void *)&v55 + 1) + 8 * v45++)];
        }
        while (v43 != v45);
        uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v43);
    }

    v46 = [(_UIStatusBar *)v3->_statusBarUnderlyingViewAccessor actionGestureRecognizer];
    uint64_t v47 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel__statusBarScrollToTop_];
    scrollToTopGestureRecognizer = v3->_scrollToTopGestureRecognizer;
    v3->_scrollToTopGestureRecognizer = (UITapGestureRecognizer *)v47;

    [(UITapGestureRecognizer *)v3->_scrollToTopGestureRecognizer requireGestureRecognizerToFail:v46];
    [(_UIStatusBar *)v3->_statusBarUnderlyingViewAccessor addGestureRecognizer:v3->_scrollToTopGestureRecognizer];
    v49 = +[SBPlatformController sharedInstance];
    int v50 = [v49 isInternalInstall];

    if (v50)
    {
      uint64_t v51 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel__statusBarShowDebug_];
      showDebugGestureRecognizer = v3->_showDebugGestureRecognizer;
      v3->_showDebugGestureRecognizer = (UITapGestureRecognizer *)v51;

      [(UITapGestureRecognizer *)v3->_showDebugGestureRecognizer setNumberOfTouchesRequired:2];
      [(UITapGestureRecognizer *)v3->_showDebugGestureRecognizer requireGestureRecognizerToFail:v46];
      [(_UIStatusBar *)v3->_statusBarUnderlyingViewAccessor addGestureRecognizer:v3->_showDebugGestureRecognizer];
    }
    [(UIView *)v3->_statusBarWrapperView addSubview:self->_statusBar];
    [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView addContentView:v3->_statusBarWrapperView];
    [(BSUIOrientationTransformWrapperView *)v3->_statusBarContainerView addHitTestView:self->_statusBar];
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 _updateHitTestLayers];
    [(SBMainDisplaySceneLayoutStatusBarView *)v3 _updateDebugBackgroundColor];
  }
}

- (void)_statusBarScrollToTop:(id)a3
{
}

- (void)_statusBarShowDebug:(id)a3
{
}

- (void)_statusBarTapped:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  long long v16 = *MEMORY[0x1E4F1DAD8];
  if ((*((unsigned char *)&self->_conformanceFlags + 1) & 4) == 0)
  {
    BOOL v8 = [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarDescriberForPrimaryApplicationIfAny];
    BOOL v9 = [v8 sceneToHandleStatusBarTapIfExists];

    [v6 locationInView:self->_statusBarUnderlyingViewAccessor];
    *(void *)&long long v16 = v10;
    *((void *)&v16 + 1) = v11;
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v6 locationInView:self];
  double v12 = objc_msgSend(WeakRetained, "statusBarDescriberAtPoint:inView:pointInSceneLayoutSpace:", self, &v16);
  BOOL v9 = [v12 sceneToHandleStatusBarTapIfExists];

  if (v9)
  {
LABEL_5:
    id v13 = objc_alloc(MEMORY[0x1E4F42E50]);
    v14 = (void *)[v13 initWithType:a4 xPosition:*(double *)&v16];
    v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    [v9 sendActions:v15];
  }
LABEL_6:
}

- (id)_anyAppViewControllerOwningInterfaceOrientation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_super v3 = objc_msgSend(WeakRetained, "statusBarDescribers", 0);

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 sceneWantsDeviceOrientationEventsEnabled])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_statusBarDescriberForPrimaryApplicationIfAny
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_super v3 = [WeakRetained statusBarDescriberForStatusBarPart:*MEMORY[0x1E4F441B8]];

  return v3;
}

- (id)_sceneHandleForClassicApplicationIfAny
{
  v2 = [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarDescriberForPrimaryApplicationIfAny];
  objc_super v3 = [v2 classicApplicationSceneHandleIfExists];

  return v3;
}

- (void)layoutStatusBarForSpringBoardRotationToOrientation:(int64_t)a3
{
  uint64_t v5 = [(SBMainDisplaySceneLayoutStatusBarView *)self _anyAppViewControllerOwningInterfaceOrientation];

  if (!v5)
  {
    [(SBMainDisplaySceneLayoutStatusBarView *)self _layoutStatusBarForOrientation:a3];
  }
}

- (void)updateStatusBarOrientationForLegacyApp
{
  objc_super v3 = [(SBMainDisplaySceneLayoutStatusBarView *)self _anyAppViewControllerOwningInterfaceOrientation];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v5 = [WeakRetained statusBarDescriberForStatusBarPart:*MEMORY[0x1E4F441B8]];

    -[SBMainDisplaySceneLayoutStatusBarView _layoutStatusBarForOrientation:](self, "_layoutStatusBarForOrientation:", [v5 statusBarOrientation]);
  }
}

- (BOOL)_statusBarNeedsSpecialLayoutForClassic
{
  v2 = [(SBMainDisplaySceneLayoutStatusBarView *)self _sceneHandleForClassicApplicationIfAny];
  if (v2
    && ([MEMORY[0x1E4F42948] currentDevice],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    id v5 = [v2 application];
    if ([v5 classicAppNonFullScreenWithHomeAffordance]) {
      int v6 = [v5 classicAppPhoneAppRunningOnPad] ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)_statusBarFrameForOrientation:(int64_t)a3
{
  statusBarContainerView = self->_statusBarContainerView;
  [(SBMainDisplaySceneLayoutStatusBarView *)self bounds];
  -[BSUIOrientationTransformWrapperView convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:](statusBarContainerView, "convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(SBMainDisplaySceneLayoutStatusBarView *)self _defaultStatusBarStyleRequest];
  if ([(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarNeedsSpecialLayoutForClassic])
  {
    v15 = [(SBMainDisplaySceneLayoutStatusBarView *)self _sceneHandleForClassicApplicationIfAny];
    long long v16 = [v15 displayIdentity];
    v17 = [v16 currentConfiguration];
    +[SBUIController statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:](SBUIController, "statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:", v15, v17, a3, v14, 0, v7, v9, v11, v13);
    double v7 = v18;
    double v9 = v19;
    double v11 = v20;
  }
  objc_msgSend(MEMORY[0x1E4F42E28], "heightForStyle:orientation:", objc_msgSend(v14, "style"), a3);
  CGFloat v22 = v21;
  if (self->_debugOffsetEnabled)
  {
    debugOffsetIndedouble x = (double)self->_debugOffsetIndex;
    v28.origin.double x = v7;
    v28.origin.double y = v9;
    v28.size.double width = v11;
    v28.size.height = v22;
    double v9 = CGRectGetHeight(v28) * debugOffsetIndex;
  }

  double v24 = v7;
  double v25 = v9;
  double v26 = v11;
  double v27 = v22;
  result.size.height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)_layoutStatusBarForOrientation:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIStatusBar *)self->_statusBar orientation];
  int statusBarLaidOutForClassic = self->_statusBarLaidOutForClassic;
  int v7 = [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarNeedsSpecialLayoutForClassic];
  BOOL v8 = v5 != a3;
  if (statusBarLaidOutForClassic != v7)
  {
    self->_int statusBarLaidOutForClassic = v7;
    BOOL v8 = 1;
  }
  double v9 = SBLogAppStatusBars();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v13 = objc_opt_class();
    id v16 = v13;
    uint64_t v14 = BSInterfaceOrientationDescription();
    v15 = BSInterfaceOrientationDescription();
    *(_DWORD *)buf = 138413314;
    double v18 = v13;
    __int16 v19 = 2112;
    double v20 = v14;
    __int16 v21 = 2112;
    CGFloat v22 = v15;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 1024;
    BOOL v26 = v5 != a3;
    _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "%@ statusBar laying out for orientation %@ (was %@) needsFrameUpdate = %{BOOL}u, needsOrientationUpdate = %{BOOL}u", buf, 0x2Cu);
  }
  if (v8)
  {
    [(BSUIOrientationTransformWrapperView *)self->_statusBarContainerView setContentOrientation:a3];
    statusBar = self->_statusBar;
    [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarFrameForOrientation:a3];
    -[UIStatusBar setFrame:](statusBar, "setFrame:");
    double v11 = [(UIView *)self _sbWindowScene];
    double v12 = [v11 statusBarManager];
    [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarAvoidanceFrame];
    objc_msgSend(v12, "setAvoidanceFrame:reason:statusBar:animationSettings:", @"SBMainDisplaySceneLayoutStatusBarView _layoutStatusBarForOrientation", self->_statusBar, 0);
  }
  if (v5 != a3) {
    [(UIStatusBar *)self->_statusBar setOrientation:a3];
  }
  [(SBMainDisplaySceneLayoutStatusBarView *)self _updateHitTestLayers];
}

- (void)_tearDownStatusBar
{
  objc_super v3 = [(UITapGestureRecognizer *)self->_scrollToTopGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_scrollToTopGestureRecognizer];

  scrollToTopGestureRecognizer = self->_scrollToTopGestureRecognizer;
  self->_scrollToTopGestureRecognizer = 0;

  uint64_t v5 = [(UITapGestureRecognizer *)self->_showDebugGestureRecognizer view];
  [v5 removeGestureRecognizer:self->_showDebugGestureRecognizer];

  showDebugGestureRecognizer = self->_showDebugGestureRecognizer;
  self->_showDebugGestureRecognizer = 0;

  int v7 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
  BOOL v8 = [v7 reusePool];
  [v8 recycleStatusBar:self->_statusBar];

  [(BSUIOrientationTransformWrapperView *)self->_statusBarContainerView removeFromSuperview];
  statusBar = self->_statusBar;
  self->_statusBar = 0;

  statusBarWrapperView = self->_statusBarWrapperView;
  self->_statusBarWrapperView = 0;

  statusBarContainerView = self->_statusBarContainerView;
  self->_statusBarContainerView = 0;

  hitTestLayers = self->_hitTestLayers;
  self->_hitTestLayers = 0;
}

- (BOOL)isRequiringStatusBar
{
  return [(NSMutableSet *)self->_statusBarRequiringReasons count] != 0;
}

- (BOOL)isStatusBarEffectivelyHidden
{
  if (!self->_statusBarUnderlyingViewAccessor) {
    return 1;
  }
  if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
  {
    objc_super v3 = [(_UIStatusBar *)self->_statusBarUnderlyingViewAccessor enabledPartIdentifiers];
    BOOL v4 = [v3 count] == 0;

    return v4;
  }
  statusBar = self->_statusBar;
  return [(UIStatusBar *)statusBar isHidden];
}

- (BOOL)_allowChangingIndividualStatusBarParts
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  char v3 = [WeakRetained allowsConfiguringIndividualStatusBarParts];

  return v3;
}

- (void)updateBreadcrumbActionIfNecessary
{
  char v3 = [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarDescriberForPrimaryApplicationIfAny];
  BOOL v4 = [v3 statusBarSceneIdentifier];
  uint64_t v5 = [v3 overlayStatusBarData];
  p_statusBarBreadcrumbSceneIdentifier = &self->_statusBarBreadcrumbSceneIdentifier;
  if (!BSEqualStrings()
    || ([(_UIStatusBar *)self->_statusBarUnderlyingViewAccessor currentData],
        int v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7 != v5))
  {
    BOOL v8 = [v3 breadcrumbProvider];
    if (v8 && self->_statusBarUnderlyingViewAccessor)
    {
      double v9 = (void *)MEMORY[0x1E4F42FF0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke;
      v16[3] = &unk_1E6AF5290;
      v16[4] = self;
      id v10 = v5;
      id v17 = v10;
      [v9 performWithoutAnimation:v16];
      if (v10 && [v8 hasBreadcrumb])
      {
        statusBarUnderlyingViewAccessor = self->_statusBarUnderlyingViewAccessor;
        double v12 = (void *)MEMORY[0x1E4F43310];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke_2;
        v14[3] = &unk_1E6AFE270;
        id v15 = v8;
        double v13 = [v12 actionWithBlock:v14];
        [(_UIStatusBar *)statusBarUnderlyingViewAccessor setAction:v13 forPartWithIdentifier:*MEMORY[0x1E4F44198]];
      }
    }
    objc_storeStrong((id *)p_statusBarBreadcrumbSceneIdentifier, v4);
  }
}

uint64_t __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setOverlayData:*(void *)(a1 + 40)];
}

uint64_t __74__SBMainDisplaySceneLayoutStatusBarView_updateBreadcrumbActionIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateBreadcrumbIfPossible];
}

- (void)_updateHitTestLayers
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (!self->_hitTestLayers)
    {
      BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
      hitTestLayers = self->_hitTestLayers;
      self->_hitTestLayers = v4;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(SBMainDisplaySceneLayoutStatusBarView *)self allValidStatusBarPartIdentifiers];
    uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
      double v41 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v42 = *MEMORY[0x1E4F1DB20];
      double v39 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      double v40 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          double v11 = [WeakRetained statusBarDescriberForStatusBarPart:v10];
          double v12 = [(NSMutableDictionary *)self->_hitTestLayers objectForKeyedSubscript:v10];
          double height = v39;
          double width = v40;
          double y = v41;
          double x = v42;
          if (([v11 statusBarHidden] & 1) == 0)
          {
            double height = v39;
            double width = v40;
            double y = v41;
            double x = v42;
            if ((*(_WORD *)&self->_conformanceFlags & 0x800) != 0)
            {
              [v11 statusBarSceneIdentifier];
              double v18 = v17 = v8;
              [WeakRetained frameForSceneIdentifier:v18 inView:self->_statusBar];
              CGFloat v20 = v19;
              CGFloat v22 = v21;
              CGFloat v24 = v23;
              CGFloat v26 = v25;

              uint64_t v8 = v17;
              v49.origin.double x = v20;
              v49.origin.double y = v22;
              v49.size.double width = v24;
              v49.size.double height = v26;
              double height = v39;
              double width = v40;
              double y = v41;
              double x = v42;
              if (!CGRectIsNull(v49))
              {
                uint64_t v27 = [(UIStatusBar *)self->_statusBar layer];
                [v27 bounds];
                CGFloat v29 = v28;
                CGFloat v31 = v30;
                CGFloat v33 = v32;
                CGFloat v35 = v34;

                uint64_t v8 = v17;
                v50.origin.double x = v20;
                v50.origin.double y = v22;
                v50.size.double width = v24;
                v50.size.double height = v26;
                v53.origin.double x = v29;
                v53.origin.double y = v31;
                v53.size.double width = v33;
                v53.size.double height = v35;
                CGRect v51 = CGRectIntersection(v50, v53);
                double x = v51.origin.x;
                double y = v51.origin.y;
                double width = v51.size.width;
                double height = v51.size.height;
              }
            }
          }
          v52.origin.double x = x;
          v52.origin.double y = y;
          v52.size.double width = width;
          v52.size.double height = height;
          if (CGRectIsEmpty(v52))
          {
            [v12 removeFromSuperlayer];
          }
          else
          {
            if (!v12)
            {
              double v12 = [MEMORY[0x1E4F39BE8] layer];
              [v12 setHitTestsAsOpaque:1];
              [(NSMutableDictionary *)self->_hitTestLayers setObject:v12 forKeyedSubscript:v10];
            }
            v36 = [v12 superlayer];

            if (!v36)
            {
              v37 = [(UIStatusBar *)self->_statusBar layer];
              [v37 addSublayer:v12];
            }
            objc_msgSend(v12, "setFrame:", x, y, width, height);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v7);
    }
  }
}

- (int64_t)containerOrientation
{
  return [(BSUIOrientationTransformWrapperView *)self->_statusBarContainerView containerOrientation];
}

- (void)setContainerOrientation:(int64_t)a3
{
}

- (id)statusBarStyleRequestForStatusBarPart:(id)a3
{
  if (a3) {
    uint64_t v3 = _SBStatusBarLegacyStyleFromStyle(-[SBMainDisplaySceneLayoutStatusBarView _effectiveStyleForPartIdentifier:](self, "_effectiveStyleForPartIdentifier:"));
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:_SBStatusBarStyleFromLegacyStyle(v3) foregroundColor:0];
  return v4;
}

- (id)allValidStatusBarPartIdentifiers
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F441A0];
  v5[0] = *MEMORY[0x1E4F441B8];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E4F441C8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

- (void)applyStatusBarStylesForDescriber:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 statusBarSceneIdentifier];
  uint64_t v6 = SBLogAppStatusBars();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    *(_DWORD *)buf = 138413058;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    double v19 = v10;
    __int16 v20 = 2112;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2048;
    id v23 = v4;
    id v12 = v21;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ applying styles for <%@ %p>", buf, 0x2Au);
  }
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarHidden:withAnimation:toSceneWithIdentifier:](self, "_applyStatusBarHidden:withAnimation:toSceneWithIdentifier:", [v4 statusBarHidden], 0, v5);
  uint64_t v7 = [v4 backgroundActivitiesToSuppress];
  [(SBMainDisplaySceneLayoutStatusBarView *)self _applyBackgroundActivitiesToSuppress:v7 toSceneWithIdentifier:v5];

  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarStyle:toSceneWithIdentifier:](self, "_applyStatusBarStyle:toSceneWithIdentifier:", [v4 statusBarStyle], v5);
  [v4 statusBarAlpha];
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarAlpha:toSceneWithIdentifier:](self, "_applyStatusBarAlpha:toSceneWithIdentifier:", v5);
  [v4 statusBarAvoidanceFrame];
  -[SBMainDisplaySceneLayoutStatusBarView _applyStatusBarAvoidanceFrame:toSceneWithIdentifier:](self, "_applyStatusBarAvoidanceFrame:toSceneWithIdentifier:", v5);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SBMainDisplaySceneLayoutStatusBarView_applyStatusBarStylesForDescriber___block_invoke;
  v13[3] = &unk_1E6AFE298;
  v13[4] = self;
  id v14 = v4;
  id v15 = v5;
  id v8 = v5;
  id v9 = v4;
  [(SBMainDisplaySceneLayoutStatusBarView *)self _enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:v8 withBlock:v13];
}

void __74__SBMainDisplaySceneLayoutStatusBarView_applyStatusBarStylesForDescriber___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  objc_msgSend(v3, "_applyStatusBarStyle:toPartIdentifier:ofSceneWithIdentifier:", objc_msgSend(v4, "statusBarStyleForPartWithIdentifier:", v5), v5, a1[6]);
}

- (void)_applyStatusBarStyle:(int64_t)a3 toSceneWithIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarStyle_toSceneWithIdentifier___block_invoke;
      v11[3] = &unk_1E6AFE2C0;
      v11[4] = self;
      int64_t v13 = a3;
      id v12 = v6;
      [(SBMainDisplaySceneLayoutStatusBarView *)self _enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:v12 withBlock:v11];
    }
    else
    {
      uint64_t v7 = SBLogAppStatusBars();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = objc_opt_class();
        id v9 = v8;
        uint64_t v10 = _SBStringFromStatusBarStyle(a3);
        *(_DWORD *)buf = 138412802;
        id v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v8;
        __int16 v18 = 2112;
        double v19 = v10;
        _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style for whole bar to %@", buf, 0x20u);
      }
      [(UIStatusBar *)self->_statusBar requestResolvedStyle:a3];
    }
  }
}

void __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarStyle_toSceneWithIdentifier___block_invoke(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1[4] + 448))
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 448);
    *(void *)(v5 + 448) = v4;
  }
  uint64_t v7 = [NSNumber numberWithInteger:a1[6]];
  [*(id *)(a1[4] + 448) setObject:v7 forKeyedSubscript:v3];

  id v8 = [*(id *)(a1[4] + 456) objectForKey:v3];

  if (!v8)
  {
    id v9 = SBLogAppStatusBars();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = a1[5];
      id v11 = objc_opt_class();
      uint64_t v12 = a1[6];
      id v13 = v11;
      id v14 = _SBStringFromStatusBarStyle(v12);
      int v15 = 138413058;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2112;
      __int16 v22 = v14;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style for %@ to %@", (uint8_t *)&v15, 0x2Au);
    }
    [*(id *)(a1[4] + 432) setStyle:a1[6] forPartWithIdentifier:v3];
  }
}

- (void)_applyStatusBarStyle:(int64_t)a3 toPartIdentifier:(id)a4 ofSceneWithIdentifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
    {
      uint64_t v10 = [(SBMainDisplaySceneLayoutStatusBarView *)self _validStatusBarPartIdentifiersForSceneWithIdentifier:v9];
      int v11 = [v10 containsObject:v8];

      if (v11)
      {
        if (a3 == 4)
        {
          uint64_t v12 = [(NSMutableDictionary *)self->_partIdentifiersDefaultStyles objectForKeyedSubscript:v8];
          a3 = [v12 integerValue];

          partIdentifiersCustomStyles = self->_partIdentifiersCustomStyles;
          if (partIdentifiersCustomStyles) {
            [(NSMutableDictionary *)partIdentifiersCustomStyles removeObjectForKey:v8];
          }
        }
        else
        {
          if (!self->_partIdentifiersCustomStyles)
          {
            id v14 = [MEMORY[0x1E4F1CA60] dictionary];
            int v15 = self->_partIdentifiersCustomStyles;
            self->_partIdentifiersCustomStyles = v14;
          }
          uint64_t v16 = [NSNumber numberWithInteger:a3];
          [(NSMutableDictionary *)self->_partIdentifiersCustomStyles setObject:v16 forKeyedSubscript:v8];
        }
        __int16 v17 = SBLogAppStatusBars();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __int16 v18 = objc_opt_class();
          id v19 = v18;
          id v20 = _SBStringFromStatusBarStyle(a3);
          int v21 = 138413058;
          id v22 = v9;
          __int16 v23 = 2112;
          uint64_t v24 = v18;
          __int16 v25 = 2112;
          id v26 = v8;
          __int16 v27 = 2112;
          double v28 = v20;
          _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style for %@ to %@", (uint8_t *)&v21, 0x2Au);
        }
        [(_UIStatusBar *)self->_statusBarUnderlyingViewAccessor setStyle:a3 forPartWithIdentifier:v8];
      }
    }
  }
}

- (void)_applyStatusBarHidden:(BOOL)a3 withAnimation:(int64_t)a4 toSceneWithIdentifier:(id)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    id v9 = SBLogAppStatusBars();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = v16;
      __int16 v18 = NSStringFromBOOL();
      *(_DWORD *)buf = 138413058;
      id v29 = v8;
      __int16 v30 = 2112;
      CGFloat v31 = v16;
      __int16 v32 = 2112;
      CGFloat v33 = v18;
      __int16 v34 = 2048;
      int64_t v35 = a4;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ begin to change status bar hidden to %@ with animation %ld", buf, 0x2Au);
    }
    uint64_t v10 = [(UIView *)self _sbWindowScene];
    int v11 = [v10 recordingIndicatorManager];
    if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_40;
      v22[3] = &unk_1E6AFE310;
      v22[4] = self;
      uint64_t v12 = &v23;
      id v23 = v8;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_41;
      v19[3] = &unk_1E6AF5860;
      v19[4] = self;
      id v13 = &v20;
      id v20 = v23;
      id v21 = v11;
      id v14 = v11;
      [(SBMainDisplaySceneLayoutStatusBarView *)self _animateHidden:v6 withAnimation:a4 transitionHandler:v22 applyHandler:v19];
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke;
      v27[3] = &unk_1E6AFE2E8;
      v27[4] = self;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2;
      v24[3] = &unk_1E6AF5860;
      uint64_t v12 = (id *)v25;
      v25[0] = v8;
      v25[1] = self;
      id v13 = &v26;
      id v26 = v11;
      id v15 = v11;
      [(SBMainDisplaySceneLayoutStatusBarView *)self _animateHidden:v6 withAnimation:a4 transitionHandler:v27 applyHandler:v24];
    }
  }
}

uint64_t __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke(uint64_t a1, _OWORD *a2, double a3)
{
  [*(id *)(*(void *)(a1 + 32) + 416) _removeAllAnimations:0];
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:a3];
  BOOL v6 = *(void **)(*(void *)(a1 + 32) + 416);
  long long v7 = a2[1];
  v9[0] = *a2;
  v9[1] = v7;
  v9[2] = a2[2];
  return [v6 setTransform:v9];
}

uint64_t __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = SBLogAppStatusBars();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_cold_1(a1, a2, v4);
  }

  [*(id *)(*(void *)(a1 + 40) + 424) setHidden:a2];
  return [*(id *)(a1 + 48) updateRecordingIndicatorForStatusBarChanges];
}

uint64_t __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_40(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 416) _removeAllAnimations:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v6 = objc_msgSend(*(id *)(a1 + 32), "_validStatusBarPartIdentifiersForSceneWithIdentifier:", *(void *)(a1 + 40), 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:v11 forPartWithIdentifier:a3];
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setOffset:forPartWithIdentifier:", v11, *(double *)(a2 + 32), *(double *)(a2 + 40));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return [*(id *)(*(void *)(a1 + 32) + 432) layoutIfNeeded];
}

void __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_41(uint64_t a1, int a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 432) enabledPartIdentifiers];

  BOOL v6 = *(id **)(a1 + 32);
  if (v5) {
    [v6[54] enabledPartIdentifiers];
  }
  else {
  uint64_t v7 = [v6 allValidStatusBarPartIdentifiers];
  }
  [v4 addObjectsFromArray:v7];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [*(id *)(a1 + 32) _validStatusBarPartIdentifiersForSceneWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v10 = [v8 setWithArray:v9];

  if (a2) {
    [v4 minusSet:v10];
  }
  else {
    [v4 unionSet:v10];
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = [*(id *)(a1 + 32) _currentlyValidStatusBarPartIdentifiers];
  long long v13 = [v11 setWithArray:v12];
  [v4 intersectSet:v13];

  long long v14 = SBLogAppStatusBars();
  LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

  if (v12)
  {
    long long v15 = [*(id *)(*(void *)(a1 + 32) + 432) enabledPartIdentifiers];
    long long v16 = [v4 allObjects];
    int v17 = [v15 isEqualToArray:v16];
    uint64_t v18 = SBLogAppStatusBars();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17)
    {
      if (v19)
      {
        uint64_t v20 = *(void *)(a1 + 40);
        id v21 = objc_opt_class();
        id v30 = v21;
        id v22 = NSStringFromBOOL();
        *(_DWORD *)buf = 138412802;
        uint64_t v32 = v20;
        __int16 v33 = 2112;
        __int16 v34 = v21;
        __int16 v35 = 2112;
        uint64_t v36 = v22;
        id v23 = "(%@) %@ changing hidden to %@, which results in unchanged enabled parts";
        uint64_t v24 = v18;
        uint32_t v25 = 32;
LABEL_15:
        _os_log_debug_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);
      }
    }
    else if (v19)
    {
      uint64_t v28 = *(void *)(a1 + 40);
      id v29 = objc_opt_class();
      id v30 = v29;
      id v22 = NSStringFromBOOL();
      *(_DWORD *)buf = 138413314;
      uint64_t v32 = v28;
      __int16 v33 = 2112;
      __int16 v34 = v29;
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      __int16 v37 = 2112;
      uint64_t v38 = v15;
      __int16 v39 = 2112;
      double v40 = v4;
      id v23 = "(%@) %@ changing hidden to %@, which results in enabled parts changing from %@ to %@";
      uint64_t v24 = v18;
      uint32_t v25 = 52;
      goto LABEL_15;
    }
  }
  id v26 = *(void **)(*(void *)(a1 + 32) + 432);
  __int16 v27 = [v4 allObjects];
  [v26 setEnabledPartIdentifiers:v27];

  [*(id *)(a1 + 48) updateRecordingIndicatorForStatusBarChanges];
  [*(id *)(a1 + 32) _updateHitTestLayers];
}

- (void)_applyStatusBarAlpha:(double)a3 toSceneWithIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    uint64_t v7 = [(UIView *)self _sbWindowScene];
    uint64_t v8 = [v7 recordingIndicatorManager];
    if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarAlpha_toSceneWithIdentifier___block_invoke;
      v11[3] = &unk_1E6AFE338;
      v11[4] = self;
      double v14 = a3;
      id v12 = v6;
      id v13 = v8;
      [(SBMainDisplaySceneLayoutStatusBarView *)self _enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:v12 withBlock:v11];
    }
    else
    {
      uint64_t v9 = SBLogAppStatusBars();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2048;
        double v20 = a3;
        id v10 = v18;
        _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ changing alpha for whole bar to %f", buf, 0x20u);
      }
      [(_UIStatusBar *)self->_statusBarUnderlyingViewAccessor setAlpha:a3];
      [v8 updateRecordingIndicatorForStatusBarChanges];
    }
  }
}

void __84__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarAlpha_toSceneWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:v3 forPartWithIdentifier:*(double *)(a1 + 56)];
  uint64_t v4 = SBLogAppStatusBars();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 56);
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    id v8 = v6;
    _os_log_debug_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEBUG, "(%@) %@ changing alpha for %@ to %f", (uint8_t *)&v9, 0x2Au);
  }
  if ([v3 isEqual:@"trailingPartIdentifier"]) {
    [*(id *)(a1 + 48) updateRecordingIndicatorForStatusBarChanges];
  }
}

- (void)_applyBackgroundActivitiesToSuppress:(id)a3 toSceneWithIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_statusBarUnderlyingViewAccessor)
  {
    [(UIStatusBar *)self->_statusBar requestResolvedStyle:[(UIStatusBar *)self->_statusBar currentResolvedStyle]];
    id v8 = SBLogAppStatusBars();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      uint64_t v10 = STBackgroundActivityIdentifiersDescription();
      __int16 v11 = [(SBMainDisplaySceneLayoutStatusBarView *)self _effectiveBackgroundActivityIdentifiersToSuppress];
      id v12 = STBackgroundActivityIdentifiersDescription();

      __int16 v13 = SBLogAppStatusBars();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138413058;
        id v16 = v7;
        __int16 v17 = 2112;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2112;
        double v20 = v10;
        __int16 v21 = 2112;
        id v22 = v12;
        id v14 = v18;
        _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "(%@) %@ changing style overrides to %@ (effectively %@)", (uint8_t *)&v15, 0x2Au);
      }
    }
  }
}

- (void)_applyStatusBarAvoidanceFrame:(CGRect)a3 toSceneWithIdentifier:(id)a4
{
  if (self->_statusBarUnderlyingViewAccessor)
  {
    id v6 = [(UIView *)self _sbWindowScene];
    uint64_t v5 = [v6 statusBarManager];
    [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarAvoidanceFrame];
    objc_msgSend(v5, "setAvoidanceFrame:reason:statusBar:animationSettings:", @"SBMainDisplaySceneLayoutStatusBarView _applyStatusBarAvoidanceFrame", self->_statusBar, 0);
  }
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5
{
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarOrientationTo:(int64_t)a4
{
  id v19 = a3;
  id v7 = [(SBMainDisplaySceneLayoutStatusBarView *)self _anyAppViewControllerOwningInterfaceOrientation];

  if (v7)
  {
    id v8 = SBLogAppStatusBars();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      if ((*(_WORD *)&self->_conformanceFlags & 0x100) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
        __int16 v11 = [WeakRetained statusBarPartsForSceneWithIdentifier:v19];

        id v12 = [(SBMainDisplaySceneLayoutStatusBarView *)self allValidStatusBarPartIdentifiers];
        char v13 = [v11 isEqualToArray:v12];

        if ((v13 & 1) == 0)
        {
          id v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, self, @"SBMainDisplaySceneLayoutStatusBarView.m", 698, @"Invalid parameter not satisfying: %@", @"[statusBarParts isEqualToArray:[self allValidStatusBarPartIdentifiers]]" object file lineNumber description];
        }
      }
      id v14 = [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarDescriberForPrimaryApplicationIfAny];
      int v15 = [v14 statusBarSceneIdentifier];
      char v16 = [v19 isEqualToString:v15];

      if ((v16 & 1) == 0)
      {
        __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"SBMainDisplaySceneLayoutStatusBarView.m", 700, @"Invalid parameter not satisfying: %@", @"[sceneIdentifier isEqualToString:[[self _statusBarDescriberForPrimaryApplicationIfAny] statusBarSceneIdentifier]]" object file lineNumber description];
      }
    }
    [(SBMainDisplaySceneLayoutStatusBarView *)self _layoutStatusBarForOrientation:a4];
    [(BSUIOrientationTransformWrapperView *)self->_statusBarContainerView setNeedsLayout];
    [(BSUIOrientationTransformWrapperView *)self->_statusBarContainerView layoutIfNeeded];
  }
}

- (void)didInvalidateStatusBarDescriptionForSceneWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(SBMainDisplaySceneLayoutStatusBarView *)self dataSource];
  id v6 = [v5 statusBarDescribers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 statusBarSceneIdentifier];
        int v13 = [v12 isEqual:v4];

        if (v13) {
          [(SBMainDisplaySceneLayoutStatusBarView *)self applyStatusBarStylesForDescriber:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 256;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFEFF | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 512;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFDFF | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 1024;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFBFF | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 2048;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xF7FF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 4096;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xEFFF | v9;
  }
}

- (id)_currentlyValidStatusBarPartIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = WeakRetained;
  if ((*(_WORD *)&self->_conformanceFlags & 0x200) != 0) {
    [WeakRetained currentlyValidStatusBarPartIdentifiers];
  }
  else {
  __int16 v5 = [(SBMainDisplaySceneLayoutStatusBarView *)self allValidStatusBarPartIdentifiers];
  }

  return v5;
}

- (CGRect)_statusBarAvoidanceFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v4 = WeakRetained;
  if ((*(_WORD *)&self->_conformanceFlags & 0x1000) != 0)
  {
    [WeakRetained statusBarAvoidanceFrame];
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
    double v8 = v12;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v5;
  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (id)_validStatusBarPartIdentifiersForSceneWithIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v6 = WeakRetained;
  if ((*(_WORD *)&self->_conformanceFlags & 0x100) != 0) {
    [WeakRetained statusBarPartsForSceneWithIdentifier:v4];
  }
  else {
  double v7 = [(SBMainDisplaySceneLayoutStatusBarView *)self allValidStatusBarPartIdentifiers];
  }

  return v7;
}

- (int64_t)_effectiveStyleForPartIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = _SBStatusBarStyleFromLegacyStyle([(UIStatusBar *)self->_statusBar currentStyle]);
  if ([(SBMainDisplaySceneLayoutStatusBarView *)self _allowChangingIndividualStatusBarParts])
  {
    double v6 = [(NSMutableDictionary *)self->_partIdentifiersDefaultStyles objectForKeyedSubscript:v4];
    double v7 = [(NSMutableDictionary *)self->_partIdentifiersCustomStyles objectForKeyedSubscript:v4];
    double v8 = v7;
    if (v7 || (double v7 = v6) != 0) {
      int64_t v5 = [v7 integerValue];
    }
  }
  return v5;
}

- (id)_defaultStatusBarStyleRequest
{
  return [(SBMainDisplaySceneLayoutStatusBarView *)self statusBarStyleRequestForStatusBarPart:0];
}

- (void)_enumerateValidStatusBarPartIdentifiersForSceneWithIdentifier:(id)a3 withBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, void))a4;
  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v7 = -[SBMainDisplaySceneLayoutStatusBarView _validStatusBarPartIdentifiersForSceneWithIdentifier:](self, "_validStatusBarPartIdentifiersForSceneWithIdentifier:", a3, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (unint64_t)_effectiveStatusBarStyleOverridesToSuppress
{
  uint64_t v2 = [(SBMainDisplaySceneLayoutStatusBarView *)self _effectiveBackgroundActivityIdentifiersToSuppress];
  unint64_t v3 = STUIStyleOverridesForBackgroundActivityIdentifiers();

  return v3;
}

- (id)_effectiveBackgroundActivityIdentifiersToSuppress
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SBMainDisplaySceneLayoutStatusBarView *)self dataSource];
  int64_t v5 = [v4 statusBarDescribers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) backgroundActivitiesToSuppress];
        [v3 unionSet:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_animateHidden:(BOOL)a3 withAnimation:(int64_t)a4 transitionHandler:(id)a5 applyHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  [(SBMainDisplaySceneLayoutStatusBarView *)self _hiddenTransformForAnimation:a4];
  [(SBMainDisplaySceneLayoutStatusBarView *)self _hiddenAlphaForAnimation:a4];
  long long v13 = v12;
  self->_lastHiddenValueForAnimation = a3;
  int v14 = [MEMORY[0x1E4F42FF0] _isInAnimationBlock];
  if (a4 && v14)
  {
    if (!a3)
    {
      long long v15 = (void *)MEMORY[0x1E4F42FF0];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke;
      v32[3] = &unk_1E6AFE360;
      id v33 = v11;
      id v34 = v10;
      __int16 v35 = v13;
      long long v36 = v39;
      long long v37 = v40;
      long long v38 = v41;
      [v15 performWithoutAnimation:v32];
    }
    double v16 = (void *)MEMORY[0x1E4F42FF0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_2;
    v26[3] = &unk_1E6AFE388;
    uint64_t v17 = v27;
    v27[0] = v10;
    BOOL v31 = a3;
    v27[1] = v13;
    long long v28 = v39;
    long long v29 = v40;
    long long v30 = v41;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_3;
    v23[3] = &unk_1E6AFE3B0;
    v23[4] = self;
    id v24 = v11;
    id v25 = v27[0];
    id v18 = v11;
    [v16 animateWithDuration:v26 animations:v23 completion:0.0];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F42FF0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_4;
    v21[3] = &unk_1E6AF5A78;
    uint64_t v17 = &v22;
    v21[4] = self;
    id v22 = v11;
    id v20 = v11;
    [v19 performWithoutAnimation:v21];
  }
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(double *)(a1 + 48);
  unint64_t v3 = *(uint64_t (**)(double))(*(void *)(a1 + 40) + 16);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v6 = *(_OWORD *)(a1 + 56);
  long long v7 = v4;
  long long v8 = *(_OWORD *)(a1 + 88);
  return v3(v2);
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 96))
  {
    a2.n128_u64[0] = *(void *)(a1 + 40);
    long long v4 = *(_OWORD *)(a1 + 64);
    long long v7 = *(_OWORD *)(a1 + 48);
    long long v8 = v4;
    __n128 v9 = *(__n128 *)(a1 + 80);
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v7 = *MEMORY[0x1E4F1DAB8];
    long long v8 = v5;
    a2 = *(__n128 *)(MEMORY[0x1E4F1DAB8] + 32);
    __n128 v9 = a2;
    a2.n128_u64[0] = 1.0;
  }
  return (*(uint64_t (**)(uint64_t, long long *, __n128))(v3 + 16))(v3, &v7, a2);
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    (*(void (**)(void))(*(void *)(result + 40) + 16))();
    uint64_t v3 = *(uint64_t (**)(double))(*(void *)(v2 + 48) + 16);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v5 = *MEMORY[0x1E4F1DAB8];
    long long v6 = v4;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    return v3(1.0);
  }
  return result;
}

uint64_t __101__SBMainDisplaySceneLayoutStatusBarView__animateHidden_withAnimation_transitionHandler_applyHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CGAffineTransform)_hiddenTransformForAnimation:(SEL)a3
{
  if (a4 == 2)
  {
    [*(id *)&self[8].ty frame];
    double v5 = -CGRectGetMaxY(v9);
    return CGAffineTransformMakeTranslation(retstr, 0.0, v5);
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v6 + 32);
  }
  return self;
}

- (double)_hiddenAlphaForAnimation:(int64_t)a3
{
  double result = 0.0;
  if (a3 == 2) {
    return 1.0;
  }
  return result;
}

- (void)_setupDebugging
{
  uint64_t v3 = +[SBMedusaDomain rootSettings];
  medusaSettings = self->_medusaSettings;
  self->_medusaSettings = v3;

  [(PTSettings *)self->_medusaSettings addKeyObserver:self];
  self->_debugBackgroundColorEnabled = [(SBMedusaSettings *)self->_medusaSettings statusBarDebugBackgroundColorsEnabled];
  self->_debugOffsetEnabled = [(SBMedusaSettings *)self->_medusaSettings statusBarDebugOffsettingEnabled];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a4;
  long long v7 = v6;
  if (self->_medusaSettings == a3)
  {
    CGRect v9 = v6;
    if ([v6 isEqualToString:@"statusBarDebugBackgroundColorsEnabled"])
    {
      self->_debugBackgroundColorEnabled = [(SBMedusaSettings *)self->_medusaSettings statusBarDebugBackgroundColorsEnabled];
      [(SBMainDisplaySceneLayoutStatusBarView *)self _updateDebugBackgroundColor];
    }
    else
    {
      int v8 = [v9 isEqualToString:@"statusBarDebugOffsettingEnabled"];
      long long v7 = v9;
      if (!v8) {
        goto LABEL_7;
      }
      self->_debugOffsetEnabled = [(SBMedusaSettings *)self->_medusaSettings statusBarDebugOffsettingEnabled];
      [(SBMainDisplaySceneLayoutStatusBarView *)self _updateDebugOffset];
    }
    long long v7 = v9;
  }
LABEL_7:
}

- (void)_setDebugBackgroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_debugBackgroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_debugBackgroundColor, a3);
    [(SBMainDisplaySceneLayoutStatusBarView *)self _updateDebugBackgroundColor];
  }
}

- (void)_setDebugOffsetIndex:(unint64_t)a3
{
  if (self->_debugOffsetIndex != a3)
  {
    self->_debugOffsetIndedouble x = a3;
    [(SBMainDisplaySceneLayoutStatusBarView *)self _updateDebugOffset];
  }
}

- (void)_updateDebugBackgroundColor
{
  if (self->_debugBackgroundColorEnabled) {
    uint64_t v3 = self->_debugBackgroundColor;
  }
  else {
    uint64_t v3 = 0;
  }
  long long v4 = v3;
  [(UIStatusBar *)self->_statusBar setBackgroundColor:v3];
}

- (void)_updateDebugOffset
{
  statusBar = self->_statusBar;
  [(SBMainDisplaySceneLayoutStatusBarView *)self _statusBarFrameForOrientation:[(UIStatusBar *)statusBar orientation]];
  -[UIStatusBar setFrame:](statusBar, "setFrame:");
}

- (void)setRealStyleDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_realStyleDelegate, obj);
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFDF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 64;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFFBF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 128;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_conformanceFlags = *(_WORD *)&self->_conformanceFlags & 0xFF7F | v11;
  }
}

- (int64_t)statusBar:(id)a3 styleForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  if ((*(_WORD *)&self->_conformanceFlags & 1) == 0) {
    return a4;
  }
  p_realStyleDelegate = &self->_realStyleDelegate;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
  int64_t v11 = [WeakRetained statusBar:v9 styleForRequestedStyle:a4 overrides:a5];

  return v11;
}

- (void)statusBar:(id)a3 willAnimateFromHeight:(double)a4 toHeight:(double)a5 duration:(double)a6 animation:(int)a7
{
  if ((*(_WORD *)&self->_conformanceFlags & 2) != 0)
  {
    uint64_t v7 = *(void *)&a7;
    p_realStyleDelegate = &self->_realStyleDelegate;
    id v12 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
    [WeakRetained statusBar:v12 willAnimateFromHeight:v7 toHeight:a4 duration:a5 animation:a6];
  }
}

- (void)statusBar:(id)a3 didAnimateFromHeight:(double)a4 toHeight:(double)a5 animation:(int)a6
{
  if ((*(_WORD *)&self->_conformanceFlags & 4) != 0)
  {
    uint64_t v6 = *(void *)&a6;
    p_realStyleDelegate = &self->_realStyleDelegate;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
    [WeakRetained statusBar:v10 didAnimateFromHeight:v6 toHeight:a4 animation:a5];
  }
}

- (id)statusBarSystemNavigationAction:(id)a3
{
  if ((*(_WORD *)&self->_conformanceFlags & 8) != 0)
  {
    p_realStyleDelegate = &self->_realStyleDelegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_realStyleDelegate);
    uint64_t v3 = [WeakRetained statusBarSystemNavigationAction:v5];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)statusBar:(id)a3 didTriggerButtonType:(int64_t)a4 withAction:(int64_t)a5
{
  if ((*(_WORD *)&self->_conformanceFlags & 0x10) != 0) {
    [(SBMainDisplaySceneLayoutStatusBarView *)self statusBar:a3 didTriggerButtonType:a4 withAction:a5];
  }
}

- (void)statusBar:(id)a3 didTriggerButtonType:(int64_t)a4 withAction:(int64_t)a5 context:(id)a6
{
  if ((*(_WORD *)&self->_conformanceFlags & 0x20) != 0) {
    [(SBMainDisplaySceneLayoutStatusBarView *)self statusBar:a3 didTriggerButtonType:a4 withAction:a5 context:a6];
  }
}

- (unint64_t)statusBar:(id)a3 effectiveStyleOverridesForRequestedStyle:(int64_t)a4 overrides:(unint64_t)a5
{
  if ((*(_WORD *)&self->_conformanceFlags & 0x40) != 0)
  {
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);
    a5 = [WeakRetained statusBar:v8 effectiveStyleOverridesForRequestedStyle:a4 overrides:a5];
  }
  return a5 & ~[(SBMainDisplaySceneLayoutStatusBarView *)self _effectiveStatusBarStyleOverridesToSuppress];
}

- (int64_t)overriddenRequestedStyleFromStyle:(int64_t)a3
{
  if ((*(_WORD *)&self->_conformanceFlags & 0x80) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);
    a3 = [WeakRetained overriddenRequestedStyleFromStyle:a3];
  }
  return a3;
}

- (SBMainDisplaySceneLayoutStatusBarViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBMainDisplaySceneLayoutStatusBarViewDataSource *)WeakRetained;
}

- (UIStatusBarStyleDelegate_SpringBoardOnly)realStyleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_realStyleDelegate);
  return (UIStatusBarStyleDelegate_SpringBoardOnly *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_realStyleDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_debugBackgroundColor, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_showDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollToTopGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBreadcrumbSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_hitTestLayers, 0);
  objc_storeStrong((id *)&self->_partIdentifiersCustomStyles, 0);
  objc_storeStrong((id *)&self->_partIdentifiersDefaultStyles, 0);
  objc_storeStrong((id *)&self->_statusBarRequiringReasons, 0);
  objc_storeStrong((id *)&self->_statusBarUnderlyingViewAccessor, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_statusBarWrapperView, 0);
  objc_storeStrong((id *)&self->_statusBarContainerView, 0);
}

void __99__SBMainDisplaySceneLayoutStatusBarView__applyStatusBarHidden_withAnimation_toSceneWithIdentifier___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v7 = NSStringFromBOOL();
  int v8 = 138412802;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  int64_t v11 = v5;
  __int16 v12 = 2112;
  long long v13 = v7;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "(%@) %@ changing hidden to %@ for whole bar", (uint8_t *)&v8, 0x20u);
}

@end